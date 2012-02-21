package com.pblabs.components.scene2D;

import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.engine.core.NameManager;
import com.pblabs.engine.core.ObjectType;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.engine.resource.ResourceType;
import com.pblabs.engine.time.IProcessManager;
import org.transition9.util.BitmapUtil;
import org.transition9.util.Comparators;
import org.transition9.util.F;

using Lambda;

using com.pblabs.components.input.InputTools;
using com.pblabs.components.minimalcomp.MCompTools;
using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.components.util.DataComponent;
using com.pblabs.engine.util.PBUtil;

/**
  * "using" methods for adding and setting image data and/or components.
  */
class ImageTools
{
	static var DEVICE_DOWN_LAYERS :String = "deviceDownLayers";
	
	public static function getImageComponentForResourceType (type :ResourceType) :Class<Dynamic>
	{
		var compCls :Class<Dynamic> = null;
		switch (type) {
			case IMAGE: 
				#if (flash || cpp || spaceport)
				compCls = BitmapRenderer;
				#elseif js
				compCls = ImageComponent;
				#end
			case IMAGE_DATA: compCls = BitmapRenderer; 
			case SVG: compCls = BitmapRenderer;
			#if (flash || cpp || spaceport)
			case CLASS: compCls = com.pblabs.components.scene2D.flash.SceneComponent;
			#end
			default: throw "ResourceType=" + type + " does not have an associated image IEntityComponent"; null; 
		}
		return compCls;
	}
	
	public static function stretchToWidth (e :IEntity, ?widthFraction :Float = 1.0) :IEntity
	{
		var cb = function (orientation :Int = 0) :Void {
			if (e.isLiveObject) {
				// trace("stretchTo_transformMatrix.translate(_x * localZoom + _locationOffset.x * localZoom, _y * localZoom + _locationOffset.y * localZoom);Width " + e.name);
				for (sc in e.getComponents(BaseSceneComponent)) {
					if (sc.layer == null || sc.layer.scene == null || sc.width <= 1) {
						continue;
					}
					// trace("   before x=" + sc.x);
					var width = sc.layer.scene.sceneView.width;
					
					sc.width = width * widthFraction;
					
					// var describe = function () :Void {
					// 	trace('sc.scaleX=' + sc.scaleX);
					// 	trace("   after x=" + sc.x);
					// 	trace('sc.registrationPoint=' + sc.registrationPoint);
					// 	trace('sc.width=' + sc.width);
					// 	trace('sc.bounds=' + sc.bounds);
					// }
					// describe();
					// haxe.Timer.delay(describe, 1000);
					
					
					
				}
				e.invalidate();
			}
		}
		
		e.updatePosition(F.ignoreArg(callback(cb,0)));
		e.setOnOrientationChange(cb);
		return e;
	}
	
	public static function setXToScreenProportion (e :IEntity, ?widthFraction :Float = 0.5) :IEntity
	{
		var cb = function (orientation :Int) :Void {
			if (e.isLiveObject) {
				for (sc in e.getComponents(BaseSceneComponent)) {
					if (sc.layer == null || sc.layer.scene == null) {
						continue;
					}
					var width = sc.layer.scene.sceneView.width;
					sc.x = width * widthFraction;
				}
				e.invalidate();
			}
		}
		
		e.updatePosition(F.ignoreArg(callback(cb,0)));
		e.setOnOrientationChange(cb);
		
		// e.updatePosition(callback(cb, 0));
		// e.context.getManager(IProcessManager).callLater(callback(cb, 0));
		// e.setOnOrientationChange(cb);
		return e;
	}
	
	public static function setAsDeviceDownLayer (e :IEntity, comp :BaseSceneComponent) :Void
	{
		var deviceDownLayers :Array<BaseSceneComponent> = e.getEntityData(DEVICE_DOWN_LAYERS); 
		if (deviceDownLayers == null) {
			deviceDownLayers = [];
			e.setEntityData(DEVICE_DOWN_LAYERS, deviceDownLayers);
		}
		deviceDownLayers.push(comp);
	}
	
