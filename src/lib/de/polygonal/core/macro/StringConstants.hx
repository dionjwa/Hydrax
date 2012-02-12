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
 * 'Software'), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
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

class StringConstants
{
    @:macro public static function build(e:Expr):Array<Field>
	{
		var pos = Context.currentPos();
		var fields = new Array<Field>();
		
		switch (e.expr)
		{
			case EArrayDecl(a):
			for (b in a)
			{
				switch (b.expr)
				{
					case EConst(c):
					switch (c)
					{
						case CType(c):
						fields.push({name: c, doc: null, meta: [], access: [AStatic, APublic, AInline], kind: FVar(TPath({pack: [], name: 'String', params: [], sub: null}), {expr: EConst(CString(c)), pos: pos}), pos: pos});
						default: Context.error('unsupported declaration', pos);
					}
					default: Context.error('unsupported declaration', pos);
				}
			}
			default: Context.error('unsupported declaration', pos);
		}
		
		//declaration order equals array order
		var arrExpr = [];
		for (field in fields) arrExpr.push({expr: EConst(CString(field.name)), pos: pos});
		
		fields.push
		({
			name: 'ALL', doc: null, meta: [], access: [APublic, AStatic, AInline], pos: pos,
			kind: FVar(TPath({pack: [], name: 'Array', params: [TPType(TPath({sub: null, name: 'String', pack: [], params: []}))], sub: null}), {expr: EArrayDecl(arrExpr), pos: pos})
		});
		
		return fields;
	}
}