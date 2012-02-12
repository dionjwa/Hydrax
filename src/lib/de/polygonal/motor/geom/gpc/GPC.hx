/*
 * This license does NOT supersede the original license of GPC:
 * http://www.cs.man.ac.uk/~toby/alan/software/#Licensing
 * GPC is free for non-commercial use ONLY.
 * If you wish to use GPC in support of a commercial product,
 * you must obtain an official GPC Commercial Use Licence from The University of Manchester.
 *
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
package de.polygonal.motor.geom.gpc;

import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.math.Limits;
import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.Vec2;
import de.polygonal.ds.ArrayUtil;
import de.polygonal.ds.DA;
import de.polygonal.ds.mem.BitMemory;
import de.polygonal.ds.mem.DoubleMemory;
import de.polygonal.ds.mem.IntMemory;
import de.polygonal.ds.pooling.DynamicObjectPool;
import de.polygonal.motor.geom.primitive.AABB2;

/**
 * <p>The clip operation to be performed by the <em>GPC</em> class.</p>
 */
enum ClipOperation
{
	/**
	 * Difference clip operation.
	 */
	Difference;
	
	/**
	 * Intersection clip operation.
	 */
	Intersection;
	
	/**
	 * Exclusive-or clip operation.
	 */
	XOr;
	
	/**
	 * Union clip operation.
	 */
	Union;
}

/**
 * <p>The General Polygon Clipper (GPC) algorithm developed by Alan Murta.</p>
 * <p>The home page for the original source can be found at <a href="http://www.cs.man.ac.uk/aig/staff/alan/software/" target="_blank">http://www.cs.man.ac.uk/aig/staff/alan/software/</a>.</p>
 * <p><warn>GPC is free for non-commercial use only.</warn></p>
 * <p>See <a href="http://www.cs.man.ac.uk/~toby/alan/software/#Licensing" target="_blank">http://www.cs.man.ac.uk/~toby/alan/software/#Licensing</a></p>
 * <p>Example:</p>
 * <p><pre class="prettyprint">
 * import de.polygonal.gl.VectorRenderer;
 * import de.polygonal.gl.Window;
 * import de.polygonal.motor.geom.gpc.GPC;
 * import de.polygonal.motor.geom.gpc.GPCPolygon;
 * import de.polygonal.motor.geom.primitive.AABB2;
 * 
 * class SimpleExample
 * {
 *     public static function main() {
 *         Window.initBackgroundColor = 0xffffff;
 *         de.polygonal.core.Root.init(onInit, true);
 *     }
 *     
 *     static function onInit() {
 *         //the input shapes
 *         var box1 = new AABB2(100, 100, 200, 200);
 *         var box2 = new AABB2(150, 150, 250, 250);
 *         
 *         //define first input polygon
 *         var input1 = new GPCPolygon();
 *         input1.addContour(box1.getVertexListScalar(new Array<Float>()), 8);
 *         
 *         //define second input polygon
 *         var input2 = new GPCPolygon();
 *         input2.addContour(box2.getVertexListScalar(new Array<Float>()), 8);
 *         
 *         //define output polygon
 *         var output = new GPCPolygon();
 *         
 *         //compute union of input1 and input
 *         GPC.clip(input1, input2, output, ClipOperation.Union);
 *         
 *         var vr = new VectorRenderer();
 *         
 *         //draw input
 *         vr.setLineStyle();
 *         vr.aabb(box1);
 *         vr.aabb(box2);
 *         
 *         //draw output
 *         vr.setLineStyle(0xff0000, .5, 4);
 *         for (contour in output) vr.polyLineScalar(contour.getArray(), true, contour.size());
 *         
 *         //draw everything
 *         vr.flush(Window.surface.graphics);
 * 
 *         //release memory used by GPC class (if never used again)
 *         GPC.free();
 *     }
 * }</pre></p>
 */
class GPC
{
	inline static function EQ(a:Float, b:Float):Bool
	{
		return Mathematics.cmpAbs(a, b, C.GPC_EPSILON);
	}
	inline static function OPTIMAL(v:DA<Float>, i:Int):Bool
	{
		var k = v.size();
		var y = v.get(i + 1);
		
		var prev = i - 2;
		if (prev == -2) prev = k - 2;
		var next = i + 2;
		if (next == k) next = 0;
		
		return (v.get(prev + 1) != y) || (v.get(next + 1) != y);
	}
	
	static var _HSTATE:HState;
	
	static var _nonContributingFlags:Array<Array<Bool>>;
	static var _o_table:BitMemory;
	static var _parity:IntMemory;
	static var _horiz:IntMemory;
	static var _exists:IntMemory;
	static var _subjBoxes:Array<AABB2>;
	static var _clipBoxes:Array<AABB2>;
	static var _vertexBuffer:Array<Float>;
	
	/**
	 * The clipper takes a pair of polygons <code>a</code> and <code>b</code> and combines them to form a result polygon <code>c</code> by applying the clip operation <code>op</code>.
	 * @param c delivers the result as a polygon structure.
	 * @return a reference to <code>c</code>.
	 */
	public static function clip(a:GPCPolygon, b:GPCPolygon, c:GPCPolygon, op:ClipOperation):GPCPolygon
	{
		switch (op)
		{
			case ClipOperation.Difference:
				return _clip(a, b, c, OperationType.GPC_DIFF);
			
			case ClipOperation.Intersection:
				return _clip(a, b, c, OperationType.GPC_INT);
			
			case ClipOperation.Union:
				return _clip(a, b, c, OperationType.GPC_UNION);
			
			case ClipOperation.XOr:
				return _clip(a, b, c, OperationType.GPC_XOR);
		}
	}
	
	/**
	 * Releases all memory used by clip algorithm for GC'ing used resources.
	 */
	public static function free():Void
	{
		if (_HSTATE       != null) _HSTATE.free();
		if (_parity       != null) _parity.free();
		if (_horiz        != null) _horiz.free();
		if (_exists       != null) _exists.free();
		if (_o_table      != null) _o_table.free();
		
		_HSTATE               = null;
		_o_table              = null;
		_nonContributingFlags = null;
		_parity               = null;
		_horiz                = null;
		_exists               = null;
		_subjBoxes            = null;
		_clipBoxes            = null;
		_vertexBuffer         = null;
		
		if (ScanBeamTreeEntries != null)
			ScanBeamTreeEntries.instance.free();
		
		TopPolygonNode.instance      = null;
		ScanBeamTreeEntries.instance = null;
		AetTree.instance             = null;
		LmtTable.instance            = null;
		
		  VertexNode.Free();
		   EdgeTable.Free();
		 ItNodeTable.Free();
		      StNode.Free();
		 PolygonNode.Free();
		ScanBeamTree.Free();
		     LmtNode.Free();
		      ItNode.Free();
		    EdgeNode.Free();
	}
	
