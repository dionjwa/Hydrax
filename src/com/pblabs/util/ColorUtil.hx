package com.pblabs.util;

import de.polygonal.gl.color.ColorMatrix;

class ColorUtil
{
	#if flash
	public static function toARGB (rgb :UInt, newAlpha :UInt) :UInt
	{
		//newAlpha has to be in the 0 to 255 range
		var argb :UInt = 0;
		argb += (newAlpha<<24);
		argb += (rgb);
		return argb;
	}
	
	public static function createColorFilter (color :Int) :flash.filters.ColorMatrixFilter
    {
        return new ColorMatrix().colorize(color).getFilter();
    }
    
    public static function createHueFilter (angle :Float) :flash.filters.ColorMatrixFilter
    {
        return new ColorMatrix().adjustHue(angle).getFilter();
    }
    #end
    
}
