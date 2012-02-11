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
import de.polygonal.motor.dynamics.joint.PulleyJoint;
import de.polygonal.motor.dynamics.joint.data.JointData;
import de.polygonal.motor.dynamics.joint.data.PulleyJointData;

/**
 * The pulley joint is connected to two bodies and two fixed ground points.
 * The pulley ratio defines the total length of the pulley as: 
 * <code>length1 + ratio * length2 <= constant.</code>
 * The transmitted force is scaled by the ratio. 
 */
class PulleyJoint extends Joint
{
	public var ratio:Float;
	
	var _impulse:Float;
	var _limitImpulse1:Float;
	var _limitImpulse2:Float;
	
	var _total:Float;
	var _maxlength1:Float;
	var _maxlength2:Float;
	
	var _limitMass1:Float;
	var _limitMass2:Float;
	var _pulleyMass:Float;
	
	var _g1x:Float;
	var _g1y:Float; 
	
	var _ux1:Float;
	var _uy1:Float;
	var _ux2:Float;
	var _uy2:Float;
	
	var _r1x:Float; var _r2x:Float;
	var _r1y:Float; var _r2y:Float;
	
	var _ga1x:Float; var _ga1y:Float;
	var _ga2x:Float; var _ga2y:Float;
	
	var _state:Int;
	var _limitState1:Int;
	var _limitState2:Int;
	
	/**
	 * Creates a new PulleyJoint instance.
	 * 
	 * @param data The joint parameters.
	 */
	public function new(data:PulleyJointData, world:World)
	{
		super(data, world);
		
		var d:PulleyJointData = cast(data, PulleyJointData);
		
		var g = d.ground;
		
		//TODO check
		_g1x = g.x;
		_g1y = g.y;
		 
		la1x = d.anchor1.x;
		la1y = d.anchor1.y;
		
		la2x = d.anchor2.x;
		la2y = d.anchor2.y;						
		
		_ga1x = d.groundAnchor1.x - _g1x;
		_ga1y = d.groundAnchor1.y - _g1y;
		
		_ga2x = d.groundAnchor2.x - _g1x;
		_ga2y = d.groundAnchor2.y - _g1y;
		
		#if debug
		de.polygonal.core.util.Assert.assert(d.ratio != 0, "d.ratio != 0");
		#end
			
		ratio = d.ratio;
		
		_total = d.length1 + ratio * d.length2;			
		
		_maxlength1 = d.maxlength1 < (_total - ratio * d.minLength) ? d.maxlength1 : (_total - ratio * d.minLength);
		_maxlength2 = d.maxlength2 < ((_total - d.minLength)/ratio) ? d.maxlength2 : ((_total - d.minLength)/ratio);
		
		_impulse = _limitImpulse1 = _limitImpulse2 = 0;
	}
	
	/** @inheritDoc */
	override public function getReactionForce(invdt:Float):Vec2
	{
		var t = _impulse * invdt;
		var reactionForce:Vec2 = new Vec2(_ux2 * t, _uy2 * t);			
		return reactionForce;
	}
	
	/**
	 * Get the first ground anchor.
	 */
	public function getGroundAnchor1():Vec2
	{			
		var a = new Vec2();			
		a.x = _ga1x + _g1x;
		a.y = _ga1y + _g1y;
		return a;
	}
	
	/**
	 *  Get the second ground anchor.
	 */
	public function getGroundAnchor2():Vec2
	{
		var a = new Vec2();			
		a.x = _ga2x + _g1x;
		a.y = _ga2y + _g1y;
		return a;
	}
	
	/**
	 * Get the current length of the segment attached to body1.
	 */
	public function getLength1():Float
	{
		var t:Vec2 = new Vec2();
		body1.getWorldPoint(la1x, la1y, t);			
		var tx = t.x - (_g1x + _ga1x);
		var ty = t.y - (_g1y + _ga1y);
		
		return Math.sqrt(tx*tx+ty*ty);
	}
	
	/**
	 * Get the current length of the segment attached to body2.
	 */
	public function getLength2():Float
	{
		var t:Vec2 = new Vec2();
		body2.getWorldPoint(la2x, la2y, t);			
		var tx = t.x - (_g1x + _ga2x);
		var ty = t.y - (_g1y + _ga2y);
		
		return Math.sqrt(tx*tx+ty*ty);
	}
	