	static function _clip(subj:GPCPolygon, clip:GPCPolygon, result:GPCPolygon, op:Int):GPCPolygon
	{
		if (_HSTATE == null) _HSTATE = new HState();
		
		  VertexNode.getCache().reclaim();
		   EdgeTable.getCache().reclaim();
		 ItNodeTable.getCache().reclaim();
		      StNode.getCache().reclaim();
		 PolygonNode.getCache().reclaim();
		ScanBeamTree.getCache().reclaim();
		     LmtNode.getCache().reclaim();
		      ItNode.getCache().reclaim();
		    EdgeNode.getCache().reclaim();
		
		if ((subj.numContours == 0 && clip.numContours == 0) ||
			(subj.numContours == 0 && ((op == OperationType.GPC_INT) || (op == OperationType.GPC_DIFF))) ||
			(clip.numContours == 0 &&  (op == OperationType.GPC_INT)))
		{
			return result;
		}
		
		if (((op == OperationType.GPC_INT) || (op == OperationType.GPC_DIFF)) && 
			subj.numContours > 0 && clip.numContours > 0)
		{
			_minimax_test(subj, clip, op);
		}
		
		if (LmtTable.instance == null)
			LmtTable.instance = new LmtTable();
		var lmt_table = LmtTable.instance;
		lmt_table.init();
		
		if (ScanBeamTreeEntries.instance == null)
			ScanBeamTreeEntries.instance = new ScanBeamTreeEntries();
		var sbte = ScanBeamTreeEntries.instance;
		sbte.init();
		
		var s_heap = null;
		var c_heap = null;
		if (subj.numContours > 0)
			s_heap = _build_lmt(lmt_table, sbte, subj, C.SUBJ, op);
		
		if (clip.numContours > 0)
			c_heap = _build_lmt(lmt_table, sbte, clip, C.CLIP, op);
		
		if (lmt_table.top_node == null)
			return result;
		
		var sbt = sbte.sbt;
		var sbtSize = sbte.build_sbt();
		
		if (_parity == null) _parity = new IntMemory(2);
		var parity = _parity;
		parity.set(0, C.LEFT);
		parity.set(1, C.LEFT);
		
		if (op == OperationType.GPC_DIFF)
			parity.set(C.CLIP, C.RIGHT);
		
		var local_min = lmt_table.top_node;
		
		if (TopPolygonNode.instance == null)
			TopPolygonNode.instance = new TopPolygonNode();
		var out_poly = TopPolygonNode.instance;
		out_poly.init();
		
		if (AetTree.instance == null)
			AetTree.instance = new AetTree();
		var aet = AetTree.instance;
		aet.init();
		
		var scanbeam = 0;
		
		if (_horiz == null)
			_horiz = new IntMemory(2);
		
		if (_exists == null)
			_exists = new IntMemory(2);
		
		var horiz  = _horiz;
		var exists = _exists;
		
		while (scanbeam < sbtSize)
		{
			var yb = sbt.get(scanbeam++);
			var yt = .0;
			var dy = .0;
			if (scanbeam < sbtSize)
			{
				yt = sbt.get(scanbeam);
				dy = yt - yb;
			}
			
			if (local_min != null)
			{
				if (local_min.y == yb)
				{
					var edge = local_min.first_bound;
					while (edge != null)
					{
						_add_edge_to_aet(aet, edge);
						edge = edge.next_bound;
					}
					
					local_min = local_min.next;
				}
			}
			
			var px = -Limits.FLOAT_MAX;
			
			var e0 = aet.top_node;
			var e1 = aet.top_node;
			
			aet.top_node.bundleSet(C.ABOVE, aet.top_node.type, (aet.top_node.top.y != yb) ? 1: 0);
			aet.top_node.bundleSet(C.ABOVE, ((aet.top_node.type == 0) ? 1: 0), 0);
			aet.top_node.bstate.set(C.ABOVE, BundleState.UNBUNDLED);
			
			var next_edge = aet.top_node.next;
			while (next_edge != null)
			{
				var ne_type = next_edge.type;
				var ne_type_opp = ((next_edge.type == 0) ? 1: 0);
				
				next_edge.bundleSet(C.ABOVE, ne_type, (next_edge.top.y != yb) ? 1: 0);
				next_edge.bundleSet(C.ABOVE, ne_type_opp, 0);
				
				next_edge.bstate.set(C.ABOVE, BundleState.UNBUNDLED);
				
				if (next_edge.bundleGet(C.ABOVE, ne_type) == 1)
				{
					if (EQ(e0.xb, next_edge.xb) && EQ(e0.dx, next_edge.dx) && (e0.top.y != yb))
					{
						next_edge.bundleXOR(C.ABOVE, ne_type, e0.bundleGet(C.ABOVE, ne_type));
						next_edge.bundleSet(C.ABOVE, ne_type_opp, e0.bundleGet(C.ABOVE, ne_type_opp));
						next_edge.bstate.set(C.ABOVE, BundleState.BUNDLE_HEAD);
						e0.bundleSet(C.ABOVE, C.CLIP, 0);
						e0.bundleSet(C.ABOVE, C.SUBJ, 0);
						e0.bstate.set(C.ABOVE, BundleState.BUNDLE_TAIL);
					}
					e0 = next_edge;
				}
				next_edge = next_edge.next;
			}
			
			horiz.set(C.CLIP, HState.NH);
			horiz.set(C.SUBJ, HState.NH);
			exists.set(C.CLIP, 0);
			exists.set(C.SUBJ, 0);
			
			var cf:PolygonNode = null;
			
			var hstate = _HSTATE;
			
			var edge = aet.top_node;
			while (edge != null)
			{
				exists.set(C.CLIP, edge.bundleGet(C.ABOVE, C.CLIP) + (edge.bundleGet(C.BELOW, C.CLIP) << 1));
				exists.set(C.SUBJ, edge.bundleGet(C.ABOVE, C.SUBJ) + (edge.bundleGet(C.BELOW, C.SUBJ) << 1));
				
				if ((exists.get(C.CLIP) != 0) || (exists.get(C.SUBJ) != 0))
				{
					edge.bside.set(C.CLIP, parity.get(C.CLIP));
					edge.bside.set(C.SUBJ, parity.get(C.SUBJ));
					
					var contributing = false;
					var br = 0;
					var bl = 0;
					var tr = 0;
					var tl = 0;
					
					if ((op == OperationType.GPC_DIFF) || (op == OperationType.GPC_INT))
					{
						contributing= ((exists.get(C.CLIP) != 0) && ((parity.get(C.SUBJ) != 0) || (horiz.get(C.SUBJ) != 0))) ||
							((exists.get(C.SUBJ) != 0) && ((parity.get(C.CLIP) != 0) || (horiz.get(C.CLIP) != 0))) ||
							((exists.get(C.CLIP) != 0) && (exists.get(C.SUBJ) != 0) && (parity.get(C.CLIP) == parity.get(C.SUBJ)));
						br = ((parity.get(C.CLIP) != 0) && (parity.get(C.SUBJ) != 0)) ? 1: 0;
						bl = (((parity.get(C.CLIP) ^ edge.bundleGet(C.ABOVE,C.CLIP)) != 0) &&
							((parity.get(C.SUBJ) ^ edge.bundleGet(C.ABOVE,C.SUBJ)) != 0)) ? 1: 0;
						tr = (((parity.get(C.CLIP) ^ ((horiz.get(C.CLIP) != HState.NH) ? 1:0))  != 0) && 
							((parity.get(C.SUBJ) ^ ((horiz.get(C.SUBJ) != HState.NH) ? 1:0))  != 0)) ? 1: 0;
						tl = (((parity.get(C.CLIP) ^ ((horiz.get(C.CLIP) != HState.NH) ? 1:0) ^ edge.bundleGet(C.BELOW,C.CLIP)) != 0) &&
							((parity.get(C.SUBJ) ^ ((horiz.get(C.SUBJ) != HState.NH) ? 1:0) ^ edge.bundleGet(C.BELOW,C.SUBJ)) != 0)) ? 1:0;
					}
					else
					if (op == OperationType.GPC_XOR)
					{
						contributing= (exists.get(C.CLIP) != 0) || (exists.get(C.SUBJ) != 0);
						br= (parity.get(C.CLIP)) ^ (parity.get(C.SUBJ));
						bl= (parity.get(C.CLIP) ^ edge.bundleGet(C.ABOVE,C.CLIP)) ^ (parity.get(C.SUBJ) ^ edge.bundleGet(C.ABOVE,C.SUBJ));
						tr= (parity.get(C.CLIP) ^ ((horiz.get(C.CLIP) != HState.NH) ? 1:0)) ^ (parity.get(C.SUBJ) ^ ((horiz.get(C.SUBJ) != HState.NH) ? 1:0));
						tl= (parity.get(C.CLIP) ^ ((horiz.get(C.CLIP) != HState.NH) ? 1:0) ^ edge.bundleGet(C.BELOW,C.CLIP))
							^ (parity.get(C.SUBJ) ^ ((horiz.get(C.SUBJ) != HState.NH) ? 1:0) ^ edge.bundleGet(C.BELOW,C.SUBJ));
					}
					else
					if (op == OperationType.GPC_UNION)
					{
						contributing=
							((exists.get(C.CLIP) != 0) && (!(parity.get(C.SUBJ) != 0) || (horiz.get(C.SUBJ) != 0))) ||
							((exists.get(C.SUBJ) != 0) && (!(parity.get(C.CLIP) != 0) || (horiz.get(C.CLIP) != 0))) ||
							((exists.get(C.CLIP) != 0) && (exists.get(C.SUBJ) != 0) && (parity.get(C.CLIP) == parity.get(C.SUBJ)));
						br= ((parity.get(C.CLIP) != 0) || (parity.get(C.SUBJ) != 0)) ? 1:0;
						bl= (((parity.get(C.CLIP) ^ edge.bundleGet(C.ABOVE,C.CLIP)) != 0) || ((parity.get(C.SUBJ) ^ edge.bundleGet(C.ABOVE,C.SUBJ)) != 0)) ? 1:0;
						tr= (((parity.get(C.CLIP) ^ ((horiz.get(C.CLIP) != HState.NH) ? 1:0)) != 0) || 
							((parity.get(C.SUBJ) ^ ((horiz.get(C.SUBJ) != HState.NH) ? 1:0)) != 0)) ? 1:0;
						tl= (((parity.get(C.CLIP) ^ ((horiz.get(C.CLIP) != HState.NH) ? 1:0) ^ edge.bundleGet(C.BELOW,C.CLIP)) != 0) ||
							((parity.get(C.SUBJ) ^ ((horiz.get(C.SUBJ) != HState.NH) ? 1:0) ^ edge.bundleGet(C.BELOW,C.SUBJ)) != 0)) ? 1:0;
					}
					else
						throw Sprintf.format("Unknown operation type (%d)", [op]);
					
					parity.set(C.CLIP, parity.get(C.CLIP) ^ edge.bundleGet(C.ABOVE, C.CLIP));
					parity.set(C.SUBJ, parity.get(C.SUBJ) ^ edge.bundleGet(C.ABOVE, C.SUBJ));
					
					if (exists.get(C.CLIP) != 0)
						horiz.set(C.CLIP, hstate.get(((exists.get(C.CLIP) - 1) << 1) + parity.get(C.CLIP), horiz.get(C.CLIP)));
					if (exists.get(C.SUBJ) != 0)
						horiz.set(C.SUBJ, hstate.get(((exists.get(C.SUBJ) - 1) << 1) + parity.get(C.SUBJ), horiz.get(C.SUBJ)));
					
					if (contributing)
					{
						var xb = edge.xb;
						var vclass = VertexType.getType(tr, tl, br, bl);
						switch (vclass)
						{
							case VertexType.EMN, VertexType.IMN:
								edge.outp[C.ABOVE] = out_poly.add_local_min(xb, yb);
								px = xb;
								cf= edge.outp[C.ABOVE];
							case VertexType.ERI:
								if (xb != px)
								{
									cf.add_right(xb, yb);
									px= xb;
								}
								edge.outp[C.ABOVE] = cf;
								cf= null;
							case VertexType.ELI:
								edge.outp[C.BELOW].add_left(xb, yb);
								px= xb;
								cf= edge.outp[C.BELOW];
							case VertexType.EMX:
								if (xb != px)
								{
									cf.add_left(xb, yb);
									px= xb;
								}
								out_poly.merge_right(cf, edge.outp[C.BELOW]);
								cf= null;
							case VertexType.ILI:
								if (xb != px)
								{
									cf.add_left(xb, yb);
									px= xb;
								}
								edge.outp[C.ABOVE] = cf;
								cf= null;
							case VertexType.IRI:
								edge.outp[C.BELOW].add_right(xb, yb);
								px= xb;
								cf= edge.outp[C.BELOW];
								edge.outp[C.BELOW] = null;
							case VertexType.IMX:
								if (xb != px)
								{
									cf.add_right(xb, yb);
									px= xb;
								}
								out_poly.merge_left(cf, edge.outp[C.BELOW]);
								cf= null;
								edge.outp[C.BELOW] = null;
							case VertexType.IMM:
								if (xb != px)
								{
									cf.add_right(xb, yb);
									px= xb;
								}
								out_poly.merge_left(cf, edge.outp[C.BELOW]);
								edge.outp[C.BELOW] = null;
								edge.outp[C.ABOVE] = out_poly.add_local_min(xb, yb);
								cf= edge.outp[C.ABOVE];
							case VertexType.EMM:
								if (xb != px)
								{
									cf.add_left(xb, yb);
									px= xb;
								}
								out_poly.merge_right(cf, edge.outp[C.BELOW]);
								edge.outp[C.BELOW] = null;
								edge.outp[C.ABOVE] = out_poly.add_local_min(xb, yb);
								cf= edge.outp[C.ABOVE];
							case VertexType.LED:
								if (edge.bot.y == yb)
									edge.outp[C.BELOW].add_left(xb, yb);
								edge.outp[C.ABOVE] = edge.outp[C.BELOW];
								px= xb;
							case VertexType.RED:
								if (edge.bot.y == yb)
									edge.outp[C.BELOW].add_right(xb, yb);
								edge.outp[C.ABOVE] = edge.outp[C.BELOW];
								px= xb;
							default:
						}
					}
				}
				edge = edge.next;
			}
			
			var edge = aet.top_node;
			while (edge != null)
			{
				if (edge.top.y == yb)
				{
					var prev_edge = edge.prev;
					var next_edge = edge.next;
					
					if (prev_edge != null)
						prev_edge.next = next_edge;
					else
						aet.top_node = next_edge;
					
					if (next_edge != null)
						next_edge.prev = prev_edge;
					
					if ((edge.bstate.get(C.BELOW) == BundleState.BUNDLE_HEAD) && (prev_edge != null))
					{
						if (prev_edge.bstate.get(C.BELOW) == BundleState.BUNDLE_TAIL)
						{
							prev_edge.outp[C.BELOW] = edge.outp[C.BELOW];
							prev_edge.bstate.set(C.BELOW, BundleState.UNBUNDLED);
							if (prev_edge.prev != null)
							{
								if (prev_edge.prev.bstate.get(C.BELOW) == BundleState.BUNDLE_TAIL)
								{
									prev_edge.bstate.set(C.BELOW, BundleState.BUNDLE_HEAD);
								}
							}
						}
					}
				}
				else
				{
					if (edge.top.y == yt)
						edge.xt= edge.top.x;
					else
						edge.xt= edge.bot.x + edge.dx * (yt - edge.bot.y);
				}
				edge = edge.next;
			}
			
			if (scanbeam < sbte.sbt_entries)
			{
				var it_table = ItNodeTable.get();
				it_table.build_intersection_table(aet, dy);
				
				var intersect = it_table.top_node;
				while (intersect != null)
				{
					e0 = intersect.ie[0];
					e1 = intersect.ie[1];
					
					if (((e0.bundleGet(C.ABOVE,C.CLIP) != 0) || (e0.bundleGet(C.ABOVE,C.SUBJ) != 0)) &&
						((e1.bundleGet(C.ABOVE,C.CLIP) != 0) || (e1.bundleGet(C.ABOVE,C.SUBJ) != 0)))
					{
						var p = e0.outp[C.ABOVE];
						var q = e1.outp[C.ABOVE];
						var ix = intersect.point.x;
						var iy = intersect.point.y + yb;
						
						var in_clip = (((e0.bundleGet(C.ABOVE,C.CLIP) != 0) && !(e0.bside.get(C.CLIP) != 0)) ||
							((e1.bundleGet(C.ABOVE, C.CLIP) != 0) &&  (e1.bside.get(C.CLIP) != 0)) ||
							(!(e0.bundleGet(C.ABOVE, C.CLIP) != 0) && !(e1.bundleGet(C.ABOVE,C.CLIP) != 0) &&
							(e0.bside.get(C.CLIP) != 0) && (e1.bside.get(C.CLIP) != 0))) ? 1: 0;
						
						var in_subj = (((e0.bundleGet(C.ABOVE,C.SUBJ) != 0) && !(e0.bside.get(C.SUBJ) != 0)) ||
							((e1.bundleGet(C.ABOVE,C.SUBJ) != 0) &&  (e1.bside.get(C.SUBJ) != 0)) ||
							(!(e0.bundleGet(C.ABOVE, C.SUBJ) != 0) && !(e1.bundleGet(C.ABOVE,C.SUBJ) != 0) &&
							(e0.bside.get(C.SUBJ) != 0) && (e1.bside.get(C.SUBJ) != 0))) ? 1: 0;
						
						var tr = 0; 
						var tl = 0;
						var br = 0;
						var bl = 0;
						
						if ((op == OperationType.GPC_DIFF) || (op == OperationType.GPC_INT))
						{
							tr = ((in_clip != 0) && (in_subj != 0)) ? 1 : 0;
							tl = (((in_clip ^ e1.bundleGet(C.ABOVE, C.CLIP)) != 0) && ((in_subj ^ e1.bundleGet(C.ABOVE, C.SUBJ)) != 0)) ? 1 : 0;
							br = (((in_clip ^ e0.bundleGet(C.ABOVE, C.CLIP)) != 0) && ((in_subj ^ e0.bundleGet(C.ABOVE, C.SUBJ)) != 0)) ? 1 : 0;
							bl = (((in_clip ^ e1.bundleGet(C.ABOVE, C.CLIP) ^ e0.bundleGet(C.ABOVE, C.CLIP)) != 0) &&
								 ((in_subj ^ e1.bundleGet(C.ABOVE, C.SUBJ) ^ e0.bundleGet(C.ABOVE, C.SUBJ)) != 0)) ? 1 : 0;
						}
						else
						if (op == OperationType.GPC_XOR)
						{
							tr = in_clip^ in_subj;
							tl = (in_clip ^ e1.bundleGet(C.ABOVE,C.CLIP)) ^ (in_subj ^ e1.bundleGet(C.ABOVE,C.SUBJ));
							br = (in_clip ^ e0.bundleGet(C.ABOVE,C.CLIP)) ^ (in_subj ^ e0.bundleGet(C.ABOVE,C.SUBJ));
							bl = (in_clip ^ e1.bundleGet(C.ABOVE,C.CLIP) ^ e0.bundleGet(C.ABOVE, C.CLIP))
								 ^ (in_subj ^ e1.bundleGet(C.ABOVE,C.SUBJ) ^ e0.bundleGet(C.ABOVE, C.SUBJ));
						}
						else
						if (op == OperationType.GPC_UNION)
						{
							tr = ((in_clip != 0) || (in_subj != 0)) ? 1 : 0;
							tl = (((in_clip ^ e1.bundleGet(C.ABOVE, C.CLIP)) != 0) || ((in_subj ^ e1.bundleGet(C.ABOVE,C.SUBJ)) != 0)) ? 1 : 0;
							br = (((in_clip ^ e0.bundleGet(C.ABOVE, C.CLIP)) != 0) || ((in_subj ^ e0.bundleGet(C.ABOVE, C.SUBJ)) != 0)) ? 1 : 0;
							bl = (((in_clip ^ e1.bundleGet(C.ABOVE, C.CLIP) ^ e0.bundleGet(C.ABOVE, C.CLIP)) != 0) ||
								 ((in_subj ^ e1.bundleGet(C.ABOVE, C.SUBJ) ^ e0.bundleGet(C.ABOVE, C.SUBJ)) != 0)) ? 1 : 0;
						}
						else
							throw Sprintf.format("Unknown operation type (%d)", [op]);
						
						var vclass = VertexType.getType(tr, tl, br, bl);
						switch (vclass)
						{
							case VertexType.EMN:
								e0.outp[C.ABOVE] = out_poly.add_local_min(ix, iy);
								e1.outp[C.ABOVE] = e0.outp[C.ABOVE];
							case VertexType.ERI:
								if (p != null)
								{
									p.add_right(ix, iy);
									e1.outp[C.ABOVE] = p;
									e0.outp[C.ABOVE] = null;
								}
							case VertexType.ELI:
								if (q != null)
								{
									q.add_left(ix, iy);
									e0.outp[C.ABOVE] = q;
									e1.outp[C.ABOVE] = null;
								}
							case VertexType.EMX:
								if ((p != null) && (q != null))
								{
									p.add_left(ix, iy);
									out_poly.merge_right(p, q);
									e0.outp[C.ABOVE] = null;
									e1.outp[C.ABOVE] = null;
								}
							case VertexType.IMN:
								e0.outp[C.ABOVE] = out_poly.add_local_min(ix, iy);
								e1.outp[C.ABOVE] = e0.outp[C.ABOVE];
							case VertexType.ILI:
								if (p != null)
								{
									p.add_left(ix, iy);
									e1.outp[C.ABOVE] = p;
									e0.outp[C.ABOVE] = null;
								}
							case VertexType.IRI:
								if (q != null)
								{
									q.add_right(ix, iy);
									e0.outp[C.ABOVE] = q;
									e1.outp[C.ABOVE] = null;
								}
							case VertexType.IMX:
								if ((p != null) && (q != null))
								{
									p.add_right(ix, iy);
									out_poly.merge_left(p, q);
									e0.outp[C.ABOVE] = null;
									e1.outp[C.ABOVE] = null;
								}
							case VertexType.IMM:
								if ((p != null) && (q != null))
								{
									p.add_right(ix, iy);
									out_poly.merge_left(p, q);
									e0.outp[C.ABOVE] = out_poly.add_local_min(ix, iy);
									e1.outp[C.ABOVE] = e0.outp[C.ABOVE];
								}
							case VertexType.EMM:
								if ((p != null) && (q != null))
								{
									p.add_left(ix, iy);
									out_poly.merge_right(p, q);
									e0.outp[C.ABOVE] = out_poly.add_local_min(ix, iy);
									e1.outp[C.ABOVE] = e0.outp[C.ABOVE];
								}
							default:
						}
					}
					
					if (e0.bundleGet(C.ABOVE, C.CLIP) != 0)
						e1.bside.set(C.CLIP, (e1.bside.get(C.CLIP) == 0) ? 1 : 0);
					if (e1.bundleGet(C.ABOVE, C.CLIP) != 0)
						e0.bside.set(C.CLIP, (e0.bside.get(C.CLIP) == 0) ? 1 : 0);
					if (e0.bundleGet(C.ABOVE, C.SUBJ) != 0)
						e1.bside.set(C.SUBJ, (e1.bside.get(C.SUBJ) == 0) ? 1 : 0);
					if (e1.bundleGet(C.ABOVE, C.SUBJ) != 0)
						e0.bside.set(C.SUBJ, (e0.bside.get(C.SUBJ) == 0) ? 1 : 0);
					
					var prev_edge = e0.prev;
					var next_edge = e1.next;
					if (next_edge != null)
						next_edge.prev = e0;
					
					if (e0.bstate.get(C.ABOVE) == BundleState.BUNDLE_HEAD)
					{
						var search = true;
						while (search)
						{
							prev_edge= prev_edge.prev;
							if (prev_edge != null)
							{
								if (prev_edge.bstate.get(C.ABOVE) != BundleState.BUNDLE_TAIL)
									search = false;
							}
							else
								search = false;
						}
					}
					if (prev_edge == null)
					{
						aet.top_node.prev = e1;
						e1.next           = aet.top_node;
						aet.top_node      = e0.next;
					}
					else
					{
						prev_edge.next.prev = e1;
						e1.next             = prev_edge.next;
						prev_edge.next      = e0.next;
					}
					e0.next.prev = prev_edge;
					e1.next.prev = e1;
					e0.next      = next_edge;
					
					intersect = intersect.next;
				}
				
				var edge = aet.top_node;
				while (edge != null)
				{
					var next_edge = edge.next;
					var succ_edge = edge.succ;
					if ((edge.top.y == yt) && (succ_edge != null))
					{
						succ_edge.outp[C.BELOW] = edge.outp[C.ABOVE];
						succ_edge.bstate.set(C.BELOW, edge.bstate.get(C.ABOVE));
						succ_edge.bundleSet(C.BELOW, C.CLIP, edge.bundleGet(C.ABOVE, C.CLIP));
						succ_edge.bundleSet(C.BELOW, C.SUBJ, edge.bundleGet(C.ABOVE, C.SUBJ));
						var prev_edge = edge.prev;
						if (prev_edge != null)
							prev_edge.next = succ_edge;
						else
							aet.top_node = succ_edge;
						if (next_edge != null)
							next_edge.prev= succ_edge;
						succ_edge.prev = prev_edge;
						succ_edge.next = next_edge;
					}
					else
					{
						edge.outp[C.BELOW] = edge.outp[C.ABOVE];
						edge.bstate.set(C.BELOW, edge.bstate.get(C.ABOVE));
						edge.bundleSet(C.BELOW, C.CLIP, edge.bundleGet(C.ABOVE, C.CLIP));
						edge.bundleSet(C.BELOW, C.SUBJ, edge.bundleGet(C.ABOVE, C.SUBJ));
						edge.xb= edge.xt;
					}
					edge.outp[C.ABOVE] = null;
					edge = edge.next;
				}
			}
		}
		
		if (_count_contours(out_poly.top_node) > 0)
		{
			if (subj == result) result.clear();
			
			if (_vertexBuffer == null) _vertexBuffer = ArrayUtil.alloc(1024);
			
			var poly = out_poly.top_node;
			while (poly != null)
			{
				var npoly = poly.next;
				if (poly.active != 0)
				{
					var i = 0;
					var vtx = poly.proxy.v[C.LEFT];
					while (vtx != null)
					{
						var nv = vtx.next;
						_vertexBuffer[i++] = vtx.x;
						_vertexBuffer[i++] = vtx.y;
						vtx = nv;
					}
					
					result.addContour(_vertexBuffer, i, poly.proxy.hole);
				}
				poly = npoly;
			}
		}
		
		return result;
	}
	
