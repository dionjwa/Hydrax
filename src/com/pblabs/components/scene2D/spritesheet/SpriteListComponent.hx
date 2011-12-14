package com.pblabs.components.scene2D.spritesheet;

import com.pblabs.components.scene2D.ImageData;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ResourceToken;
import org.transition9.rtti.ReflectUtil;
import org.transition9.ds.Map;
import org.transition9.ds.Maps;

import de.polygonal.motor2.geom.math.XY;


/**
  * Sprite container that consists of a series of images
  */
class SpriteListComponent extends SpriteContainerComponent
{
	public var resources (get_resources, set_resources) :Array<ResourceToken>;
	var _resources :Array<ResourceToken>;
	var _sourceFrames :Array<ImageData>;
	public var centers :Array<XY>;
	override function set_sourceFrames (val :Array<ImageData>) :Array<ImageData>
	{
		deleteFrames();
		_sourceFrames = val;
		return val;
	}
	
	/** Identifier, so we don't have to use the component name */
	public var id  :String;
	// var _id :String;
	// function get_id () :String
	// {
	// 	return _id;
	// }
	
	// function set_id (val :String) :String
	// {
	// 	if (_id != null) {
	// 		throw "Cannot change the id";
	// 	}
	// 	_id = val;
	// 	return val;
	// }
	
	public function new ()
	{
		super();
		_resources = [];
		_defaultCenter = false;
	}
	
	override public function getCenter(index :Int, ?direction :Float=0.0) :XY
	{
		if (centers != null) {
			return centers[index];
		} else {
			return super.getCenter(index, direction);
		}
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		deleteFrames();
		_resources = null;
		id = null;
	}

	override function deleteFrames() :Void
	{
		super.deleteFrames();
		#if flash
		if (_sourceFrames != null) {
			for (frame in _sourceFrames) {
				frame.dispose();
			}
		}
		#end
		_sourceFrames = null;
	}
	
	override function get_sourceFrames() :Array<ImageData>
	{
		if (_sourceFrames != null) {
			return _sourceFrames;
		}
		if (_resources == null || _resources.length == 0) {
			return null;
		}
		org.transition9.util.Assert.isTrue(_resources.length > 0);
		
		var frames = [];
		var rm = context.getManager(IResourceManager);
		org.transition9.util.Assert.isNotNull(rm);
		for (rt in _resources) {
			var bd = rm.get(rt);
			org.transition9.util.Assert.isNotNull(bd);
			frames.push(bd);
		}
		
		return frames;
	}
	
	function get_resources () :Array<ResourceToken>
	{
		return _resources;
	}
	
	function set_resources (val :Array<ResourceToken>) :Array<ResourceToken>
	{
		deleteFrames();
		_resources = val;
		return val;
	}
	
	#if debug
	override public function toString () :String
	{
	    return org.transition9.util.StringUtil.objectToString(this, ["name"]);
	}
	#end
}
