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
	
import de.polygonal.core.math.Vec2;	
import de.polygonal.motor.Settings;
import de.polygonal.motor.World;
import de.polygonal.motor.dynamics.RigidBody;	
import de.polygonal.motor.dynamics.joint.data.DistanceJointData;

/**
 * A distance joint constrains two points on two bodies to remain at a fixed
 * distance from each other. You can view this as a massless, rigid rod.
 */
class DistanceJoint extends Joint
{
	var _frequencyHz:Float;
	var _dampingRatio:Float;
	var _gamma:Float;
	var _bias:Float;

	var _impulse:Float;
	var _length:Float;
	var _mass:Float;

	var _ux:Float; var _r1x:Float; var _r2x:Float;
	var _uy:Float; var _r1y:Float; var _r2y:Float;

	/**
	 * Creates a new DistanceJoint instance.
	 *
	 * @param data The joint parameters.
	 */
	public function new(data:DistanceJointData, world:World)
	{
		super(data, world);

		var d:DistanceJointData = data;

		la1x = d.anchor1.x;
		la1y = d.anchor1.y;

		la2x = d.anchor2.x;
		la2y = d.anchor2.y;

		_length       = d.length;
		_frequencyHz  = d.frequencyHz;
		_dampingRatio = d.dampingRatio;

		_gamma = _bias = _impulse = 0;
	}

	override public function getReactionForce(invdt:Float):Vec2
	{
		var t = _impulse * invdt;
		return new Vec2(_ux * t, _uy * t);
	}

	override public function preStep(settings:Settings):Void
	{		
		var b1 = body1.TWorld;
		var b2 = body2.TWorld;
		
		var c1 = body1.localCenter;
		var c2 = body2.localCenter;
		
		// World coordinates of vector center to anchors
		// same as getWorldDirection() in rigidbody
		
		_r1x = b1.m11 * (la1x - c1.x) + b1.m12 * (la1y - c1.y);
		_r1y = b1.m21 * (la1x - c1.x) + b1.m22 * (la1y - c1.y);

		_r2x = b2.m11 * (la2x - c2.x) + b2.m12 * (la2y - c2.y);
		_r2y = b2.m21 * (la2x - c2.x) + b2.m22 * (la2y - c2.y);

		//sweep
		var s1 = body1.sweep.c;
		var s2 = body2.sweep.c;
		
		_ux = s2.x + _r2x - s1.x - _r1x;
		_uy = s2.y + _r2y - s1.y - _r1y;

		var l = Math.sqrt(_ux * _ux + _uy * _uy);
		if (l > settings.linSlop)
		{
			_ux /= l;
			_uy /= l;
		}
		else
		{
			_ux = 0;
			_uy = 0;
		}

		var cr1u = (_r1x * _uy - _r1y * _ux);
		var cr2u = (_r2x * _uy - _r2y * _ux);

		var invMass = body1.invMass + body1.invI * cr1u * cr1u + body2.invMass + body2.invI * cr2u * cr2u;

		#if debug
		de.polygonal.core.util.Assert.assert(invMass > settings.eps, "invMass > settings.eps");
		#end
		
		_mass = 1.0 / invMass;

		if (_frequencyHz > 0)
		{
			var omega = 2 * Math.PI * _frequencyHz;
			var k = _mass * omega * omega;
			_gamma = 1 / (settings.dt * ((2 * _mass * _dampingRatio * omega) + settings.dt * k));
			_bias = (l - _length) * settings.dt * k * _gamma;
			_mass = 1 / (invMass + _gamma);
		}

		if (settings.doWarmStart)
		{
			//scale
			_impulse *= settings.dtRatio;
			
			var px = _impulse * _ux;
			var py = _impulse * _uy;

			body1.vx -= body1.invMass * px;
			body1.vy -= body1.invMass * py;
			body1.w  -= body1.invI * (_r1x * py - _r1y * px);

			body2.vx += body2.invMass * px;
			body2.vy += body2.invMass * py;
			body2.w  += body2.invI * (_r2x * py - _r2y * px);
		}
		else
			_impulse = .0;
	}

