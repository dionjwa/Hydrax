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

package com.pblabs.engine.serialization;

    import flash.events.Event;

    /**
     * The TemplateEvent is used by the TemplateManager to dispatch information about the loaded
     * status of groups.
     *
     * @see com.pblabs.engine.core.TemplateManager
     */
    class TemplateEvent extends Event {

        /**
         * This event is dispatched by the TemplateManager when a group's entities have been loaded.
         *
         * @eventType groupLoaded
         */
        

        /**
         * This event is dispatched by the TemplateManager when a group's entities have been loaded.
         *
         * @eventType groupLoaded
         */
        public static var GROUP_LOADED:String = "groupLoaded";

        /**
         * The object name associated with this event.
         */
        public var name:String;

        public function new(type:String, name:String, ?bubbles:Bool=false, ?cancelable:Bool=false)
        {
            this.name = name;
            super(type, bubbles, cancelable);
        }
    }
