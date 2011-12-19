/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D;

import org.transition9.geom.RectangleTools;
import org.transition9.util.StringUtil;

import de.polygonal.motor.geom.primitive.AABB2;

using com.pblabs.components.scene2D.SceneUtil;

class RectangleShape extends ShapeComponent
{
	public var borderRadius (get_borderRadius, set_borderRadius) :Int;
	var _borderRadius :Int;
	function get_borderRadius () :Int
	{
		return _borderRadius;
	}
	function set_borderRadius (val :Int) :Int
	{
		_borderRadius = val;
		#if js
		for (cssName in ["-moz-border-radius", "-webkit-border-radius", "-khtml-border-radius", "border-radius"]) {
			_displayObject.style.cssText = org.transition9.util.DomUtil.setStyle(_displayObject.style.cssText, cssName, _borderRadius + "px");	
		}
		#end
		redraw();
		return val;
	}
	
	public function new (?w :Float = 20.0, ?h :Float = 100.0)
	{
		
		
		#if js
		_displayObject = com.pblabs.components.scene2D.js.SceneComponent.createDiv();
		#end
		
		super();
		
		#if js
		div.appendChild(_displayObject);
		#end
		
		_unscaledBounds.x = w;
		_unscaledBounds.y = h;
		_bounds = new AABB2();
		_bounds.xmin = -_unscaledBounds.x / 2;
		_bounds.xmax = _unscaledBounds.x / 2;
		_bounds.ymin = -_unscaledBounds.y / 2;
		_bounds.ymax = _unscaledBounds.y / 2;
		width = w;
		height = h;
	}
	
	override function setDefaults () :Void
	{
		super.setDefaults();
		borderRadius = 0;
	}
	
	override function redraw () :Void
	{
		#if (flash || cpp)
		var zoom = parent != null && parent.parent != null ? parent.parent.zoom : 1.0;
		var g = cast(_displayObject, flash.display.Shape).graphics;
		g.clear();
		g.beginFill(fillColor, 1);
		g.drawRoundRect(0, 0, width, height, _borderRadius);
		g.endFill();
		g.lineStyle(lineStroke, lineColor, 1.0);
		g.drawRoundRect(0, 0, width - lineStroke, height - lineStroke, _borderRadius);
		#elseif js
		_displayObject.style.cssText = org.transition9.util.DomUtil.setStyle(_displayObject.style.cssText, "border", _lineStroke + "px solid " + StringUtil.toColorString(lineColor, "#"));
		_displayObject.style.cssText = org.transition9.util.DomUtil.setStyle(_displayObject.style.cssText, "background-color", StringUtil.toColorString(fillColor, "#"));
		_displayObject.style.width = _bounds.intervalX + "px";
		_displayObject.style.height = _bounds.intervalY + "px";
		#end
	}
	
	#if js
	override public function drawPixels (ctx :CanvasRenderingContext2D)
	{
		if (_borderRadius == 0) {
			ctx.fillStyle = StringUtil.toColorString(fillColor, "#");
			ctx.fillRect(0, 0, Std.int(width), Std.int(height));
			if (lineStroke > 0) {
				ctx.strokeStyle = StringUtil.toColorString(lineColor, "#");
				ctx.lineWidth = lineStroke;
				ctx.beginPath();
				ctx.rect(0, 0, width, height);
				ctx.stroke();
			}
		} else {
			
			var w = Std.int(_bounds.intervalX);
			var h = Std.int(_bounds.intervalY);
			
			ctx.beginPath();
			ctx.moveTo(_borderRadius, 0);
			ctx.lineTo(w-_borderRadius, 0);
			ctx.quadraticCurveTo(w, 0, w, _borderRadius);
			ctx.lineTo(w, h-_borderRadius);
			ctx.quadraticCurveTo(w, h, w-_borderRadius, h);
			ctx.lineTo(_borderRadius, h);
			ctx.quadraticCurveTo(0, h, 0, h-_borderRadius);
			ctx.lineTo(0, _borderRadius);
			ctx.quadraticCurveTo(0, 0, _borderRadius, 0);
			
			ctx.fillStyle = StringUtil.toColorString(fillColor, "#");
			ctx.fill();
			
			ctx.lineWidth = lineStroke;
			ctx.strokeStyle = StringUtil.toColorString(lineColor, "#");
			ctx.stroke();
			
			
		}
	}
	#end
	
	override function set_width (val :Float) :Float
	{
		org.transition9.util.Assert.isTrue(val >= 0, "val=" + val + " " + org.transition9.util.Log.getStackTrace());
		var unscaledWidth = val / _scaleX;
		_unscaledBounds.x = unscaledWidth;
		_bounds.xmin = _x - val / 2;
		_bounds.xmax = _x + val / 2;
		_scaleX = val / unscaledWidth;
		registrationPoint.x = _bounds.intervalX / 2 + 1;
		isTransformDirty = true;
		redraw();
		return val;
	}
	
	override function set_height (val :Float) :Float
	{
		org.transition9.util.Assert.isTrue(val >= 0, "val=" + val + " " + org.transition9.util.Log.getStackTrace());
		var unscaledHeight = val / _scaleY;
		_unscaledBounds.y = unscaledHeight;
		_bounds.ymin = _y - val / 2;
		_bounds.ymax = _y + val / 2;
		_scaleY = val / unscaledHeight;
		registrationPoint.y = _bounds.intervalY / 2 + 1;
		isTransformDirty = true;
		redraw();
		return val;
	}
	
}
