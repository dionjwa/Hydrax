/*******************************************************************************
* PushButton Engine
* Copyright (C) 2009 PushButton Labs, LLC
* For more information see http ://www.pushbuttonengine.com
*
* This file is licensed under the terms of the MIT license, which is included
* in the License.html file at the root directory of this SDK.
******************************************************************************/
package com.pblabs.components.scene2D.flash;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;

import flash.geom.Matrix;

using com.pblabs.util.DisplayUtils;

/**
 * A scene which draws to a BitmapData. Useful when you want to do
 * full screen pixel processing effects. 
 */
class BitmapDataScene extends com.pblabs.components.scene2D.flash.SceneManager 
{
	public function new() 
	{
		super();
		bitmap = new Bitmap();
		// _modifiers = new Array();
	}
	
	// public var modifiers(getModifiers, setModifiers) :Array<Dynamic>;
	// public var sceneView(null, setSceneView) :IUITarget;
	public var backbuffer :BitmapData;
	public var bitmap :Bitmap;
	
	/**
	 * Array with BitmapData modifiers that will be rendered 
	 */
	// public function getModifiers() :Array<Dynamic>{
	// 	return _modifiers;
	// }
	
	// public function setModifiers(value :Array<Dynamic>) :Array<Dynamic>{
	// 	_modifiers = value;
	// 	return value;
	// }
	
	// [EditorData(ignore="true")]
	// override function set_sceneView(value :SceneView) :SceneView
	// {
	// 	if(_sceneView != null) {
	// 		_sceneView.removeDisplayObject(bitmap);
	// 	}
		
	// 	_sceneView = value;
		
	// 	if(_sceneView != null) {
	// 		_sceneView.removeDisplayObject(_rootSprite);
	// 		var realRoot :Sprite = new Sprite();
	// 		realRoot.mouseEnabled = false;
	// 		realRoot.mouseChildren = false;
	// 		realRoot.addChild(_rootSprite);
	// 		_sceneView.addDisplayObject(bitmap);
	// 	}
	// 	return value;
   // }
	
	public override function onFrame(dt :Float) :Void
	{
		// Let things update.
		super.onFrame(dt);

		if(sceneView.width == 0 || sceneView.height == 0)
		{
			// Firefox 3 bug - we can get stageHeight/stageWidth of 0 which
			// trickles down and causes this problem. So if they are zero, 
			// just reassign to stageHeight/stageWidth.
			// com.pblabs.util.Log.warn(this, "onFrame", "Zero size sceneView! Resetting to stage size (" + PBE.mainStage.stageWidth + "x" + PBE.mainStage.stageHeight + ")");
			
			// if(PBE.mainStage.stageWidth == 0 || PBE.mainStage.stageHeight == 0)
			// {
			// 	com.pblabs.util.Log.warn(this, "onFrame", "Stage is also zero size! This might be a Firefox bug (see http ://bugs.adobe.com/jira/browse/FP-434).");
			// 	com.pblabs.util.Log.warn(this, "onFrame", "If it doesn't go away after a few frames, it is probably another issue.");
			// }
			
			// sceneView.width = PBE.mainStage.stageWidth;
			// sceneView.height = PBE.mainStage.stageHeight;
			
			return;
		}
		
		// Make sure back buffer is good.
		if(backbuffer == null 
			|| backbuffer.width != sceneView.width 
			|| backbuffer.height != sceneView.height)
		{
			backbuffer = new BitmapData(sceneView.width, sceneView.height);
			bitmap.bitmapData = backbuffer;
			bitmap.x = bitmap.y = 0;
			bitmap.width = sceneView.width;
			bitmap.height = sceneView.height;
		}
		
		// Clear
		backbuffer.lock();
		backbuffer.fillRect(backbuffer.rect, 0);
		
		// Now traverse everything and draw it!
		// TODO :Be friendly towards caching layers.
		var m :Matrix = new Matrix();
		for(layer in children) {
			
			for (d in layer.children) {
				var localMat :Matrix = d.displayObject.transform.matrix;
				m.a = localMat.a;
				m.b = localMat.b;
				m.c = localMat.c;
				m.d = localMat.d;
				m.tx = localMat.tx;
				m.ty = localMat.ty;
				m.concat(layer.displayContainer.transform.matrix);
				m.concat(_rootSprite.transform.matrix);
				
				if(Std.is(d, ICopyPixelsRenderer) && cast(d, ICopyPixelsRenderer).isPixelPathActive(m)) {
					cast(d, ICopyPixelsRenderer).drawPixels(m, backbuffer);
				} else {
					// Quoting docs regarding .draw(), the source display object does not use any of its applied transformations for this call. 
					// It is treated as it exists in the library or file, with no matrix transform, no color transform, and no blend mode. 
					backbuffer.draw(d.displayObject, m, d.displayObject.transform.colorTransform, d.displayObject.blendMode );
				}
			}
		}

		// if (modifiers.length>0)
		// {
		// 	for (var mo :Int = 0; mo<modifiers.length; mo++)
		// 		backbuffer = (cast(modifiers[mo], Modifier)).modify(backbuffer);				
		// }
		
		// backbuffer.noise(Std.int(haxe.Timer.stamp() * 1000));
		backbuffer.unlock();
		_tempBackBuffer = bitmap.bitmapData; 
		bitmap.bitmapData = backbuffer;
		backbuffer = _tempBackBuffer; 
		
		// com.pblabs.util.DebugUtil.traceDisplayChildren(flash.Lib.current.stage);
	}
	
	override function onAdd () :Void
	{
		super.onAdd();
		bitmap.name = name + ":Bitmap";
		context.getManager(SceneView).removeDisplayObject(displayContainer);
		context.getManager(SceneView).addDisplayObject(bitmap);
	}
	
	override function attach () :Void
	{
		com.pblabs.util.Assert.isNotNull(bitmap);
		com.pblabs.util.Assert.isNotNull(context, "How can the context be null??, name=" + name + ", isRegistered=" +isRegistered);
		if (bitmap.parent == null) {
			com.pblabs.util.Assert.isNotNull(context.getManager(SceneView), "No SceneView??");
			context.getManager(SceneView).addDisplayObject(bitmap);
		}
	}
	
	override function detach () :Void
	{
		if (bitmap.parent != null) {
			bitmap.detach();
		}
	}
	
	var _tempBackBuffer :BitmapData;
	
	// var _modifiers :Array<Dynamic>;
}
