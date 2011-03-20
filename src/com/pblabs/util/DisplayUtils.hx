/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util;


import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Loader;
import flash.display.Sprite;

import flash.events.IOErrorEvent;

import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;

import flash.net.URLRequest;

import flash.text.TextField;
import flash.text.TextFieldAutoSize;

using Lambda;
using com.pblabs.util.ArrayUtil;
using com.pblabs.util.IterUtil;

class DisplayUtils
 {
	public static var BOTTOM_TO_TOP:Float = 3;
	public static var LEFT_TO_RIGHT:Float = 0;
	public static var RIGHT_TO_LEFT:Float = 1;
	public static var TOP_TO_BOTTOM:Float = 2;

	public static function isAbove (d1 :DisplayObject, d2 :DisplayObject) :Bool
	{
		//Break out early
		if (d1 == d2 || d1 == null || d2 == null || d1.parent == null || d2.parent == null) {
			return false;
		}
		
		var currentParent :DisplayObjectContainer = d1.parent;
		var parents1 :Array<DisplayObject> = [d1];
		//Craate the parentage chain for d1
		while(currentParent != null && currentParent != flash.Lib.current.stage) {
			parents1.push(currentParent);
			currentParent = currentParent.parent;
		}
		
		//Now go through d2, checking if the current parent is in the list
		currentParent = d2.parent;
		var lastCommonAncestorChildD2 :DisplayObject = d2;
		while(!parents1.has(currentParent)) {
			lastCommonAncestorChildD2 = currentParent; 
			currentParent = currentParent.parent;
		}
		
		//Now that that's done, the current parent is the last common ancestor
		var lastCommonAncestorChildD1 :DisplayObject = parents1[parents1.indexOf(currentParent) - 1];
		return currentParent.getChildIndex(lastCommonAncestorChildD1) > currentParent.getChildIndex(lastCommonAncestorChildD2); 
	}
	
	/**
	 * Variation of com.threerings.display.DisplayUtil.applyToHierarchy.
	 *
	 * Instead of stopping completely if the callback returns true, only
	 * stop delving into the display hierarchy, but keep applying to siblings.
	 *
	 * Call the specified function for the display object and all descendants.
	 *
	 * This is nearly exactly like mx.utils.DisplayUtil.walkDisplayObjects,
	 * except this method copes with security errors when examining a child.
	 *
	 * @param callbackFunction Signature:
	 * function (disp :DisplayObject) :void
	 *	or
	 * function (disp :DisplayObject) :Boolean
	 *
	 * If you return a Boolean, you may return <code>true</code> to indicate that you've
	 * found what you were looking for, and halt iteration.
	 *
	 * @return true if iteration was halted by callbackFunction returning true
	 */
	public static function applyToHierarchy (disp :DisplayObject,
		callbackFunction :Dynamic) :Bool
	{
		// halt iteration if callbackFunction returns true
		if (callbackFunction(disp)) {
			return true;
		}

		if (Std.is( disp, DisplayObjectContainer)) {
			var container:DisplayObjectContainer = cast( disp, DisplayObjectContainer);
			var nn = container.numChildren;
			for (ii in 0...nn) {
				try {
					disp = container.getChildAt(ii);
				} catch (err :Dynamic) {
					continue;
				}
				// and then we apply outside of the try/catch block so that
				// we don't hide errors thrown by the callbackFunction.
				applyToHierarchy(disp, callbackFunction);
			}
		}

		return false;
	}

	public static function boundsUnion (displayObjects :Array<Dynamic>, ?relativeTo :DisplayObject =
		null) :Rectangle
	{
		var bounds:Rectangle = null;
		for (disp in displayObjects) {
			var dispBounds:Rectangle =
				disp.getBounds(if(relativeTo == null) disp.stage else relativeTo);
			if (bounds != null) {
				bounds = bounds.union(dispBounds);
			} else {
				bounds = dispBounds;
			}
		}
		return bounds;
	}

	public static function centerOn (d :DisplayObject, ?x :Float = 0, ?y :Float = 0) :DisplayObject
	{
		var bounds:Rectangle;
		if (d.parent != null) {
			#if flash
			bounds = d.getBounds(d.parent != null ? d.parent : d);
			#elseif cpp
			bounds = d.nmeGetPixelBounds();
			#end
			var boundsCenterX = bounds.left + bounds.width / 2;
			var xDiff = d.x - boundsCenterX;
			d.x = x + xDiff;

			var boundsCenterY = bounds.top + bounds.height / 2;
			var yDiff = d.y - boundsCenterY;
			d.y = y + yDiff;
		} else { //If we're not attached to a parent yet, centering will be ok unless
			//the displayObject is scaled
			d.x = x;
			d.y = y;
			#if flash
			bounds = d.getBounds(d);
			#elseif cpp
			bounds = d.nmeGetPixelBounds();
			#end
			d.x -= (bounds.width / 2) + bounds.left;
			d.y -= (bounds.height / 2) + bounds.top;
		}
		return d;
	}

	/**
	 * Converts any DisplayObject into a Bitmap.  This can increase the graphical
	 * performance of complex MovieClips.
	 */
	public static function convertToBitmap (d :DisplayObject, ?scale :Float = 1) :Bitmap
	{
		if (d == null) {
			return null;
		}

		#if flash
		var bounds = d.getBounds(d);
		#elseif cpp
		var bounds = d.nmeGetPixelBounds();
		#end
		if (bounds.width <= 0 && bounds.height <= 0) {
			Log.error(["d", d, "d.name", d.name, "bounds", bounds]);
			return null;
		}

		if (Std.int(bounds.width) <= 0 || Std.int(bounds.height) <= 0) {
			Log.error(["int(bounds.width)", Std.int(bounds.width),
				"int(bounds.height)", Std.int(bounds.height)]);
			return null;
		}
		var bd = new BitmapData(Std.int(bounds.width * scale), Std.int(bounds.height * scale),
			true, 0xffffff);

		bd.draw(d, new Matrix(scale, 0, 0, scale, -bounds.left * scale, -bounds.top * scale));

		var bm:Bitmap = new Bitmap(bd);
		return bm;
	}

	public static function detach (d :DisplayObject) :Void
	{
		if (d != null && d.parent != null) {
			d.parent.removeChild(d);
		}
	}

	public static function distribute (seq :Array<Dynamic>, startX :Float, startY :Float, endX :Float,
		endY :Float) :Void
	{
		if (seq == null || seq.length == 0) {
			return;
		}

		var xInc = (endX - startX) / (seq.length + 1);
		startX += xInc / 2;
		var yInc = (endY - startY) / (seq.length + 1);
		startY += yInc / 2;

		for (ii in 0...seq.length) {
			centerOn(seq[ii], startX + ii * xInc, startY + ii * yInc);
		}
	}

	public static function distributeChildrenVertically (disp :DisplayObject, ?startTop :Float =
		0, gap :Float = 0) :Void
	{
		if (!(Std.is( disp, DisplayObjectContainer))) {
			return;
		}

		var container = cast(disp, DisplayObjectContainer);
		var bounds:Rectangle;
		var child:DisplayObject;
		for (ii in 0...container.numChildren) {
			child = cast( container.getChildAt(ii), DisplayObject);
			setTopLeft(child, child.x, startTop);
			startTop += child.height + gap;
		}
	}
	
	public static function setTopLeft (disp :DisplayObject, x :Float = 0, y :Float = 0) :Void
	{
		if (disp.parent == null) {
			throw "Cannot place a DisplayObject without a parent";
		}
		#if flash
		var bounds = disp.getBounds(disp.parent);
		#elseif cpp
		var bounds = disp.nmeGetPixelBounds();
		#end
		disp.x = x - bounds.left;
		disp.y = y - bounds.top;
	}

	public static function distributionPoint (index :Float, length :Float, startX :Float, startY :Float,
		endX :Float, endY :Float) :Point
	{
		var xInc = (endX - startX) / (length + 1);
		startX += xInc;
		var yInc = (endY - startY) / (length + 1);
		startY += yInc;
		return new Point(startX + index * xInc, startY + index * yInc);
	}



	public static function getBoundsCenter (d :DisplayObject) :Point
	{
		#if flash
		var bounds = d.getBounds(d);
		#elseif cpp
		var bounds = d.nmeGetPixelBounds();
		#end
		return new Point(bounds.left + bounds.width / 2, bounds.top + bounds.height / 2);
	}

	public static function getBoundsCenterRelativeTo (d :DisplayObject,
		relativeTo :DisplayObject) :Point
	{
		#if flash
		var bounds = d.getBounds(relativeTo);
		#elseif cpp
		var bounds = d.nmeGetPixelBounds();
		#end
		return new Point(bounds.left + bounds.width / 2, bounds.top + bounds.height / 2);
	}

	public static function getCenterOffset (d :DisplayObject) :Point
	{
		return getCenterOffsetRelativeTo(d, d);
	}

	public static function getCenterOffsetRelativeTo (d :DisplayObject,
		relativeTo :DisplayObject) :Point
	{
		#if flash
		var bounds = d.getBounds(relativeTo);
		#elseif cpp
		var bounds = d.nmeGetPixelBounds();
		#end
		var centerX:Float = bounds.left + bounds.width / 2;
		var centerY:Float = bounds.top + bounds.height / 2;

		return new Point(centerX - d.x, centerY - d.y);
	}

	public static function getChildren (d :DisplayObjectContainer) :Array<Dynamic>
	{
		var children:Array<Dynamic> = [];

		if (d == null) {
			return children;
		}

		for (ii in 0...d.numChildren) {
			if (d.getChildAt(ii) != null) {
				children.push(d.getChildAt(ii));
			}
		}
		return children;
	}

	public static function getChildNamed (parent :DisplayObjectContainer, name :String) :DisplayObject
	{
		var namedChild :DisplayObject = null;
		var getname = function (d :DisplayObject) :Bool {
			if (d.name == name) {
				namedChild = d;
				return true;
			}
			return false;
		}
		com.pblabs.util.DisplayUtils.applyToHierarchy(parent, getname);
		return namedChild;
	}
	
	public static function getGlobalScale (d :DisplayObject, ?currentScale :Float = 1) :Float
	{
		if (d == null || d.stage == null || d == d.stage) {
			return currentScale;
		} else {
			return getGlobalScale(d.parent, d.scaleX * currentScale);
		}
	}

	#if flash
	public static function loadBitmapFromUrl (url :String, ?loadedBitmapDataCallback :Dynamic =
		null) :Bitmap
	{
		if (url == null) {
			return null;
		}

		var bm:Bitmap = new Bitmap();
		try {
			var imageLoader = new Loader();
			var loaderContext = new flash.system.LoaderContext();
			loaderContext.checkPolicyFile = true;

			function () :Void {
				if (imageLoader.content != null && Std.is( imageLoader.content, DisplayObject)) {
					var bd:BitmapData = createBitmapData(cast( imageLoader.content, DisplayObject));
					bm.bitmapData = bd;
					if (loadedBitmapDataCallback != null) {
						loadedBitmapDataCallback(bd);
					}
				}
			}

			var request:URLRequest = new URLRequest(url);
			trace("Not implemented");
			// imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,
			//	 F.justOnce(F.callback_(onComplete)));
			// imageLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,
			//	 function (ignored:Array<Dynamic>) :Void {
			//		 Log.error("URL not found: " + url);
			//	 });
			imageLoader.load(request, loaderContext);

		} catch (err :IOErrorEvent) {
			Log.error("URL not found: " + url);
		}

		return bm;
	}
	

	/**
	 * From a list of DisplayObjects on the stage, create a combined bitmap, with a
	 * layer order of the supplied array.
	 */
	public static function mergeDisplayObjects (dos :Array<Dynamic>, ?scale :Float = 1,
		?preserveBounds :Bool = false) :Bitmap
	{
		if (dos == null || dos.length == 0) {
			return null;
		}
		//		trace("mergeDisplayObjects, scale=" + scale);
		var bounds:Rectangle = null;
		var stageBounds:Rectangle;
		var disp:DisplayObject;
		var origins:Array<Dynamic> = [];
		var origin:Point;
		for (disp in dos) {
			stageBounds = disp.getBounds(disp.stage);
			origins.push(new Point(stageBounds.left, stageBounds.top));
			if (bounds != null) {
				bounds = bounds.union(stageBounds);
			} else {
				bounds = stageBounds;
			}
		}

		var bd:BitmapData = new BitmapData(cast(bounds.width * scale), cast(bounds.height * scale),
			true, 0xffffff);
		var topLeft:Point = new Point(bounds.left, bounds.top);

		for (ii in 0...dos.length) {
			disp = cast( dos[ii], DisplayObject);
			origin = cast( origins[ii], Point);
			var localBounds:Rectangle = disp.getBounds(disp);
			//			bd.draw(disp, new Matrix(1, 0, 0, 1, -localBounds.left + (origin.x - topLeft.x),
			//				-localBounds.top + (origin.y - topLeft.y)));
			bd.draw(disp, new Matrix(scale, 0, 0, scale,
				scale * (-localBounds.left + (origin.x - topLeft.x)),
				scale * (-localBounds.top + (origin.y - topLeft.y))));
		}

		var bm:Bitmap = new Bitmap(bd);
		return bm;
	}
	#end

	public static function placeSequence (parent :DisplayObjectContainer, seq :Array<Dynamic>, startX :Float,
		startY :Float, ?direction :Float = 0, ?gap :Float = 5, ?center :Bool = true) :Void
	{
		if (seq == null || seq.length == 0 || parent == null) {
			return;
		}

		for (d in seq) {
			if (d == null) {
				continue;
			}
			parent.addChild(d);

			var xAdjust:Float = 0;
			var yAdjust:Float = 0;

			if (center) {
				if (direction == LEFT_TO_RIGHT) {
					xAdjust = d.width / 2;

				} else if (direction == RIGHT_TO_LEFT) {
					xAdjust = -d.width / 2;
				} else if (direction == TOP_TO_BOTTOM) {
					yAdjust = d.height / 2;
				} else if (direction == BOTTOM_TO_TOP) {
					yAdjust = -d.height / 2;
				}
				centerOn(d, startX + xAdjust, startY + yAdjust);
			} else {
				d.x = startX + xAdjust;
				d.y = startY + yAdjust;
			}

			if (direction == LEFT_TO_RIGHT) {
				startX += d.width + gap;

			} else if (direction == RIGHT_TO_LEFT) {
				startX += -(d.width + gap);
			} else if (direction == TOP_TO_BOTTOM) {
				startY += d.height + gap;
			} else if (direction == BOTTOM_TO_TOP) {
				startY += -(d.height + gap);
			}
		}
	}

	public static function removeAllChildren (parent :DisplayObject) :Void
	{
		if (parent == null || !(Std.is( parent, DisplayObjectContainer))) {
			return;
		}
		while (cast(parent, DisplayObjectContainer).numChildren > 0) {
			cast(parent, DisplayObjectContainer).removeChildAt(0);
		}
	}

	/**
	 * Creates a bitmap from the given DisplayObject, and positions the bitmap so that it is
	 * visually in the same position as the argument.
	 */
	 #if flash
	 public static function screenShot (disp :DisplayObject) :Bitmap
	 {
		if (disp == null || disp.stage == null) {
			Log.error(["d", disp, "d.stage", disp == null ? null : disp.stage]);
			return null;
		}
		
		var scale:Float = getGlobalScale(disp, 1);
		var bd:BitmapData = new BitmapData(Std.int(disp.stage.stageWidth), Std.int(disp.stage.stageHeight), true,
		0xffffff);
		
		var stageBounds = disp.getBounds(disp.stage);
		
		var origin:Point = new Point(stageBounds.left, stageBounds.top);
		var localBounds:Rectangle = disp.getBounds(disp);
		var topLeft:Point = new Point(0, 0);
		bd.draw(disp, new Matrix(scale, 0, 0, scale,
		scale * (-localBounds.left + (origin.x - topLeft.x)),
		scale * (-localBounds.top + (origin.y - topLeft.y))));
		
		var bm:Bitmap = new Bitmap(bd);
		return bm;
	 }
	 #end
	 
	public static function shrinkAndCenterOn (disp :DisplayObject, ?maxSize :Float = 20) :DisplayObject
	{
		if (maxSize > 0) {
			var max = Math.max(disp.width, disp.height);
			if (max > maxSize) {
				disp.scaleX = disp.scaleY = maxSize / max;
			}
		}
		var s:Sprite = new Sprite();
		s.addChild(disp);
		DisplayUtils.centerOn(disp);
		return s;
	}

	/**
	 * Creates a bitmap from the given DisplayObject, and positions the bitmap so that it is
	 * visually in the same position as the argument.  Optionally supply a resolution scale
	 * factor, so if parent container is scaled, the Bitmap won't be pixellated.
	 */
	#if flash 
	public static function substituteBitmap (d :DisplayObject, ?resolutionFactor :Float = 1) :Bitmap
	{
		if (d == null) {
			return null;
		}
		var bm:Bitmap = convertToBitmap(d, resolutionFactor);
		if (bm == null) {
			Log.error(["d", d, "resolutionFactor", resolutionFactor, "bm", bm]);
			return null;
		}

		bm.scaleX = bm.scaleY = 1 / resolutionFactor;

		var bounds:Rectangle = d.getBounds(d);

		//Center it according to the offsets.
		bm.x = bounds.left;
		bm.y = bounds.top;

		return bm;
	}
	#end

	#if flash
	static function createBitmapData (disp :DisplayObject, ?width :Float = -1, ?height :Float =
		-1, ?uniformScale :Bool = true) :BitmapData
	{
		var bounds:Rectangle = disp.getBounds(disp);

		if (width < 0) {
			width = bounds.width;
		}
		if (height < 0) {
			height = bounds.height;
		}

		var scaleX:Float = width / bounds.width;
		var scaleY:Float = height / bounds.height;
		if (uniformScale) {
			scaleX = scaleY = Math.min(scaleX, scaleY);
		}

		var bd:BitmapData = new BitmapData(cast(width), cast(height), true, 0);
		bd.draw(disp, new Matrix(scaleX, 0, 0, scaleY, -bounds.x * scaleX, -bounds.y * scaleY));
		return bd;
	}
	#end
}


