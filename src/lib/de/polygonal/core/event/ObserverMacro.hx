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
package de.polygonal.core.event;

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Type;

using de.polygonal.ds.Bits;

class ObserverMacro
{
	/**
	 * The number of bits used for encoding the event.
	 */
	inline public static var NUM_BITS = 32;
	
	/**
	 * The number bits reserved for storing group ids.<br/>
	 * E.g. using 5 bits, a total of 32 group ids (0..31, 2^5-1) and 27 event ids (32 - 5) can be encoded in a 32-bit integer.
	 */
	inline public static var NUM_GROUP_BITS = 5;
	
	/**
	 * The number of bits reserved for encoding event ids.
	 */
	inline public static var NUM_EVENT_BITS = NUM_BITS - NUM_GROUP_BITS;
	
	/**
	 * A bit mask of all possible event bits.
	 */
	inline public static var EVENT_MASK = (1 << NUM_EVENT_BITS) - 1;
	
	/**
	 * A bit mask of all possible group bits.
	 */
	inline public static var GROUP_MASK = ((1 << NUM_GROUP_BITS) - 1) << NUM_EVENT_BITS;
	
	/**
	 * Returns an iterator over all event bit flags stored in the update id <code>x</code>.
	 */
	public static function extractTypes(x:Int):Iterator<Int>
	{
		var g = x & ObserverMacro.GROUP_MASK;
		var e = x & ObserverMacro.EVENT_MASK;
		var i = 0;
		var s = e.ones();
		
		//process all events bits MSB -> LSB
		return
		{
			hasNext: function()
			{
				return i < s;
			},
			next: function()
			{
				//add group bits
				var type = g | e.msb();
				//remove bit so msb() returns the next most significant event bit
				e = e.clrBits(e.msb());
				i++;
				return type;
			}
		}
	}
	
	#if macro
	static var _groupCounter = 0;
	
    @:macro public static function create(e:Expr):Array<Field>
	{
		if (_groupCounter > (1 << NUM_GROUP_BITS) - 1)
			Context.error('too many groups', Context.currentPos());
		
		var pos = Context.currentPos();
		var gid    = _groupCounter++;
		var tid    = 0;
		var names  = new Array<String>();
		var fields = new Array<Field>();
		
		switch (e.expr)
		{
			case EArrayDecl(a):
				if (a.length > NUM_EVENT_BITS) Context.error('too many types', pos);
				
				for (b in a)
				{
					switch (b.expr)
					{
						case EConst(c):
							switch (c)
							{
								case CType(c):
									fields.push(_makeTypeField(c, tid, gid, pos));
									names.push(c);
									tid++;
								
								default: Context.error('unsupported declaration', pos);
							}
						default: Context.error('unsupported declaration', pos);
					}
				}
			default: Context.error('unsupported declaration', pos);
		}
		
		fields.push(_makeNameFunc(names, gid, pos));
		fields.push(_makeGroupFunc(pos));
		fields.push(_makeGroupIdField(gid, pos));
		fields.push(_makeGroupMaskField(gid, pos));
		fields.push(_makeEventMaskField(names.length, pos));
		fields.push(_makeHasFunc(gid, names.length, pos));
		
		return fields;
	}
	
	@:macro public static function guid():Array<Field>
	{
		if (haxe.macro.Context.defined('display')) return null;
		var c = haxe.macro.Context.getLocalClass().get();
		while (c.superClass != null)
		{
			c = c.superClass.t.get();
			for (i in c.interfaces)
			{
				if (i.t.toString() == 'de.polygonal.core.event.IObserver')
					return null;
			}
		}
		var fields = Context.getBuildFields();
		fields.push({name: '__guid', doc: null, meta: [], access: [APublic], kind: FVar(TPath({pack: [], name: 'Int', params: [], sub: null})), pos: haxe.macro.Context.currentPos()});
		return fields;
	}
	
	static function _makeHasFunc(gid, n, pos)
	{
		var a = EBinop(OpEq,
			{expr: EConst(CInt(Std.string(gid))), pos: pos},
			{expr: EBinop(OpUShr, {expr: EConst(CIdent('x')), pos: pos}, {expr: EConst(CInt(Std.string(NUM_EVENT_BITS))), pos: pos}), pos: pos});
		
		var f =
		{
			args: [{name: 'x', opt: false, type: TPath({pack: [], name: 'Int', params: [], sub: null}), value: null}],
			ret: TPath({pack: [], name: 'Bool', params: [], sub: null}),
			expr: {expr: EReturn({expr: a, pos: pos}), pos: pos},
			params: []
		}
		
		return {name: 'has', doc: null, meta: [], access: [AStatic, APublic, AInline], kind: FFun(f), pos: pos}
	}
	
	static function _makeGroupFunc(pos)
	{
		var f =
		{
			args: [{name: 'x', opt: false, type: TPath({pack: [], name: 'Int', params: [], sub: null}), value: null}],
			ret: TPath({pack: [], name: 'Int', params: [], sub: null}),
			expr: {expr: EReturn({expr: EBinop(OpUShr, {expr: EConst(CIdent('x')), pos: pos}, {expr: EConst(CInt(Std.string(NUM_EVENT_BITS))), pos: pos}), pos: pos}), pos: pos},
			params: []
		}
		
		return {name: 'group', doc: null, meta: [], access: [AStatic, APublic, AInline], kind: FFun(f), pos: pos}
	}
	
