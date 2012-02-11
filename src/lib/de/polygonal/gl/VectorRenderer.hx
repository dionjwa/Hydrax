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
package de.polygonal.gl;

import de.polygonal.core.math.Limits;
import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.Vec2;
import de.polygonal.core.util.Assert;
import de.polygonal.ds.mem.ByteMemory;
import de.polygonal.ds.mem.FloatMemory;
import de.polygonal.ds.mem.ShortMemory;
import de.polygonal.ds.pooling.ObjectPool;
import de.polygonal.motor.geom.primitive.AABB2;
import de.polygonal.motor.geom.primitive.OBB2;
import de.polygonal.motor.geom.primitive.Plane2;
import de.polygonal.motor.geom.primitive.Poly2;
import de.polygonal.motor.geom.primitive.Sphere2;

#if flash
import flash.display.Graphics;
import flash.display.GraphicsEndFill;
import flash.display.GraphicsPath;
import flash.display.GraphicsPathWinding;
import flash.display.GraphicsSolidFill;
import flash.display.GraphicsStroke;
import flash.display.IGraphicsData;
#end

using de.polygonal.core.math.Mathematics;
using de.polygonal.gl.color.RGB;

/**
 * A fast vector rendering system using the FP10 drawing API.
 * Supports among other things: lines, triangles, AABBs, quads, circles, arcs, wedges, cubic b&eacute;zier curves.
 */
class VectorRenderer
{
	public var style(default, null):VectorStyle;
	
	#if flash10
	var _buffer:flash.Vector<IGraphicsData>;
	#elseif js
	var _buffer:Array<Dynamic>;
	#end
	
	var _db:FloatMemory;	//data buffer
	var _cb:ByteMemory;		//command buffer
	var _di:Int; 			//data index
	var _ci:Int; 			//command index
	
	#if flash10
	var _pool:Pool<VectorNode>;
	var _strokePool:Pool<GraphicsStroke>;
	var _solidFillPool:Pool<GraphicsSolidFill>;
	var _endFillPool:Pool<GraphicsEndFill>;
	
	var _winding:GraphicsPathWinding;
	#end
	
	#if !alchemy
	var _pi0:Int;
	var _tmpStack:Array<Float>;
	#end
	
	#if debug
	var _fill:Bool;
	#end
	
	/**
	 * @param cacheKiB The cache size in kibibytes.
	 * A cache size of 1024 KiB is suitable for caching ~130000 points in single precision. Default is 1 MiB.
	 * @param poolSize Improves performance by pooling a total of <i>poolSize</i> Vector/GraphicsPath objects.
	 * Default is 0 (pooling disabled).
	 */
	public function new(?cacheKiB = 1024, ?poolSize = 0)
	{
		style          = new VectorStyle();
		#if flash
		_buffer        = new flash.Vector<IGraphicsData>();
		_winding       = GraphicsPathWinding.NON_ZERO;
		#end
		_db            = new FloatMemory(cacheKiB << 8, "VectorRenderer._db");
		_cb            = new ByteMemory(cacheKiB << 7, "VectorRenderer._cb");
		_di            = 0;
		_ci            = 0;
		#if flash
		_pool          = new Pool<VectorNode>(poolSize, VectorNode);
		_strokePool    = new Pool<GraphicsStroke>(poolSize, GraphicsStroke);
		_solidFillPool = new Pool<GraphicsSolidFill>(poolSize, GraphicsSolidFill);
		_endFillPool   = new Pool<GraphicsEndFill>(poolSize, GraphicsEndFill);
		#end
		
		#if !alchemy
		_tmpStack = new Array<Float>();
		#end
		
		#if js
		_buffer = new Array();
		#end
	}
	
	/** Deallocates alchemy memory. */
	public function free():Void
	{
		#if flash
		flush(null);
		
		style.free();
		_db.free();
		_cb.free();
		_pool.free();
		_strokePool.free();
		_solidFillPool.free();
		_endFillPool.free();
		
		_buffer        = null;
		style          = null;
		_winding       = null;
		_pool          = null;
		_strokePool    = null;
		_solidFillPool = null;
		_endFillPool   = null;
		#end
	}
	
	/**
	 * Sends the accumulated data in one shot to the renderer, which in turn draws the data to
	 * the specified <i>gl</i> object. Passing <i>null</i> just clears the buffer without
	 * drawing anything.
	 */
	#if flash10
	public function flush(graphics:Graphics):Void
	{
		_flushCache();
		
		if (graphics != null)
		{
			graphics.clear();
			graphics.drawGraphicsData(_buffer);
		}
		
		_buffer.length = 0;
		_pool.fill();
		_strokePool.fill();
		_solidFillPool.fill();
		_endFillPool.fill();
	}
	#elseif js
	var _context:Dynamic;
	public function flush(context:Dynamic):Void
	{
		for (i in _buffer)
		{
			if (Std.is(i, LineStyle))
			{
				var s:LineStyle = cast i;
				var c = s.rgb;
				context.strokStyle = "(" + c.getR() + "," + c.getG() + "," + c.getB() + ")";
			}
			else
			if(Std.is(i, PathData))
			{
				var p:PathData = cast i;
				
				context.beginPath();
				
				//for each command
				var di = p.di;
				
				for (j in p.ci...p.ci + p.k)
				{
					var command = _cb.get(j);
					
					switch (command)
					{
						case 1:
							var x = _db.get(di++);
							var y = _db.get(di++);
							
							x += .5;
							y += .5;
							
							context.moveTo(x, y);
							trace("move To ", x, y);
						
						case 2:
							var x = _db.get(di++);
							var y = _db.get(di++);
							
							x += .5;
							y += .5;
							
							context.lineTo(x, y);
							trace("line To ", x, y);
						
					}
				}
			}
		}
		context.closePath();
		context.stroke();
	}
	#end
	
	/**
	 * Applies the line style defined in the <i>style</i> property.<br/>
	 * Example:
	 * <pre>
	 * var vr = new VectorRenderer();
	 * vr.style.lineColor = 0xFF0000;
	 * vr.style.lineThickness = 2;
	 * vr.style.lineAlpha = 1.0;
	 * vr.applyLineStyle();
	 * </pre>
	 */
	inline public function applyLineStyle():Void
	{
		_flushCache();
		
		#if flash
		_buffer.push(_getStroke());
		#end
	}
	
	/**
	 * Wrapper for <i>style.setLineColor()</i>. The style is immediately applied by calling applyLineStyle().
	 * @param rgb The line color.
	 * @param alpha The line alpha [0,1].
	 * @param thickness The line thickness.
	 */
	public function setLineStyle(rgb = 0, alpha = 1., thickness = .0):Void
	{
		#if flash
		style.lineColor = rgb;
		style.lineAlpha = alpha;
		style.lineThickness = thickness;
		applyLineStyle();
		#elseif js
		var style = new LineStyle();
		style.rgb = rgb;
		_buffer.push(style);
		trace("add style");
		#end
	}
	
	/**
	 * Wrapper for <i>style.clearStroke()</i>.
	 * The stroke is immediately cleared by calling <i>applyLineStyle()</i>.
	 */
	inline public function clearStroke():Void
	{
		if (!Math.isNaN(style.lineThickness))
		{
			style.lineThickness = Mathematics.NaN;
			applyLineStyle();
		}
	}
	
	/**
	 * Wrapper for <i>style.setFillColor()</i>.
	 * Defining a fill style has no effect until fillStart() is called.
	 * @param rgb The fill color.
	 * @param alpha The fill alpha.
	 */
	inline public function setFillColor(?rgb = 0, ?alpha = 1.):Void
	{
		style.fillColor = rgb;
		style.fillAlpha = alpha;
	}
	
