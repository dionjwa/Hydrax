/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.base;

import com.pblabs.components.base.NotifyingValueComponent;
import com.pblabs.engine.core.PropertyReference;

class ScaleComponent extends NotifyingValueComponent
{
	public static var P_SCALE :PropertyReference<Float> = new PropertyReference("@ScaleComponent.scale");
	
	public var scale (get_scale, set_scale) : Float;

	public function new ()
	{
		super();
		_value = 1;//Scale default
	}
	
	public function toString () :String
	{
		return "Scale=" + scale; 
	}
	
	function get_scale () :Float
	{
		return super.get_value();
	}
	
	function set_scale (val :Float) :Float
	{
		return super.set_value(val);
	}
}
