package com.pblabs.components.scene2D;

import Type;

import com.pblabs.components.spatial.SpatialComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.PBManager;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.engine.time.IProcessManager;
import com.pblabs.geom.Vector2;
import com.pblabs.util.Comparators;
import com.pblabs.util.F;
import com.pblabs.util.ds.Map;

import de.polygonal.motor2.geom.math.XY;

using StringTools;

using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.engine.core.SignalBondManager;
using com.pblabs.engine.util.PBUtil;
using com.pblabs.geom.VectorTools;
using com.pblabs.util.StringUtil;
using com.pblabs.util.XmlTools;

/**
  * Manages the display anchors (MovieClips in Flash, SVGs in JS).
  * This allows UIs to be created in pieces and the correct buttons 
  * to be attached to the correct (relative) locations.
  *
  * This manager is an alternative to extending existing components.
  */
class HierarchyManager extends PBManager
	,implements com.pblabs.engine.time.ITickedObject
{
	/** For 'using' */
	public static function setEntityAsDisplayChildOf (e :IEntity, parent :IEntity, parentResource :ResourceToken, 
		childKey :String) :IEntity
	{
		var hierarchy :HierarchyManager = e.context.ensureManager(HierarchyManager);
		
		hierarchy.setAsChild(parent, parentResource, childKey, e.getComponent(BaseSceneComponent));
		return e;
	}
	
	public static var ANCHOR_PREFIX = "anchor";
	public static var INKSCAPE_LABEL = "inkscape:label";
	
	@inject("com.pblabs.engine.resource.IResourceManager")
	var _rsrc :IResourceManager;
	
	/**
	  * Maps <svg id or DisplayObject.name, map of <anchor name, relative location>>  
	  */
	var _links :Array<Link>;
	var _temp :XY;
	public var priority :Int;
	
	public function new ()
	{
		super();
		priority = 0;
		_links = [];
		_temp = new Vector2();
	}
	
	public function onTick (dt :Float) :Void
	{
		for (link in _links) {
			updateLink(link);
		}
	}
	
	public function getAnchors (token :ResourceToken) :Map<String, XY>
	{
		com.pblabs.util.Assert.isNotNull(token, ' token is null');
		com.pblabs.engine.debug.Profiler.enter("getSvgResource");
		com.pblabs.engine.debug.Profiler.exit("getSvgResource");
		com.pblabs.engine.debug.Profiler.enter("_rsrc.get(");
		var svg = _rsrc.get(token);
		com.pblabs.engine.debug.Profiler.exit("_rsrc.get(");
		com.pblabs.util.Assert.isNotNull(svg, ' svg is null');
		com.pblabs.engine.debug.Profiler.enter("SvgAnchors.getAnchors");
		var val = SvgAnchors.getAnchors(svg);
		com.pblabs.engine.debug.Profiler.exit("SvgAnchors.getAnchors");
		return val;
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
		com.pblabs.util.Assert.isNotNull(link.parent);
		// var disp = link.parent.owner.getComponent(com.pblabs.components.scene2D.BaseSceneComponent);
		// trace('disp=' + disp);
		// if (disp != null) {trace(disp.scaleX);}
		var locX = link.parent.x + offset.x * (link.parentDisplay != null ? link.parentDisplay.scaleX : 0);
		var locY = link.parent.y + offset.y * (link.parentDisplay != null ? link.parentDisplay.scaleY : 0);
		
		link.childSpatial.setLocation(locX, locY);
		// link.child.owner.setLocation(locX, locY);
		com.pblabs.engine.debug.Profiler.exit("rest");
		com.pblabs.engine.debug.Profiler.exit("updateLink");
	}
	
	public function setAsChild (parent :IEntity, parentResource :ResourceToken, 
		childKey :String, child :BaseSceneComponent<Dynamic>) :Void
	{
		com.pblabs.util.Assert.isNotNull(parent);
		com.pblabs.util.Assert.isNotNull(childKey);
		com.pblabs.util.Assert.isNotNull(child);
		com.pblabs.util.Assert.isNotNull(parentResource);
		
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
		link.parent = parent.getComponent(SpatialComponent);
		link.parentDisplay = parent.getComponent(BaseSceneComponent);
		
		link.childSpatial = child.owner.getComponent(SpatialComponent);
		link.parentDisplayType = parentResource;
		link.childKey = childKey;
		link.childEntityName = child.owner.name;
		_links.push(link);
		updateLink(link);
		
		// if (link.parent != null) {
		// 	var self = this;
		// 	child.bindSignal(link.parent.signalerLocation, F.ignoreArg(callback(updateLink, link)));
		// } else {
		// 	com.pblabs.util.Log.warn("Missing SpatialComponent on the parent");
		// }
	}
	
	override public function startup () :Void
	{
		super.startup();
		context.getManager(IProcessManager).addTickedObject(this);
	}
	
	override public function shutdown () :Void
	{
		context.getManager(IProcessManager).removeTickedObject(this);
		super.shutdown();
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
			return _temp;
		}
		if (getAnchors(parent).get(child) == null) {
			return _temp;
		}
		var val = getAnchors(parent).get(child);
		_temp.x = val.x;
		_temp.y = val.y;
		return _temp;
	}
}

class Link
{
	public var child :BaseSceneComponent<Dynamic>;
	public var childSpatial :SpatialComponent<Dynamic>;
	public var childEntityName :String;
	public var parent :SpatialComponent<Dynamic>;
	public var parentDisplay :BaseSceneComponent<Dynamic>;
	public var childKey :String;
	public var parentDisplayType :ResourceToken;
	
	public function new () {}
}
