/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.input;
#if js
import com.pblabs.components.input.BaseInputManager;

import hsl.haxe.Signaler;

import hsl.js.translating.JSSignaler;

import hsl.js.data.Touch;
import js.Lib;

/**
 * Javascript only ATM.  What other platforms support gestures?
 * Funnels gesture events into Signals.
 * 
 */
class GestureInputManager extends BaseInputManager
{
    public var gestureStart (default, null) :Signaler<GestureEvent>;
    public var gestureChange (default, null) :Signaler<GestureEvent>;
    public var gestureEnd (default, null) :Signaler<GestureEvent>;
    
    public function new ()
    {
        super();
    }
    
    override public function startup () :Void
    {
        super.startup();
        bindSignals();
    }
    
    override public function shutdown () :Void
    {
        super.shutdown();
        freeSignals();
    }
    
    // inline function onTouchStart (e :TouchEvent) :Void 
    // {
    //     checkPropagation(e);
    //     touchStart.dispatch(e);
    // }
    
    // inline function onTouchMove (e :TouchEvent) :Void 
    // {
    //     checkPropagation(e);
    //     touchMove.dispatch(e);
    // }
    
    // inline function onTouchEnd (e :TouchEvent) :Void 
    // {
    //     checkPropagation(e);
    //     touchEnd.dispatch(e);
    // }
    
    // inline function onGestureStart (e :GestureEvent) :Void 
    // {
    //     checkPropagation(e);
    //     gestureStart.dispatch(e);
    // }
    
    // inline function onGestureChange (e :GestureEvent) :Void 
    // {
    //     checkPropagation(e);
    //     gestureChange.dispatch(e);
    // }
    
    // inline function onGestureEnd (e :GestureEvent) :Void 
    // {
    //     checkPropagation(e);
    //     gestureEnd.dispatch(e);
    // }
    
    // inline function checkPropagation (e :Event) :Void
    // {
    //     if (preventDefaultEventHandling) {
    //         untyped e.preventDefault();
    //     }
    // }
    
    function bindSignals () :Void
    {
        #if js
        // com.pblabs.util.Assert.isNotNull(_layer, "Layer is null");
        
        gestureStart = new hsl.js.translating.JSSignaler(this, Lib.document, JSEventType.GESTURESTART, new hsl.js.translation.touch.GestureTranslator());
        gestureChange = new hsl.js.translating.JSSignaler(this, Lib.document, JSEventType.GESTURECHANGE, new hsl.js.translation.touch.GestureTranslator());
        gestureEnd = new hsl.js.translating.JSSignaler(this, Lib.document, JSEventType.GESTUREEND, new hsl.js.translation.touch.GestureTranslator());
        #else
        Log.error("Platform gestures are not yet implemented.  Currently JS only.");
        #end
    }
    
    function freeSignals () :Void
    {
        #if js
        #if debug
        com.pblabs.util.Assert.isFalse(gestureStart.isListenedTo);
        com.pblabs.util.Assert.isFalse(gestureChange.isListenedTo);
        com.pblabs.util.Assert.isFalse(gestureEnd.isListenedTo);
        #end
        // gestureStart.unbindAll();
        // gestureChange.unbindAll();
        // gestureEnd.unbindAll();
        
        gestureStart = null;
        gestureChange = null;
        gestureEnd = null;
        #end
    }
}
#end
