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
package de.polygonal.motor;

import de.polygonal.core.event.Observable;
import de.polygonal.core.time.StopWatch;
import de.polygonal.ds.ArrayedQueue;
import de.polygonal.ds.ArrayedStack;
import de.polygonal.ds.DLL;
import de.polygonal.ds.DLLNode;
import de.polygonal.motor.collision.nbody.BroadPhase;
import de.polygonal.motor.collision.nbody.ExhaustiveSearch;
import de.polygonal.motor.collision.nbody.Proxy;
import de.polygonal.motor.collision.nbody.QuadTree;
import de.polygonal.motor.collision.nbody.SAP;
import de.polygonal.motor.collision.shape.AbstractShape;
import de.polygonal.motor.data.RigidBodyData;
import de.polygonal.motor.dynamics.contact.Contact;
import de.polygonal.motor.dynamics.contact.ContactEdge;
import de.polygonal.motor.dynamics.contact.ContactFactory;
import de.polygonal.motor.dynamics.contact.ContactFilter;
import de.polygonal.motor.dynamics.contact.ContactManager;
import de.polygonal.motor.dynamics.Island;
import de.polygonal.motor.dynamics.joint.data.JointData;
import de.polygonal.motor.dynamics.joint.Joint;
import de.polygonal.motor.dynamics.joint.JointEdge;
import de.polygonal.motor.dynamics.RigidBody;
import de.polygonal.motor.dynamics.TOI;
import de.polygonal.motor.geom.primitive.AABB2;
import de.polygonal.motor.collision.nbody.BroadPhase;

using de.polygonal.ds.BitFlags;

enum WorldError
{
	/** A body has left the world boundaries. */
	WorldBoundViolation;
	
	/** Other errors **/
	Custom(e:Dynamic);
}

class World extends Observable
{
	public static var settings(default, null):Settings;
	
	public var bodyList   (default, null):DLL<RigidBody>;
	public var contactList(default, null):DLL<Contact>;
	public var jointList  (default, null):DLL<Joint>;
	
	/** The number of solved island per simulation step. */
	public var numSolvedIsland(default, null):Float;
	public var maxIslandHeight(default, null):Float;
	
	var _island:Island;
	var _islandStack:ArrayedStack<RigidBody>;
	var _contactFilter:ContactFilter;
	var _contactFactory:ContactFactory;
	var _contactManager:ContactManager;
	var _broadPhase:BroadPhase;
	
	var _toi:TOI;
	var _toiIsland:Island;
	var _toiQueue:ArrayedQueue<RigidBody>;
	var _subStep:Settings;
	
	public function new(settings:Settings)
	{
		super();
		
		D.assert(settings.worldBound != null, "settings.worldBound is missing");
		
		World.settings  = settings;
		bodyList        = new DLL<RigidBody>();
		contactList     = new DLL<Contact>();
		jointList       = new DLL<Joint>();
		_contactFilter  = new ContactFilter();
		_contactFactory = new ContactFactory(settings);
		_contactManager = new ContactManager(contactList, _contactFactory);
		_island         = new Island(settings);
		_islandStack    = new ArrayedStack<RigidBody>(settings.maxProxies);
		_toi            = new TOI(settings);
		_toiIsland      = new Island(settings);
		_toiQueue       = new ArrayedQueue<RigidBody>(settings.maxProxies);
		_subStep        = new Settings();
		
		_contactManager.setFilter(_contactFilter);
		_subStep.setStepSize(0);
		
		setBroadPhase(ExhaustiveSearch);
	}

	override public function free():Void
	{
		setBroadPhase(null);
		
		_island.free();
		_islandStack.free();
		
		for (j in jointList) j.free();
		jointList.free();
		
		for (b in bodyList) b.free();
		bodyList.free();
		
		for (c in contactList) c.free();
		contactList.free();
		
		_contactManager.free();
		_contactFilter.free();
		_contactFactory.free();
		
		_island         = null;
		_islandStack    = null;
		jointList       = null;
		bodyList        = null;
		contactList     = null;
		_contactManager = null;
		_contactFilter  = null;
		_contactFactory = null;
		
		super.free();
	}

	public function getShapeIterator():Iterator<AbstractShape>
	{
		return new ShapeIterator(this);
	}
	
	public function createBody(data:RigidBodyData):RigidBody
	{
		return new RigidBody(data, this);
	}
	
	public function createJoint(data:JointData):Joint
	{
		return data.createJoint(this);
	}
	
