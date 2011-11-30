package com.pblabs.components.scene2D.body;

import Type;

import haxe.serialization.Serialization;

import haxe.io.Bytes;

using Lambda;

using com.pblabs.util.IterUtil;

/**
  * Minimum data needed to store a sprite list.
  */
class SpriteSheetData
	#if nodejs
	implements haxe.rtti.Infos, implements SerializableDynamic
	#end
{
	/** Generated bitmaps maybe scaled to improve local resolution */
	public var scale :Float;
	/** Don't change once set */
	public var id :String;
	/** [frameLabel1, frame1, framelabel2, frame2, ...] */
	public var frameLabels :Array<Dynamic>;
	/** Base64 encoded */
	public var imageData :Array<String>;
	public var centers :Array<Float>;
	public var bounds :Array<Float>;
	
	public function new ()
	{
		scale = 1;
		imageData = [];
	}
	
	public function unload () :Void
	{
		frameLabels = null;
		imageData = null;
		centers = null;
		bounds = null;
	}
	
	// public function hxSerialize (s :haxe.Serializer) :Void 
	// {
	// 	s.serialize(scale);
	// 	s.serialize(id);
	// 	// s.serialize(com.pblabs.util.ds.MapUtil.toArray(frameLabels));
	// 	s.serialize(frameLabels);
	// 	s.serialize(centers == null ? null :centers.map(vector2Array).array());
	// 	s.serialize(bounds == null ? null :bounds.map(vector2Array).array());
	// 	s.serialize(imageData);
	// }
	
	// public function hxUnserialize (s :haxe.Unserializer) :Void 
	// {
	// 	scale = s.unserialize();
	// 	id = s.unserialize();
	// 	// frameLabels = cast com.pblabs.util.ds.MapUtil.fromArray(s.unserialize(), ValueType.TClass(String));
	// 	frameLabels = s.unserialize();
	// 	centers = flatArrayToXYArray(s.unserialize());
	// 	bounds = flatArrayToXYArray(s.unserialize());
	// 	imageData = s.unserialize();
	// }
	
	#if nodejs
	public function serializeDynamic () :Dynamic
	{
		var obj :Dynamic = {};
		obj.scale = scale;
		obj.id = id;
		// var self = this;
		obj.frameLabels = frameLabels;// == null ? null :com.pblabs.util.ds.MapUtil.toArray(frameLabels);
		obj.centers = centers.array();// == null ? null :centers.map(vector2Array).array();
		obj.bounds = bounds;// == null ? null :bounds.map(vector2Array).array();
		// obj.imageData = imageData;
		obj.imageData = imageData;
		// == null ? null :imageData.map(function (c :Bytes) :Array<Int> {
		// 	return c.getData();
		// }).array();
		return obj;
	}

	public function deserializeDynamic (from :Dynamic) :Void
	{
		id = from.id;
		scale = from.scale;
		var self = this;
		frameLabels = from.frameLabels;// == null ? null :cast com.pblabs.util.ds.MapUtil.fromArray(from.frameLabels, ValueType.TClass(String));
		// centers = flatArrayToXYArray(from.centers);
		// centers = null;
		// if (from.centers != null) {
		// 	centers = [];
		// 	var c :Array<Float> = from.centers;
		// 	// centers = c.map(array2XY).array();
		// 	for (v in c) {
		// 		centers.push(new com.pblabs.geom.Vector2(v[0], v[1]));
		// 	}
		// }
		
		// bounds = flatArrayToXYArray(from.bounds);
		// if (from.bounds != null) {
		// 	var c :Array<Float> = from.bounds;
		// 	// bounds = c.map(array2XY).array();
			
		// 	bounds = [];
		// 	var c :Array<Float> = from.bounds;
		// 	for (v in c) {
		// 		bounds.push(new com.pblabs.geom.Vector2(v[0], v[1]));
		// 	}
		// }
		
		// imageData = from.imageData;
		centers = from.centers;
		bounds = from.bounds;
		imageData = from.imageData;
		// if (from.imageData != null) {
		// 	var c :Array<Array<Int>> = from.imageData;
		// 	imageData = c.map(haxe.io.Bytes.ofData).array();
		// }
	}
	#end
	
	public function toString () :String
	{
		return "[SpriteSheetData scale=" + scale + ", id=" + id 
			+ ", centers=" + (centers != null ? centers.length  : null) 
			+ ", bounds=" + (bounds != null ? bounds.length : null)
			+ ", imageData=" + (imageData != null ? imageData.map(function (s) :String {
				return s.substr(0, 10);
				}).array().join("\n     ") : "null");
	}
	
	
}
