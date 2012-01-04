package com.pblabs.components.scene2D;

import Type;

import com.pblabs.components.spatial.SpatialComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.PBManager;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ResourceToken;

import com.pblabs.components.minimalcomp.MCompTools;

import org.transition9.util.Comparators;
import org.transition9.util.F;
import org.transition9.ds.Map;

import de.polygonal.motor.geom.math.Vec2;

using StringTools;

using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.engine.core.SignalBondManager;
using com.pblabs.engine.util.PBUtil;
using org.transition9.geom.Vec2Tools;
using org.transition9.util.StringUtil;
using org.transition9.util.XmlTools;

/**
  * Manages the display anchors (MovieClips in Flash, SVGs in JS).
  * This allows UIs to be created in pieces and the correct buttons 
  * to be attached to the correct (relative) locations.
  *
  * This manager is an alternative to extending existing components.
  */
class HierarchyManager extends PBManager
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
	
	@inject
	public var _rsrc :IResourceManager;
	var _temp :Vec2;
	
	public function new ()
	{
		super();
		_temp = new Vec2();
	}
	
	public function getAnchors (token :ResourceToken) :Map<String, Vec2>
	{
		org.transition9.util.Assert.isNotNull(token, ' token is null');
		com.pblabs.engine.debug.Profiler.enter("getSvgResource");
		com.pblabs.engine.debug.Profiler.exit("getSvgResource");
		com.pblabs.engine.debug.Profiler.enter("_rsrc.get(");
		org.transition9.util.Assert.isNotNull(_rsrc, ' _rsrc is null');
		var svg = _rsrc.get(token);
		com.pblabs.engine.debug.Profiler.exit("_rsrc.get(");
		org.transition9.util.Assert.isNotNull(svg, ' svg is null');
		com.pblabs.engine.debug.Profiler.enter("SvgAnchors.getAnchors");
		var val = SvgAnchors.getAnchors(svg);
		com.pblabs.engine.debug.Profiler.exit("SvgAnchors.getAnchors");
		return val;
	}
	
	public function setAsChild (parent :IEntity, parentResource :ResourceToken, 
		childKey :String, child :BaseSceneComponent<Dynamic>) :Void
	{
		org.transition9.util.Assert.isNotNull(parent);
		org.transition9.util.Assert.isNotNull(childKey);
		org.transition9.util.Assert.isNotNull(child);
		org.transition9.util.Assert.isNotNull(parentResource);
	
		var offset = getOffset(parentResource, childKey);
		org.transition9.util.Assert.isNotNull(offset, ' offset is null');
		
		MCompTools.setRelative(child.owner, parent, offset.x, offset.y);
	}
	
	override public function shutdown () :Void
	{
		super.shutdown();
		_rsrc = null;
	}
	
	function getOffset (parent :ResourceToken, child :String) :Vec2
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
