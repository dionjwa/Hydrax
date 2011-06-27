/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util;

using StringTools;

using com.pblabs.util.StringUtil;
using com.pblabs.util.XMLUtil;

class XMLUtil
{
	public static function findElement (xml :Xml, elementName :String, ?attribute :String, ?attributeValue :String) :Xml
	{
	    for (e in xml.elements()) {
	    	if (e.nodeName == elementName) {
	    		if (attribute != null) {
	    			if (e.get(attribute) == attributeValue) {
	    				return e;
	    			}
	    		} else {
	    			return e;
	    		}
	    	} else {//Keep looking
	    		var found = findElement(e, elementName, attribute, attributeValue);
	    		if (found != null) {
	    			return found;
	    		}
	    	}
	    }
	    return null;
	}
	
	
	
	/**
	  * From flash docs:
	  * An XML object contains complex content if it has child elements. 
	  * XML objects that representing attributes, comments, 
	  * processing instructions, and text nodes do not have complex 
	  * content. However, an object that contains these can still 
	  * be considered to contain complex content (if the object has 
	  * child elements). 
	  */
	public static function hasComplexContent (xml :Xml) :Bool
	{
		if (xml.nodeType != Xml.Element) {
			return false;
		}
		
		if (xml.elements().hasNext()) {
			return true;
		}
		return false;
	}
	
	public static function hasSimpleContent (xml :Xml) :Bool
	{
		switch (xml.nodeType) {
			case Xml.CData: return false;
			case Xml.Comment: return false;
			case Xml.DocType: return false;
			case Xml.Document: return false;
			case Xml.Element:
				return false;
			case Xml.PCData: return true;//???Really???? I don't know
			case Xml.Prolog: return false;
			
		}
		return !hasComplexContent(xml);
	}

	public static function ensureNotDocument (xml :Xml) :Xml
	{
		return xml.nodeType == Xml.Document ? xml.firstElement() : xml;
	}
	
	public static function child (xml :Xml, childName :String) :Xml
	{
		//If xml.elementsNamed(childName) is used, it fails parsing SVG
		for (x in xml.elements()) {
			if (x.nodeName == childName)
				return x;
		}
		return null;
	}
	
	public static function isChild (xml :Xml, childName :String) :Bool
	{
		for (x in xml.elementsNamed(childName)) {
			return true;
		}
		return false;
	}
	
	public static function createElementWithValue (name :String, value :Dynamic) :Xml
	{
		var xml = Xml.createElement(name);
		xml.nodeValue = Std.string(value);
		return xml;
	}
	
	public static function createChild (xml :Xml, name :String, ?value :Dynamic, ?serializeFunc :Dynamic->Xml->Void) :Xml
	{
		var child = Xml.createElement(name);
		if (value != null) {
			if (serializeFunc != null) {
				serializeFunc(value, child);		
			} else if (value != null) {
				child.addChild(Xml.createPCData(Std.string(value)));
			}
		}
		xml.addChild(child);
		return child;
	}
	
	public static function deserializeChild <T>(xml :Xml, childName :String, deserializeFunc :Xml->T, ?defaultValue :Null<T>) :T
	{
		var child = child(xml, childName);
		if (child == null) {
			return defaultValue;
		}
		return deserializeFunc(child);
	}
	
	
	public static function parseFloat (xml :Xml, childName :String) :Float
	{
		if (XMLUtil.child(xml, childName) != null) {
			return Std.parseFloat(XMLUtil.child(xml, childName).firstChild().nodeValue);
		} else {
				com.pblabs.util.Log.info("No child property to parse=" + childName);
			}
		return 0;
	}
	
	public static function parseArray <T>(xml :Xml, parseElement :String->T, ?delim :String = ",") :Array<T>
	{
		if (xml == null) {
			return [];
		}
		com.pblabs.util.Assert.isNotNull(xml);
		com.pblabs.util.Assert.isNotNull(parseElement);
		var arr :Array<T> = [];
		
		if (xml.firstChild() == null) {
			return arr;
		}
		
		var s = xml.firstChild().nodeValue;
		if (!s.isBlank()) {
			for (sval in s.split(delim)) {
				var token = sval.trim();
				arr.push(parseElement(token));
			}
		}
		return arr;
	}
	
	public static function parseString(xml :Xml) :String
	{
		try {
			com.pblabs.util.Assert.isNotNull(xml);
			return xml.firstChild() != null && xml.firstChild().nodeValue != null ? xml.firstChild().nodeValue.trim() : "";
		} catch (e :Dynamic) {
			com.pblabs.util.Log.error(e);
			return null;
		}
	}
	
	public static function getChildWithAttributeValue (xml :Xml, attributeName :String, val :String) :Xml
	{
	    for (child in xml.elements()) {
			if (child.exists(attributeName) && child.get(attributeName) == val) {
				return child;
			}
		}
		return null;
	}
	
	public static function elementNamedWithAttribute (xml :Xml, elementName :String, attributeName :String, val :String) :Xml
	{
	    for (child in xml.elementsNamed(elementName)) {
			if (child.exists(attributeName) && child.get(attributeName) == val) {
				return child;
			}
		}
		return null;
	}
	
	
}
