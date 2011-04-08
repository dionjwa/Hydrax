/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This source file was derived from the actionscript Flashbang library.
 * A copy of the LGPL license is located at the root of the SDK.
 *
 * The original file source header (required by the LGPL license):
 *
 * Flashbang - a framework for creating Flash games
 * Copyright (C) 2008-2010 Three Rings Design, Inc., All Rights Reserved
 * http://code.google.com/p/flashbang/
 * 
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
 */
package com.pblabs.util;
import com.pblabs.util.ArrayUtil;

import mathx.MersenneTwister;
import mathx.RandomGenerator;

class Rand
{
	public function new() { }
	
	inline public static var STREAM_GAME :Int = 0;
	inline public static var STREAM_COSMETIC :Int = 1;

	/** The compiler doesn't like constant defined function default arguments */
	inline public static var STREAM_UNSPECIFIED :Int = 0xffffffff;//==MathUtil.UINT32_MAX;

	/**
	 * Set to true to have an error thrown if the streamId parameter is not specified for any of the
	 * functions that take it. Useful for applications that must take care to keep their random
	 * streams in sync.
	 */
	public static var errorOnUnspecifiedStreamId :Bool = false;

	/** Adds a new random stream, and returns its streamId. */
	public static function addStream (?seed :Int = 0) :Int
	{
		_randStreams.push(new MersenneTwister(seed));
		return (_randStreams.length - 1);
	}

	/** Returns the Random object associated with the given streamId. */
	public static function getStream (?streamId :Int = 0xffffffff) :MersenneTwister
	{
		if (streamId == STREAM_UNSPECIFIED) {
			if (errorOnUnspecifiedStreamId) {
				throw "streamId must be specified";
			} else {
				streamId = 0;
			}
		}

		return _randStreams[streamId];
	}

	/** Sets a new seed for the given stream. */
	public static function seedStream (streamId :Int, seed :Int) :Void
	{
		getStream(streamId).setSeed(seed);
	}

	/** Returns a random element from the given Array. */
	public static function nextElement <T> (arr :Array<T>, ?streamId :Int = 0xffffffff) :T
	{
		return (arr.length > 0 ? arr[nextIntInRange(0, arr.length - 1, streamId)] :null);
	}

	/** Returns an integer in the range [0, MAX) */
	public static function nextInt (?streamId :Int = 0xffffffff) :Int
	{
		return getStream(streamId).nextInt();
	}

	/** Returns an int in the range [min, max] */
	public static function nextIntInRange (min :Int, max :Int, ?streamId :Int = 0xffffffff) :Int
	{
		// return min + getStream(streamId).nextInt() % (max - min + 1);
		return min + getStream(streamId).nextInt(max - min + 1);
	}

	/** Returns a Boolean. */
	public static function nextBoolean (?streamId :Int = 0xffffffff) :Bool
	{
		return getStream(streamId).nextBool();
	}

	/**
	 * Returns true (chance * 100)% of the time.
	 * @param chance a number in the range [0, 1)
	 */
	public static function nextChance (chance :Float, ?streamId :Int = 0xffffffff) :Bool
	{
		return nextFloat(streamId) < chance;
	}

	/** Returns a Number in the range [0.0, 1.0) */
	public static function nextFloat (?streamId :Int = 0xffffffff) :Float
	{
		return getStream(streamId).nextFloat();
	}

	/** Returns a Number in the range [low, high) */
	public static function nextFloatInRange (low :Float, high :Float, ?streamId :Int = 0xffffffff) :Float
	{
		return low + (getStream(streamId).nextFloat() * (high - low));
	}

	/** Randomizes the order of the elements in the given Array, in place. */
	public static function shuffleArray (arr :Array<Dynamic>, ?streamId :Int = 0xffffffff) :Void
	{
		ArrayUtil.shuffle(arr, getStream(streamId));
	}
	
	/** Returns a float that has a 50% change of haivng it's sign shuffled */
	public static function nextSign (val :Float, ?streamId :Int = 0xffffffff) :Float
	{
		return getStream(streamId).nextBool() ? val : val * -1;
	}

	// We always have the STREAM_GAME and STREAM_COSMETIC streams
	static var _randStreams :Array<MersenneTwister> = [ new MersenneTwister(), new MersenneTwister() ];
}
