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
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.serialization.ISerializable;
import com.pblabs.geom.Vector2;
using com.pblabs.util.XMLUtil;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

class LocationComponent extends EntityComponent,
    implements ISerializable
{
    public var point(getPoint, setPoint) : Vector2;
    
    public var x (get_x, set_x) : Float;
    public var y (get_y, set_y) : Float;
    
    public var signaller (default, null) :Signaler<Vector2>;
    
    public static var P_X :PropertyReference<Float> = new PropertyReference("@LocationComponent.x");
    public static var P_Y :PropertyReference<Float> = new PropertyReference("@LocationComponent.y");
    public static var P_POINT :PropertyReference<Vector2> = new PropertyReference("@LocationComponent.point");

    public function new() 
    { 
        super();
        signaller = new DirectSignaler(this);
        _vec = new Vector2();
        _vecForSignalling = new Vector2();
    }

    function getPoint ():Vector2
    {
        return _vec.clone();
    }

    function setPoint (p :Vector2):Vector2
    {
        setLocation(p.x, p.y);
    	return p;
   }

    function get_x ():Float
    {
        return _vec.x;
    }

    function set_x (val :Float):Float
    {
        // trace("setting x " + val);
        if (_vec.x != val) {
            _vec.x = val;
            // trace("dispatching? " + signaller.isListenedTo);
            dispatch();
            // signaller.dispatch(_vec.x, _vec.y);
        }
    	return val;
   }

    function get_y ():Float
    {
        return _vec.y;
    }

    function set_y (val :Float):Float
    {
        if (_vec.y != val) {
            _vec.y = val;
            dispatch();
            // signaller.dispatch(_vec.x, _vec.y);
        }
    	return val;
   }

    public function setLocation (xLoc :Float, yLoc :Float) :Void
    {
        if (_vec.x != xLoc || _vec.y != yLoc) {
            _vec.x = xLoc;
            _vec.y = yLoc;
            dispatch();
            // signaller.dispatch(_vec.x, _vec.y);
        }
    }

    public function toString () :String
    {
        return "[Location " + x + ", " + y + "]";
    }
    
    public function serialize (xml :XML) :Void
    {
        xml.createChild("x", _vec.x);
        xml.createChild("y", _vec.y);
    }
    
    public function deserialize (xml :XML, context :IPBContext) :Dynamic
    {
        _vec.x = xml.parseFloat("x");
        _vec.y = xml.parseFloat("y");
    }
    
    override function onRemove () :Void
    {
        signaller.unbindAll();
        _vec.x = 0;
        _vec.y = 0;
        super.onRemove();
    }
    
    override function onReset () :Void
    {
        super.onReset();
        dispatch();
    }
    
    inline function dispatch () :Void
    {
        _vecForSignalling.x = _vec.x;
        _vecForSignalling.y = _vec.y;
        signaller.dispatch(_vecForSignalling);
    }

    @editorData({ignore :"true"})
    var _vec :Vector2;
    
    @editorData({ignore :"true"})
    var _vecForSignalling :Vector2;
}


