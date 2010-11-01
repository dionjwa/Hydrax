/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util;

import flash.events.Event;
import flash.events.IEventDispatcher;

class EventDispatcherUtil
{
    /**
      * From:
      * http://haxe.org/doc/snip/_flash_only_once_eventlistener
      */
    public static function addOnceListener (dispatcher:IEventDispatcher, type : String, listener : Event->Void) 
    {
        var o = { f : null }; // an anonymous object is used to reference the listener scope, if there is a cleaner or better way please let me know
        o.f = function (e :Event) {
            cast (e.target, IEventDispatcher).removeEventListener(e.type, o.f);
            listener(e);
        }
        dispatcher.addEventListener(type, o.f);
    }

}


