package com.pblabs.components.physics; 

import com.pblabs.engine.core.IEntityComponent;

interface IPhysicalObject implements IEntityComponent 
{
	var shapeType (get_shapeType, set_shapeType) :com.pblabs.components.physics.ShapeType;
	/** Switch on/off physics engine connection */
	var enabled (default, set_enabled) :Bool;
	// var isCollidable (default, set_isCollidable) :Bool;
	var x (get_x, set_x) :Float;
	var y (get_y, set_y) :Float;
	var angle (get_angle, set_angle) :Float;
	var xVelocity (get_xVelocity, set_xVelocity) :Float;
	var yVelocity (get_yVelocity, set_yVelocity) :Float;
	var speed (get_speed, null) :Float;
	var angularVelocity (get_angularVelocity, set_angularVelocity) :Float;
	var linearFriction (get_linearFriction, set_linearFriction) :Float;
	var restitution (get_restitution, set_restitution) :Float;
	var angularFriction (get_angularFriction, set_angularFriction) :Float;
	var mass (get_mass, set_mass) :Float;
	var xForce (get_xForce, set_xForce) :Float;
	var yForce (get_yForce, set_yForce) :Float;
	function applyForce (forceX :Float, forceY :Float) :Void;
	function updateCollisionData () :Void;
	function onTick (dt :Float) :Void;
	
	public var xProperty :com.pblabs.engine.core.PropertyReference<Float>;
	public var yProperty :com.pblabs.engine.core.PropertyReference<Float>;
	public var angleProperty :com.pblabs.engine.core.PropertyReference<Float>;
	// public var parentProperty :com.pblabs.engine.core.PropertyReference<Dynamic>;
}
