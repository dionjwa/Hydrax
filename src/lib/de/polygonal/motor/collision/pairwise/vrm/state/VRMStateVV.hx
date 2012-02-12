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

import de.polygonal.motor.collision.pairwise.vrm.VRM;
import de.polygonal.motor.collision.pairwise.vrm.VRMFeaturePair;
import de.polygonal.motor.collision.pairwise.vrm.VRMState;

class VRMStateVV extends VRMState
{
	override public function compute(vrm:VRM, fp:VRMFeaturePair):Int
	{
		var f1 = fp.f1;
		var f2 = fp.f2;
		
		//search for voronoi plane VP(E, V1) that V2 violates
		var dx = f2.v.x - f1.v.x;
		var dy = f2.v.y - f1.v.y;
		var d = f1.nl.x * dy - f1.nl.y * dx;
		if (d < 0)
		{
			fp.f1 = f1.prev;
			vrm.state = vrm.evState;
			return VRMState.CONTINUE;
		}
		
		//search for voronoi plane VP(V1, E) that V2 violates
		d = f1.nr.y * dx - f1.nr.x * dy;
		if (d < 0)
		{
			fp.f1 = f1.next;
			vrm.state = vrm.evState;
			return VRMState.CONTINUE;
		}
		
		//repeat, swapping roles of V1 & V2
		dx = f1.v.x - f2.v.x;
		dy = f1.v.y - f2.v.y;
		d = f2.nl.x * dy - f2.nl.y * dx;
		if (d < 0)
		{
			fp.f2 = f2.prev;
			vrm.state = vrm.veState;
			return VRMState.CONTINUE;
		}
		
		d = f2.nr.y * dx - f2.nr.x * dy;
		if (d < 0)
		{
			fp.f2 = f2.next;
			vrm.state = vrm.veState;
			return VRMState.CONTINUE;
		}
		
		return VRMState.DONE;
	}
	
	override private function _setType():Void
	{
		type = VRMState.VV;
	}
}