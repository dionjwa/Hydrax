/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.scene2D;

import com.pblabs.components.base.AlphaComponent;
import com.pblabs.components.spatial.SpatialComponent;
import com.pblabs.components.tasks.TaskComponentTicked;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.NameManager;
import com.pblabs.engine.core.ObjectType;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.geom.Vector2;

import de.polygonal.core.math.Mathematics;
import de.polygonal.motor2.geom.math.XY;

using com.pblabs.engine.util.PBUtil;
using com.pblabs.geom.VectorTools;

class SceneUtil
{
	public static var DEFAULT_LAYER_NAME :String = "defaultLayer";
	public static var SVG_NAMESPACE = "http://www.w3.org/2000/svg";
	
	public static var MANAGER_CLASS :Class<BaseSceneManager<Dynamic>> = 
		#if (flash || cpp)
		com.pblabs.components.scene2D.flash.SceneManager;
		#elseif js
		com.pblabs.components.scene2D.js.JSSceneManager;
		#else
		null;
		#end
		
		
	public static var LAYER_CLASS :Class<BaseSceneLayer<Dynamic, Dynamic>> = 
		#if (flash || cpp)
		com.pblabs.components.scene2D.flash.SceneLayer;
		#elseif js
		/**
		  * Note, this class should not be instantiated, use the subclasses instead.
		  */
		com.pblabs.components.scene2D.js.JSLayer;
		#else
		#error
		null;
		#end

	public static function createBaseScene (context :IPBContext, ?name :String = null, ?addDefaultLayer :Bool = false, 
		?registerAsManager :Bool = true, ?cls :Class<Dynamic>) :BaseSceneManager<Dynamic>
	{
		com.pblabs.util.Assert.isNotNull(context);
		var cls = cls == null ? MANAGER_CLASS : cls;
		var scene = cast(context.addSingletonComponent(cls, name, true), BaseSceneManager<Dynamic>);
		//The spatial component is for panning control
		scene.owner.addComponent(context.allocate(SpatialComponent), SpatialComponent.NAME);
		scene.owner.deferring = false;
		if (registerAsManager) {
			context.registerManager(IScene2D, scene, scene.name, true);
			context.registerManager(MANAGER_CLASS, scene, scene.name, true);
		}
		com.pblabs.util.Assert.isNotNull(scene);
		if (addDefaultLayer) {
			scene.addLayer(SceneUtil.DEFAULT_LAYER_NAME);
		}
		return scene;
	}
	
	public static function createBaseSceneEntity (context :IPBContext, ?addTasks :Bool = true, ?e :IEntity = null) :IEntity
	{
		if (e == null) {
			e = context.allocate(IEntity);
		}
		e.deferring = true;
		e.addComponent(context.allocate(SpatialComponent), SpatialComponent.NAME);
		// e.addComponent(context.allocate(AlphaComponent));
		if (addTasks) {
			e.addComponent(context.allocate(TaskComponentTicked), com.pblabs.components.tasks.TaskComponent.NAME);
		}
		return e;
	}
	
	public static function setLocation (e :IEntity, x :Float, y :Float) :IEntity
	{
		com.pblabs.util.Assert.isNotNull(e);
		e.getComponent(SpatialComponent).setLocation(x, y);
		return e;
	}
	
	public static function getLocation (e :IEntity) :XY
	{
		com.pblabs.util.Assert.isNotNull(e);
		return e.getComponent(SpatialComponent).position;
	}
	
	public static function setAngle (e :IEntity, angle :Float) :IEntity
	{
		e.getComponent(SpatialComponent).angle = angle;
		return e;
	}
	
	public static function getWidth (e :IEntity) :Float
	{
		// com.pblabs.util.Assert.isNotNull(e.getComponentByType(BaseSceneComponent));
		return e.getComponentByType(SpatialComponent).worldExtents.intervalX;
	}
	
	public static function getHeight (e :IEntity) :Float
	{
		// com.pblabs.util.Assert.isNotNull(e.getComponentByType(BaseSceneComponent));
		// return e.getComponentByType(BaseSceneComponent).height;
		return e.getComponentByType(SpatialComponent).worldExtents.intervalY;
	}
	
	
	/**
	 * Given an alignment constant from this class, calculate
	 * @param outPoint
	 * @param alignment
	 * @paramsceneWidth
	 * @paramsceneHeight
	 *
	 */
	public static function calculateOutPoint (outPoint :XY, alignment :SceneAlignment, sceneWidth :Float, sceneHeight :Float) :XY
	{
		com.pblabs.util.Assert.isNotNull(outPoint);
		com.pblabs.util.Assert.isNotNull(alignment);
		switch (alignment) {
			case CENTER :
				outPoint.x = sceneWidth * 0.5;
				outPoint.y = sceneHeight * 0.5;
			case TOP_LEFT :
				outPoint.x = outPoint.y = 0;
			case TOP_RIGHT :
				outPoint.x = sceneWidth;
				outPoint.y = 0;
			case BOTTOM_LEFT :
				outPoint.x = 0;
				outPoint.y = sceneHeight;
			case BOTTOM_RIGHT :
				outPoint.x = sceneWidth;
				outPoint.y = sceneHeight;
		}
		return outPoint;
	}
	
