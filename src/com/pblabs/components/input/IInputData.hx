package com.pblabs.components.input;

import com.pblabs.components.scene.BaseScene2DComponent;
import com.pblabs.engine.core.ObjectType;

import de.polygonal.motor2.geom.math.XY;

/**
  * Necessary data for input listeners
  */
interface IInputData
{
	function allObjectsUnderPoint (?mask :ObjectType) :Array<BaseScene2DComponent<Dynamic>>;
	
	function firstObjectUnderPoint (?mask :ObjectType) :BaseScene2DComponent<Dynamic>;
	
	var inputLocation (get_inputLocation, null) :XY;
	
	#if js
	var inputAngle (get_inputAngle, null) :Float;
	
	var inputScale (get_inputScale, null) :Float;
	#end
}
