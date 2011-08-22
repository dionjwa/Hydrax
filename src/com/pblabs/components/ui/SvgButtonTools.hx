package com.pblabs.components.ui;

import com.pblabs.components.input.MouseInputComponent;
import com.pblabs.components.scene2D.BaseSceneLayer;
import com.pblabs.components.scene2D.Svg;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.NameManager;
import com.pblabs.engine.resource.IResourceManager;
import com.pblabs.engine.resource.ResourceToken;

using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.components.input.InputTools;
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
	
	public static function setOnClick (e :IEntity, onClick :Void->Void) :IEntity
	{
		ensureMouseInputComponent(e);
		var mouse = e.getComponent(MouseInputComponent);
		mouse.bindDeviceClick(onClick);
		return e;
	}
	
	public static function setOnDeviceDown (e :IEntity, onDown :Void->Void) :IEntity
	{
		ensureMouseInputComponent(e);
		var mouse = e.getComponent(MouseInputComponent);
		mouse.bindDeviceDown(onDown);
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
}