	static function _makeNameFunc(names:Array<String>, gid, p)
	{
		if (haxe.macro.Context.defined('display'))
		{
			var f =
			{
				args: [{name: 'x', opt: false, type: TPath({pack: [], name: 'Int', params: [], sub: null}), value: null}],
				ret: TPath({name: 'Array', pack: [], params: [TPType(TPath({name: 'String', pack: [], params: [], sub: null}))], sub: null}),
				expr: {expr: EBlock([]), pos: p},
				params: []
			}
			
			return {name: 'getName', doc: null, meta: [], access: [AStatic, APublic], kind: FFun(f), pos: p}
		}
		else
		{
			function maskExpr(typeShift:Int)
			{
				var p = haxe.macro.Context.currentPos();
				var a = EBinop(OpShl, {expr: EConst(CInt('1')), pos: p}, {expr: EConst(CInt(Std.string(typeShift))), pos: p});
				return EParenthesis({expr: a, pos: p});
			}
			
			var e = [];
			e.push({expr: EVars([{expr: {expr: ENew({name:'Array', pack: [], params: [TPType(TPath({name:'String', pack: [], params: [], sub: null}))], sub: null}, []), pos: p},
				name: 'output', type: TPath({name: 'Array', pack: [], params: [TPType(TPath({name: 'String', pack: [], params: [], sub: null}))], sub: null})}]), pos: p});
			for (i in 0...names.length)
			{
				e.push({expr: EVars([{expr: {expr: maskExpr(i), pos: p}, name: 'mask', type: TPath({name:'Int', pack: [], params: [], sub: null})}]), pos: p});
				e.push({expr: EIf(
					{expr: EBinop(OpGt, {expr: EBinop(OpAnd, {expr: EConst(CIdent('x')), pos: p}, {expr: EConst(CIdent('mask')), pos: p}), pos: p}, {expr: EConst(CInt('0')), pos: p}), pos: p},
					{expr: EBlock([{expr: ECall({expr: EField({expr: EConst(CIdent('output')), pos: p}, 'push'), pos: p}, [{expr: EConst(CString(names[i])), pos: p}]), pos: p}]), pos: p}, null), pos : p});
			}
			e.push({expr: EReturn({expr: EConst(CIdent('output')), pos: p}), pos : p});
			
			var f =
			{
				args: [{name: 'x', opt: false, type: TPath({pack: [], name: 'Int', params: [], sub: null}), value: null}],
				ret: TPath({name: 'Array', pack: [], params: [TPType(TPath({name: 'String', pack: [], params: [], sub: null}))], sub: null}),
				expr: {expr: EBlock(e), pos: p},
				params: []
			}
			
			return {name: 'getName', doc: null, meta: [], access: [AStatic, APublic], kind: FFun(f), pos: p}
		}
	}
	
	static function _makeTypeField(name, tid, gid, pos)
	{
		if (haxe.macro.Context.defined('display'))
		{
			return {name: name, doc: null, meta: [], access: [AStatic, APublic],
				kind: FVar(TPath({pack : [], name : 'Int', params : [], sub : null}), {expr: EConst(CInt('0')), pos: pos}), pos: pos}
		}
		else
		{
			var a = EBinop(OpShl, {expr: EConst(CInt('1')), pos: pos}, {expr: EConst(CInt(Std.string(tid))), pos: pos});
			var b = EBinop(OpShl, {expr: EConst(CInt(Std.string(gid))), pos: pos}, {expr: EConst(CInt(Std.string(NUM_EVENT_BITS))), pos: pos});
			var c = EBinop(OpOr, {expr: a, pos: pos}, {expr: b, pos: pos});
			return {name: name, doc: null, meta: [], access: [AStatic, APublic, AInline],
				kind: FVar(TPath({pack : [], name : 'Int', params : [], sub : null}), {expr: c, pos: pos}), pos: pos}
		}
	}
	
	static function _makeGroupIdField(gid, pos)
	{
		return {name: 'GROUP_ID', doc: null, meta: [], access: [AStatic, APublic, AInline],
			kind: FVar(TPath({pack : [], name : 'Int', params : [], sub : null}), {expr: EConst(CInt(Std.string(gid))), pos: pos}), pos: pos}
	}
	
	static function _makeGroupMaskField(gid, pos)
	{
		var mask = EBinop(OpShl, {expr: EConst(CInt(Std.string(gid))), pos: pos}, {expr: EConst(CInt(Std.string(NUM_EVENT_BITS))), pos: pos});
		
		return {name: 'GROUP_MASK', doc: null, meta: [], access: [AStatic, APublic, AInline],
			kind: FVar(TPath({pack : [], name : 'Int', params : [], sub : null}), {expr: mask, pos: pos}), pos: pos}
	}
	
	static function _makeEventMaskField(n, pos)
	{
		var mask = EBinop(OpSub,
			{expr: EBinop(OpShl, {expr: EConst(CInt('1')), pos: pos}, {expr: EConst(CInt(Std.string(n))), pos: pos}), pos: pos},
			{expr: EConst(CInt('1')), pos: pos});
		
		return {name: 'EVENT_MASK', doc: null, meta: [], access: [AStatic, APublic, AInline],
			kind: FVar(TPath({pack : [], name : 'Int', params : [], sub : null}), {expr: mask, pos: pos}), pos: pos}
	}
	#end
}