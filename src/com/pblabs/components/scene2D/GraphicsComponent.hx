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
		return new flash.display.Graphics(_backBuffer);
		#end
	}
	
	public function new ()
	{
		#if flash
		_shape = new flash.display.Shape();
		_displayObject = _shape;
		#elseif js
		#end
		super();
	}
	
	#if js
	override private function redrawBackBuffer ()
	{
		if (_backBuffer == null) {
			_backBuffer = cast js.Lib.document.createElement("canvas");
			_backBuffer.width = 10;
			_backBuffer.height = 10;
			_backBuffer.style.position = "absolute";
			_backBuffer.style.visibility = "hidden";
			_backBuffer.style.display = "block";
			//Add to the div display object, so it can be rendered to either CSS or Canvas layers.
			com.pblabs.util.Assert.isNotNull(div);
			div.appendChild(_backBuffer);
		}
		if (_backBuffer.width != Std.int(width)) {
			_backBuffer.width = Std.int(width);
		}
		if (_backBuffer.height != Std.int(height)) {
			_backBuffer.height = Std.int(height);
		}
	}
	#end
}
