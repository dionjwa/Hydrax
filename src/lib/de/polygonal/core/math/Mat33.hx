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

import de.polygonal.core.util.Assert;

/**
 * <p>A 3x3 matrix.</p>
 * <p> Matrix operations are applied on the left. E.g. given a matrix M and vector V, matrix*vector is M*V, where V is treated as a column vector.</p>
 */
class Mat33
{
	static var _sSineCosine:Vec2 = null;
	
	/**
	 * @return <code>c</code> = <code>a</code>*<code>b</code>.
	 */
	inline public static function matrixProduct(a:Mat33, b:Mat33, c:Mat33):Mat33
	{
		var b11 = b.m11; var b12 = b.m12; var b13 = b.m13;
		var b21 = b.m21; var b22 = b.m22; var b23 = b.m23;
		var b31 = b.m31; var b32 = b.m32; var b33 = b.m33;
		var t1, t2, t3;
		t1 = a.m11;
		t2 = a.m12;
		t3 = a.m13;
		c.m11 = t1 * b11 + t2 * b21 + t3 * b31;
		c.m12 = t1 * b12 + t2 * b22 + t3 * b32;
		c.m13 = t1 * b13 + t2 * b23 + t3 * b33;
		t1 = a.m21;
		t2 = a.m22;
		t3 = a.m23;
		c.m21 = t1 * b11 + t2 * b21 + t3 * b31;
		c.m22 = t1 * b12 + t2 * b22 + t3 * b32;
		c.m23 = t1 * b13 + t2 * b23 + t3 * b33;
		t1 = a.m31;
		t2 = a.m32;
		t3 = a.m33;
		c.m31 = t1 * b11 + t2 * b21 + t3 * b31;
		c.m32 = t1 * b12 + t2 * b22 + t3 * b32;
		c.m33 = t1 * b13 + t2 * b23 + t3 * b33;
		return c;
	}
	
	public var m11:Float; public var m12:Float; public var m13:Float;
	public var m21:Float; public var m22:Float; public var m23:Float;
	public var m31:Float; public var m32:Float; public var m33:Float;
	
	var _sineCosine:Vec2;
	
	public function new()
	{
		setIdentity();
		if (_sSineCosine == null) _sSineCosine = new Vec2();
		_sineCosine = _sSineCosine;
	}
	
	/** Assigns the values of <code>other</code> to this. */
	inline public function set(other:Mat33):Mat33
	{
		m11 = other.m11; m12 = other.m12; m13 = other.m13;
		m21 = other.m21; m22 = other.m22; m23 = other.m23;
		m31 = other.m31; m32 = other.m32; m33 = other.m33;
		return this;
	}
	
	/** Set to identity matrix. */
	inline public function setIdentity():Mat33
	{
		m11 = 1; m12 = 0; m13 = 0;
		m21 = 0; m22 = 1; m23 = 0;
		m31 = 0; m32 = 0; m33 = 1;
		return this;
	}
	
	/** Zero out all matrix elements. */
	inline public function setZero():Mat33
	{
		m11 = 0; m12 = 0; m13 = 0;
		m21 = 0; m22 = 0; m23 = 0;
		m31 = 0; m32 = 0; m33 = 0;
		return this;
	}
	
	/** Set as rotation matrix, rotating by <code>angle</code> radians around z-axis. */
	inline public function setRotateZ(angle:Float):Mat33
	{
		_fastTrig(angle);
		var s = _sineCosine.x;
		var c = _sineCosine.y;
		m11 = c; m12 =-s; m13 = 0;
		m21 = s; m22 = c; m23 = 0;
		m31 = 0; m32 = 0; m33 = 1;
		return this;
	}
	
	/** Multiplies all matrix elements by the scalar <code>x</code>. */
	inline public function timesScalar(x:Float):Void
	{
		m11 *= x; m12 *= x; m13 *= x;
		m21 *= x; m22 *= x; m23 *= x;
		m31 *= x; m32 *= x; m33 *= x;
	}
	
