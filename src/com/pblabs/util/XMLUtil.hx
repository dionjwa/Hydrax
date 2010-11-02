/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util;
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
            case Xml.PCData: return false;//???Really???? I don't know
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
    
    public static function createElementWithValue (name :String, value :String) :Xml
    {
        var xml = Xml.createElement(name);
        xml.nodeValue = value;
        return xml;
    }
    
    
    
}
