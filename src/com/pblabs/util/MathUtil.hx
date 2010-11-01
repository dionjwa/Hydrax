/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util;

class MathUtil
{
    /** Min value, signed integer.   */
	inline public static var  INT32_MIN = 0x80000000;
	/** Max value, signed integer.   */
	inline public static var  INT32_MAX = 0x7fffffff;
	
	/** Default square root of 2. */
	inline public static var SQROOT2 = 1.4142135623730951;
	
    /** Clamps the integer <i>x</i> to the interval &#091;<i>min</i>,<i>max</i>&#093; so <i>min</i> <= <i>x</i> <= <i>max</i>. */
	inline public static function clamp(x:Int, min:Int, max:Int):Int
	{
		return (x < min) ? min : (x > max) ? max : x;
	}
	
    /** Clamps a number to the interval &#091;<i>min</i>,<i>max</i>&#093; so <i>min</i> <= <i>x</i> <= <i>max</i>. */
	inline public static function fclamp(x:Float, min:Float, max:Float):Float
	{
		return (x < min) ? min : (x > max) ? max : x;
	}
    
}
