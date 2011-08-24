package com.pblabs.components.ui;

import com.pblabs.components.input.MouseInputComponent;
import com.pblabs.components.scene2D.BaseSceneComponent;
import com.pblabs.components.scene2D.BaseSceneLayer;
import com.pblabs.components.scene2D.BitmapRenderer;
import com.pblabs.components.scene2D.ImageComponent;
import com.pblabs.components.scene2D.Svg;
import com.pblabs.components.scene2D.SvgTools;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.NameManager;
import com.pblabs.engine.core.ObjectType;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.resource.BitmapCacheResource;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.engine.resource.ResourceType;
import com.pblabs.engine.resource.Source;
import com.pblabs.util.Comparators;
import com.pblabs.util.svg.SvgReplace;

using Lambda;

using com.pblabs.components.input.InputTools;
using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.engine.util.PBUtil;

class SvgButtonTools
{
	public static function createSvgFromResource (layer :BaseSceneLayer<Dynamic, Dynamic>, 
		token :ResourceToken, ?entityName :String) :IEntity
	{
		var svgData = layer.context.getManager(IResourceManager).get(token);
		com.pblabs.util.Assert.isNotNull(svgData, ' svgData is null from token ' + token);
		return createSvg(layer, svgData, entityName);
	}
	
	// public static function createSvgTokenFromReplacements (rsrc :IResourceManager, token :ResourceToken, ?replacements :Array<SvgReplace>) :ResourceToken
	// {
	// 	if (replacements == null || replacements.length == 0) {
	// 		return token;
	// 	}
		
	// 	com.pblabs.util.Assert.isNotNull(SvgTools.svgCache, ' SvgTools.svgCache is null');
	// 	var svgdata = SvgTools.svgCache.get(new com.pblabs.util.ds.Tuple(token, replacements));
		
	// 	// var svgdata = rsrc.get(token);
	// 	// com.pblabs.util.Assert.isNotNull(svgdata, ' svgdata is null');
	// 	// svgdata = processReplacements(svgdata, replacements);
	// 	return new ResourceToken(token.id, Source.text(svgdata), ResourceType.SVG);
	// }
	
	
	public static function createSvg (layer :BaseSceneLayer<Dynamic, Dynamic>, ?svg :String, ?entityName :String) :IEntity 
	{
		var so = layer.context.createBaseSceneEntity();
		
		var svgComp = layer.context.allocate(Svg);
		svgComp.svgData = svg;
		svgComp.parentProperty = layer.entityProp();
		so.addComponent(svgComp);
		so.initialize(layer.context.getManager(NameManager).validateName(entityName == null ? "svg" : entityName));
		return so;
	}
	
	public static function addSvg (e :IEntity, layer :BaseSceneLayer<Dynamic, Dynamic>, token :ResourceToken, 
		?replacements :Array<SvgReplace>, ?componentName :String) :IEntity 
	{
		
		var svgComp = e.context.allocate(BitmapRenderer);
		componentName = componentName != null ? componentName : token.id + "_" + svgComp.key;
		svgComp.parentProperty = layer.entityProp();
		e.addComponent(svgComp, componentName);
		
		var svgImageCache = e.context.getManager(com.pblabs.util.svg.SvgRenderQueueManager);
		
		svgImageCache.getBitmapData(token, replacements, function (image :ImageData) :Void {
			svgComp.bitmapData = image;
			e.getComponent(com.pblabs.components.minimalcomp.Component).invalidate();
		});
		
		return e;
		
		
		
		
		
		// var rsrc = e.context.getManager(IResourceManager);
		// token = createSvgTokenFromReplacements(rsrc, token, replacements);
		// var cachedToken = BitmapCacheResource.createCachedToken(token);
		// if (rsrc.get(cachedToken) != null) {
		// 	var svgComp = e.context.allocate(ImageComponent);
		// 	componentName = componentName != null ? componentName : token.id + "_" + svgComp.key;
		// 	svgComp.resource = cachedToken;
		// 	svgComp.parentProperty = layer.entityProp();
		// 	e.addComponent(svgComp, componentName);
		// } else {
		// 	var svgComp = e.context.allocate(Svg);
		// 	componentName = componentName != null ? componentName : token.id + "_" + svgComp.key;
		// 	svgComp.svgData = rsrc.get(token);
		// 	svgComp.parentProperty = layer.entityProp();
		// 	e.addComponent(svgComp, componentName);
		// }
		// return e;
	}
	
