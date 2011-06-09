/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.base;

import com.pblabs.engine.core.PropertyReference;

import com.pblabs.components.base.NotifyingValueComponent;

class AlphaComponent extends NotifyingValueComponent 
{
	public static var P_ALPHA :PropertyReference<Float> = new PropertyReference("@AlphaComponent.alpha");
	
	public var alpha (get_alpha, set_alpha) : Float;

	public function new ()
	{
		super();
		_value = 1;
	}
	
	override function onRemove():Void
	{
		super.onRemove();
		_value = 1;
	}
	
	function get_alpha () :Float
	{
		return super.get_value();
	}
	
	function set_alpha (val :Float) :Float
	{
		return super.set_value(val);
	}
	
	#if debug
	override public function toString () :String
	{
		return "Alpha=" + alpha; 
	}
	#end
}

