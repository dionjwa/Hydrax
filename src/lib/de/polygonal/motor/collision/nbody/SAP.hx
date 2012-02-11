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
package de.polygonal.motor.collision.nbody;

import de.polygonal.core.math.Limits;
import de.polygonal.core.math.Mathematics;
import de.polygonal.ds.DA;
import de.polygonal.motor.collision.nbody.AbstractBroadPhase;
import de.polygonal.motor.collision.nbody.pair.BufferedPairManager;
import de.polygonal.motor.collision.nbody.pair.PairHandler;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.geom.primitive.AABB2;
import de.polygonal.motor.Settings;

class SAP extends AbstractBroadPhase<SAPProxy>
{
	var _maxProxies:Int;
	var _maxPairs:Int;
	
	var _timeStamp:Int;
	
	var _boundX:DA<Bound>;
	var _boundY:DA<Bound>;
	
	var _queryResultCount:Int;
	var _queryResults:Array<Int>;
	
	//fast integral compares
	var _xQuantizationFactor:Float;
	var _yQuantizationFactor:Float;
	
	var _tmpInterval:QueryInterval;
	
	public function new(pairHandler:PairHandler)
	{
		super(pairHandler);
	}
	
	override public function free():Void
	{
		if (!_isInitialized) return;
		
		_boundX.free();
		_boundY.free();
		
		_queryResults = null;
		_tmpInterval  = null;
		
		super.free();
	}
	
	override public function insideBound(aabb:AABB2):Bool
	{
		var dx0 = aabb.minX - _bound.maxX; var dx1 = _bound.minX - aabb.maxX;
		var dy0 = aabb.minY - _bound.maxY; var dy1 = _bound.minY - aabb.maxY;
		
		return Mathematics.fmax(Mathematics.fmax(dx0, dx1), Mathematics.fmax(dy0, dy1)) < 0;
	}
	
	override public function queryAABB(aabb:AABB2, out:Array<AbstractShape>, maxCount:Int):Int
	{
		var minX0 = Std.int((_xQuantizationFactor * (Mathematics.fclamp(aabb.minX, _bound.minX, _bound.maxX) - _bound.minX))) & (0xffff - 1);
		var maxX0 = Std.int((_xQuantizationFactor * (Mathematics.fclamp(aabb.maxX, _bound.minX, _bound.maxX) - _bound.minX))) | 1;
		var minY0 = Std.int((_yQuantizationFactor * (Mathematics.fclamp(aabb.minY, _bound.minY, _bound.maxY) - _bound.minY))) & (0xffff - 1);
		var maxY0 = Std.int((_yQuantizationFactor * (Mathematics.fclamp(aabb.maxY, _bound.minY, _bound.maxY) - _bound.minY))) | 1;
		
		_rangeQuery(_tmpInterval, minX0, maxX0, _boundX, _proxyCount << 1, 0);
		_rangeQuery(_tmpInterval, minY0, maxY0, _boundY, _proxyCount << 1, 1);
		
		var c = 0;
		for (i in 0..._queryResultCount)
		{
			var proxy = _proxyPool.get(_queryResults[i]);
			out[c++] = proxy.shape;
			
			if (i == maxCount)
				break;
		}
		
		//prepare for next query
		_queryResultCount = 0;
		_incrementTimeStamp();
		
		return c;
	}
	
	// public function querySegment(a:Point, b:Point, shapeList:Array<AbstractShape>, maxCount = -1):Int
	// {
	// 	return 0;
	// }
	
