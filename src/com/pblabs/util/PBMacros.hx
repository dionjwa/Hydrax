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
	
	@:macro public static function getDate() 
	{
		var date = Date.now().toString();
		var pos = haxe.macro.Context.currentPos();
		return { expr : EConst(CString(date)), pos : pos };
	}
	 
	 
	/**
	  * Returns the name of the field variable instance.
	  *
	  * E.g. public static var Foo :String = PBMacros.getFieldName();
	  * Foo == "Foo"
	  * 
	  * Careful: the PBMacros.getFieldName() MUST be on the same 
	  * line as the var declaration!
	  */
	@:macro 
	public static function getFieldName() {
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
	  * Adds all the instance and class fields to an Enumerable class.
	  */
	@:macro 
	public static function buildEnumerableFromEmbeddedXML() 
	{
		var pos = haxe.macro.Context.currentPos();
		
		var p = function (d :ExprDef) :Expr {
			return {expr :d, pos :pos};
		}
		
		var className = haxe.macro.Context.getLocalClass().toString();
		var enumClassType :haxe.macro.Type = haxe.macro.Context.getType(className);
		var clsType = haxe.macro.Context.getLocalClass().get(); 
		
		var tString = TPath({ pack : [], name : "String", params : [], sub : null });
		var tFloat = TPath({ pack : [], name : "Float", params : [], sub : null });
		var tData = TPath({ pack : clsType.pack, name : clsType.name, params : [], sub : null });
		
		var fields = [];
		
		var data = haxe.Resource.getString(className);
		var root = Xml.parse(data).firstChild();
		
		var doneInstanceFields = false;
		for (childXML in root) {
			if (childXML.nodeType == Xml.Element) {
				var typePath = {sub :null, params :[], pack :clsType.pack, name :clsType.name};
				var contructorArgs = new Array<Expr>();
				
				//enum name to pass to the contructor
				contructorArgs.push(p(EConst(haxe.macro.Constant.CString(childXML.nodeName))));
				var newexpr = p(ENew(typePath, contructorArgs));
				var evar  = { name : "public__static__" + childXML.nodeName, type : tData, expr : newexpr};
				fields.push(p(EVars([evar])));
				
				//Instance fields
				if (!doneInstanceFields) {
					for (fieldChild in childXML) {
						if (fieldChild.nodeType != Xml.Element) {
							continue;
						}
						//If there is a type specified as an attribute of the parent, use that, otherwise default to float
						var type = tFloat;
						if (root.exists(fieldChild.nodeName)) {
							var pack = root.get(fieldChild.nodeName).split(".");
							var name = pack.pop();
							type = TPath({ pack : pack, name : name, params : [], sub : null });
						}
						
						var instanceFieldExpr = { name : "public__" + fieldChild.nodeName, type : type, expr : null};
						fields.push(p(EVars([instanceFieldExpr])));
					}
					doneInstanceFields = true;
				}
			}
		}
		
		return { expr : EBlock(fields), pos : pos };
	}
	
	/**
	  * Builds the corresponding enum for Enumerables that use enums
	  */
	@:macro 
	public static function buildEnumerableEnumFromEmbeddedXML(classNameExpr : Expr) 
	{
		var pos = haxe.macro.Context.currentPos();
		
		var className = switch (classNameExpr.expr) {
			case EConst(c):
				switch( c ) {
					case CString(s): s;
					default: haxe.macro.Context.warning("No String given for Class", pos); null;
				}
			default: haxe.macro.Context.warning("No String given for Class", pos); null;
		}
		
		
		var p = function (d :ExprDef) :Expr {
			return {expr :d, pos :pos};
		}
		
		var data = haxe.Resource.getString(className);
		var root = Xml.parse(data).firstChild();
		
		var carr = new Array();
		for (childXML in root) {
			if (childXML.nodeType == Xml.Element) {
				carr.push({ expr : EConst(CIdent(childXML.nodeName)), pos : pos });
			}
		}
		
		return p(EBlock(carr));
	}
	
	/**
	  * Embed a binary resource at compile time, but specified in code rather than in the *hxml file.
	  *
	  * Returns the haxe.Resource key.
	  *
	  * Example:
	  * var embed = com.pblabs.util.PBMacros.embedBinaryDataResource("build/server.swf", "battlecomputer", 1234);
	  * var bytes = haxe.Resource.getBytes("battlecomputer");
	  * trace("bytes.length=" + (bytes == null ? -1 :bytes.length));
	  * 
	  * var swf = new com.pblabs.engine.resource.flash.SwfResource("swf", com.pblabs.engine.resource.Source.bytes(bytes), 1234);
	  * swf.load(function () :Void {
	  * 	trace("loaded as swf");
	  * 	trace(swf.hasSymbol("net.amago.turngame.server.compute.BattleComputer"));
	  * 
	  * }, function (e :Dynamic) :Void {
	  * 	trace("error loading  swf " + Std.string(e));
	  * });
	  */
	@:macro
	public static function embedBinaryDataResource(binPath :String, ?resourceId :String = null, ?xorKey :Int = -1)
	{
		resourceId = resourceId != null ? resourceId : binPath;
		
		var pos = haxe.macro.Context.currentPos();
		
		var bytes = neko.io.File.getBytes(binPath);
		if (xorKey > 0) {
			bytes = com.pblabs.util.BytesUtil.xorBytes(bytes, xorKey);
		}
		
		haxe.macro.Context.addResource(resourceId, bytes);
		return { expr : EConst(CString(resourceId)), pos : pos };
	}
}
