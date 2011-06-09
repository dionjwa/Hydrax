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
import com.pblabs.geom.CircleUtil;
import com.pblabs.geom.Vector2;
import com.pblabs.util.StringUtil;

import de.polygonal.motor2.geom.math.XY;

using com.pblabs.components.scene2D.SceneUtil;

class CircleShape extends ShapeComponent
{
	public var radius (get_radius, set_radius) :Float;
	public var showAngleLine :Bool;
	var _radius :Float;
	public function new ()
	{
		super();
		
		_radius = 20.0;
		showAngleLine = true;
		#if js
		_svgContainer = untyped js.Lib.document.createElementNS("http://www.w3.org/2000/svg", "svg");
		div.appendChild(_svgContainer);
		_svgContainer.setAttribute("width", (_radius * 2) + "px");
		_svgContainer.setAttribute("height", (_radius * 2) + "px");
		_svgContainer.setAttribute("version", "1.1");

		_svg = untyped js.Lib.document.createElementNS("http://www.w3.org/2000/svg", "circle");
		_svgContainer.appendChild(_svg);
		#end
		
		_unscaledBounds.xmin = -_radius;
		_unscaledBounds.xmax = _radius;
		_unscaledBounds.ymin = -_radius;
		_unscaledBounds.ymax = _radius;
		_bounds = _unscaledBounds.clone();
		
		// radius = r;
	}
	
	override public function containsWorldPoint (pos :XY, mask :ObjectType) :Bool
	{
		return CircleUtil.isWithinCircle(pos, x + (- _registrationPoint.x * _scaleX) - _locationOffset.x, y + (- _registrationPoint.y * _scaleY) - _locationOffset.y, radius * _scaleX);
	}
	
	#if js
	override function onAdd () :Void
	{
		super.onAdd();
		com.pblabs.util.Log.debug("");
		
		//Put the element in the base div element
		//Why put it in a div?
		//http://dev.opera.com/articles/view/css3-transitions-and-2d-transforms/#transforms
		redraw();
		div.appendChild(_svgContainer);
		com.pblabs.util.Log.debug("finished");
	}
	#end
	
	override public function redraw () :Void
	{
		com.pblabs.engine.debug.Profiler.enter("redraw");
		var r = _radius;
		#if (flash || cpp)
		var zoom = parent != null && parent.parent != null ? parent.parent.zoom : 1.0;
		var g = cast(_displayObject, flash.display.Sprite).graphics;
		g.clear();
		if (fillColor >= 0) {
			g.beginFill(fillColor);
			g.drawCircle(0, 0, r);
			g.endFill();
		}
		g.lineStyle(0.0, borderColor);
		g.drawCircle(0, 0, r);
		if (showAngleLine) {
			g.lineStyle(0.0, borderColor);
			g.moveTo(0, 0);
			g.lineTo(r, 0);
		}
		recomputeBounds();
		#elseif js
		_svg.setAttribute("cx", r + "px");
		_svg.setAttribute("cy", r + "px");
		_svg.setAttribute( "r",  r + "px");
		_svg.setAttribute("fill", StringUtil.toColorString(fillColor, "#"));
		_svg.setAttribute( "stroke",  StringUtil.toColorString(borderColor, "#"));
		_svg.setAttribute( "stroke-width",  "" + borderStroke);
		
		_svgContainer.setAttribute("width", (r * 2) + "px");
		_svgContainer.setAttribute("height", (r * 2) + "px");
		#end
		com.pblabs.engine.debug.Profiler.exit("redraw");
	}
	
	#if js
	override public function draw (ctx :easel.display.Context2d)
	{
		ctx.beginPath();
		ctx.arc(0, 0, radius, 0, Math.PI*2, true);
		ctx.fillStyle = StringUtil.toColorString(fillColor, "#");
		ctx.fill();
		ctx.closePath();
		ctx.strokeStyle = StringUtil.toColorString(borderColor, "#");
		ctx.lineWidth = borderStroke;
		ctx.beginPath();
		ctx.arc(0, 0, radius, 0, Math.PI*2, true);
		ctx.stroke();
	}
	#end
	
	
	override function onRemove () :Void
	{
		super.onRemove();
		showAngleLine = true;
	}
	
	override function get_height () :Float
	{
		return get_radius();
	}
	
	override function set_height (val :Float) :Float
	{
		return set_radius(val);
	}
	
	override function get_width () :Float
	{
		return get_radius();
	}
	
	override function set_width (val :Float) :Float
	{
		return set_radius(val);
	}
	
	function get_radius () :Float
	{
		return _radius;
	}
	
	function set_radius (val :Float) :Float
	{
		_radius = val;
		_isTransformDirty = true;
		return val;
	}
	
	#if js
	var _svgContainer :js.Dom.HtmlDom;
	var _svg :js.Dom.HtmlDom;
	#end
}