	/** @private */
	override public function preStep(settings:Settings):Void
	{			
		//var b1 = body1.getXForm().R;
		//var b2 = body2.getXForm().R;
		
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
		
		//TODO draw function for pulley axes?
		_ux1 = s1.x + _r1x - _g1x - _ga1x;
		_uy1 = s1.y + _r1y - _g1y - _ga1y;
		
		_ux2 = s2.x + _r2x - _g1x - _ga2x;
		_uy2 = s2.y + _r2y - _g1y - _ga2y;
		
		var l1 = Math.sqrt(_ux1 * _ux1 + _uy1 * _uy1);
		var l2 = Math.sqrt(_ux2 * _ux2 + _uy2 * _uy2);			
		
		if (l1 > _settings.linSlop)
		{
			_ux1 /= l1;
			_uy1 /= l1;
		}
		else
		{
			_ux1 = 0;
			_uy1 = 0;
		}
		
		if (l2 > _settings.linSlop)
		{
			_ux2 /= l2;
			_uy2 /= l2;
		}
		else
		{
			_ux2 = 0;
			_uy2 = 0;
		}			
		
		var C = _total - l1 - ratio * l2;			
		
		if (C > 0)
		{				
			_state = LimitState.INACTIVE;
			_impulse = 0;
		}
		else
			_state = LimitState.UPPER;
			
		if (l1 < _maxlength1)
		{
			_limitState1 = LimitState.INACTIVE;
			_limitImpulse1 = 0;
		}
		else
			_limitState1 = LimitState.UPPER;
	
		if (l2 < _maxlength2)
		{
			_limitState2 = LimitState.INACTIVE;
			_limitImpulse2 = 0;
		}
		else
			_limitState2 = LimitState.UPPER;
		
		var cr1u1 = (_r1x * _uy1 - _r1y * _ux1);
		var cr2u2 = (_r2x * _uy2 - _r2y * _ux2);
		
		
		var invMass1 = body1.invMass + body1.invI * cr1u1 * cr1u1;	
		var invMass2 = body2.invMass + body2.invI * cr2u2 * cr2u2;
		var invMass3 = invMass1 + ratio * ratio * invMass2;
		
		#if debug
		de.polygonal.core.util.Assert.assert(invMass1 > _settings.eps, "invMass1 > _settings.eps");
		#end
		
		_limitMass1 = 1 / invMass1;
		
		#if debug
		de.polygonal.core.util.Assert.assert(invMass2 > _settings.eps, "invMass2 > _settings.eps");
		#end
		
		_limitMass2 = 1 / invMass2;
		
		#if debug
		de.polygonal.core.util.Assert.assert(invMass3 > _settings.eps, "invMass3 > _settings.eps");
		#end
		
		_pulleyMass = 1 / invMass3;
		
		if (_settings.doWarmStart)
		{				
			_impulse *= settings.dtRatio;
			_limitImpulse1 *= settings.dtRatio;
			_limitImpulse2 *= settings.dtRatio;
			
			var px1 = -(_impulse +_limitImpulse1) * _ux1;
			var py1 = -(_impulse +_limitImpulse1) * _uy1;
			
			var px2 = (- ratio * _impulse -_limitImpulse2) * _ux2;
			var py2 = (- ratio * _impulse -_limitImpulse2) * _uy2;
			
			body1.vx += body1.invMass * px1;
			body1.vy += body1.invMass * py1;
			body1.w  += body1.invI * (_r1x * py1 - _r1y * px1);
			
			body2.vx += body2.invMass * px2;
			body2.vy += body2.invMass * py2;
			body2.w  += body2.invI * (_r2x * py2 - _r2y * px2);
		}
		else
		{
			_impulse = .0;
			_limitImpulse1 = .0;
			_limitImpulse2 = .0;
		}
	}
	
