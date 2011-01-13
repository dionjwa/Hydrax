/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.input;

import com.pblabs.components.input.IInteractiveComponent;
import com.pblabs.components.input.InputManager;
import com.pblabs.components.manager.NodeComponent;
import com.pblabs.components.scene.BaseScene2DComponent;
import com.pblabs.components.scene.BaseScene2DManager;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.util.Log;
import com.pblabs.geom.Vector2;
import com.pblabs.util.Comparable;
import com.pblabs.util.Comparators;
using com.pblabs.geom.PolygonTools;

/**
 * The base component for interacting with a mouse or other input device.  At the minimum simply provides the 
 * IInteractiveComponent, but can also do additional behaviour such as rotating or movement easily, 
 * and has it's own dynamic input callback methods.
 */
class MouseInputComponent extends NodeComponent<MouseInputComponent, MouseInputComponent>,
	implements Comparable<MouseInputComponent>
{
	/**
	  * If there is an IInteractiveComponent in the Entity, you don't have to explicity set the properties.
	  */
	public var boundsProperty :PropertyReference<IInteractiveComponent>;
	public var xProperty :PropertyReference<Float>;
	public var yProperty :PropertyReference<Float>;
	public var angleProperty :PropertyReference<Float>;
	public var scaleProperty :PropertyReference<Float>;
	public var offsetProperty :PropertyReference<Vector2>;
	
	
	public var y (get_y, set_y) :Float;
	public var x (get_x, set_x) :Float;
	public var angle (get_angle, set_angle) :Float;
	public var scale (get_scale, set_scale) :Float;
	public var bounds (get_bounds, set_bounds) :IInteractiveComponent;
	public var offset (get_offset, set_offset) :Vector2;
	
	public var isScalable :Bool;
	public var isRotatable :Bool;
	/** Moveable in the x/y? */
	public var isTranslatable :Bool;
	
	public static function compare (a :MouseInputComponent, b :MouseInputComponent) :Int
	{
		#if flash
		Log.error("Implement me, scene objects not ordered.");
		return 0;//if (com.pblabs.util.DisplayUtils.isAbove(a.displayObject, b.displayObject)) -1 else 1;
		#elseif js
		var scenea = a.owner.lookupComponent(BaseScene2DComponent);
		var sceneb = b.owner.lookupComponent(BaseScene2DComponent);
		var scene :BaseScene2DManager<Dynamic> = scenea.parent.parent;
		return Comparators.compareInts(scene.getLayerIndex(sceneb.parent), scene.getLayerIndex(scenea.parent));
		#else
		Log.error("Not implemented");
		return 0;
		#end
	}
	
	public function new ()
	{
		super();
		xProperty = new PropertyReference("@LocationComponent.x");
		yProperty = new PropertyReference("@LocationComponent.y");
		angleProperty = new PropertyReference("@AngleComponent.angle");
		scaleProperty = new PropertyReference("@ScaleComponent.scale");
		
		//The default is not movable, rotatable, or scalable.
		isScalable = isRotatable = isTranslatable = false;
	}
	
	public function compareTo (a :MouseInputComponent) :Int
	{
		return compare(this, a);
	}
	
	public function getPoint () :Vector2
	{
		return new Vector2(x, y);
	}
	
	#if debug
	public function toString () :String
	{
		return cast(owner, com.pblabs.engine.core.Entity).toString();
	}
	#end
	
	dynamic public function onClick () :Void
	{
		// trace(owner + " clicked");
	}
	
	dynamic public function onDeviceDown () :Void
	{
		// trace(owner + " device down");
	}
	
	dynamic public function onDeviceHeldDown () :Void
	{
		// trace(owner + " device down");
	}
	
	override function onReset () :Void
	{
		super.onReset();
		
		if (boundsProperty != null) {
			_bounds = owner.getProperty(boundsProperty);
		}
		
		_bounds = _bounds == null ? owner.lookupComponentByType(IInteractiveComponent) : _bounds;
		
		com.pblabs.util.Assert.isNotNull(!(_bounds == null && boundsProperty == null), "There's no ISpatialObject2D component and the boundsProperty is null.  How are we supposed to work?");
		
		var input = context.getManager(InputManager);
		com.pblabs.util.Assert.isNotNull(input, "No InputManager?");
		
		input.unregisterComponent(this);
		input.registerComponent(this);
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		context.getManager(InputManager).unregisterComponent(this);
		xProperty = null;
		yProperty = null;
		angleProperty = null;
		scaleProperty = null;
		boundsProperty = null;
		_bounds = null;
		isScalable = isRotatable = isTranslatable = false;
	}
	
	function get_bounds () :IInteractiveComponent
	{
		return _bounds;
	}
	
	function set_bounds (bounds :IInteractiveComponent) :IInteractiveComponent
	{
		_bounds = bounds;
		return bounds;
	}
	
	function get_x () :Float
	{
		return owner.getProperty(xProperty);
	}
	
	function set_x (val :Float) :Float
	{
		owner.setProperty(xProperty, val);
		return val;
	}
	
	function get_y () :Float
	{
		return owner.getProperty(yProperty);
	}
	
	function set_y (val :Float) :Float
	{
		owner.setProperty(yProperty, val);
		return val;
	}
	
	function get_angle () :Float
	{
		return owner.getProperty(angleProperty);
	}
	
	function set_angle (val :Float) :Float
	{
		owner.setProperty(angleProperty, val);
		return val;
	}
	
	function get_scale () :Float
	{
		return owner.getProperty(scaleProperty);
	}
	
	function set_scale (val :Float) :Float
	{
		owner.setProperty(scaleProperty, val);
		return val;
	}
	
	function get_offset () :Vector2
	{
		if (offsetProperty != null) {
			return owner.getProperty(offsetProperty);
		} else {
			return null;
		}
	}
	
	function set_offset (val :Vector2) :Vector2
	{
		owner.setProperty(offsetProperty, val);
		return val;
	}
	
	var _bounds :IInteractiveComponent;
}
