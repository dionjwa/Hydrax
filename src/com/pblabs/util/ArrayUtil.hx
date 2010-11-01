/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util;

import com.pblabs.util.EqualableUtil;

/**
 * Contains methods operating on Arrays that understand the 
 * Equalable interface.
 */
class ArrayUtil    
{
    /**
     * @return the zero-based index of the matching element, or -1 if none found.
     */
    public static function indexOf (it :Array<Dynamic>, element :Dynamic) :Int
    {
        return com.pblabs.util.IterUtil.indexOf(it, element);
    }
    
    public static function exists (arr :Array<Dynamic>, element :Dynamic) :Bool
    {
        return indexOf(arr, element) != -1;
    }
    
    public static function isEmpty (arr :Array<Dynamic>) :Bool
    {
        return arr == null || arr.length == 0;
    }
    /**
     * Remove the first instance of the specified element from the array.
     *
     * @return true if an element was removed, false otherwise.
     */
    public static function removeFirst (arr :Array<Dynamic>, element :Dynamic) :Bool
    {
        return removeIfImpl(arr, element, true);
    }

    /**
     * Removes all instances of the specified element from the array.
     *
     * @return true if at least one element was removed, false otherwise.
     */
    public static function removeAll (arr :Array<Dynamic>, element :Dynamic) :Bool
    {
        return removeIfImpl(arr, element, false);
    }

    /**
     * Implementation of removeIf methods.
     */
    static function removeIfImpl (arr :Array<Dynamic>, element :Dynamic, firstOnly :Bool) :Bool
    {
        var removed:Bool = false;
        var ii :Int = 0;
        while (ii < arr.length) {
            if (EqualableUtil.equals(element, arr[ii])) {
                arr.splice(ii--, 1);
                if (firstOnly) {
                    return true;
                }
                removed = true;
            }
            ii++;
        }
        return removed;
    }
}


