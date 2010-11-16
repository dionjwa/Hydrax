/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.resource;

import com.pblabs.engine.resource.ResourceBase;
import com.pblabs.util.Preconditions;

/**
  * Generic embedded resources.
  *
  * On the JS platform, this means data in the page itself.  This waits for the page to load before allowing the elements to be accessed.
  * Used for e.g. loading SVG elements by id.  Returns a deep copy of the element, so you only need to 
  * embed each element once.
  *
  * On the flash platform, instantiates embedded classes.  Supply the class name after the "SWFResource_" prefix.
  */
class EmbeddedResource extends ResourceBase<Dynamic>
{
    public static var NAME :String = "embedded";
    
    public function new (?name :String)
    {
        super(name == null ? NAME : name);
    }
    
    override public function load (onLoad :Void->Void, onError :Dynamic->Void) :Void
    {
        super.load(onLoad, onError);
        #if js
        //Wait until the page has completed loading        
        var self = this;
        var pageLoaded = function (e :Dynamic) :Void {
            //Unload?  Is this necessary>?
            js.Lib.window.onload = null;
            self.loaded();
        }
        
        js.Lib.window.onload = pageLoaded;
        
        #elseif flash
        //In Flash, is the delay necessary? 
        haxe.Timer.delay(loaded, 1);
        #end
    }
    
    override public function create (?elementName :String) :Dynamic
    {
        Preconditions.checkNotNull(elementName, "element name cannot be null");
        #if js
        var element = js.Lib.document.getElementById(elementName);
        Preconditions.checkNotNull(element, "No element with id=\"" + elementName + "\"");
        return element.cloneNode(true);
        #elseif flash
        var cls :Class<Dynamic> = Type.resolveClass("SWFResources_" + elementName);
        Preconditions.checkNotNull(cls, "No embedded resource class SWFResources_" + elementName);
        return Type.createInstance(cls, EMPTY_ARRAY);
        #end
    }
    
    #if flash
    static var EMPTY_ARRAY :Array<Dynamic> = [];
    #end
}
