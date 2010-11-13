/*******************************************************************************
 * Hydrax :haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http ://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene.flash;

import com.pblabs.components.scene.BaseScene2DComponent;
import com.pblabs.components.scene.flash.Scene2DManager;
import com.pblabs.components.scene.flash.SceneLayer;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.debug.Log;
import com.pblabs.engine.time.ITickedObject;
import com.pblabs.geom.Rectangle;
import com.pblabs.geom.Vector2;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ReflectUtil;

import flash.display.DisplayObject;

import flash.geom.Point;

using com.pblabs.util.MathUtil;

class Scene2DComponent extends BaseScene2DComponent<SceneLayer>
    // implements ITickedObject 
{
    // public var alpha(getAlpha, setAlpha) :Float;
    public var displayObject(get_displayObject, set_displayObject) :DisplayObject;
    // public var isDirty(getIsDirty, null) :Bool;
    // public var position(null, setPosition) :Point;
    // public var scaleX(getScaleX, setScaleX) :Float;
    // public var scaleY(getScaleY, setScaleY) :Float;
    // public var scene(getScene, null) :Scene2DManager;
    // public var sceneBounds(getSceneBounds, null) :Rectangle;
    // public var x(get_x, set_x) :Float;
    // public var y(get_y, set_y) :Float;
    // public var angle(get_angle, set_angle) :Float;
    // public var zIndex(getZIndex, setZIndex) :Int;
    // public static var NAME :String = ReflectUtil.tinyClassName(Scene2DComponent);

    // public static function getFrom (e :IEntity) :Scene2DComponent
    // {
    //     return cast(e.lookupComponentByName(NAME), Scene2DComponent);
    // }

    /**
     * If set, alpha is gotten from this property every frame.
     */
    // public var alphaProperty :PropertyReference<Float>;

    // public var autoAttach :Bool;

    // public var displayObjectRef :PropertyReference<DisplayObject>;

    /**
     * If set, the layer index is gotten from this property every frame.
     */
//    public var layerNameProperty :PropertyReference;

    /**
     * If set, position is gotten from this property every frame.
     */
     // public var positionProperty :PropertyReference<{x :Float, y :Float}>;

    /**
     * If set, rotation is gotten from this property every frame.
     */
    // @inject("@AngleComponent.angle")    
    // public var rotationProperty :PropertyReference<Float>;
    // public var scaleXRef :PropertyReference<Float>;
    // public var scaleYRef :PropertyReference<Float>;

    // public var sceneLayerName :String;
    
    // public var sceneRef :PropertyReference<Scene2DManager>;

    // public var updateOnEvents :Array<Dynamic>;

    // @inject("@LocationComponent.x")
    // public var xProperty :PropertyReference<Float>;
    // @inject("@LocationComponent.y")
    // public var yProperty :PropertyReference<Float>;

    /**
     * If set, scale is gotten from this property every frame.
     */
    //    public var scaleProperty :PropertyReference;

    /**
     * If set, our z-index is gotten from this property every frame.
     */
    // public var zIndexProperty :PropertyReference<Int>;

    public function new ()
    {
        super();
        // clearVars();
        //Default
        // sceneRef = new PropertyReference("#Scene2DManager.Scene2DManager");
        // autoAttach = true;
        // updateOnEvents = [];
        // _displayObject = displayObject;
        // sceneLayerName = Scene2DManager.DEFAULT_LAYER_NAME;
        // _transformDirty = true;
        // _isDirty = true;
    }
    
    override function onAdd () :Void
    {
        super.onAdd();
        _displayObject.name = name;
    }

//     public function getAlpha () :Float{
// //        return displayObject.alpha
//         return _alpha;
//     }

    /**
     * Transparency, 0 being completely transparent and 1 being opaque.
     */
//     public function setAlpha (value :Float) :Void//Float
//     {
// //        displayObject.alpha = value;
//         if (value == _alpha) {
//             return;//value;
//         }

