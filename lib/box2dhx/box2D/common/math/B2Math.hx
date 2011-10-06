/*
* Copyright (c) 2006-2007 Erin Catto http://www.gphysics.com
*
* This software is provided 'as-is', without any express or implied
* warranty.  In no event will the authors be held liable for any damages
* arising from the use of this software.
* Permission is granted to anyone to use this software for any purpose,
* including commercial applications, and to alter it and redistribute it
* freely, subject to the following restrictions:
* 1. The origin of this software must not be misrepresented; you must not
* claim that you wrote the original software. If you use this software
* in a product, an acknowledgment in the product documentation would be
* appreciated but is not required.
* 2. Altered source versions must be plainly marked as such, and must not be
* misrepresented as being the original software.
* 3. This notice may not be removed or altered from any source distribution.
*/
package box2D.common.math;
import box2D.common.B2Settings;
import box2D.collision.B2AABB;
import haxe.Int32;
class B2Math {
	#if (neko || cpp)
	public static inline var MIN_VALUE = 2.2250738585072014e-308;
	public static inline var MAX_VALUE = 1.7976931348623158e+308;
	#else
	public static inline var MIN_VALUE = 5.0e-324;
	public static inline var MAX_VALUE = 2.0+308;
	#end
	/// This function is used to ensure that a floating point number is
	/// not a NaN or infinity.
	public function new() { }
	
	
	public static inline function complement (i : Int) : Int {
		#if neko
		return Int32.toInt(Int32.complement(Int32.ofInt(i)));
		#else 
		return ~i;
		#end
	}
	
	/// This function is used to ensure that a floating point number is
	/// not a NaN or infinity.
	public static inline function b2IsValid(x:Float) : Bool
	{
		return Math.isFinite(x);
	}
	
	/*static public function b2InvSqrt(x:Number):Number{
		union
		{
			float32 x;
			int32 i;
		} convert;
		
		convert.x = x;
		float32 xhalf = 0.5f * x;
		convert.i = 0x5f3759df - (convert.i >> 1);
		x = convert.x;
		x = x * (1.5f - xhalf * x * x);
		return x;
	}*/
	public static inline function b2Dot(a:B2Vec2, b:B2Vec2):Float
	{
		return a.x * b.x + a.y * b.y;
	}
	public static inline function b2CrossVV(a:B2Vec2, b:B2Vec2):Float
	{
		return a.x * b.y - a.y * b.x;
	}
	public static inline function b2CrossVF(a:B2Vec2, s:Float):B2Vec2
	{
		return  new B2Vec2(s * a.y, -s * a.x);
	}
	public static inline function b2CrossFV(s:Float, a:B2Vec2):B2Vec2
	{
		return  new B2Vec2(-s * a.y, s * a.x);
		
	}
	public static inline function b2MulMV(A:B2Mat22, v:B2Vec2):B2Vec2
	{
		// (tMat.col1.x * tVec.x + tMat.col2.x * tVec.y)
		// (tMat.col1.y * tVec.x + tMat.col2.y * tVec.y)
		return new B2Vec2(A.col1.x * v.x + A.col2.x * v.y, A.col1.y * v.x + A.col2.y * v.y);
		
	}
	public static inline function b2MulTMV(A:B2Mat22, v:B2Vec2):B2Vec2
	{
		// (tVec.x * tMat.col1.x + tVec.y * tMat.col1.y)
		// (tVec.x * tMat.col2.x + tVec.y * tMat.col2.y)
		return new B2Vec2(b2Dot(v, A.col1), b2Dot(v, A.col2));
		
	}
	
	public static function b2MulX(T:B2XForm, v:B2Vec2) :B2Vec2
	{
		var a:B2Vec2 = b2MulMV(T.R, v);
		a.x += T.position.x;
		a.y += T.position.y;
		//return T.position + b2Mul(T.R, v);
		return a;
	}
	public static function b2MulXT(T:B2XForm, v:B2Vec2):B2Vec2
	{
		var a:B2Vec2 = SubtractVV(v, T.position);
		//return b2MulT(T.R, v - T.position);
		var tX:Float = (a.x * T.R.col1.x + a.y * T.R.col1.y );
		a.y = (a.x * T.R.col2.x + a.y * T.R.col2.y );
		a.x = tX;
		return a;
	}
	public static inline function AddVV(a:B2Vec2, b:B2Vec2):B2Vec2
	{
		return new B2Vec2(a.x + b.x, a.y + b.y);
		
	}
	public static inline function SubtractVV(a:B2Vec2, b:B2Vec2):B2Vec2
	{
		return new B2Vec2(a.x - b.x, a.y - b.y);
		 
	}
	
	public static function b2Distance(a:B2Vec2, b:B2Vec2) : Float{
		var cX:Float = a.x-b.x;
		var cY:Float = a.y-b.y;
		return Math.sqrt(cX*cX + cY*cY);
	}
	
