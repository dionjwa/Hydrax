/* <license>
 * This file is part of the dis-Emi-A HaXe Library. Copyright © edA-qa mort-ora-y
 * For full copyright and license information please refer to doc/license.txt.
 * </license> 
 */
package mathx;interface RandomGenerator
{
	public function nextBool() :Bool;
	
	/**
	 * Produces the next floating point value in the range [0,1] (both ends inclusive)
	 */
	public function nextFloat() : Float;
	
	/**
	 * Produces the next random Int in the full range of Int.  This includes negative
	 * numbers, unlike nextFloat.  All bits of the integer are assumed equally random.
	 */
	public function nextInt(?max :Int = 0) : Int;
	
	/**
	 * Allows reseeding of the generator. As not all generators support this an exception
	 * may be thrown.
	 */
	public function setSeed( seed : Int ) : Void;
}
