/*
 *                            _/                                                    _/   
 *       _/_/_/      _/_/    _/  _/    _/    _/_/_/    _/_/    _/_/_/      _/_/_/  _/    
 *      _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/     
 *     _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/      
 *    _/_/_/      _/_/    _/    _/_/_/    _/_/_/    _/_/    _/    _/    _/_/_/  _/       
 *   _/                            _/        _/                                          
 *  _/                        _/_/      _/_/                                             
 *                                                                                       
 * POLYGONAL - A HAXE LIBRARY FOR GAME DEVELOPERS
 * Copyright (c) 2009-2010 Michael Baczynski, http://www.polygonal.de
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
package de.polygonal.core.macro;

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.rtti.CType.TypeTree;

typedef Param =
{
    var name:String;
    var value:Dynamic;
}

class ConfigXML
{
	#if !macro
	static var _rttiCache:Hash<TypeTree>;
	
	public static function getStaticFields(x:Class<Dynamic>, ?filter:EReg):Array<Param>
	{
		var fields = new Array();

		for (f in Type.getClassFields(x))
		{
			if (f == '__rtti') continue;
			
			if (filter == null)
			{
				fields.push({name: f, value: Reflect.field(x, f)});
				continue;
			}
			
			if (filter.match(f))
				fields.push({name: f, value: Reflect.field(x, f)});
		}
		
		return fields;
	}
	
	public static function getFieldsByName(x:haxe.rtti.Infos, ?filter:EReg):Array<Param>
	{
		if (_rttiCache == null) _rttiCache = new Hash();
		
		var name = Type.getClassName(Type.getClass(x));
		
		var typeInfo:TypeTree;
		if (_rttiCache.exists(name))
			typeInfo = _rttiCache.get(name);
		else
		{
			var rtti:String = Reflect.field(Type.getClass(x), '__rtti');
			var xml = Xml.parse(rtti).firstElement();
			typeInfo = new haxe.rtti.XmlParser().processElement(xml);
			_rttiCache.set(name, typeInfo);
		}
		
		var fields = [];
		switch (typeInfo)
		{
			case TClassdecl(cl):
			for (f in cl.fields)
			{
				if (filter == null)
				{
					fields.push({name: f.name, value: Reflect.field(x, f.name)});
					continue;
				}
				
				if (filter.match(f.name))
					fields.push({name: f.name, value: Reflect.field(x, f.name)});
			}
			default:
				throw 'not a class';
		}
		return fields;
	}
	
	public static function toXML(source:Dynamic):String
	{
		if (!Std.is(source, haxe.rtti.Infos)) throw 'source is not of type haxe.rtti.Infos';
		
		var C:Class<Dynamic> = Type.getClass(source);
		var rtti:String = untyped C.__rtti;
        var x = Xml.parse(rtti).firstElement();
		var f = new haxe.xml.Fast(x);
		
		var xml = '<params>\n';
		for (e in f.elements)
		{
			var prop = e.name;
			
			//<e><c>...</c></e>
			if (e.hasNode.c)
			{
				//<e><c path='...'>...</c></e>
				if (e.node.c.has.path)
				{
					var type = e.node.c.att.path;
					
					var s = Std.string(Reflect.field(source, prop));
					
					if (type == 'Array')
					{
						s = s.substr(1);
						s = s.substr(0, s.length - 1);
						
						//<e><c path='...'><c path='...'></c></c></e>
						var arrayType = e.node.c.node.c.att.path;
						if (arrayType == 'Float')
						{
							var tmp = s.split(',');
							for (i in 0...tmp.length)
								if (tmp[i].indexOf('.') == -1) tmp[i] += '.0';
						}
						else
						{
							var s = Std.string(Reflect.field(source, prop));	
						}
					}
					else
					{
						if (type == 'Float')
							if (s.indexOf('.') == -1) s = s + '.0';
					}
					
					xml += de.polygonal.core.fmt.Sprintf.format('\t<param name=\'%s\' value=\'%s\'/>\n', [prop, s]);
				}
			}
			else
			if (e.hasNode.e)
			{
				if (e.node.e.has.path)
				{
					var type = e.node.e.att.path;
					if (type == 'Bool')
					{
						var s = Std.string(Reflect.field(source, prop));
						xml += de.polygonal.core.fmt.Sprintf.format('\t<param name=\'%s\' value=\'%s\'/>\n', [prop, s]);
					}
				}
			}
		}
		
		xml += '</params>';
		return xml;
	}
	
	public static function ofXML(xmlString:String, target:Dynamic):Void
	{
		var fast = new haxe.xml.Fast(Xml.parse(xmlString).firstElement());
		var names = [], values = [];
		var scan = function(node:Xml, f:Xml->Dynamic->Void)
		{
			if (node.nodeType == Xml.Element)
			{
				if (node.nodeName == 'param')
				{
					if (!node.exists('value'))
						throw '"value" attribute required';
					if (!node.exists('name'))
						throw '"name" attribute required';
					
					var x = node.get('value');
					var n = node.get('name');
					
					if (x.indexOf(',') != -1)
					{
						var t = x.split(',');
						if (t[0].indexOf('.') != -1)
						{
							var a = new Array<Float>();
							for (i in t) a.push(Std.parseFloat(i));
							Reflect.setField(target, n, a);
						}
						else
						if (Std.parseInt(t[0]) != null)
						{
							var a = new Array<Int>();
							for (i in t) a.push(Std.parseInt(i));
							Reflect.setField(target, n, a);
						}
						else
							Reflect.setField(target, n, t);
					}
					else
					if (x.indexOf('.') != -1)
						Reflect.setField(target, n, Std.parseFloat(x));
					else
					{
						if (Std.parseInt(x) != null)
							Reflect.setField(target, n, Std.parseInt(x));
						else
						{
							if (x == 'true' || x == 'false')
								Reflect.setField(target, n, x == 'true' ? true : false);
							else
								Reflect.setField(target, n, x);
						}
					}
				}
			}
			
			for (e in node) f(e, f);
		}
		
		scan(Xml.parse(xmlString).firstElement(), scan);
	}
	#end
	
	@:macro public static function build(url:String, staticFields:Bool):Array<Field>
	{
		var pos = haxe.macro.Context.currentPos();
		
		var fields = new Array<Field>();
		var assign = new Array<Expr>();
		
		try
		{
			var s = neko.io.File.getContent(url);
			
			var names = [], values = [];
			var scan = function(node:Xml, f:Xml->Dynamic->Void)
			{
				if (node.nodeType == Xml.Element)
				{
					if (node.nodeName == 'param')
					{
						names.push(node.get('name'));
						if (node.get('value') == null)
							values.push(node.get('name'));
						else
							values.push(node.get('value'));
					}
				}
				
				for (e in node) f(e, f);
			}
			scan(Xml.parse(s).firstElement(), scan);
			
			var access = [APublic];
			if (staticFields)
			{
				access.push(AStatic);
				access.push(AInline);
			}
			
			for (i in 0...names.length)
			{
				var fieldName  = names[i];
				var fieldValue = values[i];
				
				var c, n, p = [];
				if (fieldValue.indexOf(',') != -1)
				{
					var arrExpr = [];
					var arrType;
					var tmp = fieldValue.split(',');
					
					if (tmp[0].indexOf('.') != -1)
					{
						for (i in tmp) arrExpr.push({expr: EConst(CFloat(Std.string(Std.parseFloat(i)))), pos: pos});
						arrType = 'Float';
					}
					else
					{
						var int = Std.parseInt(tmp[0]);
						if (int == null)
						{
							for (i in tmp) arrExpr.push({expr: EConst(CString(i)), pos: pos});
							arrType = 'String';
						}
						else
						{
							for (i in tmp) arrExpr.push({expr: EConst(CInt(Std.string(Std.parseInt(i)))), pos: pos});
							arrType = 'Int';
						}
					}
					
					n = 'Array';
					c = EArrayDecl(arrExpr);
					p = [TPType(TPath({sub: null, name: arrType, pack: [], params: []}))];
				}
				else
				if (fieldValue.indexOf('.') != -1)
				{
					if (Math.isNaN(Std.parseFloat(fieldValue)))
					{
						c = EConst(CString(fieldValue));
						n = 'String';
					}
					else
					{
						c = EConst(CFloat(fieldValue));
						n = 'Float';
					}
				}
				else
				if (fieldValue == 'true' || fieldValue == 'false')
				{
					c = EConst(CIdent(fieldValue));
					n = 'Bool';
				}
				else
				{
					var int = Std.parseInt(fieldValue);
					if (int == null)
					{
						c = EConst(CString(fieldValue));
						n = 'String';
					}
					else
					{
						c = EConst(CInt(fieldValue));
						n = 'Int';
					}
				}
				
				if (c == null)
					Context.error('invalid field type', Context.currentPos());
				
				if (staticFields)
					fields.push({name: fieldName, doc: null, meta: [], access: access, kind: FVar(TPath({pack: [], name: n, params: p, sub: null}), {expr: c, pos: pos}), pos: pos});
				else
				{
					fields.push({name: fieldName, doc: null, meta: [], access: access, kind: FVar(TPath({pack: [], name: n, params: p, sub: null})), pos: pos});
					assign.push({expr: EBinop(Binop.OpAssign, {expr: EConst(CIdent(fieldName)), pos: pos}, {expr: c, pos: pos}), pos:pos});
				}
			}
		}
		catch (unknown:Dynamic)
		{
			Context.error('error parsing xml', Context.currentPos());
		}
		
		if (!staticFields) fields.push({name: 'new', doc: null, meta: [], access: [APublic], kind: FFun({args: [], ret: null, expr: {expr: EBlock(assign), pos:pos}, params: []}), pos: pos});
		return fields;
    }
}