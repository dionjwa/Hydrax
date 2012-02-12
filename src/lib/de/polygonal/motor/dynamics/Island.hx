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
package de.polygonal.motor.dynamics;

import de.polygonal.core.math.Limits;
import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.Vec2;
import de.polygonal.core.math.Vec2Util;
import de.polygonal.ds.ArrayedQueue;
import de.polygonal.ds.DA;
import de.polygonal.motor.dynamics.contact.Contact;
import de.polygonal.motor.dynamics.contact.ContactEdge;
import de.polygonal.motor.dynamics.contact.solver.Box2DContactSolver;
import de.polygonal.motor.dynamics.joint.Joint;
import de.polygonal.motor.Settings;

using de.polygonal.ds.BitFlags;

class Island
{
	public var bodyList(default, null):RigidBody;
	
	public var contactList(default, null):Contact;
	public var contactSize(default, null):Int;
	
	public var jointList(default, null):Joint;
	public var jointSize(default, null):Int;
	
	var _solver:Box2DContactSolver;
	var _toiSolver:Box2DContactSolver;
	var _stackQueue:ArrayedQueue<RigidBody>;
	
	var stackLayerCount:Int;
	var stackLayer:DA<StackLayer>;
	
	var _edges:DA<ContactEdge>;
	var _stackTimeStamp:Int;
	
	public function new(settings:Settings)
	{
		var k = settings.maxStackLayerCount;
		stackLayer = new DA<StackLayer>(k, k);
		stackLayer.assign(StackLayer, k);
		stackLayerCount = 0;
		
		_solver     = new Box2DContactSolver(settings);
		_toiSolver  = new Box2DContactSolver(settings);
		_stackQueue = new ArrayedQueue<RigidBody>(settings.maxProxies);
		_edges      = new DA<ContactEdge>();
	}
	
	public function free():Void
	{
		_solver.free();
		reset();
	}
	
	public function reset():Void
	{
		//clears the island by removing all bodies, contacts and joints
		while (bodyList != null)
		{
			var next = bodyList.next;
			bodyList.next = null;
			bodyList = next;
		}
		
		while (contactList != null)
		{
			var next = contactList.next;
			contactList.next = null;
			contactList = next;
		}
		
		while (jointList != null)
		{
			var next = jointList.next;
			jointList.next = null;
			jointList = next;
		}
		
		contactSize = 0;
		jointSize = 0;
	}
	
	inline public function addBody(x:RigidBody):Void
	{
		x.next = bodyList;
		bodyList = x;
	}
	
	inline public function addContact(x:Contact):Void
	{
		x.next = contactList;
		contactList = x;
		contactSize++;
	}
	
	inline public function addJoint(x:Joint):Void
	{
		x.next = jointList;
		jointList = x;
		jointSize++;
	}
	
	public function solve(settings:Settings):Void
	{
		var m = Math;
		
		var dt = settings.dt;
		var gx = settings.gravity.x;
		var gy = settings.gravity.y;
		
		var b = bodyList;
		while (b != null)
		{
			if (b.isStatic)
			{
				b = b.next;
				continue;
			}
			
			//integrate velocities
			b.vx += dt * (gx + b.invMass * b.fx);
			b.vy += dt * (gy + b.invMass * b.fy);
			b.w  += dt * (     b.invI    * b.t );
			
			//apply damping
			var t = Mathematics.fclamp(1 - dt * b.linDamping, 0, 1);
			b.vx *= t;
			b.vy *= t;
			b.w  *= Mathematics.fclamp(1 - dt * b.angDamping, 0, 1);
			
			//reset forces
			b.clearForce();
			
			//clamp large velocities
			var maxLinVelocity = settings.maxLinVelocity;
			var lenSq = Vec2Util.dot4(b.vx, b.vy, b.vx, b.vy);
			if (lenSq > (maxLinVelocity * maxLinVelocity))
			{
				lenSq = m.sqrt(lenSq);
				b.vx *= lenSq * maxLinVelocity;
				b.vy *= lenSq * maxLinVelocity;
			}
			var maxAngVelocity = settings.maxAngVelocity;
			if (b.w * b.w > (maxAngVelocity * maxAngVelocity))
			{
				if (b.w < 0)
					b.w =-(maxAngVelocity * maxAngVelocity);
				else
					b.w = (maxAngVelocity * maxAngVelocity);
			}
			
			b = b.next;
		}
		
		//TODO stack layer computation
		//if (stackLayerCount == 0)
		//{
			_solver.preStep(settings, contactList);
		//}
		//else
		//{
			/*var cmax = 0;
			var h = new de.polygonal.ds.Set<Contact>();
			var contacts2:DA<Contact> = new DA<Contact>();
			for (i in 0...stackLayerCount + 1)
			{
				var layer = stackLayer[i];
				
				for (c in layer.contacts)
				{
					h.set(c);
					cmax++;
					contacts2.pushBack(c);
				}
			}
			
			#if debug
			de.polygonal.core.util.Assert.assert(contacts.size() == cmax, "contacts.size() == cmax" + ['csize=' +  contacts.size(), 'cmax=' + cmax]);
			#end*/
			//
			//_solver.preStep(settings, contacts2);
		//}
		
		var j = jointList;
		while (j != null)
		{
			j.preStep(settings);
			j = j.next;
		}
		
		//solve velocity constraints
		for (i in 0...settings.velocityIterations)
		{
			var j = jointList;
			while (j != null)
			{
				j.solveVelConstraints(settings.dtInv);
				j = j.next;
			}
			
			_solver.solveVelocityConstraints();
		}
		
		//post-solve (store impulses for warm starting)
		_solver.finalizeVelocityConstraints();
		
		//integrate positions
		var b = bodyList;
		while (b != null)
		{
			if (b.isStatic)
			{
				b = b.next;
				continue;
			}
			
			//store positions for continuous collision
			var sweep = b.sweep;
			
			sweep.c0.x = sweep.c.x;
			sweep.c0.y = sweep.c.y;
			sweep.a0   = sweep.a;
			
			//integrate
			sweep.c.x += dt * b.vx;
			sweep.c.y += dt * b.vy;
			sweep.a   += dt * b.w;
			
			//compute new transform
			b.syncT();
			
			b = b.next;
		}
		
		//iterate over constraints
		for (i in 0...settings.positionIterations)
		{
			var contactsOkay = _solver.solvePositionConstraints(settings.contactBaumgarte);
			var jointsOkay = true;
			
			var j = jointList;
			while (j != null)
			{
				var jointOkay = j.solvePosConstraints();
				jointsOkay = jointsOkay && jointOkay;
				j = j.next;
			}
			
			//early out if the position errors are small
			if (contactsOkay && jointsOkay) break;
		}
		
		if (settings.doSleep) _updateSleep(settings, dt);
	}
	
