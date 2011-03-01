/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene.js.canvas;

import com.pblabs.components.scene.BaseSceneLayer;
import com.pblabs.components.scene.SceneUtil;
import com.pblabs.components.scene.js.JSLayer;
import com.pblabs.components.scene.js.canvas.SceneComponent;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.geom.Vector2;
import com.pblabs.util.ReflectUtil;

import easel.display.Canvas;
import easel.display.Context2d;

class SceneLayer extends JSLayer<SceneManager, SceneComponent>,
	implements IAnimatedObject
{
	/** Children mark this when they're modified*/
	public var isDirty :Bool;
	public var isTransformDirty :Bool;
	public var canvas (default, null) :Canvas;
	public var ctx (default, null) :Context2d;
	
	public function new ()
	{
		super();
		canvas = createCanvas();
		div.appendChild(canvas);
		isTransformDirty = true;
		isDirty = true;
		_tempPoint = new Vector2();
	}
	
	public function onFrame (dt :Float) :Void
	{
		if (!isDirty && !isTransformDirty) {
			return;
		}
		if (ctx == null) {
			return;
		}
		if (isTransformDirty) {
			//Update the transform
			//Set the identity
			ctx.restore();
			ctx.setTransform(1, 0, 0, 1, 0, 0);
			ctx.clearRect(0, 0, canvas.width, canvas.height);

			//Adjust for SceneView center			
			SceneUtil.calculateOutPoint(_tempPoint, scene.sceneAlignment, scene.sceneView.width, scene.sceneView.height);
			ctx.translate(_tempPoint.x, _tempPoint.y);
			
			ctx.rotate(scene.rotation);
			ctx.scale(scene.zoom, scene.zoom);
			ctx.translate(scene.x *_parallaxFactor, scene.y *_parallaxFactor);
		} else {
			ctx.save();
			ctx.setTransform(1, 0, 0, 1, 0, 0);
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			ctx.restore();
		}
		
		
		//Fill transparent first
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		// Render
		if (children != null) {
			for (c in children) {
				c.render(ctx);
			}
		}
		isDirty = false;
		isTransformDirty = false;
	}
	
	override function addedToParent () :Void
	{
		canvas.width = Std.int(parent.sceneView.width);
		canvas.height = Std.int(parent.sceneView.height);
		ctx = canvas.getContext("2d");
		isDirty = true;
		super.addedToParent();
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		ctx = null;
	}
	
	override function childAdded (c :SceneComponent) :Void
	{
		super.childAdded(c);
		isDirty = true;
	}
	
	override function childRemoved (c :SceneComponent) :Void
	{
		super.childRemoved(c);
		isDirty = true;
	}
	
	function createCanvas () :Canvas
	{
		var canvas :Canvas = cast js.Lib.document.createElement("canvas");
		canvas.style.position = "relative";
		canvas.style.left = "0px";
		canvas.style.top = "0px";
		return canvas;
	}
	
	var _tempPoint :Vector2;
}
