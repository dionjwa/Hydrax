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
package de.polygonal.motor.data;

/**
 * A reusable 'blueprint' for constructing a rigid body.
 */
class RigidBodyData
{
	/** The position of the body along the world x-axis. */
	public var x:Float;
	
	/** The position of the body along the world y-axis. */
	public var y:Float;
	
	/** The world angle of the body in radians. */
	public var r:Float;
	
	/**
	 * Set this flag to false if this body should never fall asleep.
	 * Note that this increases CPU usage.
	 */
	public var allowSleep:Bool;
	
	/** If true, put the body to sleep upon creation. */
	public var putToSleep:Bool;
	
	/** Should this body be prevented from rotating? */
	public var fixedRotation:Bool;
	
	/** Linear damping coefficient in the range between 0 (no damping) and 1 (full damping). */
	public var linDamping:Float;
	
	/** Angular damping coefficient in the range between 0 (no damping) and 1 (full damping). */
	public var angDamping:Float;
	
	/** The mass properties of the body or use setMassFromShapes() once all shapes have been added. */
	public var massData:MassData;
	
	/** Application specific user data. */
	public var userData:Dynamic;
	
	var _shapeDataList:Array<ShapeData>;
	
	/**
	 * @param x The world x position of the body.
	 * @param y The world y position of the body.
	 * @param r The world angle in radians of the body.
	 */
	public function new(x = .0, y = .0, ?r = .0)
	{
		this.x = x;
		this.y = y;
		this.r = r;
		
		allowSleep = true;
		putToSleep = false;
		fixedRotation = false;
		linDamping = .01;
		angDamping = .01;
		massData = new MassData();
		userData = null;
		
		_shapeDataList = new Array<ShapeData>();
	}
	
	/** Each <i>ShapeData</i> object defines a shape that will be attached to the body upon creation. */
	public function getShapeDataList():Array<ShapeData>
	{
		return _shapeDataList;
	}
	
	public function clearShapeDataList():Void
	{
		_shapeDataList = new Array<ShapeData>();
	}
	
	public function addShapeData(shapeData:ShapeData):Void
	{
		if (Std.is(shapeData, BoxData))
		{
			var boxData:BoxData = cast shapeData;
			if (boxData.isAxisAligned) fixedRotation = true;
		}
		
		_shapeDataList.push(shapeData);
	}
}