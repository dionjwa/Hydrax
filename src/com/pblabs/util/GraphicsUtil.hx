/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/

package com.pblabs.util;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Graphics;
import flash.display.Sprite;

import flash.geom.Point;
import flash.geom.Rectangle;

/**
  * Useful flash drawing functions.
  */
class GraphicsUtil
{
	public static function drawBoundingRect (drawLayer :Sprite, disp :DisplayObject, ?color :Int =
		0x000000, ?alpha :Float = 1, lineThickness :Float = 1) :Void
	{
		var bounds:Rectangle = disp.getBounds(drawLayer);
		var g = drawLayer.graphics;
		g.lineStyle(lineThickness, color, alpha);
		g.drawRect(bounds.left, bounds.top, bounds.width, bounds.height);
	}

	public static function drawCircle (g :Graphics, ?color :Int = 0x00ffff, ?r :Float = 10, ?x :Float = 0, ?y :Float = 0, ?lineThickness :Float = 1) :Void
	{
		g.lineStyle(lineThickness, color);
		g.drawCircle(x, y, r);
		g.lineStyle(0, 0, 0);
	}

	public static function drawLine (g :Graphics, x1 :Float, y1 :Float, x2 :Float, y2 :Float,
		?color :Int = 0x000000, ?linethickness :Float = 1, ?alpha :Float = 1) :Void
	{
		g.lineStyle(linethickness, color, alpha);
		g.moveTo(x1, y1);
		g.lineTo(x2, y2);
	}

	public static function drawRect (g :Graphics, width :Float, height :Float, ?color :Int = 0x000000,
		?alpha :Float = 1, ?lineWidth :Int = 1) :Void
	{
		g.lineStyle(lineWidth, color, alpha);
		g.drawRect(0, 0, width, height);
	}

	public static function drawRectangle (g :Graphics, rect :Rectangle, ?color :Int = 0x000000,
		?alpha :Float = 1, ?lineWidth :Int = 1) :Void
	{
		g.lineStyle(lineWidth, color, alpha);
		g.drawRect(rect.left, rect.top, rect.width, rect.height);
	}

	public static function fillBoundingRect (g :Graphics, rootContainer :DisplayObjectContainer,
		?color :Int = 0xffffff, ?alpha :Float = 0) :Void
	{
		var bounds:Rectangle = rootContainer.getBounds(rootContainer);
		// g.clear();
		g.beginFill(color, alpha);
		g.drawRect(bounds.left, bounds.top, bounds.width, bounds.height);
		g.endFill();
	}

	public static function fillCircle (g :Graphics, ?color :Int = 0x00ffff, ?r :Float = 10, ?x :Float = 0,
		?y :Float = 0) :Void
	{
		g.beginFill(color);
		g.drawCircle(x, y, r);
		g.endFill();
	}

	public static function fillRect (g :Graphics, width :Float, height :Float, ?color :Int = 0x000000,
		?alpha :Float = 1) :Void
	{
		g.lineStyle(0, 0, 0);
		g.beginFill(color, alpha);
		g.drawRect(0, 0, width, height);
		g.endFill();
	}

	public static function fillRectangle (g :Graphics, rect :Rectangle, ?color :Int = 0x000000,
		?alpha :Float = 1) :Void
	{
		g.beginFill(color, alpha);
		g.drawRect(rect.left, rect.top, rect.width, rect.height);
		g.endFill();
	}
	
