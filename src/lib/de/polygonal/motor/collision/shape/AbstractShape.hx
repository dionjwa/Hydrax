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
package de.polygonal.motor.collision.shape;

import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.Vec2;
import de.polygonal.core.util.Assert;
import de.polygonal.ds.Bits;
import de.polygonal.ds.Hashable;
import de.polygonal.ds.HashKey;
import de.polygonal.motor.collision.nbody.BroadPhase;
import de.polygonal.motor.collision.nbody.Proxy;
import de.polygonal.motor.collision.shape.feature.Edge;
import de.polygonal.motor.collision.shape.feature.Vertex;
import de.polygonal.motor.data.FilterData;
import de.polygonal.motor.data.MassData;
import de.polygonal.motor.data.ShapeData;
import de.polygonal.motor.dynamics.RigidBody;
import de.polygonal.motor.geom.bsp.ConvexBSPNode;
import de.polygonal.core.math.Mat32;
import de.polygonal.motor.geom.primitive.AABB2;
import de.polygonal.motor.Settings;
import de.polygonal.motor.World;
import de.polygonal.motor.WorldEvent;

using de.polygonal.ds.BitFlags;

class AbstractShape implements Hashable
{
	inline public static var AXIS_ALIGNED        = Bits.BIT_02;
	inline public static var GHOST               = Bits.BIT_03;
	inline public static var HAS_LOCAL_TRANSFORM = Bits.BIT_04;
	inline public static var T_SYNCED            = Bits.BIT_05;
	inline public static var FEATURES_SYNCED     = Bits.BIT_06;
	inline public static var EDGE_INFINITE       = Bits.BIT_08;
	inline public static var EDGE_DOUBLE_SIDED   = Bits.BIT_09;
	inline public static var SYMMETRIC           = Bits.BIT_10;
	
	inline public static var AABB_FIT_SPHERE     = Bits.BIT_15;
	inline public static var AABB_FIT_OBB        = Bits.BIT_16;
	inline public static var AABB_FIT_POLY_HC    = Bits.BIT_17;
	inline public static var AABB_FIT_POLY_BF    = Bits.BIT_18;
	
	inline static var FREED = Bits.BIT_19;
	
	/** The x coordinate of the shape center in world space. */
	public var x(_xGetter, never):Float;
	inline function _xGetter():Float { return TWorld.tx; }
	
	/** The y coordinate of the shape center in world space. */
	public var y(_yGetter, never):Float;
	inline function _yGetter():Float { return TWorld.ty; }
	
	/** The shape rotation in world space. */
	public var r(_rGetter, never):Float;
	inline function _rGetter():Float { return TWorld.getAngle(); }
	
	public var TBody(_TBodyGetter, never):Mat32;
	inline function _TBodyGetter():Mat32 { return body.TWorld; }
	
	public var TLocal(default, null):Mat32;
	
	public var TWorld(_TWorldGetter, never):Mat32;
	inline function _TWorldGetter():Mat32
	{
		if (!hasf(AbstractShape.T_SYNCED))
		{
			setf(AbstractShape.T_SYNCED);
			Mat32.concat(TLocal, TBody, _TWorld);
		}
		return _TWorld;
	}
	
	public var body:RigidBody;
	
	public var userData:Dynamic;
	
	/** The collision filter that is used by the ContactFilter class. */
	public var filter:FilterData;
	
	/** The coefficient of friction. */
	public var friction:Float;
	
	/** The coefficient of restitution. */
	public var restitution:Float;
	
	/** The density in kg/m^2. */
	public var density:Float;
	
	/** The shape extent, x-axis (halfwidths). */
	public var ex(default, null):Float;
	/** The shape extent, y-axis (halfwidths). */
	public var ey(default, null):Float;
	
	/** The shape type. */
	public var type(default, null):Int;
	
	/** An axis-aligned bounding box that fits the shape. */
	public var aabb:AABB2;
	
	public var proxyId:Int;
	
	/** The bounding sphere radius. */
	public var radius(default, null):Float; 
	
	/** The maximum bounding sphere radius about the parent body's center of mass. */
	public var sweepRadius(default, null):Float;
	
	/** Circular doubly linked list of vertex features in world space. */
	public var worldVertexChain(default, null):Vertex;
	
	/** Circular doubly linked list of shape normals in world space. */
	public var worldNormalChain(default, null):Vertex;
	
	/** Circular doubly linked list of vertex features in local space. */
	public var localVertexChain(default, null):Vertex;
	
	/** Circular doubly linked list of shape normals in local space. */
	public var localNormalChain(default, null):Vertex;
	
	/** Cached vertices/normals for fast access. */
	public var v0(default, null):Vertex; public var n0(default, null):Vertex;
	public var v1(default, null):Vertex; public var n1(default, null):Vertex;
	public var v2(default, null):Vertex; public var n2(default, null):Vertex;
	public var v3(default, null):Vertex; public var n3(default, null):Vertex;
	
