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
package de.polygonal.core.math;

import de.polygonal.core.fmt.Sprintf;
import de.polygonal.core.math.Vec2;

import de.polygonal.core.util.Assert;

/**
 * <b>A 3x2 transformation matrix which can represent any 2D affine transformation</b>.<br/>
 * <i>Taken from 3D Math Primer for Games and Graphics Development (Matrix4x3.cpp)</i><br/><br/>
 * The upper 2x2 portion contains a linear transformation, and the last row is the translation portion.<br/>
 * We use row vectors, so multiplying a vector by the matrix looks like this:
 * <pre>
 *       |m11 m12|
 * |x y| |m21 m22| = |x' y'|
 *       |tx  ty |
 * </pre>
 * Strict adherence to linear algebra rules dictates that this multiplication is actually undefined.
 * To circumvent this, we consider the input and output vectors as having an assumed third coordinate of 1.
 * Also, since we cannot technically invert a 3x2 matrix according to linear algebra rules, we will
 * also assume a rightmost column of &#091;0 0 1&#093;:<br/>
 * <pre>
 *         |m11 m12 0|
 * |x y 1| |m21 m22 0| = |m11x+m21y+tx m12x+m22y+ty 1|
 *         |tx  ty  1|
 * </pre>
 */
class Mat32 implements de.polygonal.ds.Cloneable<Mat32>
{
	/** Copies <i>source</i> into <i>target</i> and returns <i>target</i>. */
	inline public static function copy(source:Mat32, target:Mat32):Mat32
	{
		//assign upper 2x2 (linear transformation) portion
		target.m11 = source.m11; target.m12 = source.m12;
		target.m21 = source.m21; target.m22 = source.m22;
		
		//assign translation portion
		target.tx = source.tx; target.ty = source.ty;
		return target;
	}
	
	/**
	 * Computes the matrix product <code>C</code>=<code>AB</code> such as v' = v<code>C</code> = v<code>AB</code>.<br/>
	 * The order of multiplications from left to right is the same as the order of transformations.
	 * @return The concatenated matrix (<code>out</code>).
	 */
	inline public static function concat(A:Mat32, B:Mat32, C:Mat32):Mat32
	{
		D.assert(A != B, "A != B");
		
		var t1 = A.m11;
		var t2 = A.m12;
		
		var t3 = B.m11;
		var t4 = B.m12;
		var t5 = B.m21;
		var t6 = B.m22;
		
		//compute upper 2x2 (linear transformation) portion
		//equals:
		//C.m11 = A.m11 * B.m11 + A.m12 * B.m21;
		//C.m12 = A.m11 * B.m12 + A.m12 * B.m22;
		//C.m21 = A.m21 * B.m11 + A.m22 * B.m21;
		//C.m22 = A.m21 * B.m12 + A.m22 * B.m22;
		C.m11 = t1 * t3 + t2 * t5;
		C.m12 = t1 * t4 + t2 * t6;
		t1 = A.m21;
		t2 = A.m22;
		C.m21 = t1 * t3 + t2 * t5;
		C.m22 = t1 * t4 + t2 * t6;
		
		//compute the translation portion
		//equals:
		//C.tx = A.tx * B.m11 + A.ty * B.m12 + B.tx;
		//C.ty = A.tx * B.m21 + A.ty * B.m22 + B.ty;
		t1 = A.tx;
		t2 = A.ty;
		C.tx = t1 * t3 + t2 * t4 + B.tx;
		C.ty = t1 * t5 + t2 * t6 + B.ty;
		return C;
	}
	
