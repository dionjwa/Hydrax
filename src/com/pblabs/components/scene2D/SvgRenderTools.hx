package com.pblabs.components.scene2D;

import com.pblabs.engine.resource.ResourceToken;
import org.transition9.util.svg.SvgData;

import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.Vec2;
import de.polygonal.motor.geom.primitive.AABB2;

import flash.geom.Matrix;

using StringTools;

using org.transition9.util.NumberUtil;
using org.transition9.util.StringUtil;
using org.transition9.util.XmlTools;
using org.transition9.util.svg.SvgTools;

using de.polygonal.core.math.Mathematics;

#if js
import org.transition9.util.DomUtil;
import jQuery.JQuery;
#end

#if flash
enum RenderLib {
	SVGWEB;
	GM2D;
}
#end
/**
  * Static methods for rendering Svg documents on different platforms and with different libraries (Flash).
  * It responds to the compiler switch "-D enable_svgweb", without this, gm2d rendering is used.
  */
class SvgRenderTools
{
	#if js
	public static var IS_INLINE_SVG = {
		JQueryStatic.browser.webkit && !(js.Lib.window.navigator.userAgent.indexOf("Android") > -1);
	};
	#end
	
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
	public static function renderSvg (svgData :SvgData, cb :flash.display.DisplayObject->Void, ?renderLib :RenderLib = null) :Void
	{
		org.transition9.util.Assert.isNotNull(svgData, ' svgData is null');
		// #if debug
		// trace("Rendering " + Xml.parse(svgData).ensureNotDocument().get("id"));
		// #end
		// trace("!!!!!!!!!!!!!!!!!!!flash rendering svg=" + svgData + "\n" + org.transition9.util.Log.getStackTrace());
		org.transition9.util.Assert.isNotNull(svgData);
		org.transition9.util.Assert.isNotNull(cb);
		renderLib = renderLib == null ? RenderLib.SVGWEB :renderLib;
		if (renderLib == SVGWEB) {
			#if enable_svgweb
			renderSvgWithSvgWeb(svgData, cb);
			#else
			org.transition9.util.Log.warn("You must add the compiler switch -D enable_svgweb and add the swf lib 'hydrax/lib/svgweb/svgweb.swf.\n Falling back to gm2d'");
			cb(renderSvgWithGM2D(svgData));
			// trace("throwing missing svgweb stuff");
			// throw "You must add the compiler switch -D enable_svgweb and add the swf lib 'hydrax/lib/svgweb/svgweb.swf'";
			#end
		} else {
			var disp = renderSvgWithGM2D(svgData);
			cb(disp);
		}
	}
	
