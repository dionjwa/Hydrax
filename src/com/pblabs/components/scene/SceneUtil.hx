/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene;

import com.pblabs.components.base.AlphaComponent;
import com.pblabs.components.base.Coordinates2D;
import com.pblabs.components.tasks.TaskComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IPBContext;
import com.pblabs.geom.Vector2;

enum SceneAlignment {
	BOTTOM_LEFT;
	BOTTOM_RIGHT;
	CENTER;
	TOP_LEFT;
	TOP_RIGHT;
}

class SceneUtil
{
	public static var MANAGER_CLASS :Class<BaseScene2DManager<Dynamic>> = 
		#if (flash || cpp)
		com.pblabs.components.scene.flash.Scene2DManager;
		#elseif css
		com.pblabs.components.scene.js.css.SceneManager;
		#elseif js
		com.pblabs.components.scene.js.canvas.CanvasScene2D;
		#else
		null;
		#end
		
		
	public static var LAYER_CLASS :Class<BaseScene2DLayer<Dynamic, Dynamic>> = 
		#if (flash || cpp)
		com.pblabs.components.scene.flash.SceneLayer;
		#elseif css
		com.pblabs.components.scene.js.css.SceneLayer;
		#elseif js
		com.pblabs.components.scene.js.canvas.CanvasLayer;
		#else
		null;
		#end
	
	public static function createBaseSceneEntity (context :IPBContext) :IEntity
	{
		var e :IEntity = context.allocate(IEntity);
		e.deferring = true;
		e.addComponent(context.allocate(Coordinates2D));
		e.addComponent(context.allocate(AlphaComponent));
		e.addComponent(context.allocate(TaskComponent));
		return e;
	}
	
	public static function setLocation (e :IEntity, x :Float, y :Float) :Void
	{
		e.lookupComponent(Coordinates2D).setLocation(x, y);
	}
	
	public static function setAngle (e :IEntity, angle :Float) :Void
	{
		e.lookupComponent(Coordinates2D).angle = angle;
	}
	
	/**
	 * Given an alignment constant from this class, calculate
	 * @param outPoint
	 * @param alignment
	 * @param sceneWidth
	 * @param sceneHeight
	 *
	 */
	public static function calculateOutPoint (outPoint :Vector2, alignment :SceneAlignment, sceneWidth :Float, sceneHeight :Float) :Void
	{
		switch (alignment) {
			case CENTER:
				outPoint.x = sceneWidth * 0.5;
				outPoint.y = sceneHeight * 0.5;
			case TOP_LEFT:
				outPoint.x = outPoint.y = 0;
			case TOP_RIGHT:
				outPoint.x = sceneWidth;
				outPoint.y = 0;
			case BOTTOM_LEFT:
				outPoint.x = 0;
				outPoint.y = sceneHeight;
			case BOTTOM_RIGHT:
				outPoint.x = sceneWidth;
				outPoint.y = sceneHeight;
		}
	}
	
	public static function translateScreenToWorld (sceneManager :BaseScene2DManager<Dynamic>, screen :Vector2) :Vector2
	{
		var viewOffset = new Vector2();
		calculateOutPoint(viewOffset, sceneManager.sceneAlignment, sceneManager.sceneView.width, sceneManager.sceneView.height);
		var p = screen.subtract(viewOffset).scale(1.0/sceneManager.zoom).rotate(-sceneManager.rotation).subtract(new Vector2(sceneManager.x, sceneManager.y));
		return p;
	}
	
	/** UNTESTED */
	public static function translateWorldToScreen (sceneManager :BaseScene2DManager<Dynamic>, world :Vector2) :Vector2
	{
		var viewOffset = new Vector2();
		calculateOutPoint(viewOffset, sceneManager.sceneAlignment, sceneManager.sceneView.width, sceneManager.sceneView.height);
		var p = world.add(new Vector2(sceneManager.x, sceneManager.y)).rotate(sceneManager.rotation).scale(sceneManager.zoom).add(viewOffset);
		return p;
	}
	
}