//         _alpha = value;
//         _transformDirty = true;
//         // return value;
// //        displayObject.alpha = value;
//     }

    function get_displayObject () :DisplayObject
    {
        return _displayObject;
    }
    
    function set_displayObject (d :DisplayObject) :DisplayObject
    {
        Preconditions.checkArgument(_displayObject == null && !isRegistered);
        _displayObject = d;
        return d;
    }

    // public function getIsDirty () :Bool
    // {
    //     return _isDirty;
    // }

    /**
     * Position of the renderer in scene space.
     *
     * @see worldPosition
     */
    // public function setPosition (value :Point) :Point
    // {
    //     if (_x != value.x || _y != value.y) {
    //         _x = value.x;
    //         _y = value.y;
    //         _transformDirty = true;
    //     }
        
    //     // set_x(value.x);
    //     // x = value.x;
    //     // y = value.y;

    //     //        var posX :Number;
    //     //        var posY :Number;
    //     //
    //     //        if (snapToNearestPixels) {
    //     //            posX = int(value.x);
    //     //            posY = int(value.y);
    //     //        } else {
    //     //            posX = value.x;
    //     //            posY = value.y;
    //     //        }
    //     //
    //     //        if (posX == _position.x && posY == _position.y)
    //     //            return;
    //     //
    //     //        _position.x = posX;
    //     //        _position.y = posY;
    //     //        _transformDirty = true;
    //     return value;
    // }

    // public function getScaleX() :Float{
    //     return _scaleX;
    // }

    /**
     * You can scale things on the X and Y axes.
     */
    // public function setScaleX (value :Float) :Float{
    //     if (value == _scaleX)
    //         return value;

    //     _scaleX = value;
    //     _transformDirty = true;
    //     return value;
    //    }

    // public function getScaleY() :Float{
    //     return _scaleY;
    // }

    /**
     * You can scale things on the X and Y axes.
     */
    // public function setScaleY (value :Float) :Float{
    //     if (value == _scaleY)
    //         return value;

    //     _scaleY = value;
    //     _transformDirty = true;
    //     return value;
    //    }

    //
    //    public function get registrationPoint () :Point
    //    {
    //        return _registrationPoint.clone();
    //    }

    //    /**
    //     * The registration point can be used to offset the sprite
    //     * so that rotation and scaling work properly.
    //     *
    //     * @param value Position of the "center" of the sprite.
    //     */
    //    public function set registrationPoint (value :Point) :void
    //    {
    //        var intX :int = int(value.x);
    //        var intY :int = int(value.y);
    //
    //        if (intX == _registrationPoint.x && intY == _registrationPoint.y)
    //            return;
    //
    //        _registrationPoint.x = intX;
    //        _registrationPoint.y = intY;
    //        _transformDirty = true;
    //    }
    //
    //    /**
    //     * Where in the scene will this object be rendered?
    //     */
    //    public function get renderPosition () :Point
    //    {
    //        return new Point(displayObject.x, displayObject.y);
    //    }
    //
    //    public function get rotation () :Number
    //    {
    //        return _rotation;
    //    }
    //
    //    /**
    //     * Rotation in degrees, with 0 being Y+.
    //     */
    //    public function set rotation (value :Number) :void
    //    {
    //        if (value == _rotation)
    //            return;
    //
    //        _rotation = value;
    //        _transformDirty = true;
    //    }
    //
    //    /**
    //     * Rotation offset applied to the child DisplayObject. Used if, for instance,
    //     * your art is rotated 90deg off from where you want it.
    //     *
    //     * @return Number Offset Rotation angle in degrees
    //     */
    //    public function get rotationOffset () :Number
    //    {
    //        return Geometry.toDegrees(_rotationOffset);
    //    }
    //
    //    /**
    //     * Rotation offset applied to the child DisplayObject.
    //     *
    //     * @param value Offset Rotation angle in degrees
    //     */
    //    public function set rotationOffset (value :Number) :void
    //    {
    //        _rotationOffset = PBUtil.unwrapRadian(Geometry.toRadians(value));
    //    }
    //
    //    public function get scale () :Point
    //    {
    //        return _scale.clone();
    //    }
    //
    //    /**
    //     * You can scale things on the X and Y axes.
    //     */
    //    public function set scale (value :Point) :void
    //    {
    //        if (value.x == _scale.x && value.y == _scale.y)
    //            return;
    //
    //        _scale.x = value.x;
    //        _scale.y = value.y;
    //        _transformDirty = true;
    //    }

    // public function getScene () :Scene2DManager
    // {
    //     return _scene;
    // }

    //    /**
    //     * The scene which is responsible for drawing this renderer. Note that
    //     * you can use the renderer outside of a scene, to control some
    //     * DisplayObject, by setting displayObject to point to what you want
    //     * to control, and setting scene to null.
    //     */
    //    public function set scene (value :Scene) :void
    //    {
    //        // Remove from old scene if appropriate.
    //        if (_scene && _displayObject)
    //            _scene.remove(this);
    //
    //        _scene = value;
    //
    //        // And add to new scene (clearing dirty state).
    //        if (_scene && _displayObject) {
    //            _scene.add(this);
    //            _lastLayerIndex = _layerIndex;
    //            _layerIndexDirty = _zIndexDirty = false;
    //        }
    //    }

    /**
     * Our bounds in scene coordinates.
     */
    // public function getSceneBounds () :Rectangle
    // {
    //     // NOP if no DO.
    //     if (displayObject == null) {
    //         return null;
    //     }

    //     var bounds :Rectangle = displayObject.getBounds(displayObject);

    //     // Just translation for now.
    //     bounds.x += displayObject.x;
    //     bounds.y += displayObject.y;

    //     // And hand it back.
    //     return bounds;
    // }

    // function get_x () :Float{
    //     return _x;
    // }

    // function set_x (value :Float) :Float
    // {
    //     // trace("setting scene2d x" + value);
    //     if (value == _x) {
    //         return value;
    //     }
    //     _x = value;
    //     _transformDirty = true;
    //     return value;
    //    }

    // function get_y () :Float{
    //     return _y;
    // }
    
    // function get_angle () :Float{
    //     return _rotation;
    // }

    // @inject("@LocationComponent.signaller")
    // public function setLocation (x :Float, y :Float) :Void

    override public function setLocation (loc :Vector2) :Void
    {
        super.setLocation(loc);
        // if (_x != loc.x || _y != loc.y) {
        //     _x = loc.x;
        //     _y = loc.y;
        //     _transformDirty = true;
        // }
        _displayObject.x = _x;
        _displayObject.y = _y;
    }
        // trace("_transformDirty=" + _transformDirty);
        
    //     // x = loc.x;
    //     // y = loc.y;
    //     // // set_x(loc.x);
    //     // set_y(loc.y);
    //     // this.y = y;
    //     // _transformDirty = true;
    // }
       
   //  function set_y (value :Float) :Float
   //  {
   //      if (value == _y) {
   //          return value;
   //      }

   //      _y = value;
   //      _transformDirty = true;
   //      return value;
   // }

   @inject("@AngleComponent.signaller")
   override function set_angle (value :Float) :Float
   {
       super.set_angle(value);
       _displayObject.rotation = _angle.toDeg();
       // if (value != _rotation) {
       //     _rotation = value;
       //     _transformDirty = true;
       // }
       return _angle;
   }

    //    public function get worldPosition () :Point
    //    {
    //        return scene.transformSceneToWorld(position);
    //    }

    //    /**
    //     * Convenience method to allow placing the renderer in world coordinates.
    //     */
    //    public function set worldPosition (value :Point) :void
    //    {
    //        scene.remove(this);
    //
    //        position = scene.transformWorldToScene(value);
    //        updateTransform();
    //
    //        scene.add(this);
    //    }

    //    /**
    //     * The x value of our scene space position.
    //     */
    //    public function get x () :Number
    //    {
    //        return _position.x;
    //    }
    //
    //    public function set x (value :Number) :void
    //    {
    //        var posX :Number;
    //
    //        if (snapToNearestPixels) {
    //            posX = int(value);
    //        } else {
    //            posX = value;
    //        }
    //
    //        if (posX == _position.x)
    //            return;
    //
    //        _position.x = posX;
    //        _transformDirty = true;
    //    }

    //    /**
    //     * The y component of our scene space position. Used for sorting.
    //     */
    //    public function get y () :Number
    //    {
    //        return _position.y;
    //    }
    //
    //    public function set y (value :Number) :void
    //    {
    //        var posY :Number;
    //
    //        if (snapToNearestPixels) {
    //            posY = int(value);
    //        } else {
    //            posY = value;
    //        }
    //
    //        if (posY == _position.y)
    //            return;
    //
    //        _position.y = posY;
    //        _transformDirty = true;
    //    }

    // public function getZIndex () :Int{
    //     return _zIndex;
    // }

    /**
     * By default, layers are sorted based on the z-index, from small
     * to large.
     * @param value Z-index to set.
     */
    // public function setZIndex (value :Int) :Int{
    //     if (_zIndex == value)
    //         return value;

    //     _zIndex = value;
    //     _zIndexDirty = true;
    //     return value;
    //    }

    // public function attach () :Void
    // {
    //     if (_displayObject == null && displayObjectRef != null) {
    //         _displayObject = owner.getProperty(displayObjectRef);
    //     }

    //     updateFromEvent();
    //     var scene2D :Scene2DManager = owner.getProperty(sceneRef);
    //     if (_scene == scene2D) {
    //         Log.info(["attach, already attached", "_scene", _scene, "scene2D", scene2D]);
    //         return;
    //     }
    //     //Add ourselves to the scene
    //     if (scene2D != null) {
    //         scene2D.addSceneComponent(this);
    //         _scene = scene2D;
    //     } else {
    //         Log.warn(["attach", "scene2D", scene2D]);
    //     }
    // }

    // public function detach () :Void
    // {
    //     if (_scene != null) {
    //         //This nulls _scene
    //         _scene.removeSceneComponent(this);
    //     }
    // }