	override public function createProxy(shape:AbstractShape):Int
	{
		var proxyCount = _proxyCount;
		
		var proxyId = super.createProxy(shape);
		var proxy = _proxyPool.get(proxyId);
		proxy.shape = shape;
		
		var bound = shape.aabb;
		
		var minX0 = Std.int((_xQuantizationFactor * (Mathematics.fclamp(bound.minX, _bound.minX, _bound.maxX) - _bound.minX))) & (0xffff - 1);
		var maxX0 = Std.int((_xQuantizationFactor * (Mathematics.fclamp(bound.maxX, _bound.minX, _bound.maxX) - _bound.minX))) | 1;
		var minY0 = Std.int((_yQuantizationFactor * (Mathematics.fclamp(bound.minY, _bound.minY, _bound.maxY) - _bound.minY))) & (0xffff - 1);
		var maxY0 = Std.int((_yQuantizationFactor * (Mathematics.fclamp(bound.maxY, _bound.minY, _bound.maxY) - _bound.minY))) | 1;
		
		var boundCount = proxyCount << 1;
		var index:Int;
		
		var bound:Bound;
		var lowerBound:Bound, lowerIndex:Int;
		var upperBound:Bound, upperIndex:Int;
		
		//x-axis
		_rangeQuery(_tmpInterval, minX0, maxX0, _boundX, boundCount, 0);
		lowerIndex = _tmpInterval.lower;
		upperIndex = _tmpInterval.upper;
		
		_boundX.insertAt(lowerIndex, new Bound());
		upperIndex++; //the upper index has increased because of the lower bound insertion
		_boundX.insertAt(upperIndex, new Bound());
		
		//copy in the new bound
		lowerBound = _boundX.get(lowerIndex);
		lowerBound.value = minX0;
		lowerBound.proxyId = proxyId;
		
		upperBound = _boundX.get(upperIndex);
		upperBound.value = maxX0;
		upperBound.proxyId = proxyId;
		
		lowerBound.stabbingCount = (lowerIndex == 0) ? 0 : _boundX.get(lowerIndex - 1).stabbingCount;
		upperBound.stabbingCount = _boundX.get(upperIndex - 1).stabbingCount;
		
		//adjust the stabbing count between the new bound
		for (index in lowerIndex...upperIndex)
			_boundX.get(index).stabbingCount++;
		
		//adjust all the affected bound indices
		for (index in lowerIndex...boundCount + 2)
		{
			bound = _boundX.get(index);
			proxy = _proxyPool.get(bound.proxyId);
			if (bound.isLower())
				proxy.minX = index;
			else
				proxy.maxX = index;
		}
		
		//y-axis
		_rangeQuery(_tmpInterval, minY0, maxY0, _boundY, boundCount, 1);
		lowerIndex = _tmpInterval.lower;
		upperIndex = _tmpInterval.upper;
		
		_boundY.insertAt(lowerIndex, new Bound());
		upperIndex++;
		_boundY.insertAt(upperIndex, new Bound());
		
		lowerBound = _boundY.get(lowerIndex);
		lowerBound.value = minY0;
		lowerBound.proxyId = proxyId;
		
		upperBound = _boundY.get(upperIndex);
		upperBound.value = maxY0;
		upperBound.proxyId = proxyId;
		
		lowerBound.stabbingCount = (lowerIndex == 0) ? 0 : _boundY.get(lowerIndex - 1).stabbingCount;
		upperBound.stabbingCount = _boundY.get(upperIndex - 1).stabbingCount;
		
		for (index in lowerIndex...upperIndex)
			_boundY.get(index).stabbingCount++;
		
		for (index in lowerIndex...boundCount + 2)
		{
			bound = _boundY.get(index);
			proxy = _proxyPool.get(bound.proxyId);
			if (bound.isLower())
				proxy.minY = index;
			else
				proxy.maxY = index;
		}
		
		//create pairs if the AABB is in range
		for (i in 0..._queryResultCount)
			_pairManager.addPair(proxyId, _queryResults[i]);
		
		cast(_pairManager, BufferedPairManager).commit();
		
		//prepare for next query
		_queryResultCount = 0;
		_incrementTimeStamp();
		
		return proxyId;
	}
	
