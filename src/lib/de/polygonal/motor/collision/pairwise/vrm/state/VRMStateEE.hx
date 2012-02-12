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

import de.polygonal.core.math.Vec2Util;
import de.polygonal.motor.collision.pairwise.vrm.VRM;
import de.polygonal.motor.collision.pairwise.vrm.VRMFeature;
import de.polygonal.motor.collision.pairwise.vrm.VRMFeaturePair;
import de.polygonal.motor.collision.pairwise.vrm.VRMState;
import de.polygonal.core.math.Vec2;

class VRMStateEE extends VRMState
{
	override public function compute(vrm:VRM, fp:VRMFeaturePair):Int
	{
		var ef1 = fp.f1;
		var ef2 = fp.f2;
		
		var qmin = .0, qmax = 1.0;
		var nmin:VRMFeature = null, nmax:VRMFeature = null;
		
		var n = ef1.n;
		
		//clip E2 against VR(E1)
		var dt = n.x * (ef2.v.y - ef1.v.y) - n.y * (ef2.v.x - ef1.v.x);
		var dh = n.x * (ef2.w.y - ef1.v.y) - n.y * (ef2.w.x - ef1.v.x);
		var dt2 = Vec2Util.perpDot4(n.x, n.y, ef2.v.x - ef1.v.x, ef2.v.y - ef1.v.y);
		var dh2 = Vec2Util.perpDot4(n.x, n.y, ef2.w.x - ef1.v.x, ef2.w.y - ef1.v.y);
		
		#if debug
		de.polygonal.core.util.Assert.assert(dt == dt2, "dt == dt2");
		#end
		
		#if debug
		de.polygonal.core.util.Assert.assert(dh2 == dh, "dh2 = dh");
		#end
		
		if (dt < .0 && dh < .0)
		{
			//E2 simply excluded by VP(E1, V)
			fp.f1 = ef1.prev;
			vrm.state = vrm.veState;
			return VRMState.CONTINUE;
		}
		else
		if (dt < .0)
		{
			var q = dt / (dt - dh);
			if (q > qmin)
			{
				qmin = q;
				nmin = ef1.prev;
			}
		}
		else
		if (dh < .0)
		{
			var q = dt / (dt - dh);
			if (q < qmax)
			{
				qmax = q;
				nmax = ef1.prev;
			}
		}
		
		//clip edge against second voronoi plane
		dt = n.y * (ef2.v.x - ef1.w.x) - n.x * (ef2.v.y - ef1.w.y);
		dh = n.y * (ef2.w.x - ef1.w.x) - n.x * (ef2.w.y - ef1.w.y);
		if (dt < .0 && dh < .0)
		{
			//E2 simply excluded by VP(E1, V)
			fp.f1 = ef1.next;
			vrm.state = vrm.veState;
			return VRMState.CONTINUE;
		}
		else
		if (dt < .0)
		{
			var q = dt / (dt - dh);
			if (q > qmin)
			{
				qmin = q;
				nmin = ef1.next;
			}
		}
		else
		if (dh < .0)
		{
			var q = dt / (dt - dh);
			if (q < qmax)
			{
				qmax = q;
				nmax = ef1.next;
			}
		}
		
		//check derivatives, possibly update E1
		var ux =-ef2.n.y;
		var uy = ef2.n.x;
		
		var t = ef2.v;
		var h = ef2.w;
		
		if (nmin != null)
		{
			//D'[E, X](lambdaMin > 0)
			//update X to NMin
			var tmp = qmin * ef2.l;
			var qx = t.x + tmp * ux;
			var qy = t.y + tmp * uy;
			
			if ((ux * (qx - nmin.v.x) + uy * (qy - nmin.v.y)) > .0)
			{
				fp.f1 = nmin;
				vrm.state = vrm.veState;
				return VRMState.CONTINUE;
			}
		}
		if (nmax != null)
		{
			//D'[E, X](lambdaMin > 0)
			//update X to NMin
			var tmp = qmax * ef2.l;
			var qx = t.x + tmp * ux;
			var qy = t.y + tmp * uy;
			
			if ((ux * (qx - nmax.v.x) + uy * (qy - nmax.v.y)) < .0)
			{
				fp.f1 = nmax;
				vrm.state = vrm.veState;
				return VRMState.CONTINUE;
			}
		}
		
		//check penetration: are vertices of edge on different sides of E ?
		var penetrate = false;
		var behind0 = (t.x - ef1.v.x) * n.x + (t.y - ef1.v.y) * n.y;
		var behind1 = (h.x - ef1.v.x) * n.x + (h.y - ef1.v.y) * n.y;
		if (behind0 * behind1 < .0) penetrate = true;
		
		/*/////////////////////////////////////////////////////////
		// repeat swapping roles of E1 & E2
		/////////////////////////////////////////////////////////*/
		
		qmin = .0; qmax = 1.0;
		nmin = nmax = null;
		
		n = ef2.n;
		
		//clip E1 against VR(E2)
		dt = n.x * (ef1.v.y - ef2.v.y) - n.y * (ef1.v.x - ef2.v.x);
		dh = n.x * (ef1.w.y - ef2.v.y) - n.y * (ef1.w.x - ef2.v.x);
		if (dt < .0 && dh < .0)
		{
			//E1 simply excluded by VP(E2, V)
			fp.f2 = ef2.prev;
			vrm.state = vrm.evState;
			return VRMState.CONTINUE;
		}
		else
		if (dt < .0)
		{
			var q = dt / (dt - dh);
			if (q > qmin)
			{
				qmin = q;
				nmin = ef2.prev;
			}
		}
		else
		if (dh < .0)
		{
			var q = dt / (dt - dh);
			if (q < qmax)
			{
				qmax = q;
				nmax = ef2.prev;
			}
		}
		
		//clip edge against second voronoi plane
		dt = n.y * (ef1.v.x - ef2.w.x) - n.x * (ef1.v.y - ef2.w.y);
		dh = n.y * (ef1.w.x - ef2.w.x) - n.x * (ef1.w.y - ef2.w.y);
		if (dt < .0 && dh < .0)
		{
			//E1 simply excluded by VP(E2, V)
			fp.f2 = ef2.next;
			vrm.state = vrm.evState;
			return VRMState.CONTINUE;
		}
		else
		if (dt < .0)
		{
			var q = dt / (dt - dh);
			if (q > qmin)
			{
				qmin = q;
				nmin = ef2.next;
			}
		}
		else
		if (dh < .0)
		{
			var q = dt / (dt - dh);
			if (q < qmax)
			{
				qmax = q;
				nmax = ef2.next;
			}
		}
		
		//check derivatives, possibly update E2
		ux =-ef1.n.y;
		uy = ef1.n.x;
		
		t = ef1.v;
		h = ef1.w;
		
		if (nmin != null)
		{
			//D'[E, X](lambdaMin > 0)
			//update X to NMin
			var tmp = qmin * ef1.l;
			var qx = t.x + tmp * ux;
			var qy = t.y + tmp * uy;
			
			if ((ux * (qx - nmin.v.x) + uy * (qy - nmin.v.y)) > .0)
			{
				fp.f2 = nmin;
				vrm.state = vrm.evState;
				return VRMState.CONTINUE;
			}
		}
		if (nmax != null)
		{
			//D'[E, X](lambdaMin > 0)
			//update X to NMin
			var tmp = qmax * ef1.l;
			var qx = t.x + tmp * ux;
			var qy = t.y + tmp * uy;
			
			if ((ux * (qx - nmax.v.x) + uy * (qy - nmax.v.y)) < .0)
			{
				fp.f2 = nmax;
				vrm.state = vrm.evState;
				return VRMState.CONTINUE;
			}
		}
		
		//check penetration: are vertices of edge on different sides of E ?
		behind0 = (t.x - ef2.v.x) * n.x + (t.y - ef2.v.y) * n.y;
		behind1 = (h.x - ef2.v.x) * n.x + (h.y - ef2.v.y) * n.y;
		
		if (behind0 * behind1 < .0)
			if (penetrate)
				return VRMState.PENETRATION;
		
		return VRMState.DONE;
	}
	
	override function _setType():Void
	{
		type = VRMState.EE;
	}
}