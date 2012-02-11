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

class TrebuchetMSBoldItalic extends de.polygonal.gl.text.ProportionalVectorFont
{
	public function new()
	{
		#if font_inline
		super(2048, 1923, -455, BOUNDS_TABLE, SPACING_TABLE, KERNING_TABLE);
		#else
		super(
		"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"+
		"77QbbPPUNo+5Ms2V/QMXe5gS");
		#end
	}
	
	#if font_inline
	static var SPACING_TABLE:Array<Int> =
	[
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,  617,  752,  800, 1200, 1200, 1500, 1446,  617,
		 752,  752,  885, 1200,  752,  752,  752,  813, 1200, 1200, 1200, 1200, 1200, 1200, 1200, 1200, 1200, 1200,  752,  752,
		1200, 1200, 1200,  813, 1578, 1257, 1208, 1255, 1295, 1215, 1199, 1385, 1389,  570, 1021, 1331, 1082, 1610, 1352, 1438,
		1195, 1576, 1277, 1027, 1403, 1355, 1399, 1897, 1345, 1400, 1252,  994,  978,  994, 1200, 1200, 1200, 1214, 1215, 1009,
		1215, 1130,  840, 1096, 1151,  669,  794, 1105,  655, 1700, 1151, 1167, 1226, 1226,  915,  940,  897, 1141, 1131, 1584,
		1179, 1155, 1091,  994, 1200,  994, 1200
	];

	static var KERNING_TABLE:Array<Int> =
	[
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,  127,    0,    0,    0,    0,  136,    0,    0,    0,    0,    0,  143,    0,    0,    0,
		 152,    0,  159,    0,  166,    0,  201,  228,    0,  255,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,  284,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,  287,    0,    0,    0,  292,  297,
		   0,  302,    0,    0,    0,    0,    0,    8,   84, -185,   86, -205,   87, -153,   89, -239,    6,   44, -300,   46,
		-300,   65, -293,    8,   84, -299,   86, -313,   87, -266,   89, -365,    6,   44, -344,   46, -344,   65, -212,    6,
		  84, -157,   87, -124,   89, -217,   34,   44, -365,   45, -253,   46, -365,   58, -225,   59, -225,   65, -185,   79,
		-137,   97, -256,   99, -256,  101, -256,  105, -110,  111, -229,  114, -230,  115, -283,  117, -244,  119, -256,  121,
		-256,   26,   44, -308,   45, -123,   46, -308,   58, -149,   59, -149,   65, -205,   97, -169,  101, -169,  105,  -96,
		 111, -169,  114, -130,  117, -117,  121, -117,   26,   44, -350,   45, -136,   46, -350,   58, -163,   59, -163,   65,
		-220,   97, -144,  101, -110,  105,  -71,  111, -110,  114,  -77,  117,  -84,  121,  -97,   28,   44, -325,   45, -225,
		  46, -325,   58, -200,   59, -200,   65, -239,   97, -176,  101, -200,  105, -116,  111, -200,  112, -156,  113, -200,
		 117, -225,  118, -169,    2,  102,  -90,    4,   44, -233,   46, -233,    4,   44, -300,   46, -300,    4,   44, -196,
		  46, -196,    4,   44, -189,   46, -189
	];

	static var BOUNDS_TABLE:Array<Float> =
	[
		  33,      7.959,    -72.802,     35.693,      0.977,
		  34,      7.959,    -71.630,     43.212,    -53.027,
		  35,      3.174,    -72.606,     57.323,      0.977,
		  36,      7.226,    -82.323,     53.954,      8.838,
		  37,      4.980,    -72.802,     73.192,      0.977,
		  38,      5.713,    -72.802,     68.505,      0.977,
		  39,     13.428,    -71.630,     28.662,    -53.027,
		  40,      6.787,    -73.534,     39.355,     22.216,
		  41,     -0.488,    -72.899,     33.007,     22.216,
		  42,      7.178,    -73.729,     45.556,    -37.011,
		  43,      8.008,    -52.685,     51.855,     -8.789,
		  44,      7.373,    -14.502,     26.855,     20.215,
		  45,      4.297,    -34.716,     32.177,    -23.242,
		  46,      9.961,    -14.551,     25.488,      0.977,
		  47,     -0.488,    -71.825,     38.086,          0,
		  48,      4.443,    -72.802,     57.812,      0.977,
		  49,     15.966,    -71.825,     47.509,          0,
		  50,      2.099,    -72.802,     54.540,          0,
		  51,      2.539,    -72.802,     53.319,      0.977,
		  52,      0.879,    -71.825,     56.005,          0,
		  53,      4.785,    -71.825,     56.835,      0.977,
		  54,      5.664,    -72.997,     53.466,      1.221,
		  55,      7.275,    -71.825,     64.159,          0,
		  56,      3.759,    -72.802,     55.614,      0.977,
		  57,      7.324,    -72.802,     55.126,      1.416,
		  58,      8.008,    -52.294,     29.687,      0.977,
		  59,      7.373,    -52.294,     29.687,     20.215,
		  60,      9.374,    -53.759,     48.388,     -8.301,
		  61,      8.741,    -46.191,     52.588,    -15.869,
		  62,     12.939,    -53.759,     51.952,     -8.301,
		  63,      2.734,    -72.802,     39.013,      0.977,
		  64,      2.929,    -65.673,     76.170,      9.033,
		  65,     -4.639,    -72.509,     58.056,          0,
		  66,      2.637,    -72.606,     56.982,      0.586,
		  67,      5.517,    -72.753,     60.448,      1.221,
		  68,      2.099,    -72.655,     62.743,          0,
		  69,      2.051,    -71.532,     61.279,          0,
		  70,      2.002,    -71.532,     62.597,          0,
		  71,      4.101,    -72.753,     64.696,      1.221,
		  72,      2.588,    -71.532,     69.970,          0,
		  73,      3.320,    -71.532,     29.248,          0,
		  74,     -0.440,    -71.532,     50.780,      0.977,
		  75,      3.417,    -71.532,     68.065,          0,
		  76,      2.441,    -71.532,     49.608,          0,
		  77,     -0.781,    -71.532,     73.143,      0.977,
		  78,      2.539,    -71.532,     67.675,      0.977,
		  79,      4.834,    -72.802,     69.090,      1.221,
		  80,      2.393,    -72.509,     59.814,          0,
		  81,      5.664,    -72.802,     81.444,     18.164,
		  82,      2.490,    -72.265,     59.276,          0,
		  83,      2.099,    -72.753,     49.804,      1.221,
		  84,      9.766,    -71.532,     70.019,          0,
		  85,      6.006,    -71.532,     68.554,      1.221,
		  86,     11.621,    -71.532,     73.046,      0.977,
		  87,     10.791,    -71.532,     98.533,      0.977,
		  88,     -1.123,    -71.581,     70.360,          0,
		  89,     12.060,    -71.532,     72.753,          0,
		  90,      4.248,    -71.532,     60.937,          0,
		  91,      3.369,    -73.729,     47.167,     20.508,
		  92,      8.350,    -71.825,     45.263,          0,
		  93,      0.390,    -73.729,     44.188,     20.508,
		  94,     12.842,    -71.825,     52.929,    -44.091,
		  95,     -0.391,      6.103,     58.934,     16.308,
		  96,     23.632,    -79.003,     39.013,    -62.743,
		  97,      3.466,    -53.271,     54.296,      0.977,
		  98,      1.025,    -73.729,     56.444,      0.977,
		  99,      3.662,    -53.271,     47.753,      0.977,
		 100,      3.125,    -73.729,     60.644,      0.977,
		 101,      4.053,    -53.271,     53.906,      0.977,
		 102,     -3.027,    -73.729,     47.802,     20.508,
		 103,          0,    -55.370,     53.612,     20.508,
		 104,      2.051,    -73.729,     53.270,          0,
		 105,      6.982,    -76.708,     31.689,          0,
		 106,     -7.080,    -76.708,     37.597,     20.508,
		 107,      2.929,    -73.729,     51.708,          0,
		 108,      5.078,    -73.729,     29.345,      0.488,
		 109,      1.367,    -53.417,     81.053,          0,
		 110,      1.319,    -53.515,     52.831,          0,
		 111,      3.515,    -53.271,     55.077,      0.977,
		 112,     -1.221,    -53.271,     56.493,     20.508,
		 113,      2.393,    -53.271,     58.153,     20.508,
		 114,      3.369,    -53.271,     46.093,          0,
		 115,      0.489,    -53.271,     44.287,      0.977,
		 116,      8.057,    -68.065,     43.164,      0.977,
		 117,      3.028,    -52.294,     55.078,      0.977,
		 118,      4.541,    -52.294,     58.642,      0.977,
		 119,      4.053,    -52.294,     80.663,      0.977,
		 120,     -0.391,    -52.294,     58.983,          0,
		 121,      2.051,    -52.294,     57.812,     20.508,
		 122,      1.367,    -52.294,     51.855,          0,
		 123,      6.250,    -73.339,     51.366,     20.508,
		 124,     24.658,    -73.729,     34.716,     20.508,
		 125,     -1.709,    -73.339,     43.847,     20.508,
		 126,      8.789,    -36.425,     48.877,    -23.388
	];

