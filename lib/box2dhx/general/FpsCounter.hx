//===========================================================
//=========================================================//
//						-=ANTHEM=-
//	file: .as
//
//	copyright: Matthew Bush 2007
//
//	notes:
//
//=========================================================//
//===========================================================
//===========================================================
// FPS COUNTER CLASS
//===========================================================
package general;
import flash.display.Sprite;
import flash.Lib;
import flash.system.System;
import flash.text.TextField;
import flash.text.TextFormat;
class FpsCounter extends Sprite{
	
	//======================
	// constructor
	//======================
	public function new(){
		super();
		
		mfpsCount = 0;
		mfpsCount2 = 0;
		avgCount = 30;
		avgCount2 = 30;
		
		
		// create text field
		textBox = new TextField();
		
		
		
		
		
		textBox.text = "...";
		textBox.textColor = 0xaa1144;
		textBox.selectable = false;
		
		textBox2 = new TextField();
		
		textBox2.text = "...";
		textBox2.width = 150;
		textBox2.textColor = 0xaa1144;
		textBox2.selectable = false;
		textBox2.y = 15;
		
		textBox3 = new TextField();
		
		textBox3.text = "...";
		textBox3.textColor = 0xaa1144;
		textBox3.selectable = false;
		textBox3.y = 30;
		
		// set initial lastTime
		oldT = Lib.getTimer();
		
		addChild(textBox);
		addChild(textBox2);
		addChild(textBox3);
		
	}
	
	//======================
	// update function
	//======================
	public function update():Void {
		
		var newT = Lib.getTimer();
		var f1:Int = newT-oldT;
		mfpsCount += f1;
		if (avgCount < 1){
			textBox.text = Std.string(Math.round(1000/(mfpsCount/30))+" fps average");
			avgCount = 30;
			mfpsCount = 0;
		}
		avgCount--;
		oldT = Lib.getTimer();
		
		textBox3.text = Math.round(System.totalMemory / (1024 * 1024)) + " MB used";
		
	}
	
	
	public function updatePhys(oldT2:Int):Void {
		
		var newT:Int = Lib.getTimer();
		var f1:Int = newT-oldT2;
		mfpsCount2 += f1;
		if (avgCount2 < 1){
			textBox2.text = Std.string("Physics step: "+Math.round(mfpsCount2/30)+" ms (" +Math.round(1000/(mfpsCount2/30))+" fps)");
			avgCount2 = 30;
			mfpsCount2 = 0;
		}
		avgCount2--;
		
	}
	
	
	//======================
	// updateend function
	//======================
	public function updateEnd():Void{
		// wrong
		var newT:Int = Lib.getTimer();
		var f1:Int = newT-oldT;
		mfpsCount2 += f1;
		if (avgCount2 < 1){
			textBox2.text = cast(Math.round(1000/(mfpsCount2/30))+" fps uncapped");
			avgCount2 = 30;
			mfpsCount2 = 0;
		}
		avgCount2--;
		
	}
	
	
	//======================
	// private variables
	//======================
	private var textBox:TextField;
	private var textBox2:TextField;
	private var textBox3:TextField;
	private var mfpsCount:Int;
	private var mfpsCount2:Int;
	private var avgCount:Int;
	private var avgCount2:Int;
	private var oldT:Int;
}
// End of file
//===========================================================
//===========================================================
