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
package box2D.dynamics;


import box2D.common.math.B2Math;
import box2D.common.math.B2Vec2;
import box2D.common.B2Color;
import box2D.common.math.B2XForm;


import flash.display.Sprite;
/// Implement and register this class with a b2World to provide debug drawing of physics
/// entities in your game.
class B2DebugDraw
 {

	public var m_drawFlags:Int;
	public var m_sprite:Sprite;
	public var m_drawScale:Float ;
	
	public var m_lineThickness:Float ;
	public var m_alpha:Float ;
	public var m_fillAlpha:Float ;
	public var m_xformScale:Float ;
	
	public function new(){
		m_drawScale = 1.0;
	
		m_lineThickness = 1.0;
		m_alpha = 1.0;
		m_fillAlpha = 1.0;
		m_xformScale = 1.0;
		m_drawFlags = 0;
	}
	// ~B2DebugDraw() {}
	//enum
	//{
		public static inline var e_shapeBit:Int 		= 0x0001; ///< draw shapes
		public static inline var e_jointBit:Int			= 0x0002; ///< draw joint connections
		public static inline var e_coreShapeBit:Int		= 0x0004; ///< draw core (TOI) shapes
		public static inline var e_aabbBit:Int			= 0x0008; ///< draw axis aligned bounding boxes
		public static inline var e_obbBit:Int			= 0x0010; ///< draw oriented bounding boxes
		public static inline var e_pairBit:Int			= 0x0020; ///< draw broad-phase pairs
		public static inline var e_centerOfMassBit:Int	= 0x0040; ///< draw center of mass frame
	//}
	/// Set the drawing flags.
	public function SetFlags(flags:Int) : Void{
		m_drawFlags = flags;
	}
	/// Get the drawing flags.
	public function GetFlags() :Int{
		return m_drawFlags;
	}
	
	/// Append flags to the current flags.
	public function AppendFlags(flags:Int) : Void{
		m_drawFlags |= flags;
	}
	/// Clear flags from the current flags.
	public function ClearFlags(flags:Int) : Void{
		m_drawFlags &= B2Math.complement(flags);
	}
	/// Draw a closed polygon provided in CCW order.
	public  function DrawPolygon(vertices:Array<B2Vec2>, vertexCount:Int, color:B2Color) : Void{
		
		m_sprite.graphics.lineStyle(m_lineThickness, color.color, m_alpha);
		m_sprite.graphics.moveTo(vertices[0].x * m_drawScale, vertices[0].y * m_drawScale);
		for (i in 1...vertexCount)
		{
				m_sprite.graphics.lineTo(vertices[i].x * m_drawScale, vertices[i].y * m_drawScale);
		}
		m_sprite.graphics.lineTo(vertices[0].x * m_drawScale, vertices[0].y * m_drawScale);
		
	}
	/// Draw a solid closed polygon provided in CCW order.
	public  function DrawSolidPolygon(vertices:Array<B2Vec2>, vertexCount:Int, color:B2Color) : Void{
		
		m_sprite.graphics.lineStyle(m_lineThickness, color.color, m_alpha);
		m_sprite.graphics.moveTo(vertices[0].x * m_drawScale, vertices[0].y * m_drawScale);
		m_sprite.graphics.beginFill(color.color, m_fillAlpha);
		for (i in 1...vertexCount)
		{
				m_sprite.graphics.lineTo(vertices[i].x * m_drawScale, vertices[i].y * m_drawScale);
		}
		m_sprite.graphics.lineTo(vertices[0].x * m_drawScale, vertices[0].y * m_drawScale);
		m_sprite.graphics.endFill();
		
	}
	/// Draw a circle.
	public  function DrawCircle(center:B2Vec2, radius:Float, color:B2Color) : Void{
		
		m_sprite.graphics.lineStyle(m_lineThickness, color.color, m_alpha);
		m_sprite.graphics.drawCircle(center.x * m_drawScale, center.y * m_drawScale, radius * m_drawScale);
		
	}
	
	/// Draw a solid circle.
	public  function DrawSolidCircle(center:B2Vec2, radius:Float, axis:B2Vec2, color:B2Color) : Void{
		
		m_sprite.graphics.lineStyle(m_lineThickness, color.color, m_alpha);
		m_sprite.graphics.moveTo(0,0);
		m_sprite.graphics.beginFill(color.color, m_fillAlpha);
		m_sprite.graphics.drawCircle(center.x * m_drawScale, center.y * m_drawScale, radius * m_drawScale);
		m_sprite.graphics.endFill();
		m_sprite.graphics.moveTo(center.x * m_drawScale, center.y * m_drawScale);
		m_sprite.graphics.lineTo((center.x + axis.x*radius) * m_drawScale, (center.y + axis.y*radius) * m_drawScale);
		
	}
	
	/// Draw a line segment.
	public  function DrawSegment(p1:B2Vec2, p2:B2Vec2, color:B2Color) : Void{
		
		m_sprite.graphics.lineStyle(m_lineThickness, color.color, m_alpha);
		m_sprite.graphics.moveTo(p1.x * m_drawScale, p1.y * m_drawScale);
		m_sprite.graphics.lineTo(p2.x * m_drawScale, p2.y * m_drawScale);
		
	}
	/// Draw a transform. Choose your own length scale.
	/// @param xf a transform.
	public  function DrawXForm(xf:B2XForm) : Void{
		
		m_sprite.graphics.lineStyle(m_lineThickness, 0xff0000, m_alpha);
		m_sprite.graphics.moveTo(xf.position.x * m_drawScale, xf.position.y * m_drawScale);
		m_sprite.graphics.lineTo((xf.position.x + m_xformScale*xf.R.col1.x) * m_drawScale, (xf.position.y + m_xformScale*xf.R.col1.y) * m_drawScale);
		
		m_sprite.graphics.lineStyle(m_lineThickness, 0x00ff00, m_alpha);
		m_sprite.graphics.moveTo(xf.position.x * m_drawScale, xf.position.y * m_drawScale);
		m_sprite.graphics.lineTo((xf.position.x + m_xformScale*xf.R.col2.x) * m_drawScale, (xf.position.y + m_xformScale*xf.R.col2.y) * m_drawScale);
		
	}
	

	
}