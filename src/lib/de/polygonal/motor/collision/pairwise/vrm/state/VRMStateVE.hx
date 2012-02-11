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
package de.polygonal.motor.collision.pairwise.vrm.state;

import de.polygonal.core.math.Mathematics;
import de.polygonal.motor.collision.pairwise.vrm.VRM;
import de.polygonal.motor.collision.pairwise.vrm.VRMFeature;
import de.polygonal.motor.collision.pairwise.vrm.VRMFeaturePair;
import de.polygonal.motor.collision.pairwise.vrm.VRMState;

class VRMStateVE extends VRMState
{
	override public function compute(vrm:VRM, fp:VRMFeaturePair):Int
	{
		var vf = fp.f1;
		var ef = fp.f2;
		
		var vx = vf.v.x, tx = ef.v.x, hx = ef.w.x, nx = ef.n.x;
		var vy = vf.v.y, ty = ef.v.y, hy = ef.w.y, ny = ef.n.y;
		
		//search voronoi plane VP(V, E) that V violates
		if (nx * (vy - ty) - ny * (vx - tx) < 0)
		{
			//edge to negative vertex
			fp.f2 = ef.prev;
			vrm.state = vrm.vvState;
			return VRMState.CONTINUE;
		}
		
		//search voronoi plane VP(E, V) that V violates
		if (ny * (vx - hx) - nx * (vy - hy) < 0)
		{
			//edge to positive vertex
			fp.f2 = ef.next;
			vrm.state = vrm.vvState;
			return VRMState.CONTINUE;
		}
		
		//clip E against VR(V) from t -> h
		var qmin = .0, qmax = .1;
		var nmin:VRMFeature = null, nmax:VRMFeature = null;
		
		var earlyOut = false;
		
		//clip edge against first voronoi plane
		var dt = vf.nl.x * (ty - vy) - vf.nl.y * (tx - vx);
		var dh = vf.nl.x * (hy - vy) - vf.nl.y * (hx - vx);
		
		if (dt < 0 && dh < 0)
		{
			//simple exclusion
			fp.f1 = vf.prev;
			vrm.state = vrm.eeState;
			return VRMState.CONTINUE;
		}
		else
		if (dt < 0)
		{
			var q = dt / (dt - dh);
			if (q > qmin)
			{
				qmin = q;
				nmin = vf.prev;
				earlyOut = qmin > qmax;
			}
		}
		else
		if (dh < 0)
		{
			var q = dt / (dt - dh);
			if (q < qmax)
			{
				qmax = q;
				nmax = vf.prev;
				earlyOut = qmin > qmax;
			}
		}
		
		if (earlyOut == false)
		{
			//clip edge against second voronoi plane
			dt = vf.nr.y * (tx - vx) - vf.nr.x * (ty - vy);
			dh = vf.nr.y * (hx - vx) - vf.nr.x * (hy - vy);
			if (dt < 0 && dh < 0)
			{
				//simple exclusion
				fp.f1 = vf.next;
				vrm.state = vrm.eeState;
				return VRMState.CONTINUE;
			}
			else
			if (dt < 0)
			{
				var q = dt / (dt - dh);
				if (q > qmin)
				{
					qmin = q;
					nmin = vf.next;
				}
			}
			else
			if (dh < 0)
			{
				var q = dt / (dt - dh);
				if (q < qmax)
				{
					qmax = q;
					nmax = vf.next;
				}
			}
		}
		
		//compound exclusion / case when E Intersects VR(V)
		//post clipping check derivative checks, possible update V [algo2]
		if (nmin != null)
		{
			//D'[E, X](lambdaMin > 0), update X to NMin
			if (((ty + (ef.l * qmin) * nx - vy) * nx - ny * (tx - (ef.l * qmin) * ny - vx)) > 1e-6)
			{
				fp.f1 = nmin;
				vrm.state = vrm.eeState;
				return VRMState.CONTINUE;
			}
		}
		if (nmax != null)
		{
			//for the exclusion case, only the condition on line 1 need be tested, for if it is false,
			//the condition on line 3 must be true. [algo2]
			if (qmin > qmax)
			{
				//update X to NMax
				fp.f1 = nmax;
				vrm.state = vrm.eeState;
				return VRMState.CONTINUE;
			}
			
			//D'[E, X](lambdaMax < 0), update X to Nmax
			if (((ty + (ef.l * qmax) * nx - vy) * nx - ny * (tx - (ef.l * qmax) * ny - vx)) <-1e-6)
			{
				//update X to NMax
				fp.f1 = nmax;
				vrm.state = vrm.eeState;
				return VRMState.CONTINUE;
			}
		}
		
		//detect penetration or dislodge from local minimum [algo3]
		//check if behind edge plane
		if ((vx - tx) * nx + (vy - ty) * ny < 0)
		{
			var f = ef;
			var newFeature:VRMFeature = null;
			var dmax = Mathematics.NEGATIVE_INFINITY;
			for (i in 0...ef.shape.vertexCount)
			{
				//skip vertex features
				f = f.next.next;
				var dist = vx * f.n.x + vy * f.n.y - (f.v.x * f.n.x + f.v.y * f.n.y);
				if (dist > dmax)
				{
					dmax = dist;
					newFeature = f;
				}
			}
			
			if (dmax <= 0) return VRMState.TRAP;
			
			//f2 is edge
			//update VF to N
			fp.f2 = newFeature;
			vrm.state = vrm.veState;
			return VRMState.CONTINUE;
		}
		return VRMState.DONE;
	}
	
	override function _setType():Void
	{
		type = VRMState.VE;
	}
}