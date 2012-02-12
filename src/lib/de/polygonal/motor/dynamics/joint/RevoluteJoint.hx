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
import de.polygonal.motor.dynamics.joint.Joint;
import de.polygonal.motor.dynamics.joint.LimitState;
import de.polygonal.motor.dynamics.joint.data.RevoluteJointData;	

/**
 * A revolute joint constrains to bodies to share a common point while
 * they are free to rotate about the point. The relative rotation about
 * the shared point is the joint angle. You can limit the relative
 * rotation with a joint limit that specifies a lower and upper angle.
 * You can use a motor to drive the relative rotation about the shared
 * point. A maximum motor torque is provided so that infinite forces are
 * not generated.
 */
class RevoluteJoint extends Joint
{
	/**
	 * Enable/disable the joint motor.
	 */
	public var enableMotor:Bool;
	
	/**
	 * The motor speed in radians per second.
	 */
	public var motorSpeed:Float;
	
	/**
	 * The maximum motor torque.
	 */
	public var maxMotorTorque:Float;
	
	/**
	 * Enable/disable the joint limit.
	 */
	public var enableLimit:Bool;
	
	/**
	 * The lower joint limit.
	 */
	public var lowerAngle:Float;
	
	/**
	 * The upper joint limit.
	 */
	public var upperAngle:Float;
	
	var _referenceAngle:Float;

	var _motorMass:Float;
	var _motorImpulse:Float;
			
	var _limitState:Int;
	
	var _impulseX:Float;
	var _impulseY:Float;
	var _impulseZ:Float;
	
	var _r1x:Float; var _r2x:Float;
	var _r1y:Float; var _r2y:Float;
	
	var _k11:Float; var _k12:Float; var _k13:Float;
	var _k21:Float; var _k22:Float; var _k23:Float;
	var _k31:Float; var _k32:Float; var _k33:Float;
	
	/**
	 * Creates a new RevoluteJoint instance.
	 * 
	 * @param data The joint parameters.
	 */
	 
	public function new(data:RevoluteJointData, world:World)
	{
		super(data, world);
		
		var d:RevoluteJointData = data;
		
		la1x = d.anchor1.x;
		la1y = d.anchor1.y;
		
		la2x = d.anchor2.x;
		la2y = d.anchor2.y;
		
		_referenceAngle = d.referenceAngle;
		
		lowerAngle     = d.lowerAngle;
		upperAngle     = d.upperAngle;
		
		maxMotorTorque = d.maxMotorTorque;
		motorSpeed     = d.motorSpeed;
		
		enableLimit    = d.enableLimit;
		enableMotor    = d.enableMotor;
		
		_impulseX = _impulseY = _impulseZ = 0;
		_motorImpulse = 0;
	}
	
	/**
	 * Get the current joint angle in radians.
	 */
	public function getJointAngle():Float
	{
		body1.wakeUp();
		body2.wakeUp();
		
		return body2.sweep.a - body1.sweep.a - _referenceAngle;
	}
	
	/**
	 * Get the current joint angle speed in radians per second.
	 */
	public function getJointSpeed():Float
	{
		body1.wakeUp();
		body2.wakeUp();
		
		return body2.w - body1.w;
	}
	
	/**
	 * Get the current motor torque.
	 */
	public function getMotorTorque():Float
	{
		return _motorImpulse;
	}		

	//TODO better name
	public function enableLimiting(x:Bool):Void
	{
		body1.wakeUp();
		body2.wakeUp();
		enableLimit = x;
	}
	
	//TODO better name
	public function enableMotoring(x:Bool):Void
	{
		body1.wakeUp();
		body2.wakeUp();
		enableMotor = x;
	}
	
	/**
	 * Set the lower and upper joint limit in radian.
	 */
	public function setLimits(lower:Float, upper:Float):Void
	{
		if (lower < upper)
		{
			#if debug
			de.polygonal.core.util.Assert.assert(lower <= upper, "lower <= upper");
			#end
			
			body1.wakeUp();
			body2.wakeUp();
			lowerAngle = lower;
			upperAngle = upper;
		}
	}
	
