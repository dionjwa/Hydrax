/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene.flash;

import com.pblabs.components.scene.BaseSceneManager;
import com.pblabs.components.scene.SceneUtil;
import com.pblabs.components.scene.SceneView;
import com.pblabs.components.scene.flash.SceneLayer;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.geom.Vector2;
import com.pblabs.util.Preconditions;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;

import flash.geom.Matrix;
import flash.geom.Point;

using com.pblabs.util.ArrayUtil;
using com.pblabs.util.DisplayUtils;

using de.polygonal.gl.DisplayListIterator;

/**
 * Basic Rendering2D scene; it is given a SceneView and some
 * DisplayObjectRenderers, and makes sure that they are drawn. Extensible
 * for more complex rendering scenarios. Enforces sorting order, too.
 */
class SceneManager extends BaseSceneManager<SceneLayer>, 
	implements IAnimatedObject
{
	
	public var zoomSignal (default, null):hsl.haxe.Signaler<Float>;
	public var displayContainer (get_displayContainer, null) :DisplayObjectContainer;
	public var dirty :Bool;

	public function new ()
	{
		super();
		_rootSprite = new Sprite();
		_rootSprite.mouseEnabled = _rootSprite.mouseChildren = false;
		_rootTransform = new Matrix();
		_tempPoint = new Vector2();
	}
	
	override public function setLayerIndex (layer :SceneLayer, index :Int) :Void
	{
		super.setLayerIndex(layer, index);
		_rootSprite.removeAllChildren();
		for (c in children) {
			_rootSprite.addChild(c.displayContainer);
		}
	}
	
	override function onAdd () :Void
	{
		super.onAdd();
		_rootSprite.name = name;
		context.getManager(SceneView).addDisplayObject(displayContainer);
		zoomSignal = new hsl.haxe.DirectSignaler(this);
	}
	
	// #if (flash && debug)
	// override function onReset () :Void
	// {
	// 	super.onReset();
	// 	com.pblabs.engine.core.SignalBondManager.bindSignal(this, cast(context, com.pblabs.engine.core.PBContext).signalEnter, unDim);
	// 	com.pblabs.engine.core.SignalBondManager.bindSignal(this, cast(context, com.pblabs.engine.core.PBContext).signalExit, dim);
	// }
	
	// function dim (?ignored :Dynamic) :Void
	// {
	// 	trace("");
	// 	_rootSprite.alpha = 0.3;
	// }
	
	// function unDim (?ignored :Dynamic) :Void
	// {
	// 	trace("");
	// 	_rootSprite.alpha = 1.0;
	// }
	// #end
	
	override function onRemove () :Void
	{
		super.onRemove();
		_rootSprite.detach();
		com.pblabs.util.Assert.isFalse(zoomSignal.isListenedTo, "Still has listeners");
		zoomSignal = null;
		
		com.pblabs.util.Assert.isTrue(_rootSprite.numChildren == 0);
		com.pblabs.util.Assert.isTrue(_rootSprite.parent == null);
	}
	
	override function set_zoom (value :Float) :Float
	{
		// Make sure our zoom level stays within the desired bounds
		value = super.set_zoom(value);
		zoomSignal.dispatch(value);
		return value;
	}
	
	public function onFrame (dt :Float) :Void
	{
		if (sceneView == null) {
			com.pblabs.util.Log.warn(this + " sceneView is null, so we aren't rendering.");
			return;
		}
		updateTransform();
	}

	public function updateTransform () :Void
	{
		if (!_transformDirty) {
			return;
		}
		_transformDirty = false;
	
		for (layer in children) {
		    layer.updateTransform();
		}
		return;
		
		// Update our transform, if required
		_rootTransform.identity();
		_rootTransform.translate(x, y);
		_rootTransform.scale(zoom, zoom);
		
		// Apply rotation.
		_rootTransform.rotate(rotation);

		// Center it appropriately.
		Preconditions.checkNotNull(_tempPoint);
		Preconditions.checkNotNull(sceneAlignment);
		Preconditions.checkNotNull(sceneView);
		SceneUtil.calculateOutPoint(_tempPoint, sceneAlignment, sceneView.width, sceneView.height);
		_rootTransform.translate(_tempPoint.x, _tempPoint.y);

		// Apply the transform.
		_rootSprite.transform.matrix = _rootTransform;
	}
	
	override function childAdded (layer :SceneLayer) :Void
	{
		super.childAdded(layer);
		_rootSprite.addChild(layer.displayContainer);
	}
	
	override function childRemoved (layer :SceneLayer) :Void
	{
		super.childRemoved(layer);
		_rootSprite.removeChild(layer.displayContainer);
	}
	
	override function attach () :Void
	{
		super.attach();
		if (_rootSprite.parent == null) {
			context.getManager(SceneView).addDisplayObject(displayContainer);
		}
	}
	
	override function detach () :Void
	{
		super.detach();
		if (_rootSprite.parent != null) {
			_rootSprite.detach();
		}
	}
	
	function get_displayContainer () :DisplayObjectContainer
	{
		return _rootSprite;
	}

	var _rootSprite :Sprite;
	var _rootTransform :Matrix;
	var _tempPoint :Vector2;
	
	#if editor
	override public function toString () :String
	{
	    var sb = new StringBuf();
	    sb.add("children=" + children.length);
	    var i = 0;
	    while (i < _rootSprite.numChildren) {
	    	sb.add("\n " + i + " " + _rootSprite.getChildAt(i).name);
	    	i++;
	    }
	    return sb.toString();
	}
	#end
}
