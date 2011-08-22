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
import com.pblabs.engine.core.IEntity;
import com.pblabs.util.Preconditions;

/**
  * "using" functions. 
  */
class InputTools
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
		}).destroyOnUse();
		
		return mouse;
	}
}
