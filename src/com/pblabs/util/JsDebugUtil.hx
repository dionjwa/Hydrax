package com.pblabs.util;

import com.pblabs.util.svg.SvgData;

import js.Dom;

/**
  * Js specific debugging/testing utilities
  */
class JsDebugUtil
{

	public static function insertIntoDebugDiv (element :HtmlDom) :Void
	{
		var debugElement = js.Lib.document.getElementById("debug");
		com.pblabs.util.Assert.isNotNull(debugElement, ' debugElement is null');
		var div :HtmlDom = cast js.Lib.document.createElement("div");
		debugElement.appendChild(div);
		div.appendChild(element);
	}
	
	public static function insertSvgIntoDebugDiv (svg :SvgData) :Void
	{
		var svgdiv :js.Dom.HtmlDom = cast js.Lib.document.createElement("div");
		svgdiv.innerHTML = svg.data;
		insertIntoDebugDiv(svgdiv);
	}
	
	/** Traces to the console, as well as the haxe js trace div */
	public static function traceToConsole (?alsoToDiv :Bool = true) :Void
	{
		if (alsoToDiv) {
			var currentTrace = haxe.Log.trace;
			haxe.Log.trace = function (v :Dynamic, ?i :haxe.PosInfos) {
				currentTrace(v, i);
				untyped {
					var msg = if( i != null ) i.fileName+":"+i.lineNumber+": " else "";
					msg += __string_rec(v,"");
					untyped console.log(msg);
				}
			}
		} else {
			haxe.Log.trace = function (v :Dynamic, ?i :haxe.PosInfos) {
				untyped {
					var msg = if( i != null ) i.fileName+":"+i.lineNumber+": " else "";
					msg += __string_rec(v,"");
					untyped console.log(msg);
				}
			}
		}
	}
	
	
	/** Copied from js.Boot */
	private static function __string_rec(o,s) {
		untyped {
			if( o == null )
			    return "null";
			if( s.length >= 5 )
				return "<...>"; // too much deep recursion
			var t = __js__("typeof(o)");
			if( t == "function" && (o.__name__ != null || o.__ename__ != null) )
				t = "object";
			switch( t ) {
			case "object":
				if( __js__("o instanceof Array") ) {
					if( o.__enum__ != null ) {
						if( o.length == 2 )
							return o[0];
						var str = o[0]+"(";
						s += "\t";
						for( i in 2...o.length ) {
							if( i != 2 )
								str += "," + __string_rec(o[i],s);
							else
								str += __string_rec(o[i],s);
						}
						return str + ")";
					}
					var l = o.length;
					var i;
					var str = "[";
					s += "\t";
					for( i in 0...l )
						str += (if (i > 0) "," else "")+__string_rec(o[i],s);
					str += "]";
					return str;
				}
				var tostr;
				try {
					tostr = untyped o.toString;
				} catch( e : Dynamic ) {
					// strange error on IE
					return "???";
				}
				if( tostr != null && tostr != __js__("Object.toString") ) {
					var s2 = o.toString();
					if( s2 != "[object Object]")
						return s2;
				}
				var k : String = null;
				var str = "{\n";
				s += "\t";
				var hasp = (o.hasOwnProperty != null);
				__js__("for( var k in o ) { ");
					if( hasp && !o.hasOwnProperty(k) )
						__js__("continue");
					if( k == "prototype" || k == "__class__" || k == "__super__" || k == "__interfaces__" )
						__js__("continue");
					if( str.length != 2 )
						str += ", \n";
					str += s + k + " : "+__string_rec(o[k],s);
				__js__("}");
				s = s.substring(1);
				str += "\n" + s + "}";
				return str;
			case "function":
				return "<function>";
			case "string":
				return o;
			default:
				return String(o);
			}
		}
	}
}