	inline public static function concat22(A:Mat32, B:Mat22, out:Mat32):Mat32
	{
		var t1 = A.m11;
		var t2 = A.m12;
		
		var t3 = B.m11;
		var t4 = B.m12;
		var t5 = B.m21;
		var t6 = B.m22;
		
		//compute upper 2x2 (linear transformation) portion
		//equals:
		//out.m11 = A.m11 * B.m11 + A.m12 * B.m21;
		//out.m12 = A.m11 * B.m12 + A.m12 * B.m22;
		//out.m21 = A.m21 * B.m11 + A.m22 * B.m21;
		//out.m22 = A.m21 * B.m12 + A.m22 * B.m22;
		out.m11 = t1 * t3 + t2 * t5;
		out.m12 = t1 * t4 + t2 * t6;
		t1 = A.m21;
		t2 = A.m22;
		out.m21 = t1 * t3 + t2 * t5;
		out.m22 = t1 * t4 + t2 * t6;
		return out;
	}
	
	/** Row 1, column 1 (rotation). */           public var m11:Float; /** Row 1, column 2 (rotation). */           public var m12:Float;
	/** Row 2, column 1 (rotation). */           public var m21:Float; /** Row 2, column 2 (rotation). */           public var m22:Float;
	/** Row 3, column 1 (translation x-axis). */ public var tx:Float;  /** Row 3, column 2 (translation y-axis). */ public var ty:Float;
	
	/** Creates a new identity matrix. */
	public function new()
	{
		identity();
	}
	
	/**
	 * v' = <i>v</i><i>M</i><br/>
	 * Transforms <i>v</i> and writes the result into <i>out</i> in vector form.<br/>
	 * This is a transformation followed by translation (affine transformation).<br/>
	 * The order of multiplications from left to right is the same as the order of transformations.
	 * @return The transformed vector (<i>out</i>).
	 */
	inline public function mul(c:Vec2, out:Vec2):Vec2
	{
		var x = c.x;
		var y = c.y;
		out.x = x * m11 + y * m12 + tx;
		out.y = x * m21 + y * m22 + ty;
		return out;
	}
	
	/** Transforms <i>x</i>,<i>y</i> and returns the <b>x-coordinate</b> of the result. */
	inline public function mulx(x:Float, y:Float):Float { return x * m11 + y * m12 + tx; }
	/** Transforms <i>x</i>,<i>y</i> and returns the <b>y-coordinate</b> of the result. */
	inline public function muly(x:Float, y:Float):Float { return x * m21 + y * m22 + ty; }
	
	/**
	 * Transforms <i>v</i> and writes the result into <i>out</i> in vector form.<br/>
	 * This is the exact opposite of <i>mul</i> (inverse transform).<br/>
	 * This is a transformation followed by translation (affine transformation).<br/>
	 * The order of multiplications from left to right is the same as the order of transformations.
	 * @return The transformed vector (<i>out</i>).
	 */
	inline public function mulT(c:Vec2, out:Vec2):Vec2
	{
		var dx = c.x - tx;
		var dy = c.y - ty;
		out.x = dx * m11 + dy * m21;
		out.y = dx * m12 + dy * m22;
		return out;
	}
	
	/** Transforms <i>x</i>,<i>y</i> (inverse transform) and returns the <b>x-coordinate</b> of the result. */
	inline public function mulTx(x:Float, y:Float):Float { return (x - tx) * m11 + (y - ty) * m21; }
	/** Transforms <i>x</i>,<i>y</i> (inverse transform) and returns the <b>y-coordinate</b> of the result. */
	inline public function mulTy(x:Float, y:Float):Float { return (x - tx) * m12 + (y - ty) * m22; }
	
	/**
	 * v' = <i>v</i><i>R, R = 2x2 upper portion</i><br/>
	 * Linearly transforms <i>v</i> (upper 2x2 portion only) and writes the result into <i>out</i> in vector form.<br/>
	 * This rotates <i>v</i> if the 2x2 matrix is a rotation matrix. 
	 * The order of multiplications from left to right is the same as the order of transformations.
	 * @return The transformed vector (<i>out</i>).
	 */
	inline public function mul22(c:Vec2, out:Vec2):Vec2
	{
		var x = c.x;
		var y = c.y;
		out.x = x * m11 + y * m12;
		out.y = x * m21 + y * m22;
		return out;
	}
	
