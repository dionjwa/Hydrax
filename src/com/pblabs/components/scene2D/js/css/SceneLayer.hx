/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D.js.css;

import com.pblabs.components.scene2D.SceneUtil;
import com.pblabs.components.scene2D.js.JSLayer;
import com.pblabs.engine.time.IAnimatedObject;

import de.polygonal.core.math.Vec2;

import js.Dom;

import js.Lib;

import org.transition9.util.DomUtil;

class SceneLayer extends JSLayer
{
	inline public static function updateTransformFromScene (scene :BaseSceneManager, layer :SceneLayer) :Void
	{
		org.transition9.util.Assert.isNotNull(scene);
		org.transition9.util.Assert.isNotNull(_tempPoint);
		org.transition9.util.Assert.isNotNull(scene.sceneAlignment);
		org.transition9.util.Assert.isNotNull(scene.sceneView);
		
		layer._transformMatrix.identity();
		//Adjust for SceneView center			
		SceneUtil.calculateOutPoint(_tempPoint, scene.sceneAlignment, scene.sceneView.width, scene.sceneView.height);
		layer._transformMatrix.rotate(scene.rotation);
		layer._transformMatrix.scale(scene.zoom * layer.scaleX, scene.zoom * layer.scaleY);
		layer._transformMatrix.translate(_tempPoint.x, _tempPoint.y);
		layer._transformMatrix.translate(scene.x * layer._parallaxFactor * scene.zoom * layer.scaleX, scene.y * layer._parallaxFactor * scene.zoom * layer.scaleY);
		if (SceneView.isWebkitBrowser) {
			untyped layer.div.style.webkitTransform = layer._transformMatrix.toString();
		} else {
			untyped layer.div.style.MozTransform = layer._transformMatrix.toMozString();
		}
	}
	
	static var _tempPoint = new Vec2();
	
	public function new ()
	{
		super();
		
		#if (debug && modernizr)
		org.transition9.util.Assert.isTrue(Modernizr.csstransforms, "Modernizr.csstransforms==false.  You will have to use a Canvas layer in this browser");
		#end
	}
	
	override public function onFrame (dt :Float) :Void
	{
		super.onFrame(dt);
		if (isTransformDirty) {
			updateTransform();
			isTransformDirty = false;
		}
	}
	
	public function updateTransform () :Void
	{
		if (scene != null) {
			updateTransformFromScene(scene, this);
		}
	}
	
	override function addedToParent () :Void
	{
		//Set the location before adding to the div to prevent a location flicker.
		updateTransformFromScene(scene, this);
		super.addedToParent();
	}
	
	//Untested
	override function checkZOrder () :Void
	{
		for (ii in 1...children.length) {
			div.insertBefore(children[ii - 1].div, children[ii].div);
		}
	}
	
	override function set_scaleX (val :Float) :Float
	{
		isTransformDirty = true;
		return super.set_scaleX(val);
	}
	
	override function set_scaleY (val :Float) :Float
	{
		isTransformDirty = true;
		return super.set_scaleY(val);
	}
	
	override function set_alpha (val :Float) :Float
	{
		super.set_alpha(val);
		div.style.cssText = DomUtil.setStyle(div.style.cssText, "opacity", "" + (Math.max(alpha, 0.00001)));
		return val;
	}
}
