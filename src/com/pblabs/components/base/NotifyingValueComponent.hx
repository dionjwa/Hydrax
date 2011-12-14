/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.base;

import com.pblabs.engine.core.EntityComponent;
import com.pblabs.engine.serialization.ISerializable;
import com.pblabs.engine.serialization.Serializer;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

using org.transition9.util.XmlTools;

class NotifyingValueComponent extends EntityComponent,
	implements ISerializable
{
	
	public var value (get_value, set_value) : Float;
	public var signaler (default, null) :Signaler<Float>;
	
	public function new () 
	{ 
		super();
		_value = 0;
		signaler = new DirectSignaler(this);
	}
	
	public function serialize (xml :Xml) :Void
	{
		xml.createChild("value", _value, Serializer.serializeFloat);
	}
	
	public function deserialize (xml :Xml) :Dynamic
	{
		_value = xml.parseFloat("value");
		return this;
	}
	
	public function dispatch () :Void
	{
	    signaler.dispatch(_value);
	}
	
	function get_value () :Float
	{
		return _value;
	}
	
	function set_value (val :Float) :Float
	{
		if (_value != val) {
			_value = val;
			dispatch();
		}
		return val;
	}
	
	override function onRemove():Void
	{
		super.onRemove();
		_value = 0;
	}
	
	override function onReset () :Void
	{
		super.onReset();
		signaler.dispatch(_value);
	}

	var _value :Float;
	
	#if debug
	override public function postDestructionCheck () :Void
	{
		super.postDestructionCheck();
		org.transition9.util.Assert.isFalse(signaler.isListenedTo);
	}
	#end
}
