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
import de.polygonal.motor.collision.nbody.AbstractBroadPhase;
import de.polygonal.motor.collision.nbody.pair.PairHandler;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.geom.primitive.AABB2;
import de.polygonal.motor.Settings;

class QuadTree extends AbstractBroadPhase<QuadTreeProxy>
{
	var _depth:Int;
	var _xScale:Float;
	var _yScale:Float;
	
	var _nodes:Array<QuadTreeNode>;
	
	#if flash10
	var _offsets:flash.Vector<Int>; 
	#else
	var _offsets:Array<Int>; 
	#end
	
	var _xOffset:Float;
	var _yOffset:Float;
	
	var _proxyList:QuadTreeProxy;
	
	public function new(pairHandler:PairHandler)
	{
		super(pairHandler);
		
		_depth = _settings.quadTreeDepth;
	}
	
	override public function free():Void
	{
		if (!_isInitialized) return;
		
		for (i in 0..._nodes.length)
		{
			var node = _nodes[i];
			node.parent = null;
			var p1 = node.proxyList;
			while (p1 != null)
			{
				var p0 = p1;
				p1 = p1.nextInNode;
				p0.prevInNode = null;
				p0.nextInNode = null;
			}
		}
		
		var p1 = _proxyList;
		while (p1 != null)
		{
			var p0 = p1;
			p1 = p1.nextInTree;
			p0.nextInTree = null;
			p0.prevInTree = null;
		}
		
		_proxyList = null;
		
		super.free();
	}
	
	override public function createProxy(shape:AbstractShape):Int
	{
		var id = super.createProxy(shape);
		var proxy = _proxyPool.get(id);
		
		proxy.nextInTree = _proxyList;
		if (_proxyList != null) _proxyList.prevInTree = proxy;
		_proxyList = proxy;
		
		//insert proxy into the tree
		_getNodeContaining(proxy).insert(proxy);
		_proxyCount++;
		
		return id;
	}
	
	override public function removeProxy(id:Int):Void
	{
		var p1 = _proxyPool.get(id);
		var p2:QuadTreeProxy;
		
		var s1 = p1.shape;
		var s2:AbstractShape;
		
		var a = s1.aabb;
		var minX = a.minX, maxX = a.maxX;
		var minY = a.minY, maxY = a.maxY;
		
		p2 = _proxyList;
		while (p2 != null)
		{
			if (p1 == p2)
			{
				p2 = p2.nextInTree;
				continue;
			}
			
			s2 = p2.shape;
			a = s2.aabb;
			if (minX > a.maxX || maxX < a.minX || minY > a.maxY || maxY < a.minY)
			{
				p2 = p2.nextInTree;
				continue;
			}
			
			if (_pairManager.removePair(p1.id, p2.id))
				--p2.overlapCount;
			
			p2 = p2.nextInTree;
		}
		
		//unlink from node
		p1.remove();
		
		//unlink from list
		if (p1.prevInTree != null) p1.prevInTree.nextInTree = p1.nextInTree;
		if (p1.nextInTree != null) p1.nextInTree.prevInTree = p1.prevInTree;
		if (p1 == _proxyList) _proxyList = p1.nextInTree;
		
		p1.reset();
		
		super.removeProxy(id);
	}
	
	override public function updateProxy(proxyId:Int):Void
	{
		//resolve proxy from id
		var proxy = _proxyPool.get(proxyId);
		var s = proxy.shape;
		
		//early out by comparing integer positions
		var x1 = Std.int(s.aabb.minX);
		var y1 = Std.int(s.aabb.minY);
		if (proxy.minX == x1 && proxy.minY == y1) return;
		
		//cache new value
		proxy.minX = x1;
		proxy.minY = y1;
		
		//compute new quad tree position
		var xl = _minX(s);
		var yt = _minY(s);
		
		var xr = xl ^ _maxX(s);
		var yr = yt ^ _maxY(s);
		
		var level = _depth;
		while (xr + yr != 0)
		{
			xr >>= 1;
			yr >>= 1;
			level--;
		}
		
		var shift = _depth - level;
		xl >>= shift;
		yt >>= shift;
		
		//early out by comparing node position inside tree
		if (xl == proxy.x && yt == proxy.y) return;
		
		//cache new value.
		proxy.x = xl;
		proxy.x = yt;
		
		//remove from old node, insert into new node
		proxy.remove();
		var node = proxy.node = _getNode(level, xl, yt);
		node.insert(proxy);
	}
	