	override public function removeProxy(proxyId:Int):Void
	{
		if (proxyId == Proxy.NULL_PROXY) return;
		
		var tBound1:Bound;
		var tBound2:Bound;
		
		var proxy = _proxyPool.get(proxyId);
		var proxy2:SAPProxy;
		
		var boundCount = _proxyCount << 1;
		
		var lowerIndex:Int, lowerValue:Int;
		var upperIndex:Int, upperValue:Int;
		
		var boundEnd:Int;
		var index:Int;
		
		//x-axis
		lowerIndex = proxy.minX;
		upperIndex = proxy.maxX;
		tBound1 = _boundX.get(lowerIndex);
		lowerValue = tBound1.value;
		tBound2 = _boundX.get(upperIndex);
		upperValue = tBound2.value;
		
		_boundX.removeAt(lowerIndex);
		_boundX.removeAt(upperIndex - 1);
		
		//fix bound indices
		boundEnd = boundCount - 2;
		for (index in lowerIndex...boundEnd)
		{
			tBound1 = _boundX.get(index);
			proxy2 = _proxyPool.get(tBound1.proxyId);
			if (tBound1.isLower())
				proxy2.minX = index;
			else
				proxy2.maxX = index;
		}
		
		//fix stabbing count
		boundEnd = upperIndex - 1;
		for (index in lowerIndex...boundEnd)
		{
			tBound1 = _boundX.get(index);
			tBound1.stabbingCount--;
		}
		
		//query for pairs to be removed. lowerIndex and upperIndex are not needed
		_rangeQuery(_tmpInterval, lowerValue, upperValue, _boundX, boundCount - 2, 0);
		
		//y-axis
		lowerIndex = proxy.minY;
		upperIndex = proxy.maxY;
		tBound1 = _boundY.get(lowerIndex);
		lowerValue = tBound1.value;
		tBound2 = _boundY.get(upperIndex);
		upperValue = tBound2.value;
		
		_boundY.removeAt(lowerIndex);
		_boundY.removeAt(upperIndex - 1);
		
		boundEnd = boundCount - 2;
		for (index in lowerIndex...boundEnd)
		{
			tBound1 = _boundY.get(index);
			proxy2 = _proxyPool.get(tBound1.proxyId);
			if (tBound1.isLower())
				proxy2.minY = index;
			else
				proxy2.maxY = index;
		}
		
		boundEnd = upperIndex - 1;
		for (index in lowerIndex...boundEnd)
		{
			tBound1 = _boundY.get(index);
			tBound1.stabbingCount--;
		}
		
		_rangeQuery(_tmpInterval, lowerValue, upperValue, _boundY, boundCount - 2, 1);
		
		for (i in 0..._queryResultCount)
			_pairManager.removePair(proxyId, _queryResults[i]);
		
		cast(_pairManager, BufferedPairManager).commit();
		
		//prepare for next query
		_queryResultCount = 0;
		_incrementTimeStamp();
		
		//return the proxy to the pool
		proxy.overlapCount = Limits.UINT16_MAX;
		proxy.minX = Limits.INT16_MAX;
		proxy.minY = Limits.INT16_MAX;
		proxy.maxX = Limits.INT16_MIN;
		proxy.maxY = Limits.INT16_MIN;
		
		super.removeProxy(proxyId);
	}
	