	public static function getDeviceDownLayers (e :IEntity) :Array<BaseSceneComponent>
	{
		var deviceDownLayers :Array<BaseSceneComponent> = e.getEntityData(DEVICE_DOWN_LAYERS); 
		return deviceDownLayers != null ? deviceDownLayers : [];
	}
	
	public static function getDeviceUpLayers (e :IEntity) :Array<BaseSceneComponent>
	{
		var deviceDownLayers :Array<BaseSceneComponent> = e.getEntityData(DEVICE_DOWN_LAYERS);
		var deviceUpLayers = [];
		for (sc in e.getComponents(BaseSceneComponent)) {
			if (deviceDownLayers == null || !deviceDownLayers.has(sc)) {
				deviceUpLayers.push(sc);
			}
		}
		return deviceUpLayers;
	}
	
	public static function addImage (e :IEntity, layer :BaseSceneLayer, ?token :ResourceToken, 
		?componentName :String, ?isForDeviceDown :Bool = false) :IEntity 
	{
		if (token != null) {
			switch (token.type) {
				case SVG: throw "Use SvgImageTools instead of ImageTools for Svg resources"; return null;
				case IMAGE,IMAGE_DATA: //Ok 
				default: throw "Cannot add image for resource " + token;
			}
		}
		
		var imageComp = e.context.allocate(BitmapRenderer);
		componentName = componentName != null  ? componentName : (token != null ? token.id + "_" + imageComp.key : "BitmapRenderer");
		imageComp.parentProperty = layer.entityProp();
		e.addComponent(imageComp, componentName);
		
		if (isForDeviceDown) {
			setAsDeviceDownLayer(e, imageComp); 
		}
		
		if (token != null) {
			switch (token.type) {
				case IMAGE: 
					var image = e.context.getManager(IResourceManager).get(token);
					org.transition9.util.Assert.isNotNull(image, ' image is null for token=' + token);
					#if (flash || cpp || spaceport)
					imageComp.bitmapData = image.bitmapData; 
					#elseif js
					imageComp.drawImage(image);
					#end
					
				case IMAGE_DATA:
					var bd = e.context.getManager(IResourceManager).get(token);
					org.transition9.util.Assert.isNotNull(bd, ' bd is null');
					imageComp.bitmapData = bd;
				default:
			}
		}
		
		if (e.getComponent(com.pblabs.components.minimalcomp.Component) != null) {
			e.getComponent(com.pblabs.components.minimalcomp.Component).invalidate();
		}
		
		return e;
	}
	
	public static function setImageData (e :IEntity, token :ResourceToken) :IEntity
	{
		var imageComp = e.getComponent(BitmapRenderer);
		if (imageComp != null) {
			if (token != null) {
				switch (token.type) {
					case IMAGE: 
						var image = e.context.getManager(IResourceManager).get(token);
						org.transition9.util.Assert.isNotNull(image, ' image is null');
						#if (flash || cpp || spaceport)
						imageComp.bitmapData = image.bitmapData; 
						#elseif js
						imageComp.drawImage(image);
						#end
					case IMAGE_DATA:
						var bd = e.context.getManager(IResourceManager).get(token);
						org.transition9.util.Assert.isNotNull(bd, ' bd is null');
						imageComp.bitmapData = bd;
					default:
				}
			} else {
				imageComp.bitmapData = null;
			}
		} else {
			org.transition9.util.Log.warn("setImageData but no BitmapRenderer, token=" + token);
		}
		return e;
	}
	
	public static function addText (e :IEntity, layer :BaseSceneLayer, text :String, ?align :String) :IEntity
	{
		var textComp = e.context.allocate(com.pblabs.components.scene2D.Text);
		textComp.text = text;
		textComp.parentProperty = layer.entityProp();
		e.addComponent(textComp);
		return e;
	}
}
