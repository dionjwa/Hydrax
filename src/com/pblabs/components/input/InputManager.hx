/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.input;

import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.IPBManager;
import com.pblabs.engine.core.SetManager;
import com.pblabs.engine.debug.Log;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.engine.time.IProcessManager;
import com.pblabs.util.Preconditions;

import com.pblabs.util.Assert;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

#if flash
import hsl.avm2.data.mouse.MouseLocation;
#elseif js
import hsl.js.data.mouse.MouseLocation;
#end

import com.pblabs.util.ds.Set;
import com.pblabs.util.ds.Sets;
import com.pblabs.util.ds.Tuple;
import com.pblabs.geom.Vector2;

import com.pblabs.components.manager.NodeComponent;
import com.pblabs.components.input.MouseInputComponent;

using IterTools;

using Lambda;

/**
 * Controls and manages input in a more platform independant and
 * game friendly manner.
 */
class InputManager
    implements IAnimatedObject, implements IPBManager, implements haxe.rtti.Infos
{
    public var mouseDown(default, null) :Signaler<Tuple<MouseInputComponent, Vector2>>;
    public var mouseUp(default, null) :Signaler<Tuple<MouseInputComponent, Vector2>>;
    public var mouseMove(default, null) :Signaler<Tuple<MouseInputComponent, Vector2>>;
    public var mouseClick(default, null) :Signaler<Tuple<MouseInputComponent, Vector2>>;
    public var drag(default, null) :Signaler<Tuple<MouseInputComponent, Vector2>>;
    
    public var underMouse :Array<MouseInputComponent>;
    
    @inject
    var context :IPBContext;
    
    public function new ()
    {
        _tupleCache = new Tuple(null, null);
        
        mouseDown = new DirectSignaler(this);
        mouseMove = new DirectSignaler(this);
        mouseUp = new DirectSignaler(this);
        mouseClick = new DirectSignaler(this);
        drag = new DirectSignaler(this);
        underMouse = new Array();
        
        _checked = Sets.newSetOf(String);
        
        _mouseLoc = new Vector2();
    }
    
    public function onFrame (dt :Float) :Void
    {
        underMouse = lookupComponentsUnderMouse();
        underMouse.sort(MouseInputComponent.compare);
    }
    
    public function startup () :Void
    {
        Preconditions.checkNotNull(context, "Context is null");
        _sets = Preconditions.checkNotNull(context.getManager(SetManager));
        
        bindSignals();
        // #if flash
        // //On flash, we need to only listen to the top mode Sprite.
        // context.mainLoop.modeAddedSignaller.bind(modeAdded);
        // context.mainLoop.modeRemovedSignaller.bind(modeRemoved);
        // #end
        
        // #if js
        // if (context.rootElementId != null) {
        //     trace(context.rootElementId);
        // }
        // #end
        
        context.getManager(IProcessManager).addAnimatedObject(this);
    }
    
    public function shutdown () :Void
    {
        freeSignals();
    }
    
    function bindSignals () :Void
    {
        #if flash
        //Create the signals
        var displayContainer = context.displayContainer;
        _mouseDown = new hsl.avm2.translating.AVM2Signaler(this, displayContainer, flash.events.MouseEvent.MOUSE_DOWN, new hsl.avm2.translation.mouse.MouseLocationTranslator());
        _mouseMove = new hsl.avm2.translating.AVM2Signaler(this, displayContainer, flash.events.MouseEvent.MOUSE_MOVE, new hsl.avm2.translation.mouse.MouseLocationTranslator());
        _mouseUp = new hsl.avm2.translating.AVM2Signaler(this, displayContainer, flash.events.MouseEvent.MOUSE_UP, new hsl.avm2.translation.mouse.MouseLocationTranslator());
        _mouseClick = new hsl.avm2.translating.AVM2Signaler(this, displayContainer, flash.events.MouseEvent.CLICK, new hsl.avm2.translation.mouse.MouseLocationTranslator());
        
        //Add the listeners
        _mouseDown.bind(onMouseDown);
        _mouseMove.bind(onMouseMove);
        _mouseUp.bind(onMouseUp);
        _mouseClick.bind(onMouseClick);
        #else
        Log.warn("Platform mouse listeners are not yet implemented.  Currently flash only, but could easily add more.");
        #end
    }
    
    function modeRemoved (m :IPBContext) :Void
    {
        freeSignals();
    }
    
    function freeSignals () :Void
    {
        Log.debug("");
        mouseDown.unbindAll();
        mouseMove.unbindAll();
        mouseUp.unbindAll();
        mouseClick.unbindAll();
        drag.unbindAll();
        
        if (_mouseDown != null) {
            _mouseDown.unbindAll();
            _mouseDown = null;
        }
        if (_mouseMove != null) {
            _mouseMove.unbindAll();
            _mouseMove = null;
        }
        if (_mouseUp != null) {
            _mouseUp.unbindAll();
            _mouseUp = null;
        }
        if (_mouseClick != null) {
            _mouseClick.unbindAll();
            _mouseClick = null;
        }
    }

    function onMouseDown (m :MouseLocation) :Void
    {
        #if flash
        var cUnderMouse = underMouse[0];//lookupComponentUnderMouse(m);
        _mouseDownComponent = cUnderMouse;
        
        // _tupleCache.set(cUnderMouse, if (cUnderMouse != null) cUnderMouse else null);
        _mouseDownStageLoc = new Vector2(flash.Lib.current.stage.mouseX, flash.Lib.current.stage.mouseY);
        _mouseDownComponentLoc = _tupleCache.v2;
        _tupleCache.set(cUnderMouse, _mouseDownComponentLoc);
        
        if (_tupleCache.v1 != null) {
            Log.info("mouse down  " + _tupleCache);
            mouseDown.dispatch(_tupleCache);
        }
        #else
        Log.warn("Not implemented");
        #end
    } 
    
    function onMouseUp (m :MouseLocation) :Void
    {
        _tupleCache.set(underMouse[0], getMouseLoc());
        
        if (_tupleCache.v1 != null) {
            Log.info("mouse up  " + _tupleCache);
            mouseUp.dispatch(_tupleCache);
        }
        
        _mouseDownComponent = null;
        _mouseDownComponentLoc = null;
        _mouseDownStageLoc = null;
    }
    
    function onMouseMove (m :MouseLocation) :Void
    {
        if (_mouseDownComponent != null && _mouseDownComponentLoc != null) {
            var stageMouse = getMouseLoc();
            Assert.isNotNull(stageMouse);
            Assert.isNotNull(_mouseDownStageLoc);
            var diff = new Vector2(stageMouse.x - _mouseDownStageLoc.x, 
                stageMouse.y - _mouseDownStageLoc.y);
            Assert.isNotNull(_tupleCache);
            _tupleCache.set(_mouseDownComponent, 
                new Vector2(_mouseDownComponentLoc.x + diff.x, _mouseDownComponentLoc.y + diff.y));
            drag.dispatch(_tupleCache);
        }
    }
    
    function onMouseClick (m :MouseLocation) :Void
    {
        Log.info("Mouse clicked " + m.x + ", " + m.y);
        // var clicked = new Array<MouseInputComponent>();
        // _tupleCache.set(lookupComponentUnderMouse(m), new Vector2(flash.Lib.current.stage.mouseX, flash.Lib.current.stage.mouseY));
        _tupleCache.set(underMouse[0], getMouseLoc());
        
        if (_tupleCache.v1 != null) {
            Log.info("click  " + _tupleCache);
            mouseClick.dispatch(_tupleCache);
        }
        // var inputComps :Iterable<MouseInputComponent>;
        // for (c in _context.getObjectsInGroup(MouseInputComponent.INPUT_GROUP)) {
        //     if (!Std.is(c, IEntity)) {
        //         Log.debug("weird, c is not an entity");
        //         continue;
        //     }
        //     inputComps = cast(c, IEntity).lookupComponentsByType(MouseInputComponent);
        //     Log.debug("Checking " + inputComps.count() + " input components");
        //     for (inc in inputComps) {
        //         if (inc.displayObject == null) {
        //             Log.error("MouseInputComponent.displayObject == null");
        //             continue;
        //         }
        //         if (inc.displayObject.hitTestVector2(flash.Lib.current.stage.mouseX, flash.Lib.current.stage.mouseY)) {
        //             _tupleCache.set(cast(inc), new Vector2(flash.Lib.current.stage.mouseX, flash.Lib.current.stage.mouseY));
        //             Log.info("click  " + _tupleCache);
        //             mouseClick.dispatch(_tupleCache);
        //         }
        //     }
        // }
    }
    
    // function lookupComponentUnderMouse (m :MouseLocation) :MouseInputComponent
    // {
    //     var inputComps :Iterable<MouseInputComponent>;
    //     for (c in _context.getObjectsInGroup(MouseInputComponent.INPUT_GROUP)) {
    //         if (!Std.is(c, IEntity)) {
    //             Log.debug("weird, c is not an entity");
    //             continue;
    //         }
    //         inputComps = cast(c, IEntity).lookupComponentsByType(MouseInputComponent);
    //         Log.debug("Checking " + inputComps.count() + " input components");
    //         for (inc in inputComps) {
    //             if (inc.displayObject == null) {
    //                 Log.error("MouseInputComponent.displayObject == null");
    //                 continue;
    //             }
    //             if (inc.displayObject.hitTestPoint(flash.Lib.current.stage.mouseX, flash.Lib.current.stage.mouseY)) {
    //                 Log.info("under mouse  " + _tupleCache);
    //                 return inc;
    //             }
    //         }
    //     }
    //     return null;
    // }
    
    function lookupComponentsUnderMouse (?m :MouseLocation) :Array<MouseInputComponent>
    {
        _checked.clear();
        
        underMouse = new Array<MouseInputComponent>();
        var inputComp :MouseInputComponent;
        var mouseLoc = getMouseLoc();
        for (c in _sets.getObjectsInSet(MouseInputComponent.INPUT_GROUP)) {
            if (!Std.is(c, IEntity)) {
                // Log.debug("weird, c is not an entity");
                continue;
            }
            
            if (_checked.exists(c.name)) {
                continue;
            }
            
            inputComp = cast(c, IEntity).lookupComponentByName("MouseInputComponent");
            if (inputComp.bounds ==null) {
                // trace("inputComp.bounds=" + inputComp.bounds);
                continue;
            }
            // if (inputComp.displayObject == null) {
            //     Log.error("MouseInputComponent.displayObject == null");
            //     continue;
            // }
            
            //Check parents for mouse location
            var parent :MouseInputComponent = inputComp.parent;
            while (parent != null) {
                if (parent.bounds == null) {
                    trace("Null bounds");
                    break;
                }
                if (!parent.bounds.containsPoint(mouseLoc)) {
                    for (out in NodeComponent.getEntityAndAllChildren(parent.owner, MouseInputComponent)) {
                        _checked.add(out.name);
                    }
                }
                parent = parent.parent;
            }
            
            //Check again
            if (_checked.exists(c.name)) {
                continue;
            }
            
            // trace("is " + inputComp.owner.name + " under mouse, bounds=" + inputComp.bounds + ", =" + inputComp.bounds.containsPoint(mouseLoc)); 
            if (inputComp.bounds.containsPoint(mouseLoc)) {
                // Log.info("under mouse  " + _tupleCache);
                underMouse.push(inputComp);
                // return inc;
            }
            
            // if (inc.displayObject.hitTestPoint(flash.Lib.current.stage.mouseX, flash.Lib.current.stage.mouseY)) {
            //     // Log.info("under mouse  " + _tupleCache);
            //     underMouse.push(inc);
            //     // return inc;
            // }
        }
        return underMouse;
    }
    
    inline function getMouseLoc () :Vector2
    {
        #if flash
        _mouseLoc.x = flash.Lib.current.stage.mouseX;
        _mouseLoc.y = flash.Lib.current.stage.mouseY;
        #elseif js
        //TODO: find this
        #else
        Log.warn("No mouse detection on this platform");
        #end
        
        return _mouseLoc;
    }
    
    var _sets :SetManager;
    var _mouseDownComponent :MouseInputComponent;
    var _mouseDownComponentLoc :Vector2;
    var _mouseDownStageLoc :Vector2;
    var _mouseDown(default, null) :DirectSignaler<MouseLocation>;
    var _mouseUp(default, null) :DirectSignaler<MouseLocation>;
    var _mouseMove(default, null) :DirectSignaler<MouseLocation>;
    var _mouseClick(default, null) :DirectSignaler<MouseLocation>;
    var _rollOver(default, null) :DirectSignaler<MouseLocation>;
    var _rollOut(default, null) :DirectSignaler<MouseLocation>;
    
    var _checked :Set<String>;
    
    var _tupleCache :Tuple<MouseInputComponent, Vector2>;
    
    var _mouseLoc :Vector2;
    
}


