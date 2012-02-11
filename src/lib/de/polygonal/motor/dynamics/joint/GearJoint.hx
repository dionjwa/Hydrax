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
package de.polygonal.motor.dynamics.joint;
	
import de.polygonal.core.util.Assert;
import de.polygonal.core.math.Vec2;
import de.polygonal.motor.Settings;
import de.polygonal.motor.World;
import de.polygonal.motor.dynamics.RigidBody;
import de.polygonal.motor.dynamics.joint.GearJoint;
import de.polygonal.motor.dynamics.joint.data.GearJointData;

/**
 * A gear joint connects two joints. Think of them as cogs with a fixed number of teeth, 
 * so they have a gear ratio. If for example two revolute joints are used the ratio is used to
 * calculated the ratio between the angles of the 'cogs', if one is rotated by 2 degrees the other one
 * is rotated by 4 if the ratio is 2. With prismatic joints the ratio specifies the ratio between the translated
 * distances. 
 */	
class GearJoint extends Joint
{
	public var ratio:Float;

	var _joint1:Joint;
	var _joint2:Joint;
	
	var _type1:Int;
	var _type2:Int;
	
	var _ground1:RigidBody;
	var _ground2:RigidBody;	
	
	var _impulse:Float;
	var _mass:Float;

	var _ux:Float;
	var _uy:Float;
	
	var _r1x:Float; var _r2x:Float;
	var _r1y:Float; var _r2y:Float;
	
	var _ga1x:Float; var _ga2x:Float;
	var _ga1y:Float; var _ga2y:Float;
	
	var _w1:Float; var _w2:Float;
	var _v1x:Float; var _v1y:Float;
	var _v2x:Float; var _v2y:Float;
	
	var _total:Float;
	
	/**
	 * Creates a new GearJoint instance.
	 * 
	 * @param data The joint parameters.
	 */
	public function new(data:GearJointData, world:World)
	{
		super(data, world);
		
		var d:GearJointData = cast(data,GearJointData);
		
		_type1 = d.joint1.type;
		_type2 = d.joint2.type;
		
		_joint1 = d.joint1;
		_joint2 = d.joint2;

		#if debug
		Assert.assert(_type1 == JointType.PRISMATIC || _type1 == JointType.REVOLUTE, "_type1 == JointType.PRISMATIC || _type1 == JointType.REVOLUTE)");
		#end
			
		#if debug
		Assert.assert(_type2 == JointType.PRISMATIC || _type2 == JointType.REVOLUTE, "_type2 == JointType.PRISMATIC || _type2 == JointType.REVOLUTE");
		#end
		
		#if debug
		Assert.assert(_joint1.body1.isStatic && _joint2.body1.isStatic, "_joint1.body1.isStatic && _joint2.body1.isStatic");
		#end
		
		
		_ground1 = _joint1.body1;
		_ground2 = _joint2.body1;

		var coord1 = 0.; var coord2 = 0.;
		
		if (_type1 == JointType.REVOLUTE)
		{
			var joint1A:RevoluteJoint =  cast(_joint1,RevoluteJoint);
			_ga1x = joint1A.la1x;
			_ga1y = joint1A.la1y;
			
			la1x = joint1A.la2x;
			la1y = joint1A.la2y;
			
			coord1 = joint1A.getJointAngle();
		}
		else if(_type1 == JointType.PRISMATIC)
		{
			var joint1B:PrismaticJoint = cast(_joint1,PrismaticJoint);  
			_ga1x = joint1B.la1x;
			_ga1y = joint1B.la1y;
			
			la1x = joint1B.la2x;
			la1y = joint1B.la2y;
			
			coord1 = joint1B.getJointTranslation();
		}	
		
		if (_type2 == JointType.REVOLUTE)
		{
			var joint2A:RevoluteJoint =  cast(_joint2,RevoluteJoint);
			_ga2x = joint2A.la1x;
			_ga2y = joint2A.la1y;
			
			la2x = joint2A.la2x;
			la2y = joint2A.la2y;
			
			coord2 = joint2A.getJointAngle();
		}
		else if(_type2 == JointType.PRISMATIC)
		{
			var joint2B:PrismaticJoint =  cast(_joint2,PrismaticJoint);

			_ga2x = joint2B.la1x;
			_ga2y = joint2B.la1y;
			
			la2x = joint2B.la2x;
			la2y = joint2B.la2y;
		
			coord2 = joint2B.getJointTranslation();
		}
		
		ratio = d.ratio;

		_total = coord1 + ratio * coord2;

		_impulse = 0;
	}
	
	override public function getReactionForce(invdt:Float):Vec2
	{
		var t = _impulse * invdt;
		return new Vec2(_v2x * t, _v2y * t);
	}
	
	
	override public function getReactionTorque(invdt:Float):Float
	{
		//var b2 = body2.getXForm().R;
		var b2 = body2.TWorld;
		var c2 = body2.localCenter;
		
		var rx = b2.m11 * (la2x - c2.x) + b2.m12 * (la2y - c2.y);
		var ry = b2.m21 * (la2x - c2.x) + b2.m22 * (la2y - c2.y);
		
		var L = _impulse * _w2 - rx * _impulse * _v2x + ry * _impulse * _v2y; 
		return  invdt * L;
	}
	
