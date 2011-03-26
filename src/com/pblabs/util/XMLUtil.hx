/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util;

import com.pblabs.engine.core.PropertyReference;
import com.pblabs.util.Enumerable;

using StringTools;

using com.pblabs.util.XMLUtil;
using com.pblabs.util.StringUtil;

class XMLUtil
{
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
	
	public static function child (xml :Xml, childName :String) :Xml
	{
		for (x in xml.elementsNamed(childName)) {
			return x;
		}
		return null;
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
			} else {
				child.addChild(Xml.createPCData(Std.string(value)));
			}
		}
		xml.addChild(child);
		return child;
	}
	
	public static function deserializeChild <T>(xml :Xml, childName :String, deserializeFunc :Xml->T) :T
	{
		var child = child(xml, childName);
		if (child == null) {
			return null;
		}
		return deserializeFunc(child);
	}
	
	
	public static function parseFloat (xml :Xml, childName :String) :Float
	{
		if (XMLUtil.child(xml, childName) != null) {
			return Std.parseFloat(XMLUtil.child(xml, childName).firstChild().nodeValue);
		}
		return 0;
	}
	
	public static function parsePropertyReference <T>(xml :Xml, childName :String) :PropertyReference<T>
	{
		try {
			if (XMLUtil.child(xml, childName) != null) {
				return new PropertyReference(parseString(XMLUtil.child(xml, childName)));
			}
		} catch (e :Dynamic) {
			com.pblabs.util.Log.error("Cannot parse PropertyReference from " + XMLUtil.child(xml, childName).toString()); 
		}
		return null;
	}
	
	public static function parseArray <T>(xml :Xml, childName :String, parseElement :String->T) :Array<T>
	{
		var arr :Array<T> = [];
		var namedChild = xml.child(childName);  
		if (namedChild != null) {
			var s = namedChild.firstChild().nodeValue;
			if (!s.isBlank()) {
				for (sval in s.split(",")) {
					var token = sval.trim();
					arr.push(parseElement(token));
				}
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
	
}