	/** Matrix - column vector multiplication (M*V): <code>rhs</code>' = this * <code>rhs</code>. */
	inline public function timesVector(rhs:Vec3):Vec3
	{
		var x = rhs.x;
		var y = rhs.y;
		var z = rhs.z;
		rhs.x = m11 * x + m12 * y + m13 * z;
		rhs.y = m21 * x + m22 * y + m23 * z;
		rhs.z = m31 * x + m32 * y + m33 * z;
		return rhs;
	}
	
	/**
	 * Same as <code>timesVector()</code>, but without modifying <code>rhs</code>.
	 * @param output stores the result.
	 */
	inline public function timesVectorConst(rhs:Vec3, output:Vec3):Vec3
	{
		var x = rhs.x;
		var y = rhs.y;
		var z = rhs.z;
		output.x = m11 * x + m12 * y + m13 * z;
		output.y = m21 * x + m22 * y + m23 * z;
		output.z = m31 * x + m32 * y + m33 * z;
		return output;
	}
	
	/** Matrix - row vector multiplication (M^t*V): <code>lhs</code>' = <code>lhs</code>*this. */
	inline public function vectorTimes(lhs:Vec3):Vec3
	{
		var x = lhs.x;
		var y = lhs.y;
		var z = lhs.z;
		lhs.x = x * m11 + y * m21 + z * m31;
		lhs.y = x * m12 + y * m22 + z * m32;
		lhs.z = x * m13 + y * m23 + z * m33;
		return lhs;
	}
	
	/** Computes the matrix transpose and returns this matrix. */
	inline public function transpose():Mat33
	{
		var t;
		t = m21; m21 = m12; m12 = t;
		t = m31; m31 = m13; m13 = t;
		t = m32; m32 = m23; m23 = t;
		return this;
	}
	
	/**
	 * Same as <code>transpose()</code>, but without modifying this matrix.
	 * @param output stores the result.
	 */
	inline public function transposeConst(output:Mat33):Mat33
	{
		output.m11 = m11; output.m12 = m21; output.m13 = m31;
		output.m21 = m12; output.m22 = m22; output.m23 = m32;
		output.m31 = m13; output.m32 = m23; output.m33 = m33;
		return output;
	}
	
	/** R = M*D */
	inline public function timesDiagonal(rhs:Vec3):Mat33
	{
		//|m11 m12 m13| |x 0 0|
		//|m21 m22 m23| |0 y 0|
		//|m31 m32 m33| |0 0 z|
		var x = rhs.x;
		var y = rhs.y;
		var z = rhs.z;
		m11 = m11 * x; m12 = m12 * y; m13 = m13 * z;
		m21 = m21 * x; m22 = m22 * y; m23 = m23 * z;
		m31 = m31 * x; m32 = m32 * y; m33 = m33 * z;
		return this;
	}
	
	/** R = M*D<br/>Stores the result in <code>output</code>. */
	inline public function timesDiagonalConst(rhs:Vec3, output:Mat33):Mat33
	{
		//|m11 m12 m13| |x 0 0|
		//|m21 m22 m23| |0 y 0|
		//|m31 m32 m33| |0 0 z|
		var x = rhs.x;
		var y = rhs.y;
		var z = rhs.z;
		output.m11 = m11 * x; output.m12 = m12 * y; output.m13 = m13 * z;
		output.m21 = m21 * x; output.m22 = m22 * y; output.m23 = m23 * z;
		output.m31 = m31 * x; output.m32 = m32 * y; output.m33 = m33 * z;
		return output;
	}
	
	/** R = D*M */
	inline public function diagonalTimes(lhs:Vec3):Mat33
	{
		//|x 0 0| |m11 m12 m13|
		//|0 y 0| |m21 m22 m23|
		//|0 0 z| |m31 m32 m33|
		var x = lhs.x;
		var y = lhs.y;
		var z = lhs.z;
		m11 = x * m11; m12 = x * m12; m13 = x * m13;
		m21 = y * m21; m22 = y * m22; m23 = y * m23;
		m31 = z * m31; m32 = z * m32; m33 = z * m33;
		return this;
	}
	
