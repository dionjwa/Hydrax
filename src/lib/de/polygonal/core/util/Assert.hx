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
package de.polygonal.core.util;

typedef D = de.polygonal.core.util.Assert;

/**
 * <p>Inserts diagnostics into a program.</p>
 * <p>When executed, if the expression defined in the condition parameter is false, an error is thrown.</p>
 * Example:<br/><br/>
 * <pre class="prettyprint">
 * class Main
 * {
 *     public static function foo(x:Float, y:Float):Void {
 *         Assert.assert(x < y, "x should be smaller than y");
 *     }
 * 
 *     public static function main() {
 *         foo(3, 1); //Assertation "x should be smaller than y" failed in file xxx, line xxx, Foo::foo
 *     }
 * }</pre>
 */
#if (!debug && !cpp) extern #end
class Assert
{
    /**
     * Throws an error if the condition evaluates to false.
     * @param condition the condition to evaluate.
     * @param info additional information describing the condition.
     */
    #if debug
    inline public static function assert(condition:Bool, info:String, ?posInfos:haxe.PosInfos):Void
    {
        if (!(condition)) throw new AssertionError(info, posInfos);
    }
    #else
    inline public static function assert(condition:Bool, info:String, ?posInfos:haxe.PosInfos):Void
    {
    }
    #end
}