	/** Linearly transforms <i>x</i>,<i>y</i> (upper 2x2 portion only) and returns the <b>x-coordinate</b> of the result. */
	inline public function mul22x(x:Float, y:Float):Float { return x * m11 + y * m12; }
	/** Linearly transforms <i>x</i>,<i>y</i> (upper 2x2 portion only) and returns the <b>y-coordinate</b> of the result. */
	inline public function mul22y(x:Float, y:Float):Float { return x * m21 + y * m22; }
	
	/**
	 * v' = <i>v</i><i>R^T, R = 2x2 upper portion</i><br/>
	 * Linearly transforms <i>v</i> (upper 2x2 portion only) and writes the result into <i>out</i> in vector form.<br/>
	 * This is the exact opposite of <i>mulR</i> (inverse transform).<br/>
	 * The order of multiplications from left to right is the same as the order of transformations.
	 * @return The transformed vector (<i>out</i>).
	 */
	inline public function mul22T(v:Vec2, out:Vec2):Vec2
	{
		var x = v.x;
		var y = v.y;
		out.x = x * m11 + y * m21;
		out.y = x * m12 + y * m22;
		return out;
	}
	
	/** Linearly transforms <i>x</i>,<i>y</i> (inverse transform - upper 2x2 portion only) and returns the <b>x-coordinate</b> of the result. */
	inline public function mul22Tx(x:Float, y:Float):Float { return x * m11 + y * m21; }
	/** Linearly transforms <i>x</i>,<i>y</i> (inverse transform - upper 2x2 portion only) and returns the <b>y-coordinate</b> of the result. */
	inline public function mul22Ty(x:Float, y:Float):Float { return x * m12 + y * m22; }
	
	/** Sets the matrix to identity. */
	inline public function identity():Void
	{
		m11 = 1; m12 = 0;
		m21 = 0; m22 = 1;
		tx  = 0; ty  = 0;
	}
	
	/** Zero the 3rd row of the matrix, which contains the translation portion. */
	inline public function zeroTranslation():Void
	{
		tx = ty = 0;
	}
	
	/** Returns true if the matrix contains a translation portion. */
	inline public function hasTranslation():Bool
	{
		return tx != 0 || ty != 0;
	}
	
	/**
	 * Returns the translation row of the matrix in vector form.<br/>
	 * This is the position of an object given a local->parent transformation matrix
	 * (such as an object->world matrix).
	 */
	inline public function getTranslation(out:Vec2):Vec2
	{
		out.x = tx;
		out.y = ty;
		return out;
	}
	
	/** Sets the translation portion of the matrix. */
	inline public function setTranslation(x:Float, y:Float):Void
	{
		tx = x; ty = y;
	}
	
	inline public function setScale(x:Float, y:Float):Void
	{
		m11 = x; m12 = 0;     
		m21 = 0; m22 = y;
	}
	
	/** Creates a 2x2 rotation matrix from the rotation portion of this matrix. */
	inline public function getRotationMatrix(R:Mat22):Mat22
	{
		R.m11 = m11; R.m12 = m12;
		R.m21 = m21; R.m22 = m22;
		return R;
	}
	
	/** Sets the 2x2 rotation portion given a 2x2 rotation matrix <i>R</i>. */
	inline public function setRotationMatrix(R:Mat22):Void
	{
		m11 = R.m11; m12 = R.m12;
		m21 = R.m21; m22 = R.m22;
	}
	
	/** Extracts the angle from this matrix (assumed to be a rotation matrix). */
	inline public function getAngle():Float
	{
		return Math.atan2(m21, m11);
	}
	
	/** Sets the 2x2 rotation portion given an <i>angle</i> in radians. */
	inline public function setAngle(angle:Float):Void
	{
		var c = Math.cos(angle);
		var s = Math.sin(angle);
		m11 = c; m12 =-s;
		m21 = s; m22 = c;
	}
	
	/** Sets the translation portion of the matrix. */
	inline public function setupTranslation(x:Float, y:Float):Void
	{
		//set the linear transformation portion to identity
		m11 = 1; m12 = 0;
		m21 = 0; m22 = 1;
		//set the translation portion
		tx = x; ty = y;
	}
	