	/** Defines a one-color fill that subsequent calls (to the drawing methods of the VectorRenderer) use when drawing. */
	inline public function fillStart():Void
	{
		#if debug
		_fill = true;
		#end
		
		_flushCache();
		
		#if flash
		var fill = _solidFillPool.next();
		fill.alpha = style.fillAlpha;
		fill.color = style.fillColor;
		
		_buffer.push(fill);
		#end
	}

	/** Applies a one-color fill to the previous shapes drawn since the invocation of <i>fillStart()</i>. */
	inline public function fillEnd():Void
	{
		#if debug
		de.polygonal.core.util.Assert.assert(_fill, "fillStart() was not called");
		_fill = false;
		#end
		
		_flushCache();
		
		#if flash
		_buffer.push(_endFillPool.next());
		#end
	}
	
	/** 
	 * Specifies the rule for filling the areas created by shape intersection/overlap.
	 * Default is flash.display.GraphicsPathWinding.NON_ZERO;
	 */
	#if flash10
	 inline public function setWinding(x:GraphicsPathWinding):Void
	{
		_winding = x;
		_flushCache();
	}
	#end
	
	/** Moves the 'pen' to <i>p</i>. */
	inline public function moveTo(p:Vec2):Void
	{
		moveTo2(p.x, p.y);
	}
	
	/** Moves the 'pen' to (<i>x</i>,<i>y</i>). */
	inline public function moveTo2(x:Float, y:Float):Void
	{
		var o = _posf(2);
		_setf(o + (0 << 2), x);
		_setf(o + (1 << 2), y);
		o = _posb(1);
		_setb(o, 1);
	}
	
	/** Draws a line segment from the current position to <i>p</i>. */
	inline public function lineTo(p:Vec2):Void
	{
		lineTo2(p.x, p.y);
	}
	
	/** Draws a line segment from the current position to (<i>x</i>,<i>y</i>). */
	inline public function lineTo2(x:Float, y:Float):Void
	{
		var o = _posf(2);
		_setf(o + (0 << 2), x);
		_setf(o + (1 << 2), y);
		o = _posb(1);
		_setb(o, 2);
	}
	
	/** Draws a line segment from <i>a</i> to <i>b</i>. */
	inline public function line2(a:Vec2, b:Vec2):Void
	{
		line4(a.x, a.y, b.x, b.y);
	}
	
	/** Draws a line segment from (<i>ax,ay</i>) to (<i>bx,by</i>). */
	inline public function line4(ax:Float, ay:Float, bx:Float, by:Float):Void
	{
		var o = _posf(4);
		_setf(o + (0 << 2), ax);
		_setf(o + (1 << 2), ay);
		_setf(o + (2 << 2), bx);
		_setf(o + (3 << 2), by);
		o = _posb(2);
		_setb(o + 0, 1);
		_setb(o + 1, 2);
	}
	
	/** Draws a triangle through the points <i>a</i>, <i>b</i> and <i>c</i>. */
	inline public function tri3(a:Vec2, b:Vec2, c:Vec2):Void
	{
		tri6(a.x, a.y, b.x, b.y, c.x, c.y);
	}
	
	/** Draws a triangle through the points (<i>ax,ay</i>), (<i>bx,by</i>) and (<i>cx,cy</i>). */
	inline public function tri6(ax:Float, ay:Float, bx:Float, by:Float, cx:Float, cy:Float):Void
	{
		var o = _posf(8);
		_setf(o + (0 << 2), ax);
		_setf(o + (1 << 2), ay);
		_setf(o + (2 << 2), bx);
		_setf(o + (3 << 2), by);
		_setf(o + (4 << 2), cx);
		_setf(o + (5 << 2), cy);
		_setf(o + (6 << 2), ax);
		_setf(o + (7 << 2), ay);
		o = _posb(4);
		_setb(o + 0, 1);
		_setb(o + 1, 2);
		_setb(o + 2, 2);
		_setb(o + 3, 2);
	}
	
	/** Draws a square box with center <i>c</i> and half-width extents <i>e</i>. */
	inline public function box2(c:Vec2, e:Float):Void
	{
		box3(c.x, c.y, e);
	}
	
	/** Draws a square box with center (<i>x,y</i>) and half-width extents <i>e</i>. */
	inline public function box3(x:Float, y:Float, e:Float):Void
	{
		quad8(x - e, y - e, x + e, y - e, x + e, y + e, x - e, y + e);
	}
	
	/** Draws a rectangle with center <i>c</i> and half-width extents <i>e</i>. */
	inline public function rect2(c:Vec2, e:Vec2):Void
	{
		rect4(c.x, c.y, e.x, e.y);
	}
	
	/** Draws a rectangle with center (<i>x,y</i>) and half-width extents <i>e</i>. */
	inline public function rect4(x:Float, y:Float, ex:Float, ey:Float):Void
	{
		quad8(x - ex, y - ey, x + ex, y - ey, x + ex, y + ey, x - ex, y + ey);
	}

	/** Draws a quad through the points <i>a, b, c</i> and <i>d</i>. */
	inline public function quad4(a:Vec2, b:Vec2, c:Vec2, d:Vec2):Void
	{
		quad8(a.x, a.y, b.x, b.y, c.x, c.y, d.x, d.y);
	}
	
	/** Draws a quad through the points (<i>ax,ay</i>), (<i>bx,by</i>), (<i>cx,cy</i>) and (<i>dx,dy</i>). */
	inline public function quad8(ax:Float, ay:Float, bx:Float, by:Float, cx:Float, cy:Float, dx:Float, dy:Float):Void
	{
		var o = _posf(10);
		_setf(o + (0 << 2), ax);
		_setf(o + (1 << 2), ay);
		_setf(o + (2 << 2), bx);
		_setf(o + (3 << 2), by);
		_setf(o + (4 << 2), cx);
		_setf(o + (5 << 2), cy);
		_setf(o + (6 << 2), dx);
		_setf(o + (7 << 2), dy);
		_setf(o + (8 << 2), ax);
		_setf(o + (9 << 2), ay);
		o = _posb(5);
		_setb(o + 0, 1);
		_setb(o + 1, 2);
		_setb(o + 2, 2);
		_setb(o + 3, 2);
		_setb(o + 4, 2);
		
		//data[i + 0] = ax;
		//data[i + 1] = ay;
		//data[i + 2] = bx;
		//data[i + 3] = by;
		//data[i + 4] = cx;
		//data[i + 5] = cy;
		//data[i + 6] = dx;
		//data[i + 7] = dy;
		//data[i + 8] = ax;
		//data[i + 9] = ay;
		//
		//command[i + 0] = 1;
		//command[i + 1] = 2;
		//command[i + 2] = 2;
		//command[i + 3] = 2;
		//command[i + 4] = 2;
	}
	
	/** Draws a circle. */
	inline public function circle(s:Sphere2):Void
	{
		circle2(s.c, s.r);
	}
	
	/** Draws a circle with center <i>c</i> and radius <i>r</i>. */
	inline public function circle2(c:Vec2, r:Float):Void
	{
		circle3(c.x, c.y, r);
	}
	
