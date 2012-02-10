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

import de.polygonal.core.math.Vec2;

/**
  * Necessary data for input listeners
  */
interface IInputData
{
	function allObjectsUnderPoint (?mask :ObjectType) :Array<BaseSceneComponent>;
	
	function firstObjectUnderPoint (?mask :ObjectType) :BaseSceneComponent;
	
	var inputLocation (get_inputLocation, null) :Vec2;
	
	#if js
	var inputAngle (get_inputAngle, null) :Float;
	#end
	
	var zoomDelta (get_zoomDelta, null) :Float;
}
