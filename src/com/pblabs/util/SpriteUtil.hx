package com.pblabs.util;

import flash.display.Sprite;

class SpriteUtil
{
	public static function create () :Sprite
	{
		var s = new Sprite();
		s.mouseChildren = s.mouseEnabled = false;
		return s;
	}
}