	override public function updateProxy(proxyId:Int):Void
	{
		var proxy = _proxyPool.get(proxyId);
		var boundCount = _proxyCount << 1;
		
		//get new bound values
		//bump lower bound downs and upper bound up. this ensures correct
		//sorting of lower/upper bound that would have equal values.
		var bound = proxy.shape.aabb;
		
		var minX1 = Std.int((_xQuantizationFactor * (Mathematics.fclamp(bound.minX, _bound.minX, _bound.maxX) - _bound.minX))) & (0xffff - 1);
		var maxX1 = Std.int((_xQuantizationFactor * (Mathematics.fclamp(bound.maxX, _bound.minX, _bound.maxX) - _bound.minX))) | 1;
		var minY1 = Std.int((_yQuantizationFactor * (Mathematics.fclamp(bound.minY, _bound.minY, _bound.maxY) - _bound.minY))) & (0xffff - 1);
		var maxY1 = Std.int((_yQuantizationFactor * (Mathematics.fclamp(bound.maxY, _bound.minY, _bound.maxY) - _bound.minY))) | 1;
		
		//get old bound values
		var minX0 = _boundX.get(proxy.minX).value;
		var maxX0 = _boundX.get(proxy.maxX).value;
		var minY0 = _boundY.get(proxy.minY).value;
		var maxY0 = _boundY.get(proxy.maxY).value;
		
		var index:Int;
		var bound:Bound;
		
		var prevProxy:SAPProxy;
		var nextProxy:SAPProxy;
		
		var prevProxyId:Int;
		var nextProxyId:Int;
		
		var prevBound:Bound;
		var nextBound:Bound;
		
		var lowerIndex:Int, lowerValue:Int, deltaLower:Int;
		var upperIndex:Int, upperValue:Int, deltaUpper:Int;
		
		//{process x-axis
		lowerIndex = proxy.minX;
		upperIndex = proxy.maxX;
		
		lowerValue = minX1;
		upperValue = maxX1;
		
		deltaLower = lowerValue - _boundX.get(lowerIndex).value;
		deltaUpper = upperValue - _boundX.get(upperIndex).value;
		
		_boundX.get(lowerIndex).value = lowerValue;
		_boundX.get(upperIndex).value = upperValue;
		
		//expanding adds overlaps
		
		//should we move the lower bound down?
		if (deltaLower < 0)
		{
			index = lowerIndex;
			while (index > 0 && lowerValue < _boundX.get(index - 1).value)
			{
				bound = _boundX.get(index);
				prevBound = _boundX.get(index - 1);
				
				prevProxyId = prevBound.proxyId;
				prevProxy = _proxyPool.get(prevBound.proxyId);
				
				prevBound.stabbingCount++;
				
				if (prevBound.isUpper())
				{
					if (_testOverlap(minX1, minY1, maxX1, maxY1, prevProxy))
						_pairManager.addPair(proxyId, prevProxyId);
					
					prevProxy.maxX++;
					bound.stabbingCount++;
				}
				else
				{
					prevProxy.minX++;
					bound.stabbingCount--;
				}
				
				proxy.minX--;
				_swapBound(bound, prevBound);
				index--;
			}
		}
		
		//should we move the upper bound up?
		if (deltaUpper > 0)
		{
			index = upperIndex;
			while (index < boundCount - 1 && _boundX.get(index + 1).value <= upperValue)
			{
				bound = _boundX.get(index);
				nextBound = _boundX.get(index + 1);
				nextProxyId = nextBound.proxyId;
				nextProxy = _proxyPool.get(nextProxyId);
				
				nextBound.stabbingCount++;
				
				if (nextBound.isLower())
				{
					if (_testOverlap(minX1, minY1, maxX1, maxY1, nextProxy))
						_pairManager.addPair(proxyId, nextProxyId);
					
					nextProxy.minX--;
					bound.stabbingCount++;
				}
				else
				{
					nextProxy.maxX--;
					bound.stabbingCount--;
				}
				
				proxy.maxX++;
				_swapBound(bound, nextBound);
				index++;
			}
		}
		
		//shrinking removes overlaps
		
		//should we move the lower bound up?
		if (deltaLower > 0)
		{
			index = lowerIndex;
			while (index < boundCount - 1 && _boundX.get(index + 1).value <= lowerValue)
			{
				bound = _boundX.get(index);
				nextBound = _boundX.get(index + 1);
				nextProxyId = nextBound.proxyId;
				nextProxy = _proxyPool.get(nextProxyId);
				
				nextBound.stabbingCount--;
				
				if (nextBound.isUpper())
				{
					if (_testOverlap(minX0, minY0, maxX0, maxY0, nextProxy))
						_pairManager.removePair(proxyId, nextProxyId);
				
					nextProxy.maxX--;
					bound.stabbingCount--;
				}
				else
				{
					nextProxy.minX--;
					bound.stabbingCount++;
				}
				
				proxy.minX++;
				_swapBound(bound, nextBound);
				index++;
			}
		}
		
		//should we move the upper bound down?
		if (deltaUpper < 0)
		{
			index = upperIndex;
			while (index > 0 && upperValue < _boundX.get(index - 1).value)
			{
				bound = _boundX.get(index);
				prevBound = _boundX.get(index - 1);
				
				prevProxyId = prevBound.proxyId;
				prevProxy = _proxyPool.get(prevProxyId);
				
				prevBound.stabbingCount--;
				
				if (prevBound.isLower())
				{
					if (_testOverlap(minX0, minY0, maxX0, maxY0, prevProxy))
						_pairManager.removePair(proxyId, prevProxyId);
					
					prevProxy.minX++;
					bound.stabbingCount--;
				}
				else
				{
					prevProxy.maxX++;
					bound.stabbingCount++;
				}
				
				proxy.maxX--;
				_swapBound(bound, prevBound);
				index--;
			}
		}
		//}
		
		//{process y-axis
		lowerIndex = proxy.minY;
		upperIndex = proxy.maxY;
		
		lowerValue = minY1;
		upperValue = maxY1;
		
		deltaLower = lowerValue - _boundY.get(lowerIndex).value;
		deltaUpper = upperValue - _boundY.get(upperIndex).value;
		
		_boundY.get(lowerIndex).value = lowerValue;
		_boundY.get(upperIndex).value = upperValue;
		
		if (deltaLower < 0)
		{
			index = lowerIndex;
			while (index > 0 && lowerValue < _boundY.get(index - 1).value)
			{
				bound = _boundY.get(index);
				prevBound = _boundY.get(index - 1);
				
				prevProxyId = prevBound.proxyId;
				prevProxy = _proxyPool.get(prevBound.proxyId);
				
				prevBound.stabbingCount++;
				
				if (prevBound.isUpper())
				{
					if (_testOverlap(minX1, minY1, maxX1, maxY1, prevProxy))
						_pairManager.addPair(proxyId, prevProxyId);
					
					prevProxy.maxY++;
					bound.stabbingCount++;
				}
				else
				{
					prevProxy.minY++;
					bound.stabbingCount--;
				}
				
				proxy.minY--;
				_swapBound(bound, prevBound);
				index--;
			}
		}
		
		if (deltaUpper > 0)
		{
			index = upperIndex;
			while (index < boundCount - 1 && _boundY.get(index + 1).value <= upperValue)
			{
				bound = _boundY.get(index);
				nextBound = _boundY.get(index + 1);
				nextProxyId = nextBound.proxyId;
				nextProxy = _proxyPool.get(nextProxyId);
				
				nextBound.stabbingCount++;
				
				if (nextBound.isLower())
				{
					if (_testOverlap(minX1, minY1, maxX1, maxY1, nextProxy))
						_pairManager.addPair(proxyId, nextProxyId);
					
					nextProxy.minY--;
					bound.stabbingCount++;
				}
				else
				{
					nextProxy.maxY--;
					bound.stabbingCount--;
				}
				
				proxy.maxY++;
				_swapBound(bound, nextBound);
				index++;
			}
		}
		
		if (deltaLower > 0)
		{
			index = lowerIndex;
			while (index < boundCount - 1 && _boundY.get(index + 1).value <= lowerValue)
			{
				bound = _boundY.get(index);
				nextBound = _boundY.get(index + 1);
				nextProxyId = nextBound.proxyId;
				nextProxy = _proxyPool.get(nextProxyId);
				
				nextBound.stabbingCount--;
				
				if (nextBound.isUpper())
				{
					if (_testOverlap(minX0, minY0, maxX0, maxY0, nextProxy))
						_pairManager.removePair(proxyId, nextProxyId);
					
					nextProxy.maxY--;
					bound.stabbingCount--;
				}
				else
				{
					nextProxy.minY--;
					bound.stabbingCount++;
				}
				
				proxy.minY++;
				_swapBound(bound, nextBound);
				index++;
			}
		}
		
		if (deltaUpper < 0)
		{
			index = upperIndex;
			while (index > 0 && upperValue < _boundY.get(index - 1).value)
			{
				bound = _boundY.get(index);
				prevBound = _boundY.get(index - 1);
				
				prevProxyId = prevBound.proxyId;
				prevProxy = _proxyPool.get(prevProxyId);
				
				prevBound.stabbingCount--;
				
				if (prevBound.isLower())
				{
					if (_testOverlap(minX0, minY0, maxX0, maxY0, prevProxy))
						_pairManager.removePair(proxyId, prevProxyId);
					
					prevProxy.minY++;
					bound.stabbingCount--;
				}
				else
				{
					prevProxy.maxY++;
					bound.stabbingCount++;
				}
				
				proxy.maxY--;
				_swapBound(bound, prevBound);
				index--;
			}
		}
		//}
	}
	
