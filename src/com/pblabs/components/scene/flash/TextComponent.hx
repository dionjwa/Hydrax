package com.pblabs.components.scene.flash;

import flash.text.TextField;

class TextComponent extends Scene2DComponent
{
	public var text (get_text, set_text) :String;
	var _text :TextField;
	
	public function new ()
	{
		super();
		_text = new TextField();
		_text.width = 800;
		_text.height = 800;
		_text.mouseEnabled = false;
		_text.wordWrap = true;
		_text.mouseWheelEnabled = false;
		_displayObject = _text;
	}

	function get_text () :String
	{
		return _text.text;
	}
	
	function set_text (val :String) :String
	{
		_text.text = val;
		return val;
	}
}
