/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.input;

import com.pblabs.engine.core.EntityComponent;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.core.SignalBondManager;

import hsl.haxe.Bond;
import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

/**
 * Convenient class for interacting with input pointers, as an alternative to 
 * interacting with the InputManager.
 */
class MouseInputComponent extends EntityComponent
{
	public static function makeReactiveButton (mouse :MouseInputComponent) :MouseInputComponent
	{
		var spatial = mouse.owner.getComponent(com.pblabs.components.spatial.SpatialComponent);
		var input = mouse.context.getManager(com.pblabs.components.input.InputManager);
		com.pblabs.util.Assert.isNotNull(spatial);
		com.pblabs.util.Assert.isNotNull(input);
		var downOnThisButton = false;
		var move :com.pblabs.components.input.IInputData->Void = null;
		var bond :hsl.haxe.Bond = null;
		var down = function () :Void {
			if (!mouse.isRegistered) {
				com.pblabs.util.Log.warn("Mouse not registered");
				return;
			}
			spatial.y += 5;
			if (bond != null) {
				bond.destroy();
			}
			bond = input.deviceMove.bind(move);
			downOnThisButton = true;
		}
		var up = function () :Void {
			if (!mouse.isRegistered) {
				return;
			}
			if (downOnThisButton) {
				spatial.y -= 5;
				if (bond != null) {
					bond.destroy();
				}
				bond = null;
				downOnThisButton = false;
				// mouse.clicked();
			}
		}
		move = function (data :com.pblabs.components.input.IInputData) :Void {
			if (!mouse.isRegistered) {
				return;
			}
			//Check if the mouse moves out
			if (data.firstObjectUnderPoint(mouse.bounds.objectMask) != mouse.bounds) {
				spatial.y -= 5;
				input.deviceMove.unbind(move);
				downOnThisButton = false;
			}
		}
		mouse.bindDeviceDown(down);
		mouse.bindDeviceUp(up);
		
		mouse.owner.destroyedSignal.bind(function (ignored :Dynamic) :Void {
			if (bond != null) {
				bond.destroy();
			}
		}, true);
		
		return mouse;
	}
	
	
	/**
	  * If there is an IInteractiveComponent in the Entity, you don't have to explicity set the properties.
	  */
	public var boundsProperty :PropertyReference<IInteractiveComponent>;
	public var bounds (get_bounds, set_bounds) :IInteractiveComponent;
	var _bounds :IInteractiveComponent;
	
	var deviceDownSignaler (get_deviceDownSignaler, null) :Signaler<Void>;
	var _deviceDownSignaler :Signaler<Void>;
	function get_deviceDownSignaler () :Signaler<Void>
	{
		if (_deviceDownSignaler == null) {
			_deviceDownSignaler = new DirectSignaler(this);
		}
		return _deviceDownSignaler;
	}
	
	var deviceUpSignaler (get_deviceUpSignaler, null) :Signaler<Void>;
	var _deviceUpSignaler :Signaler<Void>;
	function get_deviceUpSignaler () :Signaler<Void>
	{
		if (_deviceUpSignaler == null) {
			_deviceUpSignaler = new DirectSignaler(this);
		}
		return _deviceUpSignaler;
	}
	
	var deviceClickSignaler (get_deviceClickSignaler, null) :Signaler<Void>;
	var _deviceClickSignaler :Signaler<Void>;
	function get_deviceClickSignaler () :Signaler<Void>
	{
		if (_deviceClickSignaler == null) {
			_deviceClickSignaler = new DirectSignaler(this);
		}
		return _deviceClickSignaler;
	}
	
	var deviceHeldDownSignaler (get_deviceHeldDownSignaler, null) :Signaler<Void>;
	var _deviceHeldDownSignaler :Signaler<Void>;
	var _deviceHeldDownBond :Bond;
	function get_deviceHeldDownSignaler () :Signaler<Void>
	{
		if (_deviceHeldDownSignaler == null) {
			_deviceHeldDownSignaler = new DirectSignaler(this);
		}
		return _deviceHeldDownSignaler;
	}
	
	// var deviceMoveSignaler (get_deviceMoveSignaler, null) :Signaler<Void>;
	// var _deviceMoveSignaler :Signaler<Void>;
	// var _deviceMoveBond :Bond;
	// function get_deviceMoveSignaler () :Signaler<Void>
	// {
	// 	if (_deviceMoveSignaler == null) {
	// 		_deviceMoveSignaler = new DirectSignaler(this);
	// 	}
	// 	return _deviceMoveSignaler;
	// }
	
	public var isScalable :Bool;
	public var isRotatable :Bool;
	/** Moveable in the x/y? */
	public var isTranslatable :Bool;
	public var constraint :PanManager.Constraint;
	
	var _bonds :Array<hsl.haxe.Bond>;
	var _mouseDownThis :Bool;
	
	public function new ()
	{
		super();
		//The default is not movable, rotatable, or scalable.
		isScalable = isRotatable = isTranslatable = false;
		_bonds = [];
		_mouseDownThis = false;
	}
	
	public function bindDeviceDown (callBack :Void->Void) :MouseInputComponent
	{
		com.pblabs.util.Assert.isNotNull(callBack);
		com.pblabs.util.Assert.isNotNull(deviceDownSignaler);
		_bonds.push(deviceDownSignaler.bindVoid(callBack));
		return this;
	}
	
