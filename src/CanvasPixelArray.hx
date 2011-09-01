
/*
typedef CanvasPixelArray = {
	var length : Int;
	function getter( index : Int ) : Dynamic;
	function setter( index : Int, value : Dynamic ) : Void;
}
*/
extern class CanvasPixelArray implements ArrayAccess<Dynamic> {
	var length : Int;
	function new() : Void {}
}
