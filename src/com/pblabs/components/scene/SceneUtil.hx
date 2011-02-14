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
import com.pblabs.components.tasks.TaskComponentTicked;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IPBContext;
import com.pblabs.geom.Vector2;
using com.pblabs.engine.util.PBUtil;

enum SceneAlignment {
	BOTTOM_LEFT;
	BOTTOM_RIGHT;
	CENTER;
	TOP_LEFT;
	TOP_RIGHT;
}

class SceneUtil
{
	public static var DEFAULT_LAYER_NAME :String = "defaultLayer";
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

		
	public static function createBaseScene (context :IPBContext, ?addDefaultLayer :Bool = true) :BaseScene2DManager<Dynamic>
	{
		com.pblabs.util.Assert.isNotNull(context);
		
		var scene = context.addSingletonComponent(MANAGER_CLASS);
		context.registerManager(IScene2D, scene, null, true);
		context.registerManager(MANAGER_CLASS, scene, null, true);
	    com.pblabs.util.Assert.isNotNull(scene);
	    if (addDefaultLayer) {
	    	scene.addLayer(LAYER_CLASS, DEFAULT_LAYER_NAME);
	    }
	    return scene;
	}
	
	public static function createBaseSceneEntity (context :IPBContext, ?addTasks :Bool = true) :IEntity
	{
		var e :IEntity = context.allocate(IEntity);
		e.deferring = true;
		e.addComponent(context.allocate(Coordinates2D));
		e.addComponent(context.allocate(AlphaComponent));
		if (addTasks) {
			e.addComponent(context.allocate(TaskComponentTicked), com.pblabs.components.tasks.TaskComponent.NAME);
		}
		return e;
	}
	
	public static function setLocation (e :IEntity, x :Float, y :Float) :Void
	{
		com.pblabs.util.Assert.isNotNull(e);
		e.lookupComponent(Coordinates2D).setLocation(x, y);
	}
	
	public static function getLocation (e :IEntity) :Vector2
	{
		com.pblabs.util.Assert.isNotNull(e);
		return e.lookupComponent(Coordinates2D).point;
	}
	
	public static function setAngle (e :IEntity, angle :Float) :Void
	{
		e.lookupComponent(Coordinates2D).angle = angle;
	}
	
	public static function getWidth (e :IEntity) :Float
	{
	    com.pblabs.util.Assert.isNotNull(e.lookupComponentByType(BaseScene2DComponent));
	    return e.lookupComponentByType(BaseScene2DComponent).width;
	}
	
	public static function getHeight (e :IEntity) :Float
	{
	    com.pblabs.util.Assert.isNotNull(e.lookupComponentByType(BaseScene2DComponent));
	    return e.lookupComponentByType(BaseScene2DComponent).height;
	}
	
	
	/**
	 * Given an alignment constant from this class, calculate
	 * @param outPoint
	 * @param alignment
	 * @param sceneWidth
	 * @param sceneHeight
	 *
	 */
	public static function calculateOutPoint (outPoint :Vector2, alignment :SceneAlignment, sceneWidth :Float, sceneHeight :Float) :Vector2
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
		return outPoint;
	}
	
	public static function getAlignedPoint (scene :BaseScene2DManager<Dynamic>, borderAlignment :SceneAlignment) :Vector2
	{
		var alignment = scene.sceneAlignment;
		var sceneWidth = scene.sceneView.width;
		var sceneHeight = scene.sceneView.height;
		var borderPoint = new Vector2();
		switch (alignment) {
			case CENTER:
				switch (borderAlignment) {
					case CENTER:
						borderPoint.x = 0;
						borderPoint.y = 0;
					case TOP_LEFT:
						borderPoint.x = -sceneWidth / 2;
						borderPoint.y = -sceneHeight / 2;
					case TOP_RIGHT:
						borderPoint.x = sceneWidth / 2;
						borderPoint.y = -sceneHeight / 2;
					case BOTTOM_LEFT:
						borderPoint.x = -sceneWidth / 2;
						borderPoint.y = sceneHeight / 2;
					case BOTTOM_RIGHT:
						borderPoint.x = sceneWidth / 2;
						borderPoint.y = sceneHeight / 2;
					}
			case TOP_LEFT:
				switch (borderAlignment) {
					case CENTER:
						borderPoint.x = sceneWidth / 2;
						borderPoint.y = sceneHeight / 2;
					case TOP_LEFT:
						borderPoint.x = 0;
						borderPoint.y = 0;
					case TOP_RIGHT:
						borderPoint.x = sceneWidth;
						borderPoint.y = 0;
					case BOTTOM_LEFT:
						borderPoint.x = 0;
						borderPoint.y = sceneHeight;
					case BOTTOM_RIGHT:
						borderPoint.x = sceneWidth;
						borderPoint.y = sceneHeight;
					}
			case TOP_RIGHT:
				throw "Not implemented";
			case BOTTOM_LEFT:
				throw "Not implemented";
			case BOTTOM_RIGHT:
				throw "Not implemented";
		}
		return borderPoint;
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
