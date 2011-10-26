package com.pblabs.util;

import js.Dom;

using com.pblabs.util.StringUtil;

class DomUtil
{
	public static function setStyle (style :String, name :String, value :String) :String
	{
		if (style.isBlank() && value.isBlank()) {
			return "";
		}
		
		if (style.isBlank()) {
			return name + ":" + value;
		}
		
		var styleTokens = style.split(";");
		for (ii in 0...styleTokens.length) {
			if (styleTokens[ii].split(":")[0].trim() == name) {
				if (value.isBlank()) {
					styleTokens.splice(ii, 2);
				} else {
					styleTokens[ii] = name + ":" + value;
				}
				return styleTokens.join(";");
			}
		}
		
		return style + ";" + name + ":" + value;
	}
	
	public static function removeAllChildren (dom :HtmlDom) :HtmlDom
	{
		while (dom.lastChild != null) {
			dom.removeChild(dom.lastChild);
		}
		return dom;
	}
	
}
