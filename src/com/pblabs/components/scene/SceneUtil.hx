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
import com.pblabs.components.spatial.SpatialComponent;
import com.pblabs.components.tasks.TaskComponentTicked;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.ObjectType;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.geom.Vector2;

import de.polygonal.motor2.geom.math.XY;

using com.pblabs.engine.util.PBUtil;
using com.pblabs.geom.VectorTools;

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

		
	public static function createBaseScene (context :IPBContext, ?name :String = null, ?addDefaultLayer :Bool = false) :BaseScene2DManager<Dynamic>
	{
		com.pblabs.util.Assert.isNotNull(context);
		
		var scene = context.addSingletonComponent(MANAGER_CLASS, name, true);
		//The spatial component is for panning control
		scene.owner.addComponent(context.allocate(SpatialComponent), SpatialComponent.NAME);
		scene.owner.deferring = false;
		context.registerManager(IScene2D, scene, name, true);
		context.registerManager(MANAGER_CLASS, scene, name, true);
	    com.pblabs.util.Assert.isNotNull(scene);
	    if (addDefaultLayer) {
	    	scene.addLayer(SceneUtil.DEFAULT_LAYER_NAME);
	    }
	    return scene;
	}
	
	public static function createBaseSceneEntity (context :IPBContext, ?addTasks :Bool = true) :IEntity
	{
		var e :IEntity = context.allocate(IEntity);
		e.deferring = true;
		e.addComponent(context.allocate(SpatialComponent), SpatialComponent.NAME);
		e.addComponent(context.allocate(AlphaComponent));
		if (addTasks) {
			e.addComponent(context.allocate(TaskComponentTicked), com.pblabs.components.tasks.TaskComponent.NAME);
		}
		return e;
	}
	
	public static function setLocation (e :IEntity, x :Float, y :Float) :Void
	{
		com.pblabs.util.Assert.isNotNull(e);
		e.lookupComponent(SpatialComponent).setLocation(x, y);
	}
	
	public static function getLocation (e :IEntity) :XY
	{
		com.pblabs.util.Assert.isNotNull(e);
		return e.lookupComponent(SpatialComponent).position;
	}
	
	public static function setAngle (e :IEntity, angle :Float) :Void
	{
		e.lookupComponent(SpatialComponent).angle = angle;
	}
	
	public static function getWidth (e :IEntity) :Float
	{
	    // com.pblabs.util.Assert.isNotNull(e.lookupComponentByType(BaseScene2DComponent));
	    return e.lookupComponentByType(SpatialComponent).worldExtents.intervalX;
	}
	
	public static function getHeight (e :IEntity) :Float
	{
	    // com.pblabs.util.Assert.isNotNull(e.lookupComponentByType(BaseScene2DComponent));
	    // return e.lookupComponentByType(BaseScene2DComponent).height;
	    return e.lookupComponentByType(SpatialComponent).worldExtents.intervalY;
	}
	
	
	/**
	 * Given an alignment constant from this class, calculate
	 * @param outPoint
	 * @param alignment
	 * @param sceneWidth
	 * @param sceneHeight
	 *
	 */
	public static function calculateOutPoint (outPoint :XY, alignment :SceneAlignment, sceneWidth :Float, sceneHeight :Float) :XY
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
	
	public static function getAlignedPoint (scene :BaseScene2DManager<Dynamic>, borderAlignment :SceneAlignment) :XY
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
	
	public static function translateScreenToWorld (sceneManager :BaseScene2DManager<Dynamic>, screen :XY) :XY
	{
		var viewOffset = new Vector2();
		calculateOutPoint(viewOffset, sceneManager.sceneAlignment, sceneManager.sceneView.width, sceneManager.sceneView.height);
		var p = screen.subtract(viewOffset).scale(1.0/sceneManager.zoom).rotate(-sceneManager.rotation).subtract(new Vector2(sceneManager.x, sceneManager.y));
		return p;
	}
	
	public static function translateWorldToScreen (sceneManager :BaseScene2DManager<Dynamic>, world :XY) :XY
	{
		var viewOffset = new Vector2();
		calculateOutPoint(viewOffset, sceneManager.sceneAlignment, sceneManager.sceneView.width, sceneManager.sceneView.height);
		var p = world.add(new Vector2(sceneManager.x, sceneManager.y)).rotate(sceneManager.rotation).scale(sceneManager.zoom).add(viewOffset);
		return p;
	}
	
	public static function getDisplayComponentUnderPoint (scene :BaseScene2DManager<Dynamic>, screenPoint :XY, mask :ObjectType) :BaseScene2DComponent<Dynamic>
	{
		var layerIndex :Int = scene.layerCount - 1;
		while (layerIndex >= 0) {
			var layer :BaseScene2DLayer<Dynamic, BaseScene2DComponent<Dynamic>> = scene.getLayerAt(layerIndex);
			layerIndex--;
			#if !editor
			if (layer.ignoreInput) {
				continue;
			}
			#end
			var dispIndex :Int = layer.children.length - 1;
			while (dispIndex >= 0) {
				if (layer.children[dispIndex].containsScreenPoint(screenPoint, mask)) {
					return layer.children[dispIndex];
				}
				dispIndex--;
			}
		}
		return null;
	}

	public static function updateIfUpdatable (obj :Dynamic) :Void
	{
		// if (Std.is(obj, ITickedObject)) {
		// 	cast(obj, ITickedObject).onTick(0);
		// }
		if (Std.is(obj, IAnimatedObject)) {
			cast(obj, IAnimatedObject).onFrame(0);
		}
	}
			
	
}