	public function solveTOI(settings:Settings, subStep:Settings):Void
	{
		var solver = _toiSolver;
		var dt = subStep.dt;
		
		//no warm starting needed for TOI contact events
		//warm starting for joints is off for now, but we need to
		//call this function to compute Jacobians.
		var j = jointList;
		while (j != null)
		{
			j.preStep(subStep);
			j = j.next;
		}
		
		//solve velocity constraints
		for (i in 0...subStep.velocityIterations)
		{
			solver.solveVelocityConstraints();
			var j = jointList;
			while (j != null)
			{
				j.solveVelConstraints(dt);
				j = j.next;
			}
		}
		
		//don't store the TOI contact forces for warm starting
		//because they can be quite large
		
		//integrate positions
		var b = bodyList;
		while (b != null)
		{
			if (b.isStatic)
			{
				b = b.next;
				continue;
			}
			
			//store positions for continuous collision
			var sweep = b.sweep;
			
			sweep.c0.x = sweep.c.x;
			sweep.c0.y = sweep.c.y;
			sweep.a0   = sweep.a;
			
			//integrate
			sweep.c.x += dt * b.vx;
			sweep.c.y += dt * b.vy;
			sweep.a   += dt * b.w;
			
			//note: shapes are synchronized later
			
			b = b.next;
		}
		
		//solve position constraints
		for (i in 0...subStep.positionIterations)
		{
			var contactsOkay = _solver.solvePositionConstraints(settings.contactBaumgarteToi);
			
			var jointsOkay = true;
			
			var j = jointList;
			while (j != null)
			{
				var jointOkay = j.solvePosConstraints();
				jointsOkay = jointsOkay && jointOkay;
				j = j.next;
			}
			
			if (contactsOkay && jointsOkay) break;
		}
		
		//Report(contactSolver.m_constraints);
	}
	