	/**
	 *
	 * Copyright (c) 2008 Noel Billig (www.dncompute.com)
	 *
	 * Permission is hereby granted, free of charge, to any person obtaining a copy
	 * of this software and associated documentation files (the "Software"), to deal
	 * in the Software without restriction, including without limitation the rights
	 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	 * copies of the Software, and to permit persons to whom the Software is
	 * furnished to do so, subject to the following conditions:
	 *
	 * The above copyright notice and this permission notice shall be included in
	 * all copies or substantial portions of the Software.
	 *
	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	 * THE SOFTWARE.
	 */
	public static function drawArrow(graphics:Graphics, start:Point,end:Point, ?style:Dynamic=null):Void 
	{
		if (start.equals(end)) return;

		var arrowStyle:ArrowStyle;
		if (style == null) {
			arrowStyle = new ArrowStyle();
		} else if (Std.is( style, ArrowStyle)) {
			arrowStyle = cast( style, ArrowStyle);
		} else {
			arrowStyle = new ArrowStyle(style);
		}

		var fullVect:Point = end.subtract(start);
		var halfWidth:Float = (arrowStyle.headWidth != -1) ? arrowStyle.headWidth/2 :arrowStyle.headLength/2;

		//Figure out the line start/end points
		var startNorm:Point = new Point(fullVect.y,-fullVect.x);
		startNorm.normalize(arrowStyle.shaftThickness/2);
		var start1:Point = start.add(startNorm);
		var start2:Point = start.subtract(startNorm);
		var end1:Point = end.add(startNorm);
		var end2:Point = end.subtract(startNorm);

		//figure out where the arrow head starts
		var headPnt:Point = fullVect.clone();
		headPnt.normalize(headPnt.length-arrowStyle.headLength);
		headPnt = headPnt.add(start);

		//calculate the arrowhead corners
		var headPntNorm:Point = startNorm.clone();
		headPntNorm.normalize(halfWidth);
		var edge1:Point = headPnt.add(headPntNorm);
		var edge2:Point = headPnt.subtract(headPntNorm);

		//Figure out where the arrow connects the the shaft, then calc the intersections
		var shaftCenter:Point = Point.interpolate(end,headPnt,arrowStyle.shaftPosition);
		
		var inter1:Point = getLineIntersection(start1,end1,shaftCenter,edge1);
		var inter2:Point = getLineIntersection(start2,end2,shaftCenter,edge2);

		//Figure out the control points
		var edgeCenter:Point = Point.interpolate(end,headPnt,arrowStyle.edgeControlPosition);
		var edgeNorm:Point = startNorm.clone();
		edgeNorm.normalize(halfWidth*arrowStyle.edgeControlSize);
		var edgeCntrl1:Point = edgeCenter.add(edgeNorm);
		var edgeCntrl2:Point = edgeCenter.subtract(edgeNorm);

		graphics.moveTo(start1.x,start1.y);
		graphics.lineTo(inter1.x,inter1.y);
		graphics.lineTo(edge1.x,edge1.y);
		graphics.curveTo(edgeCntrl1.x,edgeCntrl1.y,end.x,end.y);
		graphics.curveTo(edgeCntrl2.x,edgeCntrl2.y,edge2.x,edge2.y);
		graphics.lineTo(inter2.x,inter2.y);
		graphics.lineTo(start2.x,start2.y);
		graphics.lineTo(start1.x,start1.y);
	}

	/**
	 *
	 * Copyright (c) 2008 Noel Billig (www.dncompute.com)
	 *
	 * Permission is hereby granted, free of charge, to any person obtaining a copy
	 * of this software and associated documentation files (the "Software"), to deal
	 * in the Software without restriction, including without limitation the rights
	 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	 * copies of the Software, and to permit persons to whom the Software is
	 * furnished to do so, subject to the following conditions:
	 *
	 * The above copyright notice and this permission notice shall be included in
	 * all copies or substantial portions of the Software.
	 *
	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	 * THE SOFTWARE.
	 */
	public static function drawArrowHead(graphics:Graphics,
			start:Point,end:Point,
			?style:Dynamic=null):Void {

		var arrowStyle:ArrowStyle;
		if (style == null) {
			arrowStyle = new ArrowStyle();
		} else if (Std.is( style, ArrowStyle)) {
			arrowStyle = cast( style, ArrowStyle);
		} else {
			arrowStyle = new ArrowStyle(style);
		}

		var vec:Point = end.subtract(start);
		var halfWidth = (arrowStyle.headWidth != -1) ? arrowStyle.headWidth/2 :vec.length/2;

		var shaft:Point = vec.clone();
		shaft.normalize(vec.length*arrowStyle.shaftPosition);
		shaft = start.add(shaft);

		//Make the vect a normal to the line
		vec = new Point(vec.y,-vec.x);

		var tmp:Point = vec.clone();
		tmp.normalize(arrowStyle.shaftControlSize*halfWidth);
		var shaftCenter:Point = Point.interpolate(start,shaft,arrowStyle.shaftControlPosition);
		var baseCntrl1:Point = shaftCenter.add(tmp);
		var baseCntrl2:Point = shaftCenter.subtract(tmp);

		vec.normalize(halfWidth);
		var base1:Point = start.add(vec);
		var base2:Point = start.subtract(vec);

		var edgeCenter:Point = Point.interpolate(start,end,arrowStyle.edgeControlPosition);
		vec.normalize(halfWidth*arrowStyle.edgeControlSize);
		var edgeCntrl1:Point = edgeCenter.add(vec);
		var edgeCntrl2:Point = edgeCenter.subtract(vec);

		//Draw the arrow
		graphics.moveTo(base1.x,base1.y);
		graphics.curveTo(baseCntrl1.x,baseCntrl1.y,shaft.x,shaft.y);
		graphics.curveTo(baseCntrl2.x,baseCntrl2.y,base2.x,base2.y);
		graphics.curveTo(edgeCntrl2.x,edgeCntrl2.y,end.x,end.y);
		graphics.curveTo(edgeCntrl1.x,edgeCntrl1.y,base1.x,base1.y);

	}
	
