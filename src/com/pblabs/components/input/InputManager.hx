/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.input;

import com.pblabs.components.scene2D.BaseSceneComponent;
import com.pblabs.components.scene2D.BaseSceneLayer;
import com.pblabs.components.scene2D.BaseSceneManager;
import com.pblabs.components.scene2D.SceneManagerList;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.ObjectType;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGameBase;
import com.pblabs.engine.core.SetManager;
import com.pblabs.engine.time.IProcessManager;
import com.pblabs.geom.Vector2;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ReflectUtil;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;
import com.pblabs.util.ds.MultiMap;
import com.pblabs.util.ds.Set;
import com.pblabs.util.ds.Sets;
import com.pblabs.util.ds.multimaps.ArrayMultiMap;

import de.polygonal.motor2.geom.math.XY;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;
import hsl.haxe.data.mouse.MouseLocation;

using IterTools;

using Lambda;

using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.util.MathUtil;

/**
 * Integrates different lower level input listeners into higher level signals such as drag,
 * and provides the components that react to input.
 */
class InputManager extends BaseInputManager,
	implements IInputData, implements com.pblabs.engine.time.IAnimatedObject
{
	public var deviceDown(default, null) :Signaler<IInputData>;
	public var deviceUp(default, null) :Signaler<IInputData>;
	public var deviceMove(default, null) :Signaler<IInputData>;
	public var deviceClick(default, null) :Signaler<IInputData>;
	public var deviceHeldDown(default, null) :Signaler<IInputData>;
	// public var doubleClick(default, null) :Signaler<IInputData>;
	
	public var rotate (default, null) :Signaler<IInputData>;
	public var scale (default, null) :Signaler<IInputData>;
	
	public var isDeviceDown (get_isDeviceDown, null) :Bool;
	
	/** Is the mouse button down, or the device touched */
	var _isDeviceDown :Bool;
	var _startingAngle :Float;//Radians
	var _startingScale :Float;
	var _isZooming :Bool;
	@inject
	var _mouse :MouseInputManager;
	
	#if js
	@inject
	var gestures :com.pblabs.components.input.GestureInputManager;
	#end

	@inject
    var _game :PBGameBase;
	
	//Variables to make queries more efficient
	var _sceneManagers :Array<BaseSceneManager<Dynamic>>;
	var _displayObjectsUnderPoint :Map<Int, Array<BaseSceneComponent<Dynamic>>>;
	var _displayObjectFirstUnderPoint :Map<Int, BaseSceneComponent<Dynamic>>;

	var _deviceDownComponent :MouseInputComponent;
	var _deviceDownComponentLoc :Vector2;
	var _deviceDownLoc :Vector2;
	var _checked :Set<String>;
	var _fingersTouching :Int;
	var _deviceLoc :Vector2;
	var _isGesturing :Bool;
	var _tempVec :Vector2;
	static var INPUT_SET :String = ReflectUtil.tinyClassName(IInteractiveComponent);
	
	public function new ()
	{
		super();
		deviceDown = new DirectSignaler(this);
		deviceMove = new DirectSignaler(this);
		deviceUp = new DirectSignaler(this);
		deviceClick = new DirectSignaler(this);
		deviceHeldDown = new DirectSignaler(this);
		// doubleClick = new DirectSignaler(this);
		rotate = new DirectSignaler(this);
		scale = new DirectSignaler(this);
		
		_checked = Sets.newSetOf(String);
		_deviceLoc = new Vector2();
		_isDeviceDown = false;
		_isGesturing = false;
		_tempVec = new Vector2();
		_fingersTouching = 0;
		
		_sceneManagers = [];
		_displayObjectsUnderPoint = Maps.newHashMap(Int);
		_displayObjectFirstUnderPoint = Maps.newHashMap(Int);
	}
	
	public function onFrame (dt :Float) :Void
	{
		//Dispatch a deviceHeldDown signal, but only if there's something under the device.
		//NB: this doesn't recheck what's under the device, it's the same from the deviceDown.
		if (_isDeviceDown && deviceHeldDown.isListenedTo) {
			deviceHeldDown.dispatch(this);
		}
	}
	
	override public function startup () :Void
	{
		super.startup();
		bindSignals();
		_game.getManager(IProcessManager).addAnimatedObject(this);
	}
	
	override public function shutdown () :Void
	{
		super.shutdown();
		freeSignals();
		if (_game.getManager(IProcessManager) != null) {
			//If the ProcessManager is null, it's shut down.
			_game.getManager(IProcessManager).removeAnimatedObject(this);
		}
		onNewContext(null);
		
		deviceDown = null;
		deviceUp = null;
		deviceMove = null;
		deviceClick = null;
		deviceHeldDown = null;
		// doubleClick = null;
		rotate = null;
		scale = null;
	}
	
	function onNewContext (context :IPBContext) :Void
	{
		_sceneManagers = null;
		clearInputDataCache();
	}
	
	function getSceneManagers () :Array<BaseSceneManager<Dynamic>>
	{
		if (_sceneManagers == null) {
			com.pblabs.util.Assert.isNotNull(_game);
			com.pblabs.util.Assert.isNotNull(_game.currentContext);
			
			var sceneList = _game.currentContext.getManager(SceneManagerList);
			if (sceneList == null) {
				return null;
			}
			_sceneManagers = sceneList.children.copy();
			_sceneManagers.reverse();
			if (_sceneManagers.length == 0) {
				_sceneManagers = null;
			}
		}
		return _sceneManagers;
	}
	
	function bindSignals () :Void
	{
		com.pblabs.util.Assert.isNotNull(_mouse, "MouseInputManager is null, did you register one?");

		_game.newActiveContextSignaler.bind(onNewContext);		
		
		_mouse.mouseDown.bind(onMouseDown);
		_mouse.mouseMove.bind(onMouseMove);
		_mouse.mouseUp.bind(onMouseUp);
		_mouse.mouseClick.bind(onMouseClick);
	 
		#if js
		if (gestures != null) {
			var self = this;
			// gestures.gestureChange.bind(function (e :hsl.js.data.Touch.GestureEvent) :Void {
			// 	// trace("gesture changed");
			// 	// trace(e.rotation);
			// 	#if testing
			// 	js.Lib.document.getElementById("haxe:gestureRotation").innerHTML = "gestureRotation: " + e.rotation;
			// 	js.Lib.document.getElementById("haxe:gestureScale").innerHTML = "gestureScale: " + e.scale;
			// 	#end
				
			// 	var eventAngle = e.rotation.toRad();
			// 	// var eventScale = e.scale;
				
			// 	//Dispatch the signals
			// 	var cache = self._gestureCache;
			// 	cache.inputComponent = self._deviceDownComponent;
			// 	cache.rotation = eventAngle;
			// 	cache.scale = e.scale;
				
			// 	self.rotate.dispatch(cache);
			// 	self.scale.dispatch(cache);
			// 	// cache.set(self._deviceDownComponent, eventAngle);
			// 	// cache.set(self._deviceDownComponent, eventScale);
					
			// 	//Check for component specific rotation/scaling
			// 	if (self._deviceDownComponent != null) {
			// 		var inputComp = self._deviceDownComponent.owner.getComponent(MouseInputComponent);
			// 		// if (inputComp != null) {
			// 		// 	if (inputComp.isRotatable) {
			// 		// 		inputComp.angle = self._startingAngle + eventAngle;
			// 		// 	}
						
			// 		// 	if (inputComp.isScalable) {
			// 		// 		inputComp.scale = self._startingScale + cache.scale;
			// 		// 	}
			// 		// }
			// 	}
			// });
			// gestures.gestureStart.bind(function (e :hsl.js.data.Touch.GestureEvent) :Void {
			// 	self._isGesturing = true;
			// 	//No selected component when gesturing.  Could it be that the use put two fingers down at the same time?
			// 	if (self._deviceDownComponent == null) {
			// 	}
				
			// 	// if (self._deviceDownComponent != null) {
			// 	// 	var inputComp = self._deviceDownComponent.owner.getComponent(MouseInputComponent);
			// 	// 	if (inputComp != null) {
			// 	// 		if (inputComp.isRotatable) {
			// 	// 			self._startingAngle = inputComp.angle;
			// 	// 		}
			// 	// 		if (inputComp.isScalable) {
			// 	// 			self._startingScale = inputComp.scale;
			// 	// 		}
			// 	// 	}
			// 	// }
			// });
			// gestures.gestureEnd.bind(function (e :hsl.js.data.Touch.GestureEvent) :Void {
			// 	self._isGesturing = false;
			// });
			
		}
		#end
		
	}
	
	function freeSignals () :Void
	{
		_game.newActiveContextSignaler.unbind(onNewContext);
		if (_mouse != null) {
			_mouse.mouseDown.unbind(onMouseDown);
			_mouse.mouseMove.unbind(onMouseMove);
			_mouse.mouseUp.unbind(onMouseUp);
			_mouse.mouseClick.unbind(onMouseClick);
		}
	}

	inline function adjustDeviceLocation (m :MouseLocation) :Vector2
	{
		#if (flash || cpp)
		return new Vector2(m.globalLocation.x, m.globalLocation.y);
		#elseif js
		return new Vector2(m.globalLocation.x - sceneView.mouseOffsetX, m.globalLocation.y - sceneView.mouseOffsetY);
		#else
		return new Vector2(m.x, m.y);
		#end
	}
	
	function onMouseDown (m :MouseLocation) :Void
	{
		//Reset markers
		_isGesturing =  _isZooming = false;
		_isDeviceDown = true;
		
		if (!deviceDown.isListenedTo) {
			return;
		}
		_deviceLoc = adjustDeviceLocation(m);
		if (!isWithinSceneView(_deviceLoc)) {
			return;
		}
		clearInputDataCache();
		deviceDown.dispatch(this);
	} 
	
	function onMouseUp (m :MouseLocation) :Void
	{
		_isDeviceDown = false;
		
		if (!deviceUp.isListenedTo) {
			return;
		}
		clearInputDataCache();
		
		_deviceLoc = adjustDeviceLocation(m);
		if (!isWithinSceneView(_deviceLoc)) {
			return;
		}
		deviceUp.dispatch(this);
	}
	
	function onMouseMove (m :MouseLocation) :Void
	{
		//While gesturing, ignore mouse/touch moves
		if (_isGesturing) {
			return;
		}
		
		if (!deviceMove.isListenedTo) {
			return;
		}
		
		_deviceLoc = adjustDeviceLocation(m);
		if (!isWithinSceneView(_deviceLoc)) {
			return;
		}
		clearInputDataCache();
		deviceMove.dispatch(this);
	}
	
	function isWithinSceneView (mouse :Vector2) :Bool
	{
	    return !(mouse.x < 0 || mouse.x > sceneView.width || mouse.y < 0 || mouse.y > sceneView.height);
	}
	
	function onMouseClick (m :MouseLocation) :Void
	{
		if (!deviceClick.isListenedTo) {
			return;
		}
		
		_deviceLoc = adjustDeviceLocation(m);
		if (!isWithinSceneView(_deviceLoc)) {
			return;
		}
		clearInputDataCache();
		deviceClick.dispatch(this);
	}
	
	function getMouseLoc () :Vector2
	{
		#if (flash || cpp)
		_deviceLoc.x = flash.Lib.current.stage.mouseX;
		_deviceLoc.y = flash.Lib.current.stage.mouseY;
		#elseif js
		//TODO: find this
		#else
		com.pblabs.util.Log.warn("No mouse detection on this platform");
		#end
		
		return _deviceLoc;
	}
	
	function get_isDeviceDown () :Bool
	{
		return _isDeviceDown;
	}
	
	/** Methods from IInputData */
	public function allObjectsUnderPoint (?mask :ObjectType) :Array<BaseSceneComponent<Dynamic>>
	{
		mask = mask == null ? ObjectType.ALL : mask;
		
		if (_displayObjectsUnderPoint.exists(mask.hashCode())) {
			return _displayObjectsUnderPoint.get(mask.hashCode());
		}
		
		var underPoint = new Array<BaseSceneComponent<Dynamic>>();
		if (getSceneManagers() == null) {
			return underPoint;
		}
		
		for (sceneManager in getSceneManagers()) {
			var worldLoc = sceneManager.translateScreenToWorld(inputLocation);
			var layerIndex = sceneManager.children.length - 1;
			while (layerIndex >= 0) {
				var layer :BaseSceneLayer<Dynamic, Dynamic> = sceneManager.children[layerIndex];
				layerIndex--;
				//If the layer doesn't match the mask, ignore all the children.  Saves iterations
				if (!layer.objectMask.and(mask)) {
					continue;
				}
				var childIndex = layer.children.length -1;
				while (childIndex >= 0) {
					var so :BaseSceneComponent<Dynamic> = layer.children[childIndex];
					childIndex--;
					if (so.containsWorldPoint(worldLoc, mask)) {
						underPoint.push(so);
					}
				}
			}
		}
		
		_displayObjectsUnderPoint.set(mask.hashCode(), underPoint);
		return underPoint;
	}
	
	public function firstObjectUnderPoint (?mask :ObjectType) :BaseSceneComponent<Dynamic>
	{
		mask = mask == null ? ObjectType.ALL : mask;
		
		com.pblabs.util.Assert.isNotNull(_displayObjectFirstUnderPoint);
		if (_displayObjectFirstUnderPoint.exists(mask.bits)) {
			return _displayObjectFirstUnderPoint.get(mask.bits);
		}
		
		if (getSceneManagers() == null) {
			return null;
		}
		com.pblabs.util.Assert.isNotNull(getSceneManagers());
		for (sceneManager in getSceneManagers()) {
			var worldLoc = sceneManager.translateScreenToWorld(inputLocation);
			var layerIndex = sceneManager.children.length - 1;
			while (layerIndex >= 0) {
				var layer :BaseSceneLayer<Dynamic, Dynamic> = sceneManager.children[layerIndex];
				layerIndex--;
				//If the layer doesn't match the mask, ignore all the children.  Saves iterations
				if (!layer.objectMask.and(mask)) {
					continue;
				}
				var childIndex = layer.children.length -1;
				while (childIndex >= 0) {
					var so :BaseSceneComponent<Dynamic> = layer.children[childIndex];
					childIndex--;
					if (so.containsWorldPoint(worldLoc, mask)) {
						_displayObjectFirstUnderPoint.set(mask.bits, so);
						return so;
					}
				}
			}
		}
		_displayObjectFirstUnderPoint.set(mask.bits, null);
		return null;
	}
	
	public var inputLocation (get_inputLocation, null) :XY;
	function get_inputLocation () :XY
	{
		return _deviceLoc;
	}
	
	function clearInputDataCache () :Void
	{
		_displayObjectFirstUnderPoint.clear();
		_displayObjectsUnderPoint.clear();
	}
	
	#if js
	//TODO:
	public var inputAngle (get_inputAngle, null) :Float;
	function get_inputAngle () :Float
	{
		return 0;
	}
	
	public var inputScale (get_inputScale, null) :Float;
	function get_inputScale () :Float
	{
		return 0;
	}
	#end
	/** End Methods from IInputData */
	
}