	public static function setOnClick (e :IEntity, onClick :Void->Void) :IEntity
	{
		if (onClick == null) return e;
		ensureMouseInputComponent(e);
		var mouse = e.getComponent(MouseInputComponent);
		mouse.bindDeviceClick(onClick);
		return e;
	}
	
	public static function setOnDeviceDown (e :IEntity, onDown :Void->Void) :IEntity
	{
		if (onDown == null) return e;
		
		ensureMouseInputComponent(e);
		var mouse = e.getComponent(MouseInputComponent);
		mouse.bindDeviceDown(onDown);
		return e;
	}
	
	public static function setOnDeviceHeldDown (e :IEntity, onHeldDown :Void->Void) :IEntity
	{
		if (onHeldDown == null) return e;
		
		ensureMouseInputComponent(e);
		var mouse = e.getComponent(MouseInputComponent);
		mouse.bindDeviceHeldDown(onHeldDown);
		return e;
	}
	
	public static function ensureMouseInputComponent (e :IEntity) :IEntity
	{
		if (e.getComponent(MouseInputComponent) == null) {
			e.addComponent(e.context.allocate(MouseInputComponent));
		}
		return e;
	}
	
	public static function setSvg (e :IEntity, svgData :String) :IEntity
	{
		var svgComp = e.getComponent(Svg);
		com.pblabs.util.Assert.isNotNull(svgComp, ' svgComp is null');
		svgComp.svgData = svgData;
		return e;
	}
	
	public static function makeReactiveButton (e :IEntity) :IEntity
	{
		ensureMouseInputComponent(e);
		var mouse = e.getComponent(MouseInputComponent);
		mouse.makeReactiveButton();
		return e;
	}
	
	/** Grabs two BaseSceneComponent components and makes them into the two button states */
	public static function makeTwoStateButton (e :IEntity, ?isToggle = false) :IEntity
	{
		com.pblabs.util.Assert.isNotNull(e, ' e is null');
		ensureMouseInputComponent(e);
		var mouse = e.getComponent(MouseInputComponent);
		
		var sceneComponents = e.getComponents(BaseSceneComponent).array();
		// trace('sceneComponents=' + sceneComponents);
		com.pblabs.util.Assert.isTrue(sceneComponents.length >= 2, "You need at least two BaseSceneComponent types");
		sceneComponents.sort(function (c1 :de.polygonal.ds.Hashable, c2 :de.polygonal.ds.Hashable) :Int {
			return Comparators.compareInts(c1.key, c2.key);
		});
		
		var state1 = sceneComponents[0];
		var state2 = sceneComponents[1];
		
		state2.objectMask = ObjectType.NONE;
		//Explicitly bind the mouse events to the first image, so the 
		//MouseInputComponent doesn't get confused (and bind to the 2nd image)
		mouse.boundsProperty = new PropertyReference("@" + state1.name);
		
		state1.visible = true;
		state2.visible = false;
		
		var sm = e.context.getManager(com.pblabs.engine.core.SignalBondManager);
		com.pblabs.util.Assert.isNotNull(sm);
		if (isToggle) {
			mouse.bindDeviceDown(function () :Void {
				state1.visible = state2.visible;
				state2.visible = !state1.visible;
			});
		} else {
			mouse.bindDeviceDown(function () :Void {
				state1.visible = false;
				state2.visible = true;
				var bond = e.context.getManager(com.pblabs.components.input.InputManager).deviceUp.bind(function (?e :Dynamic) :Void {
					state1.visible = true;
					state2.visible = false;
				}).destroyOnUse();
				
				sm.set(mouse.key, bond);
			});
		}
		return e;
	}
}
