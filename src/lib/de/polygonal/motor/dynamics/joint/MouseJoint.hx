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

import de.polygonal.motor.dynamics.RigidBody;
import de.polygonal.motor.dynamics.joint.Joint;
import de.polygonal.motor.dynamics.joint.data.MouseJointData;	
import de.polygonal.motor.Settings;
import de.polygonal.core.math.Vec2;
import de.polygonal.motor.World;

/**
 * A mouse joint is used to make a point on a body track a specified world
 * point. This a soft constraint with a maximum force. This allows the
 * constraint to stretch and without applying huge forces.
 */
class MouseJoint extends Joint
{
	//inline static var _target:Vec2;
	
	var _px:Float; var _tx:Float; var _cx:Float; var _rx:Float;
	var _py:Float; var _ty:Float; var _cy:Float; var _ry:Float;
	
	var _mr11:Float; var _mr12:Float;
	var _mr21:Float; var _mr22:Float;
	
	var _beta:Float;
	var _gamma:Float;
	
	public var maxForce:Float;
	
	var _omega:Float; var _k:Float; var _damp:Float;
	
	/**
	 * Create a new MouseJoint instance.
	 * 
	 * @param data the mouse joint definition.
	 */
	public function new(data:MouseJointData, world:World)
	{
		super(data, world);
		
		var d:MouseJointData = data;
		
		setTarget(d.target.x, d.target.y);
		
		//var R2 = body2.getXForm().R;
		var R2 = body2.TWorld;
		
		//var p2 = body2.getXForm().position;
		var p2 = body2.TWorld.getTranslation(new Vec2());
		
		la2x = (_tx - p2.x) * R2.m11 + (_ty - p2.y) * R2.m21;
		la2y = (_tx - p2.x) * R2.m12 + (_ty - p2.y) * R2.m22;
		
		maxForce = d.maxForce;

		_px = 0;
		_py = 0;
		
		_omega = 2 * Math.PI * d.frequencyHz;
		_damp  = 2 * body2.mass * d.dampingRatio * _omega;
		_k     = body2.mass * _omega * _omega;	
		
		_gamma =  0;
		_beta  =  0;
		
		_tx = d.target.x;
		_tx = d.target.y;
	}
	
	/**
	 * Returns the attachment point.
	 */
	public function getTarget():Vec2
	{
		return new Vec2(_tx,_ty);
	}

	/**
	 * Updates the attachment point.
	 */
	public function setTarget(x:Float, y:Float):Void
	{
		if (body2.isSleeping)
			body2.wakeUp();			
		_tx = x;
		_ty = y;		
	}
	
	override public function getAnchor1():Vec2
	{
		return new Vec2(_tx,_ty);
	}
	
	override public function getReactionForce(invdt:Float):Vec2
	{
		return new Vec2 (invdt * _px, invdt * _py);
	}
	
	override public function preStep(settings:Settings):Void
	{
		//super.preStep(dt);		
		
		//var b2 = body2.getXForm().R;
		var b2 = body2.TWorld;
		var c2 = body2.localCenter;
		
		_rx = b2.m11 * (la2x - c2.x) + b2.m12 * (la2y - c2.y);
		_ry = b2.m21 * (la2x - c2.x) + b2.m22 * (la2y - c2.y);
		
		#if debug
		de.polygonal.core.util.Assert.assert(_damp + settings.dt * _k > World.settings.eps, "_damp + settings.dt * k > _world.settings.eps");
		#end
		
		_gamma = 1 / (settings.dt * (_damp + settings.dt * _k));
		_beta = settings.dt * _k * _gamma;
		
		var invMass = body2.invMass;
		var invI = body2.invI;
		
		//OpTiMiZiNg ZErO
		//performance * 1/0!!!!
		//INFINIMUM#
		var kr11 = invMass + (invI * _ry * _ry) + 0;
		var kr21 =-invI * _rx * _ry;
		var kr12 = kr21;
		var kr22 = invMass + (invI * _rx * _rx) + 0;
		
		kr11 += _gamma;
		kr22 += _gamma;
		
		var det = 1 / (kr11 * kr22 - kr12 * kr21);
		
		#if debug
		de.polygonal.core.util.Assert.assert(det != 0, "det != 0");
		#end
		
		_mr11 = det * kr22; _mr12 =-det * kr12;
		_mr21 =-det * kr21; _mr22 = det * kr11;
		
		_cx = body2.sweep.c.x + _rx - _tx;
		_cy = body2.sweep.c.y + _ry - _ty;
		
		body2.w *= 0.98;
		
		_px *= settings.dtRatio;
		_py *= settings.dtRatio;
		
		body2.vx += invMass * _px;
		body2.vy += invMass * _py;
		body2.w  += invI * (_rx * _py - _ry * _px);
	}

	override public function solveVelConstraints(dt:Float):Void
	{
		//var b2 = body2.getXForm().R;
		var b2 = body2.TWorld;
		
		var c2 = body2.localCenter;
		
		_rx = b2.m11 * (la2x - c2.x) + b2.m12 * (la2y - c2.y);
		_ry = b2.m21 * (la2x - c2.x) + b2.m22 * (la2y - c2.y);
		
		var cdotx = body2.vx + (-body2.w * _ry);
		var cdoty = body2.vy + ( body2.w * _rx);
		
		var tx = - (cdotx + _beta * _cx + _gamma * _px);
		var ty = - (cdoty + _beta * _cy + _gamma * _py);
		var fx1 = (_mr11 * tx + _mr12 * ty);
		var fy1 = (_mr21 * tx + _mr22 * ty);
		
		var fx0 = _px;
		var fy0 = _py;
		_px += fx1;
		_py += fy1;
		
		var maxImpulse = dt * maxForce;
		
		var impulseMagnitude = Math.sqrt(_px * _px + _py * _py);
		
		if (impulseMagnitude > maxImpulse * maxImpulse)
		{
			var tmp = maxImpulse / impulseMagnitude; 
			_px *= tmp;
			_py *= tmp;
		}
		
		fx1 = _px - fx0;
		fy1 = _py - fy0;
		
		body2.vx += body2.invMass * _px;
		body2.vy += body2.invMass * _py;
		body2.w  += body2.invI * (_rx * _py - _ry * _px);
	}
}