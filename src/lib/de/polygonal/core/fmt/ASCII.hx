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
package de.polygonal.core.fmt;

/**
 * US ASCII Character Set, ANSI X3.4-1986 (ISO 646 International Reference Version)<br/>
 * Codes 0 through 31 and 127 are unprintable control characters.
 * Code 32 is a nonprinting spacing characer.
 * Codes 33 through 126 are printable graphic characters.
 * Unprintable control characters except newline are omitted.
 */
class ASCII
{
	/** Returns true if <i>x</i> is an ASCII character. */
	inline public static function isASCII(x:Int):Bool
	{
		return x >= 0 && x <= 127;
	}
	
	/** Returns true if <i>x</i> is a decimal digit ([0-9]). */
	inline public static function isDigit(x:Int):Bool
	{
		return x >= ZERO && x <= NINE;
	}
	
	/** Returns true if <i>x</i> is whitespace. */
	inline public static function isWhite(x:Int):Bool
	{
		return x <= SPACE;
	}
	
	/** Returns true if <i>x</i> is printable. */
	inline public static function isPrintable(x:Int):Bool
	{
		return x >= EXCLAM && x <= TILDE;
	}
	
	/** Returns true if <i>x</i> is a uppercase alphabetic character ([A-Z]). */
	inline public static function isUpperCaseAlphabetic(x:Int):Bool
	{
		return x >= A && x <= Z;
	}
	
	/** Returns true if <i>x</i> is a lowercase alphabetic character ([a-z]). */
	inline public static function isLowerCaseAlphabetic(x:Int):Bool
	{
		return x >= a && x <= z;
	}
	
	/** Returns true if <i>x</i> is an alphabetic character ([a-z,A-Z]). */
	inline public static function isAlphabetic(x:Int):Bool
	{
		return isUpperCaseAlphabetic(x) || isLowerCaseAlphabetic(x);
	}
	
	/** Returns true if <i>x</i> is a alphanumeric character ([a-zA-Z0-9]). */
	inline public static function isAlphaNumeric(x:Int):Bool
	{
		return isDigit(x) || isUpperCaseAlphabetic(x) || isLowerCaseAlphabetic(x);
	}
	
   /**"\b"*/inline public static var BACKSPACE      = 8;
   /**"\t"*/inline public static var TAB            = 9;
   /**"\n"*/inline public static var NEWLINE        = 10;
   /**"\r"*/inline public static var CARRIAGERETURN = 13;
	/**' '*/inline public static var SPACE          = 32; 
	/** ! */inline public static var EXCLAM         = 33; 
	/** " */inline public static var QUOTEDBL       = 34; 
	/** # */inline public static var NUMBERSIGN     = 35; 
	/** $ */inline public static var DOLLAR         = 36; 
	/** % */inline public static var PERCENT        = 37; 
	/** & */inline public static var AMPERSAND      = 38; 
	/** ' */inline public static var QUOTESINGLE    = 39; 
	/** ( */inline public static var PARENLEFT      = 40; 
	/** ) */inline public static var PARENRIGHT     = 41; 
 /** &#42 */inline public static var ASTERISK       = 42; 
	/** + */inline public static var PLUS           = 43; 
	/** , */inline public static var COMMA          = 44; 
	/** - */inline public static var HYPHEN         = 45; 
	/** . */inline public static var PERIOD         = 46; 
	/** / */inline public static var SLASH          = 47; 
	
	/** 0 */inline public static var ZERO           = 48; 
	/** 1 */inline public static var ONE            = 49;
	/** 2 */inline public static var TWO            = 50;
	/** 3 */inline public static var THREE          = 51;
	/** 4 */inline public static var FOUR           = 52;
	/** 5 */inline public static var FIVE           = 53;
	/** 6 */inline public static var SIX            = 54;
	/** 7 */inline public static var SEVEN          = 55;
	/** 8 */inline public static var EIGHT          = 56;
	/** 9 */inline public static var NINE           = 57;
	
	/** : */inline public static var COLON          = 58;
	/** ; */inline public static var SEMICOLON      = 59;
	/** < */inline public static var LESS           = 60;
	/** = */inline public static var EQUAL          = 61;
	/** > */inline public static var GREATER        = 62;
	/** ? */inline public static var QUESTION       = 63;
	/** @ */inline public static var AT             = 64;
	
	/** A */inline public static var A              = 65;
	/** B */inline public static var B              = 66;
	/** C */inline public static var C              = 67;
	/** D */inline public static var D              = 68;
	/** E */inline public static var E              = 69;
	/** F */inline public static var F              = 70;
	/** G */inline public static var G              = 71;
	/** H */inline public static var H              = 72;
	/** I */inline public static var I              = 73;
	/** J */inline public static var J              = 74;
	/** K */inline public static var K              = 75;
	/** L */inline public static var L              = 76;
	/** M */inline public static var M              = 77;
	/** N */inline public static var N              = 78;
	/** O */inline public static var O              = 79;
	/** P */inline public static var P              = 80;
	/** Q */inline public static var Q              = 81;
	/** R */inline public static var R              = 82;
	/** S */inline public static var S              = 83;
	/** T */inline public static var T              = 84;
	/** U */inline public static var U              = 85;
	/** V */inline public static var V              = 86;
	/** W */inline public static var W              = 87;
	/** X */inline public static var X              = 88;
	/** Y */inline public static var Y              = 89;
	/** Z */inline public static var Z              = 90;
	
	/** [ */inline public static var BRACKETLEFT    = 91;
	/** \ */inline public static var BACKSLASH      = 92;
	/** ] */inline public static var BRACKETRIGHT   = 93;
	/** ^ */inline public static var CIRCUM         = 94;
	/** _ */inline public static var UNDERSCORE     = 95;
	/** ` */inline public static var GRAVE          = 96;
	
	/** a */inline public static var a              = 97;
	/** b */inline public static var b              = 98;
	/** c */inline public static var c              = 99;
	/** d */inline public static var d              = 100;
	/** e */inline public static var e              = 101;
	/** f */inline public static var f              = 102;
	/** g */inline public static var g              = 103;
	/** h */inline public static var h              = 104;
	/** i */inline public static var i              = 105;
	/** j */inline public static var j              = 106;
	/** k */inline public static var k              = 107;
	/** l */inline public static var l              = 108;
	/** m */inline public static var m              = 109;
	/** n */inline public static var n              = 110;
	/** o */inline public static var o              = 111;
	/** p */inline public static var p              = 112;
	/** q */inline public static var q              = 113;
	/** r */inline public static var r              = 114;
	/** s */inline public static var s              = 115;
	/** t */inline public static var t              = 116;
	/** u */inline public static var u              = 117;
	/** v */inline public static var v              = 118;
	/** w */inline public static var w              = 119;
	/** x */inline public static var x              = 120;
	/** y */inline public static var y              = 121;
	/** z */inline public static var z              = 122;
	
	/** { */inline public static var BRACELEFT      = 123;
	/** | */inline public static var BAR            = 124;
	/** } */inline public static var BRACERIGTH     = 125;
	/** ~ */inline public static var TILDE          = 126;
}