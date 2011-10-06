//===========================================================
//=========================================================//
//						-=ANTHEM=-
//	file: frameLimiter.as
//
//	copyright: Matthew Bush 2007
//
//	notes: limits framerate
//
//=========================================================//
//===========================================================
//===========================================================
// frame limiter
//===========================================================
package general;
import flash.Lib;
	
class FRateLimiter{
	
	
	//======================
	// limit frame function
	//======================
	static public function limitFrame(maxFPS:Int):Void{
		
		var fTime = Std.int(1000 / maxFPS);
		
		while(Math.abs(newT - oldT) < fTime){
			newT = flash.Lib.getTimer();
		}
		oldT = flash.Lib.getTimer();
		
	}
	
	//======================
	// member vars
	//======================
	private static var oldT:Int = Lib.getTimer();
	private static var newT:Int = oldT;
}
