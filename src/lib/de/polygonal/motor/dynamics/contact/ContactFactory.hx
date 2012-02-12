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

import de.polygonal.ds.Array2;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.collision.shape.ShapeType;
import de.polygonal.motor.dynamics.contact.generator.BoxCircleContact;
import de.polygonal.motor.dynamics.contact.generator.BoxContact;
import de.polygonal.motor.dynamics.contact.generator.BoxPolyContact;
import de.polygonal.motor.dynamics.contact.generator.CircleContact;
import de.polygonal.motor.dynamics.contact.generator.EdgeBoxContact;
import de.polygonal.motor.dynamics.contact.generator.EdgeCircleContact;
import de.polygonal.motor.dynamics.contact.generator.EdgePolyContact;
import de.polygonal.motor.dynamics.contact.generator.PolyCircleContact;
import de.polygonal.motor.dynamics.contact.generator.PolyContact;
import de.polygonal.motor.Settings;

class ContactFactory
{
	var _contactMatrix:Array2<ContactRegister>;
	var _pool:ContactPool;
	var _settings:Settings;
	
	public function new(settings:Settings)
	{
		_settings = settings;
		
		_pool = new ContactPool(settings);
		
		for (C in
		[
			CircleContact,
			BoxContact,
			BoxPolyContact,
			PolyContact,
			PolyCircleContact
		])
		{ _pool.registerContactPool(C, settings.contactPoolSize); }
		
		_initializeContactMatrix();
	}
	
	public function free():Void
	{
		for (register in _contactMatrix) register.free();
		_contactMatrix.free();
		_pool.free();
		
		_contactMatrix = null;
		_pool          = null;
	}
	
	public function create(shape1:AbstractShape, shape2:AbstractShape):Contact
	{
		var register = _contactMatrix.get(shape1.type, shape2.type);
		
		var contact;
		
		//null contact?
		if (register.construct == null)
			return null;
		
		if (register.pool == null)
		{
			//no pool defined; create instance
			if (register.primary)
				contact = Type.createInstance(register.construct, [_settings]);
			else
				contact = Type.createInstance(register.construct, [_settings]);
		}
		else
		{
			//get object from pool
			var pool = register.pool;
			
			if (pool.isEmpty())
			{
				//pool exhausted; create instance
				if (register.primary)
					contact = Type.createInstance(register.construct, [_settings]);
				else
					contact = Type.createInstance(register.construct, [_settings]);
			}
			else
			{
				var poolId = pool.next();
				contact = pool.get(poolId);
				contact.poolId = poolId;
			}
		}
		
		if (register.primary)
			contact.init(shape1, shape2);
		else
			contact.init(shape2, shape1);
		
		return contact;
	}

	public function destroy(contact:Contact):Void
	{
		var poolId = contact.poolId;
		if (poolId != Contact.NO_POOL)
		{
			//recycle contact
			var pool = _contactMatrix.get(contact.shape1.type, contact.shape2.type).pool;
			pool.put(poolId);
			contact.reset();
		}
		else
		{
			//destroy contact
			contact.free();
		}
	}
	
	function _initializeContactMatrix():Void
	{
		_contactMatrix = new Array2<ContactRegister>(5, 5);
		_contactMatrix.assign(ContactRegister);
		
		_registerContactHandler(CircleContact    , ShapeType.CIRCLE, ShapeType.CIRCLE);
		_registerContactHandler(BoxContact       , ShapeType.BOX   , ShapeType.BOX);
		_registerContactHandler(BoxCircleContact , ShapeType.BOX   , ShapeType.CIRCLE);
		_registerContactHandler(BoxPolyContact   , ShapeType.BOX   , ShapeType.POLY);
		_registerContactHandler(PolyContact      , ShapeType.POLY  , ShapeType.POLY);
		_registerContactHandler(PolyCircleContact, ShapeType.POLY  , ShapeType.CIRCLE);
		_registerContactHandler(EdgeCircleContact, ShapeType.EDGE  , ShapeType.CIRCLE);
		_registerContactHandler(EdgeBoxContact   , ShapeType.EDGE  , ShapeType.BOX);
		_registerContactHandler(EdgePolyContact  , ShapeType.EDGE  , ShapeType.POLY);
	}

	function _registerContactHandler(C:Class<Contact>, type1:Int, type2:Int):Void
	{
		_contactMatrix.get(type1, type2).construct = C;
		_contactMatrix.get(type1, type2).pool = _pool.get(C);
		_contactMatrix.get(type1, type2).primary = true;
		
		if (type1 != type2)
		{
			_contactMatrix.get(type2, type1).construct = C;
			_contactMatrix.get(type2, type1).pool = _pool.get(C);
			_contactMatrix.get(type2, type1).primary = false;
		}
	}
}

import de.polygonal.ds.pooling.ObjectPool;

private class ContactRegister
{
	public var construct:Class<Dynamic>;
	public var pool:ObjectPool<Contact>;
	public var primary:Bool;
	
	public function new() {}
	
	public function free():Void
	{
		construct = null;
		pool      = null;
	}
}

private class ContactPool
{
	var _poolHash:Hash<ObjectPool<Contact>>;
	var _args:Array<Dynamic>;
	
	public function new(settings:Settings)
	{
		_poolHash = new Hash<ObjectPool<Contact>>();
		_args     = [settings];
	}
	
	public function free():Void
	{
		for (pool in _poolHash)
		{
			for (contact in pool) contact.free();
			pool.free();
		}
		
		_poolHash = null;
		_args = null;
	}
	
	public function get(C:Class<Contact>):ObjectPool<Contact>
	{
		var key = Type.getClassName(C);
		if (_poolHash.exists(key))
			return _poolHash.get(key);
		else
			return null;
	}
	
	public function registerContactPool(C:Class<Contact>, size:Int)
	{
		if (size == 0) return;
		
		var p = new ObjectPool<Contact>(size);
		p.allocate(_args[0].lazyPooling, null, function() return Type.createInstance(C, _args), null);
		_poolHash.set(Type.getClassName(C), p);
	}
}