	override function _draw(charCode:Int, x:Float, y:Float, s:Float, threshold:Float):Void
	{
		var o = 0;
		switch (charCode)
		{			
			case 33:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   21.582 * s);
			_setf(o + ( 1 << 2), y +  -20.703 * s);
			_setf(o + ( 2 << 2), x +   15.136 * s);
			_setf(o + ( 3 << 2), y +  -20.703 * s);
			_setf(o + ( 4 << 2), x +   15.625 * s);
			_setf(o + ( 5 << 2), y +  -34.326 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   15.625 * s,y +  -34.326 * s,x +   15.752 * s,y +  -37.874 * s,x +   15.975 * s,y +  -41.170 * s,x +   16.284 * s,y +  -44.213 * s, threshold);
			_vr.bezier8(x +   16.284 * s,y +  -44.213 * s,x +   16.593 * s,y +  -47.257 * s,x +   16.948 * s,y +  -49.953 * s,x +   17.382 * s,y +  -52.294 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   21.191 * s);
			_setf(o + ( 1 << 2), y +  -72.802 * s);
			_setf(o + ( 2 << 2), x +   35.693 * s);
			_setf(o + ( 3 << 2), y +  -72.802 * s);
			_setf(o + ( 4 << 2), x +   32.910 * s);
			_setf(o + ( 5 << 2), y +  -56.689 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   32.910 * s,y +  -56.689 * s,x +   32.477 * s,y +  -54.184 * s,x +   30.806 * s,y +  -48.519 * s,x +   27.880 * s,y +  -39.697 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   21.582 * s);
			_setf(o + ( 1 << 2), y +  -20.703 * s);
			_setf(o + ( 2 << 2), x +    7.959 * s);
			_setf(o + ( 3 << 2), y +   -6.885 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_vr.bezier8(x +    7.959 * s,y +   -6.885 * s,x +    7.959 * s,y +   -9.098 * s,x +    8.764 * s,y +  -10.962 * s,x +   10.376 * s,y +  -12.475 * s, threshold);
			_vr.bezier8(x +   10.376 * s,y +  -12.475 * s,x +   11.987 * s,y +  -13.989 * s,x +   13.899 * s,y +  -14.746 * s,x +   16.113 * s,y +  -14.746 * s, threshold);
			_vr.bezier8(x +   16.113 * s,y +  -14.746 * s,x +   18.326 * s,y +  -14.746 * s,x +   20.239 * s,y +  -13.989 * s,x +   21.850 * s,y +  -12.475 * s, threshold);
			_vr.bezier8(x +   21.850 * s,y +  -12.475 * s,x +   23.461 * s,y +  -10.962 * s,x +   24.267 * s,y +   -9.098 * s,x +   24.267 * s,y +   -6.885 * s, threshold);
			_vr.bezier8(x +   24.267 * s,y +   -6.885 * s,x +   24.267 * s,y +   -4.671 * s,x +   23.470 * s,y +   -2.808 * s,x +   21.875 * s,y +   -1.294 * s, threshold);
			_vr.bezier8(x +   21.875 * s,y +   -1.294 * s,x +   20.280 * s,y +    0.220 * s,x +   18.359 * s,y +    0.977 * s,x +   16.113 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   16.113 * s,y +    0.977 * s,x +   13.867 * s,y +    0.977 * s,x +   11.946 * s,y +    0.220 * s,x +   10.351 * s,y +   -1.294 * s, threshold);
			_vr.bezier8(x +   10.351 * s,y +   -1.294 * s,x +    8.756 * s,y +   -2.808 * s,x +    7.959 * s,y +   -4.671 * s,x +    7.959 * s,y +   -6.885 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.718 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 34:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +   37.743 * s);
			_setf(o + ( 1 << 2), y +  -53.027 * s);
			_setf(o + ( 2 << 2), x +   27.978 * s);
			_setf(o + ( 3 << 2), y +  -53.027 * s);
			_setf(o + ( 4 << 2), x +   30.517 * s);
			_setf(o + ( 5 << 2), y +  -71.630 * s);
			_setf(o + ( 6 << 2), x +   43.212 * s);
			_setf(o + ( 7 << 2), y +  -71.630 * s);
			_setf(o + ( 8 << 2), x +   37.743 * s);
			_setf(o + ( 9 << 2), y +  -53.027 * s);
			_setf(o + (10 << 2), x +   17.724 * s);
			_setf(o + (11 << 2), y +  -53.027 * s);
			_setf(o + (12 << 2), x +    7.959 * s);
			_setf(o + (13 << 2), y +  -53.027 * s);
			_setf(o + (14 << 2), x +   10.498 * s);
			_setf(o + (15 << 2), y +  -71.630 * s);
			_setf(o + (16 << 2), x +   23.193 * s);
			_setf(o + (17 << 2), y +  -71.630 * s);
			_setf(o + (18 << 2), x +   17.724 * s);
			_setf(o + (19 << 2), y +  -53.027 * s);
			_setf(o + (20 << 2), x +   39.062 * s);
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
			_setf(o + ( 0 << 2), x +   57.323 * s);
			_setf(o + ( 1 << 2), y +  -44.433 * s);
			_setf(o + ( 2 << 2), x +   46.826 * s);
			_setf(o + ( 3 << 2), y +  -44.433 * s);
			_setf(o + ( 4 << 2), x +   42.724 * s);
			_setf(o + ( 5 << 2), y +  -28.808 * s);
			_setf(o + ( 6 << 2), x +   50.243 * s);
			_setf(o + ( 7 << 2), y +  -28.808 * s);
			_setf(o + ( 8 << 2), x +   50.243 * s);
			_setf(o + ( 9 << 2), y +  -19.970 * s);
			_setf(o + (10 << 2), x +   40.380 * s);
			_setf(o + (11 << 2), y +  -19.970 * s);
			_setf(o + (12 << 2), x +   34.521 * s);
			_setf(o + (13 << 2), y +    0.977 * s);
			_setf(o + (14 << 2), x +   25.000 * s);
			_setf(o + (15 << 2), y +    0.977 * s);
			_setf(o + (16 << 2), x +   30.761 * s);
			_setf(o + (17 << 2), y +  -19.970 * s);
			_setf(o + (18 << 2), x +   19.531 * s);
			_setf(o + (19 << 2), y +  -19.970 * s);
			_setf(o + (20 << 2), x +   13.769 * s);
			_setf(o + (21 << 2), y +    0.977 * s);
			_setf(o + (22 << 2), x +    4.248 * s);
			_setf(o + (23 << 2), y +    0.977 * s);
			_setf(o + (24 << 2), x +   10.010 * s);
			_setf(o + (25 << 2), y +  -19.970 * s);
			_setf(o + (26 << 2), x +    3.174 * s);
			_setf(o + (27 << 2), y +  -19.970 * s);
			_setf(o + (28 << 2), x +    3.174 * s);
			_setf(o + (29 << 2), y +  -28.808 * s);
			_setf(o + (30 << 2), x +   12.402 * s);
			_setf(o + (31 << 2), y +  -28.808 * s);
			_setf(o + (32 << 2), x +   16.455 * s);
			_setf(o + (33 << 2), y +  -44.433 * s);
			_setf(o + (34 << 2), x +    8.789 * s);
			_setf(o + (35 << 2), y +  -44.433 * s);
			_setf(o + (36 << 2), x +    8.789 * s);
			_setf(o + (37 << 2), y +  -53.271 * s);
			_setf(o + (38 << 2), x +   18.799 * s);
			_setf(o + (39 << 2), y +  -53.271 * s);
			_setf(o + (40 << 2), x +   24.072 * s);
			_setf(o + (41 << 2), y +  -72.606 * s);
			_setf(o + (42 << 2), x +   33.496 * s);
			_setf(o + (43 << 2), y +  -72.606 * s);
			_setf(o + (44 << 2), x +   28.369 * s);
			_setf(o + (45 << 2), y +  -53.271 * s);
			_setf(o + (46 << 2), x +   39.550 * s);
			_setf(o + (47 << 2), y +  -53.271 * s);
			_setf(o + (48 << 2), x +   44.824 * s);
			_setf(o + (49 << 2), y +  -72.606 * s);
			_setf(o + (50 << 2), x +   54.247 * s);
			_setf(o + (51 << 2), y +  -72.606 * s);
			_setf(o + (52 << 2), x +   49.169 * s);
			_setf(o + (53 << 2), y +  -53.271 * s);
			_setf(o + (54 << 2), x +   57.323 * s);
			_setf(o + (55 << 2), y +  -53.271 * s);
			_setf(o + (56 << 2), x +   57.323 * s);
			_setf(o + (57 << 2), y +  -44.433 * s);
			_setf(o + (58 << 2), x +   37.548 * s);
			_setf(o + (59 << 2), y +  -44.433 * s);
			_setf(o + (60 << 2), x +   25.976 * s);
			_setf(o + (61 << 2), y +  -44.433 * s);
			_setf(o + (62 << 2), x +   21.875 * s);
			_setf(o + (63 << 2), y +  -28.808 * s);
			_setf(o + (64 << 2), x +   33.349 * s);
			_setf(o + (65 << 2), y +  -28.808 * s);
			_setf(o + (66 << 2), x +   37.548 * s);
			_setf(o + (67 << 2), y +  -44.433 * s);
			_setf(o + (68 << 2), x +   58.593 * s);
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
			_setf(o + ( 0 << 2), x +   50.048 * s);
			_setf(o + ( 1 << 2), y +  -57.616 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   50.048 * s,y +  -57.616 * s,x +   46.532 * s,y +  -60.416 * s,x +   42.691 * s,y +  -61.815 * s,x +   38.525 * s,y +  -61.815 * s, threshold);
			_vr.bezier8(x +   38.525 * s,y +  -61.815 * s,x +   30.680 * s,y +  -61.815 * s,x +   26.757 * s,y +  -58.837 * s,x +   26.757 * s,y +  -52.880 * s, threshold);
			_vr.bezier8(x +   26.757 * s,y +  -52.880 * s,x +   26.757 * s,y +  -50.243 * s,x +   28.835 * s,y +  -47.339 * s,x +   33.007 * s,y +  -44.189 * s, threshold);
			_vr.bezier8(x +   33.007 * s,y +  -44.189 * s,x +   38.145 * s,y +  -40.308 * s,x +   41.731 * s,y +  -37.491 * s,x +   43.749 * s,y +  -35.717 * s, threshold);
			_vr.bezier8(x +   43.749 * s,y +  -35.717 * s,x +   45.767 * s,y +  -33.943 * s,x +   47.452 * s,y +  -31.648 * s,x +   48.803 * s,y +  -28.833 * s, threshold);
			_vr.bezier8(x +   48.803 * s,y +  -28.833 * s,x +   50.154 * s,y +  -26.017 * s,x +   50.829 * s,y +  -22.916 * s,x +   50.829 * s,y +  -19.531 * s, threshold);
			_vr.bezier8(x +   50.829 * s,y +  -19.531 * s,x +   50.829 * s,y +  -13.639 * s,x +   49.023 * s,y +   -8.911 * s,x +   45.409 * s,y +   -5.347 * s, threshold);
			_vr.bezier8(x +   45.409 * s,y +   -5.347 * s,x +   41.796 * s,y +   -1.782 * s,x +   36.767 * s,y +    0.407 * s,x +   30.322 * s,y +    1.221 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   28.906 * s);
			_setf(o + ( 1 << 2), y +    8.838 * s);
			_setf(o + ( 2 << 2), x +   17.822 * s);
			_setf(o + ( 3 << 2), y +    8.838 * s);
			_setf(o + ( 4 << 2), x +   19.238 * s);
			_setf(o + ( 5 << 2), y +    0.977 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   19.238 * s,y +    0.977 * s,x +   14.876 * s,y +    0.293 * s,x +   10.872 * s,y +   -0.928 * s,x +    7.226 * s,y +   -2.686 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   11.328 * s);
			_setf(o + ( 1 << 2), y +  -15.332 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   11.328 * s,y +  -15.332 * s,x +   15.690 * s,y +  -12.012 * s,x +   20.752 * s,y +  -10.351 * s,x +   26.513 * s,y +  -10.351 * s, threshold);
			_vr.bezier8(x +   26.513 * s,y +  -10.351 * s,x +   33.935 * s,y +  -10.351 * s,x +   37.646 * s,y +  -13.232 * s,x +   37.646 * s,y +  -18.994 * s, threshold);
			_vr.bezier8(x +   37.646 * s,y +  -18.994 * s,x +   37.646 * s,y +  -20.589 * s,x +   37.141 * s,y +  -22.176 * s,x +   36.132 * s,y +  -23.755 * s, threshold);
			_vr.bezier8(x +   36.132 * s,y +  -23.755 * s,x +   35.123 * s,y +  -25.333 * s,x +   33.683 * s,y +  -26.871 * s,x +   31.811 * s,y +  -28.369 * s, threshold);
			_vr.bezier8(x +   31.811 * s,y +  -28.369 * s,x +   29.939 * s,y +  -29.866 * s,x +   25.960 * s,y +  -32.958 * s,x +   19.873 * s,y +  -37.646 * s, threshold);
			_vr.bezier8(x +   19.873 * s,y +  -37.646 * s,x +   15.706 * s,y +  -41.715 * s,x +   13.623 * s,y +  -46.353 * s,x +   13.623 * s,y +  -51.562 * s, threshold);
			_vr.bezier8(x +   13.623 * s,y +  -51.562 * s,x +   13.623 * s,y +  -57.128 * s,x +   15.218 * s,y +  -61.775 * s,x +   18.408 * s,y +  -65.502 * s, threshold);
			_vr.bezier8(x +   18.408 * s,y +  -65.502 * s,x +   21.598 * s,y +  -69.229 * s,x +   26.009 * s,y +  -71.597 * s,x +   31.640 * s,y +  -72.606 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   33.447 * s);
			_setf(o + ( 1 << 2), y +  -82.323 * s);
			_setf(o + ( 2 << 2), x +   44.530 * s);
			_setf(o + ( 3 << 2), y +  -82.323 * s);
			_setf(o + ( 4 << 2), x +   42.773 * s);
			_setf(o + ( 5 << 2), y +  -72.850 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   42.773 * s,y +  -72.850 * s,x +   47.753 * s,y +  -72.492 * s,x +   51.480 * s,y +  -71.695 * s,x +   53.954 * s,y +  -70.458 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   50.048 * s);
			_setf(o + ( 1 << 2), y +  -57.616 * s);
			_setf(o + ( 2 << 2), x +   58.593 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 37:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    9.716 * s);
			_setf(o + ( 1 << 2), y +  -50.146 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +    9.716 * s,y +  -50.146 * s,x +    9.716 * s,y +  -56.493 * s,x +   11.490 * s,y +  -61.856 * s,x +   15.039 * s,y +  -66.234 * s, threshold);
			_vr.bezier8(x +   15.039 * s,y +  -66.234 * s,x +   18.587 * s,y +  -70.613 * s,x +   23.226 * s,y +  -72.802 * s,x +   28.954 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   28.954 * s,y +  -72.802 * s,x +   37.092 * s,y +  -72.802 * s,x +   41.161 * s,y +  -68.423 * s,x +   41.161 * s,y +  -59.667 * s, threshold);
			_vr.bezier8(x +   41.161 * s,y +  -59.667 * s,x +   41.161 * s,y +  -53.580 * s,x +   39.412 * s,y +  -48.364 * s,x +   35.912 * s,y +  -44.018 * s, threshold);
			_vr.bezier8(x +   35.912 * s,y +  -44.018 * s,x +   32.413 * s,y +  -39.672 * s,x +   27.880 * s,y +  -37.499 * s,x +   22.314 * s,y +  -37.499 * s, threshold);
			_vr.bezier8(x +   22.314 * s,y +  -37.499 * s,x +   13.916 * s,y +  -37.499 * s,x +    9.716 * s,y +  -41.715 * s,x +    9.716 * s,y +  -50.146 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   19.433 * s);
			_setf(o + ( 1 << 2), y +  -51.659 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   19.433 * s,y +  -51.659 * s,x +   19.433 * s,y +  -47.558 * s,x +   20.719 * s,y +  -45.507 * s,x +   23.290 * s,y +  -45.507 * s, threshold);
			_vr.bezier8(x +   23.290 * s,y +  -45.507 * s,x +   25.960 * s,y +  -45.507 * s,x +   28.019 * s,y +  -46.858 * s,x +   29.467 * s,y +  -49.560 * s, threshold);
			_vr.bezier8(x +   29.467 * s,y +  -49.560 * s,x +   30.916 * s,y +  -52.262 * s,x +   31.640 * s,y +  -55.517 * s,x +   31.640 * s,y +  -59.325 * s, threshold);
			_vr.bezier8(x +   31.640 * s,y +  -59.325 * s,x +   31.640 * s,y +  -62.971 * s,x +   30.240 * s,y +  -64.794 * s,x +   27.441 * s,y +  -64.794 * s, threshold);
			_vr.bezier8(x +   27.441 * s,y +  -64.794 * s,x +   24.999 * s,y +  -64.794 * s,x +   23.054 * s,y +  -63.467 * s,x +   21.606 * s,y +  -60.814 * s, threshold);
			_vr.bezier8(x +   21.606 * s,y +  -60.814 * s,x +   20.157 * s,y +  -58.162 * s,x +   19.433 * s,y +  -55.110 * s,x +   19.433 * s,y +  -51.659 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   15.136 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			_setf(o + ( 2 << 2), x +    4.980 * s);
			_setf(o + ( 3 << 2), y +    0.977 * s);
			_setf(o + ( 4 << 2), x +   63.085 * s);
			_setf(o + ( 5 << 2), y +  -72.802 * s);
			_setf(o + ( 6 << 2), x +   73.192 * s);
			_setf(o + ( 7 << 2), y +  -72.802 * s);
			_setf(o + ( 8 << 2), x +   15.136 * s);
			_setf(o + ( 9 << 2), y +    0.977 * s);
			_setf(o + (10 << 2), x +   37.597 * s);
			_setf(o + (11 << 2), y +  -11.719 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_vr.bezier8(x +   37.597 * s,y +  -11.719 * s,x +   37.597 * s,y +  -18.099 * s,x +   39.379 * s,y +  -23.462 * s,x +   42.943 * s,y +  -27.807 * s, threshold);
			_vr.bezier8(x +   42.943 * s,y +  -27.807 * s,x +   46.508 * s,y +  -32.153 * s,x +   51.155 * s,y +  -34.326 * s,x +   56.884 * s,y +  -34.326 * s, threshold);
			_vr.bezier8(x +   56.884 * s,y +  -34.326 * s,x +   64.989 * s,y +  -34.326 * s,x +   69.042 * s,y +  -29.947 * s,x +   69.042 * s,y +  -21.191 * s, threshold);
			_vr.bezier8(x +   69.042 * s,y +  -21.191 * s,x +   69.042 * s,y +  -15.104 * s,x +   67.292 * s,y +   -9.888 * s,x +   63.793 * s,y +   -5.542 * s, threshold);
			_vr.bezier8(x +   63.793 * s,y +   -5.542 * s,x +   60.293 * s,y +   -1.196 * s,x +   55.761 * s,y +    0.977 * s,x +   50.194 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   50.194 * s,y +    0.977 * s,x +   41.796 * s,y +    0.977 * s,x +   37.597 * s,y +   -3.255 * s,x +   37.597 * s,y +  -11.719 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   47.313 * s);
			_setf(o + ( 1 << 2), y +  -13.232 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   47.313 * s,y +  -13.232 * s,x +   47.313 * s,y +   -9.098 * s,x +   48.599 * s,y +   -7.031 * s,x +   51.171 * s,y +   -7.031 * s, threshold);
			_vr.bezier8(x +   51.171 * s,y +   -7.031 * s,x +   53.840 * s,y +   -7.031 * s,x +   55.899 * s,y +   -8.382 * s,x +   57.348 * s,y +  -11.084 * s, threshold);
			_vr.bezier8(x +   57.348 * s,y +  -11.084 * s,x +   58.796 * s,y +  -13.786 * s,x +   59.520 * s,y +  -17.057 * s,x +   59.520 * s,y +  -20.898 * s, threshold);
			_vr.bezier8(x +   59.520 * s,y +  -20.898 * s,x +   59.520 * s,y +  -24.511 * s,x +   58.121 * s,y +  -26.318 * s,x +   55.321 * s,y +  -26.318 * s, threshold);
			_vr.bezier8(x +   55.321 * s,y +  -26.318 * s,x +   52.847 * s,y +  -26.318 * s,x +   50.894 * s,y +  -24.983 * s,x +   49.462 * s,y +  -22.314 * s, threshold);
			_vr.bezier8(x +   49.462 * s,y +  -22.314 * s,x +   48.030 * s,y +  -19.645 * s,x +   47.313 * s,y +  -16.618 * s,x +   47.313 * s,y +  -13.232 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   73.241 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 38:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   66.698 * s);
			_setf(o + ( 1 << 2), y +  -33.740 * s);
			_setf(o + ( 2 << 2), x +   54.491 * s);
			_setf(o + ( 3 << 2), y +  -33.740 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   54.491 * s,y +  -33.740 * s,x +   53.189 * s,y +  -27.946 * s,x +   52.335 * s,y +  -23.803 * s,x +   51.928 * s,y +  -21.313 * s, threshold);
			_vr.bezier8(x +   51.928 * s,y +  -21.313 * s,x +   51.521 * s,y +  -18.823 * s,x +   51.317 * s,y +  -16.520 * s,x +   51.317 * s,y +  -14.404 * s, threshold);
			_vr.bezier8(x +   51.317 * s,y +  -14.404 * s,x +   51.317 * s,y +  -11.247 * s,x +   52.717 * s,y +   -9.668 * s,x +   55.517 * s,y +   -9.668 * s, threshold);
			_vr.bezier8(x +   55.517 * s,y +   -9.668 * s,x +   57.763 * s,y +   -9.668 * s,x +   60.643 * s,y +  -10.937 * s,x +   64.159 * s,y +  -13.476 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   64.159 * s);
			_setf(o + ( 1 << 2), y +   -1.416 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   64.159 * s,y +   -1.416 * s,x +   60.871 * s,y +    0.179 * s,x +   56.753 * s,y +    0.977 * s,x +   51.806 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   51.806 * s,y +    0.977 * s,x +   47.769 * s,y +    0.977 * s,x +   44.628 * s,y +   -0.049 * s,x +   42.382 * s,y +   -2.100 * s, threshold);
			_vr.bezier8(x +   42.382 * s,y +   -2.100 * s,x +   37.271 * s,y +   -0.049 * s,x +   31.786 * s,y +    0.977 * s,x +   25.927 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   25.927 * s,y +    0.977 * s,x +   19.873 * s,y +    0.977 * s,x +   14.990 * s,y +   -0.594 * s,x +   11.279 * s,y +   -3.735 * s, threshold);
			_vr.bezier8(x +   11.279 * s,y +   -3.735 * s,x +    7.568 * s,y +   -6.877 * s,x +    5.713 * s,y +  -11.214 * s,x +    5.713 * s,y +  -16.748 * s, threshold);
			_vr.bezier8(x +    5.713 * s,y +  -16.748 * s,x +    5.713 * s,y +  -26.090 * s,x +    9.440 * s,y +  -34.016 * s,x +   16.894 * s,y +  -40.527 * s, threshold);
			_vr.bezier8(x +   16.894 * s,y +  -40.527 * s,x +   14.127 * s,y +  -44.075 * s,x +   12.744 * s,y +  -47.590 * s,x +   12.744 * s,y +  -51.073 * s, threshold);
			_vr.bezier8(x +   12.744 * s,y +  -51.073 * s,x +   12.744 * s,y +  -57.877 * s,x +   15.079 * s,y +  -63.199 * s,x +   19.751 * s,y +  -67.040 * s, threshold);
			_vr.bezier8(x +   19.751 * s,y +  -67.040 * s,x +   24.422 * s,y +  -70.881 * s,x +   30.615 * s,y +  -72.802 * s,x +   38.329 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   38.329 * s,y +  -72.802 * s,x +   44.189 * s,y +  -72.802 * s,x +   48.795 * s,y +  -71.793 * s,x +   52.147 * s,y +  -69.774 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   48.974 * s);
			_setf(o + ( 1 << 2), y +  -58.983 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   48.974 * s,y +  -58.983 * s,x +   45.979 * s,y +  -61.718 * s,x +   42.512 * s,y +  -63.085 * s,x +   38.573 * s,y +  -63.085 * s, threshold);
			_vr.bezier8(x +   38.573 * s,y +  -63.085 * s,x +   34.277 * s,y +  -63.085 * s,x +   30.891 * s,y +  -62.035 * s,x +   28.417 * s,y +  -59.936 * s, threshold);
			_vr.bezier8(x +   28.417 * s,y +  -59.936 * s,x +   25.943 * s,y +  -57.836 * s,x +   24.706 * s,y +  -54.833 * s,x +   24.706 * s,y +  -50.927 * s, threshold);
			_vr.bezier8(x +   24.706 * s,y +  -50.927 * s,x +   24.706 * s,y +  -48.290 * s,x +   25.748 * s,y +  -46.012 * s,x +   27.831 * s,y +  -44.091 * s, threshold);
			o = _posf(14);
			_setf(o + ( 0 << 2), x +   44.286 * s);
			_setf(o + ( 1 << 2), y +  -44.091 * s);
			_setf(o + ( 2 << 2), x +   45.849 * s);
			_setf(o + ( 3 << 2), y +  -52.538 * s);
			_setf(o + ( 4 << 2), x +   58.397 * s);
			_setf(o + ( 5 << 2), y +  -54.345 * s);
			_setf(o + ( 6 << 2), x +   56.395 * s);
			_setf(o + ( 7 << 2), y +  -43.945 * s);
			_setf(o + ( 8 << 2), x +   68.505 * s);
			_setf(o + ( 9 << 2), y +  -43.945 * s);
			_setf(o + (10 << 2), x +   66.698 * s);
			_setf(o + (11 << 2), y +  -33.740 * s);
			_setf(o + (12 << 2), x +   24.999 * s);
			_setf(o + (13 << 2), y +  -33.740 * s);
			o = _posb(7);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 1);
			_vr.bezier8(x +   24.999 * s,y +  -33.740 * s,x +   20.670 * s,y +  -29.248 * s,x +   18.505 * s,y +  -24.251 * s,x +   18.505 * s,y +  -18.750 * s, threshold);
			_vr.bezier8(x +   18.505 * s,y +  -18.750 * s,x +   18.505 * s,y +  -12.695 * s,x +   22.249 * s,y +   -9.668 * s,x +   29.736 * s,y +   -9.668 * s, threshold);
			_vr.bezier8(x +   29.736 * s,y +   -9.668 * s,x +   33.447 * s,y +   -9.668 * s,x +   36.441 * s,y +  -10.254 * s,x +   38.720 * s,y +  -11.426 * s, threshold);
			_vr.bezier8(x +   38.720 * s,y +  -11.426 * s,x +   38.720 * s,y +  -12.890 * s,x +   38.884 * s,y +  -14.501 * s,x +   39.208 * s,y +  -16.260 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   42.431 * s);
			_setf(o + ( 1 << 2), y +  -33.740 * s);
			_setf(o + ( 2 << 2), x +   24.999 * s);
			_setf(o + ( 3 << 2), y +  -33.740 * s);
			_setf(o + ( 4 << 2), x +   70.604 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 39:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   23.193 * s);
			_setf(o + ( 1 << 2), y +  -53.027 * s);
			_setf(o + ( 2 << 2), x +   13.428 * s);
			_setf(o + ( 3 << 2), y +  -53.027 * s);
			_setf(o + ( 4 << 2), x +   15.967 * s);
			_setf(o + ( 5 << 2), y +  -71.630 * s);
			_setf(o + ( 6 << 2), x +   28.662 * s);
			_setf(o + ( 7 << 2), y +  -71.630 * s);
			_setf(o + ( 8 << 2), x +   23.193 * s);
			_setf(o + ( 9 << 2), y +  -53.027 * s);
			_setf(o + (10 << 2), x +   30.127 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 40:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   24.169 * s);
			_setf(o + ( 1 << 2), y +   22.216 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   24.169 * s,y +   22.216 * s,x +   12.581 * s,y +   13.623 * s,x +    6.787 * s,y +    1.433 * s,x +    6.787 * s,y +  -14.355 * s, threshold);
			_vr.bezier8(x +    6.787 * s,y +  -14.355 * s,x +    6.787 * s,y +  -26.074 * s,x +    9.847 * s,y +  -37.630 * s,x +   15.966 * s,y +  -49.023 * s, threshold);
			_vr.bezier8(x +   15.966 * s,y +  -49.023 * s,x +   22.086 * s,y +  -60.416 * s,x +   29.882 * s,y +  -68.586 * s,x +   39.355 * s,y +  -73.534 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   39.355 * s);
			_setf(o + ( 1 << 2), y +  -66.210 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   39.355 * s,y +  -66.210 * s,x +   26.594 * s,y +  -52.734 * s,x +   20.214 * s,y +  -32.453 * s,x +   20.214 * s,y +   -5.371 * s, threshold);
			_vr.bezier8(x +   20.214 * s,y +   -5.371 * s,x +   20.214 * s,y +    2.116 * s,x +   21.533 * s,y +    8.415 * s,x +   24.169 * s,y +   13.525 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   24.169 * s);
			_setf(o + ( 1 << 2), y +   22.216 * s);
			_setf(o + ( 2 << 2), x +   36.718 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 41:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   -0.488 * s);
			_setf(o + ( 1 << 2), y +   22.216 * s);
			_setf(o + ( 2 << 2), x +   -0.488 * s);
			_setf(o + ( 3 << 2), y +   13.476 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   -0.488 * s,y +   13.476 * s,x +    5.436 * s,y +    8.984 * s,x +   10.254 * s,y +    0.757 * s,x +   13.965 * s,y +  -11.206 * s, threshold);
			_vr.bezier8(x +   13.965 * s,y +  -11.206 * s,x +   17.675 * s,y +  -23.169 * s,x +   19.531 * s,y +  -34.651 * s,x +   19.531 * s,y +  -45.654 * s, threshold);
			_vr.bezier8(x +   19.531 * s,y +  -45.654 * s,x +   19.531 * s,y +  -53.824 * s,x +   18.082 * s,y +  -60.627 * s,x +   15.185 * s,y +  -66.063 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   15.185 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   15.185 * s,y +  -72.899 * s,x +   20.947 * s,y +  -70.458 * s,x +   25.358 * s,y +  -66.015 * s,x +   28.417 * s,y +  -59.569 * s, threshold);
			_vr.bezier8(x +   28.417 * s,y +  -59.569 * s,x +   31.477 * s,y +  -53.124 * s,x +   33.007 * s,y +  -45.507 * s,x +   33.007 * s,y +  -36.718 * s, threshold);
			_vr.bezier8(x +   33.007 * s,y +  -36.718 * s,x +   33.007 * s,y +  -25.000 * s,x +   29.939 * s,y +  -13.761 * s,x +   23.803 * s,y +   -3.003 * s, threshold);
			_vr.bezier8(x +   23.803 * s,y +   -3.003 * s,x +   17.667 * s,y +    7.755 * s,x +    9.570 * s,y +   16.162 * s,x +   -0.488 * s,y +   22.216 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.718 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 42:
			
			o = _posf(54);
			_setf(o + ( 0 << 2), x +   38.183 * s);
			_setf(o + ( 1 << 2), y +  -53.808 * s);
			_setf(o + ( 2 << 2), x +   31.689 * s);
			_setf(o + ( 3 << 2), y +  -53.271 * s);
			_setf(o + ( 4 << 2), x +   38.378 * s);
			_setf(o + ( 5 << 2), y +  -49.462 * s);
			_setf(o + ( 6 << 2), x +   42.578 * s);
			_setf(o + ( 7 << 2), y +  -44.042 * s);
			_setf(o + ( 8 << 2), x +   33.154 * s);
			_setf(o + ( 9 << 2), y +  -37.011 * s);
			_setf(o + (10 << 2), x +   29.052 * s);
			_setf(o + (11 << 2), y +  -42.968 * s);
			_setf(o + (12 << 2), x +   26.465 * s);
			_setf(o + (13 << 2), y +  -49.218 * s);
			_setf(o + (14 << 2), x +   24.023 * s);
			_setf(o + (15 << 2), y +  -43.652 * s);
			_setf(o + (16 << 2), x +   18.603 * s);
			_setf(o + (17 << 2), y +  -37.011 * s);
			_setf(o + (18 << 2), x +   10.205 * s);
			_setf(o + (19 << 2), y +  -44.531 * s);
			_setf(o + (20 << 2), x +   16.015 * s);
			_setf(o + (21 << 2), y +  -50.146 * s);
			_setf(o + (22 << 2), x +   21.386 * s);
			_setf(o + (23 << 2), y +  -52.929 * s);
			_setf(o + (24 << 2), x +   14.795 * s);
			_setf(o + (25 << 2), y +  -53.515 * s);
			_setf(o + (26 << 2), x +    7.178 * s);
			_setf(o + (27 << 2), y +  -56.542 * s);
			_setf(o + (28 << 2), x +   11.963 * s);
			_setf(o + (29 << 2), y +  -66.552 * s);
			_setf(o + (30 << 2), x +   19.677 * s);
			_setf(o + (31 << 2), y +  -63.280 * s);
			_setf(o + (32 << 2), x +   23.144 * s);
			_setf(o + (33 << 2), y +  -59.569 * s);
			_setf(o + (34 << 2), x +   20.508 * s);
			_setf(o + (35 << 2), y +  -67.138 * s);
			_setf(o + (36 << 2), x +   20.508 * s);
			_setf(o + (37 << 2), y +  -73.729 * s);
			_setf(o + (38 << 2), x +   32.031 * s);
			_setf(o + (39 << 2), y +  -73.729 * s);
			_setf(o + (40 << 2), x +   32.031 * s);
			_setf(o + (41 << 2), y +  -67.333 * s);
			_setf(o + (42 << 2), x +   29.785 * s);
			_setf(o + (43 << 2), y +  -59.423 * s);
			_setf(o + (44 << 2), x +   34.668 * s);
			_setf(o + (45 << 2), y +  -63.769 * s);
			_setf(o + (46 << 2), x +   41.552 * s);
			_setf(o + (47 << 2), y +  -66.796 * s);
			_setf(o + (48 << 2), x +   45.556 * s);
			_setf(o + (49 << 2), y +  -56.982 * s);
			_setf(o + (50 << 2), x +   38.183 * s);
			_setf(o + (51 << 2), y +  -53.808 * s);
			_setf(o + (52 << 2), x +   43.212 * s);
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
			_setf(o + ( 0 << 2), x +   34.814 * s);
			_setf(o + ( 1 << 2), y +  -26.123 * s);
			_setf(o + ( 2 << 2), x +   34.814 * s);
			_setf(o + ( 3 << 2), y +   -8.789 * s);
			_setf(o + ( 4 << 2), x +   25.000 * s);
			_setf(o + ( 5 << 2), y +   -8.789 * s);
			_setf(o + ( 6 << 2), x +   25.000 * s);
			_setf(o + ( 7 << 2), y +  -26.123 * s);
			_setf(o + ( 8 << 2), x +    8.008 * s);
			_setf(o + ( 9 << 2), y +  -26.123 * s);
			_setf(o + (10 << 2), x +    8.008 * s);
			_setf(o + (11 << 2), y +  -35.937 * s);
			_setf(o + (12 << 2), x +   25.000 * s);
			_setf(o + (13 << 2), y +  -35.937 * s);
			_setf(o + (14 << 2), x +   25.000 * s);
			_setf(o + (15 << 2), y +  -52.685 * s);
			_setf(o + (16 << 2), x +   34.814 * s);
			_setf(o + (17 << 2), y +  -52.685 * s);
			_setf(o + (18 << 2), x +   34.814 * s);
			_setf(o + (19 << 2), y +  -35.937 * s);
			_setf(o + (20 << 2), x +   51.855 * s);
			_setf(o + (21 << 2), y +  -35.937 * s);
			_setf(o + (22 << 2), x +   51.855 * s);
			_setf(o + (23 << 2), y +  -26.123 * s);
			_setf(o + (24 << 2), x +   34.814 * s);
			_setf(o + (25 << 2), y +  -26.123 * s);
			_setf(o + (26 << 2), x +   58.593 * s);
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
			_setf(o + ( 0 << 2), x +   11.133 * s);
			_setf(o + ( 1 << 2), y +   20.215 * s);
			_setf(o + ( 2 << 2), x +    7.373 * s);
			_setf(o + ( 3 << 2), y +   15.283 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    7.373 * s,y +   15.283 * s,x +   12.549 * s,y +   11.474 * s,x +   15.136 * s,y +    7.194 * s,x +   15.136 * s,y +    2.441 * s, threshold);
			_vr.bezier8(x +   15.136 * s,y +    2.441 * s,x +   15.136 * s,y +    0.619 * s,x +   14.192 * s,y +   -1.025 * s,x +   12.305 * s,y +   -2.490 * s, threshold);
			_vr.bezier8(x +   12.305 * s,y +   -2.490 * s,x +   10.416 * s,y +   -3.955 * s,x +    9.473 * s,y +   -5.534 * s,x +    9.473 * s,y +   -7.226 * s, threshold);
			_vr.bezier8(x +    9.473 * s,y +   -7.226 * s,x +    9.473 * s,y +   -9.342 * s,x +   10.335 * s,y +  -11.084 * s,x +   12.060 * s,y +  -12.451 * s, threshold);
			_vr.bezier8(x +   12.060 * s,y +  -12.451 * s,x +   13.786 * s,y +  -13.818 * s,x +   15.836 * s,y +  -14.502 * s,x +   18.213 * s,y +  -14.502 * s, threshold);
			_vr.bezier8(x +   18.213 * s,y +  -14.502 * s,x +   20.524 * s,y +  -14.502 * s,x +   22.542 * s,y +  -13.558 * s,x +   24.267 * s,y +  -11.670 * s, threshold);
			_vr.bezier8(x +   24.267 * s,y +  -11.670 * s,x +   25.992 * s,y +   -9.782 * s,x +   26.855 * s,y +   -7.617 * s,x +   26.855 * s,y +   -5.176 * s, threshold);
			_vr.bezier8(x +   26.855 * s,y +   -5.176 * s,x +   26.855 * s,y +    4.655 * s,x +   21.614 * s,y +   13.118 * s,x +   11.133 * s,y +   20.215 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.718 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 45:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +    4.297 * s);
			_setf(o + ( 1 << 2), y +  -23.242 * s);
			_setf(o + ( 2 << 2), x +    6.348 * s);
			_setf(o + ( 3 << 2), y +  -34.716 * s);
			_setf(o + ( 4 << 2), x +   32.177 * s);
			_setf(o + ( 5 << 2), y +  -34.716 * s);
			_setf(o + ( 6 << 2), x +   30.127 * s);
			_setf(o + ( 7 << 2), y +  -23.242 * s);
			_setf(o + ( 8 << 2), x +    4.297 * s);
			_setf(o + ( 9 << 2), y +  -23.242 * s);
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
			_setf(o + ( 0 << 2), x +    9.961 * s);
			_setf(o + ( 1 << 2), y +   -6.787 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +    9.961 * s,y +   -6.787 * s,x +    9.961 * s,y +   -8.935 * s,x +   10.718 * s,y +  -10.766 * s,x +   12.231 * s,y +  -12.280 * s, threshold);
			_vr.bezier8(x +   12.231 * s,y +  -12.280 * s,x +   13.745 * s,y +  -13.794 * s,x +   15.576 * s,y +  -14.551 * s,x +   17.725 * s,y +  -14.551 * s, threshold);
			_vr.bezier8(x +   17.725 * s,y +  -14.551 * s,x +   19.873 * s,y +  -14.551 * s,x +   21.704 * s,y +  -13.794 * s,x +   23.218 * s,y +  -12.280 * s, threshold);
			_vr.bezier8(x +   23.218 * s,y +  -12.280 * s,x +   24.731 * s,y +  -10.766 * s,x +   25.488 * s,y +   -8.935 * s,x +   25.488 * s,y +   -6.787 * s, threshold);
			_vr.bezier8(x +   25.488 * s,y +   -6.787 * s,x +   25.488 * s,y +   -4.639 * s,x +   24.731 * s,y +   -2.808 * s,x +   23.218 * s,y +   -1.294 * s, threshold);
			_vr.bezier8(x +   23.218 * s,y +   -1.294 * s,x +   21.704 * s,y +    0.220 * s,x +   19.873 * s,y +    0.977 * s,x +   17.725 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   17.725 * s,y +    0.977 * s,x +   15.576 * s,y +    0.977 * s,x +   13.745 * s,y +    0.220 * s,x +   12.231 * s,y +   -1.294 * s, threshold);
			_vr.bezier8(x +   12.231 * s,y +   -1.294 * s,x +   10.718 * s,y +   -2.808 * s,x +    9.961 * s,y +   -4.639 * s,x +    9.961 * s,y +   -6.787 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.718 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 47:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   11.035 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   -0.488 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   26.660 * s);
			_setf(o + ( 5 << 2), y +  -71.825 * s);
			_setf(o + ( 6 << 2), x +   38.086 * s);
			_setf(o + ( 7 << 2), y +  -71.825 * s);
			_setf(o + ( 8 << 2), x +   11.035 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   39.697 * s);
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
			_setf(o + ( 0 << 2), x +    4.443 * s);
			_setf(o + ( 1 << 2), y +  -20.996 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +    4.443 * s,y +  -20.996 * s,x +    4.443 * s,y +  -35.904 * s,x +    7.389 * s,y +  -48.266 * s,x +   13.281 * s,y +  -58.080 * s, threshold);
			_vr.bezier8(x +   13.281 * s,y +  -58.080 * s,x +   19.173 * s,y +  -67.894 * s,x +   27.457 * s,y +  -72.802 * s,x +   38.134 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   38.134 * s,y +  -72.802 * s,x +   51.253 * s,y +  -72.802 * s,x +   57.812 * s,y +  -65.722 * s,x +   57.812 * s,y +  -51.562 * s, threshold);
			_vr.bezier8(x +   57.812 * s,y +  -51.562 * s,x +   57.812 * s,y +  -35.383 * s,x +   54.988 * s,y +  -22.583 * s,x +   49.340 * s,y +  -13.159 * s, threshold);
			_vr.bezier8(x +   49.340 * s,y +  -13.159 * s,x +   43.692 * s,y +   -3.735 * s,x +   35.400 * s,y +    0.977 * s,x +   24.463 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   24.463 * s,y +    0.977 * s,x +   18.115 * s,y +    0.977 * s,x +   13.192 * s,y +   -0.968 * s,x +    9.692 * s,y +   -4.858 * s, threshold);
			_vr.bezier8(x +    9.692 * s,y +   -4.858 * s,x +    6.193 * s,y +   -8.748 * s,x +    4.443 * s,y +  -14.128 * s,x +    4.443 * s,y +  -20.996 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   17.627 * s);
			_setf(o + ( 1 << 2), y +  -22.754 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   17.627 * s,y +  -22.754 * s,x +   17.627 * s,y +  -14.388 * s,x +   20.166 * s,y +  -10.205 * s,x +   25.244 * s,y +  -10.205 * s, threshold);
			_vr.bezier8(x +   25.244 * s,y +  -10.205 * s,x +   31.494 * s,y +  -10.205 * s,x +   36.279 * s,y +  -14.111 * s,x +   39.599 * s,y +  -21.923 * s, threshold);
			_vr.bezier8(x +   39.599 * s,y +  -21.923 * s,x +   42.919 * s,y +  -29.736 * s,x +   44.579 * s,y +  -39.323 * s,x +   44.579 * s,y +  -50.683 * s, threshold);
			_vr.bezier8(x +   44.579 * s,y +  -50.683 * s,x +   44.579 * s,y +  -57.974 * s,x +   41.878 * s,y +  -61.620 * s,x +   36.474 * s,y +  -61.620 * s, threshold);
			_vr.bezier8(x +   36.474 * s,y +  -61.620 * s,x +   30.745 * s,y +  -61.620 * s,x +   26.172 * s,y +  -57.462 * s,x +   22.754 * s,y +  -49.145 * s, threshold);
			_vr.bezier8(x +   22.754 * s,y +  -49.145 * s,x +   19.336 * s,y +  -40.828 * s,x +   17.627 * s,y +  -32.031 * s,x +   17.627 * s,y +  -22.754 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.593 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 49:
			
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   34.228 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   20.996 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   30.273 * s);
			_setf(o + ( 5 << 2), y +  -49.999 * s);
			_setf(o + ( 6 << 2), x +   15.966 * s);
			_setf(o + ( 7 << 2), y +  -43.017 * s);
			_setf(o + ( 8 << 2), x +   17.920 * s);
			_setf(o + ( 9 << 2), y +  -55.956 * s);
			o = _posb(5);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   17.920 * s,y +  -55.956 * s,x +   29.508 * s,y +  -61.099 * s,x +   37.418 * s,y +  -66.389 * s,x +   41.650 * s,y +  -71.825 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   47.509 * s);
			_setf(o + ( 1 << 2), y +  -71.825 * s);
			_setf(o + ( 2 << 2), x +   34.228 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   58.593 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 50:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   25.195 * s);
			_setf(o + ( 1 << 2), y +  -11.670 * s);
			_setf(o + ( 2 << 2), x +   50.780 * s);
			_setf(o + ( 3 << 2), y +  -11.670 * s);
			_setf(o + ( 4 << 2), x +   48.583 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    2.099 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    2.099 * s);
			_setf(o + ( 9 << 2), y +   -4.101 * s);
			_setf(o + (10 << 2), x +   30.517 * s);
			_setf(o + (11 << 2), y +  -37.451 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_vr.bezier8(x +   30.517 * s,y +  -37.451 * s,x +   34.980 * s,y +  -42.688 * s,x +   37.621 * s,y +  -45.930 * s,x +   38.451 * s,y +  -47.167 * s, threshold);
			_vr.bezier8(x +   38.451 * s,y +  -47.167 * s,x +   39.281 * s,y +  -48.404 * s,x +   39.981 * s,y +  -49.771 * s,x +   40.551 * s,y +  -51.269 * s, threshold);
			_vr.bezier8(x +   40.551 * s,y +  -51.269 * s,x +   41.121 * s,y +  -52.766 * s,x +   41.405 * s,y +  -54.166 * s,x +   41.405 * s,y +  -55.468 * s, threshold);
			_vr.bezier8(x +   41.405 * s,y +  -55.468 * s,x +   41.405 * s,y +  -59.797 * s,x +   38.167 * s,y +  -61.962 * s,x +   31.689 * s,y +  -61.962 * s, threshold);
			_vr.bezier8(x +   31.689 * s,y +  -61.962 * s,x +   27.685 * s,y +  -61.962 * s,x +   23.974 * s,y +  -59.521 * s,x +   20.556 * s,y +  -54.638 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   11.572 * s);
			_setf(o + ( 1 << 2), y +  -60.595 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   11.572 * s,y +  -60.595 * s,x +   15.348 * s,y +  -68.733 * s,x +   22.444 * s,y +  -72.802 * s,x +   32.861 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   32.861 * s,y +  -72.802 * s,x +   39.501 * s,y +  -72.802 * s,x +   44.774 * s,y +  -71.345 * s,x +   48.681 * s,y +  -68.432 * s, threshold);
			_vr.bezier8(x +   48.681 * s,y +  -68.432 * s,x +   52.587 * s,y +  -65.518 * s,x +   54.540 * s,y +  -61.376 * s,x +   54.540 * s,y +  -56.005 * s, threshold);
			_vr.bezier8(x +   54.540 * s,y +  -56.005 * s,x +   54.540 * s,y +  -52.750 * s,x +   53.588 * s,y +  -49.332 * s,x +   51.684 * s,y +  -45.751 * s, threshold);
			_vr.bezier8(x +   51.684 * s,y +  -45.751 * s,x +   49.779 * s,y +  -42.171 * s,x +   46.195 * s,y +  -37.170 * s,x +   40.917 * s,y +  -30.761 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   25.195 * s);
			_setf(o + ( 1 << 2), y +  -11.670 * s);
			_setf(o + ( 2 << 2), x +   58.593 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 51:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   41.601 * s);
			_setf(o + ( 1 << 2), y +  -38.134 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   41.601 * s,y +  -38.134 * s,x +   46.939 * s,y +  -35.237 * s,x +   49.608 * s,y +  -30.598 * s,x +   49.608 * s,y +  -24.218 * s, threshold);
			_vr.bezier8(x +   49.608 * s,y +  -24.218 * s,x +   49.608 * s,y +   -7.421 * s,x +   39.712 * s,y +    0.977 * s,x +   19.921 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   19.921 * s,y +    0.977 * s,x +   12.890 * s,y +    0.977 * s,x +    7.096 * s,y +   -1.465 * s,x +    2.539 * s,y +   -6.348 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    8.886 * s);
			_setf(o + ( 1 << 2), y +  -17.334 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    8.886 * s,y +  -17.334 * s,x +   12.597 * s,y +  -12.581 * s,x +   16.812 * s,y +  -10.205 * s,x +   21.532 * s,y +  -10.205 * s, threshold);
			_vr.bezier8(x +   21.532 * s,y +  -10.205 * s,x +   25.959 * s,y +  -10.205 * s,x +   29.556 * s,y +  -11.450 * s,x +   32.323 * s,y +  -13.940 * s, threshold);
			_vr.bezier8(x +   32.323 * s,y +  -13.940 * s,x +   35.090 * s,y +  -16.430 * s,x +   36.474 * s,y +  -19.742 * s,x +   36.474 * s,y +  -23.877 * s, threshold);
			_vr.bezier8(x +   36.474 * s,y +  -23.877 * s,x +   36.474 * s,y +  -29.736 * s,x +   31.835 * s,y +  -32.666 * s,x +   22.558 * s,y +  -32.666 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   24.560 * s);
			_setf(o + ( 1 << 2), y +  -43.505 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   24.560 * s,y +  -43.505 * s,x +   34.748 * s,y +  -43.505 * s,x +   39.843 * s,y +  -47.135 * s,x +   39.843 * s,y +  -54.394 * s, threshold);
			_vr.bezier8(x +   39.843 * s,y +  -54.394 * s,x +   39.843 * s,y +  -59.211 * s,x +   36.929 * s,y +  -61.620 * s,x +   31.103 * s,y +  -61.620 * s, threshold);
			_vr.bezier8(x +   31.103 * s,y +  -61.620 * s,x +   27.782 * s,y +  -61.620 * s,x +   24.478 * s,y +  -60.302 * s,x +   21.191 * s,y +  -57.665 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   14.843 * s);
			_setf(o + ( 1 << 2), y +  -65.624 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   14.843 * s,y +  -65.624 * s,x +   19.563 * s,y +  -70.409 * s,x +   25.715 * s,y +  -72.802 * s,x +   33.300 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   33.300 * s,y +  -72.802 * s,x +   39.257 * s,y +  -72.802 * s,x +   44.083 * s,y +  -71.264 * s,x +   47.777 * s,y +  -68.187 * s, threshold);
			_vr.bezier8(x +   47.777 * s,y +  -68.187 * s,x +   51.472 * s,y +  -65.111 * s,x +   53.319 * s,y +  -60.937 * s,x +   53.319 * s,y +  -55.663 * s, threshold);
			_vr.bezier8(x +   53.319 * s,y +  -55.663 * s,x +   53.319 * s,y +  -52.148 * s,x +   52.245 * s,y +  -48.795 * s,x +   50.096 * s,y +  -45.605 * s, threshold);
			_vr.bezier8(x +   50.096 * s,y +  -45.605 * s,x +   47.948 * s,y +  -42.415 * s,x +   45.116 * s,y +  -39.924 * s,x +   41.601 * s,y +  -38.134 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.592 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 52:
			
			o = _posf(34);
			_setf(o + ( 0 << 2), x +   48.095 * s);
			_setf(o + ( 1 << 2), y +  -29.052 * s);
			_setf(o + ( 2 << 2), x +   55.322 * s);
			_setf(o + ( 3 << 2), y +  -29.052 * s);
			_setf(o + ( 4 << 2), x +   53.418 * s);
			_setf(o + ( 5 << 2), y +  -18.603 * s);
			_setf(o + ( 6 << 2), x +   46.191 * s);
			_setf(o + ( 7 << 2), y +  -18.603 * s);
			_setf(o + ( 8 << 2), x +   42.773 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   29.541 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   32.959 * s);
			_setf(o + (13 << 2), y +  -18.603 * s);
			_setf(o + (14 << 2), x +    0.879 * s);
			_setf(o + (15 << 2), y +  -18.603 * s);
			_setf(o + (16 << 2), x +    2.295 * s);
			_setf(o + (17 << 2), y +  -26.318 * s);
			_setf(o + (18 << 2), x +   49.853 * s);
			_setf(o + (19 << 2), y +  -71.825 * s);
			_setf(o + (20 << 2), x +   56.005 * s);
			_setf(o + (21 << 2), y +  -71.825 * s);
			_setf(o + (22 << 2), x +   48.095 * s);
			_setf(o + (23 << 2), y +  -29.052 * s);
			_setf(o + (24 << 2), x +   19.922 * s);
			_setf(o + (25 << 2), y +  -29.052 * s);
			_setf(o + (26 << 2), x +   34.863 * s);
			_setf(o + (27 << 2), y +  -29.052 * s);
			_setf(o + (28 << 2), x +   38.086 * s);
			_setf(o + (29 << 2), y +  -46.435 * s);
			_setf(o + (30 << 2), x +   19.922 * s);
			_setf(o + (31 << 2), y +  -29.052 * s);
			_setf(o + (32 << 2), x +   58.593 * s);
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
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   54.735 * s);
			_setf(o + ( 1 << 2), y +  -60.644 * s);
			_setf(o + ( 2 << 2), x +   28.417 * s);
			_setf(o + ( 3 << 2), y +  -60.644 * s);
			_setf(o + ( 4 << 2), x +   26.220 * s);
			_setf(o + ( 5 << 2), y +  -48.632 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   26.220 * s,y +  -48.632 * s,x +   28.434 * s,y +  -49.446 * s,x +   30.875 * s,y +  -49.853 * s,x +   33.544 * s,y +  -49.853 * s, threshold);
			_vr.bezier8(x +   33.544 * s,y +  -49.853 * s,x +   38.623 * s,y +  -49.853 * s,x +   43.017 * s,y +  -48.209 * s,x +   46.728 * s,y +  -44.921 * s, threshold);
			_vr.bezier8(x +   46.728 * s,y +  -44.921 * s,x +   50.439 * s,y +  -41.633 * s,x +   52.294 * s,y +  -37.483 * s,x +   52.294 * s,y +  -32.470 * s, threshold);
			_vr.bezier8(x +   52.294 * s,y +  -32.470 * s,x +   52.294 * s,y +  -10.172 * s,x +   41.958 * s,y +    0.977 * s,x +   21.289 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   21.289 * s,y +    0.977 * s,x +   14.583 * s,y +    0.977 * s,x +    9.082 * s,y +   -1.074 * s,x +    4.785 * s,y +   -5.176 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   10.303 * s);
			_setf(o + ( 1 << 2), y +  -16.504 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   10.303 * s,y +  -16.504 * s,x +   11.800 * s,y +  -14.746 * s,x +   13.720 * s,y +  -13.257 * s,x +   16.064 * s,y +  -12.036 * s, threshold);
			_vr.bezier8(x +   16.064 * s,y +  -12.036 * s,x +   18.408 * s,y +  -10.815 * s,x +   20.621 * s,y +  -10.205 * s,x +   22.705 * s,y +  -10.205 * s, threshold);
			_vr.bezier8(x +   22.705 * s,y +  -10.205 * s,x +   27.750 * s,y +  -10.205 * s,x +   31.779 * s,y +  -12.125 * s,x +   34.789 * s,y +  -15.967 * s, threshold);
			_vr.bezier8(x +   34.789 * s,y +  -15.967 * s,x +   37.800 * s,y +  -19.808 * s,x +   39.306 * s,y +  -24.560 * s,x +   39.306 * s,y +  -30.224 * s, threshold);
			_vr.bezier8(x +   39.306 * s,y +  -30.224 * s,x +   39.306 * s,y +  -33.121 * s,x +   38.321 * s,y +  -35.416 * s,x +   36.352 * s,y +  -37.109 * s, threshold);
			_vr.bezier8(x +   36.352 * s,y +  -37.109 * s,x +   34.383 * s,y +  -38.801 * s,x +   31.835 * s,y +  -39.648 * s,x +   28.710 * s,y +  -39.648 * s, threshold);
			_vr.bezier8(x +   28.710 * s,y +  -39.648 * s,x +   24.414 * s,y +  -39.648 * s,x +   20.556 * s,y +  -37.792 * s,x +   17.138 * s,y +  -34.081 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   11.670 * s);
			_setf(o + ( 1 << 2), y +  -36.621 * s);
			_setf(o + ( 2 << 2), x +   17.773 * s);
			_setf(o + ( 3 << 2), y +  -71.825 * s);
			_setf(o + ( 4 << 2), x +   56.835 * s);
			_setf(o + ( 5 << 2), y +  -71.825 * s);
			_setf(o + ( 6 << 2), x +   54.735 * s);
			_setf(o + ( 7 << 2), y +  -60.644 * s);
			_setf(o + ( 8 << 2), x +   58.593 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 1);
			
			case 54:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   45.360 * s);
			_setf(o + ( 1 << 2), y +  -72.997 * s);
			_setf(o + ( 2 << 2), x +   51.220 * s);
			_setf(o + ( 3 << 2), y +  -65.429 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   51.220 * s,y +  -65.429 * s,x +   47.607 * s,y +  -64.062 * s,x +   43.489 * s,y +  -61.392 * s,x +   38.866 * s,y +  -57.421 * s, threshold);
			_vr.bezier8(x +   38.866 * s,y +  -57.421 * s,x +   34.244 * s,y +  -53.450 * s,x +   30.240 * s,y +  -49.267 * s,x +   26.855 * s,y +  -44.872 * s, threshold);
			_vr.bezier8(x +   26.855 * s,y +  -44.872 * s,x +   29.134 * s,y +  -45.621 * s,x +   31.624 * s,y +  -45.995 * s,x +   34.325 * s,y +  -45.995 * s, threshold);
			_vr.bezier8(x +   34.325 * s,y +  -45.995 * s,x +   40.250 * s,y +  -45.995 * s,x +   44.921 * s,y +  -44.400 * s,x +   48.339 * s,y +  -41.210 * s, threshold);
			_vr.bezier8(x +   48.339 * s,y +  -41.210 * s,x +   51.757 * s,y +  -38.020 * s,x +   53.466 * s,y +  -33.609 * s,x +   53.466 * s,y +  -27.978 * s, threshold);
			_vr.bezier8(x +   53.466 * s,y +  -27.978 * s,x +   53.466 * s,y +  -19.905 * s,x +   50.886 * s,y +  -13.021 * s,x +   45.727 * s,y +   -7.324 * s, threshold);
			_vr.bezier8(x +   45.727 * s,y +   -7.324 * s,x +   40.567 * s,y +   -1.628 * s,x +   34.147 * s,y +    1.221 * s,x +   26.464 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   26.464 * s,y +    1.221 * s,x +   12.597 * s,y +    1.221 * s,x +    5.664 * s,y +   -5.810 * s,x +    5.664 * s,y +  -19.873 * s, threshold);
			_vr.bezier8(x +    5.664 * s,y +  -19.873 * s,x +    5.664 * s,y +  -31.494 * s,x +    9.896 * s,y +  -42.683 * s,x +   18.359 * s,y +  -53.442 * s, threshold);
			_vr.bezier8(x +   18.359 * s,y +  -53.442 * s,x +   26.823 * s,y +  -64.200 * s,x +   35.823 * s,y +  -70.718 * s,x +   45.360 * s,y +  -72.997 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   18.603 * s);
			_setf(o + ( 1 << 2), y +  -18.506 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   18.603 * s,y +  -18.506 * s,x +   18.603 * s,y +  -12.809 * s,x +   21.468 * s,y +   -9.961 * s,x +   27.197 * s,y +   -9.961 * s, threshold);
			_vr.bezier8(x +   27.197 * s,y +   -9.961 * s,x +   31.038 * s,y +   -9.961 * s,x +   34.179 * s,y +  -11.580 * s,x +   36.620 * s,y +  -14.819 * s, threshold);
			_vr.bezier8(x +   36.620 * s,y +  -14.819 * s,x +   39.062 * s,y +  -18.058 * s,x +   40.282 * s,y +  -21.810 * s,x +   40.282 * s,y +  -26.074 * s, threshold);
			_vr.bezier8(x +   40.282 * s,y +  -26.074 * s,x +   40.282 * s,y +  -28.776 * s,x +   39.574 * s,y +  -30.908 * s,x +   38.158 * s,y +  -32.470 * s, threshold);
			_vr.bezier8(x +   38.158 * s,y +  -32.470 * s,x +   36.742 * s,y +  -34.033 * s,x +   34.765 * s,y +  -34.814 * s,x +   32.226 * s,y +  -34.814 * s, threshold);
			_vr.bezier8(x +   32.226 * s,y +  -34.814 * s,x +   27.929 * s,y +  -34.814 * s,x +   24.585 * s,y +  -33.325 * s,x +   22.192 * s,y +  -30.346 * s, threshold);
			_vr.bezier8(x +   22.192 * s,y +  -30.346 * s,x +   19.799 * s,y +  -27.368 * s,x +   18.603 * s,y +  -23.421 * s,x +   18.603 * s,y +  -18.506 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.593 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 55:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   22.900 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    7.275 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    7.275 * s,y +       0. * s,x +   13.981 * s,y +  -13.021 * s,x +   26.611 * s,y +  -32.926 * s,x +   45.165 * s,y +  -59.716 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   12.060 * s);
			_setf(o + ( 1 << 2), y +  -59.716 * s);
			_setf(o + ( 2 << 2), x +   14.306 * s);
			_setf(o + ( 3 << 2), y +  -71.825 * s);
			_setf(o + ( 4 << 2), x +   64.159 * s);
			_setf(o + ( 5 << 2), y +  -71.825 * s);
			_setf(o + ( 6 << 2), x +   64.159 * s);
			_setf(o + ( 7 << 2), y +  -66.015 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_vr.bezier8(x +   64.159 * s,y +  -66.015 * s,x +   47.102 * s,y +  -43.098 * s,x +   33.349 * s,y +  -21.093 * s,x +   22.900 * s,y +       0. * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.593 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 56:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   43.749 * s);
			_setf(o + ( 1 << 2), y +  -38.476 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   43.749 * s,y +  -38.476 * s,x +   49.218 * s,y +  -34.309 * s,x +   51.952 * s,y +  -29.150 * s,x +   51.952 * s,y +  -22.998 * s, threshold);
			_vr.bezier8(x +   51.952 * s,y +  -22.998 * s,x +   51.952 * s,y +   -7.014 * s,x +   42.788 * s,y +    0.977 * s,x +   24.462 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   24.462 * s,y +    0.977 * s,x +   18.342 * s,y +    0.977 * s,x +   13.362 * s,y +   -0.578 * s,x +    9.521 * s,y +   -3.686 * s, threshold);
			_vr.bezier8(x +    9.521 * s,y +   -3.686 * s,x +    5.680 * s,y +   -6.795 * s,x +    3.759 * s,y +  -11.051 * s,x +    3.759 * s,y +  -16.455 * s, threshold);
			_vr.bezier8(x +    3.759 * s,y +  -16.455 * s,x +    3.759 * s,y +  -21.663 * s,x +    5.110 * s,y +  -26.318 * s,x +    7.812 * s,y +  -30.419 * s, threshold);
			_vr.bezier8(x +    7.812 * s,y +  -30.419 * s,x +   10.514 * s,y +  -34.521 * s,x +   14.241 * s,y +  -37.711 * s,x +   18.993 * s,y +  -39.990 * s, threshold);
			_vr.bezier8(x +   18.993 * s,y +  -39.990 * s,x +   14.924 * s,y +  -43.538 * s,x +   12.890 * s,y +  -47.965 * s,x +   12.890 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   12.890 * s,y +  -53.271 * s,x +   12.890 * s,y +  -58.967 * s,x +   15.266 * s,y +  -63.646 * s,x +   20.019 * s,y +  -67.309 * s, threshold);
			_vr.bezier8(x +   20.019 * s,y +  -67.309 * s,x +   24.771 * s,y +  -70.971 * s,x +   30.338 * s,y +  -72.802 * s,x +   36.718 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   36.718 * s,y +  -72.802 * s,x +   42.056 * s,y +  -72.802 * s,x +   46.540 * s,y +  -71.386 * s,x +   50.170 * s,y +  -68.554 * s, threshold);
			_vr.bezier8(x +   50.170 * s,y +  -68.554 * s,x +   53.799 * s,y +  -65.722 * s,x +   55.614 * s,y +  -61.962 * s,x +   55.614 * s,y +  -57.275 * s, threshold);
			_vr.bezier8(x +   55.614 * s,y +  -57.275 * s,x +   55.614 * s,y +  -53.564 * s,x +   54.515 * s,y +  -49.991 * s,x +   52.318 * s,y +  -46.557 * s, threshold);
			_vr.bezier8(x +   52.318 * s,y +  -46.557 * s,x +   50.121 * s,y +  -43.123 * s,x +   47.264 * s,y +  -40.429 * s,x +   43.749 * s,y +  -38.476 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   34.569 * s);
			_setf(o + ( 1 << 2), y +  -44.384 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   34.569 * s,y +  -44.384 * s,x +   39.908 * s,y +  -48.713 * s,x +   42.577 * s,y +  -52.522 * s,x +   42.577 * s,y +  -55.810 * s, threshold);
			_vr.bezier8(x +   42.577 * s,y +  -55.810 * s,x +   42.577 * s,y +  -57.502 * s,x +   41.836 * s,y +  -58.894 * s,x +   40.355 * s,y +  -59.984 * s, threshold);
			_vr.bezier8(x +   40.355 * s,y +  -59.984 * s,x +   38.874 * s,y +  -61.075 * s,x +   37.173 * s,y +  -61.620 * s,x +   35.253 * s,y +  -61.620 * s, threshold);
			_vr.bezier8(x +   35.253 * s,y +  -61.620 * s,x +   29.231 * s,y +  -61.620 * s,x +   26.220 * s,y +  -58.853 * s,x +   26.220 * s,y +  -53.319 * s, threshold);
			_vr.bezier8(x +   26.220 * s,y +  -53.319 * s,x +   26.220 * s,y +  -49.771 * s,x +   29.003 * s,y +  -46.793 * s,x +   34.569 * s,y +  -44.384 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   30.468 * s);
			_setf(o + ( 1 << 2), y +  -33.447 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   30.468 * s,y +  -33.447 * s,x +   26.464 * s,y +  -32.438 * s,x +   23.168 * s,y +  -30.525 * s,x +   20.580 * s,y +  -27.710 * s, threshold);
			_vr.bezier8(x +   20.580 * s,y +  -27.710 * s,x +   17.992 * s,y +  -24.894 * s,x +   16.699 * s,y +  -21.696 * s,x +   16.699 * s,y +  -18.115 * s, threshold);
			_vr.bezier8(x +   16.699 * s,y +  -18.115 * s,x +   16.699 * s,y +  -15.771 * s,x +   17.586 * s,y +  -13.867 * s,x +   19.360 * s,y +  -12.402 * s, threshold);
			_vr.bezier8(x +   19.360 * s,y +  -12.402 * s,x +   21.134 * s,y +  -10.937 * s,x +   23.323 * s,y +  -10.205 * s,x +   25.927 * s,y +  -10.205 * s, threshold);
			_vr.bezier8(x +   25.927 * s,y +  -10.205 * s,x +   29.865 * s,y +  -10.205 * s,x +   32.974 * s,y +  -11.312 * s,x +   35.253 * s,y +  -13.525 * s, threshold);
			_vr.bezier8(x +   35.253 * s,y +  -13.525 * s,x +   37.532 * s,y +  -15.739 * s,x +   38.671 * s,y +  -18.798 * s,x +   38.671 * s,y +  -22.705 * s, threshold);
			_vr.bezier8(x +   38.671 * s,y +  -22.705 * s,x +   38.671 * s,y +  -27.067 * s,x +   35.936 * s,y +  -30.647 * s,x +   30.468 * s,y +  -33.447 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.592 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 57:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   15.381 * s);
			_setf(o + ( 1 << 2), y +    1.416 * s);
			_setf(o + ( 2 << 2), x +    9.571 * s);
			_setf(o + ( 3 << 2), y +   -6.152 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    9.571 * s,y +   -6.152 * s,x +   13.444 * s,y +   -7.585 * s,x +   17.855 * s,y +  -10.433 * s,x +   22.803 * s,y +  -14.697 * s, threshold);
			_vr.bezier8(x +   22.803 * s,y +  -14.697 * s,x +   27.751 * s,y +  -18.961 * s,x +   31.461 * s,y +  -22.949 * s,x +   33.935 * s,y +  -26.660 * s, threshold);
			_vr.bezier8(x +   33.935 * s,y +  -26.660 * s,x +   31.754 * s,y +  -25.944 * s,x +   29.248 * s,y +  -25.586 * s,x +   26.416 * s,y +  -25.586 * s, threshold);
			_vr.bezier8(x +   26.416 * s,y +  -25.586 * s,x +   20.947 * s,y +  -25.586 * s,x +   16.398 * s,y +  -27.376 * s,x +   12.769 * s,y +  -30.957 * s, threshold);
			_vr.bezier8(x +   12.769 * s,y +  -30.957 * s,x +    9.139 * s,y +  -34.537 * s,x +    7.324 * s,y +  -39.062 * s,x +    7.324 * s,y +  -44.531 * s, threshold);
			_vr.bezier8(x +    7.324 * s,y +  -44.531 * s,x +    7.324 * s,y +  -53.059 * s,x +    9.766 * s,y +  -59.903 * s,x +   14.649 * s,y +  -65.062 * s, threshold);
			_vr.bezier8(x +   14.649 * s,y +  -65.062 * s,x +   19.531 * s,y +  -70.222 * s,x +   26.090 * s,y +  -72.802 * s,x +   34.326 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   34.326 * s,y +  -72.802 * s,x +   40.869 * s,y +  -72.802 * s,x +   45.971 * s,y +  -70.840 * s,x +   49.633 * s,y +  -66.918 * s, threshold);
			_vr.bezier8(x +   49.633 * s,y +  -66.918 * s,x +   53.295 * s,y +  -62.995 * s,x +   55.126 * s,y +  -57.600 * s,x +   55.126 * s,y +  -50.732 * s, threshold);
			_vr.bezier8(x +   55.126 * s,y +  -50.732 * s,x +   55.126 * s,y +  -39.599 * s,x +   51.196 * s,y +  -28.914 * s,x +   43.335 * s,y +  -18.676 * s, threshold);
			_vr.bezier8(x +   43.335 * s,y +  -18.676 * s,x +   35.473 * s,y +   -8.439 * s,x +   26.156 * s,y +   -1.742 * s,x +   15.381 * s,y +    1.416 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   20.508 * s);
			_setf(o + ( 1 << 2), y +  -45.507 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   20.508 * s,y +  -45.507 * s,x +   20.508 * s,y +  -39.680 * s,x +   23.177 * s,y +  -36.767 * s,x +   28.516 * s,y +  -36.767 * s, threshold);
			_vr.bezier8(x +   28.516 * s,y +  -36.767 * s,x +   32.878 * s,y +  -36.767 * s,x +   36.238 * s,y +  -38.232 * s,x +   38.598 * s,y +  -41.161 * s, threshold);
			_vr.bezier8(x +   38.598 * s,y +  -41.161 * s,x +   40.958 * s,y +  -44.091 * s,x +   42.138 * s,y +  -48.062 * s,x +   42.138 * s,y +  -53.075 * s, threshold);
			_vr.bezier8(x +   42.138 * s,y +  -53.075 * s,x +   42.138 * s,y +  -58.772 * s,x +   39.290 * s,y +  -61.620 * s,x +   33.594 * s,y +  -61.620 * s, threshold);
			_vr.bezier8(x +   33.594 * s,y +  -61.620 * s,x +   29.557 * s,y +  -61.620 * s,x +   26.367 * s,y +  -60.098 * s,x +   24.023 * s,y +  -57.055 * s, threshold);
			_vr.bezier8(x +   24.023 * s,y +  -57.055 * s,x +   21.680 * s,y +  -54.011 * s,x +   20.508 * s,y +  -50.162 * s,x +   20.508 * s,y +  -45.507 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.593 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 58:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    8.008 * s);
			_setf(o + ( 1 << 2), y +   -6.787 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +    8.008 * s,y +   -6.787 * s,x +    8.008 * s,y +   -8.935 * s,x +    8.765 * s,y +  -10.766 * s,x +   10.278 * s,y +  -12.280 * s, threshold);
			_vr.bezier8(x +   10.278 * s,y +  -12.280 * s,x +   11.792 * s,y +  -13.794 * s,x +   13.623 * s,y +  -14.551 * s,x +   15.771 * s,y +  -14.551 * s, threshold);
			_vr.bezier8(x +   15.771 * s,y +  -14.551 * s,x +   17.920 * s,y +  -14.551 * s,x +   19.751 * s,y +  -13.794 * s,x +   21.265 * s,y +  -12.280 * s, threshold);
			_vr.bezier8(x +   21.265 * s,y +  -12.280 * s,x +   22.778 * s,y +  -10.766 * s,x +   23.535 * s,y +   -8.935 * s,x +   23.535 * s,y +   -6.787 * s, threshold);
			_vr.bezier8(x +   23.535 * s,y +   -6.787 * s,x +   23.535 * s,y +   -4.639 * s,x +   22.778 * s,y +   -2.808 * s,x +   21.265 * s,y +   -1.294 * s, threshold);
			_vr.bezier8(x +   21.265 * s,y +   -1.294 * s,x +   19.751 * s,y +    0.220 * s,x +   17.920 * s,y +    0.977 * s,x +   15.771 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   15.771 * s,y +    0.977 * s,x +   13.623 * s,y +    0.977 * s,x +   11.792 * s,y +    0.220 * s,x +   10.278 * s,y +   -1.294 * s, threshold);
			_vr.bezier8(x +   10.278 * s,y +   -1.294 * s,x +    8.765 * s,y +   -2.808 * s,x +    8.008 * s,y +   -4.639 * s,x +    8.008 * s,y +   -6.787 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   14.160 * s);
			_setf(o + ( 1 << 2), y +  -44.531 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   14.160 * s,y +  -44.531 * s,x +   14.160 * s,y +  -46.679 * s,x +   14.917 * s,y +  -48.510 * s,x +   16.431 * s,y +  -50.024 * s, threshold);
			_vr.bezier8(x +   16.431 * s,y +  -50.024 * s,x +   17.944 * s,y +  -51.537 * s,x +   19.775 * s,y +  -52.294 * s,x +   21.924 * s,y +  -52.294 * s, threshold);
			_vr.bezier8(x +   21.924 * s,y +  -52.294 * s,x +   24.072 * s,y +  -52.294 * s,x +   25.903 * s,y +  -51.537 * s,x +   27.417 * s,y +  -50.024 * s, threshold);
			_vr.bezier8(x +   27.417 * s,y +  -50.024 * s,x +   28.930 * s,y +  -48.510 * s,x +   29.687 * s,y +  -46.679 * s,x +   29.687 * s,y +  -44.531 * s, threshold);
			_vr.bezier8(x +   29.687 * s,y +  -44.531 * s,x +   29.687 * s,y +  -42.382 * s,x +   28.930 * s,y +  -40.551 * s,x +   27.417 * s,y +  -39.037 * s, threshold);
			_vr.bezier8(x +   27.417 * s,y +  -39.037 * s,x +   25.903 * s,y +  -37.524 * s,x +   24.072 * s,y +  -36.767 * s,x +   21.924 * s,y +  -36.767 * s, threshold);
			_vr.bezier8(x +   21.924 * s,y +  -36.767 * s,x +   19.775 * s,y +  -36.767 * s,x +   17.944 * s,y +  -37.524 * s,x +   16.431 * s,y +  -39.037 * s, threshold);
			_vr.bezier8(x +   16.431 * s,y +  -39.037 * s,x +   14.917 * s,y +  -40.551 * s,x +   14.160 * s,y +  -42.382 * s,x +   14.160 * s,y +  -44.531 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.718 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 59:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   11.133 * s);
			_setf(o + ( 1 << 2), y +   20.215 * s);
			_setf(o + ( 2 << 2), x +    7.373 * s);
			_setf(o + ( 3 << 2), y +   15.283 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    7.373 * s,y +   15.283 * s,x +   12.549 * s,y +   11.474 * s,x +   15.137 * s,y +    7.194 * s,x +   15.137 * s,y +    2.441 * s, threshold);
			_vr.bezier8(x +   15.137 * s,y +    2.441 * s,x +   15.137 * s,y +    0.619 * s,x +   14.193 * s,y +   -1.025 * s,x +   12.305 * s,y +   -2.490 * s, threshold);
			_vr.bezier8(x +   12.305 * s,y +   -2.490 * s,x +   10.417 * s,y +   -3.955 * s,x +    9.473 * s,y +   -5.534 * s,x +    9.473 * s,y +   -7.226 * s, threshold);
			_vr.bezier8(x +    9.473 * s,y +   -7.226 * s,x +    9.473 * s,y +   -9.407 * s,x +   10.399 * s,y +  -11.200 * s,x +   12.256 * s,y +  -12.597 * s, threshold);
			_vr.bezier8(x +   12.256 * s,y +  -12.597 * s,x +   13.947 * s,y +  -13.869 * s,x +   15.934 * s,y +  -14.502 * s,x +   18.213 * s,y +  -14.502 * s, threshold);
			_vr.bezier8(x +   18.213 * s,y +  -14.502 * s,x +   20.557 * s,y +  -14.502 * s,x +   22.618 * s,y +  -13.535 * s,x +   24.365 * s,y +  -11.572 * s, threshold);
			_vr.bezier8(x +   24.365 * s,y +  -11.572 * s,x +   26.037 * s,y +   -9.694 * s,x +   26.855 * s,y +   -7.552 * s,x +   26.855 * s,y +   -5.176 * s, threshold);
			_vr.bezier8(x +   26.855 * s,y +   -5.176 * s,x +   26.855 * s,y +    4.655 * s,x +   21.615 * s,y +   13.118 * s,x +   11.133 * s,y +   20.215 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   14.160 * s);
			_setf(o + ( 1 << 2), y +  -44.531 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   14.160 * s,y +  -44.531 * s,x +   14.160 * s,y +  -46.679 * s,x +   14.917 * s,y +  -48.510 * s,x +   16.431 * s,y +  -50.024 * s, threshold);
			_vr.bezier8(x +   16.431 * s,y +  -50.024 * s,x +   17.944 * s,y +  -51.537 * s,x +   19.776 * s,y +  -52.294 * s,x +   21.924 * s,y +  -52.294 * s, threshold);
			_vr.bezier8(x +   21.924 * s,y +  -52.294 * s,x +   24.072 * s,y +  -52.294 * s,x +   25.903 * s,y +  -51.537 * s,x +   27.417 * s,y +  -50.024 * s, threshold);
			_vr.bezier8(x +   27.417 * s,y +  -50.024 * s,x +   28.931 * s,y +  -48.510 * s,x +   29.687 * s,y +  -46.679 * s,x +   29.687 * s,y +  -44.531 * s, threshold);
			_vr.bezier8(x +   29.687 * s,y +  -44.531 * s,x +   29.687 * s,y +  -42.382 * s,x +   28.931 * s,y +  -40.551 * s,x +   27.417 * s,y +  -39.037 * s, threshold);
			_vr.bezier8(x +   27.417 * s,y +  -39.037 * s,x +   25.903 * s,y +  -37.524 * s,x +   24.072 * s,y +  -36.767 * s,x +   21.924 * s,y +  -36.767 * s, threshold);
			_vr.bezier8(x +   21.924 * s,y +  -36.767 * s,x +   19.776 * s,y +  -36.767 * s,x +   17.944 * s,y +  -37.524 * s,x +   16.431 * s,y +  -39.037 * s, threshold);
			_vr.bezier8(x +   16.431 * s,y +  -39.037 * s,x +   14.917 * s,y +  -40.551 * s,x +   14.160 * s,y +  -42.382 * s,x +   14.160 * s,y +  -44.531 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.719 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 60:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +    9.374 * s);
			_setf(o + ( 1 << 2), y +  -27.197 * s);
			_setf(o + ( 2 << 2), x +    9.374 * s);
			_setf(o + ( 3 << 2), y +  -35.058 * s);
			_setf(o + ( 4 << 2), x +   48.388 * s);
			_setf(o + ( 5 << 2), y +  -53.759 * s);
			_setf(o + ( 6 << 2), x +   48.388 * s);
			_setf(o + ( 7 << 2), y +  -42.626 * s);
			_setf(o + ( 8 << 2), x +   22.607 * s);
			_setf(o + ( 9 << 2), y +  -31.103 * s);
			_setf(o + (10 << 2), x +   48.388 * s);
			_setf(o + (11 << 2), y +  -19.433 * s);
			_setf(o + (12 << 2), x +   48.388 * s);
			_setf(o + (13 << 2), y +   -8.301 * s);
			_setf(o + (14 << 2), x +    9.374 * s);
			_setf(o + (15 << 2), y +  -27.197 * s);
			_setf(o + (16 << 2), x +   58.592 * s);
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
			_setf(o + ( 0 << 2), x +    8.741 * s);
			_setf(o + ( 1 << 2), y +  -36.376 * s);
			_setf(o + ( 2 << 2), x +    8.741 * s);
			_setf(o + ( 3 << 2), y +  -46.191 * s);
			_setf(o + ( 4 << 2), x +   52.588 * s);
			_setf(o + ( 5 << 2), y +  -46.191 * s);
			_setf(o + ( 6 << 2), x +   52.588 * s);
			_setf(o + ( 7 << 2), y +  -36.376 * s);
			_setf(o + ( 8 << 2), x +    8.741 * s);
			_setf(o + ( 9 << 2), y +  -36.376 * s);
			_setf(o + (10 << 2), x +    8.741 * s);
			_setf(o + (11 << 2), y +  -15.869 * s);
			_setf(o + (12 << 2), x +    8.741 * s);
			_setf(o + (13 << 2), y +  -25.683 * s);
			_setf(o + (14 << 2), x +   52.588 * s);
			_setf(o + (15 << 2), y +  -25.683 * s);
			_setf(o + (16 << 2), x +   52.588 * s);
			_setf(o + (17 << 2), y +  -15.869 * s);
			_setf(o + (18 << 2), x +    8.741 * s);
			_setf(o + (19 << 2), y +  -15.869 * s);
			_setf(o + (20 << 2), x +   58.593 * s);
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
			_setf(o + ( 0 << 2), x +   12.939 * s);
			_setf(o + ( 1 << 2), y +   -8.301 * s);
			_setf(o + ( 2 << 2), x +   12.939 * s);
			_setf(o + ( 3 << 2), y +  -19.433 * s);
			_setf(o + ( 4 << 2), x +   38.671 * s);
			_setf(o + ( 5 << 2), y +  -31.103 * s);
			_setf(o + ( 6 << 2), x +   12.939 * s);
			_setf(o + ( 7 << 2), y +  -42.626 * s);
			_setf(o + ( 8 << 2), x +   12.939 * s);
			_setf(o + ( 9 << 2), y +  -53.759 * s);
			_setf(o + (10 << 2), x +   51.952 * s);
			_setf(o + (11 << 2), y +  -35.058 * s);
			_setf(o + (12 << 2), x +   51.952 * s);
			_setf(o + (13 << 2), y +  -27.197 * s);
			_setf(o + (14 << 2), x +   12.939 * s);
			_setf(o + (15 << 2), y +   -8.301 * s);
			_setf(o + (16 << 2), x +   58.593 * s);
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
			_setf(o + ( 0 << 2), x +   14.795 * s);
			_setf(o + ( 1 << 2), y +  -20.263 * s);
			_setf(o + ( 2 << 2), x +    7.666 * s);
			_setf(o + ( 3 << 2), y +  -20.263 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    7.666 * s,y +  -20.263 * s,x +    7.633 * s,y +  -20.752 * s,x +    7.495 * s,y +  -21.663 * s,x +    7.251 * s,y +  -22.998 * s, threshold);
			_vr.bezier8(x +    7.251 * s,y +  -22.998 * s,x +    7.007 * s,y +  -24.332 * s,x +    6.885 * s,y +  -25.374 * s,x +    6.885 * s,y +  -26.123 * s, threshold);
			_vr.bezier8(x +    6.885 * s,y +  -26.123 * s,x +    6.885 * s,y +  -30.420 * s,x +    8.642 * s,y +  -34.537 * s,x +   12.158 * s,y +  -38.476 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   21.386 * s);
			_setf(o + ( 1 << 2), y +  -47.118 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   21.386 * s,y +  -47.118 * s,x +   23.353 * s,y +  -48.960 * s,x +   24.804 * s,y +  -50.797 * s,x +   25.781 * s,y +  -52.587 * s, threshold);
			_vr.bezier8(x +   25.781 * s,y +  -52.587 * s,x +   26.757 * s,y +  -54.377 * s,x +   27.246 * s,y +  -56.135 * s,x +   27.246 * s,y +  -57.860 * s, threshold);
			_vr.bezier8(x +   27.246 * s,y +  -57.860 * s,x +   27.246 * s,y +  -61.408 * s,x +   24.951 * s,y +  -63.183 * s,x +   20.361 * s,y +  -63.183 * s, threshold);
			_vr.bezier8(x +   20.361 * s,y +  -63.183 * s,x +   16.748 * s,y +  -63.183 * s,x +   13.428 * s,y +  -62.027 * s,x +   10.400 * s,y +  -59.716 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    6.250 * s);
			_setf(o + ( 1 << 2), y +  -67.968 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    6.250 * s,y +  -67.968 * s,x +    9.928 * s,y +  -71.190 * s,x +   15.560 * s,y +  -72.802 * s,x +   23.144 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   23.144 * s,y +  -72.802 * s,x +   27.929 * s,y +  -72.802 * s,x +   31.770 * s,y +  -71.508 * s,x +   34.667 * s,y +  -68.920 * s, threshold);
			_vr.bezier8(x +   34.667 * s,y +  -68.920 * s,x +   37.564 * s,y +  -66.332 * s,x +   39.013 * s,y +  -62.776 * s,x +   39.013 * s,y +  -58.251 * s, threshold);
			_vr.bezier8(x +   39.013 * s,y +  -58.251 * s,x +   39.013 * s,y +  -55.354 * s,x +   38.394 * s,y +  -52.506 * s,x +   37.157 * s,y +  -49.706 * s, threshold);
			_vr.bezier8(x +   37.157 * s,y +  -49.706 * s,x +   35.921 * s,y +  -46.907 * s,x +   34.183 * s,y +  -44.526 * s,x +   31.933 * s,y +  -42.577 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   23.535 * s);
			_setf(o + ( 1 << 2), y +  -35.302 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   23.535 * s,y +  -35.302 * s,x +   20.220 * s,y +  -32.431 * s,x +   18.024 * s,y +  -30.171 * s,x +   16.943 * s,y +  -28.515 * s, threshold);
			_vr.bezier8(x +   16.943 * s,y +  -28.515 * s,x +   15.517 * s,y +  -26.330 * s,x +   14.795 * s,y +  -24.137 * s,x +   14.795 * s,y +  -21.923 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   14.795 * s);
			_setf(o + ( 1 << 2), y +  -20.263 * s);
			_setf(o + ( 2 << 2), x +    2.734 * s);
			_setf(o + ( 3 << 2), y +   -6.885 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_vr.bezier8(x +    2.734 * s,y +   -6.885 * s,x +    2.734 * s,y +   -9.098 * s,x +    3.540 * s,y +  -10.962 * s,x +    5.151 * s,y +  -12.475 * s, threshold);
			_vr.bezier8(x +    5.151 * s,y +  -12.475 * s,x +    6.763 * s,y +  -13.989 * s,x +    8.675 * s,y +  -14.746 * s,x +   10.889 * s,y +  -14.746 * s, threshold);
			_vr.bezier8(x +   10.889 * s,y +  -14.746 * s,x +   13.102 * s,y +  -14.746 * s,x +   15.014 * s,y +  -13.989 * s,x +   16.626 * s,y +  -12.475 * s, threshold);
			_vr.bezier8(x +   16.626 * s,y +  -12.475 * s,x +   18.237 * s,y +  -10.962 * s,x +   19.043 * s,y +   -9.098 * s,x +   19.043 * s,y +   -6.885 * s, threshold);
			_vr.bezier8(x +   19.043 * s,y +   -6.885 * s,x +   19.043 * s,y +   -4.671 * s,x +   18.245 * s,y +   -2.808 * s,x +   16.650 * s,y +   -1.294 * s, threshold);
			_vr.bezier8(x +   16.650 * s,y +   -1.294 * s,x +   15.055 * s,y +    0.220 * s,x +   13.135 * s,y +    0.977 * s,x +   10.889 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   10.889 * s,y +    0.977 * s,x +    8.642 * s,y +    0.977 * s,x +    6.722 * s,y +    0.220 * s,x +    5.127 * s,y +   -1.294 * s, threshold);
			_vr.bezier8(x +    5.127 * s,y +   -1.294 * s,x +    3.532 * s,y +   -2.808 * s,x +    2.734 * s,y +   -4.671 * s,x +    2.734 * s,y +   -6.885 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   39.697 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 64:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   44.188 * s);
			_setf(o + ( 1 << 2), y +  -15.039 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   44.188 * s,y +  -15.039 * s,x +   41.194 * s,y +  -12.109 * s,x +   37.564 * s,y +  -10.644 * s,x +   33.300 * s,y +  -10.644 * s, threshold);
			_vr.bezier8(x +   33.300 * s,y +  -10.644 * s,x +   29.361 * s,y +  -10.644 * s,x +   26.187 * s,y +  -11.735 * s,x +   23.778 * s,y +  -13.916 * s, threshold);
			_vr.bezier8(x +   23.778 * s,y +  -13.916 * s,x +   21.370 * s,y +  -16.097 * s,x +   20.165 * s,y +  -19.140 * s,x +   20.165 * s,y +  -23.047 * s, threshold);
			_vr.bezier8(x +   20.165 * s,y +  -23.047 * s,x +   20.165 * s,y +  -29.427 * s,x +   22.387 * s,y +  -35.034 * s,x +   26.830 * s,y +  -39.868 * s, threshold);
			_vr.bezier8(x +   26.830 * s,y +  -39.868 * s,x +   31.273 * s,y +  -44.701 * s,x +   36.669 * s,y +  -47.118 * s,x +   43.016 * s,y +  -47.118 * s, threshold);
			_vr.bezier8(x +   43.016 * s,y +  -47.118 * s,x +   46.239 * s,y +  -47.118 * s,x +   50.780 * s,y +  -45.881 * s,x +   56.639 * s,y +  -43.408 * s, threshold);
			_vr.bezier8(x +   56.639 * s,y +  -43.408 * s,x +   54.393 * s,y +  -35.237 * s,x +   53.124 * s,y +  -30.102 * s,x +   52.831 * s,y +  -28.002 * s, threshold);
			_vr.bezier8(x +   52.831 * s,y +  -28.002 * s,x +   52.538 * s,y +  -25.903 * s,x +   52.391 * s,y +  -24.121 * s,x +   52.391 * s,y +  -22.656 * s, threshold);
			_vr.bezier8(x +   52.391 * s,y +  -22.656 * s,x +   52.391 * s,y +  -20.345 * s,x +   53.238 * s,y +  -19.189 * s,x +   54.930 * s,y +  -19.189 * s, threshold);
			_vr.bezier8(x +   54.930 * s,y +  -19.189 * s,x +   58.381 * s,y +  -19.189 * s,x +   61.115 * s,y +  -21.028 * s,x +   63.133 * s,y +  -24.707 * s, threshold);
			_vr.bezier8(x +   63.133 * s,y +  -24.707 * s,x +   65.151 * s,y +  -28.385 * s,x +   66.161 * s,y +  -32.649 * s,x +   66.161 * s,y +  -37.499 * s, threshold);
			_vr.bezier8(x +   66.161 * s,y +  -37.499 * s,x +   66.161 * s,y +  -43.359 * s,x +   64.224 * s,y +  -48.054 * s,x +   60.350 * s,y +  -51.586 * s, threshold);
			_vr.bezier8(x +   60.350 * s,y +  -51.586 * s,x +   56.476 * s,y +  -55.118 * s,x +   51.480 * s,y +  -56.884 * s,x +   45.360 * s,y +  -56.884 * s, threshold);
			_vr.bezier8(x +   45.360 * s,y +  -56.884 * s,x +   35.822 * s,y +  -56.884 * s,x +   28.026 * s,y +  -53.547 * s,x +   21.972 * s,y +  -46.874 * s, threshold);
			_vr.bezier8(x +   21.972 * s,y +  -46.874 * s,x +   15.917 * s,y +  -40.201 * s,x +   12.890 * s,y +  -31.884 * s,x +   12.890 * s,y +  -21.923 * s, threshold);
			_vr.bezier8(x +   12.890 * s,y +  -21.923 * s,x +   12.890 * s,y +  -15.316 * s,x +   14.941 * s,y +   -9.969 * s,x +   19.042 * s,y +   -5.884 * s, threshold);
			_vr.bezier8(x +   19.042 * s,y +   -5.884 * s,x +   23.144 * s,y +   -1.798 * s,x +   28.499 * s,y +    0.244 * s,x +   35.106 * s,y +    0.244 * s, threshold);
			_vr.bezier8(x +   35.106 * s,y +    0.244 * s,x +   38.557 * s,y +    0.244 * s,x +   41.983 * s,y +   -0.326 * s,x +   45.385 * s,y +   -1.465 * s, threshold);
			_vr.bezier8(x +   45.385 * s,y +   -1.465 * s,x +   48.786 * s,y +   -2.604 * s,x +   51.382 * s,y +   -4.118 * s,x +   53.173 * s,y +   -6.006 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.885 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   58.885 * s,y +    0.977 * s,x +   55.988 * s,y +    3.385 * s,x +   52.196 * s,y +    5.330 * s,x +   47.509 * s,y +    6.811 * s, threshold);
			_vr.bezier8(x +   47.509 * s,y +    6.811 * s,x +   42.821 * s,y +    8.293 * s,x +   38.329 * s,y +    9.033 * s,x +   34.032 * s,y +    9.033 * s, threshold);
			_vr.bezier8(x +   34.032 * s,y +    9.033 * s,x +   24.885 * s,y +    9.033 * s,x +   17.415 * s,y +    6.282 * s,x +   11.620 * s,y +    0.781 * s, threshold);
			_vr.bezier8(x +   11.620 * s,y +    0.781 * s,x +    5.826 * s,y +   -4.720 * s,x +    2.929 * s,y +  -11.931 * s,x +    2.929 * s,y +  -20.849 * s, threshold);
			_vr.bezier8(x +    2.929 * s,y +  -20.849 * s,x +    2.929 * s,y +  -33.707 * s,x +    7.023 * s,y +  -44.392 * s,x +   15.209 * s,y +  -52.904 * s, threshold);
			_vr.bezier8(x +   15.209 * s,y +  -52.904 * s,x +   23.396 * s,y +  -61.417 * s,x +   33.805 * s,y +  -65.673 * s,x +   46.434 * s,y +  -65.673 * s, threshold);
			_vr.bezier8(x +   46.434 * s,y +  -65.673 * s,x +   55.419 * s,y +  -65.673 * s,x +   62.621 * s,y +  -63.313 * s,x +   68.040 * s,y +  -58.593 * s, threshold);
			_vr.bezier8(x +   68.040 * s,y +  -58.593 * s,x +   73.460 * s,y +  -53.873 * s,x +   76.170 * s,y +  -47.379 * s,x +   76.170 * s,y +  -39.111 * s, threshold);
			_vr.bezier8(x +   76.170 * s,y +  -39.111 * s,x +   76.170 * s,y +  -31.722 * s,x +   74.119 * s,y +  -25.219 * s,x +   70.018 * s,y +  -19.604 * s, threshold);
			_vr.bezier8(x +   70.018 * s,y +  -19.604 * s,x +   65.916 * s,y +  -13.989 * s,x +   60.627 * s,y +  -11.181 * s,x +   54.149 * s,y +  -11.181 * s, threshold);
			_vr.bezier8(x +   54.149 * s,y +  -11.181 * s,x +   49.917 * s,y +  -11.181 * s,x +   46.597 * s,y +  -12.467 * s,x +   44.188 * s,y +  -15.039 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   42.675 * s);
			_setf(o + ( 1 << 2), y +  -39.648 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   42.675 * s,y +  -39.648 * s,x +   39.387 * s,y +  -39.648 * s,x +   36.604 * s,y +  -37.939 * s,x +   34.325 * s,y +  -34.521 * s, threshold);
			_vr.bezier8(x +   34.325 * s,y +  -34.521 * s,x +   32.047 * s,y +  -31.103 * s,x +   30.907 * s,y +  -27.457 * s,x +   30.907 * s,y +  -23.584 * s, threshold);
			_vr.bezier8(x +   30.907 * s,y +  -23.584 * s,x +   30.907 * s,y +  -20.491 * s,x +   32.242 * s,y +  -18.945 * s,x +   34.911 * s,y +  -18.945 * s, threshold);
			_vr.bezier8(x +   34.911 * s,y +  -18.945 * s,x +   37.222 * s,y +  -18.945 * s,x +   39.151 * s,y +  -19.791 * s,x +   40.697 * s,y +  -21.484 * s, threshold);
			_vr.bezier8(x +   40.697 * s,y +  -21.484 * s,x +   42.243 * s,y +  -23.177 * s,x +   43.293 * s,y +  -25.325 * s,x +   43.846 * s,y +  -27.929 * s, threshold);
			_vr.bezier8(x +   43.846 * s,y +  -27.929 * s,x +   44.400 * s,y +  -30.533 * s,x +   45.083 * s,y +  -34.033 * s,x +   45.897 * s,y +  -38.427 * s, threshold);
			_vr.bezier8(x +   45.897 * s,y +  -38.427 * s,x +   44.953 * s,y +  -39.241 * s,x +   43.879 * s,y +  -39.648 * s,x +   42.675 * s,y +  -39.648 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   77.049 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 65:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   44.824 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   42.578 * s);
			_setf(o + ( 3 << 2), y +  -14.551 * s);
			_setf(o + ( 4 << 2), x +   16.992 * s);
			_setf(o + ( 5 << 2), y +  -14.551 * s);
			_setf(o + ( 6 << 2), x +    8.594 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   -4.639 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   38.818 * s);
			_setf(o + (11 << 2), y +  -72.509 * s);
			_setf(o + (12 << 2), x +   43.359 * s);
			_setf(o + (13 << 2), y +  -72.509 * s);
			_setf(o + (14 << 2), x +   58.056 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   44.824 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   37.109 * s);
			_setf(o + (19 << 2), y +  -50.780 * s);
			_setf(o + (20 << 2), x +   22.412 * s);
			_setf(o + (21 << 2), y +  -24.072 * s);
			_setf(o + (22 << 2), x +   41.162 * s);
			_setf(o + (23 << 2), y +  -24.072 * s);
			_setf(o + (24 << 2), x +   37.109 * s);
			_setf(o + (25 << 2), y +  -50.780 * s);
			_setf(o + (26 << 2), x +   61.376 * s);
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
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   46.923 * s);
			_setf(o + ( 1 << 2), y +  -39.941 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   46.923 * s,y +  -39.941 * s,x +   49.365 * s,y +  -38.867 * s,x +   51.407 * s,y +  -36.816 * s,x +   53.051 * s,y +  -33.789 * s, threshold);
			_vr.bezier8(x +   53.051 * s,y +  -33.789 * s,x +   54.695 * s,y +  -30.761 * s,x +   55.517 * s,y +  -27.539 * s,x +   55.517 * s,y +  -24.121 * s, threshold);
			_vr.bezier8(x +   55.517 * s,y +  -24.121 * s,x +   55.517 * s,y +  -15.885 * s,x +   52.620 * s,y +   -9.708 * s,x +   46.826 * s,y +   -5.591 * s, threshold);
			_vr.bezier8(x +   46.826 * s,y +   -5.591 * s,x +   41.031 * s,y +   -1.473 * s,x +   31.640 * s,y +    0.586 * s,x +   18.652 * s,y +    0.586 * s, threshold);
			_vr.bezier8(x +   18.652 * s,y +    0.586 * s,x +   14.388 * s,y +    0.586 * s,x +    9.049 * s,y +    0.391 * s,x +    2.637 * s,y +       0. * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   15.723 * s);
			_setf(o + ( 1 << 2), y +  -71.434 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   15.723 * s,y +  -71.434 * s,x +   21.191 * s,y +  -72.216 * s,x +   26.057 * s,y +  -72.606 * s,x +   30.322 * s,y +  -72.606 * s, threshold);
			_vr.bezier8(x +   30.322 * s,y +  -72.606 * s,x +   48.096 * s,y +  -72.606 * s,x +   56.982 * s,y +  -66.747 * s,x +   56.982 * s,y +  -55.028 * s, threshold);
			_vr.bezier8(x +   56.982 * s,y +  -55.028 * s,x +   56.982 * s,y +  -51.904 * s,x +   56.030 * s,y +  -48.966 * s,x +   54.125 * s,y +  -46.215 * s, threshold);
			_vr.bezier8(x +   54.125 * s,y +  -46.215 * s,x +   52.221 * s,y +  -43.464 * s,x +   49.820 * s,y +  -41.373 * s,x +   46.923 * s,y +  -39.941 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   26.758 * s);
			_setf(o + ( 1 << 2), y +  -61.522 * s);
			_setf(o + ( 2 << 2), x +   23.681 * s);
			_setf(o + ( 3 << 2), y +  -44.042 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   23.681 * s,y +  -44.042 * s,x +   25.602 * s,y +  -43.945 * s,x +   27.360 * s,y +  -43.896 * s,x +   28.955 * s,y +  -43.896 * s, threshold);
			_vr.bezier8(x +   28.955 * s,y +  -43.896 * s,x +   33.609 * s,y +  -43.896 * s,x +   37.320 * s,y +  -44.880 * s,x +   40.087 * s,y +  -46.850 * s, threshold);
			_vr.bezier8(x +   40.087 * s,y +  -46.850 * s,x +   42.854 * s,y +  -48.819 * s,x +   44.238 * s,y +  -51.659 * s,x +   44.238 * s,y +  -55.370 * s, threshold);
			_vr.bezier8(x +   44.238 * s,y +  -55.370 * s,x +   44.238 * s,y +  -59.667 * s,x +   40.462 * s,y +  -61.815 * s,x +   32.910 * s,y +  -61.815 * s, threshold);
			_vr.bezier8(x +   32.910 * s,y +  -61.815 * s,x +   31.347 * s,y +  -61.815 * s,x +   29.297 * s,y +  -61.718 * s,x +   26.758 * s,y +  -61.522 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   22.021 * s);
			_setf(o + ( 1 << 2), y +  -34.863 * s);
			_setf(o + ( 2 << 2), x +   17.431 * s);
			_setf(o + ( 3 << 2), y +  -10.400 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   17.431 * s,y +  -10.400 * s,x +   18.929 * s,y +  -10.237 * s,x +   20.361 * s,y +  -10.156 * s,x +   21.728 * s,y +  -10.156 * s, threshold);
			_vr.bezier8(x +   21.728 * s,y +  -10.156 * s,x +   28.239 * s,y +  -10.156 * s,x +   33.349 * s,y +  -11.271 * s,x +   37.060 * s,y +  -13.501 * s, threshold);
			_vr.bezier8(x +   37.060 * s,y +  -13.501 * s,x +   40.771 * s,y +  -15.731 * s,x +   42.626 * s,y +  -18.929 * s,x +   42.626 * s,y +  -23.095 * s, threshold);
			_vr.bezier8(x +   42.626 * s,y +  -23.095 * s,x +   42.626 * s,y +  -31.071 * s,x +   37.402 * s,y +  -35.058 * s,x +   26.953 * s,y +  -35.058 * s, threshold);
			_vr.bezier8(x +   26.953 * s,y +  -35.058 * s,x +   25.325 * s,y +  -35.058 * s,x +   23.681 * s,y +  -34.993 * s,x +   22.021 * s,y +  -34.863 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.984 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 67:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   56.883 * s);
			_setf(o + ( 1 << 2), y +  -57.763 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   56.883 * s,y +  -57.763 * s,x +   53.173 * s,y +  -60.399 * s,x +   49.055 * s,y +  -61.718 * s,x +   44.530 * s,y +  -61.718 * s, threshold);
			_vr.bezier8(x +   44.530 * s,y +  -61.718 * s,x +   37.206 * s,y +  -61.718 * s,x +   31.062 * s,y +  -58.227 * s,x +   26.098 * s,y +  -51.244 * s, threshold);
			_vr.bezier8(x +   26.098 * s,y +  -51.244 * s,x +   21.134 * s,y +  -44.262 * s,x +   18.652 * s,y +  -36.523 * s,x +   18.652 * s,y +  -28.027 * s, threshold);
			_vr.bezier8(x +   18.652 * s,y +  -28.027 * s,x +   18.652 * s,y +  -22.526 * s,x +   20.003 * s,y +  -18.131 * s,x +   22.704 * s,y +  -14.844 * s, threshold);
			_vr.bezier8(x +   22.704 * s,y +  -14.844 * s,x +   25.406 * s,y +  -11.556 * s,x +   29.166 * s,y +   -9.912 * s,x +   33.983 * s,y +   -9.912 * s, threshold);
			_vr.bezier8(x +   33.983 * s,y +   -9.912 * s,x +   41.470 * s,y +   -9.912 * s,x +   47.346 * s,y +  -11.946 * s,x +   51.610 * s,y +  -16.015 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   51.366 * s);
			_setf(o + ( 1 << 2), y +   -4.834 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   51.366 * s,y +   -4.834 * s,x +   46.744 * s,y +   -0.798 * s,x +   40.087 * s,y +    1.221 * s,x +   31.396 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   31.396 * s,y +    1.221 * s,x +   23.648 * s,y +    1.221 * s,x +   17.398 * s,y +   -1.326 * s,x +   12.646 * s,y +   -6.421 * s, threshold);
			_vr.bezier8(x +   12.646 * s,y +   -6.421 * s,x +    7.893 * s,y +  -11.515 * s,x +    5.517 * s,y +  -18.131 * s,x +    5.517 * s,y +  -26.269 * s, threshold);
			_vr.bezier8(x +    5.517 * s,y +  -26.269 * s,x +    5.517 * s,y +  -39.420 * s,x +    9.171 * s,y +  -50.455 * s,x +   16.479 * s,y +  -59.374 * s, threshold);
			_vr.bezier8(x +   16.479 * s,y +  -59.374 * s,x +   23.787 * s,y +  -68.293 * s,x +   33.332 * s,y +  -72.753 * s,x +   45.116 * s,y +  -72.753 * s, threshold);
			_vr.bezier8(x +   45.116 * s,y +  -72.753 * s,x +   50.878 * s,y +  -72.753 * s,x +   55.988 * s,y +  -71.809 * s,x +   60.448 * s,y +  -69.921 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   56.883 * s);
			_setf(o + ( 1 << 2), y +  -57.763 * s);
			_setf(o + ( 2 << 2), x +   61.278 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 68:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   19.384 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    2.099 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   15.136 * s);
			_setf(o + ( 5 << 2), y +  -71.386 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   15.136 * s,y +  -71.386 * s,x +   19.889 * s,y +  -72.232 * s,x +   24.348 * s,y +  -72.655 * s,x +   28.515 * s,y +  -72.655 * s, threshold);
			_vr.bezier8(x +   28.515 * s,y +  -72.655 * s,x +   39.420 * s,y +  -72.655 * s,x +   47.851 * s,y +  -70.165 * s,x +   53.808 * s,y +  -65.185 * s, threshold);
			_vr.bezier8(x +   53.808 * s,y +  -65.185 * s,x +   59.765 * s,y +  -60.204 * s,x +   62.743 * s,y +  -52.994 * s,x +   62.743 * s,y +  -43.554 * s, threshold);
			_vr.bezier8(x +   62.743 * s,y +  -43.554 * s,x +   62.743 * s,y +  -30.305 * s,x +   58.804 * s,y +  -19.734 * s,x +   50.927 * s,y +  -11.841 * s, threshold);
			_vr.bezier8(x +   50.927 * s,y +  -11.841 * s,x +   43.049 * s,y +   -3.947 * s,x +   32.535 * s,y +       0. * s,x +   19.384 * s,y +       0. * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   25.732 * s);
			_setf(o + ( 1 << 2), y +  -61.083 * s);
			_setf(o + ( 2 << 2), x +   17.041 * s);
			_setf(o + ( 3 << 2), y +  -11.377 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   17.041 * s,y +  -11.377 * s,x +   18.473 * s,y +  -11.247 * s,x +   19.775 * s,y +  -11.181 * s,x +   20.947 * s,y +  -11.181 * s, threshold);
			_vr.bezier8(x +   20.947 * s,y +  -11.181 * s,x +   29.671 * s,y +  -11.181 * s,x +   36.604 * s,y +  -14.258 * s,x +   41.747 * s,y +  -20.410 * s, threshold);
			_vr.bezier8(x +   41.747 * s,y +  -20.410 * s,x +   46.890 * s,y +  -26.562 * s,x +   49.462 * s,y +  -34.456 * s,x +   49.462 * s,y +  -44.091 * s, threshold);
			_vr.bezier8(x +   49.462 * s,y +  -44.091 * s,x +   49.462 * s,y +  -49.365 * s,x +   47.688 * s,y +  -53.596 * s,x +   44.140 * s,y +  -56.786 * s, threshold);
			_vr.bezier8(x +   44.140 * s,y +  -56.786 * s,x +   40.592 * s,y +  -59.976 * s,x +   36.035 * s,y +  -61.571 * s,x +   30.468 * s,y +  -61.571 * s, threshold);
			_vr.bezier8(x +   30.468 * s,y +  -61.571 * s,x +   28.906 * s,y +  -61.571 * s,x +   27.327 * s,y +  -61.409 * s,x +   25.732 * s,y +  -61.083 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   63.231 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 69:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   59.179 * s);
			_setf(o + ( 1 << 2), y +  -60.399 * s);
			_setf(o + ( 2 << 2), x +   26.221 * s);
			_setf(o + ( 3 << 2), y +  -60.399 * s);
			_setf(o + ( 4 << 2), x +   23.242 * s);
			_setf(o + ( 5 << 2), y +  -43.945 * s);
			_setf(o + ( 6 << 2), x +   46.875 * s);
			_setf(o + ( 7 << 2), y +  -43.945 * s);
			_setf(o + ( 8 << 2), x +   44.873 * s);
			_setf(o + ( 9 << 2), y +  -33.300 * s);
			_setf(o + (10 << 2), x +   21.240 * s);
			_setf(o + (11 << 2), y +  -33.300 * s);
			_setf(o + (12 << 2), x +   17.236 * s);
			_setf(o + (13 << 2), y +  -11.133 * s);
			_setf(o + (14 << 2), x +   49.658 * s);
			_setf(o + (15 << 2), y +  -11.133 * s);
			_setf(o + (16 << 2), x +   47.558 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +    2.051 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   15.235 * s);
			_setf(o + (21 << 2), y +  -71.532 * s);
			_setf(o + (22 << 2), x +   61.279 * s);
			_setf(o + (23 << 2), y +  -71.532 * s);
			_setf(o + (24 << 2), x +   59.179 * s);
			_setf(o + (25 << 2), y +  -60.399 * s);
			_setf(o + (26 << 2), x +   59.326 * s);
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
			_setf(o + ( 0 << 2), x +   60.546 * s);
			_setf(o + ( 1 << 2), y +  -60.399 * s);
			_setf(o + ( 2 << 2), x +   26.123 * s);
			_setf(o + ( 3 << 2), y +  -60.399 * s);
			_setf(o + ( 4 << 2), x +   23.144 * s);
			_setf(o + ( 5 << 2), y +  -43.945 * s);
			_setf(o + ( 6 << 2), x +   48.290 * s);
			_setf(o + ( 7 << 2), y +  -43.945 * s);
			_setf(o + ( 8 << 2), x +   46.288 * s);
			_setf(o + ( 9 << 2), y +  -33.300 * s);
			_setf(o + (10 << 2), x +   21.142 * s);
			_setf(o + (11 << 2), y +  -33.300 * s);
			_setf(o + (12 << 2), x +   15.039 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +    2.002 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   15.283 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   62.597 * s);
			_setf(o + (19 << 2), y +  -71.532 * s);
			_setf(o + (20 << 2), x +   60.546 * s);
			_setf(o + (21 << 2), y +  -60.399 * s);
			_setf(o + (22 << 2), x +   58.544 * s);
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
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.788 * s);
			_setf(o + ( 1 << 2), y +   -6.494 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   58.788 * s,y +   -6.494 * s,x +   51.432 * s,y +   -1.351 * s,x +   42.431 * s,y +    1.221 * s,x +   31.787 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   31.787 * s,y +    1.221 * s,x +   23.584 * s,y +    1.221 * s,x +   16.919 * s,y +   -1.408 * s,x +   11.792 * s,y +   -6.665 * s, threshold);
			_vr.bezier8(x +   11.792 * s,y +   -6.665 * s,x +    6.665 * s,y +  -11.922 * s,x +    4.101 * s,y +  -18.587 * s,x +    4.101 * s,y +  -26.660 * s, threshold);
			_vr.bezier8(x +    4.101 * s,y +  -26.660 * s,x +    4.101 * s,y +  -40.820 * s,x +    8.000 * s,y +  -52.042 * s,x +   15.796 * s,y +  -60.326 * s, threshold);
			_vr.bezier8(x +   15.796 * s,y +  -60.326 * s,x +   23.592 * s,y +  -68.611 * s,x +   34.212 * s,y +  -72.753 * s,x +   47.656 * s,y +  -72.753 * s, threshold);
			_vr.bezier8(x +   47.656 * s,y +  -72.753 * s,x +   54.947 * s,y +  -72.753 * s,x +   60.367 * s,y +  -71.125 * s,x +   63.915 * s,y +  -67.870 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.107 * s);
			_setf(o + ( 1 << 2), y +  -57.275 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   60.107 * s,y +  -57.275 * s,x +   55.321 * s,y +  -60.172 * s,x +   50.552 * s,y +  -61.620 * s,x +   45.800 * s,y +  -61.620 * s, threshold);
			_vr.bezier8(x +   45.800 * s,y +  -61.620 * s,x +   37.206 * s,y +  -61.620 * s,x +   30.305 * s,y +  -58.471 * s,x +   25.097 * s,y +  -52.172 * s, threshold);
			_vr.bezier8(x +   25.097 * s,y +  -52.172 * s,x +   19.889 * s,y +  -45.873 * s,x +   17.285 * s,y +  -37.988 * s,x +   17.285 * s,y +  -28.515 * s, threshold);
			_vr.bezier8(x +   17.285 * s,y +  -28.515 * s,x +   17.285 * s,y +  -22.656 * s,x +   18.896 * s,y +  -18.091 * s,x +   22.119 * s,y +  -14.819 * s, threshold);
			_vr.bezier8(x +   22.119 * s,y +  -14.819 * s,x +   25.341 * s,y +  -11.548 * s,x +   29.752 * s,y +   -9.912 * s,x +   35.351 * s,y +   -9.912 * s, threshold);
			_vr.bezier8(x +   35.351 * s,y +   -9.912 * s,x +   40.006 * s,y +   -9.912 * s,x +   44.075 * s,y +  -11.198 * s,x +   47.558 * s,y +  -13.769 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   50.146 * s);
			_setf(o + ( 1 << 2), y +  -27.929 * s);
			_setf(o + ( 2 << 2), x +   40.234 * s);
			_setf(o + ( 3 << 2), y +  -27.929 * s);
			_setf(o + ( 4 << 2), x +   42.187 * s);
			_setf(o + ( 5 << 2), y +  -38.574 * s);
			_setf(o + ( 6 << 2), x +   64.696 * s);
			_setf(o + ( 7 << 2), y +  -38.574 * s);
			_setf(o + ( 8 << 2), x +   58.788 * s);
			_setf(o + ( 9 << 2), y +   -6.494 * s);
			_setf(o + (10 << 2), x +   67.626 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 72:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   56.737 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   43.896 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   49.999 * s);
			_setf(o + ( 5 << 2), y +  -33.300 * s);
			_setf(o + ( 6 << 2), x +   21.582 * s);
			_setf(o + ( 7 << 2), y +  -33.300 * s);
			_setf(o + ( 8 << 2), x +   15.478 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +    2.588 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   15.722 * s);
			_setf(o + (13 << 2), y +  -71.532 * s);
			_setf(o + (14 << 2), x +   28.613 * s);
			_setf(o + (15 << 2), y +  -71.532 * s);
			_setf(o + (16 << 2), x +   23.535 * s);
			_setf(o + (17 << 2), y +  -43.945 * s);
			_setf(o + (18 << 2), x +   51.952 * s);
			_setf(o + (19 << 2), y +  -43.945 * s);
			_setf(o + (20 << 2), x +   57.030 * s);
			_setf(o + (21 << 2), y +  -71.532 * s);
			_setf(o + (22 << 2), x +   69.970 * s);
			_setf(o + (23 << 2), y +  -71.532 * s);
			_setf(o + (24 << 2), x +   56.737 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   67.821 * s);
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
			_setf(o + ( 0 << 2), x +   16.064 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    3.320 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   16.455 * s);
			_setf(o + ( 5 << 2), y +  -71.532 * s);
			_setf(o + ( 6 << 2), x +   29.248 * s);
			_setf(o + ( 7 << 2), y +  -71.532 * s);
			_setf(o + ( 8 << 2), x +   16.064 * s);
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
			_setf(o + ( 0 << 2), x +   -0.147 * s);
			_setf(o + ( 1 << 2), y +  -16.406 * s);
			_setf(o + ( 2 << 2), x +   11.035 * s);
			_setf(o + ( 3 << 2), y +  -16.406 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   11.035 * s,y +  -16.406 * s,x +   10.970 * s,y +  -12.239 * s,x +   12.711 * s,y +  -10.156 * s,x +   16.259 * s,y +  -10.156 * s, threshold);
			_vr.bezier8(x +   16.259 * s,y +  -10.156 * s,x +   18.994 * s,y +  -10.156 * s,x +   21.272 * s,y +  -10.612 * s,x +   23.095 * s,y +  -11.523 * s, threshold);
			_vr.bezier8(x +   23.095 * s,y +  -11.523 * s,x +   24.918 * s,y +  -12.435 * s,x +   26.277 * s,y +  -13.810 * s,x +   27.172 * s,y +  -15.649 * s, threshold);
			_vr.bezier8(x +   27.172 * s,y +  -15.649 * s,x +   28.067 * s,y +  -17.488 * s,x +   29.001 * s,y +  -21.227 * s,x +   30.029 * s,y +  -26.855 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   38.183 * s);
			_setf(o + ( 1 << 2), y +  -71.532 * s);
			_setf(o + ( 2 << 2), x +   50.780 * s);
			_setf(o + ( 3 << 2), y +  -71.532 * s);
			_setf(o + ( 4 << 2), x +   42.577 * s);
			_setf(o + ( 5 << 2), y +  -26.806 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   42.577 * s,y +  -26.806 * s,x +   40.524 * s,y +  -15.609 * s,x +   37.361 * s,y +   -8.179 * s,x +   33.080 * s,y +   -4.517 * s, threshold);
			_vr.bezier8(x +   33.080 * s,y +   -4.517 * s,x +   28.800 * s,y +   -0.854 * s,x +   22.705 * s,y +    0.977 * s,x +   14.794 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   14.794 * s,y +    0.977 * s,x +   10.172 * s,y +    0.977 * s,x +    6.478 * s,y +   -0.252 * s,x +    3.711 * s,y +   -2.710 * s, threshold);
			_vr.bezier8(x +    3.711 * s,y +   -2.710 * s,x +    0.944 * s,y +   -5.168 * s,x +   -0.440 * s,y +   -8.528 * s,x +   -0.440 * s,y +  -12.793 * s, threshold);
			_vr.bezier8(x +   -0.440 * s,y +  -12.793 * s,x +   -0.440 * s,y +  -13.769 * s,x +   -0.342 * s,y +  -14.974 * s,x +   -0.147 * s,y +  -16.406 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   49.853 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 75:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   39.794 * s);
			_setf(o + ( 1 << 2), y +  -40.087 * s);
			_setf(o + ( 2 << 2), x +   57.567 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   43.261 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   29.882 * s);
			_setf(o + ( 7 << 2), y +  -30.566 * s);
			_setf(o + ( 8 << 2), x +   19.726 * s);
			_setf(o + ( 9 << 2), y +  -19.384 * s);
			_setf(o + (10 << 2), x +   16.113 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    3.417 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   16.552 * s);
			_setf(o + (15 << 2), y +  -71.532 * s);
			_setf(o + (16 << 2), x +   29.247 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   23.339 * s);
			_setf(o + (19 << 2), y +  -39.013 * s);
			_setf(o + (20 << 2), x +   53.026 * s);
			_setf(o + (21 << 2), y +  -71.532 * s);
			_setf(o + (22 << 2), x +   68.065 * s);
			_setf(o + (23 << 2), y +  -71.532 * s);
			_setf(o + (24 << 2), x +   39.794 * s);
			_setf(o + (25 << 2), y +  -40.087 * s);
			_setf(o + (26 << 2), x +   64.989 * s);
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
			_setf(o + ( 0 << 2), x +   47.558 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    2.441 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   15.576 * s);
			_setf(o + ( 5 << 2), y +  -71.532 * s);
			_setf(o + ( 6 << 2), x +   28.368 * s);
			_setf(o + ( 7 << 2), y +  -71.532 * s);
			_setf(o + ( 8 << 2), x +   17.285 * s);
			_setf(o + ( 9 << 2), y +  -11.133 * s);
			_setf(o + (10 << 2), x +   49.608 * s);
			_setf(o + (11 << 2), y +  -11.133 * s);
			_setf(o + (12 << 2), x +   47.558 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   52.831 * s);
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
			_setf(o + ( 0 << 2), x +   60.546 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   59.716 * s);
			_setf(o + ( 3 << 2), y +  -38.720 * s);
			_setf(o + ( 4 << 2), x +   37.988 * s);
			_setf(o + ( 5 << 2), y +    0.977 * s);
			_setf(o + ( 6 << 2), x +   33.544 * s);
			_setf(o + ( 7 << 2), y +    0.977 * s);
			_setf(o + ( 8 << 2), x +   26.464 * s);
			_setf(o + ( 9 << 2), y +  -39.111 * s);
			_setf(o + (10 << 2), x +   11.474 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   -0.781 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   25.781 * s);
			_setf(o + (15 << 2), y +  -71.532 * s);
			_setf(o + (16 << 2), x +   32.910 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   40.136 * s);
			_setf(o + (19 << 2), y +  -26.171 * s);
			_setf(o + (20 << 2), x +   63.769 * s);
			_setf(o + (21 << 2), y +  -71.532 * s);
			_setf(o + (22 << 2), x +   71.093 * s);
			_setf(o + (23 << 2), y +  -71.532 * s);
			_setf(o + (24 << 2), x +   73.143 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   60.546 * s);
			_setf(o + (27 << 2), y +       0. * s);
			_setf(o + (28 << 2), x +   78.612 * s);
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
			_setf(o + ( 0 << 2), x +   54.345 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			_setf(o + ( 2 << 2), x +   49.413 * s);
			_setf(o + ( 3 << 2), y +    0.977 * s);
			_setf(o + ( 4 << 2), x +   23.046 * s);
			_setf(o + ( 5 << 2), y +  -45.263 * s);
			_setf(o + ( 6 << 2), x +   15.136 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    2.539 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   15.674 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   21.533 * s);
			_setf(o + (13 << 2), y +  -71.532 * s);
			_setf(o + (14 << 2), x +   47.362 * s);
			_setf(o + (15 << 2), y +  -27.197 * s);
			_setf(o + (16 << 2), x +   55.126 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   67.675 * s);
			_setf(o + (19 << 2), y +  -71.532 * s);
			_setf(o + (20 << 2), x +   54.345 * s);
			_setf(o + (21 << 2), y +    0.977 * s);
			_setf(o + (22 << 2), x +   66.015 * s);
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
			_setf(o + ( 0 << 2), x +    4.834 * s);
			_setf(o + ( 1 << 2), y +  -26.611 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +    4.834 * s,y +  -26.611 * s,x +    4.834 * s,y +  -39.338 * s,x +    8.309 * s,y +  -50.219 * s,x +   15.258 * s,y +  -59.252 * s, threshold);
			_vr.bezier8(x +   15.258 * s,y +  -59.252 * s,x +   22.208 * s,y +  -68.285 * s,x +   31.249 * s,y +  -72.802 * s,x +   42.382 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   42.382 * s,y +  -72.802 * s,x +   50.943 * s,y +  -72.802 * s,x +   57.535 * s,y +  -70.531 * s,x +   62.157 * s,y +  -65.990 * s, threshold);
			_vr.bezier8(x +   62.157 * s,y +  -65.990 * s,x +   66.779 * s,y +  -61.449 * s,x +   69.090 * s,y +  -54.882 * s,x +   69.090 * s,y +  -46.288 * s, threshold);
			_vr.bezier8(x +   69.090 * s,y +  -46.288 * s,x +   69.090 * s,y +  -32.194 * s,x +   65.542 * s,y +  -20.752 * s,x +   58.446 * s,y +  -11.963 * s, threshold);
			_vr.bezier8(x +   58.446 * s,y +  -11.963 * s,x +   51.350 * s,y +   -3.174 * s,x +   41.633 * s,y +    1.221 * s,x +   29.296 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   29.296 * s,y +    1.221 * s,x +   21.744 * s,y +    1.221 * s,x +   15.779 * s,y +   -1.326 * s,x +   11.401 * s,y +   -6.421 * s, threshold);
			_vr.bezier8(x +   11.401 * s,y +   -6.421 * s,x +    7.023 * s,y +  -11.515 * s,x +    4.834 * s,y +  -18.245 * s,x +    4.834 * s,y +  -26.611 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   18.017 * s);
			_setf(o + ( 1 << 2), y +  -27.929 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   18.017 * s,y +  -27.929 * s,x +   18.017 * s,y +  -22.428 * s,x +   19.108 * s,y +  -18.050 * s,x +   21.289 * s,y +  -14.795 * s, threshold);
			_vr.bezier8(x +   21.289 * s,y +  -14.795 * s,x +   23.470 * s,y +  -11.540 * s,x +   26.659 * s,y +   -9.912 * s,x +   30.859 * s,y +   -9.912 * s, threshold);
			_vr.bezier8(x +   30.859 * s,y +   -9.912 * s,x +   38.606 * s,y +   -9.912 * s,x +   44.725 * s,y +  -13.395 * s,x +   49.218 * s,y +  -20.361 * s, threshold);
			_vr.bezier8(x +   49.218 * s,y +  -20.361 * s,x +   53.710 * s,y +  -27.327 * s,x +   55.956 * s,y +  -35.644 * s,x +   55.956 * s,y +  -45.312 * s, threshold);
			_vr.bezier8(x +   55.956 * s,y +  -45.312 * s,x +   55.956 * s,y +  -56.249 * s,x +   51.138 * s,y +  -61.718 * s,x +   41.503 * s,y +  -61.718 * s, threshold);
			_vr.bezier8(x +   41.503 * s,y +  -61.718 * s,x +   34.732 * s,y +  -61.718 * s,x +   29.125 * s,y +  -58.137 * s,x +   24.682 * s,y +  -50.976 * s, threshold);
			_vr.bezier8(x +   24.682 * s,y +  -50.976 * s,x +   20.239 * s,y +  -43.814 * s,x +   18.017 * s,y +  -36.133 * s,x +   18.017 * s,y +  -27.929 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   70.213 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 80:
			
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   20.215 * s);
			_setf(o + ( 1 << 2), y +  -26.269 * s);
			_setf(o + ( 2 << 2), x +   15.381 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    2.393 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   15.869 * s);
			_setf(o + ( 7 << 2), y +  -71.434 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_vr.bezier8(x +   15.869 * s,y +  -71.434 * s,x +   22.673 * s,y +  -72.151 * s,x +   27.864 * s,y +  -72.509 * s,x +   31.445 * s,y +  -72.509 * s, threshold);
			_vr.bezier8(x +   31.445 * s,y +  -72.509 * s,x +   50.357 * s,y +  -72.509 * s,x +   59.814 * s,y +  -65.397 * s,x +   59.814 * s,y +  -51.171 * s, threshold);
			_vr.bezier8(x +   59.814 * s,y +  -51.171 * s,x +   59.814 * s,y +  -43.163 * s,x +   56.941 * s,y +  -36.873 * s,x +   51.196 * s,y +  -32.299 * s, threshold);
			_vr.bezier8(x +   51.196 * s,y +  -32.299 * s,x +   45.450 * s,y +  -27.726 * s,x +   38.004 * s,y +  -25.439 * s,x +   28.857 * s,y +  -25.439 * s, threshold);
			_vr.bezier8(x +   28.857 * s,y +  -25.439 * s,x +   25.928 * s,y +  -25.439 * s,x +   23.047 * s,y +  -25.716 * s,x +   20.215 * s,y +  -26.269 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   26.465 * s);
			_setf(o + ( 1 << 2), y +  -60.692 * s);
			_setf(o + ( 2 << 2), x +   22.217 * s);
			_setf(o + ( 3 << 2), y +  -37.109 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   22.217 * s,y +  -37.109 * s,x +   23.877 * s,y +  -36.653 * s,x +   25.993 * s,y +  -36.425 * s,x +   28.564 * s,y +  -36.425 * s, threshold);
			_vr.bezier8(x +   28.564 * s,y +  -36.425 * s,x +   34.098 * s,y +  -36.425 * s,x +   38.493 * s,y +  -37.613 * s,x +   41.748 * s,y +  -39.990 * s, threshold);
			_vr.bezier8(x +   41.748 * s,y +  -39.990 * s,x +   45.003 * s,y +  -42.366 * s,x +   46.631 * s,y +  -45.784 * s,x +   46.631 * s,y +  -50.243 * s, threshold);
			_vr.bezier8(x +   46.631 * s,y +  -50.243 * s,x +   46.631 * s,y +  -57.763 * s,x +   42.366 * s,y +  -61.522 * s,x +   33.838 * s,y +  -61.522 * s, threshold);
			_vr.bezier8(x +   33.838 * s,y +  -61.522 * s,x +   31.559 * s,y +  -61.522 * s,x +   29.101 * s,y +  -61.246 * s,x +   26.465 * s,y +  -60.692 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.349 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 81:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   38.134 * s);
			_setf(o + ( 1 << 2), y +    0.879 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   38.134 * s,y +    0.879 * s,x +   35.693 * s,y +    1.465 * s,x +   33.040 * s,y +    1.758 * s,x +   30.175 * s,y +    1.758 * s, threshold);
			_vr.bezier8(x +   30.175 * s,y +    1.758 * s,x +   22.330 * s,y +    1.758 * s,x +   16.284 * s,y +   -0.724 * s,x +   12.036 * s,y +   -5.688 * s, threshold);
			_vr.bezier8(x +   12.036 * s,y +   -5.688 * s,x +    7.788 * s,y +  -10.652 * s,x +    5.664 * s,y +  -17.529 * s,x +    5.664 * s,y +  -26.318 * s, threshold);
			_vr.bezier8(x +    5.664 * s,y +  -26.318 * s,x +    5.664 * s,y +  -39.111 * s,x +    9.131 * s,y +  -50.056 * s,x +   16.064 * s,y +  -59.154 * s, threshold);
			_vr.bezier8(x +   16.064 * s,y +  -59.154 * s,x +   22.998 * s,y +  -68.253 * s,x +   32.047 * s,y +  -72.802 * s,x +   43.212 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   43.212 * s,y +  -72.802 * s,x +   51.741 * s,y +  -72.802 * s,x +   58.324 * s,y +  -70.499 * s,x +   62.963 * s,y +  -65.893 * s, threshold);
			_vr.bezier8(x +   62.963 * s,y +  -65.893 * s,x +   67.602 * s,y +  -61.286 * s,x +   69.921 * s,y +  -54.703 * s,x +   69.921 * s,y +  -46.142 * s, threshold);
			_vr.bezier8(x +   69.921 * s,y +  -46.142 * s,x +   69.921 * s,y +  -36.051 * s,x +   68.000 * s,y +  -27.099 * s,x +   64.159 * s,y +  -19.287 * s, threshold);
			_vr.bezier8(x +   64.159 * s,y +  -19.287 * s,x +   60.318 * s,y +  -11.474 * s,x +   54.849 * s,y +   -5.908 * s,x +   47.753 * s,y +   -2.588 * s, threshold);
			_vr.bezier8(x +   47.753 * s,y +   -2.588 * s,x +   49.120 * s,y +    0.179 * s,x +   51.480 * s,y +    2.336 * s,x +   54.833 * s,y +    3.882 * s, threshold);
			_vr.bezier8(x +   54.833 * s,y +    3.882 * s,x +   58.186 * s,y +    5.428 * s,x +   61.767 * s,y +    6.201 * s,x +   65.575 * s,y +    6.201 * s, threshold);
			_vr.bezier8(x +   65.575 * s,y +    6.201 * s,x +   69.579 * s,y +    6.201 * s,x +   73.306 * s,y +    5.029 * s,x +   76.757 * s,y +    2.686 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   81.444 * s);
			_setf(o + ( 1 << 2), y +   10.303 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   81.444 * s,y +   10.303 * s,x +   77.278 * s,y +   15.543 * s,x +   71.142 * s,y +   18.164 * s,x +   63.036 * s,y +   18.164 * s, threshold);
			_vr.bezier8(x +   63.036 * s,y +   18.164 * s,x +   57.535 * s,y +   18.164 * s,x +   52.514 * s,y +   16.593 * s,x +   47.973 * s,y +   13.452 * s, threshold);
			_vr.bezier8(x +   47.973 * s,y +   13.452 * s,x +   43.432 * s,y +   10.311 * s,x +   40.152 * s,y +    6.120 * s,x +   38.134 * s,y +    0.879 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   18.847 * s);
			_setf(o + ( 1 << 2), y +  -27.636 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   18.847 * s,y +  -27.636 * s,x +   18.847 * s,y +  -22.005 * s,x +   19.946 * s,y +  -17.570 * s,x +   22.143 * s,y +  -14.331 * s, threshold);
			_vr.bezier8(x +   22.143 * s,y +  -14.331 * s,x +   24.340 * s,y +  -11.092 * s,x +   27.539 * s,y +   -9.473 * s,x +   31.738 * s,y +   -9.473 * s, threshold);
			_vr.bezier8(x +   31.738 * s,y +   -9.473 * s,x +   39.453 * s,y +   -9.473 * s,x +   45.556 * s,y +  -12.972 * s,x +   50.048 * s,y +  -19.970 * s, threshold);
			_vr.bezier8(x +   50.048 * s,y +  -19.970 * s,x +   54.540 * s,y +  -26.969 * s,x +   56.786 * s,y +  -35.351 * s,x +   56.786 * s,y +  -45.116 * s, threshold);
			_vr.bezier8(x +   56.786 * s,y +  -45.116 * s,x +   56.786 * s,y +  -56.119 * s,x +   51.985 * s,y +  -61.620 * s,x +   42.382 * s,y +  -61.620 * s, threshold);
			_vr.bezier8(x +   42.382 * s,y +  -61.620 * s,x +   35.612 * s,y +  -61.620 * s,x +   29.996 * s,y +  -58.015 * s,x +   25.537 * s,y +  -50.805 * s, threshold);
			_vr.bezier8(x +   25.537 * s,y +  -50.805 * s,x +   21.077 * s,y +  -43.595 * s,x +   18.847 * s,y +  -35.872 * s,x +   18.847 * s,y +  -27.636 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   76.952 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 82:
			
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   41.259 * s);
			_setf(o + ( 1 << 2), y +  -31.689 * s);
			_setf(o + ( 2 << 2), x +   57.226 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   42.919 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   29.248 * s);
			_setf(o + ( 7 << 2), y +  -29.589 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_vr.bezier8(x +   29.248 * s,y +  -29.589 * s,x +   27.034 * s,y +  -29.622 * s,x +   24.316 * s,y +  -29.752 * s,x +   21.093 * s,y +  -29.980 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   15.576 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    2.490 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   15.576 * s);
			_setf(o + ( 5 << 2), y +  -71.532 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   15.576 * s,y +  -71.532 * s,x +   25.081 * s,y +  -72.020 * s,x +   31.315 * s,y +  -72.265 * s,x +   34.277 * s,y +  -72.265 * s, threshold);
			_vr.bezier8(x +   34.277 * s,y +  -72.265 * s,x +   41.992 * s,y +  -72.265 * s,x +   48.087 * s,y +  -70.775 * s,x +   52.563 * s,y +  -67.797 * s, threshold);
			_vr.bezier8(x +   52.563 * s,y +  -67.797 * s,x +   57.039 * s,y +  -64.818 * s,x +   59.276 * s,y +  -60.513 * s,x +   59.276 * s,y +  -54.882 * s, threshold);
			_vr.bezier8(x +   59.276 * s,y +  -54.882 * s,x +   59.276 * s,y +  -49.153 * s,x +   57.641 * s,y +  -44.181 * s,x +   54.369 * s,y +  -39.965 * s, threshold);
			_vr.bezier8(x +   54.369 * s,y +  -39.965 * s,x +   51.098 * s,y +  -35.750 * s,x +   46.728 * s,y +  -32.991 * s,x +   41.259 * s,y +  -31.689 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   26.660 * s);
			_setf(o + ( 1 << 2), y +  -60.546 * s);
			_setf(o + ( 2 << 2), x +   22.998 * s);
			_setf(o + ( 3 << 2), y +  -40.527 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   22.998 * s,y +  -40.527 * s,x +   24.918 * s,y +  -40.331 * s,x +   26.627 * s,y +  -40.234 * s,x +   28.125 * s,y +  -40.234 * s, threshold);
			_vr.bezier8(x +   28.125 * s,y +  -40.234 * s,x +   40.430 * s,y +  -40.234 * s,x +   46.581 * s,y +  -44.140 * s,x +   46.581 * s,y +  -51.952 * s, threshold);
			_vr.bezier8(x +   46.581 * s,y +  -51.952 * s,x +   46.581 * s,y +  -55.240 * s,x +   45.401 * s,y +  -57.576 * s,x +   43.041 * s,y +  -58.959 * s, threshold);
			_vr.bezier8(x +   43.041 * s,y +  -58.959 * s,x +   40.681 * s,y +  -60.342 * s,x +   36.767 * s,y +  -61.034 * s,x +   31.298 * s,y +  -61.034 * s, threshold);
			_vr.bezier8(x +   31.298 * s,y +  -61.034 * s,x +   30.843 * s,y +  -61.034 * s,x +   29.296 * s,y +  -60.871 * s,x +   26.660 * s,y +  -60.546 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   62.353 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 83:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   45.897 * s);
			_setf(o + ( 1 << 2), y +  -57.421 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   45.897 * s,y +  -57.421 * s,x +   42.121 * s,y +  -60.188 * s,x +   38.280 * s,y +  -61.571 * s,x +   34.374 * s,y +  -61.571 * s, threshold);
			_vr.bezier8(x +   34.374 * s,y +  -61.571 * s,x +   26.529 * s,y +  -61.571 * s,x +   22.607 * s,y +  -58.609 * s,x +   22.607 * s,y +  -52.685 * s, threshold);
			_vr.bezier8(x +   22.607 * s,y +  -52.685 * s,x +   22.607 * s,y +  -50.178 * s,x +   24.714 * s,y +  -47.212 * s,x +   28.857 * s,y +  -43.701 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.229 * s);
			_setf(o + ( 1 << 2), y +  -37.451 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   36.229 * s,y +  -37.451 * s,x +   38.519 * s,y +  -35.510 * s,x +   40.087 * s,y +  -34.073 * s,x +   40.966 * s,y +  -33.178 * s, threshold);
			_vr.bezier8(x +   40.966 * s,y +  -33.178 * s,x +   41.845 * s,y +  -32.283 * s,x +   42.772 * s,y +  -31.038 * s,x +   43.749 * s,y +  -29.443 * s, threshold);
			_vr.bezier8(x +   43.749 * s,y +  -29.443 * s,x +   44.725 * s,y +  -27.848 * s,x +   45.458 * s,y +  -26.237 * s,x +   45.946 * s,y +  -24.609 * s, threshold);
			_vr.bezier8(x +   45.946 * s,y +  -24.609 * s,x +   46.434 * s,y +  -22.981 * s,x +   46.679 * s,y +  -21.321 * s,x +   46.679 * s,y +  -19.629 * s, threshold);
			_vr.bezier8(x +   46.679 * s,y +  -19.629 * s,x +   46.679 * s,y +  -13.086 * s,x +   44.229 * s,y +   -7.975 * s,x +   39.330 * s,y +   -4.297 * s, threshold);
			_vr.bezier8(x +   39.330 * s,y +   -4.297 * s,x +   34.431 * s,y +   -0.618 * s,x +   28.075 * s,y +    1.221 * s,x +   20.263 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   20.263 * s,y +    1.221 * s,x +   13.850 * s,y +    1.221 * s,x +    7.796 * s,y +   -0.163 * s,x +    2.099 * s,y +   -2.930 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    6.201 * s);
			_setf(o + ( 1 << 2), y +  -15.478 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    6.201 * s,y +  -15.478 * s,x +   10.563 * s,y +  -12.191 * s,x +   15.624 * s,y +  -10.547 * s,x +   21.386 * s,y +  -10.547 * s, threshold);
			_vr.bezier8(x +   21.386 * s,y +  -10.547 * s,x +   24.869 * s,y +  -10.547 * s,x +   27.758 * s,y +  -11.287 * s,x +   30.053 * s,y +  -12.768 * s, threshold);
			_vr.bezier8(x +   30.053 * s,y +  -12.768 * s,x +   32.348 * s,y +  -14.249 * s,x +   33.495 * s,y +  -16.357 * s,x +   33.495 * s,y +  -19.091 * s, threshold);
			_vr.bezier8(x +   33.495 * s,y +  -19.091 * s,x +   33.495 * s,y +  -21.793 * s,x +   31.382 * s,y +  -24.734 * s,x +   27.245 * s,y +  -28.027 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   19.579 * s);
			_setf(o + ( 1 << 2), y +  -34.130 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   19.579 * s,y +  -34.130 * s,x +   17.225 * s,y +  -36.005 * s,x +   15.649 * s,y +  -37.385 * s,x +   14.819 * s,y +  -38.232 * s, threshold);
			_vr.bezier8(x +   14.819 * s,y +  -38.232 * s,x +   13.989 * s,y +  -39.078 * s,x +   13.118 * s,y +  -40.258 * s,x +   12.206 * s,y +  -41.772 * s, threshold);
			_vr.bezier8(x +   12.206 * s,y +  -41.772 * s,x +   11.295 * s,y +  -43.285 * s,x +   10.611 * s,y +  -44.840 * s,x +   10.156 * s,y +  -46.435 * s, threshold);
			_vr.bezier8(x +   10.156 * s,y +  -46.435 * s,x +    9.700 * s,y +  -48.030 * s,x +    9.472 * s,y +  -49.674 * s,x +    9.472 * s,y +  -51.366 * s, threshold);
			_vr.bezier8(x +    9.472 * s,y +  -51.366 * s,x +    9.472 * s,y +  -57.942 * s,x +   11.653 * s,y +  -63.150 * s,x +   16.015 * s,y +  -66.991 * s, threshold);
			_vr.bezier8(x +   16.015 * s,y +  -66.991 * s,x +   20.377 * s,y +  -70.832 * s,x +   26.089 * s,y +  -72.753 * s,x +   33.153 * s,y +  -72.753 * s, threshold);
			_vr.bezier8(x +   33.153 * s,y +  -72.753 * s,x +   35.497 * s,y +  -72.753 * s,x +   38.492 * s,y +  -72.484 * s,x +   42.138 * s,y +  -71.947 * s, threshold);
			_vr.bezier8(x +   42.138 * s,y +  -71.947 * s,x +   45.783 * s,y +  -71.410 * s,x +   48.339 * s,y +  -70.800 * s,x +   49.804 * s,y +  -70.116 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   45.897 * s);
			_setf(o + ( 1 << 2), y +  -57.421 * s);
			_setf(o + ( 2 << 2), x +   50.145 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 84:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +   67.919 * s);
			_setf(o + ( 1 << 2), y +  -60.399 * s);
			_setf(o + ( 2 << 2), x +   45.361 * s);
			_setf(o + ( 3 << 2), y +  -60.399 * s);
			_setf(o + ( 4 << 2), x +   34.326 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   21.484 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   32.519 * s);
			_setf(o + ( 9 << 2), y +  -60.399 * s);
			_setf(o + (10 << 2), x +    9.766 * s);
			_setf(o + (11 << 2), y +  -60.399 * s);
			_setf(o + (12 << 2), x +   11.817 * s);
			_setf(o + (13 << 2), y +  -71.532 * s);
			_setf(o + (14 << 2), x +   70.019 * s);
			_setf(o + (15 << 2), y +  -71.532 * s);
			_setf(o + (16 << 2), x +   67.919 * s);
			_setf(o + (17 << 2), y +  -60.399 * s);
			_setf(o + (18 << 2), x +   68.505 * s);
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
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   59.423 * s);
			_setf(o + ( 1 << 2), y +  -22.021 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   59.423 * s,y +  -22.021 * s,x +   58.066 * s,y +  -14.663 * s,x +   54.638 * s,y +   -8.952 * s,x +   49.169 * s,y +   -4.883 * s, threshold);
			_vr.bezier8(x +   49.169 * s,y +   -4.883 * s,x +   43.701 * s,y +   -0.814 * s,x +   36.930 * s,y +    1.221 * s,x +   28.857 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   28.857 * s,y +    1.221 * s,x +   22.119 * s,y +    1.221 * s,x +   16.626 * s,y +   -0.399 * s,x +   12.378 * s,y +   -3.638 * s, threshold);
			_vr.bezier8(x +   12.378 * s,y +   -3.638 * s,x +    8.130 * s,y +   -6.877 * s,x +    6.006 * s,y +  -11.344 * s,x +    6.006 * s,y +  -17.041 * s, threshold);
			_vr.bezier8(x +    6.006 * s,y +  -17.041 * s,x +    6.006 * s,y +  -18.766 * s,x +    6.185 * s,y +  -20.605 * s,x +    6.543 * s,y +  -22.558 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   15.527 * s);
			_setf(o + ( 1 << 2), y +  -71.532 * s);
			_setf(o + ( 2 << 2), x +   28.613 * s);
			_setf(o + ( 3 << 2), y +  -71.532 * s);
			_setf(o + ( 4 << 2), x +   19.482 * s);
			_setf(o + ( 5 << 2), y +  -22.802 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   19.482 * s,y +  -22.802 * s,x +   19.318 * s,y +  -21.924 * s,x +   19.238 * s,y +  -20.996 * s,x +   19.238 * s,y +  -20.019 * s, threshold);
			_vr.bezier8(x +   19.238 * s,y +  -20.019 * s,x +   19.238 * s,y +  -16.797 * s,x +   20.231 * s,y +  -14.306 * s,x +   22.217 * s,y +  -12.549 * s, threshold);
			_vr.bezier8(x +   22.217 * s,y +  -12.549 * s,x +   24.202 * s,y +  -10.791 * s,x +   26.904 * s,y +   -9.912 * s,x +   30.322 * s,y +   -9.912 * s, threshold);
			_vr.bezier8(x +   30.322 * s,y +   -9.912 * s,x +   34.684 * s,y +   -9.912 * s,x +   38.313 * s,y +  -11.100 * s,x +   41.210 * s,y +  -13.476 * s, threshold);
			_vr.bezier8(x +   41.210 * s,y +  -13.476 * s,x +   44.107 * s,y +  -15.853 * s,x +   45.929 * s,y +  -19.192 * s,x +   46.728 * s,y +  -23.486 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   55.663 * s);
			_setf(o + ( 1 << 2), y +  -71.532 * s);
			_setf(o + ( 2 << 2), x +   68.554 * s);
			_setf(o + ( 3 << 2), y +  -71.532 * s);
			_setf(o + ( 4 << 2), x +   59.423 * s);
			_setf(o + ( 5 << 2), y +  -22.021 * s);
			_setf(o + ( 6 << 2), x +   66.161 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			
			case 86:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +   32.910 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			_setf(o + ( 2 << 2), x +   25.976 * s);
			_setf(o + ( 3 << 2), y +    0.977 * s);
			_setf(o + ( 4 << 2), x +   11.621 * s);
			_setf(o + ( 5 << 2), y +  -71.532 * s);
			_setf(o + ( 6 << 2), x +   25.195 * s);
			_setf(o + ( 7 << 2), y +  -71.532 * s);
			_setf(o + ( 8 << 2), x +   33.740 * s);
			_setf(o + ( 9 << 2), y +  -24.072 * s);
			_setf(o + (10 << 2), x +   58.837 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   73.046 * s);
			_setf(o + (13 << 2), y +  -71.532 * s);
			_setf(o + (14 << 2), x +   32.910 * s);
			_setf(o + (15 << 2), y +    0.977 * s);
			_setf(o + (16 << 2), x +   68.309 * s);
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
			_setf(o + ( 0 << 2), x +   62.108 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			_setf(o + ( 2 << 2), x +   56.981 * s);
			_setf(o + ( 3 << 2), y +    0.977 * s);
			_setf(o + ( 4 << 2), x +   49.217 * s);
			_setf(o + ( 5 << 2), y +  -42.675 * s);
			_setf(o + ( 6 << 2), x +   26.024 * s);
			_setf(o + ( 7 << 2), y +    0.977 * s);
			_setf(o + ( 8 << 2), x +   20.898 * s);
			_setf(o + ( 9 << 2), y +    0.977 * s);
			_setf(o + (10 << 2), x +   10.791 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   23.731 * s);
			_setf(o + (13 << 2), y +  -71.532 * s);
			_setf(o + (14 << 2), x +   29.149 * s);
			_setf(o + (15 << 2), y +  -28.173 * s);
			_setf(o + (16 << 2), x +   51.708 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   57.225 * s);
			_setf(o + (19 << 2), y +  -71.532 * s);
			_setf(o + (20 << 2), x +   63.866 * s);
			_setf(o + (21 << 2), y +  -28.466 * s);
			_setf(o + (22 << 2), x +   84.764 * s);
			_setf(o + (23 << 2), y +  -71.532 * s);
			_setf(o + (24 << 2), x +   98.533 * s);
			_setf(o + (25 << 2), y +  -71.532 * s);
			_setf(o + (26 << 2), x +   62.108 * s);
			_setf(o + (27 << 2), y +    0.977 * s);
			_setf(o + (28 << 2), x +   92.625 * s);
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
			_setf(o + ( 0 << 2), x +   41.406 * s);
			_setf(o + ( 1 << 2), y +  -36.181 * s);
			_setf(o + ( 2 << 2), x +   58.251 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   44.238 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   32.910 * s);
			_setf(o + ( 7 << 2), y +  -25.244 * s);
			_setf(o + ( 8 << 2), x +   13.672 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   -1.123 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   27.587 * s);
			_setf(o + (13 << 2), y +  -37.695 * s);
			_setf(o + (14 << 2), x +   13.965 * s);
			_setf(o + (15 << 2), y +  -71.581 * s);
			_setf(o + (16 << 2), x +   27.050 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   36.279 * s);
			_setf(o + (19 << 2), y +  -47.704 * s);
			_setf(o + (20 << 2), x +   55.566 * s);
			_setf(o + (21 << 2), y +  -71.532 * s);
			_setf(o + (22 << 2), x +   70.360 * s);
			_setf(o + (23 << 2), y +  -71.532 * s);
			_setf(o + (24 << 2), x +   41.406 * s);
			_setf(o + (25 << 2), y +  -36.181 * s);
			_setf(o + (26 << 2), x +   65.673 * s);
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
			_setf(o + ( 0 << 2), x +   41.405 * s);
			_setf(o + ( 1 << 2), y +  -31.640 * s);
			_setf(o + ( 2 << 2), x +   35.595 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   22.998 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   28.906 * s);
			_setf(o + ( 7 << 2), y +  -32.031 * s);
			_setf(o + ( 8 << 2), x +   12.060 * s);
			_setf(o + ( 9 << 2), y +  -71.532 * s);
			_setf(o + (10 << 2), x +   25.292 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   36.816 * s);
			_setf(o + (13 << 2), y +  -43.554 * s);
			_setf(o + (14 << 2), x +   58.251 * s);
			_setf(o + (15 << 2), y +  -71.532 * s);
			_setf(o + (16 << 2), x +   72.753 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   41.405 * s);
			_setf(o + (19 << 2), y +  -31.640 * s);
			_setf(o + (20 << 2), x +   68.358 * s);
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
			_setf(o + ( 0 << 2), x +   23.535 * s);
			_setf(o + ( 1 << 2), y +  -11.133 * s);
			_setf(o + ( 2 << 2), x +   52.685 * s);
			_setf(o + ( 3 << 2), y +  -11.133 * s);
			_setf(o + ( 4 << 2), x +   50.585 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    4.248 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    4.248 * s);
			_setf(o + ( 9 << 2), y +   -4.053 * s);
			_setf(o + (10 << 2), x +   42.968 * s);
			_setf(o + (11 << 2), y +  -60.399 * s);
			_setf(o + (12 << 2), x +   13.574 * s);
			_setf(o + (13 << 2), y +  -60.399 * s);
			_setf(o + (14 << 2), x +   15.625 * s);
			_setf(o + (15 << 2), y +  -71.532 * s);
			_setf(o + (16 << 2), x +   60.937 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   60.937 * s);
			_setf(o + (19 << 2), y +  -67.479 * s);
			_setf(o + (20 << 2), x +   23.535 * s);
			_setf(o + (21 << 2), y +  -11.133 * s);
			_setf(o + (22 << 2), x +   61.132 * s);
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
			_setf(o + ( 0 << 2), x +   45.068 * s);
			_setf(o + ( 1 << 2), y +  -62.401 * s);
			_setf(o + ( 2 << 2), x +   32.226 * s);
			_setf(o + ( 3 << 2), y +  -62.401 * s);
			_setf(o + ( 4 << 2), x +   19.189 * s);
			_setf(o + ( 5 << 2), y +    9.180 * s);
			_setf(o + ( 6 << 2), x +   32.031 * s);
			_setf(o + ( 7 << 2), y +    9.180 * s);
			_setf(o + ( 8 << 2), x +   29.931 * s);
			_setf(o + ( 9 << 2), y +   20.508 * s);
			_setf(o + (10 << 2), x +    3.369 * s);
			_setf(o + (11 << 2), y +   20.508 * s);
			_setf(o + (12 << 2), x +   20.605 * s);
			_setf(o + (13 << 2), y +  -73.729 * s);
			_setf(o + (14 << 2), x +   47.167 * s);
			_setf(o + (15 << 2), y +  -73.729 * s);
			_setf(o + (16 << 2), x +   45.068 * s);
			_setf(o + (17 << 2), y +  -62.401 * s);
			_setf(o + (18 << 2), x +   48.534 * s);
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
			_setf(o + ( 0 << 2), x +   34.668 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    8.350 * s);
			_setf(o + ( 3 << 2), y +  -71.825 * s);
			_setf(o + ( 4 << 2), x +   18.897 * s);
			_setf(o + ( 5 << 2), y +  -71.825 * s);
			_setf(o + ( 6 << 2), x +   45.263 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   34.668 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   47.754 * s);
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
			_setf(o + ( 0 << 2), x +   26.952 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			_setf(o + ( 2 << 2), x +    0.390 * s);
			_setf(o + ( 3 << 2), y +   20.508 * s);
			_setf(o + ( 4 << 2), x +    2.490 * s);
			_setf(o + ( 5 << 2), y +    9.180 * s);
			_setf(o + ( 6 << 2), x +   15.331 * s);
			_setf(o + ( 7 << 2), y +    9.180 * s);
			_setf(o + ( 8 << 2), x +   28.368 * s);
			_setf(o + ( 9 << 2), y +  -62.401 * s);
			_setf(o + (10 << 2), x +   15.527 * s);
			_setf(o + (11 << 2), y +  -62.401 * s);
			_setf(o + (12 << 2), x +   17.626 * s);
			_setf(o + (13 << 2), y +  -73.729 * s);
			_setf(o + (14 << 2), x +   44.188 * s);
			_setf(o + (15 << 2), y +  -73.729 * s);
			_setf(o + (16 << 2), x +   26.952 * s);
			_setf(o + (17 << 2), y +   20.508 * s);
			_setf(o + (18 << 2), x +   48.534 * s);
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
			_setf(o + ( 0 << 2), x +   43.310 * s);
			_setf(o + ( 1 << 2), y +  -44.286 * s);
			_setf(o + ( 2 << 2), x +   32.861 * s);
			_setf(o + ( 3 << 2), y +  -61.767 * s);
			_setf(o + ( 4 << 2), x +   22.216 * s);
			_setf(o + ( 5 << 2), y +  -44.091 * s);
			_setf(o + ( 6 << 2), x +   12.842 * s);
			_setf(o + ( 7 << 2), y +  -44.091 * s);
			_setf(o + ( 8 << 2), x +   30.322 * s);
			_setf(o + ( 9 << 2), y +  -71.825 * s);
			_setf(o + (10 << 2), x +   35.546 * s);
			_setf(o + (11 << 2), y +  -71.825 * s);
			_setf(o + (12 << 2), x +   52.929 * s);
			_setf(o + (13 << 2), y +  -44.286 * s);
			_setf(o + (14 << 2), x +   43.310 * s);
			_setf(o + (15 << 2), y +  -44.286 * s);
			_setf(o + (16 << 2), x +   58.593 * s);
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
			_setf(o + ( 1 << 2), y +   16.308 * s);
			_setf(o + ( 2 << 2), x +   -0.391 * s);
			_setf(o + ( 3 << 2), y +    6.103 * s);
			_setf(o + ( 4 << 2), x +   58.934 * s);
			_setf(o + ( 5 << 2), y +    6.103 * s);
			_setf(o + ( 6 << 2), x +   58.934 * s);
			_setf(o + ( 7 << 2), y +   16.308 * s);
			_setf(o + ( 8 << 2), x +   -0.391 * s);
			_setf(o + ( 9 << 2), y +   16.308 * s);
			_setf(o + (10 << 2), x +   58.593 * s);
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
			_setf(o + ( 0 << 2), x +   31.103 * s);
			_setf(o + ( 1 << 2), y +  -62.743 * s);
			_setf(o + ( 2 << 2), x +   23.632 * s);
			_setf(o + ( 3 << 2), y +  -79.003 * s);
			_setf(o + ( 4 << 2), x +   37.304 * s);
			_setf(o + ( 5 << 2), y +  -79.003 * s);
			_setf(o + ( 6 << 2), x +   39.013 * s);
			_setf(o + ( 7 << 2), y +  -62.743 * s);
			_setf(o + ( 8 << 2), x +   31.103 * s);
			_setf(o + ( 9 << 2), y +  -62.743 * s);
			_setf(o + (10 << 2), x +   58.593 * s);
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
			_setf(o + ( 0 << 2), x +   48.241 * s);
			_setf(o + ( 1 << 2), y +  -18.750 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   48.241 * s,y +  -18.750 * s,x +   48.014 * s,y +  -17.545 * s,x +   47.899 * s,y +  -16.211 * s,x +   47.899 * s,y +  -14.746 * s, threshold);
			_vr.bezier8(x +   47.899 * s,y +  -14.746 * s,x +   47.899 * s,y +   -7.584 * s,x +   48.453 * s,y +   -2.669 * s,x +   49.559 * s,y +       0. * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   41.942 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   41.942 * s,y +       0. * s,x +   39.664 * s,y +       0. * s,x +   37.971 * s,y +   -1.742 * s,x +   36.864 * s,y +   -5.225 * s, threshold);
			_vr.bezier8(x +   36.864 * s,y +   -5.225 * s,x +   32.698 * s,y +   -1.090 * s,x +   27.506 * s,y +    0.977 * s,x +   21.288 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   21.288 * s,y +    0.977 * s,x +   15.624 * s,y +    0.977 * s,x +   11.238 * s,y +   -0.618 * s,x +    8.129 * s,y +   -3.808 * s, threshold);
			_vr.bezier8(x +    8.129 * s,y +   -3.808 * s,x +    5.021 * s,y +   -6.999 * s,x +    3.466 * s,y +  -11.442 * s,x +    3.466 * s,y +  -17.138 * s, threshold);
			_vr.bezier8(x +    3.466 * s,y +  -17.138 * s,x +    3.466 * s,y +  -27.066 * s,x +    6.469 * s,y +  -35.571 * s,x +   12.475 * s,y +  -42.651 * s, threshold);
			_vr.bezier8(x +   12.475 * s,y +  -42.651 * s,x +   18.481 * s,y +  -49.731 * s,x +   26.057 * s,y +  -53.271 * s,x +   35.204 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   35.204 * s,y +  -53.271 * s,x +   44.025 * s,y +  -53.271 * s,x +   50.389 * s,y +  -52.457 * s,x +   54.296 * s,y +  -50.829 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   48.241 * s);
			_setf(o + ( 1 << 2), y +  -18.750 * s);
			_setf(o + ( 2 << 2), x +   34.130 * s);
			_setf(o + ( 3 << 2), y +  -43.310 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_vr.bezier8(x +   34.130 * s,y +  -43.310 * s,x +   28.661 * s,y +  -43.310 * s,x +   24.299 * s,y +  -40.698 * s,x +   21.044 * s,y +  -35.473 * s, threshold);
			_vr.bezier8(x +   21.044 * s,y +  -35.473 * s,x +   17.789 * s,y +  -30.249 * s,x +   16.161 * s,y +  -24.235 * s,x +   16.161 * s,y +  -17.431 * s, threshold);
			_vr.bezier8(x +   16.161 * s,y +  -17.431 * s,x +   16.161 * s,y +  -11.800 * s,x +   18.928 * s,y +   -8.984 * s,x +   24.462 * s,y +   -8.984 * s, threshold);
			_vr.bezier8(x +   24.462 * s,y +   -8.984 * s,x +   27.978 * s,y +   -8.984 * s,x +   31.046 * s,y +  -11.149 * s,x +   33.666 * s,y +  -15.478 * s, threshold);
			_vr.bezier8(x +   33.666 * s,y +  -15.478 * s,x +   36.286 * s,y +  -19.808 * s,x +   38.622 * s,y +  -28.759 * s,x +   40.673 * s,y +  -42.333 * s, threshold);
			_vr.bezier8(x +   40.673 * s,y +  -42.333 * s,x +   38.362 * s,y +  -42.984 * s,x +   36.181 * s,y +  -43.310 * s,x +   34.130 * s,y +  -43.310 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   59.276 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 98:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   25.293 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   25.293 * s,y +    0.977 * s,x +   20.117 * s,y +    0.977 * s,x +   16.308 * s,y +   -0.667 * s,x +   13.867 * s,y +   -3.955 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    9.961 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    1.025 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_vr.bezier8(x +    1.025 * s,y +       0. * s,x +    4.150 * s,y +   -7.975 * s,x +    6.294 * s,y +  -15.134 * s,x +    7.422 * s,y +  -21.484 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   16.699 * s);
			_setf(o + ( 1 << 2), y +  -73.729 * s);
			_setf(o + ( 2 << 2), x +   28.613 * s);
			_setf(o + ( 3 << 2), y +  -73.729 * s);
			_setf(o + ( 4 << 2), x +   24.511 * s);
			_setf(o + ( 5 << 2), y +  -50.341 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   24.511 * s,y +  -50.341 * s,x +   27.539 * s,y +  -52.294 * s,x +   31.233 * s,y +  -53.271 * s,x +   35.595 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   35.595 * s,y +  -53.271 * s,x +   42.138 * s,y +  -53.271 * s,x +   47.297 * s,y +  -51.089 * s,x +   51.073 * s,y +  -46.728 * s, threshold);
			_vr.bezier8(x +   51.073 * s,y +  -46.728 * s,x +   54.653 * s,y +  -42.593 * s,x +   56.444 * s,y +  -37.190 * s,x +   56.444 * s,y +  -30.517 * s, threshold);
			_vr.bezier8(x +   56.444 * s,y +  -30.517 * s,x +   56.444 * s,y +  -21.825 * s,x +   53.417 * s,y +  -14.404 * s,x +   47.363 * s,y +   -8.252 * s, threshold);
			_vr.bezier8(x +   47.363 * s,y +   -8.252 * s,x +   41.308 * s,y +   -2.100 * s,x +   33.951 * s,y +    0.977 * s,x +   25.293 * s,y +    0.977 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   30.859 * s);
			_setf(o + ( 1 << 2), y +  -42.968 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   30.859 * s,y +  -42.968 * s,x +   27.571 * s,y +  -42.968 * s,x +   24.739 * s,y +  -41.568 * s,x +   22.363 * s,y +  -38.769 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   17.627 * s);
			_setf(o + ( 1 << 2), y +  -12.939 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   17.627 * s,y +  -12.939 * s,x +   18.864 * s,y +  -10.400 * s,x +   21.321 * s,y +   -9.131 * s,x +   25.000 * s,y +   -9.131 * s, threshold);
			_vr.bezier8(x +   25.000 * s,y +   -9.131 * s,x +   30.696 * s,y +   -9.131 * s,x +   35.265 * s,y +  -11.172 * s,x +   38.671 * s,y +  -15.283 * s, threshold);
			_vr.bezier8(x +   38.671 * s,y +  -15.283 * s,x +   41.873 * s,y +  -19.147 * s,x +   43.456 * s,y +  -23.990 * s,x +   43.456 * s,y +  -29.785 * s, threshold);
			_vr.bezier8(x +   43.456 * s,y +  -29.785 * s,x +   43.456 * s,y +  -38.574 * s,x +   39.257 * s,y +  -42.968 * s,x +   30.859 * s,y +  -42.968 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   59.325 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 99:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   45.263 * s);
			_setf(o + ( 1 << 2), y +  -39.355 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   45.263 * s,y +  -39.355 * s,x +   41.845 * s,y +  -41.861 * s,x +   38.395 * s,y +  -43.115 * s,x +   34.912 * s,y +  -43.115 * s, threshold);
			_vr.bezier8(x +   34.912 * s,y +  -43.115 * s,x +   29.313 * s,y +  -43.115 * s,x +   24.813 * s,y +  -41.023 * s,x +   21.411 * s,y +  -36.840 * s, threshold);
			_vr.bezier8(x +   21.411 * s,y +  -36.840 * s,x +   18.009 * s,y +  -32.657 * s,x +   16.309 * s,y +  -27.425 * s,x +   16.309 * s,y +  -21.142 * s, threshold);
			_vr.bezier8(x +   16.309 * s,y +  -21.142 * s,x +   16.309 * s,y +  -17.887 * s,x +   17.269 * s,y +  -15.104 * s,x +   19.189 * s,y +  -12.793 * s, threshold);
			_vr.bezier8(x +   19.189 * s,y +  -12.793 * s,x +   21.110 * s,y +  -10.482 * s,x +   23.584 * s,y +   -9.326 * s,x +   26.611 * s,y +   -9.326 * s, threshold);
			_vr.bezier8(x +   26.611 * s,y +   -9.326 * s,x +   30.973 * s,y +   -9.326 * s,x +   36.100 * s,y +  -11.181 * s,x +   41.992 * s,y +  -14.892 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   40.527 * s);
			_setf(o + ( 1 << 2), y +   -2.148 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   40.527 * s,y +   -2.148 * s,x +   35.547 * s,y +   -0.065 * s,x +   30.420 * s,y +    0.977 * s,x +   25.146 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   25.146 * s,y +    0.977 * s,x +   18.538 * s,y +    0.977 * s,x +   13.306 * s,y +   -0.855 * s,x +    9.448 * s,y +   -4.516 * s, threshold);
			_vr.bezier8(x +    9.448 * s,y +   -4.516 * s,x +    5.591 * s,y +   -8.179 * s,x +    3.662 * s,y +  -13.216 * s,x +    3.662 * s,y +  -19.629 * s, threshold);
			_vr.bezier8(x +    3.662 * s,y +  -19.629 * s,x +    3.662 * s,y +  -29.362 * s,x +    6.478 * s,y +  -37.402 * s,x +   12.109 * s,y +  -43.749 * s, threshold);
			_vr.bezier8(x +   12.109 * s,y +  -43.749 * s,x +   17.741 * s,y +  -50.097 * s,x +   25.114 * s,y +  -53.271 * s,x +   34.228 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   34.228 * s,y +  -53.271 * s,x +   39.436 * s,y +  -53.271 * s,x +   43.945 * s,y +  -52.196 * s,x +   47.753 * s,y +  -50.048 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   45.263 * s);
			_setf(o + ( 1 << 2), y +  -39.355 * s);
			_setf(o + ( 2 << 2), x +   49.267 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 100:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   47.314 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   35.156 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   36.083 * s);
			_setf(o + ( 5 << 2), y +   -4.883 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   36.083 * s,y +   -4.883 * s,x +   33.382 * s,y +   -0.977 * s,x +   28.906 * s,y +    0.977 * s,x +   22.656 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   22.656 * s,y +    0.977 * s,x +   16.536 * s,y +    0.977 * s,x +   11.751 * s,y +   -0.822 * s,x +    8.301 * s,y +   -4.419 * s, threshold);
			_vr.bezier8(x +    8.301 * s,y +   -4.419 * s,x +    4.850 * s,y +   -8.016 * s,x +    3.125 * s,y +  -12.907 * s,x +    3.125 * s,y +  -19.091 * s, threshold);
			_vr.bezier8(x +    3.125 * s,y +  -19.091 * s,x +    3.125 * s,y +  -29.084 * s,x +    5.908 * s,y +  -37.280 * s,x +   11.474 * s,y +  -43.676 * s, threshold);
			_vr.bezier8(x +   11.474 * s,y +  -43.676 * s,x +   17.041 * s,y +  -50.072 * s,x +   24.446 * s,y +  -53.271 * s,x +   33.691 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   33.691 * s,y +  -53.271 * s,x +   35.449 * s,y +  -53.271 * s,x +   37.418 * s,y +  -52.929 * s,x +   39.599 * s,y +  -52.245 * s, threshold);
			_vr.bezier8(x +   39.599 * s,y +  -52.245 * s,x +   41.780 * s,y +  -51.562 * s,x +   43.359 * s,y +  -50.813 * s,x +   44.335 * s,y +  -49.999 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   48.827 * s);
			_setf(o + ( 1 << 2), y +  -73.729 * s);
			_setf(o + ( 2 << 2), x +   60.644 * s);
			_setf(o + ( 3 << 2), y +  -73.729 * s);
			_setf(o + ( 4 << 2), x +   47.314 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   34.521 * s);
			_setf(o + ( 7 << 2), y +  -42.968 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			_vr.bezier8(x +   34.521 * s,y +  -42.968 * s,x +   28.889 * s,y +  -42.968 * s,x +   24.406 * s,y +  -40.901 * s,x +   21.069 * s,y +  -36.767 * s, threshold);
			_vr.bezier8(x +   21.069 * s,y +  -36.767 * s,x +   17.733 * s,y +  -32.633 * s,x +   16.064 * s,y +  -27.376 * s,x +   16.064 * s,y +  -20.996 * s, threshold);
			_vr.bezier8(x +   16.064 * s,y +  -20.996 * s,x +   16.064 * s,y +  -13.053 * s,x +   19.352 * s,y +   -9.082 * s,x +   25.927 * s,y +   -9.082 * s, threshold);
			_vr.bezier8(x +   25.927 * s,y +   -9.082 * s,x +   33.023 * s,y +   -9.082 * s,x +   37.622 * s,y +  -14.748 * s,x +   39.746 * s,y +  -26.074 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   42.089 * s);
			_setf(o + ( 1 << 2), y +  -38.574 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   42.089 * s,y +  -38.574 * s,x +   40.527 * s,y +  -41.503 * s,x +   38.004 * s,y +  -42.968 * s,x +   34.521 * s,y +  -42.968 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   59.325 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 101:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   16.748 * s);
			_setf(o + ( 1 << 2), y +  -22.705 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   16.748 * s,y +  -22.705 * s,x +   16.683 * s,y +  -21.858 * s,x +   16.650 * s,y +  -21.126 * s,x +   16.650 * s,y +  -20.507 * s, threshold);
			_vr.bezier8(x +   16.650 * s,y +  -20.507 * s,x +   16.650 * s,y +  -16.862 * s,x +   17.733 * s,y +  -14.062 * s,x +   19.897 * s,y +  -12.109 * s, threshold);
			_vr.bezier8(x +   19.897 * s,y +  -12.109 * s,x +   22.062 * s,y +  -10.156 * s,x +   25.065 * s,y +   -9.180 * s,x +   28.906 * s,y +   -9.180 * s, threshold);
			_vr.bezier8(x +   28.906 * s,y +   -9.180 * s,x +   30.957 * s,y +   -9.180 * s,x +   33.317 * s,y +   -9.741 * s,x +   35.986 * s,y +  -10.864 * s, threshold);
			_vr.bezier8(x +   35.986 * s,y +  -10.864 * s,x +   38.655 * s,y +  -11.987 * s,x +   40.755 * s,y +  -13.248 * s,x +   42.285 * s,y +  -14.648 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   40.869 * s);
			_setf(o + ( 1 << 2), y +   -1.807 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   40.869 * s,y +   -1.807 * s,x +   36.735 * s,y +    0.049 * s,x +   31.689 * s,y +    0.977 * s,x +   25.732 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   25.732 * s,y +    0.977 * s,x +   19.287 * s,y +    0.977 * s,x +   14.063 * s,y +   -1.058 * s,x +   10.059 * s,y +   -5.127 * s, threshold);
			_vr.bezier8(x +   10.059 * s,y +   -5.127 * s,x +    6.055 * s,y +   -9.196 * s,x +    4.053 * s,y +  -14.778 * s,x +    4.053 * s,y +  -21.875 * s, threshold);
			_vr.bezier8(x +    4.053 * s,y +  -21.875 * s,x +    4.053 * s,y +  -30.859 * s,x +    6.942 * s,y +  -38.338 * s,x +   12.720 * s,y +  -44.311 * s, threshold);
			_vr.bezier8(x +   12.720 * s,y +  -44.311 * s,x +   18.498 * s,y +  -50.284 * s,x +   26.058 * s,y +  -53.271 * s,x +   35.400 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   35.400 * s,y +  -53.271 * s,x +   40.901 * s,y +  -53.271 * s,x +   45.361 * s,y +  -52.107 * s,x +   48.779 * s,y +  -49.779 * s, threshold);
			_vr.bezier8(x +   48.779 * s,y +  -49.779 * s,x +   52.197 * s,y +  -47.452 * s,x +   53.906 * s,y +  -44.124 * s,x +   53.906 * s,y +  -39.794 * s, threshold);
			_vr.bezier8(x +   53.906 * s,y +  -39.794 * s,x +   53.906 * s,y +  -33.902 * s,x +   51.359 * s,y +  -29.280 * s,x +   46.264 * s,y +  -25.927 * s, threshold);
			_vr.bezier8(x +   46.264 * s,y +  -25.927 * s,x +   41.170 * s,y +  -22.574 * s,x +   34.896 * s,y +  -20.898 * s,x +   27.441 * s,y +  -20.898 * s, threshold);
			_vr.bezier8(x +   27.441 * s,y +  -20.898 * s,x +   23.796 * s,y +  -20.898 * s,x +   20.231 * s,y +  -21.500 * s,x +   16.748 * s,y +  -22.705 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   19.092 * s);
			_setf(o + ( 1 << 2), y +  -31.933 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   19.092 * s,y +  -31.933 * s,x +   21.208 * s,y +  -31.315 * s,x +   23.503 * s,y +  -31.005 * s,x +   25.976 * s,y +  -31.005 * s, threshold);
			_vr.bezier8(x +   25.976 * s,y +  -31.005 * s,x +   30.404 * s,y +  -31.005 * s,x +   34.147 * s,y +  -31.681 * s,x +   37.207 * s,y +  -33.032 * s, threshold);
			_vr.bezier8(x +   37.207 * s,y +  -33.032 * s,x +   40.267 * s,y +  -34.383 * s,x +   41.797 * s,y +  -36.328 * s,x +   41.797 * s,y +  -38.867 * s, threshold);
			_vr.bezier8(x +   41.797 * s,y +  -38.867 * s,x +   41.797 * s,y +  -41.699 * s,x +   38.704 * s,y +  -43.115 * s,x +   32.519 * s,y +  -43.115 * s, threshold);
			_vr.bezier8(x +   32.519 * s,y +  -43.115 * s,x +   30.078 * s,y +  -43.115 * s,x +   27.588 * s,y +  -42.048 * s,x +   25.049 * s,y +  -39.916 * s, threshold);
			_vr.bezier8(x +   25.049 * s,y +  -39.916 * s,x +   22.510 * s,y +  -37.784 * s,x +   20.524 * s,y +  -35.123 * s,x +   19.092 * s,y +  -31.933 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   55.175 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 102:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   45.361 * s);
			_setf(o + ( 1 << 2), y +  -62.060 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   45.361 * s,y +  -62.060 * s,x +   42.724 * s,y +  -63.231 * s,x +   40.462 * s,y +  -63.817 * s,x +   38.574 * s,y +  -63.817 * s, threshold);
			_vr.bezier8(x +   38.574 * s,y +  -63.817 * s,x +   33.886 * s,y +  -63.817 * s,x +   30.664 * s,y +  -59.976 * s,x +   28.906 * s,y +  -52.294 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   40.918 * s);
			_setf(o + ( 1 << 2), y +  -52.294 * s);
			_setf(o + ( 2 << 2), x +   39.697 * s);
			_setf(o + ( 3 << 2), y +  -42.480 * s);
			_setf(o + ( 4 << 2), x +   27.392 * s);
			_setf(o + ( 5 << 2), y +  -42.480 * s);
			_setf(o + ( 6 << 2), x +   19.580 * s);
			_setf(o + ( 7 << 2), y +    3.320 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_vr.bezier8(x +   19.580 * s,y +    3.320 * s,x +   18.731 * s,y +    8.300 * s,x +   16.439 * s,y +   12.402 * s,x +   12.695 * s,y +   15.625 * s, threshold);
			_vr.bezier8(x +   12.695 * s,y +   15.625 * s,x +    8.952 * s,y +   18.847 * s,x +    4.574 * s,y +   20.475 * s,x +   -0.439 * s,y +   20.508 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   -3.027 * s);
			_setf(o + ( 1 << 2), y +   12.402 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   -3.027 * s,y +   12.402 * s,x +   -0.716 * s,y +   11.881 * s,x +    1.367 * s,y +   10.726 * s,x +    3.223 * s,y +    8.935 * s, threshold);
			_vr.bezier8(x +    3.223 * s,y +    8.935 * s,x +    5.078 * s,y +    7.145 * s,x +    6.230 * s,y +    5.113 * s,x +    6.641 * s,y +    2.832 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   14.795 * s);
			_setf(o + ( 1 << 2), y +  -42.480 * s);
			_setf(o + ( 2 << 2), x +    7.422 * s);
			_setf(o + ( 3 << 2), y +  -42.480 * s);
			_setf(o + ( 4 << 2), x +    9.033 * s);
			_setf(o + ( 5 << 2), y +  -52.294 * s);
			_setf(o + ( 6 << 2), x +   16.260 * s);
			_setf(o + ( 7 << 2), y +  -52.294 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_vr.bezier8(x +   16.260 * s,y +  -52.294 * s,x +   19.613 * s,y +  -66.584 * s,x +   27.246 * s,y +  -73.729 * s,x +   39.160 * s,y +  -73.729 * s, threshold);
			_vr.bezier8(x +   39.160 * s,y +  -73.729 * s,x +   42.545 * s,y +  -73.729 * s,x +   45.426 * s,y +  -73.029 * s,x +   47.802 * s,y +  -71.630 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   45.361 * s);
			_setf(o + ( 1 << 2), y +  -62.060 * s);
			_setf(o + ( 2 << 2), x +   41.015 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 103:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   48.583 * s);
			_setf(o + ( 1 << 2), y +  -43.212 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   48.583 * s,y +  -43.212 * s,x +   49.299 * s,y +  -41.585 * s,x +   49.657 * s,y +  -39.631 * s,x +   49.657 * s,y +  -37.353 * s, threshold);
			_vr.bezier8(x +   49.657 * s,y +  -37.353 * s,x +   49.657 * s,y +  -32.275 * s,x +   48.559 * s,y +  -27.880 * s,x +   46.362 * s,y +  -24.170 * s, threshold);
			_vr.bezier8(x +   46.362 * s,y +  -24.170 * s,x +   44.164 * s,y +  -20.459 * s,x +   40.543 * s,y +  -17.448 * s,x +   35.497 * s,y +  -15.136 * s, threshold);
			_vr.bezier8(x +   35.497 * s,y +  -15.136 * s,x +   30.452 * s,y +  -12.825 * s,x +   27.685 * s,y +  -11.263 * s,x +   27.197 * s,y +  -10.449 * s, threshold);
			_vr.bezier8(x +   27.197 * s,y +  -10.449 * s,x +   29.410 * s,y +  -10.872 * s,x +   31.136 * s,y +  -11.084 * s,x +   32.372 * s,y +  -11.084 * s, threshold);
			_vr.bezier8(x +   32.372 * s,y +  -11.084 * s,x +   36.018 * s,y +  -11.084 * s,x +   39.127 * s,y +   -9.969 * s,x +   41.699 * s,y +   -7.739 * s, threshold);
			_vr.bezier8(x +   41.699 * s,y +   -7.739 * s,x +   44.270 * s,y +   -5.509 * s,x +   45.556 * s,y +   -2.669 * s,x +   45.556 * s,y +    0.781 * s, threshold);
			_vr.bezier8(x +   45.556 * s,y +    0.781 * s,x +   45.556 * s,y +    7.096 * s,x +   43.334 * s,y +   11.963 * s,x +   38.891 * s,y +   15.381 * s, threshold);
			_vr.bezier8(x +   38.891 * s,y +   15.381 * s,x +   34.448 * s,y +   18.799 * s,x +   28.011 * s,y +   20.508 * s,x +   19.580 * s,y +   20.508 * s, threshold);
			_vr.bezier8(x +   19.580 * s,y +   20.508 * s,x +   16.422 * s,y +   20.508 * s,x +   12.964 * s,y +   19.889 * s,x +    9.204 * s,y +   18.652 * s, threshold);
			_vr.bezier8(x +    9.204 * s,y +   18.652 * s,x +    5.444 * s,y +   17.415 * s,x +    2.376 * s,y +   15.885 * s,x +       0. * s,y +   14.062 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    5.322 * s);
			_setf(o + ( 1 << 2), y +    4.834 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    5.322 * s,y +    4.834 * s,x +    9.977 * s,y +    8.154 * s,x +   14.811 * s,y +    9.814 * s,x +   19.824 * s,y +    9.814 * s, threshold);
			_vr.bezier8(x +   19.824 * s,y +    9.814 * s,x +   28.873 * s,y +    9.814 * s,x +   33.398 * s,y +    7.373 * s,x +   33.398 * s,y +    2.490 * s, threshold);
			_vr.bezier8(x +   33.398 * s,y +    2.490 * s,x +   33.398 * s,y +    1.449 * s,x +   32.934 * s,y +    0.586 * s,x +   32.006 * s,y +   -0.098 * s, threshold);
			_vr.bezier8(x +   32.006 * s,y +   -0.098 * s,x +   31.079 * s,y +   -0.781 * s,x +   29.675 * s,y +   -1.323 * s,x +   27.783 * s,y +   -1.660 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   18.457 * s);
			_setf(o + ( 1 << 2), y +   -3.320 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   18.457 * s,y +   -3.320 * s,x +   14.974 * s,y +   -4.394 * s,x +   13.232 * s,y +   -6.413 * s,x +   13.232 * s,y +   -9.375 * s, threshold);
			_vr.bezier8(x +   13.232 * s,y +   -9.375 * s,x +   13.232 * s,y +  -11.100 * s,x +   14.664 * s,y +  -12.842 * s,x +   17.529 * s,y +  -14.599 * s, threshold);
			_vr.bezier8(x +   17.529 * s,y +  -14.599 * s,x +   14.013 * s,y +  -15.608 * s,x +   11.141 * s,y +  -17.505 * s,x +    8.911 * s,y +  -20.288 * s, threshold);
			_vr.bezier8(x +    8.911 * s,y +  -20.288 * s,x +    6.681 * s,y +  -23.071 * s,x +    5.566 * s,y +  -26.171 * s,x +    5.566 * s,y +  -29.589 * s, threshold);
			_vr.bezier8(x +    5.566 * s,y +  -29.589 * s,x +    5.566 * s,y +  -36.621 * s,x +    7.894 * s,y +  -42.325 * s,x +   12.549 * s,y +  -46.703 * s, threshold);
			_vr.bezier8(x +   12.549 * s,y +  -46.703 * s,x +   17.203 * s,y +  -51.082 * s,x +   23.177 * s,y +  -53.271 * s,x +   30.468 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   30.468 * s,y +  -53.271 * s,x +   34.960 * s,y +  -53.271 * s,x +   38.753 * s,y +  -52.310 * s,x +   41.845 * s,y +  -50.390 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   46.435 * s);
			_setf(o + ( 1 << 2), y +  -55.370 * s);
			_setf(o + ( 2 << 2), x +   53.612 * s);
			_setf(o + ( 3 << 2), y +  -48.241 * s);
			_setf(o + ( 4 << 2), x +   48.583 * s);
			_setf(o + ( 5 << 2), y +  -43.212 * s);
			_setf(o + ( 6 << 2), x +   17.968 * s);
			_setf(o + ( 7 << 2), y +  -30.664 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			_vr.bezier8(x +   17.968 * s,y +  -30.664 * s,x +   17.968 * s,y +  -28.059 * s,x +   18.554 * s,y +  -25.927 * s,x +   19.726 * s,y +  -24.267 * s, threshold);
			_vr.bezier8(x +   19.726 * s,y +  -24.267 * s,x +   20.898 * s,y +  -22.607 * s,x +   22.509 * s,y +  -21.777 * s,x +   24.560 * s,y +  -21.777 * s, threshold);
			_vr.bezier8(x +   24.560 * s,y +  -21.777 * s,x +   28.141 * s,y +  -21.777 * s,x +   31.103 * s,y +  -23.201 * s,x +   33.447 * s,y +  -26.049 * s, threshold);
			_vr.bezier8(x +   33.447 * s,y +  -26.049 * s,x +   35.791 * s,y +  -28.898 * s,x +   36.962 * s,y +  -32.356 * s,x +   36.962 * s,y +  -36.425 * s, threshold);
			_vr.bezier8(x +   36.962 * s,y +  -36.425 * s,x +   36.962 * s,y +  -41.015 * s,x +   34.570 * s,y +  -43.310 * s,x +   29.785 * s,y +  -43.310 * s, threshold);
			_vr.bezier8(x +   29.785 * s,y +  -43.310 * s,x +   26.171 * s,y +  -43.310 * s,x +   23.299 * s,y +  -42.130 * s,x +   21.167 * s,y +  -39.770 * s, threshold);
			_vr.bezier8(x +   21.167 * s,y +  -39.770 * s,x +   19.034 * s,y +  -37.410 * s,x +   17.968 * s,y +  -34.375 * s,x +   17.968 * s,y +  -30.664 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   53.515 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 104:
			
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   52.733 * s);
			_setf(o + ( 1 << 2), y +  -31.982 * s);
			_setf(o + ( 2 << 2), x +   46.728 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   34.179 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   40.331 * s);
			_setf(o + ( 7 << 2), y +  -32.470 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_vr.bezier8(x +   40.331 * s,y +  -32.470 * s,x +   40.529 * s,y +  -33.511 * s,x +   40.624 * s,y +  -34.570 * s,x +   40.624 * s,y +  -35.644 * s, threshold);
			_vr.bezier8(x +   40.624 * s,y +  -35.644 * s,x +   40.624 * s,y +  -40.527 * s,x +   38.183 * s,y +  -42.968 * s,x +   33.300 * s,y +  -42.968 * s, threshold);
			_vr.bezier8(x +   33.300 * s,y +  -42.968 * s,x +   28.906 * s,y +  -42.968 * s,x +   24.951 * s,y +  -41.113 * s,x +   21.435 * s,y +  -37.402 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   14.502 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    2.051 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   15.332 * s);
			_setf(o + ( 5 << 2), y +  -73.729 * s);
			_setf(o + ( 6 << 2), x +   27.490 * s);
			_setf(o + ( 7 << 2), y +  -73.729 * s);
			_setf(o + ( 8 << 2), x +   23.486 * s);
			_setf(o + ( 9 << 2), y +  -49.120 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   23.486 * s,y +  -49.120 * s,x +   27.815 * s,y +  -51.887 * s,x +   32.389 * s,y +  -53.271 * s,x +   37.207 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   37.207 * s,y +  -53.271 * s,x +   42.219 * s,y +  -53.271 * s,x +   46.150 * s,y +  -51.871 * s,x +   48.998 * s,y +  -49.072 * s, threshold);
			_vr.bezier8(x +   48.998 * s,y +  -49.072 * s,x +   51.846 * s,y +  -46.272 * s,x +   53.270 * s,y +  -42.366 * s,x +   53.270 * s,y +  -37.353 * s, threshold);
			_vr.bezier8(x +   53.270 * s,y +  -37.353 * s,x +   53.270 * s,y +  -35.693 * s,x +   53.094 * s,y +  -33.902 * s,x +   52.733 * s,y +  -31.982 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   56.200 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 105:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   15.771 * s);
			_setf(o + ( 1 << 2), y +  -69.091 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   15.771 * s,y +  -69.091 * s,x +   15.771 * s,y +  -71.272 * s,x +   16.544 * s,y +  -73.086 * s,x +   18.091 * s,y +  -74.535 * s, threshold);
			_vr.bezier8(x +   18.091 * s,y +  -74.535 * s,x +   19.637 * s,y +  -75.984 * s,x +   21.517 * s,y +  -76.708 * s,x +   23.730 * s,y +  -76.708 * s, threshold);
			_vr.bezier8(x +   23.730 * s,y +  -76.708 * s,x +   25.911 * s,y +  -76.708 * s,x +   27.783 * s,y +  -75.984 * s,x +   29.345 * s,y +  -74.535 * s, threshold);
			_vr.bezier8(x +   29.345 * s,y +  -74.535 * s,x +   30.908 * s,y +  -73.086 * s,x +   31.689 * s,y +  -71.272 * s,x +   31.689 * s,y +  -69.091 * s, threshold);
			_vr.bezier8(x +   31.689 * s,y +  -69.091 * s,x +   31.689 * s,y +  -66.942 * s,x +   30.908 * s,y +  -65.136 * s,x +   29.345 * s,y +  -63.671 * s, threshold);
			_vr.bezier8(x +   29.345 * s,y +  -63.671 * s,x +   27.783 * s,y +  -62.206 * s,x +   25.911 * s,y +  -61.474 * s,x +   23.730 * s,y +  -61.474 * s, threshold);
			_vr.bezier8(x +   23.730 * s,y +  -61.474 * s,x +   21.549 * s,y +  -61.474 * s,x +   19.678 * s,y +  -62.198 * s,x +   18.115 * s,y +  -63.646 * s, threshold);
			_vr.bezier8(x +   18.115 * s,y +  -63.646 * s,x +   16.553 * s,y +  -65.095 * s,x +   15.771 * s,y +  -66.910 * s,x +   15.771 * s,y +  -69.091 * s, threshold);
			o = _posf(16);
			_setf(o + ( 0 << 2), x +   19.385 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    6.982 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   14.892 * s);
			_setf(o + ( 5 << 2), y +  -42.480 * s);
			_setf(o + ( 6 << 2), x +    8.203 * s);
			_setf(o + ( 7 << 2), y +  -42.480 * s);
			_setf(o + ( 8 << 2), x +   10.254 * s);
			_setf(o + ( 9 << 2), y +  -52.294 * s);
			_setf(o + (10 << 2), x +   29.150 * s);
			_setf(o + (11 << 2), y +  -52.294 * s);
			_setf(o + (12 << 2), x +   19.385 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   32.666 * s);
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
			_setf(o + ( 0 << 2), x +   21.679 * s);
			_setf(o + ( 1 << 2), y +  -68.993 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   21.679 * s,y +  -68.993 * s,x +   21.679 * s,y +  -71.174 * s,x +   22.452 * s,y +  -73.005 * s,x +   23.998 * s,y +  -74.486 * s, threshold);
			_vr.bezier8(x +   23.998 * s,y +  -74.486 * s,x +   25.544 * s,y +  -75.967 * s,x +   27.424 * s,y +  -76.708 * s,x +   29.638 * s,y +  -76.708 * s, threshold);
			_vr.bezier8(x +   29.638 * s,y +  -76.708 * s,x +   31.851 * s,y +  -76.708 * s,x +   33.731 * s,y +  -75.967 * s,x +   35.277 * s,y +  -74.486 * s, threshold);
			_vr.bezier8(x +   35.277 * s,y +  -74.486 * s,x +   36.824 * s,y +  -73.005 * s,x +   37.597 * s,y +  -71.174 * s,x +   37.597 * s,y +  -68.993 * s, threshold);
			_vr.bezier8(x +   37.597 * s,y +  -68.993 * s,x +   37.597 * s,y +  -66.812 * s,x +   36.815 * s,y +  -64.989 * s,x +   35.253 * s,y +  -63.524 * s, threshold);
			_vr.bezier8(x +   35.253 * s,y +  -63.524 * s,x +   33.691 * s,y +  -62.060 * s,x +   31.819 * s,y +  -61.327 * s,x +   29.638 * s,y +  -61.327 * s, threshold);
			_vr.bezier8(x +   29.638 * s,y +  -61.327 * s,x +   27.457 * s,y +  -61.327 * s,x +   25.585 * s,y +  -62.060 * s,x +   24.023 * s,y +  -63.524 * s, threshold);
			_vr.bezier8(x +   24.023 * s,y +  -63.524 * s,x +   22.460 * s,y +  -64.989 * s,x +   21.679 * s,y +  -66.812 * s,x +   21.679 * s,y +  -68.993 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   24.999 * s);
			_setf(o + ( 1 << 2), y +   -0.732 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   24.999 * s,y +   -0.732 * s,x +   23.658 * s,y +    6.493 * s,x +   20.556 * s,y +   11.841 * s,x +   15.673 * s,y +   15.307 * s, threshold);
			_vr.bezier8(x +   15.673 * s,y +   15.307 * s,x +   10.790 * s,y +   18.774 * s,x +    3.206 * s,y +   20.508 * s,x +   -7.080 * s,y +   20.508 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   -6.543 * s);
			_setf(o + ( 1 << 2), y +    9.717 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   -6.543 * s,y +    9.717 * s,x +   -1.986 * s,y +    9.717 * s,x +    1.530 * s,y +    9.407 * s,x +    4.003 * s,y +    8.789 * s, threshold);
			_vr.bezier8(x +    4.003 * s,y +    8.789 * s,x +    6.477 * s,y +    8.170 * s,x +    8.455 * s,y +    7.047 * s,x +    9.936 * s,y +    5.420 * s, threshold);
			_vr.bezier8(x +    9.936 * s,y +    5.420 * s,x +   11.417 * s,y +    3.792 * s,x +   12.412 * s,y +    1.646 * s,x +   12.890 * s,y +   -1.025 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   20.312 * s);
			_setf(o + ( 1 << 2), y +  -42.480 * s);
			_setf(o + ( 2 << 2), x +   13.281 * s);
			_setf(o + ( 3 << 2), y +  -42.480 * s);
			_setf(o + ( 4 << 2), x +   15.576 * s);
			_setf(o + ( 5 << 2), y +  -52.294 * s);
			_setf(o + ( 6 << 2), x +   34.569 * s);
			_setf(o + ( 7 << 2), y +  -52.294 * s);
			_setf(o + ( 8 << 2), x +   24.999 * s);
			_setf(o + ( 9 << 2), y +   -0.732 * s);
			_setf(o + (10 << 2), x +   38.769 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 107:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +   37.255 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   20.702 * s);
			_setf(o + ( 3 << 2), y +  -21.533 * s);
			_setf(o + ( 4 << 2), x +   18.652 * s);
			_setf(o + ( 5 << 2), y +  -19.824 * s);
			_setf(o + ( 6 << 2), x +   15.185 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    2.929 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   15.722 * s);
			_setf(o + (11 << 2), y +  -73.729 * s);
			_setf(o + (12 << 2), x +   27.733 * s);
			_setf(o + (13 << 2), y +  -73.729 * s);
			_setf(o + (14 << 2), x +   21.435 * s);
			_setf(o + (15 << 2), y +  -34.912 * s);
			_setf(o + (16 << 2), x +   30.663 * s);
			_setf(o + (17 << 2), y +  -42.919 * s);
			o = _posb(9);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_vr.bezier8(x +   30.663 * s,y +  -42.919 * s,x +   36.954 * s,y +  -48.378 * s,x +   41.112 * s,y +  -52.555 * s,x +   43.163 * s,y +  -55.419 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   51.708 * s);
			_setf(o + ( 1 << 2), y +  -48.046 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   51.708 * s,y +  -48.046 * s,x +   50.275 * s,y +  -46.288 * s,x +   43.082 * s,y +  -39.697 * s,x +   30.126 * s,y +  -28.271 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   51.708 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   37.255 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   53.954 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 108:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   23.290 * s);
			_setf(o + ( 1 << 2), y +   -4.101 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   23.290 * s,y +   -4.101 * s,x +   21.370 * s,y +   -1.042 * s,x +   18.457 * s,y +    0.488 * s,x +   14.550 * s,y +    0.488 * s, threshold);
			_vr.bezier8(x +   14.550 * s,y +    0.488 * s,x +   11.621 * s,y +    0.488 * s,x +    9.310 * s,y +   -0.472 * s,x +    7.617 * s,y +   -2.393 * s, threshold);
			_vr.bezier8(x +    7.617 * s,y +   -2.393 * s,x +    5.924 * s,y +   -4.313 * s,x +    5.078 * s,y +   -6.803 * s,x +    5.078 * s,y +   -9.863 * s, threshold);
			_vr.bezier8(x +    5.078 * s,y +   -9.863 * s,x +    5.078 * s,y +  -13.834 * s,x +    5.856 * s,y +  -19.548 * s,x +    7.422 * s,y +  -27.002 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   17.236 * s);
			_setf(o + ( 1 << 2), y +  -73.729 * s);
			_setf(o + ( 2 << 2), x +   29.345 * s);
			_setf(o + ( 3 << 2), y +  -73.729 * s);
			_setf(o + ( 4 << 2), x +   19.287 * s);
			_setf(o + ( 5 << 2), y +  -25.048 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   19.287 * s,y +  -25.048 * s,x +   17.854 * s,y +  -18.115 * s,x +   17.138 * s,y +  -13.167 * s,x +   17.138 * s,y +  -10.205 * s, threshold);
			_vr.bezier8(x +   17.138 * s,y +  -10.205 * s,x +   17.138 * s,y +   -8.317 * s,x +   17.724 * s,y +   -6.828 * s,x +   18.896 * s,y +   -5.737 * s, threshold);
			_vr.bezier8(x +   18.896 * s,y +   -5.737 * s,x +   20.068 * s,y +   -4.647 * s,x +   21.533 * s,y +   -4.101 * s,x +   23.290 * s,y +   -4.101 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   31.982 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 109:
			
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   80.565 * s);
			_setf(o + ( 1 << 2), y +  -34.277 * s);
			_setf(o + ( 2 << 2), x +   74.169 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   61.669 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   67.870 * s);
			_setf(o + ( 7 << 2), y +  -33.007 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_vr.bezier8(x +   67.870 * s,y +  -33.007 * s,x +   68.065 * s,y +  -34.049 * s,x +   68.163 * s,y +  -35.156 * s,x +   68.163 * s,y +  -36.328 * s, threshold);
			_vr.bezier8(x +   68.163 * s,y +  -36.328 * s,x +   68.163 * s,y +  -40.852 * s,x +   65.770 * s,y +  -43.115 * s,x +   60.985 * s,y +  -43.115 * s, threshold);
			_vr.bezier8(x +   60.985 * s,y +  -43.115 * s,x +   59.292 * s,y +  -43.115 * s,x +   57.453 * s,y +  -42.529 * s,x +   55.468 * s,y +  -41.357 * s, threshold);
			_vr.bezier8(x +   55.468 * s,y +  -41.357 * s,x +   53.482 * s,y +  -40.185 * s,x +   52.001 * s,y +  -38.915 * s,x +   51.024 * s,y +  -37.548 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   44.042 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   31.542 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   38.476 * s);
			_setf(o + ( 5 << 2), y +  -36.865 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   38.476 * s,y +  -36.865 * s,x +   38.543 * s,y +  -37.222 * s,x +   38.573 * s,y +  -37.613 * s,x +   38.573 * s,y +  -38.037 * s, threshold);
			_vr.bezier8(x +   38.573 * s,y +  -38.037 * s,x +   38.573 * s,y +  -41.422 * s,x +   35.986 * s,y +  -43.115 * s,x +   30.810 * s,y +  -43.115 * s, threshold);
			_vr.bezier8(x +   30.810 * s,y +  -43.115 * s,x +   29.247 * s,y +  -43.115 * s,x +   27.481 * s,y +  -42.537 * s,x +   25.512 * s,y +  -41.381 * s, threshold);
			_vr.bezier8(x +   25.512 * s,y +  -41.381 * s,x +   23.543 * s,y +  -40.226 * s,x +   21.972 * s,y +  -38.899 * s,x +   20.800 * s,y +  -37.402 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   13.818 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    1.367 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    8.447 * s);
			_setf(o + ( 5 << 2), y +  -37.792 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +    8.447 * s,y +  -37.792 * s,x +    8.611 * s,y +  -38.671 * s,x +    8.691 * s,y +  -40.038 * s,x +    8.691 * s,y +  -41.894 * s, threshold);
			_vr.bezier8(x +    8.691 * s,y +  -41.894 * s,x +    8.691 * s,y +  -45.116 * s,x +    8.235 * s,y +  -48.258 * s,x +    7.324 * s,y +  -51.318 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   19.287 * s);
			_setf(o + ( 1 << 2), y +  -53.417 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   19.287 * s,y +  -53.417 * s,x +   19.710 * s,y +  -51.757 * s,x +   20.068 * s,y +  -50.178 * s,x +   20.361 * s,y +  -48.681 * s, threshold);
			_vr.bezier8(x +   20.361 * s,y +  -48.681 * s,x +   24.299 * s,y +  -51.741 * s,x +   29.215 * s,y +  -53.271 * s,x +   35.107 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   35.107 * s,y +  -53.271 * s,x +   42.007 * s,y +  -53.271 * s,x +   46.890 * s,y +  -51.399 * s,x +   49.755 * s,y +  -47.656 * s, threshold);
			_vr.bezier8(x +   49.755 * s,y +  -47.656 * s,x +   53.889 * s,y +  -51.399 * s,x +   59.097 * s,y +  -53.271 * s,x +   65.380 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   65.380 * s,y +  -53.271 * s,x +   75.829 * s,y +  -53.271 * s,x +   81.053 * s,y +  -48.518 * s,x +   81.053 * s,y +  -39.013 * s, threshold);
			_vr.bezier8(x +   81.053 * s,y +  -39.013 * s,x +   81.053 * s,y +  -37.613 * s,x +   80.893 * s,y +  -36.034 * s,x +   80.565 * s,y +  -34.277 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   83.006 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 110:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   46.240 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   33.594 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   39.306 * s);
			_setf(o + ( 5 << 2), y +  -30.468 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   39.306 * s,y +  -30.468 * s,x +   39.764 * s,y +  -32.909 * s,x +   39.990 * s,y +  -34.960 * s,x +   39.990 * s,y +  -36.621 * s, threshold);
			_vr.bezier8(x +   39.990 * s,y +  -36.621 * s,x +   39.990 * s,y +  -40.950 * s,x +   37.434 * s,y +  -43.115 * s,x +   32.324 * s,y +  -43.115 * s, threshold);
			_vr.bezier8(x +   32.324 * s,y +  -43.115 * s,x +   27.962 * s,y +  -43.115 * s,x +   24.040 * s,y +  -41.275 * s,x +   20.557 * s,y +  -37.597 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   13.574 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    1.319 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    8.692 * s);
			_setf(o + ( 5 << 2), y +  -39.208 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +    8.692 * s,y +  -39.208 * s,x +    8.820 * s,y +  -39.892 * s,x +    8.887 * s,y +  -40.836 * s,x +    8.887 * s,y +  -42.040 * s, threshold);
			_vr.bezier8(x +    8.887 * s,y +  -42.040 * s,x +    8.887 * s,y +  -44.937 * s,x +    8.415 * s,y +  -48.030 * s,x +    7.471 * s,y +  -51.318 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   19.434 * s);
			_setf(o + ( 1 << 2), y +  -53.515 * s);
			_setf(o + ( 2 << 2), x +   20.557 * s);
			_setf(o + ( 3 << 2), y +  -47.656 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_vr.bezier8(x +   20.557 * s,y +  -47.656 * s,x +   24.853 * s,y +  -51.399 * s,x +   30.241 * s,y +  -53.271 * s,x +   36.718 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   36.718 * s,y +  -53.271 * s,x +   47.461 * s,y +  -53.271 * s,x +   52.831 * s,y +  -48.242 * s,x +   52.831 * s,y +  -38.183 * s, threshold);
			_vr.bezier8(x +   52.831 * s,y +  -38.183 * s,x +   52.831 * s,y +  -36.393 * s,x +   52.601 * s,y +  -34.277 * s,x +   52.148 * s,y +  -31.835 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   46.240 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   56.201 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 111:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    3.515 * s);
			_setf(o + ( 1 << 2), y +  -19.580 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +    3.515 * s,y +  -19.580 * s,x +    3.515 * s,y +  -29.020 * s,x +    6.396 * s,y +  -36.995 * s,x +   12.158 * s,y +  -43.505 * s, threshold);
			_vr.bezier8(x +   12.158 * s,y +  -43.505 * s,x +   17.919 * s,y +  -50.016 * s,x +   25.211 * s,y +  -53.271 * s,x +   34.032 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   34.032 * s,y +  -53.271 * s,x +   40.771 * s,y +  -53.271 * s,x +   45.962 * s,y +  -51.521 * s,x +   49.608 * s,y +  -48.022 * s, threshold);
			_vr.bezier8(x +   49.608 * s,y +  -48.022 * s,x +   53.254 * s,y +  -44.522 * s,x +   55.077 * s,y +  -39.550 * s,x +   55.077 * s,y +  -33.105 * s, threshold);
			_vr.bezier8(x +   55.077 * s,y +  -33.105 * s,x +   55.077 * s,y +  -23.470 * s,x +   52.229 * s,y +  -15.381 * s,x +   46.532 * s,y +   -8.838 * s, threshold);
			_vr.bezier8(x +   46.532 * s,y +   -8.838 * s,x +   40.836 * s,y +   -2.295 * s,x +   33.478 * s,y +    0.977 * s,x +   24.462 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   24.462 * s,y +    0.977 * s,x +   17.854 * s,y +    0.977 * s,x +   12.711 * s,y +   -0.789 * s,x +    9.033 * s,y +   -4.321 * s, threshold);
			_vr.bezier8(x +    9.033 * s,y +   -4.321 * s,x +    5.354 * s,y +   -7.853 * s,x +    3.515 * s,y +  -12.939 * s,x +    3.515 * s,y +  -19.580 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   16.210 * s);
			_setf(o + ( 1 << 2), y +  -20.166 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   16.210 * s,y +  -20.166 * s,x +   16.210 * s,y +  -12.711 * s,x +   19.417 * s,y +   -8.984 * s,x +   25.829 * s,y +   -8.984 * s, threshold);
			_vr.bezier8(x +   25.829 * s,y +   -8.984 * s,x +   30.907 * s,y +   -8.984 * s,x +   34.927 * s,y +  -11.336 * s,x +   37.890 * s,y +  -16.040 * s, threshold);
			_vr.bezier8(x +   37.890 * s,y +  -16.040 * s,x +   40.852 * s,y +  -20.743 * s,x +   42.333 * s,y +  -26.318 * s,x +   42.333 * s,y +  -32.763 * s, threshold);
			_vr.bezier8(x +   42.333 * s,y +  -32.763 * s,x +   42.333 * s,y +  -39.794 * s,x +   39.126 * s,y +  -43.310 * s,x +   32.714 * s,y +  -43.310 * s, threshold);
			_vr.bezier8(x +   32.714 * s,y +  -43.310 * s,x +   27.733 * s,y +  -43.310 * s,x +   23.738 * s,y +  -40.991 * s,x +   20.727 * s,y +  -36.352 * s, threshold);
			_vr.bezier8(x +   20.727 * s,y +  -36.352 * s,x +   17.716 * s,y +  -31.713 * s,x +   16.210 * s,y +  -26.318 * s,x +   16.210 * s,y +  -20.166 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   56.981 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 112:
			
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   14.892 * s);
			_setf(o + ( 1 << 2), y +   -1.416 * s);
			_setf(o + ( 2 << 2), x +   10.986 * s);
			_setf(o + ( 3 << 2), y +   20.508 * s);
			_setf(o + ( 4 << 2), x +   -1.221 * s);
			_setf(o + ( 5 << 2), y +   20.508 * s);
			_setf(o + ( 6 << 2), x +    9.326 * s);
			_setf(o + ( 7 << 2), y +  -36.132 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_vr.bezier8(x +    9.326 * s,y +  -36.132 * s,x +    9.714 * s,y +  -38.216 * s,x +    9.912 * s,y +  -40.315 * s,x +    9.912 * s,y +  -42.431 * s, threshold);
			_vr.bezier8(x +    9.912 * s,y +  -42.431 * s,x +    9.912 * s,y +  -45.295 * s,x +    9.619 * s,y +  -48.176 * s,x +    9.033 * s,y +  -51.073 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   20.947 * s);
			_setf(o + ( 1 << 2), y +  -53.222 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   20.947 * s,y +  -53.222 * s,x +   21.403 * s,y +  -51.985 * s,x +   21.777 * s,y +  -50.325 * s,x +   22.070 * s,y +  -48.241 * s, threshold);
			_vr.bezier8(x +   22.070 * s,y +  -48.241 * s,x +   26.595 * s,y +  -51.594 * s,x +   31.087 * s,y +  -53.271 * s,x +   35.546 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   35.546 * s,y +  -53.271 * s,x +   49.512 * s,y +  -53.271 * s,x +   56.493 * s,y +  -46.500 * s,x +   56.493 * s,y +  -32.958 * s, threshold);
			_vr.bezier8(x +   56.493 * s,y +  -32.958 * s,x +   56.493 * s,y +  -23.030 * s,x +   53.629 * s,y +  -14.892 * s,x +   47.900 * s,y +   -8.545 * s, threshold);
			_vr.bezier8(x +   47.900 * s,y +   -8.545 * s,x +   42.171 * s,y +   -2.197 * s,x +   34.602 * s,y +    0.977 * s,x +   25.195 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   25.195 * s,y +    0.977 * s,x +   21.452 * s,y +    0.977 * s,x +   18.017 * s,y +    0.179 * s,x +   14.892 * s,y +   -1.416 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   16.797 * s);
			_setf(o + ( 1 << 2), y +  -11.816 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   16.797 * s,y +  -11.816 * s,x +   18.392 * s,y +  -10.156 * s,x +   20.752 * s,y +   -9.326 * s,x +   23.877 * s,y +   -9.326 * s, threshold);
			_vr.bezier8(x +   23.877 * s,y +   -9.326 * s,x +   30.289 * s,y +   -9.326 * s,x +   35.197 * s,y +  -11.271 * s,x +   38.598 * s,y +  -15.161 * s, threshold);
			_vr.bezier8(x +   38.598 * s,y +  -15.161 * s,x +   42.000 * s,y +  -19.051 * s,x +   43.701 * s,y +  -24.576 * s,x +   43.701 * s,y +  -31.738 * s, threshold);
			_vr.bezier8(x +   43.701 * s,y +  -31.738 * s,x +   43.701 * s,y +  -35.058 * s,x +   42.675 * s,y +  -37.719 * s,x +   40.624 * s,y +  -39.721 * s, threshold);
			_vr.bezier8(x +   40.624 * s,y +  -39.721 * s,x +   38.574 * s,y +  -41.723 * s,x +   35.758 * s,y +  -42.724 * s,x +   32.177 * s,y +  -42.724 * s, threshold);
			_vr.bezier8(x +   32.177 * s,y +  -42.724 * s,x +   30.582 * s,y +  -42.724 * s,x +   28.702 * s,y +  -42.195 * s,x +   26.538 * s,y +  -41.137 * s, threshold);
			_vr.bezier8(x +   26.538 * s,y +  -41.137 * s,x +   24.373 * s,y +  -40.079 * s,x +   22.754 * s,y +  -38.915 * s,x +   21.679 * s,y +  -37.646 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   16.797 * s);
			_setf(o + ( 1 << 2), y +  -11.816 * s);
			_setf(o + ( 2 << 2), x +   59.862 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 113:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   43.261 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			_setf(o + ( 2 << 2), x +   31.005 * s);
			_setf(o + ( 3 << 2), y +   20.508 * s);
			_setf(o + ( 4 << 2), x +   35.204 * s);
			_setf(o + ( 5 << 2), y +   -2.637 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   35.204 * s,y +   -2.637 * s,x +   31.689 * s,y +   -0.228 * s,x +   27.506 * s,y +    0.977 * s,x +   22.656 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   22.656 * s,y +    0.977 * s,x +   16.374 * s,y +    0.977 * s,x +   11.426 * s,y +   -0.781 * s,x +    7.812 * s,y +   -4.297 * s, threshold);
			_vr.bezier8(x +    7.812 * s,y +   -4.297 * s,x +    4.199 * s,y +   -7.812 * s,x +    2.393 * s,y +  -12.711 * s,x +    2.393 * s,y +  -18.994 * s, threshold);
			_vr.bezier8(x +    2.393 * s,y +  -18.994 * s,x +    2.393 * s,y +  -28.760 * s,x +    5.355 * s,y +  -36.913 * s,x +   11.279 * s,y +  -43.456 * s, threshold);
			_vr.bezier8(x +   11.279 * s,y +  -43.456 * s,x +   17.203 * s,y +  -49.999 * s,x +   24.837 * s,y +  -53.271 * s,x +   34.179 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   34.179 * s,y +  -53.271 * s,x +   36.197 * s,y +  -53.271 * s,x +   38.484 * s,y +  -52.823 * s,x +   41.039 * s,y +  -51.928 * s, threshold);
			_vr.bezier8(x +   41.039 * s,y +  -51.928 * s,x +   43.595 * s,y +  -51.033 * s,x +   45.458 * s,y +  -49.967 * s,x +   46.630 * s,y +  -48.730 * s, threshold);
			_vr.bezier8(x +   46.630 * s,y +  -48.730 * s,x +   47.346 * s,y +  -49.836 * s,x +   48.209 * s,y +  -50.667 * s,x +   49.218 * s,y +  -51.220 * s, threshold);
			_vr.bezier8(x +   49.218 * s,y +  -51.220 * s,x +   50.227 * s,y +  -51.773 * s,x +   51.212 * s,y +  -52.099 * s,x +   52.172 * s,y +  -52.196 * s, threshold);
			_vr.bezier8(x +   52.172 * s,y +  -52.196 * s,x +   53.132 * s,y +  -52.294 * s,x +   55.126 * s,y +  -52.343 * s,x +   58.153 * s,y +  -52.343 * s, threshold);
			_vr.bezier8(x +   58.153 * s,y +  -52.343 * s,x +   56.363 * s,y +  -47.851 * s,x +   54.870 * s,y +  -42.333 * s,x +   53.661 * s,y +  -35.790 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   43.261 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			_setf(o + ( 2 << 2), x +   36.913 * s);
			_setf(o + ( 3 << 2), y +  -11.963 * s);
			_setf(o + ( 4 << 2), x +   42.138 * s);
			_setf(o + ( 5 << 2), y +  -40.087 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_setb(o +  2, 2);
			_vr.bezier8(x +   42.138 * s,y +  -40.087 * s,x +   40.185 * s,y +  -42.008 * s,x +   37.597 * s,y +  -42.968 * s,x +   34.374 * s,y +  -42.968 * s, threshold);
			_vr.bezier8(x +   34.374 * s,y +  -42.968 * s,x +   28.646 * s,y +  -42.968 * s,x +   24.031 * s,y +  -40.893 * s,x +   20.532 * s,y +  -36.743 * s, threshold);
			_vr.bezier8(x +   20.532 * s,y +  -36.743 * s,x +   17.033 * s,y +  -32.592 * s,x +   15.283 * s,y +  -27.408 * s,x +   15.283 * s,y +  -21.191 * s, threshold);
			_vr.bezier8(x +   15.283 * s,y +  -21.191 * s,x +   15.283 * s,y +  -17.448 * s,x +   16.341 * s,y +  -14.534 * s,x +   18.457 * s,y +  -12.451 * s, threshold);
			_vr.bezier8(x +   18.457 * s,y +  -12.451 * s,x +   20.573 * s,y +  -10.368 * s,x +   23.502 * s,y +   -9.326 * s,x +   27.246 * s,y +   -9.326 * s, threshold);
			_vr.bezier8(x +   27.246 * s,y +   -9.326 * s,x +   31.087 * s,y +   -9.326 * s,x +   34.309 * s,y +  -10.205 * s,x +   36.913 * s,y +  -11.963 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   59.862 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 114:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   42.431 * s);
			_setf(o + ( 1 << 2), y +  -39.892 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   42.431 * s,y +  -39.892 * s,x +   39.534 * s,y +  -42.040 * s,x +   36.979 * s,y +  -43.115 * s,x +   34.765 * s,y +  -43.115 * s, threshold);
			_vr.bezier8(x +   34.765 * s,y +  -43.115 * s,x +   31.608 * s,y +  -43.115 * s,x +   28.719 * s,y +  -41.739 * s,x +   26.098 * s,y +  -38.989 * s, threshold);
			_vr.bezier8(x +   26.098 * s,y +  -38.989 * s,x +   23.478 * s,y +  -36.238 * s,x +   21.806 * s,y +  -33.092 * s,x +   21.142 * s,y +  -29.541 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   15.625 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    3.369 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   13.135 * s);
			_setf(o + ( 5 << 2), y +  -52.294 * s);
			_setf(o + ( 6 << 2), x +   25.390 * s);
			_setf(o + ( 7 << 2), y +  -52.294 * s);
			_setf(o + ( 8 << 2), x +   24.560 * s);
			_setf(o + ( 9 << 2), y +  -47.753 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   24.560 * s,y +  -47.753 * s,x +   28.890 * s,y +  -51.431 * s,x +   33.675 * s,y +  -53.271 * s,x +   38.916 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   38.916 * s,y +  -53.271 * s,x +   40.250 * s,y +  -53.271 * s,x +   42.643 * s,y +  -52.961 * s,x +   46.093 * s,y +  -52.343 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   42.431 * s);
			_setf(o + ( 1 << 2), y +  -39.892 * s);
			_setf(o + ( 2 << 2), x +   44.677 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 115:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   38.623 * s);
			_setf(o + ( 1 << 2), y +  -37.988 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   38.623 * s,y +  -37.988 * s,x +   34.717 * s,y +  -41.406 * s,x +   31.136 * s,y +  -43.115 * s,x +   27.881 * s,y +  -43.115 * s, threshold);
			_vr.bezier8(x +   27.881 * s,y +  -43.115 * s,x +   25.863 * s,y +  -43.115 * s,x +   24.113 * s,y +  -42.651 * s,x +   22.632 * s,y +  -41.723 * s, threshold);
			_vr.bezier8(x +   22.632 * s,y +  -41.723 * s,x +   21.151 * s,y +  -40.795 * s,x +   20.410 * s,y +  -39.550 * s,x +   20.410 * s,y +  -37.988 * s, threshold);
			_vr.bezier8(x +   20.410 * s,y +  -37.988 * s,x +   20.410 * s,y +  -36.067 * s,x +   22.176 * s,y +  -34.212 * s,x +   25.708 * s,y +  -32.421 * s, threshold);
			_vr.bezier8(x +   25.708 * s,y +  -32.421 * s,x +   29.240 * s,y +  -30.631 * s,x +   31.950 * s,y +  -29.207 * s,x +   33.838 * s,y +  -28.149 * s, threshold);
			_vr.bezier8(x +   33.838 * s,y +  -28.149 * s,x +   35.726 * s,y +  -27.091 * s,x +   37.272 * s,y +  -25.659 * s,x +   38.476 * s,y +  -23.852 * s, threshold);
			_vr.bezier8(x +   38.476 * s,y +  -23.852 * s,x +   39.681 * s,y +  -22.046 * s,x +   40.283 * s,y +  -19.970 * s,x +   40.283 * s,y +  -17.627 * s, threshold);
			_vr.bezier8(x +   40.283 * s,y +  -17.627 * s,x +   40.283 * s,y +  -11.865 * s,x +   38.126 * s,y +   -7.324 * s,x +   33.813 * s,y +   -4.004 * s, threshold);
			_vr.bezier8(x +   33.813 * s,y +   -4.004 * s,x +   29.500 * s,y +   -0.684 * s,x +   23.991 * s,y +    0.977 * s,x +   17.285 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   17.285 * s,y +    0.977 * s,x +   11.556 * s,y +    0.977 * s,x +    5.957 * s,y +   -0.635 * s,x +    0.489 * s,y +   -3.857 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    6.934 * s);
			_setf(o + ( 1 << 2), y +  -14.941 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    6.934 * s,y +  -14.941 * s,x +   11.003 * s,y +  -11.100 * s,x +   14.990 * s,y +   -9.180 * s,x +   18.897 * s,y +   -9.180 * s, threshold);
			_vr.bezier8(x +   18.897 * s,y +   -9.180 * s,x +   21.370 * s,y +   -9.180 * s,x +   23.413 * s,y +   -9.798 * s,x +   25.024 * s,y +  -11.035 * s, threshold);
			_vr.bezier8(x +   25.024 * s,y +  -11.035 * s,x +   26.636 * s,y +  -12.272 * s,x +   27.441 * s,y +  -13.948 * s,x +   27.441 * s,y +  -16.064 * s, threshold);
			_vr.bezier8(x +   27.441 * s,y +  -16.064 * s,x +   27.441 * s,y +  -17.822 * s,x +   25.911 * s,y +  -19.498 * s,x +   22.852 * s,y +  -21.093 * s, threshold);
			_vr.bezier8(x +   22.852 * s,y +  -21.093 * s,x +   19.792 * s,y +  -22.688 * s,x +   17.090 * s,y +  -24.145 * s,x +   14.746 * s,y +  -25.463 * s, threshold);
			_vr.bezier8(x +   14.746 * s,y +  -25.463 * s,x +   12.403 * s,y +  -26.782 * s,x +   10.620 * s,y +  -28.393 * s,x +    9.400 * s,y +  -30.297 * s, threshold);
			_vr.bezier8(x +    9.400 * s,y +  -30.297 * s,x +    8.179 * s,y +  -32.202 * s,x +    7.569 * s,y +  -34.309 * s,x +    7.569 * s,y +  -36.621 * s, threshold);
			_vr.bezier8(x +    7.569 * s,y +  -36.621 * s,x +    7.569 * s,y +  -41.699 * s,x +    9.595 * s,y +  -45.743 * s,x +   13.648 * s,y +  -48.754 * s, threshold);
			_vr.bezier8(x +   13.648 * s,y +  -48.754 * s,x +   17.700 * s,y +  -51.765 * s,x +   22.673 * s,y +  -53.271 * s,x +   28.564 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   28.564 * s,y +  -53.271 * s,x +   32.601 * s,y +  -53.271 * s,x +   37.842 * s,y +  -51.904 * s,x +   44.287 * s,y +  -49.169 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   38.623 * s);
			_setf(o + ( 1 << 2), y +  -37.988 * s);
			_setf(o + ( 2 << 2), x +   45.898 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 116:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   41.064 * s);
			_setf(o + ( 1 << 2), y +  -42.480 * s);
			_setf(o + ( 2 << 2), x +   26.660 * s);
			_setf(o + ( 3 << 2), y +  -42.480 * s);
			_setf(o + ( 4 << 2), x +   21.387 * s);
			_setf(o + ( 5 << 2), y +  -19.287 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   21.387 * s,y +  -19.287 * s,x +   20.965 * s,y +  -17.431 * s,x +   20.752 * s,y +  -15.885 * s,x +   20.752 * s,y +  -14.648 * s, threshold);
			_vr.bezier8(x +   20.752 * s,y +  -14.648 * s,x +   20.752 * s,y +  -11.068 * s,x +   22.770 * s,y +   -9.277 * s,x +   26.806 * s,y +   -9.277 * s, threshold);
			_vr.bezier8(x +   26.806 * s,y +   -9.277 * s,x +   28.597 * s,y +   -9.277 * s,x +   31.526 * s,y +  -10.124 * s,x +   35.595 * s,y +  -11.816 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   35.595 * s);
			_setf(o + ( 1 << 2), y +   -0.830 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   35.595 * s,y +   -0.830 * s,x +   32.080 * s,y +    0.374 * s,x +   27.295 * s,y +    0.977 * s,x +   21.240 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   21.240 * s,y +    0.977 * s,x +   17.269 * s,y +    0.977 * s,x +   14.079 * s,y +   -0.260 * s,x +   11.670 * s,y +   -2.734 * s, threshold);
			_vr.bezier8(x +   11.670 * s,y +   -2.734 * s,x +    9.261 * s,y +   -5.208 * s,x +    8.057 * s,y +   -8.431 * s,x +    8.057 * s,y +  -12.402 * s, threshold);
			_vr.bezier8(x +    8.057 * s,y +  -12.402 * s,x +    8.057 * s,y +  -13.704 * s,x +    8.210 * s,y +  -14.989 * s,x +    8.496 * s,y +  -16.260 * s, threshold);
			o = _posf(20);
			_setf(o + ( 0 << 2), x +   14.404 * s);
			_setf(o + ( 1 << 2), y +  -42.480 * s);
			_setf(o + ( 2 << 2), x +    8.350 * s);
			_setf(o + ( 3 << 2), y +  -42.480 * s);
			_setf(o + ( 4 << 2), x +   10.449 * s);
			_setf(o + ( 5 << 2), y +  -52.294 * s);
			_setf(o + ( 6 << 2), x +   16.504 * s);
			_setf(o + ( 7 << 2), y +  -52.294 * s);
			_setf(o + ( 8 << 2), x +   18.555 * s);
			_setf(o + ( 9 << 2), y +  -62.987 * s);
			_setf(o + (10 << 2), x +   32.519 * s);
			_setf(o + (11 << 2), y +  -68.065 * s);
			_setf(o + (12 << 2), x +   28.857 * s);
			_setf(o + (13 << 2), y +  -52.294 * s);
			_setf(o + (14 << 2), x +   43.164 * s);
			_setf(o + (15 << 2), y +  -52.294 * s);
			_setf(o + (16 << 2), x +   41.064 * s);
			_setf(o + (17 << 2), y +  -42.480 * s);
			_setf(o + (18 << 2), x +   43.798 * s);
			_setf(o + (19 << 2), y +       0. * s);
			o = _posb(10);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_setb(o +  9, 1);
			
			case 117:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   45.312 * s);
			_setf(o + ( 1 << 2), y +    0.049 * s);
			_setf(o + ( 2 << 2), x +   33.105 * s);
			_setf(o + ( 3 << 2), y +    0.049 * s);
			_setf(o + ( 4 << 2), x +   33.838 * s);
			_setf(o + ( 5 << 2), y +   -3.760 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   33.838 * s,y +   -3.760 * s,x +   29.476 * s,y +   -0.602 * s,x +   24.007 * s,y +    0.977 * s,x +   17.432 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   17.432 * s,y +    0.977 * s,x +   12.939 * s,y +    0.977 * s,x +    9.416 * s,y +   -0.309 * s,x +    6.861 * s,y +   -2.881 * s, threshold);
			_vr.bezier8(x +    6.861 * s,y +   -2.881 * s,x +    4.305 * s,y +   -5.452 * s,x +    3.028 * s,y +   -9.017 * s,x +    3.028 * s,y +  -13.574 * s, threshold);
			_vr.bezier8(x +    3.028 * s,y +  -13.574 * s,x +    3.028 * s,y +  -15.006 * s,x +    3.206 * s,y +  -16.683 * s,x +    3.565 * s,y +  -18.603 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    9.863 * s);
			_setf(o + ( 1 << 2), y +  -52.294 * s);
			_setf(o + ( 2 << 2), x +   22.266 * s);
			_setf(o + ( 3 << 2), y +  -52.294 * s);
			_setf(o + ( 4 << 2), x +   16.064 * s);
			_setf(o + ( 5 << 2), y +  -19.091 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   16.064 * s,y +  -19.091 * s,x +   15.803 * s,y +  -17.692 * s,x +   15.674 * s,y +  -16.504 * s,x +   15.674 * s,y +  -15.527 * s, threshold);
			_vr.bezier8(x +   15.674 * s,y +  -15.527 * s,x +   15.674 * s,y +  -11.295 * s,x +   18.050 * s,y +   -9.180 * s,x +   22.803 * s,y +   -9.180 * s, threshold);
			_vr.bezier8(x +   22.803 * s,y +   -9.180 * s,x +   26.676 * s,y +   -9.180 * s,x +   29.923 * s,y +  -10.441 * s,x +   32.544 * s,y +  -12.964 * s, threshold);
			_vr.bezier8(x +   32.544 * s,y +  -12.964 * s,x +   35.164 * s,y +  -15.486 * s,x +   36.820 * s,y +  -18.518 * s,x +   37.451 * s,y +  -22.070 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   42.822 * s);
			_setf(o + ( 1 << 2), y +  -52.294 * s);
			_setf(o + ( 2 << 2), x +   55.078 * s);
			_setf(o + ( 3 << 2), y +  -52.294 * s);
			_setf(o + ( 4 << 2), x +   45.312 * s);
			_setf(o + ( 5 << 2), y +    0.049 * s);
			_setf(o + ( 6 << 2), x +   55.712 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			
			case 118:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +   24.951 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			_setf(o + ( 2 << 2), x +   20.557 * s);
			_setf(o + ( 3 << 2), y +    0.977 * s);
			_setf(o + ( 4 << 2), x +    4.541 * s);
			_setf(o + ( 5 << 2), y +  -52.294 * s);
			_setf(o + ( 6 << 2), x +   17.285 * s);
			_setf(o + ( 7 << 2), y +  -52.294 * s);
			_setf(o + ( 8 << 2), x +   26.074 * s);
			_setf(o + ( 9 << 2), y +  -20.605 * s);
			_setf(o + (10 << 2), x +   44.482 * s);
			_setf(o + (11 << 2), y +  -52.294 * s);
			_setf(o + (12 << 2), x +   58.642 * s);
			_setf(o + (13 << 2), y +  -52.294 * s);
			_setf(o + (14 << 2), x +   24.951 * s);
			_setf(o + (15 << 2), y +    0.977 * s);
			_setf(o + (16 << 2), x +   55.224 * s);
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
			_setf(o + ( 0 << 2), x +   51.952 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			_setf(o + ( 2 << 2), x +   47.558 * s);
			_setf(o + ( 3 << 2), y +    0.977 * s);
			_setf(o + ( 4 << 2), x +   38.427 * s);
			_setf(o + ( 5 << 2), y +  -29.248 * s);
			_setf(o + ( 6 << 2), x +   18.847 * s);
			_setf(o + ( 7 << 2), y +    0.977 * s);
			_setf(o + ( 8 << 2), x +   14.355 * s);
			_setf(o + ( 9 << 2), y +    0.977 * s);
			_setf(o + (10 << 2), x +    4.053 * s);
			_setf(o + (11 << 2), y +  -52.294 * s);
			_setf(o + (12 << 2), x +   16.455 * s);
			_setf(o + (13 << 2), y +  -52.294 * s);
			_setf(o + (14 << 2), x +   21.679 * s);
			_setf(o + (15 << 2), y +  -23.486 * s);
			_setf(o + (16 << 2), x +   39.599 * s);
			_setf(o + (17 << 2), y +  -52.294 * s);
			_setf(o + (18 << 2), x +   43.994 * s);
			_setf(o + (19 << 2), y +  -52.294 * s);
			_setf(o + (20 << 2), x +   52.636 * s);
			_setf(o + (21 << 2), y +  -23.144 * s);
			_setf(o + (22 << 2), x +   67.724 * s);
			_setf(o + (23 << 2), y +  -52.294 * s);
			_setf(o + (24 << 2), x +   80.663 * s);
			_setf(o + (25 << 2), y +  -52.294 * s);
			_setf(o + (26 << 2), x +   51.952 * s);
			_setf(o + (27 << 2), y +    0.977 * s);
			_setf(o + (28 << 2), x +   77.343 * s);
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
			_setf(o + ( 0 << 2), x +   36.864 * s);
			_setf(o + ( 1 << 2), y +  -26.269 * s);
			_setf(o + ( 2 << 2), x +   52.050 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   37.157 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   28.564 * s);
			_setf(o + ( 7 << 2), y +  -16.260 * s);
			_setf(o + ( 8 << 2), x +   14.648 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   -0.391 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   22.363 * s);
			_setf(o + (13 << 2), y +  -27.294 * s);
			_setf(o + (14 << 2), x +    8.496 * s);
			_setf(o + (15 << 2), y +  -52.294 * s);
			_setf(o + (16 << 2), x +   22.753 * s);
			_setf(o + (17 << 2), y +  -52.294 * s);
			_setf(o + (18 << 2), x +   31.005 * s);
			_setf(o + (19 << 2), y +  -36.425 * s);
			_setf(o + (20 << 2), x +   43.603 * s);
			_setf(o + (21 << 2), y +  -52.294 * s);
			_setf(o + (22 << 2), x +   58.983 * s);
			_setf(o + (23 << 2), y +  -52.294 * s);
			_setf(o + (24 << 2), x +   36.864 * s);
			_setf(o + (25 << 2), y +  -26.269 * s);
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
			
			case 121:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   30.273 * s);
			_setf(o + ( 1 << 2), y +    5.225 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   30.273 * s,y +    5.225 * s,x +   25.426 * s,y +   15.349 * s,x +   16.015 * s,y +   20.442 * s,x +    2.051 * s,y +   20.508 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    2.051 * s);
			_setf(o + ( 1 << 2), y +    8.740 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    2.051 * s,y +    8.740 * s,x +   11.263 * s,y +    8.708 * s,x +   17.202 * s,y +    5.742 * s,x +   19.775 * s,y +   -0.195 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   22.314 * s);
			_setf(o + ( 1 << 2), y +   -6.055 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   22.314 * s,y +   -6.055 * s,x +   17.855 * s,y +   -7.324 * s,x +   14.843 * s,y +  -12.012 * s,x +   13.281 * s,y +  -20.117 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    7.080 * s);
			_setf(o + ( 1 << 2), y +  -52.294 * s);
			_setf(o + ( 2 << 2), x +   19.922 * s);
			_setf(o + ( 3 << 2), y +  -52.294 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_vr.bezier8(x +   19.922 * s,y +  -52.294 * s,x +   23.730 * s,y +  -29.378 * s,x +   26.155 * s,y +  -17.415 * s,x +   27.197 * s,y +  -16.406 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   43.994 * s);
			_setf(o + ( 1 << 2), y +  -52.294 * s);
			_setf(o + ( 2 << 2), x +   57.812 * s);
			_setf(o + ( 3 << 2), y +  -52.294 * s);
			_setf(o + ( 4 << 2), x +   30.273 * s);
			_setf(o + ( 5 << 2), y +    5.225 * s);
			_setf(o + ( 6 << 2), x +   56.396 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			
			case 122:
			
			o = _posf(24);
			_setf(o + ( 0 << 2), x +   21.826 * s);
			_setf(o + ( 1 << 2), y +  -10.596 * s);
			_setf(o + ( 2 << 2), x +   46.630 * s);
			_setf(o + ( 3 << 2), y +  -10.596 * s);
			_setf(o + ( 4 << 2), x +   44.628 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    1.367 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    1.367 * s);
			_setf(o + ( 9 << 2), y +   -4.150 * s);
			_setf(o + (10 << 2), x +   31.933 * s);
			_setf(o + (11 << 2), y +  -41.699 * s);
			_setf(o + (12 << 2), x +    6.299 * s);
			_setf(o + (13 << 2), y +  -41.699 * s);
			_setf(o + (14 << 2), x +    8.301 * s);
			_setf(o + (15 << 2), y +  -52.294 * s);
			_setf(o + (16 << 2), x +   51.855 * s);
			_setf(o + (17 << 2), y +  -52.294 * s);
			_setf(o + (18 << 2), x +   51.855 * s);
			_setf(o + (19 << 2), y +  -47.948 * s);
			_setf(o + (20 << 2), x +   21.826 * s);
			_setf(o + (21 << 2), y +  -10.596 * s);
			_setf(o + (22 << 2), x +   53.271 * s);
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
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   49.608 * s);
			_setf(o + ( 1 << 2), y +  -63.769 * s);
			_setf(o + ( 2 << 2), x +   42.235 * s);
			_setf(o + ( 3 << 2), y +  -63.915 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   42.235 * s,y +  -63.915 * s,x +   37.972 * s,y +  -64.000 * s,x +   35.115 * s,y +  -63.061 * s,x +   33.666 * s,y +  -61.352 * s, threshold);
			_vr.bezier8(x +   33.666 * s,y +  -61.352 * s,x +   32.218 * s,y +  -59.643 * s,x +   31.494 * s,y +  -57.014 * s,x +   31.494 * s,y +  -53.466 * s, threshold);
			_vr.bezier8(x +   31.494 * s,y +  -53.466 * s,x +   31.494 * s,y +  -52.424 * s,x +   31.624 * s,y +  -50.894 * s,x +   31.884 * s,y +  -48.876 * s, threshold);
			_vr.bezier8(x +   31.884 * s,y +  -48.876 * s,x +   32.145 * s,y +  -46.858 * s,x +   32.275 * s,y +  -45.328 * s,x +   32.275 * s,y +  -44.286 * s, threshold);
			_vr.bezier8(x +   32.275 * s,y +  -44.286 * s,x +   32.275 * s,y +  -37.743 * s,x +   28.336 * s,y +  -32.210 * s,x +   20.459 * s,y +  -27.685 * s, threshold);
			_vr.bezier8(x +   20.459 * s,y +  -27.685 * s,x +   25.146 * s,y +  -24.983 * s,x +   27.490 * s,y +  -21.468 * s,x +   27.490 * s,y +  -17.138 * s, threshold);
			_vr.bezier8(x +   27.490 * s,y +  -17.138 * s,x +   27.490 * s,y +  -14.730 * s,x +   26.383 * s,y +  -11.190 * s,x +   24.170 * s,y +   -6.518 * s, threshold);
			_vr.bezier8(x +   24.170 * s,y +   -6.518 * s,x +   21.956 * s,y +   -1.847 * s,x +   20.849 * s,y +    1.725 * s,x +   20.849 * s,y +    4.199 * s, threshold);
			_vr.bezier8(x +   20.849 * s,y +    4.199 * s,x +   20.849 * s,y +    8.496 * s,x +   24.463 * s,y +   10.644 * s,x +   31.689 * s,y +   10.644 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   33.984 * s);
			_setf(o + ( 1 << 2), y +   10.644 * s);
			_setf(o + ( 2 << 2), x +   36.035 * s);
			_setf(o + ( 3 << 2), y +   10.596 * s);
			_setf(o + ( 4 << 2), x +   34.277 * s);
			_setf(o + ( 5 << 2), y +   20.508 * s);
			_setf(o + ( 6 << 2), x +   26.025 * s);
			_setf(o + ( 7 << 2), y +   20.508 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_vr.bezier8(x +   26.025 * s,y +   20.508 * s,x +   20.687 * s,y +   20.508 * s,x +   16.243 * s,y +   19.328 * s,x +   12.695 * s,y +   16.968 * s, threshold);
			_vr.bezier8(x +   12.695 * s,y +   16.968 * s,x +    9.147 * s,y +   14.608 * s,x +    7.373 * s,y +   11.328 * s,x +    7.373 * s,y +    7.129 * s, threshold);
			_vr.bezier8(x +    7.373 * s,y +    7.129 * s,x +    7.373 * s,y +    4.199 * s,x +    8.667 * s,y +    0.008 * s,x +   11.255 * s,y +   -5.444 * s, threshold);
			_vr.bezier8(x +   11.255 * s,y +   -5.444 * s,x +   13.842 * s,y +  -10.897 * s,x +   15.136 * s,y +  -15.023 * s,x +   15.136 * s,y +  -17.822 * s, threshold);
			_vr.bezier8(x +   15.136 * s,y +  -17.822 * s,x +   15.136 * s,y +  -21.598 * s,x +   12.174 * s,y +  -23.681 * s,x +    6.250 * s,y +  -24.072 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    7.519 * s);
			_setf(o + ( 1 << 2), y +  -31.054 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    7.519 * s,y +  -31.054 * s,x +   15.657 * s,y +  -31.640 * s,x +   19.726 * s,y +  -35.904 * s,x +   19.726 * s,y +  -43.847 * s, threshold);
			_vr.bezier8(x +   19.726 * s,y +  -43.847 * s,x +   19.726 * s,y +  -45.117 * s,x +   19.580 * s,y +  -46.988 * s,x +   19.287 * s,y +  -49.462 * s, threshold);
			_vr.bezier8(x +   19.287 * s,y +  -49.462 * s,x +   18.994 * s,y +  -51.936 * s,x +   18.847 * s,y +  -53.808 * s,x +   18.847 * s,y +  -55.077 * s, threshold);
			_vr.bezier8(x +   18.847 * s,y +  -55.077 * s,x +   18.847 * s,y +  -60.644 * s,x +   21.077 * s,y +  -65.079 * s,x +   25.537 * s,y +  -68.383 * s, threshold);
			_vr.bezier8(x +   25.537 * s,y +  -68.383 * s,x +   29.996 * s,y +  -71.687 * s,x +   35.514 * s,y +  -73.339 * s,x +   42.089 * s,y +  -73.339 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   51.366 * s);
			_setf(o + ( 1 << 2), y +  -73.339 * s);
			_setf(o + ( 2 << 2), x +   49.608 * s);
			_setf(o + ( 3 << 2), y +  -63.769 * s);
			_setf(o + ( 4 << 2), x +   48.534 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 124:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   24.658 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			_setf(o + ( 2 << 2), x +   24.658 * s);
			_setf(o + ( 3 << 2), y +  -73.729 * s);
			_setf(o + ( 4 << 2), x +   34.716 * s);
			_setf(o + ( 5 << 2), y +  -73.729 * s);
			_setf(o + ( 6 << 2), x +   34.716 * s);
			_setf(o + ( 7 << 2), y +   20.508 * s);
			_setf(o + ( 8 << 2), x +   24.658 * s);
			_setf(o + ( 9 << 2), y +   20.508 * s);
			_setf(o + (10 << 2), x +   58.593 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 125:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   42.577 * s);
			_setf(o + ( 1 << 2), y +  -24.023 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   42.577 * s,y +  -24.023 * s,x +   34.439 * s,y +  -23.502 * s,x +   30.371 * s,y +  -19.140 * s,x +   30.371 * s,y +  -10.937 * s, threshold);
			_vr.bezier8(x +   30.371 * s,y +  -10.937 * s,x +   30.371 * s,y +   -9.668 * s,x +   30.484 * s,y +   -7.772 * s,x +   30.712 * s,y +   -5.249 * s, threshold);
			_vr.bezier8(x +   30.712 * s,y +   -5.249 * s,x +   30.940 * s,y +   -2.726 * s,x +   31.054 * s,y +   -0.830 * s,x +   31.054 * s,y +    0.439 * s, threshold);
			_vr.bezier8(x +   31.054 * s,y +    0.439 * s,x +   31.054 * s,y +    6.689 * s,x +   28.849 * s,y +   11.597 * s,x +   24.438 * s,y +   15.161 * s, threshold);
			_vr.bezier8(x +   24.438 * s,y +   15.161 * s,x +   20.027 * s,y +   18.725 * s,x +   14.258 * s,y +   20.508 * s,x +    7.129 * s,y +   20.508 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   -1.709 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			_setf(o + ( 2 << 2), x +    0.049 * s);
			_setf(o + ( 3 << 2), y +   10.596 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_vr.bezier8(x +    0.049 * s,y +   10.596 * s,x +    4.899 * s,y +   10.596 * s,x +    8.610 * s,y +   10.246 * s,x +   11.181 * s,y +    9.546 * s, threshold);
			_vr.bezier8(x +   11.181 * s,y +    9.546 * s,x +   13.753 * s,y +    8.846 * s,x +   15.649 * s,y +    7.471 * s,x +   16.870 * s,y +    5.420 * s, threshold);
			_vr.bezier8(x +   16.870 * s,y +    5.420 * s,x +   18.090 * s,y +    3.369 * s,x +   18.701 * s,y +    0.667 * s,x +   18.701 * s,y +   -2.686 * s, threshold);
			_vr.bezier8(x +   18.701 * s,y +   -2.686 * s,x +   18.701 * s,y +   -3.727 * s,x +   18.603 * s,y +   -5.306 * s,x +   18.408 * s,y +   -7.422 * s, threshold);
			_vr.bezier8(x +   18.408 * s,y +   -7.422 * s,x +   18.213 * s,y +   -9.538 * s,x +   18.115 * s,y +  -11.116 * s,x +   18.115 * s,y +  -12.158 * s, threshold);
			_vr.bezier8(x +   18.115 * s,y +  -12.158 * s,x +   18.115 * s,y +  -19.092 * s,x +   22.021 * s,y +  -24.365 * s,x +   29.833 * s,y +  -27.978 * s, threshold);
			_vr.bezier8(x +   29.833 * s,y +  -27.978 * s,x +   25.211 * s,y +  -31.461 * s,x +   22.900 * s,y +  -35.205 * s,x +   22.900 * s,y +  -39.208 * s, threshold);
			_vr.bezier8(x +   22.900 * s,y +  -39.208 * s,x +   22.900 * s,y +  -41.552 * s,x +   23.958 * s,y +  -44.897 * s,x +   26.074 * s,y +  -49.242 * s, threshold);
			_vr.bezier8(x +   26.074 * s,y +  -49.242 * s,x +   28.190 * s,y +  -53.588 * s,x +   29.248 * s,y +  -56.933 * s,x +   29.248 * s,y +  -59.276 * s, threshold);
			_vr.bezier8(x +   29.248 * s,y +  -59.276 * s,x +   29.248 * s,y +  -62.271 * s,x +   27.587 * s,y +  -63.769 * s,x +   24.267 * s,y +  -63.769 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   13.672 * s);
			_setf(o + ( 1 << 2), y +  -63.769 * s);
			_setf(o + ( 2 << 2), x +   15.429 * s);
			_setf(o + ( 3 << 2), y +  -73.339 * s);
			_setf(o + ( 4 << 2), x +   24.072 * s);
			_setf(o + ( 5 << 2), y +  -73.339 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   24.072 * s,y +  -73.339 * s,x +   29.248 * s,y +  -73.339 * s,x +   33.593 * s,y +  -72.175 * s,x +   37.109 * s,y +  -69.848 * s, threshold);
			_vr.bezier8(x +   37.109 * s,y +  -69.848 * s,x +   40.624 * s,y +  -67.520 * s,x +   42.382 * s,y +  -64.338 * s,x +   42.382 * s,y +  -60.302 * s, threshold);
			_vr.bezier8(x +   42.382 * s,y +  -60.302 * s,x +   42.382 * s,y +  -57.698 * s,x +   41.161 * s,y +  -53.954 * s,x +   38.720 * s,y +  -49.072 * s, threshold);
			_vr.bezier8(x +   38.720 * s,y +  -49.072 * s,x +   36.279 * s,y +  -44.189 * s,x +   35.058 * s,y +  -40.462 * s,x +   35.058 * s,y +  -37.890 * s, threshold);
			_vr.bezier8(x +   35.058 * s,y +  -37.890 * s,x +   35.058 * s,y +  -33.756 * s,x +   37.988 * s,y +  -31.461 * s,x +   43.847 * s,y +  -31.005 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   42.577 * s);
			_setf(o + ( 1 << 2), y +  -24.023 * s);
			_setf(o + ( 2 << 2), x +   48.534 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 126:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   15.918 * s);
			_setf(o + ( 1 << 2), y +  -23.388 * s);
			_setf(o + ( 2 << 2), x +    8.789 * s);
			_setf(o + ( 3 << 2), y +  -23.388 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    8.789 * s,y +  -23.388 * s,x +    9.473 * s,y +  -27.294 * s,x +   10.750 * s,y +  -30.444 * s,x +   12.622 * s,y +  -32.836 * s, threshold);
			_vr.bezier8(x +   12.622 * s,y +  -32.836 * s,x +   14.494 * s,y +  -35.229 * s,x +   16.797 * s,y +  -36.425 * s,x +   19.531 * s,y +  -36.425 * s, threshold);
			_vr.bezier8(x +   19.531 * s,y +  -36.425 * s,x +   21.094 * s,y +  -36.425 * s,x +   22.656 * s,y +  -36.262 * s,x +   24.219 * s,y +  -35.937 * s, threshold);
			_vr.bezier8(x +   24.219 * s,y +  -35.937 * s,x +   25.781 * s,y +  -35.611 * s,x +   28.976 * s,y +  -34.661 * s,x +   33.838 * s,y +  -33.203 * s, threshold);
			_vr.bezier8(x +   33.838 * s,y +  -33.203 * s,x +   35.161 * s,y +  -32.806 * s,x +   36.360 * s,y +  -32.666 * s,x +   37.402 * s,y +  -32.666 * s, threshold);
			_vr.bezier8(x +   37.402 * s,y +  -32.666 * s,x +   39.355 * s,y +  -32.666 * s,x +   40.771 * s,y +  -33.919 * s,x +   41.650 * s,y +  -36.425 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   48.877 * s);
			_setf(o + ( 1 << 2), y +  -36.425 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   48.877 * s,y +  -36.425 * s,x +   47.640 * s,y +  -31.608 * s,x +   46.142 * s,y +  -28.230 * s,x +   44.384 * s,y +  -26.294 * s, threshold);
			_vr.bezier8(x +   44.384 * s,y +  -26.294 * s,x +   42.627 * s,y +  -24.357 * s,x +   40.364 * s,y +  -23.388 * s,x +   37.597 * s,y +  -23.388 * s, threshold);
			_vr.bezier8(x +   37.597 * s,y +  -23.388 * s,x +   36.068 * s,y +  -23.388 * s,x +   34.505 * s,y +  -23.551 * s,x +   32.910 * s,y +  -23.877 * s, threshold);
			_vr.bezier8(x +   32.910 * s,y +  -23.877 * s,x +   31.315 * s,y +  -24.202 * s,x +   28.963 * s,y +  -24.829 * s,x +   25.854 * s,y +  -25.756 * s, threshold);
			_vr.bezier8(x +   25.854 * s,y +  -25.756 * s,x +   22.746 * s,y +  -26.684 * s,x +   20.882 * s,y +  -27.148 * s,x +   20.264 * s,y +  -27.148 * s, threshold);
			_vr.bezier8(x +   20.264 * s,y +  -27.148 * s,x +   18.571 * s,y +  -27.148 * s,x +   17.122 * s,y +  -25.895 * s,x +   15.918 * s,y +  -23.388 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.593 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
		}
	}
	#end
}