	public override function getReactionForce(invdt:Float):Vec2
	{			
		return new Vec2(_impulseX * invdt, _impulseY * invdt);
	}
	
	public override function getReactionTorque(invdt:Float):Float
	{
		return invdt * _impulseZ;
	}

	override public function preStep(settings:Settings):Void
	{			
		//super.preStep(dt);			
		if (enableMotor || enableLimit)
		{
			// checks if a body has fix rotation = infinite moment of inertia
			#if debug
			de.polygonal.core.util.Assert.assert(body1.invI > 0 || body2.invI > 0, "body1.invI > 0 || body2.invI > 0");
			#end				
		}
		
		//var b1 = body1.getXForm().R; 
		//var b2 = body2.getXForm().R;		
		
		var c1 = body1.localCenter;
		var c2 = body2.localCenter;
		
		/*_r1x = b1.m11 * (la1x - c1.x) + b1.m12 * (la1y - c1.y);
		_r1y = b1.m21 * (la1x - c1.x) + b1.m22 * (la1y - c1.y);

		_r2x = b2.m11 * (la2x - c2.x) + b2.m12 * (la2y - c2.y);
		_r2y = b2.m21 * (la2x - c2.x) + b2.m22 * (la2y - c2.y);*/
		
		var dx, dy, T;
		
		dx = la1x - c1.x;
		dy = la1y - c1.y;
		T = body1.TWorld;
		_r1x = T.mul22x(dx, dy);
		_r1y = T.mul22y(dx, dy);
		
		dx = la2x - c2.x;
		dy = la2y - c2.y;
		T = body2.TWorld;
		_r2x = T.mul22x(dx, dy);
		_r2y = T.mul22y(dx, dy);
		
		var invMass1 = body1.invMass, invI1 = body1.invI;
		var invMass2 = body2.invMass, invI2 = body2.invI;
		
		_k11 = invMass1 + invMass2 + _r1y * _r1y * invI1 + _r2y * _r2y * invI2;
		_k12 = _k21 = -_r1y * _r1x * invI1 - _r2y * _r2x * invI2;
		_k31 = _k13 =  -_r1y * invI1 - _r2y * invI2;
		_k22 = invMass1 + invMass2 + _r1x * _r1x * invI1 + _r2x * _r2x * invI2;
		_k32 = _k23 = _r1x * invI1 + _r2x * invI2;
		_k33 = invI1 + invI2;

		_motorMass = 1 / (invI1 + invI2);
		
		if (!enableMotor)
			_motorImpulse = 0;
		
		if (enableLimit)
		{
			var jointAngle = body2.sweep.a - body1.sweep.a - _referenceAngle;
			var tmp = upperAngle - lowerAngle;
			
			if ((tmp < 0 ? -tmp : tmp) < 2 * _settings.angSlop)
				_limitState = LimitState.EQUAL;
			else if (jointAngle <= lowerAngle)
			{
				if (_limitState != LimitState.LOWER)
				{
					_impulseZ = 0;
				}
				_limitState = LimitState.LOWER;
			}
			else if (jointAngle >= upperAngle)
			{
				if (_limitState != LimitState.UPPER)
				{
					_impulseZ = 0;
				}
				_limitState = LimitState.UPPER;
			}
			else
			{
				_limitState = LimitState.INACTIVE;
				_impulseZ = 0;
			}
		}
		else
		{
			_limitState = LimitState.INACTIVE;
		}
		
		if (settings.doWarmStart)
		{
			_impulseX *= settings.dtRatio;
			_impulseY *= settings.dtRatio;
			_impulseZ *= settings.dtRatio;
			
			_motorImpulse *= settings.dtRatio;			
			
			body1.vx -= invMass1 * _impulseX;
			body1.vy -= invMass1 * _impulseY;
			body1.w  -= invI1 * ((_r1x * _impulseY - _r1y * _impulseX) + (_motorImpulse + _impulseZ));
			
			body2.vx += invMass2 * _impulseX;
			body2.vy += invMass2 * _impulseY;
			body2.w  += invI2 * ((_r2x * _impulseY - _r2y * _impulseX) + (_motorImpulse + _impulseZ));
		}
		else
		{
			_impulseX = 0;
			_impulseY = 0;
			_impulseZ = 0;
			_motorImpulse = 0;
		}
	}
	
