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
// We use contact ids to facilitate warm starting.
class Features
 {
	///< The edge that defines the outward contact normal.
	public function new() { }
	
	public var flip(getFlip, setFlip) : Int;
	public var incidentEdge(getIncidentEdge, setIncidentEdge) : Int;
	public var incidentVertex(getIncidentVertex, setIncidentVertex) : Int;
	public var referenceEdge(getReferenceEdge, setReferenceEdge) : Int;
	///< The edge that defines the outward contact normal.
	public function setReferenceEdge(value:Int):Int{
		_referenceEdge = value;
		_m_id._key = (_m_id._key & 0xffffff00) | (_referenceEdge & 0x000000ff);
		return value;
	}
	public function getReferenceEdge():Int{
		return _referenceEdge;
	}
	public var _referenceEdge:Int;
	
	///< The edge most anti-parallel to the reference edge.
	public function setIncidentEdge(value:Int):Int{
		_incidentEdge = value;
		_m_id._key = (_m_id._key & 0xffff00ff) | ((_incidentEdge << 8) & 0x0000ff00);
		return value;
	}
	public function getIncidentEdge():Int{
		return _incidentEdge;
	}
	public var _incidentEdge:Int;
	
	///< The vertex (0 or 1) on the incident edge that was clipped.
	public function setIncidentVertex(value:Int):Int{
		_incidentVertex = value;
		_m_id._key = (_m_id._key & 0xff00ffff) | ((_incidentVertex << 16) & 0x00ff0000);
		return value;
	}
	public function getIncidentVertex():Int{
		return _incidentVertex;
	}
	public var _incidentVertex:Int;
	
	///< A value of 1 indicates that the reference edge is on shape2.
	public function setFlip(value:Int):Int{
		_flip = value;
		_m_id._key = (_m_id._key & 0x00ffffff) | ((_flip << 24) & 0xff000000);
		return value;
	}
	public function getFlip():Int{
		return _flip;
	}
	public var _flip:Int;
	
	
	public var _m_id:B2ContactID;
}