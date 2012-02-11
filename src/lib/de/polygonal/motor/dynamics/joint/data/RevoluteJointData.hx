/*
 *                            _/                                                    _/   
 *       _/_/_/      _/_/    _/  _/    _/    _/_/_/    _/_/    _/_/_/      _/_/_/  _/    
 *      _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/     
 *     _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/      
 *    _/_/_/      _/_/    _/    _/_/_/    _/_/_/    _/_/    _/    _/    _/_/_/  _/       
 *   _/                            _/        _/                                          
 *  _/                        _/_/      _/_/                                             
 *                                                                                       
 * POLYGONAL - A HAXE LIBRARY FOR GAME DEVELOPERS
 * Copyright (c) 2009-2010 Michael Baczynski, http://www.polygonal.de
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
package de.polygonal.motor.dynamics.joint.data;

import de.polygonal.motor.dynamics.joint.Joint;
import de.polygonal.motor.dynamics.RigidBody;
import de.polygonal.motor.dynamics.joint.JointType;
import de.polygonal.motor.dynamics.joint.RevoluteJoint;
import de.polygonal.core.math.Vec2;

/**
 * Revolute joint definition. This requires defining an anchor point where
 * the bodies are joined. The definition uses local anchor points so that
 * the initial configuration can violate the constraint slightly. You also
 * need to specify the initial relative angle for joint limits. This helps
 * when saving and loading a game. The local anchor points are measured from
 * the body's origin rather than the center of mass because:
 * 1. you might not know where the center of mass will be.
 * 2. if you add/remove shapes from a body and recompute the mass, the
 *    joints will be broken.
 */
class RevoluteJointData extends JointData
{
	/**
	 * The local anchor position relative to body1's origin.
	 */
	public var anchor1:Vec2;
	
	/**
	 * The local anchor position relative to body2's origin.
	 */
	public var anchor2:Vec2;
	
	/**
	 * The body2 angle minus body1 angle in the reference state.
	 */
	public var referenceAngle:Float;
	
	/**
	 * The maximum motor torque used to achieve the desired motor speed.
	 */
	public var maxMotorTorque:Float; 
	
	/**
	 * A flag to enable the joint motor.
	 */
	public var enableMotor:Bool;
	
	/**
	 * The desired motor speed. Usually in radians per second.
	 */
	public var motorSpeed:Float;
	
	/**
	 * A flag to enable joint limits.
	 */
	public var enableLimit:Bool;
	
	/**
	 * The lower angle for the joint limit (radians).
	 */
	public var lowerAngle:Float;
	
	/**
	 * The upper angle for the joint limit (radians).
	 */
	public var upperAngle:Float;
	
	/**
	 * Creates a new RevoluteJointData instance.
	 * 
	 * @param body1   The first body attached to the joint.
	 * @param body2   The second body attached to the joint.
	 * @param anchor  The anchor in world space.
	 */
	public function new(body1:RigidBody, body2:RigidBody, anchor:Vec2)
	{
		super(body1, body2);
		
		referenceAngle = body2.sweep.a - body1.sweep.a;
		
		lowerAngle = upperAngle = 0;
		enableLimit = false;
		
		motorSpeed = maxMotorTorque = 0;
		enableMotor = false;
		
		var t:Vec2 = new Vec2();
		
		var a1 = new Vec2();
		var a2 = new Vec2();
		
		body1.getLocalPoint(anchor.x, anchor.y, a1);
		body2.getLocalPoint(anchor.x, anchor.y, a2);
		
		anchor1 = new Vec2();
		anchor2 = new Vec2();
		
		this.anchor1.x = a1.x;
		this.anchor1.y = a1.y;
		
		this.anchor2.x = a2.x;
		this.anchor2.y = a2.y;
		
	}

	override function _getJointClass():Class<Joint>
	{
		return RevoluteJoint;
	}
	
	override function _setType():Void
	{
		type = JointType.REVOLUTE;
	}
}