//     public function onTick (dt :Float) :Void
//     {
//         return;
//         // trace("_isDirty=" + _isDirty);
//         // trace("update _transformDirty=" + _transformDirty);
//         // trace("update _isDirty=" + _isDirty);
//         // Lookup and apply properties. This only makes adjustments to the
//         // underlying DisplayObject if necessary.
//         if (displayObject == null || displayObject.parent == null) {
//             // trace("no disp or parent");
//             return;
//         }

// //        displayObject.scaleX = owner.getProperty(scaleXRefy, 1) as Number;
// //        displayObject.scaleY = owner.getProperty(scaleYRef, 1) as Number;
// //        displayObject.alpha = owner.getProperty(alphaProperty, 1) as Number;
// //        displayObject.visible = (displayObject.alpha > 0);
// //        displayObject.x = owner.getProperty(xProperty, 0) as Number;
// //        displayObject.y = owner.getProperty(yProperty, 0) as Number;
// //        trace("updating", x, y);

//         // if (_isDirty) {
//         //     updateProperties();
//         // }

//         // Now that we've read all our properties, apply them to our transform.
//         if (_transformDirty) {
//             updateTransform();
//         }
//     }

    //    /**
    //     * Is the rendered object opaque at the request position in screen space?
    //     * @param pos Location in world space we are curious about.
    //     * @return True if object is opaque there.
    //     */
    //    public function pointOccupied (worldPosition :Point) :Boolean
    //    {
    //        if (!displayObject || !scene)
    //            return false;
    //
    //        // Sanity check.
    //        if (displayObject.stage == null)
    //            Log.warn(this, "pointOccupied",
    //                "DisplayObject is not on stage, so hitTestPoint will probably not work right.");
    //
    //        // This is the generic version, which uses hitTestPoint. hitTestPoint
    //        // takes a coordinate in screen space, so do that.
    //        worldPosition = scene.transformWorldToScreen(worldPosition);
    //        return displayObject.hitTestPoint(worldPosition.x, worldPosition.y, true);
    //    }

    //    /**
    //     * Transform a point from object space to world space.
    //     */
    //    public function transformObjectToWorld (p :Point) :Point
    //    {
    //        return _transformMatrix.transformPoint(p);
    //    }
    //
    //    /**
    //     * Transform a point from world space to object space.
    //     */
    //    public function transformWorldToObject (p :Point) :Point
    //    {
    //        // Oh goodness.
    //        var tmp :Matrix = _transformMatrix.clone();
    //        tmp.invert();
    //
    //        return tmp.transformPoint(p);
    //    }

    /**
     * Update the object's transform based on its current state. Normally
     * called automatically, but in some cases you might have to force it
     * to update immediately.
     * @param updateProps Read fresh values from any mapped properties.
     */
