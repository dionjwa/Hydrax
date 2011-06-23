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
import com.pblabs.geom.Vector2;

import js.Dom;

import js.Lib;

class SceneLayer extends JSLayer,
	implements IAnimatedObject
{
	public var priority :Int;
	var _tempPoint :Vector2;
	
	public function new ()
	{
		super();
		priority = 0;
		_tempPoint = new Vector2();
	}
	
	public function onFrame (dt :Float) :Void
	{
	    if (isTransformDirty) {
	    	updateTransform();
	    	isTransformDirty = false;
	    }
	}
	
	public function updateTransform () :Void
	{
		com.pblabs.util.Assert.isNotNull(scene);
		com.pblabs.util.Assert.isNotNull(_tempPoint);
		com.pblabs.util.Assert.isNotNull(scene.sceneAlignment);
		com.pblabs.util.Assert.isNotNull(scene.sceneView);
		
		_transformMatrix.identity();
		//Adjust for SceneView center			
		SceneUtil.calculateOutPoint(_tempPoint, scene.sceneAlignment, scene.sceneView.width, scene.sceneView.height);
		_transformMatrix.rotate(scene.rotation);
		_transformMatrix.scale(scene.zoom, scene.zoom);
		_transformMatrix.translate(_tempPoint.x, _tempPoint.y);
		_transformMatrix.translate(scene.x *_parallaxFactor * scene.zoom, scene.y *_parallaxFactor * scene.zoom);
		if (SceneView.isWebkitBrowser) {
			untyped div.style.webkitTransform = _transformMatrix.toString();
		} else {
			untyped div.style.MozTransform = _transformMatrix.toMozString();
		}
	}
}
