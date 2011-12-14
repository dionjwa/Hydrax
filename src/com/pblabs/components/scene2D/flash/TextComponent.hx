/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D.flash;

import flash.display.Sprite;

import flash.text.TextField;
import flash.text.TextFieldAutoSize;

class TextComponent extends SceneComponent
{
	public var text (get_text, set_text) :String;
	public var textField (get_textField, set_textField) :TextField;
	function get_textField () :TextField
	{
		return _text;
	}
	
	function set_textField (val :TextField) :TextField
	{
		_text = val;
		return val;
	}
	var _text :TextField;
	var _sprite :Sprite;
	
	public function new ()
	{
		super();
		_sprite = org.transition9.util.SpriteUtil.create();
		_text = new TextField();
		_text.width = 200;
		_text.height = 30;
		
		_text.mouseEnabled = false;
		_text.wordWrap = false;
		_text.multiline = true;
		_text.mouseWheelEnabled = false;
		_sprite.addChild(_text);
		_displayObject = _sprite;
		registrationPoint.x = 0;
		registrationPoint.y = 0;
		text = " ";
	}
	
	override function recomputeBounds () :Void
	{
		super.recomputeBounds();
		
		#if flash
		var localDimensions = _text.getBounds(_sprite);
		#elseif cpp
		var localDimensions = _text.nmeGetPixelBounds(_sprite);
		#end
		
		_text.x = (-localDimensions.width / 2);
		_text.y = (-localDimensions.height / 2);
	}

	function get_text () :String
	{
		return _text.text;
	}
	
	function set_text (val :String) :String
	{
		_text.text = val;
		recomputeBounds();
		return val;
	}
}