	/** Post-concatenates <code>lhs</code>: this = <code>lhs</code>*this. */
	inline public function cat(lhs:Mat33):Mat33
	{
		var c11 = m11; var c12 = m12; var c13 = m13;
		var c21 = m21; var c22 = m22; var c23 = m23;
		var c31 = m31; var c32 = m32; var c33 = m33;
		var t1, t2, t3;
		t1 = lhs.m11;
		t2 = lhs.m12;
		t3 = lhs.m13;
		m11 = t1 * c11 + t2 * c21 + t3 * c31;
		m12 = t1 * c12 + t2 * c22 + t3 * c32;
		m13 = t1 * c13 + t2 * c23 + t3 * c33;
		t1 = lhs.m21;
		t2 = lhs.m22;
		t3 = lhs.m23;
		m21 = t1 * c11 + t2 * c21 + t3 * c31;
		m22 = t1 * c12 + t2 * c22 + t3 * c32;
		m23 = t1 * c13 + t2 * c23 + t3 * c33;
		t1 = lhs.m31;
		t2 = lhs.m32;
		t3 = lhs.m33;
		m31 = t1 * c11 + t2 * c21 + t3 * c31;
		m32 = t1 * c12 + t2 * c22 + t3 * c32;
		m33 = t1 * c13 + t2 * c23 + t3 * c33;
		return this;
	}
	
	/** Pre-concatenates <code>rhs</code>: this = this*<code>rhs</code>. */
	inline public function precat(rhs:Mat33):Mat33
	{
		var c11 = rhs.m11; var c12 = rhs.m12; var c13 = rhs.m13;
		var c21 = rhs.m21; var c22 = rhs.m22; var c23 = rhs.m23;
		var c31 = rhs.m31; var c32 = rhs.m32; var c33 = rhs.m33;
		var t1, t2, t3;
		t1 = m11;
		t2 = m12;
		t3 = m13;
		m11 = t1 * c11 + t2 * c21 + t3 * c31;
		m12 = t1 * c12 + t2 * c22 + t3 * c32;
		m13 = t1 * c13 + t2 * c23 + t3 * c33;
		t1 = m21;
		t2 = m22;
		t3 = m23;
		m21 = t1 * c11 + t2 * c21 + t3 * c31;
		m22 = t1 * c12 + t2 * c22 + t3 * c32;
		m23 = t1 * c13 + t2 * c23 + t3 * c33;
		t1 = m31;
		t2 = m32;
		t3 = m33;
		m31 = t1 * c11 + t2 * c21 + t3 * c31;
		m32 = t1 * c12 + t2 * c22 + t3 * c32;
		m33 = t1 * c13 + t2 * c23 + t3 * c33;
		return this;
	}
	
	/**
	 * Inverts and returns this matrix.
	 * @throws de.polygonal.core.util.AssertionError singular matrix (debug only).
	 */
	public function inverse(?output:Mat33):Mat33
	{
		var t11 = m11; var t12 = m12; var t13 = m13;
		var t21 = m21; var t22 = m22; var t23 = m23;
		var t31 = m31; var t32 = m32; var t33 = m33;
		var cf0 = t22 * t33 - t23 * t32;
		var cf3 = t13 * t32 - t12 * t33;
		var cf6 = t12 * t23 - t13 * t22;
		var det = t11 * cf0 + t21 * cf3 + t31 * cf6;
		D.assert(!Mathematics.cmpZero(det, Mathematics.ZERO_TOLERANCE), 'singular matrix');
		var invDet = 1 / det;
		m11 = invDet * cf0;
		m12 = invDet * cf3;
		m13 = invDet * cf6;
		m21 = invDet * (t23 * t31 - t21 * t33);
		m22 = invDet * (t11 * t33 - t13 * t31);
		m23 = invDet * (t13 * t21 - t11 * t23);
		m31 = invDet * (t21 * t32 - t22 * t31);
		m32 = invDet * (t12 * t31 - t11 * t32);
		m33 = invDet * (t11 * t22 - t12 * t21);
		return this;
	}
	