	static function _count_contours(poly:PolygonNode):Int
	{
		var nc = 0;
		var polygon = poly;
		while (polygon != null)
		{
			if (polygon.active != 0)
			{
				var nv = 0;
				var v = polygon.proxy.v[C.LEFT];
				while (v != null)
				{
					nv++;
					v = v.next;
				}
				
				if (nv > 2)
				{
					polygon.active = nv;
					nc++;
				}
				else
					polygon.active = 0;
			}
			polygon = polygon.next;
		}
		return nc;
	}
	
	static function _create_contour_bboxes(p:GPCPolygon, boxes:Array<AABB2>):Void
	{
		for (c in 0... p.numContours)
		{
			var contour = p.getContourAt(c);
			var a = boxes[c];
			a.empty();
			var i = 0;
			var k = contour.size();
			while (i < k)
			{
				var x = contour.get(i++);
				var y = contour.get(i++);
				if (x < a.minX) a.minX = x;
				if (y < a.minY) a.minY = y;
				if (x > a.maxX) a.maxX = x;
				if (y > a.maxY) a.maxY = y;
			}
		}
	}
	
	static function _minimax_test(subj:GPCPolygon, clip:GPCPolygon, op:Int):Void
	{
		if (_subjBoxes == null)
		{
			_subjBoxes = ArrayUtil.alloc(32);
			_clipBoxes = ArrayUtil.alloc(32);
			ArrayUtil.assign(_subjBoxes, AABB2);
			ArrayUtil.assign(_clipBoxes, AABB2);
		}
		else
		{
			if (_subjBoxes.length < subj.numContours)
			{
				_subjBoxes = ArrayUtil.alloc(_subjBoxes.length);
				ArrayUtil.assign(_subjBoxes, AABB2);
			}
			
			if (_clipBoxes.length < clip.numContours)
			{
				_clipBoxes = ArrayUtil.alloc(_clipBoxes.length);
				ArrayUtil.assign(_clipBoxes, AABB2);
			}
		}
		
		var s_bbox = _subjBoxes;
		var c_bbox = _clipBoxes;
		
		_create_contour_bboxes(subj, s_bbox);
		_create_contour_bboxes(clip, c_bbox);
		
		var subj_num_poly = subj.numContours;
		var clip_num_poly = clip.numContours;
		
		var S = subj_num_poly * clip_num_poly;
		
		if (_o_table == null) _o_table = new BitMemory(100 * 100);
		var table = _o_table;
		if (table.size < subj_num_poly * clip_num_poly)
			table.resize(subj_num_poly * clip_num_poly);
		
		if (_nonContributingFlags == null)
		{
			_nonContributingFlags = ArrayUtil.alloc(2);
			_nonContributingFlags[C.CLIP] = ArrayUtil.alloc(1024);
			_nonContributingFlags[C.SUBJ] = ArrayUtil.alloc(1024);
		}
		var flags = _nonContributingFlags[C.CLIP];
		for (i in 0...clip.numContours) flags[i] = false;
		var flags = _nonContributingFlags[C.SUBJ];
		for (i in 0...subj.numContours) flags[i] = false;
		
		for (s in 0...subj_num_poly)
		{
			for (c in 0...clip_num_poly)
			{
				table.ofBool(s * clip_num_poly + c,
					(!((s_bbox[s].maxX < c_bbox[c].minX) ||
						(s_bbox[s].minX > c_bbox[c].maxX))) &&
					(!((s_bbox[s].maxY < c_bbox[c].minY) ||
						(s_bbox[s].minY > c_bbox[c].maxY))));
			}
		}
		
		for (c in 0...clip_num_poly)
		{
			var overlap = false;
			
			var s = 0;
			while ((!overlap) && (s < subj_num_poly))
			{
				overlap = table.has(s * clip_num_poly + c);
				s++;
			}
			if (!overlap) _nonContributingFlags[C.CLIP][c] = true;
		}
		
		if (op == OperationType.GPC_INT)
		{
			for (s in 0...subj_num_poly)
			{
				var overlap = false;
				var c = 0;
				
				while ((!overlap) && (c < clip_num_poly))
				{
					overlap = table.has(s * clip_num_poly + c);
					c++;
				}
				if (!overlap) _nonContributingFlags[C.SUBJ][s] = true;
			}  
		}
	}
	
