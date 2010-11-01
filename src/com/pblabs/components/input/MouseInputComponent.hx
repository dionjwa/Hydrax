/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.input;

import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.debug.Log;
import com.pblabs.util.Preconditions;

import com.pblabs.geom.Polygon;
import com.pblabs.geom.PolygonTools;
import com.pblabs.geom.Vector2;
import com.pblabs.geom.bounds.BoundsPolygon;
import com.pblabs.geom.bounds.IBounds;

import com.pblabs.components.manager.NodeComponent;

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
class MouseInputComponent extends NodeComponent<MouseInputComponent, MouseInputComponent>
{
    public static var INPUT_GROUP :String = "mouseInput";
    
    #if flash
    public var interactiveObjectProperty :PropertyReference<flash.display.DisplayObject>;
    public var displayObject (default, null) :flash.display.DisplayObject;
    #end
    
    public var xProperty :PropertyReference<Float>;
    
    public var yProperty :PropertyReference<Float>;
    
    public var boundsProperty :PropertyReference<IBounds<Dynamic>>;
    
    public var y (get_y, set_y) :Float;
    public var x (get_x, set_x) :Float;
    public var bounds (get_bounds, null) :IBounds<Dynamic>;
    
    public static function compare (a :MouseInputComponent, b :MouseInputComponent) :Int
    {
        #if flash
        return if (com.pblabs.util.DisplayUtils.isAbove(a.displayObject, b.displayObject)) -1 else 1;
        #else
        Log.warn("Not implemented");
        return 0;
        #end
    }
    
    public function new ()
    {
        super();
        xProperty = new PropertyReference("@LocationComponent.x");
        yProperty = new PropertyReference("@LocationComponent.y");
    }
    
    public function getPoint () :Vector2
    {
        return new Vector2(x, y);
    }
    
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
    
    function get_bounds () :IBounds<Dynamic>
    {
        if (boundsProperty != null) {
            return owner.getProperty(boundsProperty);
        } else if (_boundsStale) {
            _bounds.center = new Vector2(x, y);
        }
        return _bounds;
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
    
    var _bounds :BoundsPolygon;
    var _boundsStale :Bool;
}


