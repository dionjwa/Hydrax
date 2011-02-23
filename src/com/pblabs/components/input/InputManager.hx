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
	/** Objects that don't match this mask are never checked again */
	// public var preScreenMask :ObjectType;
	var _sceneManagers :Array<BaseScene2DManager<Dynamic>>;
	// var _spatialManager :ISpatialManager2D;
	// var _spatialObjects :Array<ISpatialObject2D>;
	var _spatialObjectsUnderPoint :Map<Int, Array<BaseScene2DComponent<Dynamic>>>;
	var _spatialObjectFirstUnderPoint :Map<Int, BaseScene2DComponent<Dynamic>>;
	// var _spatialObjectFirstUnderPoint :ISpatialObject2D;

	
	var _components :Array<MouseInputComponent>;
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
		// drag = new DirectSignaler(this);
		doubleClick = new DirectSignaler(this);
		rotate = new DirectSignaler(this);
		scale = new DirectSignaler(this);
		
		_inputCache = new InputData();
		_gestureCache = new GestureData();
		// underMouse = new Array();
		_checked = Sets.newSetOf(String);
		_deviceLoc = new Vector2();
		_isDeviceDown = false;
		_isGesturing = false;
		_tempVec = new Vector2();
		_fingersTouching = 0;
		_components = [];
		
		_sceneManagers = [];
		_spatialObjectsUnderPoint = Maps.newHashMap(Int);
		_spatialObjectFirstUnderPoint = Maps.newHashMap(Int);
	}
	
	public function onFrame () :Void
	{
		//Dispatch a deviceHeldDown signal, but only if there's something under the device.
		//NB: this doesn't recheck what's under the device, it's the same from the deviceDown.
		return;
		if (_isDeviceDown) {
			if (_deviceDownComponent != null) {
				
				if (_deviceDownComponent.isRegistered) {
					var mouseInput = _deviceDownComponent.owner.lookupComponentByType(MouseInputComponent);
			
					if (mouseInput != null && mouseInput.onDeviceHeldDown != null) {
						mouseInput.onDeviceHeldDown();
					}
				} else {
					_deviceDownComponent = null;
				}
				
				_inputCache.inputComponent = _deviceDownComponent;
				_inputCache.inputLocation = _deviceLoc.clone();
				_inputCache.touchCount = _fingersTouching;
				_inputCache.isMouseDown = true;
				deviceHeldDown.dispatch(_inputCache);
			}
		}
	}
	
	// public function registerComponent (c :MouseInputComponent) :Void
	// {
	// 	_components.remove(c);
	// 	_components.push(c);
	// }
	
	// public function unregisterComponent (c :MouseInputComponent) :Void
	// {
	// 	_components.remove(c);
	// }
	
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
		// drag = null;
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
	
	// inline function getSpatialManager () :ISpatialManager2D
	// {
	// 	if (_spatialManager == null) {
	// 		com.pblabs.util.Assert.isNotNull(_game);
	// 		com.pblabs.util.Assert.isNotNull(_game.currentContext);
	// 		_spatialManager = _game.currentContext.getManager(ISpatialManager2D);
	// 		com.pblabs.util.Assert.isNotNull(_spatialManager);
	// 		cast(_spatialManager, BasicSpatialManager2D).childrenDirtySignaler.bind(onSpatialObjectChanged);
	// 		_spatialObjects = null;
	// 	}
	// }
	
	// inline function getSpatialObjects () :Array<ISpatialObject2D>
	// {
	// 	if (_spatialObjects == null) {
	// 		_spatialObjects = preScreenMask == null ? _spatialManager.children.copy() : 
	// 			_spatialManager.children.filter(function (child :ISpatialObject2D) :Bool {
	// 				return child.objectMask == null || child.objectMask.and(preScreenMask);
	// 			});
	// 	}
	// 	return _spatialObjects;
	// }
	
	// function onSpatialObjectChanged (mng :ISpatialManager2D) :Void
	// {
	// 	_spatialObjects = null;
	// }
	
	function bindSignals () :Void
	{
		// drag.bind(onDrag);
		
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
					if (inputComp != null) {
						if (inputComp.isRotatable) {
							inputComp.angle = self._startingAngle + eventAngle;
						}
						
						if (inputComp.isScalable) {
							inputComp.scale = self._startingScale + cache.scale;
						}
					}
				}
			});
			gestures.gestureStart.bind(function (e :hsl.js.data.Touch.GestureEvent) :Void {
				self._isGesturing = true;
				//No selected component when gesturing.  Could it be that the use put two fingers down at the same time?
				if (self._deviceDownComponent == null) {
				}
				
				if (self._deviceDownComponent != null) {
					var inputComp = self._deviceDownComponent.owner.lookupComponent(MouseInputComponent);
					if (inputComp != null) {
						if (inputComp.isRotatable) {
							self._startingAngle = inputComp.angle;
						}
						if (inputComp.isScalable) {
							self._startingScale = inputComp.scale;
						}
					}
				}
			});
			gestures.gestureEnd.bind(function (e :hsl.js.data.Touch.GestureEvent) :Void {
				self._isGesturing = false;
			});
			
		}
		#end
		
	}
	
	// function modeRemoved (m :IPBContext) :Void
	// {
	// 	freeSignals();
	// }
	
	function freeSignals () :Void
	{
		_game.newActiveContextSignaler.unbind(onNewContext);
		// drag.unbind(onDrag);
		if (_mouse != null) {
			_mouse.mouseDown.unbind(onMouseDown);
			_mouse.mouseMove.unbind(onMouseMove);
			_mouse.mouseUp.unbind(onMouseUp);
			_mouse.mouseClick.unbind(onMouseClick);
		}
		// com.pblabs.util.Log.debug("");
		// deviceDown.unbindAll();
		// deviceMove.unbindAll();
		// deviceUp.unbindAll();
		// deviceClick.unbindAll();
		// drag.unbindAll();
		
		// if (_deviceDown != null) {
		//	 _deviceDown.unbindAll();
		//	 _deviceDown = null;
		// }
		// if (_deviceMove != null) {
		//	 _deviceMove.unbindAll();
		//	 _deviceMove = null;
		// }
		// if (_deviceUp != null) {
		//	 _deviceUp.unbindAll();
		//	 _deviceUp = null;
		// }
		// if (_deviceClick != null) {
		//	 _deviceClick.unbindAll();
		//	 _deviceClick = null;
		// }
	}                                                                                                                                                              

	#if js
	function adjustDeviceLocation (m :MouseLocation) :Vector2
	#else
	function adjustDeviceLocation (m :MouseLocation) :Vector2
	#end
	{
		// var view = context.getManager(SceneView);
		#if flash
		return new Vector2(m.globalLocation.x, m.globalLocation.y);//m.translateToScope(sceneView.layer);//.layer);
		#end
		
		#if js
		// if (m == null || m.scope == sceneView.layer) {
		//	 return new Vector2(m.x, m.y);
		// }
		return new Vector2(m.globalLocation.x - sceneView.mouseOffsetX, m.globalLocation.y - sceneView.mouseOffsetY);
		#else
		return new Vector2(m.x, m.y);
		#end
	}
	
	#if js
	function onMouseDown (m :MouseLocation) :Void
	#else
	function onMouseDown (m :MouseLocation) :Void
	#end
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
		
		// for (m in lookupComponentsUnderMouse(adjustedM)) {
		// 	trace("under mouse " + m.owner.name);
		// }
		// var underMouse = lookupComponentsUnderMouse(adjustedM);
		// var cUnderMouse = underMouse[0];
		// _deviceDownComponent = cUnderMouse;
		
		
		
		// #if testing
		// js.Lib.document.getElementById("haxe:deviceDown").innerHTML = "deviceDown: " + adjustedM + ", under=" + cUnderMouse;
		// js.Lib.document.getElementById("haxe:selected").innerHTML = "selected: " + (_deviceDownComponent == null ? "null" : Std.string(_deviceDownComponent.owner));
		
		// #end
		
		// _deviceDownLoc = adjustedM.clone();
		// _inputCache.inputComponent = cUnderMouse;
		// _inputCache.inputLocation = adjustedM.clone();
		// _inputCache.inputComponents = underMouse;
		
		// .set(cUnderMouse, adjustedM.clone());
		
		// var mouseInput = _deviceDownComponent;// != null ? _deviceDownComponent.owner.lookupComponentByType(MouseInputComponent) : null;
		
		// trace("mouseInput=" + mouseInput);
		// if (mouseInput != null) {
		// 	_startingAngle = mouseInput.angle;
		// 	//Cache the initial angle, in case we start rotating
		// 	// _startingScale = _inputCache.v1.scale;
		// 	// trace("mouseInput.onDeviceDown" );
		// 	if (mouseInput.onDeviceDown != null) {
		// 		mouseInput.onDeviceDown();
		// 	}
		// }
		
		// com.pblabs.util.Log.info("mouse down  " + _inputCache);
		// deviceDown.dispatch(_inputCache);
	} 
	
	#if js
	function onMouseUp (m :MouseLocation) :Void
	#else
	function onMouseUp (m :MouseLocation) :Void
	#end
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
		
		
		
		// var adjustedM = adjustDeviceLocation(m);
		// var cUnderMouse = lookupComponentsUnderMouse(adjustedM)[0];
		
		// _inputCache.inputComponent = cUnderMouse;
		// _inputCache.inputLocation = adjustedM.clone();
		// _inputCache.isMouseDown = false;
		
		
		// #if testing
		// js.Lib.document.getElementById("haxe:deviceUp").innerHTML = "deviceUp: " + adjustedM;
		// #end
		
		// _deviceDownComponent = null;
		// _deviceDownComponentLoc = null;
		// _deviceDownLoc = null;
		// deviceUp.dispatch(_inputCache);
	}
	
	#if js
	function onMouseMove (m :MouseLocation) :Void
	#else
	function onMouseMove (m :MouseLocation) :Void
	#end
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
		
		
		
		// var adjustedM = adjustDeviceLocation(m);
		// if (!isWithinSceneView(adjustedM)) {
		// 	return;
		// }
		
		// #if testing
		// js.Lib.document.getElementById("haxe:deviceMove").innerHTML = "deviceMove: " + adjustedM;
		// #end
		// _deviceLoc = adjustedM.clone();
		
		// _inputCache.inputComponent = _deviceDownComponent;
		// _inputCache.inputLocation = adjustedM.clone();
		// _inputCache.isMouseDown = _isDeviceDown;
		
		
		// if (_deviceDownComponent != null && drag.isListenedTo) {
		// 	drag.dispatch(_inputCache);
			
		// }
		// deviceMove.dispatch(_inputCache);
	}
	
	function isWithinSceneView (mouse :Vector2) :Bool
	{
	    return !(mouse.x < 0 || mouse.x > sceneView.width || mouse.y < 0 || mouse.y > sceneView.height);
	}
	
	// function onDrag (t :InputData) :Void
	// {
	// 	var mouseInput = t.inputComponent;//.owner.lookupComponentByType(MouseInputComponent);
	// 	if (mouseInput != null && mouseInput.isTranslatable) {
	// 		var offset = mouseInput.offset;
	// 		var scene2dComp :BaseScene2DComponent<Dynamic> = cast(t.inputComponent.bounds, BaseScene2DComponent<Dynamic>);
	// 		if (scene2dComp == null) {
	// 			com.pblabs.util.Log.error("WTF, how to translate scene to world without a Base2DComponent");
	// 			return;
	// 		}
	// 		var sceneManager :BaseScene2DManager<Dynamic> = cast(scene2dComp.parent.parent, BaseScene2DManager<Dynamic>);
			
	// 		var worldPoint = sceneManager.translateScreenToWorld(t.inputLocation);
	// 		if (offset != null) {
	// 			mouseInput.x = worldPoint.x + offset.x;
	// 			mouseInput.y = worldPoint.y + offset.y;
	// 		} else {
	// 			mouseInput.x = worldPoint.x;
	// 			mouseInput.y = worldPoint.y;
	// 		}
	// 	}
	// }
	
	#if js
	function onMouseClick (m :MouseLocation) :Void
	#else
	function onMouseClick (m :MouseLocation) :Void
	#end
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
		
		
		// _spatialObjectsUnderPoint.clear();
		// _spatialObjectFirstUnderPoint.clear();
		
		// com.pblabs.util.Log.info("Mouse clicked " + m.x + ", " + m.y);
		// var adjustedM = adjustDeviceLocation(m);
		
		// _inputCache.inputComponent = lookupComponentsUnderMouse(adjustedM)[0];
		// _inputCache.inputLocation = adjustedM.clone();
		// _inputCache.isMouseDown = false;
		
		// if (_inputCache.inputComponent != null) {
		// 	com.pblabs.util.Log.info("click  " + _inputCache);
		// 	deviceClick.dispatch(_inputCache);
		// }
		
		// var mouseInput = _inputCache.inputComponent != null ? _inputCache.inputComponent.owner.lookupComponentByType(MouseInputComponent) : null; 
		// if (mouseInput != null && mouseInput.onClick != null) {
		// 	mouseInput.onClick();
		// }
		
	}
	
	// function lookupComponentUnderMouse (m :MouseLocation) :IInteractiveComponent
	// {
	//	 var inputComps :Iterable<IInteractiveComponent>;
	//	 for (c in _context.getObjectsInGroup(IInteractiveComponent.INPUT_GROUP)) {
	//		 if (!Std.is(c, IEntity)) {
	//			 com.pblabs.util.Log.debug("weird, c is not an entity");
	//			 continue;
	//		 }
	//		 inputComps = cast(c, IEntity).lookupComponentsByType(IInteractiveComponent);
	//		 com.pblabs.util.Log.debug("Checking " + inputComps.count() + " input components");
	//		 for (inc in inputComps) {
	//			 if (inc.displayObject == null) {
	//				 com.pblabs.util.Log.error("IInteractiveComponent.displayObject == null");
	//				 continue;
	//			 }
	//			 if (inc.displayObject.hitTestPoint(flash.Lib.current.stage.mouseX, flash.Lib.current.stage.mouseY)) {
	//				 com.pblabs.util.Log.info("under mouse  " + _inputCache);
	//				 return inc;
	//			 }
	//		 }
	//	 }
	//	 return null;
	// }
	
	// function onGestureZoom (zoom :Float) :
	// {
	//	 ;
	// }
	
	// function lookupComponentsUnderMouse (mouseLoc :Vector2) :Array<MouseInputComponent>
	// {
	// 	com.pblabs.util.Assert.isNotNull(mouseLoc);
	// 	com.pblabs.util.Assert.isNotNull(_checked);
	// 	com.pblabs.util.Assert.isNotNull(_tempVec);
	// 	_checked.clear();
		
	// 	underMouse = new Array<MouseInputComponent>();
	// 	var inputComp :MouseInputComponent;
		
	// 	com.pblabs.util.Assert.isNotNull(_components);
	// 	for (c in _components) {
			
	// 		com.pblabs.util.Assert.isNotNull(c);
			
	// 		if (_checked.exists(c.owner.name)) {
	// 			continue;
	// 		}
			
	// 		//Copy to the cached vector just in cast the original is modified.
	// 		_tempVec.x = mouseLoc.x;
	// 		_tempVec.y = mouseLoc.y;
	// 		com.pblabs.util.Assert.isNotNull(c.bounds);
	// 		if (c.bounds.containsScreenPoint(_tempVec)) {
	// 			underMouse.push(c);
	// 		}
			
	// 	}
	// 	underMouse.sort(com.pblabs.util.Comparators.compareComparables);
	// 	return underMouse;
	// }
	
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
		
		if (_spatialObjectsUnderPoint.exists(mask.hashCode())) {
			return _spatialObjectsUnderPoint.get(mask.hashCode());
		}
		
		var underPoint = new Array<BaseScene2DComponent<Dynamic>>();
		if (getSceneManagers() == null) {
			return underPoint;
		}
		
		for (sceneManager in getSceneManagers()) {
			for (l in sceneManager.children) {
				var layer :BaseScene2DLayer<Dynamic, Dynamic> = cast l;
				//If the layer doesn't match the mask, ignore all the children.  Saves iterations
				if (!layer.inputMask.and(mask)) {
					continue;
				}
				for (obj in layer.children) {
					var so :BaseScene2DComponent<Dynamic> = cast obj;
					if (so.containsScreenPoint(inputLocation, mask)) {
						underPoint.push(so);
					}
				}
			}
		}
		
		_spatialObjectsUnderPoint.set(mask.hashCode(), underPoint);
		return underPoint;
	}
	
	public function firstObjectUnderPoint (?mask :ObjectType) :BaseScene2DComponent<Dynamic>
	{
		mask = mask == null ? ObjectType.ALL : mask;
		
		com.pblabs.util.Assert.isNotNull(_spatialObjectFirstUnderPoint);
		if (_spatialObjectFirstUnderPoint.exists(mask.hashCode())) {
			return _spatialObjectFirstUnderPoint.get(mask.hashCode());
		}
		
		if (getSceneManagers() == null) {
			return null;
		}
		com.pblabs.util.Assert.isNotNull(getSceneManagers());
		for (sceneManager in getSceneManagers()) {
			for (l in sceneManager.children) {
				var layer :BaseScene2DLayer<Dynamic, Dynamic> = cast l;
				//If the layer doesn't match the mask, ignore all the children.  Saves iterations
				if (!layer.inputMask.and(mask)) {
					continue;
				}
				for (obj in layer.children) {
					var so :BaseScene2DComponent<Dynamic> = cast obj;
					if (so.containsScreenPoint(inputLocation, mask)) {
						_spatialObjectFirstUnderPoint.set(mask.hashCode(), so);
						return so;
					}
				}
			}
		}
		_spatialObjectFirstUnderPoint.set(mask.hashCode(), null);
		return null;
	}
	
	public var inputLocation (get_inputLocation, null) :XY;
	function get_inputLocation () :XY
	{
		return _deviceLoc;
	}
	
	function clearInputDataCache () :Void
	{
		_spatialObjectFirstUnderPoint.clear();
		_spatialObjectsUnderPoint.clear();
	}
	
	#if js
	function get_inputAngle () :Float
	{
		return 0;
	}
	
	function get_inputScale () :Float
	{
		return 0;
	}
	#end
	
	/** End Methods from IInputData */
	
}
