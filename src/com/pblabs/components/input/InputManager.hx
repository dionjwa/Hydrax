/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.input;

import com.pblabs.components.input.MouseInputComponent;
import com.pblabs.components.manager.NodeComponent;
import com.pblabs.components.scene.BaseScene2DComponent;
import com.pblabs.components.scene.BaseScene2DManager;
import com.pblabs.components.scene.SceneView;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.IPBManager;
import com.pblabs.engine.core.SetManager;
import com.pblabs.geom.Vector2;
import com.pblabs.util.Assert;
import com.pblabs.util.Comparators;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ReflectUtil;
import com.pblabs.util.ds.Set;
import com.pblabs.util.ds.Sets;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;
import hsl.haxe.data.mathematics.Point;
import hsl.haxe.data.mouse.MouseLocation;

using IterTools;

using Lambda;

using com.pblabs.components.scene.SceneUtil;
using com.pblabs.util.MathUtil;

#if js
using hsl.js.data.Touch.TouchListIterator;
#end

/**
 * Integrates different lower level input listeners into higher level signals such as drag,
 * and provides the components that react to input.
 */
class InputManager extends BaseInputManager
	// implements IPBManager, implements haxe.rtti.Infos
{
	public var deviceDown(default, null) :Signaler<InputData>;
	public var deviceUp(default, null) :Signaler<InputData>;
	public var deviceMove(default, null) :Signaler<InputData>;
	public var deviceClick(default, null) :Signaler<InputData>;
	public var deviceHeldDown(default, null) :Signaler<InputData>;
	public var drag(default, null) :Signaler<InputData>;
	public var doubleClick(default, null) :Signaler<InputData>;
	
	public var rotate (default, null) :Signaler<GestureData>;
	public var scale (default, null) :Signaler<GestureData>;
	
	public var isDeviceDown (get_isDeviceDown, null) :Bool;
	
	public var underMouse :Array<MouseInputComponent>;
	
	/** Is the mouse button down, or the device touched */
	var _isDeviceDown :Bool;
	
	
	// var _isRotating :Bool;
	var _startingAngle :Float;//Radians
	var _startingScale :Float;
	// var _startingLocation :Vector2;
	var _isZooming :Bool;
	
	// @inject
	// var context :IPBContext;
	
	@inject
	var _mouse :MouseInputManager;
	
	@inject
	var _sets :SetManager;
	
	
	#if js
	@inject
	var gestures :com.pblabs.components.input.GestureInputManager;
	#end
	
	
	public function new ()
	{
		super();
		deviceDown = new DirectSignaler(this);
		deviceMove = new DirectSignaler(this);
		deviceUp = new DirectSignaler(this);
		deviceClick = new DirectSignaler(this);
		deviceHeldDown = new DirectSignaler(this);
		drag = new DirectSignaler(this);
		doubleClick = new DirectSignaler(this);
		rotate = new DirectSignaler(this);
		scale = new DirectSignaler(this);
		
		_inputCache = new InputData();
		_gestureCache = new GestureData();
		underMouse = new Array();
		_checked = Sets.newSetOf(String);
		_mouseLoc = new Vector2();
		_isDeviceDown = false;
		_isGesturing = false;
		
		// _startingLocation = new Vector2();
		_tempVec = new Vector2();
		
		_fingersTouching = 0;
		
		drag.bind(onDrag);
		
		_components = [];
	}
	
	public function onFrame () :Void
	{
		//Dispatch a deviceHeldDown signal, but only if there's something under the device.
		//NB: this doesn't recheck what's under the device, it's the same from the deviceDown.
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
				_inputCache.inputLocation = _mouseLoc.clone();
				_inputCache.touchCount = _fingersTouching;
				_inputCache.isMouseDown = true;
				deviceHeldDown.dispatch(_inputCache);
			}
		}
	}
	
	public function registerComponent (c :MouseInputComponent) :Void
	{
		if (!_components.has(c)) {
			_components.push(c);
		}
	}
	
	public function unregisterComponent (c :MouseInputComponent) :Void
	{
		_components.remove(c);
	}
	
	override public function startup () :Void
	{
		super.startup();
		// Preconditions.checkNotNull(context, "Context is null");
		_sets = Preconditions.checkNotNull(_sets);//context.getManager(SetManager));
		
		bindSignals();
		_timer = new haxe.Timer(Std.int(1000.0 / 30));
		_timer.run = onFrame;
	}
	
	override public function shutdown () :Void
	{
		super.shutdown();
		freeSignals();
		_timer.stop();
		_timer =  null;
	}
	
	function bindSignals () :Void
	{
		// _mouse = context.getManager(MouseInputManager);
		
		com.pblabs.util.Assert.isNotNull(_mouse, "MouseInputManager is null, did you register one?");
		
		
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
	
	function modeRemoved (m :IPBContext) :Void
	{
		freeSignals();
	}
	
	function freeSignals () :Void
	{
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
	function adjustMouseLocation (m :MouseLocation) :Vector2
	#else
	function adjustMouseLocation (m :MouseLocation) :Vector2
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
		_isGesturing =  _isZooming = false;//_isRotating =
		_isDeviceDown = true;
		
		var adjustedM = adjustMouseLocation(m);
		if (!isWithinSceneView(adjustedM)) {
			return;
		}
		
		var cUnderMouse = lookupComponentsUnderMouse(adjustedM)[0];
		_deviceDownComponent = cUnderMouse;
		
		
		
		#if testing
		js.Lib.document.getElementById("haxe:deviceDown").innerHTML = "deviceDown: " + adjustedM + ", under=" + cUnderMouse;
		js.Lib.document.getElementById("haxe:selected").innerHTML = "selected: " + (_deviceDownComponent == null ? "null" : Std.string(_deviceDownComponent.owner));
		
		#end
		
		_deviceDownLoc = adjustedM.clone();
		_inputCache.inputComponent = cUnderMouse;
		_inputCache.inputLocation = adjustedM.clone();
		// .set(cUnderMouse, adjustedM.clone());
		
		var mouseInput = _deviceDownComponent;// != null ? _deviceDownComponent.owner.lookupComponentByType(MouseInputComponent) : null;
		
		// trace("mouseInput=" + mouseInput);
		if (mouseInput != null) {
			_startingAngle = mouseInput.angle;
			//Cache the initial angle, in case we start rotating
			// _startingScale = _inputCache.v1.scale;
			// trace("mouseInput.onDeviceDown" );
			mouseInput.onDeviceDown();
		}
		
		com.pblabs.util.Log.info("mouse down  " + _inputCache);
		deviceDown.dispatch(_inputCache);
	} 
	
	#if js
	function onMouseUp (m :MouseLocation) :Void
	#else
	function onMouseUp (m :MouseLocation) :Void
	#end
	{
		_isDeviceDown = false;
		var adjustedM = adjustMouseLocation(m);
		var cUnderMouse = lookupComponentsUnderMouse(adjustedM)[0];
		
		_inputCache.inputComponent = cUnderMouse;
		_inputCache.inputLocation = adjustedM.clone();
		_inputCache.isMouseDown = false;
		
		// _inputCache.set(cUnderMouse, new Vector2(adjustedM.x, adjustedM.y));
		
		#if testing
		js.Lib.document.getElementById("haxe:deviceUp").innerHTML = "deviceUp: " + adjustedM;
		#end
		// if (_inputCache.v1 != null) {
		//	 com.pblabs.util.Log.info("mouse up  " + _inputCache);
		// }
		
		_deviceDownComponent = null;
		_deviceDownComponentLoc = null;
		_deviceDownLoc = null;
		deviceUp.dispatch(_inputCache);
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
		
		var adjustedM = adjustMouseLocation(m);
		if (!isWithinSceneView(adjustedM)) {
			return;
		}
		
		#if testing
		js.Lib.document.getElementById("haxe:deviceMove").innerHTML = "deviceMove: " + adjustedM;
		#end
		_mouseLoc = adjustedM.clone();
		
		_inputCache.inputComponent = _deviceDownComponent;
		_inputCache.inputLocation = adjustedM.clone();
		_inputCache.isMouseDown = _isDeviceDown;
		
		
		// _inputCache.set(_deviceDownComponent, new Vector2(adjustedM.x, adjustedM.y));
		if (_deviceDownComponent != null && drag.isListenedTo) {
			// var stageMouse = getMouseLoc();
			// Assert.isNotNull(stageMouse);
			// Assert.isNotNull(_deviceDownLoc);
			// var diff = new Vector2(stageMouse.x - _deviceDownLoc.x, 
				// stageMouse.y - _deviceDownLoc.y);
			// Assert.isNotNull(_inputCache);
			// _inputCache.set(_deviceDownComponent, 
			//	 new Vector2(_deviceDownComponentLoc.x + diff.x, _deviceDownComponentLoc.y + diff.y));
			drag.dispatch(_inputCache);
			
		}
		deviceMove.dispatch(_inputCache);
	}
	
	function isWithinSceneView (mouse :Vector2) :Bool
	{
	    return !(mouse.x < 0 || mouse.x > sceneView.width || mouse.y < 0 || mouse.y > sceneView.height);
	}
	
	function onDrag (t :InputData) :Void
	{
		var mouseInput = t.inputComponent;//.owner.lookupComponentByType(MouseInputComponent);
		if (mouseInput != null && mouseInput.isTranslatable) {
			var offset = mouseInput.offset;
			var scene2dComp :BaseScene2DComponent<Dynamic> = cast(t.inputComponent.bounds, BaseScene2DComponent<Dynamic>);
			if (scene2dComp == null) {
				com.pblabs.util.Log.error("WTF, how to translate scene to world without a Base2DComponent");
				return;
			}
			var sceneManager :BaseScene2DManager<Dynamic> = cast(scene2dComp.parent.parent, BaseScene2DManager<Dynamic>);
			
			var worldPoint = sceneManager.translateScreenToWorld(t.inputLocation);
			if (offset != null) {
				mouseInput.x = worldPoint.x + offset.x;
				mouseInput.y = worldPoint.y + offset.y;
			} else {
				mouseInput.x = worldPoint.x;
				mouseInput.y = worldPoint.y;
			}
		}
		
	}
	
	#if js
	function onMouseClick (m :MouseLocation) :Void
	#else
	function onMouseClick (m :MouseLocation) :Void
	#end
	{
		com.pblabs.util.Log.info("Mouse clicked " + m.x + ", " + m.y);
		var adjustedM = adjustMouseLocation(m);
		// trace("onMouseClick " + adjustedM);
		// var clicked = new Array<IInteractiveComponent>();
		// _inputCache.set(lookupComponentUnderMouse(m), new Vector2(flash.Lib.current.stage.mouseX, flash.Lib.current.stage.mouseY));
		// _inputCache.set(cUnderMouse, getMouseLoc());
		
		_inputCache.inputComponent = lookupComponentsUnderMouse(adjustedM)[0];
		_inputCache.inputLocation = adjustedM.clone();
		_inputCache.isMouseDown = false;
		
		if (_inputCache.inputComponent != null) {
			com.pblabs.util.Log.info("click  " + _inputCache);
			deviceClick.dispatch(_inputCache);
		}
		
		var mouseInput = _inputCache.inputComponent != null ? _inputCache.inputComponent.owner.lookupComponentByType(MouseInputComponent) : null; 
		if (mouseInput != null) {
			mouseInput.onClick();
		}
		
		// var inputComps :Iterable<IInteractiveComponent>;
		// for (c in _context.getObjectsInGroup(IInteractiveComponent.INPUT_GROUP)) {
		//	 if (!Std.is(c, IEntity)) {
		//		 com.pblabs.util.Log.debug("weird, c is not an entity");
		//		 continue;
		//	 }
		//	 inputComps = cast(c, IEntity).lookupComponentsByType(IInteractiveComponent);
		//	 com.pblabs.util.Log.debug("Checking " + inputComps.count() + " input components");
		//	 for (inc in inputComps) {
		//		 if (inc.displayObject == null) {
		//			 com.pblabs.util.Log.error("IInteractiveComponent.displayObject == null");
		//			 continue;
		//		 }
		//		 if (inc.displayObject.hitTestVector2(flash.Lib.current.stage.mouseX, flash.Lib.current.stage.mouseY)) {
		//			 _inputCache.set(cast(inc), new Vector2(flash.Lib.current.stage.mouseX, flash.Lib.current.stage.mouseY));
		//			 com.pblabs.util.Log.info("click  " + _inputCache);
		//			 deviceClick.dispatch(_inputCache);
		//		 }
		//	 }
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
	
	function lookupComponentsUnderMouse (mouseLoc :Vector2) :Array<MouseInputComponent>
	{
		com.pblabs.util.Assert.isNotNull(mouseLoc);
		com.pblabs.util.Assert.isNotNull(_checked);
		com.pblabs.util.Assert.isNotNull(_tempVec);
		// trace("lookupComponentsUnderMouse");
		_checked.clear();
		
		// trace("objects in mouse set: " + _sets.getObjectsInSet(IInteractiveComponent.INPUT_GROUP).count());
		underMouse = new Array<MouseInputComponent>();
		var inputComp :MouseInputComponent;
		// var mouseLoc = m != null ? new Vector2(m.x, m.y) : getMouseLoc();
		
		com.pblabs.util.Assert.isNotNull(_components);
		for (c in _components) {//_sets.getObjectsInSet(INPUT_SET)) {
			// if (!Std.is(c, IEntity)) {
			//	 // com.pblabs.util.Log.debug("weird, c is not an entity");
			//	 continue;
			// }
			
			com.pblabs.util.Assert.isNotNull(c);
			
			if (_checked.exists(c.owner.name)) {
				continue;
			}
			
			// inputComp = c.owner.lookupComponentByType(IInteractiveComponent);
			// if (inputComp == null) {
			//	 com.pblabs.util.Log.error("Entity '" + cast(c, IEntity).name + "' registered in the set IInteractiveComponent does not have the IInteractiveComponent interface");
			//	 continue;
			// }
			// if (inputComp.bounds ==null) {
			//	 continue;
			// }
			// if (inputComp.displayObject == null) {
			//	 com.pblabs.util.Log.error("IInteractiveComponent.displayObject == null");
			//	 continue;
			// }
			
			//Check parents for mouse location
			// var parent :IInteractiveComponent = inputComp.parent;
			// while (parent != null) {
			//	 if (parent.bounds == null) {
			//		 trace("Null bounds");
			//		 break;
			//	 }
			//	 if (!parent.bounds.containsPoint(mouseLoc)) {
			//		 for (out in NodeComponent.getEntityAndAllChildren(parent.owner, IInteractiveComponent)) {
			//			 _checked.add(out.name);
			//		 }
			//	 }
			//	 parent = parent.parent;
			// }
			
			//Check again
			// if (_checked.exists(c.name)) {
			//	 continue;
			// }
			
			// trace("is " + inputComp.owner.name + " under mouse, bounds=" + inputComp.bounds.boundingRect + ", =" + inputComp.bounds.containsPoint(mouseLoc)); 
			// if (inputComp.bounds.containsPoint(mouseLoc)) {
			//	 // com.pblabs.util.Log.info("under mouse  " + _inputCache);
			//	 underMouse.push(inputComp);
			//	 // return inc;
			// }
			
			//Copy to the cached vector just in cast the original is modified.
			_tempVec.x = mouseLoc.x;
			_tempVec.y = mouseLoc.y;
			com.pblabs.util.Assert.isNotNull(c.bounds);
			if (c.bounds.containsScreenPoint(_tempVec)) {
				underMouse.push(c);
			}
			
			// if (inc.displayObject.hitTestPoint(flash.Lib.current.stage.mouseX, flash.Lib.current.stage.mouseY)) {
			//	 // com.pblabs.util.Log.info("under mouse  " + _inputCache);
			//	 underMouse.push(inc);
			//	 // return inc;
			// }
		}
		// if (underMouse.length > 1) {
		//	 underMouse.sort(Comparators.compareComparables);
		// }
		return underMouse;
	}
	
	inline function getMouseLoc () :Vector2
	{
		#if flash
		_mouseLoc.x = flash.Lib.current.stage.mouseX;
		_mouseLoc.y = flash.Lib.current.stage.mouseY;
		#elseif js
		//TODO: find this
		#else
		com.pblabs.util.Log.warn("No mouse detection on this platform");
		#end
		
		return _mouseLoc;
	}
	
	function get_isDeviceDown () :Bool
	{
		return _isDeviceDown;
	}
	
	var _components :Array<MouseInputComponent>;
	// var _mouse :MouseInputManager;
	// var _sets :SetManager;
	var _deviceDownComponent :MouseInputComponent;
	var _deviceDownComponentLoc :Vector2;
	var _deviceDownLoc :Vector2;
	var _checked :Set<String>;
	var _inputCache :InputData;
	var _gestureCache :GestureData;
	var _fingersTouching :Int;
	var _mouseLoc :Vector2;
	var _isGesturing :Bool;
	var _tempVec :Vector2;
	var _timer :haxe.Timer;
	static var INPUT_SET :String = ReflectUtil.tinyClassName(IInteractiveComponent);
	
}
