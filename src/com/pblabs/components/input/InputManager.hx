/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.input;

import com.pblabs.components.scene.BaseScene2DComponent;
import com.pblabs.components.scene.BaseScene2DLayer;
import com.pblabs.components.scene.BaseScene2DManager;
import com.pblabs.components.scene.SceneManagerList;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.ObjectType;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGameBase;
import com.pblabs.engine.core.SetManager;
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

using com.pblabs.components.scene.SceneUtil;
using com.pblabs.util.MathUtil;

/**
 * Integrates different lower level input listeners into higher level signals such as drag,
 * and provides the components that react to input.
 */
class InputManager extends BaseInputManager,
	implements IInputData
{
	public var deviceDown(default, null) :Signaler<IInputData>;
	public var deviceUp(default, null) :Signaler<IInputData>;
	public var deviceMove(default, null) :Signaler<IInputData>;
	public var deviceClick(default, null) :Signaler<IInputData>;
	public var deviceHeldDown(default, null) :Signaler<IInputData>;
	// public var drag(default, null) :Signaler<IInputData>;
	public var doubleClick(default, null) :Signaler<IInputData>;
	
	public var rotate (default, null) :Signaler<GestureData>;
	public var scale (default, null) :Signaler<GestureData>;
	
	public var isDeviceDown (get_isDeviceDown, null) :Bool;
	
	// public var underMouse :Array<MouseInputComponent>;
	
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
	var _sceneManagers :Array<BaseScene2DManager<Dynamic>>;
	var _displayObjectsUnderPoint :Map<Int, Array<BaseScene2DComponent<Dynamic>>>;
	var _displayObjectFirstUnderPoint :Map<Int, BaseScene2DComponent<Dynamic>>;

	
	// var _components :Array<MouseInputComponent>;
	var _deviceDownComponent :MouseInputComponent;
	var _deviceDownComponentLoc :Vector2;
	var _deviceDownLoc :Vector2;
	var _checked :Set<String>;
	var _inputCache :InputData;
	var _gestureCache :GestureData;
	var _fingersTouching :Int;
	var _deviceLoc :Vector2;
	var _isGesturing :Bool;
	var _tempVec :Vector2;
	var _timer :haxe.Timer;
	static var INPUT_SET :String = ReflectUtil.tinyClassName(IInteractiveComponent);
	
	public function new ()
	{
		super();
		deviceDown = new DirectSignaler(this);
		deviceMove = new DirectSignaler(this);
		deviceUp = new DirectSignaler(this);
		deviceClick = new DirectSignaler(this);
		deviceHeldDown = new DirectSignaler(this);
		doubleClick = new DirectSignaler(this);
		rotate = new DirectSignaler(this);
		scale = new DirectSignaler(this);
		
		_inputCache = new InputData();
		_gestureCache = new GestureData();
		_checked = Sets.newSetOf(String);
		_deviceLoc = new Vector2();
		_isDeviceDown = false;
		_isGesturing = false;
		_tempVec = new Vector2();
		_fingersTouching = 0;
		// _components = [];
		
		_sceneManagers = [];
		_displayObjectsUnderPoint = Maps.newHashMap(Int);
		_displayObjectFirstUnderPoint = Maps.newHashMap(Int);
	}
	
	public function onFrame () :Void
	{
		//Dispatch a deviceHeldDown signal, but only if there's something under the device.
		//NB: this doesn't recheck what's under the device, it's the same from the deviceDown.
		// return;
		// if (_isDeviceDown) {
		// 	if (_deviceDownComponent != null) {
				
		// 		if (_deviceDownComponent.isRegistered) {
		// 			var mouseInput = _deviceDownComponent.owner.lookupComponentByType(MouseInputComponent);
			
		// 			if (mouseInput != null && mouseInput.onDeviceHeldDown != null) {
		// 				mouseInput.onDeviceHeldDown();
		// 			}
		// 		} else {
		// 			_deviceDownComponent = null;
		// 		}
				
		// 		_inputCache.inputComponent = _deviceDownComponent;
		// 		_inputCache.inputLocation = _deviceLoc.clone();
		// 		_inputCache.touchCount = _fingersTouching;
		// 		_inputCache.isMouseDown = true;
		// 		deviceHeldDown.dispatch(_inputCache);
		// 	}
		// }
	}
	
	override public function startup () :Void
	{
		super.startup();
		bindSignals();
		_timer = new haxe.Timer(Std.int(1000.0 / 30));
		_timer.run = onFrame;
	}
	
	override public function shutdown () :Void
	{
		super.shutdown();
		freeSignals();
		onNewContext(null);
		_timer.stop();
		_timer =  null;
		
		deviceDown = null;
		deviceUp = null;
		deviceMove = null;
		deviceClick = null;
		deviceHeldDown = null;
		doubleClick = null;
		rotate = null;
		scale = null;
	}
	
	function onNewContext (context :IPBContext) :Void
	{
		_sceneManagers = null;
		clearInputDataCache();
	}
	
	function getSceneManagers () :Array<BaseScene2DManager<Dynamic>>
	{
		if (_sceneManagers == null) {
			com.pblabs.util.Assert.isNotNull(_game);
			com.pblabs.util.Assert.isNotNull(_game.currentContext);
			
			var scenelist = _game.currentContext.getManager(SceneManagerList);
			if (scenelist == null) {
				return null;
			}
			_sceneManagers = scenelist.children.copy();
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
			gestures.gestureChange.bind(function (e :hsl.js.data.Touch.GestureEvent) :Void {
				// trace("gesture changed");
				// trace(e.rotation);
				#if testing
				js.Lib.document.getElementById("haxe:gestureRotation").innerHTML = "gestureRotation: " + e.rotation;
				js.Lib.document.getElementById("haxe:gestureScale").innerHTML = "gestureScale: " + e.scale;
				#end
				
				var eventAngle = e.rotation.toRad();
				// var eventScale = e.scale;
				
				//Dispatch the signals
				var cache = self._gestureCache;
				cache.inputComponent = self._deviceDownComponent;
				cache.rotation = eventAngle;
				cache.scale = e.scale;
				
				self.rotate.dispatch(cache);
				self.scale.dispatch(cache);
				// cache.set(self._deviceDownComponent, eventAngle);
				// cache.set(self._deviceDownComponent, eventScale);
					
				//Check for component specific rotation/scaling
				if (self._deviceDownComponent != null) {
					var inputComp = self._deviceDownComponent.owner.lookupComponent(MouseInputComponent);
					// if (inputComp != null) {
					// 	if (inputComp.isRotatable) {
					// 		inputComp.angle = self._startingAngle + eventAngle;
					// 	}
						
					// 	if (inputComp.isScalable) {
					// 		inputComp.scale = self._startingScale + cache.scale;
					// 	}
					// }
				}
			});
			gestures.gestureStart.bind(function (e :hsl.js.data.Touch.GestureEvent) :Void {
				self._isGesturing = true;
				//No selected component when gesturing.  Could it be that the use put two fingers down at the same time?
				if (self._deviceDownComponent == null) {
				}
				
				// if (self._deviceDownComponent != null) {
				// 	var inputComp = self._deviceDownComponent.owner.lookupComponent(MouseInputComponent);
				// 	if (inputComp != null) {
				// 		if (inputComp.isRotatable) {
				// 			self._startingAngle = inputComp.angle;
				// 		}
				// 		if (inputComp.isScalable) {
				// 			self._startingScale = inputComp.scale;
				// 		}
				// 	}
				// }
			});
			gestures.gestureEnd.bind(function (e :hsl.js.data.Touch.GestureEvent) :Void {
				self._isGesturing = false;
			});
			
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

	function adjustDeviceLocation (m :MouseLocation) :Vector2
	{
		#if flash
		return new Vector2(m.globalLocation.x, m.globalLocation.y);//m.translateToScope(sceneView.layer);//.layer);
		#end
		
		#if js
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
		#if flash
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
	public function allObjectsUnderPoint (?mask :ObjectType) :Array<BaseScene2DComponent<Dynamic>>
	{
		mask = mask == null ? ObjectType.ALL : mask;
		
		if (_displayObjectsUnderPoint.exists(mask.hashCode())) {
			return _displayObjectsUnderPoint.get(mask.hashCode());
		}
		
		var underPoint = new Array<BaseScene2DComponent<Dynamic>>();
		if (getSceneManagers() == null) {
			return underPoint;
		}
		
		for (sceneManager in getSceneManagers()) {
			var layerIndex =  sceneManager.children.length - 1;
			while (layerIndex >= 0) {
				var layer :BaseScene2DLayer<Dynamic, Dynamic> = sceneManager.children[layerIndex];
				layerIndex--;
				//If the layer doesn't match the mask, ignore all the children.  Saves iterations
				if (!layer.objectMask.and(mask)) {
					continue;
				}
				var childIndex = layer.children.length -1;
				while (childIndex >= 0) {
					var so :BaseScene2DComponent<Dynamic> = layer.children[childIndex];
					childIndex--;
					if (so.containsScreenPoint(inputLocation, mask)) {
						underPoint.push(so);
					}
				}
			}
		}
		
		_displayObjectsUnderPoint.set(mask.hashCode(), underPoint);
		return underPoint;
	}
	
	public function firstObjectUnderPoint (?mask :ObjectType) :BaseScene2DComponent<Dynamic>
	{
		mask = mask == null ? ObjectType.ALL : mask;
		
		com.pblabs.util.Assert.isNotNull(_displayObjectFirstUnderPoint);
		if (_displayObjectFirstUnderPoint.exists(mask.hashCode())) {
			return _displayObjectFirstUnderPoint.get(mask.hashCode());
		}
		
		if (getSceneManagers() == null) {
			return null;
		}
		com.pblabs.util.Assert.isNotNull(getSceneManagers());
		for (sceneManager in getSceneManagers()) {
			var layerIndex =  sceneManager.children.length - 1;
			while (layerIndex >= 0) {
				var layer :BaseScene2DLayer<Dynamic, Dynamic> = sceneManager.children[layerIndex];
				layerIndex--;
				//If the layer doesn't match the mask, ignore all the children.  Saves iterations
				if (!layer.objectMask.and(mask)) {
					continue;
				}
				var childIndex = layer.children.length -1;
				while (childIndex >= 0) {
					var so :BaseScene2DComponent<Dynamic> = layer.children[childIndex];
					childIndex--;
					if (so.containsScreenPoint(inputLocation, mask)) {
						_displayObjectFirstUnderPoint.set(mask.hashCode(), so);
						return so;
					}
				}
			}
		}
		_displayObjectFirstUnderPoint.set(mask.hashCode(), null);
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
