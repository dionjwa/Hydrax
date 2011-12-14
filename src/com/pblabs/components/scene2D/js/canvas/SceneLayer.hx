/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D.js.canvas;
import com.pblabs.components.scene2D.BaseSceneLayer;
import com.pblabs.components.scene2D.SceneUtil;
import com.pblabs.components.scene2D.js.JSLayer;
import com.pblabs.components.scene2D.js.SceneComponent;
import com.pblabs.engine.time.IAnimatedObject;
import org.transition9.geom.Vector2;
import org.transition9.rtti.ReflectUtil;

import js.Dom;

class SceneLayer extends JSLayer
{
	/** Children mark this when they're modified*/
	public var canvas (default, null) :Canvas;
	public var ctx (default, null) :CanvasRenderingContext2D;
	
	public function new ()
	{
		super();
		_tempPoint = new Vector2();
		
		#if (debug && modernizr)
		org.transition9.util.Assert.isTrue(Modernizr.canvas, "Modernizr.canvas==false.  You will have to use a CSS layer in this browser");
		#end
	}
	
	override public function onFrame (dt :Float) :Void
	{
		super.onFrame(dt);
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
	
	override function checkZOrder () :Void
	{
		//Just re-render
		isDirty = true;
	}
	
	override function addedToParent () :Void
	{
		super.addedToParent();
		if (ctx == null) {
			canvas = createCanvas();
			canvas.width = Std.int(parent.sceneView.width);
			canvas.height = Std.int(parent.sceneView.height);
			ctx = canvas.getContext("2d");
		}
		
		isDirty = true;
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
		div.appendChild(canvas);
		canvas.style.position = "absolute";
		canvas.style.left = "0px";
		canvas.style.top = "0px";
		return cast canvas;
	}
	
	var _tempPoint :Vector2;
}
