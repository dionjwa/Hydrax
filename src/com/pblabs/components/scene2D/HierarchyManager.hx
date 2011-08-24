package com.pblabs.components.scene2D;

import Type;

import com.pblabs.components.scene2D.SvgAnchorCache;
import com.pblabs.components.spatial.SpatialComponent;
import com.pblabs.engine.core.EntityComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.geom.Vector2;
import com.pblabs.util.Comparators;
import com.pblabs.util.ds.Map;

import de.polygonal.motor2.geom.math.XY;

using StringTools;

using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.engine.core.SignalBondManager;
using com.pblabs.geom.VectorTools;
using com.pblabs.util.StringUtil;
using com.pblabs.util.XmlUtil;

/**
  * Manages the display anchors (MovieClips in Flash, SVGs in JS).
  * This allows UIs to be created in pieces and the correct buttons 
  * to be attached to the correct (relative) locations.
  *
  * This manager is an alternative to extending existing components.
  */
class HierarchyManager extends EntityComponent
{
	public static var ANCHOR_PREFIX = "anchor";
	public static var INKSCAPE_LABEL = "inkscape:label";
	
	@inject("com.pblabs.engine.resource.IResourceManager")
	var _rsrc :IResourceManager;
	
	/**
	  * Maps <svg id or DisplayObject.name, map of <anchor name, relative location>>  
	  */
	var _links :Array<Link>;
	var _temp :XY;
	
	public function new ()
	{
		super();
		_links = [];
		_temp = new Vector2();
	}
	
	public function getAnchors (token :ResourceToken) :Map<String, XY>
	{
		com.pblabs.util.Assert.isNotNull(token, ' token is null');
		com.pblabs.engine.debug.Profiler.enter("getSvgResource");
		// token = SvgTools.getSvgResource(token);
		com.pblabs.engine.debug.Profiler.exit("getSvgResource");
		com.pblabs.engine.debug.Profiler.enter("_rsrc.get(");
		var svg = _rsrc.get(token);
		com.pblabs.engine.debug.Profiler.exit("_rsrc.get(");
		com.pblabs.util.Assert.isNotNull(svg, ' svg is null');
		com.pblabs.engine.debug.Profiler.enter("SvgAnchors.getAnchors");
		var val = SvgAnchors.getAnchors(token.id, svg);
		com.pblabs.engine.debug.Profiler.exit("SvgAnchors.getAnchors");
		return val;
		
		// return SvgAnchors.getAnchors(svg);
	}
	
	function updateLink (link :Link) :Void
	{
		com.pblabs.engine.debug.Profiler.enter("updateLink");
		com.pblabs.util.Assert.isNotNull(link);
		com.pblabs.engine.debug.Profiler.enter("getOffset");
		var offset = getOffset(link.parentDisplayType, link.childKey);
		com.pblabs.engine.debug.Profiler.exit("getOffset");
		if (offset == null) {
			com.pblabs.util.Log.warn("Not a valid match " + link.parentDisplayType + "." + link.childKey);
			com.pblabs.engine.debug.Profiler.exit("updateLink");
			return;
		}
		com.pblabs.engine.debug.Profiler.enter("rest");
		var parentCoords = link.parent.owner.getComponent(SpatialComponent);
		com.pblabs.util.Assert.isNotNull(parentCoords);
		var locX = parentCoords.x + offset.x - link.parent.registrationPoint.x;
		var locY = parentCoords.y + offset.y - link.parent.registrationPoint.y;
		// locX = Std.int(locX) + 0.5;
		// locY = Std.int(locY) + 0.5;
		link.child.owner.setLocation(locX, locY);
		com.pblabs.engine.debug.Profiler.exit("rest");
		com.pblabs.engine.debug.Profiler.exit("updateLink");
	}
	
	public function setAsChild (parent :BaseSceneComponent<Dynamic>, parentResource :ResourceToken, 
		childKey :String, child :BaseSceneComponent<Dynamic>) :Void
	{
		com.pblabs.util.Assert.isNotNull(parent);
		com.pblabs.util.Assert.isNotNull(childKey);
		com.pblabs.util.Assert.isNotNull(child);
		com.pblabs.util.Assert.isNotNull(parentResource);
		// parentResource = SvgTools.getSvgResource(parentResource);
		
		removeChild(child);
		
		var anchors = getAnchors(parentResource); 
		
		for (key in anchors.keys()) {
			if (key.startsWith(childKey)) {
				childKey = key;
				break;
			}
		}
		var link = new Link();
		link.child = child;
		link.parent = parent;
		link.parentDisplayType = parentResource;
		link.childKey = childKey;
		link.childEntityName = child.owner.name;
		_links.push(link);
		updateLink(link);
		
		var self = this;
		if (parent.owner.getComponent(SpatialComponent) != null) {
			child.bindSignal(parent.owner.getComponent(SpatialComponent).signalerLocation, function (loc :XY) :Void {
				self.updateLink(link);
			});
		}
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		_rsrc = null;
		_links = null;
	}
	
	function entityDestroyed (e :IEntity) :Void
	{
		for (link in _links.copy()) {
			if (link.childEntityName == e.name) {
				_links.remove(link);
			}
		}
	}
	
	function removeChild (child :BaseSceneComponent<Dynamic>) :Void
	{
		for (link in _links.copy()) {
			if (link.childEntityName == child.owner.name) {
				_links.remove(link);
			}
		}
	}
	
	function getOffset (parent :ResourceToken, child :String) :XY
	{
		_temp.x = _temp.y = 0;
		
		if (getAnchors(parent) == null) {
			// com.pblabs.util.Log.error("missing in _anchors: " + parent);
			return _temp;
		}
		if (getAnchors(parent).get(child) == null) {
			// com.pblabs.util.Log.error("Missing child=" + child + " from anchors from parent=" + parent + ", anchors=" + com.pblabs.util.ds.MapUtil.toString(getAnchors(parent)));
			// com.pblabs.util.Log.error("Missing child=" + child + " from anchors from parent=" + parent);
			return _temp;
		}
		var val = getAnchors(parent).get(child);
		_temp.x = val.x;
		_temp.y = val.y;
		return _temp;
		// return getAnchors(parent).get(child).clone();
	}
	
	// #if debug
	// override public function toString () :String
	// {
	// 	var sb = new StringBuf();
	// 	sb.add(com.pblabs.util.ReflectUtil.tinyClassName(this));
	// 	if (_anchors != null) {
	// 		for (key in _anchors.keys()) {
	// 			sb.add("\n  " + key + "==>" + com.pblabs.util.ds.MapUtil.toString(_anchors.get(key)));
	// 		}
	// 	}
	// 	return sb.toString();
	// }
	// #end
}

class Link
{
	public var child :BaseSceneComponent<Dynamic>;
	public var childEntityName :String;
	public var parent :BaseSceneComponent<Dynamic>;
	public var childKey :String;
	public var parentDisplayType :ResourceToken;
	
	public function new () {}
}