//     public function updateTransform (?updateProps :Bool = false) :Void
//     {
//         trace("updateTransform");
//         if (displayObject == null) {
//             return;
//         }

//         // if (updateProps) {
//         //     updateProperties();
//         // }

//         if (_scene == null) {
//             return;
//         }
//         //        _transformMatrix.identity();
//         //        _transformMatrix.scale(_scale.x, _scale.y);
//         //        _transformMatrix.translate(-_registrationPoint.x * _scale.x,
//         //            -_registrationPoint.y * _scale.y);
//         //        _transformMatrix.rotate(Geometry.toRadians(_rotation) + _rotationOffset);
//         //        _transformMatrix.translate(_position.x, _position.y);

//         //        displayObject.transform.matrix = _transformMatrix;
//         displayObject.scaleX = _scaleX;
//         displayObject.scaleY = _scaleY;
//         // displayObject.alpha = _alpha;
//         // displayObject.visible = (_alpha > 0);
//         trace("setting displayobject xy=" + _x + ", "+ _y);
//         displayObject.x = _x;
//         displayObject.y = _y;
//         displayObject.rotation = _rotation.toDegrees();

// //        if (SceneItemComponent(owner.lookupComponentByType(SceneItemComponent)).desc.type == DisplayComponentType.STOREY) {
// //            trace(x, y);
// //        }

