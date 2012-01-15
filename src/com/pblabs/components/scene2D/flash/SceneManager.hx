/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D.flash;

import com.pblabs.components.scene2D.BaseSceneManager;
import com.pblabs.components.scene2D.SceneUtil;
import com.pblabs.components.scene2D.SceneView;
import com.pblabs.components.scene2D.flash.SceneLayer;
import com.pblabs.engine.time.IAnimatedObject;

import de.polygonal.motor.geom.math.Vec2;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;

import flash.geom.Matrix;
import flash.geom.Point;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

import org.transition9.util.Preconditions;
using org.transition9.util.ArrayUtil;
using org.transition9.util.DisplayUtils;

/**
 * Basic Rendering 2D scene. It is given a SceneView and some
 * DisplayObjectRenderers, and makes sure that they are drawn. Extensible
 * for more complex rendering scenarios. Enforces sorting order, too.
 */
class SceneManager extends BaseSceneManager<SceneLayer>, 
	implements IAnimatedObject
{
	public var zoomSignal (default, null):Signaler<Float>;
	public var displayContainer (get_displayContainer, null) :DisplayObjectContainer;
	public var dirty :Bool;
	public var priority :Int;
	
	var _rootSprite :Sprite;
	var _rootTransform :Matrix;
	var _tempPoint :Vec2;

	public function new ()
	{
		super();
		priority = 0;
		_rootSprite = new Sprite();
		_rootSprite.mouseEnabled = false;
		_rootSprite.mouseChildren = false;
		_rootTransform = new Matrix();
		_tempPoint = new Vec2();
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
		zoomSignal = new DirectSignaler(this);
	}
	
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
		org.transition9.util.Assert.isTrue(_rootSprite.numChildren == 0);
		org.transition9.util.Assert.isTrue(_rootSprite.parent == null);
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
			org.transition9.util.Log.warn(this + "sceneView is null, so we aren't rendering.");
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
	
	override public function attach () :Void
	{
		org.transition9.util.Assert.isNotNull(_rootSprite);
		org.transition9.util.Assert.isNotNull(displayContainer);
		org.transition9.util.Assert.isNotNull(context, "How can the context be null??, name=" + name + ", isRegistered=" +isRegistered);
		if (_rootSprite.parent == null) {
			org.transition9.util.Assert.isNotNull(context.getManager(SceneView), "No SceneView??");
			context.getManager(SceneView).addDisplayObject(displayContainer);
		}
	}
	
	override public function detach () :Void
	{
		if (_rootSprite.parent != null) {
			_rootSprite.detach();
		}
	}
	
	override function get_defaultLayerClass () :Class<SceneLayer>
	{
		return com.pblabs.components.scene2D.flash.SceneLayer;
	}
	
	function get_displayContainer () :DisplayObjectContainer
	{
		return _rootSprite;
	}
	
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
	
	#if debug
	override public function postDestructionCheck () :Void
	{
		super.postDestructionCheck();
		#if debug_hxhsl
		var sigs :Array<Signaler<Dynamic>> = cast [zoomSignal]; 
		for (sig in sigs) {
			if (sig.isListenedTo) {
				for (b in sig.getBonds()) {
					trace("Stuck bond on " + debugOwnerName + "=" + b);
				}
			}
			org.transition9.util.Assert.isFalse(sig.isListenedTo, debugOwnerName);
		}
		#end
	}
	#end
}
