package com.pblabs.components.scene2D;

import com.pblabs.engine.resource.ResourceToken;

class SvgTools
{
	public static function getSvgResource (token :ResourceToken) :ResourceToken
	{
		return switch (token.type) {
			case SVG: token; 
			case BITMAP_CACHE(other): other;
			default: throw "Invalid token: " + token; token;
		}
	}
}
