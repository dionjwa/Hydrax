package com.pblabs.components.scene2D.body;

import org.transition9.ds.Map;

import de.polygonal.motor.geom.math.Vec2;

class BodySpriteList
	implements IBodySpriteList
{
	
	/** Generated bitmaps maybe scaled to improve local resolution */
	public var scale :Float;
	/** Don't change once set */
	/** This is not the global id, it is the state or action key */
	public var spriteSheetId :String;
	/** This is the global id */
	public var id :String;
	/** Maps a frame label to the frame number */
	public var frameLabels :Map<String, Int>;
	public var imageData :Array<ImageData>;
	public var centers :Array<Vec2>;
	
	public var isLoaded (get_isLoaded, never) :Bool;
	function get_isLoaded () :Bool
	{
		return imageData != null && imageData.length > 0;
	}
	
	public var frameCount (get_frameCount, null) :Int;
	function get_frameCount () :Int
	{
		return imageData != null ? imageData.length :0;
	}
	
	public function new (?spriteSheetId :String)
	{
		this.spriteSheetId = spriteSheetId;
		scale = 1.0;
		imageData = [];
		centers = [];
	}
	
	public function getFrame(index :Int, ?direction :Float = 0.0) :ImageData
	{
		return imageData != null ? imageData[index] :null; 
	}
	
	public function getCenter(index :Int, ?direction :Float = 0.0) :Vec2
	{
		return centers != null ? centers[index] :null;
	}
	
	public function toString () :String
	{
		return "[BodySpriteSheet scale=" + scale + ", spriteSheetId=" + spriteSheetId + ", id=" + id 
			+ ", centers=" + (centers != null ? centers.length : 0)
			+ ", frameLabels=" + (frameLabels != null ? frameLabels.size() : 0)
			+ ", imageData=" + (imageData != null ? imageData.length : 0);
	}
	
	// public function toString () :String
	// {
	// 	return org.transition9.util.StringUtil.stringify(this, ["id", "scale", "imageData"]);
	// }
	
	// public function from (sd :SpriteSheetData) :Void
	// {
	// 	for (ii in 0...sd.imageData.length) {
	// 		this.imageData[ii] = new ImageData(Std.int(sd.bounds[ii].x), Std.int(sd.bounds[ii].y));
	// 		this.imageData[ii].setPixels(new flash.geom.Rectangle(0, 0, Std.int(sd.bounds[ii].x), Std.int(sd.bounds[ii].y)), sd.imageData[ii]); 
	// 	}
	//	 this.centers = sd.centers;
	//	 this.scale = sd.scale;
	//	 this.frameLabels = sd.frameLabels;
	// }
	
	// public function copyFrom (sd :BodySpriteSheet) :Void
	// {
	// 	this.imageData = sd.imageData;
	// 	this.centers = sd.centers;
	// 	this.scale = sd.scale;
	// 	this.frameLabels = sd.frameLabels;
	// }

	public function unload () :Void
	{
		#if flash
		if (imageData != null) {
			for (bd in imageData) {
				bd.dispose();
			}
		}
		#end
		frameLabels = null;
		imageData = null;
		centers = null;
	}
}
