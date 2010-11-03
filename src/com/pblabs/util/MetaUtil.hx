/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util;

class MetaUtil
{
    public static function isFieldMetaData (cls :Class<Dynamic>, fieldName :String, metaLabel :String) :Bool
    {
        #if debug
        com.pblabs.util.Assert.isNotNull(cls, "cls is null");
        com.pblabs.util.Assert.isNotNull(fieldName, "fieldName is null");
        com.pblabs.util.Assert.isNotNull(metaLabel, "metaLabel is null");
        #end
        
        var meta = haxe.rtti.Meta.getFields(cls);
        if (meta == null) {
            return false;
        }
        return Reflect.hasField(meta, fieldName) && Reflect.hasField(Reflect.field(meta, fieldName), metaLabel);
    }

}
