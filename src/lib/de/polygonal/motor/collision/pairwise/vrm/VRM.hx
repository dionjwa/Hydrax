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
package de.polygonal.motor.collision.pairwise.vrm;

import de.polygonal.motor.collision.pairwise.vrm.state.VRMStateEE;
import de.polygonal.motor.collision.pairwise.vrm.state.VRMStateEV;
import de.polygonal.motor.collision.pairwise.vrm.state.VRMStateVE;
import de.polygonal.motor.collision.pairwise.vrm.state.VRMStateVV;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.collision.shape.feature.Vertex;

/**
 * A highly optimized 2D <b>v</b>oronoi <b>r</b>egion <b>m</b>ethod based on
 * Ming Lin's and John Canny's closest features algorithm (Lin-Canny) and the V-Clip algorithm (Mirtich).
 * Maintains the pair of closest features (vertices, edges) between two convex polygons moving through space.
 * Once the closest features are known, the distance between two polygons is easily found.
 * see<a href="http://www.cs.berkeley.edu/~jfc/papers/91/LCicra91.pdf" target="_blank">http://www.cs.berkeley.edu/~jfc/papers/91/LCicra91.pdf</a>
 * see<a href="http://portal.acm.org/citation.cfm?id=285860" target="_blank">http://portal.acm.org/citation.cfm?id=285860</a>
 * <b>For research purposes only (patended by Mitsubishi Electric)!</b>
 */
class VRM
{
	static var VV_STATE = new VRMStateVV();
	static var VE_STATE = new VRMStateVE();
	static var EV_STATE = new VRMStateEV();
	static var EE_STATE = new VRMStateEE();
	
	public var featureList1:VRMFeature;
	public var featureList2:VRMFeature;
	public var featurePair:VRMFeaturePair;

	public var state:VRMState;
	public var outCode:Int;
	public var iterations:Int;
	
	public var vvState:VRMStateVV;
	public var veState:VRMStateVE;
	public var evState:VRMStateEV;
	public var eeState:VRMStateEE;
	
	public function new(s1:AbstractShape, s2:AbstractShape)
	{
		featureList1 = _initFeatureList(s1);
		featureList2 = _initFeatureList(s2);
		
		featurePair = new VRMFeaturePair();
		featurePair.f1 = featureList1;
		featurePair.f2 = featureList2;
		
		vvState = VV_STATE;
		veState = VE_STATE;
		evState = EV_STATE;
		eeState = EE_STATE;
		
		state = vvState;
	}

	public function evaluate():Int
	{
		iterations = 0;
		do
		{
			outCode = state.compute(this, featurePair);
			iterations++;
		}
		while (outCode == VRMState.CONTINUE);
		return outCode;
	}
	
	function _initFeatureList(s:AbstractShape):VRMFeature
	{
		var wv = s.worldVertexChain;
		var wn = s.worldNormalChain;
		
		//vertex/edge features
		var f0:VRMFeature;
		var f1:VRMFeature;
		
		var vf:VRMFeature;
		var ef:VRMFeature;
		
		var i:Int = 0;
		
		vf = _createVertexFeature(wv, wn);
		vf.id = i++;
		vf.shape = s;
		ef = _createEdgeFeature(wv, wn);
		ef.shape = s;
		ef.id = i++;
		
		vf.next = ef;
		ef.prev = vf;
		
		f0 = vf;
		f1 = ef;
		
		wv = wv.next;
		wn = wn.next;
		
		while (wv != null)
		{
			vf = _createVertexFeature(wv, wn);
			vf.id = i++;
			vf.shape = s;
			
			ef = _createEdgeFeature(wv, wn);
			ef.id = i++;
			ef.shape = s;
			
			vf.next = ef;
			ef.prev = vf;
			
			f1.next = vf;
			vf.prev = f1;
			
			f1 = ef;
			
			if (wv.tail) break;
			wv = wv.next;
			wn = wn.next;
		}
		
		f1.next = f0;
		f0.prev = f1;
		
		return f0;
	}

	function _createVertexFeature(wv:Vertex, wn:Vertex):VRMFeature
	{
		var vf = new VRMFeature();
		vf.type = VRMFeature.TYPE_VERT;
		
		vf.v = wv;
		vf.n = wn;
		vf.l = -1;
		
		vf.nl = wn.prev;
		vf.nr = wn;
		
		return vf;
	}

	function _createEdgeFeature(wv:Vertex, wn:Vertex):VRMFeature
	{
		var ef = new VRMFeature();
		ef.type = VRMFeature.TYPE_EDGE;
		
		ef.v = wv;
		ef.w = wv.next;
		ef.n = wn;
		ef.l = wv.edge.length;
		return ef;
	}
}