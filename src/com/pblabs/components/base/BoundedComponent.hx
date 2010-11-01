/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.base;
import com.pblabs.engine.core.EntityComponent;
import com.pblabs.geom.bounds.IBounds;
import com.pblabs.util.ReflectUtil;
import com.pblabs.engine.core.EntityComponent;

class BoundedComponent extends EntityComponent 
{
    
    public var bounds(get_bounds, set_bounds) :IBounds<Dynamic>;
    
    public static var NAME:String = ReflectUtil.tinyClassName(BoundedComponent);

    public function new (?bounds :IBounds<Dynamic> = null)
    {
        super();
        _bounds = bounds;
    }

    inline function get_bounds ():IBounds<Dynamic>
    {
        return _bounds;
    }

    inline function set_bounds (val :IBounds<Dynamic>):IBounds<Dynamic>
    {
        _bounds = val;
    	return val;
    }

    public function clone () :Dynamic
    {
        return new BoundedComponent(cast( _bounds.clone(), IBounds<Dynamic>));
    }

    override function onRemove():Void
    {
        super.onRemove();
        _bounds = null;
    }

    var _bounds :IBounds<Dynamic>;
}
