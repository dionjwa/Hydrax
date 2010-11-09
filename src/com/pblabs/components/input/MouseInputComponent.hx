/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.input;

import com.pblabs.components.manager.NodeComponent;
import com.pblabs.components.scene.BaseScene2DComponent;
import com.pblabs.components.scene.BaseScene2DManager;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.debug.Log;
import com.pblabs.geom.Polygon;
import com.pblabs.geom.PolygonTools;
import com.pblabs.geom.Vector2;
import com.pblabs.geom.bounds.BoundsPolygon;
import com.pblabs.geom.bounds.IBounds;
import com.pblabs.util.Comparable;
import com.pblabs.util.Comparators;
import com.pblabs.util.Preconditions;
using com.pblabs.geom.PolygonTools;

/**
 * Contains the DisplayObject and location properties
 * necessary for interacting with a global mouse input 
 * manager.
 *
 * The x/yProperty fields are for setting the location, e.g. 
 * via an editor (dragging), not for getting the location.
 * 
 */
@sets("mouseInput")
class MouseInputComponent extends NodeComponent<MouseInputComponent, MouseInputComponent>,
    implements Comparable<MouseInputComponent>
{
    public static var INPUT_GROUP :String = "mouseInput";
    
    #if (flash || cpp)
    public var interactiveObjectProperty :PropertyReference<flash.display.DisplayObject>;
    public var displayObject (default, null) :flash.display.DisplayObject;
    #end
    
    public var xProperty :PropertyReference<Float>;
    public var yProperty :PropertyReference<Float>;
    public var angleProperty :PropertyReference<Float>;
    
    public var boundsProperty :PropertyReference<BoundsPolygon>;
    
    public var y (get_y, set_y) :Float;
    public var x (get_x, set_x) :Float;
    public var angle (get_angle, set_angle) :Float;
    public var bounds (get_bounds, set_bounds) :BoundsPolygon;
    
    public var isScalable :Bool;
    public var isRotatable :Bool;
    
    public static function compare (a :MouseInputComponent, b :MouseInputComponent) :Int
    {
        #if flash
        return if (com.pblabs.util.DisplayUtils.isAbove(a.displayObject, b.displayObject)) -1 else 1;
        #elseif js
        var scenea = a.owner.lookupComponent(BaseScene2DComponent);
        var sceneb = b.owner.lookupComponent(BaseScene2DComponent);
        var scene :BaseScene2DManager<Dynamic> = scenea.parent.parent;
        return Comparators.compareInts(scene.getLayerIndex(sceneb.parent), scene.getLayerIndex(scenea.parent));
        #else
        Log.error("Not implemented");
        return 0;
        #end
    }
    
    public function new ()
    {
        super();
        xProperty = new PropertyReference("@LocationComponent.x");
        yProperty = new PropertyReference("@LocationComponent.y");
        angleProperty = new PropertyReference("@AngleComponent.y");
        isScalable = true;
        isRotatable = true;
        _boundsStale = true;
    }
    
    public function compareTo (a :MouseInputComponent) :Int
    {
        return compare(this, a);
    }
    
    public function getPoint () :Vector2
    {
        return new Vector2(x, y);
    }
    
    #if debug
    public function toString () :String
    {
        return cast(owner, com.pblabs.engine.core.Entity).toString();
    }
    #end
    
    
    override function onReset () :Void
    {
        super.onReset();
        
        #if flash
        displayObject = owner.getProperty(interactiveObjectProperty);
        
        Preconditions.checkArgument(!(displayObject == null && boundsProperty == null));
        
        if (boundsProperty == null) {
            _bounds = new BoundsPolygon(displayObject.getBounds(displayObject).convertToPolygon());
        }
        #end
        
        _boundsStale = true;
    }
    
    override function onRemove () :Void
    {
        super.onRemove();
        #if flash
        displayObject = null;
        interactiveObjectProperty = null;
        #end
        
        xProperty = null;
        yProperty = null;
    }
    
    function get_bounds () :BoundsPolygon
    {
        if (boundsProperty != null) {
            return owner.getProperty(boundsProperty);
        } else if (_boundsStale) {
            _bounds.topLeft = new Vector2(x, y);
        }
        return _bounds;
    }
    
    function set_bounds (bounds :BoundsPolygon) :BoundsPolygon
    {
        _bounds = bounds;
        return bounds;
    }
    
    @inject("@LocationComponent.signaller")
    function locationChanged (loc :Vector2) :Void
    {
        _boundsStale = true;
    }
    
    @inject("@AngleComponent.signaller")
    function angleChanged (angle :Float) :Void
    {
        _boundsStale = true;
    }
    
    function get_x () :Float
    {
        return owner.getProperty(xProperty);
    }
    
    function set_x (val :Float) :Float
    {
        owner.setProperty(xProperty, val);
        return val;
    }
    
    function get_y () :Float
    {
        return owner.getProperty(yProperty);
    }
    
    function set_y (val :Float) :Float
    {
        owner.setProperty(yProperty, val);
        return val;
    }
    
    function get_angle () :Float
    {
        return owner.getProperty(angleProperty);
    }
    
    function set_angle (val :Float) :Float
    {
        owner.setProperty(angleProperty, val);
        return val;
    }
    
    var _bounds :BoundsPolygon;
    var _boundsStale :Bool;
}


