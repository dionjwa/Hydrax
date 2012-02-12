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

import de.polygonal.core.math.Vec2;
import de.polygonal.ds.Hashable;
import de.polygonal.ds.HashKey;
import de.polygonal.motor.dynamics.contact.ContactID;

/**
 * A contact point. The position of the contact is stored in world space.
 */
class ManifoldPoint extends Vec2, implements Hashable
{
	/** World position of the contact point. */
	//public var x:Float;
	//public var y:Float;
	
	/** The next contact point in the manifold. */
	public var next:ManifoldPoint;
	
	/** The separation of the shapes along the collision normal. */
	public var sep:Float;
	
	/** Unique identifier for a contact point between two shapes. */
	public var id:Int;
	
	/** The non-penetration impulse. */
	public var Pn:Float;
	
	/** The friction impulse. */
	public var Pt:Float;
	
	/** Local position of the contact point in body 1. */
	public var lp1:Vec2;
	
	/** Local position of the contact point in body 2. */
	public var lp2:Vec2;
	
	/** True if the warm-starting was applied to this contact point for at least 2 simulation steps. */
	public var matched:Bool;
	
	/**
	 * A unique identifier for this object.<br/>
	 * A hash table transforms this key into an index of an array element by using a hash function.<br/>
	 * <warn>This value should never be changed by the user.</warn>
	 */
	public var key:Int;
	
	public function new():Void
	{
		super();
		
		id      = ContactID.NULL_VALUE;
		sep     = 0;
		Pn      = 0;
		Pt      = 0;
		matched = false;
		lp1     = new Vec2();
		lp2     = new Vec2();
		key     = HashKey.next();
	}

	public function free():Void
	{
		next = null;
		lp1  = null;
		lp2  = null;
	}
}