	#if enable_svgweb
	public static function renderSvgWithSvgWeb (svgData :SvgData, cb :flash.display.DisplayObject->Void) :Void
	{
		// trace("rendering " + svgData);
		/**
		  * svgweb has 2 issues :
		  *  1) It takes a number of frames to (asynchronously) render the svg
		  *  2) It cancels the rendering if the sprite is removed from the stage
		  *	  before the rendering is finished (recieves a Event.REMOVED_FROM_STAGE).
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
		
		svg.xml = new flash.xml.XML(svgData.data);
		org.transition9.util.EventDispatcherUtil.addOnceListener(svg.svgRoot, org.svgweb.events.SVGEvent.SVGLoad,
			function (ignored :Dynamic) :Void {
				cb(svg);
			});
	}
	#end
	
	public static function renderSvgWithGM2D (svgData :SvgData) :flash.display.DisplayObject
	{
		try {
			var svg = new gm2d.svg.SVG2Gfx(svgData.xml);
			var shape = svg.CreateShape();
			shape.cacheAsBitmap = true;
			#if debug_graphics
			org.transition9.util.DebugUtil.drawBoundingRectShape(shape, shape);
			#end
			return shape;
		} catch (e :Dynamic) {
			trace("Problem rendering svg " + e);
			trace(svgData.data);
			throw e;
			return null;
		}
	}
	#elseif js
	public static function renderSvg (svgData :SvgData, canvas :Canvas, ?offset :Vec2, ?cb :Void->Void, ?ignoreDimensions :Bool = false) :Void
	{
		org.transition9.util.Assert.isNotNull(svgData);
		org.transition9.util.Assert.isNotNull(canvas);
		var args = { ignoreMouse :true, ignoreAnimation :true, ignoreDimensions :ignoreDimensions, ignoreClear :true, renderCallback :function (?_) :Void {
			if (cb != null) {
				cb();
			}
		}};
		
		org.transition9.util.Assert.isTrue(canvas.width > 0);
		org.transition9.util.Assert.isTrue(canvas.height > 0);
		
		if (offset != null && offset.x != 0 && offset.y != 0) {
			Reflect.setField(args, "offsetX", offset.x);
			Reflect.setField(args, "offsetY", offset.y);
		}
		try {
			//If you don't remove the canvas from the parent, there's a bug that results in an internal canvas.width==0 bug
			//sometimes.  This needs to be reported to the canvg site.
			var parent = canvas.parentNode;
			if (parent != null) {
				parent.removeChild(canvas);
			}
			untyped canvg(canvas, svgData.data, args);
			if (parent != null) {
				parent.appendChild(canvas);
			}
			#if debug_graphics
			var context = canvas.getContext("2d");
			context.setTransform(1,0,0,1,0,0);
			context.beginPath();
			context.moveTo(0, 0);
			context.lineTo(canvas.width, 0);
			context.moveTo(canvas.width, 0);
			context.lineTo(canvas.width, canvas.height);
			context.moveTo(canvas.width, canvas.height);
			context.lineTo(0, canvas.height);
			context.moveTo(0, canvas.height);
			context.lineTo(0, 0);
			context.strokeStyle = "#ff0000";
			context.stroke();
			#end
			
		} catch (e :Dynamic) {
			org.transition9.util.Log.error("Error rendering svg from canvg " + e + "\n canvas=" + canvas + ", svg=" + svgData);
			org.transition9.util.Log.error(org.transition9.util.Log.getStackTrace());
		}
	}
	#end
	
	inline public static function matrixToString(matrix :flash.geom.Matrix) :String
	{
		return "matrix(" + matrix.a.maxPrecision(4) + ", " + matrix.b.maxPrecision(4) + ", " + matrix.c.maxPrecision(4) + ", " + matrix.d.maxPrecision(4) + ", " + matrix.tx.maxPrecision(4) + ", " + matrix.ty.maxPrecision(4) + ")";
	}
	
	public static function parseElementBounds(svg :Xml) :AABB2
	{
		var bounds = new AABB2();
		if (svg.get('viewBox') != null) {
			var tokens = svg.get("viewBox").split(" ");
			bounds.xmin = Std.parseFloat(tokens[0]);
			bounds.ymin = Std.parseFloat(tokens[1]);
			bounds.xmax = bounds.xmin + Std.parseFloat(tokens[2]);
			bounds.ymax = bounds.ymin + Std.parseFloat(tokens[3]);
		} else {
			bounds.xmin = svg.get("x") != null ? Std.parseFloat(svg.get("x")) :0.0;
			bounds.ymin = svg.get("y") != null ? Std.parseFloat(svg.get("y")) :0.0;
			bounds.xmax = bounds.xmin + Std.parseFloat(svg.get("width"));
			bounds.ymax = bounds.ymin + Std.parseFloat(svg.get("height"));
		}
		return bounds;
	}
	
	public static function getSvgBounds (svgElement :Xml) :AABB2
	{
		if (svgElement == null) {
			return new AABB2();
		}
		if (svgElement.nodeName == "svg".svgId()) {
			return parseElementBounds(svgElement);
		} else {
			return getSvgBounds(svgElement.parent);
		}
	}
	
	public static function getAbsoluteTransform (svgElement :Xml) :Matrix
	{
		if (svgElement == null) {
			return new Matrix();
		}
		var m = svgElement.get("transform") == null ? new Matrix() : parseTransform(svgElement.get("transform"));
		svgElement = svgElement.parent;
		while (svgElement != null && svgElement.nodeType == Xml.Element && svgElement.nodeName != "svg".svgId()) {
			m.concat(svgElement.get("transform") == null ? new Matrix() : parseTransform(svgElement.get("transform")));
			svgElement = svgElement.parent;
		}
		return m;
	}
	
	public static function parseTransform (inTrans :String) :Matrix
	{
		var ioMatrix = new Matrix();
	   var scale = 1.0;
	   if (mTranslateMatch.match(inTrans))
	   {
		  // TODO :Pre-translate
		  ioMatrix.translate(
			  Std.parseFloat(mTranslateMatch.matched(1) ),
			  Std.parseFloat(mTranslateMatch.matched(2) ));
	   }
	   else if (mScaleMatch.match(inTrans))
	   {
		  // TODO :Pre-scale
		  var s = Std.parseFloat(mScaleMatch.matched(1) );
		  ioMatrix.scale(s,s);
		  scale = s;
	   }
	   else if (mMatrixMatch.match(inTrans))
	   {
		  var m = new Matrix(
			  Std.parseFloat(mMatrixMatch.matched(1) ),
			  Std.parseFloat(mMatrixMatch.matched(2) ),
			  Std.parseFloat(mMatrixMatch.matched(3) ),
			  Std.parseFloat(mMatrixMatch.matched(4) ),
			  Std.parseFloat(mMatrixMatch.matched(5) ),
			  Std.parseFloat(mMatrixMatch.matched(6) ) );
		  m.concat(ioMatrix);
		  ioMatrix.a = m.a;
		  ioMatrix.b = m.b;
		  ioMatrix.c = m.c;
		  ioMatrix.d = m.d;
		  ioMatrix.tx = m.tx;
		  ioMatrix.ty = m.ty;
		  scale = Math.sqrt(ioMatrix.a*ioMatrix.a + ioMatrix.c*ioMatrix.c );
	   }
	   else {
	   	   org.transition9.util.Log.warn("unknown transform :" + inTrans);
	   }
	   return ioMatrix;
	}
	
	public static function setStyle (xml :Xml, name :String, value :String) :Void
	{
		if (xml.get("style") == null) {
			xml.set("style", name + ":" + value);
		} else {
			var style = xml.get("style");
			xml.set("style", org.transition9.util.DomUtil.setStyle(style, name, value));
		}
	}
}
