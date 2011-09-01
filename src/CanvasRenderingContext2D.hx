
typedef CanvasRenderingContext2D = {
	
	// back-reference to the canvas
	var canvas(default,null) : Canvas;
	
	// state
  	function save() : Void;
  	function restore() : Void;
  	
	// transformations (default transform is the identity matrix)
	function scale( x : Float, y : Float ) : Void;
	function rotate( angle : Float ) : Void;
	function translate( x : Float, y : Float ) : Void;
	function transform( m11 : Float, m12 : Float, m21 : Float, m22 : Float, dx : Float, dy : Float ) : Void;
	function setTransform( m11 : Float, m12 : Float, m21 : Float, m22 : Float, dx : Float, dy : Float ) : Void;
	function rect( x : Float, y : Float, width : Float, height : Float ) : Void;
	
	// compositing
	var globalAlpha : Float;
	var globalCompositeOperation : String;
	
	// colors and styles
	var strokeStyle : Dynamic;
	var fillStyle : Dynamic;
	function createLinearGradient( x0 : Float, y0 : Float, r0 : Float, x1 : Float, y1 : Float ) : CanvasGradient;
	function createRadialGradient( x0 : Float, y0 : Float, r0 : Float, x1 : Float, y1 : Float, r1 : Float ) : CanvasGradient;
	function createPattern( image : Image, repetition : String ) : Void;
	//function createPattern( image : HTMLCanvasElement, repetition : String ) : Void;
	//function createPattern( image : HTMLVideoElement, repetition : String ) : Void;
	
	// line caps/joins
	var lineWidth : Float;
	var lineCap : String;
	var lineJoin : String;
	var miterLimit : Float;
	
	// shadows
	var shadowOffsetX : Float;
	var shadowOffsetY : Float;
	var shadowBlur : Float;
	var shadowColor : String;
	
	// rects
	function clearRect( x : Int, y : Int, w : Int, h : Int ) : Void;
	function fillRect( x : Int, y : Int, w : Int, h : Int ) : Void;
	function strokeRect( x : Int, y : Int, w : Int, h : Int ) : Void;
		
	// path API
	function beginPath() : Void;
	function closePath() : Void;
	function moveTo( x : Float, y : Float ) : Void;
	function lineTo( x : Float, y : Float ) : Void;
	function quadraticCurveTo( cpx : Float, cpy : Float, x : Float, y : Float ) : Void;
	function bezierCurveTo( cp1x : Float, cp1y : Float, cp2x : Float, cp2y : Float, x : Float, y : Float ) : Void;
	function arcTo( x1 : Float, y1 : Float, x2 : Float, y2 : Float, radius : Float ) : Void;
	function arc( x : Float, y : Float, radius : Float, startAngle : Float, endAngle : Float, anticlockwise : Bool ) : Void;
	function fill() : Void;
	function stroke() : Void;
	function clip() : Void;
	function isPointInPath( x : Float, y : Float ) : Bool;
	
	// text
	var font : String;
	var textAlign : String; // "start", "end", "left", "right", "center" (default: "start")
	var textBaseline : String; // "top", "hanging", "middle", "alphabetic", "ideographic", "bottom" (default: "alphabetic")
	function fillText( text : String, x : Float, y : Float, ?maxWidth : Float ) : Void;
	function strokeText( text : String, x : Float, y : Float, ?maxWidth : Float ) : Void;
	// function measureText( text : String ) : TextMetrics; 

	// drawing images
  	//function drawImage( image : Image, dx : Float, dy : Float, ?dw : Float, ?dh : Float ) : Bool;
	//function drawImage( image : { width : Float, height : Float }, sx : Float, sy : Float, sw : Float, sh : Float, dx : Float, dy : Float, dw : Float, dh : Float ) : Bool;
	#if haxedev
	@:overload(function(image : Canvas, sx : Float, sy : Float, ?sw : Float, ?sh : Float, ?dx : Float, ?dy : Float, ?dw : Float, ?dh : Float ) : Bool {})
	#end
	function drawImage( image : Image, sx : Float, sy : Float, ?sw : Float, ?sh : Float, ?dx : Float, ?dy : Float, ?dw : Float, ?dh : Float ) : Bool;
	
	
	//function drawImage( image : Image );
	
	// pixel manipulation
	function createImageData( sw : Float, sh : Float ) : Void;
	function getImageData( sx : Float, sx : Float, sw : Float, sh : Float ) : ImageData;
	function putImageData( imagedata : ImageData, dx : Float, dy : Float, ?dirtyX : Float, ?dirtyY : Float, ?dirtyWidth : Float, ?dirtyHeight : Float ) : Void;

}