	public static function b2DistanceSquared(a:B2Vec2, b:B2Vec2) : Float{
		var cX:Float = a.x-b.x;
		var cY:Float = a.y-b.y;
		return (cX*cX + cY*cY);
	}
	public static inline function MulFV(s:Float, a:B2Vec2):B2Vec2
	{
		return new B2Vec2(s * a.x, s * a.y);
		
	}
	public static inline function AddMM(A:B2Mat22, B:B2Mat22):B2Mat22
	{
		return new B2Mat22(0.0, AddVV(A.col1, B.col1), AddVV(A.col2, B.col2));
		
	}
	// A * B
	public static inline function b2MulMM(A:B2Mat22, B:B2Mat22):B2Mat22
	{
		return new B2Mat22(0.0, b2MulMV(A, B.col1), b2MulMV(A, B.col2));
		
	}
	// A^T * B
	public static function b2MulTMM(A:B2Mat22, B:B2Mat22):B2Mat22
	{
		var c1:B2Vec2 = new B2Vec2(b2Dot(A.col1, B.col1), b2Dot(A.col2, B.col1));
		var c2:B2Vec2 = new B2Vec2(b2Dot(A.col1, B.col2), b2Dot(A.col2, B.col2));
		var C:B2Mat22 = new B2Mat22(0.0, c1, c2);
		return C;
	}
	public static inline function b2Abs(a:Float):Float
	{
		return a > 0.0 ? a : -a;
	}
	public static inline function b2AbsV(a:B2Vec2):B2Vec2
	{
		var b:B2Vec2 = new B2Vec2(b2Abs(a.x), b2Abs(a.y));
		return b;
	}
	public static inline function b2AbsM(A:B2Mat22):B2Mat22
	{
		return new B2Mat22(0, b2AbsV(A.col1), b2AbsV(A.col2));
		
	}
	public static inline function b2Min(a:Float, b:Float):Float
	{
		return a < b ? a : b;
	}
	public static inline function b2MinV(a:B2Vec2, b:B2Vec2):B2Vec2
	{
		return new B2Vec2(b2Min(a.x, b.x), b2Min(a.y, b.y));
		
	}
	public static inline function b2Max(a:Float, b:Float):Float
	{
		return a > b ? a : b;
	}
	public static inline function b2MaxV(a:B2Vec2, b:B2Vec2):B2Vec2
	{
		return new B2Vec2(b2Max(a.x, b.x), b2Max(a.y, b.y));
		
	}
	public static inline function b2Clamp(a:Float, low:Float, high:Float):Float
	{
		return b2Max(low, b2Min(a, high));
	}
	public static inline function b2ClampV(a:B2Vec2, low:B2Vec2, high:B2Vec2):B2Vec2
	{
		return b2MaxV(low, b2MinV(a, high));
	}
	public static inline function b2Swap(a:Array<Dynamic>, b:Array<Dynamic>) : Void
	{
		var tmp:Dynamic = a[0];
		a[0] = b[0];
		b[0] = tmp;
	}
	// b2Random number in range [-1,1];
	public static inline function b2Random():Float
	{
		return Math.random() * 2.0 - 1.0;
	}
	public static inline function b2RandomRange(lo:Float, hi:Float) : Float
	{
		var r:Float = Math.random();
		r = (hi - lo) * r + lo;
		return r;
	}
	// "Next Largest Power of 2
	// Given a binary integer value x, the next largest power of 2 can be computed by a SWAR algorithm
	// that recursively "folds" the upper bits into the lower bits. This process yields a bit vector with
	// the same most significant 1 as x, but all 1's below it. Adding 1 to that value yields the next
	// largest power of 2. For a 32-bit value:"
	public static inline function b2NextPowerOfTwo(x:Int):Int
	{
		x |= (x >> 1) & 0x7FFFFFFF;
		x |= (x >> 2) & 0x3FFFFFFF;
		x |= (x >> 4) & 0x0FFFFFFF;
		x |= (x >> 8) & 0x00FFFFFF;
		x |= (x >> 16)& 0x0000FFFF;
		return x + 1;
	}
	public static inline function b2IsPowerOfTwo(x:Int):Bool
	{
		return x > 0 && (x & (x - 1)) == 0;
	}
	
	
	// Temp vector functions to reduce calls to 'new'
	/*static public var tempVec:B2Vec2 = new B2Vec2();
	static public var tempVec2:B2Vec2 = new B2Vec2();
	static public var tempVec3:B2Vec2 = new B2Vec2();
	static public var tempVec4:B2Vec2 = new B2Vec2();
	static public var tempVec5:B2Vec2 = new B2Vec2();
	
	static public var tempMat:B2Mat22 = new B2Mat22();	
	
	static public var tempAABB:B2AABB = new B2AABB();	*/
	
	public static var b2Vec2_zero:B2Vec2 = new B2Vec2(0.0, 0.0);
	public static var b2Mat22_identity:B2Mat22 = new B2Mat22(0.0, new B2Vec2(1.0, 0.0), new B2Vec2(0.0, 1.0));
	public static var b2XForm_identity:B2XForm = new B2XForm(b2Vec2_zero, b2Mat22_identity);
	
}