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

import de.polygonal.ds.DLL;
import de.polygonal.ds.Itr;
import de.polygonal.motor.collision.nbody.pair.PairHandler;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.dynamics.RigidBody;

using de.polygonal.ds.BitFlags;

class ContactManager implements PairHandler
{
	var _contactFactory:ContactFactory;
	var _nullContact:NullContact;
	var _contactFilter:ContactFilter;
	var _contactList:DLL<Contact>;
	var _contactListItr:Itr<Contact>;
	
	public function new(contactList:DLL<Contact>, factory:ContactFactory)
	{
		_contactList = contactList;
		_contactListItr = cast contactList.iterator();
		_contactFactory = factory;
		_nullContact = new NullContact();
	}
	
	public function free():Void
	{
		_nullContact.free();
		
		_nullContact   = null;
		_contactFilter = null;
		_contactList   = null;
	}
	
	public function setFilter(filter:ContactFilter):Void
	{
		_contactFilter = filter;
	}
	
	/**
	 * Invoked by the broad-phase when two proxies start to overlap.
	 * This creates a contact object to manage the narrow phase.
	 */
	public function pairAdded(proxyShape1:AbstractShape, proxyShape2:AbstractShape):Contact
	{
		var body1 = proxyShape1.body;
		var body2 = proxyShape2.body;
		
		if (body1.getf(RigidBody.STATIC) & body2.getf(RigidBody.STATIC) == RigidBody.STATIC) return _nullContact;
		if (body1 == body2) return _nullContact;
		if (body2.isConnected(body1)) return _nullContact;
		if (!_contactFilter.shouldCollide(proxyShape1, proxyShape2)) return _nullContact;
		
		var contact = _contactFactory.create(proxyShape1, proxyShape2);
		if (contact == null) return _nullContact;
		
		contact.listNode = _contactList.prepend(contact);
		return contact;
	}

	/**
	 * Invoked by the broad-phase when two proxies cease to overlap.
	 * This destroys the contact object.
	 */
	public function pairRemoved(contact:Contact):Void
	{
		if (contact == null) return;
		if (contact == _nullContact) return;
		
		#if debug
		de.polygonal.core.util.Assert.assert(_contactList.size() > 0, "_contactList.size() > 0");
		#end
		
		_contactList.unlink(contact.listNode);
		contact.listNode = null;
		
		//unlink existing contact points from island graph
		if (contact.manifoldCount > 0)
		{
			contact.body1.wakeUp();
			contact.body2.wakeUp();
			disconnect(contact);
		}
		
		_contactFactory.destroy(contact);
	}
	
	/** Process narrow-phase (updates all contacts). */
	public function collide():Void
	{
		_contactListItr.reset();
		for (c in _contactListItr)
		{
			//do not wake up two sleeping bodies
			if (c.body1.getf(RigidBody.SLEEPING) & c.body2.getf(RigidBody.SLEEPING) == RigidBody.SLEEPING)
				continue;
			
			//create contact manifold and update contact graph
			var oldCount = c.manifoldCount;
			c.evaluate();
			var newCount = c.manifoldCount;
			
			if (oldCount == 0 && newCount > 0)
				connect(c);
			else
			if (oldCount > 0 && newCount == 0)
				disconnect(c);
		}
	}

	inline function connect(c:Contact):Void
	{
		//insert contact into contact graph; create contact nodes
		//body1 <---> contact node 1 <---> contact <---> contact node 2 <---> body2
		c.edge1.link(c.body1, c.body2, c);
		c.edge2.link(c.body2, c.body1, c);
	}
	
	inline function disconnect(c:Contact):Void
	{
		//remove contact from contact graph; unlink contact nodes from bodies
		c.edge1.unlink(c.body1);
		c.edge2.unlink(c.body2);
	}
}