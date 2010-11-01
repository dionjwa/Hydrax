/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util;


class NumberUtil
 {
    public static function isNumberRangesIntersection(min1 :Float, max1 :Float, min2 :Float, max2 :Float) :Bool
    {
        //If there is no intersection, return null
        if(!isNumberWithinRange(min1, min2, max2) &&
            !isNumberWithinRange(max1, min2, max2) &&
            !isNumberWithinRange(min2, min1, max1) &&
            !isNumberWithinRange(max2, min1, max1)) {
                return false;
            }
        return true;
    }

    /**
    * returns [min, max] of the intersection line.
    */
    public static function getNumberRangesIntersection(min1 :Float, max1 :Float, min2 :Float, max2 :Float) :Array<Dynamic>
    {
        //If there is no intersection, return null
        if(!isNumberWithinRange(min1, min2, max2) &&
            !isNumberWithinRange(max1, min2, max2) &&
            !isNumberWithinRange(min2, min1, max1) &&
            !isNumberWithinRange(max2, min1, max1)) {
                return null;
            }

        //If one range is completely contained within the other, return the smaller range
        if(isNumberWithinRange(min1, min2, max2) && isNumberWithinRange(max1, min2, max2)){
            return [min1, max1];
        }
        if(isNumberWithinRange(min2, min1, max1) && isNumberWithinRange(max2, min1, max1)){
            return [min2, max2];
        }

        //Otherwise get the two intersection points
        var number1 = isNumberWithinRange(min1, min2, max2) ? min1 : max1;
        var number2 = isNumberWithinRange(min2, min1, max1) ? min2 : max2;

        return [ Math.min(number1, number2), Math.max(number1, number2) ];
    }

    public static function isNumberWithinRange(n :Float, low :Float, high :Float) :Bool
    {
        return n >= low && n <= high;
    }
    
    public static function toFixed (v :Float, digits :Int) :Float
    {
        var prec = Math.pow(10, digits);
        return Std.int(v*prec)/prec;
    }
    
}
