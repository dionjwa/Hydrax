package com.pblabs.util.svg;

class SvgTools
{
	inline public static function svgId (svgId :String) :String
	{
		#if flash
		return "svg:" + svgId;
		#elseif js
		return svgId;
		#end
	}
}
