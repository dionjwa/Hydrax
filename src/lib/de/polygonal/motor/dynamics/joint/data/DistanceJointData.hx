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
import de.polygonal.motor.dynamics.joint.DistanceJoint;
import de.polygonal.motor.dynamics.joint.JointType;	
import de.polygonal.core.math.Vec2;

/**
 * Distance joint definition.
 * 
 * This requires defining an anchor point on both bodies and the non-zero
 * length of the distance joint. The definition uses local anchor points so
 * that the initial configuration can violate the constraint slightly.
 * This helps when saving and loading a game. Do not use a zero or short
 * length.
 */
class DistanceJointData extends JointData
{
	/** The local anchor position relative to body1's origin. */
	//TODO should be static 
	public var anchor1:Vec2;
	
	/** The local anchor position relative to body2's origin. */
	public var anchor2:Vec2;
	
	/** The equilibrium length between the anchor points. */
	public var length:Float;
	
	/** The response speed. */
	public var frequencyHz:Float;
	
	/** The damping ratio. 0 = no damping, 1 = critical damping. */
	public var dampingRatio:Float;
	
	/**
	 * Create a new DistanceJointData instance.
	 * 
	 * @param body1   The first body attached to the joint.
	 * @param body2   The second body attached to the joint.
	 * @param anchor1 The body1's anchor in world space.
	 * @param anchor2 The body2's anchor in world space.
	 */
	public function new(body1:RigidBody, body2:RigidBody, anchor1:Vec2, anchor2:Vec2)
	{
		super(body1, body2);
		
		var dx = anchor1.x - anchor2.x;
		var dy = anchor1.y - anchor2.y;
		length = Math.sqrt(dx * dx + dy * dy);
		
		frequencyHz = dampingRatio = 0;
		
		//anchors in local coordinates 
		this.anchor1 = body1.getLocalPoint(anchor1.x, anchor1.y, new Vec2());
		this.anchor2 = body2.getLocalPoint(anchor2.x, anchor2.y, new Vec2());
	}
	
	override function _getJointClass():Class<Joint>
	{
		return DistanceJoint;
	}

	override function _setType():Void
	{
		type = JointType.DISTANCE;
	}
}