	static function _bound_list(lmt_table:LmtTable, y:Float):LmtNode
	{
		if (lmt_table.top_node == null)
		{
			lmt_table.top_node = LmtNode.get(y);
			return lmt_table.top_node;
		}
		else
		{
			var prev:LmtNode = null;
			var node = lmt_table.top_node;
			var done = false;
			while (!done)
			{
				if (y < node.y)
				{
					var existing_node = node;
					node = LmtNode.get(y);
					node.next = existing_node;
					if (prev == null)
						lmt_table.top_node = node;
					else
						prev.next = node;
					done = true;
				}
				else
				if (y > node.y)
				{
					if (node.next == null)
					{
						node.next = LmtNode.get(y);
						node = node.next;
						done = true;
					}
					else
					{
						prev = node;
						node = node.next;
					}
				}
				else
					done = true;
			}
			return node;
		}
	}
	
	static function _insert_bound(lmt_node:LmtNode, e:EdgeNode):Void
	{
		if (lmt_node.first_bound == null)
			lmt_node.first_bound = e;
		else
		{
			var done = false;
			var prev_bound:EdgeNode = null;
			var current_bound = lmt_node.first_bound;
			while (!done)
			{
				if (e.bot.x <  current_bound.bot.x)
				{
					if (prev_bound == null)
						lmt_node.first_bound = e;
					else
						prev_bound.next_bound = e;
					e.next_bound = current_bound;
					done = true;
				}
				else
				if (e.bot.x == current_bound.bot.x)
				{
					if (e.dx < current_bound.dx)
					{
						if (prev_bound == null)
							lmt_node.first_bound = e;
						else
							prev_bound.next_bound = e;
						e.next_bound = current_bound;
						done = true;
					}
					else
					{
						if (current_bound.next_bound == null)
						{
							current_bound.next_bound = e;
							done = true;
						}
						else
						{
							prev_bound = current_bound;
							current_bound = current_bound.next_bound;
						}
					}
				}
				else
				{
					if (current_bound.next_bound == null)
					{
						current_bound.next_bound = e;
						done = true;
					}
					else
					{
						prev_bound = current_bound;
						current_bound = current_bound.next_bound;
					}
				}
			}
		}
	}
	
