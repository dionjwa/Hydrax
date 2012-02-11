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
package de.polygonal.motor.dynamics.contact;

import de.polygonal.core.math.Limits;
import de.polygonal.ds.Bits;
import de.polygonal.ds.DLLNode;
import de.polygonal.motor.collision.pairwise.Collider;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.dynamics.RigidBody;
import de.polygonal.motor.Settings;

using de.polygonal.ds.BitFlags;

class Contact
{
	inline public static var FLAG_GHOST  = Bits.BIT_01;
	inline public static var FLAG_SLOW   = Bits.BIT_02;
	inline public static var FLAG_ISLAND = Bits.BIT_03;
	inline public static var FLAG_TOI    = Bits.BIT_04;
	
	inline public static var NO_POOL     = Limits.INT16_MIN;
	
	public var next:Contact;
	
	var _bits:Int;
	
	
	public var listNode:DLLNode<Contact>;

	public var edge1:ContactEdge;
	public var edge2:ContactEdge;
	
	public var body1:RigidBody;
	public var body2:RigidBody;
	
	public var shape1:AbstractShape;
	public var shape2:AbstractShape;
	
	public var collider:Collider;
	public var manifold:Manifold;
	public var manifoldCount:Int;
	
	public var poolId:Int;
	public var toi:Float;
	
	var _settings:Settings;
	
	public function new(settings:Settings)
	{
		_settings = settings;
		
		manifold = new Manifold();
		
		edge1 = new ContactEdge();
		edge2 = new ContactEdge();
		poolId = NO_POOL;
	}
	
	public function init(shape1:AbstractShape, shape2:AbstractShape):Void
	{
		this.shape1 = shape1;
		this.shape2 = shape2;
		
		body1 = shape1.body;
		body2 = shape2.body;
		
		collider = _getCollider();
		collider.init(shape1, shape2);
		
		_bits = 0;
		manifold.pointCount = 0;
		manifoldCount = 0;
	}
	
	public function reset():Void
	{
		poolId = Contact.NO_POOL;
		body1 = body2 = null;
		shape1 = shape2 = null;
		collider = null;
	}
	
	public function free():Void
	{
		if (collider != null)
			collider.free();
		manifold.free();
		
		_settings = null;
		collider  = null;
		listNode  = null;
		edge1     = null;
		edge2     = null;
		body1     = null;
		body2     = null;
		shape1    = null;
		shape2    = null;
		manifold  = null;
	}
	
	public function evaluate():Void
	{
		//create contact manifold
		collider.collide(manifold, shape1, shape2);
		manifoldCount = manifold.pointCount > 0 ? 1 : 0;
	}
	
	/** True if contact generates a collision response. */
	inline public function isSolid():Bool
	{
		return !hasf(Contact.FLAG_GHOST);
	}
	
	inline public function iterator():Iterator<Manifold>
	{
		return new ManifoldIterator(this);
	}
	
	function _getCollider():Collider
	{
		throw "override for implementation";
		return null;
	}
}

private class ManifoldIterator
{
	var _m:Manifold;
	var _i:Int;
	var _s:Int;
	
	public function new(contact:Contact)
	{
		var k = contact.manifoldCount;
		if (k > 0)
		{
			_s = k;
			_m = contact.manifold;
		}
	}
	
	public function hasNext():Bool
	{
		return _i < _s;
	}
	
	public function next():Manifold
	{
		var t = _m;
		
		if (_i < _s)
		{
			_i++;
			_m = _m.next;
		}
		
		return t;
	}
}