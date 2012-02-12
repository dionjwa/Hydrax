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

import de.polygonal.ds.IntIntHashTable;
import de.polygonal.ds.pooling.ObjectPool;
import de.polygonal.motor.collision.nbody.BroadPhase;

class PairManager
{
	var _pairHandler:PairHandler;
	var _broadPhase:BroadPhase;

	var _pairPool:ObjectPool<Pair>;
	var _pairHash:IntIntHashTable;
	
	#if debug
	var _curSize:Int;
	var _maxSize:Int;
	#end
	
	public function new(maxPairs:Int, pairHandler:PairHandler, broadphase:BroadPhase, lazyAlloc:Bool)
	{
		_pairHandler = pairHandler;
		_broadPhase = broadphase;
		
		_pairPool = new ObjectPool<Pair>(maxPairs);
		_pairPool.allocate(lazyAlloc, Pair);
		
		_pairHash = new IntIntHashTable(maxPairs, maxPairs, false, maxPairs);
		
		#if debug
		_curSize = 0;
		_maxSize = maxPairs;
		#end
	}
	
	public function free():Void
	{
		_pairPool.free();
		_pairHash.free();
		
		_pairHandler = null;
		_broadPhase  = null;
		_pairPool    = null;
		_pairHash    = null;
	}
	
	public function addPair(proxyId1:Int, proxyId2:Int):Bool
	{
		var key = PairKey.getU16(proxyId1, proxyId2);
		
		if (_pairHash.hasKey(key)) return false;
		
		#if debug
		de.polygonal.core.util.Assert.assert(_curSize < _maxSize, "_curSize < _maxSize");
		_curSize++;
		#end
		
		var pairId = _pairPool.next();
		_pairHash.set(key, pairId);
		
		var shape1 = _broadPhase.getProxy(proxyId1).shape;
		var shape2 = _broadPhase.getProxy(proxyId2).shape;
		_pairPool.get(pairId).contact = _pairHandler.pairAdded(shape1, shape2);
		
		return true;
	}
	
	public function removePair(proxyId1:Int, proxyId2:Int):Bool
	{
		var key = PairKey.getU16(proxyId1, proxyId2);
		
		if (!_pairHash.hasKey(key)) return false;
		
		#if debug
		de.polygonal.core.util.Assert.assert(_curSize > 0, "_curSize > 0");
		_curSize--;
		#end
		
		var pairId = _pairHash.get(key);
		var pair = _pairPool.get(pairId);
		
		_pairPool.put(pairId);
		_pairHash.clr(key);
		
		_pairHandler.pairRemoved(pair.contact);
		pair.contact = null;
		
		return true;
	}
}