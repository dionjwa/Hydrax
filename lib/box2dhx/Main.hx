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
package;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;
import general.FpsCounter;
import general.FRateLimiter;
import general.Input;


import testBed.Test;
import testBed.TestBridge;
import testBed.TestCCD;
import testBed.TestCompound;
import testBed.TestCrankGearsPulley;
import testBed.TestRagdoll;
import testBed.TestStack;
import testBed.TestTheoJansen;

class Main extends MovieClip
{
	
	
	public function new()
	{
		super();
		
		Lib.current.addChild(this);
		m_currId = 0;
		
		
		addEventListener(Event.ENTER_FRAME, update, false, 0, true);
		
		m_fpsCounter.x = 7;
		m_fpsCounter.y = 5;
		
		
		m_sprite = new Sprite();
		addChild(m_sprite);
		
		
		// input
		m_input = new Input(m_sprite);
		
		
		
		//Instructions Text
		var instructions_text:TextField = new TextField();
		
		
		
		var instructions_text_format:TextFormat = new TextFormat("Arial", 16, 0xffffff, false, false, false);
		instructions_text_format.align = TextFormatAlign.RIGHT;
		
		instructions_text.defaultTextFormat = instructions_text_format;
		instructions_text.x = 140;
		instructions_text.y = 4;
		instructions_text.width = 495;
		instructions_text.height = 61;
		instructions_text.text = "Box2DFlashAS3 2.0.1\n'Left'/'Right' arrows to go to previous/next example. \n'R' to reset.";
		addChild(instructions_text);
		
		// textfield pointer
		m_aboutText = new TextField();
		var m_aboutTextFormat:TextFormat = new TextFormat("Arial", 16, 0x00CCFF, true, false, false);
		m_aboutTextFormat.align = TextFormatAlign.RIGHT;
		m_aboutText.defaultTextFormat = m_aboutTextFormat;
		m_aboutText.x = 334;
		m_aboutText.y = 71;
		m_aboutText.width = 300;
		m_aboutText.height = 30;
		addChild(m_aboutText);
		addChild(m_fpsCounter);
		// Thanks to everyone who contacted me about this fix
		instructions_text.mouseEnabled = false;
		m_aboutText.mouseEnabled = false;
		
		
		
	}
	
	public function update(e:Event):Void{
		// clear for rendering
		m_sprite.graphics.clear();
		
		// toggle between tests
		if (Input.isKeyPressed(#if flash 39 #else 38  #end)){ // Right Arrow
			m_currId++;
			m_currTest = null;
		}
		else if (Input.isKeyPressed(37)){ // Left Arrow
			m_currId--;
			m_currTest = null;
		}
		// Reset
		else if (Input.isKeyPressed(82)){ // R
			m_currTest = null;
		}
		
		// if null, set new test
		if (m_currTest == null){
			switch(m_currId){
				// Ragdoll
				case 0:
					
					m_currTest = new TestRagdoll();
				// Compound Shapes
				case 1:
					m_currTest = new TestCompound();
					
				// Crank/Gears/Pulley
				case 2:
					m_currTest = new TestCrankGearsPulley();
					
				// Bridge
				case 3:
					m_currTest = new TestBridge();
					
				// Stack
				case 4:
					m_currTest = new TestStack();
					
				// CCD
				case 5:
					m_currTest = new TestCCD();
					
				// Theo Jansen
				case 6:
					m_currTest = new TestTheoJansen();
					
				// Wrap around
				default:
				{
					if (m_currId < 0){
						m_currId = 6;
						m_currTest = new TestTheoJansen();
					}
					else{
						m_currId = 0;
						
						m_currTest = new TestRagdoll();
					}
				}
					
			}
		}
		
		// update current test
		m_currTest.Update();
		
		// Update input (last)
		Input.update();
		
		// update counter and limit framerate
		m_fpsCounter.update();
		//FRateLimiter.limitFrame(31);
		
	}
	
	public static function main ()
	{
		#if (cpp || neko)
		neash.Lib.Init("box2D", 640, 360);
		neash.Lib.SetBackgroundColour(0x414647);
		neash.Lib.SetFrameRate(1000);
		
		#end
		
		m_fpsCounter = new FpsCounter();
		new Main();	
		
		#if (cpp || neko)
		neash.Lib.Run();
		#end
	}
	
	//======================
	// Member data
	//======================
	static public var m_fpsCounter:FpsCounter;
	
	
	public var m_currId:Int;
	public var m_currTest:Test;
	static public var m_sprite:Sprite;
	static public var m_aboutText:TextField;
	// input
	public var m_input:Input;
}
