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
import de.polygonal.motor.dynamics.joint.data.LineJointData;
import de.polygonal.core.math.Mat22;
import de.polygonal.core.math.Vec2;
import de.polygonal.motor.Settings;
import de.polygonal.motor.World;
import de.polygonal.motor.dynamics.RigidBody;
import de.polygonal.motor.dynamics.joint.LimitState;

/**
 * A line joint. This joint fixes the movemnt of the body along an axis
 * relative to body1. Relative rotation is not prevented. You can use a joint limit 
 * to restrict the range of motion and a joint motor to	drive the motion.
 */
class LineJoint extends Joint
{
	/**
	 * The maximum motor torque.
	 */
	public var maxMotorForce:Float;
	
	/**
	 * The lower joint limit.
	 */
	public var motorSpeed:Float;
	
	/**
	 * The lower joint limit.
	 */
	public var lowerTrans:Float;
	
	/**
	 * The desired motor speed.
	 */
	public var upperTrans:Float;
	
	/**
	 * Enable/disable the joint limit.
	 */
	public var enableLimit:Bool;
	
	 /**
	 * A flag to enable the joint motor.
	 */
	public var enableMotor:Bool;
	
	/**
	 * The local translation axis relative to body1.
	 */
	public var aXx:Float; public var aXy:Float; 
	
	var _impulseX:Float;
	var _impulseY:Float;	
	
	var _motorMass:Float;
	var _motorImpulse:Float;
	var _limitState:Int;
	
	var _ux:Float; var _r1x:Float; var _r2x:Float; var _laXx:Float; var _laYx:Float; var _aYx:Float;
	var _uy:Float; var _r1y:Float; var _r2y:Float; var _laXy:Float; var _laYy:Float; var _aYy:Float;
	
	var _a1:Float; var _a2:Float;
	var _s1:Float; var _s2:Float;
	
	var _k11:Float; var _k12:Float; 
	var _k21:Float; var _k22:Float; 	
	
	/**
	 * Creates a new PrismaticJoint instance.
	 * 
	 * @param data The joint parameters.
	 */
	public function new(data:LineJointData, world:World)
	{
		super(data, world);
		
		var d:LineJointData = cast(data,LineJointData);
		
		la1x = d.anchor1.x;
		la1y = d.anchor1.y;
		
		la2x = d.anchor2.x;
		la2y = d.anchor2.y;
		
		_laXx = d.axis.x;
		_laXy = d.axis.y;
		
		_laYx = - d.axis.y;
		_laYy = d.axis.x;		
		
		lowerTrans = d.lowerTrans;
		upperTrans = d.upperTrans;
		
		_impulseX = _impulseY = 0;
		
		_motorMass = _motorImpulse = 0;
		motorSpeed = d.motorSpeed;
		//TODO something better for force like momentum per timestep
		maxMotorForce = d.maxMotorForce;
		
		enableMotor = d.enableMotor;
		enableLimit = d.enableLimit;		
		
		aXx = aXy = _aYx = _aYy = 0;
		_limitState = LimitState.INACTIVE;
		
		
	}
	
	override public function getReactionForce(invdt:Float):Vec2
	{
		var t1 = _impulseX * invdt;
		var t2 = (_motorImpulse + _impulseY) * invdt;
		var reactionForce:Vec2 = new Vec2();
		reactionForce.x = _aYx * t1 + aXx * t2;
		reactionForce.y = _aYy * t1 + aXy * t2;
		
		return reactionForce;
	}
	
	override public function getReactionTorque(invdt:Float):Float
	{
		return _impulseY * invdt;
	}
	
	/**
	 * Get the current joint translation.
	 */	
	public function getJointTranslation():Float
	{
		var p1 = new Vec2();
		body1.getWorldPoint(la1x, la1y,p1);
		var p2 = new Vec2();
		body2.getWorldPoint(la2x, la2y, p2);
		
		var a = new Vec2();
		body1.getWorldDirection(aXx, aXy,a);
		var trans = (p2.x - p1.x) * a.x + (p2.y - p1.y) * a.y;
		
		return trans;
	}
	
