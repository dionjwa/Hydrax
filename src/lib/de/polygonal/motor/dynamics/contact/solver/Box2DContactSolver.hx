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
package de.polygonal.motor.dynamics.contact.solver;

import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.Vec2;
import de.polygonal.core.math.Vec2Util;
import de.polygonal.core.util.Assert;
import de.polygonal.ds.DA;
import de.polygonal.motor.dynamics.contact.Contact;
import de.polygonal.motor.Settings;

class Box2DContactSolver
{
	var _contactConstraints:DA<ContactConstraint>;
	var _constraintCount:Int;
	var _settings:Settings;
	
	public function new(settings:Settings):Void
	{
		_settings = settings;
		
		//setup contact constraint pool
		_contactConstraints = new DA<ContactConstraint>(_settings.maxPairs);
		_contactConstraints.assign(ContactConstraint, null, _settings.maxPairs);
	}
	
	public function free():Void
	{
		for (i in 0..._contactConstraints.size())
		{
			_contactConstraints.get(i).free();
			_contactConstraints.set(i, null);
		}
		
		_contactConstraints = null;
	}
	
	public function preStep(settings:Settings, contacts:Contact)
	{
		var doWarmStart = _settings.doWarmStart;
		
		var count = 0;
		
		//count total number of constraints
		_constraintCount = 0;
		
		var c = contacts;
		while (c != null)
		{
			#if debug
			Assert.assert(c.isSolid(), "c.isSolid()");
			#end
			
			_constraintCount += c.manifoldCount;
			c = c.next;
		}
		
		//for each contact
		var c = contacts;
		while (c != null)
		{
			var s1       = c.shape1;
			var s2       = c.shape2;
			var b1       = s1.body;
			var b2       = s2.body;
			var invMass1 = b1.invMass;
			var invMass2 = b2.invMass;
			var invI1    = b1.invI;
			var invI2    = b2.invI;
			var v1x      = b1.vx;
			var v1y      = b1.vy;
			var v2x      = b2.vx;
			var v2y      = b2.vy;
			var w1       = b1.w;
			var w2       = b2.w;
			
			var friction    = _settings.mixFriction(s1.friction, s2.friction);
			var restitution = _settings.mixRestitution(s1.restitution, s2.restitution);
			
			//Manifold->ContactConstraint
			var manifold = c.manifold;
			while (manifold != null)
			{
				#if debug
				Assert.assert(manifold.pointCount > 0, "manifold.pointCount > 0");
				Assert.assert(count < _constraintCount, "count < _constraintCount");
				#end
				
				var ncoll = manifold.ncoll;
				var nx = ncoll.x;
				var ny = ncoll.y;
				
				var cc = _contactConstraints.get(count);
				cc.body1 = b1;
				cc.body2 = b2;
				cc.manifold = manifold;
				cc.nx = nx;
				cc.ny = ny;
				cc.pointCount = manifold.pointCount;
				cc.friction = friction;
				cc.restitution = restitution;
				
				//ManifoldPoint->ContactConstraintPoint
				var cp = manifold.mp1;
				var ccp = cc.ccp1;
				for (k in 0...cc.pointCount)
				{
					ccp.normalImpulse  = cp.Pn;
					ccp.tangentImpulse = cp.Pt;
					ccp.separation     = cp.sep;
					
					//store local contact point computed by collider
					ccp.setLocalPosition(cp);
					
					//compute radius vectors (center of mass->contact)
					
					//transform radius vector to world space
					var dx = ccp.l1x - b1.localCenter.x;
					var dy = ccp.l1y - b1.localCenter.y;
					var r1x = b1.TWorld.mul22x(dx, dy);
					var r1y = b1.TWorld.mul22y(dx, dy);
					
					//transform radius vector to world space
					var dx = ccp.l2x - b2.localCenter.x;
					var dy = ccp.l2y - b2.localCenter.y;
					var r2x = b2.TWorld.mul22x(dx, dy);
					var r2y = b2.TWorld.mul22y(dx, dy);
					
					var rn1 = Vec2Util.perpDot4(r1x, r1y, nx, ny); 
					var rn2 = Vec2Util.perpDot4(r2x, r2y, nx, ny);
					rn1 *= rn1;
					rn2 *= rn2;
					
					var kNormal = invMass1 + invMass2 + invI1 * rn1 + invI2 * rn2;
					
					#if debug
					Assert.assert(kNormal > _settings.eps, "kNormal > _settings.eps");
					#end
					
					ccp.normalMass = 1 / kNormal;
					
					var kEqualized = b1.mass * invMass1 + b2.mass * invMass2;
					kEqualized += b1.mass * invI1 * rn1 + b2.mass * invI2 * rn2;
					
					#if debug
					Assert.assert(kEqualized > _settings.eps, "kEqualized > _settings.eps");
					#end
					
					ccp.equalizedMass = 1 / kEqualized;
					
					var rt1 = Vec2Util.perpDot4(r1x, r1y, ny, -nx);
					var rt2 = Vec2Util.perpDot4(r2x, r2y, ny, -nx);
					rt1 *= rt1;
					rt2 *= rt2;
					
					var kTangent = invMass1 + invMass2 + invI1 * rt1 + invI2 * rt2;
					
					#if debug
					Assert.assert(kTangent > _settings.eps, "kTangent > _settings.eps");
					#end
					
					ccp.tangentMass = 1 /  kTangent;
					ccp.velocityBias = 0;
					if (ccp.separation > 0)
					{
						ccp.velocityBias = -_settings.dtInv * ccp.separation;
					}
					else
					{
						//v = v2 + perpDot(w2, ccp.r2) - v1 - perpDot(w1, ccp.r1)
						var x1 = v2x + (-w2 * r2y) - v1x - (-w1 * r1y);
						var y1 = v2y + ( w2 * r2x) - v1y - ( w1 * r1x);
						var vRel = nx * x1 + ny * y1;
						if (vRel < -_settings.velThreshold)
							ccp.velocityBias = -cc.restitution * vRel;
					}
					
					/*///////////////////////////////////////////////////////
					// warm start
					///////////////////////////////////////////////////////*/
					
					if (doWarmStart)
					{
						ccp.normalImpulse  *= _settings.dtRatio;
						ccp.tangentImpulse *= _settings.dtRatio;
						
						var px = ccp.normalImpulse * nx + ccp.tangentImpulse * ny;
						var py = ccp.normalImpulse * ny + ccp.tangentImpulse *-nx;
						
						b1.vx -= invMass1 * px;
						b1.vy -= invMass1 * py;
						b1.w  -= invI1 * Vec2Util.perpDot4(r1x, r1y, px, py);
						
						b2.vx += invMass2 * px;
						b2.vy += invMass2 * py;
						b2.w  += invI2 * Vec2Util.perpDot4(r2x, r2y, px, py);
					}
					else
					{
						ccp.normalImpulse = 0;
						ccp.tangentImpulse = 0;
					}
					
					ccp.r1x = r1x;
					ccp.r1y = r1y;
					ccp.r2x = r2x;
					ccp.r2y = r2y;
					
					cp = cp.next;
					ccp = ccp.next;
				}
				
				/*///////////////////////////////////////////////////////
				// prepare block solver
				///////////////////////////////////////////////////////*/
				if (cc.pointCount > 1)
				{
					var ccp1 = cc.ccp1;
					var ccp2 = cc.ccp2;
					var rn11 = Vec2Util.perpDot4(ccp1.r1x, ccp1.r1y, nx, ny);
					var rn12 = Vec2Util.perpDot4(ccp1.r2x, ccp1.r2y, nx, ny);
					var rn21 = Vec2Util.perpDot4(ccp2.r1x, ccp2.r1y, nx, ny);
					var rn22 = Vec2Util.perpDot4(ccp2.r2x, ccp2.r2y, nx, ny);
					
					var k11  = invMass1 + invMass2 + invI1 * rn11 * rn11 + invI2 * rn12 * rn12;
					var k22  = invMass1 + invMass2 + invI1 * rn21 * rn21 + invI2 * rn22 * rn22;
					var k12  = invMass1 + invMass2 + invI1 * rn11 * rn21 + invI2 * rn12 * rn22;
					
					var maxCondition = 100.;
					if (k11 * k11 < maxCondition * (k11 * k22 - k12 * k12))
					{
						cc.K11 = k11; cc.K12 = k12;
						cc.K21 = k12; cc.K22 = k22;
						
						//inverse normal mass
						var det = k11 * k22 - k12 * k12;
						
						#if debug
						de.polygonal.core.util.Assert.assert(det != 0, "det != 0");
						#end
						
						det = 1 / det;
						cc.normalMass11 = det * k22; cc.normalMass12 =-det * k12;
						cc.normalMass21 =-det * k12; cc.normalMass22 = det * k11;
					}
					else
						cc.pointCount = 1;
				}
				
				count++;
				
				manifold = manifold.next;
			}
			
			c = c.next;
		}
		
		#if debug
		Assert.assert(count == _constraintCount, "count == _constraintCount");
		#end
	}
	
