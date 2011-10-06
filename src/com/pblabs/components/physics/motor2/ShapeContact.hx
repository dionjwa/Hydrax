package com.pblabs.components.physics.motor2;

import com.pblabs.components.manager.NodeComponent;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.geom.Vector2;
import com.pblabs.geom.VectorTools;

import de.polygonal.motor2.World;
import de.polygonal.motor2.data.BoxData;
import de.polygonal.motor2.data.CircleData;
import de.polygonal.motor2.data.MassData;
import de.polygonal.motor2.data.RigidBodyData;
import de.polygonal.motor2.data.ShapeData;
import de.polygonal.motor2.dynamics.RigidBody;

import hsl.haxe.Signaler;

import com.pblabs.components.physics.CollisionData;
import com.pblabs.components.physics.ShapeType;

using com.pblabs.engine.core.SignalBondManager;
using com.pblabs.engine.util.PBUtil;

class ShapeContact extends NodeComponent<ShapeContactManager, Dynamic>,
	implements com.pblabs.util.ds.Hashable
{
	public var shapeType (get_shapeType, set_shapeType) :ShapeType;
	var _shapeType :ShapeType;
	public var body (default, null):RigidBody;
	var world (get_world, null) :World;
	var _hash :Int;
	
	public function new ()
    {
        super();
        //Set the default.  Hard to imagine needing more than one physics engine.
        parentProperty = ShapeContactManager.singletonProp();
        trace("parentProperty=" + parentProperty);
        _hash = 0;
    }
    
    public function hashCode () :Int
    {
        return _hash;
    }
    
	override function onReset () :Void
	{
		super.onReset();
		bindSignal(owner.getComponent(SpatialComponent).signalerLocation, onLocationChange);
		bindSignal(owner.getComponent(SpatialComponent).signalerAngle, onAngleChange);
		set_shapeType(_shapeType);
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		if (body != null) {
			body.free();
			body = null;
		}
		shapeType = null;
	}
	
	public function setHash (val :Int) :Void
	{
		if (_hash == 0) {
			_hash = val;
		}
	}
	
	function onLocationChange (loc :Vector2) :Void
	{
		if (body != null) {
			body.x = loc.x;
			body.y = loc.y;
		}
	}
	
	function onAngleChange (val :Float) :Void
	{
		if (body != null) {
			body.angle = val;
		}
	}
	
	function get_world () :World
	{
		if (parent == null) {
			com.pblabs.util.Log.error("Asking for World, but no parent");
			return null;
		}
		return parent.world;
	}
	
	function get_shapeType () :ShapeType
	{
		return _shapeType;
	}
	
	function set_shapeType (shape) :ShapeType
	{
		_shapeType = shape;
		if (parent != null) {
			parent.removeContacts(this);
		}
		//Destroy the old body, create a new one
		if (body != null) {
			// previousMass = body.mass;
			body.free();
			body = null;
		}
		
		if (_shapeType == null) {
			com.pblabs.util.Log.warn("No shape");
			return null;
		}
		
		if (parent == null || parent.world == null) {
			com.pblabs.util.Log.info("No parent when setting shapeType");
			return _shapeType;
		}
		
		com.pblabs.util.Assert.isNotNull(parent, "No parent");
		com.pblabs.util.Assert.isNotNull(parent.world, "No world on parent");
		
		var shapeData :ShapeData;
		switch (_shapeType) {
			// case CIRCLE(radius):
			// 	var sd = new CircleData(0, radius);
			// 	sd.x = 0;
			// 	sd.y = 0;
			// 	sd.r = 0;
			// 	shapeData = sd; 
			case BOX(w, h): 
				var sd = new BoxData(0, w, h);
				sd.x = 0;
				sd.y = 0;
				sd.r = 0;
				shapeData = sd; 
			// case FIXED_BOX(x, y, w, h):
			default: throw "Only BoxShapes curently allowed";
		}
		
		var coords = owner.getComponent(SpatialComponent);
		com.pblabs.util.Assert.isNotNull(coords);
		var bd = new RigidBodyData(coords.x, coords.y, coords.angle);
		
		com.pblabs.util.Assert.isNotNull(bd, "No rigid body data");
		com.pblabs.util.Assert.isNotNull(shapeData, "No shapeData");
		
		bd.addShapeData(shapeData);
		
		body = parent.world.createBody(bd);
		body.setMassFromShapes();
		parent.addContacts(this);
		return _shapeType;
	}
}
