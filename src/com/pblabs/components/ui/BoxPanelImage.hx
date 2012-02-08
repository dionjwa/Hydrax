package com.pblabs.components.ui;

import com.pblabs.components.minimalcomp.Component;
import com.pblabs.components.minimalcomp.Container;
import com.pblabs.components.scene2D.BitmapRenderer;
import com.pblabs.components.scene2D.GraphicsComponent;
import com.pblabs.components.spatial.SpatialComponent;
import com.pblabs.engine.time.IProcessManager;

import de.polygonal.core.math.Vec2;

import org.transition9.util.F;

using com.pblabs.engine.core.SignalBondManager;
using org.transition9.util.StringUtil;
using com.pblabs.components.scene2D.SceneUtil;
#if js
using org.transition9.util.DomUtil;
#end

/**
  * An image that redraws itself if the container component is redrawn.
  */
class BoxPanelImage
	// #if flash
	// extends GraphicsComponent
	// #elseif js
	extends com.pblabs.components.scene2D.RectangleShape
	// #end
{
	public var dividerColor (get_dividerColor, set_dividerColor) :Int;
	var _dividerColor :Int;
	function get_dividerColor () :Int
	{
		return _dividerColor;
	}
	function set_dividerColor (val :Int) :Int
	{
		_dividerColor = val;
		redraw();
		return val;
	}
	
	public var dividerLineWidth (get_dividerLineWidth, set_dividerLineWidth) :Float;
	var _dividerLineWidth :Float;
	function get_dividerLineWidth () :Float
	{
		return _dividerLineWidth;
	}
	function set_dividerLineWidth (val :Float) :Float
	{
		_dividerLineWidth = val;
		redraw();
		return val;
	}
	
	var _needsRedraw :Bool;
	
	public function new ()
	{
		super();
	}
	
	override function onReset () :Void
	{
		super.onReset();
		var component = owner.getComponent(Container);
		if (component != null) {
			bindSignal(component.redrawSignal, F.ignoreArg(redraw));
		}
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		setDefaults();
	}
	
	override function setDefaults () :Void
	{
		_needsRedraw = false;
		super.setDefaults();
		_fillColor = 0xffffff;
		_lineColor = 0x000000;
		_lineStroke = 1;
		_lineAlpha = 1;
		_dividerColor = 0x000000;
		_dividerLineWidth = 1;
		borderRadius = 10;
	}
	
	override public function redraw () :Void
	{
		if (!_needsRedraw && context != null && isRegistered) {
			_needsRedraw = true;
			context.getManager(IProcessManager).callLater(redrawInternal);
		}
	}
	
	function redrawInternal () :Void
	{
		if (!_needsRedraw || ! isRegistered) {
			return;
		}
		
		var component = owner.getComponent(Container);
		org.transition9.util.Assert.isNotNull(component, ' component is null');
		
		var bounds = component.bounds;
		
		if (Math.isNaN(bounds.centerX) || Math.isNaN(bounds.centerY)) {
			return;
		}
		
		width = bounds.intervalX;
		height = bounds.intervalY;
		super.redraw();
		
		_needsRedraw = false;
		
		var gap = 3;
		
		#if flash
			// var g = graphics;
			var g = cast(_displayObject, flash.display.Shape).graphics;
			//Draw the dividers
			var curY = 0.0;
			for (ii in 0...component.children.length) {
				var c = component.children[ii];
				if (ii == 0) {
					curY += c.height;
					continue;
				}
				g.moveTo(0, curY);
				g.lineTo(bounds.intervalX, curY);
				curY += c.height;
			}
			
		#elseif js
		_displayObject.removeAllChildren();
		
		_displayObject.style.width = bounds.intervalX + "px";
		_displayObject.style.height = bounds.intervalY + "px";
		
		//Draw the dividers as divs
		var curY = 0.0;
		for (ii in 0...component.children.length) {
			var c = component.children[ii];
			if (ii == 0) {
				curY += c.height;
				continue;
			}
			var lineDiv = com.pblabs.components.scene2D.js.SceneComponent.createDiv();
			_displayObject.appendChild(lineDiv);
			var m = new flash.geom.Matrix();
			m.translate(gap, curY);
			lineDiv.applyTransform(m);
			
			lineDiv.style.cssText = org.transition9.util.DomUtil.setStyle(lineDiv.style.cssText, "height", Std.int(Math.max(1, _dividerLineWidth)) + "px");
			lineDiv.style.cssText = org.transition9.util.DomUtil.setStyle(lineDiv.style.cssText, "position", "relative");
			lineDiv.style.cssText = org.transition9.util.DomUtil.setStyle(lineDiv.style.cssText, "width", (bounds.intervalX - gap * 2) + "px");
			lineDiv.style.cssText = org.transition9.util.DomUtil.setStyle(lineDiv.style.cssText, "background", _dividerColor.toColorString("#"));
			
			curY += c.height;
		}
		registrationPoint = new Vec2(x - bounds.minX, y - bounds.minY);
		#end
	}
	
	#if js
	override public function drawPixels (ctx :CanvasRenderingContext2D)
	{
		super.drawPixels(ctx);
		
		var component = owner.getComponent(Container);
		org.transition9.util.Assert.isNotNull(component, ' component is null');
		
		var bounds = component.bounds;
		var gap = 3;
		//Draw the dividers
		var curY = 0.0;
		for (ii in 0...component.children.length) {
			var c = component.children[ii];
			if (ii == 0) {
				curY += c.height;
				continue;
			}
			ctx.moveTo(gap, curY);
			ctx.lineTo(bounds.intervalX - gap, curY);
			curY += c.height;
		}
		ctx.lineWidth = _dividerLineWidth;
		ctx.strokeStyle = _dividerColor.toColorString("#");
		ctx.stroke();
	}
	#end

}