	static function _add_edge_to_aet(aet:AetTree, edge:EdgeNode):Void
	{
		if (aet.top_node == null)
		{
			aet.top_node = edge;
			edge.prev    = null;
			edge.next    = null;
		}
		else
		{
			var current_edge = aet.top_node;
			var prev:EdgeNode = null;
			var done = false;
			while (!done)
			{
				if (edge.xb < current_edge.xb)
				{
					edge.prev         = prev;
					edge.next         = current_edge;
					current_edge.prev = edge;
					if (prev == null)
						aet.top_node = edge;
					else
						prev.next = edge;
					done = true;
				}
				else
				if (edge.xb == current_edge.xb)
				{
					if (edge.dx < current_edge.dx)
					{
						edge.prev         = prev;
						edge.next         = current_edge;
						current_edge.prev = edge;
						if (prev == null)
							aet.top_node = edge;
						else
							prev.next = edge;
						done = true;
					}
					else
					{
						prev = current_edge;
						if (current_edge.next == null)
						{
							current_edge.next = edge;
							edge.prev = current_edge;
							edge.next = null;
							done = true;
						}
						else
							current_edge = current_edge.next;
					}
				}
				else
				{
					prev = current_edge;
					if (current_edge.next == null)
					{
						current_edge.next = edge;
						edge.prev = current_edge;
						edge.next = null;
						done = true;
					}
					else
						current_edge = current_edge.next;
				}
			}
		}
	}
	