	public function computeStackLayer(settings:Settings):Void
	{
		//reset all layers
		stackLayerCount = 0;
		for (i in 0...settings.maxStackLayerCount)
		{
			stackLayer.get(i).clear();
			//stackLayer[i].contacts.clear();
			//stackLayer[i].bodies.clear();
		}
		
		//preflight; check if island contains a static body
		var fixed = false;
		
		var b = bodyList;
		while (b != null)
		{
			if (b.isStatic)
			{
				fixed = true;
				break;
			}
			b = b.next;
		}
		
		//no fixed objects, just return the original contact group as a result
		if (!fixed)
		{
			var c = contactList;
			while (c != null)
			{
				stackLayer.front().contacts.pushBack(c);
				c = c.next;
			}
			
			trace( 'floating');
			//stackLayerCount = 1;
			//stackLayer[0].contacts.clear();
			return;
		}
		
		var fixedCount = 0;
		
		//static bodies: push on stack and set height=0; non-static bodies: set height=infintive
		var q = _stackQueue;
		q.clear();
		
		
		var b = bodyList;
		while (b != null)
		{
			if (b.isStatic)
			{
				fixedCount++;
				b.stackHeight = 0;
				q.enqueue(b);
				b.setf(RigidBody.STACK_ANALYSIS);
			}
			else
			{
				b.clrf(RigidBody.STACK_ANALYSIS);
				b.stackHeight = Limits.INT32_MAX;
			}
			b = b.next;
		}
		
		trace( "fixedCount : " + fixedCount );
		
		//assigned stack heights to objects and stack layer indices to edges
		var maxBodyHeight = 0;
		_edges.clear();
		++_stackTimeStamp;
		while (q.size() > 0)
		{
			var a = q.dequeue();
			var e = a.contactList;
			
			while (e != null)
			{
				var b = e.other;
				
				//other end was visited by the traversal before?
				if (!b.hasf(RigidBody.STACK_ANALYSIS))
				{
					b.setf(RigidBody.STACK_ANALYSIS);
					q.enqueue(b);
				}
				else
				{
					e = e.next;
					continue;
				}
				
				//does a shorter path exist?
				b.stackHeight = Mathematics.min(b.stackHeight, a.stackHeight + 1);
				
				//keep track of the highest body
				maxBodyHeight = Mathematics.max(b.stackHeight, maxBodyHeight);
				
				//assign stack layer to edge
				if (a.stackHeight == b.stackHeight && b.stackHeight != 0)
					e.stackLayer = b.stackHeight - 1;
				else
					e.stackLayer = Mathematics.min(a.stackHeight, b.stackHeight);
				
				//keep track of #layers
				stackLayerCount = Mathematics.max(stackLayerCount, e.stackLayer);
				
				//collect edge
				if (e.timeStamp != _stackTimeStamp)
				{
					e.timeStamp = _stackTimeStamp;
					_edges.pushBack(e);
				}
				
				e = e.next;
			}
		}
		
		#if debug
		de.polygonal.core.util.Assert.assert(stackLayerCount <= settings.maxStackLayerCount, "stackLayerCount <= settings.maxStackLayerCount");
		#end
		
		#if debug
		//fixed objects were not in contact with any non-fixed objects
		de.polygonal.core.util.Assert.assert(_edges.size() > 0, "edges.size() > 0");
		#end
		
		//traverse the edges and assign them to their respective layers they belong to
		for (e in _edges)
		{
			var layer = e.stackLayer;
			stackLayer.get(layer).contacts.pushBack(e.contact);
			
			//TODO handle joints?
			/*var j = e.contact.body1.jointList;
			while (j != null)
			{
				if (j.other == e.contact.body2)
				{
					stackLayer[layer].joints.pushBack(j.joint);
					break;
				}
				j = j.next;
			}*/
		}
		
		//traverse edges and build stack layers
		var b = bodyList;
		while (b != null)
		{
			var height = b.stackHeight;
			
			#if debug
			//non-fixed body that was not in contact with anything else
			de.polygonal.core.util.Assert.assert(height != Limits.INT32_MAX, "height != Limits.INT32_MAX");
			#end
			if (height == Limits.INT32_MAX) continue;
			
			var inLower = false;
			var inUpper = false;
			var e = b.contactList;
			while (e != null)
			{
				var other = e.other;
				if (other.stackHeight < height) inLower = true;
				if (other.stackHeight > height) inUpper = true;
				if (inUpper && inLower) break;
				e = e.next;
			}
			if (inLower) stackLayer.get(height - 1).bodies.pushBack(b);
			if (inUpper) stackLayer.get(height).bodies.pushBack(b);
			b = b.next;
		}
	}
	
	function _updateSleep(settings:Settings, dt:Float):Void
	{
		var minSleepTime = Math.POSITIVE_INFINITY;
		
		var b = bodyList;
		while (b != null)
		{
			if (b.isStatic)
			{
				b = b.next;
				continue;
			}
			
			//sleeping allowed?
			var allowSleep = b.hasf(RigidBody.ALLOW_SLEEP);
			if (!allowSleep)
			{
				b.sleepTime = 0;
				minSleepTime = 0;
			}
			
			//wake up
			var angSleepToleranceSq = settings.angSleepTolerance * settings.angSleepTolerance;
			var linSleepToleranceSq = settings.linSleepTolerance * settings.linSleepTolerance;
			if ((!allowSleep) || b.w * b.w > angSleepToleranceSq || (b.vx * b.vx + b.vy * b.vy) > linSleepToleranceSq)
			{
				b.sleepTime = 0;
				minSleepTime = 0;
			}
			else
			{
				//accumulate sleeping time
				b.sleepTime += dt;
				minSleepTime = Mathematics.fmin(minSleepTime, b.sleepTime);
			}
			
			b = b.next;
		}
		
		//time to sleep?
		if (minSleepTime >= settings.timeToSleep)
		{
			//put bodies to sleep
			var b = bodyList;
			while (b != null)
			{
				b.setf(RigidBody.SLEEPING);
				b = b.next;
			}
		}
	}
}

class StackLayer
{
	public var contacts:DA<Contact>;
	public var bodies:DA<RigidBody>;
	
	public function new()
	{
		contacts = new DA<Contact>();
		bodies = new DA<RigidBody>();
	}
	
	public function clear():Void
	{
		contacts = new de.polygonal.ds.DA<Contact>();
		bodies = new de.polygonal.ds.DA<RigidBody>();
	}
}