	/** Draws a circle with center (<i>x,y</i>) and radius <i>r</i>. */
	public function circle3(x:Float, y:Float, r:Float):Void
	{
		var t0 = r * .2928932188;
		var t1 = -t0;
		var t2 = r * .4142135624;
		var t3 = -t2;
		var t4 = r * .7071067812;
		var t5 = -t4;
		
		var o = _posf(34);
		_setf(o + ( 0 << 2), x + r);
		_setf(o + ( 1 << 2), y);
		_setf(o + ( 2 << 2), t4 + t0 + x);
		_setf(o + ( 3 << 2), t4 + t1 + y);
		_setf(o + ( 4 << 2), t4 + x);
		_setf(o + ( 5 << 2), t4 + y);
		_setf(o + ( 6 << 2), t2 + x);
		_setf(o + ( 7 << 2), r + y);
		_setf(o + ( 8 << 2), x);
		_setf(o + ( 9 << 2), r + y);
		_setf(o + (10 << 2), t5 + t0 + x);
		_setf(o + (11 << 2), t4 + t0 + y);
		_setf(o + (12 << 2), t5 + x);
		_setf(o + (13 << 2), t4 + y);
		_setf(o + (14 << 2), -r + x);
		_setf(o + (15 << 2), t2 + y);
		_setf(o + (16 << 2), -r + x);
		_setf(o + (17 << 2), y);
		_setf(o + (18 << 2), t5 + t1 + x);
		_setf(o + (19 << 2), t5 + t0 + y);
		_setf(o + (20 << 2), t5 + x);
		_setf(o + (21 << 2), t5 + y);
		_setf(o + (22 << 2), t3 + x);
		_setf(o + (23 << 2), -r + y);
		_setf(o + (24 << 2), x);
		_setf(o + (25 << 2), -r + y);
		_setf(o + (26 << 2), t4 + t1 + x);
		_setf(o + (27 << 2), t5 + t1 + y);
		_setf(o + (28 << 2), t4 + x);
		_setf(o + (29 << 2), t5 + y);
		_setf(o + (30 << 2), r + x);
		_setf(o + (31 << 2), t3 + y);
		_setf(o + (32 << 2), r + x);
		_setf(o + (33 << 2), y);
		o = _posb(9);
		_setb(o + 0, 1);
		_setb(o + 1, 3);
		_setb(o + 2, 3);
		_setb(o + 3, 3);
		_setb(o + 4, 3);
		_setb(o + 5, 3);
		_setb(o + 6, 3);
		_setb(o + 7, 3);
		_setb(o + 8, 3);
	}
	
	/** Draws a circle segment with center <i>c</i>, radius <i>r</i>, from <i>angle0</i> to <i>angle1</i>. */
	inline public function arc4(c:Vec2, angle0:Float, angle1:Float, r:Float, ?resume = false):Void
	{
		arc5(c.x, c.y, angle0, angle1, r, resume);
	}
	
	/** Draws a circle segment centered at (<i>x</i>,<i>y</i>), radius <i>r</i>, from <i>angle0</i> to <i>angle1</i>. */
	inline public function arc5(x:Float, y:Float, angle0:Float, angle1:Float, r:Float, ?resume = false):Void
	{
		var a0;
		var a1;
		
		if (angle0 > angle1)
		{
			a0 = angle1;
			a1 = angle0;
		}
		else
		{
			a0 = angle0;
			a1 = angle1;
		}
		
		var diff = a1 - a0;
		var k = ((diff * (4.0 / Mathematics.PI)).fabs()).ceil();
		var arc = diff / k;
		var a2 = a0.wrapToPI();
		var sin = Math.sin(a2);
		var cos = Math.cos(a2);
		
		var px = r * cos;
		var py = r * sin;
		var qx = .0;
		var qy = .0;
		
		var p0x = x + px;
		var p0y = y + py;
		
		var p = _posf(k * 4 + (resume ? 0 : 2));
		var c = _posb(k + (resume ? 0 : 1));
		
		if (!resume)
		{
			_setf(p + 0, p0x);
			_setf(p + 4, p0y);
			_setb(c++, 1);
			p += 8;
		}
		
		for (i in 0...k)
		{
			a0 += arc;
			a2 = a0.wrapToPI();
			sin = Math.sin(a2);
			cos = Math.cos(a2);
			
			qx = r * cos;
			qy = r * sin;
			
			var p2x = x + qx;
			var p2y = y + qy;
			
			var dx = (px + qx) * 1. / r;
			var dy = (py + qy) * 1. / r;
			var d  = (dx * dx + dy * dy).invSqrt();
			dx *= d;
			dy *= d;
			
			var p1x = x + r * dx;
			var p1y = y + r * dy;
			
			var cx = 2.0 * p1x - .5 * (p0x + p2x);
			var cy = 2.0 * p1y - .5 * (p0y + p2y);
			
			_setf(p +  0, cx);
			_setf(p +  4, cy);
			_setf(p +  8, p2x);
			_setf(p + 12, p2y);
			_setb(c++, 3);
			p += 16;
			
			p0x = p2x;
			p0y = p2y;
			px  = qx;
			py  = qy;
		}
	}
	
	/** Draws a wedge with center <i>c</i>, radius <i>r</i>, from <i>angle0</i> to <i>angle1</i>. */
	inline public function wedge4(c:Vec2, angle0:Float, angle1:Float, r:Float):Void
	{
		wedge5(c.x, c.y, angle0, angle1, r);
	}
	
	/** Draws a wedge with centered at (<i>x</i>,<i>y</i>),  radius <i>r</i>, from <i>angle0</i> to <i>angle1</i>. */
	inline public function wedge5(x:Float, y:Float, angle0:Float, angle1:Float, r:Float):Void
	{
		var a0;
		var a1;
		
		if (angle0 > angle1)
		{
			a0 = angle1;
			a1 = angle0;
		}
		else
		{
			a0 = angle0;
			a1 = angle1;
		}
		
		var diff = a1 - a0;
		var k = ((diff * (4. / Mathematics.PI)).fabs()).ceil();
		var arc = diff / k;
		var a2 = a0.wrapToPI();
		var sin = Math.sin(a2);
		var cos = Math.cos(a2);
		
		var px = r * cos;
		var py = r * sin;
		var qx = .0;
		var qy = .0;
		
		var p0x = x + px;
		var p0y = y + py;
		
		var p = _posf(k * 4 + 6);
		var c = _posb(k + 3);
		_setf(p +  0, x);
		_setf(p +  4, y);
		_setf(p +  8, p0x);
		_setf(p + 12, p0y);
		_setb(c + 0, 1);
		_setb(c + 1, 2);
		p += 16;
		c += 2;
		
		for (i in 0...k)
		{
			a0 += arc;
			a2 = a0.wrapToPI();
			sin = Math.sin(a2);
			cos = Math.cos(a2);
			
			qx = r * cos;
			qy = r * sin;
			
			var p2x = x + qx;
			var p2y = y + qy;
			
			var dx = (px + qx) * 1. / r;
			var dy = (py + qy) * 1. / r;
			var d  = (dx * dx + dy * dy).invSqrt();
			dx *= d;
			dy *= d;
			
			var p1x = x + r * dx;
			var p1y = y + r * dy;
			
			var cx = 2. * p1x - .5 * (p0x + p2x);
			var cy = 2. * p1y - .5 * (p0y + p2y);
			
			_setf(p +  0, cx);
			_setf(p +  4, cy);
			_setf(p +  8, p2x);
			_setf(p + 12, p2y);
			_setb(c++, 3);
			p += 16;
			
			p0x = p2x;
			p0y = p2y;
			px  = qx;
			py  = qy;
		}
		
		_setf(p + 0, x);
		_setf(p + 4, y);
		_setb(c++, 2);
	}
	
	/** Draws a swept-sphere line (SLL) from <i>a</i> to <i>b</i> with radius <i>r</i> */
	inline public function ssl3(a:Vec2, b:Vec2, r:Float):Void
	{
		ssl5(a.x, a.y, b.x, b.y, r);
	}
	
	/** Draws a swept-sphere line (SLL) from (<i>ax</i>,<i>ay</i>) to (<i>bx</i>,<i>by</i>) with radius <i>r</i> */
	inline public function ssl5(ax:Float, ay:Float, bx:Float, by:Float, r:Float):Void
	{
		var dx = bx - ax;
		var dy = by - ay;
		var l = 1 / Math.sqrt(dx * dx + dy * dy);
		dx *= l;
		dy *= l;
		
		line4(ax, ay, bx, by);
		
		moveTo2(ax + dy * r, ay - dx * r);
		lineTo2(bx + dy * r, by - dx * r);
		
		var angle0 = Math.atan2(dy, dx);
		arc5(bx, by, angle0 - Mathematics.PIHALF, angle0 + Mathematics.PIHALF, r, true);
		
		lineTo2(ax - dy * r, ay + dx * r);
		
		arc5(ax, ay, angle0 - Mathematics.PIHALF + Mathematics.PI, angle0 + Mathematics.PIHALF + Mathematics.PI, r, true);
	}
	
