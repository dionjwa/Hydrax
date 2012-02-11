/*******************************************************************************
 * PushButton Engine
 * Copyright (C) 2009 PushButton Labs, LLC
 * For more information see http ://www.pushbuttonengine.com
 * 
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D.flash.spritesheet;

import flash.display.MovieClip;

import com.pblabs.components.scene2D.spritesheet.BitmapListRenderer;

import org.transition9.util.BitmapUtil;

using Lambda;

using Std;

class MovieClipBitmapRenderer extends BitmapListRenderer
{
	public var clip :MovieClip;
	
	public function new() 
	{
		super();
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		clip = null;
	}
	
	public override function onFrame(dt :Float) :Void
	{
		if (clip != null) {
			if (bitmapList == null) {
				bitmapList = [];
			}
			if (bitmapList.length < clip.totalFrames) {
				clip.gotoAndStop(bitmapList.length + 1);
				bitmapList.push(BitmapUtil.createBitmapData(clip));
			} else {
				//Finished converting, discard the movieclip
				clip = null;
			}
		}
		super.onFrame(dt);
	}
	
}