	/** @private */
	override public function solveVelConstraints(dt:Float):Void
	{
		var v1x = 0.;
		var v1y = 0.;
		var v2x = 0.;
		var v2y = 0.;
		var Cdot = 0.;
		var newImpulse = 0.;
		var oldImpulse = 0.;
		var px1 = 0.;
		var py1 = 0.;
		var px2 = 0.;
		var py2 = 0.;
		
		if (_state == LimitState.UPPER)
		{				
			v1x = body1.vx - body1.w * _r1y;
			v1y = body1.vy + body1.w * _r1x;
			
			v2x = body2.vx - body2.w * _r2y;
			v2y = body2.vy + body2.w * _r2x;
			
			Cdot = -(_ux1 * v1x + _uy1 * v1y) - ratio * (_ux2 * v2x + _uy2 * v2y);
			
			newImpulse = -_pulleyMass * Cdot;
			oldImpulse = _impulse;
			
			_impulse =	0 > (newImpulse + _impulse) ? 0 : (newImpulse + _impulse);
			newImpulse = _impulse - oldImpulse;
			
			px1 = - newImpulse * _ux1;
			py1 = - newImpulse * _uy1;
			px2 = - ratio * newImpulse * _ux2;
			py2 = - ratio * newImpulse * _uy2;

			body1.vx += body1.invMass * px1;
			body1.vy += body1.invMass * py1;
			body1.w  += body1.invI  * (_r1x * py1 - _r1y * px1);
			
			body2.vx += body2.invMass * px2;
			body2.vy += body2.invMass * py2;
			body2.w  += body2.invI  * (_r2x * py2 - _r2y * px2);
		}
		
		if (_limitState1 == LimitState.UPPER)
		{				
			v1x = body1.vx - body1.w * _r1y;
			v1y = body1.vy + body1.w * _r1x;
			
			Cdot = -(_ux1 * v1x + _uy1 * v1y);
			
			newImpulse = -_limitMass1 * Cdot;
			oldImpulse = _limitImpulse1;
			
			_limitImpulse1 = 0 > (newImpulse + _limitImpulse1) ? 0 : (newImpulse + _limitImpulse1);
			newImpulse = _limitImpulse1 - oldImpulse;
			
			px1 = - newImpulse * _ux1;
			py1 = - newImpulse * _uy1;
					
			body1.vx += body1.invMass * px1;
			body1.vy += body1.invMass * py1;
			body1.w  += body1.invI  * (_r1x * py1 - _r1y * px1);
		}
		
		if (_limitState2 == LimitState.UPPER)
		{
			v2x = body2.vx - body2.w * _r2y;
			v2y = body2.vy + body2.w * _r2x;
			
			Cdot = -(_ux2 * v2x + _uy2 * v2y);
			
			newImpulse = -_limitMass2 * Cdot;
			oldImpulse = _limitImpulse2;
			
			_limitImpulse2 = 0 > (newImpulse + _limitImpulse2) ? 0 : (newImpulse + _limitImpulse2);
			newImpulse = _limitImpulse2 - oldImpulse;
			
			px2 = - newImpulse * _ux2;
			py2 = - newImpulse * _uy2;
			
			body2.vx += body2.invMass * px2;
			body2.vy += body2.invMass * py2;
			body2.w  += body2.invI  * (_r2x * py2 - _r2y * px2);
		}
	
	}
	
