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

import de.polygonal.ds.DLL;
import de.polygonal.ds.DLLNode;
import de.polygonal.motor.collision.nbody.AbstractBroadPhase;
import de.polygonal.motor.collision.nbody.pair.PairHandler;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.geom.intersect.IntersectAABB;
import de.polygonal.motor.geom.primitive.AABB2;
import de.polygonal.motor.Settings;

class ExhaustiveSearch extends AbstractBroadPhase<ExhaustiveSearchProxy>
{
	var _proxyList:DLL<ExhaustiveSearchProxy>;
	
	public function new(pairHandler:PairHandler)
	{
		super(pairHandler);
		
		_proxyList = null;
	}
	
	override public function free():Void
	{
		if (!_isInitialized) return;
		
		for (proxy in _proxyList) proxy.node = null;
		_proxyList.free();
		_proxyList = null;
		
		super.free();
	}
	
	override public function createProxy(shape:AbstractShape):Int
	{
		var id = super.createProxy(shape);
		
		var proxy = _proxyPool.get(id);
		proxy.overlapCount = 0;
		proxy.node = _proxyList.append(proxy);
		
		return id;
	}
	
	override public function removeProxy(id:Int):Void
	{
		#if debug
		de.polygonal.core.util.Assert.assert(id != Proxy.NULL_PROXY, 'id != Proxy.NULL_PROXY');
		#end
		
		var proxy = _proxyPool.get(id);
		
		var shape = proxy.shape;
		var bound = shape.aabb;
		
		var minX = bound.minX, maxX = bound.maxX;
		var minY = bound.minY, maxY = bound.maxY;
		
		var node = _proxyList.head;
		while (node != null)
		{
			var p = node.val;
			
			if (p == proxy)
			{
				node = node.next;
				continue;
			}
			
			if (!IntersectAABB.test2(bound, p.shape.aabb))
			{
				node = node.next;
				continue;
			}
			
			if (_pairManager.removePair(id, p.id))
				--p.overlapCount;
			
			node = node.next;
		}
		
		proxy.node.unlink();
		
		super.removeProxy(id);
	}
	
	override public function update():Void
	{
		var node1 = _proxyList.head;
		while (node1 != null)
		{
			var p1 = node1.val;
			var bound1 = p1.shape.aabb;
			var node2 = node1.next;
			
			while (node2 != null)
			{
				var p2 = node2.val;
				var bound2 = p2.shape.aabb;
				if (IntersectAABB.test2(bound1, bound2))
				{
					if (_pairManager.addPair(p1.id, p2.id))
					{
						p1.overlapCount++;
						p2.overlapCount++;
					}
				}
				else
				{
					if (p1.overlapCount * p2.overlapCount > 0)
					{
						if (_pairManager.removePair(p1.id, p2.id))
						{
							p1.overlapCount--;
							p2.overlapCount--;
						}
					}
				}
				node2 = node2.next;
			}
			node1 = node1.next;
		}
	}
	
	override public function queryAABB(bound:AABB2, out:Array<AbstractShape>, maxCount:Int):Int
	{
		#if debug
		de.polygonal.core.util.Assert.assert(insideBound(bound), 'insideBound(bound)');
		#end
		
		var i = 0;
		var node = _proxyList.head;
		while (node != null)
		{
			var p = node.val;
			if (IntersectAABB.test2(bound, p.shape.aabb))
			{
				out.push(p.shape);
				if (++i == maxCount) break;
			}
			
			node = node.next;
		}
		
		return i;
	}
	
	override function _initHook():Void
	{
		_initProxyPool(ExhaustiveSearchProxy);
		_proxyList = new DLL<ExhaustiveSearchProxy>();
	}
}

private class ExhaustiveSearchProxy extends Proxy
{
	public var overlapCount:Int;
	public var node:DLLNode<ExhaustiveSearchProxy>;
	
	public function new()
	{
		super();
	}
}