	/** Root node of the BSP tree for accelerating support point queries. */
	public var BSPNode(default, null):ConvexBSPNode<Vertex>;
	
	/** The shape vertex count. */
	public var vertexCount(default, null):Int;
	
	/**
	 * A unique identifier for this object.<br/>
	 * A hash table transforms this key into an index of an array element by
	 * using a hash function.<br/>
	 * <warn>This value should never be changed by the user.</warn>
	 */
	public var key:Int;
	
	var _bits:Int;
	var _TWorld:Mat32;
	var _settings:Settings;
	var _world:World;
	
	function new(data:ShapeData, world:World, settings:Settings)
	{
		_world      = world;
		_settings   = settings;
		userData    = data.userData;
		density     = data.density;
		friction    = data.friction;
		restitution = data.restitution;
		filter      = data.filter.clone();
		_TWorld     = new Mat32();
		TLocal      = new Mat32();
		aabb        = new AABB2();
		proxyId     = Proxy.NULL_PROXY;
		key         = HashKey.next();
		
		TLocal.setupLocalToParent(data.x, data.y, data.r);
		
		if (data.isGhost) setf(AbstractShape.GHOST);
	}
	
	/**
	 * Destroys this shape.<br/>
	 * Removes the shape from the broad-phase and therefore destroys any contacts associated with this shape.<br/>
	 * All shapes attached to a body are implicitly destroyed when the body is destroyed.
	 */
	public function free():Void
	{
		if (hasf(FREED)) return;
		setf(FREED);
		
		if (_world != null)
			_world.notify(WorldEvent.SHAPE_DESTROYED, this);
		
		if (proxyId != Proxy.NULL_PROXY)
			destroyProxy();
		
		if (body != null)
			body.shapeList.remove(this);
		
		if (vertexCount > 0)
		{
			if (localVertexChain != null)
			{
				localVertexChain.free();
				localNormalChain.free();
				worldVertexChain.free();
				worldNormalChain.free();
			}
		}
		
		if (BSPNode != null) BSPNode.free();
		
		body     = null;
		BSPNode  = null;
		userData = null;
		filter   = null;
		aabb     = null;
		TLocal   = null;
		_TWorld  = null;
		_world   = null;
		localVertexChain = null;
		localNormalChain = null;
		worldVertexChain = null;
		worldNormalChain = null;
		v0 = null;
		v1 = null;
		v2 = null;
		v3 = null;
		n0 = null;
		n1 = null;
		n2 = null;
		n3 = null;
	}
	
	public function createProxy(world:World, T:Mat32):Void
	{
		#if debug
		Assert.assert(proxyId == Proxy.NULL_PROXY, "proxyId == Proxy.NULL_PROXY");
		#end
		
		_computeAABB(aabb, T);
		
		if (world.getBroadPhase().insideBound(aabb))
			proxyId = world.getBroadPhase().createProxy(this);
		else
			proxyId = Proxy.NULL_PROXY;
	}
	
	public function destroyProxy():Void
	{
		if (proxyId != Proxy.NULL_PROXY)
		{
			body.world.getBroadPhase().removeProxy(proxyId);
			proxyId = Proxy.NULL_PROXY;
		}
	}
	
	/** Updates the shape proxy. */
	public function synchronize(broadPhase:BroadPhase, T1:Mat32, T2:Mat32):Bool
	{
		if (proxyId == Proxy.NULL_PROXY)
			return false;
		else
		{
			computeSweptAABB(aabb, T1, T2);
			if (broadPhase.insideBound(aabb))
			{
				broadPhase.updateProxy(proxyId);
				return true;
			}
			else
				return false;
		}
	}
	
	/**
	 * Destroy, then re-create the shape proxy.
	 */
	public function refreshProxy(world:World):Void
	{
		if (proxyId == Proxy.NULL_PROXY) return;
		world.getBroadPhase().removeProxy(proxyId);
		world.getBroadPhase().createProxy(this);
	}
	
	public function refilterProxy(world:World, T:Mat32):Void
	{
		if (proxyId == Proxy.NULL_PROXY) return;
		
		world.getBroadPhase().removeProxy(proxyId);
		
		_computeAABB(aabb, T);
		
		if (world.getBroadPhase().insideBound(aabb))
			proxyId = world.getBroadPhase().createProxy(this);
		else
			proxyId = Proxy.NULL_PROXY;
	}
	
	/**
	 * Computes the mass properties (C.O.M., total mass, inertia) of this shape using its dimensions
	 * and density. The inertia tensor is computed about the local origin, not the centroid.
	 */
	public function computeMass():MassData
	{
		throw "override for implementation";
		return null;
	}
	