	/** @private */
	override public function solvePosConstraints():Bool
	{			
		var linearError = 0.;
		
		var C = 0.;			
		
		var newImpulse = 0.;					
		
		//var x = 0.;
		//var t = 0.;
		
		if (_state == LimitState.UPPER)
		{			
			//var b1 = body1.getXForm().R;
			//var b2 = body2.getXForm().R;
			
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
			
			_ux1 = s1.x + _r1x - _g1x - _ga1x;
			_uy1 = s1.y + _r1y - _g1y - _ga1y;
			
			_ux2 = s2.x + _r2x - _g1x - _ga2x;
			_uy2 = s2.y + _r2y - _g1y - _ga2y;
			
			var l1 = 0.;
			var l2 = 0.;
			var px1 = 0.;
			var py1 = 0.;
			var px2 = 0.;
			var py2 = 0.;
		
			l1 = Math.sqrt(_ux1 * _ux1 + _uy1 * _uy1);
			l2 = Math.sqrt(_ux2 * _ux2 + _uy2 * _uy2);
			
			var linSlop = _settings.linSlop;
			var maxLinCorrection = _settings.maxLinCorrection;
			
			if (l1 > linSlop)
			{
				_ux1 /= l1;
				_uy1 /= l1;
			}
			else
			{
				_ux1 = 0;
				_uy1 = 0;
			}
			
			if (l2 > linSlop)
			{
				_ux2 /= l2;
				_uy2 /= l2;
			}
			else
			{
				_ux2 = 0;
				_uy2 = 0;
			}		
			
			C = _total - l1 - ratio * l2;
			
			linearError = (linearError > -C) ? linearError : -C;
			
			C = ((C + linSlop) < -maxLinCorrection) ? -maxLinCorrection : (((C + linSlop) > 0) ? 0 : (C + linSlop));
			newImpulse = -_pulleyMass * C;
			
			px1 = - newImpulse * _ux1;
			py1 = - newImpulse * _uy1;
			
			px2 = - ratio * newImpulse * _ux2;
			py2 = - ratio * newImpulse * _uy2;
			
			var a1 = body1.sweep.a; 
			var a2 = body2.sweep.a;
			
			s1.x += body1.invMass * px1;
			s1.y += body1.invMass * py1;
			a1  += body1.invI * (_r1x * py1 - _r1y * px1);
			
			s2.x += body2.invMass * px2;
			s2.y += body2.invMass * py2;
			a2  += body2.invI * (_r2x * py2 - _r2y * px2);
			
			body1.syncT();
			body2.syncT();
		}
		if (_limitState1 == LimitState.UPPER)
		{
			//var b1 = body1.getXForm().R;
			var b1 = body1.TWorld;
						
			var c1 = body1.localCenter;
						
			// World coordinates of vector center to anchors
			// same as getWorldDirection() in rigidbody
			
			_r1x = b1.m11 * (la1x - c1.x) + b1.m12 * (la1y - c1.y);
			_r1y = b1.m21 * (la1x - c1.x) + b1.m22 * (la1y - c1.y);				
						
			var s1 = body1.sweep.c;				
			
			_ux1 = s1.x + _r1x - _g1x - _ga1x;
			_uy1 = s1.y + _r1y - _g1y - _ga1y;				
			
			var l1 = 0.;
			
			var px1 = 0.;
			var py1 = 0.;				
			
			l1 = Math.sqrt(_ux1 * _ux1 + _uy1 * _uy1);
			
			var linSlop = _settings.linSlop;
			var maxLinCorrection = _settings.maxLinCorrection;
			
			if (l1 > linSlop)
			{
				_ux1 /= l1;
				_uy1 /= l1;
			}
			else
			{
				_ux1 = 0;
				_uy1 = 0;
			}
			
			C = _maxlength1 - l1;
			
			linearError = (linearError > -C) ? linearError : -C;	
			C = ((C + linSlop) < -maxLinCorrection) ? -maxLinCorrection : (((C + linSlop) > 0) ? 0 : (C + linSlop));
			
			newImpulse = -_limitMass1 * C;
			
			px1 = - newImpulse * _ux1;
			py1 = - newImpulse * _uy1;
			
			var a1 = body1.sweep.a; 
			
			s1.x += body1.invMass * px1;
			s1.y += body1.invMass * py1;
			a1  += body1.invI * (_r1x * py1 - _r1y * px1);
			
			body1.syncT();
		}
		
		var linSlop = _settings.linSlop;
		
		if (_limitState2 == LimitState.UPPER)
		{				
			//var b2 = body2.getXForm().R;
			var b2 = body2.TWorld;
		
			var c2 = body2.localCenter;				
			
			_r2x = b2.m11 * (la2x - c2.x) + b2.m12 * (la2y - c2.y);
			_r2y = b2.m21 * (la2x - c2.x) + b2.m22 * (la2y - c2.y);										
			
			var s2 = body2.sweep.c;				
			
			_ux2 = s2.x + _r2x - _g1x - _ga2x;
			_uy2 = s2.y + _r2y - _g1y - _ga2y;				
			
			var l2 = 0.;
			
			var px2 = 0.;
			var py2 = 0.;

			l2 = Math.sqrt(_ux2 * _ux2 + _uy2 * _uy2);
			
			
			var maxLinCorrection = _settings.maxLinCorrection;
			
			if (l2 > linSlop)
			{
				_ux2 /= l2;
				_uy2 /= l2;
			}
			else
			{
				_ux2 = 0;
				_uy2 = 0;
			}
			
			C = _maxlength2 - l2;
			
			linearError = (linearError > -C) ? linearError : -C;	
			C = ((C + linSlop) < -maxLinCorrection) ? -maxLinCorrection : (((C + linSlop) > 0) ? 0 : (C + linSlop));
			
			newImpulse = -_limitMass2 * C;
			
			px2 = - newImpulse * _ux2;
			py2 = - newImpulse * _uy2;
			
			var a2 = body2.sweep.a;
			
			s2.x += body2.invMass * px2;
			s2.y += body2.invMass * py2;
			a2  += body2.invI * (_r2x * py2 - _r2y * px2);
			
			body2.syncT();
		}
		return linearError < linSlop;
	}
}