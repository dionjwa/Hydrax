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

class TrebuchetMSItalic extends de.polygonal.gl.text.ProportionalVectorFont
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
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,  617,  752,  665, 1074,  985, 1229, 1446,  327,
		 752,  752,  752, 1074,  752,  752,  752, 1074, 1074, 1074, 1074, 1074, 1074, 1074, 1074, 1074, 1074, 1074,  752,  752,
		1074, 1074, 1074,  752, 1578, 1251, 1159, 1225, 1256, 1097, 1075, 1385, 1340,  570,  976, 1179, 1037, 1559, 1307, 1380,
		1113, 1380, 1192,  985, 1189, 1328, 1203, 1745, 1140, 1168, 1127,  752,  728,  752, 1074, 1074, 1074, 1076, 1141,  942,
		1141, 1100,  822, 1028, 1141,  628,  751, 1033,  656, 1700, 1119, 1099, 1141, 1141,  853,  829,  860, 1140, 1003, 1524,
		1026, 1010,  972,  752, 1074,  752, 1074
	];

	static var KERNING_TABLE:Array<Int> =
	[
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,  127,    0,    0,    0,    0,  142,    0,    0,    0,    0,    0,  149,    0,    0,    0,
		 160,    0,  167,    0,  176,    0,  211,  238,    0,  253,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,  282,    0,    0,    0,  289,  294,
		   0,  299,    0,    0,    0,    0,    0,   14,   84, -230,   86, -252,   87, -202,   89, -247,  118, -167,  119, -150,
		 121,  -79,    6,   44, -400,   46, -400,   65, -230,   10,   84, -213,   86, -174,   87, -171,   89, -249,  121,  -89,
		   6,   44, -400,   46, -400,   65, -245,    8,   84,  -98,   86, -115,   87,  -89,   89, -137,   34,   44, -300,   45,
		-230,   46, -300,   58, -150,   59, -150,   65, -230,   79,  -98,   97, -249,   99, -249,  101, -249,  105,  -53,  111,
		-240,  114, -213,  115, -223,  117, -221,  119, -221,  121, -195,   26,   44, -273,   45, -111,   46, -273,   58,  -37,
		  59,  -37,   65, -250,   97, -137,  101, -137,  105,  -54,  111, -163,  114, -124,  117,  -80,  121,  -46,   14,   44,
		-258,   45,  -98,   46, -197,   65, -176,   97,  -98,  101, -132,  105,  -35,   28,   44, -300,   45, -230,   46, -300,
		  58,  -76,   59,  -76,   65, -261,   97, -213,  101, -217,  105,  -63,  111, -208,  112, -165,  113, -226,  117, -163,
		 118, -111,    6,   44, -269,   45, -150,   46, -269,    4,   44, -250,   46, -250,    4,   44, -234,   46, -234,    4,
		  44, -239,   46, -239
	];

	static var BOUNDS_TABLE:Array<Float> =
	[
		  33,      6.445,    -72.802,     30.468,      0.977,
		  34,      9.424,    -71.630,     36.620,    -53.027,
		  35,      4.639,    -72.606,     55.859,      0.977,
		  36,      5.664,    -82.323,     48.290,      8.838,
		  37,      0.781,    -72.802,     63.036,      0.977,
		  38,      6.933,    -72.802,     66.698,      0.977,
		  39,      9.375,    -71.630,     20.459,    -53.027,
		  40,      8.496,    -72.020,     37.646,     20.898,
		  41,      1.221,    -72.020,     31.298,     20.898,
		  42,      8.057,    -71.776,     39.062,    -41.650,
		  43,      5.957,    -51.220,     46.875,    -10.742,
		  44,      6.738,    -14.160,     25.146,     16.357,
		  45,      7.031,    -33.251,     29.394,    -24.707,
		  46,      8.056,    -13.720,     22.705,      0.977,
		  47,      9.228,    -71.825,     42.920,          0,
		  48,      3.320,    -72.802,     53.271,      0.977,
		  49,     16.747,    -71.825,     44.091,          0,
		  50,      3.076,    -72.802,     48.681,          0,
		  51,      2.295,    -72.802,     49.267,      0.977,
		  52,      1.221,    -71.825,     52.294,          0,
		  53,      3.906,    -71.825,     51.855,      0.977,
		  54,      5.566,    -72.802,     49.950,      1.221,
		  55,      4.883,    -71.825,     57.323,          0,
		  56,      4.102,    -72.802,     52.538,      0.977,
		  57,      8.594,    -72.802,     52.978,      1.221,
		  58,      9.961,    -52.294,     28.906,      0.977,
		  59,      6.738,    -52.294,     28.906,     16.357,
		  60,      7.324,    -51.415,     43.408,    -10.644,
		  61,      5.957,    -42.773,     46.874,    -19.287,
		  62,     12.403,    -51.415,     48.486,    -10.644,
		  63,      7.129,    -72.802,     40.966,      0.977,
		  64,      5.957,    -64.696,     75.292,      6.543,
		  65,     -1.562,    -72.509,     57.030,          0,
		  66,      4.248,    -72.606,     55.566,      0.586,
		  67,      6.885,    -72.753,     58.788,      1.221,
		  68,      3.271,    -72.655,     60.887,          0,
		  69,      2.295,    -71.532,     58.153,          0,
		  70,      2.686,    -71.532,     59.960,          0,
		  71,      5.468,    -72.753,     63.036,      1.221,
		  72,      3.271,    -71.532,     67.186,          0,
		  73,      3.662,    -71.532,     26.269,          0,
		  74,     -0.781,    -71.532,     47.362,      0.977,
		  75,      3.369,    -71.532,     63.280,          0,
		  76,      4.101,    -71.532,     47.948,          0,
		  77,      0.195,    -71.532,     70.702,      0.977,
		  78,      2.881,    -71.532,     64.696,      0.977,
		  79,      5.567,    -72.802,     67.040,      1.221,
		  80,      2.637,    -72.509,     56.982,          0,
		  81,      4.883,    -72.802,     78.075,     18.164,
		  82,      3.467,    -72.265,     57.177,          0,
		  83,      4.248,    -72.753,     46.875,      1.221,
		  84,      7.666,    -71.532,     65.527,          0,
		  85,      6.543,    -71.532,     66.015,      1.221,
		  86,      8.691,    -71.532,     66.161,      0.977,
		  87,      9.082,    -71.532,     93.016,      0.977,
		  88,     -3.613,    -71.581,     62.304,          0,
		  89,      8.887,    -71.532,     64.794,          0,
		  90,      3.906,    -71.532,     57.812,          0,
		  91,      1.074,    -73.729,     40.771,     20.508,
		  92,      9.033,    -71.825,     30.907,          0,
		  93,     -0.342,    -73.729,     39.355,     20.508,
		  94,     14.258,    -71.825,     50.439,    -44.091,
		  95,     -0.391,      6.103,     52.587,     12.402,
		  96,     24.658,    -76.073,     37.158,    -59.813,
		  97,      3.027,    -53.271,     51.366,      0.977,
		  98,      1.319,    -73.729,     53.124,      0.977,
		  99,      4.395,    -53.271,     45.312,      0.977,
		 100,      4.004,    -73.729,     58.349,      0.928,
		 101,      5.078,    -53.271,     52.001,      0.977,
		 102,     -2.051,    -73.729,     45.654,     19.922,
		 103,     -0.635,    -54.735,     50.341,     20.508,
		 104,      3.808,    -73.729,     51.806,          0,
		 105,      6.738,    -72.802,     28.222,          0,
		 106,     -6.787,    -72.802,     34.863,     20.263,
		 107,      5.175,    -73.729,     48.729,          0,
		 108,      7.129,    -73.729,     28.613,      0.977,
		 109,      3.125,    -53.271,     79.589,          0,
		 110,      3.808,    -53.271,     51.659,          0,
		 111,      3.564,    -53.271,     52.196,      0.977,
		 112,     -0.732,    -53.027,     53.759,     20.752,
		 113,      3.858,    -53.271,     56.249,     20.508,
		 114,      4.297,    -53.271,     43.408,          0,
		 115,      0.439,    -53.271,     40.331,      0.977,
		 116,      8.984,    -67.235,     40.868,      0.977,
		 117,      4.737,    -52.294,     54.589,      0.977,
		 118,      4.833,    -52.441,     54.442,      0.977,
		 119,      5.616,    -52.441,     78.075,      0.977,
		 120,     -0.684,    -52.294,     52.734,          0,
		 121,      1.514,    -52.294,     53.466,     20.508,
		 122,      0.390,    -52.294,     47.948,          0,
		 123,      1.709,    -73.339,     42.773,     20.508,
		 124,     22.558,    -68.602,     29.687,     13.476,
		 125,     -6.397,    -73.339,     35.106,     20.508,
		 126,      6.250,    -38.183,     46.239,    -24.267
	];

	override function _draw(charCode:Int, x:Float, y:Float, s:Float, threshold:Float):Void
	{
		var o = 0;
		switch (charCode)
		{			
			case 33:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   17.138 * s);
			_setf(o + ( 1 << 2), y +  -18.652 * s);
			_setf(o + ( 2 << 2), x +   13.672 * s);
			_setf(o + ( 3 << 2), y +  -18.652 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   13.672 * s,y +  -18.652 * s,x +   13.867 * s,y +  -30.501 * s,x +   14.160 * s,y +  -38.476 * s,x +   14.551 * s,y +  -42.577 * s, threshold);
			_vr.bezier8(x +   14.551 * s,y +  -42.577 * s,x +   14.941 * s,y +  -46.679 * s,x +   15.388 * s,y +  -50.079 * s,x +   15.869 * s,y +  -52.782 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   19.433 * s);
			_setf(o + ( 1 << 2), y +  -72.802 * s);
			_setf(o + ( 2 << 2), x +   30.468 * s);
			_setf(o + ( 3 << 2), y +  -72.802 * s);
			_setf(o + ( 4 << 2), x +   27.001 * s);
			_setf(o + ( 5 << 2), y +  -52.831 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   27.001 * s,y +  -52.831 * s,x +   25.917 * s,y +  -46.583 * s,x +   22.640 * s,y +  -35.188 * s,x +   17.138 * s,y +  -18.652 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   13.379 * s);
			_setf(o + ( 1 << 2), y +  -12.842 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   13.379 * s,y +  -12.842 * s,x +   15.299 * s,y +  -12.842 * s,x +   16.935 * s,y +  -12.166 * s,x +   18.286 * s,y +  -10.815 * s, threshold);
			_vr.bezier8(x +   18.286 * s,y +  -10.815 * s,x +   19.637 * s,y +   -9.464 * s,x +   20.312 * s,y +   -7.829 * s,x +   20.312 * s,y +   -5.908 * s, threshold);
			_vr.bezier8(x +   20.312 * s,y +   -5.908 * s,x +   20.312 * s,y +   -3.988 * s,x +   19.637 * s,y +   -2.360 * s,x +   18.286 * s,y +   -1.025 * s, threshold);
			_vr.bezier8(x +   18.286 * s,y +   -1.025 * s,x +   16.935 * s,y +    0.309 * s,x +   15.299 * s,y +    0.977 * s,x +   13.379 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   13.379 * s,y +    0.977 * s,x +   11.458 * s,y +    0.977 * s,x +    9.822 * s,y +    0.309 * s,x +    8.471 * s,y +   -1.025 * s, threshold);
			_vr.bezier8(x +    8.471 * s,y +   -1.025 * s,x +    7.121 * s,y +   -2.360 * s,x +    6.445 * s,y +   -3.988 * s,x +    6.445 * s,y +   -5.908 * s, threshold);
			_vr.bezier8(x +    6.445 * s,y +   -5.908 * s,x +    6.445 * s,y +   -7.829 * s,x +    7.121 * s,y +   -9.464 * s,x +    8.471 * s,y +  -10.815 * s, threshold);
			_vr.bezier8(x +    8.471 * s,y +  -10.815 * s,x +    9.822 * s,y +  -12.166 * s,x +   11.458 * s,y +  -12.842 * s,x +   13.379 * s,y +  -12.842 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.718 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 34:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +   15.918 * s);
			_setf(o + ( 1 << 2), y +  -53.027 * s);
			_setf(o + ( 2 << 2), x +    9.424 * s);
			_setf(o + ( 3 << 2), y +  -53.027 * s);
			_setf(o + ( 4 << 2), x +   11.523 * s);
			_setf(o + ( 5 << 2), y +  -71.630 * s);
			_setf(o + ( 6 << 2), x +   20.507 * s);
			_setf(o + ( 7 << 2), y +  -71.630 * s);
			_setf(o + ( 8 << 2), x +   15.918 * s);
			_setf(o + ( 9 << 2), y +  -53.027 * s);
			_setf(o + (10 << 2), x +   32.031 * s);
			_setf(o + (11 << 2), y +  -53.027 * s);
			_setf(o + (12 << 2), x +   25.537 * s);
			_setf(o + (13 << 2), y +  -53.027 * s);
			_setf(o + (14 << 2), x +   27.636 * s);
			_setf(o + (15 << 2), y +  -71.630 * s);
			_setf(o + (16 << 2), x +   36.620 * s);
			_setf(o + (17 << 2), y +  -71.630 * s);
			_setf(o + (18 << 2), x +   32.031 * s);
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
			_setf(o + ( 0 << 2), x +   45.752 * s);
			_setf(o + ( 1 << 2), y +  -46.240 * s);
			_setf(o + ( 2 << 2), x +   40.918 * s);
			_setf(o + ( 3 << 2), y +  -27.050 * s);
			_setf(o + ( 4 << 2), x +   48.779 * s);
			_setf(o + ( 5 << 2), y +  -27.050 * s);
			_setf(o + ( 6 << 2), x +   48.779 * s);
			_setf(o + ( 7 << 2), y +  -20.800 * s);
			_setf(o + ( 8 << 2), x +   39.306 * s);
			_setf(o + ( 9 << 2), y +  -20.800 * s);
			_setf(o + (10 << 2), x +   33.252 * s);
			_setf(o + (11 << 2), y +    0.977 * s);
			_setf(o + (12 << 2), x +   27.051 * s);
			_setf(o + (13 << 2), y +    0.977 * s);
			_setf(o + (14 << 2), x +   33.105 * s);
			_setf(o + (15 << 2), y +  -20.800 * s);
			_setf(o + (16 << 2), x +   18.603 * s);
			_setf(o + (17 << 2), y +  -20.800 * s);
			_setf(o + (18 << 2), x +   12.549 * s);
			_setf(o + (19 << 2), y +    0.977 * s);
			_setf(o + (20 << 2), x +    6.201 * s);
			_setf(o + (21 << 2), y +    0.977 * s);
			_setf(o + (22 << 2), x +   12.207 * s);
			_setf(o + (23 << 2), y +  -20.800 * s);
			_setf(o + (24 << 2), x +    4.639 * s);
			_setf(o + (25 << 2), y +  -20.800 * s);
			_setf(o + (26 << 2), x +    4.639 * s);
			_setf(o + (27 << 2), y +  -27.050 * s);
			_setf(o + (28 << 2), x +   13.818 * s);
			_setf(o + (29 << 2), y +  -27.050 * s);
			_setf(o + (30 << 2), x +   18.652 * s);
			_setf(o + (31 << 2), y +  -46.240 * s);
			_setf(o + (32 << 2), x +   10.254 * s);
			_setf(o + (33 << 2), y +  -46.240 * s);
			_setf(o + (34 << 2), x +   10.254 * s);
			_setf(o + (35 << 2), y +  -52.489 * s);
			_setf(o + (36 << 2), x +   20.263 * s);
			_setf(o + (37 << 2), y +  -52.489 * s);
			_setf(o + (38 << 2), x +   25.244 * s);
			_setf(o + (39 << 2), y +  -72.606 * s);
			_setf(o + (40 << 2), x +   31.641 * s);
			_setf(o + (41 << 2), y +  -72.606 * s);
			_setf(o + (42 << 2), x +   26.611 * s);
			_setf(o + (43 << 2), y +  -52.489 * s);
			_setf(o + (44 << 2), x +   41.113 * s);
			_setf(o + (45 << 2), y +  -52.489 * s);
			_setf(o + (46 << 2), x +   46.142 * s);
			_setf(o + (47 << 2), y +  -72.606 * s);
			_setf(o + (48 << 2), x +   52.343 * s);
			_setf(o + (49 << 2), y +  -72.606 * s);
			_setf(o + (50 << 2), x +   47.314 * s);
			_setf(o + (51 << 2), y +  -52.489 * s);
			_setf(o + (52 << 2), x +   55.859 * s);
			_setf(o + (53 << 2), y +  -52.489 * s);
			_setf(o + (54 << 2), x +   55.859 * s);
			_setf(o + (55 << 2), y +  -46.240 * s);
			_setf(o + (56 << 2), x +   45.752 * s);
			_setf(o + (57 << 2), y +  -46.240 * s);
			_setf(o + (58 << 2), x +   25.049 * s);
			_setf(o + (59 << 2), y +  -46.240 * s);
			_setf(o + (60 << 2), x +   20.215 * s);
			_setf(o + (61 << 2), y +  -27.050 * s);
			_setf(o + (62 << 2), x +   34.717 * s);
			_setf(o + (63 << 2), y +  -27.050 * s);
			_setf(o + (64 << 2), x +   39.551 * s);
			_setf(o + (65 << 2), y +  -46.240 * s);
			_setf(o + (66 << 2), x +   25.049 * s);
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
			
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   25.244 * s);
			_setf(o + ( 1 << 2), y +    1.074 * s);
			_setf(o + ( 2 << 2), x +   23.877 * s);
			_setf(o + ( 3 << 2), y +    8.838 * s);
			_setf(o + ( 4 << 2), x +   16.259 * s);
			_setf(o + ( 5 << 2), y +    8.838 * s);
			_setf(o + ( 6 << 2), x +   17.627 * s);
			_setf(o + ( 7 << 2), y +    0.928 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_vr.bezier8(x +   17.627 * s,y +    0.928 * s,x +   12.646 * s,y +    0.277 * s,x +    8.659 * s,y +   -0.798 * s,x +    5.664 * s,y +   -2.295 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    8.594 * s);
			_setf(o + ( 1 << 2), y +  -11.670 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    8.594 * s,y +  -11.670 * s,x +    9.993 * s,y +  -10.563 * s,x +   12.085 * s,y +   -9.619 * s,x +   14.868 * s,y +   -8.838 * s, threshold);
			_vr.bezier8(x +   14.868 * s,y +   -8.838 * s,x +   17.651 * s,y +   -8.057 * s,x +   20.329 * s,y +   -7.666 * s,x +   22.900 * s,y +   -7.666 * s, threshold);
			_vr.bezier8(x +   22.900 * s,y +   -7.666 * s,x +   26.774 * s,y +   -7.666 * s,x +   29.882 * s,y +   -8.610 * s,x +   32.226 * s,y +  -10.498 * s, threshold);
			_vr.bezier8(x +   32.226 * s,y +  -10.498 * s,x +   34.570 * s,y +  -12.386 * s,x +   35.742 * s,y +  -14.990 * s,x +   35.742 * s,y +  -18.310 * s, threshold);
			_vr.bezier8(x +   35.742 * s,y +  -18.310 * s,x +   35.742 * s,y +  -21.077 * s,x +   34.855 * s,y +  -23.519 * s,x +   33.081 * s,y +  -25.634 * s, threshold);
			_vr.bezier8(x +   33.081 * s,y +  -25.634 * s,x +   31.306 * s,y +  -27.750 * s,x +   28.271 * s,y +  -30.362 * s,x +   23.974 * s,y +  -33.471 * s, threshold);
			_vr.bezier8(x +   23.974 * s,y +  -33.471 * s,x +   19.677 * s,y +  -36.580 * s,x +   16.561 * s,y +  -39.461 * s,x +   14.624 * s,y +  -42.114 * s, threshold);
			_vr.bezier8(x +   14.624 * s,y +  -42.114 * s,x +   12.687 * s,y +  -44.767 * s,x +   11.719 * s,y +  -48.095 * s,x +   11.719 * s,y +  -52.099 * s, threshold);
			_vr.bezier8(x +   11.719 * s,y +  -52.099 * s,x +   11.719 * s,y +  -57.730 * s,x +   13.314 * s,y +  -62.336 * s,x +   16.504 * s,y +  -65.917 * s, threshold);
			_vr.bezier8(x +   16.504 * s,y +  -65.917 * s,x +   19.694 * s,y +  -69.498 * s,x +   24.023 * s,y +  -71.679 * s,x +   29.492 * s,y +  -72.460 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   31.249 * s);
			_setf(o + ( 1 << 2), y +  -82.323 * s);
			_setf(o + ( 2 << 2), x +   38.867 * s);
			_setf(o + ( 3 << 2), y +  -82.323 * s);
			_setf(o + ( 4 << 2), x +   37.158 * s);
			_setf(o + ( 5 << 2), y +  -72.655 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   37.158 * s,y +  -72.655 * s,x +   42.984 * s,y +  -72.297 * s,x +   46.695 * s,y +  -71.695 * s,x +   48.290 * s,y +  -70.849 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   45.507 * s);
			_setf(o + ( 1 << 2), y +  -61.376 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   45.507 * s,y +  -61.376 * s,x +   44.596 * s,y +  -62.125 * s,x +   43.066 * s,y +  -62.825 * s,x +   40.917 * s,y +  -63.476 * s, threshold);
			_vr.bezier8(x +   40.917 * s,y +  -63.476 * s,x +   38.769 * s,y +  -64.127 * s,x +   36.767 * s,y +  -64.452 * s,x +   34.912 * s,y +  -64.452 * s, threshold);
			_vr.bezier8(x +   34.912 * s,y +  -64.452 * s,x +   30.745 * s,y +  -64.452 * s,x +   27.457 * s,y +  -63.508 * s,x +   25.048 * s,y +  -61.620 * s, threshold);
			_vr.bezier8(x +   25.048 * s,y +  -61.620 * s,x +   22.640 * s,y +  -59.732 * s,x +   21.435 * s,y +  -57.014 * s,x +   21.435 * s,y +  -53.466 * s, threshold);
			_vr.bezier8(x +   21.435 * s,y +  -53.466 * s,x +   21.435 * s,y +  -51.969 * s,x +   21.818 * s,y +  -50.520 * s,x +   22.583 * s,y +  -49.120 * s, threshold);
			_vr.bezier8(x +   22.583 * s,y +  -49.120 * s,x +   23.348 * s,y +  -47.721 * s,x +   24.381 * s,y +  -46.459 * s,x +   25.683 * s,y +  -45.336 * s, threshold);
			_vr.bezier8(x +   25.683 * s,y +  -45.336 * s,x +   26.985 * s,y +  -44.213 * s,x +   29.663 * s,y +  -42.138 * s,x +   33.715 * s,y +  -39.111 * s, threshold);
			_vr.bezier8(x +   33.715 * s,y +  -39.111 * s,x +   37.768 * s,y +  -36.083 * s,x +   40.746 * s,y +  -32.999 * s,x +   42.651 * s,y +  -29.858 * s, threshold);
			_vr.bezier8(x +   42.651 * s,y +  -29.858 * s,x +   44.555 * s,y +  -26.717 * s,x +   45.507 * s,y +  -23.063 * s,x +   45.507 * s,y +  -18.896 * s, threshold);
			_vr.bezier8(x +   45.507 * s,y +  -18.896 * s,x +   45.507 * s,y +  -13.069 * s,x +   43.725 * s,y +   -8.439 * s,x +   40.160 * s,y +   -5.005 * s, threshold);
			_vr.bezier8(x +   40.160 * s,y +   -5.005 * s,x +   36.596 * s,y +   -1.571 * s,x +   31.624 * s,y +    0.456 * s,x +   25.244 * s,y +    1.074 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   48.095 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 37:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +    6.982 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			_setf(o + ( 2 << 2), x +    0.781 * s);
			_setf(o + ( 3 << 2), y +    0.977 * s);
			_setf(o + ( 4 << 2), x +   56.884 * s);
			_setf(o + ( 5 << 2), y +  -72.802 * s);
			_setf(o + ( 6 << 2), x +   63.036 * s);
			_setf(o + ( 7 << 2), y +  -72.802 * s);
			_setf(o + ( 8 << 2), x +    6.982 * s);
			_setf(o + ( 9 << 2), y +    0.977 * s);
			_setf(o + (10 << 2), x +    6.006 * s);
			_setf(o + (11 << 2), y +  -51.122 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_vr.bezier8(x +    6.006 * s,y +  -51.122 * s,x +    6.006 * s,y +  -56.851 * s,x +    7.373 * s,y +  -61.897 * s,x +   10.107 * s,y +  -66.259 * s, threshold);
			_vr.bezier8(x +   10.107 * s,y +  -66.259 * s,x +   12.842 * s,y +  -70.621 * s,x +   17.269 * s,y +  -72.802 * s,x +   23.388 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   23.388 * s,y +  -72.802 * s,x +   30.484 * s,y +  -72.802 * s,x +   34.033 * s,y +  -68.814 * s,x +   34.033 * s,y +  -60.839 * s, threshold);
			_vr.bezier8(x +   34.033 * s,y +  -60.839 * s,x +   34.033 * s,y +  -54.947 * s,x +   32.535 * s,y +  -49.877 * s,x +   29.540 * s,y +  -45.629 * s, threshold);
			_vr.bezier8(x +   29.540 * s,y +  -45.629 * s,x +   26.546 * s,y +  -41.381 * s,x +   22.379 * s,y +  -39.257 * s,x +   17.041 * s,y +  -39.257 * s, threshold);
			_vr.bezier8(x +   17.041 * s,y +  -39.257 * s,x +    9.684 * s,y +  -39.257 * s,x +    6.006 * s,y +  -43.212 * s,x +    6.006 * s,y +  -51.122 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   12.207 * s);
			_setf(o + ( 1 << 2), y +  -51.952 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   12.207 * s,y +  -51.952 * s,x +   12.207 * s,y +  -46.809 * s,x +   13.965 * s,y +  -44.238 * s,x +   17.480 * s,y +  -44.238 * s, threshold);
			_vr.bezier8(x +   17.480 * s,y +  -44.238 * s,x +   21.191 * s,y +  -44.238 * s,x +   23.868 * s,y +  -46.077 * s,x +   25.512 * s,y +  -49.755 * s, threshold);
			_vr.bezier8(x +   25.512 * s,y +  -49.755 * s,x +   27.156 * s,y +  -53.433 * s,x +   27.978 * s,y +  -57.128 * s,x +   27.978 * s,y +  -60.839 * s, threshold);
			_vr.bezier8(x +   27.978 * s,y +  -60.839 * s,x +   27.978 * s,y +  -65.494 * s,x +   26.106 * s,y +  -67.821 * s,x +   22.363 * s,y +  -67.821 * s, threshold);
			_vr.bezier8(x +   22.363 * s,y +  -67.821 * s,x +   19.368 * s,y +  -67.821 * s,x +   16.927 * s,y +  -66.242 * s,x +   15.039 * s,y +  -63.085 * s, threshold);
			_vr.bezier8(x +   15.039 * s,y +  -63.085 * s,x +   13.151 * s,y +  -59.927 * s,x +   12.207 * s,y +  -56.217 * s,x +   12.207 * s,y +  -51.952 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   31.787 * s);
			_setf(o + ( 1 << 2), y +  -10.986 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   31.787 * s,y +  -10.986 * s,x +   31.787 * s,y +  -16.780 * s,x +   33.154 * s,y +  -21.850 * s,x +   35.888 * s,y +  -26.196 * s, threshold);
			_vr.bezier8(x +   35.888 * s,y +  -26.196 * s,x +   38.622 * s,y +  -30.542 * s,x +   43.050 * s,y +  -32.714 * s,x +   49.169 * s,y +  -32.714 * s, threshold);
			_vr.bezier8(x +   49.169 * s,y +  -32.714 * s,x +   56.298 * s,y +  -32.714 * s,x +   59.862 * s,y +  -28.727 * s,x +   59.862 * s,y +  -20.752 * s, threshold);
			_vr.bezier8(x +   59.862 * s,y +  -20.752 * s,x +   59.862 * s,y +  -15.023 * s,x +   58.389 * s,y +   -9.993 * s,x +   55.443 * s,y +   -5.664 * s, threshold);
			_vr.bezier8(x +   55.443 * s,y +   -5.664 * s,x +   52.497 * s,y +   -1.335 * s,x +   48.290 * s,y +    0.830 * s,x +   42.822 * s,y +    0.830 * s, threshold);
			_vr.bezier8(x +   42.822 * s,y +    0.830 * s,x +   35.465 * s,y +    0.830 * s,x +   31.787 * s,y +   -3.109 * s,x +   31.787 * s,y +  -10.986 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   37.988 * s);
			_setf(o + ( 1 << 2), y +  -11.865 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   37.988 * s,y +  -11.865 * s,x +   37.988 * s,y +   -6.722 * s,x +   39.745 * s,y +   -4.150 * s,x +   43.261 * s,y +   -4.150 * s, threshold);
			_vr.bezier8(x +   43.261 * s,y +   -4.150 * s,x +   46.972 * s,y +   -4.150 * s,x +   49.649 * s,y +   -5.989 * s,x +   51.293 * s,y +   -9.668 * s, threshold);
			_vr.bezier8(x +   51.293 * s,y +   -9.668 * s,x +   52.937 * s,y +  -13.346 * s,x +   53.759 * s,y +  -17.041 * s,x +   53.759 * s,y +  -20.752 * s, threshold);
			_vr.bezier8(x +   53.759 * s,y +  -20.752 * s,x +   53.759 * s,y +  -25.406 * s,x +   51.887 * s,y +  -27.734 * s,x +   48.144 * s,y +  -27.734 * s, threshold);
			_vr.bezier8(x +   48.144 * s,y +  -27.734 * s,x +   45.084 * s,y +  -27.734 * s,x +   42.626 * s,y +  -26.098 * s,x +   40.771 * s,y +  -22.827 * s, threshold);
			_vr.bezier8(x +   40.771 * s,y +  -22.827 * s,x +   38.915 * s,y +  -19.555 * s,x +   37.988 * s,y +  -15.901 * s,x +   37.988 * s,y +  -11.865 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.009 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 38:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   42.480 * s);
			_setf(o + ( 1 << 2), y +   -2.490 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   42.480 * s,y +   -2.490 * s,x +   37.336 * s,y +   -0.179 * s,x +   31.770 * s,y +    0.977 * s,x +   25.781 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   25.781 * s,y +    0.977 * s,x +   20.084 * s,y +    0.977 * s,x +   15.519 * s,y +   -0.545 * s,x +   12.085 * s,y +   -3.589 * s, threshold);
			_vr.bezier8(x +   12.085 * s,y +   -3.589 * s,x +    8.650 * s,y +   -6.632 * s,x +    6.933 * s,y +  -10.775 * s,x +    6.933 * s,y +  -16.015 * s, threshold);
			_vr.bezier8(x +    6.933 * s,y +  -16.015 * s,x +    6.933 * s,y +  -25.813 * s,x +   10.839 * s,y +  -33.984 * s,x +   18.652 * s,y +  -40.527 * s, threshold);
			_vr.bezier8(x +   18.652 * s,y +  -40.527 * s,x +   15.527 * s,y +  -44.238 * s,x +   13.964 * s,y +  -47.932 * s,x +   13.964 * s,y +  -51.611 * s, threshold);
			_vr.bezier8(x +   13.964 * s,y +  -51.611 * s,x +   13.964 * s,y +  -58.219 * s,x +   16.170 * s,y +  -63.402 * s,x +   20.581 * s,y +  -67.162 * s, threshold);
			_vr.bezier8(x +   20.581 * s,y +  -67.162 * s,x +   24.991 * s,y +  -70.922 * s,x +   30.859 * s,y +  -72.802 * s,x +   38.183 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   38.183 * s,y +  -72.802 * s,x +   43.847 * s,y +  -72.802 * s,x +   47.916 * s,y +  -72.020 * s,x +   50.390 * s,y +  -70.458 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   47.753 * s);
			_setf(o + ( 1 << 2), y +  -61.376 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   47.753 * s,y +  -61.376 * s,x +   44.856 * s,y +  -64.110 * s,x +   41.747 * s,y +  -65.478 * s,x +   38.427 * s,y +  -65.478 * s, threshold);
			_vr.bezier8(x +   38.427 * s,y +  -65.478 * s,x +   33.674 * s,y +  -65.478 * s,x +   29.939 * s,y +  -64.249 * s,x +   27.221 * s,y +  -61.791 * s, threshold);
			_vr.bezier8(x +   27.221 * s,y +  -61.791 * s,x +   24.503 * s,y +  -59.333 * s,x +   23.144 * s,y +  -55.891 * s,x +   23.144 * s,y +  -51.464 * s, threshold);
			_vr.bezier8(x +   23.144 * s,y +  -51.464 * s,x +   23.144 * s,y +  -48.176 * s,x +   24.479 * s,y +  -45.361 * s,x +   27.148 * s,y +  -43.017 * s, threshold);
			o = _posf(16);
			_setf(o + ( 0 << 2), x +   45.312 * s);
			_setf(o + ( 1 << 2), y +  -43.017 * s);
			_setf(o + ( 2 << 2), x +   46.874 * s);
			_setf(o + ( 3 << 2), y +  -51.952 * s);
			_setf(o + ( 4 << 2), x +   56.493 * s);
			_setf(o + ( 5 << 2), y +  -53.368 * s);
			_setf(o + ( 6 << 2), x +   54.540 * s);
			_setf(o + ( 7 << 2), y +  -42.870 * s);
			_setf(o + ( 8 << 2), x +   66.698 * s);
			_setf(o + ( 9 << 2), y +  -42.870 * s);
			_setf(o + (10 << 2), x +   65.331 * s);
			_setf(o + (11 << 2), y +  -35.058 * s);
			_setf(o + (12 << 2), x +   53.173 * s);
			_setf(o + (13 << 2), y +  -35.058 * s);
			_setf(o + (14 << 2), x +   51.269 * s);
			_setf(o + (15 << 2), y +  -25.830 * s);
			o = _posb(8);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_vr.bezier8(x +   51.269 * s,y +  -25.830 * s,x +   50.751 * s,y +  -23.322 * s,x +   50.365 * s,y +  -21.061 * s,x +   50.121 * s,y +  -19.043 * s, threshold);
			_vr.bezier8(x +   50.121 * s,y +  -19.043 * s,x +   49.877 * s,y +  -17.024 * s,x +   49.755 * s,y +  -15.218 * s,x +   49.755 * s,y +  -13.623 * s, threshold);
			_vr.bezier8(x +   49.755 * s,y +  -13.623 * s,x +   49.755 * s,y +   -9.424 * s,x +   51.627 * s,y +   -7.324 * s,x +   55.370 * s,y +   -7.324 * s, threshold);
			_vr.bezier8(x +   55.370 * s,y +   -7.324 * s,x +   57.942 * s,y +   -7.324 * s,x +   60.350 * s,y +   -8.170 * s,x +   62.596 * s,y +   -9.863 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   62.596 * s);
			_setf(o + ( 1 << 2), y +   -0.977 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   62.596 * s,y +   -0.977 * s,x +   60.057 * s,y +    0.326 * s,x +   56.411 * s,y +    0.977 * s,x +   51.659 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   51.659 * s,y +    0.977 * s,x +   47.916 * s,y +    0.977 * s,x +   44.856 * s,y +   -0.179 * s,x +   42.480 * s,y +   -2.490 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   43.896 * s);
			_setf(o + ( 1 << 2), y +  -35.058 * s);
			_setf(o + ( 2 << 2), x +   24.462 * s);
			_setf(o + ( 3 << 2), y +  -35.058 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   24.462 * s,y +  -35.058 * s,x +   19.449 * s,y +  -29.850 * s,x +   16.943 * s,y +  -24.202 * s,x +   16.943 * s,y +  -18.115 * s, threshold);
			_vr.bezier8(x +   16.943 * s,y +  -18.115 * s,x +   16.943 * s,y +  -14.697 * s,x +   18.090 * s,y +  -12.044 * s,x +   20.385 * s,y +  -10.156 * s, threshold);
			_vr.bezier8(x +   20.385 * s,y +  -10.156 * s,x +   22.680 * s,y +   -8.268 * s,x +   25.748 * s,y +   -7.324 * s,x +   29.589 * s,y +   -7.324 * s, threshold);
			_vr.bezier8(x +   29.589 * s,y +   -7.324 * s,x +   34.016 * s,y +   -7.324 * s,x +   37.467 * s,y +   -8.122 * s,x +   39.941 * s,y +   -9.717 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   39.941 * s);
			_setf(o + ( 1 << 2), y +  -10.693 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   39.941 * s,y +  -10.693 * s,x +   39.941 * s,y +  -12.060 * s,x +   40.125 * s,y +  -13.603 * s,x +   40.429 * s,y +  -15.332 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   43.896 * s);
			_setf(o + ( 1 << 2), y +  -35.058 * s);
			_setf(o + ( 2 << 2), x +   70.604 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 39:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   15.869 * s);
			_setf(o + ( 1 << 2), y +  -53.027 * s);
			_setf(o + ( 2 << 2), x +    9.375 * s);
			_setf(o + ( 3 << 2), y +  -53.027 * s);
			_setf(o + ( 4 << 2), x +   11.475 * s);
			_setf(o + ( 5 << 2), y +  -71.630 * s);
			_setf(o + ( 6 << 2), x +   20.459 * s);
			_setf(o + ( 7 << 2), y +  -71.630 * s);
			_setf(o + ( 8 << 2), x +   15.869 * s);
			_setf(o + ( 9 << 2), y +  -53.027 * s);
			_setf(o + (10 << 2), x +   15.967 * s);
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
			_setf(o + ( 0 << 2), x +   37.646 * s);
			_setf(o + ( 1 << 2), y +  -72.020 * s);
			_setf(o + ( 2 << 2), x +   37.646 * s);
			_setf(o + ( 3 << 2), y +  -67.968 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   37.646 * s,y +  -67.968 * s,x +   31.396 * s,y +  -61.099 * s,x +   26.643 * s,y +  -52.083 * s,x +   23.388 * s,y +  -40.917 * s, threshold);
			_vr.bezier8(x +   23.388 * s,y +  -40.917 * s,x +   20.133 * s,y +  -29.752 * s,x +   18.505 * s,y +  -17.529 * s,x +   18.505 * s,y +   -4.248 * s, threshold);
			_vr.bezier8(x +   18.505 * s,y +   -4.248 * s,x +   18.505 * s,y +    3.792 * s,x +   19.824 * s,y +   10.465 * s,x +   22.460 * s,y +   15.771 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   22.460 * s);
			_setf(o + ( 1 << 2), y +   20.898 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   22.460 * s,y +   20.898 * s,x +   18.359 * s,y +   17.741 * s,x +   15.006 * s,y +   13.021 * s,x +   12.402 * s,y +    6.738 * s, threshold);
			_vr.bezier8(x +   12.402 * s,y +    6.738 * s,x +    9.798 * s,y +    0.456 * s,x +    8.496 * s,y +   -6.298 * s,x +    8.496 * s,y +  -13.525 * s, threshold);
			_vr.bezier8(x +    8.496 * s,y +  -13.525 * s,x +    8.496 * s,y +  -24.430 * s,x +   11.360 * s,y +  -35.831 * s,x +   17.089 * s,y +  -47.729 * s, threshold);
			_vr.bezier8(x +   17.089 * s,y +  -47.729 * s,x +   22.818 * s,y +  -59.626 * s,x +   29.670 * s,y +  -67.724 * s,x +   37.646 * s,y +  -72.020 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.718 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 41:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    1.221 * s);
			_setf(o + ( 1 << 2), y +   20.898 * s);
			_setf(o + ( 2 << 2), x +    1.221 * s);
			_setf(o + ( 3 << 2), y +   15.771 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    1.221 * s,y +   15.771 * s,x +    6.982 * s,y +   11.247 * s,x +   11.759 * s,y +    2.515 * s,x +   15.551 * s,y +  -10.425 * s, threshold);
			_vr.bezier8(x +   15.551 * s,y +  -10.425 * s,x +   19.344 * s,y +  -23.364 * s,x +   21.240 * s,y +  -35.350 * s,x +   21.240 * s,y +  -46.386 * s, threshold);
			_vr.bezier8(x +   21.240 * s,y +  -46.386 * s,x +   21.240 * s,y +  -55.143 * s,x +   19.791 * s,y +  -62.336 * s,x +   16.894 * s,y +  -67.968 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   16.894 * s);
			_setf(o + ( 1 << 2), y +  -72.020 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   16.894 * s,y +  -72.020 * s,x +   21.354 * s,y +  -70.067 * s,x +   24.869 * s,y +  -65.632 * s,x +   27.441 * s,y +  -58.715 * s, threshold);
			_vr.bezier8(x +   27.441 * s,y +  -58.715 * s,x +   30.012 * s,y +  -51.798 * s,x +   31.298 * s,y +  -44.595 * s,x +   31.298 * s,y +  -37.109 * s, threshold);
			_vr.bezier8(x +   31.298 * s,y +  -37.109 * s,x +   31.298 * s,y +  -26.139 * s,x +   28.466 * s,y +  -15.088 * s,x +   22.802 * s,y +   -3.955 * s, threshold);
			_vr.bezier8(x +   22.802 * s,y +   -3.955 * s,x +   17.138 * s,y +    7.178 * s,x +    9.944 * s,y +   15.462 * s,x +    1.221 * s,y +   20.898 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.718 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 42:
			
			o = _posf(54);
			_setf(o + ( 0 << 2), x +   34.863 * s);
			_setf(o + ( 1 << 2), y +  -55.028 * s);
			_setf(o + ( 2 << 2), x +   26.416 * s);
			_setf(o + ( 3 << 2), y +  -54.882 * s);
			_setf(o + ( 4 << 2), x +   34.130 * s);
			_setf(o + ( 5 << 2), y +  -49.755 * s);
			_setf(o + ( 6 << 2), x +   36.425 * s);
			_setf(o + ( 7 << 2), y +  -46.728 * s);
			_setf(o + ( 8 << 2), x +   30.468 * s);
			_setf(o + ( 9 << 2), y +  -41.650 * s);
			_setf(o + (10 << 2), x +   27.832 * s);
			_setf(o + (11 << 2), y +  -45.068 * s);
			_setf(o + (12 << 2), x +   23.828 * s);
			_setf(o + (13 << 2), y +  -52.831 * s);
			_setf(o + (14 << 2), x +   19.385 * s);
			_setf(o + (15 << 2), y +  -44.921 * s);
			_setf(o + (16 << 2), x +   17.285 * s);
			_setf(o + (17 << 2), y +  -41.796 * s);
			_setf(o + (18 << 2), x +   10.889 * s);
			_setf(o + (19 << 2), y +  -46.728 * s);
			_setf(o + (20 << 2), x +   13.330 * s);
			_setf(o + (21 << 2), y +  -50.097 * s);
			_setf(o + (22 << 2), x +   21.045 * s);
			_setf(o + (23 << 2), y +  -54.150 * s);
			_setf(o + (24 << 2), x +   12.451 * s);
			_setf(o + (25 << 2), y +  -55.468 * s);
			_setf(o + (26 << 2), x +    8.057 * s);
			_setf(o + (27 << 2), y +  -57.030 * s);
			_setf(o + (28 << 2), x +   11.572 * s);
			_setf(o + (29 << 2), y +  -64.354 * s);
			_setf(o + (30 << 2), x +   16.260 * s);
			_setf(o + (31 << 2), y +  -62.548 * s);
			_setf(o + (32 << 2), x +   22.363 * s);
			_setf(o + (33 << 2), y +  -57.909 * s);
			_setf(o + (34 << 2), x +   19.287 * s);
			_setf(o + (35 << 2), y +  -67.919 * s);
			_setf(o + (36 << 2), x +   19.287 * s);
			_setf(o + (37 << 2), y +  -71.776 * s);
			_setf(o + (38 << 2), x +   27.881 * s);
			_setf(o + (39 << 2), y +  -71.727 * s);
			_setf(o + (40 << 2), x +   27.881 * s);
			_setf(o + (41 << 2), y +  -68.065 * s);
			_setf(o + (42 << 2), x +   24.951 * s);
			_setf(o + (43 << 2), y +  -57.763 * s);
			_setf(o + (44 << 2), x +   32.666 * s);
			_setf(o + (45 << 2), y +  -62.987 * s);
			_setf(o + (46 << 2), x +   36.279 * s);
			_setf(o + (47 << 2), y +  -64.306 * s);
			_setf(o + (48 << 2), x +   39.062 * s);
			_setf(o + (49 << 2), y +  -56.444 * s);
			_setf(o + (50 << 2), x +   34.863 * s);
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
			_setf(o + ( 0 << 2), x +   29.834 * s);
			_setf(o + ( 1 << 2), y +  -34.472 * s);
			_setf(o + ( 2 << 2), x +   46.875 * s);
			_setf(o + ( 3 << 2), y +  -34.472 * s);
			_setf(o + ( 4 << 2), x +   46.875 * s);
			_setf(o + ( 5 << 2), y +  -27.587 * s);
			_setf(o + ( 6 << 2), x +   29.834 * s);
			_setf(o + ( 7 << 2), y +  -27.587 * s);
			_setf(o + ( 8 << 2), x +   29.834 * s);
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
			_setf(o + (22 << 2), x +   29.834 * s);
			_setf(o + (23 << 2), y +  -51.220 * s);
			_setf(o + (24 << 2), x +   29.834 * s);
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
			_setf(o + ( 0 << 2), x +    8.886 * s);
			_setf(o + ( 1 << 2), y +   16.357 * s);
			_setf(o + ( 2 << 2), x +    6.738 * s);
			_setf(o + ( 3 << 2), y +   12.646 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    6.738 * s,y +   12.646 * s,x +   13.020 * s,y +    8.349 * s,x +   16.162 * s,y +    4.460 * s,x +   16.162 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   16.162 * s,y +    0.977 * s,x +   16.162 * s,y +   -0.163 * s,x +   15.787 * s,y +   -1.383 * s,x +   15.039 * s,y +   -2.686 * s, threshold);
			_vr.bezier8(x +   15.039 * s,y +   -2.686 * s,x +   12.565 * s,y +   -4.150 * s,x +   11.328 * s,y +   -6.038 * s,x +   11.328 * s,y +   -8.349 * s, threshold);
			_vr.bezier8(x +   11.328 * s,y +   -8.349 * s,x +   11.328 * s,y +  -10.075 * s,x +   11.971 * s,y +  -11.474 * s,x +   13.256 * s,y +  -12.549 * s, threshold);
			_vr.bezier8(x +   13.256 * s,y +  -12.549 * s,x +   14.542 * s,y +  -13.623 * s,x +   16.145 * s,y +  -14.160 * s,x +   18.066 * s,y +  -14.160 * s, threshold);
			_vr.bezier8(x +   18.066 * s,y +  -14.160 * s,x +   20.084 * s,y +  -14.160 * s,x +   21.769 * s,y +  -13.387 * s,x +   23.120 * s,y +  -11.841 * s, threshold);
			_vr.bezier8(x +   23.120 * s,y +  -11.841 * s,x +   24.471 * s,y +  -10.294 * s,x +   25.146 * s,y +   -8.496 * s,x +   25.146 * s,y +   -6.445 * s, threshold);
			_vr.bezier8(x +   25.146 * s,y +   -6.445 * s,x +   25.146 * s,y +   -2.116 * s,x +   23.958 * s,y +    1.823 * s,x +   21.582 * s,y +    5.371 * s, threshold);
			_vr.bezier8(x +   21.582 * s,y +    5.371 * s,x +   19.205 * s,y +    8.919 * s,x +   14.974 * s,y +   12.581 * s,x +    8.886 * s,y +   16.357 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.718 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 45:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +    7.031 * s);
			_setf(o + ( 1 << 2), y +  -24.707 * s);
			_setf(o + ( 2 << 2), x +    8.496 * s);
			_setf(o + ( 3 << 2), y +  -33.251 * s);
			_setf(o + ( 4 << 2), x +   29.394 * s);
			_setf(o + ( 5 << 2), y +  -33.251 * s);
			_setf(o + ( 6 << 2), x +   27.929 * s);
			_setf(o + ( 7 << 2), y +  -24.707 * s);
			_setf(o + ( 8 << 2), x +    7.031 * s);
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
			_setf(o + ( 0 << 2), x +   15.381 * s);
			_setf(o + ( 1 << 2), y +  -13.720 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   15.381 * s,y +  -13.720 * s,x +   17.399 * s,y +  -13.720 * s,x +   19.124 * s,y +  -13.004 * s,x +   20.556 * s,y +  -11.572 * s, threshold);
			_vr.bezier8(x +   20.556 * s,y +  -11.572 * s,x +   21.989 * s,y +  -10.140 * s,x +   22.705 * s,y +   -8.415 * s,x +   22.705 * s,y +   -6.396 * s, threshold);
			_vr.bezier8(x +   22.705 * s,y +   -6.396 * s,x +   22.705 * s,y +   -4.378 * s,x +   21.989 * s,y +   -2.645 * s,x +   20.556 * s,y +   -1.196 * s, threshold);
			_vr.bezier8(x +   20.556 * s,y +   -1.196 * s,x +   19.124 * s,y +    0.252 * s,x +   17.399 * s,y +    0.977 * s,x +   15.381 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   15.381 * s,y +    0.977 * s,x +   13.362 * s,y +    0.977 * s,x +   11.637 * s,y +    0.252 * s,x +   10.205 * s,y +   -1.196 * s, threshold);
			_vr.bezier8(x +   10.205 * s,y +   -1.196 * s,x +    8.773 * s,y +   -2.645 * s,x +    8.056 * s,y +   -4.378 * s,x +    8.056 * s,y +   -6.396 * s, threshold);
			_vr.bezier8(x +    8.056 * s,y +   -6.396 * s,x +    8.056 * s,y +   -8.415 * s,x +    8.773 * s,y +  -10.140 * s,x +   10.205 * s,y +  -11.572 * s, threshold);
			_vr.bezier8(x +   10.205 * s,y +  -11.572 * s,x +   11.637 * s,y +  -13.004 * s,x +   13.362 * s,y +  -13.720 * s,x +   15.381 * s,y +  -13.720 * s, threshold);
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
			_setf(o + ( 0 << 2), x +    3.320 * s);
			_setf(o + ( 1 << 2), y +  -20.312 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +    3.320 * s,y +  -20.312 * s,x +    3.320 * s,y +  -35.969 * s,x +    6.112 * s,y +  -48.632 * s,x +   11.694 * s,y +  -58.300 * s, threshold);
			_vr.bezier8(x +   11.694 * s,y +  -58.300 * s,x +   17.277 * s,y +  -67.968 * s,x +   25.146 * s,y +  -72.802 * s,x +   35.302 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   35.302 * s,y +  -72.802 * s,x +   47.281 * s,y +  -72.802 * s,x +   53.271 * s,y +  -65.966 * s,x +   53.271 * s,y +  -52.294 * s, threshold);
			_vr.bezier8(x +   53.271 * s,y +  -52.294 * s,x +   53.271 * s,y +  -35.660 * s,x +   50.553 * s,y +  -22.623 * s,x +   45.116 * s,y +  -13.183 * s, threshold);
			_vr.bezier8(x +   45.116 * s,y +  -13.183 * s,x +   39.680 * s,y +   -3.743 * s,x +   31.852 * s,y +    0.977 * s,x +   21.630 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   21.630 * s,y +    0.977 * s,x +   15.771 * s,y +    0.977 * s,x +   11.255 * s,y +   -0.895 * s,x +    8.081 * s,y +   -4.639 * s, threshold);
			_vr.bezier8(x +    8.081 * s,y +   -4.639 * s,x +    4.907 * s,y +   -8.382 * s,x +    3.320 * s,y +  -13.607 * s,x +    3.320 * s,y +  -20.312 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   13.086 * s);
			_setf(o + ( 1 << 2), y +  -22.119 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   13.086 * s,y +  -22.119 * s,x +   13.086 * s,y +  -12.256 * s,x +   16.194 * s,y +   -7.324 * s,x +   22.412 * s,y +   -7.324 * s, threshold);
			_vr.bezier8(x +   22.412 * s,y +   -7.324 * s,x +   29.117 * s,y +   -7.324 * s,x +   34.301 * s,y +  -11.564 * s,x +   37.963 * s,y +  -20.044 * s, threshold);
			_vr.bezier8(x +   37.963 * s,y +  -20.044 * s,x +   41.625 * s,y +  -28.523 * s,x +   43.456 * s,y +  -38.964 * s,x +   43.456 * s,y +  -51.366 * s, threshold);
			_vr.bezier8(x +   43.456 * s,y +  -51.366 * s,x +   43.456 * s,y +  -60.123 * s,x +   40.185 * s,y +  -64.501 * s,x +   33.642 * s,y +  -64.501 * s, threshold);
			_vr.bezier8(x +   33.642 * s,y +  -64.501 * s,x +   27.457 * s,y +  -64.501 * s,x +   22.485 * s,y +  -60.001 * s,x +   18.725 * s,y +  -51.000 * s, threshold);
			_vr.bezier8(x +   18.725 * s,y +  -51.000 * s,x +   14.966 * s,y +  -42.000 * s,x +   13.086 * s,y +  -32.373 * s,x +   13.086 * s,y +  -22.119 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   52.441 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 49:
			
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   21.679 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   31.200 * s);
			_setf(o + ( 3 << 2), y +  -53.759 * s);
			_setf(o + ( 4 << 2), x +   16.747 * s);
			_setf(o + ( 5 << 2), y +  -46.386 * s);
			_setf(o + ( 6 << 2), x +   18.115 * s);
			_setf(o + ( 7 << 2), y +  -55.761 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_vr.bezier8(x +   18.115 * s,y +  -55.761 * s,x +   29.442 * s,y +  -61.002 * s,x +   37.125 * s,y +  -66.356 * s,x +   41.161 * s,y +  -71.825 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   44.091 * s);
			_setf(o + ( 1 << 2), y +  -71.825 * s);
			_setf(o + ( 2 << 2), x +   31.444 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   21.679 * s);
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
			_setf(o + ( 0 << 2), x +    3.076 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    3.076 * s);
			_setf(o + ( 3 << 2), y +   -4.394 * s);
			_setf(o + ( 4 << 2), x +   26.660 * s);
			_setf(o + ( 5 << 2), y +  -34.570 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   26.660 * s,y +  -34.570 * s,x +   31.331 * s,y +  -40.546 * s,x +   34.440 * s,y +  -45.003 * s,x +   36.035 * s,y +  -47.900 * s, threshold);
			_vr.bezier8(x +   36.035 * s,y +  -47.900 * s,x +   37.630 * s,y +  -50.797 * s,x +   38.427 * s,y +  -53.612 * s,x +   38.427 * s,y +  -56.347 * s, threshold);
			_vr.bezier8(x +   38.427 * s,y +  -56.347 * s,x +   38.427 * s,y +  -58.853 * s,x +   37.386 * s,y +  -60.814 * s,x +   35.302 * s,y +  -62.230 * s, threshold);
			_vr.bezier8(x +   35.302 * s,y +  -62.230 * s,x +   33.219 * s,y +  -63.646 * s,x +   30.631 * s,y +  -64.354 * s,x +   27.539 * s,y +  -64.354 * s, threshold);
			_vr.bezier8(x +   27.539 * s,y +  -64.354 * s,x +   23.047 * s,y +  -64.354 * s,x +   19.336 * s,y +  -62.190 * s,x +   16.406 * s,y +  -57.860 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    9.570 * s);
			_setf(o + ( 1 << 2), y +  -62.353 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    9.570 * s,y +  -62.353 * s,x +   12.663 * s,y +  -69.319 * s,x +   19.043 * s,y +  -72.802 * s,x +   28.711 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   28.711 * s,y +  -72.802 * s,x +   35.025 * s,y +  -72.802 * s,x +   39.933 * s,y +  -71.377 * s,x +   43.432 * s,y +  -68.529 * s, threshold);
			_vr.bezier8(x +   43.432 * s,y +  -68.529 * s,x +   46.931 * s,y +  -65.681 * s,x +   48.681 * s,y +  -61.815 * s,x +   48.681 * s,y +  -56.933 * s, threshold);
			_vr.bezier8(x +   48.681 * s,y +  -56.933 * s,x +   48.681 * s,y +  -53.710 * s,x +   47.778 * s,y +  -50.325 * s,x +   45.971 * s,y +  -46.777 * s, threshold);
			_vr.bezier8(x +   45.971 * s,y +  -46.777 * s,x +   44.165 * s,y +  -43.229 * s,x +   40.657 * s,y +  -38.131 * s,x +   35.498 * s,y +  -31.445 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   18.017 * s);
			_setf(o + ( 1 << 2), y +   -8.789 * s);
			_setf(o + ( 2 << 2), x +   44.580 * s);
			_setf(o + ( 3 << 2), y +   -8.789 * s);
			_setf(o + ( 4 << 2), x +   43.017 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    3.076 * s);
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
			_setf(o + ( 0 << 2), x +    2.295 * s);
			_setf(o + ( 1 << 2), y +   -5.225 * s);
			_setf(o + ( 2 << 2), x +    6.738 * s);
			_setf(o + ( 3 << 2), y +  -13.330 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    6.738 * s,y +  -13.330 * s,x +    7.975 * s,y +  -11.670 * s,x +    9.781 * s,y +  -10.254 * s,x +   12.158 * s,y +   -9.082 * s, threshold);
			_vr.bezier8(x +   12.158 * s,y +   -9.082 * s,x +   14.534 * s,y +   -7.910 * s,x +   16.878 * s,y +   -7.324 * s,x +   19.189 * s,y +   -7.324 * s, threshold);
			_vr.bezier8(x +   19.189 * s,y +   -7.324 * s,x +   24.006 * s,y +   -7.324 * s,x +   27.905 * s,y +   -8.789 * s,x +   30.883 * s,y +  -11.719 * s, threshold);
			_vr.bezier8(x +   30.883 * s,y +  -11.719 * s,x +   33.862 * s,y +  -14.648 * s,x +   35.351 * s,y +  -18.522 * s,x +   35.351 * s,y +  -23.339 * s, threshold);
			_vr.bezier8(x +   35.351 * s,y +  -23.339 * s,x +   35.351 * s,y +  -30.598 * s,x +   30.989 * s,y +  -34.228 * s,x +   22.265 * s,y +  -34.228 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   23.632 * s);
			_setf(o + ( 1 << 2), y +  -42.138 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   23.632 * s,y +  -42.138 * s,x +   33.691 * s,y +  -42.138 * s,x +   38.720 * s,y +  -46.516 * s,x +   38.720 * s,y +  -55.273 * s, threshold);
			_vr.bezier8(x +   38.720 * s,y +  -55.273 * s,x +   38.720 * s,y +  -58.202 * s,x +   37.841 * s,y +  -60.473 * s,x +   36.083 * s,y +  -62.084 * s, threshold);
			_vr.bezier8(x +   36.083 * s,y +  -62.084 * s,x +   34.325 * s,y +  -63.695 * s,x +   31.884 * s,y +  -64.501 * s,x +   28.759 * s,y +  -64.501 * s, threshold);
			_vr.bezier8(x +   28.759 * s,y +  -64.501 * s,x +   25.016 * s,y +  -64.501 * s,x +   21.809 * s,y +  -63.378 * s,x +   19.140 * s,y +  -61.132 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   14.746 * s);
			_setf(o + ( 1 << 2), y +  -66.894 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   14.746 * s,y +  -66.894 * s,x +   18.457 * s,y +  -70.832 * s,x +   23.860 * s,y +  -72.802 * s,x +   30.956 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   30.956 * s,y +  -72.802 * s,x +   36.327 * s,y +  -72.802 * s,x +   40.722 * s,y +  -71.353 * s,x +   44.140 * s,y +  -68.456 * s, threshold);
			_vr.bezier8(x +   44.140 * s,y +  -68.456 * s,x +   47.558 * s,y +  -65.559 * s,x +   49.267 * s,y +  -61.604 * s,x +   49.267 * s,y +  -56.591 * s, threshold);
			_vr.bezier8(x +   49.267 * s,y +  -56.591 * s,x +   49.267 * s,y +  -52.555 * s,x +   47.916 * s,y +  -48.835 * s,x +   45.214 * s,y +  -45.434 * s, threshold);
			_vr.bezier8(x +   45.214 * s,y +  -45.434 * s,x +   42.512 * s,y +  -42.032 * s,x +   39.110 * s,y +  -39.648 * s,x +   35.009 * s,y +  -38.281 * s, threshold);
			_vr.bezier8(x +   35.009 * s,y +  -38.281 * s,x +   42.040 * s,y +  -35.872 * s,x +   45.556 * s,y +  -31.005 * s,x +   45.556 * s,y +  -23.681 * s, threshold);
			_vr.bezier8(x +   45.556 * s,y +  -23.681 * s,x +   45.556 * s,y +  -15.316 * s,x +   43.302 * s,y +   -9.114 * s,x +   38.793 * s,y +   -5.078 * s, threshold);
			_vr.bezier8(x +   38.793 * s,y +   -5.078 * s,x +   34.285 * s,y +   -1.042 * s,x +   27.213 * s,y +    0.977 * s,x +   17.578 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   17.578 * s,y +    0.977 * s,x +   11.067 * s,y +    0.977 * s,x +    5.973 * s,y +   -1.090 * s,x +    2.295 * s,y +   -5.225 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   52.440 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 52:
			
			o = _posf(34);
			_setf(o + ( 0 << 2), x +   43.066 * s);
			_setf(o + ( 1 << 2), y +  -19.482 * s);
			_setf(o + ( 2 << 2), x +   39.648 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   29.883 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   33.301 * s);
			_setf(o + ( 7 << 2), y +  -19.482 * s);
			_setf(o + ( 8 << 2), x +    1.221 * s);
			_setf(o + ( 9 << 2), y +  -19.482 * s);
			_setf(o + (10 << 2), x +    2.198 * s);
			_setf(o + (11 << 2), y +  -25.048 * s);
			_setf(o + (12 << 2), x +   48.877 * s);
			_setf(o + (13 << 2), y +  -71.825 * s);
			_setf(o + (14 << 2), x +   52.294 * s);
			_setf(o + (15 << 2), y +  -71.825 * s);
			_setf(o + (16 << 2), x +   44.384 * s);
			_setf(o + (17 << 2), y +  -27.002 * s);
			_setf(o + (18 << 2), x +   51.611 * s);
			_setf(o + (19 << 2), y +  -27.002 * s);
			_setf(o + (20 << 2), x +   50.293 * s);
			_setf(o + (21 << 2), y +  -19.482 * s);
			_setf(o + (22 << 2), x +   43.066 * s);
			_setf(o + (23 << 2), y +  -19.482 * s);
			_setf(o + (24 << 2), x +   39.013 * s);
			_setf(o + (25 << 2), y +  -52.001 * s);
			_setf(o + (26 << 2), x +   14.111 * s);
			_setf(o + (27 << 2), y +  -27.002 * s);
			_setf(o + (28 << 2), x +   34.619 * s);
			_setf(o + (29 << 2), y +  -27.002 * s);
			_setf(o + (30 << 2), x +   39.013 * s);
			_setf(o + (31 << 2), y +  -52.001 * s);
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
			_setf(o + ( 0 << 2), x +   15.185 * s);
			_setf(o + ( 1 << 2), y +  -36.913 * s);
			_setf(o + ( 2 << 2), x +   10.156 * s);
			_setf(o + ( 3 << 2), y +  -36.913 * s);
			_setf(o + ( 4 << 2), x +   16.259 * s);
			_setf(o + ( 5 << 2), y +  -71.825 * s);
			_setf(o + ( 6 << 2), x +   51.855 * s);
			_setf(o + ( 7 << 2), y +  -71.825 * s);
			_setf(o + ( 8 << 2), x +   50.390 * s);
			_setf(o + ( 9 << 2), y +  -63.524 * s);
			_setf(o + (10 << 2), x +   24.072 * s);
			_setf(o + (11 << 2), y +  -63.524 * s);
			_setf(o + (12 << 2), x +   20.996 * s);
			_setf(o + (13 << 2), y +  -46.142 * s);
			o = _posb(7);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_vr.bezier8(x +   20.996 * s,y +  -46.142 * s,x +   23.632 * s,y +  -47.932 * s,x +   26.839 * s,y +  -48.827 * s,x +   30.615 * s,y +  -48.827 * s, threshold);
			_vr.bezier8(x +   30.615 * s,y +  -48.827 * s,x +   35.595 * s,y +  -48.827 * s,x +   39.680 * s,y +  -47.232 * s,x +   42.870 * s,y +  -44.042 * s, threshold);
			_vr.bezier8(x +   42.870 * s,y +  -44.042 * s,x +   46.060 * s,y +  -40.852 * s,x +   47.655 * s,y +  -36.783 * s,x +   47.655 * s,y +  -31.835 * s, threshold);
			_vr.bezier8(x +   47.655 * s,y +  -31.835 * s,x +   47.655 * s,y +   -9.960 * s,x +   37.890 * s,y +    0.977 * s,x +   18.359 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   18.359 * s,y +    0.977 * s,x +   12.109 * s,y +    0.977 * s,x +    7.292 * s,y +   -0.716 * s,x +    3.906 * s,y +   -4.101 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    7.910 * s);
			_setf(o + ( 1 << 2), y +  -12.744 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    7.910 * s,y +  -12.744 * s,x +   11.719 * s,y +   -9.131 * s,x +   15.673 * s,y +   -7.324 * s,x +   19.775 * s,y +   -7.324 * s, threshold);
			_vr.bezier8(x +   19.775 * s,y +   -7.324 * s,x +   25.309 * s,y +   -7.324 * s,x +   29.581 * s,y +   -9.253 * s,x +   32.592 * s,y +  -13.110 * s, threshold);
			_vr.bezier8(x +   32.592 * s,y +  -13.110 * s,x +   35.603 * s,y +  -16.968 * s,x +   37.109 * s,y +  -22.103 * s,x +   37.109 * s,y +  -28.515 * s, threshold);
			_vr.bezier8(x +   37.109 * s,y +  -28.515 * s,x +   37.109 * s,y +  -32.063 * s,x +   36.051 * s,y +  -34.952 * s,x +   33.935 * s,y +  -37.182 * s, threshold);
			_vr.bezier8(x +   33.935 * s,y +  -37.182 * s,x +   31.819 * s,y +  -39.412 * s,x +   29.101 * s,y +  -40.527 * s,x +   25.781 * s,y +  -40.527 * s, threshold);
			_vr.bezier8(x +   25.781 * s,y +  -40.527 * s,x +   21.354 * s,y +  -40.527 * s,x +   17.822 * s,y +  -39.322 * s,x +   15.185 * s,y +  -36.913 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   52.441 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 54:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   42.870 * s);
			_setf(o + ( 1 << 2), y +  -72.802 * s);
			_setf(o + ( 2 << 2), x +   46.727 * s);
			_setf(o + ( 3 << 2), y +  -67.577 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   46.727 * s,y +  -67.577 * s,x +   43.309 * s,y +  -66.242 * s,x +   38.394 * s,y +  -62.312 * s,x +   31.981 * s,y +  -55.785 * s, threshold);
			_vr.bezier8(x +   31.981 * s,y +  -55.785 * s,x +   25.569 * s,y +  -49.259 * s,x +   21.760 * s,y +  -44.286 * s,x +   20.556 * s,y +  -40.869 * s, threshold);
			_vr.bezier8(x +   20.556 * s,y +  -40.869 * s,x +   23.713 * s,y +  -43.473 * s,x +   27.701 * s,y +  -44.775 * s,x +   32.519 * s,y +  -44.775 * s, threshold);
			_vr.bezier8(x +   32.519 * s,y +  -44.775 * s,x +   37.922 * s,y +  -44.775 * s,x +   42.178 * s,y +  -43.261 * s,x +   45.287 * s,y +  -40.234 * s, threshold);
			_vr.bezier8(x +   45.287 * s,y +  -40.234 * s,x +   48.396 * s,y +  -37.206 * s,x +   49.950 * s,y +  -33.008 * s,x +   49.950 * s,y +  -27.636 * s, threshold);
			_vr.bezier8(x +   49.950 * s,y +  -27.636 * s,x +   49.950 * s,y +  -19.889 * s,x +   47.525 * s,y +  -13.143 * s,x +   42.675 * s,y +   -7.397 * s, threshold);
			_vr.bezier8(x +   42.675 * s,y +   -7.397 * s,x +   37.824 * s,y +   -1.652 * s,x +   31.819 * s,y +    1.221 * s,x +   24.657 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   24.657 * s,y +    1.221 * s,x +   11.930 * s,y +    1.221 * s,x +    5.566 * s,y +   -5.566 * s,x +    5.566 * s,y +  -19.140 * s, threshold);
			_vr.bezier8(x +    5.566 * s,y +  -19.140 * s,x +    5.566 * s,y +  -26.432 * s,x +    6.941 * s,y +  -33.276 * s,x +    9.692 * s,y +  -39.672 * s, threshold);
			_vr.bezier8(x +    9.692 * s,y +  -39.672 * s,x +   12.442 * s,y +  -46.069 * s,x +   16.991 * s,y +  -52.766 * s,x +   23.339 * s,y +  -59.765 * s, threshold);
			_vr.bezier8(x +   23.339 * s,y +  -59.765 * s,x +   29.687 * s,y +  -66.763 * s,x +   36.197 * s,y +  -71.109 * s,x +   42.870 * s,y +  -72.802 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   15.087 * s);
			_setf(o + ( 1 << 2), y +  -17.724 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   15.087 * s,y +  -17.724 * s,x +   15.087 * s,y +  -10.628 * s,x +   18.521 * s,y +   -7.080 * s,x +   25.390 * s,y +   -7.080 * s, threshold);
			_vr.bezier8(x +   25.390 * s,y +   -7.080 * s,x +   29.589 * s,y +   -7.080 * s,x +   33.023 * s,y +   -8.927 * s,x +   35.692 * s,y +  -12.622 * s, threshold);
			_vr.bezier8(x +   35.692 * s,y +  -12.622 * s,x +   38.362 * s,y +  -16.316 * s,x +   39.696 * s,y +  -20.654 * s,x +   39.696 * s,y +  -25.634 * s, threshold);
			_vr.bezier8(x +   39.696 * s,y +  -25.634 * s,x +   39.696 * s,y +  -28.922 * s,x +   38.874 * s,y +  -31.551 * s,x +   37.230 * s,y +  -33.520 * s, threshold);
			_vr.bezier8(x +   37.230 * s,y +  -33.520 * s,x +   35.587 * s,y +  -35.489 * s,x +   33.316 * s,y +  -36.474 * s,x +   30.419 * s,y +  -36.474 * s, threshold);
			_vr.bezier8(x +   30.419 * s,y +  -36.474 * s,x +   25.601 * s,y +  -36.474 * s,x +   21.842 * s,y +  -34.749 * s,x +   19.140 * s,y +  -31.298 * s, threshold);
			_vr.bezier8(x +   19.140 * s,y +  -31.298 * s,x +   16.438 * s,y +  -27.848 * s,x +   15.087 * s,y +  -23.323 * s,x +   15.087 * s,y +  -17.724 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   52.440 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 55:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   16.699 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    4.883 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    4.883 * s,y +       0. * s,x +   10.840 * s,y +  -12.272 * s,x +   23.616 * s,y +  -33.121 * s,x +   43.212 * s,y +  -62.548 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +    8.984 * s);
			_setf(o + ( 1 << 2), y +  -62.548 * s);
			_setf(o + ( 2 << 2), x +   10.595 * s);
			_setf(o + ( 3 << 2), y +  -71.825 * s);
			_setf(o + ( 4 << 2), x +   57.323 * s);
			_setf(o + ( 5 << 2), y +  -71.825 * s);
			_setf(o + ( 6 << 2), x +   57.323 * s);
			_setf(o + ( 7 << 2), y +  -68.017 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_vr.bezier8(x +   57.323 * s,y +  -68.017 * s,x +   40.462 * s,y +  -44.286 * s,x +   26.920 * s,y +  -21.614 * s,x +   16.699 * s,y +       0. * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   52.441 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 56:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   20.996 * s);
			_setf(o + ( 1 << 2), y +  -39.794 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   20.996 * s,y +  -39.794 * s,x +   18.717 * s,y +  -41.129 * s,x +   16.854 * s,y +  -43.147 * s,x +   15.405 * s,y +  -45.849 * s, threshold);
			_vr.bezier8(x +   15.405 * s,y +  -45.849 * s,x +   13.957 * s,y +  -48.551 * s,x +   13.232 * s,y +  -51.285 * s,x +   13.232 * s,y +  -54.052 * s, threshold);
			_vr.bezier8(x +   13.232 * s,y +  -54.052 * s,x +   13.232 * s,y +  -59.683 * s,x +   15.218 * s,y +  -64.216 * s,x +   19.189 * s,y +  -67.650 * s, threshold);
			_vr.bezier8(x +   19.189 * s,y +  -67.650 * s,x +   23.160 * s,y +  -71.085 * s,x +   28.385 * s,y +  -72.802 * s,x +   34.863 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   34.863 * s,y +  -72.802 * s,x +   39.778 * s,y +  -72.802 * s,x +   43.952 * s,y +  -71.451 * s,x +   47.387 * s,y +  -68.749 * s, threshold);
			_vr.bezier8(x +   47.387 * s,y +  -68.749 * s,x +   50.821 * s,y +  -66.047 * s,x +   52.538 * s,y +  -62.548 * s,x +   52.538 * s,y +  -58.251 * s, threshold);
			_vr.bezier8(x +   52.538 * s,y +  -58.251 * s,x +   52.538 * s,y +  -54.117 * s,x +   51.228 * s,y +  -50.170 * s,x +   48.607 * s,y +  -46.410 * s, threshold);
			_vr.bezier8(x +   48.607 * s,y +  -46.410 * s,x +   45.987 * s,y +  -42.651 * s,x +   42.789 * s,y +  -40.120 * s,x +   39.013 * s,y +  -38.818 * s, threshold);
			_vr.bezier8(x +   39.013 * s,y +  -38.818 * s,x +   42.007 * s,y +  -37.125 * s,x +   44.400 * s,y +  -34.814 * s,x +   46.190 * s,y +  -31.884 * s, threshold);
			_vr.bezier8(x +   46.190 * s,y +  -31.884 * s,x +   47.981 * s,y +  -28.955 * s,x +   48.876 * s,y +  -25.797 * s,x +   48.876 * s,y +  -22.412 * s, threshold);
			_vr.bezier8(x +   48.876 * s,y +  -22.412 * s,x +   48.876 * s,y +  -14.404 * s,x +   46.866 * s,y +   -8.504 * s,x +   42.846 * s,y +   -4.712 * s, threshold);
			_vr.bezier8(x +   42.846 * s,y +   -4.712 * s,x +   38.825 * s,y +   -0.920 * s,x +   32.405 * s,y +    0.977 * s,x +   23.584 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   23.584 * s,y +    0.977 * s,x +   17.919 * s,y +    0.977 * s,x +   13.257 * s,y +   -0.602 * s,x +    9.595 * s,y +   -3.760 * s, threshold);
			_vr.bezier8(x +    9.595 * s,y +   -3.760 * s,x +    5.932 * s,y +   -6.917 * s,x +    4.102 * s,y +  -11.019 * s,x +    4.102 * s,y +  -16.064 * s, threshold);
			_vr.bezier8(x +    4.102 * s,y +  -16.064 * s,x +    4.102 * s,y +  -21.533 * s,x +    5.566 * s,y +  -26.310 * s,x +    8.496 * s,y +  -30.395 * s, threshold);
			_vr.bezier8(x +    8.496 * s,y +  -30.395 * s,x +   11.426 * s,y +  -34.480 * s,x +   15.592 * s,y +  -37.613 * s,x +   20.996 * s,y +  -39.794 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   31.982 * s);
			_setf(o + ( 1 << 2), y +  -43.652 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   31.982 * s,y +  -43.652 * s,x +   34.586 * s,y +  -44.335 * s,x +   36.979 * s,y +  -46.012 * s,x +   39.159 * s,y +  -48.681 * s, threshold);
			_vr.bezier8(x +   39.159 * s,y +  -48.681 * s,x +   41.340 * s,y +  -51.350 * s,x +   42.431 * s,y +  -54.036 * s,x +   42.431 * s,y +  -56.737 * s, threshold);
			_vr.bezier8(x +   42.431 * s,y +  -56.737 * s,x +   42.431 * s,y +  -58.951 * s,x +   41.527 * s,y +  -60.798 * s,x +   39.721 * s,y +  -62.279 * s, threshold);
			_vr.bezier8(x +   39.721 * s,y +  -62.279 * s,x +   37.914 * s,y +  -63.760 * s,x +   35.807 * s,y +  -64.501 * s,x +   33.398 * s,y +  -64.501 * s, threshold);
			_vr.bezier8(x +   33.398 * s,y +  -64.501 * s,x +   30.240 * s,y +  -64.501 * s,x +   27.742 * s,y +  -63.484 * s,x +   25.903 * s,y +  -61.449 * s, threshold);
			_vr.bezier8(x +   25.903 * s,y +  -61.449 * s,x +   24.064 * s,y +  -59.415 * s,x +   23.144 * s,y +  -56.982 * s,x +   23.144 * s,y +  -54.150 * s, threshold);
			_vr.bezier8(x +   23.144 * s,y +  -54.150 * s,x +   23.144 * s,y +  -52.034 * s,x +   23.999 * s,y +  -50.007 * s,x +   25.708 * s,y +  -48.071 * s, threshold);
			_vr.bezier8(x +   25.708 * s,y +  -48.071 * s,x +   27.417 * s,y +  -46.134 * s,x +   29.508 * s,y +  -44.661 * s,x +   31.982 * s,y +  -43.652 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   29.003 * s);
			_setf(o + ( 1 << 2), y +  -35.400 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   29.003 * s,y +  -35.400 * s,x +   25.455 * s,y +  -34.586 * s,x +   22.086 * s,y +  -32.413 * s,x +   18.896 * s,y +  -28.881 * s, threshold);
			_vr.bezier8(x +   18.896 * s,y +  -28.881 * s,x +   15.706 * s,y +  -25.350 * s,x +   14.111 * s,y +  -21.647 * s,x +   14.111 * s,y +  -17.773 * s, threshold);
			_vr.bezier8(x +   14.111 * s,y +  -17.773 * s,x +   14.111 * s,y +  -14.681 * s,x +   15.137 * s,y +  -12.166 * s,x +   17.187 * s,y +  -10.229 * s, threshold);
			_vr.bezier8(x +   17.187 * s,y +  -10.229 * s,x +   19.238 * s,y +   -8.293 * s,x +   21.696 * s,y +   -7.324 * s,x +   24.560 * s,y +   -7.324 * s, threshold);
			_vr.bezier8(x +   24.560 * s,y +   -7.324 * s,x +   34.195 * s,y +   -7.324 * s,x +   39.013 * s,y +  -12.077 * s,x +   39.013 * s,y +  -21.582 * s, threshold);
			_vr.bezier8(x +   39.013 * s,y +  -21.582 * s,x +   39.013 * s,y +  -24.348 * s,x +   38.077 * s,y +  -26.969 * s,x +   36.206 * s,y +  -29.443 * s, threshold);
			_vr.bezier8(x +   36.206 * s,y +  -29.443 * s,x +   34.334 * s,y +  -31.917 * s,x +   31.933 * s,y +  -33.902 * s,x +   29.003 * s,y +  -35.400 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   52.440 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 57:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   15.625 * s);
			_setf(o + ( 1 << 2), y +    1.221 * s);
			_setf(o + ( 2 << 2), x +   11.816 * s);
			_setf(o + ( 3 << 2), y +   -4.004 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   11.816 * s,y +   -4.004 * s,x +   15.234 * s,y +   -5.338 * s,x +   20.150 * s,y +   -9.261 * s,x +   26.562 * s,y +  -15.771 * s, threshold);
			_vr.bezier8(x +   26.562 * s,y +  -15.771 * s,x +   32.975 * s,y +  -22.282 * s,x +   36.767 * s,y +  -27.246 * s,x +   37.939 * s,y +  -30.664 * s, threshold);
			_vr.bezier8(x +   37.939 * s,y +  -30.664 * s,x +   34.847 * s,y +  -28.092 * s,x +   30.859 * s,y +  -26.806 * s,x +   25.976 * s,y +  -26.806 * s, threshold);
			_vr.bezier8(x +   25.976 * s,y +  -26.806 * s,x +   21.061 * s,y +  -26.806 * s,x +   16.935 * s,y +  -28.515 * s,x +   13.599 * s,y +  -31.933 * s, threshold);
			_vr.bezier8(x +   13.599 * s,y +  -31.933 * s,x +   10.262 * s,y +  -35.351 * s,x +    8.594 * s,y +  -39.680 * s,x +    8.594 * s,y +  -44.921 * s, threshold);
			_vr.bezier8(x +    8.594 * s,y +  -44.921 * s,x +    8.594 * s,y +  -53.287 * s,x +   10.864 * s,y +  -60.025 * s,x +   15.405 * s,y +  -65.136 * s, threshold);
			_vr.bezier8(x +   15.405 * s,y +  -65.136 * s,x +   19.946 * s,y +  -70.246 * s,x +   26.107 * s,y +  -72.802 * s,x +   33.886 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   33.886 * s,y +  -72.802 * s,x +   39.778 * s,y +  -72.802 * s,x +   44.433 * s,y +  -70.938 * s,x +   47.851 * s,y +  -67.211 * s, threshold);
			_vr.bezier8(x +   47.851 * s,y +  -67.211 * s,x +   51.269 * s,y +  -63.484 * s,x +   52.978 * s,y +  -58.560 * s,x +   52.978 * s,y +  -52.441 * s, threshold);
			_vr.bezier8(x +   52.978 * s,y +  -52.441 * s,x +   52.978 * s,y +  -39.842 * s,x +   48.665 * s,y +  -28.190 * s,x +   40.039 * s,y +  -17.480 * s, threshold);
			_vr.bezier8(x +   40.039 * s,y +  -17.480 * s,x +   31.412 * s,y +   -6.771 * s,x +   23.275 * s,y +   -0.537 * s,x +   15.625 * s,y +    1.221 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   43.408 * s);
			_setf(o + ( 1 << 2), y +  -53.857 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   43.408 * s,y +  -53.857 * s,x +   43.408 * s,y +  -57.014 * s,x +   42.513 * s,y +  -59.578 * s,x +   40.722 * s,y +  -61.547 * s, threshold);
			_vr.bezier8(x +   40.722 * s,y +  -61.547 * s,x +   38.932 * s,y +  -63.516 * s,x +   36.409 * s,y +  -64.501 * s,x +   33.154 * s,y +  -64.501 * s, threshold);
			_vr.bezier8(x +   33.154 * s,y +  -64.501 * s,x +   28.695 * s,y +  -64.501 * s,x +   25.195 * s,y +  -62.776 * s,x +   22.656 * s,y +  -59.325 * s, threshold);
			_vr.bezier8(x +   22.656 * s,y +  -59.325 * s,x +   20.117 * s,y +  -55.875 * s,x +   18.848 * s,y +  -51.415 * s,x +   18.848 * s,y +  -45.947 * s, threshold);
			_vr.bezier8(x +   18.848 * s,y +  -45.947 * s,x +   18.848 * s,y +  -42.659 * s,x +   19.669 * s,y +  -40.030 * s,x +   21.313 * s,y +  -38.061 * s, threshold);
			_vr.bezier8(x +   21.313 * s,y +  -38.061 * s,x +   22.957 * s,y +  -36.092 * s,x +   25.211 * s,y +  -35.107 * s,x +   28.076 * s,y +  -35.107 * s, threshold);
			_vr.bezier8(x +   28.076 * s,y +  -35.107 * s,x +   32.894 * s,y +  -35.107 * s,x +   36.653 * s,y +  -36.824 * s,x +   39.355 * s,y +  -40.258 * s, threshold);
			_vr.bezier8(x +   39.355 * s,y +  -40.258 * s,x +   42.057 * s,y +  -43.692 * s,x +   43.408 * s,y +  -48.225 * s,x +   43.408 * s,y +  -53.857 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   52.441 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 58:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   21.581 * s);
			_setf(o + ( 1 << 2), y +  -52.294 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   21.581 * s,y +  -52.294 * s,x +   23.600 * s,y +  -52.294 * s,x +   25.325 * s,y +  -51.578 * s,x +   26.757 * s,y +  -50.146 * s, threshold);
			_vr.bezier8(x +   26.757 * s,y +  -50.146 * s,x +   28.189 * s,y +  -48.713 * s,x +   28.906 * s,y +  -46.988 * s,x +   28.906 * s,y +  -44.970 * s, threshold);
			_vr.bezier8(x +   28.906 * s,y +  -44.970 * s,x +   28.906 * s,y +  -42.952 * s,x +   28.189 * s,y +  -41.218 * s,x +   26.757 * s,y +  -39.770 * s, threshold);
			_vr.bezier8(x +   26.757 * s,y +  -39.770 * s,x +   25.325 * s,y +  -38.321 * s,x +   23.600 * s,y +  -37.597 * s,x +   21.581 * s,y +  -37.597 * s, threshold);
			_vr.bezier8(x +   21.581 * s,y +  -37.597 * s,x +   19.563 * s,y +  -37.597 * s,x +   17.838 * s,y +  -38.321 * s,x +   16.406 * s,y +  -39.770 * s, threshold);
			_vr.bezier8(x +   16.406 * s,y +  -39.770 * s,x +   14.974 * s,y +  -41.218 * s,x +   14.257 * s,y +  -42.952 * s,x +   14.257 * s,y +  -44.970 * s, threshold);
			_vr.bezier8(x +   14.257 * s,y +  -44.970 * s,x +   14.257 * s,y +  -46.988 * s,x +   14.974 * s,y +  -48.713 * s,x +   16.406 * s,y +  -50.146 * s, threshold);
			_vr.bezier8(x +   16.406 * s,y +  -50.146 * s,x +   17.838 * s,y +  -51.578 * s,x +   19.563 * s,y +  -52.294 * s,x +   21.581 * s,y +  -52.294 * s, threshold);
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
			_setf(o + ( 0 << 2), x +   21.582 * s);
			_setf(o + ( 1 << 2), y +  -52.294 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   21.582 * s,y +  -52.294 * s,x +   23.600 * s,y +  -52.294 * s,x +   25.325 * s,y +  -51.578 * s,x +   26.757 * s,y +  -50.146 * s, threshold);
			_vr.bezier8(x +   26.757 * s,y +  -50.146 * s,x +   28.190 * s,y +  -48.713 * s,x +   28.906 * s,y +  -46.988 * s,x +   28.906 * s,y +  -44.970 * s, threshold);
			_vr.bezier8(x +   28.906 * s,y +  -44.970 * s,x +   28.906 * s,y +  -42.952 * s,x +   28.190 * s,y +  -41.218 * s,x +   26.757 * s,y +  -39.770 * s, threshold);
			_vr.bezier8(x +   26.757 * s,y +  -39.770 * s,x +   25.325 * s,y +  -38.321 * s,x +   23.600 * s,y +  -37.597 * s,x +   21.582 * s,y +  -37.597 * s, threshold);
			_vr.bezier8(x +   21.582 * s,y +  -37.597 * s,x +   19.563 * s,y +  -37.597 * s,x +   17.838 * s,y +  -38.321 * s,x +   16.406 * s,y +  -39.770 * s, threshold);
			_vr.bezier8(x +   16.406 * s,y +  -39.770 * s,x +   14.974 * s,y +  -41.218 * s,x +   14.258 * s,y +  -42.952 * s,x +   14.258 * s,y +  -44.970 * s, threshold);
			_vr.bezier8(x +   14.258 * s,y +  -44.970 * s,x +   14.258 * s,y +  -46.988 * s,x +   14.974 * s,y +  -48.713 * s,x +   16.406 * s,y +  -50.146 * s, threshold);
			_vr.bezier8(x +   16.406 * s,y +  -50.146 * s,x +   17.838 * s,y +  -51.578 * s,x +   19.563 * s,y +  -52.294 * s,x +   21.582 * s,y +  -52.294 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    8.887 * s);
			_setf(o + ( 1 << 2), y +   16.357 * s);
			_setf(o + ( 2 << 2), x +    6.738 * s);
			_setf(o + ( 3 << 2), y +   12.646 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    6.738 * s,y +   12.646 * s,x +   13.021 * s,y +    8.349 * s,x +   16.162 * s,y +    4.460 * s,x +   16.162 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   16.162 * s,y +    0.977 * s,x +   16.162 * s,y +   -0.163 * s,x +   15.787 * s,y +   -1.383 * s,x +   15.039 * s,y +   -2.686 * s, threshold);
			_vr.bezier8(x +   15.039 * s,y +   -2.686 * s,x +   12.565 * s,y +   -4.150 * s,x +   11.328 * s,y +   -6.038 * s,x +   11.328 * s,y +   -8.349 * s, threshold);
			_vr.bezier8(x +   11.328 * s,y +   -8.349 * s,x +   11.328 * s,y +  -10.075 * s,x +   11.971 * s,y +  -11.474 * s,x +   13.257 * s,y +  -12.549 * s, threshold);
			_vr.bezier8(x +   13.257 * s,y +  -12.549 * s,x +   14.542 * s,y +  -13.623 * s,x +   16.146 * s,y +  -14.160 * s,x +   18.066 * s,y +  -14.160 * s, threshold);
			_vr.bezier8(x +   18.066 * s,y +  -14.160 * s,x +   20.084 * s,y +  -14.160 * s,x +   21.769 * s,y +  -13.387 * s,x +   23.120 * s,y +  -11.841 * s, threshold);
			_vr.bezier8(x +   23.120 * s,y +  -11.841 * s,x +   24.471 * s,y +  -10.294 * s,x +   25.146 * s,y +   -8.496 * s,x +   25.146 * s,y +   -6.445 * s, threshold);
			_vr.bezier8(x +   25.146 * s,y +   -6.445 * s,x +   25.146 * s,y +   -2.116 * s,x +   23.958 * s,y +    1.823 * s,x +   21.582 * s,y +    5.371 * s, threshold);
			_vr.bezier8(x +   21.582 * s,y +    5.371 * s,x +   19.205 * s,y +    8.919 * s,x +   14.974 * s,y +   12.581 * s,x +    8.887 * s,y +   16.357 * s, threshold);
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
			_setf(o + ( 0 << 2), x +   48.486 * s);
			_setf(o + ( 1 << 2), y +  -28.125 * s);
			_setf(o + ( 2 << 2), x +   12.403 * s);
			_setf(o + ( 3 << 2), y +  -10.644 * s);
			_setf(o + ( 4 << 2), x +   12.403 * s);
			_setf(o + ( 5 << 2), y +  -18.506 * s);
			_setf(o + ( 6 << 2), x +   40.283 * s);
			_setf(o + ( 7 << 2), y +  -31.103 * s);
			_setf(o + ( 8 << 2), x +   12.403 * s);
			_setf(o + ( 9 << 2), y +  -43.554 * s);
			_setf(o + (10 << 2), x +   12.403 * s);
			_setf(o + (11 << 2), y +  -51.415 * s);
			_setf(o + (12 << 2), x +   48.486 * s);
			_setf(o + (13 << 2), y +  -34.130 * s);
			_setf(o + (14 << 2), x +   48.486 * s);
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
			_setf(o + ( 0 << 2), x +   16.748 * s);
			_setf(o + ( 1 << 2), y +  -20.947 * s);
			_setf(o + ( 2 << 2), x +   11.963 * s);
			_setf(o + ( 3 << 2), y +  -20.947 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   11.963 * s,y +  -20.947 * s,x +   11.930 * s,y +  -21.338 * s,x +   11.808 * s,y +  -22.086 * s,x +   11.596 * s,y +  -23.193 * s, threshold);
			_vr.bezier8(x +   11.596 * s,y +  -23.193 * s,x +   11.385 * s,y +  -24.300 * s,x +   11.279 * s,y +  -25.162 * s,x +   11.279 * s,y +  -25.781 * s, threshold);
			_vr.bezier8(x +   11.279 * s,y +  -25.781 * s,x +   11.279 * s,y +  -30.078 * s,x +   12.726 * s,y +  -34.524 * s,x +   16.552 * s,y +  -38.232 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   25.976 * s);
			_setf(o + ( 1 << 2), y +  -47.363 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   25.976 * s,y +  -47.363 * s,x +   27.729 * s,y +  -49.061 * s,x +   29.117 * s,y +  -50.870 * s,x +   30.126 * s,y +  -52.807 * s, threshold);
			_vr.bezier8(x +   30.126 * s,y +  -52.807 * s,x +   31.136 * s,y +  -54.744 * s,x +   31.640 * s,y +  -56.672 * s,x +   31.640 * s,y +  -58.593 * s, threshold);
			_vr.bezier8(x +   31.640 * s,y +  -58.593 * s,x +   31.640 * s,y +  -63.085 * s,x +   28.938 * s,y +  -65.331 * s,x +   23.535 * s,y +  -65.331 * s, threshold);
			_vr.bezier8(x +   23.535 * s,y +  -65.331 * s,x +   19.628 * s,y +  -65.331 * s,x +   16.455 * s,y +  -64.354 * s,x +   14.013 * s,y +  -62.401 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   10.937 * s);
			_setf(o + ( 1 << 2), y +  -68.749 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   10.937 * s,y +  -68.749 * s,x +   13.932 * s,y +  -71.451 * s,x +   19.059 * s,y +  -72.802 * s,x +   26.318 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   26.318 * s,y +  -72.802 * s,x +   30.777 * s,y +  -72.802 * s,x +   34.334 * s,y +  -71.581 * s,x +   36.987 * s,y +  -69.140 * s, threshold);
			_vr.bezier8(x +   36.987 * s,y +  -69.140 * s,x +   39.640 * s,y +  -66.698 * s,x +   40.966 * s,y +  -63.313 * s,x +   40.966 * s,y +  -58.983 * s, threshold);
			_vr.bezier8(x +   40.966 * s,y +  -58.983 * s,x +   40.966 * s,y +  -53.222 * s,x +   38.834 * s,y +  -48.079 * s,x +   34.570 * s,y +  -43.554 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   23.193 * s);
			_setf(o + ( 1 << 2), y +  -33.642 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   23.193 * s,y +  -33.642 * s,x +   21.036 * s,y +  -31.763 * s,x +   19.409 * s,y +  -29.744 * s,x +   18.286 * s,y +  -27.612 * s, threshold);
			_vr.bezier8(x +   18.286 * s,y +  -27.612 * s,x +   17.163 * s,y +  -25.480 * s,x +   16.650 * s,y +  -23.258 * s,x +   16.748 * s,y +  -20.947 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   14.062 * s);
			_setf(o + ( 1 << 2), y +  -12.842 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   14.062 * s,y +  -12.842 * s,x +   15.950 * s,y +  -12.842 * s,x +   17.578 * s,y +  -12.158 * s,x +   18.945 * s,y +  -10.791 * s, threshold);
			_vr.bezier8(x +   18.945 * s,y +  -10.791 * s,x +   20.312 * s,y +   -9.424 * s,x +   20.996 * s,y +   -7.796 * s,x +   20.996 * s,y +   -5.908 * s, threshold);
			_vr.bezier8(x +   20.996 * s,y +   -5.908 * s,x +   20.996 * s,y +   -4.020 * s,x +   20.312 * s,y +   -2.401 * s,x +   18.945 * s,y +   -1.050 * s, threshold);
			_vr.bezier8(x +   18.945 * s,y +   -1.050 * s,x +   17.578 * s,y +    0.301 * s,x +   15.950 * s,y +    0.977 * s,x +   14.062 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   14.062 * s,y +    0.977 * s,x +   12.142 * s,y +    0.977 * s,x +   10.506 * s,y +    0.301 * s,x +    9.155 * s,y +   -1.050 * s, threshold);
			_vr.bezier8(x +    9.155 * s,y +   -1.050 * s,x +    7.804 * s,y +   -2.401 * s,x +    7.129 * s,y +   -4.020 * s,x +    7.129 * s,y +   -5.908 * s, threshold);
			_vr.bezier8(x +    7.129 * s,y +   -5.908 * s,x +    7.129 * s,y +   -7.796 * s,x +    7.804 * s,y +   -9.424 * s,x +    9.155 * s,y +  -10.791 * s, threshold);
			_vr.bezier8(x +    9.155 * s,y +  -10.791 * s,x +   10.506 * s,y +  -12.158 * s,x +   12.142 * s,y +  -12.842 * s,x +   14.062 * s,y +  -12.842 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.718 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 64:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   45.361 * s);
			_setf(o + ( 1 << 2), y +  -17.334 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   45.361 * s,y +  -17.334 * s,x +   44.514 * s,y +  -15.901 * s,x +   42.976 * s,y +  -14.632 * s,x +   40.747 * s,y +  -13.525 * s, threshold);
			_vr.bezier8(x +   40.747 * s,y +  -13.525 * s,x +   38.517 * s,y +  -12.418 * s,x +   36.393 * s,y +  -11.865 * s,x +   34.375 * s,y +  -11.865 * s, threshold);
			_vr.bezier8(x +   34.375 * s,y +  -11.865 * s,x +   30.859 * s,y +  -11.865 * s,x +   28.035 * s,y +  -12.833 * s,x +   25.903 * s,y +  -14.770 * s, threshold);
			_vr.bezier8(x +   25.903 * s,y +  -14.770 * s,x +   23.771 * s,y +  -16.707 * s,x +   22.705 * s,y +  -19.433 * s,x +   22.705 * s,y +  -22.949 * s, threshold);
			_vr.bezier8(x +   22.705 * s,y +  -22.949 * s,x +   22.705 * s,y +  -28.939 * s,x +   24.813 * s,y +  -34.261 * s,x +   29.028 * s,y +  -38.915 * s, threshold);
			_vr.bezier8(x +   29.028 * s,y +  -38.915 * s,x +   33.243 * s,y +  -43.570 * s,x +   38.265 * s,y +  -45.898 * s,x +   44.091 * s,y +  -45.898 * s, threshold);
			_vr.bezier8(x +   44.091 * s,y +  -45.898 * s,x +   46.109 * s,y +  -45.898 * s,x +   47.729 * s,y +  -45.743 * s,x +   48.950 * s,y +  -45.434 * s, threshold);
			_vr.bezier8(x +   48.950 * s,y +  -45.434 * s,x +   50.170 * s,y +  -45.125 * s,x +   52.522 * s,y +  -44.221 * s,x +   56.005 * s,y +  -42.724 * s, threshold);
			_vr.bezier8(x +   56.005 * s,y +  -42.724 * s,x +   53.336 * s,y +  -30.940 * s,x +   52.001 * s,y +  -24.218 * s,x +   52.001 * s,y +  -22.558 * s, threshold);
			_vr.bezier8(x +   52.001 * s,y +  -22.558 * s,x +   52.001 * s,y +  -19.238 * s,x +   53.336 * s,y +  -17.578 * s,x +   56.005 * s,y +  -17.578 * s, threshold);
			_vr.bezier8(x +   56.005 * s,y +  -17.578 * s,x +   59.846 * s,y +  -17.578 * s,x +   62.841 * s,y +  -19.563 * s,x +   64.989 * s,y +  -23.535 * s, threshold);
			_vr.bezier8(x +   64.989 * s,y +  -23.535 * s,x +   67.138 * s,y +  -27.506 * s,x +   68.212 * s,y +  -32.194 * s,x +   68.212 * s,y +  -37.597 * s, threshold);
			_vr.bezier8(x +   68.212 * s,y +  -37.597 * s,x +   68.212 * s,y +  -43.977 * s,x +   66.194 * s,y +  -49.096 * s,x +   62.157 * s,y +  -52.953 * s, threshold);
			_vr.bezier8(x +   62.157 * s,y +  -52.953 * s,x +   58.121 * s,y +  -56.811 * s,x +   52.880 * s,y +  -58.739 * s,x +   46.435 * s,y +  -58.739 * s, threshold);
			_vr.bezier8(x +   46.435 * s,y +  -58.739 * s,x +   37.028 * s,y +  -58.739 * s,x +   29.101 * s,y +  -55.061 * s,x +   22.656 * s,y +  -47.704 * s, threshold);
			_vr.bezier8(x +   22.656 * s,y +  -47.704 * s,x +   16.211 * s,y +  -40.348 * s,x +   12.988 * s,y +  -31.721 * s,x +   12.988 * s,y +  -21.826 * s, threshold);
			_vr.bezier8(x +   12.988 * s,y +  -21.826 * s,x +   12.988 * s,y +  -14.794 * s,x +   15.055 * s,y +   -9.302 * s,x +   19.189 * s,y +   -5.347 * s, threshold);
			_vr.bezier8(x +   19.189 * s,y +   -5.347 * s,x +   23.323 * s,y +   -1.392 * s,x +   28.922 * s,y +    0.586 * s,x +   35.986 * s,y +    0.586 * s, threshold);
			_vr.bezier8(x +   35.986 * s,y +    0.586 * s,x +   43.506 * s,y +    0.586 * s,x +   49.902 * s,y +   -1.497 * s,x +   55.175 * s,y +   -5.664 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   59.863 * s);
			_setf(o + ( 1 << 2), y +   -2.148 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   59.863 * s,y +   -2.148 * s,x +   53.059 * s,y +    3.646 * s,x +   44.742 * s,y +    6.543 * s,x +   34.912 * s,y +    6.543 * s, threshold);
			_vr.bezier8(x +   34.912 * s,y +    6.543 * s,x +   26.058 * s,y +    6.543 * s,x +   19.018 * s,y +    4.118 * s,x +   13.794 * s,y +   -0.732 * s, threshold);
			_vr.bezier8(x +   13.794 * s,y +   -0.732 * s,x +    8.569 * s,y +   -5.583 * s,x +    5.957 * s,y +  -12.255 * s,x +    5.957 * s,y +  -20.752 * s, threshold);
			_vr.bezier8(x +    5.957 * s,y +  -20.752 * s,x +    5.957 * s,y +  -32.698 * s,x +    9.977 * s,y +  -43.009 * s,x +   18.017 * s,y +  -51.684 * s, threshold);
			_vr.bezier8(x +   18.017 * s,y +  -51.684 * s,x +   26.058 * s,y +  -60.359 * s,x +   35.888 * s,y +  -64.696 * s,x +   47.509 * s,y +  -64.696 * s, threshold);
			_vr.bezier8(x +   47.509 * s,y +  -64.696 * s,x +   55.973 * s,y +  -64.696 * s,x +   62.719 * s,y +  -62.442 * s,x +   67.748 * s,y +  -57.934 * s, threshold);
			_vr.bezier8(x +   67.748 * s,y +  -57.934 * s,x +   72.777 * s,y +  -53.425 * s,x +   75.292 * s,y +  -47.200 * s,x +   75.292 * s,y +  -39.257 * s, threshold);
			_vr.bezier8(x +   75.292 * s,y +  -39.257 * s,x +   75.292 * s,y +  -32.194 * s,x +   73.436 * s,y +  -25.952 * s,x +   69.726 * s,y +  -20.532 * s, threshold);
			_vr.bezier8(x +   69.726 * s,y +  -20.532 * s,x +   66.015 * s,y +  -15.112 * s,x +   61.181 * s,y +  -12.402 * s,x +   55.224 * s,y +  -12.402 * s, threshold);
			_vr.bezier8(x +   55.224 * s,y +  -12.402 * s,x +   53.206 * s,y +  -12.402 * s,x +   51.220 * s,y +  -12.850 * s,x +   49.267 * s,y +  -13.745 * s, threshold);
			_vr.bezier8(x +   49.267 * s,y +  -13.745 * s,x +   47.314 * s,y +  -14.640 * s,x +   46.012 * s,y +  -15.836 * s,x +   45.361 * s,y +  -17.334 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   48.583 * s);
			_setf(o + ( 1 << 2), y +  -39.062 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   48.583 * s,y +  -39.062 * s,x +   47.249 * s,y +  -40.527 * s,x +   45.637 * s,y +  -41.259 * s,x +   43.749 * s,y +  -41.259 * s, threshold);
			_vr.bezier8(x +   43.749 * s,y +  -41.259 * s,x +   40.071 * s,y +  -41.259 * s,x +   36.946 * s,y +  -39.339 * s,x +   34.375 * s,y +  -35.497 * s, threshold);
			_vr.bezier8(x +   34.375 * s,y +  -35.497 * s,x +   31.803 * s,y +  -31.656 * s,x +   30.517 * s,y +  -27.653 * s,x +   30.517 * s,y +  -23.486 * s, threshold);
			_vr.bezier8(x +   30.517 * s,y +  -23.486 * s,x +   30.517 * s,y +  -19.384 * s,x +   32.340 * s,y +  -17.334 * s,x +   35.986 * s,y +  -17.334 * s, threshold);
			_vr.bezier8(x +   35.986 * s,y +  -17.334 * s,x +   38.330 * s,y +  -17.334 * s,x +   40.445 * s,y +  -18.164 * s,x +   42.333 * s,y +  -19.824 * s, threshold);
			_vr.bezier8(x +   42.333 * s,y +  -19.824 * s,x +   44.221 * s,y +  -21.484 * s,x +   45.414 * s,y +  -23.501 * s,x +   45.898 * s,y +  -25.879 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   48.583 * s);
			_setf(o + ( 1 << 2), y +  -39.062 * s);
			_setf(o + ( 2 << 2), x +   77.050 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 65:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   45.702 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   43.456 * s);
			_setf(o + ( 3 << 2), y +  -15.088 * s);
			_setf(o + ( 4 << 2), x +   17.822 * s);
			_setf(o + ( 5 << 2), y +  -15.088 * s);
			_setf(o + ( 6 << 2), x +    9.375 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   -1.562 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   40.283 * s);
			_setf(o + (11 << 2), y +  -72.509 * s);
			_setf(o + (12 << 2), x +   42.870 * s);
			_setf(o + (13 << 2), y +  -72.509 * s);
			_setf(o + (14 << 2), x +   57.030 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   45.702 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   38.036 * s);
			_setf(o + (19 << 2), y +  -52.831 * s);
			_setf(o + (20 << 2), x +   21.679 * s);
			_setf(o + (21 << 2), y +  -22.265 * s);
			_setf(o + (22 << 2), x +   42.431 * s);
			_setf(o + (23 << 2), y +  -22.265 * s);
			_setf(o + (24 << 2), x +   38.036 * s);
			_setf(o + (25 << 2), y +  -52.831 * s);
			_setf(o + (26 << 2), x +   61.083 * s);
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
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    4.248 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   16.894 * s);
			_setf(o + ( 3 << 2), y +  -71.532 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   16.894 * s,y +  -71.532 * s,x +   21.744 * s,y +  -72.248 * s,x +   26.220 * s,y +  -72.606 * s,x +   30.322 * s,y +  -72.606 * s, threshold);
			_vr.bezier8(x +   30.322 * s,y +  -72.606 * s,x +   47.151 * s,y +  -72.606 * s,x +   55.566 * s,y +  -66.991 * s,x +   55.566 * s,y +  -55.761 * s, threshold);
			_vr.bezier8(x +   55.566 * s,y +  -55.761 * s,x +   55.566 * s,y +  -52.050 * s,x +   54.239 * s,y +  -48.624 * s,x +   51.586 * s,y +  -45.483 * s, threshold);
			_vr.bezier8(x +   51.586 * s,y +  -45.483 * s,x +   48.933 * s,y +  -42.341 * s,x +   45.800 * s,y +  -40.543 * s,x +   42.187 * s,y +  -40.087 * s, threshold);
			_vr.bezier8(x +   42.187 * s,y +  -40.087 * s,x +   50.129 * s,y +  -38.622 * s,x +   54.101 * s,y +  -33.154 * s,x +   54.101 * s,y +  -23.681 * s, threshold);
			_vr.bezier8(x +   54.101 * s,y +  -23.681 * s,x +   54.101 * s,y +  -15.609 * s,x +   51.277 * s,y +   -9.546 * s,x +   45.629 * s,y +   -5.493 * s, threshold);
			_vr.bezier8(x +   45.629 * s,y +   -5.493 * s,x +   39.982 * s,y +   -1.440 * s,x +   30.989 * s,y +    0.586 * s,x +   18.652 * s,y +    0.586 * s, threshold);
			_vr.bezier8(x +   18.652 * s,y +    0.586 * s,x +   15.202 * s,y +    0.586 * s,x +   10.400 * s,y +    0.391 * s,x +    4.248 * s,y +       0. * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   25.586 * s);
			_setf(o + ( 1 << 2), y +  -63.720 * s);
			_setf(o + ( 2 << 2), x +   22.363 * s);
			_setf(o + ( 3 << 2), y +  -43.896 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   22.363 * s,y +  -43.896 * s,x +   25.195 * s,y +  -43.668 * s,x +   27.490 * s,y +  -43.554 * s,x +   29.248 * s,y +  -43.554 * s, threshold);
			_vr.bezier8(x +   29.248 * s,y +  -43.554 * s,x +   40.152 * s,y +  -43.554 * s,x +   45.605 * s,y +  -47.737 * s,x +   45.605 * s,y +  -56.103 * s, threshold);
			_vr.bezier8(x +   45.605 * s,y +  -56.103 * s,x +   45.605 * s,y +  -61.474 * s,x +   41.373 * s,y +  -64.159 * s,x +   32.910 * s,y +  -64.159 * s, threshold);
			_vr.bezier8(x +   32.910 * s,y +  -64.159 * s,x +   31.315 * s,y +  -64.159 * s,x +   28.873 * s,y +  -64.013 * s,x +   25.586 * s,y +  -63.720 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   20.703 * s);
			_setf(o + ( 1 << 2), y +  -35.742 * s);
			_setf(o + ( 2 << 2), x +   15.820 * s);
			_setf(o + ( 3 << 2), y +   -8.301 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   15.820 * s,y +   -8.301 * s,x +   17.610 * s,y +   -7.975 * s,x +   19.580 * s,y +   -7.812 * s,x +   21.728 * s,y +   -7.812 * s, threshold);
			_vr.bezier8(x +   21.728 * s,y +   -7.812 * s,x +   28.206 * s,y +   -7.812 * s,x +   33.536 * s,y +   -9.106 * s,x +   37.719 * s,y +  -11.694 * s, threshold);
			_vr.bezier8(x +   37.719 * s,y +  -11.694 * s,x +   41.902 * s,y +  -14.282 * s,x +   43.994 * s,y +  -17.920 * s,x +   43.994 * s,y +  -22.607 * s, threshold);
			_vr.bezier8(x +   43.994 * s,y +  -22.607 * s,x +   43.994 * s,y +  -31.591 * s,x +   38.281 * s,y +  -36.083 * s,x +   26.855 * s,y +  -36.083 * s, threshold);
			_vr.bezier8(x +   26.855 * s,y +  -36.083 * s,x +   24.967 * s,y +  -36.083 * s,x +   22.916 * s,y +  -35.969 * s,x +   20.703 * s,y +  -35.742 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   56.591 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 67:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   58.788 * s);
			_setf(o + ( 1 << 2), y +  -70.458 * s);
			_setf(o + ( 2 << 2), x +   56.103 * s);
			_setf(o + ( 3 << 2), y +  -60.937 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   56.103 * s,y +  -60.937 * s,x +   53.368 * s,y +  -63.020 * s,x +   49.511 * s,y +  -64.062 * s,x +   44.531 * s,y +  -64.062 * s, threshold);
			_vr.bezier8(x +   44.531 * s,y +  -64.062 * s,x +   36.848 * s,y +  -64.062 * s,x +   30.379 * s,y +  -60.229 * s,x +   25.122 * s,y +  -52.563 * s, threshold);
			_vr.bezier8(x +   25.122 * s,y +  -52.563 * s,x +   19.865 * s,y +  -44.897 * s,x +   17.236 * s,y +  -36.621 * s,x +   17.236 * s,y +  -27.734 * s, threshold);
			_vr.bezier8(x +   17.236 * s,y +  -27.734 * s,x +   17.236 * s,y +  -14.290 * s,x +   22.819 * s,y +   -7.568 * s,x +   33.984 * s,y +   -7.568 * s, threshold);
			_vr.bezier8(x +   33.984 * s,y +   -7.568 * s,x +   39.746 * s,y +   -7.568 * s,x +   45.344 * s,y +   -9.928 * s,x +   50.780 * s,y +  -14.648 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   49.999 * s);
			_setf(o + ( 1 << 2), y +   -4.297 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   49.999 * s,y +   -4.297 * s,x +   45.995 * s,y +   -0.618 * s,x +   39.794 * s,y +    1.221 * s,x +   31.396 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   31.396 * s,y +    1.221 * s,x +   23.584 * s,y +    1.221 * s,x +   17.545 * s,y +   -1.188 * s,x +   13.281 * s,y +   -6.006 * s, threshold);
			_vr.bezier8(x +   13.281 * s,y +   -6.006 * s,x +    9.017 * s,y +  -10.823 * s,x +    6.885 * s,y +  -17.464 * s,x +    6.885 * s,y +  -25.927 * s, threshold);
			_vr.bezier8(x +    6.885 * s,y +  -25.927 * s,x +    6.885 * s,y +  -39.014 * s,x +   10.441 * s,y +  -50.089 * s,x +   17.553 * s,y +  -59.154 * s, threshold);
			_vr.bezier8(x +   17.553 * s,y +  -59.154 * s,x +   24.666 * s,y +  -68.220 * s,x +   33.854 * s,y +  -72.753 * s,x +   45.116 * s,y +  -72.753 * s, threshold);
			_vr.bezier8(x +   45.116 * s,y +  -72.753 * s,x +   50.781 * s,y +  -72.753 * s,x +   55.338 * s,y +  -71.988 * s,x +   58.788 * s,y +  -70.458 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   59.814 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 68:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   18.896 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    3.271 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   15.868 * s);
			_setf(o + ( 5 << 2), y +  -71.532 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   15.868 * s,y +  -71.532 * s,x +   19.872 * s,y +  -72.281 * s,x +   23.925 * s,y +  -72.655 * s,x +   28.026 * s,y +  -72.655 * s, threshold);
			_vr.bezier8(x +   28.026 * s,y +  -72.655 * s,x +   38.410 * s,y +  -72.655 * s,x +   46.483 * s,y +  -70.230 * s,x +   52.245 * s,y +  -65.380 * s, threshold);
			_vr.bezier8(x +   52.245 * s,y +  -65.380 * s,x +   58.006 * s,y +  -60.530 * s,x +   60.887 * s,y +  -53.352 * s,x +   60.887 * s,y +  -43.847 * s, threshold);
			_vr.bezier8(x +   60.887 * s,y +  -43.847 * s,x +   60.887 * s,y +  -29.980 * s,x +   56.916 * s,y +  -19.205 * s,x +   48.973 * s,y +  -11.523 * s, threshold);
			_vr.bezier8(x +   48.973 * s,y +  -11.523 * s,x +   41.031 * s,y +   -3.841 * s,x +   31.005 * s,y +       0. * s,x +   18.896 * s,y +       0. * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   24.023 * s);
			_setf(o + ( 1 << 2), y +  -63.134 * s);
			_setf(o + ( 2 << 2), x +   14.941 * s);
			_setf(o + ( 3 << 2), y +   -9.228 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   14.941 * s,y +   -9.228 * s,x +   16.829 * s,y +   -8.968 * s,x +   18.668 * s,y +   -8.838 * s,x +   20.458 * s,y +   -8.838 * s, threshold);
			_vr.bezier8(x +   20.458 * s,y +   -8.838 * s,x +   29.475 * s,y +   -8.838 * s,x +   36.718 * s,y +  -12.174 * s,x +   42.186 * s,y +  -18.847 * s, threshold);
			_vr.bezier8(x +   42.186 * s,y +  -18.847 * s,x +   47.655 * s,y +  -25.520 * s,x +   50.389 * s,y +  -34.033 * s,x +   50.389 * s,y +  -44.384 * s, threshold);
			_vr.bezier8(x +   50.389 * s,y +  -44.384 * s,x +   50.389 * s,y +  -50.308 * s,x +   48.428 * s,y +  -55.045 * s,x +   44.506 * s,y +  -58.593 * s, threshold);
			_vr.bezier8(x +   44.506 * s,y +  -58.593 * s,x +   40.583 * s,y +  -62.141 * s,x +   35.741 * s,y +  -63.915 * s,x +   29.980 * s,y +  -63.915 * s, threshold);
			_vr.bezier8(x +   29.980 * s,y +  -63.915 * s,x +   27.896 * s,y +  -63.915 * s,x +   25.911 * s,y +  -63.655 * s,x +   24.023 * s,y +  -63.134 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   61.327 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 69:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   23.632 * s);
			_setf(o + ( 1 << 2), y +  -62.743 * s);
			_setf(o + ( 2 << 2), x +   20.117 * s);
			_setf(o + ( 3 << 2), y +  -42.870 * s);
			_setf(o + ( 4 << 2), x +   43.749 * s);
			_setf(o + ( 5 << 2), y +  -42.870 * s);
			_setf(o + ( 6 << 2), x +   42.284 * s);
			_setf(o + ( 7 << 2), y +  -34.570 * s);
			_setf(o + ( 8 << 2), x +   18.652 * s);
			_setf(o + ( 9 << 2), y +  -34.570 * s);
			_setf(o + (10 << 2), x +   14.111 * s);
			_setf(o + (11 << 2), y +   -8.789 * s);
			_setf(o + (12 << 2), x +   46.532 * s);
			_setf(o + (13 << 2), y +   -8.789 * s);
			_setf(o + (14 << 2), x +   44.970 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +    2.295 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   14.941 * s);
			_setf(o + (19 << 2), y +  -71.532 * s);
			_setf(o + (20 << 2), x +   58.153 * s);
			_setf(o + (21 << 2), y +  -71.532 * s);
			_setf(o + (22 << 2), x +   56.542 * s);
			_setf(o + (23 << 2), y +  -62.743 * s);
			_setf(o + (24 << 2), x +   23.632 * s);
			_setf(o + (25 << 2), y +  -62.743 * s);
			_setf(o + (26 << 2), x +   53.563 * s);
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
			_setf(o + ( 0 << 2), x +   24.023 * s);
			_setf(o + ( 1 << 2), y +  -62.743 * s);
			_setf(o + ( 2 << 2), x +   20.508 * s);
			_setf(o + ( 3 << 2), y +  -42.870 * s);
			_setf(o + ( 4 << 2), x +   45.654 * s);
			_setf(o + ( 5 << 2), y +  -42.870 * s);
			_setf(o + ( 6 << 2), x +   44.189 * s);
			_setf(o + ( 7 << 2), y +  -34.570 * s);
			_setf(o + ( 8 << 2), x +   19.043 * s);
			_setf(o + ( 9 << 2), y +  -34.570 * s);
			_setf(o + (10 << 2), x +   12.940 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    2.686 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   15.479 * s);
			_setf(o + (15 << 2), y +  -71.532 * s);
			_setf(o + (16 << 2), x +   59.960 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   58.447 * s);
			_setf(o + (19 << 2), y +  -62.743 * s);
			_setf(o + (20 << 2), x +   24.023 * s);
			_setf(o + (21 << 2), y +  -62.743 * s);
			_setf(o + (22 << 2), x +   52.490 * s);
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
			_setf(o + ( 0 << 2), x +   62.303 * s);
			_setf(o + ( 1 << 2), y +  -68.651 * s);
			_setf(o + ( 2 << 2), x +   59.374 * s);
			_setf(o + ( 3 << 2), y +  -59.325 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   59.374 * s,y +  -59.325 * s,x +   55.207 * s,y +  -62.418 * s,x +   50.683 * s,y +  -63.964 * s,x +   45.800 * s,y +  -63.964 * s, threshold);
			_vr.bezier8(x +   45.800 * s,y +  -63.964 * s,x +   37.044 * s,y +  -63.964 * s,x +   29.866 * s,y +  -60.578 * s,x +   24.267 * s,y +  -53.808 * s, threshold);
			_vr.bezier8(x +   24.267 * s,y +  -53.808 * s,x +   18.668 * s,y +  -47.037 * s,x +   15.869 * s,y +  -38.508 * s,x +   15.869 * s,y +  -28.222 * s, threshold);
			_vr.bezier8(x +   15.869 * s,y +  -28.222 * s,x +   15.869 * s,y +  -14.453 * s,x +   22.362 * s,y +   -7.568 * s,x +   35.351 * s,y +   -7.568 * s, threshold);
			_vr.bezier8(x +   35.351 * s,y +   -7.568 * s,x +   40.559 * s,y +   -7.568 * s,x +   45.051 * s,y +   -9.131 * s,x +   48.827 * s,y +  -12.256 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   51.806 * s);
			_setf(o + ( 1 << 2), y +  -29.003 * s);
			_setf(o + ( 2 << 2), x +   41.894 * s);
			_setf(o + ( 3 << 2), y +  -29.003 * s);
			_setf(o + ( 4 << 2), x +   43.358 * s);
			_setf(o + ( 5 << 2), y +  -37.304 * s);
			_setf(o + ( 6 << 2), x +   63.036 * s);
			_setf(o + ( 7 << 2), y +  -37.304 * s);
			_setf(o + ( 8 << 2), x +   57.518 * s);
			_setf(o + ( 9 << 2), y +   -6.152 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   57.518 * s,y +   -6.152 * s,x +   50.780 * s,y +   -1.237 * s,x +   42.203 * s,y +    1.221 * s,x +   31.786 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   31.786 * s,y +    1.221 * s,x +   14.241 * s,y +    1.221 * s,x +    5.468 * s,y +   -7.959 * s,x +    5.468 * s,y +  -26.318 * s, threshold);
			_vr.bezier8(x +    5.468 * s,y +  -26.318 * s,x +    5.468 * s,y +  -40.022 * s,x +    9.358 * s,y +  -51.187 * s,x +   17.138 * s,y +  -59.814 * s, threshold);
			_vr.bezier8(x +   17.138 * s,y +  -59.814 * s,x +   24.918 * s,y +  -68.440 * s,x +   35.090 * s,y +  -72.753 * s,x +   47.655 * s,y +  -72.753 * s, threshold);
			_vr.bezier8(x +   47.655 * s,y +  -72.753 * s,x +   54.687 * s,y +  -72.753 * s,x +   59.569 * s,y +  -71.386 * s,x +   62.303 * s,y +  -68.651 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   67.626 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 72:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   44.579 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   50.682 * s);
			_setf(o + ( 3 << 2), y +  -34.570 * s);
			_setf(o + ( 4 << 2), x +   19.433 * s);
			_setf(o + ( 5 << 2), y +  -34.570 * s);
			_setf(o + ( 6 << 2), x +   13.330 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    3.271 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   15.917 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   25.976 * s);
			_setf(o + (13 << 2), y +  -71.532 * s);
			_setf(o + (14 << 2), x +   20.898 * s);
			_setf(o + (15 << 2), y +  -42.870 * s);
			_setf(o + (16 << 2), x +   52.147 * s);
			_setf(o + (17 << 2), y +  -42.870 * s);
			_setf(o + (18 << 2), x +   57.225 * s);
			_setf(o + (19 << 2), y +  -71.532 * s);
			_setf(o + (20 << 2), x +   67.186 * s);
			_setf(o + (21 << 2), y +  -71.532 * s);
			_setf(o + (22 << 2), x +   54.540 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   44.579 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   65.428 * s);
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
			_setf(o + ( 0 << 2), x +    3.662 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   16.309 * s);
			_setf(o + ( 3 << 2), y +  -71.532 * s);
			_setf(o + ( 4 << 2), x +   26.269 * s);
			_setf(o + ( 5 << 2), y +  -71.532 * s);
			_setf(o + ( 6 << 2), x +   13.623 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    3.662 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   27.832 * s);
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
			_setf(o + ( 0 << 2), x +   -0.635 * s);
			_setf(o + ( 1 << 2), y +  -14.306 * s);
			_setf(o + ( 2 << 2), x +    7.910 * s);
			_setf(o + ( 3 << 2), y +  -14.306 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    7.910 * s,y +  -14.306 * s,x +    7.910 * s,y +   -9.977 * s,x +   10.107 * s,y +   -7.812 * s,x +   14.502 * s,y +   -7.812 * s, threshold);
			_vr.bezier8(x +   14.502 * s,y +   -7.812 * s,x +   18.701 * s,y +   -7.812 * s,x +   21.891 * s,y +   -8.699 * s,x +   24.072 * s,y +  -10.473 * s, threshold);
			_vr.bezier8(x +   24.072 * s,y +  -10.473 * s,x +   26.253 * s,y +  -12.248 * s,x +   28.092 * s,y +  -17.532 * s,x +   29.638 * s,y +  -26.318 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   37.597 * s);
			_setf(o + ( 1 << 2), y +  -71.532 * s);
			_setf(o + ( 2 << 2), x +   47.362 * s);
			_setf(o + ( 3 << 2), y +  -71.532 * s);
			_setf(o + ( 4 << 2), x +   39.501 * s);
			_setf(o + ( 5 << 2), y +  -26.709 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   39.501 * s,y +  -26.709 * s,x +   37.698 * s,y +  -16.425 * s,x +   35.009 * s,y +   -9.236 * s,x +   31.396 * s,y +   -5.151 * s, threshold);
			_vr.bezier8(x +   31.396 * s,y +   -5.151 * s,x +   27.783 * s,y +   -1.066 * s,x +   21.663 * s,y +    0.977 * s,x +   13.037 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   13.037 * s,y +    0.977 * s,x +    8.805 * s,y +    0.977 * s,x +    5.444 * s,y +   -0.171 * s,x +    2.954 * s,y +   -2.466 * s, threshold);
			_vr.bezier8(x +    2.954 * s,y +   -2.466 * s,x +    0.464 * s,y +   -4.761 * s,x +   -0.781 * s,y +   -7.926 * s,x +   -0.781 * s,y +  -11.963 * s, threshold);
			_vr.bezier8(x +   -0.781 * s,y +  -11.963 * s,x +   -0.781 * s,y +  -12.711 * s,x +   -0.732 * s,y +  -13.493 * s,x +   -0.635 * s,y +  -14.306 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   47.655 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 75:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   42.431 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   28.564 * s);
			_setf(o + ( 3 << 2), y +  -32.910 * s);
			_setf(o + ( 4 << 2), x +   16.650 * s);
			_setf(o + ( 5 << 2), y +  -19.384 * s);
			_setf(o + ( 6 << 2), x +   13.232 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    3.369 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   15.967 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   25.830 * s);
			_setf(o + (13 << 2), y +  -71.532 * s);
			_setf(o + (14 << 2), x +   19.384 * s);
			_setf(o + (15 << 2), y +  -34.521 * s);
			_setf(o + (16 << 2), x +   51.903 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   63.280 * s);
			_setf(o + (19 << 2), y +  -71.532 * s);
			_setf(o + (20 << 2), x +   36.425 * s);
			_setf(o + (21 << 2), y +  -40.527 * s);
			_setf(o + (22 << 2), x +   53.710 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   42.431 * s);
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
			_setf(o + ( 0 << 2), x +    4.101 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   16.748 * s);
			_setf(o + ( 3 << 2), y +  -71.532 * s);
			_setf(o + ( 4 << 2), x +   26.709 * s);
			_setf(o + ( 5 << 2), y +  -71.532 * s);
			_setf(o + ( 6 << 2), x +   15.625 * s);
			_setf(o + ( 7 << 2), y +   -8.789 * s);
			_setf(o + ( 8 << 2), x +   47.948 * s);
			_setf(o + ( 9 << 2), y +   -8.789 * s);
			_setf(o + (10 << 2), x +   46.386 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    4.101 * s);
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
			_setf(o + ( 0 << 2), x +   60.888 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   59.911 * s);
			_setf(o + ( 3 << 2), y +  -44.238 * s);
			_setf(o + ( 4 << 2), x +   36.132 * s);
			_setf(o + ( 5 << 2), y +    0.977 * s);
			_setf(o + ( 6 << 2), x +   33.691 * s);
			_setf(o + ( 7 << 2), y +    0.977 * s);
			_setf(o + ( 8 << 2), x +   25.976 * s);
			_setf(o + ( 9 << 2), y +  -44.628 * s);
			_setf(o + (10 << 2), x +    9.472 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    0.195 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   25.683 * s);
			_setf(o + (15 << 2), y +  -71.532 * s);
			_setf(o + (16 << 2), x +   30.615 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   38.378 * s);
			_setf(o + (19 << 2), y +  -21.338 * s);
			_setf(o + (20 << 2), x +   63.573 * s);
			_setf(o + (21 << 2), y +  -71.532 * s);
			_setf(o + (22 << 2), x +   68.700 * s);
			_setf(o + (23 << 2), y +  -71.532 * s);
			_setf(o + (24 << 2), x +   70.702 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   60.888 * s);
			_setf(o + (27 << 2), y +       0. * s);
			_setf(o + (28 << 2), x +   76.122 * s);
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
			_setf(o + ( 0 << 2), x +   48.974 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			_setf(o + ( 2 << 2), x +   21.044 * s);
			_setf(o + ( 3 << 2), y +  -49.804 * s);
			_setf(o + ( 4 << 2), x +   12.646 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    2.881 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   15.527 * s);
			_setf(o + ( 9 << 2), y +  -71.532 * s);
			_setf(o + (10 << 2), x +   19.433 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   46.776 * s);
			_setf(o + (13 << 2), y +  -22.802 * s);
			_setf(o + (14 << 2), x +   55.028 * s);
			_setf(o + (15 << 2), y +  -71.532 * s);
			_setf(o + (16 << 2), x +   64.696 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   51.903 * s);
			_setf(o + (19 << 2), y +    0.977 * s);
			_setf(o + (20 << 2), x +   48.974 * s);
			_setf(o + (21 << 2), y +    0.977 * s);
			_setf(o + (22 << 2), x +   63.817 * s);
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
			_setf(o + ( 0 << 2), x +    5.567 * s);
			_setf(o + ( 1 << 2), y +  -26.269 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +    5.567 * s,y +  -26.269 * s,x +    5.567 * s,y +  -38.834 * s,x +    8.919 * s,y +  -49.731 * s,x +   15.625 * s,y +  -58.959 * s, threshold);
			_vr.bezier8(x +   15.625 * s,y +  -58.959 * s,x +   22.331 * s,y +  -68.187 * s,x +   31.038 * s,y +  -72.802 * s,x +   41.748 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   41.748 * s,y +  -72.802 * s,x +   49.983 * s,y +  -72.802 * s,x +   56.257 * s,y +  -70.556 * s,x +   60.571 * s,y +  -66.063 * s, threshold);
			_vr.bezier8(x +   60.571 * s,y +  -66.063 * s,x +   64.884 * s,y +  -61.571 * s,x +   67.040 * s,y +  -55.110 * s,x +   67.040 * s,y +  -46.679 * s, threshold);
			_vr.bezier8(x +   67.040 * s,y +  -46.679 * s,x +   67.040 * s,y +  -32.779 * s,x +   63.647 * s,y +  -21.321 * s,x +   56.860 * s,y +  -12.304 * s, threshold);
			_vr.bezier8(x +   56.860 * s,y +  -12.304 * s,x +   50.073 * s,y +   -3.288 * s,x +   40.674 * s,y +    1.221 * s,x +   28.662 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   28.662 * s,y +    1.221 * s,x +   21.468 * s,y +    1.221 * s,x +   15.820 * s,y +   -1.326 * s,x +   11.719 * s,y +   -6.421 * s, threshold);
			_vr.bezier8(x +   11.719 * s,y +   -6.421 * s,x +    7.617 * s,y +  -11.515 * s,x +    5.567 * s,y +  -18.131 * s,x +    5.567 * s,y +  -26.269 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   15.967 * s);
			_setf(o + ( 1 << 2), y +  -27.636 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   15.967 * s,y +  -27.636 * s,x +   15.967 * s,y +  -21.452 * s,x +   17.196 * s,y +  -16.561 * s,x +   19.653 * s,y +  -12.964 * s, threshold);
			_vr.bezier8(x +   19.653 * s,y +  -12.964 * s,x +   22.111 * s,y +   -9.367 * s,x +   25.635 * s,y +   -7.568 * s,x +   30.224 * s,y +   -7.568 * s, threshold);
			_vr.bezier8(x +   30.224 * s,y +   -7.568 * s,x +   38.330 * s,y +   -7.568 * s,x +   44.767 * s,y +  -11.328 * s,x +   49.536 * s,y +  -18.847 * s, threshold);
			_vr.bezier8(x +   49.536 * s,y +  -18.847 * s,x +   54.304 * s,y +  -26.367 * s,x +   56.689 * s,y +  -35.302 * s,x +   56.689 * s,y +  -45.654 * s, threshold);
			_vr.bezier8(x +   56.689 * s,y +  -45.654 * s,x +   56.689 * s,y +  -57.926 * s,x +   51.416 * s,y +  -64.062 * s,x +   40.869 * s,y +  -64.062 * s, threshold);
			_vr.bezier8(x +   40.869 * s,y +  -64.062 * s,x +   33.577 * s,y +  -64.062 * s,x +   27.604 * s,y +  -60.082 * s,x +   22.949 * s,y +  -52.123 * s, threshold);
			_vr.bezier8(x +   22.949 * s,y +  -52.123 * s,x +   18.294 * s,y +  -44.164 * s,x +   15.967 * s,y +  -36.002 * s,x +   15.967 * s,y +  -27.636 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   67.382 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 80:
			
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   17.676 * s);
			_setf(o + ( 1 << 2), y +  -27.539 * s);
			_setf(o + ( 2 << 2), x +   12.793 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    2.637 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   15.674 * s);
			_setf(o + ( 7 << 2), y +  -71.532 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_vr.bezier8(x +   15.674 * s,y +  -71.532 * s,x +   21.728 * s,y +  -72.183 * s,x +   26.513 * s,y +  -72.509 * s,x +   30.029 * s,y +  -72.509 * s, threshold);
			_vr.bezier8(x +   30.029 * s,y +  -72.509 * s,x +   47.997 * s,y +  -72.509 * s,x +   56.982 * s,y +  -65.576 * s,x +   56.982 * s,y +  -51.708 * s, threshold);
			_vr.bezier8(x +   56.982 * s,y +  -51.708 * s,x +   56.982 * s,y +  -43.733 * s,x +   54.215 * s,y +  -37.516 * s,x +   48.681 * s,y +  -33.056 * s, threshold);
			_vr.bezier8(x +   48.681 * s,y +  -33.056 * s,x +   43.147 * s,y +  -28.597 * s,x +   36.067 * s,y +  -26.367 * s,x +   27.441 * s,y +  -26.367 * s, threshold);
			_vr.bezier8(x +   27.441 * s,y +  -26.367 * s,x +   24.023 * s,y +  -26.367 * s,x +   20.768 * s,y +  -26.757 * s,x +   17.676 * s,y +  -27.539 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   23.877 * s);
			_setf(o + ( 1 << 2), y +  -62.743 * s);
			_setf(o + ( 2 << 2), x +   19.238 * s);
			_setf(o + ( 3 << 2), y +  -36.328 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   19.238 * s,y +  -36.328 * s,x +   21.028 * s,y +  -35.449 * s,x +   23.665 * s,y +  -35.009 * s,x +   27.148 * s,y +  -35.009 * s, threshold);
			_vr.bezier8(x +   27.148 * s,y +  -35.009 * s,x +   32.942 * s,y +  -35.009 * s,x +   37.630 * s,y +  -36.368 * s,x +   41.210 * s,y +  -39.086 * s, threshold);
			_vr.bezier8(x +   41.210 * s,y +  -39.086 * s,x +   44.791 * s,y +  -41.804 * s,x +   46.581 * s,y +  -45.686 * s,x +   46.581 * s,y +  -50.732 * s, threshold);
			_vr.bezier8(x +   46.581 * s,y +  -50.732 * s,x +   46.581 * s,y +  -59.488 * s,x +   41.861 * s,y +  -63.866 * s,x +   32.421 * s,y +  -63.866 * s, threshold);
			_vr.bezier8(x +   32.421 * s,y +  -63.866 * s,x +   29.752 * s,y +  -63.866 * s,x +   26.904 * s,y +  -63.492 * s,x +   23.877 * s,y +  -62.743 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   54.345 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 81:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   44.823 * s);
			_setf(o + ( 1 << 2), y +   -2.148 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   44.823 * s,y +   -2.148 * s,x +   45.865 * s,y +    1.237 * s,x +   47.989 * s,y +    3.849 * s,x +   51.195 * s,y +    5.688 * s, threshold);
			_vr.bezier8(x +   51.195 * s,y +    5.688 * s,x +   54.402 * s,y +    7.528 * s,x +   58.202 * s,y +    8.447 * s,x +   62.597 * s,y +    8.447 * s, threshold);
			_vr.bezier8(x +   62.597 * s,y +    8.447 * s,x +   66.666 * s,y +    8.447 * s,x +   70.409 * s,y +    7.226 * s,x +   73.827 * s,y +    4.785 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   78.075 * s);
			_setf(o + ( 1 << 2), y +   12.158 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   78.075 * s,y +   12.158 * s,x +   76.968 * s,y +   13.623 * s,x +   74.730 * s,y +   14.990 * s,x +   71.361 * s,y +   16.260 * s, threshold);
			_vr.bezier8(x +   71.361 * s,y +   16.260 * s,x +   67.992 * s,y +   17.529 * s,x +   64.485 * s,y +   18.164 * s,x +   60.839 * s,y +   18.164 * s, threshold);
			_vr.bezier8(x +   60.839 * s,y +   18.164 * s,x +   54.296 * s,y +   18.164 * s,x +   48.787 * s,y +   16.544 * s,x +   44.311 * s,y +   13.305 * s, threshold);
			_vr.bezier8(x +   44.311 * s,y +   13.305 * s,x +   39.835 * s,y +   10.067 * s,x +   37.011 * s,y +    5.664 * s,x +   35.839 * s,y +    0.098 * s, threshold);
			_vr.bezier8(x +   35.839 * s,y +    0.098 * s,x +   33.333 * s,y +    0.846 * s,x +   30.712 * s,y +    1.221 * s,x +   27.978 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   27.978 * s,y +    1.221 * s,x +   20.523 * s,y +    1.221 * s,x +   14.811 * s,y +   -1.213 * s,x +   10.840 * s,y +   -6.079 * s, threshold);
			_vr.bezier8(x +   10.840 * s,y +   -6.079 * s,x +    6.868 * s,y +  -10.945 * s,x +    4.883 * s,y +  -17.675 * s,x +    4.883 * s,y +  -26.269 * s, threshold);
			_vr.bezier8(x +    4.883 * s,y +  -26.269 * s,x +    4.883 * s,y +  -38.834 * s,x +    8.227 * s,y +  -49.731 * s,x +   14.917 * s,y +  -58.959 * s, threshold);
			_vr.bezier8(x +   14.917 * s,y +  -58.959 * s,x +   21.606 * s,y +  -68.187 * s,x +   30.305 * s,y +  -72.802 * s,x +   41.015 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   41.015 * s,y +  -72.802 * s,x +   49.218 * s,y +  -72.802 * s,x +   55.492 * s,y +  -70.556 * s,x +   59.838 * s,y +  -66.063 * s, threshold);
			_vr.bezier8(x +   59.838 * s,y +  -66.063 * s,x +   64.183 * s,y +  -61.571 * s,x +   66.356 * s,y +  -55.110 * s,x +   66.356 * s,y +  -46.679 * s, threshold);
			_vr.bezier8(x +   66.356 * s,y +  -46.679 * s,x +   66.356 * s,y +  -36.881 * s,x +   64.387 * s,y +  -27.644 * s,x +   60.448 * s,y +  -18.969 * s, threshold);
			_vr.bezier8(x +   60.448 * s,y +  -18.969 * s,x +   56.509 * s,y +  -10.294 * s,x +   51.301 * s,y +   -4.687 * s,x +   44.823 * s,y +   -2.148 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   15.283 * s);
			_setf(o + ( 1 << 2), y +  -27.636 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   15.283 * s,y +  -27.636 * s,x +   15.283 * s,y +  -21.451 * s,x +   16.512 * s,y +  -16.561 * s,x +   18.969 * s,y +  -12.964 * s, threshold);
			_vr.bezier8(x +   18.969 * s,y +  -12.964 * s,x +   21.427 * s,y +   -9.367 * s,x +   24.951 * s,y +   -7.568 * s,x +   29.540 * s,y +   -7.568 * s, threshold);
			_vr.bezier8(x +   29.540 * s,y +   -7.568 * s,x +   37.646 * s,y +   -7.568 * s,x +   44.083 * s,y +  -11.352 * s,x +   48.852 * s,y +  -18.921 * s, threshold);
			_vr.bezier8(x +   48.852 * s,y +  -18.921 * s,x +   53.620 * s,y +  -26.489 * s,x +   56.005 * s,y +  -35.399 * s,x +   56.005 * s,y +  -45.654 * s, threshold);
			_vr.bezier8(x +   56.005 * s,y +  -45.654 * s,x +   56.005 * s,y +  -57.926 * s,x +   50.732 * s,y +  -64.062 * s,x +   40.185 * s,y +  -64.062 * s, threshold);
			_vr.bezier8(x +   40.185 * s,y +  -64.062 * s,x +   33.089 * s,y +  -64.062 * s,x +   27.164 * s,y +  -60.163 * s,x +   22.412 * s,y +  -52.367 * s, threshold);
			_vr.bezier8(x +   22.412 * s,y +  -52.367 * s,x +   17.659 * s,y +  -44.571 * s,x +   15.283 * s,y +  -36.328 * s,x +   15.283 * s,y +  -27.636 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   67.382 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 82:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   40.722 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   29.492 * s);
			_setf(o + ( 3 << 2), y +  -30.712 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   29.492 * s,y +  -30.712 * s,x +   26.985 * s,y +  -30.712 * s,x +   23.551 * s,y +  -30.875 * s,x +   19.189 * s,y +  -31.201 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   13.720 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    3.467 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   16.064 * s);
			_setf(o + ( 5 << 2), y +  -71.532 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   16.064 * s,y +  -71.532 * s,x +   17.399 * s,y +  -71.565 * s,x +   20.027 * s,y +  -71.695 * s,x +   23.950 * s,y +  -71.923 * s, threshold);
			_vr.bezier8(x +   23.950 * s,y +  -71.923 * s,x +   27.872 * s,y +  -72.151 * s,x +   31.087 * s,y +  -72.265 * s,x +   33.593 * s,y +  -72.265 * s, threshold);
			_vr.bezier8(x +   33.593 * s,y +  -72.265 * s,x +   41.145 * s,y +  -72.265 * s,x +   46.964 * s,y +  -70.914 * s,x +   51.049 * s,y +  -68.212 * s, threshold);
			_vr.bezier8(x +   51.049 * s,y +  -68.212 * s,x +   55.134 * s,y +  -65.510 * s,x +   57.177 * s,y +  -61.636 * s,x +   57.177 * s,y +  -56.591 * s, threshold);
			_vr.bezier8(x +   57.177 * s,y +  -56.591 * s,x +   57.177 * s,y +  -50.634 * s,x +   55.411 * s,y +  -45.418 * s,x +   51.879 * s,y +  -40.942 * s, threshold);
			_vr.bezier8(x +   51.879 * s,y +  -40.942 * s,x +   48.347 * s,y +  -36.466 * s,x +   43.912 * s,y +  -33.626 * s,x +   38.574 * s,y +  -32.421 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   51.903 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   40.722 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   24.756 * s);
			_setf(o + ( 5 << 2), y +  -62.743 * s);
			_setf(o + ( 6 << 2), x +   20.654 * s);
			_setf(o + ( 7 << 2), y +  -39.501 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			_setb(o +  3, 2);
			_vr.bezier8(x +   20.654 * s,y +  -39.501 * s,x +   23.063 * s,y +  -39.176 * s,x +   25.325 * s,y +  -39.013 * s,x +   27.441 * s,y +  -39.013 * s, threshold);
			_vr.bezier8(x +   27.441 * s,y +  -39.013 * s,x +   33.235 * s,y +  -39.013 * s,x +   37.898 * s,y +  -40.217 * s,x +   41.430 * s,y +  -42.626 * s, threshold);
			_vr.bezier8(x +   41.430 * s,y +  -42.626 * s,x +   44.962 * s,y +  -45.035 * s,x +   46.728 * s,y +  -48.339 * s,x +   46.728 * s,y +  -52.538 * s, threshold);
			_vr.bezier8(x +   46.728 * s,y +  -52.538 * s,x +   46.728 * s,y +  -56.412 * s,x +   45.491 * s,y +  -59.162 * s,x +   43.017 * s,y +  -60.790 * s, threshold);
			_vr.bezier8(x +   43.017 * s,y +  -60.790 * s,x +   40.543 * s,y +  -62.418 * s,x +   36.409 * s,y +  -63.231 * s,x +   30.615 * s,y +  -63.231 * s, threshold);
			_vr.bezier8(x +   30.615 * s,y +  -63.231 * s,x +   29.378 * s,y +  -63.231 * s,x +   27.425 * s,y +  -63.069 * s,x +   24.756 * s,y +  -62.743 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.202 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 83:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    4.248 * s);
			_setf(o + ( 1 << 2), y +   -2.295 * s);
			_setf(o + ( 2 << 2), x +    7.178 * s);
			_setf(o + ( 3 << 2), y +  -11.670 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    7.178 * s,y +  -11.670 * s,x +    8.577 * s,y +  -10.563 * s,x +   10.669 * s,y +   -9.619 * s,x +   13.452 * s,y +   -8.838 * s, threshold);
			_vr.bezier8(x +   13.452 * s,y +   -8.838 * s,x +   16.235 * s,y +   -8.057 * s,x +   18.913 * s,y +   -7.666 * s,x +   21.484 * s,y +   -7.666 * s, threshold);
			_vr.bezier8(x +   21.484 * s,y +   -7.666 * s,x +   25.358 * s,y +   -7.666 * s,x +   28.466 * s,y +   -8.610 * s,x +   30.810 * s,y +  -10.498 * s, threshold);
			_vr.bezier8(x +   30.810 * s,y +  -10.498 * s,x +   33.154 * s,y +  -12.386 * s,x +   34.326 * s,y +  -14.990 * s,x +   34.326 * s,y +  -18.310 * s, threshold);
			_vr.bezier8(x +   34.326 * s,y +  -18.310 * s,x +   34.326 * s,y +  -21.077 * s,x +   33.439 * s,y +  -23.519 * s,x +   31.665 * s,y +  -25.634 * s, threshold);
			_vr.bezier8(x +   31.665 * s,y +  -25.634 * s,x +   29.890 * s,y +  -27.750 * s,x +   26.863 * s,y +  -30.354 * s,x +   22.583 * s,y +  -33.447 * s, threshold);
			_vr.bezier8(x +   22.583 * s,y +  -33.447 * s,x +   18.302 * s,y +  -36.539 * s,x +   15.185 * s,y +  -39.420 * s,x +   13.232 * s,y +  -42.089 * s, threshold);
			_vr.bezier8(x +   13.232 * s,y +  -42.089 * s,x +   11.279 * s,y +  -44.758 * s,x +   10.303 * s,y +  -48.095 * s,x +   10.303 * s,y +  -52.099 * s, threshold);
			_vr.bezier8(x +   10.303 * s,y +  -52.099 * s,x +   10.303 * s,y +  -58.544 * s,x +   12.345 * s,y +  -63.598 * s,x +   16.430 * s,y +  -67.260 * s, threshold);
			_vr.bezier8(x +   16.430 * s,y +  -67.260 * s,x +   20.516 * s,y +  -70.922 * s,x +   25.797 * s,y +  -72.753 * s,x +   32.275 * s,y +  -72.753 * s, threshold);
			_vr.bezier8(x +   32.275 * s,y +  -72.753 * s,x +   39.599 * s,y +  -72.753 * s,x +   44.466 * s,y +  -72.118 * s,x +   46.875 * s,y +  -70.849 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   44.091 * s);
			_setf(o + ( 1 << 2), y +  -61.376 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   44.091 * s,y +  -61.376 * s,x +   43.180 * s,y +  -62.125 * s,x +   41.650 * s,y +  -62.825 * s,x +   39.502 * s,y +  -63.476 * s, threshold);
			_vr.bezier8(x +   39.502 * s,y +  -63.476 * s,x +   37.353 * s,y +  -64.127 * s,x +   35.351 * s,y +  -64.452 * s,x +   33.496 * s,y +  -64.452 * s, threshold);
			_vr.bezier8(x +   33.496 * s,y +  -64.452 * s,x +   29.329 * s,y +  -64.452 * s,x +   26.041 * s,y +  -63.508 * s,x +   23.632 * s,y +  -61.620 * s, threshold);
			_vr.bezier8(x +   23.632 * s,y +  -61.620 * s,x +   21.224 * s,y +  -59.732 * s,x +   20.019 * s,y +  -57.014 * s,x +   20.019 * s,y +  -53.466 * s, threshold);
			_vr.bezier8(x +   20.019 * s,y +  -53.466 * s,x +   20.019 * s,y +  -51.969 * s,x +   20.402 * s,y +  -50.520 * s,x +   21.167 * s,y +  -49.120 * s, threshold);
			_vr.bezier8(x +   21.167 * s,y +  -49.120 * s,x +   21.932 * s,y +  -47.721 * s,x +   22.965 * s,y +  -46.459 * s,x +   24.267 * s,y +  -45.336 * s, threshold);
			_vr.bezier8(x +   24.267 * s,y +  -45.336 * s,x +   25.569 * s,y +  -44.213 * s,x +   28.247 * s,y +  -42.138 * s,x +   32.299 * s,y +  -39.111 * s, threshold);
			_vr.bezier8(x +   32.299 * s,y +  -39.111 * s,x +   36.352 * s,y +  -36.083 * s,x +   39.331 * s,y +  -32.999 * s,x +   41.235 * s,y +  -29.858 * s, threshold);
			_vr.bezier8(x +   41.235 * s,y +  -29.858 * s,x +   43.139 * s,y +  -26.717 * s,x +   44.091 * s,y +  -23.063 * s,x +   44.091 * s,y +  -18.896 * s, threshold);
			_vr.bezier8(x +   44.091 * s,y +  -18.896 * s,x +   44.091 * s,y +  -12.419 * s,x +   41.919 * s,y +   -7.446 * s,x +   37.573 * s,y +   -3.979 * s, threshold);
			_vr.bezier8(x +   37.573 * s,y +   -3.979 * s,x +   33.227 * s,y +   -0.513 * s,x +   27.490 * s,y +    1.221 * s,x +   20.361 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   20.361 * s,y +    1.221 * s,x +   17.822 * s,y +    1.221 * s,x +   14.957 * s,y +    0.863 * s,x +   11.767 * s,y +    0.146 * s, threshold);
			_vr.bezier8(x +   11.767 * s,y +    0.146 * s,x +    8.577 * s,y +   -0.570 * s,x +    6.071 * s,y +   -1.383 * s,x +    4.248 * s,y +   -2.295 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   48.095 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 84:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +   40.429 * s);
			_setf(o + ( 1 << 2), y +  -62.743 * s);
			_setf(o + ( 2 << 2), x +   29.394 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   19.385 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   30.420 * s);
			_setf(o + ( 7 << 2), y +  -62.743 * s);
			_setf(o + ( 8 << 2), x +    7.666 * s);
			_setf(o + ( 9 << 2), y +  -62.743 * s);
			_setf(o + (10 << 2), x +    9.229 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   65.527 * s);
			_setf(o + (13 << 2), y +  -71.532 * s);
			_setf(o + (14 << 2), x +   63.964 * s);
			_setf(o + (15 << 2), y +  -62.743 * s);
			_setf(o + (16 << 2), x +   40.429 * s);
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
			_setf(o + ( 0 << 2), x +   15.820 * s);
			_setf(o + ( 1 << 2), y +  -71.532 * s);
			_setf(o + ( 2 << 2), x +   26.074 * s);
			_setf(o + ( 3 << 2), y +  -71.532 * s);
			_setf(o + ( 4 << 2), x +   17.285 * s);
			_setf(o + ( 5 << 2), y +  -22.558 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   17.285 * s,y +  -22.558 * s,x +   17.092 * s,y +  -21.484 * s,x +   16.992 * s,y +  -20.459 * s,x +   16.992 * s,y +  -19.482 * s, threshold);
			_vr.bezier8(x +   16.992 * s,y +  -19.482 * s,x +   16.992 * s,y +  -15.804 * s,x +   18.107 * s,y +  -12.899 * s,x +   20.337 * s,y +  -10.766 * s, threshold);
			_vr.bezier8(x +   20.337 * s,y +  -10.766 * s,x +   22.566 * s,y +   -8.634 * s,x +   25.602 * s,y +   -7.568 * s,x +   29.443 * s,y +   -7.568 * s, threshold);
			_vr.bezier8(x +   29.443 * s,y +   -7.568 * s,x +   34.195 * s,y +   -7.568 * s,x +   38.134 * s,y +   -8.919 * s,x +   41.259 * s,y +  -11.621 * s, threshold);
			_vr.bezier8(x +   41.259 * s,y +  -11.621 * s,x +   44.384 * s,y +  -14.323 * s,x +   46.364 * s,y +  -18.051 * s,x +   47.216 * s,y +  -22.802 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   55.956 * s);
			_setf(o + ( 1 << 2), y +  -71.532 * s);
			_setf(o + ( 2 << 2), x +   66.015 * s);
			_setf(o + ( 3 << 2), y +  -71.532 * s);
			_setf(o + ( 4 << 2), x +   57.226 * s);
			_setf(o + ( 5 << 2), y +  -21.777 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   57.226 * s,y +  -21.777 * s,x +   55.949 * s,y +  -14.552 * s,x +   52.709 * s,y +   -8.911 * s,x +   47.485 * s,y +   -4.858 * s, threshold);
			_vr.bezier8(x +   47.485 * s,y +   -4.858 * s,x +   42.260 * s,y +   -0.806 * s,x +   35.758 * s,y +    1.221 * s,x +   27.978 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   27.978 * s,y +    1.221 * s,x +   21.370 * s,y +    1.221 * s,x +   16.145 * s,y +   -0.391 * s,x +   12.304 * s,y +   -3.613 * s, threshold);
			_vr.bezier8(x +   12.304 * s,y +   -3.613 * s,x +    8.463 * s,y +   -6.836 * s,x +    6.543 * s,y +  -11.084 * s,x +    6.543 * s,y +  -16.357 * s, threshold);
			_vr.bezier8(x +    6.543 * s,y +  -16.357 * s,x +    6.543 * s,y +  -18.082 * s,x +    6.692 * s,y +  -19.908 * s,x +    7.031 * s,y +  -21.826 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   15.820 * s);
			_setf(o + ( 1 << 2), y +  -71.532 * s);
			_setf(o + ( 2 << 2), x +   64.843 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 86:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +   27.489 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			_setf(o + ( 2 << 2), x +   22.558 * s);
			_setf(o + ( 3 << 2), y +    0.977 * s);
			_setf(o + ( 4 << 2), x +    8.691 * s);
			_setf(o + ( 5 << 2), y +  -71.532 * s);
			_setf(o + ( 6 << 2), x +   19.433 * s);
			_setf(o + ( 7 << 2), y +  -71.532 * s);
			_setf(o + ( 8 << 2), x +   28.515 * s);
			_setf(o + ( 9 << 2), y +  -19.336 * s);
			_setf(o + (10 << 2), x +   55.077 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   66.161 * s);
			_setf(o + (13 << 2), y +  -71.532 * s);
			_setf(o + (14 << 2), x +   27.489 * s);
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
			_setf(o + ( 0 << 2), x +   57.958 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			_setf(o + ( 2 << 2), x +   54.882 * s);
			_setf(o + ( 3 << 2), y +    0.977 * s);
			_setf(o + ( 4 << 2), x +   46.630 * s);
			_setf(o + ( 5 << 2), y +  -47.314 * s);
			_setf(o + ( 6 << 2), x +   21.924 * s);
			_setf(o + ( 7 << 2), y +    0.977 * s);
			_setf(o + ( 8 << 2), x +   18.847 * s);
			_setf(o + ( 9 << 2), y +    0.977 * s);
			_setf(o + (10 << 2), x +    9.082 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   19.238 * s);
			_setf(o + (13 << 2), y +  -71.532 * s);
			_setf(o + (14 << 2), x +   25.048 * s);
			_setf(o + (15 << 2), y +  -23.193 * s);
			_setf(o + (16 << 2), x +   49.316 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   52.734 * s);
			_setf(o + (19 << 2), y +  -71.532 * s);
			_setf(o + (20 << 2), x +   59.911 * s);
			_setf(o + (21 << 2), y +  -23.437 * s);
			_setf(o + (22 << 2), x +   82.372 * s);
			_setf(o + (23 << 2), y +  -71.532 * s);
			_setf(o + (24 << 2), x +   93.016 * s);
			_setf(o + (25 << 2), y +  -71.532 * s);
			_setf(o + (26 << 2), x +   57.958 * s);
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
			_setf(o + ( 0 << 2), x +   39.941 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   28.027 * s);
			_setf(o + ( 3 << 2), y +  -27.587 * s);
			_setf(o + ( 4 << 2), x +    7.715 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   -3.613 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   23.974 * s);
			_setf(o + ( 9 << 2), y +  -37.597 * s);
			_setf(o + (10 << 2), x +   10.742 * s);
			_setf(o + (11 << 2), y +  -71.581 * s);
			_setf(o + (12 << 2), x +   20.849 * s);
			_setf(o + (13 << 2), y +  -71.532 * s);
			_setf(o + (14 << 2), x +   30.615 * s);
			_setf(o + (15 << 2), y +  -45.361 * s);
			_setf(o + (16 << 2), x +   51.024 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   62.304 * s);
			_setf(o + (19 << 2), y +  -71.532 * s);
			_setf(o + (20 << 2), x +   34.570 * s);
			_setf(o + (21 << 2), y +  -36.376 * s);
			_setf(o + (22 << 2), x +   50.878 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   39.941 * s);
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
			_setf(o + ( 0 << 2), x +   34.863 * s);
			_setf(o + ( 1 << 2), y +  -32.031 * s);
			_setf(o + ( 2 << 2), x +   29.199 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   19.433 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   25.097 * s);
			_setf(o + ( 7 << 2), y +  -32.031 * s);
			_setf(o + ( 8 << 2), x +    8.887 * s);
			_setf(o + ( 9 << 2), y +  -71.532 * s);
			_setf(o + (10 << 2), x +   19.091 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   31.249 * s);
			_setf(o + (13 << 2), y +  -41.015 * s);
			_setf(o + (14 << 2), x +   53.759 * s);
			_setf(o + (15 << 2), y +  -71.532 * s);
			_setf(o + (16 << 2), x +   64.794 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   34.863 * s);
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
			_setf(o + ( 0 << 2), x +    3.906 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    3.906 * s);
			_setf(o + ( 3 << 2), y +   -2.441 * s);
			_setf(o + ( 4 << 2), x +   43.798 * s);
			_setf(o + ( 5 << 2), y +  -62.743 * s);
			_setf(o + ( 6 << 2), x +   13.525 * s);
			_setf(o + ( 7 << 2), y +  -62.743 * s);
			_setf(o + ( 8 << 2), x +   15.039 * s);
			_setf(o + ( 9 << 2), y +  -71.532 * s);
			_setf(o + (10 << 2), x +   57.812 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   57.812 * s);
			_setf(o + (13 << 2), y +  -69.091 * s);
			_setf(o + (14 << 2), x +   19.287 * s);
			_setf(o + (15 << 2), y +   -8.789 * s);
			_setf(o + (16 << 2), x +   49.267 * s);
			_setf(o + (17 << 2), y +   -8.789 * s);
			_setf(o + (18 << 2), x +   47.704 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +    3.906 * s);
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
			_setf(o + ( 0 << 2), x +    1.074 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			_setf(o + ( 2 << 2), x +   17.676 * s);
			_setf(o + ( 3 << 2), y +  -73.729 * s);
			_setf(o + ( 4 << 2), x +   40.771 * s);
			_setf(o + ( 5 << 2), y +  -73.729 * s);
			_setf(o + ( 6 << 2), x +   39.306 * s);
			_setf(o + ( 7 << 2), y +  -65.429 * s);
			_setf(o + ( 8 << 2), x +   26.465 * s);
			_setf(o + ( 9 << 2), y +  -65.429 * s);
			_setf(o + (10 << 2), x +   12.793 * s);
			_setf(o + (11 << 2), y +   12.207 * s);
			_setf(o + (12 << 2), x +   25.634 * s);
			_setf(o + (13 << 2), y +   12.207 * s);
			_setf(o + (14 << 2), x +   24.170 * s);
			_setf(o + (15 << 2), y +   20.508 * s);
			_setf(o + (16 << 2), x +    1.074 * s);
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
			_setf(o + ( 0 << 2), x +   23.925 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    9.033 * s);
			_setf(o + ( 3 << 2), y +  -71.825 * s);
			_setf(o + ( 4 << 2), x +   15.966 * s);
			_setf(o + ( 5 << 2), y +  -71.825 * s);
			_setf(o + ( 6 << 2), x +   30.907 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   23.925 * s);
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
			_setf(o + ( 0 << 2), x +   22.754 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			_setf(o + ( 2 << 2), x +   -0.342 * s);
			_setf(o + ( 3 << 2), y +   20.508 * s);
			_setf(o + ( 4 << 2), x +    1.123 * s);
			_setf(o + ( 5 << 2), y +   12.207 * s);
			_setf(o + ( 6 << 2), x +   13.965 * s);
			_setf(o + ( 7 << 2), y +   12.207 * s);
			_setf(o + ( 8 << 2), x +   27.636 * s);
			_setf(o + ( 9 << 2), y +  -65.429 * s);
			_setf(o + (10 << 2), x +   14.795 * s);
			_setf(o + (11 << 2), y +  -65.429 * s);
			_setf(o + (12 << 2), x +   16.259 * s);
			_setf(o + (13 << 2), y +  -73.729 * s);
			_setf(o + (14 << 2), x +   39.355 * s);
			_setf(o + (15 << 2), y +  -73.729 * s);
			_setf(o + (16 << 2), x +   22.754 * s);
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
			_setf(o + ( 0 << 2), x +   44.238 * s);
			_setf(o + ( 1 << 2), y +  -44.286 * s);
			_setf(o + ( 2 << 2), x +   32.324 * s);
			_setf(o + ( 3 << 2), y +  -66.161 * s);
			_setf(o + ( 4 << 2), x +   20.215 * s);
			_setf(o + ( 5 << 2), y +  -44.091 * s);
			_setf(o + ( 6 << 2), x +   14.258 * s);
			_setf(o + ( 7 << 2), y +  -44.091 * s);
			_setf(o + ( 8 << 2), x +   29.785 * s);
			_setf(o + ( 9 << 2), y +  -71.825 * s);
			_setf(o + (10 << 2), x +   35.009 * s);
			_setf(o + (11 << 2), y +  -71.825 * s);
			_setf(o + (12 << 2), x +   50.439 * s);
			_setf(o + (13 << 2), y +  -44.286 * s);
			_setf(o + (14 << 2), x +   44.238 * s);
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
			_setf(o + ( 0 << 2), x +   32.275 * s);
			_setf(o + ( 1 << 2), y +  -59.813 * s);
			_setf(o + ( 2 << 2), x +   24.658 * s);
			_setf(o + ( 3 << 2), y +  -76.073 * s);
			_setf(o + ( 4 << 2), x +   34.277 * s);
			_setf(o + ( 5 << 2), y +  -76.073 * s);
			_setf(o + ( 6 << 2), x +   37.158 * s);
			_setf(o + ( 7 << 2), y +  -59.813 * s);
			_setf(o + ( 8 << 2), x +   32.275 * s);
			_setf(o + ( 9 << 2), y +  -59.813 * s);
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
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   51.366 * s);
			_setf(o + ( 1 << 2), y +  -49.023 * s);
			_setf(o + ( 2 << 2), x +   44.970 * s);
			_setf(o + ( 3 << 2), y +  -18.603 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   44.970 * s,y +  -18.603 * s,x +   44.710 * s,y +  -17.366 * s,x +   44.579 * s,y +  -15.869 * s,x +   44.579 * s,y +  -14.111 * s, threshold);
			_vr.bezier8(x +   44.579 * s,y +  -14.111 * s,x +   44.579 * s,y +   -9.033 * s,x +   45.377 * s,y +   -4.329 * s,x +   46.972 * s,y +       0. * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   37.499 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   37.499 * s,y +       0. * s,x +   36.979 * s,y +   -1.042 * s,x +   36.425 * s,y +   -2.799 * s,x +   35.839 * s,y +   -5.273 * s, threshold);
			_vr.bezier8(x +   35.839 * s,y +   -5.273 * s,x +   34.309 * s,y +   -3.418 * s,x +   32.031 * s,y +   -1.912 * s,x +   29.003 * s,y +   -0.757 * s, threshold);
			_vr.bezier8(x +   29.003 * s,y +   -0.757 * s,x +   25.976 * s,y +    0.399 * s,x +   22.770 * s,y +    0.977 * s,x +   19.384 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   19.384 * s,y +    0.977 * s,x +   14.241 * s,y +    0.977 * s,x +   10.229 * s,y +   -0.545 * s,x +    7.348 * s,y +   -3.589 * s, threshold);
			_vr.bezier8(x +    7.348 * s,y +   -3.589 * s,x +    4.468 * s,y +   -6.632 * s,x +    3.027 * s,y +  -11.002 * s,x +    3.027 * s,y +  -16.699 * s, threshold);
			_vr.bezier8(x +    3.027 * s,y +  -16.699 * s,x +    3.027 * s,y +  -26.269 * s,x +    5.851 * s,y +  -34.757 * s,x +   11.499 * s,y +  -42.162 * s, threshold);
			_vr.bezier8(x +   11.499 * s,y +  -42.162 * s,x +   17.146 * s,y +  -49.568 * s,x +   24.414 * s,y +  -53.271 * s,x +   33.300 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   33.300 * s,y +  -53.271 * s,x +   41.699 * s,y +  -53.271 * s,x +   47.721 * s,y +  -51.855 * s,x +   51.366 * s,y +  -49.023 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   41.113 * s);
			_setf(o + ( 1 << 2), y +  -43.603 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   41.113 * s,y +  -43.603 * s,x +   40.234 * s,y +  -45.002 * s,x +   37.271 * s,y +  -45.702 * s,x +   32.226 * s,y +  -45.702 * s, threshold);
			_vr.bezier8(x +   32.226 * s,y +  -45.702 * s,x +   27.083 * s,y +  -45.702 * s,x +   22.558 * s,y +  -42.968 * s,x +   18.652 * s,y +  -37.499 * s, threshold);
			_vr.bezier8(x +   18.652 * s,y +  -37.499 * s,x +   14.746 * s,y +  -32.031 * s,x +   12.793 * s,y +  -25.195 * s,x +   12.793 * s,y +  -16.992 * s, threshold);
			_vr.bezier8(x +   12.793 * s,y +  -16.992 * s,x +   12.793 * s,y +  -10.058 * s,x +   15.885 * s,y +   -6.592 * s,x +   22.070 * s,y +   -6.592 * s, threshold);
			_vr.bezier8(x +   22.070 * s,y +   -6.592 * s,x +   25.293 * s,y +   -6.592 * s,x +   28.320 * s,y +   -8.260 * s,x +   31.152 * s,y +  -11.596 * s, threshold);
			_vr.bezier8(x +   31.152 * s,y +  -11.596 * s,x +   33.984 * s,y +  -14.933 * s,x +   35.960 * s,y +  -19.204 * s,x +   37.060 * s,y +  -24.414 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   41.113 * s);
			_setf(o + ( 1 << 2), y +  -43.603 * s);
			_setf(o + ( 2 << 2), x +   52.538 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 98:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   12.354 * s);
			_setf(o + ( 1 << 2), y +   -5.029 * s);
			_setf(o + ( 2 << 2), x +    7.422 * s);
			_setf(o + ( 3 << 2), y +    0.977 * s);
			_setf(o + ( 4 << 2), x +    1.319 * s);
			_setf(o + ( 5 << 2), y +    0.977 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +    1.319 * s,y +    0.977 * s,x +    3.434 * s,y +   -5.111 * s,x +    5.273 * s,y +  -12.182 * s,x +    6.690 * s,y +  -20.263 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   16.064 * s);
			_setf(o + ( 1 << 2), y +  -73.729 * s);
			_setf(o + ( 2 << 2), x +   25.049 * s);
			_setf(o + ( 3 << 2), y +  -73.729 * s);
			_setf(o + ( 4 << 2), x +   20.703 * s);
			_setf(o + ( 5 << 2), y +  -46.777 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   20.703 * s,y +  -46.777 * s,x +   23.144 * s,y +  -51.106 * s,x +   27.490 * s,y +  -53.271 * s,x +   33.740 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   33.740 * s,y +  -53.271 * s,x +   39.339 * s,y +  -53.271 * s,x +   43.969 * s,y +  -51.195 * s,x +   47.631 * s,y +  -47.045 * s, threshold);
			_vr.bezier8(x +   47.631 * s,y +  -47.045 * s,x +   51.293 * s,y +  -42.895 * s,x +   53.124 * s,y +  -37.320 * s,x +   53.124 * s,y +  -30.322 * s, threshold);
			_vr.bezier8(x +   53.124 * s,y +  -30.322 * s,x +   53.124 * s,y +  -22.086 * s,x +   50.276 * s,y +  -14.811 * s,x +   44.580 * s,y +   -8.496 * s, threshold);
			_vr.bezier8(x +   44.580 * s,y +   -8.496 * s,x +   38.883 * s,y +   -2.181 * s,x +   31.836 * s,y +    0.977 * s,x +   23.437 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   23.437 * s,y +    0.977 * s,x +   18.131 * s,y +    0.977 * s,x +   14.437 * s,y +   -1.025 * s,x +   12.354 * s,y +   -5.029 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   19.385 * s);
			_setf(o + ( 1 << 2), y +  -38.281 * s);
			_setf(o + ( 2 << 2), x +   14.502 * s);
			_setf(o + ( 3 << 2), y +  -12.842 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   14.502 * s,y +  -12.842 * s,x +   14.433 * s,y +  -12.484 * s,x +   14.795 * s,y +  -11.751 * s,x +   15.576 * s,y +  -10.644 * s, threshold);
			_vr.bezier8(x +   15.576 * s,y +  -10.644 * s,x +   16.357 * s,y +   -9.538 * s,x +   17.456 * s,y +   -8.594 * s,x +   18.872 * s,y +   -7.812 * s, threshold);
			_vr.bezier8(x +   18.872 * s,y +   -7.812 * s,x +   20.288 * s,y +   -7.031 * s,x +   21.712 * s,y +   -6.640 * s,x +   23.144 * s,y +   -6.640 * s, threshold);
			_vr.bezier8(x +   23.144 * s,y +   -6.640 * s,x +   28.678 * s,y +   -6.640 * s,x +   33.382 * s,y +   -9.082 * s,x +   37.255 * s,y +  -13.965 * s, threshold);
			_vr.bezier8(x +   37.255 * s,y +  -13.965 * s,x +   41.129 * s,y +  -18.847 * s,x +   43.066 * s,y +  -24.039 * s,x +   43.066 * s,y +  -29.541 * s, threshold);
			_vr.bezier8(x +   43.066 * s,y +  -29.541 * s,x +   43.066 * s,y +  -40.152 * s,x +   38.378 * s,y +  -45.458 * s,x +   29.004 * s,y +  -45.458 * s, threshold);
			_vr.bezier8(x +   29.004 * s,y +  -45.458 * s,x +   25.293 * s,y +  -45.458 * s,x +   22.086 * s,y +  -43.066 * s,x +   19.385 * s,y +  -38.281 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   55.712 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 99:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   45.312 * s);
			_setf(o + ( 1 << 2), y +  -50.634 * s);
			_setf(o + ( 2 << 2), x +   43.603 * s);
			_setf(o + ( 3 << 2), y +  -42.675 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   43.603 * s,y +  -42.675 * s,x +   41.259 * s,y +  -44.531 * s,x +   38.118 * s,y +  -45.458 * s,x +   34.179 * s,y +  -45.458 * s, threshold);
			_vr.bezier8(x +   34.179 * s,y +  -45.458 * s,x +   28.190 * s,y +  -45.458 * s,x +   23.348 * s,y +  -43.090 * s,x +   19.653 * s,y +  -38.354 * s, threshold);
			_vr.bezier8(x +   19.653 * s,y +  -38.354 * s,x +   15.959 * s,y +  -33.618 * s,x +   14.111 * s,y +  -27.799 * s,x +   14.111 * s,y +  -20.898 * s, threshold);
			_vr.bezier8(x +   14.111 * s,y +  -20.898 * s,x +   14.111 * s,y +  -16.667 * s,x +   15.308 * s,y +  -13.289 * s,x +   17.700 * s,y +  -10.766 * s, threshold);
			_vr.bezier8(x +   17.700 * s,y +  -10.766 * s,x +   20.093 * s,y +   -8.244 * s,x +   22.819 * s,y +   -6.982 * s,x +   25.879 * s,y +   -6.982 * s, threshold);
			_vr.bezier8(x +   25.879 * s,y +   -6.982 * s,x +   30.599 * s,y +   -6.982 * s,x +   35.123 * s,y +   -8.431 * s,x +   39.453 * s,y +  -11.328 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   38.427 * s);
			_setf(o + ( 1 << 2), y +   -1.855 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   38.427 * s,y +   -1.855 * s,x +   34.163 * s,y +    0.033 * s,x +   29.492 * s,y +    0.977 * s,x +   24.414 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   24.414 * s,y +    0.977 * s,x +   17.969 * s,y +    0.977 * s,x +   13.021 * s,y +   -0.871 * s,x +    9.570 * s,y +   -4.565 * s, threshold);
			_vr.bezier8(x +    9.570 * s,y +   -4.565 * s,x +    6.120 * s,y +   -8.260 * s,x +    4.395 * s,y +  -13.167 * s,x +    4.395 * s,y +  -19.287 * s, threshold);
			_vr.bezier8(x +    4.395 * s,y +  -19.287 * s,x +    4.395 * s,y +  -29.248 * s,x +    7.129 * s,y +  -37.402 * s,x +   12.598 * s,y +  -43.749 * s, threshold);
			_vr.bezier8(x +   12.598 * s,y +  -43.749 * s,x +   18.066 * s,y +  -50.097 * s,x +   25.033 * s,y +  -53.271 * s,x +   33.496 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   33.496 * s,y +  -53.271 * s,x +   38.509 * s,y +  -53.271 * s,x +   42.447 * s,y +  -52.392 * s,x +   45.312 * s,y +  -50.634 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   45.996 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 100:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   36.425 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   37.548 * s);
			_setf(o + ( 3 << 2), y +   -6.006 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   37.548 * s,y +   -6.006 * s,x +   33.772 * s,y +   -1.383 * s,x +   28.613 * s,y +    0.928 * s,x +   22.070 * s,y +    0.928 * s, threshold);
			_vr.bezier8(x +   22.070 * s,y +    0.928 * s,x +   16.406 * s,y +    0.928 * s,x +   11.979 * s,y +   -0.806 * s,x +    8.789 * s,y +   -4.272 * s, threshold);
			_vr.bezier8(x +    8.789 * s,y +   -4.272 * s,x +    5.599 * s,y +   -7.739 * s,x +    4.004 * s,y +  -12.451 * s,x +    4.004 * s,y +  -18.408 * s, threshold);
			_vr.bezier8(x +    4.004 * s,y +  -18.408 * s,x +    4.004 * s,y +  -28.596 * s,x +    6.738 * s,y +  -36.938 * s,x +   12.207 * s,y +  -43.432 * s, threshold);
			_vr.bezier8(x +   12.207 * s,y +  -43.432 * s,x +   17.675 * s,y +  -49.926 * s,x +   24.674 * s,y +  -53.173 * s,x +   33.203 * s,y +  -53.173 * s, threshold);
			_vr.bezier8(x +   33.203 * s,y +  -53.173 * s,x +   38.150 * s,y +  -53.173 * s,x +   41.943 * s,y +  -51.122 * s,x +   44.579 * s,y +  -47.021 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   49.511 * s);
			_setf(o + ( 1 << 2), y +  -73.729 * s);
			_setf(o + ( 2 << 2), x +   58.349 * s);
			_setf(o + ( 3 << 2), y +  -73.729 * s);
			_setf(o + ( 4 << 2), x +   45.605 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   36.425 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   42.870 * s);
			_setf(o + ( 9 << 2), y +  -37.792 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 1);
			_vr.bezier8(x +   42.870 * s,y +  -37.792 * s,x +   42.919 * s,y +  -38.088 * s,x +   42.504 * s,y +  -38.989 * s,x +   41.576 * s,y +  -40.502 * s, threshold);
			_vr.bezier8(x +   41.576 * s,y +  -40.502 * s,x +   40.649 * s,y +  -42.016 * s,x +   39.526 * s,y +  -43.204 * s,x +   38.207 * s,y +  -44.067 * s, threshold);
			_vr.bezier8(x +   38.207 * s,y +  -44.067 * s,x +   36.889 * s,y +  -44.929 * s,x +   35.497 * s,y +  -45.361 * s,x +   34.033 * s,y +  -45.361 * s, threshold);
			_vr.bezier8(x +   34.033 * s,y +  -45.361 * s,x +   28.271 * s,y +  -45.361 * s,x +   23.494 * s,y +  -43.025 * s,x +   19.702 * s,y +  -38.354 * s, threshold);
			_vr.bezier8(x +   19.702 * s,y +  -38.354 * s,x +   15.910 * s,y +  -33.683 * s,x +   14.013 * s,y +  -27.701 * s,x +   14.013 * s,y +  -20.410 * s, threshold);
			_vr.bezier8(x +   14.013 * s,y +  -20.410 * s,x +   14.013 * s,y +  -11.198 * s,x +   17.806 * s,y +   -6.592 * s,x +   25.390 * s,y +   -6.592 * s, threshold);
			_vr.bezier8(x +   25.390 * s,y +   -6.592 * s,x +   28.808 * s,y +   -6.592 * s,x +   31.998 * s,y +   -8.276 * s,x +   34.960 * s,y +  -11.645 * s, threshold);
			_vr.bezier8(x +   34.960 * s,y +  -11.645 * s,x +   37.923 * s,y +  -15.014 * s,x +   39.845 * s,y +  -19.368 * s,x +   40.722 * s,y +  -24.707 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   42.870 * s);
			_setf(o + ( 1 << 2), y +  -37.792 * s);
			_setf(o + ( 2 << 2), x +   55.712 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 101:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   15.185 * s);
			_setf(o + ( 1 << 2), y +  -24.707 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   15.185 * s,y +  -24.707 * s,x +   14.892 * s,y +  -23.144 * s,x +   14.746 * s,y +  -21.647 * s,x +   14.746 * s,y +  -20.214 * s, threshold);
			_vr.bezier8(x +   14.746 * s,y +  -20.214 * s,x +   14.746 * s,y +  -15.917 * s,x +   15.950 * s,y +  -12.614 * s,x +   18.359 * s,y +  -10.303 * s, threshold);
			_vr.bezier8(x +   18.359 * s,y +  -10.303 * s,x +   20.768 * s,y +   -7.991 * s,x +   24.137 * s,y +   -6.836 * s,x +   28.466 * s,y +   -6.836 * s, threshold);
			_vr.bezier8(x +   28.466 * s,y +   -6.836 * s,x +   32.307 * s,y +   -6.836 * s,x +   36.181 * s,y +   -8.252 * s,x +   40.087 * s,y +  -11.084 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   39.111 * s);
			_setf(o + ( 1 << 2), y +   -1.611 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   39.111 * s,y +   -1.611 * s,x +   33.902 * s,y +    0.114 * s,x +   29.296 * s,y +    0.977 * s,x +   25.293 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   25.293 * s,y +    0.977 * s,x +   11.816 * s,y +    0.977 * s,x +    5.078 * s,y +   -6.575 * s,x +    5.078 * s,y +  -21.679 * s, threshold);
			_vr.bezier8(x +    5.078 * s,y +  -21.679 * s,x +    5.078 * s,y +  -30.566 * s,x +    7.910 * s,y +  -38.053 * s,x +   13.574 * s,y +  -44.140 * s, threshold);
			_vr.bezier8(x +   13.574 * s,y +  -44.140 * s,x +   19.238 * s,y +  -50.227 * s,x +   26.367 * s,y +  -53.271 * s,x +   34.960 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   34.960 * s,y +  -53.271 * s,x +   40.136 * s,y +  -53.271 * s,x +   44.270 * s,y +  -52.164 * s,x +   47.363 * s,y +  -49.950 * s, threshold);
			_vr.bezier8(x +   47.363 * s,y +  -49.950 * s,x +   50.455 * s,y +  -47.737 * s,x +   52.001 * s,y +  -44.580 * s,x +   52.001 * s,y +  -40.478 * s, threshold);
			_vr.bezier8(x +   52.001 * s,y +  -40.478 * s,x +   52.001 * s,y +  -34.781 * s,x +   49.592 * s,y +  -30.289 * s,x +   44.775 * s,y +  -27.001 * s, threshold);
			_vr.bezier8(x +   44.775 * s,y +  -27.001 * s,x +   39.957 * s,y +  -23.714 * s,x +   34.049 * s,y +  -22.070 * s,x +   27.050 * s,y +  -22.070 * s, threshold);
			_vr.bezier8(x +   27.050 * s,y +  -22.070 * s,x +   22.363 * s,y +  -22.070 * s,x +   18.408 * s,y +  -22.949 * s,x +   15.185 * s,y +  -24.707 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   16.797 * s);
			_setf(o + ( 1 << 2), y +  -31.445 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   16.797 * s,y +  -31.445 * s,x +   19.271 * s,y +  -30.338 * s,x +   22.184 * s,y +  -29.785 * s,x +   25.537 * s,y +  -29.785 * s, threshold);
			_vr.bezier8(x +   25.537 * s,y +  -29.785 * s,x +   30.615 * s,y +  -29.785 * s,x +   34.765 * s,y +  -30.607 * s,x +   37.988 * s,y +  -32.250 * s, threshold);
			_vr.bezier8(x +   37.988 * s,y +  -32.250 * s,x +   41.210 * s,y +  -33.894 * s,x +   42.822 * s,y +  -36.295 * s,x +   42.822 * s,y +  -39.452 * s, threshold);
			_vr.bezier8(x +   42.822 * s,y +  -39.452 * s,x +   42.822 * s,y +  -43.456 * s,x +   40.054 * s,y +  -45.458 * s,x +   34.521 * s,y +  -45.458 * s, threshold);
			_vr.bezier8(x +   34.521 * s,y +  -45.458 * s,x +   26.090 * s,y +  -45.458 * s,x +   20.182 * s,y +  -40.787 * s,x +   16.797 * s,y +  -31.445 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   53.710 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 102:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   43.896 * s);
			_setf(o + ( 1 << 2), y +  -65.038 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   43.896 * s,y +  -65.038 * s,x +   41.422 * s,y +  -65.949 * s,x +   39.502 * s,y +  -66.405 * s,x +   38.134 * s,y +  -66.405 * s, threshold);
			_vr.bezier8(x +   38.134 * s,y +  -66.405 * s,x +   32.243 * s,y +  -66.405 * s,x +   28.483 * s,y +  -61.701 * s,x +   26.855 * s,y +  -52.294 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   38.964 * s);
			_setf(o + ( 1 << 2), y +  -52.294 * s);
			_setf(o + ( 2 << 2), x +   38.183 * s);
			_setf(o + ( 3 << 2), y +  -45.898 * s);
			_setf(o + ( 4 << 2), x +   25.927 * s);
			_setf(o + ( 5 << 2), y +  -45.898 * s);
			_setf(o + ( 6 << 2), x +   17.676 * s);
			_setf(o + ( 7 << 2), y +    3.418 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_vr.bezier8(x +   17.676 * s,y +    3.418 * s,x +   16.902 * s,y +    8.041 * s,x +   14.779 * s,y +   11.792 * s,x +   11.328 * s,y +   14.673 * s, threshold);
			_vr.bezier8(x +   11.328 * s,y +   14.673 * s,x +    7.878 * s,y +   17.553 * s,x +    3.695 * s,y +   19.303 * s,x +   -1.221 * s,y +   19.922 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   -2.051 * s);
			_setf(o + ( 1 << 2), y +   14.209 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   -2.051 * s,y +   14.209 * s,x +   -0.098 * s,y +   13.818 * s,x +    1.904 * s,y +   12.500 * s,x +    3.955 * s,y +   10.254 * s, threshold);
			_vr.bezier8(x +    3.955 * s,y +   10.254 * s,x +    6.006 * s,y +    8.008 * s,x +    7.260 * s,y +    5.732 * s,x +    7.666 * s,y +    3.418 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   16.308 * s);
			_setf(o + ( 1 << 2), y +  -45.898 * s);
			_setf(o + ( 2 << 2), x +    8.936 * s);
			_setf(o + ( 3 << 2), y +  -45.898 * s);
			_setf(o + ( 4 << 2), x +   10.010 * s);
			_setf(o + ( 5 << 2), y +  -52.294 * s);
			_setf(o + ( 6 << 2), x +   17.187 * s);
			_setf(o + ( 7 << 2), y +  -52.294 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_vr.bezier8(x +   17.187 * s,y +  -52.294 * s,x +   20.052 * s,y +  -66.584 * s,x +   27.230 * s,y +  -73.729 * s,x +   38.720 * s,y +  -73.729 * s, threshold);
			_vr.bezier8(x +   38.720 * s,y +  -73.729 * s,x +   41.455 * s,y +  -73.729 * s,x +   43.766 * s,y +  -73.241 * s,x +   45.654 * s,y +  -72.265 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   43.896 * s);
			_setf(o + ( 1 << 2), y +  -65.038 * s);
			_setf(o + ( 2 << 2), x +   40.136 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 103:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   -0.635 * s);
			_setf(o + ( 1 << 2), y +   14.648 * s);
			_setf(o + ( 2 << 2), x +    3.760 * s);
			_setf(o + ( 3 << 2), y +    7.812 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    3.760 * s,y +    7.812 * s,x +    9.717 * s,y +   10.807 * s,x +   14.648 * s,y +   12.305 * s,x +   18.555 * s,y +   12.305 * s, threshold);
			_vr.bezier8(x +   18.555 * s,y +   12.305 * s,x +   22.851 * s,y +   12.305 * s,x +   26.432 * s,y +   11.507 * s,x +   29.297 * s,y +    9.912 * s, threshold);
			_vr.bezier8(x +   29.297 * s,y +    9.912 * s,x +   32.161 * s,y +    8.317 * s,x +   33.593 * s,y +    6.087 * s,x +   33.593 * s,y +    3.223 * s, threshold);
			_vr.bezier8(x +   33.593 * s,y +    3.223 * s,x +   33.593 * s,y +    1.790 * s,x +   33.113 * s,y +    0.610 * s,x +   32.153 * s,y +   -0.317 * s, threshold);
			_vr.bezier8(x +   32.153 * s,y +   -0.317 * s,x +   31.193 * s,y +   -1.245 * s,x +   29.556 * s,y +   -1.901 * s,x +   27.246 * s,y +   -2.295 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   18.652 * s);
			_setf(o + ( 1 << 2), y +   -3.760 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   18.652 * s,y +   -3.760 * s,x +   15.111 * s,y +   -4.363 * s,x +   13.428 * s,y +   -6.413 * s,x +   13.428 * s,y +   -9.082 * s, threshold);
			_vr.bezier8(x +   13.428 * s,y +   -9.082 * s,x +   13.428 * s,y +  -11.230 * s,x +   16.211 * s,y +  -13.395 * s,x +   21.777 * s,y +  -15.576 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   20.117 * s);
			_setf(o + ( 1 << 2), y +  -15.527 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   20.117 * s,y +  -15.527 * s,x +   16.310 * s,y +  -15.415 * s,x +   12.964 * s,y +  -16.951 * s,x +   10.083 * s,y +  -19.799 * s, threshold);
			_vr.bezier8(x +   10.083 * s,y +  -19.799 * s,x +    7.202 * s,y +  -22.648 * s,x +    5.762 * s,y +  -26.074 * s,x +    5.762 * s,y +  -30.078 * s, threshold);
			_vr.bezier8(x +    5.762 * s,y +  -30.078 * s,x +    5.762 * s,y +  -36.913 * s,x +    7.959 * s,y +  -42.488 * s,x +   12.354 * s,y +  -46.801 * s, threshold);
			_vr.bezier8(x +   12.354 * s,y +  -46.801 * s,x +   16.748 * s,y +  -51.114 * s,x +   22.363 * s,y +  -53.271 * s,x +   29.199 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   29.199 * s,y +  -53.271 * s,x +   34.114 * s,y +  -53.271 * s,x +   37.988 * s,y +  -52.099 * s,x +   40.820 * s,y +  -49.755 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   45.214 * s);
			_setf(o + ( 1 << 2), y +  -54.735 * s);
			_setf(o + ( 2 << 2), x +   50.341 * s);
			_setf(o + ( 3 << 2), y +  -49.462 * s);
			_setf(o + ( 4 << 2), x +   45.507 * s);
			_setf(o + ( 5 << 2), y +  -44.433 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   45.507 * s,y +  -44.433 * s,x +   46.451 * s,y +  -43.098 * s,x +   46.923 * s,y +  -40.999 * s,x +   46.923 * s,y +  -38.134 * s, threshold);
			_vr.bezier8(x +   46.923 * s,y +  -38.134 * s,x +   46.923 * s,y +  -32.535 * s,x +   45.507 * s,y +  -27.734 * s,x +   42.675 * s,y +  -23.730 * s, threshold);
			_vr.bezier8(x +   42.675 * s,y +  -23.730 * s,x +   39.843 * s,y +  -19.726 * s,x +   36.141 * s,y +  -16.919 * s,x +   31.567 * s,y +  -15.307 * s, threshold);
			_vr.bezier8(x +   31.567 * s,y +  -15.307 * s,x +   26.994 * s,y +  -13.696 * s,x +   24.707 * s,y +  -12.190 * s,x +   24.707 * s,y +  -10.791 * s, threshold);
			_vr.bezier8(x +   24.707 * s,y +  -10.791 * s,x +   24.707 * s,y +   -9.652 * s,x +   25.325 * s,y +   -9.082 * s,x +   26.562 * s,y +   -9.082 * s, threshold);
			_vr.bezier8(x +   26.562 * s,y +   -9.082 * s,x +   27.018 * s,y +   -9.082 * s,x +   27.693 * s,y +   -9.155 * s,x +   28.589 * s,y +   -9.302 * s, threshold);
			_vr.bezier8(x +   28.589 * s,y +   -9.302 * s,x +   29.484 * s,y +   -9.448 * s,x +   30.159 * s,y +   -9.521 * s,x +   30.615 * s,y +   -9.521 * s, threshold);
			_vr.bezier8(x +   30.615 * s,y +   -9.521 * s,x +   38.753 * s,y +   -9.521 * s,x +   42.822 * s,y +   -5.843 * s,x +   42.822 * s,y +    1.514 * s, threshold);
			_vr.bezier8(x +   42.822 * s,y +    1.514 * s,x +   42.822 * s,y +    7.275 * s,x +   40.258 * s,y +   11.881 * s,x +   35.132 * s,y +   15.332 * s, threshold);
			_vr.bezier8(x +   35.132 * s,y +   15.332 * s,x +   30.005 * s,y +   18.782 * s,x +   23.909 * s,y +   20.508 * s,x +   16.846 * s,y +   20.508 * s, threshold);
			_vr.bezier8(x +   16.846 * s,y +   20.508 * s,x +    9.684 * s,y +   20.508 * s,x +    3.858 * s,y +   18.554 * s,x +   -0.635 * s,y +   14.648 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   28.515 * s);
			_setf(o + ( 1 << 2), y +  -45.800 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   28.515 * s,y +  -45.800 * s,x +   24.772 * s,y +  -45.800 * s,x +   21.623 * s,y +  -44.343 * s,x +   19.067 * s,y +  -41.430 * s, threshold);
			_vr.bezier8(x +   19.067 * s,y +  -41.430 * s,x +   16.512 * s,y +  -38.517 * s,x +   15.234 * s,y +  -35.090 * s,x +   15.234 * s,y +  -31.152 * s, threshold);
			_vr.bezier8(x +   15.234 * s,y +  -31.152 * s,x +   15.234 * s,y +  -24.056 * s,x +   17.920 * s,y +  -20.507 * s,x +   23.291 * s,y +  -20.507 * s, threshold);
			_vr.bezier8(x +   23.291 * s,y +  -20.507 * s,x +   26.937 * s,y +  -20.507 * s,x +   30.159 * s,y +  -22.290 * s,x +   32.959 * s,y +  -25.854 * s, threshold);
			_vr.bezier8(x +   32.959 * s,y +  -25.854 * s,x +   35.758 * s,y +  -29.418 * s,x +   37.158 * s,y +  -33.203 * s,x +   37.158 * s,y +  -37.206 * s, threshold);
			_vr.bezier8(x +   37.158 * s,y +  -37.206 * s,x +   37.158 * s,y +  -39.843 * s,x +   36.377 * s,y +  -41.935 * s,x +   34.814 * s,y +  -43.481 * s, threshold);
			_vr.bezier8(x +   34.814 * s,y +  -43.481 * s,x +   33.252 * s,y +  -45.027 * s,x +   31.152 * s,y +  -45.800 * s,x +   28.515 * s,y +  -45.800 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   50.195 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 104:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   35.937 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   41.747 * s);
			_setf(o + ( 3 << 2), y +  -32.861 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   41.747 * s,y +  -32.861 * s,x +   41.977 * s,y +  -34.162 * s,x +   42.089 * s,y +  -35.351 * s,x +   42.089 * s,y +  -36.425 * s, threshold);
			_vr.bezier8(x +   42.089 * s,y +  -36.425 * s,x +   42.089 * s,y +  -42.447 * s,x +   39.159 * s,y +  -45.458 * s,x +   33.300 * s,y +  -45.458 * s, threshold);
			_vr.bezier8(x +   33.300 * s,y +  -45.458 * s,x +   31.054 * s,y +  -45.458 * s,x +   28.686 * s,y +  -44.799 * s,x +   26.196 * s,y +  -43.481 * s, threshold);
			_vr.bezier8(x +   26.196 * s,y +  -43.481 * s,x +   23.705 * s,y +  -42.162 * s,x +   21.695 * s,y +  -40.624 * s,x +   20.165 * s,y +  -38.867 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   13.281 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    3.808 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   16.552 * s);
			_setf(o + ( 5 << 2), y +  -73.729 * s);
			_setf(o + ( 6 << 2), x +   25.781 * s);
			_setf(o + ( 7 << 2), y +  -73.729 * s);
			_setf(o + ( 8 << 2), x +   21.484 * s);
			_setf(o + ( 9 << 2), y +  -46.532 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   21.484 * s,y +  -46.532 * s,x +   23.079 * s,y +  -48.453 * s,x +   25.366 * s,y +  -50.056 * s,x +   28.344 * s,y +  -51.342 * s, threshold);
			_vr.bezier8(x +   28.344 * s,y +  -51.342 * s,x +   31.323 * s,y +  -52.628 * s,x +   34.277 * s,y +  -53.271 * s,x +   37.206 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   37.206 * s,y +  -53.271 * s,x +   41.828 * s,y +  -53.271 * s,x +   45.417 * s,y +  -51.952 * s,x +   47.973 * s,y +  -49.316 * s, threshold);
			_vr.bezier8(x +   47.973 * s,y +  -49.316 * s,x +   50.528 * s,y +  -46.679 * s,x +   51.806 * s,y +  -42.968 * s,x +   51.806 * s,y +  -38.183 * s, threshold);
			_vr.bezier8(x +   51.806 * s,y +  -38.183 * s,x +   51.806 * s,y +  -36.523 * s,x +   51.651 * s,y +  -34.747 * s,x +   51.317 * s,y +  -32.861 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   45.507 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   35.937 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   55.712 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 105:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   21.728 * s);
			_setf(o + ( 1 << 2), y +  -72.802 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   21.728 * s,y +  -72.802 * s,x +   23.518 * s,y +  -72.802 * s,x +   25.048 * s,y +  -72.175 * s,x +   26.318 * s,y +  -70.922 * s, threshold);
			_vr.bezier8(x +   26.318 * s,y +  -70.922 * s,x +   27.587 * s,y +  -69.668 * s,x +   28.222 * s,y +  -68.130 * s,x +   28.222 * s,y +  -66.308 * s, threshold);
			_vr.bezier8(x +   28.222 * s,y +  -66.308 * s,x +   28.222 * s,y +  -64.517 * s,x +   27.587 * s,y +  -62.995 * s,x +   26.318 * s,y +  -61.742 * s, threshold);
			_vr.bezier8(x +   26.318 * s,y +  -61.742 * s,x +   25.048 * s,y +  -60.489 * s,x +   23.518 * s,y +  -59.862 * s,x +   21.728 * s,y +  -59.862 * s, threshold);
			_vr.bezier8(x +   21.728 * s,y +  -59.862 * s,x +   19.938 * s,y +  -59.862 * s,x +   18.408 * s,y +  -60.489 * s,x +   17.138 * s,y +  -61.742 * s, threshold);
			_vr.bezier8(x +   17.138 * s,y +  -61.742 * s,x +   15.869 * s,y +  -62.995 * s,x +   15.234 * s,y +  -64.517 * s,x +   15.234 * s,y +  -66.308 * s, threshold);
			_vr.bezier8(x +   15.234 * s,y +  -66.308 * s,x +   15.234 * s,y +  -68.130 * s,x +   15.869 * s,y +  -69.668 * s,x +   17.138 * s,y +  -70.922 * s, threshold);
			_vr.bezier8(x +   17.138 * s,y +  -70.922 * s,x +   18.408 * s,y +  -72.175 * s,x +   19.938 * s,y +  -72.802 * s,x +   21.728 * s,y +  -72.802 * s, threshold);
			o = _posf(16);
			_setf(o + ( 0 << 2), x +    6.738 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   14.648 * s);
			_setf(o + ( 3 << 2), y +  -44.482 * s);
			_setf(o + ( 4 << 2), x +    7.715 * s);
			_setf(o + ( 5 << 2), y +  -44.482 * s);
			_setf(o + ( 6 << 2), x +    9.423 * s);
			_setf(o + ( 7 << 2), y +  -52.148 * s);
			_setf(o + ( 8 << 2), x +   25.390 * s);
			_setf(o + ( 9 << 2), y +  -52.148 * s);
			_setf(o + (10 << 2), x +   16.162 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    6.738 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   30.663 * s);
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
			_setf(o + ( 0 << 2), x +   28.369 * s);
			_setf(o + ( 1 << 2), y +  -72.802 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   28.369 * s,y +  -72.802 * s,x +   30.159 * s,y +  -72.802 * s,x +   31.689 * s,y +  -72.167 * s,x +   32.959 * s,y +  -70.897 * s, threshold);
			_vr.bezier8(x +   32.959 * s,y +  -70.897 * s,x +   34.228 * s,y +  -69.628 * s,x +   34.863 * s,y +  -68.098 * s,x +   34.863 * s,y +  -66.308 * s, threshold);
			_vr.bezier8(x +   34.863 * s,y +  -66.308 * s,x +   34.863 * s,y +  -64.517 * s,x +   34.228 * s,y +  -62.995 * s,x +   32.959 * s,y +  -61.742 * s, threshold);
			_vr.bezier8(x +   32.959 * s,y +  -61.742 * s,x +   31.689 * s,y +  -60.489 * s,x +   30.159 * s,y +  -59.862 * s,x +   28.369 * s,y +  -59.862 * s, threshold);
			_vr.bezier8(x +   28.369 * s,y +  -59.862 * s,x +   26.579 * s,y +  -59.862 * s,x +   25.049 * s,y +  -60.489 * s,x +   23.779 * s,y +  -61.742 * s, threshold);
			_vr.bezier8(x +   23.779 * s,y +  -61.742 * s,x +   22.510 * s,y +  -62.995 * s,x +   21.875 * s,y +  -64.517 * s,x +   21.875 * s,y +  -66.308 * s, threshold);
			_vr.bezier8(x +   21.875 * s,y +  -66.308 * s,x +   21.875 * s,y +  -68.098 * s,x +   22.510 * s,y +  -69.628 * s,x +   23.779 * s,y +  -70.897 * s, threshold);
			_vr.bezier8(x +   23.779 * s,y +  -70.897 * s,x +   25.049 * s,y +  -72.167 * s,x +   26.579 * s,y +  -72.802 * s,x +   28.369 * s,y +  -72.802 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   -6.787 * s);
			_setf(o + ( 1 << 2), y +   20.263 * s);
			_setf(o + ( 2 << 2), x +   -6.396 * s);
			_setf(o + ( 3 << 2), y +   12.060 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   -6.396 * s,y +   12.060 * s,x +    4.834 * s,y +   12.060 * s,x +   11.236 * s,y +    7.960 * s,x +   12.793 * s,y +   -0.244 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   21.191 * s);
			_setf(o + ( 1 << 2), y +  -44.482 * s);
			_setf(o + ( 2 << 2), x +   14.307 * s);
			_setf(o + ( 3 << 2), y +  -44.482 * s);
			_setf(o + ( 4 << 2), x +   15.967 * s);
			_setf(o + ( 5 << 2), y +  -52.294 * s);
			_setf(o + ( 6 << 2), x +   32.031 * s);
			_setf(o + ( 7 << 2), y +  -52.294 * s);
			_setf(o + ( 8 << 2), x +   22.607 * s);
			_setf(o + ( 9 << 2), y +   -0.781 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   22.607 * s,y +   -0.781 * s,x +   21.249 * s,y +    6.642 * s,x +   18.213 * s,y +   12.003 * s,x +   13.526 * s,y +   15.307 * s, threshold);
			_vr.bezier8(x +   13.526 * s,y +   15.307 * s,x +    8.838 * s,y +   18.611 * s,x +    2.067 * s,y +   20.263 * s,x +   -6.787 * s,y +   20.263 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.670 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 107:
			
			o = _posf(14);
			_setf(o + ( 0 << 2), x +   21.533 * s);
			_setf(o + ( 1 << 2), y +  -23.095 * s);
			_setf(o + ( 2 << 2), x +   17.871 * s);
			_setf(o + ( 3 << 2), y +  -19.922 * s);
			_setf(o + ( 4 << 2), x +   14.453 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    5.175 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   17.529 * s);
			_setf(o + ( 9 << 2), y +  -73.729 * s);
			_setf(o + (10 << 2), x +   26.562 * s);
			_setf(o + (11 << 2), y +  -73.729 * s);
			_setf(o + (12 << 2), x +   19.873 * s);
			_setf(o + (13 << 2), y +  -30.859 * s);
			o = _posb(7);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_vr.bezier8(x +   19.873 * s,y +  -30.859 * s,x +   32.112 * s,y +  -42.317 * s,x +   39.648 * s,y +  -50.032 * s,x +   42.480 * s,y +  -54.003 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   48.729 * s);
			_setf(o + ( 1 << 2), y +  -48.388 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   48.729 * s,y +  -48.388 * s,x +   43.489 * s,y +  -42.561 * s,x +   36.832 * s,y +  -35.823 * s,x +   28.759 * s,y +  -28.173 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   48.485 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   37.548 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   21.533 * s);
			_setf(o + ( 5 << 2), y +  -23.095 * s);
			_setf(o + ( 6 << 2), x +   50.438 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			
			case 108:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   23.877 * s);
			_setf(o + ( 1 << 2), y +   -5.859 * s);
			_setf(o + ( 2 << 2), x +   22.803 * s);
			_setf(o + ( 3 << 2), y +    0.977 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   22.803 * s,y +    0.977 * s,x +   12.354 * s,y +    0.977 * s,x +    7.129 * s,y +   -2.897 * s,x +    7.129 * s,y +  -10.644 * s, threshold);
			_vr.bezier8(x +    7.129 * s,y +  -10.644 * s,x +    7.129 * s,y +  -12.988 * s,x +    7.967 * s,y +  -18.207 * s,x +    9.571 * s,y +  -26.318 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   18.945 * s);
			_setf(o + ( 1 << 2), y +  -73.729 * s);
			_setf(o + ( 2 << 2), x +   28.613 * s);
			_setf(o + ( 3 << 2), y +  -73.729 * s);
			_setf(o + ( 4 << 2), x +   19.678 * s);
			_setf(o + ( 5 << 2), y +  -29.199 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   19.678 * s,y +  -29.199 * s,x +   17.823 * s,y +  -19.954 * s,x +   16.895 * s,y +  -14.160 * s,x +   16.895 * s,y +  -11.816 * s, threshold);
			_vr.bezier8(x +   16.895 * s,y +  -11.816 * s,x +   16.895 * s,y +   -7.845 * s,x +   19.222 * s,y +   -5.859 * s,x +   23.877 * s,y +   -5.859 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   32.031 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 109:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   63.427 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   69.286 * s);
			_setf(o + ( 3 << 2), y +  -33.105 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   69.286 * s,y +  -33.105 * s,x +   69.517 * s,y +  -34.406 * s,x +   69.628 * s,y +  -35.660 * s,x +   69.628 * s,y +  -36.865 * s, threshold);
			_vr.bezier8(x +   69.628 * s,y +  -36.865 * s,x +   69.628 * s,y +  -42.593 * s,x +   66.747 * s,y +  -45.458 * s,x +   60.986 * s,y +  -45.458 * s, threshold);
			_vr.bezier8(x +   60.986 * s,y +  -45.458 * s,x +   58.870 * s,y +  -45.458 * s,x +   56.729 * s,y +  -44.799 * s,x +   54.565 * s,y +  -43.481 * s, threshold);
			_vr.bezier8(x +   54.565 * s,y +  -43.481 * s,x +   52.400 * s,y +  -42.162 * s,x +   50.764 * s,y +  -40.559 * s,x +   49.658 * s,y +  -38.671 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   42.822 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   33.300 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   39.892 * s);
			_setf(o + ( 5 << 2), y +  -37.158 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   39.892 * s,y +  -37.158 * s,x +   39.990 * s,y +  -37.711 * s,x +   40.039 * s,y +  -38.216 * s,x +   40.039 * s,y +  -38.671 * s, threshold);
			_vr.bezier8(x +   40.039 * s,y +  -38.671 * s,x +   40.039 * s,y +  -43.196 * s,x +   36.963 * s,y +  -45.458 * s,x +   30.810 * s,y +  -45.458 * s, threshold);
			_vr.bezier8(x +   30.810 * s,y +  -45.458 * s,x +   28.955 * s,y +  -45.458 * s,x +   26.888 * s,y +  -44.742 * s,x +   24.609 * s,y +  -43.310 * s, threshold);
			_vr.bezier8(x +   24.609 * s,y +  -43.310 * s,x +   22.331 * s,y +  -41.878 * s,x +   20.605 * s,y +  -40.299 * s,x +   19.433 * s,y +  -38.574 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   12.598 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    3.125 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    9.863 * s);
			_setf(o + ( 5 << 2), y +  -38.134 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +    9.863 * s,y +  -38.134 * s,x +   10.059 * s,y +  -39.241 * s,x +   10.156 * s,y +  -40.771 * s,x +   10.156 * s,y +  -42.724 * s, threshold);
			_vr.bezier8(x +   10.156 * s,y +  -42.724 * s,x +   10.156 * s,y +  -46.337 * s,x +    9.831 * s,y +  -49.267 * s,x +    9.180 * s,y +  -51.513 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   18.213 * s);
			_setf(o + ( 1 << 2), y +  -53.222 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   18.213 * s,y +  -53.222 * s,x +   18.799 * s,y +  -50.715 * s,x +   19.141 * s,y +  -48.437 * s,x +   19.238 * s,y +  -46.386 * s, threshold);
			_vr.bezier8(x +   19.238 * s,y +  -46.386 * s,x +   20.540 * s,y +  -48.502 * s,x +   22.697 * s,y +  -50.178 * s,x +   25.708 * s,y +  -51.415 * s, threshold);
			_vr.bezier8(x +   25.708 * s,y +  -51.415 * s,x +   28.719 * s,y +  -52.652 * s,x +   31.852 * s,y +  -53.271 * s,x +   35.107 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   35.107 * s,y +  -53.271 * s,x +   42.561 * s,y +  -53.271 * s,x +   47.379 * s,y +  -50.943 * s,x +   49.560 * s,y +  -46.288 * s, threshold);
			_vr.bezier8(x +   49.560 * s,y +  -46.288 * s,x +   50.992 * s,y +  -48.306 * s,x +   53.238 * s,y +  -49.975 * s,x +   56.298 * s,y +  -51.293 * s, threshold);
			_vr.bezier8(x +   56.298 * s,y +  -51.293 * s,x +   59.358 * s,y +  -52.611 * s,x +   62.385 * s,y +  -53.271 * s,x +   65.380 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   65.380 * s,y +  -53.271 * s,x +   74.853 * s,y +  -53.271 * s,x +   79.589 * s,y +  -48.746 * s,x +   79.589 * s,y +  -39.697 * s, threshold);
			_vr.bezier8(x +   79.589 * s,y +  -39.697 * s,x +   79.589 * s,y +  -38.199 * s,x +   79.444 * s,y +  -36.620 * s,x +   79.149 * s,y +  -34.960 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   72.948 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   63.427 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   83.007 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 110:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   35.546 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   41.015 * s);
			_setf(o + ( 3 << 2), y +  -30.419 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   41.015 * s,y +  -30.419 * s,x +   41.501 * s,y +  -33.122 * s,x +   41.747 * s,y +  -35.367 * s,x +   41.747 * s,y +  -37.158 * s, threshold);
			_vr.bezier8(x +   41.747 * s,y +  -37.158 * s,x +   41.747 * s,y +  -42.691 * s,x +   38.867 * s,y +  -45.458 * s,x +   33.105 * s,y +  -45.458 * s, threshold);
			_vr.bezier8(x +   33.105 * s,y +  -45.458 * s,x +   30.891 * s,y +  -45.458 * s,x +   28.523 * s,y +  -44.807 * s,x +   26.001 * s,y +  -43.505 * s, threshold);
			_vr.bezier8(x +   26.001 * s,y +  -43.505 * s,x +   23.478 * s,y +  -42.203 * s,x +   21.468 * s,y +  -40.657 * s,x +   19.970 * s,y +  -38.867 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   13.183 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    3.808 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   10.840 * s);
			_setf(o + ( 5 << 2), y +  -39.648 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   10.840 * s,y +  -39.648 * s,x +   11.001 * s,y +  -40.559 * s,x +   11.084 * s,y +  -41.633 * s,x +   11.084 * s,y +  -42.870 * s, threshold);
			_vr.bezier8(x +   11.084 * s,y +  -42.870 * s,x +   11.084 * s,y +  -46.191 * s,x +   10.742 * s,y +  -49.072 * s,x +   10.058 * s,y +  -51.513 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   19.043 * s);
			_setf(o + ( 1 << 2), y +  -53.271 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   19.043 * s,y +  -53.271 * s,x +   19.922 * s,y +  -48.518 * s,x +   20.345 * s,y +  -45.930 * s,x +   20.312 * s,y +  -45.507 * s, threshold);
			_vr.bezier8(x +   20.312 * s,y +  -45.507 * s,x +   24.283 * s,y +  -50.683 * s,x +   30.013 * s,y +  -53.271 * s,x +   37.499 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   37.499 * s,y +  -53.271 * s,x +   46.939 * s,y +  -53.271 * s,x +   51.659 * s,y +  -48.453 * s,x +   51.659 * s,y +  -38.818 * s, threshold);
			_vr.bezier8(x +   51.659 * s,y +  -38.818 * s,x +   51.659 * s,y +  -36.897 * s,x +   51.437 * s,y +  -34.750 * s,x +   51.025 * s,y +  -32.373 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   45.409 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   35.546 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   54.638 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 111:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    3.564 * s);
			_setf(o + ( 1 << 2), y +  -19.238 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +    3.564 * s,y +  -19.238 * s,x +    3.564 * s,y +  -28.580 * s,x +    6.299 * s,y +  -36.588 * s,x +   11.767 * s,y +  -43.261 * s, threshold);
			_vr.bezier8(x +   11.767 * s,y +  -43.261 * s,x +   17.236 * s,y +  -49.934 * s,x +   24.186 * s,y +  -53.271 * s,x +   32.617 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   32.617 * s,y +  -53.271 * s,x +   38.964 * s,y +  -53.271 * s,x +   43.814 * s,y +  -51.554 * s,x +   47.167 * s,y +  -48.119 * s, threshold);
			_vr.bezier8(x +   47.167 * s,y +  -48.119 * s,x +   50.520 * s,y +  -44.685 * s,x +   52.196 * s,y +  -39.810 * s,x +   52.196 * s,y +  -33.496 * s, threshold);
			_vr.bezier8(x +   52.196 * s,y +  -33.496 * s,x +   52.196 * s,y +  -28.483 * s,x +   51.195 * s,y +  -23.274 * s,x +   49.193 * s,y +  -17.871 * s, threshold);
			_vr.bezier8(x +   49.193 * s,y +  -17.871 * s,x +   47.191 * s,y +  -12.467 * s,x +   43.920 * s,y +   -7.975 * s,x +   39.379 * s,y +   -4.394 * s, threshold);
			_vr.bezier8(x +   39.379 * s,y +   -4.394 * s,x +   34.838 * s,y +   -0.814 * s,x +   29.394 * s,y +    0.977 * s,x +   23.046 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   23.046 * s,y +    0.977 * s,x +   16.764 * s,y +    0.977 * s,x +   11.946 * s,y +   -0.789 * s,x +    8.594 * s,y +   -4.321 * s, threshold);
			_vr.bezier8(x +    8.594 * s,y +   -4.321 * s,x +    5.241 * s,y +   -7.853 * s,x +    3.564 * s,y +  -12.825 * s,x +    3.564 * s,y +  -19.238 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   13.330 * s);
			_setf(o + ( 1 << 2), y +  -19.824 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   13.330 * s,y +  -19.824 * s,x +   13.330 * s,y +  -11.003 * s,x +   17.025 * s,y +   -6.592 * s,x +   24.414 * s,y +   -6.592 * s, threshold);
			_vr.bezier8(x +   24.414 * s,y +   -6.592 * s,x +   29.915 * s,y +   -6.592 * s,x +   34.285 * s,y +   -9.261 * s,x +   37.524 * s,y +  -14.599 * s, threshold);
			_vr.bezier8(x +   37.524 * s,y +  -14.599 * s,x +   40.763 * s,y +  -19.938 * s,x +   42.382 * s,y +  -26.107 * s,x +   42.382 * s,y +  -33.105 * s, threshold);
			_vr.bezier8(x +   42.382 * s,y +  -33.105 * s,x +   42.382 * s,y +  -41.503 * s,x +   38.687 * s,y +  -45.702 * s,x +   31.298 * s,y +  -45.702 * s, threshold);
			_vr.bezier8(x +   31.298 * s,y +  -45.702 * s,x +   27.555 * s,y +  -45.702 * s,x +   24.259 * s,y +  -44.368 * s,x +   21.411 * s,y +  -41.699 * s, threshold);
			_vr.bezier8(x +   21.411 * s,y +  -41.699 * s,x +   18.563 * s,y +  -39.029 * s,x +   16.504 * s,y +  -35.611 * s,x +   15.234 * s,y +  -31.445 * s, threshold);
			_vr.bezier8(x +   15.234 * s,y +  -31.445 * s,x +   13.965 * s,y +  -27.278 * s,x +   13.330 * s,y +  -23.405 * s,x +   13.330 * s,y +  -19.824 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   53.661 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 112:
			
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   12.646 * s);
			_setf(o + ( 1 << 2), y +   -2.637 * s);
			_setf(o + ( 2 << 2), x +    8.545 * s);
			_setf(o + ( 3 << 2), y +   20.752 * s);
			_setf(o + ( 4 << 2), x +   -0.732 * s);
			_setf(o + ( 5 << 2), y +   20.752 * s);
			_setf(o + ( 6 << 2), x +    9.521 * s);
			_setf(o + ( 7 << 2), y +  -36.669 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_vr.bezier8(x +    9.521 * s,y +  -36.669 * s,x +    9.969 * s,y +  -39.177 * s,x +   10.205 * s,y +  -41.634 * s,x +   10.205 * s,y +  -44.042 * s, threshold);
			_vr.bezier8(x +   10.205 * s,y +  -44.042 * s,x +   10.205 * s,y +  -46.516 * s,x +    9.961 * s,y +  -48.925 * s,x +    9.473 * s,y +  -51.269 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   18.799 * s);
			_setf(o + ( 1 << 2), y +  -53.027 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   18.799 * s,y +  -53.027 * s,x +   18.961 * s,y +  -52.603 * s,x +   19.254 * s,y +  -50.374 * s,x +   19.678 * s,y +  -46.337 * s, threshold);
			_vr.bezier8(x +   19.678 * s,y +  -46.337 * s,x +   21.207 * s,y +  -48.225 * s,x +   23.405 * s,y +  -49.812 * s,x +   26.269 * s,y +  -51.098 * s, threshold);
			_vr.bezier8(x +   26.269 * s,y +  -51.098 * s,x +   29.134 * s,y +  -52.384 * s,x +   31.803 * s,y +  -53.027 * s,x +   34.277 * s,y +  -53.027 * s, threshold);
			_vr.bezier8(x +   34.277 * s,y +  -53.027 * s,x +   40.787 * s,y +  -53.027 * s,x +   45.662 * s,y +  -51.415 * s,x +   48.901 * s,y +  -48.193 * s, threshold);
			_vr.bezier8(x +   48.901 * s,y +  -48.193 * s,x +   52.140 * s,y +  -44.970 * s,x +   53.759 * s,y +  -40.120 * s,x +   53.759 * s,y +  -33.642 * s, threshold);
			_vr.bezier8(x +   53.759 * s,y +  -33.642 * s,x +   53.759 * s,y +  -23.747 * s,x +   51.017 * s,y +  -15.462 * s,x +   45.532 * s,y +   -8.789 * s, threshold);
			_vr.bezier8(x +   45.532 * s,y +   -8.789 * s,x +   40.047 * s,y +   -2.116 * s,x +   32.844 * s,y +    1.221 * s,x +   23.926 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   23.926 * s,y +    1.221 * s,x +   22.005 * s,y +    1.221 * s,x +   19.800 * s,y +    0.846 * s,x +   17.309 * s,y +    0.098 * s, threshold);
			_vr.bezier8(x +   17.309 * s,y +    0.098 * s,x +   14.819 * s,y +   -0.651 * s,x +   13.265 * s,y +   -1.562 * s,x +   12.646 * s,y +   -2.637 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   14.014 * s);
			_setf(o + ( 1 << 2), y +  -10.303 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   14.014 * s,y +  -10.303 * s,x +   14.599 * s,y +   -9.261 * s,x +   15.788 * s,y +   -8.382 * s,x +   17.578 * s,y +   -7.666 * s, threshold);
			_vr.bezier8(x +   17.578 * s,y +   -7.666 * s,x +   19.368 * s,y +   -6.950 * s,x +   21.045 * s,y +   -6.592 * s,x +   22.607 * s,y +   -6.592 * s, threshold);
			_vr.bezier8(x +   22.607 * s,y +   -6.592 * s,x +   29.410 * s,y +   -6.592 * s,x +   34.659 * s,y +   -8.895 * s,x +   38.354 * s,y +  -13.501 * s, threshold);
			_vr.bezier8(x +   38.354 * s,y +  -13.501 * s,x +   42.049 * s,y +  -18.107 * s,x +   43.896 * s,y +  -24.397 * s,x +   43.896 * s,y +  -32.373 * s, threshold);
			_vr.bezier8(x +   43.896 * s,y +  -32.373 * s,x +   43.896 * s,y +  -36.669 * s,x +   42.814 * s,y +  -39.884 * s,x +   40.649 * s,y +  -42.016 * s, threshold);
			_vr.bezier8(x +   40.649 * s,y +  -42.016 * s,x +   38.484 * s,y +  -44.148 * s,x +   35.237 * s,y +  -45.214 * s,x +   30.908 * s,y +  -45.214 * s, threshold);
			_vr.bezier8(x +   30.908 * s,y +  -45.214 * s,x +   29.020 * s,y +  -45.214 * s,x +   26.831 * s,y +  -44.555 * s,x +   24.341 * s,y +  -43.237 * s, threshold);
			_vr.bezier8(x +   24.341 * s,y +  -43.237 * s,x +   21.850 * s,y +  -41.918 * s,x +   20.084 * s,y +  -40.543 * s,x +   19.043 * s,y +  -39.111 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   14.014 * s);
			_setf(o + ( 1 << 2), y +  -10.303 * s);
			_setf(o + ( 2 << 2), x +   55.712 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 113:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   32.763 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			_setf(o + ( 2 << 2), x +   36.914 * s);
			_setf(o + ( 3 << 2), y +   -3.076 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   36.914 * s,y +   -3.076 * s,x +   33.756 * s,y +   -0.374 * s,x +   28.987 * s,y +    0.977 * s,x +   22.607 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   22.607 * s,y +    0.977 * s,x +   17.204 * s,y +    0.977 * s,x +   12.728 * s,y +   -0.960 * s,x +    9.180 * s,y +   -4.834 * s, threshold);
			_vr.bezier8(x +    9.180 * s,y +   -4.834 * s,x +    5.632 * s,y +   -8.708 * s,x +    3.858 * s,y +  -13.297 * s,x +    3.858 * s,y +  -18.603 * s, threshold);
			_vr.bezier8(x +    3.858 * s,y +  -18.603 * s,x +    3.858 * s,y +  -28.271 * s,x +    6.698 * s,y +  -36.466 * s,x +   12.378 * s,y +  -43.188 * s, threshold);
			_vr.bezier8(x +   12.378 * s,y +  -43.188 * s,x +   18.058 * s,y +  -49.910 * s,x +   25.326 * s,y +  -53.271 * s,x +   34.179 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   34.179 * s,y +  -53.271 * s,x +   38.802 * s,y +  -53.271 * s,x +   42.757 * s,y +  -51.627 * s,x +   46.044 * s,y +  -48.339 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   48.535 * s);
			_setf(o + ( 1 << 2), y +  -52.294 * s);
			_setf(o + ( 2 << 2), x +   56.249 * s);
			_setf(o + ( 3 << 2), y +  -52.294 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_vr.bezier8(x +   56.249 * s,y +  -52.294 * s,x +   54.264 * s,y +  -45.816 * s,x +   52.935 * s,y +  -40.639 * s,x +   52.245 * s,y +  -36.767 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   42.041 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			_setf(o + ( 2 << 2), x +   32.763 * s);
			_setf(o + ( 3 << 2), y +   20.508 * s);
			_setf(o + ( 4 << 2), x +   43.701 * s);
			_setf(o + ( 5 << 2), y +  -41.454 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			_vr.bezier8(x +   43.701 * s,y +  -41.454 * s,x +   41.520 * s,y +  -44.124 * s,x +   38.411 * s,y +  -45.458 * s,x +   34.375 * s,y +  -45.458 * s, threshold);
			_vr.bezier8(x +   34.375 * s,y +  -45.458 * s,x +   28.287 * s,y +  -45.458 * s,x +   23.340 * s,y +  -43.058 * s,x +   19.531 * s,y +  -38.256 * s, threshold);
			_vr.bezier8(x +   19.531 * s,y +  -38.256 * s,x +   15.723 * s,y +  -33.455 * s,x +   13.818 * s,y +  -27.653 * s,x +   13.818 * s,y +  -20.849 * s, threshold);
			_vr.bezier8(x +   13.818 * s,y +  -20.849 * s,x +   13.818 * s,y +  -16.390 * s,x +   14.982 * s,y +  -12.939 * s,x +   17.309 * s,y +  -10.498 * s, threshold);
			_vr.bezier8(x +   17.309 * s,y +  -10.498 * s,x +   19.637 * s,y +   -8.057 * s,x +   22.933 * s,y +   -6.836 * s,x +   27.197 * s,y +   -6.836 * s, threshold);
			_vr.bezier8(x +   27.197 * s,y +   -6.836 * s,x +   31.624 * s,y +   -6.836 * s,x +   35.286 * s,y +   -7.975 * s,x +   38.183 * s,y +  -10.254 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   43.701 * s);
			_setf(o + ( 1 << 2), y +  -41.454 * s);
			_setf(o + ( 2 << 2), x +   55.712 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 114:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   40.771 * s);
			_setf(o + ( 1 << 2), y +  -43.115 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   40.771 * s,y +  -43.115 * s,x +   38.818 * s,y +  -44.677 * s,x +   36.539 * s,y +  -45.458 * s,x +   33.935 * s,y +  -45.458 * s, threshold);
			_vr.bezier8(x +   33.935 * s,y +  -45.458 * s,x +   30.647 * s,y +  -45.458 * s,x +   27.506 * s,y +  -43.936 * s,x +   24.512 * s,y +  -40.893 * s, threshold);
			_vr.bezier8(x +   24.512 * s,y +  -40.893 * s,x +   21.517 * s,y +  -37.849 * s,x +   19.647 * s,y +  -34.211 * s,x +   18.896 * s,y +  -29.980 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   13.574 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    4.297 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   13.525 * s);
			_setf(o + ( 5 << 2), y +  -52.294 * s);
			_setf(o + ( 6 << 2), x +   22.803 * s);
			_setf(o + ( 7 << 2), y +  -52.294 * s);
			_setf(o + ( 8 << 2), x +   21.338 * s);
			_setf(o + ( 9 << 2), y +  -43.945 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   21.338 * s,y +  -43.945 * s,x +   25.830 * s,y +  -50.162 * s,x +   31.413 * s,y +  -53.271 * s,x +   38.086 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   38.086 * s,y +  -53.271 * s,x +   39.225 * s,y +  -53.271 * s,x +   40.999 * s,y +  -53.043 * s,x +   43.408 * s,y +  -52.587 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   40.771 * s);
			_setf(o + ( 1 << 2), y +  -43.115 * s);
			_setf(o + ( 2 << 2), x +   41.650 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 115:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    0.439 * s);
			_setf(o + ( 1 << 2), y +   -3.125 * s);
			_setf(o + ( 2 << 2), x +    5.273 * s);
			_setf(o + ( 3 << 2), y +  -11.914 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    5.273 * s,y +  -11.914 * s,x +    6.543 * s,y +  -10.644 * s,x +    8.366 * s,y +   -9.481 * s,x +   10.742 * s,y +   -8.423 * s, threshold);
			_vr.bezier8(x +   10.742 * s,y +   -8.423 * s,x +   13.118 * s,y +   -7.365 * s,x +   15.153 * s,y +   -6.836 * s,x +   16.845 * s,y +   -6.836 * s, threshold);
			_vr.bezier8(x +   16.845 * s,y +   -6.836 * s,x +   19.742 * s,y +   -6.836 * s,x +   22.135 * s,y +   -7.617 * s,x +   24.023 * s,y +   -9.180 * s, threshold);
			_vr.bezier8(x +   24.023 * s,y +   -9.180 * s,x +   25.911 * s,y +  -10.742 * s,x +   26.855 * s,y +  -12.858 * s,x +   26.855 * s,y +  -15.527 * s, threshold);
			_vr.bezier8(x +   26.855 * s,y +  -15.527 * s,x +   26.855 * s,y +  -16.894 * s,x +   26.359 * s,y +  -18.115 * s,x +   25.366 * s,y +  -19.189 * s, threshold);
			_vr.bezier8(x +   25.366 * s,y +  -19.189 * s,x +   24.373 * s,y +  -20.263 * s,x +   22.677 * s,y +  -21.538 * s,x +   20.214 * s,y +  -22.900 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   13.330 * s);
			_setf(o + ( 1 << 2), y +  -26.709 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   13.330 * s,y +  -26.709 * s,x +   11.199 * s,y +  -27.887 * s,x +    9.627 * s,y +  -29.435 * s,x +    8.569 * s,y +  -31.274 * s, threshold);
			_vr.bezier8(x +    8.569 * s,y +  -31.274 * s,x +    7.511 * s,y +  -33.113 * s,x +    6.982 * s,y +  -35.074 * s,x +    6.982 * s,y +  -37.158 * s, threshold);
			_vr.bezier8(x +    6.982 * s,y +  -37.158 * s,x +    6.982 * s,y +  -42.008 * s,x +    8.870 * s,y +  -45.906 * s,x +   12.646 * s,y +  -48.852 * s, threshold);
			_vr.bezier8(x +   12.646 * s,y +  -48.852 * s,x +   16.422 * s,y +  -51.798 * s,x +   21.061 * s,y +  -53.271 * s,x +   26.562 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   26.562 * s,y +  -53.271 * s,x +   30.371 * s,y +  -53.271 * s,x +   34.960 * s,y +  -52.066 * s,x +   40.331 * s,y +  -49.657 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.181 * s);
			_setf(o + ( 1 << 2), y +  -41.064 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   36.181 * s,y +  -41.064 * s,x +   32.991 * s,y +  -43.993 * s,x +   29.557 * s,y +  -45.458 * s,x +   25.878 * s,y +  -45.458 * s, threshold);
			_vr.bezier8(x +   25.878 * s,y +  -45.458 * s,x +   23.437 * s,y +  -45.458 * s,x +   21.329 * s,y +  -44.832 * s,x +   19.555 * s,y +  -43.578 * s, threshold);
			_vr.bezier8(x +   19.555 * s,y +  -43.578 * s,x +   17.781 * s,y +  -42.325 * s,x +   16.894 * s,y +  -40.673 * s,x +   16.894 * s,y +  -38.622 * s, threshold);
			_vr.bezier8(x +   16.894 * s,y +  -38.622 * s,x +   16.894 * s,y +  -37.125 * s,x +   17.399 * s,y +  -35.839 * s,x +   18.408 * s,y +  -34.765 * s, threshold);
			_vr.bezier8(x +   18.408 * s,y +  -34.765 * s,x +   19.417 * s,y +  -33.691 * s,x +   21.162 * s,y +  -32.493 * s,x +   23.632 * s,y +  -31.152 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   30.468 * s);
			_setf(o + ( 1 << 2), y +  -27.441 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   30.468 * s,y +  -27.441 * s,x +   32.580 * s,y +  -26.295 * s,x +   34.163 * s,y +  -24.837 * s,x +   35.204 * s,y +  -23.047 * s, threshold);
			_vr.bezier8(x +   35.204 * s,y +  -23.047 * s,x +   36.246 * s,y +  -21.256 * s,x +   36.767 * s,y +  -19.303 * s,x +   36.767 * s,y +  -17.187 * s, threshold);
			_vr.bezier8(x +   36.767 * s,y +  -17.187 * s,x +   36.767 * s,y +  -11.588 * s,x +   34.741 * s,y +   -7.161 * s,x +   30.688 * s,y +   -3.906 * s, threshold);
			_vr.bezier8(x +   30.688 * s,y +   -3.906 * s,x +   26.635 * s,y +   -0.651 * s,x +   21.484 * s,y +    0.977 * s,x +   15.234 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   15.234 * s,y +    0.977 * s,x +    9.733 * s,y +    0.977 * s,x +    4.801 * s,y +   -0.391 * s,x +    0.439 * s,y +   -3.125 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   40.478 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 116:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +   15.673 * s);
			_setf(o + ( 1 << 2), y +  -44.970 * s);
			_setf(o + ( 2 << 2), x +    9.619 * s);
			_setf(o + ( 3 << 2), y +  -44.970 * s);
			_setf(o + ( 4 << 2), x +   11.181 * s);
			_setf(o + ( 5 << 2), y +  -52.294 * s);
			_setf(o + ( 6 << 2), x +   17.236 * s);
			_setf(o + ( 7 << 2), y +  -52.294 * s);
			_setf(o + ( 8 << 2), x +   19.384 * s);
			_setf(o + ( 9 << 2), y +  -63.231 * s);
			_setf(o + (10 << 2), x +   29.980 * s);
			_setf(o + (11 << 2), y +  -67.235 * s);
			_setf(o + (12 << 2), x +   26.513 * s);
			_setf(o + (13 << 2), y +  -52.294 * s);
			_setf(o + (14 << 2), x +   40.868 * s);
			_setf(o + (15 << 2), y +  -52.294 * s);
			_setf(o + (16 << 2), x +   39.306 * s);
			_setf(o + (17 << 2), y +  -44.970 * s);
			_setf(o + (18 << 2), x +   24.951 * s);
			_setf(o + (19 << 2), y +  -44.970 * s);
			_setf(o + (20 << 2), x +   19.482 * s);
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
			_vr.bezier8(x +   19.482 * s,y +  -18.994 * s,x +   19.057 * s,y +  -16.976 * s,x +   18.847 * s,y +  -15.413 * s,x +   18.847 * s,y +  -14.306 * s, threshold);
			_vr.bezier8(x +   18.847 * s,y +  -14.306 * s,x +   18.847 * s,y +   -9.326 * s,x +   21.321 * s,y +   -6.836 * s,x +   26.269 * s,y +   -6.836 * s, threshold);
			_vr.bezier8(x +   26.269 * s,y +   -6.836 * s,x +   28.678 * s,y +   -6.836 * s,x +   31.266 * s,y +   -7.438 * s,x +   34.032 * s,y +   -8.642 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   33.691 * s);
			_setf(o + ( 1 << 2), y +   -0.488 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   33.691 * s,y +   -0.488 * s,x +   31.021 * s,y +    0.488 * s,x +   26.708 * s,y +    0.977 * s,x +   20.751 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   20.751 * s,y +    0.977 * s,x +   17.041 * s,y +    0.977 * s,x +   14.152 * s,y +   -0.171 * s,x +   12.085 * s,y +   -2.466 * s, threshold);
			_vr.bezier8(x +   12.085 * s,y +   -2.466 * s,x +   10.018 * s,y +   -4.761 * s,x +    8.984 * s,y +   -7.910 * s,x +    8.984 * s,y +  -11.914 * s, threshold);
			_vr.bezier8(x +    8.984 * s,y +  -11.914 * s,x +    8.984 * s,y +  -12.825 * s,x +    9.142 * s,y +  -13.946 * s,x +    9.424 * s,y +  -15.283 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   15.673 * s);
			_setf(o + ( 1 << 2), y +  -44.970 * s);
			_setf(o + ( 2 << 2), x +   41.991 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 117:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   21.045 * s);
			_setf(o + ( 1 << 2), y +  -52.294 * s);
			_setf(o + ( 2 << 2), x +   14.942 * s);
			_setf(o + ( 3 << 2), y +  -18.945 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   14.942 * s,y +  -18.945 * s,x +   14.679 * s,y +  -17.513 * s,x +   14.551 * s,y +  -16.194 * s,x +   14.551 * s,y +  -14.990 * s, threshold);
			_vr.bezier8(x +   14.551 * s,y +  -14.990 * s,x +   14.551 * s,y +   -9.554 * s,x +   17.383 * s,y +   -6.836 * s,x +   23.047 * s,y +   -6.836 * s, threshold);
			_vr.bezier8(x +   23.047 * s,y +   -6.836 * s,x +   26.530 * s,y +   -6.836 * s,x +   29.875 * s,y +   -8.138 * s,x +   33.081 * s,y +  -10.742 * s, threshold);
			_vr.bezier8(x +   33.081 * s,y +  -10.742 * s,x +   36.287 * s,y +  -13.346 * s,x +   38.200 * s,y +  -16.458 * s,x +   38.867 * s,y +  -20.068 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   44.824 * s);
			_setf(o + ( 1 << 2), y +  -52.294 * s);
			_setf(o + ( 2 << 2), x +   54.589 * s);
			_setf(o + ( 3 << 2), y +  -52.294 * s);
			_setf(o + ( 4 << 2), x +   45.019 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   35.254 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   36.621 * s);
			_setf(o + ( 9 << 2), y +   -7.373 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   36.621 * s,y +   -7.373 * s,x +   32.975 * s,y +   -1.807 * s,x +   26.660 * s,y +    0.977 * s,x +   17.676 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   17.676 * s,y +    0.977 * s,x +   13.607 * s,y +    0.977 * s,x +   10.433 * s,y +   -0.228 * s,x +    8.155 * s,y +   -2.637 * s, threshold);
			_vr.bezier8(x +    8.155 * s,y +   -2.637 * s,x +    5.876 * s,y +   -5.045 * s,x +    4.737 * s,y +   -8.463 * s,x +    4.737 * s,y +  -12.890 * s, threshold);
			_vr.bezier8(x +    4.737 * s,y +  -12.890 * s,x +    4.737 * s,y +  -14.453 * s,x +    4.903 * s,y +  -16.145 * s,x +    5.225 * s,y +  -17.968 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   11.279 * s);
			_setf(o + ( 1 << 2), y +  -52.294 * s);
			_setf(o + ( 2 << 2), x +   21.045 * s);
			_setf(o + ( 3 << 2), y +  -52.294 * s);
			_setf(o + ( 4 << 2), x +   55.664 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 118:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +   22.460 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			_setf(o + ( 2 << 2), x +   20.019 * s);
			_setf(o + ( 3 << 2), y +    0.977 * s);
			_setf(o + ( 4 << 2), x +    4.833 * s);
			_setf(o + ( 5 << 2), y +  -52.441 * s);
			_setf(o + ( 6 << 2), x +   14.501 * s);
			_setf(o + ( 7 << 2), y +  -52.441 * s);
			_setf(o + ( 8 << 2), x +   23.876 * s);
			_setf(o + ( 9 << 2), y +  -16.455 * s);
			_setf(o + (10 << 2), x +   43.749 * s);
			_setf(o + (11 << 2), y +  -52.441 * s);
			_setf(o + (12 << 2), x +   54.442 * s);
			_setf(o + (13 << 2), y +  -52.441 * s);
			_setf(o + (14 << 2), x +   22.460 * s);
			_setf(o + (15 << 2), y +    0.977 * s);
			_setf(o + (16 << 2), x +   48.973 * s);
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
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +   50.879 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			_setf(o + ( 2 << 2), x +   48.437 * s);
			_setf(o + ( 3 << 2), y +    0.977 * s);
			_setf(o + ( 4 << 2), x +   38.721 * s);
			_setf(o + ( 5 << 2), y +  -33.056 * s);
			_setf(o + ( 6 << 2), x +   17.822 * s);
			_setf(o + ( 7 << 2), y +    0.977 * s);
			_setf(o + ( 8 << 2), x +   15.381 * s);
			_setf(o + ( 9 << 2), y +    0.977 * s);
			_setf(o + (10 << 2), x +    5.616 * s);
			_setf(o + (11 << 2), y +  -52.441 * s);
			_setf(o + (12 << 2), x +   15.039 * s);
			_setf(o + (13 << 2), y +  -52.441 * s);
			_setf(o + (14 << 2), x +   20.752 * s);
			_setf(o + (15 << 2), y +  -19.189 * s);
			_setf(o + (16 << 2), x +   40.234 * s);
			_setf(o + (17 << 2), y +  -52.441 * s);
			_setf(o + (18 << 2), x +   42.676 * s);
			_setf(o + (19 << 2), y +  -52.441 * s);
			_setf(o + (20 << 2), x +   52.050 * s);
			_setf(o + (21 << 2), y +  -18.945 * s);
			_setf(o + (22 << 2), x +   68.456 * s);
			_setf(o + (23 << 2), y +  -52.441 * s);
			_setf(o + (24 << 2), x +   78.075 * s);
			_setf(o + (25 << 2), y +  -52.441 * s);
			o = _posb(13);
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
			_vr.bezier8(x +   78.075 * s,y +  -52.441 * s,x +   67.171 * s,y +  -31.087 * s,x +   58.105 * s,y +  -13.281 * s,x +   50.879 * s,y +    0.977 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   74.413 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 120:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   34.228 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   25.048 * s);
			_setf(o + ( 3 << 2), y +  -18.359 * s);
			_setf(o + ( 4 << 2), x +   10.644 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   -0.684 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   20.849 * s);
			_setf(o + ( 9 << 2), y +  -27.197 * s);
			_setf(o + (10 << 2), x +    7.666 * s);
			_setf(o + (11 << 2), y +  -52.294 * s);
			_setf(o + (12 << 2), x +   18.603 * s);
			_setf(o + (13 << 2), y +  -52.294 * s);
			_setf(o + (14 << 2), x +   27.246 * s);
			_setf(o + (15 << 2), y +  -34.130 * s);
			_setf(o + (16 << 2), x +   40.527 * s);
			_setf(o + (17 << 2), y +  -52.294 * s);
			_setf(o + (18 << 2), x +   52.734 * s);
			_setf(o + (19 << 2), y +  -52.294 * s);
			_setf(o + (20 << 2), x +   31.884 * s);
			_setf(o + (21 << 2), y +  -26.416 * s);
			_setf(o + (22 << 2), x +   46.288 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   34.228 * s);
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
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    1.514 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			_setf(o + ( 2 << 2), x +    1.514 * s);
			_setf(o + ( 3 << 2), y +   11.181 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    1.514 * s,y +   11.181 * s,x +    7.568 * s,y +   11.181 * s,x +   11.865 * s,y +   10.270 * s,x +   14.404 * s,y +    8.447 * s, threshold);
			_vr.bezier8(x +   14.404 * s,y +    8.447 * s,x +   16.943 * s,y +    6.624 * s,x +   18.766 * s,y +    3.890 * s,x +   19.873 * s,y +    0.244 * s, threshold);
			_vr.bezier8(x +   19.873 * s,y +    0.244 * s,x +   15.283 * s,y +    0.244 * s,x +   12.261 * s,y +   -4.284 * s,x +   10.742 * s,y +  -13.330 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    4.199 * s);
			_setf(o + ( 1 << 2), y +  -52.294 * s);
			_setf(o + ( 2 << 2), x +   14.306 * s);
			_setf(o + ( 3 << 2), y +  -52.294 * s);
			_setf(o + ( 4 << 2), x +   20.068 * s);
			_setf(o + ( 5 << 2), y +  -14.355 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   20.068 * s,y +  -14.355 * s,x +   20.636 * s,y +  -10.614 * s,x +   21.956 * s,y +   -8.740 * s,x +   24.072 * s,y +   -8.740 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   42.919 * s);
			_setf(o + ( 1 << 2), y +  -52.294 * s);
			_setf(o + ( 2 << 2), x +   53.466 * s);
			_setf(o + ( 3 << 2), y +  -52.294 * s);
			_setf(o + ( 4 << 2), x +   27.246 * s);
			_setf(o + ( 5 << 2), y +    6.250 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   27.246 * s,y +    6.250 * s,x +   25.030 * s,y +   11.196 * s,x +   22.086 * s,y +   14.811 * s,x +   18.408 * s,y +   17.090 * s, threshold);
			_vr.bezier8(x +   18.408 * s,y +   17.090 * s,x +   14.730 * s,y +   19.368 * s,x +    9.098 * s,y +   20.508 * s,x +    1.514 * s,y +   20.508 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   49.316 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 122:
			
			o = _posf(24);
			_setf(o + ( 0 << 2), x +   16.406 * s);
			_setf(o + ( 1 << 2), y +   -8.301 * s);
			_setf(o + ( 2 << 2), x +   42.431 * s);
			_setf(o + ( 3 << 2), y +   -8.301 * s);
			_setf(o + ( 4 << 2), x +   40.966 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    0.390 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    0.390 * s);
			_setf(o + ( 9 << 2), y +   -2.441 * s);
			_setf(o + (10 << 2), x +   32.470 * s);
			_setf(o + (11 << 2), y +  -43.993 * s);
			_setf(o + (12 << 2), x +    5.663 * s);
			_setf(o + (13 << 2), y +  -43.993 * s);
			_setf(o + (14 << 2), x +    7.128 * s);
			_setf(o + (15 << 2), y +  -52.294 * s);
			_setf(o + (16 << 2), x +   47.948 * s);
			_setf(o + (17 << 2), y +  -52.294 * s);
			_setf(o + (18 << 2), x +   47.948 * s);
			_setf(o + (19 << 2), y +  -49.657 * s);
			_setf(o + (20 << 2), x +   16.406 * s);
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
			_setf(o + ( 0 << 2), x +   19.482 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   19.482 * s,y +   20.508 * s,x +   14.664 * s,y +   20.508 * s,x +   10.636 * s,y +   19.433 * s,x +    7.397 * s,y +   17.285 * s, threshold);
			_vr.bezier8(x +    7.397 * s,y +   17.285 * s,x +    4.158 * s,y +   15.137 * s,x +    2.539 * s,y +   12.158 * s,x +    2.539 * s,y +    8.349 * s, threshold);
			_vr.bezier8(x +    2.539 * s,y +    8.349 * s,x +    2.539 * s,y +    5.355 * s,x +    3.833 * s,y +    1.042 * s,x +    6.421 * s,y +   -4.590 * s, threshold);
			_vr.bezier8(x +    6.421 * s,y +   -4.590 * s,x +    9.008 * s,y +  -10.221 * s,x +   10.302 * s,y +  -14.534 * s,x +   10.302 * s,y +  -17.529 * s, threshold);
			_vr.bezier8(x +   10.302 * s,y +  -17.529 * s,x +   10.302 * s,y +  -22.477 * s,x +    7.438 * s,y +  -25.146 * s,x +    1.709 * s,y +  -25.537 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    2.441 * s);
			_setf(o + ( 1 << 2), y +  -29.638 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    2.441 * s,y +  -29.638 * s,x +    6.282 * s,y +  -29.899 * s,x +    9.318 * s,y +  -31.380 * s,x +   11.547 * s,y +  -34.081 * s, threshold);
			_vr.bezier8(x +   11.547 * s,y +  -34.081 * s,x +   13.777 * s,y +  -36.783 * s,x +   14.892 * s,y +  -40.250 * s,x +   14.892 * s,y +  -44.482 * s, threshold);
			_vr.bezier8(x +   14.892 * s,y +  -44.482 * s,x +   14.892 * s,y +  -45.784 * s,x +   14.746 * s,y +  -47.721 * s,x +   14.453 * s,y +  -50.292 * s, threshold);
			_vr.bezier8(x +   14.453 * s,y +  -50.292 * s,x +   14.160 * s,y +  -52.864 * s,x +   14.013 * s,y +  -54.801 * s,x +   14.013 * s,y +  -56.103 * s, threshold);
			_vr.bezier8(x +   14.013 * s,y +  -56.103 * s,x +   14.013 * s,y +  -61.311 * s,x +   16.105 * s,y +  -65.486 * s,x +   20.287 * s,y +  -68.627 * s, threshold);
			_vr.bezier8(x +   20.287 * s,y +  -68.627 * s,x +   24.470 * s,y +  -71.768 * s,x +   29.557 * s,y +  -73.339 * s,x +   35.546 * s,y +  -73.339 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   42.773 * s);
			_setf(o + ( 1 << 2), y +  -73.339 * s);
			_setf(o + ( 2 << 2), x +   41.649 * s);
			_setf(o + ( 3 << 2), y +  -66.845 * s);
			_setf(o + ( 4 << 2), x +   33.105 * s);
			_setf(o + ( 5 << 2), y +  -66.845 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   33.105 * s,y +  -66.845 * s,x +   29.947 * s,y +  -66.845 * s,x +   27.514 * s,y +  -65.738 * s,x +   25.805 * s,y +  -63.524 * s, threshold);
			_vr.bezier8(x +   25.805 * s,y +  -63.524 * s,x +   24.096 * s,y +  -61.311 * s,x +   23.242 * s,y +  -58.284 * s,x +   23.242 * s,y +  -54.443 * s, threshold);
			_vr.bezier8(x +   23.242 * s,y +  -54.443 * s,x +   23.242 * s,y +  -53.368 * s,x +   23.372 * s,y +  -51.781 * s,x +   23.632 * s,y +  -49.682 * s, threshold);
			_vr.bezier8(x +   23.632 * s,y +  -49.682 * s,x +   23.893 * s,y +  -47.582 * s,x +   24.023 * s,y +  -45.995 * s,x +   24.023 * s,y +  -44.921 * s, threshold);
			_vr.bezier8(x +   24.023 * s,y +  -44.921 * s,x +   24.023 * s,y +  -41.503 * s,x +   23.014 * s,y +  -38.443 * s,x +   20.995 * s,y +  -35.742 * s, threshold);
			_vr.bezier8(x +   20.995 * s,y +  -35.742 * s,x +   18.977 * s,y +  -33.040 * s,x +   15.413 * s,y +  -30.354 * s,x +   10.302 * s,y +  -27.685 * s, threshold);
			_vr.bezier8(x +   10.302 * s,y +  -27.685 * s,x +   16.259 * s,y +  -25.048 * s,x +   19.238 * s,y +  -21.419 * s,x +   19.238 * s,y +  -16.797 * s, threshold);
			_vr.bezier8(x +   19.238 * s,y +  -16.797 * s,x +   19.238 * s,y +  -14.713 * s,x +   18.131 * s,y +  -11.206 * s,x +   15.917 * s,y +   -6.274 * s, threshold);
			_vr.bezier8(x +   15.917 * s,y +   -6.274 * s,x +   13.704 * s,y +   -1.343 * s,x +   12.597 * s,y +    2.523 * s,x +   12.597 * s,y +    5.322 * s, threshold);
			_vr.bezier8(x +   12.597 * s,y +    5.322 * s,x +   12.597 * s,y +    7.405 * s,x +   13.094 * s,y +    9.082 * s,x +   14.086 * s,y +   10.351 * s, threshold);
			_vr.bezier8(x +   14.086 * s,y +   10.351 * s,x +   15.079 * s,y +   11.621 * s,x +   16.520 * s,y +   12.492 * s,x +   18.408 * s,y +   12.964 * s, threshold);
			_vr.bezier8(x +   18.408 * s,y +   12.964 * s,x +   20.296 * s,y +   13.436 * s,x +   23.307 * s,y +   13.672 * s,x +   27.441 * s,y +   13.672 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   26.269 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			_setf(o + ( 2 << 2), x +   19.482 * s);
			_setf(o + ( 3 << 2), y +   20.508 * s);
			_setf(o + ( 4 << 2), x +   36.718 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
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
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   -6.397 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			_setf(o + ( 2 << 2), x +   -5.225 * s);
			_setf(o + ( 3 << 2), y +   13.672 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   -5.225 * s,y +   13.672 * s,x +    2.262 * s,y +   13.672 * s,x +    7.283 * s,y +   12.418 * s,x +    9.838 * s,y +    9.912 * s, threshold);
			_vr.bezier8(x +    9.838 * s,y +    9.912 * s,x +   12.394 * s,y +    7.406 * s,x +   13.671 * s,y +    3.499 * s,x +   13.671 * s,y +   -1.807 * s, threshold);
			_vr.bezier8(x +   13.671 * s,y +   -1.807 * s,x +   13.671 * s,y +   -2.881 * s,x +   13.573 * s,y +   -4.508 * s,x +   13.378 * s,y +   -6.689 * s, threshold);
			_vr.bezier8(x +   13.378 * s,y +   -6.689 * s,x +   13.183 * s,y +   -8.870 * s,x +   13.085 * s,y +  -10.514 * s,x +   13.085 * s,y +  -11.621 * s, threshold);
			_vr.bezier8(x +   13.085 * s,y +  -11.621 * s,x +   13.085 * s,y +  -18.880 * s,x +   17.577 * s,y +  -24.235 * s,x +   26.562 * s,y +  -27.685 * s, threshold);
			_vr.bezier8(x +   26.562 * s,y +  -27.685 * s,x +   20.767 * s,y +  -31.429 * s,x +   17.870 * s,y +  -35.432 * s,x +   17.870 * s,y +  -39.697 * s, threshold);
			_vr.bezier8(x +   17.870 * s,y +  -39.697 * s,x +   17.870 * s,y +  -42.008 * s,x +   18.928 * s,y +  -45.385 * s,x +   21.044 * s,y +  -49.828 * s, threshold);
			_vr.bezier8(x +   21.044 * s,y +  -49.828 * s,x +   23.160 * s,y +  -54.272 * s,x +   24.218 * s,y +  -57.812 * s,x +   24.218 * s,y +  -60.448 * s, threshold);
			_vr.bezier8(x +   24.218 * s,y +  -60.448 * s,x +   24.218 * s,y +  -64.713 * s,x +   21.988 * s,y +  -66.845 * s,x +   17.529 * s,y +  -66.845 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    8.984 * s);
			_setf(o + ( 1 << 2), y +  -66.845 * s);
			_setf(o + ( 2 << 2), x +   10.107 * s);
			_setf(o + ( 3 << 2), y +  -73.339 * s);
			_setf(o + ( 4 << 2), x +   17.333 * s);
			_setf(o + ( 5 << 2), y +  -73.339 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   17.333 * s,y +  -73.339 * s,x +   21.923 * s,y +  -73.339 * s,x +   25.837 * s,y +  -72.289 * s,x +   29.076 * s,y +  -70.189 * s, threshold);
			_vr.bezier8(x +   29.076 * s,y +  -70.189 * s,x +   32.315 * s,y +  -68.090 * s,x +   33.935 * s,y +  -65.201 * s,x +   33.935 * s,y +  -61.522 * s, threshold);
			_vr.bezier8(x +   33.935 * s,y +  -61.522 * s,x +   33.935 * s,y +  -59.081 * s,x +   32.714 * s,y +  -55.289 * s,x +   30.272 * s,y +  -50.146 * s, threshold);
			_vr.bezier8(x +   30.272 * s,y +  -50.146 * s,x +   27.831 * s,y +  -45.003 * s,x +   26.610 * s,y +  -41.064 * s,x +   26.610 * s,y +  -38.329 * s, threshold);
			_vr.bezier8(x +   26.610 * s,y +  -38.329 * s,x +   26.610 * s,y +  -32.991 * s,x +   29.442 * s,y +  -30.094 * s,x +   35.106 * s,y +  -29.638 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   34.374 * s);
			_setf(o + ( 1 << 2), y +  -25.537 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   34.374 * s,y +  -25.537 * s,x +   26.073 * s,y +  -24.983 * s,x +   21.923 * s,y +  -19.922 * s,x +   21.923 * s,y +  -10.351 * s, threshold);
			_vr.bezier8(x +   21.923 * s,y +  -10.351 * s,x +   21.923 * s,y +   -9.017 * s,x +   22.037 * s,y +   -7.047 * s,x +   22.265 * s,y +   -4.443 * s, threshold);
			_vr.bezier8(x +   22.265 * s,y +   -4.443 * s,x +   22.493 * s,y +   -1.839 * s,x +   22.607 * s,y +    0.114 * s,x +   22.607 * s,y +    1.416 * s, threshold);
			_vr.bezier8(x +   22.607 * s,y +    1.416 * s,x +   22.607 * s,y +    7.340 * s,x +   20.564 * s,y +   12.003 * s,x +   16.479 * s,y +   15.405 * s, threshold);
			_vr.bezier8(x +   16.479 * s,y +   15.405 * s,x +   12.394 * s,y +   18.807 * s,x +    7.031 * s,y +   20.508 * s,x +    0.390 * s,y +   20.508 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   -6.397 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			_setf(o + ( 2 << 2), x +   36.718 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 126:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    6.250 * s);
			_setf(o + ( 1 << 2), y +  -27.148 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +    6.250 * s,y +  -27.148 * s,x +    6.803 * s,y +  -30.208 * s,x +    8.243 * s,y +  -32.812 * s,x +   10.571 * s,y +  -34.960 * s, threshold);
			_vr.bezier8(x +   10.571 * s,y +  -34.960 * s,x +   12.898 * s,y +  -37.109 * s,x +   15.478 * s,y +  -38.183 * s,x +   18.310 * s,y +  -38.183 * s, threshold);
			_vr.bezier8(x +   18.310 * s,y +  -38.183 * s,x +   21.988 * s,y +  -38.183 * s,x +   25.447 * s,y +  -37.101 * s,x +   28.686 * s,y +  -34.936 * s, threshold);
			_vr.bezier8(x +   28.686 * s,y +  -34.936 * s,x +   31.925 * s,y +  -32.771 * s,x +   34.081 * s,y +  -31.689 * s,x +   35.155 * s,y +  -31.689 * s, threshold);
			_vr.bezier8(x +   35.155 * s,y +  -31.689 * s,x +   37.011 * s,y +  -31.689 * s,x +   38.549 * s,y +  -31.974 * s,x +   39.770 * s,y +  -32.543 * s, threshold);
			_vr.bezier8(x +   39.770 * s,y +  -32.543 * s,x +   40.990 * s,y +  -33.113 * s,x +   42.349 * s,y +  -34.505 * s,x +   43.847 * s,y +  -36.718 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   46.239 * s);
			_setf(o + ( 1 << 2), y +  -35.888 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   46.239 * s,y +  -35.888 * s,x +   45.425 * s,y +  -32.633 * s,x +   43.928 * s,y +  -29.882 * s,x +   41.747 * s,y +  -27.636 * s, threshold);
			_vr.bezier8(x +   41.747 * s,y +  -27.636 * s,x +   39.566 * s,y +  -25.390 * s,x +   37.109 * s,y +  -24.267 * s,x +   34.374 * s,y +  -24.267 * s, threshold);
			_vr.bezier8(x +   34.374 * s,y +  -24.267 * s,x +   31.282 * s,y +  -24.267 * s,x +   28.173 * s,y +  -25.236 * s,x +   25.048 * s,y +  -27.172 * s, threshold);
			_vr.bezier8(x +   25.048 * s,y +  -27.172 * s,x +   21.923 * s,y +  -29.109 * s,x +   19.466 * s,y +  -30.078 * s,x +   17.675 * s,y +  -30.078 * s, threshold);
			_vr.bezier8(x +   17.675 * s,y +  -30.078 * s,x +   13.248 * s,y +  -30.078 * s,x +   10.091 * s,y +  -28.776 * s,x +    8.203 * s,y +  -26.171 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    6.250 * s);
			_setf(o + ( 1 << 2), y +  -27.148 * s);
			_setf(o + ( 2 << 2), x +   52.440 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
		}
	}
	#end
}