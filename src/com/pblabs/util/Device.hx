package com.pblabs.util;

import com.pblabs.geom.Vector2;

import de.polygonal.motor2.geom.math.XY;

using com.pblabs.geom.VectorTools;

enum Browser {
	ANDROID;
	SAFARI_OSX;
	SAFARI_IOS;
	CHROME;
	FIREFOX;
	IE;
}

class Device
{
	#if js
	public static var isRetinaDisplay = {
		untyped __js__("window.devicePixelRatio !== undefined && window.devicePixelRatio >= 2"); 
	}
	
	public static var browser :Browser = {
		if (js.Lib.window.navigator.userAgent.indexOf("Android") > -1) {
			Browser.ANDROID;
		} else if (js.Lib.window.navigator.userAgent.indexOf("Chrome") > -1) {
			Browser.CHROME;
		} else if (js.Lib.window.navigator.userAgent.indexOf("iPhone") > -1) {
			Browser.SAFARI_IOS;
		} else if (js.Lib.window.navigator.userAgent.indexOf("Safari") > -1) {
			Browser.SAFARI_OSX;
		} else if (js.Lib.window.navigator.userAgent.indexOf("Firefox") > -1) {
			Browser.FIREFOX;
		} else if (js.Lib.window.navigator.userAgent.indexOf("Chrome") > -1) {
			Browser.CHROME;
		}
	};
	
	public static var isMobileBrowser = {
		browser == Browser.SAFARI_IOS || browser == Browser.ANDROID;//TODO: Android browsers.  How to detect?
	}
	#end
	
	public static function getScreenDimensions () :XY
	{
		if (isMobileBrowser) {
			switch (browser) {
				case ANDROID: return new Vector2(js.Lib.window.screen.width, js.Lib.window.screen.height);
				case SAFARI_IOS: return new Vector2(320, 480);
				default:  throw "I don't know what device this is";
			}
		} else {
			#if js
			return new Vector2(js.Lib.window.screen.width, js.Lib.window.screen.height);
			#end
		}
		
	}
}