	public function solveVelocityConstraints():Void
	{
		for (i in 0..._constraintCount)
		{
			var cc       = _contactConstraints.get(i);
			var nx       = cc.nx;
			var ny       = cc.ny;
			var b1       = cc.body1;
			var b2       = cc.body2;
			var invI1    = b1.invI; 
			var invI2    = b2.invI; 
			var invMass1 = b1.invMass; 
			var invMass2 = b2.invMass; 
			var w1       = b1.w; 
			var w2       = b2.w; 
			var v1x      = b1.vx; 
			var v1y      = b1.vy; 
			var v2x      = b2.vx;
			var v2y      = b2.vy;
			
			/*///////////////////////////////////////////////////////
			// solve normal constraints
			///////////////////////////////////////////////////////*/
			
			var ccp1 = cc.ccp1;
			
			var r11x = ccp1.r1x; var r12x = ccp1.r2x;
			var r11y = ccp1.r1y; var r12y = ccp1.r2y;
			
			if (cc.pointCount == 1)
			{
				//relative velocity at contact
				//dv = [v2 + (w2 x r2)] - [v1 - (w1 x r1)]
				var dvx = v2x + (-w2 * r12y) - v1x - (-w1 * r11y);
				var dvy = v2y + ( w2 * r12x) - v1y - ( w1 * r11x);
				
				//normal impulse
				var lambda = -ccp1.normalMass * ((dvx * nx + dvy * ny) - ccp1.velocityBias);
				
				//clamp the accumulated impulse
				var newImpulse = Math.max(ccp1.normalImpulse + lambda, 0);
				lambda = newImpulse - ccp1.normalImpulse;
				
				//apply contact impulse
				var px = lambda * nx;
				var py = lambda * ny;
				
				//v1 = v1' - Pn/m1;
				//w1 = w1' - I^-1 (r1 x Pn)
				v1x -= invMass1 * px;
				v1y -= invMass1 * py;
				w1  -= invI1 * Vec2Util.perpDot4(r11x, r11y, px, py);
				
				//v2 = v2' + Pn/m2;
				//v2 = w2' + I^-1 (r2 x Pn)
				v2x += invMass2 * px;
				v2y += invMass2 * py;
				w2  += invI2 * Vec2Util.perpDot4(r12x, r12y, px, py);
				
				ccp1.normalImpulse = newImpulse;
			}
			else
			{
				var ccp2 = cc.ccp2;
				
				var r21x = ccp2.r1x; var r22x = ccp2.r2x;
				var r21y = ccp2.r1y; var r22y = ccp2.r2y;
				
				var ax = ccp1.normalImpulse;
				var ay = ccp2.normalImpulse;
				
				#if debug
				Assert.assert(ax >= 0 && ay >= 0, "ax >= 0 && ay >= 0");
				#end
				
				var dv1x = v2x + (-w2 * r12y) - v1x - (-w1 * r11y);
				var dv1y = v2y + ( w2 * r12x) - v1y - ( w1 * r11x);
				
				var dv2x = v2x + (-w2 * r22y) - v1x - (-w1 * r21y);
				var dv2y = v2y + ( w2 * r22x) - v1y - ( w1 * r21x);
				
				var vn1 = dv1x * nx + dv1y * ny;
				var vn2 = dv2x * nx + dv2y * ny;
				
				//in first step bx, by is just vn1 - bias and vn2 - bias
				var bx = (vn1 - ccp1.velocityBias) - (cc.K11 * ax + cc.K12 * ay);
				var by = (vn2 - ccp2.velocityBias) - (cc.K21 * ax + cc.K22 * ay);
				
				#if debug_solver
				//TODO check tolerance
				var errorTolerance = .001;
				#end
				
				while (true)
				{
					var xx = -(cc.normalMass11 * bx + cc.normalMass12 * by);
					var xy = -(cc.normalMass21 * bx + cc.normalMass22 * by);
					
					if (xx >= 0 && xy >= 0)
					{
						var dx  = xx - ax;
						var dy  = xy - ay;
						var p1x = dx * nx; 
						var p1y = dx * ny;
						var p2x = dy * nx;
						var p2y = dy * ny;
						var tx  = p1x + p2x;
						var ty  = p1y + p2y;
						
						v1x -= invMass1 * tx;
						v1y -= invMass1 * ty;
						w1  -= invI1 * (Vec2Util.perpDot4(r11x, r11y, p1x, p1y) + Vec2Util.perpDot4(r21x, r21y, p2x, p2y));
						
						v2x += invMass2 * tx;
						v2y += invMass2 * ty;
						w2  += invI2 * (Vec2Util.perpDot4(r12x, r12y, p1x, p1y) + Vec2Util.perpDot4(r22x, r22y, p2x, p2y));
						
						ccp1.normalImpulse = xx;
						ccp2.normalImpulse = xy;
						
						#if debug_solver
						var dv1x = v2x + (-w2 * ccp1.r2y) - v1x - (-w1 * ccp1.r1y);
						var dv1y = v2y + ( w2 * ccp1.r2x) - v1y - ( w1 * ccp1.r1x);
						var dv2x = v2x + (-w2 * ccp2.r2y) - v1x - (-w1 * ccp2.r1y);
						var dv2y = v2y + ( w2 * ccp2.r2x) - v1y - ( w1 * ccp2.r1x);
						var vn1 = dv1x * nx + dv1y * ny;
						var vn2 = dv2x * nx + dv2y * ny;
						
						//check if normal velocity is close to zero = succesful computation
						de.polygonal.core.util.Assert.assert(Mathematics.fabs(vn1 - ccp1.velocityBias) < errorTolerance, "Mathematics.abs(vn1 - ccp1.velocityBias) < errorTolerance");
						de.polygonal.core.util.Assert.assert(Mathematics.fabs(vn2 - ccp2.velocityBias) < errorTolerance, "Mathematics.abs(vn2 - ccp2.velocityBias) < errorTolerance");
						#end
						break;
					}
					
					xx  =-(ccp1.normalMass * bx);
					xy  = 0;
					vn1 = 0;
					
					//in first step: massMatrixK21*normalmass*vn1 +vn2 
					vn2 = cc.K21 * xx + by;
					
					if (xx >= 0 && vn2 >= 0)
					{
						//in first step xx = -normalMass*vn1
						var dx  = xx - ax;
						//xy is zero, in first step ay is zero 
						var dy  = xy - ay;
						
						//momentum to be applied in first step vn1*normalmass*normalvector
						var p1x = dx * nx; 
						var p1y = dx * ny;
						
						//both zero in first step
						var p2x = dy * nx; 
						var p2y = dy * ny; 
						
						var tx  = p1x + p2x;
						var ty  = p1y + p2y;
						
						v1x -= invMass1 * tx;
						v1y -= invMass1 * ty;
						w1  -= invI1 * (Vec2Util.perpDot4(r11x, r11y, p1x, p1y) + Vec2Util.perpDot4(r21x, r21y, p2x, p2y));
						
						v2x += invMass2 * tx;
						v2y += invMass2 * ty;
						w2  += invI2 * (Vec2Util.perpDot4(r12x, r12y, p1x, p1y) + Vec2Util.perpDot4(r22x, r22y, p2x, p2y));
						
						ccp1.normalImpulse = xx;
						ccp2.normalImpulse = xy;
						
						#if debug_solver
						var dv1x = v2x + (-w2 * ccp1.r2y) - v1x - (-w1 * ccp1.r1y);
						var dv1y = v2y + ( w2 * ccp1.r2x) - v1y - ( w1 * ccp1.r1x);	
						vn1 = dv1x * nx + dv1y * ny;
						
						//TODO check absolute value
						//de.polygonal.core.util.Assert.assert((vn1 - ccp1.velocityBias) < errorTolerance, "(vn1 - cp1.velocityBias) < errorTolerance");							
						de.polygonal.core.util.Assert.assert(Mathematics.fabs(vn1 - ccp1.velocityBias) < errorTolerance, "Mathematics.fabs(vn1 - ccp1.velocityBias) < errorTolerance");							
						#end
						break;
					}
					
					xx  = 0;
					xy  = -(ccp2.normalMass * by);
					vn1 = cc.K12 * xy + bx;
					vn2 = 0;
					
					if (xy >= 0 && vn1 >= 0)
					{
						var dx  = xx - ax;
						var dy  = xy - ay;
						var p1x = dx * nx; 
						var p1y = dx * ny;
						var p2x = dy * nx;
						var p2y = dy * ny;
						var tx  = p1x + p2x;
						var ty  = p1y + p2y;
						
						v1x -= invMass1 * tx;
						v1y -= invMass1 * ty;
						w1  -= invI1 * (Vec2Util.perpDot4(r11x, r11y, p1x, p1y) + Vec2Util.perpDot4(r21x, r21y, p2x, p2y));
						
						v2x += invMass2 * tx;
						v2y += invMass2 * ty;
						w2  += invI2 * (Vec2Util.perpDot4(r12x, r12y, p1x, p1y) + Vec2Util.perpDot4(r22x, r22y, p2x, p2y));
						
						ccp1.normalImpulse = xx;
						ccp2.normalImpulse = xy;
						
						#if debug_solver
						var dv2x = v2x + (-w2 * ccp2.r2y) - v1x - (-w1 * ccp2.r1y);
						var dv2y = v2y + ( w2 * ccp2.r2x) - v1y - ( w1 * ccp2.r1x);
						var vn2  = dv2x * nx + dv2y * ny;
						//TODO check assert probably just a change of sign
						de.polygonal.core.util.Assert.assert(Mathematics.fabs(vn2 - ccp2.velocityBias) < errorTolerance, "Mathematics.abs(vn2 - ccp2.velocityBias) < errorTolerance");
						#end
						break;
					}
					
					xx  = 0;
					xy  = 0;
					vn1 = bx;
					vn2 = by;
					
					if (vn1 >= 0 && vn2 >= 0)
					{
						var dx  = xx - ax;
						var dy  = xy - ay;
						var p1x = dx * nx; 
						var p1y = dx * ny;
						var p2x = dy * nx;
						var p2y = dy * ny;
						var tx  = p1x + p2x;
						var ty  = p1y + p2y;
						
						v1x -= invMass1 * tx;
						v1y -= invMass1 * ty;
						w1  -= invI1 * (Vec2Util.perpDot4(r11x, r11y, p1x, p1y) + Vec2Util.perpDot4(r21x, r21y, p2x, p2y));
						
						v2x += invMass2 * tx;
						v2y += invMass2 * ty;
						w2  += invI2 * (Vec2Util.perpDot4(r12x, r12y, p1x, p1y) + Vec2Util.perpDot4(r22x, r22y, p2x, p2y));
						
						ccp1.normalImpulse = xx;
						ccp2.normalImpulse = xy;
						break;
					}
					
					break;
				}
			}
			
			/*///////////////////////////////////////////////////////
			//solve tangent constraints
			///////////////////////////////////////////////////////*/
			var ccp = cc.ccp1;
			for (j in 0...cc.pointCount)
			{
				var dvx = v2x + (-w2 * ccp.r2y) - v1x - (-w1 * ccp.r1y);
				var dvy = v2y + ( w2 * ccp.r2x) - v1y - ( w1 * ccp.r1x);
				
				var vt = dvx * ny - dvy * nx;
				var lambda = ccp.tangentMass * (-vt);
				
				var maxFriction = cc.friction * ccp.normalImpulse;
				var newImpulse = Mathematics.fclamp(ccp.tangentImpulse + lambda, -maxFriction, maxFriction);
				lambda = newImpulse - ccp.tangentImpulse;
				
				var px = lambda * ny;
				var py = lambda *-nx;
				
				v1x -= invMass1 * px;
				v1y -= invMass1 * py;
				w1  -= invI1 * Vec2Util.perpDot4(ccp.r1x, ccp.r1y, px, py);
				
				v2x += invMass2 * px;
				v2y += invMass2 * py;
				w2  += invI2 * Vec2Util.perpDot4(ccp.r2x, ccp.r2y, px, py);
				
				ccp.tangentImpulse = newImpulse;
				
				ccp = ccp.next;
			}
			
			//update linear and angular velocities
			b1.vx = v1x;
			b1.vy = v1y;
			b1.w  = w1;
			
			b2.vx = v2x;
			b2.vy = v2y;
			b2.w  = w2;
		}
	}
	
