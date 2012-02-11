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

import de.polygonal.motor.data.RigidBodyData;
import de.polygonal.motor.dynamics.joint.Joint;
import de.polygonal.motor.dynamics.RigidBody;
import de.polygonal.motor.dynamics.joint.JointType;
import de.polygonal.motor.dynamics.joint.MouseJoint;
import de.polygonal.core.math.Vec2;
import de.polygonal.motor.World;

/**
 * Mouse joint definition.
 * 
 * This requires a world target point, tuning parameters, and the time step.
 */
class MouseJointData extends JointData
{
	/**
	 * The initial world target point. This is assumed to coincide with the
	 * body anchor initially.
	 */
	public var target:Vec2;
	
	/**
	 * The maximum constraint force that can be exerted to move the
	 * candidate body. Usually you will express as some multiple of the
	 * weight (multiplier * mass * gravity).
	 */
	public var maxForce:Float;
	
	/**
	 * The response speed.
	 */
	public var frequencyHz:Float;
	
	/**
	 * The damping ratio. 0 = no damping, 1 = critical damping.
	 */
	public var dampingRatio:Float;
	
	/**
	 * The time step used in the simulation.
	 */
	//public var timeStep:Float;
	
	/**
	 * Create a new MouseJointData instance.
	 * 
	 * @param body   The body attached to the joint.
	 * @param target The world body target point.
	 */
	public function new(body:RigidBody, target:Vec2)
	{
		//TODO check for problems pushing the same body 
		super(body,body);
		
		maxForce     = 0;
		frequencyHz  = 5;
		dampingRatio = .7;
		//timeStep     = 1 / 60;
		
		this.target = target.clone();
	}
	
	override function _getJointClass():Class<Joint>
	{
		return MouseJoint;
	}
	
	override function _setType():Void
	{
		type = JointType.MOUSE;
	}
}