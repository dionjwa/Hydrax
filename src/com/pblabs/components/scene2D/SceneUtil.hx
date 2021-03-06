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
import com.pblabs.components.Constants;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.NameManager;
import com.pblabs.engine.core.ObjectType;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.engine.time.IAnimatedObject;

import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.Vec2;

using com.pblabs.engine.util.PBUtil;
using org.transition9.geom.Vec2Tools;

class SceneUtil
{
	#if (js && !spaceport)
	inline public static function applyTransform (element :js.Dom.HtmlDom, transform :flash.geom.Matrix) :Void
	{
		if (SceneView.isWebkitBrowser) {
			untyped element.style.webkitTransform = transform.toString();
		} else {
			untyped element.style.MozTransform = transform.toMozString();
		}
	}
	#end
	
	
	public static var MANAGER_CLASS :Class<BaseSceneManager> = 
		#if (flash || cpp || spaceport)
		com.pblabs.components.scene2D.flash.SceneManager;
		// com.pblabs.components.scene2D.flash.BitmapDataScene;
		#elseif js
		com.pblabs.components.scene2D.js.JSSceneManager;
		#else
		null;
		#end
		
		
	public static var LAYER_CLASS :Class<BaseSceneLayer> = 
		#if (flash || cpp || spaceport)
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
		?registerAsManager :Bool = true, ?cls :Class<Dynamic>) :BaseSceneManager
	{
		org.transition9.util.Assert.isNotNull(context);
		var cls = cls == null ? MANAGER_CLASS : cls;
		var scene = cast(context.addSingletonComponent(cls, name, true), BaseSceneManager);
		//The spatial component is for panning control
		scene.owner.addComponent(context.allocate(SpatialComponent), Constants.SPATIAL_NAME);
		scene.owner.deferring = false;
		if (registerAsManager) {
			context.registerManager(IScene2D, scene, scene.name, true);
			context.registerManager(MANAGER_CLASS, scene, scene.name, true);
		}
		org.transition9.util.Assert.isNotNull(scene);
		if (addDefaultLayer) {
			scene.addLayer(SceneConstants.DEFAULT_LAYER_NAME);
		}
		return scene;
	}
	
	public static function createBaseSceneEntity (context :IPBContext, ?addTasks :Bool = true, ?e :IEntity = null) :IEntity
	{
		if (e == null) {
			e = context.allocate(IEntity);
		}
		e.deferring = true;
		e.addComponent(context.allocate(SpatialComponent), Constants.SPATIAL_NAME);
		if (addTasks) {
			e.addComponent(context.allocate(TaskComponentTicked), com.pblabs.components.tasks.TaskComponent.NAME);
		}
		return e;
	}
	
	public static function addSceneComponent (e :IEntity, compClass :Class<Dynamic>, 
		layer :BaseSceneLayer, ?entityName :String) :IEntity
	{
		org.transition9.util.Assert.isNotNull(e, ' e is null');
		org.transition9.util.Assert.isNotNull(compClass, ' compClass is null');
		org.transition9.util.Assert.isNotNull(layer, ' layer is null');
		var sc :BaseSceneComponent = e.context.allocate(compClass);
		sc.parentProperty = layer.entityProp();
		e.addComponent(sc, entityName);
		return e;
	}
	
	public static function setLocation (e :IEntity, x :Float, y :Float) :IEntity
	{
		org.transition9.util.Assert.isNotNull(e);
		e.getComponent(SpatialComponent).setLocation(x, y);
		return e;
	}
	
	public static function setSceneAlignment (e :IEntity, a :SceneAlignment, ?layer :BaseSceneLayer) :IEntity
	{
		if (layer == null) {
			var sc = e.getComponent(BaseSceneComponent);
			org.transition9.util.Assert.isNotNull(sc, ' sc is null');
			layer = sc.layer;
		}
		org.transition9.util.Assert.isNotNull(e.getComponent(SpatialComponent), ' e.getComponent(SpatialComponent) is null');
		var p = getAlignedPoint(layer.scene, a);
		e.getComponent(SpatialComponent).setLocation(p.x, p.y);
		return e;
	}
	
	public static function getLocation (e :IEntity) :Vec2
	{
		org.transition9.util.Assert.isNotNull(e);
		return e.getComponent(SpatialComponent).position;
	}
	
	public static function getAngle (e :IEntity) :Float
	{
		return e.getComponent(SpatialComponent).angle;
	}
	
	public static function setAngle (e :IEntity, angle :Float) :IEntity
	{
		e.getComponent(SpatialComponent).angle = angle;
		return e;
	}
	
	public static function setObjectMask (e :IEntity, mask :ObjectType) :IEntity
	{
		for (sc in e.getComponents(BaseSceneComponent)) {
			sc.objectMask = mask;
		}
		return e;
	}
	
	public static function setScale (e :IEntity, scaleX :Float, scaleY :Float) :IEntity
	{
		for (c in e.getComponents(BaseSceneComponent)) {
			c.scaleX = scaleX;
			c.scaleY = scaleY;
		}
		return e;
	}
	
	public static function getScale (e :IEntity) :Vec2
	{
		var comp = e.getComponent(BaseSceneComponent);
		var scale = new Vec2(1, 1);
		if (comp != null) {
			scale.x = comp.scaleX;
			scale.y = comp.scaleY;
		}
		return scale;
	}
	
	public static function getWidth (e :IEntity) :Float
	{
		return e.getComponent(SpatialComponent).worldExtents.intervalX;
	}
	
	public static function getHeight (e :IEntity) :Float
	{
		return e.getComponent(SpatialComponent).worldExtents.intervalY;
	}
	
	public static function setHeight (e :IEntity, val :Float) :IEntity
	{
		for (c in e.getComponents(BaseSceneComponent)) {
			c.height = val; 
		}
		return e;
	}
	
	public static function setWidth (e :IEntity, val :Float) :IEntity
	{
		for (c in e.getComponents(BaseSceneComponent)) {
			c.width = val; 
		}
		return e;
	}
	
	public static function fitDimensions (e :IEntity, width :Float, height :Float) :IEntity
	{
		var maxWidth = 0.0;
		var maxHeight = 0.0;
		for (c in e.getComponents(BaseSceneComponent)) {
			maxWidth = Math.max(c.width / c.scaleX, maxWidth);
			maxHeight = Math.max(c.height / c.scaleY, maxHeight);
		}
		
		var minScale = Math.min(width / maxWidth, height / maxHeight);
		
		for (c in e.getComponents(BaseSceneComponent)) {
			c.scaleX = minScale;
			c.scaleY = minScale;
		}
		return e;
	}
	
	public static function stretchToFit (e :IEntity, width :Float, height :Float) :IEntity
	{
		var maxWidth = 0.0;
		var maxHeight = 0.0;
		for (c in e.getComponents(BaseSceneComponent)) {
			maxWidth = Math.max(c.width / c.scaleX, maxWidth);
			maxHeight = Math.max(c.height / c.scaleY, maxHeight);
		}
		
		var scaleX = width / maxWidth;
		var scaleY = height / maxHeight;
		
		for (c in e.getComponents(BaseSceneComponent)) {
			c.scaleX = scaleX;
			c.scaleY = scaleY;
		}
		return e;
	}
	
	public static function getAlignedPoint (scene :BaseSceneManager, borderAlignment :SceneAlignment) :Vec2
	{
		var alignment = scene.sceneAlignment;
		var sceneWidth = scene.sceneView.width;
		var sceneHeight = scene.sceneView.height;
		var borderPoint = new Vec2();
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
					case TOP_CENTER :
						borderPoint.x = 0;
						borderPoint.y = -sceneHeight / 2;
					default :
						throw "Not implemented";
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
					case TOP_CENTER :
						borderPoint.x = sceneWidth / 2;
						borderPoint.y = 0;
					default :
						throw "Not implemented";
					}
			default :
				throw "Not implemented";
		}
		return borderPoint;
	}
	
	public static function getDisplayComponentUnderPoint (scene :BaseSceneManager, screenPoint :Vec2, mask :ObjectType) :BaseSceneComponent
	{
		var layerIndex :Int = scene.layerCount - 1;
		while (layerIndex >= 0) {
			var layer :BaseSceneLayer = scene.getLayerAt(layerIndex);
			layerIndex--;
			if (!layer.objectMask.and(mask)) {
				continue;
			}
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
	
	public static function update (e :IEntity) :IEntity
	{
		for (c in e.getComponents(IAnimatedObject)) {
			cast(c, IAnimatedObject).onFrame(0);
		}
		return e;
	}
	
	#if flash
	public static function setLayerColor (layer :BaseSceneLayer, color :Int) :RectangleShape
	{
		var background = createBaseSceneEntity(layer.context, false);
		var rect = layer.context.allocate(RectangleShape);
		rect.parentProperty = layer.entityProp();
		rect.width = layer.scene.sceneView.width;
		rect.height = layer.scene.sceneView.height;
		rect.fillColor = color;
		rect.lineStroke = 0;
		rect.lineColor = color;
		background.addComponent(rect);
		background.initialize(layer.context.getManager(NameManager).validateName("background"));
		
		var center = getAlignedPoint(layer.scene, SceneAlignment.CENTER);
		setLocation(background, center.x, center.y);
		
		return rect;
	}
	#end
	
	#if (js && !spaceport)
	/**
	  * Hacks to get the proper dimensions
	  */
	public static function getFullScreenDimensions (?landscape :Bool = false) :Vec2
	{
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
		return new Vec2(width, height);
	}
	#end
}
