package com.pblabs.util;

import de.polygonal.core.math.Mathematics;

import flash.display.BitmapData;
import flash.display.DisplayObject;

import flash.geom.Matrix;
import flash.geom.Point;

class BitmapUtil
{
	#if (flash || cpp)
	public static function createBitmapData (d :DisplayObject, ?scale :Float = 1.0, ?center :Point) :BitmapData
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
		var bd = new BitmapData(Mathematics.ceil(bounds.width * scale), Mathematics.ceil(bounds.height * scale), true, ColorUtil.toARGB(0xffffff, 0));
		#else
		var bd = new BitmapData(Mathematics.ceil(bounds.width * scale), Mathematics.ceil(bounds.height * scale), true, 0xffffff);
		#end

		bd.draw(d, new Matrix(scale, 0, 0, scale, center.x, center.y), null, null, null, false);
		
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

}
