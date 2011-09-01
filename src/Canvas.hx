

typedef Canvas = {#if js > js.Dom.HtmlDom, #end/*>js.HTMLElement,*/
	var width : Int;
	var height : Int;
	function getContext( id : String ) : CanvasRenderingContext2D;
	//DOMString toDataURL(optional in DOMString type, in any... args);
	function toDataURL( ?mimetype : String ) : String;
}
