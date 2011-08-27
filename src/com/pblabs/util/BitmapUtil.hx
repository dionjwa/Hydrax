package com.pblabs.util;

import de.polygonal.core.math.Mathematics;

class BitmapUtil
{
	#if (flash || cpp)
	public static function createBitmapData (d :flash.display.DisplayObject, ?scale :Float = 1.0, ?center :flash.geom.Point) :flash.display.BitmapData
	{
		#if flash
		var bounds = d.getBounds(d);
		#elseif cpp
		var bounds = d.nmeGetPixelBounds();
		#end
		if (bounds.width <= 0 && bounds.height <= 0) {
			com.pblabs.util.Log.error(["d", d, "d.name", d.name, "bounds", bounds]);
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
	public static function createImageData (image :Image) :ImageData
	{
		var canvas :Canvas = toCanvas(image);
		return canvas.getContext("2d").getImageData(0, 0, image.width, image.height);
	}
	
	public static function toCanvas (image :Image) :Canvas
	{
		var canvas :Canvas = cast js.Lib.document.createElement("canvas");
		canvas.width = image.width;
		canvas.height = image.height;
		canvas.getContext("2d").drawImage(image, 0, 0);
		return canvas;
	}
	#end

}
