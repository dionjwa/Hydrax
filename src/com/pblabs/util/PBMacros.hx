/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.util;
#if macro
import haxe.macro.Expr;
#end

class PBMacros
{
	/**
	  * Returns the name of the field variable instance.
	  *
	  * E.g. public static var Foo :String = PBMacros.getFieldName();
	  * Foo == "Foo"
	  * 
	  * Careful: the PBMacros.getFieldName() MUST be on the same 
	  * line as the var declaration!
	  */
	@:macro public static function getFieldName() {
		var pos = haxe.macro.Context.currentPos();
		
		var posRegex : EReg = ~/^[ \t]*#pos\(([_0-9a-zA-Z\/\.]+\.hx):([0-9]+).*/;
		posRegex.match("" + pos);
		var fileName = posRegex.matched(1);
		var line = Std.parseInt(posRegex.matched(2)) - 1;
		
		var varNameRegex : EReg = ~/^[ \t]*((public|static|private)[ \t]+)*var[ \t]+([_a-zA-Z]+[_a-zA-Z0-9]*)[ \t:]+.*+/;

		var str = neko.io.File.getContent(fileName).split("\n")[line];
		varNameRegex.match(str);
		var varName = varNameRegex.matched(3);
		return { expr :EConst(CString(varName)), pos : pos };
	}
	
	/**
	  * Inserts a profiler statement into the code, if the profiler compiler flag is set
	//   */
	// @:macro public static function profilerEnter(label :Expr) {
		
	//	 ExprDef.ECall(ExprDef() ,[CString(label)]);
	//	 #if profiler
	//	 return { expr :EConst(CString(varName)), pos : pos };
	//	 #else
	//	 return { expr :null, pos : pos };
	//	 #end
		
	// }

}
