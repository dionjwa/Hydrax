/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D;
import com.pblabs.components.input.IInteractiveComponent;
import com.pblabs.engine.core.ObjectType;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.geom.RectangleTools;
import com.pblabs.util.StringUtil;
import com.pblabs.util.ds.Tuple;

import de.polygonal.motor2.geom.math.XY;

using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.engine.resource.ResourceToken;

/**
  * !!Still experimental!
  * Cross platform SVG based Scene2D component.
  * Currently only tested in Flash, CSS coming soon, Canvas maybe
  */
class SVGComponent 
#if js
	#if css
	extends com.pblabs.components.scene2D.js.css.SceneComponent
	#else
	extends com.pblabs.components.scene2D.js.canvas.SceneComponent
	#end
#elseif (flash || cpp)
extends com.pblabs.components.scene2D.flash.SceneComponent 
#end
{
	/** The IResource name and item id */
	#if (flash || cpp)
	public var resourceToken :ResourceToken<flash.display.Sprite>;
	#elseif css
	public var resourceToken :ResourceToken<Dynamic>;
	#else
	//Canvas
	public var resourceToken :ResourceToken<Dynamic>;
	var _svgData :String;
	#end
	
	public function new () :Void
	{
		super();
	}
	
	#if debug
	public function toString () :String
	{
		return StringUtil.objectToString(this, ["x", "y", "_width", "_height"]);
	}
	#end
	
	override function onAdd () :Void
	{
		#if (flash || cpp)
		//An extra layer so the SVG can be offset so that the origin is the image center
		// var s = context.allocate(flash.display.Sprite);
		// s.mouseEnabled = s.mouseChildren = false;
		// _displayObject = s;
		var svg :flash.display.Sprite = context.get(resourceToken);
		com.pblabs.util.Assert.isNotNull(svg);
		_displayObject = svg;
		super.onAdd();
		#elseif css
		//Get the DomResource, this makes sure the inline svg is loaded
		super.onAdd();
		if (displayObject == null) {
			if (resourceToken != null) {
				var svg :js.Dom.HtmlDom = context.get(resourceToken);
				com.pblabs.util.Assert.isNotNull(svg, "SVG loaded from " + resourceToken + " is null");
				displayObject = svg;
			}
			
		} else if (resourceToken != null) {
			com.pblabs.util.Log.warn("Both displayObject AND the resource token are not null");
		}
		#if debug
		com.pblabs.util.Assert.isFalse(Math.isNaN(_width));
		com.pblabs.util.Assert.isFalse(Math.isNaN(_height));
		#end
		
		isTransformDirty = true;
		#else
		//Canvas
		com.pblabs.util.Assert.isNotNull(resourceToken);
		_svgData = Std.string(context.get(resourceToken));
		super.onAdd();
		#end
		
		
		
		// #if js

		// #elseif (flash || cpp)
		// // throw "Not implemented";

		// // registrationPoint = new com.pblabs.geom.Vector2(_displayObject.width / 2, _displayObject.height / 2); 
		// #end
		
		// // #if js
		
		// // #else
		
		// #if (flash || cpp)
		// // cast(_displayObject, flash.display.Sprite).addChild(svg);
		// //Offset so in the center
		// // svg.x = -svg.width / 2;
		// // svg.y = -svg.height / 2;
		// #end
		
		
	}
	
	#if css
	override public function onFrame (dt :Float) :Void
	{
		if (isTransformDirty && parent != null) {
			isTransformDirty = false;
			var xOffset = parent.xOffset;
			var yOffset = parent.yOffset;
			untyped div.style.webkitTransform = "translate(" + (_x + xOffset) + "px, " + (_y + yOffset) + "px) rotate(" + _angle + "rad)";
		}
	}
	
	override function set_width (val :Float) :Float
	{
		return super.set_width(val);
	}
	
	override function set_height (val :Float) :Float
	{
		return super.set_height(val);
	}
	#end
	
	#if (js && !css)
	override function onRemove () :Void
	{
		super.onRemove();
		_svgData = null;
	}
	
	override public function draw (ctx :easel.display.Context2d)
	{
		// ctx.drawImage(displayObject, -displayObject.width / 2, -displayObject.height / 2);
		// untyped ctx.drawSvg(_svgData, 0, 0);
		// trace("rendering svg?");
		// trace(Reflect.hasField(ctx.canvas, "drawSvg"));
		// trace("Type.getClass(ctx)=" + Type.getClass(ctx));
		// trace(Type.getInstanceFields(Type.getClass(ctx)));
		var c = js.Lib.document.getElementById('canvas');
		// trace("c=" + c);
		// com.pblabs.util.Assert.isNotNull(c);
		// var context2D = untyped c.getContext('2d');
		untyped __js__('c.drawSvg(_svgData, 0, 0)');
		// c.drawSvg(_svgData);
		ctx.drawImage(c, 0, 0);
		// untyped __js__("canvg(ctx.canvas, _svgData, { ignoreMouse: true, ignoreAnimation: true })");
		// untyped __js__('ctx.canvas.drawSvg(_svgData, 0, 0)');
		
	}
	
	#end
	
	
	
}