//         // trace("setting _transformDirty false");
//         _transformDirty = true;
//     }

    // override function onAdd () :Void
    // {
    //     super.onAdd();
    //     _removed = false;
    //     // for (eventName in updateOnEvents) {
    //     //     // owner.registerListener(owner.eventDispatcher, eventName, F.callback_(updateFromEvent, eventName));
    //     // }

    //     // _alpha = 1;
    //     // _hitTestDirty = true;

    //     // _isDirty = true;
    //     // _lastLayerIndex = -1;

    //     // _layerIndex = 0;
    //     // _layerIndexDirty = true;
    //     // _scaleX = 1;
    //     // _scaleY = 1;
    //     // _transformDirty = true;

    //     // _x = 0;
    //     // _y = 0;

    //     // _zIndex = 0;
    //     // _zIndexDirty = true;

    //     // _scene = null;
    // }

    // override function onRemove () :Void
    // {
    //     if (_removed) {
    //         throw "Already removed";
    //     }
    //     super.onRemove();
    //     // Remove ourselves from the scene when we are removed
    //     detach();
    //     _displayObject = null;
    //     clearVars();
    //     _removed = true;
    // }
    
    // function clearVars () :Void
    // {
    //     _alpha = 1;
    //     _hitTestDirty = true;

    //     _isDirty = true;
    //     _lastLayerIndex = -1;

    //     _layerIndex = 0;
    //     _layerIndexDirty = true;
    //     _scaleX = 1;
    //     _scaleY = 1;
    //     _transformDirty = true;

    //     _x = 0;
    //     _y = 0;

    //     _zIndex = 0;
    //     _zIndexDirty = true;

    //     _scene = null;
    // }

    // override function onReset() :Void
    // {
    //     super.onReset();

    //     detach();

    //     if (autoAttach) {
    //         attach();
    //     }
    // }

    // function updateFromEvent (?_ :Array<Dynamic>) :Void
    // {
    //     _isDirty = true;
    // }