	override public function update():Void
	{
		var node:QuadTreeNode;
		
		var p1:QuadTreeProxy = _proxyList;
		var p2:QuadTreeProxy;
		
		var s1:AbstractShape;
		var s2:AbstractShape;
		
		while (p1 != null)
		{
			s1 = p1.shape;
			
			var minX:Float = s1.aabb.minX; var maxX:Float = s1.aabb.maxX;
			var minY:Float = s1.aabb.minY; var maxY:Float = s1.aabb.maxY;
			
			//search contained node; brute-force
			p2 = p1.nextInNode;
			while (p2 != null)
			{
				s2 = p2.shape;
				
				//shapes separated ?
				if (minX > s2.aabb.maxX || maxX < s2.aabb.minX || minY > s2.aabb.maxY || maxY < s2.aabb.minY)
				{
					//remove pairs if the AABB's cease to overlap
					if (p1.overlapCount * p2.overlapCount > 0)
					{
						if (_pairManager.removePair(p1.id, p2.id))
						{
							--p1.overlapCount;
							--p2.overlapCount;
						}
					}
				}
				else
				{
					//create pairs if the AABB's start to overlap
					if (_pairManager.addPair(p1.id, p2.id))
					{
						++p1.overlapCount;
						++p2.overlapCount;
					}
				}
				
				p2 = p2.nextInNode;
			}
			
			//bubble up to root node
			node = p1.node.parent;
			while (node != null)
			{
				p2 = node.proxyList;
				while (p2 != null)
				{
					s2 = p2.shape;
					
					if (minX > s2.aabb.maxX || maxX < s2.aabb.minX || minY > s2.aabb.maxY || maxY < s2.aabb.minY)
					{
						//remove pairs if the aabb's cease to overlap
						if (p1.overlapCount * p2.overlapCount > 0)
						{
							if (_pairManager.removePair(p1.id, p2.id))
							{
								--p1.overlapCount;
								--p2.overlapCount;
							}
						}
					}
					else
					{
						//create pairs if the aabb's start to overlap
						if (_pairManager.addPair(p1.id, p2.id))
						{
							++p1.overlapCount;
							++p2.overlapCount;
						}
					}
					
					p2 = p2.nextInNode;
				}
				
				node = node.parent;
			}
			
			p1 = p1.nextInTree;
		}
	}
	
	override public function insideBound(bound:AABB2):Bool
	{
		if (bound.minX <  _bound.minX) return false;
		if (bound.maxX >= _bound.maxX) return false;
		if (bound.minY <  _bound.minY) return false;
		if (bound.maxY >= _bound.maxY) return false;
		return true;
	}
	
	override public function queryAABB(aabb:AABB2, out:Array<AbstractShape>, maxCount:Int):Int
	{
		var minX = aabb.minX;
		var maxX = aabb.maxX;
		var minY = aabb.minY;
		var maxY = aabb.maxY;
		
		var p = _proxyList;
		var i = 0;
		while (p != null)
		{
			var s = p.shape;
			if (s.aabb.minX > maxX || s.aabb.maxX < minX || s.aabb.minY > maxY || s.aabb.maxY < minY)
			{
				p = p.nextInTree;
				continue;
			}
			
			out.push(s);
			if (i++ == maxCount)
				break;
			
			p = p.nextInTree;
		}
		
		return i;
	}
	
	inline function _getNode(level:Int, x:Int, y:Int):QuadTreeNode
	{
		return _nodes[_offsets[level] + (y << (level - 1)) + x];
	}
	
	inline function _getNodeLevel(proxy:QuadTreeProxy):Int
	{
		var shape = proxy.shape;
		
		//XOR together the start and end positions on each axis
		var xr = _minX(shape) ^ _maxX(shape);
		var yr = _minY(shape) ^ _maxY(shape);
		
		//each bit in the result indicates that the range volume crosses
		//a point at the corresponding power of 2. the bit position of the
		//highest 1 bit indicates how many levels above the bottom of the
		//quadtree the range can first be properly placed.
		var level = _depth;
		
		//count highest bit position to get number of tree levels - bit position
		while (xr + yr != 0)
		{
			xr >>= 1;
			yr >>= 1;
			level--;
		}
		return level;
	}
	
	inline function _getNodeContaining(proxy:QuadTreeProxy):QuadTreeNode
	{
		var shape = proxy.shape;
		
		var xl = _minX(shape);
		var yt = _minY(shape);
		
		var xr = xl ^ _maxX(shape);
		var yr = yt ^ _maxY(shape);
		
		var level = _depth;
		while (xr + yr != 0)
		{
			xr >>= 1;
			yr >>= 1;
			level--;
		}
		
		//lookup node pointer in a 2D vector stored linearly, scale coordinates for quadtree level
		var shift = _depth - level;
		xl >>= shift;
		yt >>= shift;
		
		return _getNode(level, xl, yt);
	}
	
	inline function _minX(shape:AbstractShape):Int { return Std.int((shape.aabb.minX + _xOffset) * _xScale); }
	inline function _minY(shape:AbstractShape):Int { return Std.int((shape.aabb.minY + _yOffset) * _yScale); }
	inline function _maxX(shape:AbstractShape):Int { return Std.int((shape.aabb.maxX + _xOffset) * _xScale); }
	inline function _maxY(shape:AbstractShape):Int { return Std.int((shape.aabb.maxY + _yOffset) * _yScale); }
	
