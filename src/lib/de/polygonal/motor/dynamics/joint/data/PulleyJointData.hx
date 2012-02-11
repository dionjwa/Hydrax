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

import de.polygonal.motor.dynamics.RigidBody;
import de.polygonal.motor.dynamics.joint.PulleyJoint;
import de.polygonal.motor.dynamics.joint.JointType;
import de.polygonal.core.math.Vec2;
import de.polygonal.motor.dynamics.joint.Joint;

/**
 * Pulley joint definition.
 * 
 * This requires two ground anchors, two dynamic body anchors, maximum
 * lengths for each side and a pulley ratio. 
 */
class PulleyJointData extends JointData
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
	 * The first ground anchor in world coordinates. This point never moves.
	 */
	public var groundAnchor1:Vec2;
	
	/**
	 * The second ground anchor in world coordinates. This point never moves.
	 */
	public var groundAnchor2:Vec2;
	
	/**
	 * The position of a static ground body 
	 */
	public var ground:Vec2;
	
	/**
	 * The a reference length for the segment attached to body1. 
	 */
	public var length1:Float;
	
	/**
	 * The a reference length for the segment attached to body2. 
	 */
	public var length2:Float;
	
	/**
	 * The maximum length of the segment attached to body1.
	 */
	public var maxlength1:Float;
	
	/**
	 * The maximum length of the segment attached to body2.
	 */
	public var maxlength2:Float;
	
	/**
	 *  The pulley ratio.
	 */
	public var ratio:Float;
	
	/**
	 * Minimum allowed joint length.
	 */
	public var minLength:Float;
	
	/**
	 * Creates a new PulleyJointData instance.
	 * 
	 * @param body1   The first body attached to the joint.
	 * @param body2   The second body attached to the joint.
	 * @param anchor1 The body1's anchor in world space.
	 * @param anchor2 The body2's anchor in world space.
	 * @param groundAnchor1 The body1's groundAnchor in world space.
	 * @param groundAnchor2 The body2's groundAnchor in world space.
	 * @param ratio   The pulley ratio.	
	 */
	public function new(body1:RigidBody, body2:RigidBody, ground:RigidBody, anchor1:Vec2, anchor2:Vec2, groundAnchor1:Vec2, groundAnchor2:Vec2, ratio:Float = 1)
	{
		super(body1, body2);
		
		//this.ground = ground.getXForm().position;
		this.ground = ground.TWorld.getTranslation(new Vec2());
		
		
		
		this.anchor1 = new Vec2();
		this.anchor2 = new Vec2();
		this.groundAnchor1 = new Vec2();
		this.groundAnchor2 = new Vec2();
		
		body1.getLocalPoint(anchor1.x, anchor1.y, this.anchor1);
		body2.getLocalPoint(anchor2.x, anchor2.y, this.anchor2);
		
		this.groundAnchor1.x = groundAnchor1.x;
		this.groundAnchor1.y = groundAnchor1.y;
		
		this.groundAnchor2.x = groundAnchor2.x;
		this.groundAnchor2.y = groundAnchor2.y;

		length1 = Math.sqrt((anchor1.x - groundAnchor1.x) * (anchor1.x - groundAnchor1.x) + (anchor1.y - groundAnchor1.y) * (anchor1.y - groundAnchor1.y));
		length2 = Math.sqrt((anchor2.x - groundAnchor2.x) * (anchor2.x - groundAnchor2.x) + (anchor2.y - groundAnchor2.y) * (anchor2.y - groundAnchor2.y));

		this.ratio = ratio;
		
		//TODO put minLength into settings?
		minLength = 0.02;
		maxlength1 = length1 + ratio * length2 - ratio * minLength;
		maxlength2 = (length1 + ratio * length2 - minLength) / ratio;
	}
	
	/** @private */
	override function _getJointClass():Class<Joint>
	{
		return PulleyJoint;
	}
	
	/** @private */
	override function _setType():Void
	{
		type = JointType.PULLEY;
	}
}