	override public function update():Void
	{
		cast(_pairManager, BufferedPairManager).commit();
	}
	
	function _incrementOverlapCount(proxyId:Int):Void
	{
		var proxy = _proxyPool.get(proxyId);
		if (proxy.timeStamp < _timeStamp)
		{
			proxy.timeStamp = _timeStamp;
			proxy.overlapCount = 1;
		}
		else
		{
			proxy.overlapCount = 2;
			_queryResults[_queryResultCount] = proxyId;
			_queryResultCount++;
		}
	}
	
	function _incrementTimeStamp():Void
	{
		if (_timeStamp == 0xffff)
		{
			for (i in 0..._maxProxies)
				_proxyPool.get(i).timeStamp = 0;
			_timeStamp = 1;
		}
		else
			_timeStamp++;
	}
	
	function _binarySearch(bound:DA<Bound>, count:Int, value:Int):Int
	{
		var low = 0, high = count - 1;
		while (low <= high)
		{
			var mid = (low + high) >> 1;
			var bound = bound.get(mid);
			if (bound.value > value)
				high = mid - 1;
			else
			if (bound.value < value)
				low = mid + 1;
			else
			{
				low = mid;
				break;
			}
		}
		
		return low;
	}
	
	function _rangeQuery(out:QueryInterval, lowerValue:Int, upperValue:Int, bound:DA<Bound>, boundCount:Int, axis:Int):Void
	{
		var lowerQuery = out.lower = _binarySearch(bound, boundCount, lowerValue);
		var upperQuery = out.upper = _binarySearch(bound, boundCount, upperValue);
		
		//easy case: lowerQuery <= lowerIndex(i) < upperQuery
		//solution: search query range for min bound
		for (i in lowerQuery...upperQuery)
		{
			if (bound.get(i).isLower())
				_incrementOverlapCount(bound.get(i).proxyId);
		}
		
		//hard case: lowerIndex(i) < lowerQuery < upperIndex(i)
		//solution: use the stabbing count to search down the bound vector
		if (lowerQuery > 0)
		{
			//find the s overlaps
			var i = lowerQuery - 1;
			var s = bound.get(i).stabbingCount;
			var proxy:SAPProxy;
			if (axis == 0)
			{
				while (s > 0)
				{
					if (bound.get(i).isLower())
					{
						proxy = _proxyPool.get(bound.get(i).proxyId);
						if (lowerQuery <= proxy.maxX)
						{
							_incrementOverlapCount(bound.get(i).proxyId);
							s--;
						}
					}
					i--;
				}
			}
			else
			{
				while (s > 0)
				{
					if (bound.get(i).isLower())
					{
						proxy = _proxyPool.get(bound.get(i).proxyId);
						if (lowerQuery <= proxy.maxY)
						{
							_incrementOverlapCount(bound.get(i).proxyId);
							s--;
						}
					}
					i--;
				}
			}
		}
	}
	
