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
package de.polygonal.gl.text.fonts.coreweb;

import de.polygonal.gl.VectorRenderer;
import de.polygonal.gl.text.VectorFont;
import flash.Memory;

class TrebuchetMS extends de.polygonal.gl.text.ProportionalVectorFont
{
	public function new()
	{
		#if font_inline
		super(2048, 1923, -455, BOUNDS_TABLE, SPACING_TABLE, KERNING_TABLE);
		#else
		super(
		"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");
		#end
	}
	
	#if font_inline
	static var SPACING_TABLE:Array<Int> =
	[
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,  617,  752,  665, 1074, 1074, 1229, 1446,  327,
		 752,  752,  752, 1074,  752,  752,  752, 1074, 1074, 1074, 1074, 1074, 1074, 1074, 1074, 1074, 1074, 1074,  752,  752,
		1074, 1074, 1074,  752, 1578, 1208, 1159, 1225, 1256, 1097, 1075, 1385, 1340,  570,  976, 1179, 1037, 1453, 1307, 1380,
		1142, 1384, 1192,  985, 1189, 1328, 1203, 1745, 1140, 1168, 1127,  752,  728,  752, 1074, 1074, 1074, 1076, 1141, 1014,
		1141, 1117,  757, 1028, 1119,  584,  751, 1033,  604, 1700, 1119, 1099, 1141, 1141,  796,  829,  812, 1119, 1003, 1524,
		1026, 1010,  972,  752, 1074,  752, 1074
	];

	static var KERNING_TABLE:Array<Int> =
	[
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,  127,    0,    0,    0,    0,  142,    0,    0,    0,    0,  149,  162,    0,    0,    0,
		 173,    0,  192,    0,  207,    0,  242,  269,    0,  296,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,  325,    0,    0,    0,  330,  335,
		   0,  340,    0,    0,    0,    0,    0,   14,   84, -199,   86, -180,   87, -180,   89, -218,  118, -113,  119,  -94,
		 121,  -84,    6,   44, -369,   46, -369,   65, -217,   12,  101,  -64,  105,  -64,  110,  -64,  111,  -64,  117,  -64,
		 119,  -64,   10,   84, -209,   86, -284,   87, -256,   89, -265,  121, -170,   18,   44, -400,   46, -400,   65, -228,
		  97,  -96,  101,  -96,  104,  -96,  105,  -96,  111,  -96,  114,  -96,   14,   84,  -84,   86,  -94,   87, -131,   89,
		-131,  101,  -83,  111,  -83,  117,  -59,   34,   44, -340,   45, -198,   46, -340,   58, -227,   59, -227,   65, -199,
		  79, -113,   97, -255,   99, -255,  101, -255,  105,  -85,  111, -255,  114, -225,  115, -246,  117, -265,  119, -283,
		 121, -236,   26,   44, -300,   45, -151,   46, -300,   58, -123,   59, -123,   65, -209,   97, -161,  101, -132,  105,
		 -37,  111, -132,  114, -123,  117, -133,  121,  -76,   26,   44, -189,   45, -141,   46, -189,   58,  -37,   59,  -37,
		  65, -180,   97, -114,  101,  -94,  105,  -28,  111,  -94,  114, -103,  117,  -84,  121,  -37,   28,   44, -330,   45,
		-250,   46, -330,   58, -179,   59, -179,   65, -218,   97, -190,  101, -215,  105, -114,  111, -235,  112, -190,  113,
		-245,  117, -151,  118, -122,    4,   44, -292,   46, -273,    4,   44, -275,   46, -275,    4,   44, -217,   46, -217,
		   4,   44, -250,   46, -250
	];

	static var BOUNDS_TABLE:Array<Float> =
	[
		  33,     11.426,    -72.802,     26.074,      0.977,
		  34,      3.516,    -71.630,     28.613,    -53.027,
		  35,      1.807,    -72.606,     53.027,      0.977,
		  36,      6.641,    -80.175,     46.923,     12.012,
		  37,      2.978,    -72.802,     56.542,      0.977,
		  38,      6.934,    -72.802,     65.869,      0.977,
		  39,      3.515,    -71.630,     12.500,    -53.027,
		  40,      9.424,    -72.020,     30.176,     20.898,
		  41,      9.423,    -72.020,     30.175,     20.898,
		  42,      2.343,    -71.776,     33.349,    -41.650,
		  43,      5.957,    -51.220,     46.874,    -10.742,
		  44,      8.447,    -13.525,     25.146,     17.724,
		  45,      7.763,    -33.251,     28.662,    -24.707,
		  46,      9.961,    -13.720,     24.609,      0.977,
		  47,      9.228,    -71.825,     42.920,          0,
		  48,      3.125,    -72.802,     49.462,      0.977,
		  49,      9.765,    -71.825,     34.081,          0,
		  50,      2.881,    -72.802,     47.314,          0,
		  51,      5.322,    -72.802,     45.946,      0.977,
		  52,      1.221,    -71.825,     50.293,          0,
		  53,      6.348,    -71.825,     46.923,      0.977,
		  54,      4.101,    -72.802,     48.290,      1.221,
		  55,      4.101,    -71.825,     50.487,          0,
		  56,      4.346,    -72.802,     48.339,      0.977,
		  57,      3.613,    -72.802,     47.802,      1.221,
		  58,      9.961,    -53.271,     24.609,      0.977,
		  59,      8.447,    -53.271,     25.146,     17.724,
		  60,      7.324,    -51.415,     43.408,    -10.644,
		  61,      5.957,    -42.773,     46.874,    -19.287,
		  62,      7.324,    -51.415,     43.408,    -10.644,
		  63,      1.953,    -72.802,     33.691,      0.977,
		  64,      4.883,    -64.696,     72.167,      6.543,
		  65,      0.195,    -72.509,     58.788,          0,
		  66,      7.324,    -72.167,     52.684,          0,
		  67,      3.907,    -72.753,     55.908,      1.221,
		  68,      7.324,    -72.020,     57.421,          0,
		  69,      7.324,    -71.532,     50.048,          0,
		  70,      7.324,    -71.532,     51.513,          0,
		  71,      3.906,    -72.753,     60.302,      1.221,
		  72,      7.324,    -71.532,     58.105,          0,
		  73,      9.033,    -71.532,     18.798,          0,
		  74,      2.393,    -71.532,     40.331,      0.977,
		  75,      7.324,    -71.532,     57.567,          0,
		  76,      7.324,    -71.532,     49.413,          0,
		  77,      0.977,    -71.532,     70.458,      0.977,
		  78,      7.324,    -71.532,     56.493,      0.977,
		  79,      3.906,    -72.802,     63.475,      1.221,
		  80,      7.324,    -72.020,     51.855,          0,
		  81,      3.906,    -72.802,     74.218,     14.795,
		  82,      7.812,    -72.265,     58.202,          0,
		  83,      3.906,    -72.753,     44.140,      1.221,
		  84,      0.879,    -71.532,     57.177,          0,
		  85,      7.324,    -71.532,     57.519,      1.221,
		  86,      0.634,    -71.532,     58.104,      0.977,
		  87,      0.635,    -71.532,     84.569,      0.977,
		  88,      0.635,    -71.581,     55.028,          0,
		  89,      0.635,    -71.532,     56.396,          0,
		  90,      4.883,    -71.532,     50.146,          0,
		  91,      9.863,    -73.729,     32.470,     20.508,
		  92,     -0.147,    -71.825,     31.982,          0,
		  93,      4.248,    -73.729,     26.855,     20.508,
		  94,      7.275,    -71.825,     43.456,    -44.091,
		  95,     -0.391,      6.103,     52.587,     12.402,
		  96,     16.260,    -79.003,     34.131,    -62.743,
		  97,      3.906,    -53.271,     48.632,      0.977,
		  98,      6.592,    -73.729,     52.050,      0.977,
		  99,      3.174,    -53.271,     46.337,      0.977,
		 100,      3.662,    -73.729,     49.023,      0.928,
		 101,      3.174,    -53.271,     51.366,      0.977,
		 102,      3.174,    -73.729,     37.451,          0,
		 103,      3.906,    -55.663,     47.264,     20.508,
		 104,      6.592,    -73.729,     48.095,          0,
		 105,      3.906,    -72.069,     21.923,          0,
		 106,      0.879,    -72.069,     26.806,     20.508,
		 107,      6.592,    -73.729,     50.439,          0,
		 108,      7.324,    -73.729,     25.342,      0.977,
		 109,      6.592,    -53.271,     76.415,          0,
		 110,      6.592,    -53.271,     48.046,          0,
		 111,      3.174,    -53.271,     50.487,      0.977,
		 112,      6.592,    -53.271,     52.148,     20.508,
		 113,      3.662,    -53.271,     49.365,     20.508,
		 114,      7.324,    -53.271,     38.867,          0,
		 115,      3.174,    -53.271,     37.304,      0.977,
		 116,      3.857,    -66.796,     37.304,      0.977,
		 117,      6.104,    -52.294,     48.584,      0.977,
		 118,      0.586,    -52.441,     48.388,      0.977,
		 119,      0.733,    -52.441,     73.681,      0.977,
		 120,      0.586,    -52.294,     49.511,          0,
		 121,      0.586,    -52.294,     48.730,     20.508,
		 122,      1.953,    -52.294,     45.507,          0,
		 123,      1.855,    -73.339,     34.521,     20.508,
		 124,     22.558,    -68.602,     29.687,     13.476,
		 125,      1.855,    -73.339,     34.520,     20.508,
		 126,      7.714,    -34.960,     44.140,    -24.853
	];