	override public function solveVelConstraints(dt:Float):Void
	{
		var vx1 = body1.vx;
		var vy1 = body1.vy;
		var vx2 = body2.vx;
		var vy2 = body2.vy;
		
		var w1 = body1.w;
		var w2 = body2.w;
		
		var newImpulse = 0.;
		var det = 0.;
		var CX = 0.;
		var CY = 0.;
		var CZ = 0.;
		
		if (enableMotor && _limitState != LimitState.EQUAL)
		{
			var CdotA = w2 - w1 - motorSpeed;
			newImpulse = - _motorMass * CdotA;
			var oldImpulse = _motorImpulse;
			var maxImpulse = dt * maxMotorTorque;
			
			_motorImpulse = ((_motorImpulse + newImpulse) < -maxImpulse) ? -maxImpulse : ((_motorImpulse + newImpulse) > maxImpulse) ? maxImpulse : (_motorImpulse + newImpulse);
			newImpulse = _motorImpulse - oldImpulse;
			
			w1 -= body1.invI * newImpulse;
			w2 += body2.invI * newImpulse;
		}
		
		if (enableLimit && _limitState != LimitState.INACTIVE)
		{
			//calculated in prestep
			/*var b1 = body1.getXForm().R; 
			var b2 = body2.getXForm().R;		
		
			var c1 = body1.localCenter;
			var c2 = body2.localCenter;
		
			_r1x = b1.m11 * (la1x - c1.x) + b1.m12 * (la1y - c1.y);
			_r1y = b1.m21 * (la1x - c1.x) + b1.m22 * (la1y - c1.y);

			_r2x = b2.m11 * (la2x - c2.x) + b2.m12 * (la2y - c2.y);
			_r2y = b2.m21 * (la2x - c2.x) + b2.m22 * (la2y - c2.y);*/				
			
			
			CX = vx2 - w2 * _r2y - vx1 + w1 * _r1y; 
			CY = vy2 + w2 * _r2x - vy1 - w1 * _r1x;
			CZ = w2 - w1;
			
			det = (_k22 * _k33 - _k32 * _k23) * _k11 + (_k32 * _k13 - _k12 * _k33) * _k21 + (_k12 * _k23 - _k22 * _k13) * _k31;
			
			#if debug
			de.polygonal.core.util.Assert.assert(det != 0, "det != 0");
			#end
			
			det = 1 / det;
			
			var newImpulseX = det * (- (_k22 * _k33 - _k32 * _k23) * CX - (_k32 * _k13 - _k12 * _k33) * CY - (_k12 * _k23 - _k22 * _k13) * CZ);
			var newImpulseY = det * ((- CY * _k33 + CZ * _k23) * _k11 + (- CZ * _k13 + CX * _k33) * _k21 + (- CX * _k23 + CY * _k13) * _k31);
			var newImpulseZ = det * ((- _k22 * CZ + _k32 * CY) * _k11 + (- _k32 * CX + _k12 * CZ) * _k21 + (- _k12 * CY + _k22 * CX) * _k31);
			
			if (_limitState == LimitState.EQUAL)
			{
				_impulseX += newImpulseX;
				_impulseY += newImpulseY;
				_impulseZ += newImpulseZ;
			}
			else
			if (_limitState == LimitState.LOWER)
			{
				newImpulse = _impulseZ + newImpulseZ;
				
				if (newImpulse < 0)
				{
					det = _k11 * _k22 - _k12 * _k21;
					#if debug
					de.polygonal.core.util.Assert.assert(det !=0, "det !=0");
					#end
					
					det = 1 / det;						
					
					newImpulseX = det * (-_k22 * CX + _k12 * CY);
					newImpulseY = det * (-_k11 * CY + _k21 * CX);
					newImpulseZ = -_impulseZ;
					
					_impulseX += newImpulseX;
					_impulseY += newImpulseY;
					_impulseZ = 0;
				}
			}
			else if (_limitState == LimitState.UPPER)
			{
				newImpulse = _impulseZ + newImpulseZ;
				
				if (newImpulse > 0)
				{
					det = _k11 * _k22 - _k12 * _k21;
					
					#if debug
					de.polygonal.core.util.Assert.assert(det != 0, "det != 0");
					#end
					
					det = 1 / det;					
					
					newImpulseX = det * (-_k22 * CX + _k12 * CY);
					newImpulseY = det * (-_k11 * CY + _k21 * CX);
					newImpulseZ = -_impulseZ;
					
					_impulseX += newImpulseX;
					_impulseY += newImpulseY;
					_impulseZ = 0;
				}
			}
			
			vx1 -= body1.invMass * newImpulseX;
			vy1 -= body1.invMass * newImpulseY; 
			w1  -= body1.invI * ((_r1x * newImpulseY - _r1y * newImpulseX) + newImpulseZ);
			
			vx2 += body2.invMass * newImpulseX;
			vy2 += body2.invMass * newImpulseY; 
			w2  += body2.invI * ((_r2x * newImpulseY - _r2y * newImpulseX) + newImpulseZ);
		}
		else
		{
			//calculated in prestep
			/*var b1 = body1.getXForm().R; 
			var b2 = body2.getXForm().R;		
		
			var c1 = body1.localCenter;
			var c2 = body2.localCenter;
		
			_r1x = b1.m11 * (la1x - c1.x) + b1.m12 * (la1y - c1.y);
			_r1y = b1.m21 * (la1x - c1.x) + b1.m22 * (la1y - c1.y);

			_r2x = b2.m11 * (la2x - c2.x) + b2.m12 * (la2y - c2.y);
			_r2y = b2.m21 * (la2x - c2.x) + b2.m22 * (la2y - c2.y);*/				
			
			CX = vx2 - w2 * _r2y - vx1 + w1 * _r1y; 
			CY = vy2 + w2 * _r2x - vy1 - w1 * _r1x;
			
			det = _k11 * _k22 - _k12 * _k21;
			
			#if debug
			de.polygonal.core.util.Assert.assert(det != 0, "det != 0");
			#end
			
			det = 1 / det;
			
			var newImpulseX = det * (-_k22 * CX + _k12 * CY);
			var newImpulseY = det * (-_k11 * CY + _k21 * CX);
			
			_impulseX += newImpulseX;
			_impulseY += newImpulseY;
			
			vx1 -= body1.invMass * newImpulseX;
			vy1 -= body1.invMass * newImpulseY; 
			w1  -= body1.invI * (_r1x * newImpulseY - _r1y * newImpulseX);
			
			vx2 += body2.invMass * newImpulseX;
			vy2 += body2.invMass * newImpulseY; 
			w2  += body2.invI * (_r2x * newImpulseY - _r2y * newImpulseX);
		}
		
		
		body1.vx = vx1;
		body1.vy = vy1;
		body1.w = w1;
		
		body2.vx = vx2;
		body2.vy = vy2;
		body2.w = w2;
	}
	