	function _testOverlap(minX:Int, minY:Int, maxX:Int, maxY:Int, p:SAPProxy):Bool
	{
		//test x-axis
		if (minX > _boundX.get(p.maxX).value) return false;
		if (maxX < _boundX.get(p.minX).value) return false;
		
		//test y-axis
		if (minY > _boundY.get(p.maxY).value) return false;
		if (maxY < _boundY.get(p.minY).value) return false;
		
		return true;
	}
	
	function _swapBound(a:Bound, b:Bound):Void
	{
		var tmp = b.value;
		b.value = a.value;
		a.value = tmp;
		
		tmp = b.proxyId;
		b.proxyId = a.proxyId;
		a.proxyId = tmp;
		
		tmp = b.stabbingCount;
		b.stabbingCount = a.stabbingCount;
		a.stabbingCount = tmp;
	}
	
	override function _initHook():Void
	{
		_initProxyPool(SAPProxy);
		
		var dx = _bound.maxX - _bound.minX;
		var dy = _bound.maxY - _bound.minY;
		
		_xQuantizationFactor = 0xffff / dx;
		_yQuantizationFactor = 0xffff / dy;
		
		#if (flash && debug)
		var memory = flash.system.System.totalMemory;
		#end
		
		_maxProxies = _settings.maxProxies;
		_maxPairs = _settings.maxPairs;
		
		_queryResults = new Array<Int>();
		_tmpInterval = new QueryInterval();
		
		_queryResultCount = 0;
		_timeStamp = 1;
		
		var k = 2 * _maxProxies;
		_boundX = new DA<Bound>(k);
		_boundY = new DA<Bound>(k);
		_boundX.assign(Bound, [], k);
		_boundY.assign(Bound, [], k);
		
		#if (flash && debug)
		trace("SAP STATISTICS");
		trace("max proxies = " + _maxProxies);
		trace("memory = " + ((flash.system.System.totalMemory - memory) >> 10) + " KiB");
		#end
	}
	
