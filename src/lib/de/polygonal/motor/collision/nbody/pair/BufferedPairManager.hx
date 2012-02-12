/*
 *                            _/                                                    _/   
 *       _/_/_/      _/_/    _/  _/    _/    _/_/_/    _/_/    _/_/_/      _/_/_/  _/    
 *      _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/     
 *     _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/      
 *    _/_/_/      _/_/    _/    _/_/_/    _/_/_/    _/_/    _/    _/    _/_/_/  _/       
 *   _/                            _/        _/                                          
 *  _/                        _/_/      _/_/                                             
 *                                                                                       
 * POLYGONAL - A HAXE LIBRARY FOR GAME DEVELOPERS
 * Copyright (c) 2009-2010 Michael Baczynski, http://www.polygonal.de
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
package de.polygonal.motor.collision.nbody.pair;

import de.polygonal.core.math.Limits;
import de.polygonal.ds.Bits;
import de.polygonal.ds.DA;
import de.polygonal.ds.IntIntHashTable;
import de.polygonal.motor.collision.nbody.BroadPhase;

using de.polygonal.ds.BitFlags;

class BufferedPairManager extends PairManager
{
	inline static var PAIR_BUFFERED = Bits.BIT_01;
	inline static var PAIR_REMOVED  = Bits.BIT_02;
	inline static var PAIR_FINAL    = Bits.BIT_03;
	inline static var PAIR_ACTIVE   = Bits.BIT_04;
	
	inline public static var NULL_PAIR = Limits.UINT16_MAX;
	
	var _pairBuffer:DA<Pair>;
	var _pairBufferCount:Int;
	
	public function new(maxPairs:Int, pairHandler:PairHandler, broadPhase:BroadPhase, lazyAlloc:Bool)
	{
		super(maxPairs, pairHandler, broadPhase, lazyAlloc);
		
		_pairBuffer = new DA<Pair>(maxPairs);
		_pairBuffer.assign(Pair, null, maxPairs);
		_pairBufferCount = 0;
	}
	
	override public function addPair(proxyId1:Int, proxyId2:Int):Bool
	{
		var key = PairKey.getU16(proxyId1, proxyId2);
		
		var pair = null;
		
		var pairId = _pairHash.get(key);
		if (pairId != IntIntHashTable.KEY_ABSENT)
			pair = _pairPool.get(pairId);
		else
		{
			pairId = _pairPool.next();
			_pairHash.set(key, pairId);
			
			pair = _pairPool.get(pairId);
			pair.init(proxyId1, proxyId2);
		}
		
		//newly added pairs are added to the pair buffer
		if (!pair.hasf(PAIR_BUFFERED)) bufferPair(pair);
		
		//confirm for subsequent call to commit
		pair.clrf(PAIR_REMOVED);
		
		return true;
	}
	
	override public function removePair(proxyId1:Int, proxyId2:Int):Bool
	{
		var key = PairKey.getU16(proxyId1, proxyId2);
		
		//the pair never existed (legal due to collision filtering)
		if (!_pairHash.hasKey(key)) return false;
		else
		{
			var pairId = _pairHash.get(key);
			var pair = _pairPool.get(pairId);
			
			//old pair?
			if (!pair.hasf(PAIR_BUFFERED)) bufferPair(pair);
			pair.setf(PAIR_REMOVED);
			
			return true;
		}
	}
	
	public function commit():Void
	{
		var removeCount = 0;
		var pair, bufferedPair, key, pairId, proxy1, proxy2;
		
		for (i in 0..._pairBufferCount)
		{
			bufferedPair = _pairBuffer.get(i);
			
			key = PairKey.getU16(bufferedPair.proxyId1, bufferedPair.proxyId2);
			pairId = _pairHash.get(key);
			pair = _pairPool.get(pairId);
			pair.clrf(PAIR_BUFFERED);
			
			proxy1 = _broadPhase.getProxy(pair.proxyId1);
			proxy2 = _broadPhase.getProxy(pair.proxyId2);
			
			if (pair.hasf(PAIR_REMOVED))
			{
				//pair was added and removed before a commit?
				if (pair.hasf(PAIR_FINAL)) _pairHandler.pairRemoved(pair.contact);
				
				//store ids for removal
				bufferedPair = _pairBuffer.get(removeCount++);
				bufferedPair.proxyId1 = pair.proxyId1;
				bufferedPair.proxyId2 = pair.proxyId2;
			}
			else
			{
				if (!pair.hasf(PAIR_FINAL))
				{
					pair.contact = _pairHandler.pairAdded(proxy1.shape, proxy2.shape);
					pair.setf(PAIR_FINAL);
				}
			}
		}
		
		for (i in 0...removeCount)
		{
			bufferedPair = _pairBuffer.get(i);
			
			key = PairKey.getU16(bufferedPair.proxyId1, bufferedPair.proxyId2);
			pairId = _pairHash.get(key);
			_pairPool.get(pairId).reset();
			_pairPool.put(pairId);
			
			_pairHash.clr(key);
		}
		
		_pairBufferCount = 0;
	}
	
	inline function bufferPair(x:Pair):Void
	{
		x.setf(PAIR_BUFFERED);
		var bufferedPair = _pairBuffer.get(_pairBufferCount++);
		bufferedPair.proxyId1 = x.proxyId1;
		bufferedPair.proxyId2 = x.proxyId2;
	}
}