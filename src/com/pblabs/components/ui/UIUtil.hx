/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.ui;

import com.pblabs.components.input.MouseInputComponent;
import com.pblabs.components.scene2D.BaseSceneComponent;
import com.pblabs.components.scene2D.BaseSceneLayer;
import com.pblabs.components.scene2D.BaseSceneManager;
import com.pblabs.components.scene2D.CircleShape;
import com.pblabs.components.scene2D.SVGComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.engine.core.NameManager;
import com.pblabs.engine.core.ObjectType;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.resource.EmbeddedResource;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.geom.Vector2;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ds.Tuple;

import de.polygonal.motor2.geom.math.XY;

using com.pblabs.components.input.InputUtil;
using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.components.ui.UIUtil;
using com.pblabs.engine.core.SignalBondManager;
using com.pblabs.engine.util.PBUtil;
using com.pblabs.geom.VectorTools;

class UIUtil
{
	/** Component names for multi-image buttons, in case you need to modify them */
	public static var IMAGE1 = "image1";
	public static var IMAGE2 = "image2";
	// public static function createSimpleButton (layer :BaseSceneLayer<Dynamic, Dynamic>, name :String, text :String, loc :XY, onInputDown :Void->Void) :IEntity
	// {
	//	 var so = layer.context.createBaseSceneEntity();
	//	 var blob  = layer.context.allocate(CircleShape);
	//	 blob.parentProperty = layer.entityProp();
	//	 // blob.text = text;
	//	 so.addComponent(blob);
	//	 var mouse = layer.context.allocate(MouseInputComponent);
	//	 so.addComponent(mouse);
	//	 so.initialize(name);
	//	 so.setDeviceHeldDown(onInputDown);
	//	 so.setDeviceDown(onInputDown);
	//	 so.setLocation(loc.x, loc.y);
	//	 return so;
	// }
	
	public static function createSVGButton (layer :BaseSceneLayer<Dynamic, Dynamic>, 
		svg1 :Array<ResourceToken<Dynamic>>, ?onClick :Void->Void, ?onDown :Void->Void, ?name :String) :IEntity
	{
		var so = layer.context.createBaseSceneEntity();
		
		var c = layer.context.allocate(SVGComponent);
		c.resources = cast svg1;
		c.parentProperty = layer.entityProp();
		so.addComponent(c);
		
		so.addComponent(layer.context.allocate(com.pblabs.components.minimalcomp.Component));
		
		var mouse = layer.context.allocate(MouseInputComponent);
		so.addComponent(mouse);
		so.initialize(layer.context.getManager(NameManager).validateName(name == null ? "button" : name));
		if (onClick != null) {
			mouse.bindDeviceClick(onClick);
		}
		if (onDown != null) {
			mouse.bindDeviceDown(onDown);
		}
		return so;
	}
	
	public static function createTwoStateSVGToggle (layer :BaseSceneLayer<Dynamic, Dynamic>, 
		svg1 :Array<ResourceToken<Dynamic>>, 
		svg2 :Array<ResourceToken<Dynamic>>,
		onDown :Void->Void,
		?name :String) :IEntity
	{
		return createTwoStateSVGButton(layer,
			svg1,
			svg2,
			null,
			onDown,
			name,
			null,
			null,
			true);
	}
	
	public static function createTwoStateSVGButton (layer :BaseSceneLayer<Dynamic, Dynamic>, 
		svg1 :Array<ResourceToken<Dynamic>>, 
		svg2 :Array<ResourceToken<Dynamic>>,
		text :String, 
		onClick :Void->Void,
		?onDown :Void->Void,
		?name :String, 
		?svgRegex1 :Array<Tuple<EReg, String>>,
		?svgRegex2 :Array<Tuple<EReg, String>>,
		?isToggle :Bool = false) :IEntity
	{
		text = text == null ? "" : text;
		com.pblabs.util.Assert.isNotNull(svg1);
		com.pblabs.util.Assert.isTrue(svg1.length > 0);
		com.pblabs.util.Assert.isNotNull(svg2);
		com.pblabs.util.Assert.isTrue(svg2.length > 0);
		
		var s1 = layer.context.allocate(SVGComponent);
		s1.resources = cast svg1;
		s1.parentProperty = layer.entityProp();
		s1.text = text;
		if (svgRegex1 != null) {
			s1.svgRegexReplacements = s1.svgRegexReplacements.concat(svgRegex1);
		}

		var s2 = layer.context.allocate(SVGComponent);
		s2.resources = cast svg2;
		s2.parentProperty = layer.entityProp();
		s2.text = text;
		if (svgRegex2 != null) {
			s2.svgRegexReplacements = s2.svgRegexReplacements.concat(svgRegex2);
		}
		
		return createTwoStateButton(layer, s1, s2, 
			layer.context.getManager(NameManager).validateName(name == null ? "button" : name), onClick, onDown, isToggle);
	}
	