	public function getBroadPhase():BroadPhase
	{
		return _broadPhase;
	}
	
	public function setBroadPhase(broadPhase:Class<BroadPhase>):Void
	{
		if (_broadPhase != null)
		{
			for (shape in getShapeIterator()) shape.destroyProxy();
			_broadPhase.free();
			_broadPhase = null;
		}
		
		if (broadPhase == null) return;
		
		_broadPhase = Type.createInstance(broadPhase, [_contactManager]);
		_broadPhase.setWorldBound(settings.worldBound);
		
		for (shape in getShapeIterator())
			shape.createProxy(this, shape.body.TWorld);
	}
	
	public function setContactFilter(filter:ContactFilter):Void
	{
		_contactManager.setFilter(filter);
	}
	
	public function solve():Void
	{
		//computeStackLayer = false;
		var settings = World.settings;
		
		var doProfile = settings.doProfile;
		if (doProfile) StopWatch.clock(settings.profileIdSolver);
		
		//reset island flags
		for (b in bodyList)    b.clrf(RigidBody.ISLAND);
		for (c in contactList) c.clrf(Contact.FLAG_ISLAND);
		for (j in jointList)   j.clrf(Joint.FLAG_ISLAND);
		
		numSolvedIsland = 0;
		
		//build and simulate all awake islands
		var stack = _islandStack;
		stack.clear();
		
		for (body in bodyList)
		{
			if (body.hasf(RigidBody.ISLAND | RigidBody.SLEEPING | RigidBody.FROZEN | RigidBody.STATIC))
				continue;
			
			_island.reset();
			
			stack.push(body);
			body.setf(RigidBody.ISLAND);
			
			//build an island by performing a depth first search (DFS) on the constraint graph
			while (stack.size() > 0)
			{
				//grab the next body off the stack and add it to the island
				var b = stack.pop();
				_island.addBody(b);
				
				//make sure the body is awake
				b.clrf(RigidBody.SLEEPING);
				
				//don't propagate islands across static bodies to keep them small
				if (b.isStatic) continue;
				
				//find all contacts connected to this body
				var e = b.contactList;
				while (e != null)
				{
					var c = e.contact;
					
					//already been added to an island?
					if (c.hasf(Contact.FLAG_ISLAND | Contact.FLAG_GHOST))
					{
						e = e.next;
						continue;
					}
					
					//touching contact?
					if (c.manifoldCount == 0)
					{
						e = e.next;
						continue;
					}
					
					_island.addContact(c);
					c.setf(Contact.FLAG_ISLAND);
					
					var other = e.other;
					
					//other body already added to this island?
					if (other.hasf(RigidBody.ISLAND))
					{
						e = e.next;
						continue;
					}
					
					#if debug
					de.polygonal.core.util.Assert.assert(stack.size() < bodyList.size(), "stack.size() < bodyList.size()");
					#end
					
					stack.push(other);
					other.setf(RigidBody.ISLAND);
					
					e = e.next;
				}
				
				//search all joints connect to this body
				var e = b.jointList;
				while (e != null)
				{
					if (e.joint.hasf(Joint.FLAG_ISLAND))
					{
						e = e.next;
						continue;
					}
					
					_island.addJoint(e.joint);
					e.joint.setf(Joint.FLAG_ISLAND);
					
					var other = e.other;
					if (other.hasf(RigidBody.ISLAND))
					{
						e = e.next;
						continue;
					}
					
					#if debug
					de.polygonal.core.util.Assert.assert(stack.size() < bodyList.size(), "stack.size() < bodyList.size()");
					#end
					
					stack.push(other);
					other.setf(RigidBody.ISLAND);
					
					e = e.next;
				}
			}
			
			if (settings.computeStackLayer)
			{
				_island.computeStackLayer(settings);
			}
			
			_island.solve(settings);
			
			numSolvedIsland++;
			
			//post solve cleanup - static bodies should participate in other islands
			var b = _island.bodyList;
			while (b != null)
			{
				if (b.hasf(RigidBody.STATIC))
					b.clrf(RigidBody.ISLAND);
				b = b.next;
			}
		}
		
		for (body in bodyList)
		{
			if (body.hasf(RigidBody.SLEEPING | RigidBody.FROZEN | RigidBody.STATIC))
				continue;
			
			if (!body.synchronizeShapes()) notify(WorldEvent.BODY_ESCAPED, body);
		}
		
		//handle TOI events
		if (settings.doContinuousPhysics && settings.dt > .0) _solveTOI();
		
		if (doProfile) StopWatch.clock(settings.profileIdSolver);
		
		//run broad phase:
		//commit shape proxy movements to the broad-phase to create/remove contacts
		if (doProfile) StopWatch.clock(settings.profileIdBroadPhase);
		_broadPhase.update();
		if (doProfile) StopWatch.clock(settings.profileIdBroadPhase);
		
		//run narrow phase
		if (doProfile) StopWatch.clock(settings.profileIdNarrowPhase);
		_contactManager.collide();
		if (doProfile) StopWatch.clock(settings.profileIdNarrowPhase);
	}
	
