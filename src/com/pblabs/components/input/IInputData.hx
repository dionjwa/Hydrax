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
import com.pblabs.engine.core.ObjectType;

import de.polygonal.motor.geom.math.Vec2;

/**
  * Necessary data for input listeners
  */
interface IInputData
{
	function allObjectsUnderPoint (?mask :ObjectType) :Array<BaseSceneComponent<Dynamic>>;
	
	function firstObjectUnderPoint (?mask :ObjectType) :BaseSceneComponent<Dynamic>;
	
	var inputLocation (get_inputLocation, null) :Vec2;
	
	#if js
	var inputAngle (get_inputAngle, null) :Float;
	#end
	
	var zoomDelta (get_zoomDelta, null) :Float;
}
