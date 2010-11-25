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
import com.pblabs.components.base.AngleComponent;
import com.pblabs.components.base.LocationComponent;
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
	
	public static function getPlatformSceneManagerClass () :Class<BaseScene2DManager<Dynamic>>
	{
		#if (flash || cpp)
		return com.pblabs.components.scene.flash.Scene2DManager;
		#elseif css
		return com.pblabs.components.scene.js.css.SceneManager;
		#elseif js
		return com.pblabs.components.scene.js.canvas.CanvasScene2D;
		#else
		return null;
		#end
	}
	
	public static function getBasePlatformLayerClass () :Class<BaseScene2DLayer<Dynamic, Dynamic>>
	{
		#if (flash || cpp)
		return com.pblabs.components.scene.flash.SceneLayer;
		#elseif css
		return com.pblabs.components.scene.js.css.SceneLayer;
		#elseif js
		return com.pblabs.components.scene.js.canvas.CanvasLayer;
		#else
		return null;
		#end
	}
	
	
	public static function createBaseSceneEntity (context :IPBContext, name :String) :IEntity
	{
		var e :IEntity = context.allocate(IEntity);
		e.initialize(name);
		
		e.deferring = true;
		
		e.addComponent(context.allocate(LocationComponent));
		e.addComponent(context.allocate(AlphaComponent));
		e.addComponent(context.allocate(AngleComponent));
		e.addComponent(context.allocate(TaskComponent));
		
		e.deferring = false;
		
		return e;
	}
	
	public static function setLocation (e :IEntity, x :Float, y :Float) :Void
	{
		e.lookupComponent(LocationComponent).setLocation(x, y);
	}
	
	public static function setAngle (e :IEntity, angle :Float) :Void
	{
		e.lookupComponent(AngleComponent).angle = angle;
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
		var p = screen.subtract(viewOffset).scale(1/sceneManager.zoom).rotate(-sceneManager.rotation).subtract(new Vector2(sceneManager.x, sceneManager.y));
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
