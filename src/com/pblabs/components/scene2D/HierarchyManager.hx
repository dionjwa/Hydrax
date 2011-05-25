package com.pblabs.components.scene2D;

import com.pblabs.components.spatial.SpatialComponent;
import com.pblabs.engine.core.EntityComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.geom.Vector2;
import com.pblabs.util.Comparators;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;
import com.pblabs.util.ds.maps.DynamicMap;
import com.pblabs.util.ds.maps.SortedMap;

import de.polygonal.motor2.geom.math.XY;

using StringTools;

using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.geom.VectorTools;
using com.pblabs.util.StringUtil;
using com.pblabs.util.XMLUtil;

/**
  * Manages the display anchors (MovieClips in Flash, SVGs in JS).
  * This allows UIs to be created in pieces and the correct buttons 
  * to be attached to the correct (relative) locations.
  *
  * This manager is an alternative to extending existing components.
  */
class HierarchyManager extends EntityComponent,
	implements IAnimatedObject
{
	public static var ANCHOR_PREFIX = "anchor";
	public static var INKSCAPE_LABEL = "inkscape:label";
	static var _svgAnchorCache :Map<String, Map<String, XY>> = Maps.newHashMap(String);
	
	#if flash
	/** Retrieves relative child locations */
	public static function analyseDisplayObject (clip :flash.display.DisplayObject) :Map<String, XY>
	{
		if (clip == null) {
			return null;
		}
		
		var clipData :Map<String, XY> = new SortedMap(Maps.newHashMap(String), Comparators.compareStrings);
		com.pblabs.util.DisplayUtils.applyToHierarchy(clip, function (d :flash.display.DisplayObject) :Dynamic {
			if (d.name.startsWith("anchor")) {
				clipData.set(d.name, new Vector2(d.x, d.y));
			}
		});
		
		// for (i in 0...clip.numChildren) {
		// 	var child = clip.getChildAt(i);
		// 	clipData.set(child.name, new Vector2(child.x, child.y));
		// }
		return clipData;
	}
	#end
	
	public static function parseAnchors(svg :Xml) :Map<String, XY>
	{
		svg = svg.ensureNotDocument();
		var id = svg.get("id");
		if (id != null && _svgAnchorCache.exists(id)) {
			return deepCopy(_svgAnchorCache.get(id));
		}
		var anchors :Map<String, XY> = new SortedMap(Maps.newHashMap(String), Comparators.compareStrings);
		for (element in svg.elements()) {
			if (element.nodeName.endsWith("rect")) {
				if (element.get(INKSCAPE_LABEL) != null && element.get(INKSCAPE_LABEL).startsWith(ANCHOR_PREFIX)) {
					var x = Std.parseFloat(element.get("x"));
					var y = Std.parseFloat(element.get("y"));
					var w = Std.parseFloat(element.get("width"));
					var h = Std.parseFloat(element.get("height"));
					var anchor = new Vector2(x + w / 2, y + h / 2);
					anchors.set(element.get(INKSCAPE_LABEL), anchor);
				}
			}
		}
		
		if (id != null) {
			_svgAnchorCache.set(id, anchors);
		}
		
		return deepCopy(anchors);
	}
	
	static function getAnchorIdentifier (s :BaseSceneComponent<Dynamic>) :String
	{
		if (Std.is(s, SVGComponent)) {
			var svgdisp :SVGComponent = cast s;
			com.pblabs.util.Assert.isNotNull(svgdisp.resources);
			com.pblabs.util.Assert.isTrue(svgdisp.resources.length > 0);
			return svgdisp.resources[0].resourceId;
		}
		#if flash
		else if (Std.is(s, com.pblabs.components.scene2D.flash.SceneComponent)) {
			var disp :com.pblabs.components.scene2D.flash.SceneComponent = cast s;
			return s.owner.name + "." + s.name;
		}
		#end
		com.pblabs.util.Log.warn("SceneComponent does not have anchors, cannot get proper anchor identifier");
		return null;
	}
	
	/**
	  * Maps <svg id or DisplayObject.name, map of <anchor name, relative location>>  
	  */
	var _anchors :Map<String, Map<String, XY>>;
	var _links :Array<Link>;
	var _toRemove :Array<Link>;
	
	public function new ()
	{
		super();
		_anchors = Maps.newHashMap(String);
		_links = [];
		_toRemove = [];
		var testmap :Map<String, XY> = Maps.newHashMap(String);
		testmap.set("anchor1", new com.pblabs.geom.Vector2(0, 0));
		_anchors.set("test", testmap);
	}
	
	public function getAnchors (s :BaseSceneComponent<Dynamic>) :Map<String, XY>
	{
		var id = getAnchorIdentifier(s);
		if (_anchors.exists(id)) {
			return deepCopy(_anchors.get(id));
		}
		
		if (Std.is(s, SVGComponent)) {
			var svgdisp :SVGComponent = cast s;
			com.pblabs.util.Assert.isNotNull(svgdisp.resources);
			com.pblabs.util.Assert.isTrue(svgdisp.resources.length > 0);
			_anchors.set(id, parseAnchors(Xml.parse(svgdisp.svgData[0])));
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
	
	static function deepCopy (toCopy :Map<String, XY>) :Map<String, XY>
	{
		var m = new DynamicMap<XY>();
		for (key in toCopy.keys()) {
			m.set(key, toCopy.get(key).clone());
		}
		return m;
	}
	
	/** Update the relative locations on every frame */	
	public function onFrame (dt :Float) :Void
	{
		for (link in _links) {
			com.pblabs.util.Assert.isNotNull(link);
			var offset = getOffset(link.parentDisplayType, link.childKey);
			if (offset == null) {
				com.pblabs.util.Log.warn("Not a valid match " + link.parentDisplayType + "." + link.childKey);
				continue;
			}
			var parentCoords = link.parent.owner.getComponent(SpatialComponent);
			com.pblabs.util.Assert.isNotNull(parentCoords);
			var locX = parentCoords.x + offset.x - link.parent.registrationPoint.x;
			var locY = parentCoords.y + offset.y - link.parent.registrationPoint.y;
			locX = Std.int(locX) + 0.5;
			locY = Std.int(locY) + 0.5;
			link.child.owner.setLocation(locX, locY);
		}
		if (_toRemove.length > 0) {
			for (item in _toRemove) {
				_links.remove(item);
			}
			_toRemove = [];
		}
	}
	
	public function setAsChild (parent :BaseSceneComponent<Dynamic>, childKey :String, child :BaseSceneComponent<Dynamic>) :Void
	{
		com.pblabs.util.Assert.isNotNull(parent);
		com.pblabs.util.Assert.isNotNull(childKey);
		com.pblabs.util.Assert.isNotNull(child);
		
		removeChild(child);
		var anchors = getAnchors(parent);
		for (key in anchors.keys()) {
			if (key.startsWith(childKey)) {
				childKey = key;
				break;
			}
		}
		var link = new Link();
		link.child = child;
		link.parent = parent;
		// link.parentDisplayType = "test";
		// link.childKey = "anchor1";
		link.parentDisplayType = getAnchorIdentifier(parent);//svgdisp.resources[0].resourceId;
		link.childKey = childKey;
		link.childEntityName = child.owner.name;
		_links.push(link);
		
		onFrame(0);
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		_anchors.clear();
		_anchors = null;
		_links = null;
		_toRemove = null;
	}
	
	function entityDestroyed (e :IEntity) :Void
	{
		for (link in _links) {
			if (link.childEntityName == e.name) {
				_toRemove.push(link);
			}
		}
	}
	
	function removeChild (child :BaseSceneComponent<Dynamic>) :Void
	{
		for (link in _links) {
			if (link.childEntityName == child.owner.name) {
				_toRemove.push(link);
			}
		}
	}
	
	function getOffset (parent :String, child :String) :XY
	{
		if (_anchors.get(parent) == null) {
			trace("missing in _anchors: " + parent);
			return null;
		}
		return _anchors.get(parent).get(child).clone();
	}
	
	#if debug
	public function toString () :String
	{
		var sb = new StringBuf();
		sb.add("HierarchyManager");
		if (_anchors != null) {
			for (key in _anchors.keys()) {
				sb.add("\n  " + key + "==>" + com.pblabs.util.ds.MapUtil.toString(_anchors.get(key)));
			}
		}
		return sb.toString();
	}
	#end
}

class Link
{
	public var child :BaseSceneComponent<Dynamic>;
	public var childEntityName :String;
	public var parent :BaseSceneComponent<Dynamic>;
	public var childKey :String;
	public var parentDisplayType :String;
	
	public function new () {}
}