	override function _draw(charCode:Int, x:Float, y:Float, s:Float, threshold:Float):Void
	{
		var o = 0;
		switch (charCode)
		{			
			case 33:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   20.166 * s);
			_setf(o + ( 1 << 2), y +  -18.652 * s);
			_setf(o + ( 2 << 2), x +   16.699 * s);
			_setf(o + ( 3 << 2), y +  -18.652 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   16.699 * s,y +  -18.652 * s,x +   14.192 * s,y +  -35.025 * s,x +   12.939 * s,y +  -46.402 * s,x +   12.939 * s,y +  -52.782 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   12.939 * s);
			_setf(o + ( 1 << 2), y +  -72.802 * s);
			_setf(o + ( 2 << 2), x +   23.974 * s);
			_setf(o + ( 3 << 2), y +  -72.802 * s);
			_setf(o + ( 4 << 2), x +   23.974 * s);
			_setf(o + ( 5 << 2), y +  -52.831 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   23.974 * s,y +  -52.831 * s,x +   23.974 * s,y +  -46.614 * s,x +   22.705 * s,y +  -35.221 * s,x +   20.166 * s,y +  -18.652 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   18.750 * s);
			_setf(o + ( 1 << 2), y +  -13.720 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   18.750 * s,y +  -13.720 * s,x +   20.768 * s,y +  -13.720 * s,x +   22.493 * s,y +  -13.004 * s,x +   23.925 * s,y +  -11.572 * s, threshold);
			_vr.bezier8(x +   23.925 * s,y +  -11.572 * s,x +   25.358 * s,y +  -10.140 * s,x +   26.074 * s,y +   -8.415 * s,x +   26.074 * s,y +   -6.396 * s, threshold);
			_vr.bezier8(x +   26.074 * s,y +   -6.396 * s,x +   26.074 * s,y +   -4.378 * s,x +   25.358 * s,y +   -2.645 * s,x +   23.925 * s,y +   -1.196 * s, threshold);
			_vr.bezier8(x +   23.925 * s,y +   -1.196 * s,x +   22.493 * s,y +    0.252 * s,x +   20.768 * s,y +    0.977 * s,x +   18.750 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   18.750 * s,y +    0.977 * s,x +   16.731 * s,y +    0.977 * s,x +   15.006 * s,y +    0.252 * s,x +   13.574 * s,y +   -1.196 * s, threshold);
			_vr.bezier8(x +   13.574 * s,y +   -1.196 * s,x +   12.142 * s,y +   -2.645 * s,x +   11.426 * s,y +   -4.378 * s,x +   11.426 * s,y +   -6.396 * s, threshold);
			_vr.bezier8(x +   11.426 * s,y +   -6.396 * s,x +   11.426 * s,y +   -8.415 * s,x +   12.142 * s,y +  -10.140 * s,x +   13.574 * s,y +  -11.572 * s, threshold);
			_vr.bezier8(x +   13.574 * s,y +  -11.572 * s,x +   15.006 * s,y +  -13.004 * s,x +   16.731 * s,y +  -13.720 * s,x +   18.750 * s,y +  -13.720 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.718 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 34:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +   11.181 * s);
			_setf(o + ( 1 << 2), y +  -53.027 * s);
			_setf(o + ( 2 << 2), x +    4.687 * s);
			_setf(o + ( 3 << 2), y +  -53.027 * s);
			_setf(o + ( 4 << 2), x +    3.516 * s);
			_setf(o + ( 5 << 2), y +  -71.630 * s);
			_setf(o + ( 6 << 2), x +   12.500 * s);
			_setf(o + ( 7 << 2), y +  -71.630 * s);
			_setf(o + ( 8 << 2), x +   11.181 * s);
			_setf(o + ( 9 << 2), y +  -53.027 * s);
			_setf(o + (10 << 2), x +   27.294 * s);
			_setf(o + (11 << 2), y +  -53.027 * s);
			_setf(o + (12 << 2), x +   20.800 * s);
			_setf(o + (13 << 2), y +  -53.027 * s);
			_setf(o + (14 << 2), x +   19.629 * s);
			_setf(o + (15 << 2), y +  -71.630 * s);
			_setf(o + (16 << 2), x +   28.613 * s);
			_setf(o + (17 << 2), y +  -71.630 * s);
			_setf(o + (18 << 2), x +   27.294 * s);
			_setf(o + (19 << 2), y +  -53.027 * s);
			_setf(o + (20 << 2), x +   32.470 * s);
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
			_setf(o + ( 0 << 2), x +   42.920 * s);
			_setf(o + ( 1 << 2), y +  -46.240 * s);
			_setf(o + ( 2 << 2), x +   38.086 * s);
			_setf(o + ( 3 << 2), y +  -27.050 * s);
			_setf(o + ( 4 << 2), x +   45.947 * s);
			_setf(o + ( 5 << 2), y +  -27.050 * s);
			_setf(o + ( 6 << 2), x +   45.947 * s);
			_setf(o + ( 7 << 2), y +  -20.800 * s);
			_setf(o + ( 8 << 2), x +   36.474 * s);
			_setf(o + ( 9 << 2), y +  -20.800 * s);
			_setf(o + (10 << 2), x +   30.420 * s);
			_setf(o + (11 << 2), y +    0.977 * s);
			_setf(o + (12 << 2), x +   24.219 * s);
			_setf(o + (13 << 2), y +    0.977 * s);
			_setf(o + (14 << 2), x +   30.273 * s);
			_setf(o + (15 << 2), y +  -20.800 * s);
			_setf(o + (16 << 2), x +   15.771 * s);
			_setf(o + (17 << 2), y +  -20.800 * s);
			_setf(o + (18 << 2), x +    9.717 * s);
			_setf(o + (19 << 2), y +    0.977 * s);
			_setf(o + (20 << 2), x +    3.369 * s);
			_setf(o + (21 << 2), y +    0.977 * s);
			_setf(o + (22 << 2), x +    9.375 * s);
			_setf(o + (23 << 2), y +  -20.800 * s);
			_setf(o + (24 << 2), x +    1.807 * s);
			_setf(o + (25 << 2), y +  -20.800 * s);
			_setf(o + (26 << 2), x +    1.807 * s);
			_setf(o + (27 << 2), y +  -27.050 * s);
			_setf(o + (28 << 2), x +   10.986 * s);
			_setf(o + (29 << 2), y +  -27.050 * s);
			_setf(o + (30 << 2), x +   15.820 * s);
			_setf(o + (31 << 2), y +  -46.240 * s);
			_setf(o + (32 << 2), x +    7.422 * s);
			_setf(o + (33 << 2), y +  -46.240 * s);
			_setf(o + (34 << 2), x +    7.422 * s);
			_setf(o + (35 << 2), y +  -52.489 * s);
			_setf(o + (36 << 2), x +   17.431 * s);
			_setf(o + (37 << 2), y +  -52.489 * s);
			_setf(o + (38 << 2), x +   22.412 * s);
			_setf(o + (39 << 2), y +  -72.606 * s);
			_setf(o + (40 << 2), x +   28.809 * s);
			_setf(o + (41 << 2), y +  -72.606 * s);
			_setf(o + (42 << 2), x +   23.779 * s);
			_setf(o + (43 << 2), y +  -52.489 * s);
			_setf(o + (44 << 2), x +   38.281 * s);
			_setf(o + (45 << 2), y +  -52.489 * s);
			_setf(o + (46 << 2), x +   43.310 * s);
			_setf(o + (47 << 2), y +  -72.606 * s);
			_setf(o + (48 << 2), x +   49.511 * s);
			_setf(o + (49 << 2), y +  -72.606 * s);
			_setf(o + (50 << 2), x +   44.482 * s);
			_setf(o + (51 << 2), y +  -52.489 * s);
			_setf(o + (52 << 2), x +   53.027 * s);
			_setf(o + (53 << 2), y +  -52.489 * s);
			_setf(o + (54 << 2), x +   53.027 * s);
			_setf(o + (55 << 2), y +  -46.240 * s);
			_setf(o + (56 << 2), x +   42.920 * s);
			_setf(o + (57 << 2), y +  -46.240 * s);
			_setf(o + (58 << 2), x +   22.217 * s);
			_setf(o + (59 << 2), y +  -46.240 * s);
			_setf(o + (60 << 2), x +   17.383 * s);
			_setf(o + (61 << 2), y +  -27.050 * s);
			_setf(o + (62 << 2), x +   31.885 * s);
			_setf(o + (63 << 2), y +  -27.050 * s);
			_setf(o + (64 << 2), x +   36.719 * s);
			_setf(o + (65 << 2), y +  -46.240 * s);
			_setf(o + (66 << 2), x +   22.217 * s);
			_setf(o + (67 << 2), y +  -46.240 * s);
			_setf(o + (68 << 2), x +   52.441 * s);
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
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   22.363 * s);
			_setf(o + ( 1 << 2), y +    1.221 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   22.363 * s,y +    1.221 * s,x +   20.117 * s,y +    1.090 * s,x +   17.285 * s,y +    0.521 * s,x +   13.867 * s,y +   -0.488 * s, threshold);
			_vr.bezier8(x +   13.867 * s,y +   -0.488 * s,x +   10.449 * s,y +   -1.497 * s,x +    8.105 * s,y +   -2.425 * s,x +    6.836 * s,y +   -3.271 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   10.351 * s);
			_setf(o + ( 1 << 2), y +  -12.256 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   10.351 * s,y +  -12.256 * s,x +   12.044 * s,y +  -11.019 * s,x +   14.282 * s,y +   -9.928 * s,x +   17.065 * s,y +   -8.984 * s, threshold);
			_vr.bezier8(x +   17.065 * s,y +   -8.984 * s,x +   19.848 * s,y +   -8.040 * s,x +   22.330 * s,y +   -7.568 * s,x +   24.511 * s,y +   -7.568 * s, threshold);
			_vr.bezier8(x +   24.511 * s,y +   -7.568 * s,x +   28.320 * s,y +   -7.568 * s,x +   31.380 * s,y +   -8.610 * s,x +   33.691 * s,y +  -10.693 * s, threshold);
			_vr.bezier8(x +   33.691 * s,y +  -10.693 * s,x +   36.002 * s,y +  -12.776 * s,x +   37.158 * s,y +  -15.429 * s,x +   37.158 * s,y +  -18.652 * s, threshold);
			_vr.bezier8(x +   37.158 * s,y +  -18.652 * s,x +   37.158 * s,y +  -20.670 * s,x +   36.824 * s,y +  -22.461 * s,x +   36.157 * s,y +  -24.023 * s, threshold);
			_vr.bezier8(x +   36.157 * s,y +  -24.023 * s,x +   35.489 * s,y +  -25.586 * s,x +   34.578 * s,y +  -26.847 * s,x +   33.422 * s,y +  -27.807 * s, threshold);
			_vr.bezier8(x +   33.422 * s,y +  -27.807 * s,x +   32.267 * s,y +  -28.767 * s,x +   29.641 * s,y +  -30.215 * s,x +   25.537 * s,y +  -32.128 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   19.775 * s);
			_setf(o + ( 1 << 2), y +  -34.814 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   19.775 * s,y +  -34.814 * s,x +   14.891 * s,y +  -37.090 * s,x +   11.483 * s,y +  -39.794 * s,x +    9.546 * s,y +  -42.919 * s, threshold);
			_vr.bezier8(x +    9.546 * s,y +  -42.919 * s,x +    7.609 * s,y +  -46.044 * s,x +    6.641 * s,y +  -49.804 * s,x +    6.641 * s,y +  -54.198 * s, threshold);
			_vr.bezier8(x +    6.641 * s,y +  -54.198 * s,x +    6.641 * s,y +  -58.723 * s,x +    8.065 * s,y +  -62.662 * s,x +   10.913 * s,y +  -66.015 * s, threshold);
			_vr.bezier8(x +   10.913 * s,y +  -66.015 * s,x +   13.761 * s,y +  -69.367 * s,x +   17.578 * s,y +  -71.483 * s,x +   22.363 * s,y +  -72.362 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   22.363 * s);
			_setf(o + ( 1 << 2), y +  -80.175 * s);
			_setf(o + ( 2 << 2), x +   29.150 * s);
			_setf(o + ( 3 << 2), y +  -80.175 * s);
			_setf(o + ( 4 << 2), x +   29.150 * s);
			_setf(o + ( 5 << 2), y +  -72.704 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   29.150 * s,y +  -72.704 * s,x +   36.149 * s,y +  -72.411 * s,x +   40.885 * s,y +  -71.141 * s,x +   43.359 * s,y +  -68.895 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   40.478 * s);
			_setf(o + ( 1 << 2), y +  -60.399 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   40.478 * s,y +  -60.399 * s,x +   39.176 * s,y +  -61.343 * s,x +   37.190 * s,y +  -62.255 * s,x +   34.521 * s,y +  -63.134 * s, threshold);
			_vr.bezier8(x +   34.521 * s,y +  -63.134 * s,x +   31.852 * s,y +  -64.013 * s,x +   29.378 * s,y +  -64.452 * s,x +   27.099 * s,y +  -64.452 * s, threshold);
			_vr.bezier8(x +   27.099 * s,y +  -64.452 * s,x +   23.779 * s,y +  -64.452 * s,x +   21.167 * s,y +  -63.508 * s,x +   19.262 * s,y +  -61.620 * s, threshold);
			_vr.bezier8(x +   19.262 * s,y +  -61.620 * s,x +   17.358 * s,y +  -59.732 * s,x +   16.406 * s,y +  -57.307 * s,x +   16.406 * s,y +  -54.345 * s, threshold);
			_vr.bezier8(x +   16.406 * s,y +  -54.345 * s,x +   16.406 * s,y +  -52.522 * s,x +   16.748 * s,y +  -50.862 * s,x +   17.431 * s,y +  -49.364 * s, threshold);
			_vr.bezier8(x +   17.431 * s,y +  -49.364 * s,x +   18.115 * s,y +  -47.867 * s,x +   19.091 * s,y +  -46.598 * s,x +   20.361 * s,y +  -45.556 * s, threshold);
			_vr.bezier8(x +   20.361 * s,y +  -45.556 * s,x +   21.631 * s,y +  -44.514 * s,x +   24.089 * s,y +  -43.083 * s,x +   27.783 * s,y +  -41.357 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   32.275 * s);
			_setf(o + ( 1 << 2), y +  -39.257 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   32.275 * s,y +  -39.257 * s,x +   37.354 * s,y +  -36.883 * s,x +   41.064 * s,y +  -33.976 * s,x +   43.408 * s,y +  -30.542 * s, threshold);
			_vr.bezier8(x +   43.408 * s,y +  -30.542 * s,x +   45.751 * s,y +  -27.107 * s,x +   46.923 * s,y +  -22.705 * s,x +   46.923 * s,y +  -17.334 * s, threshold);
			_vr.bezier8(x +   46.923 * s,y +  -17.334 * s,x +   46.923 * s,y +  -12.907 * s,x +   45.352 * s,y +   -9.025 * s,x +   42.211 * s,y +   -5.688 * s, threshold);
			_vr.bezier8(x +   42.211 * s,y +   -5.688 * s,x +   39.070 * s,y +   -2.352 * s,x +   34.716 * s,y +   -0.212 * s,x +   29.150 * s,y +    0.732 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   29.150 * s);
			_setf(o + ( 1 << 2), y +   12.012 * s);
			_setf(o + ( 2 << 2), x +   22.363 * s);
			_setf(o + ( 3 << 2), y +   12.012 * s);
			_setf(o + ( 4 << 2), x +   22.363 * s);
			_setf(o + ( 5 << 2), y +    1.221 * s);
			_setf(o + ( 6 << 2), x +   52.441 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			
			case 37:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   10.644 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			_setf(o + ( 2 << 2), x +    4.443 * s);
			_setf(o + ( 3 << 2), y +    0.977 * s);
			_setf(o + ( 4 << 2), x +   47.557 * s);
			_setf(o + ( 5 << 2), y +  -72.802 * s);
			_setf(o + ( 6 << 2), x +   53.710 * s);
			_setf(o + ( 7 << 2), y +  -72.802 * s);
			_setf(o + ( 8 << 2), x +   10.644 * s);
			_setf(o + ( 9 << 2), y +    0.977 * s);
			_setf(o + (10 << 2), x +    2.978 * s);
			_setf(o + (11 << 2), y +  -56.737 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_vr.bezier8(x +    2.978 * s,y +  -56.737 * s,x +    2.978 * s,y +  -61.523 * s,x +    4.296 * s,y +  -65.396 * s,x +    6.933 * s,y +  -68.358 * s, threshold);
			_vr.bezier8(x +    6.933 * s,y +  -68.358 * s,x +    9.570 * s,y +  -71.321 * s,x +   12.922 * s,y +  -72.802 * s,x +   16.992 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   16.992 * s,y +  -72.802 * s,x +   20.995 * s,y +  -72.802 * s,x +   24.194 * s,y +  -71.337 * s,x +   26.586 * s,y +  -68.407 * s, threshold);
			_vr.bezier8(x +   26.586 * s,y +  -68.407 * s,x +   28.979 * s,y +  -65.478 * s,x +   30.175 * s,y +  -61.278 * s,x +   30.175 * s,y +  -55.810 * s, threshold);
			_vr.bezier8(x +   30.175 * s,y +  -55.810 * s,x +   30.175 * s,y +  -50.732 * s,x +   28.905 * s,y +  -46.703 * s,x +   26.366 * s,y +  -43.725 * s, threshold);
			_vr.bezier8(x +   26.366 * s,y +  -43.725 * s,x +   23.827 * s,y +  -40.746 * s,x +   20.556 * s,y +  -39.257 * s,x +   16.552 * s,y +  -39.257 * s, threshold);
			_vr.bezier8(x +   16.552 * s,y +  -39.257 * s,x +    7.503 * s,y +  -39.257 * s,x +    2.978 * s,y +  -45.084 * s,x +    2.978 * s,y +  -56.737 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    9.130 * s);
			_setf(o + ( 1 << 2), y +  -56.249 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +    9.130 * s,y +  -56.249 * s,x +    9.130 * s,y +  -52.441 * s,x +    9.773 * s,y +  -49.487 * s,x +   11.059 * s,y +  -47.387 * s, threshold);
			_vr.bezier8(x +   11.059 * s,y +  -47.387 * s,x +   12.345 * s,y +  -45.287 * s,x +   14.029 * s,y +  -44.238 * s,x +   16.113 * s,y +  -44.238 * s, threshold);
			_vr.bezier8(x +   16.113 * s,y +  -44.238 * s,x +   21.386 * s,y +  -44.238 * s,x +   24.023 * s,y +  -48.225 * s,x +   24.023 * s,y +  -56.200 * s, threshold);
			_vr.bezier8(x +   24.023 * s,y +  -56.200 * s,x +   24.023 * s,y +  -63.947 * s,x +   21.630 * s,y +  -67.821 * s,x +   16.845 * s,y +  -67.821 * s, threshold);
			_vr.bezier8(x +   16.845 * s,y +  -67.821 * s,x +   14.469 * s,y +  -67.821 * s,x +   12.589 * s,y +  -66.780 * s,x +   11.205 * s,y +  -64.696 * s, threshold);
			_vr.bezier8(x +   11.205 * s,y +  -64.696 * s,x +    9.822 * s,y +  -62.613 * s,x +    9.130 * s,y +  -59.797 * s,x +    9.130 * s,y +  -56.249 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   29.345 * s);
			_setf(o + ( 1 << 2), y +  -16.504 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   29.345 * s,y +  -16.504 * s,x +   29.345 * s,y +  -21.289 * s,x +   30.663 * s,y +  -25.162 * s,x +   33.300 * s,y +  -28.125 * s, threshold);
			_vr.bezier8(x +   33.300 * s,y +  -28.125 * s,x +   35.937 * s,y +  -31.087 * s,x +   39.289 * s,y +  -32.568 * s,x +   43.358 * s,y +  -32.568 * s, threshold);
			_vr.bezier8(x +   43.358 * s,y +  -32.568 * s,x +   47.362 * s,y +  -32.568 * s,x +   50.560 * s,y +  -31.103 * s,x +   52.953 * s,y +  -28.173 * s, threshold);
			_vr.bezier8(x +   52.953 * s,y +  -28.173 * s,x +   55.345 * s,y +  -25.244 * s,x +   56.542 * s,y +  -21.045 * s,x +   56.542 * s,y +  -15.576 * s, threshold);
			_vr.bezier8(x +   56.542 * s,y +  -15.576 * s,x +   56.542 * s,y +  -10.498 * s,x +   55.272 * s,y +   -6.470 * s,x +   52.733 * s,y +   -3.491 * s, threshold);
			_vr.bezier8(x +   52.733 * s,y +   -3.491 * s,x +   50.194 * s,y +   -0.513 * s,x +   46.923 * s,y +    0.977 * s,x +   42.919 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   42.919 * s,y +    0.977 * s,x +   33.870 * s,y +    0.977 * s,x +   29.345 * s,y +   -4.850 * s,x +   29.345 * s,y +  -16.504 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   35.497 * s);
			_setf(o + ( 1 << 2), y +  -16.015 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   35.497 * s,y +  -16.015 * s,x +   35.497 * s,y +  -12.207 * s,x +   36.140 * s,y +   -9.253 * s,x +   37.426 * s,y +   -7.153 * s, threshold);
			_vr.bezier8(x +   37.426 * s,y +   -7.153 * s,x +   38.712 * s,y +   -5.054 * s,x +   40.396 * s,y +   -4.004 * s,x +   42.479 * s,y +   -4.004 * s, threshold);
			_vr.bezier8(x +   42.479 * s,y +   -4.004 * s,x +   47.753 * s,y +   -4.004 * s,x +   50.389 * s,y +   -7.992 * s,x +   50.389 * s,y +  -15.967 * s, threshold);
			_vr.bezier8(x +   50.389 * s,y +  -15.967 * s,x +   50.389 * s,y +  -23.714 * s,x +   47.997 * s,y +  -27.587 * s,x +   43.212 * s,y +  -27.587 * s, threshold);
			_vr.bezier8(x +   43.212 * s,y +  -27.587 * s,x +   40.836 * s,y +  -27.587 * s,x +   38.956 * s,y +  -26.546 * s,x +   37.572 * s,y +  -24.463 * s, threshold);
			_vr.bezier8(x +   37.572 * s,y +  -24.463 * s,x +   36.189 * s,y +  -22.379 * s,x +   35.497 * s,y +  -19.563 * s,x +   35.497 * s,y +  -16.015 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.008 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 38:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   45.361 * s);
			_setf(o + ( 1 << 2), y +   -2.490 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   45.361 * s,y +   -2.490 * s,x +   40.641 * s,y +   -0.179 * s,x +   34.944 * s,y +    0.977 * s,x +   28.271 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   28.271 * s,y +    0.977 * s,x +   21.468 * s,y +    0.977 * s,x +   16.211 * s,y +   -1.033 * s,x +   12.500 * s,y +   -5.054 * s, threshold);
			_vr.bezier8(x +   12.500 * s,y +   -5.054 * s,x +    8.789 * s,y +   -9.074 * s,x +    6.934 * s,y +  -14.762 * s,x +    6.934 * s,y +  -22.119 * s, threshold);
			_vr.bezier8(x +    6.934 * s,y +  -22.119 * s,x +    6.934 * s,y +  -25.895 * s,x +    7.495 * s,y +  -29.166 * s,x +    8.618 * s,y +  -31.933 * s, threshold);
			_vr.bezier8(x +    8.618 * s,y +  -31.933 * s,x +    9.741 * s,y +  -34.700 * s,x +   11.800 * s,y +  -37.565 * s,x +   14.795 * s,y +  -40.527 * s, threshold);
			_vr.bezier8(x +   14.795 * s,y +  -40.527 * s,x +   10.205 * s,y +  -45.084 * s,x +    7.910 * s,y +  -49.820 * s,x +    7.910 * s,y +  -54.735 * s, threshold);
			_vr.bezier8(x +    7.910 * s,y +  -54.735 * s,x +    7.910 * s,y +  -59.716 * s,x +    9.790 * s,y +  -63.972 * s,x +   13.550 * s,y +  -67.504 * s, threshold);
			_vr.bezier8(x +   13.550 * s,y +  -67.504 * s,x +   17.310 * s,y +  -71.036 * s,x +   22.347 * s,y +  -72.802 * s,x +   28.662 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   28.662 * s,y +  -72.802 * s,x +   35.368 * s,y +  -72.802 * s,x +   40.543 * s,y +  -71.321 * s,x +   44.189 * s,y +  -68.358 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   40.137 * s);
			_setf(o + ( 1 << 2), y +  -60.839 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   40.137 * s,y +  -60.839 * s,x +   36.426 * s,y +  -63.931 * s,x +   33.105 * s,y +  -65.478 * s,x +   30.176 * s,y +  -65.478 * s, threshold);
			_vr.bezier8(x +   30.176 * s,y +  -65.478 * s,x +   21.517 * s,y +  -65.478 * s,x +   17.188 * s,y +  -61.572 * s,x +   17.188 * s,y +  -53.759 * s, threshold);
			_vr.bezier8(x +   17.188 * s,y +  -53.759 * s,x +   17.188 * s,y +  -49.527 * s,x +   19.076 * s,y +  -45.947 * s,x +   22.852 * s,y +  -43.017 * s, threshold);
			o = _posf(16);
			_setf(o + ( 0 << 2), x +   41.015 * s);
			_setf(o + ( 1 << 2), y +  -43.017 * s);
			_setf(o + ( 2 << 2), x +   41.015 * s);
			_setf(o + ( 3 << 2), y +  -51.952 * s);
			_setf(o + ( 4 << 2), x +   50.293 * s);
			_setf(o + ( 5 << 2), y +  -55.517 * s);
			_setf(o + ( 6 << 2), x +   50.293 * s);
			_setf(o + ( 7 << 2), y +  -42.870 * s);
			_setf(o + ( 8 << 2), x +   62.451 * s);
			_setf(o + ( 9 << 2), y +  -42.870 * s);
			_setf(o + (10 << 2), x +   62.451 * s);
			_setf(o + (11 << 2), y +  -35.058 * s);
			_setf(o + (12 << 2), x +   50.293 * s);
			_setf(o + (13 << 2), y +  -35.058 * s);
			_setf(o + (14 << 2), x +   50.293 * s);
			_setf(o + (15 << 2), y +  -18.945 * s);
			o = _posb(8);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_vr.bezier8(x +   50.293 * s,y +  -18.945 * s,x +   50.293 * s,y +  -14.453 * s,x +   50.895 * s,y +  -11.393 * s,x +   52.099 * s,y +   -9.765 * s, threshold);
			_vr.bezier8(x +   52.099 * s,y +   -9.765 * s,x +   53.304 * s,y +   -8.138 * s,x +   55.387 * s,y +   -7.324 * s,x +   58.349 * s,y +   -7.324 * s, threshold);
			_vr.bezier8(x +   58.349 * s,y +   -7.324 * s,x +   60.107 * s,y +   -7.324 * s,x +   62.174 * s,y +   -7.926 * s,x +   64.550 * s,y +   -9.131 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   65.869 * s);
			_setf(o + ( 1 << 2), y +   -0.488 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   65.869 * s,y +   -0.488 * s,x +   62.451 * s,y +    0.488 * s,x +   58.544 * s,y +    0.977 * s,x +   54.150 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   54.150 * s,y +    0.977 * s,x +   51.123 * s,y +    0.977 * s,x +   48.193 * s,y +   -0.179 * s,x +   45.361 * s,y +   -2.490 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   41.015 * s);
			_setf(o + ( 1 << 2), y +  -15.332 * s);
			_setf(o + ( 2 << 2), x +   41.015 * s);
			_setf(o + ( 3 << 2), y +  -35.058 * s);
			_setf(o + ( 4 << 2), x +   21.338 * s);
			_setf(o + ( 5 << 2), y +  -35.058 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   21.338 * s,y +  -35.058 * s,x +   18.246 * s,y +  -31.087 * s,x +   16.699 * s,y +  -26.920 * s,x +   16.699 * s,y +  -22.558 * s, threshold);
			_vr.bezier8(x +   16.699 * s,y +  -22.558 * s,x +   16.699 * s,y +  -12.402 * s,x +   21.664 * s,y +   -7.324 * s,x +   31.592 * s,y +   -7.324 * s, threshold);
			_vr.bezier8(x +   31.592 * s,y +   -7.324 * s,x +   36.019 * s,y +   -7.324 * s,x +   39.339 * s,y +   -8.122 * s,x +   41.553 * s,y +   -9.717 * s, threshold);
			_vr.bezier8(x +   41.553 * s,y +   -9.717 * s,x +   41.194 * s,y +  -11.214 * s,x +   41.015 * s,y +  -13.086 * s,x +   41.015 * s,y +  -15.332 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   70.605 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 39:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   11.181 * s);
			_setf(o + ( 1 << 2), y +  -53.027 * s);
			_setf(o + ( 2 << 2), x +    4.687 * s);
			_setf(o + ( 3 << 2), y +  -53.027 * s);
			_setf(o + ( 4 << 2), x +    3.515 * s);
			_setf(o + ( 5 << 2), y +  -71.630 * s);
			_setf(o + ( 6 << 2), x +   12.500 * s);
			_setf(o + ( 7 << 2), y +  -71.630 * s);
			_setf(o + ( 8 << 2), x +   11.181 * s);
			_setf(o + ( 9 << 2), y +  -53.027 * s);
			_setf(o + (10 << 2), x +   15.966 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 40:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   30.176 * s);
			_setf(o + ( 1 << 2), y +  -72.020 * s);
			_setf(o + ( 2 << 2), x +   30.176 * s);
			_setf(o + ( 3 << 2), y +  -67.968 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   30.176 * s,y +  -67.968 * s,x +   23.730 * s,y +  -58.658 * s,x +   20.508 * s,y +  -45.069 * s,x +   20.508 * s,y +  -27.197 * s, threshold);
			_vr.bezier8(x +   20.508 * s,y +  -27.197 * s,x +   20.508 * s,y +   -5.973 * s,x +   23.730 * s,y +    8.349 * s,x +   30.176 * s,y +   15.771 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   30.176 * s);
			_setf(o + ( 1 << 2), y +   20.898 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   30.176 * s,y +   20.898 * s,x +   23.600 * s,y +   16.308 * s,x +   18.498 * s,y +    9.725 * s,x +   14.868 * s,y +    1.147 * s, threshold);
			_vr.bezier8(x +   14.868 * s,y +    1.147 * s,x +   11.239 * s,y +   -7.430 * s,x +    9.424 * s,y +  -16.911 * s,x +    9.424 * s,y +  -27.294 * s, threshold);
			_vr.bezier8(x +    9.424 * s,y +  -27.294 * s,x +    9.424 * s,y +  -36.148 * s,x +   11.491 * s,y +  -45.092 * s,x +   15.625 * s,y +  -54.125 * s, threshold);
			_vr.bezier8(x +   15.625 * s,y +  -54.125 * s,x +   19.759 * s,y +  -63.158 * s,x +   24.609 * s,y +  -69.123 * s,x +   30.176 * s,y +  -72.020 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.719 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 41:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    9.423 * s);
			_setf(o + ( 1 << 2), y +   20.898 * s);
			_setf(o + ( 2 << 2), x +    9.423 * s);
			_setf(o + ( 3 << 2), y +   15.771 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    9.423 * s,y +   15.771 * s,x +   15.868 * s,y +    8.349 * s,x +   19.091 * s,y +   -5.973 * s,x +   19.091 * s,y +  -27.197 * s, threshold);
			_vr.bezier8(x +   19.091 * s,y +  -27.197 * s,x +   19.091 * s,y +  -45.069 * s,x +   15.868 * s,y +  -58.658 * s,x +    9.423 * s,y +  -67.968 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    9.423 * s);
			_setf(o + ( 1 << 2), y +  -72.020 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    9.423 * s,y +  -72.020 * s,x +   14.990 * s,y +  -69.123 * s,x +   19.840 * s,y +  -63.158 * s,x +   23.974 * s,y +  -54.125 * s, threshold);
			_vr.bezier8(x +   23.974 * s,y +  -54.125 * s,x +   28.108 * s,y +  -45.092 * s,x +   30.175 * s,y +  -36.148 * s,x +   30.175 * s,y +  -27.294 * s, threshold);
			_vr.bezier8(x +   30.175 * s,y +  -27.294 * s,x +   30.175 * s,y +  -16.911 * s,x +   28.360 * s,y +   -7.430 * s,x +   24.731 * s,y +    1.147 * s, threshold);
			_vr.bezier8(x +   24.731 * s,y +    1.147 * s,x +   21.101 * s,y +    9.725 * s,x +   15.999 * s,y +   16.308 * s,x +    9.423 * s,y +   20.898 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.718 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 42:
			
			o = _posf(54);
			_setf(o + ( 0 << 2), x +   29.150 * s);
			_setf(o + ( 1 << 2), y +  -55.028 * s);
			_setf(o + ( 2 << 2), x +   20.703 * s);
			_setf(o + ( 3 << 2), y +  -54.882 * s);
			_setf(o + ( 4 << 2), x +   28.417 * s);
			_setf(o + ( 5 << 2), y +  -49.755 * s);
			_setf(o + ( 6 << 2), x +   30.712 * s);
			_setf(o + ( 7 << 2), y +  -46.728 * s);
			_setf(o + ( 8 << 2), x +   24.755 * s);
			_setf(o + ( 9 << 2), y +  -41.650 * s);
			_setf(o + (10 << 2), x +   22.119 * s);
			_setf(o + (11 << 2), y +  -45.068 * s);
			_setf(o + (12 << 2), x +   18.115 * s);
			_setf(o + (13 << 2), y +  -52.831 * s);
			_setf(o + (14 << 2), x +   13.671 * s);
			_setf(o + (15 << 2), y +  -44.921 * s);
			_setf(o + (16 << 2), x +   11.572 * s);
			_setf(o + (17 << 2), y +  -41.796 * s);
			_setf(o + (18 << 2), x +    5.175 * s);
			_setf(o + (19 << 2), y +  -46.728 * s);
			_setf(o + (20 << 2), x +    7.617 * s);
			_setf(o + (21 << 2), y +  -50.097 * s);
			_setf(o + (22 << 2), x +   15.332 * s);
			_setf(o + (23 << 2), y +  -54.150 * s);
			_setf(o + (24 << 2), x +    6.738 * s);
			_setf(o + (25 << 2), y +  -55.468 * s);
			_setf(o + (26 << 2), x +    2.343 * s);
			_setf(o + (27 << 2), y +  -57.030 * s);
			_setf(o + (28 << 2), x +    5.859 * s);
			_setf(o + (29 << 2), y +  -64.354 * s);
			_setf(o + (30 << 2), x +   10.546 * s);
			_setf(o + (31 << 2), y +  -62.548 * s);
			_setf(o + (32 << 2), x +   16.650 * s);
			_setf(o + (33 << 2), y +  -57.909 * s);
			_setf(o + (34 << 2), x +   13.574 * s);
			_setf(o + (35 << 2), y +  -67.919 * s);
			_setf(o + (36 << 2), x +   13.574 * s);
			_setf(o + (37 << 2), y +  -71.776 * s);
			_setf(o + (38 << 2), x +   22.167 * s);
			_setf(o + (39 << 2), y +  -71.776 * s);
			_setf(o + (40 << 2), x +   22.167 * s);
			_setf(o + (41 << 2), y +  -68.065 * s);
			_setf(o + (42 << 2), x +   19.238 * s);
			_setf(o + (43 << 2), y +  -57.763 * s);
			_setf(o + (44 << 2), x +   26.952 * s);
			_setf(o + (45 << 2), y +  -62.987 * s);
			_setf(o + (46 << 2), x +   30.566 * s);
			_setf(o + (47 << 2), y +  -64.306 * s);
			_setf(o + (48 << 2), x +   33.349 * s);
			_setf(o + (49 << 2), y +  -56.444 * s);
			_setf(o + (50 << 2), x +   29.150 * s);
			_setf(o + (51 << 2), y +  -55.028 * s);
			_setf(o + (52 << 2), x +   36.718 * s);
			_setf(o + (53 << 2), y +       0. * s);
			o = _posb(27);
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
			_setb(o + 26, 1);
			
			case 43:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   29.833 * s);
			_setf(o + ( 1 << 2), y +  -34.472 * s);
			_setf(o + ( 2 << 2), x +   46.874 * s);
			_setf(o + ( 3 << 2), y +  -34.472 * s);
			_setf(o + ( 4 << 2), x +   46.874 * s);
			_setf(o + ( 5 << 2), y +  -27.587 * s);
			_setf(o + ( 6 << 2), x +   29.833 * s);
			_setf(o + ( 7 << 2), y +  -27.587 * s);
			_setf(o + ( 8 << 2), x +   29.833 * s);
			_setf(o + ( 9 << 2), y +  -10.742 * s);
			_setf(o + (10 << 2), x +   22.949 * s);
			_setf(o + (11 << 2), y +  -10.742 * s);
			_setf(o + (12 << 2), x +   22.949 * s);
			_setf(o + (13 << 2), y +  -27.587 * s);
			_setf(o + (14 << 2), x +    5.957 * s);
			_setf(o + (15 << 2), y +  -27.587 * s);
			_setf(o + (16 << 2), x +    5.957 * s);
			_setf(o + (17 << 2), y +  -34.472 * s);
			_setf(o + (18 << 2), x +   22.949 * s);
			_setf(o + (19 << 2), y +  -34.472 * s);
			_setf(o + (20 << 2), x +   22.949 * s);
			_setf(o + (21 << 2), y +  -51.220 * s);
			_setf(o + (22 << 2), x +   29.833 * s);
			_setf(o + (23 << 2), y +  -51.220 * s);
			_setf(o + (24 << 2), x +   29.833 * s);
			_setf(o + (25 << 2), y +  -34.472 * s);
			_setf(o + (26 << 2), x +   52.441 * s);
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
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   10.937 * s);
			_setf(o + ( 1 << 2), y +   17.724 * s);
			_setf(o + ( 2 << 2), x +    8.447 * s);
			_setf(o + ( 3 << 2), y +   14.209 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    8.447 * s,y +   14.209 * s,x +   14.045 * s,y +    9.619 * s,x +   16.845 * s,y +    5.713 * s,x +   16.845 * s,y +    2.490 * s, threshold);
			_vr.bezier8(x +   16.845 * s,y +    2.490 * s,x +   16.845 * s,y +    1.058 * s,x +   16.357 * s,y +   -0.374 * s,x +   15.380 * s,y +   -1.807 * s, threshold);
			_vr.bezier8(x +   15.380 * s,y +   -1.807 * s,x +   12.581 * s,y +   -3.141 * s,x +   11.181 * s,y +   -5.062 * s,x +   11.181 * s,y +   -7.568 * s, threshold);
			_vr.bezier8(x +   11.181 * s,y +   -7.568 * s,x +   11.181 * s,y +   -9.293 * s,x +   11.848 * s,y +  -10.718 * s,x +   13.183 * s,y +  -11.841 * s, threshold);
			_vr.bezier8(x +   13.183 * s,y +  -11.841 * s,x +   14.517 * s,y +  -12.964 * s,x +   16.194 * s,y +  -13.525 * s,x +   18.212 * s,y +  -13.525 * s, threshold);
			_vr.bezier8(x +   18.212 * s,y +  -13.525 * s,x +   20.002 * s,y +  -13.525 * s,x +   21.606 * s,y +  -12.744 * s,x +   23.022 * s,y +  -11.181 * s, threshold);
			_vr.bezier8(x +   23.022 * s,y +  -11.181 * s,x +   24.438 * s,y +   -9.619 * s,x +   25.146 * s,y +   -7.796 * s,x +   25.146 * s,y +   -5.713 * s, threshold);
			_vr.bezier8(x +   25.146 * s,y +   -5.713 * s,x +   25.146 * s,y +   -1.383 * s,x +   24.242 * s,y +    2.515 * s,x +   22.436 * s,y +    5.981 * s, threshold);
			_vr.bezier8(x +   22.436 * s,y +    5.981 * s,x +   20.629 * s,y +    9.448 * s,x +   16.796 * s,y +   13.362 * s,x +   10.937 * s,y +   17.724 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.718 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 45:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +    7.763 * s);
			_setf(o + ( 1 << 2), y +  -24.707 * s);
			_setf(o + ( 2 << 2), x +    7.763 * s);
			_setf(o + ( 3 << 2), y +  -33.251 * s);
			_setf(o + ( 4 << 2), x +   28.662 * s);
			_setf(o + ( 5 << 2), y +  -33.251 * s);
			_setf(o + ( 6 << 2), x +   28.662 * s);
			_setf(o + ( 7 << 2), y +  -24.707 * s);
			_setf(o + ( 8 << 2), x +    7.763 * s);
			_setf(o + ( 9 << 2), y +  -24.707 * s);
			_setf(o + (10 << 2), x +   36.718 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 46:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   17.285 * s);
			_setf(o + ( 1 << 2), y +  -13.720 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   17.285 * s,y +  -13.720 * s,x +   19.303 * s,y +  -13.720 * s,x +   21.028 * s,y +  -13.004 * s,x +   22.461 * s,y +  -11.572 * s, threshold);
			_vr.bezier8(x +   22.461 * s,y +  -11.572 * s,x +   23.893 * s,y +  -10.140 * s,x +   24.609 * s,y +   -8.415 * s,x +   24.609 * s,y +   -6.396 * s, threshold);
			_vr.bezier8(x +   24.609 * s,y +   -6.396 * s,x +   24.609 * s,y +   -4.378 * s,x +   23.893 * s,y +   -2.645 * s,x +   22.461 * s,y +   -1.196 * s, threshold);
			_vr.bezier8(x +   22.461 * s,y +   -1.196 * s,x +   21.028 * s,y +    0.252 * s,x +   19.303 * s,y +    0.977 * s,x +   17.285 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   17.285 * s,y +    0.977 * s,x +   15.267 * s,y +    0.977 * s,x +   13.541 * s,y +    0.252 * s,x +   12.109 * s,y +   -1.196 * s, threshold);
			_vr.bezier8(x +   12.109 * s,y +   -1.196 * s,x +   10.677 * s,y +   -2.645 * s,x +    9.961 * s,y +   -4.378 * s,x +    9.961 * s,y +   -6.396 * s, threshold);
			_vr.bezier8(x +    9.961 * s,y +   -6.396 * s,x +    9.961 * s,y +   -8.415 * s,x +   10.677 * s,y +  -10.140 * s,x +   12.109 * s,y +  -11.572 * s, threshold);
			_vr.bezier8(x +   12.109 * s,y +  -11.572 * s,x +   13.541 * s,y +  -13.004 * s,x +   15.267 * s,y +  -13.720 * s,x +   17.285 * s,y +  -13.720 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.718 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 47:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   17.089 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    9.228 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   35.156 * s);
			_setf(o + ( 5 << 2), y +  -71.825 * s);
			_setf(o + ( 6 << 2), x +   42.920 * s);
			_setf(o + ( 7 << 2), y +  -71.825 * s);
			_setf(o + ( 8 << 2), x +   17.089 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   52.441 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 48:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    3.125 * s);
			_setf(o + ( 1 << 2), y +  -37.939 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +    3.125 * s,y +  -37.939 * s,x +    3.125 * s,y +  -48.225 * s,x +    5.208 * s,y +  -56.607 * s,x +    9.375 * s,y +  -63.085 * s, threshold);
			_vr.bezier8(x +    9.375 * s,y +  -63.085 * s,x +   13.541 * s,y +  -69.563 * s,x +   19.401 * s,y +  -72.802 * s,x +   26.953 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   26.953 * s,y +  -72.802 * s,x +   34.439 * s,y +  -72.802 * s,x +   40.063 * s,y +  -70.100 * s,x +   43.823 * s,y +  -64.696 * s, threshold);
			_vr.bezier8(x +   43.823 * s,y +  -64.696 * s,x +   47.582 * s,y +  -59.293 * s,x +   49.462 * s,y +  -49.853 * s,x +   49.462 * s,y +  -36.376 * s, threshold);
			_vr.bezier8(x +   49.462 * s,y +  -36.376 * s,x +   49.462 * s,y +  -24.788 * s,x +   47.493 * s,y +  -15.665 * s,x +   43.554 * s,y +   -9.009 * s, threshold);
			_vr.bezier8(x +   43.554 * s,y +   -9.009 * s,x +   39.615 * s,y +   -2.352 * s,x +   33.854 * s,y +    0.977 * s,x +   26.269 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   26.269 * s,y +    0.977 * s,x +   18.685 * s,y +    0.977 * s,x +   12.931 * s,y +   -1.709 * s,x +    9.009 * s,y +   -7.080 * s, threshold);
			_vr.bezier8(x +    9.009 * s,y +   -7.080 * s,x +    5.086 * s,y +  -12.451 * s,x +    3.125 * s,y +  -22.738 * s,x +    3.125 * s,y +  -37.939 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   12.890 * s);
			_setf(o + ( 1 << 2), y +  -37.060 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   12.890 * s,y +  -37.060 * s,x +   12.890 * s,y +  -17.235 * s,x +   17.122 * s,y +   -7.324 * s,x +   25.586 * s,y +   -7.324 * s, threshold);
			_vr.bezier8(x +   25.586 * s,y +   -7.324 * s,x +   30.436 * s,y +   -7.324 * s,x +   34.000 * s,y +   -9.521 * s,x +   36.279 * s,y +  -13.916 * s, threshold);
			_vr.bezier8(x +   36.279 * s,y +  -13.916 * s,x +   38.557 * s,y +  -18.310 * s,x +   39.697 * s,y +  -26.009 * s,x +   39.697 * s,y +  -37.011 * s, threshold);
			_vr.bezier8(x +   39.697 * s,y +  -37.011 * s,x +   39.697 * s,y +  -44.596 * s,x +   39.257 * s,y +  -50.162 * s,x +   38.378 * s,y +  -53.710 * s, threshold);
			_vr.bezier8(x +   38.378 * s,y +  -53.710 * s,x +   37.499 * s,y +  -57.258 * s,x +   36.083 * s,y +  -59.944 * s,x +   34.130 * s,y +  -61.767 * s, threshold);
			_vr.bezier8(x +   34.130 * s,y +  -61.767 * s,x +   32.177 * s,y +  -63.590 * s,x +   29.703 * s,y +  -64.501 * s,x +   26.709 * s,y +  -64.501 * s, threshold);
			_vr.bezier8(x +   26.709 * s,y +  -64.501 * s,x +   17.497 * s,y +  -64.501 * s,x +   12.890 * s,y +  -55.354 * s,x +   12.890 * s,y +  -37.060 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   52.441 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 49:
			
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   24.316 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   24.316 * s);
			_setf(o + ( 3 << 2), y +  -54.833 * s);
			_setf(o + ( 4 << 2), x +    9.765 * s);
			_setf(o + ( 5 << 2), y +  -45.751 * s);
			_setf(o + ( 6 << 2), x +    9.765 * s);
			_setf(o + ( 7 << 2), y +  -54.882 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_vr.bezier8(x +    9.765 * s,y +  -54.882 * s,x +   13.443 * s,y +  -56.737 * s,x +   17.358 * s,y +  -59.293 * s,x +   21.508 * s,y +  -62.548 * s, threshold);
			_vr.bezier8(x +   21.508 * s,y +  -62.548 * s,x +   25.658 * s,y +  -65.803 * s,x +   28.873 * s,y +  -68.895 * s,x +   31.151 * s,y +  -71.825 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   34.081 * s);
			_setf(o + ( 1 << 2), y +  -71.825 * s);
			_setf(o + ( 2 << 2), x +   34.081 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   24.316 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   52.440 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			
			case 50:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    3.369 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    3.369 * s);
			_setf(o + ( 3 << 2), y +   -1.953 * s);
			_setf(o + ( 4 << 2), x +   25.781 * s);
			_setf(o + ( 5 << 2), y +  -36.279 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   25.781 * s,y +  -36.279 * s,x +   30.475 * s,y +  -43.468 * s,x +   32.812 * s,y +  -49.576 * s,x +   32.812 * s,y +  -54.589 * s, threshold);
			_vr.bezier8(x +   32.812 * s,y +  -54.589 * s,x +   32.812 * s,y +  -61.197 * s,x +   29.085 * s,y +  -64.501 * s,x +   21.631 * s,y +  -64.501 * s, threshold);
			_vr.bezier8(x +   21.631 * s,y +  -64.501 * s,x +   18.994 * s,y +  -64.501 * s,x +   16.520 * s,y +  -63.809 * s,x +   14.209 * s,y +  -62.426 * s, threshold);
			_vr.bezier8(x +   14.209 * s,y +  -62.426 * s,x +   11.898 * s,y +  -61.042 * s,x +   10.221 * s,y +  -59.293 * s,x +    9.180 * s,y +  -57.177 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    2.881 * s);
			_setf(o + ( 1 << 2), y +  -62.353 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    2.881 * s,y +  -62.353 * s,x +    3.988 * s,y +  -65.543 * s,x +    6.161 * s,y +  -68.082 * s,x +    9.399 * s,y +  -69.970 * s, threshold);
			_vr.bezier8(x +    9.399 * s,y +  -69.970 * s,x +   12.638 * s,y +  -71.858 * s,x +   16.552 * s,y +  -72.802 * s,x +   21.142 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   21.142 * s,y +  -72.802 * s,x +   28.011 * s,y +  -72.802 * s,x +   33.382 * s,y +  -71.215 * s,x +   37.255 * s,y +  -68.041 * s, threshold);
			_vr.bezier8(x +   37.255 * s,y +  -68.041 * s,x +   41.129 * s,y +  -64.867 * s,x +   43.066 * s,y +  -60.383 * s,x +   43.066 * s,y +  -54.589 * s, threshold);
			_vr.bezier8(x +   43.066 * s,y +  -54.589 * s,x +   43.066 * s,y +  -49.218 * s,x +   40.499 * s,y +  -42.444 * s,x +   35.351 * s,y +  -34.277 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   19.287 * s);
			_setf(o + ( 1 << 2), y +   -8.789 * s);
			_setf(o + ( 2 << 2), x +   47.314 * s);
			_setf(o + ( 3 << 2), y +   -8.789 * s);
			_setf(o + ( 4 << 2), x +   47.314 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    3.369 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   52.441 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 1);
			
			case 51:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    5.322 * s);
			_setf(o + ( 1 << 2), y +   -5.078 * s);
			_setf(o + ( 2 << 2), x +   10.009 * s);
			_setf(o + ( 3 << 2), y +  -12.597 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   10.009 * s,y +  -12.597 * s,x +   13.199 * s,y +   -9.082 * s,x +   17.236 * s,y +   -7.324 * s,x +   22.119 * s,y +   -7.324 * s, threshold);
			_vr.bezier8(x +   22.119 * s,y +   -7.324 * s,x +   31.168 * s,y +   -7.324 * s,x +   35.693 * s,y +  -11.751 * s,x +   35.693 * s,y +  -20.605 * s, threshold);
			_vr.bezier8(x +   35.693 * s,y +  -20.605 * s,x +   35.693 * s,y +  -24.641 * s,x +   34.374 * s,y +  -27.921 * s,x +   31.738 * s,y +  -30.444 * s, threshold);
			_vr.bezier8(x +   31.738 * s,y +  -30.444 * s,x +   29.101 * s,y +  -32.967 * s,x +   25.602 * s,y +  -34.228 * s,x +   21.240 * s,y +  -34.228 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   20.458 * s);
			_setf(o + ( 1 << 2), y +  -34.228 * s);
			_setf(o + ( 2 << 2), x +   20.458 * s);
			_setf(o + ( 3 << 2), y +  -42.138 * s);
			_setf(o + ( 4 << 2), x +   20.898 * s);
			_setf(o + ( 5 << 2), y +  -42.138 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   20.898 * s,y +  -42.138 * s,x +   29.166 * s,y +  -42.138 * s,x +   33.300 * s,y +  -45.784 * s,x +   33.300 * s,y +  -53.075 * s, threshold);
			_vr.bezier8(x +   33.300 * s,y +  -53.075 * s,x +   33.300 * s,y +  -60.693 * s,x +   29.410 * s,y +  -64.501 * s,x +   21.630 * s,y +  -64.501 * s, threshold);
			_vr.bezier8(x +   21.630 * s,y +  -64.501 * s,x +   17.399 * s,y +  -64.501 * s,x +   14.029 * s,y +  -63.085 * s,x +   11.523 * s,y +  -60.253 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    7.177 * s);
			_setf(o + ( 1 << 2), y +  -66.894 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    7.177 * s,y +  -66.894 * s,x +   10.205 * s,y +  -70.832 * s,x +   15.267 * s,y +  -72.802 * s,x +   22.363 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   22.363 * s,y +  -72.802 * s,x +   28.613 * s,y +  -72.802 * s,x +   33.707 * s,y +  -71.133 * s,x +   37.646 * s,y +  -67.797 * s, threshold);
			_vr.bezier8(x +   37.646 * s,y +  -67.797 * s,x +   41.584 * s,y +  -64.460 * s,x +   43.554 * s,y +  -60.188 * s,x +   43.554 * s,y +  -54.980 * s, threshold);
			_vr.bezier8(x +   43.554 * s,y +  -54.980 * s,x +   43.554 * s,y +  -51.008 * s,x +   42.455 * s,y +  -47.493 * s,x +   40.258 * s,y +  -44.433 * s, threshold);
			_vr.bezier8(x +   40.258 * s,y +  -44.433 * s,x +   38.061 * s,y +  -41.373 * s,x +   35.481 * s,y +  -39.322 * s,x +   32.519 * s,y +  -38.281 * s, threshold);
			_vr.bezier8(x +   32.519 * s,y +  -38.281 * s,x +   36.620 * s,y +  -36.946 * s,x +   39.884 * s,y +  -34.676 * s,x +   42.309 * s,y +  -31.469 * s, threshold);
			_vr.bezier8(x +   42.309 * s,y +  -31.469 * s,x +   44.734 * s,y +  -28.263 * s,x +   45.946 * s,y +  -24.381 * s,x +   45.946 * s,y +  -19.824 * s, threshold);
			_vr.bezier8(x +   45.946 * s,y +  -19.824 * s,x +   45.946 * s,y +  -13.183 * s,x +   43.847 * s,y +   -8.057 * s,x +   39.648 * s,y +   -4.443 * s, threshold);
			_vr.bezier8(x +   39.648 * s,y +   -4.443 * s,x +   35.448 * s,y +   -0.830 * s,x +   29.557 * s,y +    0.977 * s,x +   21.972 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   21.972 * s,y +    0.977 * s,x +   18.782 * s,y +    0.977 * s,x +   15.657 * s,y +    0.382 * s,x +   12.597 * s,y +   -0.806 * s, threshold);
			_vr.bezier8(x +   12.597 * s,y +   -0.806 * s,x +    9.537 * s,y +   -1.994 * s,x +    7.112 * s,y +   -3.418 * s,x +    5.322 * s,y +   -5.078 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   52.440 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 52:
			
			o = _posf(34);
			_setf(o + ( 0 << 2), x +   43.066 * s);
			_setf(o + ( 1 << 2), y +  -19.482 * s);
			_setf(o + ( 2 << 2), x +   43.066 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   33.789 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   33.789 * s);
			_setf(o + ( 7 << 2), y +  -19.482 * s);
			_setf(o + ( 8 << 2), x +    1.221 * s);
			_setf(o + ( 9 << 2), y +  -19.482 * s);
			_setf(o + (10 << 2), x +    1.221 * s);
			_setf(o + (11 << 2), y +  -25.048 * s);
			_setf(o + (12 << 2), x +   39.648 * s);
			_setf(o + (13 << 2), y +  -71.825 * s);
			_setf(o + (14 << 2), x +   43.066 * s);
			_setf(o + (15 << 2), y +  -71.825 * s);
			_setf(o + (16 << 2), x +   43.066 * s);
			_setf(o + (17 << 2), y +  -27.002 * s);
			_setf(o + (18 << 2), x +   50.293 * s);
			_setf(o + (19 << 2), y +  -27.002 * s);
			_setf(o + (20 << 2), x +   50.293 * s);
			_setf(o + (21 << 2), y +  -19.482 * s);
			_setf(o + (22 << 2), x +   43.066 * s);
			_setf(o + (23 << 2), y +  -19.482 * s);
			_setf(o + (24 << 2), x +   33.789 * s);
			_setf(o + (25 << 2), y +  -52.343 * s);
			_setf(o + (26 << 2), x +   12.793 * s);
			_setf(o + (27 << 2), y +  -27.002 * s);
			_setf(o + (28 << 2), x +   33.789 * s);
			_setf(o + (29 << 2), y +  -27.002 * s);
			_setf(o + (30 << 2), x +   33.789 * s);
			_setf(o + (31 << 2), y +  -52.343 * s);
			_setf(o + (32 << 2), x +   52.441 * s);
			_setf(o + (33 << 2), y +       0. * s);
			o = _posb(17);
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
			_setb(o + 12, 1);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 2);
			_setb(o + 16, 1);
			
			case 53:
			
			o = _posf(14);
			_setf(o + ( 0 << 2), x +   11.328 * s);
			_setf(o + ( 1 << 2), y +  -34.912 * s);
			_setf(o + ( 2 << 2), x +    8.008 * s);
			_setf(o + ( 3 << 2), y +  -37.206 * s);
			_setf(o + ( 4 << 2), x +    8.008 * s);
			_setf(o + ( 5 << 2), y +  -71.825 * s);
			_setf(o + ( 6 << 2), x +   43.603 * s);
			_setf(o + ( 7 << 2), y +  -71.825 * s);
			_setf(o + ( 8 << 2), x +   43.603 * s);
			_setf(o + ( 9 << 2), y +  -63.524 * s);
			_setf(o + (10 << 2), x +   17.285 * s);
			_setf(o + (11 << 2), y +  -63.524 * s);
			_setf(o + (12 << 2), x +   17.285 * s);
			_setf(o + (13 << 2), y +  -46.142 * s);
			o = _posb(7);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_vr.bezier8(x +   17.285 * s,y +  -46.142 * s,x +   19.694 * s,y +  -47.932 * s,x +   22.754 * s,y +  -48.827 * s,x +   26.464 * s,y +  -48.827 * s, threshold);
			_vr.bezier8(x +   26.464 * s,y +  -48.827 * s,x +   33.105 * s,y +  -48.827 * s,x +   38.175 * s,y +  -46.842 * s,x +   41.674 * s,y +  -42.870 * s, threshold);
			_vr.bezier8(x +   41.674 * s,y +  -42.870 * s,x +   45.173 * s,y +  -38.899 * s,x +   46.923 * s,y +  -33.252 * s,x +   46.923 * s,y +  -25.927 * s, threshold);
			_vr.bezier8(x +   46.923 * s,y +  -25.927 * s,x +   46.923 * s,y +   -7.992 * s,x +   38.931 * s,y +    0.977 * s,x +   22.949 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   22.949 * s,y +    0.977 * s,x +   16.276 * s,y +    0.977 * s,x +   10.742 * s,y +   -0.879 * s,x +    6.348 * s,y +   -4.590 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   10.107 * s);
			_setf(o + ( 1 << 2), y +  -12.744 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   10.107 * s,y +  -12.744 * s,x +   14.534 * s,y +   -9.131 * s,x +   18.798 * s,y +   -7.324 * s,x +   22.900 * s,y +   -7.324 * s, threshold);
			_vr.bezier8(x +   22.900 * s,y +   -7.324 * s,x +   32.080 * s,y +   -7.324 * s,x +   36.669 * s,y +  -13.053 * s,x +   36.669 * s,y +  -24.511 * s, threshold);
			_vr.bezier8(x +   36.669 * s,y +  -24.511 * s,x +   36.669 * s,y +  -35.188 * s,x +   32.145 * s,y +  -40.527 * s,x +   23.095 * s,y +  -40.527 * s, threshold);
			_vr.bezier8(x +   23.095 * s,y +  -40.527 * s,x +   18.733 * s,y +  -40.527 * s,x +   14.811 * s,y +  -38.655 * s,x +   11.328 * s,y +  -34.912 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   52.441 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 54:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   32.812 * s);
			_setf(o + ( 1 << 2), y +  -72.802 * s);
			_setf(o + ( 2 << 2), x +   37.548 * s);
			_setf(o + ( 3 << 2), y +  -67.577 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   37.548 * s,y +  -67.577 * s,x +   34.683 * s,y +  -66.438 * s,x +   30.541 * s,y +  -62.589 * s,x +   25.121 * s,y +  -56.029 * s, threshold);
			_vr.bezier8(x +   25.121 * s,y +  -56.029 * s,x +   19.701 * s,y +  -49.470 * s,x +   16.699 * s,y +  -44.417 * s,x +   16.113 * s,y +  -40.869 * s, threshold);
			_vr.bezier8(x +   16.113 * s,y +  -40.869 * s,x +   18.814 * s,y +  -43.473 * s,x +   22.574 * s,y +  -44.775 * s,x +   27.392 * s,y +  -44.775 * s, threshold);
			_vr.bezier8(x +   27.392 * s,y +  -44.775 * s,x +   33.706 * s,y +  -44.775 * s,x +   38.768 * s,y +  -42.757 * s,x +   42.577 * s,y +  -38.720 * s, threshold);
			_vr.bezier8(x +   42.577 * s,y +  -38.720 * s,x +   46.386 * s,y +  -34.684 * s,x +   48.290 * s,y +  -29.134 * s,x +   48.290 * s,y +  -22.070 * s, threshold);
			_vr.bezier8(x +   48.290 * s,y +  -22.070 * s,x +   48.290 * s,y +  -15.072 * s,x +   46.329 * s,y +   -9.440 * s,x +   42.406 * s,y +   -5.176 * s, threshold);
			_vr.bezier8(x +   42.406 * s,y +   -5.176 * s,x +   38.484 * s,y +   -0.911 * s,x +   33.560 * s,y +    1.221 * s,x +   27.636 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   27.636 * s,y +    1.221 * s,x +   11.946 * s,y +    1.221 * s,x +    4.101 * s,y +   -9.179 * s,x +    4.101 * s,y +  -29.980 * s, threshold);
			_vr.bezier8(x +    4.101 * s,y +  -29.980 * s,x +    4.101 * s,y +  -38.639 * s,x +    7.169 * s,y +  -47.501 * s,x +   13.305 * s,y +  -56.567 * s, threshold);
			_vr.bezier8(x +   13.305 * s,y +  -56.567 * s,x +   19.441 * s,y +  -65.632 * s,x +   25.943 * s,y +  -71.044 * s,x +   32.812 * s,y +  -72.802 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   14.355 * s);
			_setf(o + ( 1 << 2), y +  -22.363 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   14.355 * s,y +  -22.363 * s,x +   14.355 * s,y +  -12.174 * s,x +   18.538 * s,y +   -7.080 * s,x +   26.903 * s,y +   -7.080 * s, threshold);
			_vr.bezier8(x +   26.903 * s,y +   -7.080 * s,x +   30.419 * s,y +   -7.080 * s,x +   33.194 * s,y +   -8.406 * s,x +   35.228 * s,y +  -11.059 * s, threshold);
			_vr.bezier8(x +   35.228 * s,y +  -11.059 * s,x +   37.263 * s,y +  -13.712 * s,x +   38.280 * s,y +  -17.220 * s,x +   38.280 * s,y +  -21.582 * s, threshold);
			_vr.bezier8(x +   38.280 * s,y +  -21.582 * s,x +   38.280 * s,y +  -26.106 * s,x +   37.206 * s,y +  -29.720 * s,x +   35.058 * s,y +  -32.421 * s, threshold);
			_vr.bezier8(x +   35.058 * s,y +  -32.421 * s,x +   32.909 * s,y +  -35.123 * s,x +   30.142 * s,y +  -36.474 * s,x +   26.757 * s,y +  -36.474 * s, threshold);
			_vr.bezier8(x +   26.757 * s,y +  -36.474 * s,x +   18.489 * s,y +  -36.474 * s,x +   14.355 * s,y +  -31.770 * s,x +   14.355 * s,y +  -22.363 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   52.440 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 55:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   20.898 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   10.058 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   10.058 * s,y +       0. * s,x +   12.467 * s,y +   -7.650 * s,x +   16.520 * s,y +  -17.765 * s,x +   22.216 * s,y +  -30.346 * s, threshold);
			_vr.bezier8(x +   22.216 * s,y +  -30.346 * s,x +   27.913 * s,y +  -42.927 * s,x +   33.121 * s,y +  -53.661 * s,x +   37.841 * s,y +  -62.548 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +    4.101 * s);
			_setf(o + ( 1 << 2), y +  -62.548 * s);
			_setf(o + ( 2 << 2), x +    4.101 * s);
			_setf(o + ( 3 << 2), y +  -71.825 * s);
			_setf(o + ( 4 << 2), x +   50.487 * s);
			_setf(o + ( 5 << 2), y +  -71.825 * s);
			_setf(o + ( 6 << 2), x +   50.487 * s);
			_setf(o + ( 7 << 2), y +  -68.017 * s);
			_setf(o + ( 8 << 2), x +   44.189 * s);
			_setf(o + ( 9 << 2), y +  -55.614 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   44.189 * s,y +  -55.614 * s,x +   42.060 * s,y +  -51.422 * s,x +   39.859 * s,y +  -46.809 * s,x +   37.548 * s,y +  -41.796 * s, threshold);
			_vr.bezier8(x +   37.548 * s,y +  -41.796 * s,x +   35.237 * s,y +  -36.783 * s,x +   32.975 * s,y +  -31.673 * s,x +   30.761 * s,y +  -26.464 * s, threshold);
			_vr.bezier8(x +   30.761 * s,y +  -26.464 * s,x +   28.548 * s,y +  -21.256 * s,x +   26.611 * s,y +  -16.422 * s,x +   24.951 * s,y +  -11.963 * s, threshold);
			_vr.bezier8(x +   24.951 * s,y +  -11.963 * s,x +   23.291 * s,y +   -7.503 * s,x +   21.940 * s,y +   -3.516 * s,x +   20.898 * s,y +       0. * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   52.441 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 56:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   17.236 * s);
			_setf(o + ( 1 << 2), y +  -39.794 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   17.236 * s,y +  -39.794 * s,x +   14.209 * s,y +  -41.422 * s,x +   11.735 * s,y +  -43.684 * s,x +    9.814 * s,y +  -46.581 * s, threshold);
			_vr.bezier8(x +    9.814 * s,y +  -46.581 * s,x +    7.894 * s,y +  -49.478 * s,x +    6.934 * s,y +  -52.473 * s,x +    6.934 * s,y +  -55.566 * s, threshold);
			_vr.bezier8(x +    6.934 * s,y +  -55.566 * s,x +    6.934 * s,y +  -60.871 * s,x +    8.732 * s,y +  -65.071 * s,x +   12.329 * s,y +  -68.163 * s, threshold);
			_vr.bezier8(x +   12.329 * s,y +  -68.163 * s,x +   15.926 * s,y +  -71.255 * s,x +   20.573 * s,y +  -72.802 * s,x +   26.269 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   26.269 * s,y +  -72.802 * s,x +   32.422 * s,y +  -72.802 * s,x +   37.190 * s,y +  -71.255 * s,x +   40.575 * s,y +  -68.163 * s, threshold);
			_vr.bezier8(x +   40.575 * s,y +  -68.163 * s,x +   43.961 * s,y +  -65.071 * s,x +   45.653 * s,y +  -60.855 * s,x +   45.653 * s,y +  -55.517 * s, threshold);
			_vr.bezier8(x +   45.653 * s,y +  -55.517 * s,x +   45.653 * s,y +  -52.392 * s,x +   44.628 * s,y +  -49.210 * s,x +   42.577 * s,y +  -45.971 * s, threshold);
			_vr.bezier8(x +   42.577 * s,y +  -45.971 * s,x +   40.526 * s,y +  -42.732 * s,x +   38.150 * s,y +  -40.348 * s,x +   35.449 * s,y +  -38.818 * s, threshold);
			_vr.bezier8(x +   35.449 * s,y +  -38.818 * s,x +   44.042 * s,y +  -34.000 * s,x +   48.339 * s,y +  -27.669 * s,x +   48.339 * s,y +  -19.824 * s, threshold);
			_vr.bezier8(x +   48.339 * s,y +  -19.824 * s,x +   48.339 * s,y +  -13.216 * s,x +   46.353 * s,y +   -8.097 * s,x +   42.382 * s,y +   -4.468 * s, threshold);
			_vr.bezier8(x +   42.382 * s,y +   -4.468 * s,x +   38.411 * s,y +   -0.838 * s,x +   32.959 * s,y +    0.977 * s,x +   26.025 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   26.025 * s,y +    0.977 * s,x +   11.572 * s,y +    0.977 * s,x +    4.346 * s,y +   -5.957 * s,x +    4.346 * s,y +  -19.824 * s, threshold);
			_vr.bezier8(x +    4.346 * s,y +  -19.824 * s,x +    4.346 * s,y +  -23.828 * s,x +    5.583 * s,y +  -27.766 * s,x +    8.057 * s,y +  -31.640 * s, threshold);
			_vr.bezier8(x +    8.057 * s,y +  -31.640 * s,x +   10.530 * s,y +  -35.514 * s,x +   13.590 * s,y +  -38.232 * s,x +   17.236 * s,y +  -39.794 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   29.199 * s);
			_setf(o + ( 1 << 2), y +  -42.822 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   29.199 * s,y +  -42.822 * s,x +   33.626 * s,y +  -46.988 * s,x +   35.839 * s,y +  -51.302 * s,x +   35.839 * s,y +  -55.761 * s, threshold);
			_vr.bezier8(x +   35.839 * s,y +  -55.761 * s,x +   35.839 * s,y +  -58.430 * s,x +   34.952 * s,y +  -60.554 * s,x +   33.178 * s,y +  -62.133 * s, threshold);
			_vr.bezier8(x +   33.178 * s,y +  -62.133 * s,x +   31.404 * s,y +  -63.712 * s,x +   29.101 * s,y +  -64.501 * s,x +   26.269 * s,y +  -64.501 * s, threshold);
			_vr.bezier8(x +   26.269 * s,y +  -64.501 * s,x +   19.889 * s,y +  -64.501 * s,x +   16.699 * s,y +  -61.555 * s,x +   16.699 * s,y +  -55.663 * s, threshold);
			_vr.bezier8(x +   16.699 * s,y +  -55.663 * s,x +   16.699 * s,y +  -51.301 * s,x +   20.866 * s,y +  -47.021 * s,x +   29.199 * s,y +  -42.822 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   24.853 * s);
			_setf(o + ( 1 << 2), y +  -35.546 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   24.853 * s,y +  -35.546 * s,x +   17.692 * s,y +  -31.673 * s,x +   14.111 * s,y +  -26.432 * s,x +   14.111 * s,y +  -19.824 * s, threshold);
			_vr.bezier8(x +   14.111 * s,y +  -19.824 * s,x +   14.111 * s,y +  -16.276 * s,x +   15.218 * s,y +  -13.305 * s,x +   17.431 * s,y +  -10.913 * s, threshold);
			_vr.bezier8(x +   17.431 * s,y +  -10.913 * s,x +   19.645 * s,y +   -8.520 * s,x +   22.509 * s,y +   -7.324 * s,x +   26.025 * s,y +   -7.324 * s, threshold);
			_vr.bezier8(x +   26.025 * s,y +   -7.324 * s,x +   29.671 * s,y +   -7.324 * s,x +   32.674 * s,y +   -8.496 * s,x +   35.034 * s,y +  -10.840 * s, threshold);
			_vr.bezier8(x +   35.034 * s,y +  -10.840 * s,x +   37.394 * s,y +  -13.183 * s,x +   38.573 * s,y +  -16.178 * s,x +   38.573 * s,y +  -19.824 * s, threshold);
			_vr.bezier8(x +   38.573 * s,y +  -19.824 * s,x +   38.573 * s,y +  -22.461 * s,x +   37.760 * s,y +  -24.943 * s,x +   36.132 * s,y +  -27.270 * s, threshold);
			_vr.bezier8(x +   36.132 * s,y +  -27.270 * s,x +   34.505 * s,y +  -29.598 * s,x +   30.745 * s,y +  -32.356 * s,x +   24.853 * s,y +  -35.546 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   52.440 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 57:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   19.092 * s);
			_setf(o + ( 1 << 2), y +    1.221 * s);
			_setf(o + ( 2 << 2), x +   14.355 * s);
			_setf(o + ( 3 << 2), y +   -4.004 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   14.355 * s,y +   -4.004 * s,x +   17.187 * s,y +   -5.143 * s,x +   21.330 * s,y +   -8.984 * s,x +   26.782 * s,y +  -15.527 * s, threshold);
			_vr.bezier8(x +   26.782 * s,y +  -15.527 * s,x +   32.234 * s,y +  -22.070 * s,x +   35.237 * s,y +  -27.115 * s,x +   35.791 * s,y +  -30.664 * s, threshold);
			_vr.bezier8(x +   35.791 * s,y +  -30.664 * s,x +   33.121 * s,y +  -28.092 * s,x +   29.362 * s,y +  -26.806 * s,x +   24.512 * s,y +  -26.806 * s, threshold);
			_vr.bezier8(x +   24.512 * s,y +  -26.806 * s,x +   18.196 * s,y +  -26.806 * s,x +   13.135 * s,y +  -28.824 * s,x +    9.326 * s,y +  -32.861 * s, threshold);
			_vr.bezier8(x +    9.326 * s,y +  -32.861 * s,x +    5.518 * s,y +  -36.897 * s,x +    3.613 * s,y +  -42.447 * s,x +    3.613 * s,y +  -49.511 * s, threshold);
			_vr.bezier8(x +    3.613 * s,y +  -49.511 * s,x +    3.613 * s,y +  -56.509 * s,x +    5.575 * s,y +  -62.141 * s,x +    9.497 * s,y +  -66.405 * s, threshold);
			_vr.bezier8(x +    9.497 * s,y +  -66.405 * s,x +   13.420 * s,y +  -70.669 * s,x +   18.343 * s,y +  -72.802 * s,x +   24.267 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   24.267 * s,y +  -72.802 * s,x +   39.957 * s,y +  -72.802 * s,x +   47.802 * s,y +  -62.402 * s,x +   47.802 * s,y +  -41.601 * s, threshold);
			_vr.bezier8(x +   47.802 * s,y +  -41.601 * s,x +   47.802 * s,y +  -32.942 * s,x +   44.734 * s,y +  -24.080 * s,x +   38.598 * s,y +  -15.014 * s, threshold);
			_vr.bezier8(x +   38.598 * s,y +  -15.014 * s,x +   32.462 * s,y +   -5.949 * s,x +   25.960 * s,y +   -0.537 * s,x +   19.092 * s,y +    1.221 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   37.548 * s);
			_setf(o + ( 1 << 2), y +  -49.218 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   37.548 * s,y +  -49.218 * s,x +   37.548 * s,y +  -59.407 * s,x +   33.365 * s,y +  -64.501 * s,x +   25.000 * s,y +  -64.501 * s, threshold);
			_vr.bezier8(x +   25.000 * s,y +  -64.501 * s,x +   21.484 * s,y +  -64.501 * s,x +   18.709 * s,y +  -63.174 * s,x +   16.675 * s,y +  -60.522 * s, threshold);
			_vr.bezier8(x +   16.675 * s,y +  -60.522 * s,x +   14.640 * s,y +  -57.869 * s,x +   13.623 * s,y +  -54.361 * s,x +   13.623 * s,y +  -49.999 * s, threshold);
			_vr.bezier8(x +   13.623 * s,y +  -49.999 * s,x +   13.623 * s,y +  -45.475 * s,x +   14.697 * s,y +  -41.861 * s,x +   16.846 * s,y +  -39.160 * s, threshold);
			_vr.bezier8(x +   16.846 * s,y +  -39.160 * s,x +   18.994 * s,y +  -36.458 * s,x +   21.761 * s,y +  -35.107 * s,x +   25.146 * s,y +  -35.107 * s, threshold);
			_vr.bezier8(x +   25.146 * s,y +  -35.107 * s,x +   33.415 * s,y +  -35.107 * s,x +   37.548 * s,y +  -39.811 * s,x +   37.548 * s,y +  -49.218 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   52.441 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 58:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   17.285 * s);
			_setf(o + ( 1 << 2), y +  -53.271 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   17.285 * s,y +  -53.271 * s,x +   19.303 * s,y +  -53.271 * s,x +   21.028 * s,y +  -52.555 * s,x +   22.460 * s,y +  -51.122 * s, threshold);
			_vr.bezier8(x +   22.460 * s,y +  -51.122 * s,x +   23.893 * s,y +  -49.690 * s,x +   24.609 * s,y +  -47.965 * s,x +   24.609 * s,y +  -45.947 * s, threshold);
			_vr.bezier8(x +   24.609 * s,y +  -45.947 * s,x +   24.609 * s,y +  -43.928 * s,x +   23.893 * s,y +  -42.195 * s,x +   22.460 * s,y +  -40.746 * s, threshold);
			_vr.bezier8(x +   22.460 * s,y +  -40.746 * s,x +   21.028 * s,y +  -39.298 * s,x +   19.303 * s,y +  -38.574 * s,x +   17.285 * s,y +  -38.574 * s, threshold);
			_vr.bezier8(x +   17.285 * s,y +  -38.574 * s,x +   15.266 * s,y +  -38.574 * s,x +   13.541 * s,y +  -39.298 * s,x +   12.109 * s,y +  -40.746 * s, threshold);
			_vr.bezier8(x +   12.109 * s,y +  -40.746 * s,x +   10.677 * s,y +  -42.195 * s,x +    9.961 * s,y +  -43.928 * s,x +    9.961 * s,y +  -45.947 * s, threshold);
			_vr.bezier8(x +    9.961 * s,y +  -45.947 * s,x +    9.961 * s,y +  -47.965 * s,x +   10.677 * s,y +  -49.690 * s,x +   12.109 * s,y +  -51.122 * s, threshold);
			_vr.bezier8(x +   12.109 * s,y +  -51.122 * s,x +   13.541 * s,y +  -52.555 * s,x +   15.266 * s,y +  -53.271 * s,x +   17.285 * s,y +  -53.271 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   17.285 * s);
			_setf(o + ( 1 << 2), y +  -13.720 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   17.285 * s,y +  -13.720 * s,x +   19.303 * s,y +  -13.720 * s,x +   21.028 * s,y +  -13.004 * s,x +   22.460 * s,y +  -11.572 * s, threshold);
			_vr.bezier8(x +   22.460 * s,y +  -11.572 * s,x +   23.893 * s,y +  -10.140 * s,x +   24.609 * s,y +   -8.415 * s,x +   24.609 * s,y +   -6.396 * s, threshold);
			_vr.bezier8(x +   24.609 * s,y +   -6.396 * s,x +   24.609 * s,y +   -4.378 * s,x +   23.893 * s,y +   -2.645 * s,x +   22.460 * s,y +   -1.196 * s, threshold);
			_vr.bezier8(x +   22.460 * s,y +   -1.196 * s,x +   21.028 * s,y +    0.252 * s,x +   19.303 * s,y +    0.977 * s,x +   17.285 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   17.285 * s,y +    0.977 * s,x +   15.266 * s,y +    0.977 * s,x +   13.541 * s,y +    0.252 * s,x +   12.109 * s,y +   -1.196 * s, threshold);
			_vr.bezier8(x +   12.109 * s,y +   -1.196 * s,x +   10.677 * s,y +   -2.645 * s,x +    9.961 * s,y +   -4.378 * s,x +    9.961 * s,y +   -6.396 * s, threshold);
			_vr.bezier8(x +    9.961 * s,y +   -6.396 * s,x +    9.961 * s,y +   -8.415 * s,x +   10.677 * s,y +  -10.140 * s,x +   12.109 * s,y +  -11.572 * s, threshold);
			_vr.bezier8(x +   12.109 * s,y +  -11.572 * s,x +   13.541 * s,y +  -13.004 * s,x +   15.266 * s,y +  -13.720 * s,x +   17.285 * s,y +  -13.720 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.718 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 59:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   17.285 * s);
			_setf(o + ( 1 << 2), y +  -53.271 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   17.285 * s,y +  -53.271 * s,x +   19.303 * s,y +  -53.271 * s,x +   21.028 * s,y +  -52.555 * s,x +   22.461 * s,y +  -51.122 * s, threshold);
			_vr.bezier8(x +   22.461 * s,y +  -51.122 * s,x +   23.893 * s,y +  -49.690 * s,x +   24.609 * s,y +  -47.965 * s,x +   24.609 * s,y +  -45.947 * s, threshold);
			_vr.bezier8(x +   24.609 * s,y +  -45.947 * s,x +   24.609 * s,y +  -43.928 * s,x +   23.893 * s,y +  -42.195 * s,x +   22.461 * s,y +  -40.746 * s, threshold);
			_vr.bezier8(x +   22.461 * s,y +  -40.746 * s,x +   21.028 * s,y +  -39.298 * s,x +   19.303 * s,y +  -38.574 * s,x +   17.285 * s,y +  -38.574 * s, threshold);
			_vr.bezier8(x +   17.285 * s,y +  -38.574 * s,x +   15.267 * s,y +  -38.574 * s,x +   13.541 * s,y +  -39.298 * s,x +   12.109 * s,y +  -40.746 * s, threshold);
			_vr.bezier8(x +   12.109 * s,y +  -40.746 * s,x +   10.677 * s,y +  -42.195 * s,x +    9.961 * s,y +  -43.928 * s,x +    9.961 * s,y +  -45.947 * s, threshold);
			_vr.bezier8(x +    9.961 * s,y +  -45.947 * s,x +    9.961 * s,y +  -47.965 * s,x +   10.677 * s,y +  -49.690 * s,x +   12.109 * s,y +  -51.122 * s, threshold);
			_vr.bezier8(x +   12.109 * s,y +  -51.122 * s,x +   13.541 * s,y +  -52.555 * s,x +   15.267 * s,y +  -53.271 * s,x +   17.285 * s,y +  -53.271 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   10.937 * s);
			_setf(o + ( 1 << 2), y +   17.724 * s);
			_setf(o + ( 2 << 2), x +    8.447 * s);
			_setf(o + ( 3 << 2), y +   14.209 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    8.447 * s,y +   14.209 * s,x +   14.046 * s,y +    9.619 * s,x +   16.845 * s,y +    5.713 * s,x +   16.845 * s,y +    2.490 * s, threshold);
			_vr.bezier8(x +   16.845 * s,y +    2.490 * s,x +   16.845 * s,y +    1.058 * s,x +   16.357 * s,y +   -0.374 * s,x +   15.381 * s,y +   -1.807 * s, threshold);
			_vr.bezier8(x +   15.381 * s,y +   -1.807 * s,x +   12.581 * s,y +   -3.141 * s,x +   11.181 * s,y +   -5.062 * s,x +   11.181 * s,y +   -7.568 * s, threshold);
			_vr.bezier8(x +   11.181 * s,y +   -7.568 * s,x +   11.181 * s,y +   -9.293 * s,x +   11.849 * s,y +  -10.718 * s,x +   13.183 * s,y +  -11.841 * s, threshold);
			_vr.bezier8(x +   13.183 * s,y +  -11.841 * s,x +   14.518 * s,y +  -12.964 * s,x +   16.194 * s,y +  -13.525 * s,x +   18.213 * s,y +  -13.525 * s, threshold);
			_vr.bezier8(x +   18.213 * s,y +  -13.525 * s,x +   20.003 * s,y +  -13.525 * s,x +   21.606 * s,y +  -12.744 * s,x +   23.022 * s,y +  -11.181 * s, threshold);
			_vr.bezier8(x +   23.022 * s,y +  -11.181 * s,x +   24.438 * s,y +   -9.619 * s,x +   25.146 * s,y +   -7.796 * s,x +   25.146 * s,y +   -5.713 * s, threshold);
			_vr.bezier8(x +   25.146 * s,y +   -5.713 * s,x +   25.146 * s,y +   -1.383 * s,x +   24.243 * s,y +    2.515 * s,x +   22.436 * s,y +    5.981 * s, threshold);
			_vr.bezier8(x +   22.436 * s,y +    5.981 * s,x +   20.630 * s,y +    9.448 * s,x +   16.797 * s,y +   13.362 * s,x +   10.937 * s,y +   17.724 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.718 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 60:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +   43.408 * s);
			_setf(o + ( 1 << 2), y +  -10.644 * s);
			_setf(o + ( 2 << 2), x +    7.324 * s);
			_setf(o + ( 3 << 2), y +  -28.125 * s);
			_setf(o + ( 4 << 2), x +    7.324 * s);
			_setf(o + ( 5 << 2), y +  -34.130 * s);
			_setf(o + ( 6 << 2), x +   43.408 * s);
			_setf(o + ( 7 << 2), y +  -51.415 * s);
			_setf(o + ( 8 << 2), x +   43.408 * s);
			_setf(o + ( 9 << 2), y +  -43.554 * s);
			_setf(o + (10 << 2), x +   15.527 * s);
			_setf(o + (11 << 2), y +  -31.103 * s);
			_setf(o + (12 << 2), x +   43.408 * s);
			_setf(o + (13 << 2), y +  -18.506 * s);
			_setf(o + (14 << 2), x +   43.408 * s);
			_setf(o + (15 << 2), y +  -10.644 * s);
			_setf(o + (16 << 2), x +   52.441 * s);
			_setf(o + (17 << 2), y +       0. * s);
			o = _posb(9);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 1);
			
