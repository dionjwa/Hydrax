/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D;

import com.pblabs.geom.RectangleTools;
import com.pblabs.geom.Vector2;
import com.pblabs.util.StringUtil;
using com.pblabs.components.scene2D.SceneUtil;

class RectangleShape extends ShapeComponent
{
	#if js
	var _svgFill :js.Dom.HtmlDom;
	#end
	public function new (?w :Float = 20.0, ?h :Float = 100.0)
	{
		super();
		
		#if js
		_svgContainer = untyped js.Lib.document.createElementNS(SceneUtil.SVG_NAMESPACE, "svg");
		div.appendChild(_svgContainer);
		div.style.width = "100%";
		div.style.height = "100%";
		_svgContainer.setAttribute("width", w + "px");
		_svgContainer.setAttribute("height", h + "px");
		_svgContainer.setAttribute("x", "0px");
		_svgContainer.setAttribute("y", "0px");
		_svgContainer.setAttribute("version", "1.1");
		
		_svgFill = untyped js.Lib.document.createElementNS(SceneUtil.SVG_NAMESPACE, "rect");
		_svgContainer.appendChild(_svgFill);
		
		_svg = untyped js.Lib.document.createElementNS(SceneUtil.SVG_NAMESPACE, "rect");
		_svgContainer.appendChild(_svg);
		#end
		
		_bounds = _unscaledBounds.clone();
		width = w;
		height = h;
	}
	
	override function redraw () :Void
	{
		#if (flash || cpp)
		var zoom = parent != null && parent.parent != null ? parent.parent.zoom : 1.0;
		var g = cast(_displayObject, flash.display.Shape).graphics;
		g.clear();
		g.beginFill(this.fillColor, 1);
		g.drawRect(0, 0, width, height);
		g.endFill();
		g.lineStyle(borderStroke, borderColor, 1.0);
		g.drawRect(0, 0, width - borderStroke, height - borderStroke);
		#elseif js
		_svg.setAttribute("width", Std.string(width));
		_svg.setAttribute("height", Std.string(height));
		_svg.setAttribute("fill", "#000000");
		_svg.setAttribute("fill-opacity", "0");
		_svg.setAttribute("stroke-opacity", "" + alpha);
		_svg.setAttribute( "stroke",  StringUtil.toColorString(borderColor, "#"));
		_svg.setAttribute( "stroke-width",  "" + borderStroke);
		
		_svgFill.setAttribute("width", Std.string(width));
		_svgFill.setAttribute("height", Std.string(height));
		_svgFill.setAttribute("fill", StringUtil.toColorString(fillColor, "#"));
		_svgFill.setAttribute("fill-opacity", "" + alpha);
		_svgFill.setAttribute( "stroke",  "#000000");
		_svgFill.setAttribute( "stroke-width",  "0");
		_svgFill.setAttribute("stroke-opacity", "0");
		
		_svgContainer.setAttribute("width", width + "px");
		_svgContainer.setAttribute("height", height + "px");
		_svgContainer.setAttribute("viewBox", "0 0 " + width + " " + height);
		#end
	}
	
	#if js
	override public function drawPixels (ctx :easel.display.Context2d)
	{
		ctx.fillStyle = StringUtil.toColorString(fillColor, "#");
		ctx.fillRect(0, 0, width, height);
		if (borderStroke > 0) {
			ctx.strokeStyle = StringUtil.toColorString(borderColor, "#");
			ctx.lineWidth = borderStroke;
			ctx.beginPath();
			ctx.rect(0, 0, width, height);
			ctx.stroke();
		}
	}
	#end
	
	override function set_width (val :Float) :Float
	{
		com.pblabs.util.Assert.isTrue(val >= 0, "val=" + val + " " + com.pblabs.util.Log.getStackTrace());
		var unscaledWidth = val / _scaleX;
		_unscaledBounds.xmin = _x - unscaledWidth / 2;
		_unscaledBounds.xmax = _x + unscaledWidth / 2;
		_bounds.xmin = _x - val / 2;
		_bounds.xmax = _x + val / 2;
		_scaleX = val / unscaledWidth;
		registrationPoint.x = _bounds.intervalX / 2;
		isTransformDirty = true;
		redraw();
		return val;
	}
	
	override function set_height (val :Float) :Float
	{
		com.pblabs.util.Assert.isTrue(val >= 0, "val=" + val + " " + com.pblabs.util.Log.getStackTrace());
		var unscaledHeight = val / _scaleY;
		_unscaledBounds.ymin = _y - unscaledHeight / 2;
		_unscaledBounds.ymax = _y + unscaledHeight / 2;
		_bounds.ymin = _y - val / 2;
		_bounds.ymax = _y + val / 2;
		_scaleY = val / unscaledHeight;
		registrationPoint.y = _bounds.intervalY / 2;
		isTransformDirty = true;
		redraw();
		return val;
	}
	
}