	public function bindDeviceUp (callBack :Void->Void) :MouseInputComponent
	{
		com.pblabs.util.Assert.isNotNull(callBack);
		com.pblabs.util.Assert.isNotNull(deviceUpSignaler);
		_bonds.push(deviceUpSignaler.bindVoid(callBack));
		return this;
	}
	
	public function bindDeviceClick (callBack :Void->Void) :MouseInputComponent
	{
		com.pblabs.util.Assert.isNotNull(callBack);
		com.pblabs.util.Assert.isNotNull(deviceClickSignaler);
		_bonds.push(deviceClickSignaler.bindVoid(callBack));
		return this;
	}
	
	public function bindDeviceHeldDown (callBack :Void->Void) :MouseInputComponent
	{
		com.pblabs.util.Assert.isNotNull(callBack);
		com.pblabs.util.Assert.isNotNull(deviceHeldDownSignaler);
		_bonds.push(deviceHeldDownSignaler.bindVoid(callBack));
		return this;
	}
	
	public function clearListeners () :Void
	{
		for (bond in _bonds) {
			bond.destroy();
		}
		_bonds = [];
		destroyDeviceHeldBond();
		// destroyDeviceMoveBond();
	}
	
	override function onReset () :Void
	{
		super.onReset();
		_bounds = null;
		if (boundsProperty != null) {
			_bounds = owner.getProperty(boundsProperty);
		}
		
		_bounds = _bounds == null ? owner.getComponentByType(IInteractiveComponent) : _bounds;
		
		com.pblabs.util.Assert.isNotNull(_bounds, "bounds is null, There's no IInteractiveComponent by type and the boundsProperty is null.  How are we supposed to work?");
		
		var input = context.getManager(InputManager);
		com.pblabs.util.Assert.isNotNull(input, "No InputManager?");

		SignalBondManager.bindSignal(this, input.deviceDown, onMouseDownInternal);
		SignalBondManager.bindSignal(this, input.deviceUp, onMouseUpInternal);
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		isScalable = isRotatable = isTranslatable = false;
		boundsProperty = null;
		_bounds = null;
		_mouseDownThis = false;
		clearListeners();
	}
	
	function get_bounds () :IInteractiveComponent
	{
		return _bounds;
	}
	
	function set_bounds (bounds :IInteractiveComponent) :IInteractiveComponent
	{
		_bounds = bounds;
		return bounds;
	}
	
	function onMouseDownInternal (data :IInputData) :Void
	{
		_mouseDownThis = false;
		if (isTranslatable || (_deviceDownSignaler != null || _deviceClickSignaler != null || _deviceDownSignaler != null)) {
			if (data.firstObjectUnderPoint(bounds.objectMask) == _bounds) {
				
				_mouseDownThis = true;
				if (_deviceDownSignaler != null) {
					_deviceDownSignaler.dispatch();
				}
				
				_deviceHeldDownBond = context.getManager(InputManager).deviceHeldDown.bind(onDeviceHeldDownInternal);
				
				if (isTranslatable) {
					var dragger = context.getManager(PanManager);
					if (dragger != null) {
						dragger.panComponent(cast _bounds, false, false, null, null, constraint);
					}
				}
			}
		}
	}
	
	function onMouseUpInternal (data :IInputData) :Void
	{
		destroyDeviceHeldBond();
		if (data.firstObjectUnderPoint(bounds.objectMask) == _bounds) {
			if (_deviceUpSignaler != null) {
				_deviceUpSignaler.dispatch();
			}
			if (_mouseDownThis) {
				onClickInternal(data);
			}
		} 
		_mouseDownThis = false;
	}
	
	function onClickInternal (data :IInputData) :Void
	{
		destroyDeviceHeldBond();
		if (_deviceClickSignaler != null && data.firstObjectUnderPoint(bounds.objectMask) == _bounds) {
			_deviceClickSignaler.dispatch();
		}
	}
	
	function onDeviceHeldDownInternal (data :IInputData) :Void
	{
		if (_deviceHeldDownSignaler != null && data.firstObjectUnderPoint(bounds.objectMask) == _bounds) {
			_deviceHeldDownSignaler.dispatch();
		}
	}
	
	function destroyDeviceHeldBond () :Void
	{
		if (_deviceHeldDownBond != null) {
			_deviceHeldDownBond.destroy();
			_deviceHeldDownBond = null;
		}
	}
	
	// function destroyDeviceMoveBond () :Void
	// {
	// 	if (_deviceMoveBond != null) {
	// 		_deviceMoveBond.destroy();
	// 		_deviceMoveBond = null;
	// 	}
	// }
	
	#if debug
	public function toString () :String
	{
		return cast(owner, com.pblabs.engine.core.Entity).toString();
	}
	
	override public function postDestructionCheck () :Void
	{
		super.postDestructionCheck();
		if (_deviceDownSignaler != null) {
			com.pblabs.util.Assert.isFalse(deviceDownSignaler.isListenedTo);
		}
		if (_deviceUpSignaler != null) {
			com.pblabs.util.Assert.isFalse(_deviceUpSignaler.isListenedTo);
		}
		
		if (_deviceClickSignaler != null) {
			com.pblabs.util.Assert.isFalse(_deviceClickSignaler.isListenedTo);
		}
		if (_deviceHeldDownSignaler != null) {
			com.pblabs.util.Assert.isFalse(_deviceHeldDownSignaler.isListenedTo);
		}
	}
	#end
}