	override public function solveVelConstraints(dt:Float):Void
	{			
		/*// orientation could have changed do calculations again
		 * // TODO not needed if this function is called directly after prestep
		 * TODO check if warmstarting has influence on this
		var b1 = body1.getXForm().R; 
		var b2 = body2.getXForm().R;
		
		var c1 = body1.getLocalCenter();
		var c2 = body2.getLocalCenter();
		
		// World coordinates of vector center to anchors
		// same as getWorldDirection() in rigidbody	
		_r1x = b1.m11 * (la1x - c1.x) + b1.m12 * (la1y - c1.y);
		_r1y = b1.m21 * (la1x - c1.x) + b1.m22 * (la1y - c1.y);

		_r2x = b2.m11 * (la2x - c2.x) + b2.m12 * (la2y - c2.y);
		_r2y = b2.m21 * (la2x - c2.x) + b2.m22 * (la2y - c2.y);*/
		
		var v1x = body1.vx - body1.w * _r1y;
		var v1y = body1.vy + body1.w * _r1x;

		var v2x = body2.vx - body2.w * _r2y;
		var v2y = body2.vy + body2.w * _r2x;

		//TODO update _ux, _uy ??? leftover from prestep
		var Cdot = (_ux * (v2x - v1x) + _uy * (v2y - v1y));

		var newImpulse = -_mass * (Cdot + _bias + _gamma * _impulse);
		_impulse += newImpulse;

		var px = newImpulse * _ux;
		var py = newImpulse * _uy;

		body1.vx -= body1.invMass * px;
		body1.vy -= body1.invMass * py;
		body1.w  -= body1.invI  * (_r1x * py - _r1y * px);

		body2.vx += body2.invMass * px;
		body2.vy += body2.invMass * py;
		body2.w  += body2.invI  * (_r2x * py - _r2y * px);
	}

	override public function solvePosConstraints():Bool
	{
		if (_frequencyHz > 0)
			return true;

		//position and orientations changed
		var b1 = body1.TWorld;
		var b2 = body2.TWorld;
		
		var c1 = body1.localCenter;
		var c2 = body2.localCenter;
		
		// World coordinates of vector center to anchors
		// same as getWorldDirection() in rigidbody
		
		_r1x = b1.m11 * (la1x - c1.x) + b1.m12 * (la1y - c1.y);
		_r1y = b1.m21 * (la1x - c1.x) + b1.m22 * (la1y - c1.y);

		_r2x = b2.m11 * (la2x - c2.x) + b2.m12 * (la2y - c2.y);
		_r2y = b2.m21 * (la2x - c2.x) + b2.m22 * (la2y - c2.y);
		
		var s1 = body1.sweep.c;
		var s2 = body2.sweep.c;
		
		_ux = s2.x + _r2x - s1.x - _r1x;
		_uy = s2.y + _r2y - s1.y - _r1y;

		var l = Math.sqrt(_ux * _ux + _uy * _uy);
		_ux /= l;
		_uy /= l;

		var C = l - _length;

		var maxLinCorrection = _settings.maxLinCorrection;
		
		C = (C < -maxLinCorrection) ? -maxLinCorrection : (C > maxLinCorrection) ? maxLinCorrection : C;

		var newImpulse = -_mass * C;

		var Px = newImpulse * _ux;
		var Py = newImpulse * _uy;

		var a1 = body1.sweep.a;
		var a2 = body2.sweep.a;
		
		s1.x -= body1.invMass * Px;
		s1.y -= body1.invMass * Py;
		a1   -= body1.invI * (_r1x * Py - _r1y * Px);

		s2.x += body2.invMass * Px;
		s2.y += body2.invMass * Py;
		a2   += body2.invI * (_r2x * Py - _r2y * Px);
		
		body1.syncT();
		body2.syncT();
		
		return (C < 0 ? -C : C) < _settings.linSlop;
	}
}