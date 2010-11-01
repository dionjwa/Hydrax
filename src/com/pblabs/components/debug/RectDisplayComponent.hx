/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.debug;

import flash.display.Graphics;
import flash.display.Sprite;
import flash.text.TextField;

import com.pblabs.components.scene.Scene2DComponent;
import com.pblabs.components.scene.Scene2DManager;

import com.pblabs.components.base.LocationComponent;

import com.pblabs.engine.core.PropertyReference;

/**
 * Hold a value in a component, just so we can use a property reference to get it.
 */
class RectDisplayComponent extends Scene2DComponent
{
    public var color (get_color, set_color) :Int;
    public var label (get_label, set_label) :String;
    
    public function new (x :Float, y :Float, w :Float, h :Float, ?color :Int = 0xff0000)
    {
        super();
        sceneLayerName = Scene2DManager.DEBUG_LAYER_NAME;
        _x = x;
        _y = y;
        _w = w;
        _h= h;
        _displayObject = new Sprite();
		_textField = new TextField();//TextBits.createText("", 1.5);
		_textField.y = -10;
		_textField.x = -30;
		cast(_displayObject, Sprite).addChild(_textField);
		_color = color;
        redraw();
    }

    function set_color (val :Int) :Int
    {
        _color = val;
        redraw();
        return val;
    }
    function get_color () :Int
    {
        return _color;
    }
	
	function set_label (val :String) :String
	{
		_textField.text = val;
		return val;
	}
	
	function get_label () :String
	{
		return _textField.text;
	}

    function redraw () :Void
    {
        var g :Graphics = cast(_displayObject, Sprite).graphics;
        g.clear();
        // g.beginFill(_color);
        g.lineStyle(1, 0x000000);
        g.drawRect(_x, _y, _w, _h);
        // g.endFill();
    }
	
    var _color :Int;
    // var _x :Float;
    // var _y :Float;
    var _w :Float;
    var _h :Float;
	var _textField :TextField;
}
















