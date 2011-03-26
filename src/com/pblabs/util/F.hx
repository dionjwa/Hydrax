package com.pblabs.util;

class F
{
	public static function id <T>(x :T) :Void->T
	{
		return function () :T {
			return x;
		}
	}
	
}
