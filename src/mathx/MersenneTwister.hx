/* <license>
 * This file is part of the dis-Emi-A HaXe Library. Copyright © edA-qa mort-ora-y
 * For full copyright and license information please refer to doc/license.txt.
 * </license> 
 */
package mathx;

import haxe.Int32;

/**
 * Based on the MT19937 as described at:
 * 	http://en.wikipedia.org/wiki/Mersenne_twister
 * And in the original paper.
 */ 
class MersenneTwister implements RandomGenerator
{
	// Create a length 624 array to store the state of the generator
	var mt : Array<Int32>;	//int[0..623] MT
	var index : Int;

	//static inline var _W = 32;	//we only have 32-bits, can't be anything else (could be lower, see _W)
	
	static inline var _N = 624;
	static inline var _M = 397;
	
	static inline var MATRIX_A = Int32.make( 0x9908, 0xb0df );
 	static inline var SHIFT_U = 11;
	static inline var SHIFT_S = 7;
	static inline var MASK_B = Int32.make( 0x9d2c, 0x5680 );
	static inline var SHIFT_T = 15;
	static inline var MASK_C = Int32.make( 0xefc6, 0x0000 );
	static inline var SHIFT_L = 18;
	
	static inline var UPPER_MASK = Int32.make( 0x8000, 0x0000 );
	static inline var LOWER_MASK =  Int32.make( 0x7fff, 0xffff );
	
 	public function new(?seed :Int = 0) 
 	{
 		if (seed == 0) seed = Math.floor(Date.now().getTime());
 		mt = new Array<Int32>();
		setSeed( seed );
 	}
 	
	// Initialize the generator from a seed
	public function setSeed( seed : Int ) 
	{
		mt[0] = Int32.ofInt( seed );
		for( i in 1..._N )
		{ // loop over each other element
			//this differs from the original form, using Knuth's generator here, I can't identify
			//the source of this one (other than on wikipedia)
			//last 32 (_W) bits of(1812433253 * (MT[i-1] xor (right shift by 30 bits(MT[i-1]))) + i) // 0x6c078965
			mt[i] = Int32.add( uintMul( Int32.make( 0x6c07, 0x8965 ), Int32.xor( mt[i-1], ( Int32.ushr( mt[i-1], 30) ) ) ), Int32.ofInt( i ) );
		}
		index = 0;
	}
 
	// Extract a tempered pseudorandom number based on the index-th value,
	// calling generateNumbers() every 624 numbers
	public function extractNumber() 
	{
		if( index == 0 )
			generateNumbers();
	 
		var y = mt[index];
		//TEMPERING_
		y = Int32.xor( y, Int32.ushr( y, SHIFT_U ) );
		y = Int32.xor( y, Int32.and( Int32.shl( y, SHIFT_S ), MASK_B ) );
		y = Int32.xor( y, Int32.and( Int32.shl( y, SHIFT_T ), MASK_C ) );
		y = Int32.xor( y, Int32.ushr( y, SHIFT_L ) );
	 
		index = (index + 1) % _N;
		return y;
	}
 
	// Generate an array of 624 untempered numbers
	function generateNumbers() {
		for( i in 0..._N )
		{
			var y = Int32.add( 
				Int32.and( mt[i], UPPER_MASK ), 
				Int32.and( mt[ (i+1) % _N ], LOWER_MASK )
				);
			mt[i] = Int32.xor( mt[(i+_M) % _N], Int32.ushr( y, 1 ) );
			
			// ^ mag01[ y & 0x1 ]
			if( Int32.toNativeInt( Int32.and( y, Int32.ofInt( 0x1 ) ) ) == 1 ) // y is odd
				mt[i] = Int32.xor( mt[i], MATRIX_A );
		}
	}	
	
	/**
	 * Public only for test cases
	 * Ref: http://www.cs.uaf.edu/~cs301/notes/Chapter5/node5.html
	 */
	public function uintMul( a : Int32, b : Int32 )
	{
		//FEATURE: could we probably just use normal ints after this initial transformation?
		var A = Int32.ushr( a, 16 );
		var B = Int32.and( a, Int32.ofInt( 0xffff ) );
		var C = Int32.ushr( b, 16 );
		var D = Int32.and( b, Int32.ofInt( 0xffff ) );
		
		var BD = Int32.mul( B, D );
		var AD = Int32.mul( A, D );
		var CB = Int32.mul( C, B );
		//we have no place to store the AC so we don't calculate that part
		
		var hi = Int32.add( Int32.add( Int32.ushr( BD, 16 ), AD ), CB );
		var lo = Int32.and( BD, Int32.ofInt( 0xffff ) );
		
		return Int32.add( lo, Int32.shl( hi, 16 ) );
	}
	
	public function nextFloat() : Float
	{	
		return nextInt() / Limits.intMax;
	}
	
	public function nextInt(?max :Int = 0) : Int
	{
		if (max < 0)
			throw "n must be positive";
			
		//use wrap not constrain, since contrain would bias the numbers to max/min
		var n = extractNumber();
		n = Int32.and( n, Int32.make( 0x7fff, 0xffff ) );	//strip sign bit
		
		if (max == 0) {
			return Limits.wrapPosInt32( n );
		} else {
			return Limits.wrapPosInt32( n ) % max;
		}
	}
	
	public function nextBool () :Bool
	{
		return nextInt() > Limits.intMax / 2;
	}
	
	public function reseed( seed : Int ) : Void
	{
		setSeed( seed );
	}
}
