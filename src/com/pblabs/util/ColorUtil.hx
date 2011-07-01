package com.pblabs.util;

class ColorUtil
{
	#if flash
	inline public static function toARGB (rgb :UInt, newAlpha :UInt) :UInt
	{
		//newAlpha has to be in the 0 to 255 range
		var argb :UInt = 0;
		argb += (newAlpha<<24);
		argb += (rgb);
		return argb;
	}
	#end

}