	/**
	 * Computes the matrix inverse and stores the result in <code>output</code>.
	 * @return a reference to <code>output</code>.
	 * @throws de.polygonal.core.util.AssertionError singular matrix (debug only).
	 */
	public function inverseConst(output:Mat33):Mat33
	{
		var cf0 = m22 * m33 - m23 * m32;
		var cf3 = m13 * m32 - m12 * m33;
		var cf6 = m12 * m23 - m13 * m22;
		var det = m11 * cf0 + m21 * cf3 + m31 * cf6;
		D.assert(!Mathematics.cmpZero(det, Mathematics.ZERO_TOLERANCE), 'singular matrix');
		var invDet = 1 / det;
		output.m11 = invDet * cf0;
		output.m12 = invDet * cf3;
		output.m13 = invDet * cf6;
		output.m21 = invDet * (m23 * m31 - m21 * m33);
		output.m22 = invDet * (m11 * m33 - m13 * m31);
		output.m23 = invDet * (m13 * m21 - m11 * m23);
		output.m31 = invDet * (m21 * m32 - m22 * m31);
		output.m32 = invDet * (m12 * m31 - m11 * m32);
		output.m33 = invDet * (m11 * m22 - m12 * m21);
		return output;
	}
	
	
	/** Returns the max-column-sum matrix norm. */
	inline public function norm():Float
	{
		var maxColSum = Mathematics.fabs(m11) + Mathematics.fabs(m21) + Mathematics.fabs(m31);
		var colSum    = Mathematics.fabs(m12) + Mathematics.fabs(m22) + Mathematics.fabs(m32);
		if (colSum > maxColSum) maxColSum = colSum;
		colSum        = Mathematics.fabs(m13) + Mathematics.fabs(m23) + Mathematics.fabs(m33);
		if (colSum > maxColSum) maxColSum = colSum;
		return maxColSum;
	}
	
	/** Divides all matrix elements by the scalar <code>x</code>. */
	inline public function div(x:Float)
	{
		if (Mathematics.cmpZero(x, Mathematics.ZERO_TOLERANCE))
		{
			m11 = Limits.DOUBLE_MAX; m12 = Limits.DOUBLE_MAX; m13 = Limits.DOUBLE_MAX;
			m21 = Limits.DOUBLE_MAX; m22 = Limits.DOUBLE_MAX; m23 = Limits.DOUBLE_MAX;
			m31 = Limits.DOUBLE_MAX; m32 = Limits.DOUBLE_MAX; m33 = Limits.DOUBLE_MAX;
		}
		else
		{
			var fInvScalar = 1 / x;
			m11 *= fInvScalar; m12 *= fInvScalar; m13 *= fInvScalar;
			m21 *= fInvScalar; m22 *= fInvScalar; m23 *= fInvScalar;
			m31 *= fInvScalar; m32 *= fInvScalar; m33 *= fInvScalar;
		}
	}
	
	/** Returns the string form of the value that this object represents. */
	public function toString():String
	{
		var format = "\n" +
			"%-+10.4f %-+10.4f %-+10.4f\n" +
			"%-+10.4f %-+10.4f %-+10.4f\n" +
			"%-+10.4f %-+10.4f %-+10.4f\n";
		return de.polygonal.core.fmt.Sprintf.format(format, [m11, m12, m13, m21, m22, m23, m31, m32, m33]);
	}
	
	inline function _fastTrig(angle:Float)
	{
		TrigApprox.sinCos(angle, _sineCosine);
	}
}