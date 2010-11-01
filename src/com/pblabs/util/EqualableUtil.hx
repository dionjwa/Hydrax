/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util;

/**
 * Tests objects for equality, using the Equalable interface if present.
 */
class EqualableUtil
 {
    /**
     * If the objects are Equalable, then that will be tested. Arrays
     * and ByteArrays are also compared and are equal if they have
     * elements that are equals (deeply).
     */
    public static function equals (obj1 :Dynamic, obj2 :Dynamic) :Bool
    {
        // catch various common cases (both primitive or null)
        if (obj1 == obj2 || (obj1 == null && obj2 == null)) {
            return true;
        } else if (Std.is(obj1, Equalable)) {
            // if obj1 is Equalable, then that decides it
            return (cast(obj1, Equalable<Dynamic>)).equals(obj2);
        } else if ((Std.is(obj1, Array)) || (Std.is( obj2, Array))) {
            throw "Cannot compare Arrays yet";
        } 
        return false;
    }
}
