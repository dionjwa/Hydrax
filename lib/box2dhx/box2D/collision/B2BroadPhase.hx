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
package box2D.collision;

import box2D.common.math.B2Math;
import box2D.common.B2Settings;
import box2D.common.math.B2Vec2;
/*
This broad phase uses the Sweep and Prune algorithm as described in:
Collision Detection in Interactive 3D Environments by Gino van den Bergen
Also, some ideas, such as using integral values for fast compares comes from
Bullet (http:/www.bulletphysics.com).
*/
// Notes:
// - we use bound arrays instead of linked lists for cache coherence.
// - we use quantized integral values for fast compares.
// - we use short indices rather than pointers to save memory.
// - we use a stabbing count for fast overlap queries (less than order N).
// - we also use a time stamp on each proxy to speed up the registration of
//   overlap query results.
// - where possible, we compare bound indices instead of values to reduce
//   cache misses (TODO_ERIN).
// - no broadphase is perfect and neither is this one: it is not great for huge
//   worlds (use a multi-SAP instead), it is not great for large objects.
class B2BroadPhase
 {
//public:
	
//public:
	public function new(worldAABB:B2AABB, myCallback:B2PairCallback){
		//B2Settings.b2Assert(worldAABB.IsValid());
		
		m_pairManager = new B2PairManager();
		m_proxyPool = new Array();
		
		m_bounds = new Array();
		m_queryResults = new Array();
		
		
		m_quantizationFactor = new B2Vec2();
		
		m_pairManager.Initialize(this, myCallback);
		
		m_worldAABB = worldAABB;
		
		m_proxyCount = 0;
		
		// query results
		for (i in 0...B2Settings.b2_maxProxies){
			m_queryResults[i] = 0;
		}
		
		// bounds array
		m_bounds = new Array();
		for (i in 0...2){
			m_bounds[i] = new Array();
			for (j in 0...(2*B2Settings.b2_maxProxies)){
				m_bounds[i][j] = new B2Bound();
			}
		}
		
		//b2Vec2 d = worldAABB.upperBound - worldAABB.lowerBound;
		var dX:Float = worldAABB.upperBound.x - worldAABB.lowerBound.x;
		var dY:Float = worldAABB.upperBound.y - worldAABB.lowerBound.y;
		
		m_quantizationFactor.x = B2Settings.USHRT_MAX_CONST_CONST / dX;
		m_quantizationFactor.y = B2Settings.USHRT_MAX_CONST_CONST / dY;
		
		var tProxy:B2Proxy;
		for (i in 0...(B2Settings.b2_maxProxies - 1))
		{
			tProxy = new B2Proxy();
			m_proxyPool[i] = tProxy;
			tProxy.SetNext(i + 1);
			tProxy.timeStamp = 0;
			tProxy.overlapCount = b2_invalid;
			tProxy.userData = null;
		}
		tProxy = new B2Proxy();
		m_proxyPool[B2Settings.b2_maxProxies-1] = tProxy;
		tProxy.SetNext(B2Pair.b2_nullProxy);
		tProxy.timeStamp = 0;
		tProxy.overlapCount = b2_invalid;
		tProxy.userData = null;
		m_freeProxy = 0;
		
		m_timeStamp = 1;
		m_queryResultCount = 0;
	}
	//~B2BroadPhase();
	
	// Use this to see if your proxy is in range. If it is not in range,
	// it should be destroyed. Otherwise you may get O(m^2) pairs, where m
	// is the number of proxies that are out of range.
	public function InRange(aabb:B2AABB):Bool{
		//b2Vec2 d = b2Max(aabb.lowerBound - m_worldAABB.upperBound, m_worldAABB.lowerBound - aabb.upperBound);
		var dX:Float;
		var dY:Float;
		var d2X:Float;
		var d2Y:Float;
		
		dX = aabb.lowerBound.x;
		dY = aabb.lowerBound.y;
		dX -= m_worldAABB.upperBound.x;
		dY -= m_worldAABB.upperBound.y;
		
		d2X = m_worldAABB.lowerBound.x;
		d2Y = m_worldAABB.lowerBound.y;
		d2X -= aabb.upperBound.x;
		d2Y -= aabb.upperBound.y;
		
		dX = B2Math.b2Max(dX, d2X);
		dY = B2Math.b2Max(dY, d2Y);
		
		return B2Math.b2Max(dX, dY) < 0.0;
	}
	
	// Get a single proxy. Returns NULL if the id is invalid.
	public function GetProxy(proxyId:Int):B2Proxy{
		var proxy:B2Proxy = m_proxyPool[proxyId];
		if (proxyId == B2Pair.b2_nullProxy || proxy.IsValid() == false)
		{
			return null;
		}
		
		return proxy;
	}
	// Create and destroy proxies. These call Flush first.
	public function CreateProxy(aabb:B2AABB, userData:Dynamic):Int{
		var index:Int;
		var proxy:B2Proxy;
		
		//B2Settings.b2Assert(m_proxyCount < b2_maxProxies);
		//B2Settings.b2Assert(m_freeProxy != B2Pair.b2_nullProxy);
		
		var proxyId:Int = m_freeProxy;
		proxy = m_proxyPool[ proxyId ];
		m_freeProxy = proxy.GetNext();
		
		proxy.overlapCount = 0;
		proxy.userData = userData;
		
		var boundCount:Int = 2 * m_proxyCount;
		
		var lowerValues:Array<Int> = new Array();
		var upperValues:Array<Int> = new Array();
		ComputeBounds(lowerValues, upperValues, aabb);
		
		for (axis in 0...2)
		{
			var bounds:Array<B2Bound> = m_bounds[axis];
			var lowerIndex:Int = 0;
			var upperIndex:Int = 0;
			var lowerIndexOut:Array<Int> = [lowerIndex];
			var upperIndexOut:Array<Int> = [upperIndex];
			Query(lowerIndexOut, upperIndexOut, lowerValues[axis], upperValues[axis], bounds, boundCount, axis);
			lowerIndex = lowerIndexOut[0];
			upperIndex = upperIndexOut[0];
			
			// Replace memmove calls
			//memmove(bounds + upperIndex + 2, bounds + upperIndex, (edgeCount - upperIndex) * sizeof(b2Bound));
			var tArr:Array<B2Bound> = new Array();
			var j:Int;
			var tEnd:Int = boundCount - upperIndex;
			var tBound1:B2Bound;
			var tBound2:B2Bound;
			var tBoundAS3:B2Bound;
			// make temp array
			for (j in 0...tEnd){
				tArr[j] = new B2Bound();
				tBound1 = tArr[j];
				tBound2 = bounds[upperIndex+j];
				tBound1.value = tBound2.value;
				tBound1.proxyId = tBound2.proxyId;
				tBound1.stabbingCount = tBound2.stabbingCount;
			}
			// move temp array back in to bounds
			tEnd = tArr.length;
			var tIndex:Int = upperIndex+2;
			for (j in 0...tEnd){
				//bounds[tIndex+j] = tArr[j];
				tBound2 = tArr[j];
				tBound1 = bounds[tIndex+j];
				tBound1.value = tBound2.value;
				tBound1.proxyId = tBound2.proxyId;
				tBound1.stabbingCount = tBound2.stabbingCount;
			}
			//memmove(bounds + lowerIndex + 1, bounds + lowerIndex, (upperIndex - lowerIndex) * sizeof(b2Bound));
			// make temp array
			tArr = new Array();
			tEnd = upperIndex - lowerIndex;
			for (j in 0...tEnd){
				tArr[j] = new B2Bound();
				
				tBound1 = tArr[j];
				tBound2 = bounds[lowerIndex+j];
				tBound1.value = tBound2.value;
				tBound1.proxyId = tBound2.proxyId;
				tBound1.stabbingCount = tBound2.stabbingCount;
			}
			// move temp array back in to bounds
			tEnd = tArr.length;
			tIndex = lowerIndex+1;
			for (j in 0...tEnd){
				//bounds[tIndex+j] = tArr[j];
				tBound2 = tArr[j];
				tBound1 = bounds[ tIndex + j ];
				tBound1.value = tBound2.value;
				tBound1.proxyId = tBound2.proxyId;
				tBound1.stabbingCount = tBound2.stabbingCount;
			}
			
			// The upper index has increased because of the lower bound insertion.
			++upperIndex;
			
			// Copy in the new bounds.
			tBound1 = bounds[lowerIndex];
			tBound2 = bounds[upperIndex];
			tBound1.value = lowerValues[axis];
			tBound1.proxyId = proxyId;
			tBound2.value = upperValues[axis];
			tBound2.proxyId = proxyId;
			
			tBoundAS3 = bounds[ lowerIndex - 1 ];
			tBound1.stabbingCount = (lowerIndex == 0) ? 0 : tBoundAS3.stabbingCount;
			tBoundAS3 = bounds[upperIndex-1];
			tBound2.stabbingCount = tBoundAS3.stabbingCount;
			
			// Adjust the stabbing count between the new bounds.
			index = lowerIndex;
			while (index < upperIndex)
			{
				tBoundAS3 = bounds[index];
				tBoundAS3.stabbingCount++;
				++index;
			}
			
			// Adjust the all the affected bound indices.
			index = lowerIndex;
			while (index < boundCount + 2)
			{
				tBound1 = bounds[index];
				var proxy2:B2Proxy = m_proxyPool[ tBound1.proxyId ];
				if (tBound1.IsLower())
				{
					proxy2.lowerBounds[axis] = index;
				}
				else
				{
					proxy2.upperBounds[axis] = index;
				}
				++index;
			}
		}
		
		++m_proxyCount;
		
		//B2Settings.b2Assert(m_queryResultCount < B2Settings.b2_maxProxies);
		
		for (i in 0...m_queryResultCount)
		{
			//B2Settings.b2Assert(m_queryResults[i] < b2_maxProxies);
			//B2Settings.b2Assert(m_proxyPool[m_queryResults[i]].IsValid());
			
			m_pairManager.AddBufferedPair(proxyId, m_queryResults[i]);
		}
		
		m_pairManager.Commit();
		
		// Prepare for next query.
		m_queryResultCount = 0;
		IncrementTimeStamp();
		
		return proxyId;
	}
	
	public function DestroyProxy(proxyId:Int) : Void{
		var tBound1:B2Bound;
		var tBound2:B2Bound;
		
		//B2Settings.b2Assert(0 < m_proxyCount && m_proxyCount <= b2_maxProxies);
		
		var proxy:B2Proxy = m_proxyPool[ proxyId ];
		//B2Settings.b2Assert(proxy.IsValid());
		
		var boundCount:Int = 2 * m_proxyCount;
		
		for (axis in 0...2)
		{
			var bounds:Array<B2Bound> = m_bounds[axis];
			
			var lowerIndex:Int = proxy.lowerBounds[axis];
			var upperIndex:Int = proxy.upperBounds[axis];
			tBound1 = bounds[lowerIndex];
			var lowerValue:Int = tBound1.value;
			tBound2 = bounds[upperIndex];
			var upperValue:Int = tBound2.value;
			
			// replace memmove calls
			//memmove(bounds + lowerIndex, bounds + lowerIndex + 1, (upperIndex - lowerIndex - 1) * sizeof(b2Bound));
			var tArr:Array<B2Bound> = new Array();
			var j:Int;
			var tEnd:Int = upperIndex - lowerIndex - 1;
			// make temp array
			for (j in 0...tEnd){
				tArr[j] = new B2Bound();
				tBound1 = tArr[j];
				tBound2 = bounds[lowerIndex+1+j];
				tBound1.value = tBound2.value;
				tBound1.proxyId = tBound2.proxyId;
				tBound1.stabbingCount = tBound2.stabbingCount;
			}
			// move temp array back in to bounds
			tEnd = tArr.length;
			var tIndex:Int = lowerIndex;
			for (j in 0...tEnd){
				//bounds[tIndex+j] = tArr[j];
				tBound2 = tArr[j];
				tBound1 = bounds[tIndex+j];
				tBound1.value = tBound2.value;
				tBound1.proxyId = tBound2.proxyId;
				tBound1.stabbingCount = tBound2.stabbingCount;
			}
			//memmove(bounds + upperIndex-1, bounds + upperIndex + 1, (edgeCount - upperIndex - 1) * sizeof(b2Bound));
			// make temp array
			tArr = new Array();
			tEnd = boundCount - upperIndex - 1;
			for (j in 0...tEnd){
				tArr[j] = new B2Bound();
				tBound1 = tArr[j];
				tBound2 = bounds[upperIndex+1+j];
				tBound1.value = tBound2.value;
				tBound1.proxyId = tBound2.proxyId;
				tBound1.stabbingCount = tBound2.stabbingCount;
			}
			// move temp array back in to bounds
			tEnd = tArr.length;
			tIndex = upperIndex-1;
			for (j in 0...tEnd){
				//bounds[tIndex+j] = tArr[j];
				tBound2 = tArr[j];
				tBound1 = bounds[ tIndex + j ];
				tBound1.value = tBound2.value;
				tBound1.proxyId = tBound2.proxyId;
				tBound1.stabbingCount = tBound2.stabbingCount;
			}
			
			// Fix bound indices.
			tEnd = boundCount - 2;
			var index:Int = lowerIndex;
			while (index < tEnd)
			{
				tBound1 = bounds[index];
				var proxy2:B2Proxy = m_proxyPool[ tBound1.proxyId ];
				if (tBound1.IsLower())
				{
					proxy2.lowerBounds[axis] = index;
				}
				else
				{
					proxy2.upperBounds[axis] = index;
				}
				++index;
			}
			
			// Fix stabbing count.
			tEnd = upperIndex - 1;
			var index2:Int = lowerIndex;
			while (index2 < tEnd)
			{
				tBound1 = bounds[index2];
				tBound1.stabbingCount--;
				++index2;
			}
			
			// Query for pairs to be removed. lowerIndex and upperIndex are not needed.
			// make lowerIndex and upper output using an array and do this for others if compiler doesn't pick them up
			Query([0], [0], lowerValue, upperValue, bounds, boundCount - 2, axis);
		}
		
		//B2Settings.b2Assert(m_queryResultCount < B2Settings.b2_maxProxies);
		
		for (i in 0...m_queryResultCount)
		{
			//B2Settings.b2Assert(m_proxyPool[m_queryResults[i]].IsValid());
			
			m_pairManager.RemoveBufferedPair(proxyId, m_queryResults[i]);
		}
		
		m_pairManager.Commit();
		
		// Prepare for next query.
		m_queryResultCount = 0;
		IncrementTimeStamp();
		
		// Return the proxy to the pool.
		proxy.userData = null;
		proxy.overlapCount = b2_invalid;
		proxy.lowerBounds[0] = b2_invalid;
		proxy.lowerBounds[1] = b2_invalid;
		proxy.upperBounds[0] = b2_invalid;
		proxy.upperBounds[1] = b2_invalid;
		
		proxy.SetNext(m_freeProxy);
		m_freeProxy = proxyId;
		--m_proxyCount;
	}
	// Call MoveProxy as many times as you like, then when you are done
	// call Commit to finalized the proxy pairs (for your time step).
	public function MoveProxy(proxyId:Int, aabb:B2AABB) : Void{
		var as3arr: Array<Int>;
		var as3int: Int;
		
		var axis:Int;
		var index:Int;
		var bound:B2Bound;
		var prevBound:B2Bound;
		var nextBound:B2Bound;
		var nextProxyId:Int;
		var nextProxy:B2Proxy;
		
		if (proxyId == B2Pair.b2_nullProxy || B2Settings.b2_maxProxies <= proxyId)
		{
			//B2Settings.b2Assert(false);
			return;
		}
		
		if (aabb.IsValid() == false)
		{
			//B2Settings.b2Assert(false);
			return;
		}
		
		var boundCount:Int = 2 * m_proxyCount;
		
		var proxy:B2Proxy = m_proxyPool[ proxyId ];
		// Get new bound values
		var newValues:B2BoundValues = new B2BoundValues();
		ComputeBounds(newValues.lowerValues, newValues.upperValues, aabb);
		
		// Get old bound values
		var oldValues:B2BoundValues = new B2BoundValues();
		for (axis in 0...2)
		{
			bound = m_bounds[axis][proxy.lowerBounds[axis]];
			oldValues.lowerValues[axis] = bound.value;
			bound = m_bounds[axis][proxy.upperBounds[axis]];
			oldValues.upperValues[axis] = bound.value;
		}
		
		for (axis in 0...2)
		{
			var bounds:Array<B2Bound> = m_bounds[axis];
			
			var lowerIndex:Int = proxy.lowerBounds[axis];
			var upperIndex:Int = proxy.upperBounds[axis];
			
			var lowerValue:Int = newValues.lowerValues[axis];
			var upperValue:Int = newValues.upperValues[axis];
			
			bound = bounds[lowerIndex];
			var deltaLower:Int = lowerValue - bound.value;
			bound.value = lowerValue;
			
			bound = bounds[upperIndex];
			var deltaUpper:Int = upperValue - bound.value;
			bound.value = upperValue;
			
			//
			// Expanding adds overlaps
			//
			
			// Should we move the lower bound down?
			
			var prevProxy:B2Proxy;
			var prevProxyId:Int;
			if (deltaLower < 0)
			{
				index = lowerIndex;
				while (index > 0 && lowerValue < bounds[ index - 1 ].value)
				{
					
					bound = bounds[index];
					
					prevBound = bounds[index - 1];
					
					prevProxyId = prevBound.proxyId;
					prevProxy = m_proxyPool[ prevBound.proxyId ];
					
					prevBound.stabbingCount++;
					
					if (prevBound.IsUpper() == true)
					{
						if (TestOverlap(newValues, prevProxy))
						{
							m_pairManager.AddBufferedPair(proxyId, prevProxyId);
						}
						
						//prevProxy.upperBounds[axis]++;
						as3arr = prevProxy.upperBounds;
						as3int = as3arr[axis];
						as3int++;
						as3arr[axis] = as3int;
						
						bound.stabbingCount++;
					}
					else
					{
						//prevProxy.lowerBounds[axis]++;
						as3arr = prevProxy.lowerBounds;
						as3int = as3arr[axis];
						as3int++;
						as3arr[axis] = as3int;
						
						bound.stabbingCount--;
					}
					
					//proxy.lowerBounds[axis]--;
					as3arr = proxy.lowerBounds;
					as3int = as3arr[axis];
					as3int--;
					as3arr[axis] = as3int;
					
					// swap
					//var temp:B2Bound = bound;
					//bound = prevEdge;
					//prevEdge = temp;
					bound.Swap(prevBound);
					//B2Math.b2Swap(bound, prevEdge);
					--index;
				}
			}
			
			// Should we move the upper bound up?
			if (deltaUpper > 0)
			{
				index = upperIndex;
				while (index < boundCount-1 && bounds[ index+1 ].value <= upperValue)
				{
					bound = bounds[ index ];
					nextBound = bounds[ index + 1 ];
					nextProxyId = nextBound.proxyId;
					nextProxy = m_proxyPool[ nextProxyId ];
					
					nextBound.stabbingCount++;
					
					if (nextBound.IsLower() == true)
					{
						if (TestOverlap(newValues, nextProxy))
						{
							m_pairManager.AddBufferedPair(proxyId, nextProxyId);
						}
						
						//nextProxy.lowerBounds[axis]--;
						as3arr = nextProxy.lowerBounds;
						as3int = as3arr[axis];
						as3int--;
						as3arr[axis] = as3int;
						
						bound.stabbingCount++;
					}
					else
					{
						//nextProxy.upperBounds[axis]--;
						as3arr = nextProxy.upperBounds;
						as3int = as3arr[axis];
						as3int--;
						as3arr[axis] = as3int;
						
						bound.stabbingCount--;
					}
					
					//proxy.upperBounds[axis]++;
					as3arr = proxy.upperBounds;
					as3int = as3arr[axis];
					as3int++;
					as3arr[axis] = as3int;
					
					// swap
					//var temp:B2Bound = bound;
					//bound = nextEdge;
					//nextEdge = temp;
					bound.Swap(nextBound);
					//B2Math.b2Swap(bound, nextEdge);
					index++;
				}
			}
			
			//
			// Shrinking removes overlaps
			//
			
			// Should we move the lower bound up?
			if (deltaLower > 0)
			{
				index = lowerIndex;
				while (index < boundCount-1 && bounds[ index+1].value <= lowerValue)
				{
					bound = bounds[ index ];
					nextBound = bounds[ index + 1 ];
					
					nextProxyId = nextBound.proxyId;
					nextProxy = m_proxyPool[ nextProxyId ];
					
					nextBound.stabbingCount--;
					
					if (nextBound.IsUpper())
					{
						if (TestOverlap(oldValues, nextProxy))
						{
							m_pairManager.RemoveBufferedPair(proxyId, nextProxyId);
						}
						
						//nextProxy.upperBounds[axis]--;
						as3arr = nextProxy.upperBounds;
						as3int = as3arr[axis];
						as3int--;
						as3arr[axis] = as3int;
						
						bound.stabbingCount--;
					}
					else
					{
						//nextProxy.lowerBounds[axis]--;
						as3arr = nextProxy.lowerBounds;
						as3int = as3arr[axis];
						as3int--;
						as3arr[axis] = as3int;
						
						bound.stabbingCount++;
					}
					
					//proxy.lowerBounds[axis]++;
					as3arr = proxy.lowerBounds;
					as3int = as3arr[axis];
					as3int++;
					as3arr[axis] = as3int;
					
					// swap
					//var temp:B2Bound = bound;
					//bound = nextEdge;
					//nextEdge = temp;
					bound.Swap(nextBound);
					//B2Math.b2Swap(bound, nextEdge);
					index++;
				}
			}
			
			// Should we move the upper bound down?
			if (deltaUpper < 0)
			{
				index = upperIndex;
				while (index > 0 && upperValue < bounds[index-1].value)
				{
					bound = bounds[index];
					prevBound = bounds[index - 1];
					
					prevProxyId = prevBound.proxyId;
					prevProxy = m_proxyPool[ prevProxyId ];
					
					prevBound.stabbingCount--;
					
					if (prevBound.IsLower() == true)
					{
						if (TestOverlap(oldValues, prevProxy))
						{
							m_pairManager.RemoveBufferedPair(proxyId, prevProxyId);
						}
						
						//prevProxy.lowerBounds[axis]++;
						as3arr = prevProxy.lowerBounds;
						as3int = as3arr[axis];
						as3int++;
						as3arr[axis] = as3int;
						
						bound.stabbingCount--;
					}
					else
					{
						//prevProxy.upperBounds[axis]++;
						as3arr = prevProxy.upperBounds;
						as3int = as3arr[axis];
						as3int++;
						as3arr[axis] = as3int;
						
						bound.stabbingCount++;
					}
					
					//proxy.upperBounds[axis]--;
					as3arr = proxy.upperBounds;
					as3int = as3arr[axis];
					as3int--;
					as3arr[axis] = as3int;
					
					// swap
					//var temp:B2Bound = bound;
					//bound = prevEdge;
					//prevEdge = temp;
					bound.Swap(prevBound);
					//B2Math.b2Swap(bound, prevEdge);
					index--;
				}
			}
		}
	}
	
	public function Commit() : Void{
		m_pairManager.Commit();
	}
	// Query an AABB for overlapping proxies, returns the user data and
	// the count, up to the supplied maximum count.
	public function QueryAABB(aabb:B2AABB, userData:Array<Dynamic>, maxCount:Int):Int{
		var lowerValues:Array<Int> = new Array();
		var upperValues:Array<Int> = new Array();
		ComputeBounds(lowerValues, upperValues, aabb);
		
		var lowerIndex:Int = 0;
		var upperIndex:Int = 0;
		var lowerIndexOut:Array<Int> = [lowerIndex];
		var upperIndexOut:Array<Int> = [upperIndex];
		Query(lowerIndexOut, upperIndexOut, lowerValues[0], upperValues[0], m_bounds[0], 2*m_proxyCount, 0);
		Query(lowerIndexOut, upperIndexOut, lowerValues[1], upperValues[1], m_bounds[1], 2*m_proxyCount, 1);
		
		//B2Settings.b2Assert(m_queryResultCount < B2Settings.b2_maxProxies);
		
		var count:Int = 0;
		var i:Int = 0;
		
		
		while (i < m_queryResultCount && count < maxCount)
		
		{
			//B2Settings.b2Assert(m_queryResults[i] < B2Settings.b2_maxProxies);
			var proxy:B2Proxy = m_proxyPool[ m_queryResults[i] ];
			//B2Settings.b2Assert(proxy.IsValid());
			
			userData[i] = proxy.userData;
			++i; 
			++count;
		}
		
		// Prepare for next query.
		m_queryResultCount = 0;
		IncrementTimeStamp();
		
		return count;
	}
	public function Validate() : Void{
		var pair:B2Pair;
		var proxy1:B2Proxy;
		var proxy2:B2Proxy;
		var overlap:Bool;
		
		for (axis in 0...2)
		{
			var bounds = m_bounds[axis];
			
			var boundCount:Int = 2 * m_proxyCount;
			var stabbingCount:Int = 0;
			
			for (i in 0...boundCount)
			{
				var bound:B2Bound = bounds[i];
				//B2Settings.b2Assert(i == 0 || bounds[i-1].value <= bound->value);
				//B2Settings.b2Assert(bound->proxyId != b2_nullProxy);
				//B2Settings.b2Assert(m_proxyPool[bound->proxyId].IsValid());
				
				if (bound.IsLower() == true)
				{
					//B2Settings.b2Assert(m_proxyPool[bound.proxyId].lowerBounds[axis] == i);
					stabbingCount++;
				}
				else
				{
					//B2Settings.b2Assert(m_proxyPool[bound.proxyId].upperBounds[axis] == i);
					stabbingCount--;
				}
				
				//B2Settings.b2Assert(bound.stabbingCount == stabbingCount);
			}
		}
		
	}
//private:
	function ComputeBounds(lowerValues:Array<Int>, upperValues:Array<Int>, aabb:B2AABB) : Void
	{
		//B2Settings.b2Assert(aabb.upperBound.x > aabb.lowerBound.x);
		//B2Settings.b2Assert(aabb.upperBound.y > aabb.lowerBound.y);
		
		//var minVertex:B2Vec2 = B2Math.b2ClampV(aabb.minVertex, m_worldAABB.minVertex, m_worldAABB.maxVertex);
		var minVertexX:Float = aabb.lowerBound.x;
		var minVertexY:Float = aabb.lowerBound.y;
		minVertexX = B2Math.b2Min(minVertexX, m_worldAABB.upperBound.x);
		minVertexY = B2Math.b2Min(minVertexY, m_worldAABB.upperBound.y);
		minVertexX = B2Math.b2Max(minVertexX, m_worldAABB.lowerBound.x);
		minVertexY = B2Math.b2Max(minVertexY, m_worldAABB.lowerBound.y);
		
		//var maxVertex:B2Vec2 = B2Math.b2ClampV(aabb.maxVertex, m_worldAABB.minVertex, m_worldAABB.maxVertex);
		var maxVertexX:Float = aabb.upperBound.x;
		var maxVertexY:Float = aabb.upperBound.y;
		maxVertexX = B2Math.b2Min(maxVertexX, m_worldAABB.upperBound.x);
		maxVertexY = B2Math.b2Min(maxVertexY, m_worldAABB.upperBound.y);
		maxVertexX = B2Math.b2Max(maxVertexX, m_worldAABB.lowerBound.x);
		maxVertexY = B2Math.b2Max(maxVertexY, m_worldAABB.lowerBound.y);
		
		// Bump lower bounds downs and upper bounds up. This ensures correct sorting of
		// lower/upper bounds that would have equal values.
		// TODO_ERIN implement fast float to uint16 conversion.
		lowerValues[0] = Std.int(m_quantizationFactor.x * (minVertexX - m_worldAABB.lowerBound.x)) & (B2Settings.USHRT_MAX_CONST_CONST - 1);
		upperValues[0] = (Std.int(m_quantizationFactor.x * (maxVertexX - m_worldAABB.lowerBound.x))& 0x0000ffff) | 1;
		
		lowerValues[1] = Std.int(m_quantizationFactor.y * (minVertexY - m_worldAABB.lowerBound.y)) & (B2Settings.USHRT_MAX_CONST_CONST - 1);
		upperValues[1] = (Std.int(m_quantizationFactor.y * (maxVertexY - m_worldAABB.lowerBound.y))& 0x0000ffff) | 1;
	}
	// This one is only used for validation.
	function TestOverlapValidate(p1:B2Proxy, p2:B2Proxy):Bool{
		
		for (axis in 0...2)
		{
			var bounds:Array<B2Bound> = m_bounds[axis];
			
			//B2Settings.b2Assert(p1.lowerBounds[axis] < 2 * m_proxyCount);
			//B2Settings.b2Assert(p1.upperBounds[axis] < 2 * m_proxyCount);
			//B2Settings.b2Assert(p2.lowerBounds[axis] < 2 * m_proxyCount);
			//B2Settings.b2Assert(p2.upperBounds[axis] < 2 * m_proxyCount);
			
			var bound1:B2Bound = bounds[p1.lowerBounds[axis]];
			var bound2:B2Bound = bounds[p2.upperBounds[axis]];
			if (bound1.value > bound2.value)
				return false;
			
			bound1 = bounds[p1.upperBounds[axis]];
			bound2 = bounds[p2.lowerBounds[axis]];
			if (bound1.value < bound2.value)
				return false;
		}
		
		return true;
	}
	
	public function TestOverlap(b:B2BoundValues, p:B2Proxy):Bool
	{
		for (axis in 0...2)
		{
			var bounds:Array<B2Bound> = m_bounds[axis];
			
			//B2Settings.b2Assert(p.lowerBounds[axis] < 2 * m_proxyCount);
			//B2Settings.b2Assert(p.upperBounds[axis] < 2 * m_proxyCount);
			
			var bound:B2Bound = bounds[p.upperBounds[axis]];
			if (b.lowerValues[axis] > bound.value)
				return false;
			
			bound = bounds[p.lowerBounds[axis]];
			if (b.upperValues[axis] < bound.value)
				return false;
		}
		
		return true;
	}
	function Query(lowerQueryOut:Array<Int>, upperQueryOut:Array<Int>, lowerValue:Int, upperValue:Int, bounds:Array<B2Bound>, boundCount:Int, axis:Int) : Void{
		
		var lowerQuery:Int = BinarySearch(bounds, boundCount, lowerValue);
		var upperQuery:Int = BinarySearch(bounds, boundCount, upperValue);
		var bound:B2Bound;
		
		// Easy case: lowerQuery <= lowerIndex(i) < upperQuery
		// Solution: search query range for min bounds.
		var j:Int = lowerQuery;
		while (j < upperQuery)
		{
			bound = bounds[j];
			if (bound.IsLower())
			{
				IncrementOverlapCount(bound.proxyId);
			}
			++j;
		}
		
		// Hard case: lowerIndex(i) < lowerQuery < upperIndex(i)
		// Solution: use the stabbing count to search down the bound array.
		if (lowerQuery > 0)
		{
			var i:Int = lowerQuery - 1;
			bound = bounds[i];
			var s:Int = bound.stabbingCount;
			
			// Find the s overlaps.
			while (s != 0)
			{
				//B2Settings.b2Assert(i >= 0);
				bound = bounds[i];
				if (bound.IsLower())
				{
					var proxy:B2Proxy = m_proxyPool[ bound.proxyId ];
					if (lowerQuery <= proxy.upperBounds[axis])
					{
						IncrementOverlapCount(bound.proxyId);
						--s;
					}
				}
				--i;
			}
		}
		
		lowerQueryOut[0] = lowerQuery;
		upperQueryOut[0] = upperQuery;
	}
	function IncrementOverlapCount(proxyId:Int) : Void{
		var proxy:B2Proxy = m_proxyPool[ proxyId ];
		if (proxy.timeStamp < m_timeStamp)
		{
			proxy.timeStamp = m_timeStamp;
			proxy.overlapCount = 1;
		}
		else
		{
			proxy.overlapCount = 2;
			//B2Settings.b2Assert(m_queryResultCount < B2Settings.b2_maxProxies);
			m_queryResults[m_queryResultCount] = proxyId;
			++m_queryResultCount;
		}
	}
	function IncrementTimeStamp() : Void{
		if (m_timeStamp == B2Settings.USHRT_MAX_CONST_CONST)
		{
			for (i in 0...B2Settings.b2_maxProxies)
			{
				m_proxyPool[i].timeStamp = 0;
			}
			m_timeStamp = 1;
		}
		else
		{
			++m_timeStamp;
		}
	}
//public:
	public var m_pairManager:B2PairManager ;
	public var m_proxyPool:Array<B2Proxy> ;
	public var m_freeProxy:Int;
	public var m_bounds:Array<Array<B2Bound>> ;
	public var m_queryResults:Array<Int> ;
	public var m_queryResultCount:Int;
	public var m_worldAABB:B2AABB;
	public var m_quantizationFactor:B2Vec2 ;
	public var m_proxyCount:Int;
	public var m_timeStamp:Int;
	public static inline var s_validate:Bool = false;
	
	public static inline var b2_invalid:Int = B2Settings.USHRT_MAX_CONST_CONST;
	public static inline var b2_nullEdge:Int = B2Settings.USHRT_MAX_CONST_CONST;
	public static function BinarySearch(bounds:Array<B2Bound>, count:Int, value:Int):Int
	{
		var low:Int = 0;
		var high:Int = count - 1;
		while (low <= high)
		{
			var mid:Int = Std.int ((low + high) * 0.5);
			var bound:B2Bound = bounds[mid];
			if (bound.value > value)
			{
				high = mid - 1;
			}
			else if (bound.value < value)
			{
				low = mid + 1;
			}
			else
			{
				return mid;
			}
		}
		
		return low;
	}
	
	
}