	/** Draws a swept-sphere rectangle (SSR) with center <i>c</i>, half-width extents <i>e</i> and radius <i>r</i>. */
	inline public function ssr3(c:Vec2, e:Vec2, r:Float):Void
	{
		ssr5(c.x, c.y, e.x, e.y, r);
	}
	
	/** Draws a swept-sphere rectangle (SSR) with center (<i>cx</i>,<i>cy</i>), half-width extents (<i>ex</i>,<i>ey</i>) and radius <i>r</i>. */
	inline public function ssr5(cx:Float, cy:Float, ex:Float, ey:Float, r:Float):Void
	{
		moveTo2(cx - ex, cy - ey - r);
		lineTo2(cx + ex, cy - ey - r);
		arc5(cx + ex, cy - ey, -Mathematics.PIHALF, 0, r, true);
		lineTo2(cx + ex + r, cy + ey);
		arc5(cx + ex, cy + ey, 0, Mathematics.PIHALF, r, true);
		lineTo2(cx - ex, cy + ey + r);
		arc5(cx - ex, cy + ey, Mathematics.PIHALF, Mathematics.PI, r, true);
		lineTo2(cx - ex - r, cy - ey);
		arc5(cx - ex, cy - ey, -Mathematics.PIHALF, -Mathematics.PI, r);
	}
	
	/** Draws a swept-sphere polygon (SSP) through the points specified in <i>vertexList</i> and with radius <i>r</i>. */
	inline public function ssp(vertexList:Array<Vec2>, r:Float):Void
	{
		var k = vertexList.length;
		
		var m = Math;
		for (i1 in 0...k)
		{
			var i0 = (i1 - 1) < 0 ? k - 1 : i1 - 1;
			var i2 = (i1 + 1) % k;
			
			var a = vertexList[i0];
			var b = vertexList[i1];
			var c = vertexList[i2];
			
			var bx = b.x, cx = c.x;
			var by = b.y, cy = c.y;
			
			var dx1 = bx - a.x;
			var dy1 = by - a.y;
			var dx2 = cx - bx;
			var dy2 = cy - by;
			
			var len = m.sqrt(dx2 * dx2 + dy2 * dy2);
			dx2 /= len;
			dy2 /= len;
			
			var a1 = m.atan2(-dx1, dy1);
			var a2 = m.atan2(-dx2, dy2);
			if (a1 > a2) a2 += Mathematics.PI2;
			
			arc5(bx, by, a1, a2, r, i1 > 0);
			lineTo2(cx + dy2 * r, cy - dx2 * r);
		}
	}

	/**
	 * Draws a cubic b&eacute;zier curve defined by <i>a, b, c</i> and <i>d</i>. If <i>threshold</i>
	 * is zero or negative, the curve is approximated using only two line segments.
	 * If <i>threshold</i> is positive, the curve is subdivided until the <i>threshold</i> criteria
	 * is met.
	 **/
	inline public function bezier4(a:Vec2, b:Vec2, c:Vec2, d:Vec2, threshold:Float):Void
	{
		bezier8(a.x, a.y, b.x, b.y, c.x, c.y, d.x, d.y, threshold);
	}
	
	/** Draws a cubic b&eacute;zier curve defined by <i>a=(x0,y0)</i>, <i>b=(x1,y1)</i>, <i>c=(x2,y2)</i> and <i>d=(x3,y3)</i>. */
	public function bezier8(x0:Float, y0:Float, x1:Float, y1:Float, x2:Float, y2:Float, x3:Float, y3:Float, ?threshold = .01):Void
	{
		if (threshold <= .0)
		{
			var px = .125 * x0 + .375 * x1 + 1.5 * .25 * x2 + .125 * x3;
			var py = .125 * y0 + .375 * y1 + 1.5 * .25 * y2 + .125 * y3;
			
			var o = _posf(4);
			_setf(o + (0 << 2), px);
			_setf(o + (1 << 2), py);
			_setf(o + (2 << 2), x3);
			_setf(o + (3 << 2), y3);
			o = _posb(2);
			_setb(o + 0, 2);
			_setb(o + 1, 2);
		}
		else
		{
			var x12   = .5 * (  x0 +   x1);
			var y12   = .5 * (  y0 +   y1);
			var x23   = .5 * (  x1 +   x2);
			var y23   = .5 * (  y1 +   y2);
			var x34   = .5 * (  x2 +   x3);
			var y34   = .5 * (  y2 +   y3);
			var x123  = .5 * ( x12 +  x23);
			var y123  = .5 * ( y12 +  y23);
			var x234  = .5 * ( x23 +  x34);
			var y234  = .5 * ( y23 +  y34);
			var x1234 = .5 * (x123 + x234);
			var y1234 = .5 * (y123 + y234);
			var dx = x3 - x0;
			var dy = y3 - y0;
			var d2 = (((x1 - x3) * dy - (y1 - y3) * dx)).fabs();
			var d3 = (((x2 - x3) * dy - (y2 - y3) * dx)).fabs();
			
			if ((d2 + d3) * (d2 + d3) < threshold * (dx * dx + dy * dy))
			{
				var o = _posf(4);
				_setf(o + (0 << 2), x1234);
				_setf(o + (1 << 2), y1234);
				_setf(o + (2 << 2), x3);
				_setf(o + (3 << 2), y3);
				o = _posb(2);
				_setb(o + 0, 2);
				_setb(o + 1, 2);
			}
			else
			{
				#if alchemy
				_setf( 8 << 2, x0);
				_setf( 9 << 2, y0);
				_setf(10 << 2, x12);
				_setf(11 << 2, y12);
				_setf(12 << 2, x123);
				_setf(13 << 2, y123);
				_setf(14 << 2, x1234);
				_setf(15 << 2, y1234);
				_setf( 0 << 2, x1234);
				_setf( 1 << 2, y1234);
				_setf( 2 << 2, x234);
				_setf( 3 << 2, y234);
				_setf( 4 << 2, x34);
				_setf( 5 << 2, y34);
				_setf( 6 << 2, x3);
				_setf( 7 << 2, y3);
				var k = 64;
				#else
				_tmpStack[ 8] = x0;
				_tmpStack[ 9] = y0;
				_tmpStack[10] = x12;
				_tmpStack[11] = y12;
				_tmpStack[12] = x123;
				_tmpStack[13] = y123;
				_tmpStack[14] = x1234;
				_tmpStack[15] = y1234;
				_tmpStack[ 0] = x1234;
				_tmpStack[ 1] = y1234;
				_tmpStack[ 2] = x234;
				_tmpStack[ 3] = y234;
				_tmpStack[ 4] = x34;
				_tmpStack[ 5] = y34;
				_tmpStack[ 6] = x3;
				_tmpStack[ 7] = y3;
				var k = 16;
				#end
				
				while (k > 0)
				{
					#if alchemy
					var x0 = flash.Memory.getFloat(k - (8 << 2));
					var y0 = flash.Memory.getFloat(k - (7 << 2));
					var x1 = flash.Memory.getFloat(k - (6 << 2));
					var y1 = flash.Memory.getFloat(k - (5 << 2));
					var x2 = flash.Memory.getFloat(k - (4 << 2));
					var y2 = flash.Memory.getFloat(k - (3 << 2));
					var x3 = flash.Memory.getFloat(k - (2 << 2));
					var y3 = flash.Memory.getFloat(k - (1 << 2));
					k -= 32;
					#else
					var x0 = _tmpStack[k - 8];
					var y0 = _tmpStack[k - 7];
					var x1 = _tmpStack[k - 6];
					var y1 = _tmpStack[k - 5];
					var x2 = _tmpStack[k - 4];
					var y2 = _tmpStack[k - 3];
					var x3 = _tmpStack[k - 2];
					var y3 = _tmpStack[k - 1];
					k -= 8;
					#end
					
					var x12   = .5 * (x0 + x1);
					var y12   = .5 * (y0 + y1);
					var x23   = .5 * (x1 + x2);
					var y23   = .5 * (y1 + y2);
					var x34   = .5 * (x2 + x3);
					var y34   = .5 * (y2 + y3);
					var x123  = .5 * (x12 + x23);
					var y123  = .5 * (y12 + y23);
					var x234  = .5 * (x23 + x34);
					var y234  = .5 * (y23 + y34);
					var x1234 = .5 * (x123 + x234);
					var y1234 = .5 * (y123 + y234);
					var dx = x3 - x0;
					var dy = y3 - y0;
					var d2 = (((x1 - x3) * dy - (y1 - y3) * dx)).fabs();
					var d3 = (((x2 - x3) * dy - (y2 - y3) * dx)).fabs();
					
					if ((d2 + d3) * (d2 + d3) < threshold * (dx * dx + dy * dy))
					{
						var o = _posf(4);
						_setf(o + (0 << 2), x1234);
						_setf(o + (1 << 2), y1234);
						_setf(o + (2 << 2), x3);
						_setf(o + (3 << 2), y3);
						o = _posb(2);
						_setb(o + 0, 2);
						_setb(o + 1, 2);
					}
					else
					{
						#if alchemy
						_setf(k + ( 8 << 2), x0);
						_setf(k + ( 9 << 2), y0);
						_setf(k + (10 << 2), x12);
						_setf(k + (11 << 2), y12);
						_setf(k + (12 << 2), x123);
						_setf(k + (13 << 2), y123);
						_setf(k + (14 << 2), x1234);
						_setf(k + (15 << 2), y1234);
						_setf(k + ( 0 << 2), x1234);
						_setf(k + ( 1 << 2), y1234);
						_setf(k + ( 2 << 2), x234);
						_setf(k + ( 3 << 2), y234);
						_setf(k + ( 4 << 2), x34);
						_setf(k + ( 5 << 2), y34);
						_setf(k + ( 6 << 2), x3);
						_setf(k + ( 7 << 2), y3);
						k += 64;
						#else
						_tmpStack[k +  8] = x0;
						_tmpStack[k +  9] = y0;
						_tmpStack[k + 10] = x12;
						_tmpStack[k + 11] = y12;
						_tmpStack[k + 12] = x123;
						_tmpStack[k + 13] = y123;
						_tmpStack[k + 14] = x1234;
						_tmpStack[k + 15] = y1234;
						_tmpStack[k +  0] = x1234;
						_tmpStack[k +  1] = y1234;
						_tmpStack[k +  2] = x234;
						_tmpStack[k +  3] = y234;
						_tmpStack[k +  4] = x34;
						_tmpStack[k +  5] = y34;
						_tmpStack[k +  6] = x3;
						_tmpStack[k +  7] = y3;
						k += 16;
						#end
					}
				}
			}
		}
	}
	