	/** Find TOI contacts and solve them. */
	function _solveTOI():Void
	{
		var island = _toiIsland;
		var que = _toiQueue;
		var subStep = _subStep;
		
		for (body in bodyList)
		{
			body.clrf(RigidBody.ISLAND);
			body.sweep.t0 = .0;
		}
		
		//invalidate TOI
		for (contact in contactList) contact.clrf(Contact.FLAG_TOI | Contact.FLAG_ISLAND);
		for (joint in jointList) joint.clrf(Joint.FLAG_ISLAND);
		
		//find TOI events and solve them
		while (true)
		{
			//find the first TOI
			var minContact = null;
			var minTOI = 1.;
			
			for (c in contactList)
			{
				if (c.hasf(Contact.FLAG_SLOW | Contact.FLAG_GHOST)) continue;
				
				var toi = 1.;
				
				if (c.hasf(Contact.FLAG_TOI))
				{
					//contact has valid cached TOI
					toi = c.toi;
				}
				else
				{
					//compute the TOI for this contact
					var s1 = c.shape1;
					var s2 = c.shape2;
					var b1 = s1.body;
					var b2 = s2.body;
					
					if ((b1.isStatic || b1.isSleeping) && (b2.isStatic || b2.isSleeping)) continue;
					
					//put the sweeps onto the same time interval
					var sweep1 = b1.sweep;
					var sweep2 = b2.sweep;
					var t0 = -1.;
					if (sweep1.t0 < sweep2.t0)
					{
						t0 = sweep2.t0;
						sweep1.advance(t0);
					}
					else
					if (sweep2.t0 < sweep1.t0)
					{
						t0 = sweep1.t0;
						sweep2.advance(t0);
					}
					
					#if debug
					de.polygonal.core.util.Assert.assert(t0 < 1., "t0 < 1.");
					#end
					
					toi = _toi.timeOfImpact(s1, sweep1, s2, sweep2);
					
					#if debug
					de.polygonal.core.util.Assert.assert(.0 <= toi && toi <= 1., ".0 <= toi && toi <= 1.");
					#end
					
					//if TOI is in range...
					if (0. < toi && toi < 1.)
					{
						//interpolate on the actual range
						toi = Math.min((1 - toi) * t0 + toi, 1);
					}
					
					c.toi = toi;
					c.setf(Contact.FLAG_TOI);
				}
				
				if (settings.eps < toi && toi < minTOI)
				{
					//this is the minimum TOI found so far
					minContact = c;
					minTOI = toi;
				}
			}
			
			if (minContact == null || (1. - 100. * settings.eps < minTOI))
			{
				//done; no more TOI events
				break;
			}
			
			//advance the bodies to the TOI
			var s1 = minContact.shape1;
			var s2 = minContact.shape2;
			var b1 = s1.body;
			var b2 = s2.body;
			b1.advance(minTOI);
			b2.advance(minTOI);
			
			//the TOI contact likely has some new contact points
			//TODO dispatch event
			//minContact.Update(m_contactListener);
			minContact.clrf(Contact.FLAG_TOI);
			
			if (minContact.manifoldCount == 0) continue;
			
			//build the TOI island using a dynamic seed
			var seed = b1; if (seed.isStatic) seed = b2;
			
			//reset island and queue
			island.reset();
			que.clear();
			que.enqueue(seed);
			seed.setf(RigidBody.ISLAND);
			
			//perform a breadth first search (BFS) on the contact/joint graph
			while (que.size() > 0)
			{
				//grab the next body off the stack and add it to the island
				var b = que.dequeue();
				island.addBody(b);
				
				//make sure the body is awake
				b.clrf(RigidBody.SLEEPING);
				
				//don't propagate islands across static bodies to keep islands as small as possible
				if (b.isStatic) continue;
				
				//search all contacts connected to this body
				var ce = b.contactList;
				while (ce != null)
				{
					//does the TOI island still have space for contacts?
					if (island.contactSize == settings.maxToiContactsPerIsland)
					{
						ce = ce.next;
						continue;
					}
					
					//contact already been added to an island?
					if (ce.contact.hasf(Contact.FLAG_ISLAND | Contact.FLAG_SLOW | Contact.FLAG_GHOST))
					{
						ce = ce.next;
						continue;
					}
					
					//is this contact touching? for performance we are not updating this contact
					if (ce.contact.manifoldCount == 0)
					{
						ce = ce.next;
						continue;
					}
					
					island.addContact(ce.contact);
					ce.contact.setf(Contact.FLAG_ISLAND);
					
					//update other body
					var other = ce.other;
					
					//was the other body already added to this island?
					if (other.hasf(RigidBody.ISLAND))
					{
						ce = ce.next;
						continue;
					}
					
					//march forward, this can do no harm since this is the min TOI
					if (!other.isStatic)
					{
						other.advance(minTOI);
						other.wakeUp();
					}
					
					que.enqueue(other);
					other.setf(RigidBody.ISLAND);
				}
				
				var je = b.jointList;
				while (je != null)
				{
					if (island.jointSize == settings.maxToiJointsPerIsland)
					{
						je = je.next;
						continue;
					}
					
					if (je.joint.hasf(Joint.FLAG_ISLAND))
					{
						je = je.next;
						continue;
					}
					
					island.addJoint(je.joint);
					je.joint.setf(Joint.FLAG_ISLAND);
					
					var other = je.other;
					if (other.hasf(RigidBody.ISLAND))
					{
						je = je.next;
						continue;
					}
					
					if (!other.isStatic)
					{
						other.advance(minTOI);
						other.wakeUp();
					}
					
					que.enqueue(other);
					other.setf(RigidBody.ISLAND);
				}
			}
			
			subStep.setStepSize((1 - minTOI) * settings.dt);
			subStep.dtRatio = .0;
			subStep.doWarmStart = false;
			subStep.velocityIterations = settings.velocityIterations;
			subStep.positionIterations = settings.positionIterations;
			
			island.solveTOI(settings, subStep);
			
			//post solve cleanup
			var b = island.bodyList;
			while (b != null)
			{
				//allow bodies to participate in future TOI islands
				b.clrf(RigidBody.ISLAND);
				if (b.hasf(RigidBody.SLEEPING | RigidBody.FROZEN)) continue;
				if (b.isStatic) continue;
				
				//update shapes (for broad-phase)
				//if the shapes go out of the world AABB then shapes and contacts may be destroyed
				var inRange = b.synchronizeShapes();
				
				//did the body's shapes leave the world
				if (!inRange) notify(WorldEvent.BODY_ESCAPED, b);
				
				//invalidate all contact TOIs associated with this body
				//some of these may not be in the island because they were not touching
				var ce = b.contactList;
				while (ce != null)
				{
					ce.contact.clrf(Contact.FLAG_TOI);
					ce = ce.next;
				}
				b = b.next;
			}
			
			//allow contacts to participate in future TOI islands
			var c = island.contactList;
			while (c != null)
			{
				c.clrf(Contact.FLAG_TOI | Contact.FLAG_ISLAND);
				c = c.next;
			}
			
			//allow joints to participate in future TOI islands
			var j = island.jointList;
			while (j != null)
			{
				j.clrf(Joint.FLAG_ISLAND);
				j = j.next;
			}
			
			//commit shape proxy movements to the broad-phase so that new contacts are created
			//also, some contacts can be destroyed.
			_broadPhase.update();
		}
	}
}

class ShapeIterator
{
	var _bnode:DLLNode<RigidBody>;
	var _snode:DLLNode<AbstractShape>;
	
	public function new(world:World) 
	{
		_bnode = world.bodyList.head;
		if (_bnode != null && _bnode.val.shape != null)
		{
			_snode = _bnode.val.shapeList.head;
		}
	}
	
	public function hasNext():Bool
	{
		return (_snode != null) || (_bnode != null && _bnode.hasNext());
	}
	
	public function next():AbstractShape
	{
		var s:AbstractShape = null;
		
		if (_snode != null)
		{
			s = _snode.val;
			_snode = _snode.next;
		}
		else
		{
			_bnode = _bnode.next;
			if (_bnode != null)
			{
				_snode = _bnode.val.shapeList.head;
				return next();
			}
		}
		
		return s;
	}
}