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
package de.polygonal.gl.text.fonts.bitmap04;

import de.polygonal.gl.text.VectorFont;
import de.polygonal.gl.VectorRenderer;
import flash.Memory;

class Bitmap04b19 extends de.polygonal.gl.text.ProportionalVectorFont
{
	public function new()
	{
		#if font_inline
		super(1050, 900, -150, BOUNDS_TABLE, SPACING_TABLE, null);
		#else
		super(
		"eNrVWktvXTUQ9knZkgUrhAQSpKXQpKG0pRAKNLm0NLyhz9AXpb19J6EP0vIqsOjuSoWITTdI3edPkKh/AKlSpSB2lx1CinRWLAiesWfGPmPfe+5tuyBVoy+2j2c8Mx7PjG0eeWLNjdXzxYg5Zp42TxcTC9PlYnv+7ACApV+G7g0Y+8OAuwDgYGh1LQvTLTeGAHcBKCbs"+
		"F9j0jCUTTbq0+99/HD0GIWH8ElsQwJjG7tVRAdwFgxtNT2bInCsatmVp8PehgcYP838JGLYMYhcD2+q6GMCkDdsvALvsHAKQcPPHIwKgC/lmACSwiwGwgV0EFm0rdjFAyQEJBtgFbDBwXZYOA9dleWEAJApkFVcKq2CA0oAuBra1aCzMDKL41prjRajxloCsolsMxts/"+
		"zyEZBo7Lm8u3GXgF/vuPAKs718UApQ9dDCyDTtsMklZawGDkEKXGAFaBXQxsF1hyC4nihAy8PbYENGFmSwfXvM5MBl8ueGOJbZu74EttySAfAcNeoAy0ZB3fwzPzDJwCQTQMoh0BANdPOxDHMOAuFARvn2fNURShMxiaNF4bdDHfCJRtJ+ihcVoyAlA5N62RExCiaJO8"+
		"Nl4tgHAMr783TeKy236MEwQZuJi8HyNqX28es2Rmb/m5LNCi4S4LxPU9ZzYUE00rJ+cwLFAOw/uAn+cYJJyBY3D2FgO3YWATM2AS6BWtwJCD54GDyJ5QC+xhyL+hiBhkzBq8GYEuXqEgH2A2mEZlH3gypYAcPdJo02uURa3OJjfPsDdtBn7Xr44ycM5ncPmugCZ1MUif"+
		"MMNWluhK8UsA1mM5wgxqcPkruUgGjjnw6ASEBNgTuVEzYi0xkjkoHA2CQaQXscSN/suYr8ZkACLeZdWjVZpez7O3GGRovmDGCjZWAWCjDGB3sycBgGbJGwMAHinwOQO3VdrepaCi9OnWJHfJALVK25f4KWDp+LOpGqdoX6bjFO1EtDOKHe2L5vFC2/p4u7WTgRMseW91"+
		"5tkTfvlJnGuztcjEvlGeMNK8W81kALR/SVhHzAGtZks/HER+VnyxtrKIywwHW83ain8BE8DNyEBHDMqCvI5XRxlkvMBL1RXXX01kSjoIbvoIRUB6xdvMxq6Gmjz/Os1e40RMGPPL5qmK+r3MWwKUQXTbVzz7K2ZT7zsys3Rlkn2ueKwq/D7V3z/fzMqr5LDi5GPBR/18"+
		"pNOYgs9/VlAiL/FjxI1v92R0bJoO/4o8B5pLIfNaOk6gLAtBxpNAOMIgt7OrITAHVnxsxGY7TF0M0jtIe4jXk3qJQ9dIL1oLEjhTLExjhMwbILAoI3cR3fJdAXXCn/7CMRVqOck1A9CtQsAr2eH3VHqcrjb0eeJEaWDG5YybbSmX41MBl2SrL92ObQcgExY0SIT0VSH5"+
		"ENslc9mk+LVJToiS9YnkCaDzxsgtPRwn1DCvdfXRLoWjGgRXJbLZZm+uuQa7vCTh+83qMZ7hW0y7ZrTXbW3MwU6rRKmUcD5gP2CAeQVnGlyeSvDt5ynyEajmW1jZBZmNLhIo4cc7qNcYQ4tZOHjLRnFJiw5cQNqZpWKoai6nhb87SS8RQ6V2dcmgdsw2CXm4qgbF0kvL"+
		"qr9drU+lt7GKEZ7enenJyfyODfIi3hPmlMkyavD1rvW4sWTCElp9yYRlrZxk6joizeV7NmtL1WRCGWRs3X8lFZH3k64nyqhzQXOUD6kTxR9Raw8xqFgjnR8fgEZ7ppfTgptHZPVhJpGu5lZJd1/ZWx0S6Y/M+q4uQ8dS+sjT6aL26VHg9XH69KU6PgBXBrdfMXg4xYQ9"+
		"ZqxbIICHCXzJIBcQd66bV9jtnOJF8bSwu/fB5s71s1vmYJ9KWFVlU9dfa8++v4an7HwidvJBB6pnSJ3ZUetghQyigCEXeKQ5OAhxQhNbVygsLd2ZTAC7/JcrxGVJO7ukBGOFuFyJouwVBkwCgHiuKckSV/KnRWX2peGZQX9xQcAmPj6l8iB5opTBAjIniv3cnSgEgIQ7"+
		"UQiEEhFZfiLa9N1Wet6qCaiV6Hw3cVuQ2ropDg7JblzJZlKWFXeue5B0HmUgsIWM85CVCAeHZTcGdhBVPvXsCS7j2b0wzBGsP4eWkfBToLbB5ScZLLpyMRRBPBhvz//mLzk9WORLEHYe8DnWcBlAFwuVF8lqlSDcy9Ic9c4jLPpWDdlViH0BHcvlIBXvLkstQhHGMdi6"+
		"sNAf5u+4FSMX7jZ7heosd6gocUc2jquGEEjkO8rgmYQFouxP5SKh7GRKNEa+PE6XF+6yi65sAPwyVJKIShYRXH85d/GZPaqt2lw3gvomvnqdgXxuQZF2asmjDBbx05844wkbrmCoBdLx1xAV3hMxFw8GUQaEsVbvgNMNaSIg7KV3krb5zeU/cmTAank/ZMigV2I/xZqf"+
		"9GaCgEgAEA6asHRn0CWV9iqWlgw3S9oGZZ9LPyWRWpm/+6hMmrz7EE0Vga8mqSQjaOgSVk7bNAd3rjMleAVQtTt/Q+g5YJ4Se8bf7gbvAuKLPKWpJnU1wyURP8LlGRIY6WWR404Cv9pt4CMLDyZoUgaRfgsxLJATA6U76BJWzsK9To39EucxatJue4rpnZOspQyfcoT3"+
		"l5EdaJ8RsxLqV5Lp81bCOt3tcP3crQKRy7zDbCusZMiKL1DmjYXfoCaReZjVKcnqVnFv06lKIPGKhdmAmjhzOd133WJGHN/tTIynazyZbIPLvEGeHdaEiQQAiVZnMc/ulV44V+plBUnmc7LYaFx+rqJD7UZZmZC5SHk23Vn4twbTLQYJwvHFU5qwfq4REb5UJayjQ+QA"+
		"6DF4EIQvU1jai+EkDDo2Cpr9yn0kwWpT91X8/MI9Cup049NLNTxwRumLLqIlHMxRoowPZ9JKSm8Dbd40j8x+lVKrXmbvM1FOc3CNEmWs2yfveKIve5SBcj1ES1zPl5Qo6/xYTVr7Yd/DqbgqQcSXE1+RNvl80Je1mWd14aGk9ZtxHvoI+rr/ZzY9X6qkd+w3lgN+Oqpv"+
		"NjETJJB7PxhqKvN+0AeE9/iZqhStv6UcLB8I6IImDroelq1SL5/mBeSujKOKQNsnfwwSztg/gnR74btK/nhbQJIn+RIeyfteWqp5hlrIC5shbqEno2uxxe5FeLqHSlknX/l8/1luuelz9PVCy70kNc/xGMrjn1ctG0J+QCZmmHY3PCUEczcjJFN6K2g2khVR6mBGwzH+"+
		"AR/NbPMMXMUmtYoXmWfS92YeQy/rtqiWrSHP/llVdeZtquVl1fKKahlTLa+SY6CnLWZ72OIfn1S/ep3G0PWBeUPxvEN9Na4sYUKNaaiWN1XLTtWyS7W8pfjZrcZMqpa3A3tu+eu96ph3Vct7yurel5W6+ybzgdLyh4rDj9TMH4ctaGN71Ji9qmWfatmvWg6oloNUTKNK"+
		"s5niFhrziWo5pFoOUwvb/BEe4wuG5qgacyycB/JT8yml9jzzccouqcplPuMWX5AyJ7iF5HySSi7c0lRjTqmW06rlDKXslMybs2rMOWphL3FeafmCkvy0sroZ9lG0U2a5hb76XLVcDHcl+rFLquWy+uqK4vALxeGc+uqqarmmeP5SjflK8fO1ovWN2k3fqlPmuoxZvutP"+
		"MWnBE8x8b+7zp1gqRgam1txYM2Z/jxUj9u+lgamBv6HV/n/U/r5m/47+2VEjhNfc0L34e0n3yGg756NuXqSW+n6k4/dLjtP7X///++c/kxIlMQ==");
		#end
		size = 14;
	}
	
	#if font_inline
	static var SPACING_TABLE:Array<Int> =
	[
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,  450,  300,  600,  900,  825,  600,  825,  300,
		 450,  450,  600,  750,  300,  600,  300,  525,  600,  375,  600,  600,  600,  600,  600,  600,  600,  600,  300,  300,
		 600,  600,  600,  600,  900,  600,  600,  600,  600,  600,  600,  600,  600,  300,  600,  600,  450,  900,  600,  600,
		 600,  600,  600,  600,  600,  600,  600,  900,  600,  600,  600,  375,  525,  375,  600,  600,  450,  600,  600,  600,
		 600,  600,  600,  600,  600,  300,  600,  600,  300,  900,  600,  600,  600,  600,  600,  600,  600,  600,  600,  900,
		 600,  600,  600,  450,  300,  450,  450
	];

	static var BOUNDS_TABLE:Array<Float> =
	[
		  33,          0,    -78.570,     21.428,          0,
		  34,          0,    -78.570,     49.999,    -49.999,
		  35,          0,    -78.570,     78.570,          0,
		  36,          0,    -85.713,     71.427,      7.143,
		  37,          0,    -78.570,     49.999,          0,
		  38,          0,    -78.570,     71.428,          0,
		  39,          0,    -78.570,     21.429,    -49.999,
		  40,          0,    -78.570,     35.714,          0,
		  41,          0,    -78.570,     35.714,          0,
		  42,          0,    -78.570,     49.999,    -28.571,
		  43,          0,    -71.427,     64.285,     -7.143,
		  44,          0,    -21.428,     21.429,     14.286,
		  45,          0,    -49.999,     50.000,    -28.571,
		  46,          0,    -21.428,     21.429,          0,
		  47,          0,    -78.570,     42.857,      7.143,
		  48,          0,    -78.570,     49.999,          0,
		  49,          0,    -78.570,     28.571,          0,
		  50,          0,    -78.570,     50.000,          0,
		  51,          0,    -78.570,     50.000,          0,
		  52,          0,    -78.570,     49.999,          0,
		  53,          0,    -78.570,     49.999,          0,
		  54,          0,    -78.570,     49.999,          0,
		  55,          0,    -78.570,     49.999,          0,
		  56,          0,    -78.570,     49.999,          0,
		  57,          0,    -78.570,     49.999,          0,
		  58,          0,    -64.285,     21.428,    -14.285,
		  59,          0,    -64.285,     21.428,          0,
		  60,          0,    -78.570,     49.999,          0,
		  61,          0,    -64.285,     49.999,    -14.285,
		  62,          0,    -78.570,     49.999,          0,
		  63,          0,    -78.570,     49.999,          0,
		  64,          0,    -78.570,     78.570,          0,
		  65,          0,    -78.570,     49.999,          0,
		  66,          0,    -78.570,     49.999,          0,
		  67,          0,    -78.570,     49.999,          0,
		  68,          0,    -78.570,     49.999,          0,
		  69,          0,    -78.570,     49.999,          0,
		  70,          0,    -78.570,     49.999,          0,
		  71,          0,    -78.570,     49.999,          0,
		  72,          0,    -78.570,     49.999,          0,
		  73,          0,    -78.570,     21.428,          0,
		  74,          0,    -78.570,     49.999,          0,
		  75,          0,    -78.570,     49.999,          0,
		  76,          0,    -78.570,     35.714,          0,
		  77,          0,    -78.570,     78.571,          0,
		  78,          0,    -78.570,     50.000,          0,
		  79,          0,    -78.570,     49.999,          0,
		  80,          0,    -78.570,     49.999,          0,
		  81,          0,    -78.570,     49.999,      7.143,
		  82,          0,    -78.570,     49.999,          0,
		  83,          0,    -78.570,     49.999,          0,
		  84,          0,    -78.570,     49.999,          0,
		  85,          0,    -78.570,     49.999,          0,
		  86,          0,    -78.570,     49.999,          0,
		  87,          0,    -78.570,     78.570,          0,
		  88,          0,    -78.570,     49.999,          0,
		  89,          0,    -78.570,     49.999,          0,
		  90,          0,    -78.570,     49.999,          0,
		  91,          0,    -78.570,     28.571,          0,
		  92,          0,    -78.570,     42.856,      7.143,
		  93,          0,    -78.570,     28.571,          0,
		  94,          0,    -78.570,     49.999,    -42.856,
		  95,          0,    -21.428,     49.999,          0,
		  96,          0,    -78.570,     35.714,    -57.142,
		  97,          0,    -78.570,     49.999,          0,
		  98,          0,    -78.570,     50.000,          0,
		  99,          0,    -71.427,     50.000,          0,
		 100,          0,    -78.570,     50.000,          0,
		 101,          0,    -78.570,     50.000,          0,
		 102,          0,    -78.570,     50.000,          0,
		 103,          0,    -64.285,     50.000,     14.285,
		 104,          0,    -78.570,     50.000,          0,
		 105,          0,    -78.570,     21.429,          0,
		 106,          0,    -78.570,     49.999,          0,
		 107,          0,    -78.570,     49.999,          0,
		 108,          0,    -78.570,     21.428,          0,
		 109,          0,    -71.427,     78.570,          0,
		 110,          0,    -71.427,     49.999,          0,
		 111,          0,    -71.427,     49.999,          0,
		 112,          0,    -64.285,     49.999,     14.286,
		 113,          0,    -64.285,     49.999,     14.286,
		 114,          0,    -71.427,     49.999,          0,
		 115,          0,    -78.570,     49.999,          0,
		 116,          0,    -78.570,     49.999,          0,
		 117,          0,    -71.427,     49.999,          0,
		 118,          0,    -71.427,     49.999,          0,
		 119,          0,    -71.427,     78.570,          0,
		 120,          0,    -71.427,     49.999,          0,
		 121,          0,    -64.285,     49.999,     14.286,
		 122,          0,    -78.570,     49.999,          0,
		 123,          0,    -78.570,     35.714,          0,
		 124,          0,    -78.570,     21.428,          0,
		 125,          0,    -78.570,     35.714,          0,
		 126,          0,    -78.570,     35.713,    -57.142
	];

	override function _draw(charCode:Int, x:Float, y:Float, s:Float, threshold:Float):Void
	{
		var o = 0;
		switch (charCode)
		{			
			case 33:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +   21.428 * s);
			_setf(o + ( 1 << 2), y +  -28.571 * s);
			_setf(o + ( 2 << 2), x +   21.428 * s);
			_setf(o + ( 3 << 2), y +  -78.570 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +  -78.570 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +  -28.571 * s);
			_setf(o + ( 8 << 2), x +   21.428 * s);
			_setf(o + ( 9 << 2), y +  -28.571 * s);
			_setf(o + (10 << 2), x +   21.428 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   21.428 * s);
			_setf(o + (13 << 2), y +  -21.428 * s);
			_setf(o + (14 << 2), x +       0. * s);
			_setf(o + (15 << 2), y +  -21.428 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   21.428 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   28.571 * s);
			_setf(o + (21 << 2), y +       0. * s);
			o = _posb(11);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 1);
			