	override function _initHook():Void
	{
		_initProxyPool(QuadTreeProxy);
		for (proxy in _proxyPool) proxy.reset();
		
		var w = Std.int(_bound.maxX - _bound.minX);
		var h = Std.int(_bound.maxY - _bound.minY);
		
		_xOffset = _bound.minX < 0 ? -_bound.minX : 0;
		_yOffset = _bound.minY < 0 ? -_bound.minY : 0;
		
		#if (flash && debug)
		var memory = flash.system.System.totalMemory;
		#end
		
		//unscaled root node size
		var treeSize = 1 << (_depth - 1);
		
		//node scale factor
		_xScale = treeSize / w;
		_yScale = treeSize / h;
		
		//compute total number of nodes,
		//from lowest -> highest resolution
		var c = -1;
		for (i in 0..._depth) c += (1 << (i << 1));
		
		//create linear array for node storage
		_nodes = new Array<QuadTreeNode>();
		
		//depth offset into linear array, first element is unused
		#if flash10
		_offsets = new flash.Vector<Int>();
		#else
		_offsets = new Array<Int>();
		#end
		
		_offsets[0] = -1;
		
		//allocate nodes, from lowest -> highest resolution
		var offset = -1;
		for (i in 0..._depth)
		{
			var levelEdgeSize = 1 << i;
			
			//write level offset
			_offsets[i + 1] = offset + 1;
			
			#if debug
			//compute node size; for demo/debugging purpose only.
			var xsize = treeSize >> i;
			var ysize = xsize;
			xsize *= Std.int(w / treeSize);
			ysize *= Std.int(h / treeSize);
			#end
			
			for (y in 0...levelEdgeSize)
			{
				for (x in 0...levelEdgeSize)
				{
					//create and store node
					var node = new QuadTreeNode();
					var addr = (offset + 1) + (y * levelEdgeSize + x);
					_nodes[addr] = node;
					
					#if debug
					node.minX = Std.int(x * xsize + _bound.minX);
					node.minY = Std.int(y * ysize + _bound.minY);
					node.maxX = Std.int(node.minX + xsize);
					node.maxY = Std.int(node.minY + ysize);
					#end
				}
			}
			
			offset += (1 << (i << 1));
		}
		
		//setup parent pointer, go from highest -> lowest resolution
		var i = _depth;
		while (i > 1)
		{
			var levelEdgeSize = 1 << (i - 1);
			offset = _offsets[i];
			var parentOffset  = _offsets[i - 1];
			for (y in 0...levelEdgeSize)
			{
				for (x in 0...levelEdgeSize)
				{
					var addr0 = offset + y * levelEdgeSize + x;
					var addr1 = parentOffset + (y >> 1) * (levelEdgeSize >> 1) + (x >> 1);
					_nodes[addr0].parent = _nodes[addr1];
				}
			}
			i--;
		}
		
		#if (flash && debug)
		trace("QUADTREE STATISTICS:");
		trace("max proxies: %d ", _settings.maxProxies);
		trace("memory: %d KiB", ((flash.system.System.totalMemory - memory) >> 10));
		trace("depth: %d", _depth + 1);
		trace("unscaled tree size: %d", treeSize);
		trace("quad node scale: %.3f/%.3f", _xScale, _yScale);
		trace("root node size: %d/%d", w, h);
		trace("leaf node size: %.3f/%.3f", 1 / _xScale, 1 / _yScale);
		#end
	}
}

private class QuadTreeProxy extends Proxy
{
	public var nextInNode:QuadTreeProxy;
	public var prevInNode:QuadTreeProxy;
	
	public var nextInTree:QuadTreeProxy;
	public var prevInTree:QuadTreeProxy;
	
	public var node:QuadTreeNode;
	
	public var overlapCount:Int;
	
	/**
	 * The current node index.
	 */
	public var x:Int;
	public var y:Int;
	
	/**
	 * The current minimum shape bound.
	 */
	public var minX:Int;
	public var minY:Int;
	
	inline public function remove():Void
	{
		if (prevInNode != null) prevInNode.nextInNode = nextInNode;
		if (nextInNode != null) nextInNode.prevInNode = prevInNode;
		if (node.proxyList == this) node.proxyList = nextInNode;
		
		prevInNode = null;
		nextInNode = null;
		node = null;
	}
	
	public function reset():Void
	{
		nextInNode = null;
		prevInNode = null;
		nextInTree = null;
		prevInTree = null;
		node = null;
		
		x = Limits.INT32_MIN;
		y = Limits.INT32_MIN;
		minX = Limits.INT32_MIN;
		minY = Limits.INT32_MIN;
	}
}

private class QuadTreeNode
{
	public var parent:QuadTreeNode;
	public var proxyList:QuadTreeProxy;
	
	#if debug
	public var minX:Int; public var maxX:Int;
	public var minY:Int; public var maxY:Int;
	#end
	
	public function new()
	{
		parent = null;
		proxyList = null;
		
		#if debug
		minX = Limits.INT32_MAX; maxX = Limits.INT32_MIN;
		minY = Limits.INT32_MAX; maxY = Limits.INT32_MIN;
		#end
	}
	
	inline public function insert(proxy:QuadTreeProxy):Void
	{
		proxy.prevInNode = null;
		proxy.nextInNode = proxyList;
		if (proxyList != null) proxyList.prevInNode = proxy;
		proxyList = proxy;
		proxy.node = this;
	}
}