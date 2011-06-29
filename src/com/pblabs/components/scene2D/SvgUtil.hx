package com.pblabs.components.scene2D;

import de.polygonal.core.math.Mathematics;

#if flash
enum RenderLib {
	SVGWEB;
	GM2D;
}
#end

class SvgUtil
{
	#if flash
	static var INVISIBLE_STAGE :flash.display.Sprite;
	#end
	
	#if js
	/**
	  * innerHTML does not allow the svg prelude junk.
	  */
	inline public static function cleanSvgForInnerHtml (svg :String) :String
	{
		return svg.substr(svg.indexOf("<svg"));
	}
	#end
	
	#if flash
	public static function renderSvg (svgData :String, cb :flash.display.DisplayObject->Void, ?renderLib :RenderLib) :Void
	{
		renderLib = renderLib == null ? RenderLib.GM2D : renderLib;
		if (renderLib ==  SVGWEB) {
			renderSvgWithSvgWeb(svgData, cb);
		} else {
			cb(renderSvgWithGM2D(svgData));
		}
	}
	
	public static function renderSvgWithSvgWeb (svgData :String, cb :flash.display.DisplayObject->Void) :Void
	{
		/**
		  * svgweb has 2 issues:
		  *  1) It takes a number of frames to (asynchronously) render the svg
		  *  2) It cancels the rendering if the sprite is removed from the stage
		  *      before the rendering is finished (recieves a Event.REMOVED_FROM_STAGE).
		  * To deal with this, we create a hidden sprite attached to the stage, 
		  * and use that as our sprite parent until the svg has finished rendering
		  * and dispatched the render finish event.
		  * http://code.google.com/p/svgweb/issues/detail?id=265
		  */
		if (INVISIBLE_STAGE == null) {
			INVISIBLE_STAGE = new flash.display.Sprite();
			INVISIBLE_STAGE.mouseChildren = INVISIBLE_STAGE.mouseEnabled = false;
			flash.Lib.current.stage.addChild(INVISIBLE_STAGE);
			INVISIBLE_STAGE.visible = false;
			INVISIBLE_STAGE.x = 5000;
		}
		
		var svg = new org.svgweb.SVGViewerFlash();
		INVISIBLE_STAGE.addChild(svg);
		
		svg.xml = new flash.xml.XML(svgData);
		com.pblabs.util.EventDispatcherUtil.addOnceListener(svg.svgRoot, org.svgweb.events.SVGEvent.SVGLoad, 
			function (ignored :Dynamic) :Void {
				cb(svg);
			});
	}
	
	public static function renderSvgWithGM2D (svgData :String) :flash.display.DisplayObject
	{
		var xml:Xml = Xml.parse(svgData);
		var svg = new gm2d.svg.SVG2Gfx(xml);
		
		var shape = svg.CreateShape();
		shape.cacheAsBitmap = true;
		return shape;
	}
	#elseif js
	public static function renderSvg (svgData :String, canvas :easel.easel.display.Canvas, ?offset :XY, ?cb :Void->Void) :Void
	{
		com.pblabs.util.Assert.isNotNull(svgData);
		com.pblabs.util.Assert.isNotNull(canvas);
		com.pblabs.util.Assert.isNotNull(cb);
		var args = { ignoreMouse: true, ignoreAnimation: true, ignoreDimensions: false, ignoreClear: true, renderCallback :function (?_) :Void {
			cb();
		}};
		
		if (offset != null && offset.x != 0 && offset.y != 0) {
			Reflect.setField(args, "offsetX", offset.x);
			Reflect.setField(args, "offsetY", offset.y);
		}
		try {
			untyped canvg(canvas, svgData, args);
		} catch (e :Dynamic) {
			com.pblabs.util.Log.error("Error rendering svg from canvg");
			com.pblabs.util.Log.error(com.pblabs.util.Log.getStackTrace());
		}
	}
	#end
}
