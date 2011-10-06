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
// The pair manager is used by the broad-phase to quickly add/remove/find pairs
// of overlapping proxies. It is based closely on code provided by Pierre Terdiman.
// http://www.codercorner.com/IncrementalSAP.txt
package box2D.collision;

import box2D.common.B2Settings;
import box2D.common.math.B2Math;
class B2Pair
 {
	
	public function new() { 
		userData = null;
	}
	
	
	public inline function SetBuffered() : Void	{ status |= e_pairBuffered; }
	public inline function ClearBuffered() : Void	{ status &= B2Math.complement(e_pairBuffered); }
	public inline function IsBuffered():Bool	{ return (status & e_pairBuffered) == e_pairBuffered; }
	public inline function SetRemoved() : Void		{ status |= e_pairRemoved; }
	public inline function ClearRemoved() : Void	{ status &= B2Math.complement(e_pairRemoved); }
	public inline function IsRemoved():Bool		{ return (status & e_pairRemoved) == e_pairRemoved; }
	
	public inline function SetFinal() : Void		{ status |= e_pairFinal; }
	public inline function IsFinal():Bool		{ return (status & e_pairFinal) == e_pairFinal; }
	public var userData:Dynamic ;
	public var proxyId1:Int;
	public var proxyId2:Int;
	public var next:Int;
	public var status:Int;
	
	// STATIC
	public static inline var b2_nullPair:Int = B2Settings.USHRT_MAX_CONST_CONST;
	public static inline var b2_nullProxy:Int = B2Settings.USHRT_MAX_CONST_CONST;
	public static inline var b2_tableCapacity:Int = B2Settings.b2_maxPairs;	// must be a power of two
	public static var b2_tableMask:Int = b2_tableCapacity - 1;
	
	// enum
	public static inline var e_pairBuffered:Int = 0x0001;
	public static inline var e_pairRemoved:Int = 0x0002;
	public static inline var e_pairFinal:Int = 0x0004;
}