	/**
	 * Setup the matrix to perform a local->parent transformation, given the position <i>x</i>,<i>y</i>
	 * and orientation <i>orient</i> of the local reference frame within the parent reference frame.
	 * A very common use of this will be to construct a object->world matrix. As an example, the
	 * transformation in this case is straightforward. We first rotate from object space into
	 * inertial space, then we translate into world space.
	 * @param angle The orientation of the local reference frame in radians.
	 */
	public function setupLocalToParent(x:Float, y:Float, angle:Float):Void
	{
		//copy the rotation portion of the matrix. we can copy the elements directly
		//(without transposing) because by our definition the rotation matrix is 'normally' an
		//object->inertial matrix, which is local->parent.
		
		var c = Math.cos(angle);
		var s = Math.sin(angle);
		m11 = c; m12 =-s;
		m21 = s; m22 = c;
		
		//now set the translation portion. Translation happens "after" the 3x3 portion, so we
		//can simply copy the position field directly.
		tx = x; ty = y;
	}
	
	/** 
	 * Setup the matrix to perform a parent->local transformation, given the position <i>x</i>,<i>y</i>
	 * and orientation <i>orient</i> of the local reference frame within the parent reference frame.
	 * A very common use of this will be to construct a world->object matrix.
	 * To perform this transformation, we would normally FIRST transform from world to inertial space,
	 * and then rotate from inertial space into object space. However, our 4x3 matrix always
	 * translates last. So we think about creating two matrices T and R, and then concatenating M = TR.
	 * @param orient The orientation of the local reference frame, which can be specified using either an angle (radians) or a 2x2 rotation matrix.
	 */
	public function setupParentToLocal(x:Float, y:Float, angle:Float):Void
	{
		//copy the rotation portion of the matrix. by our definition, the rotation matrix is
		//'normally' an object->inertial matrix, which is local->parent. We want a parent->local
		//rotation, so we must transpose while copying.
		var c = Math.cos(angle);
		var s = Math.sin(angle);
		m11 = c; m12 = s;
		m21 =-s; m22 = c;
		
		//now set the translation portion. normally, we would translate by the negative of the
		//position to translate from world to inertial space. However, we must correct for the
		//fact that the rotation occurs "first." So we must rotate the translation portion. This
		//is the same as create a translation matrix T to translate by -pos, and a rotation
		//matrix R, and then creating the matrix as the concatenation of TR.
		tx = -(x * m11 + y * m12);
		ty = -(x * m21 + y * m22);
	}
	
	/**
	 * Extracts the position of an object given a local->parent transformation matrix
	 * (such as a object->world matrix). We assume that the matrix represents a rigid transformation
	 * (No scale, skew, or mirroring).
	 */
	inline public function getPositionFromLocalToParentMatrix(out:Vec2):Vec2
	{
		return getTranslation(out);
	}
	
	/**
	 * Extracts the position of an object given a parent->local transformation matrix
	 * (such as a world->object matrix). We assume that the matrix represents a rigid transformation
	 * (No scale, skew, or mirroring).
	 */
	inline public function getPositionFromParentToLocalMatrix(out:Vec2):Vec2
	{
		//multiply negative translation value by the transpose of the 2x2 portion.
		//by using the transpose, we assume that the matrix is orthogonal.
		out.x = -(tx * m11 + ty * m21);
		out.y = -(tx * m12 + ty * m22);
		return out;
	}
	
	public function clone():Mat32
	{
		var copy = new Mat32();
		copy.tx = tx;
		copy.ty = ty;
		copy.m11 = m11; copy.m12 = m12;
		copy.m21 = m21; copy.m22 = m22;
		return copy;
	}
	
	/**
	 * A human-readable representation of the elements of this matrix.
	 */
	public function toString():String
	{
		return Sprintf.format("\n|%+8.3f %+8.3f|\n|%+8.3f %+8.3f|\n|%+8.3f %+8.3f|", [m11, m12, m21, m22, tx, ty]);
	}
}