	override function _initPairHandler():Void
	{
		_pairManager = new BufferedPairManager(_settings.maxPairs, _pairHandler, this, _settings.lazyPooling);
	}
}

private class SAPProxy extends Proxy
{
	public var minX:Int; public var maxX:Int;
	public var minY:Int; public var maxY:Int;
	
	public var overlapCount:Int;
	
	public var timeStamp:Int;
	
	public function new()
	{
		super();
		timeStamp = 0;
		overlapCount = 0xffff;
	}
	
	inline public function getNext():Int
	{
		return minX;
	}
	
	inline public function setNext(next:Int):Void
	{
		minX = next;
	}
}

private class Bound
{
	public var value:Int;
	public var proxyId:Int;
	public var stabbingCount:Int;
	
	public function new() {}
	
	inline public function isLower():Bool
	{
		return Mathematics.isEven(value) == true;
	}
	
	inline public function isUpper():Bool
	{
		return Mathematics.isEven(value) == false;
	}
	
	inline public function swap(b:Bound):Void
	{
		var tmp = value;
		value = b.value;
		b.value = tmp;
		
		var tmp = proxyId;
		proxyId = b.proxyId;
		b.proxyId = tmp;
		
		var tmp = stabbingCount;
		stabbingCount = b.stabbingCount;
		b.stabbingCount = tmp;
	}
}

private class BoundValues
{
	public var minX:Int; public var maxX:Int;
	public var minY:Int; public var maxY:Int;
	
	public function new() {}
}

private class QueryInterval
{
	public var lower:Int;
	public var upper:Int;
	
	public function new() {}
}