	public function finalizeVelocityConstraints():Void
	{
		for (i in 0..._constraintCount)
		{
			var cc = _contactConstraints.get(i);
			var m = cc.manifold;
			
			m.mp1.Pn = cc.ccp1.normalImpulse;
			m.mp1.Pt = cc.ccp1.tangentImpulse;
			
			if (cc.pointCount > 1)
			{
				m.mp2.Pn = cc.ccp2.normalImpulse;
				m.mp2.Pt = cc.ccp2.tangentImpulse;
			}
		}
	}
	
	public function solvePositionConstraints(baumgarte:Float):Bool
	{
		var minSeparation = .0;
		
		for (i in 0..._constraintCount)
		{
			var cc       = _contactConstraints.get(i);
			var nx       = cc.nx;
			var ny       = cc.ny;
			var b1       = cc.body1;
			var b2       = cc.body2;
			var mass1    = b1.mass;
			var mass2    = b2.mass;
			var invMass1 = mass1 * b1.invMass;
			var invMass2 = mass2 * b2.invMass;
			var invI1    = mass1 * b1.invI;
			var invI2    = mass2 * b2.invI;
			
			var ccp = cc.ccp1;
			for (j in 0...cc.pointCount)
			{
				var dx  = ccp.l1x - b1.localCenter.x;
				var dy  = ccp.l1y - b1.localCenter.y;
				var r1x = b1.TWorld.mul22x(dx, dy);
				var r1y = b1.TWorld.mul22y(dx, dy);
				
				var dx  = ccp.l2x - b2.localCenter.x;
				var dy  = ccp.l2y - b2.localCenter.y;
				var r2x = b2.TWorld.mul22x(dx, dy);
				var r2y = b2.TWorld.mul22y(dx, dy);
				
				//position of contact point
				var dpx = (b2.sweep.c.x + r2x) - (b1.sweep.c.x + r1x);
				var dpy = (b2.sweep.c.y + r2y) - (b1.sweep.c.y + r1y);
				
				var separation = (dpx * nx + dpy * ny) + ccp.separation;
				minSeparation = Math.min(minSeparation, separation);
				var C = baumgarte * Mathematics.fclamp(separation + _settings.linSlop, -_settings.maxLinCorrection, 0);
				var impulse = -ccp.equalizedMass * C;
				
				var px = impulse * nx;
				var py = impulse * ny;
				
				b1.sweep.c.x -= invMass1 * px;
				b1.sweep.c.y -= invMass1 * py;
				b1.sweep.a -= invI1 * (r1x * py - r1y * px);
				b1.syncT();
				
				b2.sweep.c.x += invMass2 * px;
				b2.sweep.c.y += invMass2 * py;
				b2.sweep.a += invI2 * (r2x * py - r2y * px);
				b2.syncT();
				
				ccp = ccp.next;
			}
		}
		
		return minSeparation >= -1.5 * _settings.linSlop;
	}
}

