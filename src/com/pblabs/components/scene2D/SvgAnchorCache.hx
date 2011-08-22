package com.pblabs.components.scene2D;

import StringTools;

import com.pblabs.engine.core.IPBManager;
import com.pblabs.geom.Vector2;
import com.pblabs.util.Comparators;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;
import com.pblabs.util.ds.maps.DynamicMap;
import com.pblabs.util.ds.maps.SortedMap;

import de.polygonal.motor2.geom.math.XY;

import Type;

using Lambda;

using StringTools;

using com.pblabs.geom.VectorTools;
using com.pblabs.util.StringUtil;
using com.pblabs.util.XmlUtil;
using com.pblabs.util.IterUtil;

/**
  * Manages the display anchors (MovieClips in Flash, SVGs in JS).
  * This allows UIs to be created in pieces and the correct buttons 
  * to be attached to the correct (relative) locations.
  *
  * This manager is an alternative to extending existing components.
  */
class SvgAnchorCacheDelete
	implements IPBManager
{
	public static var ANCHOR_PREFIX = "anchor";
	public static var INKSCAPE_LABEL = "inkscape:label";
	
	#if flash
	/** Retrieves relative child locations */
	public static function analyseDisplayObject (clip :flash.display.DisplayObject) :Map<String, XY>
	{
		if (clip == null) {
			return null;
		}
		
		var clipData :Map<String, XY> = new SortedMap(Maps.newHashMap(ValueType.TClass(String)), Comparators.compareStrings);
		com.pblabs.util.DisplayUtils.applyToHierarchy(clip, function (d :flash.display.DisplayObject) :Dynamic {
			if (d.name.toLowerCase().startsWith("anchor")) {
				clipData.set(d.name, new Vector2(d.x, d.y));
			}
		});
		
		return clipData;
	}
	#end
	
	public static function parseAnchors(svg :Xml) :Map<String, XY>
	{
		svg = svg.ensureNotDocument();
		// var width = Std.parseFloat(svg.get("width"));
		// var height = Std.parseFloat(svg.get("height"));
		var anchors :Map<String, XY> = new SortedMap(Maps.newHashMap(ValueType.TClass(String)), Comparators.compareStrings);
		for (element in svg.elements()) {
			// trace('element=' + Std.string(element));
			// trace('    element.nodeName=' +     element.nodeName);
			if (element.nodeName.endsWith("rect")) {
				// trace("...found rect");
				if (element.get(INKSCAPE_LABEL) != null && element.get(INKSCAPE_LABEL).toLowerCase().startsWith(ANCHOR_PREFIX)) {
					// trace('found anchor');
					var x = Std.parseFloat(element.get("x"));
					var y = Std.parseFloat(element.get("y"));
					var w = Std.parseFloat(element.get("width"));
					var h = Std.parseFloat(element.get("height"));
					//Don't offset by the width and height, that is taken care of by 
					//the hierarchy manager. You cannot assume offsets here.
					var anchor = new Vector2((x + w / 2), (y + h / 2));
					anchors.set(element.get(INKSCAPE_LABEL), anchor);
				}
			}
		}
		return anchors;
	}
	
	public static function getAnchorIdentifier (s :BaseSceneComponent<Dynamic>) :String
	{
		com.pblabs.util.Assert.isNotNull(s, "Null SceneObject");
		if (Std.is(s, SVGComponent)) {
			var svgdisp :SVGComponent = cast s;
			com.pblabs.util.Assert.isNotNull(svgdisp);
			
			com.pblabs.util.Assert.isNotNull(svgdisp.resources);
			com.pblabs.util.Assert.isTrue(svgdisp.resources.length > 0);
			com.pblabs.util.Assert.isTrue(svgdisp.resources[0] != null);
			return svgdisp.resources[0].toString();
		}
		#if flash
		else if (Std.is(s, com.pblabs.components.scene2D.flash.SceneComponent)) {
			var disp :com.pblabs.components.scene2D.flash.SceneComponent = cast s;
			//Create a hash from class names of the display hierarchy
			var sb = new StringBuf();
			try {
				com.pblabs.util.DisplayUtils.applyToHierarchy(disp.displayObject, function (d :flash.display.DisplayObject) :Bool {
					try {
						sb.add(Type.getClassName(Type.getClass(d)));
					} catch (e :Dynamic) {
						//Swallow the error, thrown for objects loaded in external swfs.  These don't have the right metadata
						//to get the name.
						sb.add(d + "");
					}
					return false;
				});
				return haxe.Md5.encode(sb.toString());
			} catch (e :Dynamic) {
				if (s.owner != null) {
					return s.owner.name + s.name;
				} else {
					//Getting desperate
					com.pblabs.util.Log.error("Error in searching display hierarchy, using random string as id " + e);
					return Math.random() + "";
				}
			}
		}
		#end
		com.pblabs.util.Log.warn("SceneComponent does not have anchors, cannot get proper anchor identifier");
		return null;
	}
	
	/**
	  * Maps <svg id or DisplayObject.name, map of <anchor name, relative location>>  
	  */
	var _anchors :Map<String, Map<String, XY>>;
	
	public function new ()
	{
		_anchors = Maps.newHashMap(ValueType.TClass(String));
	}
	
	public function getAnchors (s :BaseSceneComponent<Dynamic>) :Map<String, XY>
	{
		com.pblabs.util.Assert.isNotNull(s, "SceneComponent is null\n" + com.pblabs.util.Log.getStackTrace());
		var id = getAnchorIdentifier(s);
		if (_anchors.exists(id)) {
			return deepCopy(_anchors.get(id));
		}
		if (Std.is(s, SVGComponent)) {
			var svgdisp :SVGComponent = cast s;
			com.pblabs.util.Assert.isNotNull(svgdisp.resources);
			com.pblabs.util.Assert.isTrue(svgdisp.resources.length > 0);
			var computedAnchors = parseAnchors(Xml.parse(svgdisp.svgData[0]));
			_anchors.set(id, computedAnchors);
			return deepCopy(_anchors.get(id));
		}
		#if flash
		else if (Std.is(s, com.pblabs.components.scene2D.flash.SceneComponent)) {
			var disp :com.pblabs.components.scene2D.flash.SceneComponent = cast s;
			_anchors.set(id, analyseDisplayObject(disp.displayObject));
			return deepCopy(_anchors.get(id));
		}
		#end
		com.pblabs.util.Log.warn("SceneComponent does not have anchors");
		return null;
	}
	
	/** Sorted by anchor name */
	public function getAnchorLocations (s :BaseSceneComponent<Dynamic>) :Array<XY>
	{
		var m = getAnchors(s);
		var keys = m.keys().toArray();
		keys.sort(Comparators.compareStrings);
		return keys.map(m.get).array();
	}
	
	static function deepCopy (toCopy :Map<String, XY>) :Map<String, XY>
	{
		var m = new DynamicMap<XY>();
		for (key in toCopy.keys()) {
			m.set(key, toCopy.get(key).clone());
		}
		return m;
	}
	
	public function startup () :Void
	{
	    
	}
	
	public function shutdown () :Void
	{
	    _anchors.clear();
		_anchors = null;
	}
	
	#if debug
	public function toString () :String
	{
		var sb = new StringBuf();
		sb.add(com.pblabs.util.ReflectUtil.tinyClassName(this));
		if (_anchors != null) {
			for (key in _anchors.keys()) {
				sb.add("\n  " + key + "==>" + com.pblabs.util.ds.MapUtil.toString(_anchors.get(key)));
			}
		}
		return sb.toString();
	}
	#end
}
