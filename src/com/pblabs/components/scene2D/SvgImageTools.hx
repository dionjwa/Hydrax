package com.pblabs.components.scene2D;

import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.engine.core.NameManager;
import com.pblabs.engine.core.ObjectType;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.engine.resource.ResourceType;
import com.pblabs.engine.resource.SvgResources;
import com.pblabs.engine.time.IProcessManager;
import org.transition9.util.BitmapUtil;
import org.transition9.util.Comparators;
import org.transition9.util.F;
import org.transition9.util.svg.SvgData;
import org.transition9.util.svg.SvgReplace;

using Lambda;

using com.pblabs.components.input.InputTools;
using com.pblabs.components.minimalcomp.MCompTools;
using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.components.util.DataComponent;
using com.pblabs.engine.util.PBUtil;

/**
  * "using" methods for adding and setting image data and/or components.
  */
class SvgImageTools
{
	static var SVG_TEXT = '
		<svg
	   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	   xmlns:svg="http://www.w3.org/2000/svg"
	   xmlns="http://www.w3.org/2000/svg"
	   version="1.1"
	   width="300"
	   height="100"
	   id="svg3759">
	  <text
			x="0"
			y="0"
			id="text3767"
			xml:space="preserve"
			style="font-size:40px;font-style:normal;font-weight:normal;line-height:125%;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;font-family:Bitstream Vera Sans"><tspan
			 x="05"
			 y="0"
			 id="tspan3769">$T</tspan></text>
	</svg>';
	
	static var DEVICE_DOWN_LAYERS :String = "deviceDownLayers";
	
	public static function getImageComponentForResourceType (type :ResourceType) :Class<Dynamic>
	{
		var compCls :Class<Dynamic> = null;
		switch (type) {
			case IMAGE: 
				#if flash
				compCls = BitmapRenderer;
				#elseif js
				compCls = ImageComponent;
				#end
			case IMAGE_DATA: compCls = BitmapRenderer; 
			case SVG: compCls = BitmapRenderer;
			#if flash
			case CLASS: compCls = com.pblabs.components.scene2D.flash.SceneComponent;
			#end
			default: throw "ResourceType=" + type + " does not have an associated image IEntityComponent"; null; 
		}
		return compCls;
	}
	
	public static function createSvgFromResource (layer :BaseSceneLayer, 
		token :ResourceToken, ?entityName :String) :IEntity
	{
		var svgData = layer.context.getManager(IResourceManager).get(token);
		org.transition9.util.Assert.isNotNull(svgData, ' svgData is null from token ' + token);
		return createSvg(layer, svgData, entityName);
	}
	
	public static function createSvg (layer :BaseSceneLayer, ?svg :String, ?entityName :String) :IEntity 
	{
		var so = layer.context.createBaseSceneEntity();
		
		var svgComp = layer.context.allocate(Svg);
		svgComp.svgData = new SvgData(null, svg);
		svgComp.parentProperty = layer.entityProp();
		so.addComponent(svgComp);
		so.initialize(layer.context.getManager(NameManager).validateName(entityName == null ? "svg" : entityName));
		return so;
	}
	
	/** Converts Svg to Bitmap */
	public static function addSvg (e :IEntity, 
		layer :BaseSceneLayer, 
		token :ResourceToken, 
		?cache :Null<Bool> = false, 
		?isForDeviceDown :Null<Bool> = false,
		?replacements :Array<SvgReplace>, 
		?componentName :String
		) :IEntity 
	{
		org.transition9.util.Assert.isNotNull(layer, ' layer is null');
		org.transition9.util.Assert.isNotNull(token, ' token is null');
		org.transition9.util.Assert.isNotNull(e, ' e is null');
		
		if (cache) {
			var svgComp = e.context.allocate(BitmapRenderer);
			
			//Set the bitmap to the bounds of the svg so layout algorithms will work properly
			var svgToken = SvgResources.getSvgResourceToken(e.context, token, replacements);
			var svgData :SvgData = e.context.getManager(IResourceManager).get(svgToken);
			var svgBounds = SvgRenderTools.getSvgBounds(svgData.xml);
			// trace(e.getEntityData("order") + ', svgBounds=' + svgBounds);
			svgComp.bitmapData = BitmapUtil.createImageData(Std.int(svgBounds.intervalX), Std.int(svgBounds.intervalY)); 
			
			componentName = componentName != null ? componentName : token.id + "_" + svgComp.key;
			svgComp.parentProperty = layer.entityProp();
			e.addComponent(svgComp, componentName);
			
			if (isForDeviceDown) {
				setAsDeviceDownLayer(e, svgComp); 
			}
			
			org.transition9.util.svg.SvgRenderQueueManager.getBitmapData(e.context, token, replacements, 
				function (image :com.pblabs.components.scene2D.ImageData) :Void {
					svgComp.bitmapData = image;
					// trace("order rendered=" + e.getEntityData("order") + ", width=" + image.width);
					//Notify the display hierarchy that our dimensions may have changed
					if (e.getComponent(com.pblabs.components.minimalcomp.Component) != null) {
						e.getComponent(com.pblabs.components.minimalcomp.Component).invalidate();
					}
				}, true);
		} else {
			var svgToken = SvgResources.getSvgResourceToken(e.context, token, replacements);
			var svgData = e.context.getManager(IResourceManager).get(svgToken);
			org.transition9.util.Assert.isNotNull(svgData, ' svgData is null for ' + svgToken);
			var svgComp = e.context.allocate(Svg);
			svgComp.svgData = svgData;
			svgComp.parentProperty = layer.entityProp();
			componentName = componentName != null ? componentName : token.id + "_" + svgComp.key;
			e.addComponent(svgComp, componentName);
			
			if (isForDeviceDown) {
				setAsDeviceDownLayer(e, svgComp); 
			}
		}
		
		return e;
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
				case SVG: return addSvg(e, layer, token, null, componentName);
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
					#if flash
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
						#if flash
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
	
	public static function setSvg (e :IEntity, svgData :SvgData) :IEntity
	{
		var svgComp = e.getComponent(Svg);
		org.transition9.util.Assert.isNotNull(svgComp, ' svgComp is null');
		svgComp.svgData = svgData;
		return e;
	}
	
	// public static function addText (e :IEntity, layer :BaseSceneLayer, text :String, ?align :String) :IEntity
	// {
	// 	var svgComp = e.context.allocate(Svg);
	// 	svgComp.svgData = new SvgData(null, SVG_TEXT, [new SvgReplace("$T", text)]);
	// 	svgComp.parentProperty = layer.entityProp();
	// 	e.addComponent(svgComp);
	// 	return e;
	// }
	
	public static function addText (e :IEntity, layer :BaseSceneLayer, text :String, ?align :String) :IEntity
	{
		var textComp = e.context.allocate(com.pblabs.components.scene2D.Text);
		textComp.text = text;
		textComp.parentProperty = layer.entityProp();
		e.addComponent(textComp);
		return e;
	}
}
