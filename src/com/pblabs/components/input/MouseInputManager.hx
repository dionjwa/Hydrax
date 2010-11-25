/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.input;

import com.pblabs.components.scene.SceneView;
import com.pblabs.engine.debug.Log;
import com.pblabs.util.Preconditions;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;
import hsl.haxe.data.mathematics.Point;
import hsl.haxe.data.mouse.MouseLocation;

#if js
import hsl.js.translating.JSSignaler;

import js.Dom;

import js.Lib;
#end

/**
 * Funnels mouse events into signals.
 * Events are bound to the SceneView object.
 */
class MouseInputManager extends BaseInputManager
{
    public var mouseDown (default, null) :Signaler<MouseLocation>;
    public var mouseUp (default, null) :Signaler<MouseLocation>;
    public var mouseMove (default, null) :Signaler<MouseLocation>;
    public var mouseClick (default, null) :Signaler<MouseLocation>;
    
    /** Used if there is a TouchInputManager */
    public var currentTouches :Int;
    
    #if js
    public var isRootDocumentMouse (get_isRootDocumentMouse, set_isRootDocumentMouse) :Bool;
    var _isRootDocumentMouse :Bool;
    function rootMouseListener (e :js.Dom.Event) :Void
    {
        untyped e.preventDefault();
    }
    
    function get_isRootDocumentMouse () :Bool
    {
        return _isRootDocumentMouse;
    }
    
    function set_isRootDocumentMouse (val :Bool) :Bool
    {
        if (val) {
            untyped js.Lib.document.addEventListener("onmousedown", rootMouseListener);
            untyped js.Lib.document.addEventListener("onmouseup", rootMouseListener);
            untyped js.Lib.document.addEventListener("onclick", rootMouseListener);
        } else {
            untyped js.Lib.document.removeEventListener("onmousedown", rootMouseListener);
            untyped js.Lib.document.removeEventListener("onmouseup", rootMouseListener);
            untyped js.Lib.document.removeEventListener("onclick", rootMouseListener);
        }
        _isRootDocumentMouse = val;
        return val;
    }
    #end
    
    public function new ()
    {
        super();
        
        currentTouches = 0;
        #if js
        _isRootDocumentMouse = true;
        #end
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
    
    /** Used by the TouchInputManager when funneling mouse events */
    public function manualMouseDown (mouseX :Float, mouseY :Float, ?touches :Int = 1) :Void
    {
        currentTouches = touches;
        #if (flash || cpp)
        mouseDown.dispatch(new MouseLocation(mouseX, mouseY, new Point(_layer.stage.mouseX, _layer.stage.mouseY)));
        #elseif js
            #if testing
            js.Lib.document.getElementById("haxe:mouseDown").innerHTML = "manual mouseDown: (" + mouseX + ", " + mouseY + ")";
            #end
        mouseDown.dispatch(new MouseLocation(mouseX, mouseY, new hsl.haxe.data.mathematics.Point(mouseX, mouseY)));
        #end
    }
    
    /** Used by the TouchInputManager when funneling mouse events */
    public function manualMouseMove (mouseX :Float, mouseY :Float, ?touches :Int = 1) :Void
    {
        currentTouches = touches;
        #if (flash || cpp)
        mouseMove.dispatch(new MouseLocation(mouseX, mouseY, new Point(_layer.stage.mouseX, _layer.stage.mouseY)));
        #elseif js
            #if testing
            js.Lib.document.getElementById("haxe:mouseMove").innerHTML = "manual mouseMove: (" + mouseX + ", " + mouseY + ")";
            #end
        mouseMove.dispatch(new MouseLocation(mouseX, mouseY, new hsl.haxe.data.mathematics.Point(mouseX, mouseY)));
        #end
    }
    
    /** Used by the TouchInputManager when funneling mouse events */
    public function manualMouseUp (mouseX :Float, mouseY :Float, ?touches :Int = 0) :Void
    {
        currentTouches = touches;
        #if (flash || cpp)
        mouseUp.dispatch(new MouseLocation(mouseX, mouseY, new Point(_layer.stage.mouseX, _layer.stage.mouseY)));
        #elseif js
            #if testing
            js.Lib.document.getElementById("haxe:mouseUp").innerHTML = "manual mouseUp: (" + mouseX + ", " + mouseY + ")";
            #end
        mouseUp.dispatch(new MouseLocation(mouseX, mouseY, new hsl.haxe.data.mathematics.Point(mouseX, mouseY)));
        #end
    }
    
    function bindSignals () :Void
    {
        #if js
        mouseDown = new hsl.js.translating.JSSignaler(this, Lib.document, JSEventType.MOUSEDOWN, new hsl.js.translation.mouse.MouseLocationTranslator());
        mouseUp = new hsl.js.translating.JSSignaler(this, Lib.document, JSEventType.MOUSEUP, new hsl.js.translation.mouse.MouseLocationTranslator());
        mouseMove = new hsl.js.translating.JSSignaler(this, Lib.document, JSEventType.MOUSEMOVE, new hsl.js.translation.mouse.MouseLocationTranslator());
        mouseClick = new hsl.js.translating.JSSignaler(this, Lib.document, JSEventType.CLICK, new hsl.js.translation.mouse.MouseLocationTranslator());
        #elseif (flash || cpp)
        //Only listen to the context root layer, not the global layer.  This means that mouse events are automatically translated to local coords.
        var layer = sceneView.layer;//context.getManager(SceneView).layer;//context.displayContainer;
        mouseDown = new hsl.avm2.translating.AVM2Signaler(this, layer, flash.events.MouseEvent.MOUSE_DOWN, new hsl.avm2.translation.mouse.MouseLocationTranslator());
        mouseUp = new hsl.avm2.translating.AVM2Signaler(this, layer, flash.events.MouseEvent.MOUSE_UP, new hsl.avm2.translation.mouse.MouseLocationTranslator());
        mouseMove = new hsl.avm2.translating.AVM2Signaler(this, layer, flash.events.MouseEvent.MOUSE_MOVE, new hsl.avm2.translation.mouse.MouseLocationTranslator());
        mouseClick = new hsl.avm2.translating.AVM2Signaler(this, layer, flash.events.MouseEvent.CLICK, new hsl.avm2.translation.mouse.MouseLocationTranslator());
        #else
        Log.error("Platform mouse input not yet implemented.  Currently Flash/c++/JS only.");
        #end
    }
    
    function freeSignals () :Void
    {
        #if (js || flash || cpp)
        mouseDown.unbindAll();
        mouseUp.unbindAll();
        mouseMove.unbindAll();
        mouseClick.unbindAll();
        
        mouseDown = null;
        mouseUp = null;
        mouseMove = null;
        mouseClick = null;
        #end
    }
}