	public static function createTwoStateButton (layer :BaseSceneLayer<Dynamic, Dynamic>, 
		state1 :BaseSceneComponent<Dynamic>,
		state2 :BaseSceneComponent<Dynamic>,
		name :String, 
		onClick :Void->Void,
		?onDown :Void->Void,
		?isToggle = false) :IEntity
	{
		var so = layer.context.createBaseSceneEntity();
		com.pblabs.util.Assert.isFalse(state1.isRegistered);
		com.pblabs.util.Assert.isFalse(state2.isRegistered);
		//Add 2 before 1 to get the z-order right.
		so.addComponent(state2, IMAGE2);
		so.addComponent(state1, IMAGE1);
		
		//Don't allow mouse events on the second image.
		state2.objectMask = ObjectType.NONE;
		
		var mouse = layer.context.allocate(MouseInputComponent);
		//Explicitly bind the mouse events to the first image, so the 
		//MouseInputComponent doesn't get confused (and bind to the 2nd image)
		mouse.boundsProperty = new PropertyReference("@" + IMAGE1);
		
		//Component for creating layouts
		so.addComponent(layer.context.allocate(com.pblabs.components.minimalcomp.Component));
		
		so.addComponent(mouse);
		so.initialize(layer.context.getManager(NameManager).validateName(name));
		state1.visible = true;
		state2.visible = false;
		if (onClick != null) {
			mouse.bindDeviceClick(onClick);
		}
		if (onDown != null) {
			mouse.bindDeviceDown(onDown);
		}
		var sm = layer.context.getManager(com.pblabs.engine.core.SignalBondManager);
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
				var bond = layer.context.getManager(com.pblabs.components.input.InputManager).deviceUp.bind(function (?e :Dynamic) :Void {
					state1.visible = true;
					state2.visible = false;
				}).destroyOnUse();
				
				sm.set(mouse.key, bond);
			});
		}
		return so;
	}
	
	public static function setTwoStateButtonMask (e :IEntity, mask :ObjectType) :Void
	{
		var sc :BaseSceneComponent<Dynamic> = e.getComponentByName(UIUtil.IMAGE1);
		com.pblabs.util.Assert.isNotNull(sc);
		sc.objectMask = mask;
	}
	
	public static function createText (layer :BaseSceneLayer<Dynamic, Dynamic>, svg :ResourceToken<Dynamic>, 
		text :String, ?align :String) :IEntity
	{
		var so = layer.context.createBaseSceneEntity();
		var s1 = layer.context.allocate(SVGComponent);
		s1.resources = cast [ svg ];
		s1.parentProperty = layer.entityProp();
		s1.text = text;
		s1.svgRegexReplacements.push(new Tuple(~/\$T/, text));
		s1.objectMask = ObjectType.NONE;
		so.addComponent(s1);
		
		//Component for creating layouts
		so.addComponent(layer.context.allocate(com.pblabs.components.minimalcomp.Component));
		
		so.initialize(layer.context.getManager(NameManager).validateName("text"));
		return so;
	}
	
	// public static function createButton (layer :BaseSceneLayer<Dynamic, Dynamic>, name :String, imageClass :Class<Dynamic>,
	// 	resource :ResourceToken<Dynamic>, ?loc :XY = null, ?onInputDown :Void->Void = null) :IEntity
	// {
	// 	var so = layer.context.createBaseSceneEntity();
		
	// 	throw "createButton Fix me";
	// 	// var c :IEntityComponent = layer.context.allocate(imageClass);
	// 	// c.resource = cast resource;
	// 	// c.parentProperty = layer.entityProp();
	// 	// so.addComponent(c);
		
	// 	var mouse = layer.context.allocate(MouseInputComponent);
	// 	so.addComponent(mouse);
	// 	if (onInputDown != null) {
	// 		mouse.bindDeviceClick(onInputDown);
	// 	}
	// 	so.initialize(name);
	// 	if (loc != null) {
	// 		so.setLocation(loc.x, loc.y);
	// 	}
	// 	MouseInputComponent.makeReactiveButton(mouse);
	// 	return so;
	// }
	
	/** We can add more args here when the UI bits become more sophisticated */
	public static function createZoomWidget (layer :BaseSceneLayer<Dynamic, Dynamic>, target :BaseSceneManager<Dynamic>, loc :Vector2, ?size :Float = 200) :Void
	{
		Preconditions.checkNotNull(layer);
		Preconditions.checkNotNull(target);
		Preconditions.checkNotNull(loc);
		
		var zoomIn = function () :Void {
			target.zoom += 0.1;
		}
		
		var zoomOut = function () :Void {
			target.zoom -= 0.1;
		}
		
		// var ein = layer.createSVGButton("zoomInWidget", "zoomin", loc, zoomIn);
		// var svg = ein.getComponent(SVGComponent);
		// svg.width = svg.height = size;
		
		// var mouse = ein.getComponent(MouseInputComponent);
		// mouse.isRotatable = mouse.isScalable = mouse.isTranslatable = false;  
		
		// var eout = layer.createSVGButton("zoomOutWidget", "zoomout", loc.add(new Vector2(0, size)), zoomOut);
		// svg = eout.getComponent(SVGComponent);
		// svg.width = svg.height = size;
		// mouse = eout.getComponent(MouseInputComponent);
		// mouse.isRotatable = mouse.isScalable = mouse.isTranslatable = false;
	}
	
	/** We can add more args here when the UI bits become more sophisticated */
	public static function createRotateWidget (layer :BaseSceneLayer<Dynamic, Dynamic>, target :BaseSceneManager<Dynamic>, loc :Vector2, ?size :Float = 200) :Void
	{
		Preconditions.checkNotNull(layer);
		Preconditions.checkNotNull(target);
		Preconditions.checkNotNull(loc);
		
		var clockWise = function () :Void {
			target.rotation += 0.05;
		}
		
		var antiClockwise = function () :Void {
			target.rotation -= 0.05;
		}
		
		// var anticlock = layer.createSVGButton("anticlockwiseWidget", "counterclockwise", loc, antiClockwise);
		// var svg = anticlock.getComponent(SVGComponent);
		// svg.width = svg.height = size;
		// var mouse = anticlock.getComponent(MouseInputComponent);
		// mouse.isRotatable = mouse.isScalable = mouse.isTranslatable = false;  
		
		// var clock = layer.createSVGButton("clockwiseWidget", "clockwise", loc.add(new Vector2(0, size)), clockWise);
		// svg = clock.getComponent(SVGComponent);
		// svg.width = svg.height = size;
		// mouse = clock.getComponent(MouseInputComponent);
		// mouse.isRotatable = mouse.isScalable = mouse.isTranslatable = false;
	}
	
	public static function createScrollWidget (layer :BaseSceneLayer<Dynamic, Dynamic>, target :BaseSceneManager<Dynamic>, loc :Vector2, ?size :Float = 200) :Void
	{
		Preconditions.checkNotNull(layer);
		Preconditions.checkNotNull(target);
		Preconditions.checkNotNull(loc);
		
		var upf = function () :Void {
			target.y -= 20;
		}
		var downf = function () :Void {
			target.y += 20;
		}
		var leftf = function () :Void {
			target.x -= 20;
		}
		var rightf = function () :Void {
			target.x += 20;
		}
		
		var fs = [upf, downf, leftf, rightf];
		var labels = ["up", "down", "left", "right"];
		var locs = [loc, loc.add(new Vector2(0, size)), loc.add(new Vector2(-size, size / 2)), loc.add(new Vector2(size, size / 2))];
		// for(i in 0...labels.length) {
		// 	var e = layer.createSVGButton(labels[i] + "Widget", labels[i], locs[i], fs[i]);
		// 	var svg = e.getComponent(SVGComponent);
		// 	svg.width = svg.height = size;
		// 	var mouse = e.getComponent(MouseInputComponent);
		// 	mouse.isRotatable = mouse.isScalable = mouse.isTranslatable = false;	  
		// }
	}
	

}