	public static function getAlignedPoint (scene :BaseSceneManager<Dynamic>, borderAlignment :SceneAlignment) :XY
	{
		var alignment = scene.sceneAlignment;
		var sceneWidth = scene.sceneView.width;
		var sceneHeight = scene.sceneView.height;
		var borderPoint = new Vector2();
		switch (alignment) {
			case CENTER :
				switch (borderAlignment) {
					case CENTER :
						borderPoint.x = 0;
						borderPoint.y = 0;
					case TOP_LEFT :
						borderPoint.x = -sceneWidth / 2;
						borderPoint.y = -sceneHeight / 2;
					case TOP_RIGHT :
						borderPoint.x = sceneWidth / 2;
						borderPoint.y = -sceneHeight / 2;
					case BOTTOM_LEFT :
						borderPoint.x = -sceneWidth / 2;
						borderPoint.y = sceneHeight / 2;
					case BOTTOM_RIGHT :
						borderPoint.x = sceneWidth / 2;
						borderPoint.y = sceneHeight / 2;
					}
			case TOP_LEFT :
				switch (borderAlignment) {
					case CENTER :
						borderPoint.x = sceneWidth / 2;
						borderPoint.y = sceneHeight / 2;
					case TOP_LEFT :
						borderPoint.x = 0;
						borderPoint.y = 0;
					case TOP_RIGHT :
						borderPoint.x = sceneWidth;
						borderPoint.y = 0;
					case BOTTOM_LEFT :
						borderPoint.x = 0;
						borderPoint.y = sceneHeight;
					case BOTTOM_RIGHT :
						borderPoint.x = sceneWidth;
						borderPoint.y = sceneHeight;
					}
			case TOP_RIGHT :
				throw "Not implemented";
			case BOTTOM_LEFT :
				throw "Not implemented";
			case BOTTOM_RIGHT :
				throw "Not implemented";
		}
		return borderPoint;
	}
	
	public static function translateScreenToWorld (sceneManager :BaseSceneManager<Dynamic>, screen :XY) :XY
	{
		var viewOffset = new Vector2();
		calculateOutPoint(viewOffset, sceneManager.sceneAlignment, sceneManager.sceneView.width, sceneManager.sceneView.height);
		return screen.subtract(viewOffset).scale(1.0 / sceneManager.zoom).rotate(sceneManager.rotation).subtract(new Vector2(sceneManager.x, sceneManager.y));
	}
	
	public static function translateWorldToScreen (sceneManager :BaseSceneManager<Dynamic>, world :XY) :XY
	{
		var viewOffset = new Vector2();
		calculateOutPoint(viewOffset, sceneManager.sceneAlignment, sceneManager.sceneView.width, sceneManager.sceneView.height);
		return world.add(new Vector2(sceneManager.x, sceneManager.y)).rotate(sceneManager.rotation).scale(sceneManager.zoom).add(viewOffset);
	}
	
	public static function getDisplayComponentUnderPoint (scene :BaseSceneManager<Dynamic>, screenPoint :XY, mask :ObjectType) :BaseSceneComponent<Dynamic>
	{
		var layerIndex :Int = scene.layerCount - 1;
		while (layerIndex >= 0) {
			var layer :BaseSceneLayer<Dynamic, BaseSceneComponent<Dynamic>> = scene.getLayerAt(layerIndex);
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
		if (Std.is(obj, IAnimatedObject)) {
			cast(obj, IAnimatedObject).onFrame(0);
		}
	}
	
	public static function setLayerColor (layer :BaseSceneLayer<Dynamic, Dynamic>, color :Int) :RectangleShape
	{
	    var background = createBaseSceneEntity(layer.context, false);
		var rect = layer.context.allocate(RectangleShape);
		rect.parentProperty = layer.entityProp();
		rect.width = layer.scene.sceneView.width;
		rect.height = layer.scene.sceneView.height;
		rect.fillColor = color;
		rect.borderStroke = 0;
		rect.borderColor = color;
		background.addComponent(rect);
		background.initialize(layer.context.getManager(NameManager).validateName("background"));
		
		var center = getAlignedPoint(layer.scene, SceneAlignment.CENTER);
		setLocation(background, center.x, center.y);
		
		return rect;
	}
	
	public static function addImage (layer :BaseSceneLayer<Dynamic, Dynamic>, resource :ResourceToken<Dynamic>) :BaseSceneComponent<Dynamic>
	{
		var e = layer.context.allocate(IEntity);
		var image = layer.context.allocate(com.pblabs.components.scene2D.ImageComponent);
		image.parentProperty = layer.entityProp();
		image.resource = resource;
		image.spatialProperty = null;
		
		e.addComponent(image);
		e.initialize(layer.context.getManager(NameManager).validateName("image" + image));
		
		var center = getAlignedPoint(layer.scene, SceneAlignment.CENTER);
		image.x = center.x;
		image.y = center.y;
		
		return image;
	}
	
	#if js
	/**
	  * Hacks to get the proper dimensions
	  */
	public static function getFullScreenDimensions (?landscape :Bool = false) :XY
	{
	    // trace('js.Lib.window.navigator.userAgent=' + js.Lib.window.navigator.userAgent);
	    var screen = js.Lib.window.screen;
		var width = screen.width;
		var height = screen.height;
		
		if (landscape) {
			width = Mathematics.max(screen.width, screen.height);
			height = Mathematics.min(screen.width, screen.height);
		} else {
			width = Mathematics.min(screen.width, screen.height);
			height = Mathematics.max(screen.width, screen.height);
		}
		
		if (js.Lib.window.navigator.userAgent.indexOf("iPhone") > -1) {
			if (js.Lib.window.navigator.userAgent.indexOf("iPhone OS 4") > -1) {
				//Retina display, double resolution
				width *= 2;
				height *= 2;
				height -= 40;
			} else {
				height -= 20;
			}
		}
		return new Vector2(width, height);
	}
	#end
	
	
}
