/*
* Copyright (c) 2006-2007 Erin Catto http://www.gphysics.com
*
* This software is provided 'as-is', without any express or implied
* warranty.  In no event will the authors be held liable for any damages
* arising from the use of this software.
* Permission is granted to anyone to use this software for any purpose,
* including commercial applications, and to alter it and redistribute it
* freely, subject to the following restrictions:
* 1. The origin of this software must not be misrepresented; you must not
* claim that you wrote the original software. If you use this software
* in a product, an acknowledgment in the product documentation would be
* appreciated but is not required.
* 2. Altered source versions must be plainly marked as such, and must not be
* misrepresented as being the original software.
* 3. This notice may not be removed or altered from any source distribution.
*/
// The pair manager is used by the broad-phase to quickly add/remove/find pairs
// of overlapping proxies. It is based closely on code provided by Pierre Terdiman.
// http://www.codercorner.com/IncrementalSAP.txt
package box2D.collision;

import box2D.common.B2Settings;
import box2D.common.math.B2Math;
import haxe.Int32;
using haxe.Int32;
class B2PairManager
 {
//public:
	
//public:
	public function new(){
		var i:Int;
		//B2Settings.b2Assert(B2Math.b2IsPowerOfTwo(B2Pair.b2_tableCapacity) == true);
		//B2Settings.b2Assert(B2Pair.b2_tableCapacity >= B2Settings.b2_maxPairs);
		m_hashTable = new Array();
		for (i in 0...B2Pair.b2_tableCapacity)
		{
			m_hashTable[i] = B2Pair.b2_nullPair;
		}
		m_pairs = new Array();
		for (i in 0...B2Settings.b2_maxPairs)
		{
			m_pairs[i] = new B2Pair();
		}
		m_pairBuffer = new Array();
		for (i in 0...B2Settings.b2_maxPairs)
		{
			m_pairBuffer[i] = new B2BufferedPair();
		}
		
		for (i in 0...B2Settings.b2_maxPairs)
		{
			m_pairs[i].proxyId1 = B2Pair.b2_nullProxy;
			m_pairs[i].proxyId2 = B2Pair.b2_nullProxy;
			m_pairs[i].userData = null;
			m_pairs[i].status = 0;
			m_pairs[i].next = (i + 1);
		}
		m_pairs[B2Settings.b2_maxPairs-1].next = B2Pair.b2_nullPair;
		m_pairCount = 0;
		m_pairBufferCount = 0;
		m_freePair = 0;
	}
	//~B2PairManager();
	
	public function Initialize(broadPhase:B2BroadPhase, myCallback:B2PairCallback) : Void{
		m_broadPhase = broadPhase;
		m_myCallback = myCallback;
	}
	
	/*
	As proxies are created and moved, many pairs are created and destroyed. Even worse, the same
	pair may be added and removed multiple times in a single time step of the physics engine. To reduce
	traffic in the pair manager, we try to avoid destroying pairs in the pair manager until the
	end of the physics step. This is done by buffering all the RemovePair requests. AddPair
	requests are processed immediately because we need the hash table entry for quick lookup.
	All user user myCallbacks are delayed until the buffered pairs are confirmed in Commit.
	This is very important because the user myCallbacks may be very expensive and client logic
;
	may be harmed if pairs are added and removed within the same time step.
	Buffer a pair for addition.
	We may add a pair that is not in the pair manager or pair buffer.
	We may add a pair that is already in the pair manager and pair buffer.
	If the added pair is not a new pair, then it must be in the pair buffer (because RemovePair was called).
	*/
	public function AddBufferedPair(proxyId1:Int, proxyId2:Int) : Void{
		var bufferedPair:B2BufferedPair;
		//B2Settings.b2Assert(id1 != b2_nullProxy && id2 != b2_nullProxy);
		//B2Settings.b2Assert(m_pairBufferCount < b2_maxPairs);
		
		var pair : B2Pair = 
			AddPair(proxyId1, proxyId2);
		
		// If this pair is not in the pair buffer ...
		if (pair.IsBuffered() == false)
		{
			// This must be a newly added pair.
			//B2Settings.b2Assert(pair.IsFinal() == false);
			
			// Add it to the pair buffer.
			pair.SetBuffered();
			bufferedPair = m_pairBuffer[m_pairBufferCount];
			bufferedPair.proxyId1 = pair.proxyId1;
			bufferedPair.proxyId2 = pair.proxyId2;
			++m_pairBufferCount;
			
			//B2Settings.b2Assert(m_pairBufferCount <= m_pairCount);
		}
		
		// Confirm this pair for the subsequent call to Commit.
		pair.ClearRemoved();
		
		if (B2BroadPhase.s_validate)
		{
			ValidateBuffer();
		}
	}
	
	// Buffer a pair for removal.
	public function RemoveBufferedPair(proxyId1:Int, proxyId2:Int) : Void{
		var bufferedPair:B2BufferedPair;
		
		//B2Settings.b2Assert(id1 != b2_nullProxy && id2 != b2_nullProxy);
		//B2Settings.b2Assert(m_pairBufferCount < b2_maxPairs);
		
		var pair:B2Pair = Find(proxyId1, proxyId2);
		
		if (pair == null)
		{
			// The pair never existed. This is legal (due to collision filtering).
			return;
		}
		
		// If this pair is not in the pair buffer ...
		if (pair.IsBuffered() == false)
		{
			// This must be an old pair.
			//B2Settings.b2Assert(pair.IsFinal() == true);
			
			pair.SetBuffered();
			bufferedPair = m_pairBuffer[m_pairBufferCount];
			bufferedPair.proxyId1 = pair.proxyId1;
			bufferedPair.proxyId2 = pair.proxyId2;
			++m_pairBufferCount;
			
			//B2Settings.b2Assert(m_pairBufferCount <= m_pairCount);
		}
		
		pair.SetRemoved();
		
		if (B2BroadPhase.s_validate)
		{
			ValidateBuffer();
		}
	}
	
	public function Commit() : Void{
		var bufferedPair:B2BufferedPair;
		var i:Int;
		
		var removeCount:Int = 0;
		
		var proxies:Array<B2Proxy> = m_broadPhase.m_proxyPool;
		
		for (i in 0...m_pairBufferCount)
		{
			bufferedPair = m_pairBuffer[i];
			var pair:B2Pair = Find(bufferedPair.proxyId1, bufferedPair.proxyId2);
			//B2Settings.b2Assert(pair.IsBuffered());
			pair.ClearBuffered();
			
			//B2Settings.b2Assert(pair.proxyId1 < B2Settings.b2_maxProxies && pair.proxyId2 < B2Settings.b2_maxProxies);
			
			var proxy1:B2Proxy = proxies[ pair.proxyId1 ];
			var proxy2:B2Proxy = proxies[ pair.proxyId2 ];
			
			//B2Settings.b2Assert(proxy1.IsValid());
			//B2Settings.b2Assert(proxy2.IsValid());
			
			if (pair.IsRemoved())
			{
				// It is possible a pair was added then removed before a commit. Therefore,
				// we should be careful not to tell the user the pair was removed when the
				// the user didn't receive a matching add.
				if (pair.IsFinal() == true)
				{
					m_myCallback.PairRemoved(proxy1.userData, proxy2.userData, pair.userData);
				}
				
				// Store the ids so we can actually remove the pair below.
				bufferedPair = m_pairBuffer[removeCount];
				bufferedPair.proxyId1 = pair.proxyId1;
				bufferedPair.proxyId2 = pair.proxyId2;
				++removeCount;
			}
			else
			{
				//B2Settings.b2Assert(m_broadPhase.TestOverlap(proxy1, proxy2) == true);
				
				if (pair.IsFinal() == false)
				{
					pair.userData = m_myCallback.PairAdded(proxy1.userData, proxy2.userData);
					pair.SetFinal();
				}
			}
		}
		
		for (i in 0...removeCount)
		{
			bufferedPair = m_pairBuffer[i];
			RemovePair(bufferedPair.proxyId1, bufferedPair.proxyId2);
		}
		
		m_pairBufferCount = 0;
		
		if (B2BroadPhase.s_validate)
		{
			ValidateTable();
		}	
	}
//private:
	// Add a pair and return the new pair. If the pair already exists,
	// no new pair is created and the old one is returned.
	function AddPair(proxyId1:Int, proxyId2:Int):B2Pair{
		
		if (proxyId1 > proxyId2){
			var temp:Int = proxyId1;
			proxyId1 = proxyId2;
			proxyId2 = temp;
			//B2Math.b2Swap(p1, p2);
		}
		
		var hash:Int = calcHash(proxyId1, proxyId2) & B2Pair.b2_tableMask;
		
		//var pairIndex:int = FindHash(proxyId1, proxyId2, hash);
		var pair:B2Pair = FindHash(proxyId1, proxyId2, hash);
		
		if (pair != null)
		{
			return pair;
		}
		
		
		//B2Settings.b2Assert(m_pairCount < B2Settings.b2_maxPairs && m_freePair != b2_nullPair);
		
		var pIndex : Int = m_freePair;
		
		pair = m_pairs[pIndex];
		
		m_freePair = pair.next;
		
		pair.proxyId1 = proxyId1;
		pair.proxyId2 = proxyId2;
		pair.status = 0;
		pair.userData = null;
		pair.next = m_hashTable[hash];
		
		m_hashTable[hash] = pIndex;
		
		++m_pairCount;
		
		return pair;
	}
	// Remove a pair, return the pair's userData.
	function RemovePair(proxyId1:Int, proxyId2:Int):Dynamic{
		var pair:B2Pair;
		
		//B2Settings.b2Assert(m_pairCount > 0);
		
		if (proxyId1 > proxyId2){
			var temp:Int = proxyId1;
			proxyId1 = proxyId2;
			proxyId2 = temp;
			//B2Math.b2Swap(proxyId1, proxyId2);
		}
		
		var hash:Int = calcHash(proxyId1, proxyId2) & B2Pair.b2_tableMask;
		
		var node:Int = m_hashTable[hash];
		var pNode:B2Pair = null;
		
		while (node != B2Pair.b2_nullPair)
		{
			if (Equals(m_pairs[node], proxyId1, proxyId2))
			{
				var index:Int = node;
				
				//*node = m_pairs[*node].next;
				pair = m_pairs[node];
				if (pNode != null){
					pNode.next = pair.next;
				}
				else{
					m_hashTable[hash] = pair.next;
				}
				
				pair = m_pairs[ index ];
				var userData:Dynamic = pair.userData;
				
				// Scrub
				pair.next = m_freePair;
				pair.proxyId1 = B2Pair.b2_nullProxy;
				pair.proxyId2 = B2Pair.b2_nullProxy;
				pair.userData = null;
				pair.status = 0;
				
				m_freePair = index;
				--m_pairCount;
				return userData;
			}
			else
			{
				//node = &m_pairs[*node].next;
				pNode = m_pairs[node];
				node = pNode.next;
			}
		}
		
		//B2Settings.b2Assert(false);
		return null;
	}
	function Find(proxyId1:Int, proxyId2:Int):B2Pair{
		
		if (proxyId1 > proxyId2){
			var temp:Int = proxyId1;
			proxyId1 = proxyId2;
			proxyId2 = temp;
			//B2Math.b2Swap(proxyId1, proxyId2);
		}
		
		var hash:Int = calcHash(proxyId1, proxyId2) & B2Pair.b2_tableMask;
		
		return FindHash(proxyId1, proxyId2, hash);
	}
	function FindHash(proxyId1:Int, proxyId2:Int, hash:Int):B2Pair{
		var pair:B2Pair;
		var index:Int = m_hashTable[hash];
		
		pair = m_pairs[index];
		while( index != B2Pair.b2_nullPair && Equals(pair, proxyId1, proxyId2) == false)
		{
			index = pair.next;
			pair = m_pairs[index];
		}
		
		if ( index == B2Pair.b2_nullPair )
		{
			return null;
		} else {
		
		//B2Settings.b2Assert(index < b2_maxPairs);
		
		return pair;
		}
	}
	
	function ValidateBuffer() : Void{
		// DEBUG
	}
	
	function ValidateTable() : Void{
		// DEBUG
	}
//public:
	public var m_broadPhase:B2BroadPhase;
	public var m_myCallback:B2PairCallback;
	public var m_pairs:Array<B2Pair>;
	public var m_freePair:Int;
	public var m_pairCount:Int;
	
	public var m_pairBuffer:Array<B2BufferedPair>;
	public var m_pairBufferCount:Int;
	public var m_hashTable:Array<Int>;
	
	
// static
	// Thomas Wang's hash, see: http://www.concentric.net/~Ttwang/tech/inthash.htm
	
	public static inline function calcHash(proxyId1:Int, proxyId2:Int):Int
	{
		
		
		var key:Int = ((proxyId2 << 16) & 0xffff0000) | proxyId1;
		key = B2Math.complement(key) + ((key << 15) & 0xFFFF8000);
		key = key ^ ((key >> 12) & 0x000fffff);
		key = key + ((key << 2) & 0xFFFFFFFC);
		key = key ^ ((key >> 4) & 0x0fffffff);
		key = key * 2057;
		key = key ^ ((key >> 16) & 0x0000ffff);
		return key;

	}
	
	public static inline function Equals(pair:B2Pair, proxyId1:Int, proxyId2:Int):Bool
	{
		return (pair.proxyId1 == proxyId1 && pair.proxyId2 == proxyId2);
	}
	
	public static inline function EqualsPair(pair1:B2BufferedPair, pair2:B2BufferedPair) : Bool
	{
		return pair1.proxyId1 == pair2.proxyId1 && pair1.proxyId2 == pair2.proxyId2;
	}
	
}