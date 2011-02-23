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
using com.pblabs.geom.PolygonTools;

/**
 * Convenient class for interacting with input pointers, as an alternative to 
 * interacting with the InputManager.
 */
class MouseInputComponent extends EntityComponent
{
	/**
	  * If there is an IInteractiveComponent in the Entity, you don't have to explicity set the properties.
	  */
	public var boundsProperty :PropertyReference<IInteractiveComponent>;
	public var bounds (get_bounds, set_bounds) :IInteractiveComponent;
	
	public var onClick :Void->Void;
	public var onDeviceDown :Void->Void;
	public var onDeviceHeldDown :Void->Void;
	
	
	public var isScalable :Bool;
	public var isRotatable :Bool;
	/** Moveable in the x/y? */
	public var isTranslatable :Bool;
	
	public function new ()
	{
		super();
		//The default is not movable, rotatable, or scalable.
		isScalable = isRotatable = isTranslatable = false;
	}
	
	override function onReset () :Void
	{
		super.onReset();
		
		if (boundsProperty != null) {
			_bounds = owner.getProperty(boundsProperty);
		}
		
		_bounds = _bounds == null ? owner.lookupComponentByType(IInteractiveComponent) : _bounds;
		
		com.pblabs.util.Assert.isNotNull(_bounds, "bounds is null, There's no IInteractiveComponent by type and the boundsProperty is null.  How are we supposed to work?");
		
		var input = context.getManager(InputManager);
		com.pblabs.util.Assert.isNotNull(input, "No InputManager?");

		SignalBondManager.bindSignal(this, input.deviceDown, onMouseDownInternal);
		SignalBondManager.bindSignal(this, input.deviceClick, onClickInternal);
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		isScalable = isRotatable = isTranslatable = false;
		boundsProperty = null;
		_bounds = null;
		onClick = null;
		onDeviceDown = null;
		onDeviceHeldDown = null;
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
		if ((onDeviceDown != null || isTranslatable) && data.firstObjectUnderPoint(bounds.objectMask) == _bounds) {
			if (onDeviceDown != null) {
				onDeviceDown();
			}
			if (isTranslatable) {
				var dragger = context.getManager(com.pblabs.components.input.DragManager);
				if (dragger != null) {
					dragger.startDragging(cast _bounds);
				}
			}
		}
	}
	
	function onClickInternal (data :IInputData) :Void
	{
		if (onClick != null && data.firstObjectUnderPoint(bounds.objectMask) == _bounds) {
			onClick();
		}
	}
	
	var _bounds :IInteractiveComponent;
	
	#if debug
	public function toString () :String
	{
		return cast(owner, com.pblabs.engine.core.Entity).toString();
	}
	#end
}
