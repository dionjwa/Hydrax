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

import de.polygonal.motor.dynamics.joint.GearJoint;
import de.polygonal.motor.dynamics.joint.Joint;
import de.polygonal.motor.dynamics.joint.JointType;

/**
 * Gear joint definition.
 * 
 * Two existing revolute or prismatic joints are needed.
 * 
 * Both joints must consist of a dynamic body attached to a static body,
 * where the static body is the first in the initialisation of the
 * prismatic/revolute joints.	 
 */	
class GearJointData extends JointData
{
	/**
	* The first joint, should be a prismatic or revolute joint.
	*/
	public var joint1:Joint;
	
	/**
	 * The second joint, should be a prismatic or revolute joint.
	 */
	public var joint2:Joint;
	
	/**
	 * The gear ratio between the two gears.
	 */
	public var ratio:Float;

	/**
	 * Creates a new GearJointData instance.
	 * 
	 * @param joint1   	The first gear of the joint. 
	 * @param joint2   	The second gear of the joint
	 * @param ratio 	The gear joint's gear ratio.
	 */
	public function new(joint1:Joint, joint2:Joint, ?ratio = 1.0)
	{
		super(joint1.body2,joint2.body2);

		this.joint1 = joint1;
		this.joint2 = joint2;
		
		this.ratio = ratio;
	}
	
	override function _getJointClass():Class<Joint>
	{
		return GearJoint;
	}
	
	override function _setType():Void
	{
		type = JointType.GEAR;
	}
}