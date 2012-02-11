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

import haxe.macro.Expr;

class Version
{
	@:macro public static function build(url:String):Array<Field>
	{
        var pos = haxe.macro.Context.currentPos();
		
		var major = 0;
		var minor = 0;
		var patch = 0;
		
		var s;
		try
		{
			s = neko.io.File.getContent(url);
			var v = s.split('.');
			
			major = Std.parseInt(v[0]);
			minor = Std.parseInt(v[1]);
			patch = Std.parseInt(v[2]);
			patch++;
			s = major + '.' + minor + '.' + patch;
		}
		catch (unknown:Dynamic)
		{
			s = '0.0.0';
		}
		
		var fout = neko.io.File.write(url, false);
		fout.close();
		
		var fout = neko.io.File.append(url, false);
		fout.writeString(s);
		fout.close();
		
		var date = DateTools.format(Date.now(), '%d.%m.%y %H:%S');
		
		return
		[
			{
				name: 'VERSION', doc: null, meta: [], access: [AStatic, APublic, AInline],
				kind: FVar(TPath({ pack : [], name : 'String', params : [], sub : null}), {expr: EConst(CString('v' + s + ' ' + date)), pos: pos}), pos: pos
			},
			{
				name: 'MAJOR', doc: null, meta: [], access: [AStatic, APublic, AInline],
				kind: FVar(TPath({ pack : [], name : 'String', params : [], sub : null}), {expr: EConst(CString(Std.string(major))), pos: pos}), pos: pos
			},
			{
				name: 'MINOR', doc: null, meta: [], access: [AStatic, APublic, AInline],
				kind: FVar(TPath({ pack : [], name : 'String', params : [], sub : null}), {expr: EConst(CString(Std.string(minor))), pos: pos}), pos: pos
			},
			{
				name: 'PATCH', doc: null, meta: [], access: [AStatic, APublic, AInline],
				kind: FVar(TPath({ pack : [], name : 'String', params : [], sub : null}), {expr: EConst(CString(Std.string(patch))), pos: pos}), pos: pos
			},
			{
				name: 'MAJOR_MINOR_PATCH', doc: null, meta: [], access: [AStatic, APublic, AInline],
				kind: FVar(TPath({ pack : [], name : 'String', params : [], sub : null}), {expr: EConst(CString(Std.string(major) + '.' + Std.string(minor) + '.' + Std.string(patch))), pos: pos}), pos: pos
			},
		];
    }
}