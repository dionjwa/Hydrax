package com.pblabs.components.scene2D;

import de.polygonal.core.math.Mathematics;
import de.polygonal.motor2.geom.math.XY;
import de.polygonal.motor2.geom.primitive.AABB2;

import flash.geom.Matrix;

using StringTools;

using com.pblabs.util.NumberUtil;
using com.pblabs.util.StringUtil;
using com.pblabs.util.XmlUtil;

using de.polygonal.core.math.Mathematics;

#if flash
enum RenderLib {
	SVGWEB;
	GM2D;
}
#end

class SvgUtil
{
	static var mTranslateMatch = ~/translate\((.*),(.*)\)/;
    static var mScaleMatch = ~/scale\((.*)\)/;
    static var mMatrixMatch = ~/matrix\((.*),(.*),(.*),(.*),(.*),(.*)\)/;
    
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
	public static function renderSvg (svgData :String, cb :flash.display.DisplayObject->Void, ?renderLib :RenderLib = null) :Void
	{
		com.pblabs.util.Assert.isNotNull(svgData);
		com.pblabs.util.Assert.isNotNull(cb);
		renderLib = renderLib == null ? RenderLib.SVGWEB : renderLib;
		if (renderLib == SVGWEB) {
			#if enable_svgweb
			renderSvgWithSvgWeb(svgData, cb);
			#else
			trace("throwing missing svgweb stuff");
			throw "You must add the compiler switch -D enable_svgweb and add the swf lib 'hydrax/lib/svgweb/svgweb.swf'";
			#end
		} else {
			var disp = renderSvgWithGM2D(svgData);
			cb(disp);
		}
	}
	
	#if enable_svgweb
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
	#end
	
	public static function renderSvgWithGM2D (svgData :String) :flash.display.DisplayObject
	{
		com.pblabs.util.Assert.isFalse(svgData.isBlank());
		var xml = Xml.parse(svgData);
		var svg = new gm2d.svg.SVG2Gfx(xml);
		
		var shape = svg.CreateShape();
		shape.cacheAsBitmap = true;
		return shape;
	}
	#elseif js
	public static function renderSvg (svgData :String, canvas :easel.display.Canvas, ?offset :XY, ?cb :Void->Void) :Void
	{
		com.pblabs.util.Assert.isNotNull(svgData);
		com.pblabs.util.Assert.isNotNull(canvas);
		// com.pblabs.util.Assert.isNotNull(cb);
		var args = { ignoreMouse: true, ignoreAnimation: true, ignoreDimensions: false, ignoreClear: true, renderCallback :function (?_) :Void {
			if (cb != null) {
				cb();
			}
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
	
	inline public static function matrixToString(matrix :flash.geom.Matrix) :String
	{
		return "matrix(" + matrix.a.maxPrecision(4) + ", " + matrix.b.maxPrecision(4) + ", " + matrix.c.maxPrecision(4) + ", " + matrix.d.maxPrecision(4) + ", " + matrix.tx.maxPrecision(4) + ", " + matrix.ty.maxPrecision(4) + ")";
	}
	
	public static function parseRectBounds(rect :Xml) :AABB2
	{
		var bounds = new AABB2();
		bounds.xmin = Std.parseFloat(rect.get("x"));
		bounds.ymin = Std.parseFloat(rect.get("y"));
		bounds.xmax = bounds.xmin + Std.parseFloat(rect.get("width"));
		bounds.ymax = bounds.ymin + Std.parseFloat(rect.get("height"));
		return bounds;
	}
	
	public static function getAbsoluteTransform (svgElement :Xml) :Matrix
	{
		if (svgElement == null) {
			return new Matrix();
		}
	    var m = parseTransform(svgElement.get("transform"));
	    svgElement = svgElement.parent;
	    while (svgElement != null && svgElement.nodeType == Xml.Element && svgElement.nodeName != "svg:svg") {
	    	m.concat(parseTransform(svgElement.get("transform")));
	    	svgElement = svgElement.parent;
	    }
	    return m;
	}
	
	
	public static function parseTransform (inTrans:String) :Matrix
	{
		var ioMatrix = new Matrix();
       var scale = 1.0;
       if (mTranslateMatch.match(inTrans))
       {
          // TODO: Pre-translate
          ioMatrix.translate(
                  Std.parseFloat( mTranslateMatch.matched(1) ),
                  Std.parseFloat( mTranslateMatch.matched(2) ));
       }
       else if (mScaleMatch.match(inTrans))
       {
          // TODO: Pre-scale
          var s = Std.parseFloat( mScaleMatch.matched(1) );
          ioMatrix.scale(s,s);
          scale = s;
       }
       else if (mMatrixMatch.match(inTrans))
       {
          var m = new Matrix(
                  Std.parseFloat( mMatrixMatch.matched(1) ),
                  Std.parseFloat( mMatrixMatch.matched(2) ),
                  Std.parseFloat( mMatrixMatch.matched(3) ),
                  Std.parseFloat( mMatrixMatch.matched(4) ),
                  Std.parseFloat( mMatrixMatch.matched(5) ),
                  Std.parseFloat( mMatrixMatch.matched(6) ) );
          m.concat(ioMatrix);
          ioMatrix.a = m.a;
          ioMatrix.b = m.b;
          ioMatrix.c = m.c;
          ioMatrix.d = m.d;
          ioMatrix.tx = m.tx;
          ioMatrix.ty = m.ty;
          scale = Math.sqrt( ioMatrix.a*ioMatrix.a + ioMatrix.c*ioMatrix.c );
       }
       else {
          // trace("Warning, unknown transform:" + inTrans);
       }
       return ioMatrix;
    }
    
    
    
    public static function setStyle (xml :Xml, name :String, value :String) :Void
    {
        if (xml.get("style") == null) {
        	xml.set("style", name + ":" + value);
        } else {
        	var style = xml.get("style");
        	var styleTokens = style.split(";");
        	for (ii in 0...styleTokens.length) {
        		if (styleTokens[ii].split(":")[0].trim() == name) {
        			styleTokens[ii] = name + ":" + value;
        			xml.set("style", styleTokens.join(";"));
        			return;
        		}
        	}
        	xml.set("style", style + ";" + name + ":" + value);
        }
    }
    
	
}