	/** Draws an axis-aligned bounding box. */
	inline public function aabb(a:AABB2):Void
	{
		if (!a.isEmpty()) aabbMinMax4(a.minX, a.minY, a.maxX, a.maxY);
	}
	
	/** Draws an axis-aligned bounding box using a <i>min</i>-<i>max</i> representation. */
	inline public function aabbMinMax2(min:Vec2, max:Vec2):Void
	{
		aabbMinMax4(min.x, min.y, max.x, max.y);
	}
	
	/** Draws an axis-aligned bounding box spanning from (<i>minX</i>,<i>minY</i>) to (<i>maxX</i>,<i>maxY</i>). */
	inline public function aabbMinMax4(minX:Float, minY:Float, maxX:Float, maxY:Float):Void
	{
		var o = _posf(10);
		_setf(o + (0 << 2), minX);
		_setf(o + (1 << 2), minY);
		_setf(o + (2 << 2), maxX);
		_setf(o + (3 << 2), minY);
		_setf(o + (4 << 2), maxX);
		_setf(o + (5 << 2), maxY);
		_setf(o + (6 << 2), minX);
		_setf(o + (7 << 2), maxY);
		_setf(o + (8 << 2), minX);
		_setf(o + (9 << 2), minY);
		o = _posb(5);
		_setb(o + 0, 1);
		_setb(o + 1, 2);
		_setb(o + 2, 2);
		_setb(o + 3, 2);
		_setb(o + 4, 2);
	}
	
	/** Draws an axis-aligned bounding box using the center <i>c</i> and half-width extents <i>e</i>. */
	inline public function aabbCenExt2(c:Vec2, e:Vec2):Void
	{
		aabbCenExt4(c.x, c.y, e.x, e.y);
	}
	
	/** Draws an axis-aligned bounding box centered at (<i>cx</i>,<i>cy</i>) and with half-width extents (<i>ex</i>,<i>ey</i>). */
	inline public function aabbCenExt4(cx:Float, cy:Float, ex:Float, ey:Float):Void
	{
		var t0 = cx - ex;
		var t1 = cx + ex;
		var t2 = cy - ey;
		var t3 = cy + ey;
		
		var o = _posf(10);
		_setf(o + (0 << 2), t0);
		_setf(o + (1 << 2), t2);
		_setf(o + (2 << 2), t1);
		_setf(o + (3 << 2), t2);
		_setf(o + (4 << 2), t1);
		_setf(o + (5 << 2), t3);
		_setf(o + (6 << 2), t0);
		_setf(o + (7 << 2), t3);
		_setf(o + (8 << 2), t0);
		_setf(o + (9 << 2), t2);
		o = _posb(5);
		_setb(o + 0, 1);
		_setb(o + 1, 2);
		_setb(o + 2, 2);
		_setb(o + 3, 2);
		_setb(o + 4, 2);
	}
	
	/** Draws an oriented bounding box. */
	inline public function obb(o:OBB2):Void
	{
		obbCenExtAngle3(o.c, o.e, o.R.getAngle());
	}
	
	/** Draws an oriented bounding box centered at <i>c</i>, with half-width extents <i>e</i> and angle <i>r</i>. */
	inline public function obbCenExtAngle3(c:Vec2, e:Vec2, r:Float):Void
	{
		obbCenExtAngle5(c.x, c.y, e.x, e.y, r);
	}
	
	/** Draws an oriented bounding box centered at (<i>cx</i>,<i>cy</i>), with half-width extents (<i>ex</i>,<i>ey</i>) and angle <i>r</i>. */
	inline public function obbCenExtAngle5(cx:Float, cy:Float, ex:Float, ey:Float, r:Float):Void
	{
		var cos = Math.cos(r);
		var sin = Math.sin(r);
		
		var wx = cos * ex;
		var wy = sin * ex;
		
		var hx =-sin * ey;
		var hy = cos * ey;
		
		var x0 = cx + wx + hx;
		var y0 = cy + wy + hy;
		
		var o = _posf(10);
		_setf(o + (0 << 2), x0);
		_setf(o + (1 << 2), y0);
		_setf(o + (2 << 2), cx - wx + hx);
		_setf(o + (3 << 2), cy - wy + hy);
		_setf(o + (4 << 2), cx - wx - hx);
		_setf(o + (5 << 2), cy - wy - hy);
		_setf(o + (6 << 2), cx + wx - hx);
		_setf(o + (7 << 2), cy + wy - hy);
		_setf(o + (8 << 2), x0);
		_setf(o + (9 << 2), y0);
		o = _posb(5);
		_setb(o + 0, 1);
		_setb(o + 1, 2);
		_setb(o + 2, 2);
		_setb(o + 3, 2);
		_setb(o + 4, 2);
	}
	
	/** Draws a skewed cross (x) at position <i>p</i> and radius <i>r</i>. */
	inline public function crossSkewed2(p:Vec2, r:Float):Void
	{
		crossSkewed3(p.x, p.y, r);
	}
	
