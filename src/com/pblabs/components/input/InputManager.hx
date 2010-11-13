/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.input;

import com.pblabs.components.input.IInteractiveComponent;
import com.pblabs.components.input.MouseInputComponent;
import com.pblabs.components.manager.NodeComponent;
import com.pblabs.components.scene.SceneView;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.IPBManager;
import com.pblabs.engine.core.SetManager;
import com.pblabs.engine.debug.Log;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.engine.time.IProcessManager;
import com.pblabs.geom.Vector2;
import com.pblabs.util.Assert;
import com.pblabs.util.Comparators;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ReflectUtil;
import com.pblabs.util.ds.Set;
import com.pblabs.util.ds.Sets;
import com.pblabs.util.ds.Tuple;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;
import hsl.haxe.data.mathematics.Point;

#if flash
import hsl.avm2.data.mouse.MouseLocation;
#elseif js
import hsl.js.data.mouse.MouseLocation;

using js.IOs.TouchListIterator;
import js.Dom;
#end

using IterTools;

using Lambda;

using com.pblabs.util.MathUtil;


/**
 * Integrates different input listeners into signals such as drag,
 * and provides the components that react to input.
 */
class InputManager
    implements IAnimatedObject, implements IPBManager, implements haxe.rtti.Infos
{
    public var deviceDown(default, null) :Signaler<Tuple<IInteractiveComponent, Vector2>>;
    public var deviceUp(default, null) :Signaler<Tuple<IInteractiveComponent, Vector2>>;
    public var deviceMove(default, null) :Signaler<Tuple<IInteractiveComponent, Vector2>>;
    public var deviceClick(default, null) :Signaler<Tuple<IInteractiveComponent, Vector2>>;
    public var drag(default, null) :Signaler<Tuple<IInteractiveComponent, Vector2>>;
    public var doubleClick(default, null) :Signaler<Tuple<IInteractiveComponent, Vector2>>;
    
    public var rotate (default, null) :Signaler<Tuple<IInteractiveComponent, Float>>;
    public var scale (default, null) :Signaler<Tuple<IInteractiveComponent, Float>>;
    
    public var underMouse :Array<IInteractiveComponent>;
    
    /** Is the mouse button down, or the device touched */
    var _isDeviceDown :Bool;
    
    
    var _isRotating :Bool;
    var _startingAngle :Float;//Radians
    var _startingScale :Float;
    var _startingLocation :Vector2;
    var _isZooming :Bool;
    
    @inject
    var context :IPBContext;
    
    public function new ()
    {
        deviceDown = new DirectSignaler(this);
        deviceMove = new DirectSignaler(this);
        deviceUp = new DirectSignaler(this);
        deviceClick = new DirectSignaler(this);
        drag = new DirectSignaler(this);
        doubleClick = new DirectSignaler(this);
        rotate = new DirectSignaler(this);
        scale = new DirectSignaler(this);
        
        _tupleCache = new Tuple(null, null);
        underMouse = new Array();
        _checked = Sets.newSetOf(String);
        _mouseLoc = new Vector2();
        _isDeviceDown = false;
        _isGesturing = false;
        
        _startingLocation = new Vector2();
        
        drag.bind(onDrag);
    }
    
    public function onFrame (dt :Float) :Void
    {
        // if (_isDeviceDown && drag.isListenedTo) {
        //     underMouse = lookupComponentsUnderMouse();
        //     underMouse.sort(IInteractiveComponent.compare);
        // }
    }
    
    public function startup () :Void
    {
        Preconditions.checkNotNull(context, "Context is null");
        _sets = Preconditions.checkNotNull(context.getManager(SetManager));
        
        bindSignals();
        // context.getManager(IProcessManager).addAnimatedObject(this);
    }
    
    public function shutdown () :Void
    {
        freeSignals();
        context.getManager(IProcessManager).removeAnimatedObject(this);
    }
    
    function bindSignals () :Void
    {
        var mouse = context.getManager(MouseInputManager);
        
        #if debug
        com.pblabs.util.Assert.isNotNull(mouse, "MouseInputManager is null, did you register one?");
        #end
        
        
        mouse.mouseDown.bind(onMouseDown);
        mouse.mouseMove.bind(onMouseMove);
        mouse.mouseUp.bind(onMouseUp);
        mouse.mouseClick.bind(onMouseClick);
     
        #if js
        if (context.getManager(GestureInputManager) != null) {
            var gestures = context.getManager(GestureInputManager);
            var self = this;
            gestures.gestureChange.bind(function (e :js.IOs.GestureEvent) :Void {
                trace("gesture changed");
                var c = self._deviceDownComponent;
                trace("c=" + c);
                    
                // if (c != null) {
                //     if (c.isRotatable) {
                //         self.rotate.dispatch(new Tuple<IInteractiveComponent, Float>(c, e.rotation.toRad() + self._startingAngle));
                //     }
                    
                //     if (c.isScalable) {
                //         self.scale.dispatch(new Tuple<IInteractiveComponent, Float>(c, e.scale));
                //     }
                // }
            });
            gestures.gestureStart.bind(function (e :js.IOs.GestureEvent) :Void {
                self._isGesturing = true;
            });
            gestures.gestureEnd.bind(function (e :js.IOs.GestureEvent) :Void {
                self._isGesturing = false;
            });
            
        }
        #end
        
    }
    
    function modeRemoved (m :IPBContext) :Void
    {
        freeSignals();
    }
    
    function freeSignals () :Void
    {
        // Log.debug("");
        // deviceDown.unbindAll();
        // deviceMove.unbindAll();
        // deviceUp.unbindAll();
        // deviceClick.unbindAll();
        // drag.unbindAll();
        
        // if (_deviceDown != null) {
        //     _deviceDown.unbindAll();
        //     _deviceDown = null;
        // }
        // if (_deviceMove != null) {
        //     _deviceMove.unbindAll();
        //     _deviceMove = null;
        // }
        // if (_deviceUp != null) {
        //     _deviceUp.unbindAll();
        //     _deviceUp = null;
        // }
        // if (_deviceClick != null) {
        //     _deviceClick.unbindAll();
        //     _deviceClick = null;
        // }
    }

    function adjustMouseLocation (m :MouseLocation) :Point
    {
        #if js
        var view = context.getManager(SceneView);
        if (m == null || m.scope == view.layer) {
            return m;
        }
        return new Point(m.globalLocation.x - view.mouseOffsetX, m.globalLocation.y - view.mouseOffsetY);
        #else
        return m;
        #end
    }
    
    function onMouseDown (m :MouseLocation) :Void
    {
        // trace("onMouseDown m=" + m);
        //Reset markers
        _isGesturing = _isRotating = _isZooming = false;
        
        var adjustedM = adjustMouseLocation(m);
        // trace("onMouseDown, adjustedM=" + adjustedM);
        var cUnderMouse = lookupComponentsUnderMouse(adjustedM)[0];
        _deviceDownComponent = cUnderMouse;
        
        _deviceDownStageLoc = new Vector2(adjustedM.x, adjustedM.y);
        _deviceDownComponentLoc = _tupleCache.v2;
        _tupleCache.set(cUnderMouse, _deviceDownComponentLoc);
        
        _startingLocation.x = adjustedM.x;
        _startingLocation.y = adjustedM.y;
        
        var mouseInput = _deviceDownComponent != null ? _deviceDownComponent.owner.lookupComponentByType(MouseInputComponent) : null;
        
        if (mouseInput != null) {
            //Cache the initial angle, in case we start rotating
            _startingAngle = mouseInput.angle;
            // _startingScale = _tupleCache.v1.scale;
            mouseInput.onDeviceDown();
        }
        
        Log.info("mouse down  " + _tupleCache);
        deviceDown.dispatch(_tupleCache);
    } 
    
    function onMouseUp (m :MouseLocation) :Void
    {
        var adjustedM = adjustMouseLocation(m);
        var cUnderMouse = lookupComponentsUnderMouse(adjustedM)[0];
        _tupleCache.set(cUnderMouse, new Vector2(adjustedM.x, adjustedM.y));
        
        // if (_tupleCache.v1 != null) {
        //     Log.info("mouse up  " + _tupleCache);
        // }
        
        _deviceDownComponent = null;
        _deviceDownComponentLoc = null;
        _deviceDownStageLoc = null;
        deviceUp.dispatch(_tupleCache);
    }
    
    function onMouseMove (m :MouseLocation) :Void
    {
        //While gesturing, ignore mouse/touch moves
        if (_isGesturing) {
            return;
        }
        
        var adjustedM = adjustMouseLocation(m);
        
        _tupleCache.set(_deviceDownComponent, new Vector2(adjustedM.x, adjustedM.y));
        if (_deviceDownComponent != null) {
            // var stageMouse = getMouseLoc();
            // Assert.isNotNull(stageMouse);
            // Assert.isNotNull(_deviceDownStageLoc);
            // var diff = new Vector2(stageMouse.x - _deviceDownStageLoc.x, 
                // stageMouse.y - _deviceDownStageLoc.y);
            // Assert.isNotNull(_tupleCache);
            // _tupleCache.set(_deviceDownComponent, 
            //     new Vector2(_deviceDownComponentLoc.x + diff.x, _deviceDownComponentLoc.y + diff.y));
            drag.dispatch(_tupleCache);
            
        }
        deviceMove.dispatch(_tupleCache);
    }
    
    function onDrag (t :Tuple<IInteractiveComponent, Vector2>) :Void
    {
        var mouseInput = t.v1.owner.lookupComponentByType(MouseInputComponent);
        if (mouseInput != null) {
            if (mouseInput.isTranslatable) {
                var offset = mouseInput.offset;
                if (offset != null) {
                    mouseInput.x = t.v2.x + offset.x;
                    mouseInput.y = t.v2.y + offset.y;
                } else {
                    mouseInput.x = t.v2.x;
                    mouseInput.y = t.v2.y;
                }
            }
        }
        
    }
    
    function onMouseClick (m :MouseLocation) :Void
    {
        Log.info("Mouse clicked " + m.x + ", " + m.y);
        var adjustedM = adjustMouseLocation(m);
        // trace("onMouseClick " + adjustedM);
        var cUnderMouse = lookupComponentsUnderMouse(adjustedM)[0];
        // var clicked = new Array<IInteractiveComponent>();
        // _tupleCache.set(lookupComponentUnderMouse(m), new Vector2(flash.Lib.current.stage.mouseX, flash.Lib.current.stage.mouseY));
        _tupleCache.set(cUnderMouse, getMouseLoc());
        
        if (_tupleCache.v1 != null) {
            Log.info("click  " + _tupleCache);
            deviceClick.dispatch(_tupleCache);
        }
        
        var mouseInput = _tupleCache.v1 != null ? _tupleCache.v1.owner.lookupComponentByType(MouseInputComponent) : null; 
        if (mouseInput != null) {
            mouseInput.onClick();
        }
        
        // var inputComps :Iterable<IInteractiveComponent>;
        // for (c in _context.getObjectsInGroup(IInteractiveComponent.INPUT_GROUP)) {
        //     if (!Std.is(c, IEntity)) {
        //         Log.debug("weird, c is not an entity");
        //         continue;
        //     }
        //     inputComps = cast(c, IEntity).lookupComponentsByType(IInteractiveComponent);
        //     Log.debug("Checking " + inputComps.count() + " input components");
        //     for (inc in inputComps) {
        //         if (inc.displayObject == null) {
        //             Log.error("IInteractiveComponent.displayObject == null");
        //             continue;
        //         }
        //         if (inc.displayObject.hitTestVector2(flash.Lib.current.stage.mouseX, flash.Lib.current.stage.mouseY)) {
        //             _tupleCache.set(cast(inc), new Vector2(flash.Lib.current.stage.mouseX, flash.Lib.current.stage.mouseY));
        //             Log.info("click  " + _tupleCache);
        //             deviceClick.dispatch(_tupleCache);
        //         }
        //     }
        // }
    }
    
    // function lookupComponentUnderMouse (m :MouseLocation) :IInteractiveComponent
    // {
    //     var inputComps :Iterable<IInteractiveComponent>;
    //     for (c in _context.getObjectsInGroup(IInteractiveComponent.INPUT_GROUP)) {
    //         if (!Std.is(c, IEntity)) {
    //             Log.debug("weird, c is not an entity");
    //             continue;
    //         }
    //         inputComps = cast(c, IEntity).lookupComponentsByType(IInteractiveComponent);
    //         Log.debug("Checking " + inputComps.count() + " input components");
    //         for (inc in inputComps) {
    //             if (inc.displayObject == null) {
    //                 Log.error("IInteractiveComponent.displayObject == null");
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
    
    // function onGestureZoom (zoom :Float) :
    // {
    //     ;
    // }
    
    function lookupComponentsUnderMouse (?m :Point) :Array<IInteractiveComponent>
    {
        // trace("lookupComponentsUnderMouse");
        _checked.clear();
        
        // trace("objects in mouse set: " + _sets.getObjectsInSet(IInteractiveComponent.INPUT_GROUP).count());
        underMouse = new Array<IInteractiveComponent>();
        var inputComp :IInteractiveComponent;
        var mouseLoc = m != null ? new Vector2(m.x, m.y) : getMouseLoc();
        
        for (c in _sets.getObjectsInSet(INPUT_SET)) {
            if (!Std.is(c, IEntity)) {
                // Log.debug("weird, c is not an entity");
                continue;
            }
            
            if (_checked.exists(c.name)) {
                continue;
            }
            
            inputComp = cast(c, IEntity).lookupComponentByType(IInteractiveComponent);
            if (inputComp == null) {
                Log.error("Entity registered in the set IInteractiveComponent does not have the IInteractiveComponent interface");
                continue;
            }
            // if (inputComp.bounds ==null) {
            //     continue;
            // }
            // if (inputComp.displayObject == null) {
            //     Log.error("IInteractiveComponent.displayObject == null");
            //     continue;
            // }
            
            //Check parents for mouse location
            // var parent :IInteractiveComponent = inputComp.parent;
            // while (parent != null) {
            //     if (parent.bounds == null) {
            //         trace("Null bounds");
            //         break;
            //     }
            //     if (!parent.bounds.containsPoint(mouseLoc)) {
            //         for (out in NodeComponent.getEntityAndAllChildren(parent.owner, IInteractiveComponent)) {
            //             _checked.add(out.name);
            //         }
            //     }
            //     parent = parent.parent;
            // }
            
            //Check again
            // if (_checked.exists(c.name)) {
            //     continue;
            // }
            
            // trace("is " + inputComp.owner.name + " under mouse, bounds=" + inputComp.bounds.boundingRect + ", =" + inputComp.bounds.containsPoint(mouseLoc)); 
            // if (inputComp.bounds.containsPoint(mouseLoc)) {
            //     // Log.info("under mouse  " + _tupleCache);
            //     underMouse.push(inputComp);
            //     // return inc;
            // }
            
            if (inputComp.containsScreenPoint(mouseLoc)) {
                underMouse.push(inputComp);
            }
            
            // if (inc.displayObject.hitTestPoint(flash.Lib.current.stage.mouseX, flash.Lib.current.stage.mouseY)) {
            //     // Log.info("under mouse  " + _tupleCache);
            //     underMouse.push(inc);
            //     // return inc;
            // }
        }
        // if (underMouse.length > 1) {
        //     underMouse.sort(Comparators.compareComparables);
        // }
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
    var _deviceDownComponent :IInteractiveComponent;
    var _deviceDownComponentLoc :Vector2;
    var _deviceDownStageLoc :Vector2;
    var _checked :Set<String>;
    var _tupleCache :Tuple<IInteractiveComponent, Vector2>;
    var _mouseLoc :Vector2;
    var _isGesturing :Bool;
    static var INPUT_SET :String = ReflectUtil.tinyClassName(IInteractiveComponent);
    
}