	static function _add_to_sbtree(sbte:ScanBeamTreeEntries, y:Float):Void
	{
		if (sbte.sb_tree == null)
		{
			sbte.sb_tree = ScanBeamTree.get(y);
			sbte.sbt_entries++;
			return;
		}
		
		var tree_node = sbte.sb_tree;
		var done = false;
		while (!done)
		{
			if (tree_node.y > y)
			{
				if (tree_node.less == null)
				{
					tree_node.less = ScanBeamTree.get(y);
					sbte.sbt_entries++;
					done = true;
				}
				else
					tree_node = tree_node.less;
			}
			else
			if (tree_node.y < y)
			{
				if (tree_node.more == null)
				{
					tree_node.more = ScanBeamTree.get(y);
					sbte.sbt_entries++;
					done = true;
				}
				else
					tree_node = tree_node.more;
			}
			else
				done = true;
		}
	}
	
	static function _build_lmt(lmt_table:LmtTable,  sbte:ScanBeamTreeEntries, p:GPCPolygon, type:Int, op:Int):EdgeTable
	{
		var edge_table = EdgeTable.get();
		
		for (c in 0...p.numContours)
		{
			if (_nonContributingFlags != null && _nonContributingFlags[type][c])
				continue;
			
			var contour = p.getContourAt(c);
			
			var num_vertices = 0;
			var e_index      = 0;
			edge_table       = EdgeTable.get();
			
			var i = 0;
			var k = contour.size();
			while (i < k)
			{
				if (OPTIMAL(contour, i))
				{
					var x = contour.get(i + 0);
					var y = contour.get(i + 1);
					edge_table.addNode(x, y);
					_add_to_sbtree(sbte, y);
					num_vertices++;
				}
				
				i += 2;
			}
			
			for (min in 0...num_vertices)
			{
				if (edge_table.FWD_MIN(min))
				{
					var num_edges = 1;
					var max       = Index.NEXT_INDEX(min, num_vertices);
					while (edge_table.NOT_FMAX(max))
					{
						num_edges++;
						max = Index.NEXT_INDEX(max, num_vertices);
					}
					
					var v = min;
					var e = edge_table.getNode(e_index);
					e.bstate.set(C.BELOW, BundleState.UNBUNDLED);
					e.bundleSet(C.BELOW, C.CLIP, 0);
					e.bundleSet(C.BELOW, C.SUBJ, 0);
					
					for (i in 0...num_edges)
					{
						var ei           = edge_table.getNode(e_index + i);
						var ev           = edge_table.getNode(v);
						ei.xb            = ev.vertex.x;
						ei.bot.x         = ev.vertex.x;
						ei.bot.y         = ev.vertex.y;
						v                = Index.NEXT_INDEX(v, num_vertices);
						ev               = edge_table.getNode(v);
						ei.top.x         = ev.vertex.x;
						ei.top.y         = ev.vertex.y;
						ei.dx            = (ev.vertex.x - ei.bot.x) / (ei.top.y - ei.bot.y);
						ei.type          = type;
						ei.outp[C.ABOVE] = null;
						ei.outp[C.BELOW] = null;
						ei.next          = null;
						ei.prev          = null;
						ei.succ          = ((num_edges > 1) && (i < (num_edges - 1))) ? edge_table.getNode(e_index + i + 1) : null;
						ei.pred          = ((num_edges > 1) && (i > 0)) ? edge_table.getNode(e_index + i - 1) : null;
						ei.next_bound    = null;
						ei.bside.set(C.CLIP, (op == OperationType.GPC_DIFF) ? C.RIGHT : C.LEFT);
						ei.bside.set(C.SUBJ, C.LEFT);
					}
					_insert_bound(_bound_list(lmt_table, edge_table.getNode(min).vertex.y), e);
					e_index += num_edges;
				}
			}
			
			for (min in 0...num_vertices)
			{
				if (edge_table.REV_MIN(min))
				{
					var num_edges = 1;
					var max = Index.PREV_INDEX(min, num_vertices);
					while (edge_table.NOT_RMAX(max))
					{
						num_edges++;
						max = Index.PREV_INDEX(max, num_vertices);
					}
					
					var v = min;
					var e = edge_table.getNode(e_index);
					e.bstate.set(C.BELOW, BundleState.UNBUNDLED);
					e.bundleSet(C.BELOW, C.CLIP, 0);
					e.bundleSet(C.BELOW, C.SUBJ, 0);
					
					for (i in 0...num_edges)
					{
						var ei           = edge_table.getNode(e_index+i);
						var ev           = edge_table.getNode(v);
						ei.xb	         = ev.vertex.x;
						ei.bot.x         = ev.vertex.x;
						ei.bot.y         = ev.vertex.y;
						v                = Index.PREV_INDEX(v, num_vertices);
						ev               = edge_table.getNode(v);
						ei.top.x         = ev.vertex.x;
						ei.top.y         = ev.vertex.y;
						ei.dx            = (ev.vertex.x - ei.bot.x) / (ei.top.y - ei.bot.y);
						ei.type          = type;
						ei.outp[C.ABOVE] = null;
						ei.outp[C.BELOW] = null;
						ei.next          = null;
						ei.prev          = null;
						ei.succ          = ((num_edges > 1) && (i < (num_edges - 1))) ? edge_table.getNode(e_index + i + 1) : null;
						ei.pred          = ((num_edges > 1) && (i > 0)) ? edge_table.getNode(e_index + i - 1) : null;
						ei.next_bound    = null;
						ei.bside.set(C.CLIP, (op == OperationType.GPC_DIFF) ? C.RIGHT : C.LEFT);
						ei.bside.set(C.SUBJ, C.LEFT);
					}
					_insert_bound(_bound_list(lmt_table, edge_table.getNode(min).vertex.y), e);
					e_index += num_edges;
				}
			}
		}
		return edge_table;
	}
	
	static function _add_st_edge(st:StNode, it:ItNodeTable, edge:EdgeNode, dy:Float):StNode
	{
		if (st == null)
			st = StNode.get(edge, null);
		else
		{
			var den = (st.xt - st.xb) - (edge.xt - edge.xb);
			if ((edge.xt >= st.xt) || (edge.dx == st.dx) || (Math.abs(den) <= C.GPC_EPSILON))
			{
				var existing_node = st;
				st = StNode.get(edge, existing_node);
			}
			else
			{
				var r = (edge.xb - st.xb) / den;
				var x = st.xb + r * (st.xt - st.xb);
				var y = r * dy;
				it.top_node = _add_intersection(it.top_node, st.edge, edge, x, y);
				st.prev = _add_st_edge(st.prev, it, edge, dy);
			}
		}
		return st;
	}
	
	static function _add_intersection(it_node:ItNode, edge0:EdgeNode, edge1:EdgeNode, x:Float, y:Float):ItNode
	{
		if (it_node == null)
			it_node = ItNode.get(edge0, edge1, x, y, null);
		else
		{
			if (it_node.point.y > y)
			{
				var existing_node = it_node;
				it_node = ItNode.get(edge0, edge1, x, y, existing_node);
			}
			else
				it_node.next = _add_intersection(it_node.next, edge0, edge1, x, y);
		}
		return it_node;
	}
}

private class Index
{
	inline public static function PREV_INDEX(i:Int, n:Int):Int { return ((i - 1) == -1) ? (n - 1) : (i - 1); }
	inline public static function NEXT_INDEX(i:Int, n:Int):Int { return ((i + 1) ==  n) ?       0 : (i + 1); }
}

private class C
{
	inline public static var GPC_EPSILON = 2.2204460492503131e-016;
	inline public static var LEFT        = 0;
	inline public static var RIGHT       = 1;
	inline public static var ABOVE       = 0;
	inline public static var BELOW       = 1;
	inline public static var CLIP        = 0;
	inline public static var SUBJ        = 1;
}

private class OperationType
{
	inline public static var GPC_DIFF   = 0;
	inline public static var GPC_INT    = 1;
	inline public static var GPC_XOR    = 2;
	inline public static var GPC_UNION  = 3;
}

