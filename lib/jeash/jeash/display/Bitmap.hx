/**
 * Copyright (c) 2010, Jeash contributors.
 * 
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 *   - Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   - Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

package jeash.display;

import flash.display.DisplayObject;
import flash.display.PixelSnapping;
import flash.geom.Rectangle;

class Bitmap extends jeash.display.DisplayObject {
	public var bitmapData(default,jeashSetBitmapData) : BitmapData;
	public var pixelSnapping : PixelSnapping;
	public var smoothing : Bool;

	var jeashGraphics:Graphics;

	public function new(?inBitmapData : BitmapData, ?inPixelSnapping : PixelSnapping, ?inSmoothing : Bool) : Void {
		super();
		pixelSnapping = inPixelSnapping;
		smoothing = inSmoothing;
		name = "Bitmap " + DisplayObject.mNameID++;

		if (inBitmapData != null)
			jeashSetBitmapData(inBitmapData);
		else
			jeashGraphics = new Graphics();

		Lib.jeashSetSurfaceId(jeashGraphics.mSurface, name);
	}

	public function jeashSetBitmapData(inBitmapData:BitmapData) : BitmapData
	{
		jeashInvalidateBounds();
		if (jeashIsOnStage()) {
			Lib.jeashAppendSurface(inBitmapData.graphics.mSurface, 0, 0);
			Lib.jeashSwapSurface(jeashGraphics.mSurface, inBitmapData.graphics.mSurface);
			Lib.jeashCopyStyle(jeashGraphics.mSurface, inBitmapData.graphics.mSurface);
			Lib.jeashRemoveSurface(jeashGraphics.mSurface);
		}
		bitmapData = inBitmapData;
		jeashGraphics = inBitmapData.graphics;
		return inBitmapData;
	}


	override function jeashGetGraphics() { return jeashGraphics; }
	
	override function BuildBounds()
	{
		super.BuildBounds();
				
		if(bitmapData!=null)
		{
			var r:Rectangle = new Rectangle(0, 0, bitmapData.width, bitmapData.height);		
			
			if (r.width!=0 || r.height!=0)
			{
				if (mBoundsRect.width==0 && mBoundsRect.height==0)
					mBoundsRect = r.clone();
				else
					mBoundsRect.extendBounds(r);
			}
		}
	}

}

