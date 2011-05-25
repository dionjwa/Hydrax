/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.components.remoting;
#if macro
import haxe.macro.Expr;
import haxe.macro.Type;
import haxe.macro.Context;
#end

using Lambda;
using StringTools;

class Macros
{
	/**
	  * Builds all methods from implemented interfaces for a class extending 
	  * net.amago.components.remoting.AsyncProxy
	  */
	@:macro
	public static function addAsyncProxyMethods()
	{
		var pos = Context.currentPos();
		var clsType = haxe.macro.Context.getLocalClass().get();
		
		var e = function (d :ExprDef) :Expr {
			return {expr :d, pos :pos};
		}
		
		var functionRegex : EReg = ~/^[ \t]*function[ \t]*.*/;
		var interfaceFunctionExprs = [];
		
		for (d in clsType.interfaces) {
			var interfaceName = d.t.get().pack.join("/") + "/" + d.t.get().name + ".hx";
			var path = Context.resolvePath(interfaceName);
			for (line in neko.io.File.getContent(path).split("\n")) {
				if (functionRegex.match(line)) {
					var parserCompatibleLine = line.replace("Void;", "Void {}");
					var functionExpr = Context.parse(parserCompatibleLine, pos);
					switch(functionExpr.expr) {
						case EFunction(f): 
							var name = f.name;
							var functionArgsForReturnCall = new Array<String>();
							var callBackName :String = null;
							for (arg in f.args) {
								switch(arg.type) {
									case TFunction(args, ret)://Ignore the callbacks
									callBackName = arg.name;
									default: //add the rest
									functionArgsForReturnCall.push(arg.name);
								}
							}
						
							var exprStr = '_conn.resolve("' + name + '").call([' + 
								functionArgsForReturnCall.join(", ") + ']' + (callBackName != null ? ', ' + callBackName: "") + ')';
							
								var functionBlock = ExprDef.EBlock([
								haxe.macro.Context.parse(exprStr, pos)
							]);
							Reflect.setField(Reflect.field(f, "expr"), "expr", functionBlock); 
							interfaceFunctionExprs.push(functionExpr);
						default: haxe.macro.Context.warning("Should not be here", pos);
					}
				}
			}
		}
		return { expr : EBlock(interfaceFunctionExprs), pos : pos };
	}
	
}
