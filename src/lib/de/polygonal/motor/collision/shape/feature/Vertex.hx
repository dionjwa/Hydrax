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
package de.polygonal.motor.collision.shape.feature;

import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.math.Limits;
import de.polygonal.core.math.Vec2;
import de.polygonal.core.util.Assert;
import de.polygonal.ds.Bits;
import de.polygonal.ds.Cloneable;

using de.polygonal.ds.BitFlags;

class Vertex extends Vec2
{
	inline public static function of(src:Vertex):Vertex
	{
		return new Vertex(src.x, src.y);
	}
	
	public static function toArray(head:Vertex):Array<Vertex>
	{
		var v = head.getAt(0);
		var a = new Array<Vertex>();
		a.push(Vertex.of(v));
		v = v.next;
		while (!v.head)
		{
			a.push(Vertex.of(v));
			v = v.next;
		}
		return a;
	}
	
	public static function ofArray(data:Array<Vec2>):Vertex
	{
		var t = data[0];
		var l = new Vertex(t.x, t.y);
		l.head = true;
		
		var v, w = l, k = data.length;
		for (i in 1...k)
		{
			t = data[i];
			v = new Vertex(t.x, t.y);
			v.i = i;
			w.next = v;
			v.prev = w;
			w = v;
		}
		
		w.tail = true;
		w.i = k - 1;
		w.next = l;
		l.prev = w;
		return l;
	}
	
	public var next:Vertex;
	public var prev:Vertex;
	public var edge:Edge;
	
	var _bits:Int;
	
	public function new(?x = .0, ?y = .0)
	{
		super(x, y);
	}
	
	public function free():Void
	{
		var v = this;
		var w = this;
		
		do
		{
			var t = v.next;
			v.next = null;
			v.prev = null;
			
			if (v.edge != null)
			{
				v.edge.free();
				v.edge = null;
			}
			v = t;
		}
		while (v != w);
		
		prev = null;
		next = null;
		edge = null;
	}
	
	public var size(_sizeGetter, never):Int;
	inline function _sizeGetter():Int { return getAt(0).prev.i + 1; }
	
	public var head(_headGetter, _headSetter):Bool;
	inline function _headGetter():Bool { return hasf(Bits.BIT_30); }
	inline function _headSetter(x:Bool):Bool { setf(Bits.BIT_30); i = 0; return x; }
	
	public var tail(_tailGetter, _tailSetter):Bool;
	inline function _tailGetter():Bool { return hasf(Bits.BIT_31); }
	inline function _tailSetter(x:Bool):Bool { setf(Bits.BIT_31); return x; }
	
	public var i(_iGetter, _iSetter):Int;
	inline function _iGetter():Int { return _bits & 0x0000ffff; }
	inline function _iSetter(x:Int):Int
	{
		#if debug
		de.polygonal.core.util.Assert.assert(x >= 0, "x >= 0");
		de.polygonal.core.util.Assert.assert(x < Limits.UINT16_MAX, "x < Limits.UINT16_MAX");
		#end
		
		_bits |= x;
		return x;
	}
	
	inline public function getAt(i:Int):Vertex
	{
		#if debug
		de.polygonal.core.util.Assert.assert(i >= 0, "i >= 0");
		#end
		
		var v = this;
		while (v.i != i) v = v.next;
		return v;
	}
	
	inline public function iterator():Iterator<Vertex>
	{
		return new VertexIterator(this);
	}
	
	override public function toString():String
	{
		return Sprintf.format("{Vertex x=%.3f y=%.3f i=%d size=%d}", [x, y, i, size]);
	}
}

private class VertexIterator
{
	var _v:Vertex;
	var _i:Int;
	var _c:Int;
	
	public function new(v:Vertex)
	{
		_v = v.getAt(0);
		_c = _v.prev.i + 1;
		_i = 0;
	}

	public function hasNext():Bool
	{
		return _i < _c;
	}
	
	public function next():Vertex
	{
		_i++;
		var t = _v;
		_v = _v.next;
		return t;
	}
}