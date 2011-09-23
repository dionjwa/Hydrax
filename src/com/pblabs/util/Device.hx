package com.pblabs.util;

import com.pblabs.geom.Vector2;

import de.polygonal.motor2.geom.math.XY;

using com.pblabs.geom.VectorTools;

enum Browser {
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
		if (js.Lib.window.navigator.userAgent.indexOf("Chrome") > -1) {
			Browser.CHROME;
		} else if (js.Lib.window.navigator.userAgent.indexOf("iPhone") > -1) {
			Browser.SAFARI_IOS;
		} else if (js.Lib.window.navigator.userAgent.indexOf("Safari") > -1) {
			Browser.SAFARI_OSX;
		} else if (js.Lib.window.navigator.userAgent.indexOf("Firefox") > -1) {
			Browser.FIREFOX;
		} else if (js.Lib.window.navigator.userAgent.indexOf("Chrome") > -1) {
			Browser.CHROME;
		} else if (js.Lib.window.navigator.userAgent.indexOf("Chrome") > -1) {
			Browser.CHROME;
		} 
	};
	
	public static var isMobileBrowser = {
		browser == Browser.SAFARI_IOS;//TODO: Android browsers.  How to detect?
	}
	#end
	
	// public static var isBrowser :Bool = ;
}

#if js
class ScreenDimensions
{
	public static var iOs3g :XY = new Vector2(320, 480);
	public static var iOs4g = iOs3g.scale(2);
}
#end