	/** Draws a skewed cross (x) at (<i>x</i>,<i>y</i>) and radius <i>r</i>. */
	inline public function crossSkewed3(x:Float, y:Float, r:Float):Void
	{
		var o = _posf(8);
		_setf(o + (0 << 2), x - r);
		_setf(o + (1 << 2), y - r);
		_setf(o + (2 << 2), x + r);
		_setf(o + (3 << 2), y + r);
		_setf(o + (4 << 2), x + r);
		_setf(o + (5 << 2), y - r);
		_setf(o + (6 << 2), x - r);
		_setf(o + (7 << 2), y + r);
		o = _posb(4);
		_setb(o + 0, 1);
		_setb(o + 1, 2);
		_setb(o + 2, 1);
		_setb(o + 3, 2);
	}
	
	/** Draws a crosshair at position <i>p</i> and radius <i>r</i>. */
	inline public function crossHair2(v:Vec2, r:Float, skew = false):Void
	{
		crossHair3(v.x, v.y, r, skew);
	}
	
	/** Draws a crosshair at (<i>x</i>,<i>y</i>) and radius <i>r</i>. */
	inline public function crossHair3(x:Float, y:Float, r:Float, skew = false):Void
	{
		var o = _posf(10);
		_setf(o + (0 << 2), x - r);
		_setf(o + (1 << 2), y);
		_setf(o + (2 << 2), x + r);
		_setf(o + (3 << 2), y);
		_setf(o + (4 << 2), x);
		_setf(o + (5 << 2), y - r);
		_setf(o + (6 << 2), x);
		_setf(o + (7 << 2), y + r);
		_setf(o + (8 << 2), x);
		_setf(o + (9 << 2), y);
		o = _posb(5);
		_setb(o + 0, 1);
		_setb(o + 1, 2);
		_setb(o + 2, 1);
		_setb(o + 3, 2);
		_setb(o + 4, 1);
	}
	
	/**
	 * Draws a poly.
	 * @param close Draws a closed shape by connecting the last vertex with the first vertex.
	 */
	public function poly(poly:Poly2, ?close = false):Void
	{
		var k = poly.vertexCount;
		var p = _posf((k << 1) + (close ? 2 : 0));
		var c = _posb(k + (close ? 1 : 0));
		
		var v = poly.worldVertexChain;
		_setf(p + 0, v.x); 
		_setf(p + 4, v.y);
		_setb(c++, 1);
		p += 8;
		
		v = v.next;
		var v0 = v;
		do
		{
			_setf(p + 0, v.x); 
			_setf(p + 4, v.y);
			_setb(c++, 2);
			p += 8;
			v = v.next;
		}
		while (v != v0);
		
		if (close)
		{
			_setf(p + 0, v.x);
			_setf(p + 4, v.y);
			_setb(c, 2);
		}
	}
	
	/**
	 * Draws a polyline through the points specified in <i>vertexList</i>.
	 * Format: [x0, y0, x1, y1, ... ,xN, yN]
	 * @param close Draws a closed shape by connecting the last vertex with the first vertex.
	 * @param maxCount The total number of vertices to use.
	 */
	public function polyLineScalar(vertexList:Array<Float>, ?close = false, ?maxCount = -1):Void
	{
		var k = (maxCount != -1) ? maxCount : Std.int(vertexList.length);
		
		#if debug
		de.polygonal.core.util.Assert.assert(vertexList.length >= maxCount, "vertexList.length >= maxCount");
		#end
		
		if (k < 4) return;
		
		#if debug
		Assert.assert(k.isEven(), "k.isEven()");
		#end
		
		var x0 = vertexList[0];
		var y0 = vertexList[1];
		
		var e = k + (close ? 2 : 0);
		
		var p = _posf(e);
		var c = _posb((k >> 1) + (close ? 1 : 0));
		_setf(p + 0, x0); 
		_setf(p + 4, y0);
		_setb(c++, 1);
		p += 8;
		
		var i = 2;
		while (i < k)
		{
			_setf(p + 0, vertexList[i + 0]);
			_setf(p + 4, vertexList[i + 1]);
			_setb(c++, 2);
			p += 8;
			i += 2;
		}
		
		if (close)
		{
			_setf(p + 0, x0);
			_setf(p + 4, y0);
			_setb(c, 2);
		}
	}
	
	/**
	 * Draws a polyline through the points specified in <i>vertexList</i>.
	 * @param close Draws a closed shape by connecting the last vertex with the first vertex.
	 * @param maxCount The total number of vertices to use.
	 */
	public function polyLineVector(vertexList:Array<Vec2>, ?close = false, ?maxCount = -1):Void
	{
		var k = (maxCount != -1) ? maxCount : Std.int(vertexList.length);
		
		#if debug
		de.polygonal.core.util.Assert.assert(vertexList.length >= maxCount, "vertexList.length >= maxCount");
		#end
		
		if (k <= 1) return;
		
		if (k == 2)
		{
			var o = _posf(4);
			var v = vertexList[0];
			_setf(o +  0, v.x);
			_setf(o +  4, v.y);
			v = vertexList[1];
			_setf(o +  8, v.x);
			_setf(o + 12, v.y);
			
			o = _posb(2);
			_setb(o + 0, 1);
			_setb(o + 1, 2);
			
			return;
		}
		
		var v:Vec2;
		var t = v = vertexList[0];
		var e = (k << 1) + (close ? 2 : 0);
		
		var p = _posf(e);
		var c = _posb(k + (close ? 1 : 0));
		_setf(p + 0, v.x); 
		_setf(p + 4, v.y);
		_setb(c++, 1);
		p += 8;
		
		for (i in 1...k)
		{
			v = vertexList[i];
			_setf(p + 0, v.x);
			_setf(p + 4, v.y);
			_setb(c++, 2);
			p += 8;
		}
		
		if (close && k > 2)
		{
			_setf(p + 0, t.x);
			_setf(p + 4, t.y);
			_setb(c, 2);
		}
	}
	
	/**
	 * Draws an arrow from <i>a</i> to <i>b</i>.
	 * @param size The size of the arrowhead.
	 */
	inline public function arrowLine3(a:Vec2, b:Vec2, size:Float):Void
	{
		arrowLine5(a.x, a.y, b.x, b.y, size);
	}
	
	/**
	 * Draws an arrow from (<i>ax</i>,<i>ay</i>) to (<i>bx</i>,<i>by</i>).
	 * @param size The size of the arrowhead.
	 */
	inline public function arrowLine5(ax:Float, ay:Float, bx:Float, by:Float, size:Float):Void
	{
		var dx = bx - ax;
		var dy = by - ay;
		var l = dx * dx + dy * dy;
		if (l > Mathematics.EPS)
		{
			l = l.invSqrt();
			dx *= l;
			dy *= l;
			
			if (size == 0)
			{
				var o = _posf(4);
				_setf(o + (0 << 2), ay);
				_setf(o + (1 << 2), ax);
				_setf(o + (2 << 2), bx);
				_setf(o + (3 << 2), by);
				o = _posb(2);
				_setb(o + 0, 1);
				_setb(o + 1, 2);
			}
			else
			{
				var o = _posf(10);
				_setf(o + (1 << 2), ay);
				_setf(o + (0 << 2), ax);
				_setf(o + (2 << 2), bx);
				_setf(o + (3 << 2), by);
				_setf(o + (4 << 2), bx - size * dx + size * dy);
				_setf(o + (5 << 2), by - size * dy - size * dx);
				_setf(o + (6 << 2), bx);
				_setf(o + (7 << 2), by);
				_setf(o + (8 << 2), bx - size * dx - size * dy);
				_setf(o + (9 << 2), by - size * dy + size * dx);
				o = _posb(5);
				_setb(o + 0, 1);
				_setb(o + 1, 2);
				_setb(o + 2, 2);
				_setb(o + 3, 1);
				_setb(o + 4, 2);
			}
		}
	}
	