private class BundleState
{
	inline public static var UNBUNDLED   = 1;
	inline public static var BUNDLE_HEAD = 2;
	inline public static var BUNDLE_TAIL = 3;
}

private class ItNode
{
	static var _pool:DynamicObjectPool<ItNode> = null;
	
	public static function Free():Void
	{
		getCache().free();
		_pool = null;
	}
	
	inline public static function getCache():DynamicObjectPool<ItNode>
	{
		if (_pool == null)
			_pool = new DynamicObjectPool<ItNode>(ItNode);
		return _pool;
	}
	
	inline public static function get(edge0:EdgeNode, edge1:EdgeNode, x:Float, y:Float, next:ItNode):ItNode
	{
		var o = _pool.get();
		o.init(edge0, edge1, x, y, next);
		return o;
	}
	
	public var ie:Array<EdgeNode>;
	public var point:Vec2;
	public var next:ItNode;

	public function new()
	{
		ie    = ArrayUtil.alloc(2);
		point = new Vec2();
	}
	
	public function init(edge0:EdgeNode, edge1:EdgeNode, x:Float, y:Float, next:ItNode):ItNode
	{
		ie[0]     = edge0;
		ie[1]     = edge1;
		point.x   = x;
		point.y   = y;
		this.next = next;
		return this;
	}
}

private class ItNodeTable
{
	static var _pool:DynamicObjectPool<ItNodeTable> = null;
	
	public static function Free():Void
	{
		getCache().free();
		_pool = null;
	}
	
	inline public static function getCache():DynamicObjectPool<ItNodeTable>
	{
		if (_pool == null)
			_pool = new DynamicObjectPool<ItNodeTable>(ItNodeTable);
		return _pool;
	}
	
	inline public static function get():ItNodeTable
	{
		var o = _pool.get();
		o.init();
		return o;
	}
	
	public var top_node:ItNode;

	public function new()
	{
		init();
	}
	
	inline public function init():Void
	{
		top_node = null;
	}
	
	public function build_intersection_table(aet:AetTree, dy:Float):Void
	{
		var st:StNode = null;
		var edge      = aet.top_node;
		while (edge != null)
		{
			if ((edge.bstate.get(C.ABOVE) == BundleState.BUNDLE_HEAD) ||
				(edge.bundleGet(C.ABOVE, C.CLIP) != 0) ||
				(edge.bundleGet(C.ABOVE, C.SUBJ) != 0))
			{
				st = untyped GPC._add_st_edge(st, this, edge, dy);
			}
			edge = edge.next;
		}
	}
}

private class LmtNode
{
	static var _pool:DynamicObjectPool<LmtNode> = null;
	
	public static function Free():Void
	{
		getCache().free();
		_pool = null;
	}
	
	inline public static function getCache():DynamicObjectPool<LmtNode>
	{
		if (_pool == null)
			_pool = new DynamicObjectPool<LmtNode>(LmtNode);
		return _pool;
	}
	
	inline public static function get(yvalue:Float):LmtNode
	{
		var o = _pool.get();
		o.init(yvalue);
		return o;
	}
	
	public var y:Float;
	public var first_bound:EdgeNode;
	public var next:LmtNode;

	public function new() {}
	
	inline public function init(yvalue:Float):Void
	{
		y           = yvalue;
		first_bound = null;
		next        = null;
	}
}

private class LmtTable
{
	public static var instance:LmtTable;
	
	public var top_node:LmtNode;
	
	public function new()
	{
		init();
	}
	
	public function init()
	{
		top_node = null;
	}
}

private class AetTree
{
	public static var instance:AetTree;
	
	public var top_node:EdgeNode;
	
	public function new()
	{
		init();
	}
	
	public function init()
	{
		top_node = null;
	}
}

private class EdgeNode
{
	static var _pool:DynamicObjectPool<EdgeNode> = null;
	
	public static function Free():Void
	{
		for (o in getCache()) o.free();
		getCache().free();
		_pool = null;
	}
	
	inline public static function getCache():DynamicObjectPool<EdgeNode>
	{
		if (_pool == null)
			_pool = new DynamicObjectPool<EdgeNode>(EdgeNode);
		return _pool;
	}
	
	inline public static function get():EdgeNode
	{
		var o = _pool.get();
		o.init();
		return o;
	}
	
	public var vertex:Vec2;
	public var bot:Vec2;
	public var top:Vec2;
	public var xb:Float;
	public var xt:Float;
	public var dx:Float;
	public var type:Int;
	public var bundle:IntMemory;
	public var bside:IntMemory;
	public var bstate:IntMemory;
	public var outp:Array<PolygonNode>;
	public var prev:EdgeNode;
	public var next:EdgeNode;
	public var pred:EdgeNode;
	public var succ:EdgeNode;
	public var next_bound:EdgeNode;
	
	public function new()
	{
		vertex = new Vec2();
		bot    = new Vec2();
		top    = new Vec2();
		bundle = new IntMemory(2 * 2);
		bside  = new IntMemory(2);
		bstate = new IntMemory(2);
		outp   = ArrayUtil.alloc(2);
		
		init();
	}
	
	public function free():Void
	{
		bundle.free();
		bside.free();
		bstate.free();
		
		bundle = null;
		bside  = null;
		bstate = null;
		outp   = null;
	}
	
	public function init()
	{
		bundle.fill(0);
		bside.fill(0);
		bstate.fill(0);
		
		vertex.x                 = 0;
		vertex.y                 = 0;
		bot.x                    = 0;
		bot.y                    = 0;
		top.x                    = 0;
		top.y                    = 0;
		xb                       = Mathematics.NaN;
		xt                       = Mathematics.NaN;
		dx                       = Mathematics.NaN;
		type                     = 0;
		for (i in 0...2) outp[i] = null;
		prev                     = null;
		next                     = null;
		pred                     = null;
		succ                     = null;
		next_bound               = null;
	}
	
	inline public function bundleGet(y:Int, x:Int):Int
	{
		return bundle.get((y << 1) + x);
	}
	
	inline public function bundleSet(y:Int, x:Int, v:Int):Void
	{
		bundle.set((y << 1) + x, v);
	}
	
	inline public function bundleXOR(y:Int, x:Int, v:Int):Void
	{
		var i = (y << 1) + x;
		bundle.set(i, bundle.get(i) ^ v);
	}
}

private class EdgeTable
{
	static var _pool:DynamicObjectPool<EdgeTable> = null;
	
	public static function Free():Void
	{
		getCache().free();
		_pool = null;
	}
	
	inline public static function getCache():DynamicObjectPool<EdgeTable>
	{
		if (_pool == null)
			_pool = new DynamicObjectPool<EdgeTable>(EdgeTable);
		return _pool;
	}
	
	inline public static function get():EdgeTable
	{
		var o = _pool.get();
		o.init();
		return o;
	}
	
	var _list:DA<EdgeNode>;
	
	public function new()
	{
		_list = new DA<EdgeNode>();
	}
	
	public function init():Void
	{
		_list.clear();
	}

	inline public function addNode(x:Float, y:Float):Void
	{
		var node      = EdgeNode.get();
		node.vertex.x = x;
		node.vertex.y = y;
		_list.pushBack(node);
	}
	
	inline public function getNode(index:Int):EdgeNode
	{
		return _list.get(index);
	}
	
	inline public function FWD_MIN(i:Int):Bool
	{
		var prev = _list.getPrev(i);
		var next = _list.getNext(i);
		var ith  = _list.get(i);
		return ((prev.vertex.y >= ith.vertex.y) && (next.vertex.y > ith.vertex.y));
	}

	inline public function NOT_FMAX(i:Int):Bool
	{
		var next = _list.get(Index.NEXT_INDEX(i, _list.size()));
		var ith  = _list.get(i);
		return(next.vertex.y > ith.vertex.y);
	}

	inline public function REV_MIN(i:Int):Bool
	{
		var prev = _list.getPrev(i);
		var next = _list.getNext(i);
		var ith  = _list.get(i);
		return ((prev.vertex.y > ith.vertex.y) && (next.vertex.y >= ith.vertex.y));
	}
	
	inline public function NOT_RMAX(i:Int):Bool
	{
		var prev = _list.getPrev(i);
		var ith  = _list.get(i);
		return (prev.vertex.y > ith.vertex.y);
	}
}

