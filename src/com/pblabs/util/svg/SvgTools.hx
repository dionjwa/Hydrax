package com.pblabs.util.svg;

import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;
import com.pblabs.util.Base64;

import Type;

using StringTools;

class SvgTools
{
	static var UNIQUE_COUNTER :Int = 1;
	
	inline public static function svgId (svgId :String) :String
	{
		#if flash
		return "svg:" + svgId;
		#elseif js
		return svgId;
		#end
	}
	
	/**
	  * If there are duplicate linearGradient ids (or perhaps others),
	  * the the first linearGradient with the first id that collides with
	  * a second is rendered black :-( on Webkit browsers (not firefox)
	  */
	public static function makeIdsGloballyUnique (svg :Xml) :Xml
	{
		//Contains the original id and the new, globally unique (most 
		var map :Map<String, String> = Maps.newHashMap(ValueType.TClass(String));
		makeIdsGloballyUniqueInternal(svg, map);
		return svg;
	}
	
	static function makeIdsGloballyUniqueInternal (svg :Xml, ids :Map<String, String>) :Void
	{
		if (!(svg.nodeType == Xml.Element || svg.nodeType != Xml.Document)) {
			return;
		}
		
		if (svg.nodeName != "path" && svg.exists("id")) {
			ids.set(svg.get("id"), svg.get("id") + "u" + Base64.b64ConvertInt(UNIQUE_COUNTER++, 3));
			svg.set("id", ids.get(svg.get("id")));
		}
		
		if (svg.exists("xlink:href")) {
			svg.set("xlink:href", "#" + ids.get(svg.get("xlink:href").substr(1)));
		}
		
		if (svg.exists("style")) {
			var style = svg.get("style"); 
			for (id in ids.keys()) {
				if (style.indexOf(id) > -1) {
					style = style.replace(id, ids.get(id));
				}
			}
			svg.set("style", style);
		}
		
		for (child in svg.elements()) {
			makeIdsGloballyUniqueInternal(child, ids);
		}
	}
}
