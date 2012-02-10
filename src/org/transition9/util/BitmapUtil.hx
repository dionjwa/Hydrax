package org.transition9.util;

import com.pblabs.components.scene2D.ImageType;
import com.pblabs.components.scene2D.ImageData;

import de.polygonal.core.math.Mathematics;
import de.polygonal.motor.geom.primitive.AABB2;
#if jeash
import Html5Dom;
typedef Canvas = Html5Dom.HTMLCanvasElement;
#end

class BitmapUtil
{
	public static function createImageData (width :Int, height :Int) :ImageData
	{
		#if (flash || cpp)
		return new flash.display.BitmapData(width, height);
		#elseif js
		var canvas = createCanvas();
		canvas.width = width;
		canvas.height = height;
		return canvas;
		#end
	}
	
	#if (flash || cpp)
	public static function createBitmapData (d :flash.display.DisplayObject, ?scale :Float = 1.0, ?center :flash.geom.Point) :flash.display.BitmapData
	{
		#if flash
		var bounds = d.getBounds(d);
		#elseif cpp
		var bounds = d.nmeGetPixelBounds();
		#end
		if (bounds.width <= 0 && bounds.height <= 0) {
			org.transition9.util.Log.error(["d", d, "d.name", d.name, "bounds", bounds]);
			return null;
		}
		
		if (center == null) {
			center = new flash.geom.Point();
		}
		center.x = Mathematics.ceil(-bounds.x * scale);
		center.y = Mathematics.ceil(-bounds.y * scale);
		
		#if flash
		var bd = new flash.display.BitmapData(Mathematics.ceil(bounds.width * scale), Mathematics.ceil(bounds.height * scale), true, ColorUtil.toARGB(0xffffff, 0));
		#else
		var bd = new flash.display.BitmapData(Mathematics.ceil(bounds.width * scale), Mathematics.ceil(bounds.height * scale), true, 0xffffff);
		#end

		bd.draw(d, new flash.geom.Matrix(scale, 0, 0, scale, center.x, center.y), null, null, null, false);
		
		#if graphics_debug
		var shape = new flash.display.Shape();
		var g = shape.graphics;
		g.lineStyle(1, 0);
		g.drawRect(0, 0, bd.width - 1, bd.height - 1);
		bd.draw(shape);
		#end
		
		return bd;
	}
	#end
	
	#if js
	public static function toCanvas (image :ImageType) :Canvas
	{
		var canvas = createCanvas();
		canvas.width = image.width;
		canvas.height = image.height;
		canvas.getContext("2d").drawImage(image, 0, 0);
		return canvas;
	}
	
	public static function clone (image :Canvas) :Canvas
	{
		var canvas = createCanvas();	
		canvas.width = image.width;
		canvas.height = image.height;
		#if haxedev
		canvas.getContext("2d").drawImage(image, 0, 0);
		#else
		canvas.getContext("2d").drawImage(cast image, 0, 0);
		#end
		return canvas;
	}
	
	inline public static function createCanvas () :Canvas
	{
		return cast js.Lib.document.createElement("canvas");
	}
	
	/**
	  * Computes the minimum bounds of the drawn area of the canvas via brute force 
	  * checking of pixels.  It's probably as efficient as it's going to get: no pixel is checked
	  * more than once.
	  */
	public static function getDrawnBounds (canvas :Canvas) :AABB2
	{
		// grabbing image data
		var imageData = canvas.getContext("2d").getImageData(0, 0, canvas.width, canvas.height);
		
		var cwidth :Int = canvas.width;
		var cheight :Int = canvas.height;
	
		var data = imageData.data;
		// calculating top
		var top :Int = 0;
		var pos :Int = 0;
		
		while (pos < data.length) {
			if (untyped data[pos + 3] != 0) {
				top = Std.int((pos / 4) / cwidth);
				break;
			}
			pos += 4;
		}
		
		var left = 0;
		var col = 0, row = top; // left bounds
		while (row < cheight && col < cwidth) {
			var px = untyped data[(row * cwidth * 4) + (col * 4) + 3];
			if (px) {
				left = col;
				break;
			}
			row ++;
			if (row % cheight == 0) {
				row = 0;
				col++;
			}
		}
	
		var bottom :Int = canvas.height - 1;
		col = cwidth - 1;
		row = cheight - 1; //Bottom
		while (row >= 0 && col >= 0) {
			var px = untyped data[(row * cwidth * 4) + (col * 4) + 3];
			if (px) {
				bottom = row;
				break;
			}
			col--;
			if (col % cwidth == 0 || col <= left) {
				col = cwidth - 1;
				row--;
			}
		}
		
		var right :Int = cwidth - 1;
		col = cwidth - 1;
		row = top + 1; //Right
		while (row >= 0 && col >= left) {
			var px = untyped data[(row * cwidth * 4) + (col * 4) + 3];
			if (px) {
				right = col;
				break;
			}
			row++;
			if (row >= bottom) {
				row = top + 1;
				col--;
			}
		}
		return new AABB2(left, top, right, bottom);
	}
	#end

}