private class StNode
{
	static var _pool:DynamicObjectPool<StNode> = null;
	
	public static function Free():Void
	{
		getCache().free();
		_pool = null;
	}
	
	inline public static function getCache():DynamicObjectPool<StNode>
	{
		if (_pool == null)
			_pool = new DynamicObjectPool<StNode>(StNode);
		return _pool;
	}
	
	inline public static function get(edge:EdgeNode, prev:StNode):StNode
	{
		var o = _pool.get();
		o.init(edge, prev);
		return o;
	}
	
	public var edge:EdgeNode;
	public var xb:Float;
	public var xt:Float;
	public var dx:Float;
	public var prev:StNode;
	
	public function new()
	{
		edge = null;
		prev = null;
	}
	
	inline public function init(edge:EdgeNode, prev:StNode)
	{
		this.edge = edge;
		xb        = edge.xb;
		xt        = edge.xt;
		dx        = edge.dx;
		this.prev = prev;
	}
}

private class VertexType
{
	inline public static var NUL =  0;
	inline public static var EMX =  1;
	inline public static var ELI =  2;
	inline public static var TED =  3;
	inline public static var ERI =  4;
	inline public static var RED =  5;
	inline public static var IMM =  6;
	inline public static var IMN =  7;
	inline public static var EMN =  8;
	inline public static var EMM =  9;
	inline public static var LED = 10;
	inline public static var ILI = 11;
	inline public static var BED = 12;
	inline public static var IRI = 13;
	inline public static var IMX = 14;
	inline public static var FUL = 15;
	
	inline public static function getType(tr:Int, tl:Int, br:Int, bl:Int):Int
	{
		return tr + (tl << 1) + (br << 2) + (bl << 3);
	}
}

private class VertexNode
{
	static var _pool:DynamicObjectPool<VertexNode> = null;
	
	public static function Free():Void
	{
		getCache().free();
		_pool = null;
	}
	
	inline public static function getCache():DynamicObjectPool<VertexNode>
	{
		if (_pool == null)
			_pool = new DynamicObjectPool<VertexNode>(VertexNode);
		return _pool;
	}
	
	inline public static function get(x:Float, y:Float):VertexNode
	{
		var o = _pool.get();
		o.init(x, y);
		return o;
	}
	
	public var x:Float;
	public var y:Float;
	public var next:VertexNode;
	
	public function new()
	{
		init(0, 0);
	}
	
	inline public function init(x:Float, y:Float)
	{
		this.x    = x;
		this.y    = y;
		this.next = null;
	}
}

private class PolygonNode
{
	static var _pool:DynamicObjectPool<PolygonNode> = null;
	
	public static function Free():Void
	{
		getCache().free();
		_pool = null;
	}
	
	inline public static function getCache():DynamicObjectPool<PolygonNode>
	{
		if (_pool == null)
			_pool = new DynamicObjectPool<PolygonNode>(PolygonNode);
		return _pool;
	}
	
	inline public static function get(next:PolygonNode, x:Float, y:Float):PolygonNode
	{
		var o = _pool.get();
		o.init(next, x, y);
		return o;
	}
	
	public var active:Int;
	public var hole:Bool;
	public var v:Array<VertexNode>;
	public var next:PolygonNode;
	public var proxy:PolygonNode;
	
	public function new()
	{
		v = ArrayUtil.alloc(2);
	}
	
	inline public function init(next:PolygonNode, x:Float, y:Float)
	{
		var vn      = VertexNode.get(x, y);
		v[C.LEFT ]  = vn;
		v[C.RIGHT]  = vn;
		this.next   = next;
		this.proxy  = this;
		this.active = 1;
	}
	
	inline public function add_right(x:Float, y:Float):Void
	{
		var nv                = VertexNode.get(x, y);
		proxy.v[C.RIGHT].next = nv;
		proxy.v[C.RIGHT]      = nv;
	}
	
	inline public function add_left(x:Float, y:Float):Void
	{
		var nv          = VertexNode.get(x, y);
		nv.next         = proxy.v[C.LEFT];
		proxy.v[C.LEFT] = nv;
	}
}

private class TopPolygonNode
{
	public static var instance:TopPolygonNode;
	
	public var top_node:PolygonNode;
	
	public function new()
	{
		init();
	}
	
	public function init():Void
	{
		top_node = null;
	}
	
	inline public function add_local_min(x:Float, y:Float):PolygonNode
	{
		var existing_min = top_node;
		top_node = PolygonNode.get(existing_min, x, y);
		return top_node;
	}
	
	inline public function merge_left(p:PolygonNode, q:PolygonNode):Void
	{
		q.proxy.hole = true;
		if (p.proxy != q.proxy)
		{
			p.proxy.v[C.RIGHT].next = q.proxy.v[C.LEFT];
			q.proxy.v[C.LEFT]       = p.proxy.v[C.LEFT];
			var target = p.proxy;
			var node = top_node;
			while (node != null)
			{
				if (node.proxy == target)
				{
					node.active = 0;
					node.proxy  = q.proxy;
				}
				node = node.next;
			}
		}
	}

	inline public function merge_right(p:PolygonNode, q:PolygonNode):Void
	{
		q.proxy.hole = false;
		if (p.proxy != q.proxy)
		{
			q.proxy.v[C.RIGHT].next = p.proxy.v[C.LEFT];
			q.proxy.v[C.RIGHT]      = p.proxy.v[C.RIGHT];
			var target = p.proxy;
			var node = top_node;
			while (node != null)
			{
				if (node.proxy == target)
				{
					node.active = 0;
					node.proxy = q.proxy;
				}
				node = node.next;
			}
		}
	}
}

private class ScanBeamTree
{
	static var _pool:DynamicObjectPool<ScanBeamTree> = null;
	
	public static function Free():Void
	{
		getCache().free();
		_pool = null;
	}
	
	inline public static function getCache():DynamicObjectPool<ScanBeamTree>
	{
		if (_pool == null)
			_pool = new DynamicObjectPool<ScanBeamTree>(ScanBeamTree);
		return _pool;
	}
	
	inline public static function get(yvalue:Float):ScanBeamTree
	{
		var o = _pool.get();
		o.init(yvalue);
		return o;
	}
	
	public var y:Float;
	public var less:ScanBeamTree;
	public var more:ScanBeamTree;
	
	public function new() {}
	
	inline public function init(yvalue:Float):Void
	{
		y    = yvalue;
		less = null;
		more = null;
	}
}

private class ScanBeamTreeEntries
{
	public static var instance:ScanBeamTreeEntries;
	
	public var sbt:DoubleMemory;
	public var sbt_entries:Int;
	public var sb_tree:ScanBeamTree;
	
	public function new()
	{
		sbt = new DoubleMemory(1024);
		init();
	}
	
	public function free():Void
	{
		sbt.free();
		sbt     = null;
		sb_tree = null;
	}
	
	public function init()
	{
		sbt_entries = 0;
		sb_tree     = null;
	}
	
	public function build_sbt():Int
	{
		if (sbt.size < sbt_entries)
			sbt.resize(sbt_entries << 1);
		
		var entries = 0;
		return _inner_build_sbt(entries, sbt, sb_tree);
	}
	
	function _inner_build_sbt(entries:Int, sbt:DoubleMemory, sbt_node:ScanBeamTree)
	{
		if (sbt_node.less != null)
			entries = _inner_build_sbt(entries, sbt, sbt_node.less);
		sbt.set(entries, sbt_node.y);
		entries++;
		if (sbt_node.more != null)
			entries = _inner_build_sbt(entries, sbt, sbt_node.more);
		return entries;
	}
}

private class HState
{
	inline public static var NH = 0;
	inline public static var BH = 1;
	inline public static var TH = 2;
	
	static var NEXT_H_STATE_TABLE =
	[
		BH, TH, TH, BH, NH, NH,
		NH, NH, NH, NH, TH, TH,
		NH, NH, NH, NH, BH, BH
	];
	
	var _state:IntMemory;
	
	public function new()
	{
		_state = IntMemory.ofArray(NEXT_H_STATE_TABLE);
	}
	
	public function free():Void
	{
		_state.free();
	}

	inline public function get(x:Int, y:Int):Int
	{
		return _state.get(y * 6 + x);
	}
}