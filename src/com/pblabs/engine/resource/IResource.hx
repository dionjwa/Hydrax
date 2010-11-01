/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.resource;

import haxe.io.BytesData;

enum Source {
    url (u :String);
    bytes (b :BytesData);
    text (t :String);
    #if flash
    //FIgure out how to manage with with haxe embedded assets.
    // embedded
    #end
}

/**
  * Minimal resource.
  */
interface IResource<T>
{
    var name (get_name, never) :String;
    
    /**
      * Gets the resource mapped to the name.
      */
    function get (?resourceName :String) :T;
    
    /**
      * Loads resources managed by this instance.
      */
    function load (onLoad :Void->Void, onError :Dynamic->Void) :Void;
    
    function unload () :Void;
    
    function isLoaded () :Bool;
    
}