	/**
	 *
	 * Calculate the intersection between two lines. The intersection point
	 * may not necesarily occur on either line segment. To only get the line
	 * segment intersection, use <code>getLineSegmentIntersection</code> instead
	 *
	 */
	static function getLineIntersection (
			a1:Point,a2:Point,
			b1:Point,b2:Point
			):Point {

		//calculate directional constants
		var k1:Float = (a2.y-a1.y) / (a2.x-a1.x);
		var k2:Float = (b2.y-b1.y) / (b2.x-b1.x);

		// if the directional constants are equal, the lines are parallel,
		// meaning there is no intersection point.
		if(k1 == k2) return null;

		var x:Float,y:Float;
		var m1:Float,m2:Float;

		// an infinite directional constant means the line is vertical
		if(!Math.isFinite(k1)) {

			// so the intersection must be at the x coordinate of the line
			x = a1.x;
			m2 = b1.y - k2 * b1.x;
			y = k2 * x + m2;

		// same as above for line 2
		} else if (!Math.isFinite(k2)) {

			m1 = a1.y - k1 * a1.x;
			x = b1.x;
			y = k1 * x + m1;

		// if neither of the lines are vertical
		} else {

			m1 = a1.y - k1 * a1.x;
			m2 = b1.y - k2 * b1.x;
			x = (m1-m2) / (k2-k1);
			y = k1 * x + m1;

		}

		return new Point(x,y);
	}
}


	/**
	 *
	 * Copyright (c) 2008 Noel Billig (www.dncompute.com)
	 *
	 * Permission is hereby granted, free of charge, to any person obtaining a copy
	 * of this software and associated documentation files (the "Software"), to deal
	 * in the Software without restriction, including without limitation the rights
	 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	 * copies of the Software, and to permit persons to whom the Software is
	 * furnished to do so, subject to the following conditions:
	 *
	 * The above copyright notice and this permission notice shall be included in
	 * all copies or substantial portions of the Software.
	 *
	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	 * THE SOFTWARE.
	 *
	 */

	/*
	 * @param width - if width is -1, the arrow is equilateral
	 * @param shaftPosition - Determines how far along the arrow
	 *		 shaft the head is connected. -1 will result in a
	 *		 diamond shape, 0 will be a standard triangle, .5 will
	 *	  be a recessed arrow (like a mouse pointer). Anything
	 *		 greater than 1 will invert the shape.
	 * @param shaftControlPosition - let's you curve the line where
	 *		 the base points meet the shaft. Determines what percentage
	 *		 from the shaft-head to base points to place the control points
	 * @param shaftControlSize - Less than .5 sharpens the
	 *		 shape, whereas anything greater than .5 makes it bulbous
	 */
class ArrowStyle implements Dynamic
{
	public var headWidth:Float; //Relative width of arrow head

	/**
	 *
	 * Not used in drawArrowHead because the length is
	 * determined by the points passed in
	 *
	 */
	public var headLength:Float; //Pixel Length of arrow head


	public var shaftThickness:Float;
	public var shaftPosition:Float;

	/**
	 *  Not used in drawArrow, only drawArrowHead
	 *	 This let's you curve the line at the base of the arrow
	 */
	public var shaftControlPosition:Float;
	/**
	 * Not used in drawArrow, only drawArrowHead
	 * This let's you curve the line at the base of the arrow
	 */
	public var shaftControlSize:Float;


	public var edgeControlPosition:Float;
	public var edgeControlSize:Float;

	public function new(?presets:Dynamic<Float>=null) {
		
		headWidth =-1;
		headLength =10;
		shaftThickness =2;
		shaftPosition =0;
		shaftControlPosition =.5;
		shaftControlSize =.5;
		edgeControlPosition =.5;
		edgeControlSize =.5;
		if (presets != null) {
			for (name in Reflect.fields(presets)) {
				this.name = presets.name;
			}
		}
	}

}


