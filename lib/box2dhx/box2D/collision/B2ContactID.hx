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
package box2D.collision;
	
import box2D.collision.Features;
import haxe.Int32;
typedef I32 = haxe.Int32;

using haxe.Int32;
// We use contact ids to facilitate warm starting.
class B2ContactID
 {
	
	public var key(getKey, setKey) :Int;
	public function new(){
		_key = 0;
		features = new Features();
		features._m_id = this;
		
	}
	public function Set(id:B2ContactID) : Void{
		key = id._key;
	}
	public function Copy():B2ContactID{
		var id:B2ContactID = new B2ContactID();
		id.key = key;
		return id;
	}
	public function getKey():Int{
		return _key;
	}
	public function setKey(value:Int):Int{
		_key = value;
		/*
		#if neko
		features._referenceEdge = I32.toInt(
						I32.and(
								I32.ofInt(_key), 
									I32.make(0x0000, 0x00ff)));
		features._incidentEdge = I32.toInt(I32.and((I32.shr(I32.and(I32.ofInt(_key), I32.make(0x0000, 0xff00)),8)),I32.make(0x0000, 0x00ff)));
		features._incidentVertex = _key.ofInt().and(0x00ff.make(0x0000)).shr(16).and(I32.make(0x0000, 0x00ff)).toInt();
		features._flip = (_key.ofInt().and(0xff00.make(0000)).shr(24)).and(I32.make(0x0000, 0x00ff)).toInt();
		#else*/
		features._referenceEdge = _key & 0x000000ff;
		features._incidentEdge = ((_key & 0x0000ff00) >> 8) & 0x000000ff;
		features._incidentVertex = ((_key & 0x00ff0000) >> 16) & 0x000000ff;
		features._flip = ((_key & 0xff000000) >> 24) & 0x000000ff;
		//#end
		return value;
	}
	public var features:Features ;
	public var _key:Int;///< Used to quickly compare contact ids.
}