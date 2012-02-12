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
package de.polygonal.motor.dynamics.joint;

import de.polygonal.core.math.Vec2;
import de.polygonal.ds.Bits;
import de.polygonal.ds.DLLNode;
import de.polygonal.motor.dynamics.joint.data.JointData;
import de.polygonal.motor.dynamics.RigidBody;
import de.polygonal.motor.Settings;
import de.polygonal.motor.World;
import de.polygonal.motor.WorldEvent;

class Joint
{
	inline public static var FLAG_ISLAND = Bits.BIT_01;
	
	public var next:Joint;
	
	public var body1:RigidBody; 
	public var body2:RigidBody;
	
	public var node1:JointEdge;
	public var node2:JointEdge;
	
	public var userData:Dynamic;
	public var type:Int;
	
	var _bits:Int;
	
	public var collideConnected:Bool;
	
	/* anchors in body's modeling space */
	public var la1x:Float; public var la2x:Float;
	public var la1y:Float; public var la2y:Float;

	//TODO check if necessary to save reactionforce
	//var _reactionForce:Vec2;
	var _anchor1:Vec2;
	var _anchor2:Vec2;
	
	//var _dt:Float;
	//var _invdt:Float;
	
	var _node:DLLNode<Joint>;
	var _world:World;
	
	var _settings:Settings;

	public function new(data:JointData, world:World)
	{
		_settings = World.settings;
		
		type = data.type;
		
		
		body1 = data.body1;
		body2 = data.body2;
		
		collideConnected = data.collideConnected;
		userData = data.userData;
		
		node1 = new JointEdge(this, body1, body2);
		node2 = new JointEdge(this, body2, body1);
		
		_world = world;
		
		//reset collision filtering if joint prevents collisions
		if (!data.collideConnected) _refilterProxies();
		
		_node = world.jointList.prepend(this);
	}
	
	public function free()
	{
		#if debug
		de.polygonal.core.util.Assert.assert(_node.getList().size() > 0, "_node.getList().size() > 0");
		#end
		
		//reset collision filtering if joint prevents collisions
		if (!collideConnected) _refilterProxies();
		
		//disconnect from world
		_node.unlink();
		
		//disconnect from island graph:
		//wake up connected bodies
		body1.wakeUp();
		body2.wakeUp();
		
		//unlink nodes from bodies
		node1.unlink(body1); 
		node2.unlink(body2);
		
		node1.free();
		node2.free();
		
		_world.notify(WorldEvent.JOINT_DESTROYED);
		
		_node    = null;
		node1    = null;
		node2    = null;
		body1    = null;
		body2    = null;
		userData = null;
		_world   = null;
		_anchor1 = null;
		_anchor2 = null;
	}

	/**
	 * The body1's anchor position in world coordinates.
	 */
	public function getAnchor1():Vec2
	{
		var a = new Vec2();
		body1.getWorldPoint(la1x, la1y, a);
		_anchor1 = a;
		return _anchor1;
	}
	
	/**
	 * The body2's anchor position in world coordinates.
	 */
	public function getAnchor2():Vec2
	{		
		var a = new Vec2();
		body2.getWorldPoint(la2x, la2y,a);
		_anchor2 = a;
		return _anchor2;
	}
	
	public function getReactionForce(invdt:Float):Vec2
	{
		return null;
	}

	public function getReactionTorque(invdt:Float):Float
	{
		return 0;
	}
	
	public function preStep(settings:Settings):Void
	{
		return;
	}
	
	
	public function preparePosSolver():Void
	{
	}
	
	
	public function solveVelConstraints(dt:Float):Void 
	{
	}
	
	
	public function solvePosConstraints():Bool
	{
		return true;
	}
	
	
	function _setType(type:Int):Void
	{
		this.type = type;
	}
	
	function _refilterProxies():Void
	{
		//reset the proxies on the body with the minimum number of shapes
		var size1 = body1.shapeList.size();
		var size2 = body2.shapeList.size();
		var b = size1 < size2 ? body1 : body2;
		for (shape in b.shapeList) shape.refilterProxy(_world, b.TWorld);
	}
}