	override public function preStep(settings:Settings):Void
	{
		//super.preStep(dt);
		
		var K = 0.;
		
		_w1 = 0;
		_w2 = 0;	
		_v1x = 0;
		_v1y = 0;
		_v2x = 0;
		_v2y = 0;
		
		var cross;
		
		if(_type1 == JointType.REVOLUTE)
		{
			_w1 = -1;
			K += body1.invI;	
		}
		else
		{	
			//var g1 = _ground1.getXForm().R;	
			var g1 = _ground1.TWorld;	
			
			//var b1 = body1.getXForm().R;
			var b1 = body1.TWorld;
			var c1 = body1.localCenter;
			var joint1:PrismaticJoint = cast(_joint1, PrismaticJoint);
			
			_ux = g1.m11 * joint1.aXx + g1.m12 * joint1.aXy;
			_uy = g1.m21 * joint1.aXx + g1.m22 * joint1.aXy;
			
			_r1x = b1.m11 * (la1x - c1.x) + b1.m12 * (la1y - c1.y);
			_r1y = b1.m21 * (la1x - c1.x) + b1.m22 * (la1y - c1.y);	
			
			_v1x = -_ux;
			_v1y = -_uy;
			cross = _r1x * _uy - _r1y * _ux;
			_w1 = -cross;
			
			K += body1.invMass + body1.invI * cross * cross;
		}
		
		if(_type2 == JointType.REVOLUTE)
		{
			_w2 = -ratio;
			K += ratio * ratio * body2.invI;
		}
		else
		{
			//var g2 = _ground2.getXForm().R;
			var g2 = _ground2.TWorld;
			
			//var b2 = body2.getXForm().R;
			var b2 = body2.TWorld;
			var c2 = body2.localCenter;
			var joint2:PrismaticJoint = cast(_joint2, PrismaticJoint);
			
			_ux = g2.m11 * joint2.aXx + g2.m12 * joint2.aXy;
			_uy = g2.m21 * joint2.aXx + g2.m22 * joint2.aXy;
			
			_r2x = b2.m11 * (la2x - c2.x) + b2.m12 * (la2y - c2.y);
			_r2y = b2.m21 * (la2x - c2.x) + b2.m22 * (la2y - c2.y);
			
			_v2x = -ratio * _ux;
			_v2y = -ratio * _uy;
			
			cross = _r2x * _uy - _r2y * _ux;
			_w2 = -ratio * cross;
			
			K +=  ratio * ratio * (body2.invMass + body2.invI * cross * cross);
		}
		
		#if debug
		Assert.assert(K > 0, "K > 0");
		#end
		
		_mass = 1 / K;	
		
		if (settings.doWarmStart)
		{
			//TODO scaling for variable timestep?
			body1.vx += body1.invMass * _impulse * _v1x;
			body1.vy += body1.invMass * _impulse * _v1y;
			body1.w += body1.invI *_impulse * _w1;
			
			body2.vx += body2.invMass * _impulse * _v2x;
			body2.vy += body2.invMass * _impulse * _v2y;
			body2.w += body2.invI *_impulse * _w2;
		}
		else
		{
			_impulse = 0;
		}
	}
	
	override public function solveVelConstraints(dt:Float):Void
	{
		var Cdot = _v1x * body1.vx + _v1y * body1.vy + _w1 * body1.w + _v2x * body2.vx + _v2y * body2.vy + body2.w * _w2;  
		var newImpulse = - _mass * Cdot;

		_impulse += newImpulse;

		body1.vx += body1.invMass * newImpulse * _v1x;
		body1.vy += body1.invMass * newImpulse * _v1y;
		body1.w  += body1.invI * newImpulse * _w1;
		
		body2.vx += body2.invMass * newImpulse * _v2x;
		body2.vy += body2.invMass * newImpulse * _v2y;
		body2.w  += body2.invI  * newImpulse * _w2;
	}
	
	override public function solvePosConstraints():Bool
	{
		var linearError = 0.;
		var coord1 = 0., coord2 = 0.;
		
		if (_type1 == JointType.REVOLUTE)
		{
			coord1 = cast(_joint1, RevoluteJoint).getJointAngle();				
		}
		else if(_type1 == JointType.PRISMATIC)
		{
			coord1 = cast(_joint1, PrismaticJoint).getJointTranslation();			
		}
	
		if (_type2 == JointType.REVOLUTE)
		{
			coord2 = cast(_joint2, RevoluteJoint).getJointAngle();				
		}
		else if(_type2 == JointType.PRISMATIC)
		{
			coord2 = cast(_joint2, PrismaticJoint).getJointTranslation();		
		}

		var C = _total - (coord1 + ratio * coord2);		
		var newImpulse = - _mass * C;

		var s1 = body1.sweep.c;
		var s2 = body2.sweep.c;	
		
		var a1 = body1.sweep.a;
		var a2 = body2.sweep.a;

		s1.x += body1.invMass * newImpulse * _v1x;
		s1.y += body1.invMass * newImpulse * _v1y;
		a1 += body1.invI * newImpulse * _w1;

		s2.x += body2.invMass * newImpulse * _v2x;
		s2.y += body2.invMass * newImpulse * _v2y;
		a2 += body2.invI * newImpulse * _w2;		

		body1.syncT();
		body2.syncT();

		return linearError < _settings.linSlop;
	}
}