/* <license>
 * This file is part of the dis-Emi-A HaXe Library. Copyright ¬© edA-qa mort-ora-y
 * For full copyright and license information please refer to doc/license.txt.
 * </license> 
 */
package mathx;

import haxe.Int32;

class Limits
{
	public static inline var int32Min = Int32.make( 0x8000, 0x0000 );
	public static inline var int32Max = Int32.make( 0x7fff, 0xffff );
	
#if neko
	public static inline var intBits = 31;
	public static inline var intMax = 1073741823;
	public static inline var intMin = -1073741824;
	
	static public function constrainInt32( a : Int32 ) : Int
	{
		//TODO: this is likely quite slow how this is done...
		if( Int32.compare( a, Int32.ofInt( intMin ) ) < 0 ) 
			return intMin;
		if( Int32.compare( a, Int32.ofInt( intMax ) ) > 0 )
			return intMax;
		
		return Int32.toNativeInt( a );
	}
	
	//behave like a 2's complement overflow/underflow
	static public function wrapInt32( a : Int32 ) : Int
	{
		if( Int32.compare( a, Int32.ofInt( intMin ) ) < 0 ) 
			a = Int32.add( Int32.sub( Int32.ofInt( intMax ), a ), Int32.ofInt( intMax ) );
			
		else if( Int32.compare( a, Int32.ofInt( intMax ) ) > 0 )
			a = Int32.add( Int32.sub( a, Int32.ofInt( intMax ) ), Int32.ofInt( intMin ) );
		
		return Int32.toNativeInt( a );
	}
	
	//do an unsigned wrap around (ignore the sign bit, assume not set)
	static public function wrapPosInt32( a : Int32 ) : Int
	{
		if( Int32.compare( a, Int32.ofInt( intMax ) ) > 0 )
			a = Int32.sub( a, Int32.ofInt( intMax ) );
		return Int32.toNativeInt( a );		
	}
#else
	public static inline var intBits = 32;
	public static inline var intMax = 2147483647;
	public static inline var intMin = -2147483648;
	
	static public inline function constrainInt32( a : Int32 ) : Int
	{
		return Int32.toNativeInt( a );
	}
	
	static public inline function wrapInt32( a : Int32 ) : Int
	{
		return Int32.toNativeInt( a );
	}
	
	static public inline function wrapPosInt32( a : Int32 ) : Int
	{
		#if cpp
		return Int32.toInt( a );
		#else
		return Int32.toNativeInt( a );
		#end
	}
#end
}