	/** Computes a swept <i>aabb</i> for a starting shape transform <i>T1</i> and an ending shape transform (<i>T2</i>). */
	public function computeSweptAABB(aabb:AABB2, T1:Mat32, T2:Mat32):Void
	{
		_computeAABB(aabb, T1);
		
		if (T1 == T2) return;
		
		var minX = aabb.minX;
		var minY = aabb.minY;
		var maxX = aabb.maxX;
		var maxY = aabb.maxY;
		
		_computeAABB(aabb, T2);
		
		aabb.minX = Mathematics.fmin(minX, aabb.minX);
		aabb.minY = Mathematics.fmin(minY, aabb.minY);
		aabb.maxX = Mathematics.fmax(maxX, aabb.maxX);
		aabb.maxY = Mathematics.fmax(maxY, aabb.maxY);
	}
	
	/** Updates the sweep radius (maximum radius) as measured from a given local center point <i>c</i>. */
	public function updateSweepRadius(c:Vec2):Void
	{
		throw "override for implementation";
		return null;
	}
	
	/** Returns true if the point <i>p</i> (measured in world space) is contained by the shape. */
	public function containsPoint(q:Vec2):Bool
	{
		throw "override for implementation";
		return false;
	}
	
	/** Computes the closest point on the shape to the point <i>p</i> (measured in world space). */
	public function closestPoint(p:Vec2, q:Vec2):Vec2
	{
		throw "override for implementation";
		return null;
	}
	
	/** Applies a WCS transformation to the vertex and normal chain. */
	public function syncFeatures(?T:Mat32):Void
	{
		throw "override for implementation";
		return null;
	}
	
	function _computeAABB(aabb:AABB2, T:Mat32):Void
	{
		//computes an aabb for a specified coordinate space transformation T 
		throw "override for implementation";
		return null;
	}
	
	function _setupFeatures(vertexList:Array<Vec2>, ?center:Vec2):Void
	{
		//setup a circular doubly linked list for storing vertex/edge features
		if (center == null) center = new Vec2();
		
		vertexCount = vertexList.length;
		
		//initialze vertex chains
		localVertexChain = _initEmptyVertexChain(vertexCount);
		worldVertexChain = _initEmptyVertexChain(vertexCount);
		
		localNormalChain = _initEmptyVertexChain(vertexCount);
		worldNormalChain = _initEmptyVertexChain(vertexCount);
		
		var v = localVertexChain;
		for (i in 0...vertexCount)
		{
			v.x = vertexList[i].x;
			v.y = vertexList[i].y;
			v = v.next;
		}
		
		//setup a circular doubly linked list for storing edge features
		var ln = localNormalChain;
		var wn = worldNormalChain;
		var wv = worldVertexChain;
		
		var v0 = localVertexChain;
		var v1 = v0.next;
		
		var mx = center.x;
		var my = center.y;
		
		var m = Math;
		for (i in 0...vertexCount)
		{
			var ex = v1.x - v0.x;
			var ey = v1.y - v0.y;
			var norm = m.sqrt(ex * ex + ey * ey);
			ex /= norm;
			ey /= norm;
			var dir = new Vec2(ex, ey);
			
			var nx = ey;
			var ny =-ex;
			
			ln.x = nx;
			ln.y = ny;
			ln = ln.next;
			
			var midx = v0.x + (v1.x - v0.x) * .5;
			var midy = v0.y + (v1.y - v0.y) * .5;
			var height = (midx - mx) * nx + (midy - my) * ny;
			var offset = new Vec2((midx - mx) - (nx * height), (midy - my) - (ny * height));
			
			//create edges and cross-reference with local vertex chain
			var e = new Edge();
			e.a = v0;
			e.b = v0.next;
			e.dir = dir;
			e.normal = ln;
			e.extent = norm * .5;
			e.length = norm;
			e.height = height;
			e.offset = offset;
			
			v0.edge = e;
			v0 = v1;
			v1 = v0.next;
			
			//create edges and cross-reference with  world vertex chain
			e = new Edge();
			e.a = wv;
			e.b = wv.next;
			e.dir = dir;
			e.normal = wn;
			e.extent = norm * .5;
			e.length = norm;
			e.height = height;
			e.offset = offset;
			
			wv.edge = e;
			wv = wv.next;
			wn = wn.next;
		}
		
		//create doubly linked list of edges
		var v = localVertexChain;
		for (i in 0...vertexCount)
		{
			v.edge.next = v.next.edge;
			v.edge.prev = v.prev.edge;
			v = v.next;
		}
		v = worldVertexChain;
		for (i in 0...vertexCount)
		{
			v.edge.next = v.next.edge;
			v.edge.prev = v.prev.edge;
			v = v.next;
		}
	}
	
	function _initEmptyVertexChain(size:Int)
	{
		var v = new Vertex();
		var w = v;
		w.head = true;
		
		for (i in 1...size)
		{
			var v0 = w;
			var v1 = new Vertex();
			v1.i = i;
			v0.next = v1;
			v1.prev = v0;
			w = w.next;
		}
		
		w.tail = true;
		w.next = v;
		v.prev = w;
		
		return v;
	}
}