	public function getJointAxis():Vec2
	{
		var axis = new Vec2();
		body1.getWorldDirection(_laXx, _laXy, axis);
		return axis;
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
	
	public function setMotorSpeed(speed:Float):Void
	{
		body1.wakeUp();
		body2.wakeUp();
		motorSpeed = speed;
	}
	
	/**
	 * Get the current joint translation speed.
	 */
	public function getJointSpeed():Float
	{
		var s1 = body1.sweep.c;
		var s2 = body2.sweep.c;
		
		//var b1 = body1.getXForm().R; 
		var b1 = body1.TWorld;
		//var b2 = body2.getXForm().R;		
		var b2 = body2.TWorld;
		
		var c1 = body1.localCenter;
		var c2 = body2.localCenter;
		
		var r1x = b1.m11 * (la1x - c1.x) + b1.m12 * (la1y - c1.y);
		var r1y = b1.m21 * (la1x - c1.x) + b1.m22 * (la1y - c1.y);

		var r2x = b2.m11 * (la2x - c2.x) + b2.m12 * (la2y - c2.y);
		var r2y = b2.m21 * (la2x - c2.x) + b2.m22 * (la2y - c2.y);		
		
		var a = new Vec2();
		body1.getWorldDirection(aXx, aXy,a);
		
		var dx = s2.x + r2x - s1.x - r1x;
		var dy = s2.y + r2y - s1.y - r1y;
		
		var speed =  - dx * (body1.w * a.y) + dy * (body1.w *a.x);
		
		speed += a.x * (body2.vx - body2.w * r2y - body1.vx - body1.w * r1y) + a.y * (body2.vx - body2.w * r2y - body1.vx - body1.w * r1y);     
		
		return speed;
	}
	
	/**
	 * Get the current motor force.
	 */
	public function getMotorForce():Float		
	{
		return _motorImpulse;
	}
	
	override public function preStep(settings:Settings):Void
	{
		//super.preStep(dt);
		
		#if debug
		de.polygonal.core.util.Assert.assert(body1.invI > 0 || body2.invI > 0, "body1.invI > 0 || body2.invI > 0");
		#end
		
		//var b1 = body1.getXForm().R; 
		var b1 = body1.TWorld; 
		//var b2 = body2.getXForm().R;		
		var b2 = body2.TWorld;	
		
		var c1 = body1.localCenter;
		var c2 = body2.localCenter;
		
		_r1x = b1.m11 * (la1x - c1.x) + b1.m12 * (la1y - c1.y);
		_r1y = b1.m21 * (la1x - c1.x) + b1.m22 * (la1y - c1.y);

		_r2x = b2.m11 * (la2x - c2.x) + b2.m12 * (la2y - c2.y);
		_r2y = b2.m21 * (la2x - c2.x) + b2.m22 * (la2y - c2.y);
		
		//sweep
		var s1 = body1.sweep.c;
		var s2 = body2.sweep.c;
		
		_ux = s2.x + _r2x - s1.x - _r1x;
		_uy = s2.y + _r2y - s1.y - _r1y;
			
		aXx = b1.m11 * _laXx + b1.m12 * _laXy;
		aXy = b1.m21 * _laXx + b1.m22 * _laXy;
		
		_aYx = b1.m11 * _laYx + b1.m12 * _laYy;
		_aYy = b1.m21 * _laYx + b1.m22 * _laYy;
		
		_a1 = (_ux + _r1x) * aXy - (_uy + _r1y) * aXx;
		_a2 = _r2x * aXy - _r2y *aXx;
		
		_s1 = (_ux + _r1x) * _aYy - (_uy + _r1y) * _aYx;
		_s2 = _r2x * _aYy - _r2y *_aYx;
		
		var invMass = body1.invMass + body2.invMass + body1.invI * _a1 * _a1 + body2.invI * _a2 * _a2;
		
		#if debug
		de.polygonal.core.util.Assert.assert(invMass > settings.eps, "invMass > settings.eps");
		#end
			
		_motorMass = 1 / invMass;
		
		_k11 = body1.invMass + body2.invMass + body1.invI * _s1 * _s1 + body2.invI * _s2 * _s2;		
		_k12 = _k21 = body1.invI * _s1 * _a1 + body2.invI * _s2 * _a2;	
		_k22 = body1.invMass + body2.invMass + body1.invI * _a1 * _a1 + body2.invI * _a2 * _a2;
		
		var linSlop = _settings.linSlop;
		
		if (enableLimit)
		{
			var trans = aXx * _ux + aXy *_uy;
			
			if(((upperTrans - lowerTrans) > 0 ? (upperTrans - lowerTrans) : -(upperTrans - lowerTrans)) < 2 * linSlop)
				_limitState = LimitState.EQUAL;
			else
			if (trans <= lowerTrans)
			{
				if (_limitState != LimitState.LOWER)
				{
					_limitState = LimitState.LOWER;
					_impulseY = 0;
				}
			}	
			else
			if (trans >= upperTrans)
			{
				if (_limitState != LimitState.UPPER)
				{
					_limitState = LimitState.UPPER;
					_impulseY = 0;
				}
			}	
			else
			{
				_limitState = LimitState.INACTIVE;
				_impulseY = 0;
			}										
		}
		else 
		{
			_limitState = LimitState.INACTIVE;
		}
		
		
		if (!enableMotor)
			_motorImpulse = 0;
		
		if (settings.doWarmStart)
		{
			_impulseX *= settings.dtRatio; 
			_impulseY *= settings.dtRatio;			
			
			_motorImpulse *= settings.dtRatio;
			
			var px = _impulseX * _aYx + (_motorImpulse + _impulseY) * aXx;
			var py = _impulseX * _aYy + (_motorImpulse + _impulseY) * aXy;
			
			var l1 = _impulseX * _s1 + (_motorImpulse + _impulseY) * _a1;
			var l2 = _impulseX * _s2 + (_motorImpulse + _impulseY) * _a2;
			
			body1.vx -= body1.invMass * px;
			body1.vy -= body1.invMass * py;
			body1.w  -= body1.invI * l1;
			
			body2.vx += body2.invMass * px;
			body2.vy += body2.invMass * py;
			body2.w  += body2.invI * l2;
		}
		else
		{
			_impulseX = _impulseY = 0;
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
		var det = 0.;
		var px = 0.;
		var py = 0.;	
		var l1 = 0.;
		var l2 = 0.;
		
		if (enableMotor && _limitState != LimitState.EQUAL)
		{				
			var CdotA = (aXx * (vx2 - vx1) + aXy * (vy2 - vy1)) + _a2 * w2 - _a1 * w1;
			
			var newImpulse = _motorMass * (motorSpeed - CdotA);
			var oldImpulse = _motorImpulse;
			var maxImpulse = dt * maxMotorForce;
			
			_motorImpulse = ((_motorImpulse + newImpulse) < -maxImpulse) ? -maxImpulse : ((_motorImpulse + newImpulse) > maxImpulse) ? maxImpulse : (_motorImpulse + newImpulse);
			newImpulse = _motorImpulse - oldImpulse;
			
			px = newImpulse * aXx;
			py = newImpulse * aXy;
			
			l1 = newImpulse * _a1;
			l2 = newImpulse * _a2;
			
			vx1 -= body1.invMass * px;
			vy1 -= body1.invMass * py;
			w1  -= body1.invI  * l1;
			
			vx2 += body2.invMass * px;
			vy2 += body2.invMass * py;
			w2  += body2.invI  * l2;
		}
		
		var CX = (_aYx * (vx2 - vx1) + _aYy * (vy2 - vy1)) + _s2 * w2 - _s1 * w1; 	
		
		if (enableLimit && _limitState != LimitState.INACTIVE)
		{
			var CY = (aXx * (vx2 - vx1) + aXy * (vy2 - vy1)) + _a2 * w2 - _a1 * w1;						
			
			det =  _k11 * _k22 - _k12 * _k21;

			#if debug
			de.polygonal.core.util.Assert.assert(det !=  0, "det !=  0");
			#end
			
			det = 1 / det;		
			
			//var oldImpulseX = _impulseX;
			var oldImpulseY = _impulseY;			
			
			_impulseX += det * (- _k22 * CX + _k12 * CY);
			_impulseY += det * (- _k11 * CY + _k21 * CX);
			
			if (_limitState == LimitState.LOWER)
			{					
				_impulseY = (_impulseY > 0 ? _impulseY : 0); 
			}
			else
			if (_limitState == LimitState.UPPER)
			{
				_impulseY = (_impulseY < 0 ? _impulseY : 0);
			}
			
			var b = - CX - (_impulseY - oldImpulseY) * _k21;			
			
			CX = b / _k11; 		
			
			px = _impulseX * _aYx + (_impulseY - oldImpulseY) * aXx;
			py = _impulseX * _aYy + (_impulseY - oldImpulseY) * aXy;
			
			l1 = _impulseX * _s1 + (_impulseY - oldImpulseY) * _a1;
			l2 = _impulseX * _s2 + (_impulseY - oldImpulseY) * _a2;
			
			vx1 -= body1.invMass * px;
			vy1 -= body1.invMass * py;
			w1  -= body1.invI  * l1;
			
			vx2 += body2.invMass * px;
			vy2 += body2.invMass * py;
			w2  += body2.invI  * l2;
		}
		else
		{				
			var dx = -CX / _k11;
			
			_impulseX += dx;		
			
			px = dx * _aYx;
			py = dx * _aYy;
			
			l1 = dx * _s1; 
			l2 = dx * _s2;
			
			vx1 -= body1.invMass * px;
			vy1 -= body1.invMass * py;
			w1  -= body1.invI  * l1;
			
			vx2 += body2.invMass * px;
			vy2 += body2.invMass * py;
			w2  += body2.invI  * l2;
		}
		
		body1.vx = vx1;
		body1.vy = vy1;
		body1.w  = w1;
		
		body2.vx = vx2;
		body2.vy = vy2;
		body2.w  = w2;
	}
	
	override public function solvePosConstraints():Bool
	{			
		//TODO test difference
		var b1 = new Mat22();
		b1.setAngle(body1.sweep.a);	//body1.getXForm().R; should be the same if synchronize transform was used after each step
		var b2 = new Mat22();
		b2.setAngle(body2.sweep.a);  //body2.getXForm().R;		
		
		var c1 = body1.localCenter;
		var c2 = body2.localCenter;			
		
		_r1x = b1.m11 * (la1x - c1.x) + b1.m12 * (la1y - c1.y);
		_r1y = b1.m21 * (la1x - c1.x) + b1.m22 * (la1y - c1.y);

		_r2x = b2.m11 * (la2x - c2.x) + b2.m12 * (la2y - c2.y);
		_r2y = b2.m21 * (la2x - c2.x) + b2.m22 * (la2y - c2.y);
		
		//sweep
		var s1 = body1.sweep.c;
		var s2 = body2.sweep.c;		
		
		_ux = s2.x + _r2x - s1.x - _r1x;
		_uy = s2.y + _r2y - s1.y - _r1y;
		
		var active = false;	
		var CY = 0.;
		var	linearError = 0.;
		var angularError = 0.;
		
		var det;	
		
		var linSlop = _settings.linSlop;
		
		if (enableLimit)
		{
			aXx = b1.m11 * _laXx + b1.m12 * _laXy;
			aXy = b1.m21 * _laXx + b1.m22 * _laXy;
			
			_a1 = (_ux + _r1x) * aXy - (_uy + _r1y) * aXx;
			_a2 = _r2x * aXy - _r2y * aXx; 
			
			var trans = aXx * _ux + aXy * _uy;
			
			var maxLinCorrection = _settings.maxLinCorrection;
			
			if(((upperTrans - lowerTrans) > 0 ? (upperTrans - lowerTrans) : -(upperTrans - lowerTrans)) < 2 * linSlop)
			{
				CY = (trans < -maxLinCorrection) ? -maxLinCorrection : (trans > maxLinCorrection) ? maxLinCorrection : trans;
				linearError = (trans > 0 ? trans : - trans); 
				active = true;
			}
			else
			if (trans <= lowerTrans)
			{
				CY = ((trans - lowerTrans + linSlop) < -maxLinCorrection) ? -maxLinCorrection : ((trans - lowerTrans + linSlop) > 0) ? 0 : (trans - lowerTrans + linSlop);
				linearError = lowerTrans - trans;
				active = true;
			}
			else
			if (trans >= upperTrans)
			{
				CY = ((trans - upperTrans - linSlop) < 0) ? 0 : ((trans - upperTrans - linSlop) > maxLinCorrection) ? maxLinCorrection : (trans - upperTrans - linSlop);
				linearError = trans - upperTrans;
				active = true;
			}
		}
		
		_aYx = b1.m11 * _laYx + b1.m12 * _laYy;
		_aYy = b1.m21 * _laYx + b1.m22 * _laYy;
		
		_s1 = (_ux + _r1x) * _aYy - (_uy + _r1y) * _aYx;
		_s2 = _r2x * _aYy - _r2y *_aYx;
		
		var a1 = body1.sweep.a;
		var a2 = body2.sweep.a;	
		
		var CX = _aYx * _ux + _aYy * _uy;	
		
		linearError = linearError > (CX > 0 ? CX : - CX) ? linearError : (CX > 0 ? CX : - CX);
		angularError = 0;
		
		var newImpulseX;
		var newImpulseY;		
		
		if (active)
		{			
			_k11 = body1.invMass + body2.invMass + body1.invI * _s1 * _s1 + body2.invI * _s2* _s2;			
			_k12 = _k21 = body1.invI * _s1 * _a1 + body2.invI * _s2 * _a2;						
			_k22 = body1.invMass + body2.invMass + body1.invI * _a1 * _a1 + body2.invI * _a2 * _a2;
			
			det =  _k11 * _k22 - _k12 * _k21;
			
			#if debug
			de.polygonal.core.util.Assert.assert(det != 0, "det != 0");
			#end
			
			det = 1 / det;
				
			newImpulseX = det * (- _k22 * CX + _k12 * CY);
			newImpulseY = det * (- _k11 * CY + _k21 * CX);
			
		}			
		else
		{
			_k11 = body1.invMass + body2.invMass + body1.invI * _s1 * _s1 + body2.invI * _s2* _s2;						
			
			newImpulseX	= -CX / _k11;			
			newImpulseY = 0.;
		}
		
		var px = newImpulseX * _aYx + newImpulseY * aXx;  
		var py = newImpulseX * _aYy + newImpulseY * aXy;
		
		var l1 = newImpulseX * _s1 + newImpulseY * _a1;
		var l2 = newImpulseX * _s2 + newImpulseY * _a2;
		
		s1.x -= body1.invMass * px;
		s1.y -= body1.invMass * py;
		a1  -= body1.invI  * l1;
		
		s2.x += body2.invMass * px;
		s2.y += body2.invMass * py;
		a2  += body2.invI  * l2;	
		
		body1.syncT();
		body2.syncT();
		
		return linearError <= linSlop && angularError <= _settings.angSlop;
	}	
}