			case 61:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +   46.874 * s);
			_setf(o + ( 1 << 2), y +  -42.773 * s);
			_setf(o + ( 2 << 2), x +   46.874 * s);
			_setf(o + ( 3 << 2), y +  -35.888 * s);
			_setf(o + ( 4 << 2), x +    5.957 * s);
			_setf(o + ( 5 << 2), y +  -35.888 * s);
			_setf(o + ( 6 << 2), x +    5.957 * s);
			_setf(o + ( 7 << 2), y +  -42.773 * s);
			_setf(o + ( 8 << 2), x +   46.874 * s);
			_setf(o + ( 9 << 2), y +  -42.773 * s);
			_setf(o + (10 << 2), x +   46.874 * s);
			_setf(o + (11 << 2), y +  -26.171 * s);
			_setf(o + (12 << 2), x +   46.874 * s);
			_setf(o + (13 << 2), y +  -19.287 * s);
			_setf(o + (14 << 2), x +    5.957 * s);
			_setf(o + (15 << 2), y +  -19.287 * s);
			_setf(o + (16 << 2), x +    5.957 * s);
			_setf(o + (17 << 2), y +  -26.171 * s);
			_setf(o + (18 << 2), x +   46.874 * s);
			_setf(o + (19 << 2), y +  -26.171 * s);
			_setf(o + (20 << 2), x +   52.440 * s);
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
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +   43.408 * s);
			_setf(o + ( 1 << 2), y +  -28.125 * s);
			_setf(o + ( 2 << 2), x +    7.324 * s);
			_setf(o + ( 3 << 2), y +  -10.644 * s);
			_setf(o + ( 4 << 2), x +    7.324 * s);
			_setf(o + ( 5 << 2), y +  -18.506 * s);
			_setf(o + ( 6 << 2), x +   35.205 * s);
			_setf(o + ( 7 << 2), y +  -31.103 * s);
			_setf(o + ( 8 << 2), x +    7.324 * s);
			_setf(o + ( 9 << 2), y +  -43.554 * s);
			_setf(o + (10 << 2), x +    7.324 * s);
			_setf(o + (11 << 2), y +  -51.415 * s);
			_setf(o + (12 << 2), x +   43.408 * s);
			_setf(o + (13 << 2), y +  -34.130 * s);
			_setf(o + (14 << 2), x +   43.408 * s);
			_setf(o + (15 << 2), y +  -28.125 * s);
			_setf(o + (16 << 2), x +   52.441 * s);
			_setf(o + (17 << 2), y +       0. * s);
			o = _posb(9);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 1);
			
			case 63:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   17.871 * s);
			_setf(o + ( 1 << 2), y +  -20.947 * s);
			_setf(o + ( 2 << 2), x +   11.426 * s);
			_setf(o + ( 3 << 2), y +  -20.947 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   11.426 * s,y +  -20.947 * s,x +   10.319 * s,y +  -24.039 * s,x +    9.765 * s,y +  -26.269 * s,x +    9.765 * s,y +  -27.636 * s, threshold);
			_vr.bezier8(x +    9.765 * s,y +  -27.636 * s,x +    9.765 * s,y +  -29.980 * s,x +   10.197 * s,y +  -32.373 * s,x +   11.059 * s,y +  -34.814 * s, threshold);
			_vr.bezier8(x +   11.059 * s,y +  -34.814 * s,x +   11.922 * s,y +  -37.255 * s,x +   13.875 * s,y +  -40.177 * s,x +   16.919 * s,y +  -43.578 * s, threshold);
			_vr.bezier8(x +   16.919 * s,y +  -43.578 * s,x +   19.962 * s,y +  -46.980 * s,x +   22.005 * s,y +  -49.592 * s,x +   23.046 * s,y +  -51.415 * s, threshold);
			_vr.bezier8(x +   23.046 * s,y +  -51.415 * s,x +   24.088 * s,y +  -53.238 * s,x +   24.609 * s,y +  -55.012 * s,x +   24.609 * s,y +  -56.737 * s, threshold);
			_vr.bezier8(x +   24.609 * s,y +  -56.737 * s,x +   24.609 * s,y +  -62.466 * s,x +   21.142 * s,y +  -65.331 * s,x +   14.209 * s,y +  -65.331 * s, threshold);
			_vr.bezier8(x +   14.209 * s,y +  -65.331 * s,x +   10.888 * s,y +  -65.331 * s,x +    7.991 * s,y +  -64.143 * s,x +    5.517 * s,y +  -61.767 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    1.953 * s);
			_setf(o + ( 1 << 2), y +  -68.749 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    1.953 * s,y +  -68.749 * s,x +    5.241 * s,y +  -71.451 * s,x +   10.140 * s,y +  -72.802 * s,x +   16.650 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   16.650 * s,y +  -72.802 * s,x +   21.533 * s,y +  -72.802 * s,x +   25.594 * s,y +  -71.418 * s,x +   28.833 * s,y +  -68.651 * s, threshold);
			_vr.bezier8(x +   28.833 * s,y +  -68.651 * s,x +   32.071 * s,y +  -65.884 * s,x +   33.691 * s,y +  -62.190 * s,x +   33.691 * s,y +  -57.567 * s, threshold);
			_vr.bezier8(x +   33.691 * s,y +  -57.567 * s,x +   33.691 * s,y +  -55.224 * s,x +   33.276 * s,y +  -52.970 * s,x +   32.446 * s,y +  -50.805 * s, threshold);
			_vr.bezier8(x +   32.446 * s,y +  -50.805 * s,x +   31.616 * s,y +  -48.640 * s,x +   30.328 * s,y +  -46.656 * s,x +   28.613 * s,y +  -44.824 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   21.484 * s);
			_setf(o + ( 1 << 2), y +  -37.206 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   21.484 * s,y +  -37.206 * s,x +   18.385 * s,y +  -33.895 * s,x +   17.187 * s,y +  -29.752 * s,x +   17.187 * s,y +  -25.390 * s, threshold);
			_vr.bezier8(x +   17.187 * s,y +  -25.390 * s,x +   17.187 * s,y +  -24.707 * s,x +   17.415 * s,y +  -23.226 * s,x +   17.871 * s,y +  -20.947 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   15.820 * s);
			_setf(o + ( 1 << 2), y +  -13.720 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   15.820 * s,y +  -13.720 * s,x +   17.838 * s,y +  -13.720 * s,x +   19.563 * s,y +  -13.004 * s,x +   20.996 * s,y +  -11.572 * s, threshold);
			_vr.bezier8(x +   20.996 * s,y +  -11.572 * s,x +   22.428 * s,y +  -10.140 * s,x +   23.144 * s,y +   -8.415 * s,x +   23.144 * s,y +   -6.396 * s, threshold);
			_vr.bezier8(x +   23.144 * s,y +   -6.396 * s,x +   23.144 * s,y +   -4.378 * s,x +   22.428 * s,y +   -2.645 * s,x +   20.996 * s,y +   -1.196 * s, threshold);
			_vr.bezier8(x +   20.996 * s,y +   -1.196 * s,x +   19.563 * s,y +    0.252 * s,x +   17.838 * s,y +    0.977 * s,x +   15.820 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   15.820 * s,y +    0.977 * s,x +   13.802 * s,y +    0.977 * s,x +   12.077 * s,y +    0.252 * s,x +   10.644 * s,y +   -1.196 * s, threshold);
			_vr.bezier8(x +   10.644 * s,y +   -1.196 * s,x +    9.212 * s,y +   -2.645 * s,x +    8.496 * s,y +   -4.378 * s,x +    8.496 * s,y +   -6.396 * s, threshold);
			_vr.bezier8(x +    8.496 * s,y +   -6.396 * s,x +    8.496 * s,y +   -8.415 * s,x +    9.212 * s,y +  -10.140 * s,x +   10.644 * s,y +  -11.572 * s, threshold);
			_vr.bezier8(x +   10.644 * s,y +  -11.572 * s,x +   12.077 * s,y +  -13.004 * s,x +   13.802 * s,y +  -13.720 * s,x +   15.820 * s,y +  -13.720 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.718 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 64:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   57.421 * s);
			_setf(o + ( 1 << 2), y +   -5.664 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   57.421 * s,y +   -5.664 * s,x +   58.918 * s,y +   -5.111 * s,x +   61.116 * s,y +   -4.167 * s,x +   64.013 * s,y +   -2.832 * s, threshold);
			_vr.bezier8(x +   64.013 * s,y +   -2.832 * s,x +   57.763 * s,y +    3.418 * s,x +   49.527 * s,y +    6.543 * s,x +   39.306 * s,y +    6.543 * s, threshold);
			_vr.bezier8(x +   39.306 * s,y +    6.543 * s,x +   28.890 * s,y +    6.543 * s,x +   20.548 * s,y +    3.337 * s,x +   14.282 * s,y +   -3.076 * s, threshold);
			_vr.bezier8(x +   14.282 * s,y +   -3.076 * s,x +    8.016 * s,y +   -9.489 * s,x +    4.883 * s,y +  -17.919 * s,x +    4.883 * s,y +  -28.369 * s, threshold);
			_vr.bezier8(x +    4.883 * s,y +  -28.369 * s,x +    4.883 * s,y +  -38.981 * s,x +    8.057 * s,y +  -47.688 * s,x +   14.404 * s,y +  -54.491 * s, threshold);
			_vr.bezier8(x +   14.404 * s,y +  -54.491 * s,x +   20.752 * s,y +  -61.295 * s,x +   29.052 * s,y +  -64.696 * s,x +   39.306 * s,y +  -64.696 * s, threshold);
			_vr.bezier8(x +   39.306 * s,y +  -64.696 * s,x +   49.169 * s,y +  -64.696 * s,x +   57.112 * s,y +  -61.750 * s,x +   63.134 * s,y +  -55.859 * s, threshold);
			_vr.bezier8(x +   63.134 * s,y +  -55.859 * s,x +   69.156 * s,y +  -49.967 * s,x +   72.167 * s,y +  -42.106 * s,x +   72.167 * s,y +  -32.275 * s, threshold);
			_vr.bezier8(x +   72.167 * s,y +  -32.275 * s,x +   72.167 * s,y +  -26.741 * s,x +   70.710 * s,y +  -22.046 * s,x +   67.797 * s,y +  -18.188 * s, threshold);
			_vr.bezier8(x +   67.797 * s,y +  -18.188 * s,x +   64.884 * s,y +  -14.331 * s,x +   61.034 * s,y +  -12.402 * s,x +   56.249 * s,y +  -12.402 * s, threshold);
			_vr.bezier8(x +   56.249 * s,y +  -12.402 * s,x +   51.074 * s,y +  -12.402 * s,x +   47.330 * s,y +  -13.541 * s,x +   45.019 * s,y +  -15.820 * s, threshold);
			_vr.bezier8(x +   45.019 * s,y +  -15.820 * s,x +   42.252 * s,y +  -13.281 * s,x +   38.981 * s,y +  -12.012 * s,x +   35.205 * s,y +  -12.012 * s, threshold);
			_vr.bezier8(x +   35.205 * s,y +  -12.012 * s,x +   31.722 * s,y +  -12.012 * s,x +   28.906 * s,y +  -12.964 * s,x +   26.758 * s,y +  -14.868 * s, threshold);
			_vr.bezier8(x +   26.758 * s,y +  -14.868 * s,x +   24.609 * s,y +  -16.772 * s,x +   23.535 * s,y +  -19.336 * s,x +   23.535 * s,y +  -22.558 * s, threshold);
			_vr.bezier8(x +   23.535 * s,y +  -22.558 * s,x +   23.535 * s,y +  -26.660 * s,x +   25.293 * s,y +  -29.785 * s,x +   28.808 * s,y +  -31.933 * s, threshold);
			_vr.bezier8(x +   28.808 * s,y +  -31.933 * s,x +   32.324 * s,y +  -34.081 * s,x +   37.076 * s,y +  -35.156 * s,x +   43.066 * s,y +  -35.156 * s, threshold);
			_vr.bezier8(x +   43.066 * s,y +  -35.156 * s,x +   42.578 * s,y +  -39.941 * s,x +   40.657 * s,y +  -42.333 * s,x +   37.304 * s,y +  -42.333 * s, threshold);
			_vr.bezier8(x +   37.304 * s,y +  -42.333 * s,x +   33.886 * s,y +  -42.333 * s,x +   31.185 * s,y +  -41.422 * s,x +   29.199 * s,y +  -39.599 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   26.855 * s);
			_setf(o + ( 1 << 2), y +  -44.433 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   26.855 * s,y +  -44.433 * s,x +   29.524 * s,y +  -46.419 * s,x +   32.780 * s,y +  -47.411 * s,x +   36.621 * s,y +  -47.411 * s, threshold);
			_vr.bezier8(x +   36.621 * s,y +  -47.411 * s,x +   45.670 * s,y +  -47.411 * s,x +   50.195 * s,y +  -42.219 * s,x +   50.195 * s,y +  -31.835 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   50.195 * s);
			_setf(o + ( 1 << 2), y +  -20.166 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   50.195 * s,y +  -20.166 * s,x +   52.538 * s,y +  -18.440 * s,x +   54.524 * s,y +  -17.578 * s,x +   56.152 * s,y +  -17.578 * s, threshold);
			_vr.bezier8(x +   56.152 * s,y +  -17.578 * s,x +   62.206 * s,y +  -17.578 * s,x +   65.234 * s,y +  -22.526 * s,x +   65.234 * s,y +  -32.421 * s, threshold);
			_vr.bezier8(x +   65.234 * s,y +  -32.421 * s,x +   65.234 * s,y +  -39.941 * s,x +   62.792 * s,y +  -46.207 * s,x +   57.909 * s,y +  -51.220 * s, threshold);
			_vr.bezier8(x +   57.909 * s,y +  -51.220 * s,x +   53.027 * s,y +  -56.233 * s,x +   46.826 * s,y +  -58.739 * s,x +   39.306 * s,y +  -58.739 * s, threshold);
			_vr.bezier8(x +   39.306 * s,y +  -58.739 * s,x +   31.070 * s,y +  -58.739 * s,x +   24.430 * s,y +  -55.891 * s,x +   19.385 * s,y +  -50.195 * s, threshold);
			_vr.bezier8(x +   19.385 * s,y +  -50.195 * s,x +   14.339 * s,y +  -44.498 * s,x +   11.816 * s,y +  -37.223 * s,x +   11.816 * s,y +  -28.369 * s, threshold);
			_vr.bezier8(x +   11.816 * s,y +  -28.369 * s,x +   11.816 * s,y +  -19.677 * s,x +   14.315 * s,y +  -12.679 * s,x +   19.311 * s,y +   -7.373 * s, threshold);
			_vr.bezier8(x +   19.311 * s,y +   -7.373 * s,x +   24.308 * s,y +   -2.067 * s,x +   30.973 * s,y +    0.586 * s,x +   39.306 * s,y +    0.586 * s, threshold);
			_vr.bezier8(x +   39.306 * s,y +    0.586 * s,x +   46.826 * s,y +    0.586 * s,x +   52.864 * s,y +   -1.497 * s,x +   57.421 * s,y +   -5.664 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   43.066 * s);
			_setf(o + ( 1 << 2), y +  -19.189 * s);
			_setf(o + ( 2 << 2), x +   43.066 * s);
			_setf(o + ( 3 << 2), y +  -30.615 * s);
			_setf(o + ( 4 << 2), x +   40.576 * s);
			_setf(o + ( 5 << 2), y +  -30.615 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   40.576 * s,y +  -30.615 * s,x +   34.228 * s,y +  -30.615 * s,x +   31.054 * s,y +  -28.011 * s,x +   31.054 * s,y +  -22.802 * s, threshold);
			_vr.bezier8(x +   31.054 * s,y +  -22.802 * s,x +   31.054 * s,y +  -21.045 * s,x +   31.673 * s,y +  -19.596 * s,x +   32.910 * s,y +  -18.457 * s, threshold);
			_vr.bezier8(x +   32.910 * s,y +  -18.457 * s,x +   34.147 * s,y +  -17.317 * s,x +   35.693 * s,y +  -16.748 * s,x +   37.548 * s,y +  -16.748 * s, threshold);
			_vr.bezier8(x +   37.548 * s,y +  -16.748 * s,x +   39.599 * s,y +  -16.748 * s,x +   41.438 * s,y +  -17.562 * s,x +   43.066 * s,y +  -19.189 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   77.050 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 65:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   47.948 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   43.017 * s);
			_setf(o + ( 3 << 2), y +  -15.088 * s);
			_setf(o + ( 4 << 2), x +   16.406 * s);
			_setf(o + ( 5 << 2), y +  -15.088 * s);
			_setf(o + ( 6 << 2), x +   11.133 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    0.195 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   29.248 * s);
			_setf(o + (11 << 2), y +  -72.509 * s);
			_setf(o + (12 << 2), x +   31.835 * s);
			_setf(o + (13 << 2), y +  -72.509 * s);
			_setf(o + (14 << 2), x +   58.788 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   47.948 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   30.078 * s);
			_setf(o + (19 << 2), y +  -53.759 * s);
			_setf(o + (20 << 2), x +   18.994 * s);
			_setf(o + (21 << 2), y +  -22.265 * s);
			_setf(o + (22 << 2), x +   40.234 * s);
			_setf(o + (23 << 2), y +  -22.265 * s);
			_setf(o + (24 << 2), x +   30.078 * s);
			_setf(o + (25 << 2), y +  -53.759 * s);
			_setf(o + (26 << 2), x +   58.983 * s);
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
			_setb(o +  9, 1);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 1);
			
			case 66:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   27.734 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    7.324 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    7.324 * s);
			_setf(o + ( 5 << 2), y +  -71.532 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +    7.324 * s,y +  -71.532 * s,x +   16.015 * s,y +  -71.955 * s,x +   22.282 * s,y +  -72.167 * s,x +   26.123 * s,y +  -72.167 * s, threshold);
			_vr.bezier8(x +   26.123 * s,y +  -72.167 * s,x +   33.186 * s,y +  -72.167 * s,x +   38.654 * s,y +  -70.645 * s,x +   42.528 * s,y +  -67.602 * s, threshold);
			_vr.bezier8(x +   42.528 * s,y +  -67.602 * s,x +   46.402 * s,y +  -64.558 * s,x +   48.339 * s,y +  -60.204 * s,x +   48.339 * s,y +  -54.540 * s, threshold);
			_vr.bezier8(x +   48.339 * s,y +  -54.540 * s,x +   48.339 * s,y +  -51.220 * s,x +   47.102 * s,y +  -48.193 * s,x +   44.628 * s,y +  -45.458 * s, threshold);
			_vr.bezier8(x +   44.628 * s,y +  -45.458 * s,x +   42.154 * s,y +  -42.724 * s,x +   39.419 * s,y +  -41.015 * s,x +   36.425 * s,y +  -40.331 * s, threshold);
			_vr.bezier8(x +   36.425 * s,y +  -40.331 * s,x +   42.089 * s,y +  -38.964 * s,x +   46.215 * s,y +  -36.702 * s,x +   48.802 * s,y +  -33.544 * s, threshold);
			_vr.bezier8(x +   48.802 * s,y +  -33.544 * s,x +   51.390 * s,y +  -30.387 * s,x +   52.684 * s,y +  -26.090 * s,x +   52.684 * s,y +  -20.654 * s, threshold);
			_vr.bezier8(x +   52.684 * s,y +  -20.654 * s,x +   52.684 * s,y +  -14.372 * s,x +   50.381 * s,y +   -9.359 * s,x +   45.775 * s,y +   -5.615 * s, threshold);
			_vr.bezier8(x +   45.775 * s,y +   -5.615 * s,x +   41.169 * s,y +   -1.872 * s,x +   35.155 * s,y +       0. * s,x +   27.734 * s,y +       0. * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   17.089 * s);
			_setf(o + ( 1 << 2), y +  -63.720 * s);
			_setf(o + ( 2 << 2), x +   17.089 * s);
			_setf(o + ( 3 << 2), y +  -43.163 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   17.089 * s,y +  -43.163 * s,x +   19.140 * s,y +  -42.968 * s,x +   21.679 * s,y +  -42.870 * s,x +   24.707 * s,y +  -42.870 * s, threshold);
			_vr.bezier8(x +   24.707 * s,y +  -42.870 * s,x +   33.951 * s,y +  -42.870 * s,x +   38.573 * s,y +  -46.630 * s,x +   38.573 * s,y +  -54.150 * s, threshold);
			_vr.bezier8(x +   38.573 * s,y +  -54.150 * s,x +   38.573 * s,y +  -60.757 * s,x +   34.325 * s,y +  -64.062 * s,x +   25.830 * s,y +  -64.062 * s, threshold);
			_vr.bezier8(x +   25.830 * s,y +  -64.062 * s,x +   22.574 * s,y +  -64.062 * s,x +   19.661 * s,y +  -63.948 * s,x +   17.089 * s,y +  -63.720 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   17.089 * s);
			_setf(o + ( 1 << 2), y +  -35.595 * s);
			_setf(o + ( 2 << 2), x +   17.089 * s);
			_setf(o + ( 3 << 2), y +   -8.301 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   17.089 * s,y +   -8.301 * s,x +   20.442 * s,y +   -7.975 * s,x +   23.014 * s,y +   -7.812 * s,x +   24.804 * s,y +   -7.812 * s, threshold);
			_vr.bezier8(x +   24.804 * s,y +   -7.812 * s,x +   30.924 * s,y +   -7.812 * s,x +   35.391 * s,y +   -8.960 * s,x +   38.207 * s,y +  -11.255 * s, threshold);
			_vr.bezier8(x +   38.207 * s,y +  -11.255 * s,x +   41.023 * s,y +  -13.550 * s,x +   42.431 * s,y +  -17.204 * s,x +   42.431 * s,y +  -22.216 * s, threshold);
			_vr.bezier8(x +   42.431 * s,y +  -22.216 * s,x +   42.431 * s,y +  -26.871 * s,x +   41.088 * s,y +  -30.306 * s,x +   38.402 * s,y +  -32.519 * s, threshold);
			_vr.bezier8(x +   38.402 * s,y +  -32.519 * s,x +   35.717 * s,y +  -34.733 * s,x +   31.230 * s,y +  -36.034 * s,x +   24.951 * s,y +  -35.839 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   17.089 * s);
			_setf(o + ( 1 << 2), y +  -35.595 * s);
			_setf(o + ( 2 << 2), x +   56.590 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 67:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   52.978 * s);
			_setf(o + ( 1 << 2), y +  -68.895 * s);
			_setf(o + ( 2 << 2), x +   49.707 * s);
			_setf(o + ( 3 << 2), y +  -60.546 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   49.707 * s,y +  -60.546 * s,x +   46.582 * s,y +  -62.825 * s,x +   41.666 * s,y +  -63.964 * s,x +   34.961 * s,y +  -63.964 * s, threshold);
			_vr.bezier8(x +   34.961 * s,y +  -63.964 * s,x +   28.678 * s,y +  -63.964 * s,x +   23.641 * s,y +  -61.262 * s,x +   19.849 * s,y +  -55.859 * s, threshold);
			_vr.bezier8(x +   19.849 * s,y +  -55.859 * s,x +   16.056 * s,y +  -50.455 * s,x +   14.160 * s,y +  -43.489 * s,x +   14.160 * s,y +  -34.960 * s, threshold);
			_vr.bezier8(x +   14.160 * s,y +  -34.960 * s,x +   14.160 * s,y +  -26.822 * s,x +   16.105 * s,y +  -20.223 * s,x +   19.995 * s,y +  -15.161 * s, threshold);
			_vr.bezier8(x +   19.995 * s,y +  -15.161 * s,x +   23.885 * s,y +  -10.099 * s,x +   28.906 * s,y +   -7.568 * s,x +   35.058 * s,y +   -7.568 * s, threshold);
			_vr.bezier8(x +   35.058 * s,y +   -7.568 * s,x +   41.764 * s,y +   -7.568 * s,x +   46.923 * s,y +   -9.944 * s,x +   50.537 * s,y +  -14.697 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   55.908 * s);
			_setf(o + ( 1 << 2), y +   -7.226 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   55.908 * s,y +   -7.226 * s,x +   50.244 * s,y +   -1.595 * s,x +   42.952 * s,y +    1.221 * s,x +   34.033 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   34.033 * s,y +    1.221 * s,x +   24.691 * s,y +    1.221 * s,x +   17.334 * s,y +   -2.148 * s,x +   11.963 * s,y +   -8.887 * s, threshold);
			_vr.bezier8(x +   11.963 * s,y +   -8.887 * s,x +    6.592 * s,y +  -15.625 * s,x +    3.907 * s,y +  -24.511 * s,x +    3.907 * s,y +  -35.546 * s, threshold);
			_vr.bezier8(x +    3.907 * s,y +  -35.546 * s,x +    3.907 * s,y +  -46.223 * s,x +    6.771 * s,y +  -55.094 * s,x +   12.500 * s,y +  -62.157 * s, threshold);
			_vr.bezier8(x +   12.500 * s,y +  -62.157 * s,x +   18.229 * s,y +  -69.221 * s,x +   25.635 * s,y +  -72.753 * s,x +   34.717 * s,y +  -72.753 * s, threshold);
			_vr.bezier8(x +   34.717 * s,y +  -72.753 * s,x +   42.496 * s,y +  -72.753 * s,x +   48.584 * s,y +  -71.467 * s,x +   52.978 * s,y +  -68.895 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   59.814 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 68:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   21.728 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    7.324 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    7.324 * s);
			_setf(o + ( 5 << 2), y +  -71.532 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +    7.324 * s,y +  -71.532 * s,x +   16.504 * s,y +  -71.858 * s,x +   22.379 * s,y +  -72.020 * s,x +   24.951 * s,y +  -72.020 * s, threshold);
			_vr.bezier8(x +   24.951 * s,y +  -72.020 * s,x +   34.944 * s,y +  -72.020 * s,x +   42.854 * s,y +  -68.985 * s,x +   48.681 * s,y +  -62.914 * s, threshold);
			_vr.bezier8(x +   48.681 * s,y +  -62.914 * s,x +   54.508 * s,y +  -56.843 * s,x +   57.421 * s,y +  -48.762 * s,x +   57.421 * s,y +  -38.671 * s, threshold);
			_vr.bezier8(x +   57.421 * s,y +  -38.671 * s,x +   57.421 * s,y +  -12.889 * s,x +   45.522 * s,y +       0. * s,x +   21.728 * s,y +       0. * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   17.090 * s);
			_setf(o + ( 1 << 2), y +  -62.743 * s);
			_setf(o + ( 2 << 2), x +   17.090 * s);
			_setf(o + ( 3 << 2), y +   -9.277 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   17.090 * s,y +   -9.277 * s,x +   19.270 * s,y +   -8.952 * s,x +   21.972 * s,y +   -8.789 * s,x +   25.195 * s,y +   -8.789 * s, threshold);
			_vr.bezier8(x +   25.195 * s,y +   -8.789 * s,x +   32.031 * s,y +   -8.789 * s,x +   37.402 * s,y +  -11.352 * s,x +   41.308 * s,y +  -16.479 * s, threshold);
			_vr.bezier8(x +   41.308 * s,y +  -16.479 * s,x +   45.214 * s,y +  -21.606 * s,x +   47.167 * s,y +  -28.727 * s,x +   47.167 * s,y +  -37.841 * s, threshold);
			_vr.bezier8(x +   47.167 * s,y +  -37.841 * s,x +   47.167 * s,y +  -54.768 * s,x +   39.566 * s,y +  -63.231 * s,x +   24.365 * s,y +  -63.231 * s, threshold);
			_vr.bezier8(x +   24.365 * s,y +  -63.231 * s,x +   23.453 * s,y +  -63.231 * s,x +   21.028 * s,y +  -63.069 * s,x +   17.090 * s,y +  -62.743 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   61.327 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 69:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   17.090 * s);
			_setf(o + ( 1 << 2), y +  -62.743 * s);
			_setf(o + ( 2 << 2), x +   17.090 * s);
			_setf(o + ( 3 << 2), y +  -42.870 * s);
			_setf(o + ( 4 << 2), x +   40.722 * s);
			_setf(o + ( 5 << 2), y +  -42.870 * s);
			_setf(o + ( 6 << 2), x +   40.722 * s);
			_setf(o + ( 7 << 2), y +  -34.570 * s);
			_setf(o + ( 8 << 2), x +   17.090 * s);
			_setf(o + ( 9 << 2), y +  -34.570 * s);
			_setf(o + (10 << 2), x +   17.090 * s);
			_setf(o + (11 << 2), y +   -8.789 * s);
			_setf(o + (12 << 2), x +   49.511 * s);
			_setf(o + (13 << 2), y +   -8.789 * s);
			_setf(o + (14 << 2), x +   49.511 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +    7.324 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +    7.324 * s);
			_setf(o + (19 << 2), y +  -71.532 * s);
			_setf(o + (20 << 2), x +   50.048 * s);
			_setf(o + (21 << 2), y +  -71.532 * s);
			_setf(o + (22 << 2), x +   50.048 * s);
			_setf(o + (23 << 2), y +  -62.743 * s);
			_setf(o + (24 << 2), x +   17.090 * s);
			_setf(o + (25 << 2), y +  -62.743 * s);
			_setf(o + (26 << 2), x +   53.564 * s);
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
			_setf(o + ( 0 << 2), x +   17.089 * s);
			_setf(o + ( 1 << 2), y +  -62.743 * s);
			_setf(o + ( 2 << 2), x +   17.089 * s);
			_setf(o + ( 3 << 2), y +  -42.870 * s);
			_setf(o + ( 4 << 2), x +   42.235 * s);
			_setf(o + ( 5 << 2), y +  -42.870 * s);
			_setf(o + ( 6 << 2), x +   42.235 * s);
			_setf(o + ( 7 << 2), y +  -34.570 * s);
			_setf(o + ( 8 << 2), x +   17.089 * s);
			_setf(o + ( 9 << 2), y +  -34.570 * s);
			_setf(o + (10 << 2), x +   17.089 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    7.324 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +    7.324 * s);
			_setf(o + (15 << 2), y +  -71.532 * s);
			_setf(o + (16 << 2), x +   51.513 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   51.513 * s);
			_setf(o + (19 << 2), y +  -62.743 * s);
			_setf(o + (20 << 2), x +   17.089 * s);
			_setf(o + (21 << 2), y +  -62.743 * s);
			_setf(o + (22 << 2), x +   52.489 * s);
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
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   56.884 * s);
			_setf(o + ( 1 << 2), y +  -66.552 * s);
			_setf(o + ( 2 << 2), x +   52.831 * s);
			_setf(o + ( 3 << 2), y +  -58.495 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   52.831 * s,y +  -58.495 * s,x +   47.916 * s,y +  -62.141 * s,x +   43.098 * s,y +  -63.964 * s,x +   38.378 * s,y +  -63.964 * s, threshold);
			_vr.bezier8(x +   38.378 * s,y +  -63.964 * s,x +   30.892 * s,y +  -63.964 * s,x +   24.983 * s,y +  -61.327 * s,x +   20.654 * s,y +  -56.054 * s, threshold);
			_vr.bezier8(x +   20.654 * s,y +  -56.054 * s,x +   16.325 * s,y +  -50.780 * s,x +   14.160 * s,y +  -43.798 * s,x +   14.160 * s,y +  -35.107 * s, threshold);
			_vr.bezier8(x +   14.160 * s,y +  -35.107 * s,x +   14.160 * s,y +  -26.839 * s,x +   16.284 * s,y +  -20.182 * s,x +   20.532 * s,y +  -15.136 * s, threshold);
			_vr.bezier8(x +   20.532 * s,y +  -15.136 * s,x +   24.780 * s,y +  -10.091 * s,x +   30.566 * s,y +   -7.568 * s,x +   37.890 * s,y +   -7.568 * s, threshold);
			_vr.bezier8(x +   37.890 * s,y +   -7.568 * s,x +   43.099 * s,y +   -7.568 * s,x +   47.314 * s,y +   -9.131 * s,x +   50.537 * s,y +  -12.256 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   50.537 * s);
			_setf(o + ( 1 << 2), y +  -29.003 * s);
			_setf(o + ( 2 << 2), x +   40.625 * s);
			_setf(o + ( 3 << 2), y +  -29.003 * s);
			_setf(o + ( 4 << 2), x +   40.625 * s);
			_setf(o + ( 5 << 2), y +  -37.304 * s);
			_setf(o + ( 6 << 2), x +   60.302 * s);
			_setf(o + ( 7 << 2), y +  -37.304 * s);
			_setf(o + ( 8 << 2), x +   60.302 * s);
			_setf(o + ( 9 << 2), y +   -6.152 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   60.302 * s,y +   -6.152 * s,x +   57.698 * s,y +   -3.939 * s,x +   54.068 * s,y +   -2.157 * s,x +   49.413 * s,y +   -0.806 * s, threshold);
			_vr.bezier8(x +   49.413 * s,y +   -0.806 * s,x +   44.759 * s,y +    0.545 * s,x +   40.234 * s,y +    1.221 * s,x +   35.839 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   35.839 * s,y +    1.221 * s,x +   25.976 * s,y +    1.221 * s,x +   18.188 * s,y +   -2.124 * s,x +   12.476 * s,y +   -8.813 * s, threshold);
			_vr.bezier8(x +   12.476 * s,y +   -8.813 * s,x +    6.763 * s,y +  -15.503 * s,x +    3.906 * s,y +  -24.398 * s,x +    3.906 * s,y +  -35.497 * s, threshold);
			_vr.bezier8(x +    3.906 * s,y +  -35.497 * s,x +    3.906 * s,y +  -46.565 * s,x +    7.039 * s,y +  -55.541 * s,x +   13.306 * s,y +  -62.426 * s, threshold);
			_vr.bezier8(x +   13.306 * s,y +  -62.426 * s,x +   19.572 * s,y +  -69.310 * s,x +   28.027 * s,y +  -72.753 * s,x +   38.671 * s,y +  -72.753 * s, threshold);
			_vr.bezier8(x +   38.671 * s,y +  -72.753 * s,x +   46.126 * s,y +  -72.753 * s,x +   52.197 * s,y +  -70.686 * s,x +   56.884 * s,y +  -66.552 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   67.626 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 72:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   48.339 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   48.339 * s);
			_setf(o + ( 3 << 2), y +  -34.570 * s);
			_setf(o + ( 4 << 2), x +   17.090 * s);
			_setf(o + ( 5 << 2), y +  -34.570 * s);
			_setf(o + ( 6 << 2), x +   17.090 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    7.324 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +    7.324 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   17.090 * s);
			_setf(o + (13 << 2), y +  -71.532 * s);
			_setf(o + (14 << 2), x +   17.090 * s);
			_setf(o + (15 << 2), y +  -42.870 * s);
			_setf(o + (16 << 2), x +   48.339 * s);
			_setf(o + (17 << 2), y +  -42.870 * s);
			_setf(o + (18 << 2), x +   48.339 * s);
			_setf(o + (19 << 2), y +  -71.532 * s);
			_setf(o + (20 << 2), x +   58.105 * s);
			_setf(o + (21 << 2), y +  -71.532 * s);
			_setf(o + (22 << 2), x +   58.105 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   48.339 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   65.429 * s);
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
			_setf(o + ( 0 << 2), x +    9.033 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    9.033 * s);
			_setf(o + ( 3 << 2), y +  -71.532 * s);
			_setf(o + ( 4 << 2), x +   18.798 * s);
			_setf(o + ( 5 << 2), y +  -71.532 * s);
			_setf(o + ( 6 << 2), x +   18.798 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    9.033 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   27.831 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 74:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    2.393 * s);
			_setf(o + ( 1 << 2), y +  -14.306 * s);
			_setf(o + ( 2 << 2), x +   10.937 * s);
			_setf(o + ( 3 << 2), y +  -14.306 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   10.937 * s,y +  -14.306 * s,x +   11.719 * s,y +   -9.977 * s,x +   14.306 * s,y +   -7.812 * s,x +   18.701 * s,y +   -7.812 * s, threshold);
			_vr.bezier8(x +   18.701 * s,y +   -7.812 * s,x +   23.063 * s,y +   -7.812 * s,x +   26.131 * s,y +   -8.748 * s,x +   27.905 * s,y +  -10.620 * s, threshold);
			_vr.bezier8(x +   27.905 * s,y +  -10.620 * s,x +   29.679 * s,y +  -12.492 * s,x +   30.566 * s,y +  -17.724 * s,x +   30.566 * s,y +  -26.318 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   30.566 * s);
			_setf(o + ( 1 << 2), y +  -71.532 * s);
			_setf(o + ( 2 << 2), x +   40.331 * s);
			_setf(o + ( 3 << 2), y +  -71.532 * s);
			_setf(o + ( 4 << 2), x +   40.331 * s);
			_setf(o + ( 5 << 2), y +  -26.709 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   40.331 * s,y +  -26.709 * s,x +   40.331 * s,y +  -16.943 * s,x +   38.753 * s,y +   -9.888 * s,x +   35.595 * s,y +   -5.542 * s, threshold);
			_vr.bezier8(x +   35.595 * s,y +   -5.542 * s,x +   32.438 * s,y +   -1.196 * s,x +   26.823 * s,y +    0.977 * s,x +   18.750 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   18.750 * s,y +    0.977 * s,x +   14.095 * s,y +    0.977 * s,x +   10.278 * s,y +   -0.407 * s,x +    7.300 * s,y +   -3.174 * s, threshold);
			_vr.bezier8(x +    7.300 * s,y +   -3.174 * s,x +    4.321 * s,y +   -5.941 * s,x +    2.686 * s,y +   -9.652 * s,x +    2.393 * s,y +  -14.306 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   47.655 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 75:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   46.776 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   26.611 * s);
			_setf(o + ( 3 << 2), y +  -32.910 * s);
			_setf(o + ( 4 << 2), x +   17.090 * s);
			_setf(o + ( 5 << 2), y +  -19.384 * s);
			_setf(o + ( 6 << 2), x +   17.090 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    7.324 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +    7.324 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   17.090 * s);
			_setf(o + (13 << 2), y +  -71.532 * s);
			_setf(o + (14 << 2), x +   17.090 * s);
			_setf(o + (15 << 2), y +  -32.617 * s);
			_setf(o + (16 << 2), x +   43.651 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   54.540 * s);
			_setf(o + (19 << 2), y +  -71.532 * s);
			_setf(o + (20 << 2), x +   33.154 * s);
			_setf(o + (21 << 2), y +  -40.527 * s);
			_setf(o + (22 << 2), x +   57.567 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   46.776 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   57.567 * s);
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
			
			case 76:
			
			o = _posf(16);
			_setf(o + ( 0 << 2), x +    7.324 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    7.324 * s);
			_setf(o + ( 3 << 2), y +  -71.532 * s);
			_setf(o + ( 4 << 2), x +   17.090 * s);
			_setf(o + ( 5 << 2), y +  -71.532 * s);
			_setf(o + ( 6 << 2), x +   17.090 * s);
			_setf(o + ( 7 << 2), y +   -8.789 * s);
			_setf(o + ( 8 << 2), x +   49.413 * s);
			_setf(o + ( 9 << 2), y +   -8.789 * s);
			_setf(o + (10 << 2), x +   49.413 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    7.324 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   50.634 * s);
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
			
			o = _posf(30);
			_setf(o + ( 0 << 2), x +   61.181 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   52.685 * s);
			_setf(o + ( 3 << 2), y +  -45.947 * s);
			_setf(o + ( 4 << 2), x +   37.060 * s);
			_setf(o + ( 5 << 2), y +    0.977 * s);
			_setf(o + ( 6 << 2), x +   34.619 * s);
			_setf(o + ( 7 << 2), y +    0.977 * s);
			_setf(o + ( 8 << 2), x +   18.554 * s);
			_setf(o + ( 9 << 2), y +  -45.947 * s);
			_setf(o + (10 << 2), x +   10.254 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    0.977 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   14.355 * s);
			_setf(o + (15 << 2), y +  -71.532 * s);
			_setf(o + (16 << 2), x +   18.799 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   35.839 * s);
			_setf(o + (19 << 2), y +  -19.336 * s);
			_setf(o + (20 << 2), x +   51.562 * s);
			_setf(o + (21 << 2), y +  -71.532 * s);
			_setf(o + (22 << 2), x +   55.956 * s);
			_setf(o + (23 << 2), y +  -71.532 * s);
			_setf(o + (24 << 2), x +   70.458 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   61.181 * s);
			_setf(o + (27 << 2), y +       0. * s);
			_setf(o + (28 << 2), x +   70.946 * s);
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
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 1);
			
			case 78:
			
			o = _posf(24);
			_setf(o + ( 0 << 2), x +   53.564 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			_setf(o + ( 2 << 2), x +   16.601 * s);
			_setf(o + ( 3 << 2), y +  -51.318 * s);
			_setf(o + ( 4 << 2), x +   16.601 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    7.324 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    7.324 * s);
			_setf(o + ( 9 << 2), y +  -71.532 * s);
			_setf(o + (10 << 2), x +   11.230 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   47.216 * s);
			_setf(o + (13 << 2), y +  -22.070 * s);
			_setf(o + (14 << 2), x +   47.216 * s);
			_setf(o + (15 << 2), y +  -71.532 * s);
			_setf(o + (16 << 2), x +   56.493 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   56.493 * s);
			_setf(o + (19 << 2), y +    0.977 * s);
			_setf(o + (20 << 2), x +   53.564 * s);
			_setf(o + (21 << 2), y +    0.977 * s);
			_setf(o + (22 << 2), x +   63.818 * s);
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
			
			case 79:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    3.906 * s);
			_setf(o + ( 1 << 2), y +  -36.376 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +    3.906 * s,y +  -36.376 * s,x +    3.906 * s,y +  -46.728 * s,x +    6.502 * s,y +  -55.387 * s,x +   11.694 * s,y +  -62.353 * s, threshold);
			_vr.bezier8(x +   11.694 * s,y +  -62.353 * s,x +   16.886 * s,y +  -69.319 * s,x +   23.893 * s,y +  -72.802 * s,x +   32.714 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   32.714 * s,y +  -72.802 * s,x +   42.642 * s,y +  -72.802 * s,x +   50.251 * s,y +  -69.595 * s,x +   55.541 * s,y +  -63.183 * s, threshold);
			_vr.bezier8(x +   55.541 * s,y +  -63.183 * s,x +   60.830 * s,y +  -56.770 * s,x +   63.475 * s,y +  -47.835 * s,x +   63.475 * s,y +  -36.376 * s, threshold);
			_vr.bezier8(x +   63.475 * s,y +  -36.376 * s,x +   63.475 * s,y +  -24.625 * s,x +   60.822 * s,y +  -15.421 * s,x +   55.516 * s,y +   -8.765 * s, threshold);
			_vr.bezier8(x +   55.516 * s,y +   -8.765 * s,x +   50.210 * s,y +   -2.108 * s,x +   42.610 * s,y +    1.221 * s,x +   32.714 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   32.714 * s,y +    1.221 * s,x +   23.697 * s,y +    1.221 * s,x +   16.642 * s,y +   -2.295 * s,x +   11.547 * s,y +   -9.326 * s, threshold);
			_vr.bezier8(x +   11.547 * s,y +   -9.326 * s,x +    6.453 * s,y +  -16.357 * s,x +    3.906 * s,y +  -25.374 * s,x +    3.906 * s,y +  -36.376 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   14.159 * s);
			_setf(o + ( 1 << 2), y +  -36.376 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   14.159 * s,y +  -36.376 * s,x +   14.159 * s,y +  -28.173 * s,x +   15.779 * s,y +  -21.321 * s,x +   19.018 * s,y +  -15.820 * s, threshold);
			_vr.bezier8(x +   19.018 * s,y +  -15.820 * s,x +   22.257 * s,y +  -10.319 * s,x +   26.822 * s,y +   -7.568 * s,x +   32.714 * s,y +   -7.568 * s, threshold);
			_vr.bezier8(x +   32.714 * s,y +   -7.568 * s,x +   39.387 * s,y +   -7.568 * s,x +   44.473 * s,y +  -10.091 * s,x +   47.972 * s,y +  -15.136 * s, threshold);
			_vr.bezier8(x +   47.972 * s,y +  -15.136 * s,x +   51.472 * s,y +  -20.182 * s,x +   53.221 * s,y +  -27.262 * s,x +   53.221 * s,y +  -36.376 * s, threshold);
			_vr.bezier8(x +   53.221 * s,y +  -36.376 * s,x +   53.221 * s,y +  -54.800 * s,x +   46.386 * s,y +  -64.013 * s,x +   32.714 * s,y +  -64.013 * s, threshold);
			_vr.bezier8(x +   32.714 * s,y +  -64.013 * s,x +   26.659 * s,y +  -64.013 * s,x +   22.053 * s,y +  -61.539 * s,x +   18.896 * s,y +  -56.591 * s, threshold);
			_vr.bezier8(x +   18.896 * s,y +  -56.591 * s,x +   15.738 * s,y +  -51.643 * s,x +   14.159 * s,y +  -44.905 * s,x +   14.159 * s,y +  -36.376 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   67.381 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 80:
			
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   17.090 * s);
			_setf(o + ( 1 << 2), y +  -27.539 * s);
			_setf(o + ( 2 << 2), x +   17.090 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    7.324 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    7.324 * s);
			_setf(o + ( 7 << 2), y +  -71.532 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_vr.bezier8(x +    7.324 * s,y +  -71.532 * s,x +   14.714 * s,y +  -71.858 * s,x +   19.173 * s,y +  -72.020 * s,x +   20.703 * s,y +  -72.020 * s, threshold);
			_vr.bezier8(x +   20.703 * s,y +  -72.020 * s,x +   41.470 * s,y +  -72.020 * s,x +   51.855 * s,y +  -65.070 * s,x +   51.855 * s,y +  -51.171 * s, threshold);
			_vr.bezier8(x +   51.855 * s,y +  -51.171 * s,x +   51.855 * s,y +  -35.091 * s,x +   42.676 * s,y +  -27.050 * s,x +   24.316 * s,y +  -27.050 * s, threshold);
			_vr.bezier8(x +   24.316 * s,y +  -27.050 * s,x +   23.210 * s,y +  -27.050 * s,x +   20.801 * s,y +  -27.213 * s,x +   17.090 * s,y +  -27.539 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   17.090 * s);
			_setf(o + ( 1 << 2), y +  -62.743 * s);
			_setf(o + ( 2 << 2), x +   17.090 * s);
			_setf(o + ( 3 << 2), y +  -36.328 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   17.090 * s,y +  -36.328 * s,x +   21.224 * s,y +  -36.002 * s,x +   23.405 * s,y +  -35.839 * s,x +   23.633 * s,y +  -35.839 * s, threshold);
			_vr.bezier8(x +   23.633 * s,y +  -35.839 * s,x +   35.742 * s,y +  -35.839 * s,x +   41.797 * s,y +  -40.608 * s,x +   41.797 * s,y +  -50.146 * s, threshold);
			_vr.bezier8(x +   41.797 * s,y +  -50.146 * s,x +   41.797 * s,y +  -58.869 * s,x +   35.335 * s,y +  -63.231 * s,x +   22.412 * s,y +  -63.231 * s, threshold);
			_vr.bezier8(x +   22.412 * s,y +  -63.231 * s,x +   21.110 * s,y +  -63.231 * s,x +   19.336 * s,y +  -63.069 * s,x +   17.090 * s,y +  -62.743 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   55.761 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 81:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   74.218 * s);
			_setf(o + ( 1 << 2), y +    5.273 * s);
			_setf(o + ( 2 << 2), x +   72.753 * s);
			_setf(o + ( 3 << 2), y +   14.795 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   72.753 * s,y +   14.795 * s,x +   55.696 * s,y +   14.795 * s,x +   44.514 * s,y +   10.058 * s,x +   39.209 * s,y +    0.586 * s, threshold);
			_vr.bezier8(x +   39.209 * s,y +    0.586 * s,x +   38.199 * s,y +    1.009 * s,x +   36.035 * s,y +    1.221 * s,x +   32.715 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   32.715 * s,y +    1.221 * s,x +   23.698 * s,y +    1.221 * s,x +   16.642 * s,y +   -2.295 * s,x +   11.548 * s,y +   -9.326 * s, threshold);
			_vr.bezier8(x +   11.548 * s,y +   -9.326 * s,x +    6.454 * s,y +  -16.357 * s,x +    3.906 * s,y +  -25.374 * s,x +    3.906 * s,y +  -36.376 * s, threshold);
			_vr.bezier8(x +    3.906 * s,y +  -36.376 * s,x +    3.906 * s,y +  -46.695 * s,x +    6.494 * s,y +  -55.346 * s,x +   11.670 * s,y +  -62.328 * s, threshold);
			_vr.bezier8(x +   11.670 * s,y +  -62.328 * s,x +   16.846 * s,y +  -69.310 * s,x +   23.860 * s,y +  -72.802 * s,x +   32.715 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   32.715 * s,y +  -72.802 * s,x +   42.643 * s,y +  -72.802 * s,x +   50.252 * s,y +  -69.595 * s,x +   55.541 * s,y +  -63.183 * s, threshold);
			_vr.bezier8(x +   55.541 * s,y +  -63.183 * s,x +   60.831 * s,y +  -56.770 * s,x +   63.476 * s,y +  -47.834 * s,x +   63.476 * s,y +  -36.376 * s, threshold);
			_vr.bezier8(x +   63.476 * s,y +  -36.376 * s,x +   63.476 * s,y +  -19.938 * s,x +   58.560 * s,y +   -8.659 * s,x +   48.730 * s,y +   -2.539 * s, threshold);
			_vr.bezier8(x +   48.730 * s,y +   -2.539 * s,x +   52.278 * s,y +    2.669 * s,x +   58.235 * s,y +    5.273 * s,x +   66.601 * s,y +    5.273 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   74.218 * s);
			_setf(o + ( 1 << 2), y +    5.273 * s);
			_setf(o + ( 2 << 2), x +   32.715 * s);
			_setf(o + ( 3 << 2), y +  -64.013 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_vr.bezier8(x +   32.715 * s,y +  -64.013 * s,x +   26.660 * s,y +  -64.013 * s,x +   22.054 * s,y +  -61.539 * s,x +   18.896 * s,y +  -56.591 * s, threshold);
			_vr.bezier8(x +   18.896 * s,y +  -56.591 * s,x +   15.739 * s,y +  -51.643 * s,x +   14.160 * s,y +  -44.905 * s,x +   14.160 * s,y +  -36.376 * s, threshold);
			_vr.bezier8(x +   14.160 * s,y +  -36.376 * s,x +   14.160 * s,y +  -28.173 * s,x +   15.780 * s,y +  -21.321 * s,x +   19.018 * s,y +  -15.820 * s, threshold);
			_vr.bezier8(x +   19.018 * s,y +  -15.820 * s,x +   22.257 * s,y +  -10.319 * s,x +   26.823 * s,y +   -7.568 * s,x +   32.715 * s,y +   -7.568 * s, threshold);
			_vr.bezier8(x +   32.715 * s,y +   -7.568 * s,x +   39.420 * s,y +   -7.568 * s,x +   44.514 * s,y +  -10.115 * s,x +   47.997 * s,y +  -15.210 * s, threshold);
			_vr.bezier8(x +   47.997 * s,y +  -15.210 * s,x +   51.480 * s,y +  -20.304 * s,x +   53.222 * s,y +  -27.360 * s,x +   53.222 * s,y +  -36.376 * s, threshold);
			_vr.bezier8(x +   53.222 * s,y +  -36.376 * s,x +   53.222 * s,y +  -54.800 * s,x +   46.386 * s,y +  -64.013 * s,x +   32.715 * s,y +  -64.013 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   67.577 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 82:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   47.021 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   27.929 * s);
			_setf(o + ( 3 << 2), y +  -30.712 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   27.929 * s,y +  -30.712 * s,x +   25.748 * s,y +  -30.712 * s,x +   22.298 * s,y +  -30.875 * s,x +   17.578 * s,y +  -31.201 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   17.578 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    7.812 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    7.812 * s);
			_setf(o + ( 5 << 2), y +  -71.532 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +    7.812 * s,y +  -71.532 * s,x +    8.170 * s,y +  -71.532 * s,x +   10.701 * s,y +  -71.654 * s,x +   15.405 * s,y +  -71.898 * s, threshold);
			_vr.bezier8(x +   15.405 * s,y +  -71.898 * s,x +   20.109 * s,y +  -72.142 * s,x +   23.535 * s,y +  -72.265 * s,x +   25.683 * s,y +  -72.265 * s, threshold);
			_vr.bezier8(x +   25.683 * s,y +  -72.265 * s,x +   42.870 * s,y +  -72.265 * s,x +   51.464 * s,y +  -65.429 * s,x +   51.464 * s,y +  -51.757 * s, threshold);
			_vr.bezier8(x +   51.464 * s,y +  -51.757 * s,x +   51.464 * s,y +  -47.265 * s,x +   50.081 * s,y +  -43.220 * s,x +   47.314 * s,y +  -39.623 * s, threshold);
			_vr.bezier8(x +   47.314 * s,y +  -39.623 * s,x +   44.547 * s,y +  -36.026 * s,x +   41.259 * s,y +  -33.789 * s,x +   37.451 * s,y +  -32.910 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   58.202 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   47.021 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   17.578 * s);
			_setf(o + ( 5 << 2), y +  -62.743 * s);
			_setf(o + ( 6 << 2), x +   17.578 * s);
			_setf(o + ( 7 << 2), y +  -39.501 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			_setb(o +  3, 2);
			_vr.bezier8(x +   17.578 * s,y +  -39.501 * s,x +   19.922 * s,y +  -39.176 * s,x +   22.200 * s,y +  -39.013 * s,x +   24.414 * s,y +  -39.013 * s, threshold);
			_vr.bezier8(x +   24.414 * s,y +  -39.013 * s,x +   30.273 * s,y +  -39.013 * s,x +   34.537 * s,y +  -39.957 * s,x +   37.207 * s,y +  -41.845 * s, threshold);
			_vr.bezier8(x +   37.207 * s,y +  -41.845 * s,x +   39.876 * s,y +  -43.733 * s,x +   41.210 * s,y +  -47.102 * s,x +   41.210 * s,y +  -51.952 * s, threshold);
			_vr.bezier8(x +   41.210 * s,y +  -51.952 * s,x +   41.210 * s,y +  -55.956 * s,x +   39.778 * s,y +  -58.837 * s,x +   36.913 * s,y +  -60.595 * s, threshold);
			_vr.bezier8(x +   36.913 * s,y +  -60.595 * s,x +   34.049 * s,y +  -62.353 * s,x +   29.524 * s,y +  -63.231 * s,x +   23.339 * s,y +  -63.231 * s, threshold);
			_vr.bezier8(x +   23.339 * s,y +  -63.231 * s,x +   22.363 * s,y +  -63.231 * s,x +   20.442 * s,y +  -63.069 * s,x +   17.578 * s,y +  -62.743 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.202 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 83:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    4.101 * s);
			_setf(o + ( 1 << 2), y +   -3.271 * s);
			_setf(o + ( 2 << 2), x +    7.666 * s);
			_setf(o + ( 3 << 2), y +  -12.256 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    7.666 * s,y +  -12.256 * s,x +    9.489 * s,y +  -10.921 * s,x +   11.759 * s,y +   -9.806 * s,x +   14.477 * s,y +   -8.911 * s, threshold);
			_vr.bezier8(x +   14.477 * s,y +   -8.911 * s,x +   17.195 * s,y +   -8.016 * s,x +   19.629 * s,y +   -7.568 * s,x +   21.777 * s,y +   -7.568 * s, threshold);
			_vr.bezier8(x +   21.777 * s,y +   -7.568 * s,x +   25.586 * s,y +   -7.568 * s,x +   28.645 * s,y +   -8.610 * s,x +   30.957 * s,y +  -10.693 * s, threshold);
			_vr.bezier8(x +   30.957 * s,y +  -10.693 * s,x +   33.268 * s,y +  -12.776 * s,x +   34.424 * s,y +  -15.429 * s,x +   34.424 * s,y +  -18.652 * s, threshold);
			_vr.bezier8(x +   34.424 * s,y +  -18.652 * s,x +   34.424 * s,y +  -21.061 * s,x +   33.781 * s,y +  -23.299 * s,x +   32.495 * s,y +  -25.366 * s, threshold);
			_vr.bezier8(x +   32.495 * s,y +  -25.366 * s,x +   31.209 * s,y +  -27.433 * s,x +   27.989 * s,y +  -29.711 * s,x +   22.802 * s,y +  -32.128 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   17.041 * s);
			_setf(o + ( 1 << 2), y +  -34.814 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   17.041 * s,y +  -34.814 * s,x +   12.157 * s,y +  -37.090 * s,x +    8.748 * s,y +  -39.794 * s,x +    6.811 * s,y +  -42.919 * s, threshold);
			_vr.bezier8(x +    6.811 * s,y +  -42.919 * s,x +    4.875 * s,y +  -46.044 * s,x +    3.906 * s,y +  -49.804 * s,x +    3.906 * s,y +  -54.198 * s, threshold);
			_vr.bezier8(x +    3.906 * s,y +  -54.198 * s,x +    3.906 * s,y +  -59.537 * s,x +    5.794 * s,y +  -63.964 * s,x +    9.570 * s,y +  -67.479 * s, threshold);
			_vr.bezier8(x +    9.570 * s,y +  -67.479 * s,x +   13.346 * s,y +  -70.995 * s,x +   18.196 * s,y +  -72.753 * s,x +   24.121 * s,y +  -72.753 * s, threshold);
			_vr.bezier8(x +   24.121 * s,y +  -72.753 * s,x +   32.031 * s,y +  -72.753 * s,x +   37.532 * s,y +  -71.467 * s,x +   40.625 * s,y +  -68.895 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   37.744 * s);
			_setf(o + ( 1 << 2), y +  -60.399 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   37.744 * s,y +  -60.399 * s,x +   36.442 * s,y +  -61.343 * s,x +   34.456 * s,y +  -62.255 * s,x +   31.787 * s,y +  -63.134 * s, threshold);
			_vr.bezier8(x +   31.787 * s,y +  -63.134 * s,x +   29.117 * s,y +  -64.013 * s,x +   26.643 * s,y +  -64.452 * s,x +   24.365 * s,y +  -64.452 * s, threshold);
			_vr.bezier8(x +   24.365 * s,y +  -64.452 * s,x +   21.044 * s,y +  -64.452 * s,x +   18.432 * s,y +  -63.508 * s,x +   16.528 * s,y +  -61.620 * s, threshold);
			_vr.bezier8(x +   16.528 * s,y +  -61.620 * s,x +   14.624 * s,y +  -59.732 * s,x +   13.672 * s,y +  -57.307 * s,x +   13.672 * s,y +  -54.345 * s, threshold);
			_vr.bezier8(x +   13.672 * s,y +  -54.345 * s,x +   13.672 * s,y +  -52.522 * s,x +   14.013 * s,y +  -50.862 * s,x +   14.697 * s,y +  -49.364 * s, threshold);
			_vr.bezier8(x +   14.697 * s,y +  -49.364 * s,x +   15.381 * s,y +  -47.867 * s,x +   16.333 * s,y +  -46.614 * s,x +   17.553 * s,y +  -45.605 * s, threshold);
			_vr.bezier8(x +   17.553 * s,y +  -45.605 * s,x +   18.774 * s,y +  -44.596 * s,x +   21.261 * s,y +  -43.156 * s,x +   25.048 * s,y +  -41.357 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   30.908 * s);
			_setf(o + ( 1 << 2), y +  -38.574 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   30.908 * s,y +  -38.574 * s,x +   35.788 * s,y +  -36.256 * s,x +   39.217 * s,y +  -33.504 * s,x +   41.186 * s,y +  -30.297 * s, threshold);
			_vr.bezier8(x +   41.186 * s,y +  -30.297 * s,x +   43.155 * s,y +  -27.091 * s,x +   44.140 * s,y +  -23.014 * s,x +   44.140 * s,y +  -18.066 * s, threshold);
			_vr.bezier8(x +   44.140 * s,y +  -18.066 * s,x +   44.140 * s,y +  -12.695 * s,x +   41.984 * s,y +   -8.138 * s,x +   37.671 * s,y +   -4.394 * s, threshold);
			_vr.bezier8(x +   37.671 * s,y +   -4.394 * s,x +   33.357 * s,y +   -0.651 * s,x +   27.587 * s,y +    1.221 * s,x +   20.361 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   20.361 * s,y +    1.221 * s,x +   14.013 * s,y +    1.221 * s,x +    8.594 * s,y +   -0.277 * s,x +    4.101 * s,y +   -3.271 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   48.095 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 84:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +   33.398 * s);
			_setf(o + ( 1 << 2), y +  -62.743 * s);
			_setf(o + ( 2 << 2), x +   33.398 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   23.633 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   23.633 * s);
			_setf(o + ( 7 << 2), y +  -62.743 * s);
			_setf(o + ( 8 << 2), x +    0.879 * s);
			_setf(o + ( 9 << 2), y +  -62.743 * s);
			_setf(o + (10 << 2), x +    0.879 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   57.177 * s);
			_setf(o + (13 << 2), y +  -71.532 * s);
			_setf(o + (14 << 2), x +   57.177 * s);
			_setf(o + (15 << 2), y +  -62.743 * s);
			_setf(o + (16 << 2), x +   33.398 * s);
			_setf(o + (17 << 2), y +  -62.743 * s);
			_setf(o + (18 << 2), x +   58.056 * s);
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
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    7.324 * s);
			_setf(o + ( 1 << 2), y +  -71.532 * s);
			_setf(o + ( 2 << 2), x +   17.089 * s);
			_setf(o + ( 3 << 2), y +  -71.532 * s);
			_setf(o + ( 4 << 2), x +   17.089 * s);
			_setf(o + ( 5 << 2), y +  -22.558 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   17.089 * s,y +  -22.558 * s,x +   17.089 * s,y +  -18.196 * s,x +   18.473 * s,y +  -14.608 * s,x +   21.240 * s,y +  -11.792 * s, threshold);
			_vr.bezier8(x +   21.240 * s,y +  -11.792 * s,x +   24.007 * s,y +   -8.976 * s,x +   27.669 * s,y +   -7.568 * s,x +   32.226 * s,y +   -7.568 * s, threshold);
			_vr.bezier8(x +   32.226 * s,y +   -7.568 * s,x +   37.043 * s,y +   -7.568 * s,x +   40.836 * s,y +   -8.935 * s,x +   43.603 * s,y +  -11.670 * s, threshold);
			_vr.bezier8(x +   43.603 * s,y +  -11.670 * s,x +   46.370 * s,y +  -14.404 * s,x +   47.753 * s,y +  -18.115 * s,x +   47.753 * s,y +  -22.802 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   47.753 * s);
			_setf(o + ( 1 << 2), y +  -71.532 * s);
			_setf(o + ( 2 << 2), x +   57.519 * s);
			_setf(o + ( 3 << 2), y +  -71.532 * s);
			_setf(o + ( 4 << 2), x +   57.519 * s);
			_setf(o + ( 5 << 2), y +  -21.777 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   57.519 * s,y +  -21.777 * s,x +   57.519 * s,y +  -14.551 * s,x +   55.264 * s,y +   -8.911 * s,x +   50.756 * s,y +   -4.858 * s, threshold);
			_vr.bezier8(x +   50.756 * s,y +   -4.858 * s,x +   46.248 * s,y +   -0.806 * s,x +   40.103 * s,y +    1.221 * s,x +   32.324 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   32.324 * s,y +    1.221 * s,x +   24.316 * s,y +    1.221 * s,x +   18.147 * s,y +   -0.765 * s,x +   13.818 * s,y +   -4.736 * s, threshold);
			_vr.bezier8(x +   13.818 * s,y +   -4.736 * s,x +    9.489 * s,y +   -8.708 * s,x +    7.324 * s,y +  -14.404 * s,x +    7.324 * s,y +  -21.826 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    7.324 * s);
			_setf(o + ( 1 << 2), y +  -71.532 * s);
			_setf(o + ( 2 << 2), x +   64.843 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 86:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +   32.226 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			_setf(o + ( 2 << 2), x +   27.294 * s);
			_setf(o + ( 3 << 2), y +    0.977 * s);
			_setf(o + ( 4 << 2), x +    0.634 * s);
			_setf(o + ( 5 << 2), y +  -71.532 * s);
			_setf(o + ( 6 << 2), x +   11.474 * s);
			_setf(o + ( 7 << 2), y +  -71.532 * s);
			_setf(o + ( 8 << 2), x +   29.882 * s);
			_setf(o + ( 9 << 2), y +  -18.847 * s);
			_setf(o + (10 << 2), x +   47.606 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   58.104 * s);
			_setf(o + (13 << 2), y +  -71.532 * s);
			_setf(o + (14 << 2), x +   32.226 * s);
			_setf(o + (15 << 2), y +    0.977 * s);
			_setf(o + (16 << 2), x +   58.739 * s);
			_setf(o + (17 << 2), y +       0. * s);
			o = _posb(9);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 1);
			
			case 87:
			
			o = _posf(30);
			_setf(o + ( 0 << 2), x +   62.304 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			_setf(o + ( 2 << 2), x +   59.228 * s);
			_setf(o + ( 3 << 2), y +    0.977 * s);
			_setf(o + ( 4 << 2), x +   42.187 * s);
			_setf(o + ( 5 << 2), y +  -48.339 * s);
			_setf(o + ( 6 << 2), x +   26.269 * s);
			_setf(o + ( 7 << 2), y +    0.977 * s);
			_setf(o + ( 8 << 2), x +   23.193 * s);
			_setf(o + ( 9 << 2), y +    0.977 * s);
			_setf(o + (10 << 2), x +    0.635 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   10.791 * s);
			_setf(o + (13 << 2), y +  -71.532 * s);
			_setf(o + (14 << 2), x +   25.146 * s);
			_setf(o + (15 << 2), y +  -21.582 * s);
			_setf(o + (16 << 2), x +   40.869 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   44.286 * s);
			_setf(o + (19 << 2), y +  -71.532 * s);
			_setf(o + (20 << 2), x +   59.814 * s);
			_setf(o + (21 << 2), y +  -21.679 * s);
			_setf(o + (22 << 2), x +   74.413 * s);
			_setf(o + (23 << 2), y +  -71.532 * s);
			_setf(o + (24 << 2), x +   84.569 * s);
			_setf(o + (25 << 2), y +  -71.532 * s);
			_setf(o + (26 << 2), x +   62.304 * s);
			_setf(o + (27 << 2), y +    0.977 * s);
			_setf(o + (28 << 2), x +   85.204 * s);
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
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 1);
			
			case 88:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   44.677 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   26.904 * s);
			_setf(o + ( 3 << 2), y +  -28.710 * s);
			_setf(o + ( 4 << 2), x +   10.498 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    0.635 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   21.728 * s);
			_setf(o + ( 9 << 2), y +  -37.109 * s);
			_setf(o + (10 << 2), x +    2.343 * s);
			_setf(o + (11 << 2), y +  -71.581 * s);
			_setf(o + (12 << 2), x +   11.962 * s);
			_setf(o + (13 << 2), y +  -71.532 * s);
			_setf(o + (14 << 2), x +   27.245 * s);
			_setf(o + (15 << 2), y +  -44.482 * s);
			_setf(o + (16 << 2), x +   44.091 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   53.905 * s);
			_setf(o + (19 << 2), y +  -71.532 * s);
			_setf(o + (20 << 2), x +   31.689 * s);
			_setf(o + (21 << 2), y +  -36.913 * s);
			_setf(o + (22 << 2), x +   55.028 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   44.677 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   55.663 * s);
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
			
			case 89:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +   33.447 * s);
			_setf(o + ( 1 << 2), y +  -32.031 * s);
			_setf(o + ( 2 << 2), x +   33.447 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   23.681 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   23.681 * s);
			_setf(o + ( 7 << 2), y +  -32.031 * s);
			_setf(o + ( 8 << 2), x +    0.635 * s);
			_setf(o + ( 9 << 2), y +  -71.532 * s);
			_setf(o + (10 << 2), x +   10.693 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   28.515 * s);
			_setf(o + (13 << 2), y +  -40.283 * s);
			_setf(o + (14 << 2), x +   46.337 * s);
			_setf(o + (15 << 2), y +  -71.532 * s);
			_setf(o + (16 << 2), x +   56.396 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   33.447 * s);
			_setf(o + (19 << 2), y +  -32.031 * s);
			_setf(o + (20 << 2), x +   57.030 * s);
			_setf(o + (21 << 2), y +       0. * s);
			o = _posb(11);
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
			_setb(o + 10, 1);
			
			case 90:
			
			o = _posf(24);
			_setf(o + ( 0 << 2), x +    4.883 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    4.883 * s);
			_setf(o + ( 3 << 2), y +   -2.441 * s);
			_setf(o + ( 4 << 2), x +   35.644 * s);
			_setf(o + ( 5 << 2), y +  -62.743 * s);
			_setf(o + ( 6 << 2), x +    5.371 * s);
			_setf(o + ( 7 << 2), y +  -62.743 * s);
			_setf(o + ( 8 << 2), x +    5.371 * s);
			_setf(o + ( 9 << 2), y +  -71.532 * s);
			_setf(o + (10 << 2), x +   49.071 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   49.071 * s);
			_setf(o + (13 << 2), y +  -69.091 * s);
			_setf(o + (14 << 2), x +   18.213 * s);
			_setf(o + (15 << 2), y +   -8.789 * s);
			_setf(o + (16 << 2), x +   50.146 * s);
			_setf(o + (17 << 2), y +   -8.789 * s);
			_setf(o + (18 << 2), x +   50.146 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +    4.883 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   55.028 * s);
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
			
			case 91:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +    9.863 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			_setf(o + ( 2 << 2), x +    9.863 * s);
			_setf(o + ( 3 << 2), y +  -73.729 * s);
			_setf(o + ( 4 << 2), x +   32.470 * s);
			_setf(o + ( 5 << 2), y +  -73.729 * s);
			_setf(o + ( 6 << 2), x +   32.470 * s);
			_setf(o + ( 7 << 2), y +  -65.429 * s);
			_setf(o + ( 8 << 2), x +   19.629 * s);
			_setf(o + ( 9 << 2), y +  -65.429 * s);
			_setf(o + (10 << 2), x +   19.629 * s);
			_setf(o + (11 << 2), y +   12.207 * s);
			_setf(o + (12 << 2), x +   32.470 * s);
			_setf(o + (13 << 2), y +   12.207 * s);
			_setf(o + (14 << 2), x +   32.470 * s);
			_setf(o + (15 << 2), y +   20.508 * s);
			_setf(o + (16 << 2), x +    9.863 * s);
			_setf(o + (17 << 2), y +   20.508 * s);
			_setf(o + (18 << 2), x +   36.719 * s);
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
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   24.999 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   -0.147 * s);
			_setf(o + ( 3 << 2), y +  -71.825 * s);
			_setf(o + ( 4 << 2), x +    6.787 * s);
			_setf(o + ( 5 << 2), y +  -71.825 * s);
			_setf(o + ( 6 << 2), x +   31.982 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   24.999 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   35.546 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 93:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +   26.855 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			_setf(o + ( 2 << 2), x +    4.248 * s);
			_setf(o + ( 3 << 2), y +   20.508 * s);
			_setf(o + ( 4 << 2), x +    4.248 * s);
			_setf(o + ( 5 << 2), y +   12.207 * s);
			_setf(o + ( 6 << 2), x +   17.090 * s);
			_setf(o + ( 7 << 2), y +   12.207 * s);
			_setf(o + ( 8 << 2), x +   17.090 * s);
			_setf(o + ( 9 << 2), y +  -65.429 * s);
			_setf(o + (10 << 2), x +    4.248 * s);
			_setf(o + (11 << 2), y +  -65.429 * s);
			_setf(o + (12 << 2), x +    4.248 * s);
			_setf(o + (13 << 2), y +  -73.729 * s);
			_setf(o + (14 << 2), x +   26.855 * s);
			_setf(o + (15 << 2), y +  -73.729 * s);
			_setf(o + (16 << 2), x +   26.855 * s);
			_setf(o + (17 << 2), y +   20.508 * s);
			_setf(o + (18 << 2), x +   36.718 * s);
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
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +   37.255 * s);
			_setf(o + ( 1 << 2), y +  -44.286 * s);
			_setf(o + ( 2 << 2), x +   25.342 * s);
			_setf(o + ( 3 << 2), y +  -66.161 * s);
			_setf(o + ( 4 << 2), x +   13.232 * s);
			_setf(o + ( 5 << 2), y +  -44.091 * s);
			_setf(o + ( 6 << 2), x +    7.275 * s);
			_setf(o + ( 7 << 2), y +  -44.091 * s);
			_setf(o + ( 8 << 2), x +   22.803 * s);
			_setf(o + ( 9 << 2), y +  -71.825 * s);
			_setf(o + (10 << 2), x +   28.027 * s);
			_setf(o + (11 << 2), y +  -71.825 * s);
			_setf(o + (12 << 2), x +   43.456 * s);
			_setf(o + (13 << 2), y +  -44.286 * s);
			_setf(o + (14 << 2), x +   37.255 * s);
			_setf(o + (15 << 2), y +  -44.286 * s);
			_setf(o + (16 << 2), x +   52.441 * s);
			_setf(o + (17 << 2), y +       0. * s);
			o = _posb(9);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 1);
			
			case 95:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   -0.391 * s);
			_setf(o + ( 1 << 2), y +   12.402 * s);
			_setf(o + ( 2 << 2), x +   -0.391 * s);
			_setf(o + ( 3 << 2), y +    6.103 * s);
			_setf(o + ( 4 << 2), x +   52.587 * s);
			_setf(o + ( 5 << 2), y +    6.103 * s);
			_setf(o + ( 6 << 2), x +   52.587 * s);
			_setf(o + ( 7 << 2), y +   12.402 * s);
			_setf(o + ( 8 << 2), x +   -0.391 * s);
			_setf(o + ( 9 << 2), y +   12.402 * s);
			_setf(o + (10 << 2), x +   52.440 * s);
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
			_setf(o + ( 0 << 2), x +   27.295 * s);
			_setf(o + ( 1 << 2), y +  -62.743 * s);
			_setf(o + ( 2 << 2), x +   16.260 * s);
			_setf(o + ( 3 << 2), y +  -79.003 * s);
			_setf(o + ( 4 << 2), x +   25.879 * s);
			_setf(o + ( 5 << 2), y +  -79.003 * s);
			_setf(o + ( 6 << 2), x +   34.131 * s);
			_setf(o + ( 7 << 2), y +  -62.743 * s);
			_setf(o + ( 8 << 2), x +   27.295 * s);
			_setf(o + ( 9 << 2), y +  -62.743 * s);
			_setf(o + (10 << 2), x +   52.441 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 97:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.132 * s);
			_setf(o + ( 1 << 2), y +   -6.006 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   36.132 * s,y +   -6.006 * s,x +   32.421 * s,y +   -1.351 * s,x +   26.741 * s,y +    0.977 * s,x +   19.091 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   19.091 * s,y +    0.977 * s,x +   14.990 * s,y +    0.977 * s,x +   11.434 * s,y +   -0.513 * s,x +    8.423 * s,y +   -3.491 * s, threshold);
			_vr.bezier8(x +    8.423 * s,y +   -3.491 * s,x +    5.412 * s,y +   -6.470 * s,x +    3.906 * s,y +  -10.172 * s,x +    3.906 * s,y +  -14.599 * s, threshold);
			_vr.bezier8(x +    3.906 * s,y +  -14.599 * s,x +    3.906 * s,y +  -19.905 * s,x +    6.225 * s,y +  -24.389 * s,x +   10.864 * s,y +  -28.051 * s, threshold);
			_vr.bezier8(x +   10.864 * s,y +  -28.051 * s,x +   15.503 * s,y +  -31.713 * s,x +   21.419 * s,y +  -33.544 * s,x +   28.613 * s,y +  -33.544 * s, threshold);
			_vr.bezier8(x +   28.613 * s,y +  -33.544 * s,x +   30.566 * s,y +  -33.544 * s,x +   32.779 * s,y +  -33.121 * s,x +   35.253 * s,y +  -32.275 * s, threshold);
			_vr.bezier8(x +   35.253 * s,y +  -32.275 * s,x +   35.253 * s,y +  -40.738 * s,x +   31.477 * s,y +  -44.970 * s,x +   23.925 * s,y +  -44.970 * s, threshold);
			_vr.bezier8(x +   23.925 * s,y +  -44.970 * s,x +   18.131 * s,y +  -44.970 * s,x +   13.672 * s,y +  -43.407 * s,x +   10.547 * s,y +  -40.283 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    6.640 * s);
			_setf(o + ( 1 << 2), y +  -48.046 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    6.640 * s,y +  -48.046 * s,x +    8.398 * s,y +  -49.478 * s,x +   10.831 * s,y +  -50.707 * s,x +   13.940 * s,y +  -51.733 * s, threshold);
			_vr.bezier8(x +   13.940 * s,y +  -51.733 * s,x +   17.049 * s,y +  -52.758 * s,x +   20.019 * s,y +  -53.271 * s,x +   22.851 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   22.851 * s,y +  -53.271 * s,x +   30.436 * s,y +  -53.271 * s,x +   35.945 * s,y +  -51.545 * s,x +   39.379 * s,y +  -48.095 * s, threshold);
			_vr.bezier8(x +   39.379 * s,y +  -48.095 * s,x +   42.813 * s,y +  -44.644 * s,x +   44.530 * s,y +  -39.159 * s,x +   44.530 * s,y +  -31.640 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   44.530 * s);
			_setf(o + ( 1 << 2), y +  -12.890 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   44.530 * s,y +  -12.890 * s,x +   44.530 * s,y +   -8.301 * s,x +   45.898 * s,y +   -5.241 * s,x +   48.632 * s,y +   -3.711 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   48.632 * s);
			_setf(o + ( 1 << 2), y +    0.928 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   48.632 * s,y +    0.928 * s,x +   44.856 * s,y +    0.928 * s,x +   42.032 * s,y +    0.391 * s,x +   40.160 * s,y +   -0.684 * s, threshold);
			_vr.bezier8(x +   40.160 * s,y +   -0.684 * s,x +   38.289 * s,y +   -1.758 * s,x +   36.946 * s,y +   -3.532 * s,x +   36.132 * s,y +   -6.006 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   35.253 * s);
			_setf(o + ( 1 << 2), y +  -25.683 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   35.253 * s,y +  -25.683 * s,x +   32.324 * s,y +  -26.334 * s,x +   30.273 * s,y +  -26.660 * s,x +   29.101 * s,y +  -26.660 * s, threshold);
			_vr.bezier8(x +   29.101 * s,y +  -26.660 * s,x +   24.414 * s,y +  -26.660 * s,x +   20.589 * s,y +  -25.455 * s,x +   17.627 * s,y +  -23.046 * s, threshold);
			_vr.bezier8(x +   17.627 * s,y +  -23.046 * s,x +   14.664 * s,y +  -20.638 * s,x +   13.183 * s,y +  -17.789 * s,x +   13.183 * s,y +  -14.502 * s, threshold);
			_vr.bezier8(x +   13.183 * s,y +  -14.502 * s,x +   13.183 * s,y +   -9.066 * s,x +   16.390 * s,y +   -6.347 * s,x +   22.802 * s,y +   -6.347 * s, threshold);
			_vr.bezier8(x +   22.802 * s,y +   -6.347 * s,x +   27.490 * s,y +   -6.347 * s,x +   31.640 * s,y +   -8.577 * s,x +   35.253 * s,y +  -13.037 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   35.253 * s);
			_setf(o + ( 1 << 2), y +  -25.683 * s);
			_setf(o + ( 2 << 2), x +   52.538 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 98:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   14.502 * s);
			_setf(o + ( 1 << 2), y +   -3.760 * s);
			_setf(o + ( 2 << 2), x +   11.230 * s);
			_setf(o + ( 3 << 2), y +    0.977 * s);
			_setf(o + ( 4 << 2), x +    6.592 * s);
			_setf(o + ( 5 << 2), y +    0.977 * s);
			_setf(o + ( 6 << 2), x +    6.592 * s);
			_setf(o + ( 7 << 2), y +  -73.729 * s);
			_setf(o + ( 8 << 2), x +   15.869 * s);
			_setf(o + ( 9 << 2), y +  -73.729 * s);
			_setf(o + (10 << 2), x +   15.869 * s);
			_setf(o + (11 << 2), y +  -48.437 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_vr.bezier8(x +   15.869 * s,y +  -48.437 * s,x +   16.748 * s,y +  -49.641 * s,x +   18.400 * s,y +  -50.748 * s,x +   20.825 * s,y +  -51.757 * s, threshold);
			_vr.bezier8(x +   20.825 * s,y +  -51.757 * s,x +   23.250 * s,y +  -52.766 * s,x +   25.634 * s,y +  -53.271 * s,x +   27.978 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   27.978 * s,y +  -53.271 * s,x +   35.140 * s,y +  -53.271 * s,x +   40.942 * s,y +  -50.797 * s,x +   45.385 * s,y +  -45.849 * s, threshold);
			_vr.bezier8(x +   45.385 * s,y +  -45.849 * s,x +   49.829 * s,y +  -40.901 * s,x +   52.050 * s,y +  -34.651 * s,x +   52.050 * s,y +  -27.099 * s, threshold);
			_vr.bezier8(x +   52.050 * s,y +  -27.099 * s,x +   52.050 * s,y +  -18.375 * s,x +   49.820 * s,y +  -11.515 * s,x +   45.361 * s,y +   -6.518 * s, threshold);
			_vr.bezier8(x +   45.361 * s,y +   -6.518 * s,x +   40.901 * s,y +   -1.522 * s,x +   34.863 * s,y +    0.977 * s,x +   27.246 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   27.246 * s,y +    0.977 * s,x +   24.772 * s,y +    0.977 * s,x +   22.339 * s,y +    0.513 * s,x +   19.946 * s,y +   -0.415 * s, threshold);
			_vr.bezier8(x +   19.946 * s,y +   -0.415 * s,x +   17.554 * s,y +   -1.343 * s,x +   15.739 * s,y +   -2.458 * s,x +   14.502 * s,y +   -3.760 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   15.869 * s);
			_setf(o + ( 1 << 2), y +  -41.357 * s);
			_setf(o + ( 2 << 2), x +   15.869 * s);
			_setf(o + ( 3 << 2), y +  -11.181 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   15.869 * s,y +  -11.181 * s,x +   15.869 * s,y +  -10.661 * s,x +   17.025 * s,y +   -9.806 * s,x +   19.336 * s,y +   -8.618 * s, threshold);
			_vr.bezier8(x +   19.336 * s,y +   -8.618 * s,x +   21.647 * s,y +   -7.430 * s,x +   23.405 * s,y +   -6.836 * s,x +   24.609 * s,y +   -6.836 * s, threshold);
			_vr.bezier8(x +   24.609 * s,y +   -6.836 * s,x +   30.924 * s,y +   -6.836 * s,x +   35.449 * s,y +   -8.349 * s,x +   38.183 * s,y +  -11.377 * s, threshold);
			_vr.bezier8(x +   38.183 * s,y +  -11.377 * s,x +   40.918 * s,y +  -14.404 * s,x +   42.285 * s,y +  -19.482 * s,x +   42.285 * s,y +  -26.611 * s, threshold);
			_vr.bezier8(x +   42.285 * s,y +  -26.611 * s,x +   42.285 * s,y +  -32.535 * s,x +   40.690 * s,y +  -37.158 * s,x +   37.500 * s,y +  -40.478 * s, threshold);
			_vr.bezier8(x +   37.500 * s,y +  -40.478 * s,x +   34.310 * s,y +  -43.798 * s,x +   30.013 * s,y +  -45.458 * s,x +   24.609 * s,y +  -45.458 * s, threshold);
			_vr.bezier8(x +   24.609 * s,y +  -45.458 * s,x +   23.470 * s,y +  -45.458 * s,x +   21.883 * s,y +  -44.970 * s,x +   19.849 * s,y +  -43.993 * s, threshold);
			_vr.bezier8(x +   19.849 * s,y +  -43.993 * s,x +   17.814 * s,y +  -43.017 * s,x +   16.488 * s,y +  -42.138 * s,x +   15.869 * s,y +  -41.357 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   55.712 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 99:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   46.044 * s);
			_setf(o + ( 1 << 2), y +  -48.046 * s);
			_setf(o + ( 2 << 2), x +   41.455 * s);
			_setf(o + ( 3 << 2), y +  -41.503 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   41.455 * s,y +  -41.503 * s,x +   40.511 * s,y +  -42.447 * s,x +   38.842 * s,y +  -43.342 * s,x +   36.450 * s,y +  -44.189 * s, threshold);
			_vr.bezier8(x +   36.450 * s,y +  -44.189 * s,x +   34.057 * s,y +  -45.035 * s,x +   31.705 * s,y +  -45.458 * s,x +   29.394 * s,y +  -45.458 * s, threshold);
			_vr.bezier8(x +   29.394 * s,y +  -45.458 * s,x +   24.349 * s,y +  -45.458 * s,x +   20.345 * s,y +  -43.692 * s,x +   17.383 * s,y +  -40.160 * s, threshold);
			_vr.bezier8(x +   17.383 * s,y +  -40.160 * s,x +   14.421 * s,y +  -36.629 * s,x +   12.939 * s,y +  -31.787 * s,x +   12.939 * s,y +  -25.634 * s, threshold);
			_vr.bezier8(x +   12.939 * s,y +  -25.634 * s,x +   12.939 * s,y +  -19.515 * s,x +   14.453 * s,y +  -14.852 * s,x +   17.480 * s,y +  -11.645 * s, threshold);
			_vr.bezier8(x +   17.480 * s,y +  -11.645 * s,x +   20.508 * s,y +   -8.439 * s,x +   24.707 * s,y +   -6.836 * s,x +   30.078 * s,y +   -6.836 * s, threshold);
			_vr.bezier8(x +   30.078 * s,y +   -6.836 * s,x +   34.245 * s,y +   -6.836 * s,x +   38.444 * s,y +   -8.447 * s,x +   42.675 * s,y +  -11.670 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   46.337 * s);
			_setf(o + ( 1 << 2), y +   -3.857 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   46.337 * s,y +   -3.857 * s,x +   41.357 * s,y +   -0.635 * s,x +   35.189 * s,y +    0.977 * s,x +   27.832 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   27.832 * s,y +    0.977 * s,x +   20.703 * s,y +    0.977 * s,x +   14.811 * s,y +   -1.416 * s,x +   10.156 * s,y +   -6.201 * s, threshold);
			_vr.bezier8(x +   10.156 * s,y +   -6.201 * s,x +    5.501 * s,y +  -10.986 * s,x +    3.174 * s,y +  -17.464 * s,x +    3.174 * s,y +  -25.634 * s, threshold);
			_vr.bezier8(x +    3.174 * s,y +  -25.634 * s,x +    3.174 * s,y +  -33.967 * s,x +    5.591 * s,y +  -40.657 * s,x +   10.425 * s,y +  -45.702 * s, threshold);
			_vr.bezier8(x +   10.425 * s,y +  -45.702 * s,x +   15.259 * s,y +  -50.748 * s,x +   21.875 * s,y +  -53.271 * s,x +   30.273 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   30.273 * s,y +  -53.271 * s,x +   32.975 * s,y +  -53.271 * s,x +   35.905 * s,y +  -52.701 * s,x +   39.062 * s,y +  -51.562 * s, threshold);
			_vr.bezier8(x +   39.062 * s,y +  -51.562 * s,x +   42.220 * s,y +  -50.422 * s,x +   44.547 * s,y +  -49.250 * s,x +   46.044 * s,y +  -48.046 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   49.511 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 100:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   39.746 * s);
			_setf(o + ( 1 << 2), y +   -0.049 * s);
			_setf(o + ( 2 << 2), x +   39.746 * s);
			_setf(o + ( 3 << 2), y +   -3.906 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   39.746 * s,y +   -3.906 * s,x +   36.523 * s,y +   -0.684 * s,x +   31.835 * s,y +    0.928 * s,x +   25.683 * s,y +    0.928 * s, threshold);
			_vr.bezier8(x +   25.683 * s,y +    0.928 * s,x +   19.140 * s,y +    0.928 * s,x +   13.834 * s,y +   -1.416 * s,x +    9.765 * s,y +   -6.103 * s, threshold);
			_vr.bezier8(x +    9.765 * s,y +   -6.103 * s,x +    5.696 * s,y +  -10.791 * s,x +    3.662 * s,y +  -17.040 * s,x +    3.662 * s,y +  -24.853 * s, threshold);
			_vr.bezier8(x +    3.662 * s,y +  -24.853 * s,x +    3.662 * s,y +  -32.698 * s,x +    6.006 * s,y +  -39.396 * s,x +   10.693 * s,y +  -44.946 * s, threshold);
			_vr.bezier8(x +   10.693 * s,y +  -44.946 * s,x +   15.381 * s,y +  -50.496 * s,x +   20.963 * s,y +  -53.271 * s,x +   27.441 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   27.441 * s,y +  -53.271 * s,x +   32.844 * s,y +  -53.271 * s,x +   36.946 * s,y +  -52.001 * s,x +   39.746 * s,y +  -49.462 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   39.746 * s);
			_setf(o + ( 1 << 2), y +  -73.729 * s);
			_setf(o + ( 2 << 2), x +   49.023 * s);
			_setf(o + ( 3 << 2), y +  -73.729 * s);
			_setf(o + ( 4 << 2), x +   49.023 * s);
			_setf(o + ( 5 << 2), y +   -0.049 * s);
			_setf(o + ( 6 << 2), x +   39.746 * s);
			_setf(o + ( 7 << 2), y +   -0.049 * s);
			_setf(o + ( 8 << 2), x +   39.746 * s);
			_setf(o + ( 9 << 2), y +  -40.185 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 1);
			_vr.bezier8(x +   39.746 * s,y +  -40.185 * s,x +   37.402 * s,y +  -43.700 * s,x +   34.196 * s,y +  -45.458 * s,x +   30.127 * s,y +  -45.458 * s, threshold);
			_vr.bezier8(x +   30.127 * s,y +  -45.458 * s,x +   25.146 * s,y +  -45.458 * s,x +   21.118 * s,y +  -43.603 * s,x +   18.042 * s,y +  -39.892 * s, threshold);
			_vr.bezier8(x +   18.042 * s,y +  -39.892 * s,x +   14.966 * s,y +  -36.181 * s,x +   13.427 * s,y +  -31.461 * s,x +   13.427 * s,y +  -25.732 * s, threshold);
			_vr.bezier8(x +   13.427 * s,y +  -25.732 * s,x +   13.427 * s,y +  -13.134 * s,x +   19.157 * s,y +   -6.836 * s,x +   30.615 * s,y +   -6.836 * s, threshold);
			_vr.bezier8(x +   30.615 * s,y +   -6.836 * s,x +   32.080 * s,y +   -6.836 * s,x +   33.837 * s,y +   -7.300 * s,x +   35.888 * s,y +   -8.227 * s, threshold);
			_vr.bezier8(x +   35.888 * s,y +   -8.227 * s,x +   37.939 * s,y +   -9.155 * s,x +   39.225 * s,y +  -10.140 * s,x +   39.746 * s,y +  -11.181 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   39.746 * s);
			_setf(o + ( 1 << 2), y +  -40.185 * s);
			_setf(o + ( 2 << 2), x +   55.712 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 101:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   50.634 * s);
			_setf(o + ( 1 << 2), y +  -25.244 * s);
			_setf(o + ( 2 << 2), x +   12.939 * s);
			_setf(o + ( 3 << 2), y +  -25.244 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   12.939 * s,y +  -25.244 * s,x +   12.939 * s,y +  -19.124 * s,x +   14.605 * s,y +  -14.409 * s,x +   17.968 * s,y +  -11.133 * s, threshold);
			_vr.bezier8(x +   17.968 * s,y +  -11.133 * s,x +   20.920 * s,y +   -8.257 * s,x +   24.740 * s,y +   -6.836 * s,x +   29.394 * s,y +   -6.836 * s, threshold);
			_vr.bezier8(x +   29.394 * s,y +   -6.836 * s,x +   34.700 * s,y +   -6.836 * s,x +   39.127 * s,y +   -8.382 * s,x +   42.675 * s,y +  -11.474 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   46.581 * s);
			_setf(o + ( 1 << 2), y +   -4.785 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   46.581 * s,y +   -4.785 * s,x +   45.149 * s,y +   -3.353 * s,x +   42.943 * s,y +   -2.140 * s,x +   39.990 * s,y +   -1.074 * s, threshold);
			_vr.bezier8(x +   39.990 * s,y +   -1.074 * s,x +   36.270 * s,y +    0.269 * s,x +   32.144 * s,y +    0.977 * s,x +   27.588 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   27.588 * s,y +    0.977 * s,x +   21.012 * s,y +    0.977 * s,x +   15.441 * s,y +   -1.265 * s,x +   10.840 * s,y +   -5.713 * s, threshold);
			_vr.bezier8(x +   10.840 * s,y +   -5.713 * s,x +    5.741 * s,y +  -10.640 * s,x +    3.174 * s,y +  -17.236 * s,x +    3.174 * s,y +  -25.537 * s, threshold);
			_vr.bezier8(x +    3.174 * s,y +  -25.537 * s,x +    3.174 * s,y +  -34.163 * s,x +    5.793 * s,y +  -41.081 * s,x +   11.035 * s,y +  -46.288 * s, threshold);
			_vr.bezier8(x +   11.035 * s,y +  -46.288 * s,x +   15.722 * s,y +  -50.944 * s,x +   21.273 * s,y +  -53.271 * s,x +   27.685 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   27.685 * s,y +  -53.271 * s,x +   35.139 * s,y +  -53.271 * s,x +   40.974 * s,y +  -51.162 * s,x +   45.214 * s,y +  -46.972 * s, threshold);
			_vr.bezier8(x +   45.214 * s,y +  -46.972 * s,x +   49.307 * s,y +  -42.927 * s,x +   51.366 * s,y +  -37.581 * s,x +   51.366 * s,y +  -30.908 * s, threshold);
			_vr.bezier8(x +   51.366 * s,y +  -30.908 * s,x +   51.366 * s,y +  -28.857 * s,x +   51.122 * s,y +  -26.969 * s,x +   50.634 * s,y +  -25.244 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   28.125 * s);
			_setf(o + ( 1 << 2), y +  -45.458 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   28.125 * s,y +  -45.458 * s,x +   23.990 * s,y +  -45.458 * s,x +   20.525 * s,y +  -44.122 * s,x +   17.724 * s,y +  -41.454 * s, threshold);
			_vr.bezier8(x +   17.724 * s,y +  -41.454 * s,x +   15.057 * s,y +  -38.914 * s,x +   13.541 * s,y +  -35.758 * s,x +   13.183 * s,y +  -31.982 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   42.138 * s);
			_setf(o + ( 1 << 2), y +  -31.982 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   42.138 * s,y +  -31.982 * s,x +   42.138 * s,y +  -35.725 * s,x +   40.970 * s,y +  -38.854 * s,x +   38.622 * s,y +  -41.357 * s, threshold);
			_vr.bezier8(x +   38.622 * s,y +  -41.357 * s,x +   36.055 * s,y +  -44.095 * s,x +   32.552 * s,y +  -45.458 * s,x +   28.125 * s,y +  -45.458 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   54.540 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 102:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   34.863 * s);
			_setf(o + ( 1 << 2), y +  -65.429 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   34.863 * s,y +  -65.429 * s,x +   32.975 * s,y +  -66.080 * s,x +   31.217 * s,y +  -66.405 * s,x +   29.590 * s,y +  -66.405 * s, threshold);
			_vr.bezier8(x +   29.590 * s,y +  -66.405 * s,x +   26.757 * s,y +  -66.405 * s,x +   24.422 * s,y +  -65.331 * s,x +   22.583 * s,y +  -63.183 * s, threshold);
			_vr.bezier8(x +   22.583 * s,y +  -63.183 * s,x +   20.744 * s,y +  -61.034 * s,x +   19.824 * s,y +  -58.316 * s,x +   19.824 * s,y +  -55.028 * s, threshold);
			_vr.bezier8(x +   19.824 * s,y +  -55.028 * s,x +   19.824 * s,y +  -54.149 * s,x +   19.905 * s,y +  -53.238 * s,x +   20.068 * s,y +  -52.294 * s, threshold);
			o = _posf(18);
			_setf(o + ( 0 << 2), x +   30.713 * s);
			_setf(o + ( 1 << 2), y +  -52.294 * s);
			_setf(o + ( 2 << 2), x +   30.713 * s);
			_setf(o + ( 3 << 2), y +  -44.482 * s);
			_setf(o + ( 4 << 2), x +   20.068 * s);
			_setf(o + ( 5 << 2), y +  -44.482 * s);
			_setf(o + ( 6 << 2), x +   20.068 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   10.791 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   10.791 * s);
			_setf(o + (11 << 2), y +  -44.482 * s);
			_setf(o + (12 << 2), x +    3.174 * s);
			_setf(o + (13 << 2), y +  -44.482 * s);
			_setf(o + (14 << 2), x +    3.174 * s);
			_setf(o + (15 << 2), y +  -52.294 * s);
			_setf(o + (16 << 2), x +   10.791 * s);
			_setf(o + (17 << 2), y +  -52.294 * s);
			o = _posb(9);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_vr.bezier8(x +   10.791 * s,y +  -52.294 * s,x +   10.791 * s,y +  -58.967 * s,x +   12.435 * s,y +  -64.208 * s,x +   15.723 * s,y +  -68.016 * s, threshold);
			_vr.bezier8(x +   15.723 * s,y +  -68.016 * s,x +   19.010 * s,y +  -71.825 * s,x +   23.356 * s,y +  -73.729 * s,x +   28.760 * s,y +  -73.729 * s, threshold);
			_vr.bezier8(x +   28.760 * s,y +  -73.729 * s,x +   31.461 * s,y +  -73.729 * s,x +   34.358 * s,y +  -73.241 * s,x +   37.451 * s,y +  -72.265 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   34.863 * s);
			_setf(o + ( 1 << 2), y +  -65.429 * s);
			_setf(o + ( 2 << 2), x +   36.963 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 103:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    4.687 * s);
			_setf(o + ( 1 << 2), y +   14.306 * s);
			_setf(o + ( 2 << 2), x +    9.716 * s);
			_setf(o + ( 3 << 2), y +    6.885 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    9.716 * s,y +    6.885 * s,x +   15.120 * s,y +   10.498 * s,x +   20.100 * s,y +   12.305 * s,x +   24.657 * s,y +   12.305 * s, threshold);
			_vr.bezier8(x +   24.657 * s,y +   12.305 * s,x +   28.857 * s,y +   12.305 * s,x +   32.169 * s,y +   11.580 * s,x +   34.594 * s,y +   10.132 * s, threshold);
			_vr.bezier8(x +   34.594 * s,y +   10.132 * s,x +   37.019 * s,y +    8.683 * s,x +   38.231 * s,y +    6.885 * s,x +   38.231 * s,y +    4.736 * s, threshold);
			_vr.bezier8(x +   38.231 * s,y +    4.736 * s,x +   38.231 * s,y +    0.505 * s,x +   35.171 * s,y +   -1.611 * s,x +   29.052 * s,y +   -1.611 * s, threshold);
			_vr.bezier8(x +   29.052 * s,y +   -1.611 * s,x +   28.010 * s,y +   -1.611 * s,x +   26.122 * s,y +   -1.351 * s,x +   23.388 * s,y +   -0.830 * s, threshold);
			_vr.bezier8(x +   23.388 * s,y +   -0.830 * s,x +   20.654 * s,y +   -0.309 * s,x +   18.521 * s,y +   -0.049 * s,x +   16.991 * s,y +   -0.049 * s, threshold);
			_vr.bezier8(x +   16.991 * s,y +   -0.049 * s,x +    9.569 * s,y +   -0.049 * s,x +    5.859 * s,y +   -2.848 * s,x +    5.859 * s,y +   -8.447 * s, threshold);
			_vr.bezier8(x +    5.859 * s,y +   -8.447 * s,x +    5.859 * s,y +  -10.172 * s,x +    6.730 * s,y +  -11.735 * s,x +    8.471 * s,y +  -13.135 * s, threshold);
			_vr.bezier8(x +    8.471 * s,y +  -13.135 * s,x +   10.213 * s,y +  -14.534 * s,x +   12.369 * s,y +  -15.543 * s,x +   14.941 * s,y +  -16.162 * s, threshold);
			_vr.bezier8(x +   14.941 * s,y +  -16.162 * s,x +    7.584 * s,y +  -19.612 * s,x +    3.906 * s,y +  -25.602 * s,x +    3.906 * s,y +  -34.130 * s, threshold);
			_vr.bezier8(x +    3.906 * s,y +  -34.130 * s,x +    3.906 * s,y +  -39.599 * s,x +    5.810 * s,y +  -44.156 * s,x +    9.619 * s,y +  -47.802 * s, threshold);
			_vr.bezier8(x +    9.619 * s,y +  -47.802 * s,x +   13.427 * s,y +  -51.448 * s,x +   18.131 * s,y +  -53.271 * s,x +   23.730 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   23.730 * s,y +  -53.271 * s,x +   28.873 * s,y +  -53.271 * s,x +   32.893 * s,y +  -52.213 * s,x +   35.790 * s,y +  -50.097 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   40.429 * s);
			_setf(o + ( 1 << 2), y +  -55.663 * s);
			_setf(o + ( 2 << 2), x +   46.483 * s);
			_setf(o + ( 3 << 2), y +  -49.950 * s);
			_setf(o + ( 4 << 2), x +   40.917 * s);
			_setf(o + ( 5 << 2), y +  -45.751 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   40.917 * s,y +  -45.751 * s,x +   43.293 * s,y +  -42.659 * s,x +   44.481 * s,y +  -38.622 * s,x +   44.481 * s,y +  -33.642 * s, threshold);
			_vr.bezier8(x +   44.481 * s,y +  -33.642 * s,x +   44.481 * s,y +  -28.369 * s,x +   42.837 * s,y +  -23.942 * s,x +   39.550 * s,y +  -20.361 * s, threshold);
			_vr.bezier8(x +   39.550 * s,y +  -20.361 * s,x +   36.262 * s,y +  -16.780 * s,x +   31.946 * s,y +  -14.752 * s,x +   26.610 * s,y +  -14.209 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   18.945 * s);
			_setf(o + ( 1 << 2), y +  -13.428 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   18.945 * s,y +  -13.428 * s,x +   18.033 * s,y +  -13.335 * s,x +   16.812 * s,y +  -12.980 * s,x +   15.282 * s,y +  -12.378 * s, threshold);
			_vr.bezier8(x +   15.282 * s,y +  -12.378 * s,x +   13.753 * s,y +  -11.775 * s,x +   12.988 * s,y +  -10.986 * s,x +   12.988 * s,y +  -10.010 * s, threshold);
			_vr.bezier8(x +   12.988 * s,y +  -10.010 * s,x +   12.988 * s,y +   -8.675 * s,x +   14.583 * s,y +   -8.008 * s,x +   17.773 * s,y +   -8.008 * s, threshold);
			_vr.bezier8(x +   17.773 * s,y +   -8.008 * s,x +   19.172 * s,y +   -8.008 * s,x +   21.353 * s,y +   -8.260 * s,x +   24.316 * s,y +   -8.764 * s, threshold);
			_vr.bezier8(x +   24.316 * s,y +   -8.764 * s,x +   27.278 * s,y +   -9.269 * s,x +   29.475 * s,y +   -9.521 * s,x +   30.907 * s,y +   -9.521 * s, threshold);
			_vr.bezier8(x +   30.907 * s,y +   -9.521 * s,x +   36.050 * s,y +   -9.521 * s,x +   40.062 * s,y +   -8.292 * s,x +   42.943 * s,y +   -5.835 * s, threshold);
			_vr.bezier8(x +   42.943 * s,y +   -5.835 * s,x +   45.824 * s,y +   -3.377 * s,x +   47.264 * s,y +    0.033 * s,x +   47.264 * s,y +    4.395 * s, threshold);
			_vr.bezier8(x +   47.264 * s,y +    4.395 * s,x +   47.264 * s,y +    9.212 * s,x +   45.108 * s,y +   13.102 * s,x +   40.795 * s,y +   16.064 * s, threshold);
			_vr.bezier8(x +   40.795 * s,y +   16.064 * s,x +   36.482 * s,y +   19.026 * s,x +   31.021 * s,y +   20.508 * s,x +   24.413 * s,y +   20.508 * s, threshold);
			_vr.bezier8(x +   24.413 * s,y +   20.508 * s,x +   21.028 * s,y +   20.508 * s,x +   17.463 * s,y +   19.905 * s,x +   13.720 * s,y +   18.701 * s, threshold);
			_vr.bezier8(x +   13.720 * s,y +   18.701 * s,x +    9.977 * s,y +   17.497 * s,x +    6.966 * s,y +   16.032 * s,x +    4.687 * s,y +   14.306 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   24.364 * s);
			_setf(o + ( 1 << 2), y +  -45.800 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   24.364 * s,y +  -45.800 * s,x +   21.142 * s,y +  -45.800 * s,x +   18.513 * s,y +  -44.661 * s,x +   16.479 * s,y +  -42.382 * s, threshold);
			_vr.bezier8(x +   16.479 * s,y +  -42.382 * s,x +   14.444 * s,y +  -40.103 * s,x +   13.427 * s,y +  -37.337 * s,x +   13.427 * s,y +  -34.081 * s, threshold);
			_vr.bezier8(x +   13.427 * s,y +  -34.081 * s,x +   13.427 * s,y +  -30.436 * s,x +   14.412 * s,y +  -27.417 * s,x +   16.381 * s,y +  -25.024 * s, threshold);
			_vr.bezier8(x +   16.381 * s,y +  -25.024 * s,x +   18.350 * s,y +  -22.631 * s,x +   21.012 * s,y +  -21.435 * s,x +   24.364 * s,y +  -21.435 * s, threshold);
			_vr.bezier8(x +   24.364 * s,y +  -21.435 * s,x +   27.652 * s,y +  -21.435 * s,x +   30.224 * s,y +  -22.599 * s,x +   32.079 * s,y +  -24.926 * s, threshold);
			_vr.bezier8(x +   32.079 * s,y +  -24.926 * s,x +   33.935 * s,y +  -27.254 * s,x +   34.862 * s,y +  -30.306 * s,x +   34.862 * s,y +  -34.081 * s, threshold);
			_vr.bezier8(x +   34.862 * s,y +  -34.081 * s,x +   34.862 * s,y +  -37.336 * s,x +   33.861 * s,y +  -40.103 * s,x +   31.859 * s,y +  -42.382 * s, threshold);
			_vr.bezier8(x +   31.859 * s,y +  -42.382 * s,x +   29.857 * s,y +  -44.661 * s,x +   27.359 * s,y +  -45.800 * s,x +   24.364 * s,y +  -45.800 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   50.194 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 104:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   38.818 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   38.818 * s);
			_setf(o + ( 3 << 2), y +  -32.861 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   38.818 * s,y +  -32.861 * s,x +   38.818 * s,y +  -36.767 * s,x +   37.858 * s,y +  -39.843 * s,x +   35.937 * s,y +  -42.089 * s, threshold);
			_vr.bezier8(x +   35.937 * s,y +  -42.089 * s,x +   34.016 * s,y +  -44.335 * s,x +   31.315 * s,y +  -45.458 * s,x +   27.832 * s,y +  -45.458 * s, threshold);
			_vr.bezier8(x +   27.832 * s,y +  -45.458 * s,x +   25.586 * s,y +  -45.458 * s,x +   23.331 * s,y +  -44.799 * s,x +   21.069 * s,y +  -43.481 * s, threshold);
			_vr.bezier8(x +   21.069 * s,y +  -43.481 * s,x +   18.807 * s,y +  -42.162 * s,x +   17.073 * s,y +  -40.624 * s,x +   15.869 * s,y +  -38.867 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   15.869 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    6.592 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    6.592 * s);
			_setf(o + ( 5 << 2), y +  -73.729 * s);
			_setf(o + ( 6 << 2), x +   15.869 * s);
			_setf(o + ( 7 << 2), y +  -73.729 * s);
			_setf(o + ( 8 << 2), x +   15.869 * s);
			_setf(o + ( 9 << 2), y +  -46.532 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   15.869 * s,y +  -46.532 * s,x +   17.106 * s,y +  -48.453 * s,x +   19.100 * s,y +  -50.056 * s,x +   21.850 * s,y +  -51.342 * s, threshold);
			_vr.bezier8(x +   21.850 * s,y +  -51.342 * s,x +   24.601 * s,y +  -52.628 * s,x +   27.441 * s,y +  -53.271 * s,x +   30.371 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   30.371 * s,y +  -53.271 * s,x +   35.904 * s,y +  -53.271 * s,x +   40.242 * s,y +  -51.448 * s,x +   43.383 * s,y +  -47.802 * s, threshold);
			_vr.bezier8(x +   43.383 * s,y +  -47.802 * s,x +   46.524 * s,y +  -44.156 * s,x +   48.095 * s,y +  -39.176 * s,x +   48.095 * s,y +  -32.861 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   48.095 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   38.818 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   54.638 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 105:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   16.162 * s);
			_setf(o + ( 1 << 2), y +  -72.069 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   16.162 * s,y +  -72.069 * s,x +   17.757 * s,y +  -72.069 * s,x +   19.116 * s,y +  -71.508 * s,x +   20.239 * s,y +  -70.385 * s, threshold);
			_vr.bezier8(x +   20.239 * s,y +  -70.385 * s,x +   21.362 * s,y +  -69.262 * s,x +   21.923 * s,y +  -67.919 * s,x +   21.923 * s,y +  -66.356 * s, threshold);
			_vr.bezier8(x +   21.923 * s,y +  -66.356 * s,x +   21.923 * s,y +  -64.761 * s,x +   21.362 * s,y +  -63.402 * s,x +   20.239 * s,y +  -62.279 * s, threshold);
			_vr.bezier8(x +   20.239 * s,y +  -62.279 * s,x +   19.116 * s,y +  -61.156 * s,x +   17.757 * s,y +  -60.595 * s,x +   16.162 * s,y +  -60.595 * s, threshold);
			_vr.bezier8(x +   16.162 * s,y +  -60.595 * s,x +   14.599 * s,y +  -60.595 * s,x +   13.257 * s,y +  -61.156 * s,x +   12.133 * s,y +  -62.279 * s, threshold);
			_vr.bezier8(x +   12.133 * s,y +  -62.279 * s,x +   11.010 * s,y +  -63.402 * s,x +   10.449 * s,y +  -64.761 * s,x +   10.449 * s,y +  -66.356 * s, threshold);
			_vr.bezier8(x +   10.449 * s,y +  -66.356 * s,x +   10.449 * s,y +  -67.951 * s,x +   11.002 * s,y +  -69.302 * s,x +   12.109 * s,y +  -70.409 * s, threshold);
			_vr.bezier8(x +   12.109 * s,y +  -70.409 * s,x +   13.216 * s,y +  -71.516 * s,x +   14.567 * s,y +  -72.069 * s,x +   16.162 * s,y +  -72.069 * s, threshold);
			o = _posf(16);
			_setf(o + ( 0 << 2), x +   11.084 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   11.084 * s);
			_setf(o + ( 3 << 2), y +  -44.482 * s);
			_setf(o + ( 4 << 2), x +    3.906 * s);
			_setf(o + ( 5 << 2), y +  -44.482 * s);
			_setf(o + ( 6 << 2), x +    3.906 * s);
			_setf(o + ( 7 << 2), y +  -52.294 * s);
			_setf(o + ( 8 << 2), x +   20.361 * s);
			_setf(o + ( 9 << 2), y +  -52.294 * s);
			_setf(o + (10 << 2), x +   20.361 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   11.084 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   28.515 * s);
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
			
			case 106:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   20.898 * s);
			_setf(o + ( 1 << 2), y +  -72.069 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   20.898 * s,y +  -72.069 * s,x +   22.493 * s,y +  -72.069 * s,x +   23.852 * s,y +  -71.508 * s,x +   24.975 * s,y +  -70.385 * s, threshold);
			_vr.bezier8(x +   24.975 * s,y +  -70.385 * s,x +   26.098 * s,y +  -69.262 * s,x +   26.660 * s,y +  -67.919 * s,x +   26.660 * s,y +  -66.356 * s, threshold);
			_vr.bezier8(x +   26.660 * s,y +  -66.356 * s,x +   26.660 * s,y +  -64.761 * s,x +   26.098 * s,y +  -63.402 * s,x +   24.975 * s,y +  -62.279 * s, threshold);
			_vr.bezier8(x +   24.975 * s,y +  -62.279 * s,x +   23.852 * s,y +  -61.156 * s,x +   22.493 * s,y +  -60.595 * s,x +   20.898 * s,y +  -60.595 * s, threshold);
			_vr.bezier8(x +   20.898 * s,y +  -60.595 * s,x +   19.303 * s,y +  -60.595 * s,x +   17.952 * s,y +  -61.156 * s,x +   16.846 * s,y +  -62.279 * s, threshold);
			_vr.bezier8(x +   16.846 * s,y +  -62.279 * s,x +   15.739 * s,y +  -63.402 * s,x +   15.185 * s,y +  -64.761 * s,x +   15.185 * s,y +  -66.356 * s, threshold);
			_vr.bezier8(x +   15.185 * s,y +  -66.356 * s,x +   15.185 * s,y +  -67.951 * s,x +   15.739 * s,y +  -69.302 * s,x +   16.846 * s,y +  -70.409 * s, threshold);
			_vr.bezier8(x +   16.846 * s,y +  -70.409 * s,x +   17.952 * s,y +  -71.516 * s,x +   19.303 * s,y +  -72.069 * s,x +   20.898 * s,y +  -72.069 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    0.879 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			_setf(o + ( 2 << 2), x +    0.879 * s);
			_setf(o + ( 3 << 2), y +   12.207 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    0.879 * s,y +   12.207 * s,x +    7.259 * s,y +   12.207 * s,x +   11.629 * s,y +   11.238 * s,x +   13.989 * s,y +    9.302 * s, threshold);
			_vr.bezier8(x +   13.989 * s,y +    9.302 * s,x +   16.349 * s,y +    7.365 * s,x +   17.529 * s,y +    4.183 * s,x +   17.529 * s,y +   -0.244 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   17.529 * s);
			_setf(o + ( 1 << 2), y +  -44.482 * s);
			_setf(o + ( 2 << 2), x +    7.129 * s);
			_setf(o + ( 3 << 2), y +  -44.482 * s);
			_setf(o + ( 4 << 2), x +    7.129 * s);
			_setf(o + ( 5 << 2), y +  -52.294 * s);
			_setf(o + ( 6 << 2), x +   26.806 * s);
			_setf(o + ( 7 << 2), y +  -52.294 * s);
			_setf(o + ( 8 << 2), x +   26.806 * s);
			_setf(o + ( 9 << 2), y +   -0.439 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   26.806 * s,y +   -0.439 * s,x +   26.806 * s,y +    6.754 * s,x +   24.690 * s,y +   12.044 * s,x +   20.459 * s,y +   15.430 * s, threshold);
			_vr.bezier8(x +   20.459 * s,y +   15.430 * s,x +   16.227 * s,y +   18.815 * s,x +    9.700 * s,y +   20.508 * s,x +    0.879 * s,y +   20.508 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.669 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 107:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   40.381 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   23.975 * s);
			_setf(o + ( 3 << 2), y +  -26.171 * s);
			_setf(o + ( 4 << 2), x +   15.869 * s);
			_setf(o + ( 5 << 2), y +  -17.822 * s);
			_setf(o + ( 6 << 2), x +   15.869 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    6.592 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +    6.592 * s);
			_setf(o + (11 << 2), y +  -73.729 * s);
			_setf(o + (12 << 2), x +   15.869 * s);
			_setf(o + (13 << 2), y +  -73.729 * s);
			_setf(o + (14 << 2), x +   15.869 * s);
			_setf(o + (15 << 2), y +  -27.978 * s);
			_setf(o + (16 << 2), x +   35.889 * s);
			_setf(o + (17 << 2), y +  -52.294 * s);
			_setf(o + (18 << 2), x +   46.728 * s);
			_setf(o + (19 << 2), y +  -52.294 * s);
			_setf(o + (20 << 2), x +   29.980 * s);
			_setf(o + (21 << 2), y +  -32.421 * s);
			_setf(o + (22 << 2), x +   50.439 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   40.381 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   50.439 * s);
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
			
			case 108:
			
			o = _posf(8);
			_setf(o + ( 0 << 2), x +    7.324 * s);
			_setf(o + ( 1 << 2), y +  -14.795 * s);
			_setf(o + ( 2 << 2), x +    7.324 * s);
			_setf(o + ( 3 << 2), y +  -73.729 * s);
			_setf(o + ( 4 << 2), x +   16.601 * s);
			_setf(o + ( 5 << 2), y +  -73.729 * s);
			_setf(o + ( 6 << 2), x +   16.601 * s);
			_setf(o + ( 7 << 2), y +  -16.357 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_vr.bezier8(x +   16.601 * s,y +  -16.357 * s,x +   16.601 * s,y +  -13.558 * s,x +   17.407 * s,y +  -11.352 * s,x +   19.018 * s,y +   -9.741 * s, threshold);
			_vr.bezier8(x +   19.018 * s,y +   -9.741 * s,x +   20.630 * s,y +   -8.130 * s,x +   22.737 * s,y +   -7.324 * s,x +   25.342 * s,y +   -7.324 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   25.342 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   25.342 * s,y +    0.977 * s,x +   13.330 * s,y +    0.977 * s,x +    7.324 * s,y +   -4.281 * s,x +    7.324 * s,y +  -14.795 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   29.492 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 109:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   67.137 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   67.137 * s);
			_setf(o + ( 3 << 2), y +  -33.105 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   67.137 * s,y +  -33.105 * s,x +   67.137 * s,y +  -41.340 * s,x +   63.573 * s,y +  -45.458 * s,x +   56.444 * s,y +  -45.458 * s, threshold);
			_vr.bezier8(x +   56.444 * s,y +  -45.458 * s,x +   54.198 * s,y +  -45.458 * s,x +   52.099 * s,y +  -44.767 * s,x +   50.146 * s,y +  -43.383 * s, threshold);
			_vr.bezier8(x +   50.146 * s,y +  -43.383 * s,x +   48.192 * s,y +  -42.000 * s,x +   46.858 * s,y +  -40.429 * s,x +   46.142 * s,y +  -38.671 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   46.142 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   36.865 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   36.865 * s);
			_setf(o + ( 5 << 2), y +  -37.158 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   36.865 * s,y +  -37.158 * s,x +   36.865 * s,y +  -39.729 * s,x +   35.896 * s,y +  -41.755 * s,x +   33.959 * s,y +  -43.237 * s, threshold);
			_vr.bezier8(x +   33.959 * s,y +  -43.237 * s,x +   32.022 * s,y +  -44.718 * s,x +   29.459 * s,y +  -45.458 * s,x +   26.269 * s,y +  -45.458 * s, threshold);
			_vr.bezier8(x +   26.269 * s,y +  -45.458 * s,x +   24.413 * s,y +  -45.458 * s,x +   22.436 * s,y +  -44.742 * s,x +   20.336 * s,y +  -43.310 * s, threshold);
			_vr.bezier8(x +   20.336 * s,y +  -43.310 * s,x +   18.237 * s,y +  -41.878 * s,x +   16.748 * s,y +  -40.299 * s,x +   15.869 * s,y +  -38.574 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   15.869 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    6.592 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    6.592 * s);
			_setf(o + ( 5 << 2), y +  -52.294 * s);
			_setf(o + ( 6 << 2), x +   12.646 * s);
			_setf(o + ( 7 << 2), y +  -52.294 * s);
			_setf(o + ( 8 << 2), x +   15.722 * s);
			_setf(o + ( 9 << 2), y +  -46.239 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   15.722 * s,y +  -46.239 * s,x +   19.303 * s,y +  -50.927 * s,x +   23.779 * s,y +  -53.271 * s,x +   29.150 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   29.150 * s,y +  -53.271 * s,x +   36.637 * s,y +  -53.271 * s,x +   41.877 * s,y +  -50.943 * s,x +   44.872 * s,y +  -46.288 * s, threshold);
			_vr.bezier8(x +   44.872 * s,y +  -46.288 * s,x +   45.914 * s,y +  -48.274 * s,x +   47.851 * s,y +  -49.934 * s,x +   50.683 * s,y +  -51.269 * s, threshold);
			_vr.bezier8(x +   50.683 * s,y +  -51.269 * s,x +   53.515 * s,y +  -52.603 * s,x +   56.428 * s,y +  -53.271 * s,x +   59.423 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   59.423 * s,y +  -53.271 * s,x +   64.826 * s,y +  -53.271 * s,x +   69.009 * s,y +  -51.667 * s,x +   71.971 * s,y +  -48.461 * s, threshold);
			_vr.bezier8(x +   71.971 * s,y +  -48.461 * s,x +   74.934 * s,y +  -45.255 * s,x +   76.415 * s,y +  -40.754 * s,x +   76.415 * s,y +  -34.960 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   76.415 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   67.137 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   83.006 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 110:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   38.769 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   38.769 * s);
			_setf(o + ( 3 << 2), y +  -30.419 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   38.769 * s,y +  -30.419 * s,x +   38.769 * s,y +  -35.986 * s,x +   37.931 * s,y +  -39.884 * s,x +   36.254 * s,y +  -42.114 * s, threshold);
			_vr.bezier8(x +   36.254 * s,y +  -42.114 * s,x +   34.578 * s,y +  -44.343 * s,x +   31.770 * s,y +  -45.458 * s,x +   27.832 * s,y +  -45.458 * s, threshold);
			_vr.bezier8(x +   27.832 * s,y +  -45.458 * s,x +   25.716 * s,y +  -45.458 * s,x +   23.502 * s,y +  -44.824 * s,x +   21.191 * s,y +  -43.554 * s, threshold);
			_vr.bezier8(x +   21.191 * s,y +  -43.554 * s,x +   18.880 * s,y +  -42.285 * s,x +   17.106 * s,y +  -40.722 * s,x +   15.869 * s,y +  -38.867 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   15.869 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    6.592 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    6.592 * s);
			_setf(o + ( 5 << 2), y +  -52.294 * s);
			_setf(o + ( 6 << 2), x +   12.939 * s);
			_setf(o + ( 7 << 2), y +  -52.294 * s);
			_setf(o + ( 8 << 2), x +   15.869 * s);
			_setf(o + ( 9 << 2), y +  -45.556 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   15.869 * s,y +  -45.556 * s,x +   18.929 * s,y +  -50.699 * s,x +   23.925 * s,y +  -53.271 * s,x +   30.859 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   30.859 * s,y +  -53.271 * s,x +   42.317 * s,y +  -53.271 * s,x +   48.046 * s,y +  -46.304 * s,x +   48.046 * s,y +  -32.373 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   48.046 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   38.769 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   54.638 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 111:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    3.174 * s);
			_setf(o + ( 1 << 2), y +  -26.269 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +    3.174 * s,y +  -26.269 * s,x +    3.174 * s,y +  -34.342 * s,x +    5.347 * s,y +  -40.860 * s,x +    9.692 * s,y +  -45.824 * s, threshold);
			_vr.bezier8(x +    9.692 * s,y +  -45.824 * s,x +   14.038 * s,y +  -50.789 * s,x +   19.759 * s,y +  -53.271 * s,x +   26.855 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   26.855 * s,y +  -53.271 * s,x +   34.342 * s,y +  -53.271 * s,x +   40.152 * s,y +  -50.886 * s,x +   44.286 * s,y +  -46.117 * s, threshold);
			_vr.bezier8(x +   44.286 * s,y +  -46.117 * s,x +   48.420 * s,y +  -41.349 * s,x +   50.487 * s,y +  -34.732 * s,x +   50.487 * s,y +  -26.269 * s, threshold);
			_vr.bezier8(x +   50.487 * s,y +  -26.269 * s,x +   50.487 * s,y +  -17.838 * s,x +   48.371 * s,y +  -11.190 * s,x +   44.140 * s,y +   -6.323 * s, threshold);
			_vr.bezier8(x +   44.140 * s,y +   -6.323 * s,x +   39.908 * s,y +   -1.457 * s,x +   34.146 * s,y +    0.977 * s,x +   26.855 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   26.855 * s,y +    0.977 * s,x +   19.401 * s,y +    0.977 * s,x +   13.590 * s,y +   -1.481 * s,x +    9.424 * s,y +   -6.396 * s, threshold);
			_vr.bezier8(x +    9.424 * s,y +   -6.396 * s,x +    5.257 * s,y +  -11.312 * s,x +    3.174 * s,y +  -17.936 * s,x +    3.174 * s,y +  -26.269 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   12.939 * s);
			_setf(o + ( 1 << 2), y +  -26.269 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   12.939 * s,y +  -26.269 * s,x +   12.939 * s,y +  -13.151 * s,x +   17.577 * s,y +   -6.592 * s,x +   26.855 * s,y +   -6.592 * s, threshold);
			_vr.bezier8(x +   26.855 * s,y +   -6.592 * s,x +   31.184 * s,y +   -6.592 * s,x +   34.578 * s,y +   -8.349 * s,x +   37.035 * s,y +  -11.865 * s, threshold);
			_vr.bezier8(x +   37.035 * s,y +  -11.865 * s,x +   39.493 * s,y +  -15.381 * s,x +   40.722 * s,y +  -20.182 * s,x +   40.722 * s,y +  -26.269 * s, threshold);
			_vr.bezier8(x +   40.722 * s,y +  -26.269 * s,x +   40.722 * s,y +  -39.224 * s,x +   36.100 * s,y +  -45.702 * s,x +   26.855 * s,y +  -45.702 * s, threshold);
			_vr.bezier8(x +   26.855 * s,y +  -45.702 * s,x +   22.624 * s,y +  -45.702 * s,x +   19.246 * s,y +  -43.977 * s,x +   16.723 * s,y +  -40.527 * s, threshold);
			_vr.bezier8(x +   16.723 * s,y +  -40.527 * s,x +   14.201 * s,y +  -37.076 * s,x +   12.939 * s,y +  -32.324 * s,x +   12.939 * s,y +  -26.269 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   53.661 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 112:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   15.869 * s);
			_setf(o + ( 1 << 2), y +   -2.881 * s);
			_setf(o + ( 2 << 2), x +   15.869 * s);
			_setf(o + ( 3 << 2), y +   20.508 * s);
			_setf(o + ( 4 << 2), x +    6.592 * s);
			_setf(o + ( 5 << 2), y +   20.508 * s);
			_setf(o + ( 6 << 2), x +    6.592 * s);
			_setf(o + ( 7 << 2), y +  -52.294 * s);
			_setf(o + ( 8 << 2), x +   15.869 * s);
			_setf(o + ( 9 << 2), y +  -52.294 * s);
			_setf(o + (10 << 2), x +   15.869 * s);
			_setf(o + (11 << 2), y +  -47.997 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_vr.bezier8(x +   15.869 * s,y +  -47.997 * s,x +   19.385 * s,y +  -51.513 * s,x +   23.633 * s,y +  -53.271 * s,x +   28.613 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   28.613 * s,y +  -53.271 * s,x +   36.035 * s,y +  -53.271 * s,x +   41.813 * s,y +  -50.959 * s,x +   45.947 * s,y +  -46.337 * s, threshold);
			_vr.bezier8(x +   45.947 * s,y +  -46.337 * s,x +   50.081 * s,y +  -41.715 * s,x +   52.148 * s,y +  -34.944 * s,x +   52.148 * s,y +  -26.025 * s, threshold);
			_vr.bezier8(x +   52.148 * s,y +  -26.025 * s,x +   52.148 * s,y +  -18.082 * s,x +   50.064 * s,y +  -11.596 * s,x +   45.898 * s,y +   -6.567 * s, threshold);
			_vr.bezier8(x +   45.898 * s,y +   -6.567 * s,x +   41.731 * s,y +   -1.538 * s,x +   35.709 * s,y +    0.977 * s,x +   27.832 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   27.832 * s,y +    0.977 * s,x +   25.618 * s,y +    0.977 * s,x +   23.250 * s,y +    0.586 * s,x +   20.727 * s,y +   -0.195 * s, threshold);
			_vr.bezier8(x +   20.727 * s,y +   -0.195 * s,x +   18.205 * s,y +   -0.977 * s,x +   16.585 * s,y +   -1.872 * s,x +   15.869 * s,y +   -2.881 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   15.869 * s);
			_setf(o + ( 1 << 2), y +  -41.015 * s);
			_setf(o + ( 2 << 2), x +   15.869 * s);
			_setf(o + ( 3 << 2), y +  -10.547 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   15.869 * s,y +  -10.547 * s,x +   16.455 * s,y +   -9.668 * s,x +   17.692 * s,y +   -8.830 * s,x +   19.580 * s,y +   -8.032 * s, threshold);
			_vr.bezier8(x +   19.580 * s,y +   -8.032 * s,x +   21.468 * s,y +   -7.235 * s,x +   23.307 * s,y +   -6.836 * s,x +   25.097 * s,y +   -6.836 * s, threshold);
			_vr.bezier8(x +   25.097 * s,y +   -6.836 * s,x +   36.621 * s,y +   -6.836 * s,x +   42.382 * s,y +  -13.347 * s,x +   42.382 * s,y +  -26.367 * s, threshold);
			_vr.bezier8(x +   42.382 * s,y +  -26.367 * s,x +   42.382 * s,y +  -32.974 * s,x +   41.015 * s,y +  -37.809 * s,x +   38.281 * s,y +  -40.869 * s, threshold);
			_vr.bezier8(x +   38.281 * s,y +  -40.869 * s,x +   35.546 * s,y +  -43.928 * s,x +   31.168 * s,y +  -45.458 * s,x +   25.146 * s,y +  -45.458 * s, threshold);
			_vr.bezier8(x +   25.146 * s,y +  -45.458 * s,x +   23.844 * s,y +  -45.458 * s,x +   22.249 * s,y +  -45.003 * s,x +   20.361 * s,y +  -44.091 * s, threshold);
			_vr.bezier8(x +   20.361 * s,y +  -44.091 * s,x +   18.473 * s,y +  -43.180 * s,x +   16.976 * s,y +  -42.154 * s,x +   15.869 * s,y +  -41.015 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   55.712 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 113:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   40.087 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			_setf(o + ( 2 << 2), x +   40.087 * s);
			_setf(o + ( 3 << 2), y +   -3.076 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   40.087 * s,y +   -3.076 * s,x +   37.386 * s,y +   -0.374 * s,x +   32.861 * s,y +    0.977 * s,x +   26.513 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   26.513 * s,y +    0.977 * s,x +   19.385 * s,y +    0.977 * s,x +   13.794 * s,y +   -1.408 * s,x +    9.741 * s,y +   -6.177 * s, threshold);
			_vr.bezier8(x +    9.741 * s,y +   -6.177 * s,x +    5.689 * s,y +  -10.945 * s,x +    3.662 * s,y +  -17.562 * s,x +    3.662 * s,y +  -26.025 * s, threshold);
			_vr.bezier8(x +    3.662 * s,y +  -26.025 * s,x +    3.662 * s,y +  -34.391 * s,x +    5.982 * s,y +  -41.023 * s,x +   10.620 * s,y +  -45.922 * s, threshold);
			_vr.bezier8(x +   10.620 * s,y +  -45.922 * s,x +   15.259 * s,y +  -50.821 * s,x +   21.224 * s,y +  -53.271 * s,x +   28.515 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   28.515 * s,y +  -53.271 * s,x +   33.072 * s,y +  -53.271 * s,x +   37.321 * s,y +  -51.627 * s,x +   41.259 * s,y +  -48.339 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   43.749 * s);
			_setf(o + ( 1 << 2), y +  -52.294 * s);
			_setf(o + ( 2 << 2), x +   49.365 * s);
			_setf(o + ( 3 << 2), y +  -52.294 * s);
			_setf(o + ( 4 << 2), x +   49.365 * s);
			_setf(o + ( 5 << 2), y +   20.508 * s);
			_setf(o + ( 6 << 2), x +   40.087 * s);
			_setf(o + ( 7 << 2), y +   20.508 * s);
			_setf(o + ( 8 << 2), x +   40.087 * s);
			_setf(o + ( 9 << 2), y +  -41.454 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 1);
			_vr.bezier8(x +   40.087 * s,y +  -41.454 * s,x +   37.418 * s,y +  -44.124 * s,x +   34.082 * s,y +  -45.458 * s,x +   30.078 * s,y +  -45.458 * s, threshold);
			_vr.bezier8(x +   30.078 * s,y +  -45.458 * s,x +   24.837 * s,y +  -45.458 * s,x +   20.752 * s,y +  -43.684 * s,x +   17.822 * s,y +  -40.136 * s, threshold);
			_vr.bezier8(x +   17.822 * s,y +  -40.136 * s,x +   14.893 * s,y +  -36.588 * s,x +   13.428 * s,y +  -31.884 * s,x +   13.428 * s,y +  -26.025 * s, threshold);
			_vr.bezier8(x +   13.428 * s,y +  -26.025 * s,x +   13.428 * s,y +  -19.970 * s,x +   14.893 * s,y +  -15.259 * s,x +   17.822 * s,y +  -11.889 * s, threshold);
			_vr.bezier8(x +   17.822 * s,y +  -11.889 * s,x +   20.752 * s,y +   -8.520 * s,x +   24.707 * s,y +   -6.836 * s,x +   29.687 * s,y +   -6.836 * s, threshold);
			_vr.bezier8(x +   29.687 * s,y +   -6.836 * s,x +   34.147 * s,y +   -6.836 * s,x +   37.613 * s,y +   -7.975 * s,x +   40.087 * s,y +  -10.254 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   40.087 * s);
			_setf(o + ( 1 << 2), y +  -41.454 * s);
			_setf(o + ( 2 << 2), x +   55.712 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 114:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   35.009 * s);
			_setf(o + ( 1 << 2), y +  -43.359 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   35.009 * s,y +  -43.359 * s,x +   32.991 * s,y +  -44.758 * s,x +   30.957 * s,y +  -45.458 * s,x +   28.906 * s,y +  -45.458 * s, threshold);
			_vr.bezier8(x +   28.906 * s,y +  -45.458 * s,x +   25.618 * s,y +  -45.458 * s,x +   22.746 * s,y +  -43.945 * s,x +   20.288 * s,y +  -40.917 * s, threshold);
			_vr.bezier8(x +   20.288 * s,y +  -40.917 * s,x +   17.830 * s,y +  -37.890 * s,x +   16.601 * s,y +  -34.244 * s,x +   16.601 * s,y +  -29.980 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   16.601 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    7.324 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    7.324 * s);
			_setf(o + ( 5 << 2), y +  -52.294 * s);
			_setf(o + ( 6 << 2), x +   16.601 * s);
			_setf(o + ( 7 << 2), y +  -52.294 * s);
			_setf(o + ( 8 << 2), x +   16.601 * s);
			_setf(o + ( 9 << 2), y +  -43.945 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   16.601 * s,y +  -43.945 * s,x +   19.987 * s,y +  -50.162 * s,x +   25.016 * s,y +  -53.271 * s,x +   31.689 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   31.689 * s,y +  -53.271 * s,x +   33.349 * s,y +  -53.271 * s,x +   35.742 * s,y +  -52.978 * s,x +   38.867 * s,y +  -52.392 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   35.009 * s);
			_setf(o + ( 1 << 2), y +  -43.359 * s);
			_setf(o + ( 2 << 2), x +   38.867 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 115:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    3.174 * s);
			_setf(o + ( 1 << 2), y +   -3.125 * s);
			_setf(o + ( 2 << 2), x +    6.445 * s);
			_setf(o + ( 3 << 2), y +  -11.914 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    6.445 * s,y +  -11.914 * s,x +   11.621 * s,y +   -8.529 * s,x +   15.787 * s,y +   -6.836 * s,x +   18.945 * s,y +   -6.836 * s, threshold);
			_vr.bezier8(x +   18.945 * s,y +   -6.836 * s,x +   24.674 * s,y +   -6.836 * s,x +   27.538 * s,y +   -9.245 * s,x +   27.538 * s,y +  -14.062 * s, threshold);
			_vr.bezier8(x +   27.538 * s,y +  -14.062 * s,x +   27.538 * s,y +  -17.513 * s,x +   24.762 * s,y +  -20.453 * s,x +   19.238 * s,y +  -22.949 * s, threshold);
			_vr.bezier8(x +   19.238 * s,y +  -22.949 * s,x +   14.963 * s,y +  -24.880 * s,x +   12.101 * s,y +  -26.383 * s,x +   10.620 * s,y +  -27.392 * s, threshold);
			_vr.bezier8(x +   10.620 * s,y +  -27.392 * s,x +    9.139 * s,y +  -28.401 * s,x +    7.853 * s,y +  -29.549 * s,x +    6.762 * s,y +  -30.834 * s, threshold);
			_vr.bezier8(x +    6.762 * s,y +  -30.834 * s,x +    5.672 * s,y +  -32.120 * s,x +    4.858 * s,y +  -33.487 * s,x +    4.321 * s,y +  -34.936 * s, threshold);
			_vr.bezier8(x +    4.321 * s,y +  -34.936 * s,x +    3.784 * s,y +  -36.385 * s,x +    3.515 * s,y +  -37.939 * s,x +    3.515 * s,y +  -39.599 * s, threshold);
			_vr.bezier8(x +    3.515 * s,y +  -39.599 * s,x +    3.515 * s,y +  -43.896 * s,x +    5.078 * s,y +  -47.249 * s,x +    8.203 * s,y +  -49.657 * s, threshold);
			_vr.bezier8(x +    8.203 * s,y +  -49.657 * s,x +   11.328 * s,y +  -52.066 * s,x +   15.413 * s,y +  -53.271 * s,x +   20.458 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   20.458 * s,y +  -53.271 * s,x +   24.267 * s,y +  -53.271 * s,x +   29.068 * s,y +  -52.066 * s,x +   34.863 * s,y +  -49.657 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   32.226 * s);
			_setf(o + ( 1 << 2), y +  -41.064 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   32.226 * s,y +  -41.064 * s,x +   28.548 * s,y +  -43.993 * s,x +   24.853 * s,y +  -45.458 * s,x +   21.142 * s,y +  -45.458 * s, threshold);
			_vr.bezier8(x +   21.142 * s,y +  -45.458 * s,x +   18.928 * s,y +  -45.458 * s,x +   17.065 * s,y +  -44.937 * s,x +   15.551 * s,y +  -43.896 * s, threshold);
			_vr.bezier8(x +   15.551 * s,y +  -43.896 * s,x +   14.038 * s,y +  -42.854 * s,x +   13.281 * s,y +  -41.536 * s,x +   13.281 * s,y +  -39.941 * s, threshold);
			_vr.bezier8(x +   13.281 * s,y +  -39.941 * s,x +   13.281 * s,y +  -36.588 * s,x +   15.189 * s,y +  -34.058 * s,x +   18.994 * s,y +  -32.324 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   25.634 * s);
			_setf(o + ( 1 << 2), y +  -29.296 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   25.634 * s,y +  -29.296 * s,x +   29.703 * s,y +  -27.441 * s,x +   32.665 * s,y +  -25.325 * s,x +   34.521 * s,y +  -22.949 * s, threshold);
			_vr.bezier8(x +   34.521 * s,y +  -22.949 * s,x +   36.376 * s,y +  -20.573 * s,x +   37.304 * s,y +  -17.594 * s,x +   37.304 * s,y +  -14.013 * s, threshold);
			_vr.bezier8(x +   37.304 * s,y +  -14.013 * s,x +   37.304 * s,y +   -9.326 * s,x +   35.660 * s,y +   -5.656 * s,x +   32.372 * s,y +   -3.003 * s, threshold);
			_vr.bezier8(x +   32.372 * s,y +   -3.003 * s,x +   29.085 * s,y +   -0.350 * s,x +   24.527 * s,y +    0.977 * s,x +   18.701 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   18.701 * s,y +    0.977 * s,x +   13.200 * s,y +    0.977 * s,x +    8.024 * s,y +   -0.391 * s,x +    3.174 * s,y +   -3.125 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   40.478 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 116:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +    9.912 * s);
			_setf(o + ( 1 << 2), y +  -44.970 * s);
			_setf(o + ( 2 << 2), x +    3.857 * s);
			_setf(o + ( 3 << 2), y +  -44.970 * s);
			_setf(o + ( 4 << 2), x +    3.857 * s);
			_setf(o + ( 5 << 2), y +  -52.294 * s);
			_setf(o + ( 6 << 2), x +    9.912 * s);
			_setf(o + ( 7 << 2), y +  -52.294 * s);
			_setf(o + ( 8 << 2), x +    9.912 * s);
			_setf(o + ( 9 << 2), y +  -63.231 * s);
			_setf(o + (10 << 2), x +   19.189 * s);
			_setf(o + (11 << 2), y +  -66.796 * s);
			_setf(o + (12 << 2), x +   19.189 * s);
			_setf(o + (13 << 2), y +  -52.294 * s);
			_setf(o + (14 << 2), x +   33.544 * s);
			_setf(o + (15 << 2), y +  -52.294 * s);
			_setf(o + (16 << 2), x +   33.544 * s);
			_setf(o + (17 << 2), y +  -44.970 * s);
			_setf(o + (18 << 2), x +   19.189 * s);
			_setf(o + (19 << 2), y +  -44.970 * s);
			_setf(o + (20 << 2), x +   19.189 * s);
			_setf(o + (21 << 2), y +  -18.994 * s);
			o = _posb(11);
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
			_vr.bezier8(x +   19.189 * s,y +  -18.994 * s,x +   19.189 * s,y +  -14.599 * s,x +   19.929 * s,y +  -11.474 * s,x +   21.410 * s,y +   -9.619 * s, threshold);
			_vr.bezier8(x +   21.410 * s,y +   -9.619 * s,x +   22.892 * s,y +   -7.764 * s,x +   25.276 * s,y +   -6.836 * s,x +   28.564 * s,y +   -6.836 * s, threshold);
			_vr.bezier8(x +   28.564 * s,y +   -6.836 * s,x +   30.940 * s,y +   -6.836 * s,x +   33.398 * s,y +   -7.438 * s,x +   35.937 * s,y +   -8.642 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   37.304 * s);
			_setf(o + ( 1 << 2), y +   -0.488 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   37.304 * s,y +   -0.488 * s,x +   33.463 * s,y +    0.488 * s,x +   29.247 * s,y +    0.977 * s,x +   24.657 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   24.657 * s,y +    0.977 * s,x +   20.523 * s,y +    0.977 * s,x +   17.032 * s,y +   -0.562 * s,x +   14.184 * s,y +   -3.638 * s, threshold);
			_vr.bezier8(x +   14.184 * s,y +   -3.638 * s,x +   11.336 * s,y +   -6.714 * s,x +    9.912 * s,y +  -10.596 * s,x +    9.912 * s,y +  -15.283 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    9.912 * s);
			_setf(o + ( 1 << 2), y +  -44.970 * s);
			_setf(o + ( 2 << 2), x +   39.647 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 117:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   15.381 * s);
			_setf(o + ( 1 << 2), y +  -52.294 * s);
			_setf(o + ( 2 << 2), x +   15.381 * s);
			_setf(o + ( 3 << 2), y +  -18.945 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   15.381 * s,y +  -18.945 * s,x +   15.381 * s,y +  -10.872 * s,x +   18.881 * s,y +   -6.836 * s,x +   25.879 * s,y +   -6.836 * s, threshold);
			_vr.bezier8(x +   25.879 * s,y +   -6.836 * s,x +   28.939 * s,y +   -6.836 * s,x +   31.738 * s,y +   -7.715 * s,x +   34.277 * s,y +   -9.473 * s, threshold);
			_vr.bezier8(x +   34.277 * s,y +   -9.473 * s,x +   36.816 * s,y +  -11.230 * s,x +   38.493 * s,y +  -13.265 * s,x +   39.307 * s,y +  -15.576 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   39.307 * s);
			_setf(o + ( 1 << 2), y +  -52.294 * s);
			_setf(o + ( 2 << 2), x +   48.584 * s);
			_setf(o + ( 3 << 2), y +  -52.294 * s);
			_setf(o + ( 4 << 2), x +   48.584 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   39.307 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   39.307 * s);
			_setf(o + ( 9 << 2), y +   -7.226 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   39.307 * s,y +   -7.226 * s,x +   38.265 * s,y +   -5.176 * s,x +   36.173 * s,y +   -3.296 * s,x +   33.032 * s,y +   -1.587 * s, threshold);
			_vr.bezier8(x +   33.032 * s,y +   -1.587 * s,x +   29.891 * s,y +    0.122 * s,x +   26.823 * s,y +    0.977 * s,x +   23.828 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   23.828 * s,y +    0.977 * s,x +   18.099 * s,y +    0.977 * s,x +   13.713 * s,y +   -0.667 * s,x +   10.669 * s,y +   -3.955 * s, threshold);
			_vr.bezier8(x +   10.669 * s,y +   -3.955 * s,x +    7.626 * s,y +   -7.243 * s,x +    6.104 * s,y +  -11.914 * s,x +    6.104 * s,y +  -17.968 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    6.104 * s);
			_setf(o + ( 1 << 2), y +  -52.294 * s);
			_setf(o + ( 2 << 2), x +   15.381 * s);
			_setf(o + ( 3 << 2), y +  -52.294 * s);
			_setf(o + ( 4 << 2), x +   54.638 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 118:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +   25.439 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			_setf(o + ( 2 << 2), x +   22.998 * s);
			_setf(o + ( 3 << 2), y +    0.977 * s);
			_setf(o + ( 4 << 2), x +    0.586 * s);
			_setf(o + ( 5 << 2), y +  -52.441 * s);
			_setf(o + ( 6 << 2), x +   10.742 * s);
			_setf(o + ( 7 << 2), y +  -52.441 * s);
			_setf(o + ( 8 << 2), x +   24.560 * s);
			_setf(o + ( 9 << 2), y +  -15.820 * s);
			_setf(o + (10 << 2), x +   38.672 * s);
			_setf(o + (11 << 2), y +  -52.441 * s);
			_setf(o + (12 << 2), x +   48.388 * s);
			_setf(o + (13 << 2), y +  -52.441 * s);
			_setf(o + (14 << 2), x +   25.439 * s);
			_setf(o + (15 << 2), y +    0.977 * s);
			_setf(o + (16 << 2), x +   48.974 * s);
			_setf(o + (17 << 2), y +       0. * s);
			o = _posb(9);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 1);
			
			case 119:
			
			o = _posf(30);
			_setf(o + ( 0 << 2), x +   54.931 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			_setf(o + ( 2 << 2), x +   52.490 * s);
			_setf(o + ( 3 << 2), y +    0.977 * s);
			_setf(o + ( 4 << 2), x +   37.158 * s);
			_setf(o + ( 5 << 2), y +  -34.619 * s);
			_setf(o + ( 6 << 2), x +   21.875 * s);
			_setf(o + ( 7 << 2), y +    0.977 * s);
			_setf(o + ( 8 << 2), x +   19.433 * s);
			_setf(o + ( 9 << 2), y +    0.977 * s);
			_setf(o + (10 << 2), x +    0.733 * s);
			_setf(o + (11 << 2), y +  -52.441 * s);
			_setf(o + (12 << 2), x +   10.645 * s);
			_setf(o + (13 << 2), y +  -52.441 * s);
			_setf(o + (14 << 2), x +   21.826 * s);
			_setf(o + (15 << 2), y +  -18.115 * s);
			_setf(o + (16 << 2), x +   35.742 * s);
			_setf(o + (17 << 2), y +  -52.441 * s);
			_setf(o + (18 << 2), x +   38.183 * s);
			_setf(o + (19 << 2), y +  -52.441 * s);
			_setf(o + (20 << 2), x +   52.538 * s);
			_setf(o + (21 << 2), y +  -18.115 * s);
			_setf(o + (22 << 2), x +   64.550 * s);
			_setf(o + (23 << 2), y +  -52.441 * s);
			_setf(o + (24 << 2), x +   73.681 * s);
			_setf(o + (25 << 2), y +  -52.441 * s);
			_setf(o + (26 << 2), x +   54.931 * s);
			_setf(o + (27 << 2), y +    0.977 * s);
			_setf(o + (28 << 2), x +   74.413 * s);
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
			_setb(o +  9, 2);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 1);
			
			case 120:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   38.427 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   24.170 * s);
			_setf(o + ( 3 << 2), y +  -19.043 * s);
			_setf(o + ( 4 << 2), x +   11.426 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    0.586 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   19.580 * s);
			_setf(o + ( 9 << 2), y +  -26.757 * s);
			_setf(o + (10 << 2), x +    2.148 * s);
			_setf(o + (11 << 2), y +  -52.294 * s);
			_setf(o + (12 << 2), x +   12.597 * s);
			_setf(o + (13 << 2), y +  -52.294 * s);
			_setf(o + (14 << 2), x +   24.316 * s);
			_setf(o + (15 << 2), y +  -34.326 * s);
			_setf(o + (16 << 2), x +   37.451 * s);
			_setf(o + (17 << 2), y +  -52.294 * s);
			_setf(o + (18 << 2), x +   47.704 * s);
			_setf(o + (19 << 2), y +  -52.294 * s);
			_setf(o + (20 << 2), x +   28.710 * s);
			_setf(o + (21 << 2), y +  -26.757 * s);
			_setf(o + (22 << 2), x +   49.511 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   38.427 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   50.097 * s);
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
			
			case 121:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   26.562 * s);
			_setf(o + ( 1 << 2), y +    8.887 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   26.562 * s,y +    8.887 * s,x +   25.359 * s,y +   12.207 * s,x +   22.827 * s,y +   14.974 * s,x +   18.969 * s,y +   17.187 * s, threshold);
			_vr.bezier8(x +   18.969 * s,y +   17.187 * s,x +   15.112 * s,y +   19.401 * s,x +   10.807 * s,y +   20.508 * s,x +    6.055 * s,y +   20.508 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    6.055 * s);
			_setf(o + ( 1 << 2), y +   12.207 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    6.055 * s,y +   12.207 * s,x +    9.928 * s,y +   12.207 * s,x +   13.248 * s,y +   11.304 * s,x +   16.015 * s,y +    9.497 * s, threshold);
			_vr.bezier8(x +   16.015 * s,y +    9.497 * s,x +   18.782 * s,y +    7.690 * s,x +   20.166 * s,y +    5.485 * s,x +   20.166 * s,y +    2.881 * s, threshold);
			_vr.bezier8(x +   20.166 * s,y +    2.881 * s,x +   20.166 * s,y +    0.016 * s,x +   19.661 * s,y +   -2.808 * s,x +   18.652 * s,y +   -5.591 * s, threshold);
			_vr.bezier8(x +   18.652 * s,y +   -5.591 * s,x +   17.643 * s,y +   -8.374 * s,x +   16.342 * s,y +  -11.817 * s,x +   14.746 * s,y +  -15.918 * s, threshold);
			o = _posf(14);
			_setf(o + ( 0 << 2), x +    0.586 * s);
			_setf(o + ( 1 << 2), y +  -52.294 * s);
			_setf(o + ( 2 << 2), x +   10.058 * s);
			_setf(o + ( 3 << 2), y +  -52.294 * s);
			_setf(o + ( 4 << 2), x +   25.439 * s);
			_setf(o + ( 5 << 2), y +  -11.865 * s);
			_setf(o + ( 6 << 2), x +   39.257 * s);
			_setf(o + ( 7 << 2), y +  -52.294 * s);
			_setf(o + ( 8 << 2), x +   48.730 * s);
			_setf(o + ( 9 << 2), y +  -52.294 * s);
			_setf(o + (10 << 2), x +   26.562 * s);
			_setf(o + (11 << 2), y +    8.887 * s);
			_setf(o + (12 << 2), x +   49.316 * s);
			_setf(o + (13 << 2), y +       0. * s);
			o = _posb(7);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 1);
			
			case 122:
			
			o = _posf(24);
			_setf(o + ( 0 << 2), x +   16.503 * s);
			_setf(o + ( 1 << 2), y +   -8.301 * s);
			_setf(o + ( 2 << 2), x +   45.507 * s);
			_setf(o + ( 3 << 2), y +   -8.301 * s);
			_setf(o + ( 4 << 2), x +   45.507 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    1.953 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    1.953 * s);
			_setf(o + ( 9 << 2), y +   -2.441 * s);
			_setf(o + (10 << 2), x +   31.688 * s);
			_setf(o + (11 << 2), y +  -43.993 * s);
			_setf(o + (12 << 2), x +    2.441 * s);
			_setf(o + (13 << 2), y +  -43.993 * s);
			_setf(o + (14 << 2), x +    2.441 * s);
			_setf(o + (15 << 2), y +  -52.294 * s);
			_setf(o + (16 << 2), x +   45.214 * s);
			_setf(o + (17 << 2), y +  -52.294 * s);
			_setf(o + (18 << 2), x +   45.214 * s);
			_setf(o + (19 << 2), y +  -49.657 * s);
			_setf(o + (20 << 2), x +   16.503 * s);
			_setf(o + (21 << 2), y +   -8.301 * s);
			_setf(o + (22 << 2), x +   47.460 * s);
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
			
			case 123:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   27.734 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   27.734 * s,y +   20.508 * s,x +   22.167 * s,y +   20.508 * s,x +   17.561 * s,y +   19.173 * s,x +   13.916 * s,y +   16.504 * s, threshold);
			_vr.bezier8(x +   13.916 * s,y +   16.504 * s,x +   10.270 * s,y +   13.834 * s,x +    8.447 * s,y +   10.319 * s,x +    8.447 * s,y +    5.957 * s, threshold);
			_vr.bezier8(x +    8.447 * s,y +    5.957 * s,x +    8.447 * s,y +    3.678 * s,x +    9.049 * s,y +    0.195 * s,x +   10.253 * s,y +   -4.492 * s, threshold);
			_vr.bezier8(x +   10.253 * s,y +   -4.492 * s,x +   11.458 * s,y +   -9.180 * s,x +   12.060 * s,y +  -12.744 * s,x +   12.060 * s,y +  -15.185 * s, threshold);
			_vr.bezier8(x +   12.060 * s,y +  -15.185 * s,x +   12.060 * s,y +  -21.631 * s,x +    8.658 * s,y +  -25.081 * s,x +    1.855 * s,y +  -25.537 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    1.855 * s);
			_setf(o + ( 1 << 2), y +  -29.638 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    1.855 * s,y +  -29.638 * s,x +    5.078 * s,y +  -29.899 * s,x +    7.584 * s,y +  -31.030 * s,x +    9.375 * s,y +  -33.032 * s, threshold);
			_vr.bezier8(x +    9.375 * s,y +  -33.032 * s,x +   11.165 * s,y +  -35.034 * s,x +   12.060 * s,y +  -37.630 * s,x +   12.060 * s,y +  -40.820 * s, threshold);
			_vr.bezier8(x +   12.060 * s,y +  -40.820 * s,x +   12.060 * s,y +  -43.033 * s,x +   11.458 * s,y +  -46.183 * s,x +   10.253 * s,y +  -50.268 * s, threshold);
			_vr.bezier8(x +   10.253 * s,y +  -50.268 * s,x +    9.049 * s,y +  -54.353 * s,x +    8.447 * s,y +  -57.388 * s,x +    8.447 * s,y +  -59.374 * s, threshold);
			_vr.bezier8(x +    8.447 * s,y +  -59.374 * s,x +    8.447 * s,y +  -63.541 * s,x +   10.262 * s,y +  -66.910 * s,x +   13.891 * s,y +  -69.481 * s, threshold);
			_vr.bezier8(x +   13.891 * s,y +  -69.481 * s,x +   17.521 * s,y +  -72.053 * s,x +   21.988 * s,y +  -73.339 * s,x +   27.294 * s,y +  -73.339 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   34.521 * s);
			_setf(o + ( 1 << 2), y +  -73.339 * s);
			_setf(o + ( 2 << 2), x +   34.521 * s);
			_setf(o + ( 3 << 2), y +  -66.845 * s);
			_setf(o + ( 4 << 2), x +   25.976 * s);
			_setf(o + ( 5 << 2), y +  -66.845 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   25.976 * s,y +  -66.845 * s,x +   20.638 * s,y +  -66.845 * s,x +   17.968 * s,y +  -63.850 * s,x +   17.968 * s,y +  -57.860 * s, threshold);
			_vr.bezier8(x +   17.968 * s,y +  -57.860 * s,x +   17.968 * s,y +  -55.745 * s,x +   18.481 * s,y +  -53.027 * s,x +   19.506 * s,y +  -49.706 * s, threshold);
			_vr.bezier8(x +   19.506 * s,y +  -49.706 * s,x +   20.532 * s,y +  -46.386 * s,x +   21.044 * s,y +  -43.733 * s,x +   21.044 * s,y +  -41.747 * s, threshold);
			_vr.bezier8(x +   21.044 * s,y +  -41.747 * s,x +   21.044 * s,y +  -36.604 * s,x +   17.382 * s,y +  -31.917 * s,x +   10.058 * s,y +  -27.685 * s, threshold);
			_vr.bezier8(x +   10.058 * s,y +  -27.685 * s,x +   13.476 * s,y +  -26.285 * s,x +   16.162 * s,y +  -24.463 * s,x +   18.115 * s,y +  -22.216 * s, threshold);
			_vr.bezier8(x +   18.115 * s,y +  -22.216 * s,x +   20.068 * s,y +  -19.970 * s,x +   21.044 * s,y +  -17.724 * s,x +   21.044 * s,y +  -15.478 * s, threshold);
			_vr.bezier8(x +   21.044 * s,y +  -15.478 * s,x +   21.044 * s,y +  -13.362 * s,x +   20.532 * s,y +  -10.433 * s,x +   19.506 * s,y +   -6.689 * s, threshold);
			_vr.bezier8(x +   19.506 * s,y +   -6.689 * s,x +   18.481 * s,y +   -2.946 * s,x +   17.968 * s,y +    0.130 * s,x +   17.968 * s,y +    2.539 * s, threshold);
			_vr.bezier8(x +   17.968 * s,y +    2.539 * s,x +   17.968 * s,y +    9.961 * s,x +   22.249 * s,y +   13.672 * s,x +   30.810 * s,y +   13.672 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   34.521 * s);
			_setf(o + ( 1 << 2), y +   13.672 * s);
			_setf(o + ( 2 << 2), x +   34.521 * s);
			_setf(o + ( 3 << 2), y +   20.508 * s);
			_setf(o + ( 4 << 2), x +   27.734 * s);
			_setf(o + ( 5 << 2), y +   20.508 * s);
			_setf(o + ( 6 << 2), x +   36.718 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			
			case 124:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   22.558 * s);
			_setf(o + ( 1 << 2), y +   13.476 * s);
			_setf(o + ( 2 << 2), x +   22.558 * s);
			_setf(o + ( 3 << 2), y +  -68.602 * s);
			_setf(o + ( 4 << 2), x +   29.687 * s);
			_setf(o + ( 5 << 2), y +  -68.602 * s);
			_setf(o + ( 6 << 2), x +   29.687 * s);
			_setf(o + ( 7 << 2), y +   13.476 * s);
			_setf(o + ( 8 << 2), x +   22.558 * s);
			_setf(o + ( 9 << 2), y +   13.476 * s);
			_setf(o + (10 << 2), x +   52.441 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 125:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    1.855 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			_setf(o + ( 2 << 2), x +    1.855 * s);
			_setf(o + ( 3 << 2), y +   13.672 * s);
			_setf(o + ( 4 << 2), x +    5.566 * s);
			_setf(o + ( 5 << 2), y +   13.672 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +    5.566 * s,y +   13.672 * s,x +   14.127 * s,y +   13.672 * s,x +   18.407 * s,y +    9.961 * s,x +   18.407 * s,y +    2.539 * s, threshold);
			_vr.bezier8(x +   18.407 * s,y +    2.539 * s,x +   18.407 * s,y +    0.130 * s,x +   17.895 * s,y +   -2.946 * s,x +   16.869 * s,y +   -6.689 * s, threshold);
			_vr.bezier8(x +   16.869 * s,y +   -6.689 * s,x +   15.844 * s,y +  -10.433 * s,x +   15.331 * s,y +  -13.362 * s,x +   15.331 * s,y +  -15.478 * s, threshold);
			_vr.bezier8(x +   15.331 * s,y +  -15.478 * s,x +   15.331 * s,y +  -17.724 * s,x +   16.308 * s,y +  -19.970 * s,x +   18.261 * s,y +  -22.216 * s, threshold);
			_vr.bezier8(x +   18.261 * s,y +  -22.216 * s,x +   20.214 * s,y +  -24.463 * s,x +   22.900 * s,y +  -26.285 * s,x +   26.317 * s,y +  -27.685 * s, threshold);
			_vr.bezier8(x +   26.317 * s,y +  -27.685 * s,x +   18.993 * s,y +  -31.917 * s,x +   15.331 * s,y +  -36.604 * s,x +   15.331 * s,y +  -41.747 * s, threshold);
			_vr.bezier8(x +   15.331 * s,y +  -41.747 * s,x +   15.331 * s,y +  -43.733 * s,x +   15.844 * s,y +  -46.386 * s,x +   16.869 * s,y +  -49.706 * s, threshold);
			_vr.bezier8(x +   16.869 * s,y +  -49.706 * s,x +   17.895 * s,y +  -53.027 * s,x +   18.407 * s,y +  -55.745 * s,x +   18.407 * s,y +  -57.860 * s, threshold);
			_vr.bezier8(x +   18.407 * s,y +  -57.860 * s,x +   18.407 * s,y +  -63.850 * s,x +   15.738 * s,y +  -66.845 * s,x +   10.400 * s,y +  -66.845 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    1.855 * s);
			_setf(o + ( 1 << 2), y +  -66.845 * s);
			_setf(o + ( 2 << 2), x +    1.855 * s);
			_setf(o + ( 3 << 2), y +  -73.339 * s);
			_setf(o + ( 4 << 2), x +    9.081 * s);
			_setf(o + ( 5 << 2), y +  -73.339 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +    9.081 * s,y +  -73.339 * s,x +   14.387 * s,y +  -73.339 * s,x +   18.855 * s,y +  -72.053 * s,x +   22.485 * s,y +  -69.481 * s, threshold);
			_vr.bezier8(x +   22.485 * s,y +  -69.481 * s,x +   26.114 * s,y +  -66.910 * s,x +   27.929 * s,y +  -63.541 * s,x +   27.929 * s,y +  -59.374 * s, threshold);
			_vr.bezier8(x +   27.929 * s,y +  -59.374 * s,x +   27.929 * s,y +  -57.388 * s,x +   27.327 * s,y +  -54.353 * s,x +   26.122 * s,y +  -50.268 * s, threshold);
			_vr.bezier8(x +   26.122 * s,y +  -50.268 * s,x +   24.918 * s,y +  -46.183 * s,x +   24.316 * s,y +  -43.033 * s,x +   24.316 * s,y +  -40.820 * s, threshold);
			_vr.bezier8(x +   24.316 * s,y +  -40.820 * s,x +   24.316 * s,y +  -37.630 * s,x +   25.211 * s,y +  -35.034 * s,x +   27.001 * s,y +  -33.032 * s, threshold);
			_vr.bezier8(x +   27.001 * s,y +  -33.032 * s,x +   28.791 * s,y +  -31.030 * s,x +   31.298 * s,y +  -29.899 * s,x +   34.520 * s,y +  -29.638 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   34.520 * s);
			_setf(o + ( 1 << 2), y +  -25.537 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   34.520 * s,y +  -25.537 * s,x +   27.717 * s,y +  -25.081 * s,x +   24.316 * s,y +  -21.631 * s,x +   24.316 * s,y +  -15.185 * s, threshold);
			_vr.bezier8(x +   24.316 * s,y +  -15.185 * s,x +   24.316 * s,y +  -12.776 * s,x +   24.918 * s,y +   -9.253 * s,x +   26.122 * s,y +   -4.614 * s, threshold);
			_vr.bezier8(x +   26.122 * s,y +   -4.614 * s,x +   27.327 * s,y +    0.024 * s,x +   27.929 * s,y +    3.548 * s,x +   27.929 * s,y +    5.957 * s, threshold);
			_vr.bezier8(x +   27.929 * s,y +    5.957 * s,x +   27.929 * s,y +   10.319 * s,x +   26.106 * s,y +   13.834 * s,x +   22.460 * s,y +   16.504 * s, threshold);
			_vr.bezier8(x +   22.460 * s,y +   16.504 * s,x +   18.814 * s,y +   19.173 * s,x +   14.208 * s,y +   20.508 * s,x +    8.642 * s,y +   20.508 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    1.855 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			_setf(o + ( 2 << 2), x +   36.718 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 126:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   44.140 * s);
			_setf(o + ( 1 << 2), y +  -34.960 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   44.140 * s,y +  -34.960 * s,x +   42.414 * s,y +  -28.222 * s,x +   39.289 * s,y +  -24.853 * s,x +   34.765 * s,y +  -24.853 * s, threshold);
			_vr.bezier8(x +   34.765 * s,y +  -24.853 * s,x +   32.193 * s,y +  -24.853 * s,x +   28.889 * s,y +  -25.480 * s,x +   24.853 * s,y +  -26.733 * s, threshold);
			_vr.bezier8(x +   24.853 * s,y +  -26.733 * s,x +   20.816 * s,y +  -27.986 * s,x +   18.342 * s,y +  -28.613 * s,x +   17.431 * s,y +  -28.613 * s, threshold);
			_vr.bezier8(x +   17.431 * s,y +  -28.613 * s,x +   15.120 * s,y +  -28.613 * s,x +   13.362 * s,y +  -27.360 * s,x +   12.158 * s,y +  -24.853 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    7.714 * s);
			_setf(o + ( 1 << 2), y +  -24.853 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    7.714 * s,y +  -24.853 * s,x +    8.170 * s,y +  -27.587 * s,x +    9.220 * s,y +  -29.956 * s,x +   10.864 * s,y +  -31.958 * s, threshold);
			_vr.bezier8(x +   10.864 * s,y +  -31.958 * s,x +   12.508 * s,y +  -33.959 * s,x +   14.453 * s,y +  -34.960 * s,x +   16.699 * s,y +  -34.960 * s, threshold);
			_vr.bezier8(x +   16.699 * s,y +  -34.960 * s,x +   19.531 * s,y +  -34.960 * s,x +   22.826 * s,y +  -34.334 * s,x +   26.586 * s,y +  -33.081 * s, threshold);
			_vr.bezier8(x +   26.586 * s,y +  -33.081 * s,x +   30.346 * s,y +  -31.827 * s,x +   33.007 * s,y +  -31.201 * s,x +   34.569 * s,y +  -31.201 * s, threshold);
			_vr.bezier8(x +   34.569 * s,y +  -31.201 * s,x +   37.206 * s,y +  -31.201 * s,x +   38.964 * s,y +  -32.454 * s,x +   39.843 * s,y +  -34.960 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   44.140 * s);
			_setf(o + ( 1 << 2), y +  -34.960 * s);
			_setf(o + ( 2 << 2), x +   52.440 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
		}
	}
	#end
}