			case 34:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +  -49.999 * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +  -78.570 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -78.570 * s);
			_setf(o + (10 << 2), x +   28.571 * s);
			_setf(o + (11 << 2), y +  -78.570 * s);
			_setf(o + (12 << 2), x +   28.571 * s);
			_setf(o + (13 << 2), y +  -49.999 * s);
			_setf(o + (14 << 2), x +   49.999 * s);
			_setf(o + (15 << 2), y +  -49.999 * s);
			_setf(o + (16 << 2), x +   49.999 * s);
			_setf(o + (17 << 2), y +  -78.570 * s);
			_setf(o + (18 << 2), x +   28.571 * s);
			_setf(o + (19 << 2), y +  -78.570 * s);
			_setf(o + (20 << 2), x +   57.142 * s);
			_setf(o + (21 << 2), y +       0. * s);
			o = _posb(11);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 1);
			
			case 35:
			
			o = _posf(70);
			_setf(o + ( 0 << 2), x +   78.570 * s);
			_setf(o + ( 1 << 2), y +  -35.714 * s);
			_setf(o + ( 2 << 2), x +   64.285 * s);
			_setf(o + ( 3 << 2), y +  -35.714 * s);
			_setf(o + ( 4 << 2), x +   64.285 * s);
			_setf(o + ( 5 << 2), y +  -42.856 * s);
			_setf(o + ( 6 << 2), x +   78.570 * s);
			_setf(o + ( 7 << 2), y +  -42.856 * s);
			_setf(o + ( 8 << 2), x +   78.570 * s);
			_setf(o + ( 9 << 2), y +  -64.285 * s);
			_setf(o + (10 << 2), x +   64.285 * s);
			_setf(o + (11 << 2), y +  -64.285 * s);
			_setf(o + (12 << 2), x +   64.285 * s);
			_setf(o + (13 << 2), y +  -78.570 * s);
			_setf(o + (14 << 2), x +   42.856 * s);
			_setf(o + (15 << 2), y +  -78.570 * s);
			_setf(o + (16 << 2), x +   42.856 * s);
			_setf(o + (17 << 2), y +  -64.285 * s);
			_setf(o + (18 << 2), x +   35.714 * s);
			_setf(o + (19 << 2), y +  -64.285 * s);
			_setf(o + (20 << 2), x +   35.714 * s);
			_setf(o + (21 << 2), y +  -78.570 * s);
			_setf(o + (22 << 2), x +   14.285 * s);
			_setf(o + (23 << 2), y +  -78.570 * s);
			_setf(o + (24 << 2), x +   14.285 * s);
			_setf(o + (25 << 2), y +  -64.285 * s);
			_setf(o + (26 << 2), x +       0. * s);
			_setf(o + (27 << 2), y +  -64.285 * s);
			_setf(o + (28 << 2), x +       0. * s);
			_setf(o + (29 << 2), y +  -42.856 * s);
			_setf(o + (30 << 2), x +   14.285 * s);
			_setf(o + (31 << 2), y +  -42.856 * s);
			_setf(o + (32 << 2), x +   14.285 * s);
			_setf(o + (33 << 2), y +  -35.714 * s);
			_setf(o + (34 << 2), x +       0. * s);
			_setf(o + (35 << 2), y +  -35.714 * s);
			_setf(o + (36 << 2), x +       0. * s);
			_setf(o + (37 << 2), y +  -14.285 * s);
			_setf(o + (38 << 2), x +   14.285 * s);
			_setf(o + (39 << 2), y +  -14.285 * s);
			_setf(o + (40 << 2), x +   14.285 * s);
			_setf(o + (41 << 2), y +       0. * s);
			_setf(o + (42 << 2), x +   35.714 * s);
			_setf(o + (43 << 2), y +       0. * s);
			_setf(o + (44 << 2), x +   35.714 * s);
			_setf(o + (45 << 2), y +  -14.285 * s);
			_setf(o + (46 << 2), x +   42.856 * s);
			_setf(o + (47 << 2), y +  -14.285 * s);
			_setf(o + (48 << 2), x +   42.856 * s);
			_setf(o + (49 << 2), y +       0. * s);
			_setf(o + (50 << 2), x +   64.285 * s);
			_setf(o + (51 << 2), y +       0. * s);
			_setf(o + (52 << 2), x +   64.285 * s);
			_setf(o + (53 << 2), y +  -14.285 * s);
			_setf(o + (54 << 2), x +   78.570 * s);
			_setf(o + (55 << 2), y +  -14.285 * s);
			_setf(o + (56 << 2), x +   78.570 * s);
			_setf(o + (57 << 2), y +  -35.714 * s);
			_setf(o + (58 << 2), x +   35.714 * s);
			_setf(o + (59 << 2), y +  -42.856 * s);
			_setf(o + (60 << 2), x +   42.856 * s);
			_setf(o + (61 << 2), y +  -42.856 * s);
			_setf(o + (62 << 2), x +   42.856 * s);
			_setf(o + (63 << 2), y +  -35.714 * s);
			_setf(o + (64 << 2), x +   35.714 * s);
			_setf(o + (65 << 2), y +  -35.714 * s);
			_setf(o + (66 << 2), x +   35.714 * s);
			_setf(o + (67 << 2), y +  -42.856 * s);
			_setf(o + (68 << 2), x +   85.713 * s);
			_setf(o + (69 << 2), y +       0. * s);
			o = _posb(35);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 2);
			_setb(o + 16, 2);
			_setb(o + 17, 2);
			_setb(o + 18, 2);
			_setb(o + 19, 2);
			_setb(o + 20, 2);
			_setb(o + 21, 2);
			_setb(o + 22, 2);
			_setb(o + 23, 2);
			_setb(o + 24, 2);
			_setb(o + 25, 2);
			_setb(o + 26, 2);
			_setb(o + 27, 2);
			_setb(o + 28, 2);
			_setb(o + 29, 1);
			_setb(o + 30, 2);
			_setb(o + 31, 2);
			_setb(o + 32, 2);
			_setb(o + 33, 2);
			_setb(o + 34, 1);
			
			case 36:
			
			o = _posf(64);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -28.571 * s);
			_setf(o + ( 2 << 2), x +   21.428 * s);
			_setf(o + ( 3 << 2), y +  -28.571 * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +  -21.428 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +  -21.428 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   21.428 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   21.428 * s);
			_setf(o + (13 << 2), y +    7.143 * s);
			_setf(o + (14 << 2), x +   42.856 * s);
			_setf(o + (15 << 2), y +    7.143 * s);
			_setf(o + (16 << 2), x +   42.856 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   71.427 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   71.427 * s);
			_setf(o + (21 << 2), y +  -49.999 * s);
			_setf(o + (22 << 2), x +   49.999 * s);
			_setf(o + (23 << 2), y +  -49.999 * s);
			_setf(o + (24 << 2), x +   49.999 * s);
			_setf(o + (25 << 2), y +  -57.142 * s);
			_setf(o + (26 << 2), x +   71.427 * s);
			_setf(o + (27 << 2), y +  -57.142 * s);
			_setf(o + (28 << 2), x +   71.427 * s);
			_setf(o + (29 << 2), y +  -78.570 * s);
			_setf(o + (30 << 2), x +   49.999 * s);
			_setf(o + (31 << 2), y +  -78.570 * s);
			_setf(o + (32 << 2), x +   49.999 * s);
			_setf(o + (33 << 2), y +  -85.713 * s);
			_setf(o + (34 << 2), x +   28.571 * s);
			_setf(o + (35 << 2), y +  -85.713 * s);
			_setf(o + (36 << 2), x +   28.571 * s);
			_setf(o + (37 << 2), y +  -78.570 * s);
			_setf(o + (38 << 2), x +       0. * s);
			_setf(o + (39 << 2), y +  -78.570 * s);
			_setf(o + (40 << 2), x +       0. * s);
			_setf(o + (41 << 2), y +  -28.571 * s);
			_setf(o + (42 << 2), x +   49.999 * s);
			_setf(o + (43 << 2), y +  -21.428 * s);
			_setf(o + (44 << 2), x +   42.856 * s);
			_setf(o + (45 << 2), y +  -21.428 * s);
			_setf(o + (46 << 2), x +   42.856 * s);
			_setf(o + (47 << 2), y +  -28.571 * s);
			_setf(o + (48 << 2), x +   49.999 * s);
			_setf(o + (49 << 2), y +  -28.571 * s);
			_setf(o + (50 << 2), x +   49.999 * s);
			_setf(o + (51 << 2), y +  -21.428 * s);
			_setf(o + (52 << 2), x +   21.428 * s);
			_setf(o + (53 << 2), y +  -57.142 * s);
			_setf(o + (54 << 2), x +   28.571 * s);
			_setf(o + (55 << 2), y +  -57.142 * s);
			_setf(o + (56 << 2), x +   28.571 * s);
			_setf(o + (57 << 2), y +  -49.999 * s);
			_setf(o + (58 << 2), x +   21.428 * s);
			_setf(o + (59 << 2), y +  -49.999 * s);
			_setf(o + (60 << 2), x +   21.428 * s);
			_setf(o + (61 << 2), y +  -57.142 * s);
			_setf(o + (62 << 2), x +   78.570 * s);
			_setf(o + (63 << 2), y +       0. * s);
			o = _posb(32);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 2);
			_setb(o + 16, 2);
			_setb(o + 17, 2);
			_setb(o + 18, 2);
			_setb(o + 19, 2);
			_setb(o + 20, 2);
			_setb(o + 21, 1);
			_setb(o + 22, 2);
			_setb(o + 23, 2);
			_setb(o + 24, 2);
			_setb(o + 25, 2);
			_setb(o + 26, 1);
			_setb(o + 27, 2);
			_setb(o + 28, 2);
			_setb(o + 29, 2);
			_setb(o + 30, 2);
			_setb(o + 31, 1);
			
			case 37:
			
			o = _posf(48);
			_setf(o + ( 0 << 2), x +   21.428 * s);
			_setf(o + ( 1 << 2), y +  -57.142 * s);
			_setf(o + ( 2 << 2), x +   21.428 * s);
			_setf(o + ( 3 << 2), y +  -78.570 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +  -78.570 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +  -57.142 * s);
			_setf(o + ( 8 << 2), x +   21.428 * s);
			_setf(o + ( 9 << 2), y +  -57.142 * s);
			_setf(o + (10 << 2), x +   28.571 * s);
			_setf(o + (11 << 2), y +  -78.570 * s);
			_setf(o + (12 << 2), x +   28.571 * s);
			_setf(o + (13 << 2), y +  -49.999 * s);
			_setf(o + (14 << 2), x +    7.143 * s);
			_setf(o + (15 << 2), y +  -49.999 * s);
			_setf(o + (16 << 2), x +    7.143 * s);
			_setf(o + (17 << 2), y +  -42.856 * s);
			_setf(o + (18 << 2), x +       0. * s);
			_setf(o + (19 << 2), y +  -42.856 * s);
			_setf(o + (20 << 2), x +       0. * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   21.428 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   21.428 * s);
			_setf(o + (25 << 2), y +  -28.571 * s);
			_setf(o + (26 << 2), x +   42.857 * s);
			_setf(o + (27 << 2), y +  -28.571 * s);
			_setf(o + (28 << 2), x +   42.857 * s);
			_setf(o + (29 << 2), y +  -35.714 * s);
			_setf(o + (30 << 2), x +   49.999 * s);
			_setf(o + (31 << 2), y +  -35.714 * s);
			_setf(o + (32 << 2), x +   49.999 * s);
			_setf(o + (33 << 2), y +  -78.570 * s);
			_setf(o + (34 << 2), x +   28.571 * s);
			_setf(o + (35 << 2), y +  -78.570 * s);
			_setf(o + (36 << 2), x +   28.571 * s);
			_setf(o + (37 << 2), y +  -21.428 * s);
			_setf(o + (38 << 2), x +   28.571 * s);
			_setf(o + (39 << 2), y +       0. * s);
			_setf(o + (40 << 2), x +   49.999 * s);
			_setf(o + (41 << 2), y +       0. * s);
			_setf(o + (42 << 2), x +   49.999 * s);
			_setf(o + (43 << 2), y +  -21.428 * s);
			_setf(o + (44 << 2), x +   28.571 * s);
			_setf(o + (45 << 2), y +  -21.428 * s);
			_setf(o + (46 << 2), x +   57.142 * s);
			_setf(o + (47 << 2), y +       0. * s);
			o = _posb(24);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 2);
			_setb(o + 16, 2);
			_setb(o + 17, 2);
			_setb(o + 18, 1);
			_setb(o + 19, 2);
			_setb(o + 20, 2);
			_setb(o + 21, 2);
			_setb(o + 22, 2);
			_setb(o + 23, 1);
			
			case 38:
			
			o = _posf(62);
			_setf(o + ( 0 << 2), x +   49.999 * s);
			_setf(o + ( 1 << 2), y +  -42.856 * s);
			_setf(o + ( 2 << 2), x +   49.999 * s);
			_setf(o + ( 3 << 2), y +  -78.570 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +  -78.570 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +  -42.856 * s);
			_setf(o + ( 8 << 2), x +    7.143 * s);
			_setf(o + ( 9 << 2), y +  -42.856 * s);
			_setf(o + (10 << 2), x +    7.143 * s);
			_setf(o + (11 << 2), y +  -35.714 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +  -35.714 * s);
			_setf(o + (14 << 2), x +       0. * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   49.999 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   49.999 * s);
			_setf(o + (19 << 2), y +  -14.285 * s);
			_setf(o + (20 << 2), x +   57.142 * s);
			_setf(o + (21 << 2), y +  -14.285 * s);
			_setf(o + (22 << 2), x +   57.142 * s);
			_setf(o + (23 << 2), y +  -21.428 * s);
			_setf(o + (24 << 2), x +   71.428 * s);
			_setf(o + (25 << 2), y +  -21.428 * s);
			_setf(o + (26 << 2), x +   71.428 * s);
			_setf(o + (27 << 2), y +  -42.856 * s);
			_setf(o + (28 << 2), x +   49.999 * s);
			_setf(o + (29 << 2), y +  -42.856 * s);
			_setf(o + (30 << 2), x +   49.999 * s);
			_setf(o + (31 << 2), y +  -35.714 * s);
			_setf(o + (32 << 2), x +   42.857 * s);
			_setf(o + (33 << 2), y +  -35.714 * s);
			_setf(o + (34 << 2), x +   42.857 * s);
			_setf(o + (35 << 2), y +  -42.856 * s);
			_setf(o + (36 << 2), x +   49.999 * s);
			_setf(o + (37 << 2), y +  -42.856 * s);
			_setf(o + (38 << 2), x +   49.999 * s);
			_setf(o + (39 << 2), y +  -35.714 * s);
			_setf(o + (40 << 2), x +   21.428 * s);
			_setf(o + (41 << 2), y +  -57.142 * s);
			_setf(o + (42 << 2), x +   28.571 * s);
			_setf(o + (43 << 2), y +  -57.142 * s);
			_setf(o + (44 << 2), x +   28.571 * s);
			_setf(o + (45 << 2), y +  -49.999 * s);
			_setf(o + (46 << 2), x +   21.428 * s);
			_setf(o + (47 << 2), y +  -49.999 * s);
			_setf(o + (48 << 2), x +   21.428 * s);
			_setf(o + (49 << 2), y +  -57.142 * s);
			_setf(o + (50 << 2), x +   28.571 * s);
			_setf(o + (51 << 2), y +  -28.571 * s);
			_setf(o + (52 << 2), x +   28.571 * s);
			_setf(o + (53 << 2), y +  -21.428 * s);
			_setf(o + (54 << 2), x +   21.428 * s);
			_setf(o + (55 << 2), y +  -21.428 * s);
			_setf(o + (56 << 2), x +   21.428 * s);
			_setf(o + (57 << 2), y +  -28.571 * s);
			_setf(o + (58 << 2), x +   28.571 * s);
			_setf(o + (59 << 2), y +  -28.571 * s);
			_setf(o + (60 << 2), x +   78.570 * s);
			_setf(o + (61 << 2), y +       0. * s);
			o = _posb(31);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 1);
			_setb(o + 16, 2);
			_setb(o + 17, 2);
			_setb(o + 18, 2);
			_setb(o + 19, 2);
			_setb(o + 20, 1);
			_setb(o + 21, 2);
			_setb(o + 22, 2);
			_setb(o + 23, 2);
			_setb(o + 24, 2);
			_setb(o + 25, 1);
			_setb(o + 26, 2);
			_setb(o + 27, 2);
			_setb(o + 28, 2);
			_setb(o + 29, 2);
			_setb(o + 30, 1);
			
			case 39:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   21.429 * s);
			_setf(o + ( 1 << 2), y +  -49.999 * s);
			_setf(o + ( 2 << 2), x +   21.429 * s);
			_setf(o + ( 3 << 2), y +  -78.570 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +  -78.570 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +  -49.999 * s);
			_setf(o + ( 8 << 2), x +   21.429 * s);
			_setf(o + ( 9 << 2), y +  -49.999 * s);
			_setf(o + (10 << 2), x +   28.571 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 40:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   14.286 * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +   14.286 * s);
			_setf(o + ( 3 << 2), y +  -64.285 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +  -64.285 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +  -14.285 * s);
			_setf(o + ( 8 << 2), x +   14.286 * s);
			_setf(o + ( 9 << 2), y +  -14.285 * s);
			_setf(o + (10 << 2), x +   14.286 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   35.714 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   35.714 * s);
			_setf(o + (15 << 2), y +  -21.428 * s);
			_setf(o + (16 << 2), x +   21.429 * s);
			_setf(o + (17 << 2), y +  -21.428 * s);
			_setf(o + (18 << 2), x +   21.429 * s);
			_setf(o + (19 << 2), y +  -57.142 * s);
			_setf(o + (20 << 2), x +   35.714 * s);
			_setf(o + (21 << 2), y +  -57.142 * s);
			_setf(o + (22 << 2), x +   35.714 * s);
			_setf(o + (23 << 2), y +  -78.570 * s);
			_setf(o + (24 << 2), x +   14.286 * s);
			_setf(o + (25 << 2), y +  -78.570 * s);
			_setf(o + (26 << 2), x +   42.857 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 41:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   21.428 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   21.428 * s);
			_setf(o + ( 3 << 2), y +  -14.285 * s);
			_setf(o + ( 4 << 2), x +   35.714 * s);
			_setf(o + ( 5 << 2), y +  -14.285 * s);
			_setf(o + ( 6 << 2), x +   35.714 * s);
			_setf(o + ( 7 << 2), y +  -64.285 * s);
			_setf(o + ( 8 << 2), x +   21.428 * s);
			_setf(o + ( 9 << 2), y +  -64.285 * s);
			_setf(o + (10 << 2), x +   21.428 * s);
			_setf(o + (11 << 2), y +  -78.570 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +  -78.570 * s);
			_setf(o + (14 << 2), x +       0. * s);
			_setf(o + (15 << 2), y +  -57.142 * s);
			_setf(o + (16 << 2), x +   14.285 * s);
			_setf(o + (17 << 2), y +  -57.142 * s);
			_setf(o + (18 << 2), x +   14.285 * s);
			_setf(o + (19 << 2), y +  -21.428 * s);
			_setf(o + (20 << 2), x +       0. * s);
			_setf(o + (21 << 2), y +  -21.428 * s);
			_setf(o + (22 << 2), x +       0. * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   21.428 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   42.856 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 42:
			
			o = _posf(44);
			_setf(o + ( 0 << 2), x +   28.571 * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +   28.571 * s);
			_setf(o + ( 3 << 2), y +  -64.285 * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +  -64.285 * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +  -78.570 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -78.570 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +  -57.142 * s);
			_setf(o + (12 << 2), x +   14.285 * s);
			_setf(o + (13 << 2), y +  -57.142 * s);
			_setf(o + (14 << 2), x +   14.285 * s);
			_setf(o + (15 << 2), y +  -49.999 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -49.999 * s);
			_setf(o + (18 << 2), x +       0. * s);
			_setf(o + (19 << 2), y +  -28.571 * s);
			_setf(o + (20 << 2), x +   21.428 * s);
			_setf(o + (21 << 2), y +  -28.571 * s);
			_setf(o + (22 << 2), x +   21.428 * s);
			_setf(o + (23 << 2), y +  -42.856 * s);
			_setf(o + (24 << 2), x +   28.571 * s);
			_setf(o + (25 << 2), y +  -42.856 * s);
			_setf(o + (26 << 2), x +   28.571 * s);
			_setf(o + (27 << 2), y +  -28.571 * s);
			_setf(o + (28 << 2), x +   49.999 * s);
			_setf(o + (29 << 2), y +  -28.571 * s);
			_setf(o + (30 << 2), x +   49.999 * s);
			_setf(o + (31 << 2), y +  -49.999 * s);
			_setf(o + (32 << 2), x +   35.714 * s);
			_setf(o + (33 << 2), y +  -49.999 * s);
			_setf(o + (34 << 2), x +   35.714 * s);
			_setf(o + (35 << 2), y +  -57.142 * s);
			_setf(o + (36 << 2), x +   49.999 * s);
			_setf(o + (37 << 2), y +  -57.142 * s);
			_setf(o + (38 << 2), x +   49.999 * s);
			_setf(o + (39 << 2), y +  -78.570 * s);
			_setf(o + (40 << 2), x +   28.571 * s);
			_setf(o + (41 << 2), y +  -78.570 * s);
			_setf(o + (42 << 2), x +   57.142 * s);
			_setf(o + (43 << 2), y +       0. * s);
			o = _posb(22);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 2);
			_setb(o + 16, 2);
			_setb(o + 17, 2);
			_setb(o + 18, 2);
			_setb(o + 19, 2);
			_setb(o + 20, 2);
			_setb(o + 21, 1);
			
			case 43:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   42.856 * s);
			_setf(o + ( 1 << 2), y +  -49.999 * s);
			_setf(o + ( 2 << 2), x +   42.856 * s);
			_setf(o + ( 3 << 2), y +  -71.427 * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +  -71.427 * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +  -49.999 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -49.999 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +  -28.571 * s);
			_setf(o + (12 << 2), x +   21.428 * s);
			_setf(o + (13 << 2), y +  -28.571 * s);
			_setf(o + (14 << 2), x +   21.428 * s);
			_setf(o + (15 << 2), y +   -7.143 * s);
			_setf(o + (16 << 2), x +   42.856 * s);
			_setf(o + (17 << 2), y +   -7.143 * s);
			_setf(o + (18 << 2), x +   42.856 * s);
			_setf(o + (19 << 2), y +  -28.571 * s);
			_setf(o + (20 << 2), x +   64.285 * s);
			_setf(o + (21 << 2), y +  -28.571 * s);
			_setf(o + (22 << 2), x +   64.285 * s);
			_setf(o + (23 << 2), y +  -49.999 * s);
			_setf(o + (24 << 2), x +   42.856 * s);
			_setf(o + (25 << 2), y +  -49.999 * s);
			_setf(o + (26 << 2), x +   71.427 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 44:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -21.428 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +   14.286 * s);
			_setf(o + ( 4 << 2), x +   21.429 * s);
			_setf(o + ( 5 << 2), y +   14.286 * s);
			_setf(o + ( 6 << 2), x +   21.429 * s);
			_setf(o + ( 7 << 2), y +  -21.428 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -21.428 * s);
			_setf(o + (10 << 2), x +   28.571 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 45:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -49.999 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -28.571 * s);
			_setf(o + ( 4 << 2), x +   50.000 * s);
			_setf(o + ( 5 << 2), y +  -28.571 * s);
			_setf(o + ( 6 << 2), x +   50.000 * s);
			_setf(o + ( 7 << 2), y +  -49.999 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -49.999 * s);
			_setf(o + (10 << 2), x +   57.142 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 46:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -21.428 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   21.429 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   21.429 * s);
			_setf(o + ( 7 << 2), y +  -21.428 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -21.428 * s);
			_setf(o + (10 << 2), x +   28.571 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 47:
			
			o = _posf(38);
			_setf(o + ( 0 << 2), x +   21.429 * s);
			_setf(o + ( 1 << 2), y +  -57.142 * s);
			_setf(o + ( 2 << 2), x +   21.429 * s);
			_setf(o + ( 3 << 2), y +  -57.142 * s);
			_setf(o + ( 4 << 2), x +   14.286 * s);
			_setf(o + ( 5 << 2), y +  -57.142 * s);
			_setf(o + ( 6 << 2), x +   14.286 * s);
			_setf(o + ( 7 << 2), y +  -35.714 * s);
			_setf(o + ( 8 << 2), x +    7.143 * s);
			_setf(o + ( 9 << 2), y +  -35.714 * s);
			_setf(o + (10 << 2), x +    7.143 * s);
			_setf(o + (11 << 2), y +  -14.285 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +  -14.285 * s);
			_setf(o + (14 << 2), x +       0. * s);
			_setf(o + (15 << 2), y +    7.143 * s);
			_setf(o + (16 << 2), x +   21.429 * s);
			_setf(o + (17 << 2), y +    7.143 * s);
			_setf(o + (18 << 2), x +   21.429 * s);
			_setf(o + (19 << 2), y +  -14.285 * s);
			_setf(o + (20 << 2), x +   28.571 * s);
			_setf(o + (21 << 2), y +  -14.285 * s);
			_setf(o + (22 << 2), x +   28.571 * s);
			_setf(o + (23 << 2), y +  -35.714 * s);
			_setf(o + (24 << 2), x +   35.714 * s);
			_setf(o + (25 << 2), y +  -35.714 * s);
			_setf(o + (26 << 2), x +   35.714 * s);
			_setf(o + (27 << 2), y +  -57.142 * s);
			_setf(o + (28 << 2), x +   42.857 * s);
			_setf(o + (29 << 2), y +  -57.142 * s);
			_setf(o + (30 << 2), x +   42.857 * s);
			_setf(o + (31 << 2), y +  -78.570 * s);
			_setf(o + (32 << 2), x +   21.429 * s);
			_setf(o + (33 << 2), y +  -78.570 * s);
			_setf(o + (34 << 2), x +   21.429 * s);
			_setf(o + (35 << 2), y +  -57.142 * s);
			_setf(o + (36 << 2), x +   50.000 * s);
			_setf(o + (37 << 2), y +       0. * s);
			o = _posb(19);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 2);
			_setb(o + 16, 2);
			_setb(o + 17, 2);
			_setb(o + 18, 1);
			
			case 48:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   49.999 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   49.999 * s);
			_setf(o + ( 7 << 2), y +  -78.570 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -78.570 * s);
			_setf(o + (10 << 2), x +   28.571 * s);
			_setf(o + (11 << 2), y +  -21.428 * s);
			_setf(o + (12 << 2), x +   21.428 * s);
			_setf(o + (13 << 2), y +  -21.428 * s);
			_setf(o + (14 << 2), x +   21.428 * s);
			_setf(o + (15 << 2), y +  -57.142 * s);
			_setf(o + (16 << 2), x +   28.571 * s);
			_setf(o + (17 << 2), y +  -57.142 * s);
			_setf(o + (18 << 2), x +   28.571 * s);
			_setf(o + (19 << 2), y +  -21.428 * s);
			_setf(o + (20 << 2), x +   57.142 * s);
			_setf(o + (21 << 2), y +       0. * s);
			o = _posb(11);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 1);
			
			case 49:
			
			o = _posf(16);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -57.142 * s);
			_setf(o + ( 4 << 2), x +    7.142 * s);
			_setf(o + ( 5 << 2), y +  -57.142 * s);
			_setf(o + ( 6 << 2), x +    7.142 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   28.571 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   28.571 * s);
			_setf(o + (11 << 2), y +  -78.570 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +  -78.570 * s);
			_setf(o + (14 << 2), x +   35.713 * s);
			_setf(o + (15 << 2), y +       0. * s);
			o = _posb(8);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 1);
			
			case 50:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -57.142 * s);
			_setf(o + ( 4 << 2), x +   28.571 * s);
			_setf(o + ( 5 << 2), y +  -57.142 * s);
			_setf(o + ( 6 << 2), x +   28.571 * s);
			_setf(o + ( 7 << 2), y +  -49.999 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -49.999 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   50.000 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   50.000 * s);
			_setf(o + (15 << 2), y +  -21.428 * s);
			_setf(o + (16 << 2), x +   21.429 * s);
			_setf(o + (17 << 2), y +  -21.428 * s);
			_setf(o + (18 << 2), x +   21.429 * s);
			_setf(o + (19 << 2), y +  -28.571 * s);
			_setf(o + (20 << 2), x +   50.000 * s);
			_setf(o + (21 << 2), y +  -28.571 * s);
			_setf(o + (22 << 2), x +   50.000 * s);
			_setf(o + (23 << 2), y +  -78.570 * s);
			_setf(o + (24 << 2), x +       0. * s);
			_setf(o + (25 << 2), y +  -78.570 * s);
			_setf(o + (26 << 2), x +   57.142 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 51:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -57.142 * s);
			_setf(o + ( 4 << 2), x +   28.571 * s);
			_setf(o + ( 5 << 2), y +  -57.142 * s);
			_setf(o + ( 6 << 2), x +   28.571 * s);
			_setf(o + ( 7 << 2), y +  -49.999 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -49.999 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +  -28.571 * s);
			_setf(o + (12 << 2), x +   28.571 * s);
			_setf(o + (13 << 2), y +  -28.571 * s);
			_setf(o + (14 << 2), x +   28.571 * s);
			_setf(o + (15 << 2), y +  -21.428 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -21.428 * s);
			_setf(o + (18 << 2), x +       0. * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   50.000 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   50.000 * s);
			_setf(o + (23 << 2), y +  -78.570 * s);
			_setf(o + (24 << 2), x +       0. * s);
			_setf(o + (25 << 2), y +  -78.570 * s);
			_setf(o + (26 << 2), x +   57.142 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 52:
			
			o = _posf(24);
			_setf(o + ( 0 << 2), x +   28.571 * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +   28.571 * s);
			_setf(o + ( 3 << 2), y +  -35.714 * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +  -35.714 * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +  -78.570 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -78.570 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +  -14.285 * s);
			_setf(o + (12 << 2), x +   28.571 * s);
			_setf(o + (13 << 2), y +  -14.285 * s);
			_setf(o + (14 << 2), x +   28.571 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   49.999 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   49.999 * s);
			_setf(o + (19 << 2), y +  -78.570 * s);
			_setf(o + (20 << 2), x +   28.571 * s);
			_setf(o + (21 << 2), y +  -78.570 * s);
			_setf(o + (22 << 2), x +   57.142 * s);
			_setf(o + (23 << 2), y +       0. * s);
			o = _posb(12);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 1);
			
			case 53:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -28.571 * s);
			_setf(o + ( 4 << 2), x +   28.571 * s);
			_setf(o + ( 5 << 2), y +  -28.571 * s);
			_setf(o + ( 6 << 2), x +   28.571 * s);
			_setf(o + ( 7 << 2), y +  -21.428 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -21.428 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   49.999 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   49.999 * s);
			_setf(o + (15 << 2), y +  -49.999 * s);
			_setf(o + (16 << 2), x +   21.428 * s);
			_setf(o + (17 << 2), y +  -49.999 * s);
			_setf(o + (18 << 2), x +   21.428 * s);
			_setf(o + (19 << 2), y +  -57.142 * s);
			_setf(o + (20 << 2), x +   49.999 * s);
			_setf(o + (21 << 2), y +  -57.142 * s);
			_setf(o + (22 << 2), x +   49.999 * s);
			_setf(o + (23 << 2), y +  -78.570 * s);
			_setf(o + (24 << 2), x +       0. * s);
			_setf(o + (25 << 2), y +  -78.570 * s);
			_setf(o + (26 << 2), x +   57.142 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 54:
			
			o = _posf(30);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   49.999 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   49.999 * s);
			_setf(o + ( 7 << 2), y +  -49.999 * s);
			_setf(o + ( 8 << 2), x +   21.428 * s);
			_setf(o + ( 9 << 2), y +  -49.999 * s);
			_setf(o + (10 << 2), x +   21.428 * s);
			_setf(o + (11 << 2), y +  -57.142 * s);
			_setf(o + (12 << 2), x +   49.999 * s);
			_setf(o + (13 << 2), y +  -57.142 * s);
			_setf(o + (14 << 2), x +   49.999 * s);
			_setf(o + (15 << 2), y +  -78.570 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -78.570 * s);
			_setf(o + (18 << 2), x +   28.571 * s);
			_setf(o + (19 << 2), y +  -21.428 * s);
			_setf(o + (20 << 2), x +   21.428 * s);
			_setf(o + (21 << 2), y +  -21.428 * s);
			_setf(o + (22 << 2), x +   21.428 * s);
			_setf(o + (23 << 2), y +  -28.571 * s);
			_setf(o + (24 << 2), x +   28.571 * s);
			_setf(o + (25 << 2), y +  -28.571 * s);
			_setf(o + (26 << 2), x +   28.571 * s);
			_setf(o + (27 << 2), y +  -21.428 * s);
			_setf(o + (28 << 2), x +   57.142 * s);
			_setf(o + (29 << 2), y +       0. * s);
			o = _posb(15);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 1);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 1);
			
			case 55:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -35.714 * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +  -35.714 * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +  -57.142 * s);
			_setf(o + ( 8 << 2), x +   28.571 * s);
			_setf(o + ( 9 << 2), y +  -57.142 * s);
			_setf(o + (10 << 2), x +   28.571 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   49.999 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   49.999 * s);
			_setf(o + (15 << 2), y +  -78.570 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -78.570 * s);
			_setf(o + (18 << 2), x +   57.142 * s);
			_setf(o + (19 << 2), y +       0. * s);
			o = _posb(10);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 1);
			
			case 56:
			
			o = _posf(32);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   49.999 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   49.999 * s);
			_setf(o + ( 7 << 2), y +  -78.570 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -78.570 * s);
			_setf(o + (10 << 2), x +   28.571 * s);
			_setf(o + (11 << 2), y +  -49.999 * s);
			_setf(o + (12 << 2), x +   21.428 * s);
			_setf(o + (13 << 2), y +  -49.999 * s);
			_setf(o + (14 << 2), x +   21.428 * s);
			_setf(o + (15 << 2), y +  -57.142 * s);
			_setf(o + (16 << 2), x +   28.571 * s);
			_setf(o + (17 << 2), y +  -57.142 * s);
			_setf(o + (18 << 2), x +   28.571 * s);
			_setf(o + (19 << 2), y +  -49.999 * s);
			_setf(o + (20 << 2), x +   28.571 * s);
			_setf(o + (21 << 2), y +  -21.428 * s);
			_setf(o + (22 << 2), x +   21.428 * s);
			_setf(o + (23 << 2), y +  -21.428 * s);
			_setf(o + (24 << 2), x +   21.428 * s);
			_setf(o + (25 << 2), y +  -28.571 * s);
			_setf(o + (26 << 2), x +   28.571 * s);
			_setf(o + (27 << 2), y +  -28.571 * s);
			_setf(o + (28 << 2), x +   28.571 * s);
			_setf(o + (29 << 2), y +  -21.428 * s);
			_setf(o + (30 << 2), x +   57.142 * s);
			_setf(o + (31 << 2), y +       0. * s);
			o = _posb(16);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 1);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 1);
			
			case 57:
			
			o = _posf(30);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -28.571 * s);
			_setf(o + ( 4 << 2), x +   28.571 * s);
			_setf(o + ( 5 << 2), y +  -28.571 * s);
			_setf(o + ( 6 << 2), x +   28.571 * s);
			_setf(o + ( 7 << 2), y +  -21.428 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -21.428 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   49.999 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   49.999 * s);
			_setf(o + (15 << 2), y +  -78.570 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -78.570 * s);
			_setf(o + (18 << 2), x +   28.571 * s);
			_setf(o + (19 << 2), y +  -49.999 * s);
			_setf(o + (20 << 2), x +   21.428 * s);
			_setf(o + (21 << 2), y +  -49.999 * s);
			_setf(o + (22 << 2), x +   21.428 * s);
			_setf(o + (23 << 2), y +  -57.142 * s);
			_setf(o + (24 << 2), x +   28.571 * s);
			_setf(o + (25 << 2), y +  -57.142 * s);
			_setf(o + (26 << 2), x +   28.571 * s);
			_setf(o + (27 << 2), y +  -49.999 * s);
			_setf(o + (28 << 2), x +   57.142 * s);
			_setf(o + (29 << 2), y +       0. * s);
			o = _posb(15);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 1);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 1);
			
			case 58:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -64.285 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -42.856 * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +  -42.856 * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +  -64.285 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -64.285 * s);
			_setf(o + (10 << 2), x +   21.428 * s);
			_setf(o + (11 << 2), y +  -14.285 * s);
			_setf(o + (12 << 2), x +   21.428 * s);
			_setf(o + (13 << 2), y +  -35.714 * s);
			_setf(o + (14 << 2), x +       0. * s);
			_setf(o + (15 << 2), y +  -35.714 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -14.285 * s);
			_setf(o + (18 << 2), x +   21.428 * s);
			_setf(o + (19 << 2), y +  -14.285 * s);
			_setf(o + (20 << 2), x +   28.571 * s);
			_setf(o + (21 << 2), y +       0. * s);
			o = _posb(11);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 1);
			
			case 59:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   21.428 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +  -35.714 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +  -35.714 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   21.428 * s);
			_setf(o + (11 << 2), y +  -42.856 * s);
			_setf(o + (12 << 2), x +   21.428 * s);
			_setf(o + (13 << 2), y +  -64.285 * s);
			_setf(o + (14 << 2), x +       0. * s);
			_setf(o + (15 << 2), y +  -64.285 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -42.856 * s);
			_setf(o + (18 << 2), x +   21.428 * s);
			_setf(o + (19 << 2), y +  -42.856 * s);
			_setf(o + (20 << 2), x +   28.571 * s);
			_setf(o + (21 << 2), y +       0. * s);
			o = _posb(11);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 1);
			
			case 60:
			
			o = _posf(44);
			_setf(o + ( 0 << 2), x +   28.571 * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +   28.571 * s);
			_setf(o + ( 3 << 2), y +  -64.285 * s);
			_setf(o + ( 4 << 2), x +   14.285 * s);
			_setf(o + ( 5 << 2), y +  -64.285 * s);
			_setf(o + ( 6 << 2), x +   14.285 * s);
			_setf(o + ( 7 << 2), y +  -49.999 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -49.999 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +  -28.571 * s);
			_setf(o + (12 << 2), x +   14.285 * s);
			_setf(o + (13 << 2), y +  -28.571 * s);
			_setf(o + (14 << 2), x +   14.285 * s);
			_setf(o + (15 << 2), y +  -14.285 * s);
			_setf(o + (16 << 2), x +   28.571 * s);
			_setf(o + (17 << 2), y +  -14.285 * s);
			_setf(o + (18 << 2), x +   28.571 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   49.999 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   49.999 * s);
			_setf(o + (23 << 2), y +  -21.428 * s);
			_setf(o + (24 << 2), x +   35.714 * s);
			_setf(o + (25 << 2), y +  -21.428 * s);
			_setf(o + (26 << 2), x +   35.714 * s);
			_setf(o + (27 << 2), y +  -35.714 * s);
			_setf(o + (28 << 2), x +   21.428 * s);
			_setf(o + (29 << 2), y +  -35.714 * s);
			_setf(o + (30 << 2), x +   21.428 * s);
			_setf(o + (31 << 2), y +  -42.856 * s);
			_setf(o + (32 << 2), x +   35.714 * s);
			_setf(o + (33 << 2), y +  -42.856 * s);
			_setf(o + (34 << 2), x +   35.714 * s);
			_setf(o + (35 << 2), y +  -57.142 * s);
			_setf(o + (36 << 2), x +   49.999 * s);
			_setf(o + (37 << 2), y +  -57.142 * s);
			_setf(o + (38 << 2), x +   49.999 * s);
			_setf(o + (39 << 2), y +  -78.570 * s);
			_setf(o + (40 << 2), x +   28.571 * s);
			_setf(o + (41 << 2), y +  -78.570 * s);
			_setf(o + (42 << 2), x +   57.142 * s);
			_setf(o + (43 << 2), y +       0. * s);
			o = _posb(22);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 2);
			_setb(o + 16, 2);
			_setb(o + 17, 2);
			_setb(o + 18, 2);
			_setb(o + 19, 2);
			_setb(o + 20, 2);
			_setb(o + 21, 1);
			
			case 61:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -64.285 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -42.856 * s);
			_setf(o + ( 4 << 2), x +   49.999 * s);
			_setf(o + ( 5 << 2), y +  -42.856 * s);
			_setf(o + ( 6 << 2), x +   49.999 * s);
			_setf(o + ( 7 << 2), y +  -64.285 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -64.285 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +  -35.714 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +  -14.285 * s);
			_setf(o + (14 << 2), x +   49.999 * s);
			_setf(o + (15 << 2), y +  -14.285 * s);
			_setf(o + (16 << 2), x +   49.999 * s);
			_setf(o + (17 << 2), y +  -35.714 * s);
			_setf(o + (18 << 2), x +       0. * s);
			_setf(o + (19 << 2), y +  -35.714 * s);
			_setf(o + (20 << 2), x +   57.142 * s);
			_setf(o + (21 << 2), y +       0. * s);
			o = _posb(11);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 1);
			
			case 62:
			
			o = _posf(44);
			_setf(o + ( 0 << 2), x +   21.428 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   21.428 * s);
			_setf(o + ( 3 << 2), y +  -14.285 * s);
			_setf(o + ( 4 << 2), x +   35.714 * s);
			_setf(o + ( 5 << 2), y +  -14.285 * s);
			_setf(o + ( 6 << 2), x +   35.714 * s);
			_setf(o + ( 7 << 2), y +  -28.571 * s);
			_setf(o + ( 8 << 2), x +   49.999 * s);
			_setf(o + ( 9 << 2), y +  -28.571 * s);
			_setf(o + (10 << 2), x +   49.999 * s);
			_setf(o + (11 << 2), y +  -49.999 * s);
			_setf(o + (12 << 2), x +   35.714 * s);
			_setf(o + (13 << 2), y +  -49.999 * s);
			_setf(o + (14 << 2), x +   35.714 * s);
			_setf(o + (15 << 2), y +  -64.285 * s);
			_setf(o + (16 << 2), x +   21.428 * s);
			_setf(o + (17 << 2), y +  -64.285 * s);
			_setf(o + (18 << 2), x +   21.428 * s);
			_setf(o + (19 << 2), y +  -78.570 * s);
			_setf(o + (20 << 2), x +       0. * s);
			_setf(o + (21 << 2), y +  -78.570 * s);
			_setf(o + (22 << 2), x +       0. * s);
			_setf(o + (23 << 2), y +  -57.142 * s);
			_setf(o + (24 << 2), x +   14.285 * s);
			_setf(o + (25 << 2), y +  -57.142 * s);
			_setf(o + (26 << 2), x +   14.285 * s);
			_setf(o + (27 << 2), y +  -42.856 * s);
			_setf(o + (28 << 2), x +   28.571 * s);
			_setf(o + (29 << 2), y +  -42.856 * s);
			_setf(o + (30 << 2), x +   28.571 * s);
			_setf(o + (31 << 2), y +  -35.714 * s);
			_setf(o + (32 << 2), x +   14.285 * s);
			_setf(o + (33 << 2), y +  -35.714 * s);
			_setf(o + (34 << 2), x +   14.285 * s);
			_setf(o + (35 << 2), y +  -21.428 * s);
			_setf(o + (36 << 2), x +       0. * s);
			_setf(o + (37 << 2), y +  -21.428 * s);
			_setf(o + (38 << 2), x +       0. * s);
			_setf(o + (39 << 2), y +       0. * s);
			_setf(o + (40 << 2), x +   21.428 * s);
			_setf(o + (41 << 2), y +       0. * s);
			_setf(o + (42 << 2), x +   57.142 * s);
			_setf(o + (43 << 2), y +       0. * s);
			o = _posb(22);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 2);
			_setb(o + 16, 2);
			_setb(o + 17, 2);
			_setb(o + 18, 2);
			_setb(o + 19, 2);
			_setb(o + 20, 2);
			_setb(o + 21, 1);
			
			case 63:
			
			o = _posf(30);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -21.428 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +  -21.428 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -21.428 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +  -78.570 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +  -57.142 * s);
			_setf(o + (14 << 2), x +   28.571 * s);
			_setf(o + (15 << 2), y +  -57.142 * s);
			_setf(o + (16 << 2), x +   28.571 * s);
			_setf(o + (17 << 2), y +  -49.999 * s);
			_setf(o + (18 << 2), x +       0. * s);
			_setf(o + (19 << 2), y +  -49.999 * s);
			_setf(o + (20 << 2), x +       0. * s);
			_setf(o + (21 << 2), y +  -28.571 * s);
			_setf(o + (22 << 2), x +   49.999 * s);
			_setf(o + (23 << 2), y +  -28.571 * s);
			_setf(o + (24 << 2), x +   49.999 * s);
			_setf(o + (25 << 2), y +  -78.570 * s);
			_setf(o + (26 << 2), x +       0. * s);
			_setf(o + (27 << 2), y +  -78.570 * s);
			_setf(o + (28 << 2), x +   57.142 * s);
			_setf(o + (29 << 2), y +       0. * s);
			o = _posb(15);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 1);
			
			case 64:
			
			o = _posf(36);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   78.570 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   78.570 * s);
			_setf(o + ( 7 << 2), y +  -78.570 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -78.570 * s);
			_setf(o + (10 << 2), x +   57.142 * s);
			_setf(o + (11 << 2), y +  -49.999 * s);
			_setf(o + (12 << 2), x +   28.571 * s);
			_setf(o + (13 << 2), y +  -49.999 * s);
			_setf(o + (14 << 2), x +   28.571 * s);
			_setf(o + (15 << 2), y +  -21.428 * s);
			_setf(o + (16 << 2), x +   21.428 * s);
			_setf(o + (17 << 2), y +  -21.428 * s);
			_setf(o + (18 << 2), x +   21.428 * s);
			_setf(o + (19 << 2), y +  -57.142 * s);
			_setf(o + (20 << 2), x +   57.142 * s);
			_setf(o + (21 << 2), y +  -57.142 * s);
			_setf(o + (22 << 2), x +   57.142 * s);
			_setf(o + (23 << 2), y +  -49.999 * s);
			_setf(o + (24 << 2), x +   57.142 * s);
			_setf(o + (25 << 2), y +  -21.428 * s);
			_setf(o + (26 << 2), x +   49.999 * s);
			_setf(o + (27 << 2), y +  -21.428 * s);
			_setf(o + (28 << 2), x +   49.999 * s);
			_setf(o + (29 << 2), y +  -28.571 * s);
			_setf(o + (30 << 2), x +   57.142 * s);
			_setf(o + (31 << 2), y +  -28.571 * s);
			_setf(o + (32 << 2), x +   57.142 * s);
			_setf(o + (33 << 2), y +  -21.428 * s);
			_setf(o + (34 << 2), x +   85.713 * s);
			_setf(o + (35 << 2), y +       0. * s);
			o = _posb(18);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 1);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 2);
			_setb(o + 16, 2);
			_setb(o + 17, 1);
			
			case 65:
			
			o = _posf(30);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +  -28.571 * s);
			_setf(o + ( 8 << 2), x +   28.571 * s);
			_setf(o + ( 9 << 2), y +  -28.571 * s);
			_setf(o + (10 << 2), x +   28.571 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   49.999 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   49.999 * s);
			_setf(o + (15 << 2), y +  -78.570 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -78.570 * s);
			_setf(o + (18 << 2), x +   28.571 * s);
			_setf(o + (19 << 2), y +  -49.999 * s);
			_setf(o + (20 << 2), x +   21.428 * s);
			_setf(o + (21 << 2), y +  -49.999 * s);
			_setf(o + (22 << 2), x +   21.428 * s);
			_setf(o + (23 << 2), y +  -57.142 * s);
			_setf(o + (24 << 2), x +   28.571 * s);
			_setf(o + (25 << 2), y +  -57.142 * s);
			_setf(o + (26 << 2), x +   28.571 * s);
			_setf(o + (27 << 2), y +  -49.999 * s);
			_setf(o + (28 << 2), x +   57.142 * s);
			_setf(o + (29 << 2), y +       0. * s);
			o = _posb(15);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 1);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 1);
			
			case 66:
			
			o = _posf(40);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   49.999 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   49.999 * s);
			_setf(o + ( 7 << 2), y +  -35.714 * s);
			_setf(o + ( 8 << 2), x +   42.856 * s);
			_setf(o + ( 9 << 2), y +  -35.714 * s);
			_setf(o + (10 << 2), x +   42.856 * s);
			_setf(o + (11 << 2), y +  -42.856 * s);
			_setf(o + (12 << 2), x +   49.999 * s);
			_setf(o + (13 << 2), y +  -42.856 * s);
			_setf(o + (14 << 2), x +   49.999 * s);
			_setf(o + (15 << 2), y +  -78.570 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -78.570 * s);
			_setf(o + (18 << 2), x +   28.571 * s);
			_setf(o + (19 << 2), y +  -21.428 * s);
			_setf(o + (20 << 2), x +   21.428 * s);
			_setf(o + (21 << 2), y +  -21.428 * s);
			_setf(o + (22 << 2), x +   21.428 * s);
			_setf(o + (23 << 2), y +  -28.571 * s);
			_setf(o + (24 << 2), x +   28.571 * s);
			_setf(o + (25 << 2), y +  -28.571 * s);
			_setf(o + (26 << 2), x +   28.571 * s);
			_setf(o + (27 << 2), y +  -21.428 * s);
			_setf(o + (28 << 2), x +   21.428 * s);
			_setf(o + (29 << 2), y +  -49.999 * s);
			_setf(o + (30 << 2), x +   21.428 * s);
			_setf(o + (31 << 2), y +  -57.142 * s);
			_setf(o + (32 << 2), x +   28.571 * s);
			_setf(o + (33 << 2), y +  -57.142 * s);
			_setf(o + (34 << 2), x +   28.571 * s);
			_setf(o + (35 << 2), y +  -49.999 * s);
			_setf(o + (36 << 2), x +   21.428 * s);
			_setf(o + (37 << 2), y +  -49.999 * s);
			_setf(o + (38 << 2), x +   57.142 * s);
			_setf(o + (39 << 2), y +       0. * s);
			o = _posb(20);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 1);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 1);
			_setb(o + 15, 2);
			_setb(o + 16, 2);
			_setb(o + 17, 2);
			_setb(o + 18, 2);
			_setb(o + 19, 1);
			
			case 67:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   49.999 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   49.999 * s);
			_setf(o + ( 7 << 2), y +  -35.714 * s);
			_setf(o + ( 8 << 2), x +   28.571 * s);
			_setf(o + ( 9 << 2), y +  -35.714 * s);
			_setf(o + (10 << 2), x +   28.571 * s);
			_setf(o + (11 << 2), y +  -21.428 * s);
			_setf(o + (12 << 2), x +   21.428 * s);
			_setf(o + (13 << 2), y +  -21.428 * s);
			_setf(o + (14 << 2), x +   21.428 * s);
			_setf(o + (15 << 2), y +  -57.142 * s);
			_setf(o + (16 << 2), x +   28.571 * s);
			_setf(o + (17 << 2), y +  -57.142 * s);
			_setf(o + (18 << 2), x +   28.571 * s);
			_setf(o + (19 << 2), y +  -42.856 * s);
			_setf(o + (20 << 2), x +   49.999 * s);
			_setf(o + (21 << 2), y +  -42.856 * s);
			_setf(o + (22 << 2), x +   49.999 * s);
			_setf(o + (23 << 2), y +  -78.570 * s);
			_setf(o + (24 << 2), x +       0. * s);
			_setf(o + (25 << 2), y +  -78.570 * s);
			_setf(o + (26 << 2), x +   57.142 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 68:
			
			o = _posf(30);
			_setf(o + ( 0 << 2), x +   42.856 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   42.856 * s);
			_setf(o + ( 3 << 2), y +   -7.143 * s);
			_setf(o + ( 4 << 2), x +   49.999 * s);
			_setf(o + ( 5 << 2), y +   -7.143 * s);
			_setf(o + ( 6 << 2), x +   49.999 * s);
			_setf(o + ( 7 << 2), y +  -71.427 * s);
			_setf(o + ( 8 << 2), x +   42.856 * s);
			_setf(o + ( 9 << 2), y +  -71.427 * s);
			_setf(o + (10 << 2), x +   42.856 * s);
			_setf(o + (11 << 2), y +  -78.570 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +  -78.570 * s);
			_setf(o + (14 << 2), x +       0. * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   42.856 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   21.428 * s);
			_setf(o + (19 << 2), y +  -57.142 * s);
			_setf(o + (20 << 2), x +   28.571 * s);
			_setf(o + (21 << 2), y +  -57.142 * s);
			_setf(o + (22 << 2), x +   28.571 * s);
			_setf(o + (23 << 2), y +  -21.428 * s);
			_setf(o + (24 << 2), x +   21.428 * s);
			_setf(o + (25 << 2), y +  -21.428 * s);
			_setf(o + (26 << 2), x +   21.428 * s);
			_setf(o + (27 << 2), y +  -57.142 * s);
			_setf(o + (28 << 2), x +   57.142 * s);
			_setf(o + (29 << 2), y +       0. * s);
			o = _posb(15);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 1);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 1);
			
			case 69:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   49.999 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   49.999 * s);
			_setf(o + ( 3 << 2), y +  -21.428 * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +  -21.428 * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +  -28.571 * s);
			_setf(o + ( 8 << 2), x +   49.999 * s);
			_setf(o + ( 9 << 2), y +  -28.571 * s);
			_setf(o + (10 << 2), x +   49.999 * s);
			_setf(o + (11 << 2), y +  -49.999 * s);
			_setf(o + (12 << 2), x +   21.428 * s);
			_setf(o + (13 << 2), y +  -49.999 * s);
			_setf(o + (14 << 2), x +   21.428 * s);
			_setf(o + (15 << 2), y +  -57.142 * s);
			_setf(o + (16 << 2), x +   49.999 * s);
			_setf(o + (17 << 2), y +  -57.142 * s);
			_setf(o + (18 << 2), x +   49.999 * s);
			_setf(o + (19 << 2), y +  -78.570 * s);
			_setf(o + (20 << 2), x +       0. * s);
			_setf(o + (21 << 2), y +  -78.570 * s);
			_setf(o + (22 << 2), x +       0. * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   49.999 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   57.142 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 70:
			
			o = _posf(24);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +  -28.571 * s);
			_setf(o + ( 8 << 2), x +   49.999 * s);
			_setf(o + ( 9 << 2), y +  -28.571 * s);
			_setf(o + (10 << 2), x +   49.999 * s);
			_setf(o + (11 << 2), y +  -49.999 * s);
			_setf(o + (12 << 2), x +   21.428 * s);
			_setf(o + (13 << 2), y +  -49.999 * s);
			_setf(o + (14 << 2), x +   21.428 * s);
			_setf(o + (15 << 2), y +  -57.142 * s);
			_setf(o + (16 << 2), x +   49.999 * s);
			_setf(o + (17 << 2), y +  -57.142 * s);
			_setf(o + (18 << 2), x +   49.999 * s);
			_setf(o + (19 << 2), y +  -78.570 * s);
			_setf(o + (20 << 2), x +       0. * s);
			_setf(o + (21 << 2), y +  -78.570 * s);
			_setf(o + (22 << 2), x +   57.142 * s);
			_setf(o + (23 << 2), y +       0. * s);
			o = _posb(12);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 1);
			
			case 71:
			
			o = _posf(24);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   49.999 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   49.999 * s);
			_setf(o + ( 7 << 2), y +  -49.999 * s);
			_setf(o + ( 8 << 2), x +   28.571 * s);
			_setf(o + ( 9 << 2), y +  -49.999 * s);
			_setf(o + (10 << 2), x +   28.571 * s);
			_setf(o + (11 << 2), y +  -21.428 * s);
			_setf(o + (12 << 2), x +   21.428 * s);
			_setf(o + (13 << 2), y +  -21.428 * s);
			_setf(o + (14 << 2), x +   21.428 * s);
			_setf(o + (15 << 2), y +  -57.142 * s);
			_setf(o + (16 << 2), x +   49.999 * s);
			_setf(o + (17 << 2), y +  -57.142 * s);
			_setf(o + (18 << 2), x +   49.999 * s);
			_setf(o + (19 << 2), y +  -78.570 * s);
			_setf(o + (20 << 2), x +       0. * s);
			_setf(o + (21 << 2), y +  -78.570 * s);
			_setf(o + (22 << 2), x +   57.142 * s);
			_setf(o + (23 << 2), y +       0. * s);
			o = _posb(12);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 1);
			
			case 72:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   28.571 * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +   28.571 * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +  -49.999 * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +  -78.570 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -78.570 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   21.428 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   21.428 * s);
			_setf(o + (15 << 2), y +  -28.571 * s);
			_setf(o + (16 << 2), x +   28.571 * s);
			_setf(o + (17 << 2), y +  -28.571 * s);
			_setf(o + (18 << 2), x +   28.571 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   49.999 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   49.999 * s);
			_setf(o + (23 << 2), y +  -78.570 * s);
			_setf(o + (24 << 2), x +   28.571 * s);
			_setf(o + (25 << 2), y +  -78.570 * s);
			_setf(o + (26 << 2), x +   57.142 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 73:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   21.428 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   21.428 * s);
			_setf(o + ( 3 << 2), y +  -78.570 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +  -78.570 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   21.428 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   28.571 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 74:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +   28.571 * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +   28.571 * s);
			_setf(o + ( 3 << 2), y +  -21.428 * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +  -21.428 * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +  -49.999 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -49.999 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   49.999 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   49.999 * s);
			_setf(o + (15 << 2), y +  -78.570 * s);
			_setf(o + (16 << 2), x +   28.571 * s);
			_setf(o + (17 << 2), y +  -78.570 * s);
			_setf(o + (18 << 2), x +   57.142 * s);
			_setf(o + (19 << 2), y +       0. * s);
			o = _posb(10);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 1);
			
			case 75:
			
			o = _posf(36);
			_setf(o + ( 0 << 2), x +   28.571 * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +   28.571 * s);
			_setf(o + ( 3 << 2), y +  -57.142 * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +  -57.142 * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +  -78.570 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -78.570 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   21.428 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   21.428 * s);
			_setf(o + (15 << 2), y +  -21.428 * s);
			_setf(o + (16 << 2), x +   28.571 * s);
			_setf(o + (17 << 2), y +  -21.428 * s);
			_setf(o + (18 << 2), x +   28.571 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   49.999 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   49.999 * s);
			_setf(o + (23 << 2), y +  -35.714 * s);
			_setf(o + (24 << 2), x +   42.856 * s);
			_setf(o + (25 << 2), y +  -35.714 * s);
			_setf(o + (26 << 2), x +   42.856 * s);
			_setf(o + (27 << 2), y +  -42.856 * s);
			_setf(o + (28 << 2), x +   49.999 * s);
			_setf(o + (29 << 2), y +  -42.856 * s);
			_setf(o + (30 << 2), x +   49.999 * s);
			_setf(o + (31 << 2), y +  -78.570 * s);
			_setf(o + (32 << 2), x +   28.571 * s);
			_setf(o + (33 << 2), y +  -78.570 * s);
			_setf(o + (34 << 2), x +   57.142 * s);
			_setf(o + (35 << 2), y +       0. * s);
			o = _posb(18);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 2);
			_setb(o + 16, 2);
			_setb(o + 17, 1);
			
			case 76:
			
			o = _posf(16);
			_setf(o + ( 0 << 2), x +   35.714 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   35.714 * s);
			_setf(o + ( 3 << 2), y +  -21.428 * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +  -21.428 * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +  -78.570 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -78.570 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   35.714 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   42.856 * s);
			_setf(o + (15 << 2), y +       0. * s);
			o = _posb(8);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 1);
			
			case 77:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   21.429 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   21.429 * s);
			_setf(o + ( 7 << 2), y +  -57.142 * s);
			_setf(o + ( 8 << 2), x +   28.571 * s);
			_setf(o + ( 9 << 2), y +  -57.142 * s);
			_setf(o + (10 << 2), x +   28.571 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   50.000 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   50.000 * s);
			_setf(o + (15 << 2), y +  -57.142 * s);
			_setf(o + (16 << 2), x +   57.142 * s);
			_setf(o + (17 << 2), y +  -57.142 * s);
			_setf(o + (18 << 2), x +   57.142 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   78.571 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   78.571 * s);
			_setf(o + (23 << 2), y +  -78.570 * s);
			_setf(o + (24 << 2), x +       0. * s);
			_setf(o + (25 << 2), y +  -78.570 * s);
			_setf(o + (26 << 2), x +   85.713 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 78:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +   21.429 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   21.429 * s);
			_setf(o + ( 3 << 2), y +  -57.142 * s);
			_setf(o + ( 4 << 2), x +   28.571 * s);
			_setf(o + ( 5 << 2), y +  -57.142 * s);
			_setf(o + ( 6 << 2), x +   28.571 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   50.000 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   50.000 * s);
			_setf(o + (11 << 2), y +  -78.570 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +  -78.570 * s);
			_setf(o + (14 << 2), x +       0. * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   21.429 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   57.142 * s);
			_setf(o + (19 << 2), y +       0. * s);
			o = _posb(10);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 1);
			
			case 79:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   49.999 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   49.999 * s);
			_setf(o + ( 7 << 2), y +  -78.570 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -78.570 * s);
			_setf(o + (10 << 2), x +   28.571 * s);
			_setf(o + (11 << 2), y +  -21.428 * s);
			_setf(o + (12 << 2), x +   21.428 * s);
			_setf(o + (13 << 2), y +  -21.428 * s);
			_setf(o + (14 << 2), x +   21.428 * s);
			_setf(o + (15 << 2), y +  -57.142 * s);
			_setf(o + (16 << 2), x +   28.571 * s);
			_setf(o + (17 << 2), y +  -57.142 * s);
			_setf(o + (18 << 2), x +   28.571 * s);
			_setf(o + (19 << 2), y +  -21.428 * s);
			_setf(o + (20 << 2), x +   57.142 * s);
			_setf(o + (21 << 2), y +       0. * s);
			o = _posb(11);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 1);
			
			case 80:
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +  -14.285 * s);
			_setf(o + ( 8 << 2), x +   49.999 * s);
			_setf(o + ( 9 << 2), y +  -14.285 * s);
			_setf(o + (10 << 2), x +   49.999 * s);
			_setf(o + (11 << 2), y +  -78.570 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +  -78.570 * s);
			_setf(o + (14 << 2), x +   28.571 * s);
			_setf(o + (15 << 2), y +  -35.714 * s);
			_setf(o + (16 << 2), x +   21.428 * s);
			_setf(o + (17 << 2), y +  -35.714 * s);
			_setf(o + (18 << 2), x +   21.428 * s);
			_setf(o + (19 << 2), y +  -57.142 * s);
			_setf(o + (20 << 2), x +   28.571 * s);
			_setf(o + (21 << 2), y +  -57.142 * s);
			_setf(o + (22 << 2), x +   28.571 * s);
			_setf(o + (23 << 2), y +  -35.714 * s);
			_setf(o + (24 << 2), x +   57.142 * s);
			_setf(o + (25 << 2), y +       0. * s);
			o = _posb(13);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 1);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 1);
			
			case 81:
			
			o = _posf(30);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   14.285 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   14.285 * s);
			_setf(o + ( 7 << 2), y +    7.143 * s);
			_setf(o + ( 8 << 2), x +   35.714 * s);
			_setf(o + ( 9 << 2), y +    7.143 * s);
			_setf(o + (10 << 2), x +   35.714 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   49.999 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   49.999 * s);
			_setf(o + (15 << 2), y +  -78.570 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -78.570 * s);
			_setf(o + (18 << 2), x +   28.571 * s);
			_setf(o + (19 << 2), y +  -21.428 * s);
			_setf(o + (20 << 2), x +   21.428 * s);
			_setf(o + (21 << 2), y +  -21.428 * s);
			_setf(o + (22 << 2), x +   21.428 * s);
			_setf(o + (23 << 2), y +  -57.142 * s);
			_setf(o + (24 << 2), x +   28.571 * s);
			_setf(o + (25 << 2), y +  -57.142 * s);
			_setf(o + (26 << 2), x +   28.571 * s);
			_setf(o + (27 << 2), y +  -21.428 * s);
			_setf(o + (28 << 2), x +   57.142 * s);
			_setf(o + (29 << 2), y +       0. * s);
			o = _posb(15);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 1);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 1);
			
			case 82:
			
			o = _posf(38);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +   -7.143 * s);
			_setf(o + ( 8 << 2), x +   28.571 * s);
			_setf(o + ( 9 << 2), y +   -7.143 * s);
			_setf(o + (10 << 2), x +   28.571 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   49.999 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   49.999 * s);
			_setf(o + (15 << 2), y +  -21.428 * s);
			_setf(o + (16 << 2), x +   42.856 * s);
			_setf(o + (17 << 2), y +  -21.428 * s);
			_setf(o + (18 << 2), x +   42.856 * s);
			_setf(o + (19 << 2), y +  -28.571 * s);
			_setf(o + (20 << 2), x +   49.999 * s);
			_setf(o + (21 << 2), y +  -28.571 * s);
			_setf(o + (22 << 2), x +   49.999 * s);
			_setf(o + (23 << 2), y +  -78.570 * s);
			_setf(o + (24 << 2), x +       0. * s);
			_setf(o + (25 << 2), y +  -78.570 * s);
			_setf(o + (26 << 2), x +   21.428 * s);
			_setf(o + (27 << 2), y +  -35.714 * s);
			_setf(o + (28 << 2), x +   21.428 * s);
			_setf(o + (29 << 2), y +  -57.142 * s);
			_setf(o + (30 << 2), x +   28.571 * s);
			_setf(o + (31 << 2), y +  -57.142 * s);
			_setf(o + (32 << 2), x +   28.571 * s);
			_setf(o + (33 << 2), y +  -35.714 * s);
			_setf(o + (34 << 2), x +   21.428 * s);
			_setf(o + (35 << 2), y +  -35.714 * s);
			_setf(o + (36 << 2), x +   57.142 * s);
			_setf(o + (37 << 2), y +       0. * s);
			o = _posb(19);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			_setb(o + 14, 2);
			_setb(o + 15, 2);
			_setb(o + 16, 2);
			_setb(o + 17, 2);
			_setb(o + 18, 1);
			
			case 83:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -28.571 * s);
			_setf(o + ( 4 << 2), x +   28.571 * s);
			_setf(o + ( 5 << 2), y +  -28.571 * s);
			_setf(o + ( 6 << 2), x +   28.571 * s);
			_setf(o + ( 7 << 2), y +  -21.428 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -21.428 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   49.999 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   49.999 * s);
			_setf(o + (15 << 2), y +  -49.999 * s);
			_setf(o + (16 << 2), x +   21.428 * s);
			_setf(o + (17 << 2), y +  -49.999 * s);
			_setf(o + (18 << 2), x +   21.428 * s);
			_setf(o + (19 << 2), y +  -57.142 * s);
			_setf(o + (20 << 2), x +   49.999 * s);
			_setf(o + (21 << 2), y +  -57.142 * s);
			_setf(o + (22 << 2), x +   49.999 * s);
			_setf(o + (23 << 2), y +  -78.570 * s);
			_setf(o + (24 << 2), x +       0. * s);
			_setf(o + (25 << 2), y +  -78.570 * s);
			_setf(o + (26 << 2), x +   57.142 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 84:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -57.142 * s);
			_setf(o + ( 4 << 2), x +   14.285 * s);
			_setf(o + ( 5 << 2), y +  -57.142 * s);
			_setf(o + ( 6 << 2), x +   14.285 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   35.714 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   35.714 * s);
			_setf(o + (11 << 2), y +  -57.142 * s);
			_setf(o + (12 << 2), x +   49.999 * s);
			_setf(o + (13 << 2), y +  -57.142 * s);
			_setf(o + (14 << 2), x +   49.999 * s);
			_setf(o + (15 << 2), y +  -78.570 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -78.570 * s);
			_setf(o + (18 << 2), x +   57.142 * s);
			_setf(o + (19 << 2), y +       0. * s);
			o = _posb(10);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 1);
			
			case 85:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +   28.571 * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +   28.571 * s);
			_setf(o + ( 3 << 2), y +  -21.428 * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +  -21.428 * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +  -78.570 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -78.570 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   49.999 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   49.999 * s);
			_setf(o + (15 << 2), y +  -78.570 * s);
			_setf(o + (16 << 2), x +   28.571 * s);
			_setf(o + (17 << 2), y +  -78.570 * s);
			_setf(o + (18 << 2), x +   57.142 * s);
			_setf(o + (19 << 2), y +       0. * s);
			o = _posb(10);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 1);
			
			case 86:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   28.571 * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +   28.571 * s);
			_setf(o + ( 3 << 2), y +  -21.428 * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +  -21.428 * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +  -78.570 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -78.570 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +   -7.143 * s);
			_setf(o + (12 << 2), x +    7.143 * s);
			_setf(o + (13 << 2), y +   -7.143 * s);
			_setf(o + (14 << 2), x +    7.143 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   42.856 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   42.856 * s);
			_setf(o + (19 << 2), y +   -7.143 * s);
			_setf(o + (20 << 2), x +   49.999 * s);
			_setf(o + (21 << 2), y +   -7.143 * s);
			_setf(o + (22 << 2), x +   49.999 * s);
			_setf(o + (23 << 2), y +  -78.570 * s);
			_setf(o + (24 << 2), x +   28.571 * s);
			_setf(o + (25 << 2), y +  -78.570 * s);
			_setf(o + (26 << 2), x +   57.142 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 87:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   57.142 * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +   57.142 * s);
			_setf(o + ( 3 << 2), y +  -21.428 * s);
			_setf(o + ( 4 << 2), x +   49.999 * s);
			_setf(o + ( 5 << 2), y +  -21.428 * s);
			_setf(o + ( 6 << 2), x +   49.999 * s);
			_setf(o + ( 7 << 2), y +  -78.570 * s);
			_setf(o + ( 8 << 2), x +   28.571 * s);
			_setf(o + ( 9 << 2), y +  -78.570 * s);
			_setf(o + (10 << 2), x +   28.571 * s);
			_setf(o + (11 << 2), y +  -21.428 * s);
			_setf(o + (12 << 2), x +   21.428 * s);
			_setf(o + (13 << 2), y +  -21.428 * s);
			_setf(o + (14 << 2), x +   21.428 * s);
			_setf(o + (15 << 2), y +  -78.570 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -78.570 * s);
			_setf(o + (18 << 2), x +       0. * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   78.570 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   78.570 * s);
			_setf(o + (23 << 2), y +  -78.570 * s);
			_setf(o + (24 << 2), x +   57.142 * s);
			_setf(o + (25 << 2), y +  -78.570 * s);
			_setf(o + (26 << 2), x +   85.713 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 88:
			
			o = _posf(44);
			_setf(o + ( 0 << 2), x +   28.571 * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +   28.571 * s);
			_setf(o + ( 3 << 2), y +  -57.142 * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +  -57.142 * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +  -78.570 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -78.570 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +  -42.856 * s);
			_setf(o + (12 << 2), x +    7.143 * s);
			_setf(o + (13 << 2), y +  -42.856 * s);
			_setf(o + (14 << 2), x +    7.143 * s);
			_setf(o + (15 << 2), y +  -35.714 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -35.714 * s);
			_setf(o + (18 << 2), x +       0. * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   21.428 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   21.428 * s);
			_setf(o + (23 << 2), y +  -21.428 * s);
			_setf(o + (24 << 2), x +   28.571 * s);
			_setf(o + (25 << 2), y +  -21.428 * s);
			_setf(o + (26 << 2), x +   28.571 * s);
			_setf(o + (27 << 2), y +       0. * s);
			_setf(o + (28 << 2), x +   49.999 * s);
			_setf(o + (29 << 2), y +       0. * s);
			_setf(o + (30 << 2), x +   49.999 * s);
			_setf(o + (31 << 2), y +  -35.714 * s);
			_setf(o + (32 << 2), x +   42.856 * s);
			_setf(o + (33 << 2), y +  -35.714 * s);
			_setf(o + (34 << 2), x +   42.856 * s);
			_setf(o + (35 << 2), y +  -42.856 * s);
			_setf(o + (36 << 2), x +   49.999 * s);
			_setf(o + (37 << 2), y +  -42.856 * s);
			_setf(o + (38 << 2), x +   49.999 * s);
			_setf(o + (39 << 2), y +  -78.570 * s);
			_setf(o + (40 << 2), x +   28.571 * s);
			_setf(o + (41 << 2), y +  -78.570 * s);
			_setf(o + (42 << 2), x +   57.142 * s);
			_setf(o + (43 << 2), y +       0. * s);
			o = _posb(22);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 2);
			_setb(o + 16, 2);
			_setb(o + 17, 2);
			_setb(o + 18, 2);
			_setb(o + 19, 2);
			_setb(o + 20, 2);
			_setb(o + 21, 1);
			
			case 89:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   28.571 * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +   28.571 * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +  -49.999 * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +  -78.570 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -78.570 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +  -28.571 * s);
			_setf(o + (12 << 2), x +   14.285 * s);
			_setf(o + (13 << 2), y +  -28.571 * s);
			_setf(o + (14 << 2), x +   14.285 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   35.714 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   35.714 * s);
			_setf(o + (19 << 2), y +  -28.571 * s);
			_setf(o + (20 << 2), x +   49.999 * s);
			_setf(o + (21 << 2), y +  -28.571 * s);
			_setf(o + (22 << 2), x +   49.999 * s);
			_setf(o + (23 << 2), y +  -78.570 * s);
			_setf(o + (24 << 2), x +   28.571 * s);
			_setf(o + (25 << 2), y +  -78.570 * s);
			_setf(o + (26 << 2), x +   57.142 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 90:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -57.142 * s);
			_setf(o + ( 4 << 2), x +   28.571 * s);
			_setf(o + ( 5 << 2), y +  -57.142 * s);
			_setf(o + ( 6 << 2), x +   28.571 * s);
			_setf(o + ( 7 << 2), y +  -49.999 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -49.999 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   49.999 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   49.999 * s);
			_setf(o + (15 << 2), y +  -21.428 * s);
			_setf(o + (16 << 2), x +   21.428 * s);
			_setf(o + (17 << 2), y +  -21.428 * s);
			_setf(o + (18 << 2), x +   21.428 * s);
			_setf(o + (19 << 2), y +  -28.571 * s);
			_setf(o + (20 << 2), x +   49.999 * s);
			_setf(o + (21 << 2), y +  -28.571 * s);
			_setf(o + (22 << 2), x +   49.999 * s);
			_setf(o + (23 << 2), y +  -78.570 * s);
			_setf(o + (24 << 2), x +       0. * s);
			_setf(o + (25 << 2), y +  -78.570 * s);
			_setf(o + (26 << 2), x +   57.142 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 91:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   28.571 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   28.571 * s);
			_setf(o + ( 7 << 2), y +  -21.428 * s);
			_setf(o + ( 8 << 2), x +   21.428 * s);
			_setf(o + ( 9 << 2), y +  -21.428 * s);
			_setf(o + (10 << 2), x +   21.428 * s);
			_setf(o + (11 << 2), y +  -57.142 * s);
			_setf(o + (12 << 2), x +   28.571 * s);
			_setf(o + (13 << 2), y +  -57.142 * s);
			_setf(o + (14 << 2), x +   28.571 * s);
			_setf(o + (15 << 2), y +  -78.570 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -78.570 * s);
			_setf(o + (18 << 2), x +   35.714 * s);
			_setf(o + (19 << 2), y +       0. * s);
			o = _posb(10);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 1);
			
			case 92:
			
			o = _posf(38);
			_setf(o + ( 0 << 2), x +   21.428 * s);
			_setf(o + ( 1 << 2), y +  -57.142 * s);
			_setf(o + ( 2 << 2), x +   21.428 * s);
			_setf(o + ( 3 << 2), y +  -57.142 * s);
			_setf(o + ( 4 << 2), x +   28.571 * s);
			_setf(o + ( 5 << 2), y +  -57.142 * s);
			_setf(o + ( 6 << 2), x +   28.571 * s);
			_setf(o + ( 7 << 2), y +  -35.714 * s);
			_setf(o + ( 8 << 2), x +   35.713 * s);
			_setf(o + ( 9 << 2), y +  -35.714 * s);
			_setf(o + (10 << 2), x +   35.713 * s);
			_setf(o + (11 << 2), y +  -14.286 * s);
			_setf(o + (12 << 2), x +   42.856 * s);
			_setf(o + (13 << 2), y +  -14.286 * s);
			_setf(o + (14 << 2), x +   42.856 * s);
			_setf(o + (15 << 2), y +    7.143 * s);
			_setf(o + (16 << 2), x +   21.428 * s);
			_setf(o + (17 << 2), y +    7.143 * s);
			_setf(o + (18 << 2), x +   21.428 * s);
			_setf(o + (19 << 2), y +  -14.286 * s);
			_setf(o + (20 << 2), x +   14.285 * s);
			_setf(o + (21 << 2), y +  -14.286 * s);
			_setf(o + (22 << 2), x +   14.285 * s);
			_setf(o + (23 << 2), y +  -35.714 * s);
			_setf(o + (24 << 2), x +    7.142 * s);
			_setf(o + (25 << 2), y +  -35.714 * s);
			_setf(o + (26 << 2), x +    7.142 * s);
			_setf(o + (27 << 2), y +  -57.142 * s);
			_setf(o + (28 << 2), x +       0. * s);
			_setf(o + (29 << 2), y +  -57.142 * s);
			_setf(o + (30 << 2), x +       0. * s);
			_setf(o + (31 << 2), y +  -78.570 * s);
			_setf(o + (32 << 2), x +   21.428 * s);
			_setf(o + (33 << 2), y +  -78.570 * s);
			_setf(o + (34 << 2), x +   21.428 * s);
			_setf(o + (35 << 2), y +  -57.142 * s);
			_setf(o + (36 << 2), x +   49.999 * s);
			_setf(o + (37 << 2), y +       0. * s);
			o = _posb(19);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 2);
			_setb(o + 16, 2);
			_setb(o + 17, 2);
			_setb(o + 18, 1);
			
			case 93:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +   28.571 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   28.571 * s);
			_setf(o + ( 3 << 2), y +  -78.570 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +  -78.570 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +  -57.142 * s);
			_setf(o + ( 8 << 2), x +    7.143 * s);
			_setf(o + ( 9 << 2), y +  -57.142 * s);
			_setf(o + (10 << 2), x +    7.143 * s);
			_setf(o + (11 << 2), y +  -21.428 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +  -21.428 * s);
			_setf(o + (14 << 2), x +       0. * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   28.571 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   35.714 * s);
			_setf(o + (19 << 2), y +       0. * s);
			o = _posb(10);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 1);
			
			case 94:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   35.713 * s);
			_setf(o + ( 1 << 2), y +  -64.285 * s);
			_setf(o + ( 2 << 2), x +   35.713 * s);
			_setf(o + ( 3 << 2), y +  -78.570 * s);
			_setf(o + ( 4 << 2), x +   14.285 * s);
			_setf(o + ( 5 << 2), y +  -78.570 * s);
			_setf(o + ( 6 << 2), x +   14.285 * s);
			_setf(o + ( 7 << 2), y +  -64.285 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -64.285 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +  -42.856 * s);
			_setf(o + (12 << 2), x +   21.428 * s);
			_setf(o + (13 << 2), y +  -42.856 * s);
			_setf(o + (14 << 2), x +   21.428 * s);
			_setf(o + (15 << 2), y +  -57.142 * s);
			_setf(o + (16 << 2), x +   28.571 * s);
			_setf(o + (17 << 2), y +  -57.142 * s);
			_setf(o + (18 << 2), x +   28.571 * s);
			_setf(o + (19 << 2), y +  -42.856 * s);
			_setf(o + (20 << 2), x +   49.999 * s);
			_setf(o + (21 << 2), y +  -42.856 * s);
			_setf(o + (22 << 2), x +   49.999 * s);
			_setf(o + (23 << 2), y +  -64.285 * s);
			_setf(o + (24 << 2), x +   35.713 * s);
			_setf(o + (25 << 2), y +  -64.285 * s);
			_setf(o + (26 << 2), x +   57.142 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 95:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -21.428 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   49.999 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   49.999 * s);
			_setf(o + ( 7 << 2), y +  -21.428 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -21.428 * s);
			_setf(o + (10 << 2), x +   57.142 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 96:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -57.142 * s);
			_setf(o + ( 2 << 2), x +   35.714 * s);
			_setf(o + ( 3 << 2), y +  -57.142 * s);
			_setf(o + ( 4 << 2), x +   35.714 * s);
			_setf(o + ( 5 << 2), y +  -78.570 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +  -78.570 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -57.142 * s);
			_setf(o + (10 << 2), x +   42.856 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 97:
			
			o = _posf(30);
			_setf(o + ( 0 << 2), x +    7.143 * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +    7.143 * s);
			_setf(o + ( 3 << 2), y +  -57.142 * s);
			_setf(o + ( 4 << 2), x +   28.571 * s);
			_setf(o + ( 5 << 2), y +  -57.142 * s);
			_setf(o + ( 6 << 2), x +   28.571 * s);
			_setf(o + ( 7 << 2), y +  -49.999 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -49.999 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   49.999 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   49.999 * s);
			_setf(o + (15 << 2), y +  -78.570 * s);
			_setf(o + (16 << 2), x +    7.143 * s);
			_setf(o + (17 << 2), y +  -78.570 * s);
			_setf(o + (18 << 2), x +   28.571 * s);
			_setf(o + (19 << 2), y +  -21.428 * s);
			_setf(o + (20 << 2), x +   21.428 * s);
			_setf(o + (21 << 2), y +  -21.428 * s);
			_setf(o + (22 << 2), x +   21.428 * s);
			_setf(o + (23 << 2), y +  -28.571 * s);
			_setf(o + (24 << 2), x +   28.571 * s);
			_setf(o + (25 << 2), y +  -28.571 * s);
			_setf(o + (26 << 2), x +   28.571 * s);
			_setf(o + (27 << 2), y +  -21.428 * s);
			_setf(o + (28 << 2), x +   57.141 * s);
			_setf(o + (29 << 2), y +       0. * s);
			o = _posb(15);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 1);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 1);
			
			case 98:
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +   21.429 * s);
			_setf(o + ( 1 << 2), y +  -64.285 * s);
			_setf(o + ( 2 << 2), x +   21.429 * s);
			_setf(o + ( 3 << 2), y +  -78.570 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +  -78.570 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   50.000 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   50.000 * s);
			_setf(o + (11 << 2), y +  -64.285 * s);
			_setf(o + (12 << 2), x +   21.429 * s);
			_setf(o + (13 << 2), y +  -64.285 * s);
			_setf(o + (14 << 2), x +   28.571 * s);
			_setf(o + (15 << 2), y +  -21.428 * s);
			_setf(o + (16 << 2), x +   21.429 * s);
			_setf(o + (17 << 2), y +  -21.428 * s);
			_setf(o + (18 << 2), x +   21.429 * s);
			_setf(o + (19 << 2), y +  -42.856 * s);
			_setf(o + (20 << 2), x +   28.571 * s);
			_setf(o + (21 << 2), y +  -42.856 * s);
			_setf(o + (22 << 2), x +   28.571 * s);
			_setf(o + (23 << 2), y +  -21.428 * s);
			_setf(o + (24 << 2), x +   57.142 * s);
			_setf(o + (25 << 2), y +       0. * s);
			o = _posb(13);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 1);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 1);
			
			case 99:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -71.427 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   50.000 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   50.000 * s);
			_setf(o + ( 7 << 2), y +  -35.714 * s);
			_setf(o + ( 8 << 2), x +   28.571 * s);
			_setf(o + ( 9 << 2), y +  -35.714 * s);
			_setf(o + (10 << 2), x +   28.571 * s);
			_setf(o + (11 << 2), y +  -21.428 * s);
			_setf(o + (12 << 2), x +   21.429 * s);
			_setf(o + (13 << 2), y +  -21.428 * s);
			_setf(o + (14 << 2), x +   21.429 * s);
			_setf(o + (15 << 2), y +  -49.999 * s);
			_setf(o + (16 << 2), x +   28.571 * s);
			_setf(o + (17 << 2), y +  -49.999 * s);
			_setf(o + (18 << 2), x +   28.571 * s);
			_setf(o + (19 << 2), y +  -42.856 * s);
			_setf(o + (20 << 2), x +   50.000 * s);
			_setf(o + (21 << 2), y +  -42.856 * s);
			_setf(o + (22 << 2), x +   50.000 * s);
			_setf(o + (23 << 2), y +  -71.427 * s);
			_setf(o + (24 << 2), x +       0. * s);
			_setf(o + (25 << 2), y +  -71.427 * s);
			_setf(o + (26 << 2), x +   57.142 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 100:
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +   28.571 * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +   28.571 * s);
			_setf(o + ( 3 << 2), y +  -64.285 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +  -64.285 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   50.000 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   50.000 * s);
			_setf(o + (11 << 2), y +  -78.570 * s);
			_setf(o + (12 << 2), x +   28.571 * s);
			_setf(o + (13 << 2), y +  -78.570 * s);
			_setf(o + (14 << 2), x +   28.571 * s);
			_setf(o + (15 << 2), y +  -21.428 * s);
			_setf(o + (16 << 2), x +   21.429 * s);
			_setf(o + (17 << 2), y +  -21.428 * s);
			_setf(o + (18 << 2), x +   21.429 * s);
			_setf(o + (19 << 2), y +  -42.856 * s);
			_setf(o + (20 << 2), x +   28.571 * s);
			_setf(o + (21 << 2), y +  -42.856 * s);
			_setf(o + (22 << 2), x +   28.571 * s);
			_setf(o + (23 << 2), y +  -21.428 * s);
			_setf(o + (24 << 2), x +   57.142 * s);
			_setf(o + (25 << 2), y +       0. * s);
			o = _posb(13);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 1);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 1);
			
			case 101:
			
			o = _posf(30);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   50.000 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   50.000 * s);
			_setf(o + ( 7 << 2), y +  -21.428 * s);
			_setf(o + ( 8 << 2), x +   21.429 * s);
			_setf(o + ( 9 << 2), y +  -21.428 * s);
			_setf(o + (10 << 2), x +   21.429 * s);
			_setf(o + (11 << 2), y +  -28.571 * s);
			_setf(o + (12 << 2), x +   50.000 * s);
			_setf(o + (13 << 2), y +  -28.571 * s);
			_setf(o + (14 << 2), x +   50.000 * s);
			_setf(o + (15 << 2), y +  -78.570 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -78.570 * s);
			_setf(o + (18 << 2), x +   28.571 * s);
			_setf(o + (19 << 2), y +  -49.999 * s);
			_setf(o + (20 << 2), x +   21.429 * s);
			_setf(o + (21 << 2), y +  -49.999 * s);
			_setf(o + (22 << 2), x +   21.429 * s);
			_setf(o + (23 << 2), y +  -57.142 * s);
			_setf(o + (24 << 2), x +   28.571 * s);
			_setf(o + (25 << 2), y +  -57.142 * s);
			_setf(o + (26 << 2), x +   28.571 * s);
			_setf(o + (27 << 2), y +  -49.999 * s);
			_setf(o + (28 << 2), x +   57.142 * s);
			_setf(o + (29 << 2), y +       0. * s);
			o = _posb(15);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 1);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 1);
			
			case 102:
			
			o = _posf(36);
			_setf(o + ( 0 << 2), x +    7.143 * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +    7.143 * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +  -49.999 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +  -28.571 * s);
			_setf(o + ( 8 << 2), x +   21.429 * s);
			_setf(o + ( 9 << 2), y +  -28.571 * s);
			_setf(o + (10 << 2), x +   21.429 * s);
			_setf(o + (11 << 2), y +  -21.428 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +  -21.428 * s);
			_setf(o + (14 << 2), x +       0. * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   42.857 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   42.857 * s);
			_setf(o + (19 << 2), y +  -28.571 * s);
			_setf(o + (20 << 2), x +   50.000 * s);
			_setf(o + (21 << 2), y +  -28.571 * s);
			_setf(o + (22 << 2), x +   50.000 * s);
			_setf(o + (23 << 2), y +  -49.999 * s);
			_setf(o + (24 << 2), x +   28.571 * s);
			_setf(o + (25 << 2), y +  -49.999 * s);
			_setf(o + (26 << 2), x +   28.571 * s);
			_setf(o + (27 << 2), y +  -57.142 * s);
			_setf(o + (28 << 2), x +   50.000 * s);
			_setf(o + (29 << 2), y +  -57.142 * s);
			_setf(o + (30 << 2), x +   50.000 * s);
			_setf(o + (31 << 2), y +  -78.570 * s);
			_setf(o + (32 << 2), x +    7.143 * s);
			_setf(o + (33 << 2), y +  -78.570 * s);
			_setf(o + (34 << 2), x +   57.142 * s);
			_setf(o + (35 << 2), y +       0. * s);
			o = _posb(18);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 2);
			_setb(o + 16, 2);
			_setb(o + 17, 1);
			
			case 103:
			
			o = _posf(30);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -64.285 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -14.285 * s);
			_setf(o + ( 4 << 2), x +   28.571 * s);
			_setf(o + ( 5 << 2), y +  -14.285 * s);
			_setf(o + ( 6 << 2), x +   28.571 * s);
			_setf(o + ( 7 << 2), y +   -7.143 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +   -7.143 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +   14.285 * s);
			_setf(o + (12 << 2), x +   50.000 * s);
			_setf(o + (13 << 2), y +   14.285 * s);
			_setf(o + (14 << 2), x +   50.000 * s);
			_setf(o + (15 << 2), y +  -64.285 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -64.285 * s);
			_setf(o + (18 << 2), x +   28.571 * s);
			_setf(o + (19 << 2), y +  -35.714 * s);
			_setf(o + (20 << 2), x +   21.429 * s);
			_setf(o + (21 << 2), y +  -35.714 * s);
			_setf(o + (22 << 2), x +   21.429 * s);
			_setf(o + (23 << 2), y +  -42.856 * s);
			_setf(o + (24 << 2), x +   28.571 * s);
			_setf(o + (25 << 2), y +  -42.856 * s);
			_setf(o + (26 << 2), x +   28.571 * s);
			_setf(o + (27 << 2), y +  -35.714 * s);
			_setf(o + (28 << 2), x +   57.142 * s);
			_setf(o + (29 << 2), y +       0. * s);
			o = _posb(15);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 1);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 1);
			
			case 104:
			
			o = _posf(24);
			_setf(o + ( 0 << 2), x +   21.429 * s);
			_setf(o + ( 1 << 2), y +  -64.285 * s);
			_setf(o + ( 2 << 2), x +   21.429 * s);
			_setf(o + ( 3 << 2), y +  -78.570 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +  -78.570 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   21.429 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   21.429 * s);
			_setf(o + (11 << 2), y +  -42.856 * s);
			_setf(o + (12 << 2), x +   28.571 * s);
			_setf(o + (13 << 2), y +  -42.856 * s);
			_setf(o + (14 << 2), x +   28.571 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   50.000 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   50.000 * s);
			_setf(o + (19 << 2), y +  -64.285 * s);
			_setf(o + (20 << 2), x +   21.429 * s);
			_setf(o + (21 << 2), y +  -64.285 * s);
			_setf(o + (22 << 2), x +   57.142 * s);
			_setf(o + (23 << 2), y +       0. * s);
			o = _posb(12);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 1);
			
			case 105:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -57.142 * s);
			_setf(o + ( 4 << 2), x +   21.429 * s);
			_setf(o + ( 5 << 2), y +  -57.142 * s);
			_setf(o + ( 6 << 2), x +   21.429 * s);
			_setf(o + ( 7 << 2), y +  -78.570 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -78.570 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +  -49.999 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   21.429 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   21.429 * s);
			_setf(o + (17 << 2), y +  -49.999 * s);
			_setf(o + (18 << 2), x +       0. * s);
			_setf(o + (19 << 2), y +  -49.999 * s);
			_setf(o + (20 << 2), x +   28.571 * s);
			_setf(o + (21 << 2), y +       0. * s);
			o = _posb(11);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 1);
			
			case 106:
			
			o = _posf(30);
			_setf(o + ( 0 << 2), x +   28.571 * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +   28.571 * s);
			_setf(o + ( 3 << 2), y +  -57.142 * s);
			_setf(o + ( 4 << 2), x +   49.999 * s);
			_setf(o + ( 5 << 2), y +  -57.142 * s);
			_setf(o + ( 6 << 2), x +   49.999 * s);
			_setf(o + ( 7 << 2), y +  -78.570 * s);
			_setf(o + ( 8 << 2), x +   28.571 * s);
			_setf(o + ( 9 << 2), y +  -78.570 * s);
			_setf(o + (10 << 2), x +   28.571 * s);
			_setf(o + (11 << 2), y +  -49.999 * s);
			_setf(o + (12 << 2), x +   28.571 * s);
			_setf(o + (13 << 2), y +  -21.428 * s);
			_setf(o + (14 << 2), x +   21.428 * s);
			_setf(o + (15 << 2), y +  -21.428 * s);
			_setf(o + (16 << 2), x +   21.428 * s);
			_setf(o + (17 << 2), y +  -49.999 * s);
			_setf(o + (18 << 2), x +       0. * s);
			_setf(o + (19 << 2), y +  -49.999 * s);
			_setf(o + (20 << 2), x +       0. * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   49.999 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   49.999 * s);
			_setf(o + (25 << 2), y +  -49.999 * s);
			_setf(o + (26 << 2), x +   28.571 * s);
			_setf(o + (27 << 2), y +  -49.999 * s);
			_setf(o + (28 << 2), x +   57.142 * s);
			_setf(o + (29 << 2), y +       0. * s);
			o = _posb(15);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 1);
			
			case 107:
			
			o = _posf(36);
			_setf(o + ( 0 << 2), x +   28.571 * s);
			_setf(o + ( 1 << 2), y +  -64.285 * s);
			_setf(o + ( 2 << 2), x +   28.571 * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +  -49.999 * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +  -78.570 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -78.570 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   21.428 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   21.428 * s);
			_setf(o + (15 << 2), y +  -14.285 * s);
			_setf(o + (16 << 2), x +   28.571 * s);
			_setf(o + (17 << 2), y +  -14.285 * s);
			_setf(o + (18 << 2), x +   28.571 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   49.999 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   49.999 * s);
			_setf(o + (23 << 2), y +  -28.571 * s);
			_setf(o + (24 << 2), x +   42.856 * s);
			_setf(o + (25 << 2), y +  -28.571 * s);
			_setf(o + (26 << 2), x +   42.856 * s);
			_setf(o + (27 << 2), y +  -35.714 * s);
			_setf(o + (28 << 2), x +   49.999 * s);
			_setf(o + (29 << 2), y +  -35.714 * s);
			_setf(o + (30 << 2), x +   49.999 * s);
			_setf(o + (31 << 2), y +  -64.285 * s);
			_setf(o + (32 << 2), x +   28.571 * s);
			_setf(o + (33 << 2), y +  -64.285 * s);
			_setf(o + (34 << 2), x +   57.142 * s);
			_setf(o + (35 << 2), y +       0. * s);
			o = _posb(18);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 2);
			_setb(o + 16, 2);
			_setb(o + 17, 1);
			
			case 108:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   21.428 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   21.428 * s);
			_setf(o + ( 3 << 2), y +  -78.570 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +  -78.570 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   21.428 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   28.571 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 109:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -71.427 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +  -49.999 * s);
			_setf(o + ( 8 << 2), x +   28.571 * s);
			_setf(o + ( 9 << 2), y +  -49.999 * s);
			_setf(o + (10 << 2), x +   28.571 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   49.999 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   49.999 * s);
			_setf(o + (15 << 2), y +  -49.999 * s);
			_setf(o + (16 << 2), x +   57.142 * s);
			_setf(o + (17 << 2), y +  -49.999 * s);
			_setf(o + (18 << 2), x +   57.142 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   78.570 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   78.570 * s);
			_setf(o + (23 << 2), y +  -71.427 * s);
			_setf(o + (24 << 2), x +       0. * s);
			_setf(o + (25 << 2), y +  -71.427 * s);
			_setf(o + (26 << 2), x +   85.713 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 110:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +   21.428 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   21.428 * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			_setf(o + ( 4 << 2), x +   28.571 * s);
			_setf(o + ( 5 << 2), y +  -49.999 * s);
			_setf(o + ( 6 << 2), x +   28.571 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   49.999 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   49.999 * s);
			_setf(o + (11 << 2), y +  -71.427 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +  -71.427 * s);
			_setf(o + (14 << 2), x +       0. * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   21.428 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   57.142 * s);
			_setf(o + (19 << 2), y +       0. * s);
			o = _posb(10);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 1);
			
			case 111:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -71.427 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   49.999 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   49.999 * s);
			_setf(o + ( 7 << 2), y +  -71.427 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -71.427 * s);
			_setf(o + (10 << 2), x +   28.571 * s);
			_setf(o + (11 << 2), y +  -21.428 * s);
			_setf(o + (12 << 2), x +   21.428 * s);
			_setf(o + (13 << 2), y +  -21.428 * s);
			_setf(o + (14 << 2), x +   21.428 * s);
			_setf(o + (15 << 2), y +  -49.999 * s);
			_setf(o + (16 << 2), x +   28.571 * s);
			_setf(o + (17 << 2), y +  -49.999 * s);
			_setf(o + (18 << 2), x +   28.571 * s);
			_setf(o + (19 << 2), y +  -21.428 * s);
			_setf(o + (20 << 2), x +   57.142 * s);
			_setf(o + (21 << 2), y +       0. * s);
			o = _posb(11);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 1);
			
			case 112:
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -64.285 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +   14.286 * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +   14.286 * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   49.999 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   49.999 * s);
			_setf(o + (11 << 2), y +  -64.285 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +  -64.285 * s);
			_setf(o + (14 << 2), x +   28.571 * s);
			_setf(o + (15 << 2), y +  -21.428 * s);
			_setf(o + (16 << 2), x +   21.428 * s);
			_setf(o + (17 << 2), y +  -21.428 * s);
			_setf(o + (18 << 2), x +   21.428 * s);
			_setf(o + (19 << 2), y +  -42.856 * s);
			_setf(o + (20 << 2), x +   28.571 * s);
			_setf(o + (21 << 2), y +  -42.856 * s);
			_setf(o + (22 << 2), x +   28.571 * s);
			_setf(o + (23 << 2), y +  -21.428 * s);
			_setf(o + (24 << 2), x +   57.142 * s);
			_setf(o + (25 << 2), y +       0. * s);
			o = _posb(13);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 1);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 1);
			
			case 113:
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -64.285 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   28.571 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   28.571 * s);
			_setf(o + ( 7 << 2), y +   14.286 * s);
			_setf(o + ( 8 << 2), x +   49.999 * s);
			_setf(o + ( 9 << 2), y +   14.286 * s);
			_setf(o + (10 << 2), x +   49.999 * s);
			_setf(o + (11 << 2), y +  -64.285 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +  -64.285 * s);
			_setf(o + (14 << 2), x +   28.571 * s);
			_setf(o + (15 << 2), y +  -21.428 * s);
			_setf(o + (16 << 2), x +   21.428 * s);
			_setf(o + (17 << 2), y +  -21.428 * s);
			_setf(o + (18 << 2), x +   21.428 * s);
			_setf(o + (19 << 2), y +  -42.856 * s);
			_setf(o + (20 << 2), x +   28.571 * s);
			_setf(o + (21 << 2), y +  -42.856 * s);
			_setf(o + (22 << 2), x +   28.571 * s);
			_setf(o + (23 << 2), y +  -21.428 * s);
			_setf(o + (24 << 2), x +   57.142 * s);
			_setf(o + (25 << 2), y +       0. * s);
			o = _posb(13);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 1);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 1);
			
			case 114:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -71.427 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +  -49.999 * s);
			_setf(o + ( 8 << 2), x +   28.571 * s);
			_setf(o + ( 9 << 2), y +  -49.999 * s);
			_setf(o + (10 << 2), x +   28.571 * s);
			_setf(o + (11 << 2), y +  -35.714 * s);
			_setf(o + (12 << 2), x +   49.999 * s);
			_setf(o + (13 << 2), y +  -35.714 * s);
			_setf(o + (14 << 2), x +   49.999 * s);
			_setf(o + (15 << 2), y +  -71.427 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -71.427 * s);
			_setf(o + (18 << 2), x +   57.142 * s);
			_setf(o + (19 << 2), y +       0. * s);
			o = _posb(10);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 1);
			
			case 115:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -28.571 * s);
			_setf(o + ( 4 << 2), x +   28.571 * s);
			_setf(o + ( 5 << 2), y +  -28.571 * s);
			_setf(o + ( 6 << 2), x +   28.571 * s);
			_setf(o + ( 7 << 2), y +  -21.428 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -21.428 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   49.999 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   49.999 * s);
			_setf(o + (15 << 2), y +  -49.999 * s);
			_setf(o + (16 << 2), x +   21.428 * s);
			_setf(o + (17 << 2), y +  -49.999 * s);
			_setf(o + (18 << 2), x +   21.428 * s);
			_setf(o + (19 << 2), y +  -57.142 * s);
			_setf(o + (20 << 2), x +   49.999 * s);
			_setf(o + (21 << 2), y +  -57.142 * s);
			_setf(o + (22 << 2), x +   49.999 * s);
			_setf(o + (23 << 2), y +  -78.570 * s);
			_setf(o + (24 << 2), x +       0. * s);
			_setf(o + (25 << 2), y +  -78.570 * s);
			_setf(o + (26 << 2), x +   57.142 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 116:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   21.428 * s);
			_setf(o + ( 1 << 2), y +  -64.285 * s);
			_setf(o + ( 2 << 2), x +   21.428 * s);
			_setf(o + ( 3 << 2), y +  -78.570 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +  -78.570 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   49.999 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   49.999 * s);
			_setf(o + (11 << 2), y +  -35.714 * s);
			_setf(o + (12 << 2), x +   28.571 * s);
			_setf(o + (13 << 2), y +  -35.714 * s);
			_setf(o + (14 << 2), x +   28.571 * s);
			_setf(o + (15 << 2), y +  -21.428 * s);
			_setf(o + (16 << 2), x +   21.428 * s);
			_setf(o + (17 << 2), y +  -21.428 * s);
			_setf(o + (18 << 2), x +   21.428 * s);
			_setf(o + (19 << 2), y +  -42.856 * s);
			_setf(o + (20 << 2), x +   49.999 * s);
			_setf(o + (21 << 2), y +  -42.856 * s);
			_setf(o + (22 << 2), x +   49.999 * s);
			_setf(o + (23 << 2), y +  -64.285 * s);
			_setf(o + (24 << 2), x +   21.428 * s);
			_setf(o + (25 << 2), y +  -64.285 * s);
			_setf(o + (26 << 2), x +   57.142 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 117:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +   28.571 * s);
			_setf(o + ( 1 << 2), y +  -71.427 * s);
			_setf(o + ( 2 << 2), x +   28.571 * s);
			_setf(o + ( 3 << 2), y +  -21.428 * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +  -21.428 * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +  -71.427 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -71.427 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   49.999 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   49.999 * s);
			_setf(o + (15 << 2), y +  -71.427 * s);
			_setf(o + (16 << 2), x +   28.571 * s);
			_setf(o + (17 << 2), y +  -71.427 * s);
			_setf(o + (18 << 2), x +   57.142 * s);
			_setf(o + (19 << 2), y +       0. * s);
			o = _posb(10);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 1);
			
			case 118:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   28.571 * s);
			_setf(o + ( 1 << 2), y +  -71.427 * s);
			_setf(o + ( 2 << 2), x +   28.571 * s);
			_setf(o + ( 3 << 2), y +  -21.428 * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +  -21.428 * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +  -71.427 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -71.427 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +   -7.143 * s);
			_setf(o + (12 << 2), x +    7.143 * s);
			_setf(o + (13 << 2), y +   -7.143 * s);
			_setf(o + (14 << 2), x +    7.143 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   42.856 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   42.856 * s);
			_setf(o + (19 << 2), y +   -7.143 * s);
			_setf(o + (20 << 2), x +   49.999 * s);
			_setf(o + (21 << 2), y +   -7.143 * s);
			_setf(o + (22 << 2), x +   49.999 * s);
			_setf(o + (23 << 2), y +  -71.427 * s);
			_setf(o + (24 << 2), x +   28.571 * s);
			_setf(o + (25 << 2), y +  -71.427 * s);
			_setf(o + (26 << 2), x +   57.142 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 119:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   57.142 * s);
			_setf(o + ( 1 << 2), y +  -71.427 * s);
			_setf(o + ( 2 << 2), x +   57.142 * s);
			_setf(o + ( 3 << 2), y +  -21.428 * s);
			_setf(o + ( 4 << 2), x +   49.999 * s);
			_setf(o + ( 5 << 2), y +  -21.428 * s);
			_setf(o + ( 6 << 2), x +   49.999 * s);
			_setf(o + ( 7 << 2), y +  -71.427 * s);
			_setf(o + ( 8 << 2), x +   28.571 * s);
			_setf(o + ( 9 << 2), y +  -71.427 * s);
			_setf(o + (10 << 2), x +   28.571 * s);
			_setf(o + (11 << 2), y +  -21.428 * s);
			_setf(o + (12 << 2), x +   21.428 * s);
			_setf(o + (13 << 2), y +  -21.428 * s);
			_setf(o + (14 << 2), x +   21.428 * s);
			_setf(o + (15 << 2), y +  -71.427 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -71.427 * s);
			_setf(o + (18 << 2), x +       0. * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   78.570 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   78.570 * s);
			_setf(o + (23 << 2), y +  -71.427 * s);
			_setf(o + (24 << 2), x +   57.142 * s);
			_setf(o + (25 << 2), y +  -71.427 * s);
			_setf(o + (26 << 2), x +   85.713 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 120:
			
			o = _posf(44);
			_setf(o + ( 0 << 2), x +   28.571 * s);
			_setf(o + ( 1 << 2), y +  -57.142 * s);
			_setf(o + ( 2 << 2), x +   21.428 * s);
			_setf(o + ( 3 << 2), y +  -57.142 * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +  -71.427 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +  -71.427 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -42.856 * s);
			_setf(o + (10 << 2), x +    7.143 * s);
			_setf(o + (11 << 2), y +  -42.856 * s);
			_setf(o + (12 << 2), x +    7.143 * s);
			_setf(o + (13 << 2), y +  -35.714 * s);
			_setf(o + (14 << 2), x +       0. * s);
			_setf(o + (15 << 2), y +  -35.714 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   21.428 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   21.428 * s);
			_setf(o + (21 << 2), y +  -21.428 * s);
			_setf(o + (22 << 2), x +   28.571 * s);
			_setf(o + (23 << 2), y +  -21.428 * s);
			_setf(o + (24 << 2), x +   28.571 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   49.999 * s);
			_setf(o + (27 << 2), y +       0. * s);
			_setf(o + (28 << 2), x +   49.999 * s);
			_setf(o + (29 << 2), y +  -35.714 * s);
			_setf(o + (30 << 2), x +   42.856 * s);
			_setf(o + (31 << 2), y +  -35.714 * s);
			_setf(o + (32 << 2), x +   42.856 * s);
			_setf(o + (33 << 2), y +  -42.856 * s);
			_setf(o + (34 << 2), x +   49.999 * s);
			_setf(o + (35 << 2), y +  -42.856 * s);
			_setf(o + (36 << 2), x +   49.999 * s);
			_setf(o + (37 << 2), y +  -71.427 * s);
			_setf(o + (38 << 2), x +   28.571 * s);
			_setf(o + (39 << 2), y +  -71.427 * s);
			_setf(o + (40 << 2), x +   28.571 * s);
			_setf(o + (41 << 2), y +  -57.142 * s);
			_setf(o + (42 << 2), x +   57.142 * s);
			_setf(o + (43 << 2), y +       0. * s);
			o = _posb(22);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 2);
			_setb(o + 16, 2);
			_setb(o + 17, 2);
			_setb(o + 18, 2);
			_setb(o + 19, 2);
			_setb(o + 20, 2);
			_setb(o + 21, 1);
			
			case 121:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   28.571 * s);
			_setf(o + ( 1 << 2), y +  -64.285 * s);
			_setf(o + ( 2 << 2), x +   28.571 * s);
			_setf(o + ( 3 << 2), y +  -35.714 * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +  -35.714 * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +  -64.285 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -64.285 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +  -14.285 * s);
			_setf(o + (12 << 2), x +   28.571 * s);
			_setf(o + (13 << 2), y +  -14.285 * s);
			_setf(o + (14 << 2), x +   28.571 * s);
			_setf(o + (15 << 2), y +   -7.143 * s);
			_setf(o + (16 << 2), x +    7.143 * s);
			_setf(o + (17 << 2), y +   -7.143 * s);
			_setf(o + (18 << 2), x +    7.143 * s);
			_setf(o + (19 << 2), y +   14.286 * s);
			_setf(o + (20 << 2), x +   49.999 * s);
			_setf(o + (21 << 2), y +   14.286 * s);
			_setf(o + (22 << 2), x +   49.999 * s);
			_setf(o + (23 << 2), y +  -64.285 * s);
			_setf(o + (24 << 2), x +   28.571 * s);
			_setf(o + (25 << 2), y +  -64.285 * s);
			_setf(o + (26 << 2), x +   57.142 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 122:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -57.142 * s);
			_setf(o + ( 4 << 2), x +   28.571 * s);
			_setf(o + ( 5 << 2), y +  -57.142 * s);
			_setf(o + ( 6 << 2), x +   28.571 * s);
			_setf(o + ( 7 << 2), y +  -49.999 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -49.999 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   49.999 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   49.999 * s);
			_setf(o + (15 << 2), y +  -21.428 * s);
			_setf(o + (16 << 2), x +   21.428 * s);
			_setf(o + (17 << 2), y +  -21.428 * s);
			_setf(o + (18 << 2), x +   21.428 * s);
			_setf(o + (19 << 2), y +  -28.571 * s);
			_setf(o + (20 << 2), x +   49.999 * s);
			_setf(o + (21 << 2), y +  -28.571 * s);
			_setf(o + (22 << 2), x +   49.999 * s);
			_setf(o + (23 << 2), y +  -78.570 * s);
			_setf(o + (24 << 2), x +       0. * s);
			_setf(o + (25 << 2), y +  -78.570 * s);
			_setf(o + (26 << 2), x +   57.142 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 123:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +    7.143 * s);
			_setf(o + ( 1 << 2), y +  -49.999 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +  -28.571 * s);
			_setf(o + ( 6 << 2), x +    7.143 * s);
			_setf(o + ( 7 << 2), y +  -28.571 * s);
			_setf(o + ( 8 << 2), x +    7.143 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   35.714 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   35.714 * s);
			_setf(o + (13 << 2), y +  -21.428 * s);
			_setf(o + (14 << 2), x +   28.571 * s);
			_setf(o + (15 << 2), y +  -21.428 * s);
			_setf(o + (16 << 2), x +   28.571 * s);
			_setf(o + (17 << 2), y +  -57.142 * s);
			_setf(o + (18 << 2), x +   35.714 * s);
			_setf(o + (19 << 2), y +  -57.142 * s);
			_setf(o + (20 << 2), x +   35.714 * s);
			_setf(o + (21 << 2), y +  -78.570 * s);
			_setf(o + (22 << 2), x +    7.143 * s);
			_setf(o + (23 << 2), y +  -78.570 * s);
			_setf(o + (24 << 2), x +    7.143 * s);
			_setf(o + (25 << 2), y +  -49.999 * s);
			_setf(o + (26 << 2), x +   42.856 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 124:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   21.428 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   21.428 * s);
			_setf(o + ( 7 << 2), y +  -78.570 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -78.570 * s);
			_setf(o + (10 << 2), x +   28.571 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 125:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   28.571 * s);
			_setf(o + ( 1 << 2), y +  -78.570 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -78.570 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +  -57.142 * s);
			_setf(o + ( 6 << 2), x +    7.143 * s);
			_setf(o + ( 7 << 2), y +  -57.142 * s);
			_setf(o + ( 8 << 2), x +    7.143 * s);
			_setf(o + ( 9 << 2), y +  -21.428 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +  -21.428 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   28.571 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   28.571 * s);
			_setf(o + (17 << 2), y +  -28.571 * s);
			_setf(o + (18 << 2), x +   35.714 * s);
			_setf(o + (19 << 2), y +  -28.571 * s);
			_setf(o + (20 << 2), x +   35.714 * s);
			_setf(o + (21 << 2), y +  -49.999 * s);
			_setf(o + (22 << 2), x +   28.571 * s);
			_setf(o + (23 << 2), y +  -49.999 * s);
			_setf(o + (24 << 2), x +   28.571 * s);
			_setf(o + (25 << 2), y +  -78.570 * s);
			_setf(o + (26 << 2), x +   42.857 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 126:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -57.142 * s);
			_setf(o + ( 2 << 2), x +   35.713 * s);
			_setf(o + ( 3 << 2), y +  -57.142 * s);
			_setf(o + ( 4 << 2), x +   35.713 * s);
			_setf(o + ( 5 << 2), y +  -78.570 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +  -78.570 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -57.142 * s);
			_setf(o + (10 << 2), x +   42.856 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
		}
	}
	#end
}