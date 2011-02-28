/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file was derived from the equivalent actionscript PushButton Engine 
 * source file:
 * http://code.google.com/p/pushbuttonengine/
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.core;

import com.pblabs.engine.serialization.ISerializable;

/**
* * WARNING: this code does not currently work, conversion is still a work in progress.
 * An ObjectType is an abstraction of a bitmask that can be used to associate
 * objects with type names.
 * 
 * @see ObjectTypeManager
 */
class ObjectType 
	implements ISerializable, implements com.pblabs.util.ds.Hashable
{
	public static var ALL :ObjectType = {
		var wildcard = new ObjectType([]);
		wildcard._bits = 0xFFFFFFFF;
		wildcard;
	}
	
	public static var NONE :ObjectType = {
		var none = new ObjectType([]);
		none._bits = 0;
		none;
	}
	
	/**
	 * The bitmask that this type wraps. This should not be used directly. Instead,
	 * use the various test methods on the ObjectTypeManager.
	 * 
	 * @see com.pblabs.engine.core.ObjectTypeManager.doesTypeMatch()
	 * @see com.pblabs.engine.core.ObjectTypeManager.doesTypeOverlap()
	 * @see com.pblabs.engine.core.ObjectTypeManager.doTypesMatch()
	 * @see com.pblabs.engine.core.ObjectTypeManager.doTypesOverlap()
	 */
	public var bits(get_bits, null) :Int;
	function get_bits() :Int
	{
		return _bits;
	}
	public var typeName(getTypeName, setTypeName) :String;
	public var typeNames(getTypeNames, setTypeNames) :Array<String>;
	// public var wildcard(getWildcard, null) :ObjectType;
	public var manager :ObjectTypeManager;
	
	
	
	public function new(arguments :Array<String>)
	{
		if(arguments.length == 1) {
			typeName = arguments[0];
		}
		else if(arguments.length > 1)
		{
			typeNames = arguments;
		}
	}
	
	/**
	 * The name of the type associated with this object type. If multiple names have
	 * been assigned, the one with the least significant bit is returned.
	 */
	public function getTypeName() :String{
		for (i in 0...manager.typeCount)
		{
			if (_bits & (1 << i) != 0) {
				return manager.getTypeName(1 << i);
			}
		}
		
		return "";
	}
	
	/**
	 * @private
	 */
	public function setTypeName(value :String) :String
	{
		_bits = manager.getType(value);
		return value;
	}
	
	/**
	 * A list of all the type names associated with this object type.
	 */
	public function getTypeNames() :Array<String>
	{
		var array = new Array<String>();
		for (i in 0...manager.typeCount) {
			if (_bits & (1 << i) != 0)
				array.push(manager.getTypeName(1 << i));
		}
		
		return array;
	}
	
	/**
	 * @private
	 */
	public function setTypeNames (value :Array<String>) :Array<String>
	{
		_bits = 0;
		for (typeName in value) {
			_bits |= manager.getType(typeName);
		}
		return value;
	}
	
	
	/**
	 * Add typeName to current ObjectType
	 */
	public function add (typeName :String) :Void
	{
		_bits |= manager.getType(typeName);		  
	}	  
	
	/**
	 * Remove typeName from current ObjectType
	 */
	public function remove(typeName :String) :Void
	{		 
		_bits &= (ALL.bits - manager.getType(typeName));					
	}
	
	/**
	 * Perform a bitwise-and against another ObjectType and return true if they match.
	 */
	public function and(other :ObjectType) :Bool
	{
		if ((other.bits & bits) != 0)
			return true;
		else
			return false;
	}
	
	/**
	 * @inheritDoc
	 */
	public function serialize(xml :Xml) :Void
	{
		// var typeNames :Array<String> = typeNames;
		// if (typeNames.length == 1)
		// {
		// 	xml.appendChild(typeNames[0]);
		// 	return;
		// }
		
		// for (typeName in typeNames) {
		// 	xml.appendChild(Xml.parse("<type>{typeName}</type>"));
		// }
	}
	
	/**
	 * The xml description for this class can be either a single string, which will
	 * then be assigned to the TypeName property, or a list of strings, each in their
	 * own child tag (the name of which doesn't matter).
	 * 
	 * @inheritDoc
	 */
	public function deserialize(xml :Xml) :Dynamic
	{
		// manager = _context.getManager(ObjectTypeManager);
		
		// if (xml.hasSimpleContent())
		// {
		// 	typeName = xml.toString();
		// 	return this;
		// }
		
		// _bits = 0;
		// for (childXML in xml.) {
		// 	_bits |= manager.getType(childXML.toString());
		// }
		
		// return this;
	}
	
	public function hashCode () :Int
	{
	    return _bits;
	}
	
	var _bits :Int;
	
	#if debug
	public function toString () :String
	{
		if (_bits == ALL._bits) {
			return "[ObjectType ALL]";
		} if (_bits == NONE._bits) {
			return "[ObjectType NONE]";
		} else {
			return "[ObjectType types=" + getTypeNames() + "]";
		}
	}
	#end
}
