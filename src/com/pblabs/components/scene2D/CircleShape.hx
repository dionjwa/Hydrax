/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D;

import com.pblabs.engine.core.ObjectType;
import org.transition9.geom.CircleUtil;

import org.transition9.util.StringUtil;

import de.polygonal.core.math.Vec2;

using com.pblabs.components.scene2D.SceneUtil;

class CircleShape extends ShapeComponent
{
	public var radius (get_radius, set_radius) :Float;
	public var showAngleLine :Bool;
	var _radius :Float;
	
	public function new ()
	{
		#if js
		_displayObject = com.pblabs.components.scene2D.js.SceneComponent.createDiv();
		_displayObject.style.cssText = org.transition9.util.DomUtil.setStyle(_displayObject.style.cssText, "border-radius", "50%");
		_displayObject.style.cssText = org.transition9.util.DomUtil.setStyle(_displayObject.style.cssText, "-moz-border-radius", "50%");
		#end
		
		super();
		
		#if js
		div.appendChild(_displayObject);
		#end
	}
	
	override public function containsWorldPoint (pos :Vec2, mask :ObjectType) :Bool
	{
		if (!objectMask.and(mask)) {
			return false;
		}
		return CircleUtil.isWithinCircle(pos, x - _locationOffset.x, y - _locationOffset.y, radius);
	}
	
	override function setDefaults () :Void
	{
		super.setDefaults();
		radius = 20;
		showAngleLine = true;
	}
	
	override public function redraw () :Void
	{
		com.pblabs.engine.debug.Profiler.enter("redraw");
		var r = _radius;
		#if (flash || cpp)
		var g = cast(_displayObject, flash.display.Shape).graphics;
		g.clear();
		if (fillColor >= 0) {
			g.beginFill(fillColor);
			g.drawCircle(r, r, r);
			g.endFill();
		}
		g.lineStyle(lineStroke, lineColor);
		g.drawCircle(r, r, r);
		if (showAngleLine) {
			g.lineStyle(lineStroke, lineColor);
			g.moveTo(r, r);
			g.lineTo(r * 2, r);
		}
		#elseif js
		
		_displayObject.style.cssText = org.transition9.util.DomUtil.setStyle(_displayObject.style.cssText, "-webkit-border-radius", _radius + "px");
		
		_displayObject.style.cssText = org.transition9.util.DomUtil.setStyle(_displayObject.style.cssText, "border", _lineStroke + "px solid " + StringUtil.toColorString(lineColor, "#"));
		_displayObject.style.cssText = org.transition9.util.DomUtil.setStyle(_displayObject.style.cssText, "background-color", StringUtil.toColorString(fillColor, "#"));
		_displayObject.style.width = (_radius * 2) + "px";
		_displayObject.style.height = (_radius * 2) + "px";
		#end
		com.pblabs.engine.debug.Profiler.exit("redraw");
	}
	
	#if js
	override public function drawPixels (ctx :CanvasRenderingContext2D)
	{
		ctx.beginPath();
		ctx.arc(radius, radius, radius, 0, Math.PI*2, true);
		ctx.fillStyle = StringUtil.toColorString(fillColor, "#");
		ctx.fill();
		ctx.closePath();
		ctx.strokeStyle = StringUtil.toColorString(lineColor, "#");
		if (lineStroke > 0) {
			ctx.lineWidth = lineStroke;
			ctx.beginPath();
			ctx.arc(radius, radius, radius, 0, Math.PI*2, true);
			ctx.stroke();
		}
	}
	#end
	
	override function onRemove () :Void
	{
		super.onRemove();
		showAngleLine = true;
	}
	
	override function get_height () :Float
	{
		return get_radius() * 2;
	}
	
	override function set_height (val :Float) :Float
	{
		return set_radius(val / 2);
	}
	
	override function get_width () :Float
	{
		return get_radius() * 2;
	}
	
	override function set_width (val :Float) :Float
	{
		return set_radius(val / 2);
	}
	
	function get_radius () :Float
	{
		return _radius;
	}
	
	function set_radius (val :Float) :Float
	{
		if (_radius == val) {
			return val;
		}
		_radius = val;
		
		_unscaledBounds.x = _unscaledBounds.y = _radius * 2;
		_bounds.minX = -_radius;
		_bounds.maxX = _radius;
		_bounds.minY = -_radius;
		_bounds.maxY = _radius;
		
		_scaleX = 1;
		_scaleY = 1;
		
		registrationPoint.x = _radius;
		registrationPoint.y = _radius;
		_isTransformDirty = true;
		redraw();
		return val;
	}
}
