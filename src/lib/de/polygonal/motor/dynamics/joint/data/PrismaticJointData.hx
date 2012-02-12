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
import de.polygonal.motor.dynamics.joint.PrismaticJoint;
import de.polygonal.motor.dynamics.joint.JointType;	
import de.polygonal.core.math.Vec2;

/**
 * Prismatic joint definition.
 * 
 * A line of motion is defined through an anchor point and an axis. The
 * joint translation is zero when the  local anchor points are the same
 * in world space. 
 */
class PrismaticJointData extends JointData
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
	 * The local translation axis relative to body1.
	 */	
	public var axis:Vec2;
	
	/**
	 * The constrained angle between the bodies: body2_angle - body1_angle.
	 */	
	public var angle:Float;
	
	/**
	 * The lower joint limit.
	 */	
	public var lowerTrans:Float;
	
	/**
	 * The upper joint limit.
	 */
	public var upperTrans:Float;
	
	/**
	 * The desired motor speed.
	 */
	public var motorSpeed:Float;
	
	/**
	 * The maximum motor torque.
	 */
	public var maxMotorForce:Float;
	
	/**
	 * Enable/disable the joint limit.
	 */
	public var enableLimit:Bool;
	
	/**
	 * A flag to enable the joint motor.
	 */
	public var enableMotor:Bool;
	
	/**
	 * Creates a new PrismaticJointData instance.
	 * 
	 * @param body1   The first body attached to the joint.
	 * @param body2   The second body attached to the joint.
	 * @param anchor  The body1's anchor in world space.
	 * @param axis 	  The axis in world space.
	 */
	public function new(body1:RigidBody, body2:RigidBody, anchor:Vec2, axis:Vec2)
	{
		super(body1, body2);
		
		anchor1 = new Vec2();
		body1.getLocalPoint(anchor.x,anchor.y,anchor1);
		
		anchor2 = new Vec2();
		body2.getLocalPoint(anchor.x,anchor.y,anchor2);

		this.axis = new Vec2();
		body1.getLocalDirection(axis.x, axis.y, this.axis);
		
		angle = body2.sweep.a - body1.sweep.a;

		enableLimit = enableMotor = false;
		upperTrans = lowerTrans = motorSpeed = maxMotorForce = 0;
	}
	
	override function _getJointClass():Class<Joint>
	{
		return PrismaticJoint;
	}

	override function _setType():Void
	{
		type = JointType.PRISMATIC;
	}
}