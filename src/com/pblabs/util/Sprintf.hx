/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file was derived from a sprintf function by Manish Jethani.
 * Original copyright notice:
 *
 *  Author:  Manish Jethani (manish.jethani@gmail.com)
 *  Date:    April 3, 2006
 *  Version: 0.1
 *
 *  Copyright (c) 2006 Manish Jethani
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a
 *  copy of this software and associated documentation files (the "Software"),
 *  to deal in the Software without restriction, including without limitation
 *  the rights to use, copy, modify, merge, publish, distribute, sublicense,
 *  and/or sell copies of the Software, and to permit persons to whom the
 *  Software is furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 *  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 *  DEALINGS IN THE SOFTWARE.  
 ******************************************************************************/
package com.pblabs.util;

using com.pblabs.util.StringUtil;
using com.pblabs.util.NumberUtil;

class Sprintf
{

/*  sprintf(3) implementation in ActionScript 3.0.
 *
 *  http://www.die.net/doc/linux/man/man3/sprintf.3.html
 *
 *  The following flags are supported: '#', '0', '-', '+'
 *
 *  Field widths are fully supported.  '*' is not supported.
 *
 *  Precision is supported except one difference from the standard: for an
 *  explicit precision of 0 and a result string of "0", the output is "0"
 *  instead of an empty string.
 *
 *  Length modifiers are not supported.
 *
 *  The following conversion specifiers are supported: 'd', 'i', 'o', 'u', 'x',
 *  'X', 'f', 'F', 'c', 's', '%'
 *
 *  Report bugs to manish.jethani@gmail.com
 */
public function new() { }


/*  sprintf(3) implementation in ActionScript 3.0.
 *
 *  http://www.die.net/doc/linux/man/man3/sprintf.3.html
 *
 *  The following flags are supported: '#', '0', '-', '+'
 *
 *  Field widths are fully supported.  '*' is not supported.
 *
 *  Precision is supported except one difference from the standard: for an
 *  explicit precision of 0 and a result string of "0", the output is "0"
 *  instead of an empty string.
 *
 *  Length modifiers are not supported.
 *
 *  The following conversion specifiers are supported: 'd', 'i', 'o', 'u', 'x',
 *  'X', 'f', 'F', 'c', 's', '%'
 *
 *  Report bugs to manish.jethani@gmail.com
 */
public static function format (format:String, args:Array<Dynamic>):String
{
	var result:String = "";

	var length:Int = format.length;
	var i :Int = 0;
	while (i < length) {
		var c:String = format.charAt(i);

		if (c == "%")
		{
			var next: Dynamic;
			var str: String;
			var pastFieldWidth:Bool = false;
			var pastFlags:Bool = false;

			var flagAlternateForm:Bool = false;
			var flagZeroPad:Bool = false;
			var flagLeftJustify:Bool = false;
			var flagSpace:Bool = false;
			var flagSign:Bool = false;

			var fieldWidth:String = "";
			var precision:String = "";

			c = format.charAt(++i);

			while (c != "d"
				&& c != "i"
				&& c != "o"
				&& c != "u"
				&& c != "x"
				&& c != "X"
				&& c != "f"
				&& c != "F"
				&& c != "c"
				&& c != "s"
				&& c != "%")
			{
				if (!pastFlags)
				{
					if (!flagAlternateForm && c == "#")
						flagAlternateForm = true;
					else if (!flagZeroPad && c == "0")
						flagZeroPad = true;
					else if (!flagLeftJustify && c == "-")
						flagLeftJustify = true;
					else if (!flagSpace && c == " ")
						flagSpace = true;
					else if (!flagSign && c == "+")
						flagSign = true;
					else
						pastFlags = true;
				}

				if (!pastFieldWidth && c == ".")
				{
					pastFlags = true;
					pastFieldWidth = true;

					c = format.charAt(++i);
					continue;
				}

				if (pastFlags)
				{
					if (!pastFieldWidth)
						fieldWidth += c;
					else
						precision += c;
				}

				c = format.charAt(++i);
			}

			if (c == "d" || c == "i") {
				next = args.shift();
				str = "" + Math.abs(Std.parseInt(next));

				if (precision != "")
					str = str.prepad(Std.parseInt(precision), "0");

				if (Std.parseInt(next) < 0)
					str = "-" + str;
				else if (flagSign && Std.parseInt(next) >= 0)
					str = "+" + str;

				if (fieldWidth != "")
				{
					if (flagLeftJustify)
						str = str.pad(Std.parseInt(fieldWidth));
					else if (flagZeroPad && precision == "")
						str = str.prepad(Std.parseInt(fieldWidth), "0");
					else
						str = str.prepad(Std.parseInt(fieldWidth));
				}

				result += str;

			// case "o":
			// 	next = args.shift();
			// 	str = Std.parseInt(next).toString(8);

			// 	if (flagAlternateForm && str != "0")
			// 		str = "0" + str;

			// 	if (precision != "")
			// 		str = str.prepad(Std.parseInt(precision), "0");

			// 	if (fieldWidth != "")
			// 	{
			// 		if (flagLeftJustify)
			// 			str = str.pad(Std.parseInt(fieldWidth));
			// 		else if (flagZeroPad && precision == "")
			// 			str = str.prepad(Std.parseInt(fieldWidth), "0");
			// 		else
			// 			str = str.prepad(Std.parseInt(fieldWidth));
			// 	}

			// 	result += str;
			// 	break;
			} else if (c == "u") {
				next = args.shift();
				str = next;//uint(next).toString(10);

				if (precision != "")
					str = str.prepad(Std.parseInt(precision), "0");

				if (fieldWidth != "")
				{
					if (flagLeftJustify)
						str = str.pad(Std.parseInt(fieldWidth));
					else if (flagZeroPad && precision == "")
						str = str.prepad(Std.parseInt(fieldWidth), "0");
					else
						str = str.prepad(Std.parseInt(fieldWidth));
				}

				result += str;
           } else if (c == "X") {
				var capitalise:Bool = true;
			// case "x":
			// 	next = args.shift();
			// 	str = uint(next).toString(16);

			// 	if (precision != "")
			// 		str = str.prepad(Std.parseInt(precision), "0");

			// 	var prepend:Bool = flagAlternateForm && uint(next) != 0;

			// 	if (fieldWidth != "" && !flagLeftJustify
			// 			&& flagZeroPad && precision == "")
			// 		str = str.prepad(prepend
			// 				? int(fieldWidth) - 2 : int(fieldWidth), "0");

			// 	if (prepend)
			// 		str = "0x" + str;

			// 	if (fieldWidth != "")
			// 	{
			// 		if (flagLeftJustify)
			// 			str = str.pad(Std.parseInt(fieldWidth));
			// 		else
			// 			str = str.prepad(Std.parseInt(fieldWidth));
			// 	}

			// 	if (capitalise)
			// 		str = str.toUpperCase();

			// 	result += str;
			// 	break;
			} else if (c == "f" || c == "F") {
				next = args.shift();
				str = "" + Math.abs(cast(next, Float)).toFixed(precision != "" ?  Std.parseInt(precision) : 6);
				
				if (Std.parseInt(next) < 0)
					str = "-" + str;
				else if (flagSign && Std.int(next) >= 0)
					str = "+" + str;

				if (flagAlternateForm && str.indexOf(".") == -1)
					str += ".";

				if (fieldWidth != "")
				{
					if (flagLeftJustify)
						str = str.pad(Std.parseInt(fieldWidth));
					else if (flagZeroPad && precision == "")
						str = str.prepad(Std.parseInt(fieldWidth), "0");
					else
						str = str.prepad(Std.parseInt(fieldWidth));
				}

				result += str;
			} else if (c == "c") {
				next = args.shift();
				str = String.fromCharCode(Std.parseInt(next));

				if (fieldWidth != "")
				{
					if (flagLeftJustify)
						str = str.pad(Std.parseInt(fieldWidth));
					else
						str = str.prepad(Std.parseInt(fieldWidth));
				}

				result += str;
            } else if (c == "s") {
				next = args.shift();
				str = Std.string(next);

				if (precision != "")
					str = str.substr(0, Std.parseInt(precision));

				if (fieldWidth != "")
				{
					if (flagLeftJustify)
						str = str.pad(Std.parseInt(fieldWidth));
					else
						str = str.prepad(Std.parseInt(fieldWidth));
				}

				result += str;
			} else if (c == "%") {
				result += "%";
			}
		}
		else
		{
			result += c;
		}
		i++;
	}

	return result;
}

}

	
