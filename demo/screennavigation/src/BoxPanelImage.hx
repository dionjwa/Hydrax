package ;

import com.pblabs.components.minimalcomp.Component;
import com.pblabs.components.minimalcomp.Container;
import com.pblabs.components.scene2D.BitmapRenderer;
import com.pblabs.components.scene2D.GraphicsComponent;
import com.pblabs.components.spatial.SpatialComponent;
import com.pblabs.engine.time.IProcessManager;
import com.pblabs.geom.Vector2;
import com.pblabs.util.F;
using com.pblabs.engine.core.SignalBondManager;
using com.pblabs.util.StringUtil;

/**
  * An image that redraws itself if the container component is redrawn.
  */
class BoxPanelImage
	#if flash
	extends GraphicsComponent
	#elseif js
	extends BitmapRenderer
	#end
{
	public var color (get_color, set_color) :Int;
	var _color :Int;
	function get_color () :Int
	{
		return _color;
	}
	
	function set_color (val :Int) :Int
	{
		_color = val;
		redraw();
		return val;
	}
	
	public var lineWidth (get_lineWidth, set_lineWidth) :Float;
	var _lineWidth :Float;
	function get_lineWidth () :Float
	{
		return _lineWidth;
	}
	
	function set_lineWidth (val :Float) :Float
	{
		_lineWidth = val;
		redraw();
		return val;
	}
	
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
	
	public var roundCorner (get_roundCorner, set_roundCorner) :Int;
	var _roundCorner :Int;
	function get_roundCorner () :Int
	{
		return _roundCorner;
	}
	function set_roundCorner (val :Int) :Int
	{
		_roundCorner = val;
		redraw();
		return val;
	}
	
	
	
	public function new ()
	{
		super();
		setDefaults();
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
		super.setDefaults();
		_color = _dividerColor = 0x000000;
		_lineWidth = _dividerLineWidth = 1;
		_roundCorner = 10;
	}
	
	public function redraw () :Void
	{
		context.getManager(IProcessManager).callLater(redrawInternal);
	}
	
	function redrawInternal () :Void
	{
		var component = owner.getComponent(Container);
		com.pblabs.util.Assert.isNotNull(component, ' component is null');
		
		var bounds = component.bounds;
		
		if (Math.isNaN(bounds.centerX) || Math.isNaN(bounds.centerY)) {
			return;
		}
		
		var gap = 3;
		var round = _roundCorner;
		
		#if flash
			var g = graphics;
			g.clear();
			
			//Draw the box
			
			g.lineStyle(_lineWidth, _color);
			g.drawRoundRect(-_lineWidth - gap, -_lineWidth - gap, component.width + _lineWidth * 2 + gap * 2, component.height + _lineWidth * 2 + gap * 2, round);
			registrationPoint = new Vector2(x - bounds.xmin, y - bounds.ymin);
			
			#if js
			g.jeashRender();
			#end
			
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
			
			#if js
			g.jeashRender();
			#end
		#elseif js
		var canvas :Canvas = cast js.Lib.document.createElement("canvas");
		canvas.width = Std.int(bounds.intervalX + gap * 2 + _lineWidth * 2);
		canvas.height = Std.int(bounds.intervalY + gap * 2 + _lineWidth * 2);
		
		var ctx = canvas.getContext('2d');
		
		var w = Std.int(bounds.intervalX);
		var h = Std.int(bounds.intervalY);
		
		ctx.beginPath();
		ctx.moveTo(round, 0);
		ctx.lineTo(w-round, 0);
		ctx.quadraticCurveTo(w, 0, w, round);
		ctx.lineTo(w, h-round);
		ctx.quadraticCurveTo(w, h, w-round, h);
		ctx.lineTo(round, h);
		ctx.quadraticCurveTo(0, h, 0, h-round);
		ctx.lineTo(0, round);
		ctx.quadraticCurveTo(0, 0, round, 0);
		
		ctx.lineWidth = _lineWidth;
		ctx.strokeStyle = _color.toColorString("#");
		ctx.stroke();
		
		ctx.beginPath();
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
		
		bitmapData = canvas;
		registrationPoint = new Vector2(x - bounds.xmin, y - bounds.ymin);
		#end
		
		
	}

}