	/**
	 * Draws an arrow starting at <i>p</i>, pointing in the direction <i>d</i> and with a magnitude
	 * of <i>mag</i>.
	 * @param size The size of the arrowhead.
	 */
	inline public function arrowRay4(p:Vec2, d:Vec2, mag:Float, size:Float):Void
	{
		arrowRay6(p.x, p.y, d.x, d.y, mag, size);
	}
	
	/**
	 * Draws an arrow starting at (<i>x</i>,<i>y</i>), pointing in the direction (<i>dx</i>,<i>dy</i>)
	 * and with a magnitude of <i>mag</i>.
	 * @param size The size of the arrowhead.
	 */
	inline public function arrowRay6(x:Float, y:Float, dx:Float, dy:Float, mag:Float, size:Float):Void
	{
		mag = mag.fabs();
		size = size.fabs();
		
		var t = dx * dx + dy * dy;
		
		if (t < Mathematics.EPS)
			return;
		else
		{
			var ex = .0;
			var ey = .0;
			
			if (1 - t >= 0)
			{
				if (1 - t > Mathematics.EPS)
				{
					t = t.invSqrt();
					ex = x + (dx * t * mag);
					ey = y + (dy * t * mag);
				}
				else
				{
					ex = x + (dx * mag);
					ey = y + (dy * mag);
				}
			}
			else
			if (1 - t < 0)
			{
				if (1 - t < -Mathematics.EPS)
				{
					t = t.invSqrt();
					ex = x + (dx * t * mag);
					ey = y + (dy * t * mag);
				}
				else
				{
					ex = x + (dx * mag);
					ey = y + (dy * mag);
				}
			}
			
			if (size == 0)
			{
				var o = _posf(4);
				_setf(o + (0 << 2), x);
				_setf(o + (1 << 2), y);
				_setf(o + (2 << 2), ex);
				_setf(o + (3 << 2), ey);
				o = _posb(2);
				_setb(o + 0, 1);
				_setb(o + 1, 2);
			}
			else
			{
				var o = _posf(10);
				_setf(o + (0 << 2), x);
				_setf(o + (1 << 2), y);
				_setf(o + (2 << 2), ex);
				_setf(o + (3 << 2), ey);
				
				if (mag < size) size = mag;
				var tx = (ex - x) / mag;
				var ty = (ey - y) / mag;
				
				_setf(o + (4 << 2), ex - size * tx + size * ty);
				_setf(o + (5 << 2), ey - size * ty - size * tx);
				_setf(o + (6 << 2), ex);
				_setf(o + (7 << 2), ey);
				_setf(o + (8 << 2), ex - size * tx - size * ty);
				_setf(o + (9 << 2), ey - size * ty + size * tx);
				o = _posb(5);
				_setb(o + 0, 1);
				_setb(o + 1, 2);
				_setb(o + 2, 2);
				_setb(o + 3, 1);
				_setb(o + 4, 2);
			}
		}
	}
	
	/**
	 * Draws a grid into the area specified by <i>bound</i> with a resolution of <i>res</i>.
	 */
	inline public function grid3(res:Float, bound:AABB2, cap:Bool):Void
	{
		grid6(res, bound.minX, bound.minY, bound.maxX, bound.maxY, cap);
	}
	
	/**
	 * Draws a grid into the area specified from (<i><i>minX</i></i>,<i><i>minY</i></i>) to
	 * (<i><i>maxX</i></i>,<i><i>maxY</i></i>) with a resolution of <i>res</i>.
	 */
	inline public function grid6(res:Float, minX:Float, minY:Float, maxX:Float, maxY:Float, cap:Bool):Void
	{
		var t;
		var j = cap ? 0 : 1;
		var l = cap ? 1 : 0;
		
		var k = Std.int((maxX - minX) / res) + l;
		var p = _posf((k - (cap ? 0 : 1)) << 2);
		var c = _posb((k - (cap ? 0 : 1)) << 1);
		for (i in j...k)
		{
			t = minX + i * res;
			_setf(p +  0, t);
			_setf(p +  4, minY);
			_setf(p +  8, t);
			_setf(p + 12, maxY);
			_setb(c++, 1);
			_setb(c++, 2);
			p += 16;
		}
		
		k = Std.int((maxY - minY) / res) + l;
		var p = _posf((k - (cap ? 0 : 1)) << 2);
		var c = _posb((k - (cap ? 0 : 1)) << 1);
		for (i in j...k)
		{
			t = minY + i * res;
			_setf(p + 0, minX);
			_setf(p + 4, t);
			_setf(p + 8, maxX);
			_setf(p + 12, t);
			_setb(c++, 1);
			_setb(c++, 2);
			p += 16;
		}
	}
	
	/**
	 * Draws a <i>plane</i> p clipped against <i>bound</i>.
	 * @param normalLength The length of the plane normal.
	 * @param size The plane normal's arrowhead size.
	 */
	inline public function plane4(p:Plane2, bound:AABB2, normalLength:Float, normalSize:Float):Void
	{
		planeThroughPoint10(p.n.x * p.d, p.n.y * p.d, p.n.x, p.n.y, bound.minX, bound.minY, bound.maxX, bound.maxY, normalLength, normalSize);
	}
	
	inline public function planeThroughPoint5(p:Vec2, n:Vec2, bound:AABB2, normalLength:Float, normalSize:Float):Void
	{
		planeThroughPoint10(p.x, p.y, n.x, n.y, bound.minX, bound.minY, bound.maxX, bound.maxY, normalLength, normalSize);
	}
	
	inline public function planeThroughPoint10(px:Float, py:Float, nx:Float, ny:Float,
		minX:Float, minY:Float, maxX:Float, maxY:Float, normalLength:Float, normalSize:Float):Void
	{
		var dx = ny;
		var dy =-nx;
		
		if (Mathematics.cmpZero(dy, Mathematics.EPS))
		{
			line4(minX, py, maxX, py);
			
			if (normalLength > 0)
				arrowRay6(minX + (maxX - minX) * .5, py, -dy, dx, normalLength, normalSize);
		}
		else
		if (Mathematics.cmpZero(dx, Mathematics.EPS))
		{
			line4(px, minY, px, maxY);
			
			if (normalLength > 0)
				arrowRay6(px,  minY + (maxY - minY) * .5, -dy, dx, normalLength, normalSize);
		}
		else
		{
			var tx, ty;
			
			if (dy < 0) ty =-( py - minY) / dy;
			else 		ty = (-py + maxY) / dy;
			if (dx < 0) tx =-( px - minX) / dx;
			else		tx = (-px + maxX) / dx;
			
			var t0 = tx.fmin(ty);
			
			if (dy > 0) ty =-( py - minY) / -dy;
			else 		ty = (-py + maxY) / -dy;
			if (dx > 0) tx =-( px - minX) / -dx;
			else		tx = (-px + maxX) / -dx;
			
			var t1 = tx.fmin(ty);
			
			var v0x = px + t0 * dx;
			var v0y = py + t0 * dy;
			var v1x = px - t1 * dx;
			var v1y = py - t1 * dy;
			
			line4(v0x, v0y, v1x, v1y);
			
			if (normalLength > 0)
				arrowRay6(v0x + (v1x - v0x) * .5, v0y + (v1y - v0y) * .5, -dy, dx, normalLength, normalSize);
		}
	}
	
	/** Draws a dashed line from <i>a</i> to <i>b</i>. */
	public function dashedLine2(a:Vec2, b:Vec2, ?dashSize = 2., ?gapSize = 2.):Void
	{
		dashedLine4(a.x, a.y, b.x, b.y, dashSize, gapSize);
	}
	