//     function updateProperties () :Void
//     {
//         return;
//         trace("updateProperties");

//         _transformDirty = true;
//         _isDirty = false;
//         // Sync our zIndex.
// //        if (zIndexProperty) {
// //            zIndex = owner.getProperty(zIndexProperty, zIndex);
// //        }

//         // Sync our layerIndex.
//         //        if (layerNameProperty)
//         //            layerIndex = owner.getProperty(layerNameProperty, layerIndex);

//         // Maybe we were in the right layer, but have the wrong zIndex.
//         //        if (_zIndexDirty && _scene) {
//         //            _scene.getLayer(_layerIndex).markDirty();
//         //            _zIndexDirty = false;
//         //        }

//         // Position.
//         if (null != xProperty) {
//             trace("setting x=" + owner.getProperty(xProperty));
//             _x = owner.getProperty(xProperty);
//         }

//         if (null != yProperty) {
//             _y = owner.getProperty(yProperty);
//         }

// //        var pos :Point = owner.getProperty(positionProperty) as Point;
// //        if (pos) {
// //            if (scene) {
// //                position = scene.transformWorldToScene(pos);
// //            } else {
// //                position = pos;
// //            }
// //        }

//         //        // Scale.
//         //        var scale :Point = owner.getProperty(scaleProperty) as Point;
//         //        if (scale) {
//         //            this.scale = scale;
//         //        }

//        // Rotation.
//        if (null != rotationProperty) {
//            angle = owner.getProperty(rotationProperty);
//        }

//         // Alpha.
//         if (null != alphaProperty) {
//             _alpha = owner.getProperty(alphaProperty);
//         }

//         //        // Registration Point.
//         //        var reg :Point = owner.getProperty(registrationPointProperty) as Point;
//         //        if (reg) {
//         //            registrationPoint = reg;
//         //        }

//         // Make sure we're in the right layer and at the right zIndex in the scene.
//         // Do this last to be more caching-layer-friendly. If we change position and
//         // layer we can just do this at end and it works.
// //        if (_layerIndexDirty && _scene) {
// //            var tmp :int = _layerIndex;
// //            _layerIndex = _lastLayerIndex;
// //
// //            if (_lastLayerIndex != -1) {
// //                _scene.removeDisplayComponent(this);
// //            }
// //
// //            _layerIndex = tmp;
// //
// //            _scene.addDisplayComponent(this);
// //
// //            _lastLayerIndex = _layerIndex;
// //            _layerIndexDirty = false;
// //        }
//     }

    // var _alpha :Float;

    var _displayObject :DisplayObject;
    // var _hitTestDirty :Bool;

    // var _isDirty :Bool;
    // var _lastLayerIndex :Int;

    // var _layerIndex :Int;
    // var _layerIndexDirty :Bool;
    //    protected var _position :Point = new Point();
    //    protected var _registrationPoint :Point = new Point();
    // var _rotation :Float;

    //    protected var _rotationOffset :Number = 0;
    // var _scaleX :Float;
    // var _scaleY :Float;

    // var _transformDirty :Bool;

    // var _x :Float;
    // var _y :Float;

    // var _zIndex :Int;
    // var _zIndexDirty :Bool;
    
    // var _removed :Bool;

    // public var _scene :Scene2DManager;

}


