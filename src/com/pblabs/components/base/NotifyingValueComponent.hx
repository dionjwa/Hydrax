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
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.serialization.ISerializable;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

using com.pblabs.util.XMLUtil;

class NotifyingValueComponent extends EntityComponent,
    implements ISerializable
{
    
    public var value (get_value, set_value) : Float;
    public var signaller (default, null) :Signaler<Float>;
    
    public function new () 
    { 
        super();
        _value = 0;
        signaller = new DirectSignaler(this);
    }
    
    public function serialize (xml :XML) :Void
    {
        xml.createChild("value", _value);
    }
    
    public function deserialize (xml :XML, context :IPBContext) :Dynamic
    {
        _value = xml.parseFloat("value");
    }
    
    function get_value () :Float
    {
        return _value;
    }
    
    function set_value (val :Float) :Float
    {
        if (_value != val) {
            _value = val;
            signaller.dispatch(_value);
        }
        return val;
    }
    
    override function onRemove():Void
    {
        super.onRemove();
        signaller.unbindAll();
        _value = 0;
    }
    
    override function onReset () :Void
    {
        super.onReset();
        signaller.dispatch(_value);
    }

    var _value :Float;
}


