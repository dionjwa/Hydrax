package com.pblabs.components.scene2D;

class GraphicsComponent
	#if flash
	extends com.pblabs.components.scene2D.flash.SceneComponent
	#elseif js
	extends BitmapRenderer
	#end
{
	#if flash
	var _shape :flash.display.Shape;
	#elseif js
	var _graphics :flash.display.Graphics;
	override function set_width (val :Float) :Float
	{
		super.set_width(val);
		_backBuffer.width = Std.int(val);
		_isContentsDirty = true;
		return val;
	}
	override function set_height (val :Float) :Float
	{
		super.set_height(val);
		_backBuffer.height = Std.int(val);
		_isContentsDirty = true;
		return val;
	}
	#end
	
	
	public var graphics (get_graphics, never) :flash.display.Graphics;
	function get_graphics () :flash.display.Graphics
	{
		//Assume dirty
		#if flash
		return _shape.graphics;
		#elseif js
		_isContentsDirty = true;
		return _graphics;
		#end
	}
	
	public function new ()
	{
		#if flash
		_shape = new flash.display.Shape();
		_displayObject = _shape;
		super();
		#elseif js
		super();
		_graphics = new flash.display.Graphics(_backBuffer);
		#end
		
	}
	
	#if js
	
	override public function onFrame (dt :Float) :Void
	{
		if (_isContentsDirty) {
			redrawBackBuffer();
		}
		super.onFrame(dt);
	}
	
	override private function redrawBackBuffer ()
	{
		_bitmap = _graphics.jeashSurface;
		super.redrawBackBuffer();
	}
	
	override function set_bitmapData (val :ImageData) :ImageData
	{
		super.set_bitmapData(val);
		_graphics = new flash.display.Graphics(_bitmap);
		return val;
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		_graphics = null;
	}
	#end
}