	/** Draws a dashed line from <i>a</i> to <i>b</i>. */
	public function dashedLine4(ax:Float, ay:Float, bx:Float, by:Float, ?dashSize = 2., ?gapSize = 2.):Void
	{
		var dx = bx - ax;
		var dy = by - ay;
		
		var l = dashSize + gapSize;
		var d = 1 / Mathematics.invSqrt(dx * dx + dy * dy);
		
		var k = Std.int(d / l);
		if (k < 0) k = -k;
		
		var theta = Math.atan2(dy, dx);
		
		var cos = Math.cos(theta);
		var sin = Math.sin(theta);
		
		dx = cos * l;
		dy = sin * l;
		
		var p = _posf((k << 2) + 6);
		var c = _posb((k << 1) + 3);
		
		for (i in 0...k)
		{
			_setf(p +  0, ax);
			_setf(p +  4, ay);
			_setf(p +  8, ax + cos * dashSize);
			_setf(p + 12, ay + sin * dashSize);
			p += 16;
			
			_setb(c + 0, 1);
			_setb(c + 1, 2);
			c += 2;
			
			ax += dx;
			ay += dy;
		}
		
		_setf(p + 0, ax);
		_setf(p + 4, ay);
		_setb(c + 0, 1);
		
		d = 1 / Mathematics.invSqrt((bx - ax) * (bx - ax) + (by - ay) * (by - ay));
		if (d > dashSize)
		{
			_setf(p +  8, ax + cos * dashSize);
			_setf(p + 12, ay + sin * dashSize);
			_setb(c + 1, 2);
		}
		else
		if (d > 0)
		{
			_setf(p +  8, ax + cos * d);
			_setf(p + 12, ay + sin * d);
			_setb(c + 1, 2);
		}
		
		_setf(p + 16, bx);
		_setf(p + 20, by);
		_setb(c + 2, 1);
	}
	
	#if flash
	function _getStroke():IGraphicsData
	{
		var stroke = _strokePool.next();
		
		if (Math.isNaN(style.lineThickness))
			stroke.thickness = Mathematics.NaN;
		else
			stroke.thickness = style.lineThickness;
		
		if (style.useComplexStroke)
		{
			style.useComplexStroke = false;
			stroke.pixelHinting    = style.linePixelHinting;
			stroke.caps            = style.lineCaps;
			stroke.joints          = style.lineJoints;
			stroke.scaleMode       = style.lineScaleMode;
			stroke.miterLimit      = style.lineMiterLimit;
		}
		
		var fill = _solidFillPool.next();
		fill.alpha = style.lineAlpha;
		fill.color = style.lineColor;
		stroke.fill = fill;
		
		return stroke;
	}
	#end
	
	function _flushCache():Void
	{
		#if flash
		if (_ci > 0)
		{
			var node        = _pool.next();
			var data        = node.data;
			var commands    = node.commands;
			var path        = node.path;
			data.length     = _di;
			commands.length = _ci;
			path.commands   = commands;
			path.data       = data;
			path.winding    = _winding;
			
			#if alchemy
			var offset = _cb.offset;
			for (i in 0..._ci) commands[i] = flash.Memory.getByte(offset + i);
			#else
			for (i in 0..._ci) commands[i] = _cb.get(i);
			#end
			
			#if alchemy
			var offset = _db.offset;
			for (i in 0..._di) data[i] = flash.Memory.getFloat(offset + (i << 2));
			#else
			for (i in 0..._di) data[i] = _db.get(i);
			#end
			
			_buffer.push(path);
			_ci = 0;
			_di = 0;
		}
		#elseif js
		var j = 0;
		for (i in 0..._ci)
		{
			var c = _cb.get(i);
			switch (c)
			{
				case 1:
					trace("move to", _db.get(j + 0), _db.get(j + 1));
					//_context.beginPath();
					_context.moveTo(_db.get(j + 0), _db.get(j + 1));
					j += 2;
					
				case 2:
					trace("line to", _db.get(j + 0), _db.get(j + 1));
					_context.lineTo(_db.get(j + 0), _db.get(j + 1));
					j += 2;
					
				case 3:
					throw "TODO";
			}
		}
		#end
	}
	
	#if js
	private var _n:Int;
	private var _path:PathData;
	#end
	
	private var _fRequested:Bool;
	
	inline function _posf(n:Int):Int
	{
		#if debug
		de.polygonal.core.util.Assert.assert(_di + n < _db.size,
			de.polygonal.core.fmt.Sprintf.format("alchemy cache too small (floats req./rem./max.: %d/%d/%d ", [n, _db.size - _di, _db.size]));
		#end
		var addr = _db.getAddr(_di);
		
		#if !alchemy
		_pi0 = _di;
		#end
		
		#if js
		_n = n >> 1;
		#end
		
		_fRequested = true;
		
		#if js
		_path = new PathData();
		_path.di  = _di;
		_path.k   = n >> 1;
		#end
		
		_di += n;
		return addr;
	}
	
	inline function _posb(n:Int):Int
	{
		#if debug
		de.polygonal.core.util.Assert.assert(_ci + n < _cb.size,
			de.polygonal.core.fmt.Sprintf.format("alchemy cache too small (bytes req./rem./max.: %d/%d/%d ", [n, _cb.size - _ci, _cb.size]));
		#end
		
		if (!_fRequested)
		{
			throw "call f before b";
			_fRequested = false;
		}
		
		#if js
		_path.ci = _ci;
		_buffer.push(_path);
		#end
		
		var addr = _cb.getAddr(_ci);
		_ci += n;
		return addr;
	}
	
	inline function _setf(addr:Int, x:Float)
	{
		#if alchemy
		flash.Memory.setFloat(addr, x);
		#else
		_db.set(_pi0 + ((addr - _pi0) >> 2), x);
		#end
	}
	
	inline function _setb(addr:Int, x:Int)
	{
		#if alchemy
		flash.Memory.setByte(addr, x);
		#else
		_cb.set(addr, x);
		#end
	}
}

#if flash
private class VectorNode
{
	public var path:GraphicsPath;
	public var commands:flash.Vector<Int>;
	public var data:flash.Vector<Float>;
	
	public function new()
	{
		path     = new GraphicsPath();
		commands = new flash.Vector<Int>();
		data     = new flash.Vector<Float>();
	}
}

private class Pool<T>
{
	var _pool:ObjectPool<T>;
	var _allocatedIds:ShortMemory;
	var _allocatedCount:Int;
	
	var _class:Class<T>;
	var _args:Array<Dynamic>;
	
	public function new(size:Int, c:Class<T>)
	{
		#if debug
		de.polygonal.core.util.Assert.assert(size < Limits.UINT16_MAX, "size < Mathematics.UINT16_MAX");
		#end
		
		_class          = c;
		_args           = new Array<Dynamic>();
		_pool           = new ObjectPool<T>(size);
		_allocatedCount = 0;
		
		if (size > 0)
		{
			_allocatedIds = new ShortMemory(size, "VectorRenderer.Pool._allocatedIds");
			_pool.allocate(false, c);
		}
	}
	
	public function free():Void
	{
		_pool.free();
		if (_allocatedIds != null) _allocatedIds.free();
		
		_pool         = null;
		_allocatedIds = null;
		_class        = null;
		_args         = null;
	}
	
	inline public function next():T
	{
		if (_pool.isEmpty())
			return Type.createInstance(_class, _args);
		else
		{
			var id = _pool.next();
			_allocatedIds.set(_allocatedCount++, id);
			return _pool.get(id);
		}
	}
	
	inline public function fill():Void
	{
		for (i in 0..._allocatedCount)
			_pool.put(_allocatedIds.get(i));
		_allocatedCount = 0;
	}
}
#end

#if js
class LineStyle
{
	public var rgb:Int;
	public function new()
	{
		
	}
	
	public function submit()
	{
		
	}
}
class PathData
{
	public var k:Int;
	public var di:Int;
	public var ci:Int;
	public function new()
	{
		//context.strokeRect(minX, minY, maxX - minX, maxY - minY);
	}
}
#end