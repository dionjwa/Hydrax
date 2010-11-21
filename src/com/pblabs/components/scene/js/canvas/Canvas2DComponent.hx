/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene.js.canvas;

import com.pblabs.components.base.AngleComponent;
import com.pblabs.components.base.LocationComponent;
import com.pblabs.components.manager.NodeComponent;
import com.pblabs.components.scene.BaseScene2DComponent;
import com.pblabs.components.scene.js.canvas.CanvasLayer;
import com.pblabs.components.scene.js.canvas.CanvasScene2D;
import com.pblabs.components.scene.js.canvas.Sprite;
import com.pblabs.engine.debug.Log;
import com.pblabs.engine.util.PBUtil;
import com.pblabs.geom.Vector2;
import com.pblabs.util.Assert;
import com.pblabs.util.ReflectUtil;

import easel.display.Canvas;
import easel.display.Context2d;

class Canvas2DComponent extends BaseScene2DComponent<CanvasLayer>
{
	public var sprite :Sprite;
	
	public function new (?s :Sprite) :Void
	{
		super();
		sprite = s;
	}
	
	public function render (context :easel.display.Context2d) :Void
	{
		sprite.render(context);
	}
	
	override function onReset () :Void
	{
		super.onReset();
		Assert.isNotNull(sprite);
	}
	
	override function get_x () :Float
	{
		return sprite.x;
	}
	
	override function set_x (val :Float) :Float
	{
		sprite.x = val;
		layer.isDirty = true;
		return val;
	}
	
	override function get_y () :Float
	{
		return sprite.y;
	}
	
	override function set_y (val :Float) :Float
	{
		sprite.y = val;
		layer.isDirty = true;
		return val;
	}
	
	override function get_angle () :Float
	{
		return sprite.rotation;
	}
	
	override function set_angle (val :Float) :Float
	{
		sprite.rotation = val;
		layer.isDirty = true;
		return val;
	}
}