import de.polygonal.motor.dynamics.RigidBody;
import de.polygonal.motor.dynamics.contact.Manifold;

private class ContactConstraint
{
	public var body1:RigidBody;
	public var body2:RigidBody;
	
	public var nx:Float;
	public var ny:Float;
	
	public var manifold:Manifold;
	public var friction:Float;
	public var restitution:Float;
	
	public var pointCount:Int;
	
	public var ccp1:ContactConstraintPoint;
	public var ccp2:ContactConstraintPoint;
	
	public var normalMass11:Float; public var normalMass12:Float;
	public var normalMass21:Float; public var normalMass22:Float;
	
	public var K11:Float; public var K12:Float;
	public var K21:Float; public var K22:Float;
	
	public function new()
	{
		nx = 0;
		ny = 0;
		
		normalMass11 = 0; normalMass12 = 0;
		normalMass21 = 0; normalMass22 = 0;
		
		K11 = 0; K12 = 0;
		K21 = 0; K22 = 0;
		
		ccp1 = new ContactConstraintPoint();
		ccp2 = ccp1.next = new ContactConstraintPoint();
	}
	
	public function free():Void
	{
		ccp1.free();
		ccp2.free();
		
		body1    = null;
		body2    = null;
		manifold = null;
		ccp1     = null;
		ccp2     = null;
	}
}

import de.polygonal.motor.dynamics.contact.ManifoldPoint;

private class ContactConstraintPoint
{
	public var tangentImpulse:Float;
	public var normalMass:Float;
	public var tangentMass:Float;
	public var normalImpulse:Float;
	public var equalizedMass:Float;
	public var separation:Float;
	public var velocityBias:Float;
	
	//contact point position in object space of body1 & body2
	public var l1x:Float; public var l2x:Float;
	public var l1y:Float; public var l2y:Float;
	
	//radius vectors in world space (center of mass body1&body2->contact)
	public var r1x:Float; public var r2x:Float;
	public var r1y:Float; public var r2y:Float;
	
	public var next:ContactConstraintPoint;
	
	public function new()
	{
		l1x = l2x = 0;
		l1y = l2y = 0;
		r1x = r2x = 0;
		r1y = r2y = 0;
	}
	
	public function free():Void
	{
		next = null;
	}
	
	inline public function setLocalPosition(mp:ManifoldPoint):Void
	{
		var t = mp.lp1;
		l1x = t.x; 
		l1y = t.y; 
		var t = mp.lp2;
		l2x = t.x; 
		l2y = t.y; 
	}
}