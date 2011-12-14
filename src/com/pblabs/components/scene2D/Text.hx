package com.pblabs.components.scene2D;

class Text extends
	#if flash
	com.pblabs.components.scene2D.flash.SceneComponent
	#elseif js
	com.pblabs.components.scene2D.js.SceneComponent
	#end
{
	public var text (get_text, set_text) :String;
	var _text :String;
	function get_text () :String
	{
		return _text;
	}
	
	function set_text (val :String) :String
	{
		_text = val;
		#if js
		_displayObject.innerHTML = _text;
		#end
		return val;
	}
	
	public function new ()
	{
		super();
		#if js
		_displayObject = com.pblabs.components.scene2D.js.SceneComponent.createDiv();//js.Lib.document.createTextNode("text node");
		_displayObject.setAttribute("id", "TextComponent" + key);
		
		_displayObject.style.textAlign = "left";
		
		//This vertically aligns
		_displayObject.style.lineHeight = _displayObject.style.height = "100px";
		_displayObject.style.top = "50%";
		_displayObject.style.display = "inline-block";
		_displayObject.style.width = "300px";
		_displayObject.style.position = "absolute";
		_displayObject.style.marginTop = "-50px";
		
		// _displayObject.style.fontWeight = "bold";
		_displayObject.style.fontSize = "24px";
		
		_displayObject.style.fontFamily = "Verdana";
		
		
		div.appendChild(_displayObject);
		#end
	}
	
	#if js
	override public function drawPixels (ctx :CanvasRenderingContext2D)
	{
		#if (debug && modernizr)
		org.transition9.util.Assert.isTrue(Modernizr.canvastext, "Modernizr.canvastext==false");
		#end
	}
	#end
	
	override function onReset () :Void
	{
		super.onReset();
		set_text(_text);
	}

}