	override public function solvePosConstraints():Bool
	{
		var positionError = 0.;
		var angularError = 0.;
		
		var C = 0.;
		var CX = 0.;
		var CY = 0.;
		var tmp = 0.;
		
		var newImpulseX = 0.;
		var newImpulseY = 0.;
		
		var maxAngCorrection = _settings.maxAngCorrection;
		var linSlop = _settings.linSlop;
		var angSlop = _settings.angSlop;
		
		if (enableLimit && _limitState != LimitState.INACTIVE)
		{
			var angle = body2.sweep.a - body1.sweep.a - _referenceAngle;
			var limitImpulse = 0.;
			
			if (_limitState == LimitState.EQUAL)
			{					 
				C = ((angle) < (-maxAngCorrection)) ? (-maxAngCorrection) : ((angle) > (maxAngCorrection)) ? (maxAngCorrection) : (angle);
				limitImpulse = -_motorMass * C;
				angularError = C > 0 ? C : -C;
			}
			else 
			if (_limitState == LimitState.LOWER)
			{
				C = angle - lowerAngle;
				angularError = -C;		
				tmp = C + angSlop;
				C = ((tmp) < (-maxAngCorrection)) ? (-maxAngCorrection) : ((tmp) > (0)) ? (0) : (tmp);				
				limitImpulse = - _motorMass * C;
			}
			else if (_limitState == LimitState.UPPER)
			{
				C = angle - upperAngle;
				angularError = -C;		
				tmp = C - angSlop;
				C = ((tmp) < (0)) ? (0) : ((tmp) > (maxAngCorrection)) ? (maxAngCorrection) : (tmp);				
				
				limitImpulse =  _motorMass * C;
			}				
			
			body1.sweep.a -= body1.invI * limitImpulse;
			body2.sweep.a += body2.invI * limitImpulse;
			
			body1.syncT();
			body2.syncT();
		}
		
		//var b1 = body1.getXForm().R;
		//var b2 = body2.getXForm().R;
		var b1 = body1.TWorld;
		var b2 = body2.TWorld;
	
		var c1 = body1.localCenter;
		var c2 = body2.localCenter;
	
		_r1x = b1.m11 * (la1x - c1.x) + b1.m12 * (la1y - c1.y);
		_r1y = b1.m21 * (la1x - c1.x) + b1.m22 * (la1y - c1.y);

		_r2x = b2.m11 * (la2x - c2.x) + b2.m12 * (la2y - c2.y);
		_r2y = b2.m21 * (la2x - c2.x) + b2.m22 * (la2y - c2.y);	
		
		var s1 = body1.sweep.c;
		var s2 = body2.sweep.c;		
		
		CX = s2.x + _r2x - s1.x - _r1x;
		CY = s2.y + _r2y - s1.y - _r1y;
		
		positionError = Math.sqrt(CX * CX + CY * CY);
		
		var allowed = 10 * linSlop;
		var lsq = CX * CX + CY * CY;
		
		if (lsq > allowed * allowed)
		{	
			lsq = 1 / Math.sqrt(lsq);
			
			var ux = CX * lsq;
			var uy = CY * lsq;
			
			var invMass = body1.invMass + body2.invMass;
			
			#if debug
			Assert.assert(invMass > _settings.eps, "invMass > _settings.eps");
			#end
			
			var mass = 1.0 / invMass;	
			
			newImpulseX = -mass * CX;
			newImpulseY = -mass * CY;
			
			var invMass1 = body1.invMass;
			var invMass2 = body2.invMass;
			
			s1.x -= 0.5 * invMass1 * newImpulseX;
			s1.y -= 0.5 * invMass1 * newImpulseY;
			
			s2.x += 0.5 * invMass2 * newImpulseX;
			s2.y += 0.5 * invMass2 * newImpulseY;
			
			CX = s2.x + _r2x - s1.x - _r1x;
			CY = s2.y + _r2y - s1.y - _r1y;
		}
		
		_k11 = body1.invMass + body2.invMass + body1.invI * _r1y * _r1y + body2.invI * _r2y * _r2y;
		_k22 = body1.invMass + body2.invMass + body1.invI * _r1x * _r1x + body2.invI * _r2x * _r2x;
		_k21 = _k12 = - body1.invI * _r1x * _r1y - body2.invI * _r2x * _r2y;
		
		var det = _k11 * _k22 - _k12 * _k21;
		
		#if debug
		de.polygonal.core.util.Assert.assert(det != 0, "det != 0");
		#end
		
		det = 1 / det;			
		
		newImpulseX = det * (-_k22 * CX + _k12 * CY);
		newImpulseY = det * (-_k11 * CY + _k21 * CX);
		
		var a1 = body1.sweep.a;
		var a2 = body2.sweep.a;
		
		s1.x -= body1.invMass * newImpulseX;
		s1.y -= body1.invMass * newImpulseY;
		a1 -= body1.invI * (_r1x * newImpulseY - _r1y * newImpulseX );

		s2.x += body2.invMass * newImpulseX;
		s2.y += body2.invMass * newImpulseY;
		a2 += body2.invI * (_r2x * newImpulseY - _r2y * newImpulseX );

		body1.syncT();
		body2.syncT();
		
		return (positionError <= linSlop) && (angularError <= angSlop);
	}
}