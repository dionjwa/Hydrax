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

class TrebuchetMSBold extends de.polygonal.gl.text.ProportionalVectorFont
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
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,  617,  752,  751, 1200, 1200, 1401, 1446,  470,
		 752,  752,  885, 1200,  752,  752,  752,  799, 1200, 1200, 1200, 1200, 1200, 1200, 1200, 1200, 1200, 1200,  752,  752,
		1200, 1200, 1200,  897, 1578, 1297, 1219, 1253, 1316, 1165, 1195, 1375, 1400,  570, 1091, 1264, 1132, 1526, 1367, 1440,
		1202, 1452, 1251, 1047, 1253, 1388, 1273, 1810, 1230, 1256, 1147,  823,  728,  823, 1200, 1200, 1200, 1091, 1191, 1048,
		1189, 1177,  757, 1028, 1214,  611,  751, 1122,  604, 1760, 1209, 1159, 1193, 1196,  875,  882,  812, 1210, 1080, 1605,
		1131, 1093, 1082,  888, 1200,  888, 1200
	];

	static var KERNING_TABLE:Array<Int> =
	[
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,  127,    0,    0,    0,    0,  142,    0,    0,    0,    0,    0,  157,    0,    0,    0,
		 168,    0,  181,    0,  190,    0,  225,  252,    0,  277,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,    0,    0,  306,    0,    0,    0,    0,    0,    0,  309,    0,    0,    0,  316,  323,
		   0,  328,    0,    0,    0,    0,    0,   14,   84, -194,   86, -152,   87, -111,   89, -183,  118,  -37,  119,  -37,
		 121,  -37,   14,   44, -227,   46, -227,   65, -113,   97,  -96,  101,  -96,  111,  -96,  117,  -96,   10,   84, -152,
		  86, -152,   87, -152,   89, -152,  121,  -76,   12,   44, -264,   46, -264,   65, -152,   97,  -96,  101,  -96,  111,
		 -96,    8,   84,  -83,   86,  -74,   87,  -89,   89, -129,   34,   44, -227,   45, -159,   46, -227,   58, -227,   59,
		-227,   65, -194,   79, -122,   97, -227,   99, -227,  101, -227,  105,  -76,  111, -264,  114, -210,  115, -227,  117,
		-185,  119, -163,  121, -154,   26,   44, -229,   45, -113,   46, -188,   58,  -76,   59,  -76,   65, -152,   97, -152,
		 101, -113,  105,  -37,  111, -138,  114, -101,  117, -109,  121,  -76,   24,   44, -179,   45,  -37,   46, -171,   58,
		 -37,   59,  -37,   65, -111,   97,  -76,  101,  -37,  111,  -37,  114,  -37,  117,  -37,  121,  -18,   28,   44, -264,
		  45, -188,   46, -264,   58, -113,   59, -133,   65, -183,   97, -152,  101, -188,  105,  -76,  111, -188,  112, -152,
		 113, -188,  117, -113,  118, -113,    2,   97,  -64,    6,   44, -231,   46, -242,   97,  -64,    6,   44, -270,   46,
		-270,  105,   64,    4,   44, -199,   46, -199,    4,   44, -227,   46, -227
	];

	static var BOUNDS_TABLE:Array<Float> =
	[
		  33,     10.644,    -72.802,     26.611,      0.977,
		  34,      3.418,    -71.630,     34.081,    -50.585,
		  35,      3.174,    -72.606,     57.323,      0.977,
		  36,      7.569,    -80.858,     50.879,     11.474,
		  37,      1.514,    -72.802,     65.820,      0.977,
		  38,      5.469,    -72.802,     65.087,      0.977,
		  39,      5.859,    -71.630,     17.968,    -50.585,
		  40,      7.959,    -72.948,     31.640,     22.216,
		  41,      7.959,    -72.948,     31.640,     22.216,
		  42,      1.709,    -73.778,     40.087,    -37.011,
		  43,      8.008,    -52.685,     51.855,     -8.789,
		  44,      6.445,    -13.525,     26.611,     18.261,
		  45,      5.322,    -34.716,     31.152,    -23.242,
		  46,      8.496,    -15.185,     26.074,      2.441,
		  47,      0.781,    -71.825,     38.671,          0,
		  48,      3.662,    -72.802,     54.882,      0.977,
		  49,     13.233,    -71.825,     40.478,          0,
		  50,      6.787,    -72.802,     54.443,          0,
		  51,      6.982,    -72.802,     50.927,      0.977,
		  52,      3.271,    -71.825,     55.273,          0,
		  53,      8.056,    -71.825,     51.903,      0.977,
		  54,      6.445,    -72.948,     53.564,      0.977,
		  55,      6.885,    -71.825,     56.200,          0,
		  56,      5.712,    -72.802,     52.636,      0.977,
		  57,      5.664,    -72.802,     52.782,      1.367,
		  58,      8.496,    -54.735,     26.074,      2.441,
		  59,      6.445,    -54.735,     26.611,     18.261,
		  60,      9.375,    -53.759,     48.388,     -8.301,
		  61,      8.740,    -46.191,     52.587,    -15.869,
		  62,     12.940,    -53.759,     51.953,     -8.301,
		  63,      5.030,    -72.802,     40.088,      0.977,
		  64,      3.418,    -64.696,     73.632,      6.543,
		  65,      0.244,    -72.509,     63.085,          0,
		  66,      7.324,    -72.167,     55.614,          0,
		  67,      3.906,    -72.753,     58.251,      1.221,
		  68,      7.324,    -72.020,     60.351,          0,
		  69,      7.324,    -71.532,     52.977,          0,
		  70,      7.324,    -71.532,     54.442,          0,
		  71,      3.907,    -72.753,     63.232,      1.221,
		  72,      7.324,    -71.532,     61.034,          0,
		  73,      7.568,    -71.532,     20.263,          0,
		  74,      0.830,    -71.532,     46.679,      0.977,
		  75,      7.324,    -71.532,     63.085,          0,
		  76,      7.324,    -71.532,     52.343,          0,
		  77,      0.977,    -71.532,     74.022,      0.977,
		  78,      7.324,    -71.532,     59.422,      0.977,
		  79,      3.906,    -72.802,     66.405,      1.221,
		  80,      7.324,    -72.020,     54.784,          0,
		  81,      3.906,    -72.802,     75.146,     15.234,
		  82,      7.324,    -72.265,     62.304,          0,
		  83,      3.906,    -72.753,     47.216,      1.221,
		  84,      0.977,    -71.532,     60.204,          0,
		  85,      7.324,    -71.532,     60.448,      1.221,
		  86,      0.244,    -71.532,     61.913,      0.977,
		  87,      0.245,    -71.532,     88.134,      0.977,
		  88,      0.244,    -71.581,     59.813,          0,
		  89,      0.244,    -71.532,     61.083,          0,
		  90,      3.906,    -71.532,     52.099,          0,
		  91,      7.324,    -73.729,     32.861,     20.508,
		  92,     -0.391,    -71.825,     35.888,          0,
		  93,      7.324,    -73.729,     32.861,     20.508,
		  94,      9.180,    -71.825,     49.267,    -44.091,
		  95,     -0.391,      6.103,     58.934,     16.308,
		  96,     18.066,    -73.632,     39.355,    -59.325,
		  97,      3.173,    -53.271,     50.878,      0.977,
		  98,      5.615,    -74.706,     54.003,      0.977,
		  99,      3.174,    -53.271,     47.998,      0.977,
		 100,      4.151,    -74.706,     52.441,      0.977,
		 101,      3.174,    -53.271,     54.296,      0.977,
		 102,      1.709,    -73.729,     39.355,          0,
		 103,      2.442,    -56.298,     48.730,     20.508,
		 104,      6.592,    -74.706,     52.685,          0,
		 105,      3.174,    -72.557,     23.242,          0,
		 106,     -0.586,    -72.557,     28.857,     20.508,
		 107,      6.592,    -74.706,     54.540,          0,
		 108,      8.691,    -74.706,     26.659,      0.977,
		 109,      6.592,    -53.271,     79.344,          0,
		 110,      6.592,    -53.271,     52.441,          0,
		 111,      3.174,    -53.271,     53.418,      0.977,
		 112,      5.616,    -53.271,     54.101,     20.508,
		 113,      4.151,    -53.271,     52.783,     20.508,
		 114,      6.592,    -53.271,     41.992,          0,
		 115,      3.174,    -53.271,     39.892,      0.977,
		 116,      2.392,    -67.431,     36.767,      0.977,
		 117,      6.591,    -52.294,     52.489,      0.977,
		 118,      0.244,    -52.294,     52.489,      0.977,
		 119,      0.635,    -52.294,     77.733,      0.977,
		 120,      0.244,    -52.294,     54.979,          0,
		 121,      0.244,    -52.294,     52.636,     20.508,
		 122,      3.173,    -52.294,     49.657,          0,
		 123,      3.955,    -73.729,     39.550,     20.508,
		 124,     24.658,    -73.729,     34.717,     20.508,
		 125,      3.955,    -73.729,     39.551,     20.508,
		 126,      8.789,    -36.425,     48.876,    -23.388
	];

	override function _draw(charCode:Int, x:Float, y:Float, s:Float, threshold:Float):Void
	{
		var o = 0;		
		switch (charCode)
		{			
			case 33:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   20.800 * s);
			_setf(o + ( 1 << 2), y +  -18.652 * s);
			_setf(o + ( 2 << 2), x +   15.722 * s);
			_setf(o + ( 3 << 2), y +  -18.652 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   15.722 * s,y +  -18.652 * s,x +   13.183 * s,y +  -34.928 * s,x +   11.914 * s,y +  -46.305 * s,x +   11.914 * s,y +  -52.782 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   11.914 * s);
			_setf(o + ( 1 << 2), y +  -72.802 * s);
			_setf(o + ( 2 << 2), x +   24.609 * s);
			_setf(o + ( 3 << 2), y +  -72.802 * s);
			_setf(o + ( 4 << 2), x +   24.609 * s);
			_setf(o + ( 5 << 2), y +  -52.831 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   24.609 * s,y +  -52.831 * s,x +   24.609 * s,y +  -46.321 * s,x +   23.339 * s,y +  -34.928 * s,x +   20.800 * s,y +  -18.652 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   18.652 * s);
			_setf(o + ( 1 << 2), y +  -15.039 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   18.652 * s,y +  -15.039 * s,x +   20.866 * s,y +  -15.039 * s,x +   22.745 * s,y +  -14.258 * s,x +   24.292 * s,y +  -12.695 * s, threshold);
			_vr.bezier8(x +   24.292 * s,y +  -12.695 * s,x +   25.838 * s,y +  -11.133 * s,x +   26.611 * s,y +   -9.245 * s,x +   26.611 * s,y +   -7.031 * s, threshold);
			_vr.bezier8(x +   26.611 * s,y +   -7.031 * s,x +   26.611 * s,y +   -4.818 * s,x +   25.838 * s,y +   -2.930 * s,x +   24.292 * s,y +   -1.367 * s, threshold);
			_vr.bezier8(x +   24.292 * s,y +   -1.367 * s,x +   22.745 * s,y +    0.195 * s,x +   20.866 * s,y +    0.977 * s,x +   18.652 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   18.652 * s,y +    0.977 * s,x +   16.438 * s,y +    0.977 * s,x +   14.551 * s,y +    0.195 * s,x +   12.988 * s,y +   -1.367 * s, threshold);
			_vr.bezier8(x +   12.988 * s,y +   -1.367 * s,x +   11.426 * s,y +   -2.930 * s,x +   10.644 * s,y +   -4.818 * s,x +   10.644 * s,y +   -7.031 * s, threshold);
			_vr.bezier8(x +   10.644 * s,y +   -7.031 * s,x +   10.644 * s,y +   -9.245 * s,x +   11.426 * s,y +  -11.133 * s,x +   12.988 * s,y +  -12.695 * s, threshold);
			_vr.bezier8(x +   12.988 * s,y +  -12.695 * s,x +   14.550 * s,y +  -14.258 * s,x +   16.438 * s,y +  -15.039 * s,x +   18.652 * s,y +  -15.039 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.718 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 34:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +   32.568 * s);
			_setf(o + ( 1 << 2), y +  -50.585 * s);
			_setf(o + ( 2 << 2), x +   23.339 * s);
			_setf(o + ( 3 << 2), y +  -50.585 * s);
			_setf(o + ( 4 << 2), x +   21.972 * s);
			_setf(o + ( 5 << 2), y +  -71.630 * s);
			_setf(o + ( 6 << 2), x +   34.081 * s);
			_setf(o + ( 7 << 2), y +  -71.630 * s);
			_setf(o + ( 8 << 2), x +   32.568 * s);
			_setf(o + ( 9 << 2), y +  -50.585 * s);
			_setf(o + (10 << 2), x +   14.013 * s);
			_setf(o + (11 << 2), y +  -50.585 * s);
			_setf(o + (12 << 2), x +    4.785 * s);
			_setf(o + (13 << 2), y +  -50.585 * s);
			_setf(o + (14 << 2), x +    3.418 * s);
			_setf(o + (15 << 2), y +  -71.630 * s);
			_setf(o + (16 << 2), x +   15.527 * s);
			_setf(o + (17 << 2), y +  -71.630 * s);
			_setf(o + (18 << 2), x +   14.013 * s);
			_setf(o + (19 << 2), y +  -50.585 * s);
			_setf(o + (20 << 2), x +   36.669 * s);
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
			_setf(o + ( 2 << 2), x +   46.825 * s);
			_setf(o + ( 3 << 2), y +  -44.433 * s);
			_setf(o + ( 4 << 2), x +   42.723 * s);
			_setf(o + ( 5 << 2), y +  -28.808 * s);
			_setf(o + ( 6 << 2), x +   50.243 * s);
			_setf(o + ( 7 << 2), y +  -28.808 * s);
			_setf(o + ( 8 << 2), x +   50.243 * s);
			_setf(o + ( 9 << 2), y +  -19.970 * s);
			_setf(o + (10 << 2), x +   40.380 * s);
			_setf(o + (11 << 2), y +  -19.970 * s);
			_setf(o + (12 << 2), x +   34.520 * s);
			_setf(o + (13 << 2), y +    0.977 * s);
			_setf(o + (14 << 2), x +   24.999 * s);
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
			_setf(o + (38 << 2), x +   18.798 * s);
			_setf(o + (39 << 2), y +  -53.271 * s);
			_setf(o + (40 << 2), x +   24.071 * s);
			_setf(o + (41 << 2), y +  -72.606 * s);
			_setf(o + (42 << 2), x +   33.495 * s);
			_setf(o + (43 << 2), y +  -72.606 * s);
			_setf(o + (44 << 2), x +   28.368 * s);
			_setf(o + (45 << 2), y +  -53.271 * s);
			_setf(o + (46 << 2), x +   39.550 * s);
			_setf(o + (47 << 2), y +  -53.271 * s);
			_setf(o + (48 << 2), x +   44.824 * s);
			_setf(o + (49 << 2), y +  -72.606 * s);
			_setf(o + (50 << 2), x +   54.247 * s);
			_setf(o + (51 << 2), y +  -72.606 * s);
			_setf(o + (52 << 2), x +   49.170 * s);
			_setf(o + (53 << 2), y +  -53.271 * s);
			_setf(o + (54 << 2), x +   57.323 * s);
			_setf(o + (55 << 2), y +  -53.271 * s);
			_setf(o + (56 << 2), x +   57.323 * s);
			_setf(o + (57 << 2), y +  -44.433 * s);
			_setf(o + (58 << 2), x +   37.548 * s);
			_setf(o + (59 << 2), y +  -44.433 * s);
			_setf(o + (60 << 2), x +   25.976 * s);
			_setf(o + (61 << 2), y +  -44.433 * s);
			_setf(o + (62 << 2), x +   21.874 * s);
			_setf(o + (63 << 2), y +  -28.808 * s);
			_setf(o + (64 << 2), x +   33.350 * s);
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
			_setf(o + ( 0 << 2), x +   23.096 * s);
			_setf(o + ( 1 << 2), y +    1.123 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   23.096 * s,y +    1.123 * s,x +   17.432 * s,y +    0.732 * s,x +   12.256 * s,y +   -0.960 * s,x +    7.569 * s,y +   -3.955 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   12.256 * s);
			_setf(o + ( 1 << 2), y +  -15.332 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   12.256 * s,y +  -15.332 * s,x +   17.269 * s,y +  -11.816 * s,x +   22.201 * s,y +  -10.058 * s,x +   27.051 * s,y +  -10.058 * s, threshold);
			_vr.bezier8(x +   27.051 * s,y +  -10.058 * s,x +   34.505 * s,y +  -10.058 * s,x +   38.232 * s,y +  -12.630 * s,x +   38.232 * s,y +  -17.773 * s, threshold);
			_vr.bezier8(x +   38.232 * s,y +  -17.773 * s,x +   38.232 * s,y +  -20.345 * s,x +   37.280 * s,y +  -22.762 * s,x +   35.376 * s,y +  -25.024 * s, threshold);
			_vr.bezier8(x +   35.376 * s,y +  -25.024 * s,x +   33.472 * s,y +  -27.286 * s,x +   29.858 * s,y +  -29.752 * s,x +   24.536 * s,y +  -32.421 * s, threshold);
			_vr.bezier8(x +   24.536 * s,y +  -32.421 * s,x +   19.214 * s,y +  -35.091 * s,x +   15.593 * s,y +  -37.304 * s,x +   13.672 * s,y +  -39.062 * s, threshold);
			_vr.bezier8(x +   13.672 * s,y +  -39.062 * s,x +   11.752 * s,y +  -40.820 * s,x +   10.279 * s,y +  -42.919 * s,x +    9.253 * s,y +  -45.361 * s, threshold);
			_vr.bezier8(x +    9.253 * s,y +  -45.361 * s,x +    8.228 * s,y +  -47.802 * s,x +    7.715 * s,y +  -50.520 * s,x +    7.715 * s,y +  -53.515 * s, threshold);
			_vr.bezier8(x +    7.715 * s,y +  -53.515 * s,x +    7.715 * s,y +  -57.942 * s,x +    9.107 * s,y +  -61.848 * s,x +   11.890 * s,y +  -65.233 * s, threshold);
			_vr.bezier8(x +   11.890 * s,y +  -65.233 * s,x +   14.673 * s,y +  -68.619 * s,x +   18.408 * s,y +  -70.881 * s,x +   23.096 * s,y +  -72.020 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   23.096 * s);
			_setf(o + ( 1 << 2), y +  -80.858 * s);
			_setf(o + ( 2 << 2), x +   34.277 * s);
			_setf(o + ( 3 << 2), y +  -80.858 * s);
			_setf(o + ( 4 << 2), x +   34.228 * s);
			_setf(o + ( 5 << 2), y +  -72.509 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   34.228 * s,y +  -72.509 * s,x +   40.218 * s,y +  -71.923 * s,x +   44.677 * s,y +  -70.458 * s,x +   47.607 * s,y +  -68.114 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   43.750 * s);
			_setf(o + ( 1 << 2), y +  -57.177 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   43.750 * s,y +  -57.177 * s,x +   39.290 * s,y +  -60.367 * s,x +   34.586 * s,y +  -61.962 * s,x +   29.639 * s,y +  -61.962 * s, threshold);
			_vr.bezier8(x +   29.639 * s,y +  -61.962 * s,x +   26.709 * s,y +  -61.962 * s,x +   24.438 * s,y +  -61.173 * s,x +   22.827 * s,y +  -59.594 * s, threshold);
			_vr.bezier8(x +   22.827 * s,y +  -59.594 * s,x +   21.216 * s,y +  -58.015 * s,x +   20.410 * s,y +  -56.021 * s,x +   20.410 * s,y +  -53.612 * s, threshold);
			_vr.bezier8(x +   20.410 * s,y +  -53.612 * s,x +   20.410 * s,y +  -49.511 * s,x +   24.954 * s,y +  -45.252 * s,x +   34.033 * s,y +  -40.820 * s, threshold);
			_vr.bezier8(x +   34.033 * s,y +  -40.820 * s,x +   38.821 * s,y +  -38.482 * s,x +   42.269 * s,y +  -36.319 * s,x +   44.384 * s,y +  -34.350 * s, threshold);
			_vr.bezier8(x +   44.384 * s,y +  -34.350 * s,x +   46.500 * s,y +  -32.381 * s,x +   48.112 * s,y +  -30.086 * s,x +   49.218 * s,y +  -27.465 * s, threshold);
			_vr.bezier8(x +   49.218 * s,y +  -27.465 * s,x +   50.325 * s,y +  -24.845 * s,x +   50.879 * s,y +  -21.924 * s,x +   50.879 * s,y +  -18.701 * s, threshold);
			_vr.bezier8(x +   50.879 * s,y +  -18.701 * s,x +   50.879 * s,y +  -14.144 * s,x +   49.414 * s,y +  -10.164 * s,x +   46.484 * s,y +   -6.763 * s, threshold);
			_vr.bezier8(x +   46.484 * s,y +   -6.763 * s,x +   43.554 * s,y +   -3.361 * s,x +   39.485 * s,y +   -1.025 * s,x +   34.277 * s,y +    0.244 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   34.277 * s);
			_setf(o + ( 1 << 2), y +   11.474 * s);
			_setf(o + ( 2 << 2), x +   23.096 * s);
			_setf(o + ( 3 << 2), y +   11.474 * s);
			_setf(o + ( 4 << 2), x +   23.096 * s);
			_setf(o + ( 5 << 2), y +    1.123 * s);
			_setf(o + ( 6 << 2), x +   58.593 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			
			case 37:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    1.514 * s);
			_setf(o + ( 1 << 2), y +  -55.956 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +    1.514 * s,y +  -55.956 * s,x +    1.514 * s,y +  -60.904 * s,x +    2.962 * s,y +  -64.949 * s,x +    5.860 * s,y +  -68.090 * s, threshold);
			_vr.bezier8(x +    5.860 * s,y +  -68.090 * s,x +    8.757 * s,y +  -71.231 * s,x +   12.468 * s,y +  -72.802 * s,x +   16.992 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   16.992 * s,y +  -72.802 * s,x +   21.451 * s,y +  -72.802 * s,x +   25.008 * s,y +  -71.239 * s,x +   27.661 * s,y +  -68.114 * s, threshold);
			_vr.bezier8(x +   27.661 * s,y +  -68.114 * s,x +   30.314 * s,y +  -64.989 * s,x +   31.640 * s,y +  -60.627 * s,x +   31.640 * s,y +  -55.028 * s, threshold);
			_vr.bezier8(x +   31.640 * s,y +  -55.028 * s,x +   31.640 * s,y +  -49.820 * s,x +   30.241 * s,y +  -45.637 * s,x +   27.441 * s,y +  -42.480 * s, threshold);
			_vr.bezier8(x +   27.441 * s,y +  -42.480 * s,x +   24.642 * s,y +  -39.322 * s,x +   21.012 * s,y +  -37.744 * s,x +   16.553 * s,y +  -37.744 * s, threshold);
			_vr.bezier8(x +   16.553 * s,y +  -37.744 * s,x +    6.527 * s,y +  -37.744 * s,x +    1.514 * s,y +  -43.815 * s,x +    1.514 * s,y +  -55.956 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   10.596 * s);
			_setf(o + ( 1 << 2), y +  -55.468 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   10.596 * s,y +  -55.468 * s,x +   10.596 * s,y +  -52.213 * s,x +   11.117 * s,y +  -49.706 * s,x +   12.158 * s,y +  -47.948 * s, threshold);
			_vr.bezier8(x +   12.158 * s,y +  -47.948 * s,x +   13.200 * s,y +  -46.191 * s,x +   14.518 * s,y +  -45.312 * s,x +   16.113 * s,y +  -45.312 * s, threshold);
			_vr.bezier8(x +   16.113 * s,y +  -45.312 * s,x +   20.410 * s,y +  -45.312 * s,x +   22.558 * s,y +  -48.681 * s,x +   22.558 * s,y +  -55.419 * s, threshold);
			_vr.bezier8(x +   22.558 * s,y +  -55.419 * s,x +   22.558 * s,y +  -61.929 * s,x +   20.654 * s,y +  -65.185 * s,x +   16.846 * s,y +  -65.185 * s, threshold);
			_vr.bezier8(x +   16.846 * s,y +  -65.185 * s,x +   12.679 * s,y +  -65.185 * s,x +   10.596 * s,y +  -61.946 * s,x +   10.596 * s,y +  -55.468 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   16.357 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			_setf(o + ( 2 << 2), x +    6.787 * s);
			_setf(o + ( 3 << 2), y +    0.977 * s);
			_setf(o + ( 4 << 2), x +   51.611 * s);
			_setf(o + ( 5 << 2), y +  -72.802 * s);
			_setf(o + ( 6 << 2), x +   61.132 * s);
			_setf(o + ( 7 << 2), y +  -72.802 * s);
			_setf(o + ( 8 << 2), x +   16.357 * s);
			_setf(o + ( 9 << 2), y +    0.977 * s);
			_setf(o + (10 << 2), x +   35.693 * s);
			_setf(o + (11 << 2), y +  -17.236 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_vr.bezier8(x +   35.693 * s,y +  -17.236 * s,x +   35.693 * s,y +  -22.184 * s,x +   37.142 * s,y +  -26.228 * s,x +   40.039 * s,y +  -29.370 * s, threshold);
			_vr.bezier8(x +   40.039 * s,y +  -29.370 * s,x +   42.936 * s,y +  -32.511 * s,x +   46.647 * s,y +  -34.081 * s,x +   51.171 * s,y +  -34.081 * s, threshold);
			_vr.bezier8(x +   51.171 * s,y +  -34.081 * s,x +   55.631 * s,y +  -34.081 * s,x +   59.187 * s,y +  -32.519 * s,x +   61.840 * s,y +  -29.394 * s, threshold);
			_vr.bezier8(x +   61.840 * s,y +  -29.394 * s,x +   64.493 * s,y +  -26.269 * s,x +   65.820 * s,y +  -21.924 * s,x +   65.820 * s,y +  -16.357 * s, threshold);
			_vr.bezier8(x +   65.820 * s,y +  -16.357 * s,x +   65.820 * s,y +  -11.149 * s,x +   64.420 * s,y +   -6.958 * s,x +   61.620 * s,y +   -3.784 * s, threshold);
			_vr.bezier8(x +   61.620 * s,y +   -3.784 * s,x +   58.821 * s,y +   -0.610 * s,x +   55.191 * s,y +    0.977 * s,x +   50.732 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   50.732 * s,y +    0.977 * s,x +   40.706 * s,y +    0.977 * s,x +   35.693 * s,y +   -5.095 * s,x +   35.693 * s,y +  -17.236 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   44.775 * s);
			_setf(o + ( 1 << 2), y +  -16.797 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   44.775 * s,y +  -16.797 * s,x +   44.775 * s,y +  -13.541 * s,x +   45.288 * s,y +  -11.035 * s,x +   46.313 * s,y +   -9.277 * s, threshold);
			_vr.bezier8(x +   46.313 * s,y +   -9.277 * s,x +   47.338 * s,y +   -7.519 * s,x +   48.665 * s,y +   -6.641 * s,x +   50.292 * s,y +   -6.641 * s, threshold);
			_vr.bezier8(x +   50.292 * s,y +   -6.641 * s,x +   54.589 * s,y +   -6.641 * s,x +   56.738 * s,y +  -10.009 * s,x +   56.738 * s,y +  -16.748 * s, threshold);
			_vr.bezier8(x +   56.738 * s,y +  -16.748 * s,x +   56.738 * s,y +  -23.258 * s,x +   54.833 * s,y +  -26.513 * s,x +   51.025 * s,y +  -26.513 * s, threshold);
			_vr.bezier8(x +   51.025 * s,y +  -26.513 * s,x +   46.858 * s,y +  -26.513 * s,x +   44.775 * s,y +  -23.274 * s,x +   44.775 * s,y +  -16.797 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   68.407 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 38:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   45.166 * s);
			_setf(o + ( 1 << 2), y +   -2.148 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   45.166 * s,y +   -2.148 * s,x +   40.283 * s,y +   -0.065 * s,x +   34.651 * s,y +    0.977 * s,x +   28.271 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   28.271 * s,y +    0.977 * s,x +   20.980 * s,y +    0.977 * s,x +   15.357 * s,y +   -1.123 * s,x +   11.402 * s,y +   -5.322 * s, threshold);
			_vr.bezier8(x +   11.402 * s,y +   -5.322 * s,x +    7.447 * s,y +   -9.521 * s,x +    5.469 * s,y +  -15.299 * s,x +    5.469 * s,y +  -22.656 * s, threshold);
			_vr.bezier8(x +    5.469 * s,y +  -22.656 * s,x +    5.469 * s,y +  -29.557 * s,x +    7.894 * s,y +  -35.449 * s,x +   12.744 * s,y +  -40.331 * s, threshold);
			_vr.bezier8(x +   12.744 * s,y +  -40.331 * s,x +    8.545 * s,y +  -44.596 * s,x +    6.446 * s,y +  -49.153 * s,x +    6.446 * s,y +  -54.003 * s, threshold);
			_vr.bezier8(x +    6.446 * s,y +  -54.003 * s,x +    6.446 * s,y +  -59.179 * s,x +    8.472 * s,y +  -63.606 * s,x +   12.525 * s,y +  -67.284 * s, threshold);
			_vr.bezier8(x +   12.525 * s,y +  -67.284 * s,x +   16.577 * s,y +  -70.962 * s,x +   21.957 * s,y +  -72.802 * s,x +   28.662 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   28.662 * s,y +  -72.802 * s,x +   35.693 * s,y +  -72.802 * s,x +   41.487 * s,y +  -71.028 * s,x +   46.045 * s,y +  -67.479 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   40.869 * s);
			_setf(o + ( 1 << 2), y +  -58.593 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   40.869 * s,y +  -58.593 * s,x +   36.800 * s,y +  -61.490 * s,x +   33.235 * s,y +  -62.938 * s,x +   30.176 * s,y +  -62.938 * s, threshold);
			_vr.bezier8(x +   30.176 * s,y +  -62.938 * s,x +   26.497 * s,y +  -62.938 * s,x +   23.657 * s,y +  -62.051 * s,x +   21.655 * s,y +  -60.277 * s, threshold);
			_vr.bezier8(x +   21.655 * s,y +  -60.277 * s,x +   19.653 * s,y +  -58.503 * s,x +   18.652 * s,y +  -56.103 * s,x +   18.652 * s,y +  -53.075 * s, threshold);
			_vr.bezier8(x +   18.652 * s,y +  -53.075 * s,x +   18.652 * s,y +  -49.592 * s,x +   20.215 * s,y +  -46.614 * s,x +   23.340 * s,y +  -44.140 * s, threshold);
			o = _posf(16);
			_setf(o + ( 0 << 2), x +   39.551 * s);
			_setf(o + ( 1 << 2), y +  -44.140 * s);
			_setf(o + ( 2 << 2), x +   39.551 * s);
			_setf(o + ( 3 << 2), y +  -52.294 * s);
			_setf(o + ( 4 << 2), x +   51.757 * s);
			_setf(o + ( 5 << 2), y +  -56.835 * s);
			_setf(o + ( 6 << 2), x +   51.757 * s);
			_setf(o + ( 7 << 2), y +  -43.993 * s);
			_setf(o + ( 8 << 2), x +   63.915 * s);
			_setf(o + ( 9 << 2), y +  -43.993 * s);
			_setf(o + (10 << 2), x +   63.915 * s);
			_setf(o + (11 << 2), y +  -33.691 * s);
			_setf(o + (12 << 2), x +   51.757 * s);
			_setf(o + (13 << 2), y +  -33.691 * s);
			_setf(o + (14 << 2), x +   51.757 * s);
			_setf(o + (15 << 2), y +  -19.580 * s);
			o = _posb(8);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_vr.bezier8(x +   51.757 * s,y +  -19.580 * s,x +   51.757 * s,y +  -15.836 * s,x +   52.262 * s,y +  -13.273 * s,x +   53.271 * s,y +  -11.889 * s, threshold);
			_vr.bezier8(x +   53.271 * s,y +  -11.889 * s,x +   54.280 * s,y +  -10.506 * s,x +   55.973 * s,y +   -9.814 * s,x +   58.349 * s,y +   -9.814 * s, threshold);
			_vr.bezier8(x +   58.349 * s,y +   -9.814 * s,x +   60.595 * s,y +   -9.814 * s,x +   62.841 * s,y +  -10.319 * s,x +   65.087 * s,y +  -11.328 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   65.087 * s);
			_setf(o + ( 1 << 2), y +   -0.635 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   65.087 * s,y +   -0.635 * s,x +   61.702 * s,y +    0.439 * s,x +   58.056 * s,y +    0.977 * s,x +   54.150 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   54.150 * s,y +    0.977 * s,x +   51.025 * s,y +    0.977 * s,x +   48.030 * s,y +   -0.065 * s,x +   45.166 * s,y +   -2.148 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   39.551 * s);
			_setf(o + ( 1 << 2), y +  -16.113 * s);
			_setf(o + ( 2 << 2), x +   39.551 * s);
			_setf(o + ( 3 << 2), y +  -33.691 * s);
			_setf(o + ( 4 << 2), x +   22.070 * s);
			_setf(o + ( 5 << 2), y +  -33.691 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   22.070 * s,y +  -33.691 * s,x +   19.466 * s,y +  -30.533 * s,x +   18.164 * s,y +  -26.985 * s,x +   18.164 * s,y +  -23.047 * s, threshold);
			_vr.bezier8(x +   18.164 * s,y +  -23.047 * s,x +   18.164 * s,y +  -14.225 * s,x +   22.640 * s,y +   -9.814 * s,x +   31.592 * s,y +   -9.814 * s, threshold);
			_vr.bezier8(x +   31.592 * s,y +   -9.814 * s,x +   35.140 * s,y +   -9.814 * s,x +   37.907 * s,y +  -10.335 * s,x +   39.892 * s,y +  -11.377 * s, threshold);
			_vr.bezier8(x +   39.892 * s,y +  -11.377 * s,x +   39.664 * s,y +  -12.581 * s,x +   39.551 * s,y +  -14.160 * s,x +   39.551 * s,y +  -16.113 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   70.605 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 39:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   16.455 * s);
			_setf(o + ( 1 << 2), y +  -50.585 * s);
			_setf(o + ( 2 << 2), x +    7.226 * s);
			_setf(o + ( 3 << 2), y +  -50.585 * s);
			_setf(o + ( 4 << 2), x +    5.859 * s);
			_setf(o + ( 5 << 2), y +  -71.630 * s);
			_setf(o + ( 6 << 2), x +   17.968 * s);
			_setf(o + ( 7 << 2), y +  -71.630 * s);
			_setf(o + ( 8 << 2), x +   16.455 * s);
			_setf(o + ( 9 << 2), y +  -50.585 * s);
			_setf(o + (10 << 2), x +   22.949 * s);
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
			_setf(o + ( 0 << 2), x +   31.640 * s);
			_setf(o + ( 1 << 2), y +  -72.948 * s);
			_setf(o + ( 2 << 2), x +   31.640 * s);
			_setf(o + ( 3 << 2), y +  -66.210 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   31.640 * s,y +  -66.210 * s,x +   25.195 * s,y +  -57.193 * s,x +   21.972 * s,y +  -44.172 * s,x +   21.972 * s,y +  -27.148 * s, threshold);
			_vr.bezier8(x +   21.972 * s,y +  -27.148 * s,x +   21.972 * s,y +   -6.901 * s,x +   25.195 * s,y +    6.803 * s,x +   31.640 * s,y +   13.965 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   31.640 * s);
			_setf(o + ( 1 << 2), y +   22.216 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   31.640 * s,y +   22.216 * s,x +   23.958 * s,y +   17.008 * s,x +   18.090 * s,y +   10.107 * s,x +   14.038 * s,y +    1.514 * s, threshold);
			_vr.bezier8(x +   14.038 * s,y +    1.514 * s,x +    9.985 * s,y +   -7.080 * s,x +    7.959 * s,y +  -16.667 * s,x +    7.959 * s,y +  -27.246 * s, threshold);
			_vr.bezier8(x +    7.959 * s,y +  -27.246 * s,x +    7.959 * s,y +  -36.295 * s,x +   10.237 * s,y +  -45.336 * s,x +   14.794 * s,y +  -54.369 * s, threshold);
			_vr.bezier8(x +   14.794 * s,y +  -54.369 * s,x +   19.352 * s,y +  -63.402 * s,x +   24.967 * s,y +  -69.595 * s,x +   31.640 * s,y +  -72.948 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.718 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 41:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    7.959 * s);
			_setf(o + ( 1 << 2), y +   22.216 * s);
			_setf(o + ( 2 << 2), x +    7.959 * s);
			_setf(o + ( 3 << 2), y +   13.965 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    7.959 * s,y +   13.965 * s,x +   14.404 * s,y +    6.803 * s,x +   17.627 * s,y +   -6.901 * s,x +   17.627 * s,y +  -27.148 * s, threshold);
			_vr.bezier8(x +   17.627 * s,y +  -27.148 * s,x +   17.627 * s,y +  -44.172 * s,x +   14.404 * s,y +  -57.193 * s,x +    7.959 * s,y +  -66.210 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    7.959 * s);
			_setf(o + ( 1 << 2), y +  -72.948 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    7.959 * s,y +  -72.948 * s,x +   14.632 * s,y +  -69.595 * s,x +   20.247 * s,y +  -63.402 * s,x +   24.804 * s,y +  -54.369 * s, threshold);
			_vr.bezier8(x +   24.804 * s,y +  -54.369 * s,x +   29.361 * s,y +  -45.336 * s,x +   31.640 * s,y +  -36.295 * s,x +   31.640 * s,y +  -27.246 * s, threshold);
			_vr.bezier8(x +   31.640 * s,y +  -27.246 * s,x +   31.640 * s,y +  -16.667 * s,x +   29.614 * s,y +   -7.080 * s,x +   25.561 * s,y +    1.514 * s, threshold);
			_vr.bezier8(x +   25.561 * s,y +    1.514 * s,x +   21.508 * s,y +   10.107 * s,x +   15.641 * s,y +   17.008 * s,x +    7.959 * s,y +   22.216 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.718 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 42:
			
			o = _posf(54);
			_setf(o + ( 0 << 2), x +   32.763 * s);
			_setf(o + ( 1 << 2), y +  -53.808 * s);
			_setf(o + ( 2 << 2), x +   26.220 * s);
			_setf(o + ( 3 << 2), y +  -53.271 * s);
			_setf(o + ( 4 << 2), x +   32.910 * s);
			_setf(o + ( 5 << 2), y +  -49.462 * s);
			_setf(o + ( 6 << 2), x +   37.109 * s);
			_setf(o + ( 7 << 2), y +  -44.042 * s);
			_setf(o + ( 8 << 2), x +   27.685 * s);
			_setf(o + ( 9 << 2), y +  -37.011 * s);
			_setf(o + (10 << 2), x +   23.584 * s);
			_setf(o + (11 << 2), y +  -42.968 * s);
			_setf(o + (12 << 2), x +   20.996 * s);
			_setf(o + (13 << 2), y +  -49.218 * s);
			_setf(o + (14 << 2), x +   18.603 * s);
			_setf(o + (15 << 2), y +  -43.652 * s);
			_setf(o + (16 << 2), x +   13.183 * s);
			_setf(o + (17 << 2), y +  -37.011 * s);
			_setf(o + (18 << 2), x +    4.785 * s);
			_setf(o + (19 << 2), y +  -44.531 * s);
			_setf(o + (20 << 2), x +   10.547 * s);
			_setf(o + (21 << 2), y +  -50.146 * s);
			_setf(o + (22 << 2), x +   15.918 * s);
			_setf(o + (23 << 2), y +  -52.929 * s);
			_setf(o + (24 << 2), x +    9.326 * s);
			_setf(o + (25 << 2), y +  -53.515 * s);
			_setf(o + (26 << 2), x +    1.709 * s);
			_setf(o + (27 << 2), y +  -56.542 * s);
			_setf(o + (28 << 2), x +    6.494 * s);
			_setf(o + (29 << 2), y +  -66.552 * s);
			_setf(o + (30 << 2), x +   14.209 * s);
			_setf(o + (31 << 2), y +  -63.280 * s);
			_setf(o + (32 << 2), x +   17.676 * s);
			_setf(o + (33 << 2), y +  -59.569 * s);
			_setf(o + (34 << 2), x +   15.039 * s);
			_setf(o + (35 << 2), y +  -67.138 * s);
			_setf(o + (36 << 2), x +   15.039 * s);
			_setf(o + (37 << 2), y +  -73.778 * s);
			_setf(o + (38 << 2), x +   26.562 * s);
			_setf(o + (39 << 2), y +  -73.729 * s);
			_setf(o + (40 << 2), x +   26.562 * s);
			_setf(o + (41 << 2), y +  -67.333 * s);
			_setf(o + (42 << 2), x +   24.316 * s);
			_setf(o + (43 << 2), y +  -59.423 * s);
			_setf(o + (44 << 2), x +   29.199 * s);
			_setf(o + (45 << 2), y +  -63.769 * s);
			_setf(o + (46 << 2), x +   36.132 * s);
			_setf(o + (47 << 2), y +  -66.796 * s);
			_setf(o + (48 << 2), x +   40.087 * s);
			_setf(o + (49 << 2), y +  -56.982 * s);
			_setf(o + (50 << 2), x +   32.763 * s);
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
			_setf(o + ( 0 << 2), x +   10.595 * s);
			_setf(o + ( 1 << 2), y +   18.261 * s);
			_setf(o + ( 2 << 2), x +    6.445 * s);
			_setf(o + ( 3 << 2), y +   12.939 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    6.445 * s,y +   12.939 * s,x +   12.402 * s,y +    8.480 * s,x +   15.381 * s,y +    4.980 * s,x +   15.381 * s,y +    2.441 * s, threshold);
			_vr.bezier8(x +   15.381 * s,y +    2.441 * s,x +   15.381 * s,y +    1.465 * s,x +   15.039 * s,y +    0.505 * s,x +   14.355 * s,y +   -0.439 * s, threshold);
			_vr.bezier8(x +   14.355 * s,y +   -0.439 * s,x +   11.263 * s,y +   -1.937 * s,x +    9.717 * s,y +   -4.036 * s,x +    9.717 * s,y +   -6.738 * s, threshold);
			_vr.bezier8(x +    9.717 * s,y +   -6.738 * s,x +    9.717 * s,y +   -8.691 * s,x +   10.530 * s,y +  -10.311 * s,x +   12.158 * s,y +  -11.596 * s, threshold);
			_vr.bezier8(x +   12.158 * s,y +  -11.596 * s,x +   13.786 * s,y +  -12.882 * s,x +   15.804 * s,y +  -13.525 * s,x +   18.213 * s,y +  -13.525 * s, threshold);
			_vr.bezier8(x +   18.213 * s,y +  -13.525 * s,x +   20.459 * s,y +  -13.525 * s,x +   22.420 * s,y +  -12.671 * s,x +   24.096 * s,y +  -10.962 * s, threshold);
			_vr.bezier8(x +   24.096 * s,y +  -10.962 * s,x +   25.773 * s,y +   -9.253 * s,x +   26.611 * s,y +   -7.275 * s,x +   26.611 * s,y +   -5.029 * s, threshold);
			_vr.bezier8(x +   26.611 * s,y +   -5.029 * s,x +   26.611 * s,y +   -0.895 * s,x +   25.643 * s,y +    2.873 * s,x +   23.706 * s,y +    6.274 * s, threshold);
			_vr.bezier8(x +   23.706 * s,y +    6.274 * s,x +   21.769 * s,y +    9.676 * s,x +   17.399 * s,y +   13.672 * s,x +   10.595 * s,y +   18.261 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.718 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 45:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +    5.322 * s);
			_setf(o + ( 1 << 2), y +  -23.242 * s);
			_setf(o + ( 2 << 2), x +    5.322 * s);
			_setf(o + ( 3 << 2), y +  -34.716 * s);
			_setf(o + ( 4 << 2), x +   31.152 * s);
			_setf(o + ( 5 << 2), y +  -34.716 * s);
			_setf(o + ( 6 << 2), x +   31.152 * s);
			_setf(o + ( 7 << 2), y +  -23.242 * s);
			_setf(o + ( 8 << 2), x +    5.322 * s);
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
			_setf(o + ( 0 << 2), x +    8.496 * s);
			_setf(o + ( 1 << 2), y +   -6.396 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +    8.496 * s,y +   -6.396 * s,x +    8.496 * s,y +   -8.838 * s,x +    9.350 * s,y +  -10.913 * s,x +   11.059 * s,y +  -12.622 * s, threshold);
			_vr.bezier8(x +   11.059 * s,y +  -12.622 * s,x +   12.768 * s,y +  -14.331 * s,x +   14.843 * s,y +  -15.185 * s,x +   17.285 * s,y +  -15.185 * s, threshold);
			_vr.bezier8(x +   17.285 * s,y +  -15.185 * s,x +   19.727 * s,y +  -15.185 * s,x +   21.802 * s,y +  -14.331 * s,x +   23.511 * s,y +  -12.622 * s, threshold);
			_vr.bezier8(x +   23.511 * s,y +  -12.622 * s,x +   25.220 * s,y +  -10.913 * s,x +   26.074 * s,y +   -8.838 * s,x +   26.074 * s,y +   -6.396 * s, threshold);
			_vr.bezier8(x +   26.074 * s,y +   -6.396 * s,x +   26.074 * s,y +   -3.955 * s,x +   25.220 * s,y +   -1.872 * s,x +   23.511 * s,y +   -0.146 * s, threshold);
			_vr.bezier8(x +   23.511 * s,y +   -0.146 * s,x +   21.802 * s,y +    1.579 * s,x +   19.727 * s,y +    2.441 * s,x +   17.285 * s,y +    2.441 * s, threshold);
			_vr.bezier8(x +   17.285 * s,y +    2.441 * s,x +   14.843 * s,y +    2.441 * s,x +   12.768 * s,y +    1.579 * s,x +   11.059 * s,y +   -0.146 * s, threshold);
			_vr.bezier8(x +   11.059 * s,y +   -0.146 * s,x +    9.350 * s,y +   -1.872 * s,x +    8.496 * s,y +   -3.955 * s,x +    8.496 * s,y +   -6.396 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.719 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 47:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   11.767 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    0.781 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   27.782 * s);
			_setf(o + ( 5 << 2), y +  -71.825 * s);
			_setf(o + ( 6 << 2), x +   38.671 * s);
			_setf(o + ( 7 << 2), y +  -71.825 * s);
			_setf(o + ( 8 << 2), x +   11.767 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   39.013 * s);
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
			_setf(o + ( 0 << 2), x +    3.662 * s);
			_setf(o + ( 1 << 2), y +  -37.939 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +    3.662 * s,y +  -37.939 * s,x +    3.662 * s,y +  -47.705 * s,x +    6.046 * s,y +  -55.956 * s,x +   10.815 * s,y +  -62.694 * s, threshold);
			_vr.bezier8(x +   10.815 * s,y +  -62.694 * s,x +   15.584 * s,y +  -69.433 * s,x +   21.956 * s,y +  -72.802 * s,x +   29.931 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   29.931 * s,y +  -72.802 * s,x +   46.564 * s,y +  -72.802 * s,x +   54.882 * s,y +  -60.659 * s,x +   54.882 * s,y +  -36.376 * s, threshold);
			_vr.bezier8(x +   54.882 * s,y +  -36.376 * s,x +   54.882 * s,y +  -25.016 * s,x +   52.636 * s,y +  -15.950 * s,x +   48.143 * s,y +   -9.180 * s, threshold);
			_vr.bezier8(x +   48.143 * s,y +   -9.180 * s,x +   43.651 * s,y +   -2.409 * s,x +   37.353 * s,y +    0.977 * s,x +   29.247 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   29.247 * s,y +    0.977 * s,x +   20.523 * s,y +    0.977 * s,x +   14.078 * s,y +   -2.148 * s,x +    9.912 * s,y +   -8.398 * s, threshold);
			_vr.bezier8(x +    9.912 * s,y +   -8.398 * s,x +    5.745 * s,y +  -14.648 * s,x +    3.662 * s,y +  -24.495 * s,x +    3.662 * s,y +  -37.939 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   16.845 * s);
			_setf(o + ( 1 << 2), y +  -37.060 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   16.845 * s,y +  -37.060 * s,x +   16.845 * s,y +  -27.522 * s,x +   17.773 * s,y +  -20.507 * s,x +   19.628 * s,y +  -16.015 * s, threshold);
			_vr.bezier8(x +   19.628 * s,y +  -16.015 * s,x +   21.484 * s,y +  -11.523 * s,x +   24.560 * s,y +   -9.277 * s,x +   28.857 * s,y +   -9.277 * s, threshold);
			_vr.bezier8(x +   28.857 * s,y +   -9.277 * s,x +   33.511 * s,y +   -9.277 * s,x +   36.815 * s,y +  -11.304 * s,x +   38.769 * s,y +  -15.356 * s, threshold);
			_vr.bezier8(x +   38.769 * s,y +  -15.356 * s,x +   40.722 * s,y +  -19.409 * s,x +   41.698 * s,y +  -26.627 * s,x +   41.698 * s,y +  -37.011 * s, threshold);
			_vr.bezier8(x +   41.698 * s,y +  -37.011 * s,x +   41.698 * s,y +  -46.679 * s,x +   40.762 * s,y +  -53.352 * s,x +   38.891 * s,y +  -57.030 * s, threshold);
			_vr.bezier8(x +   38.891 * s,y +  -57.030 * s,x +   37.019 * s,y +  -60.709 * s,x +   33.951 * s,y +  -62.548 * s,x +   29.687 * s,y +  -62.548 * s, threshold);
			_vr.bezier8(x +   29.687 * s,y +  -62.548 * s,x +   21.126 * s,y +  -62.548 * s,x +   16.845 * s,y +  -54.053 * s,x +   16.845 * s,y +  -37.060 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.592 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 49:
			
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   27.783 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   27.783 * s);
			_setf(o + ( 3 << 2), y +  -51.562 * s);
			_setf(o + ( 4 << 2), x +   13.233 * s);
			_setf(o + ( 5 << 2), y +  -42.822 * s);
			_setf(o + ( 6 << 2), x +   13.233 * s);
			_setf(o + ( 7 << 2), y +  -55.028 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_vr.bezier8(x +   13.233 * s,y +  -55.028 * s,x +   22.575 * s,y +  -59.553 * s,x +   29.964 * s,y +  -65.152 * s,x +   35.400 * s,y +  -71.825 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   40.478 * s);
			_setf(o + ( 1 << 2), y +  -71.825 * s);
			_setf(o + ( 2 << 2), x +   40.478 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   27.783 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   58.593 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			
			case 50:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    7.569 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    7.569 * s);
			_setf(o + ( 3 << 2), y +   -3.711 * s);
			_setf(o + ( 4 << 2), x +   30.224 * s);
			_setf(o + ( 5 << 2), y +  -37.060 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   30.224 * s,y +  -37.060 * s,x +   34.755 * s,y +  -43.729 * s,x +   37.011 * s,y +  -49.348 * s,x +   37.011 * s,y +  -53.905 * s, threshold);
			_vr.bezier8(x +   37.011 * s,y +  -53.905 * s,x +   37.011 * s,y +  -59.309 * s,x +   33.772 * s,y +  -62.011 * s,x +   27.295 * s,y +  -62.011 * s, threshold);
			_vr.bezier8(x +   27.295 * s,y +  -62.011 * s,x +   22.347 * s,y +  -62.011 * s,x +   18.359 * s,y +  -59.390 * s,x +   15.332 * s,y +  -54.150 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    6.787 * s);
			_setf(o + ( 1 << 2), y +  -60.888 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    6.787 * s,y +  -60.888 * s,x +    8.480 * s,y +  -64.306 * s,x +   11.141 * s,y +  -67.146 * s,x +   14.771 * s,y +  -69.408 * s, threshold);
			_vr.bezier8(x +   14.771 * s,y +  -69.408 * s,x +   18.400 * s,y +  -71.670 * s,x +   22.412 * s,y +  -72.802 * s,x +   26.807 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   26.807 * s,y +  -72.802 * s,x +   34.131 * s,y +  -72.802 * s,x +   39.860 * s,y +  -71.133 * s,x +   43.994 * s,y +  -67.797 * s, threshold);
			_vr.bezier8(x +   43.994 * s,y +  -67.797 * s,x +   48.128 * s,y +  -64.460 * s,x +   50.195 * s,y +  -59.830 * s,x +   50.195 * s,y +  -53.905 * s, threshold);
			_vr.bezier8(x +   50.195 * s,y +  -53.905 * s,x +   50.195 * s,y +  -48.469 * s,x +   47.552 * s,y +  -41.692 * s,x +   42.236 * s,y +  -33.593 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   27.588 * s);
			_setf(o + ( 1 << 2), y +  -11.279 * s);
			_setf(o + ( 2 << 2), x +   54.443 * s);
			_setf(o + ( 3 << 2), y +  -11.279 * s);
			_setf(o + ( 4 << 2), x +   54.443 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    7.569 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   58.593 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 1);
			
			case 51:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    6.982 * s);
			_setf(o + ( 1 << 2), y +   -6.006 * s);
			_setf(o + ( 2 << 2), x +   13.330 * s);
			_setf(o + ( 3 << 2), y +  -15.820 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   13.330 * s,y +  -15.820 * s,x +   17.106 * s,y +  -11.816 * s,x +   21.208 * s,y +   -9.814 * s,x +   25.635 * s,y +   -9.814 * s, threshold);
			_vr.bezier8(x +   25.635 * s,y +   -9.814 * s,x +   33.707 * s,y +   -9.814 * s,x +   37.744 * s,y +  -13.607 * s,x +   37.744 * s,y +  -21.191 * s, threshold);
			_vr.bezier8(x +   37.744 * s,y +  -21.191 * s,x +   37.744 * s,y +  -24.641 * s,x +   36.572 * s,y +  -27.449 * s,x +   34.228 * s,y +  -29.614 * s, threshold);
			_vr.bezier8(x +   34.228 * s,y +  -29.614 * s,x +   31.884 * s,y +  -31.778 * s,x +   28.727 * s,y +  -32.861 * s,x +   24.756 * s,y +  -32.861 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   22.510 * s);
			_setf(o + ( 1 << 2), y +  -32.861 * s);
			_setf(o + ( 2 << 2), x +   22.510 * s);
			_setf(o + ( 3 << 2), y +  -43.310 * s);
			_setf(o + ( 4 << 2), x +   24.414 * s);
			_setf(o + ( 5 << 2), y +  -43.310 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   24.414 * s,y +  -43.310 * s,x +   31.705 * s,y +  -43.310 * s,x +   35.351 * s,y +  -46.353 * s,x +   35.351 * s,y +  -52.441 * s, threshold);
			_vr.bezier8(x +   35.351 * s,y +  -52.441 * s,x +   35.351 * s,y +  -58.821 * s,x +   31.949 * s,y +  -62.011 * s,x +   25.146 * s,y +  -62.011 * s, threshold);
			_vr.bezier8(x +   25.146 * s,y +  -62.011 * s,x +   21.631 * s,y +  -62.011 * s,x +   18.213 * s,y +  -60.351 * s,x +   14.893 * s,y +  -57.030 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    8.936 * s);
			_setf(o + ( 1 << 2), y +  -65.770 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    8.936 * s,y +  -65.770 * s,x +   10.465 * s,y +  -67.658 * s,x +   12.858 * s,y +  -69.302 * s,x +   16.113 * s,y +  -70.702 * s, threshold);
			_vr.bezier8(x +   16.113 * s,y +  -70.702 * s,x +   19.368 * s,y +  -72.102 * s,x +   22.623 * s,y +  -72.802 * s,x +   25.879 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   25.879 * s,y +  -72.802 * s,x +   33.008 * s,y +  -72.802 * s,x +   38.566 * s,y +  -71.174 * s,x +   42.553 * s,y +  -67.919 * s, threshold);
			_vr.bezier8(x +   42.553 * s,y +  -67.919 * s,x +   46.541 * s,y +  -64.664 * s,x +   48.535 * s,y +  -60.107 * s,x +   48.535 * s,y +  -54.247 * s, threshold);
			_vr.bezier8(x +   48.535 * s,y +  -54.247 * s,x +   48.535 * s,y +  -47.281 * s,x +   45.540 * s,y +  -41.975 * s,x +   39.550 * s,y +  -38.329 * s, threshold);
			_vr.bezier8(x +   39.550 * s,y +  -38.329 * s,x +   47.135 * s,y +  -34.684 * s,x +   50.927 * s,y +  -28.727 * s,x +   50.927 * s,y +  -20.459 * s, threshold);
			_vr.bezier8(x +   50.927 * s,y +  -20.459 * s,x +   50.927 * s,y +  -13.655 * s,x +   48.673 * s,y +   -8.382 * s,x +   44.165 * s,y +   -4.639 * s, threshold);
			_vr.bezier8(x +   44.165 * s,y +   -4.639 * s,x +   39.656 * s,y +   -0.895 * s,x +   33.431 * s,y +    0.977 * s,x +   25.488 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   25.488 * s,y +    0.977 * s,x +   18.261 * s,y +    0.977 * s,x +   12.093 * s,y +   -1.351 * s,x +    6.982 * s,y +   -6.006 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.593 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 52:
			
			o = _posf(34);
			_setf(o + ( 0 << 2), x +   48.046 * s);
			_setf(o + ( 1 << 2), y +  -18.701 * s);
			_setf(o + ( 2 << 2), x +   48.046 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   35.839 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   35.839 * s);
			_setf(o + ( 7 << 2), y +  -18.701 * s);
			_setf(o + ( 8 << 2), x +    3.271 * s);
			_setf(o + ( 9 << 2), y +  -18.701 * s);
			_setf(o + (10 << 2), x +    3.271 * s);
			_setf(o + (11 << 2), y +  -25.976 * s);
			_setf(o + (12 << 2), x +   42.480 * s);
			_setf(o + (13 << 2), y +  -71.825 * s);
			_setf(o + (14 << 2), x +   48.046 * s);
			_setf(o + (15 << 2), y +  -71.825 * s);
			_setf(o + (16 << 2), x +   48.046 * s);
			_setf(o + (17 << 2), y +  -28.759 * s);
			_setf(o + (18 << 2), x +   55.273 * s);
			_setf(o + (19 << 2), y +  -28.759 * s);
			_setf(o + (20 << 2), x +   55.273 * s);
			_setf(o + (21 << 2), y +  -18.701 * s);
			_setf(o + (22 << 2), x +   48.046 * s);
			_setf(o + (23 << 2), y +  -18.701 * s);
			_setf(o + (24 << 2), x +   35.839 * s);
			_setf(o + (25 << 2), y +  -50.243 * s);
			_setf(o + (26 << 2), x +   17.480 * s);
			_setf(o + (27 << 2), y +  -28.759 * s);
			_setf(o + (28 << 2), x +   35.839 * s);
			_setf(o + (29 << 2), y +  -28.759 * s);
			_setf(o + (30 << 2), x +   35.839 * s);
			_setf(o + (31 << 2), y +  -50.243 * s);
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
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    8.056 * s);
			_setf(o + ( 1 << 2), y +   -5.420 * s);
			_setf(o + ( 2 << 2), x +   13.086 * s);
			_setf(o + ( 3 << 2), y +  -15.869 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   13.086 * s,y +  -15.869 * s,x +   18.261 * s,y +  -11.832 * s,x +   22.705 * s,y +   -9.814 * s,x +   26.415 * s,y +   -9.814 * s, threshold);
			_vr.bezier8(x +   26.415 * s,y +   -9.814 * s,x +   34.618 * s,y +   -9.814 * s,x +   38.720 * s,y +  -14.860 * s,x +   38.720 * s,y +  -24.951 * s, threshold);
			_vr.bezier8(x +   38.720 * s,y +  -24.951 * s,x +   38.720 * s,y +  -29.801 * s,x +   37.792 * s,y +  -33.341 * s,x +   35.937 * s,y +  -35.571 * s, threshold);
			_vr.bezier8(x +   35.937 * s,y +  -35.571 * s,x +   34.081 * s,y +  -37.801 * s,x +   30.973 * s,y +  -38.915 * s,x +   26.611 * s,y +  -38.915 * s, threshold);
			_vr.bezier8(x +   26.611 * s,y +  -38.915 * s,x +   22.672 * s,y +  -38.915 * s,x +   18.831 * s,y +  -36.979 * s,x +   15.088 * s,y +  -33.105 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   10.058 * s);
			_setf(o + ( 1 << 2), y +  -36.376 * s);
			_setf(o + ( 2 << 2), x +   10.058 * s);
			_setf(o + ( 3 << 2), y +  -71.825 * s);
			_setf(o + ( 4 << 2), x +   48.583 * s);
			_setf(o + ( 5 << 2), y +  -71.825 * s);
			_setf(o + ( 6 << 2), x +   48.583 * s);
			_setf(o + ( 7 << 2), y +  -61.034 * s);
			_setf(o + ( 8 << 2), x +   22.265 * s);
			_setf(o + ( 9 << 2), y +  -61.034 * s);
			_setf(o + (10 << 2), x +   22.265 * s);
			_setf(o + (11 << 2), y +  -48.241 * s);
			o = _posb(6);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_vr.bezier8(x +   22.265 * s,y +  -48.241 * s,x +   24.414 * s,y +  -49.218 * s,x +   26.985 * s,y +  -49.706 * s,x +   29.980 * s,y +  -49.706 * s, threshold);
			_vr.bezier8(x +   29.980 * s,y +  -49.706 * s,x +   37.011 * s,y +  -49.706 * s,x +   42.423 * s,y +  -47.672 * s,x +   46.215 * s,y +  -43.603 * s, threshold);
			_vr.bezier8(x +   46.215 * s,y +  -43.603 * s,x +   50.007 * s,y +  -39.534 * s,x +   51.903 * s,y +  -33.772 * s,x +   51.903 * s,y +  -26.318 * s, threshold);
			_vr.bezier8(x +   51.903 * s,y +  -26.318 * s,x +   51.903 * s,y +   -8.121 * s,x +   43.424 * s,y +    0.977 * s,x +   26.464 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   26.464 * s,y +    0.977 * s,x +   19.433 * s,y +    0.977 * s,x +   13.297 * s,y +   -1.156 * s,x +    8.056 * s,y +   -5.420 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.593 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 54:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   37.109 * s);
			_setf(o + ( 1 << 2), y +  -72.948 * s);
			_setf(o + ( 2 << 2), x +   43.847 * s);
			_setf(o + ( 3 << 2), y +  -65.819 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   43.847 * s,y +  -65.819 * s,x +   38.997 * s,y +  -63.280 * s,x +   34.586 * s,y +  -59.944 * s,x +   30.615 * s,y +  -55.810 * s, threshold);
			_vr.bezier8(x +   30.615 * s,y +  -55.810 * s,x +   26.643 * s,y +  -51.676 * s,x +   23.909 * s,y +  -47.590 * s,x +   22.412 * s,y +  -43.554 * s, threshold);
			_vr.bezier8(x +   22.412 * s,y +  -43.554 * s,x +   25.797 * s,y +  -45.084 * s,x +   28.727 * s,y +  -45.849 * s,x +   31.201 * s,y +  -45.849 * s, threshold);
			_vr.bezier8(x +   31.201 * s,y +  -45.849 * s,x +   37.939 * s,y +  -45.849 * s,x +   43.351 * s,y +  -43.757 * s,x +   47.436 * s,y +  -39.575 * s, threshold);
			_vr.bezier8(x +   47.436 * s,y +  -39.575 * s,x +   51.521 * s,y +  -35.392 * s,x +   53.564 * s,y +  -29.736 * s,x +   53.564 * s,y +  -22.607 * s, threshold);
			_vr.bezier8(x +   53.564 * s,y +  -22.607 * s,x +   53.564 * s,y +  -15.576 * s,x +   51.472 * s,y +   -9.888 * s,x +   47.289 * s,y +   -5.542 * s, threshold);
			_vr.bezier8(x +   47.289 * s,y +   -5.542 * s,x +   43.106 * s,y +   -1.196 * s,x +   37.825 * s,y +    0.977 * s,x +   31.445 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   31.445 * s,y +    0.977 * s,x +   14.779 * s,y +    0.977 * s,x +    6.445 * s,y +   -9.423 * s,x +    6.445 * s,y +  -30.224 * s, threshold);
			_vr.bezier8(x +    6.445 * s,y +  -30.224 * s,x +    6.445 * s,y +  -38.948 * s,x +    9.660 * s,y +  -47.778 * s,x +   16.089 * s,y +  -56.713 * s, threshold);
			_vr.bezier8(x +   16.089 * s,y +  -56.713 * s,x +   22.517 * s,y +  -65.648 * s,x +   29.524 * s,y +  -71.060 * s,x +   37.109 * s,y +  -72.948 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   19.629 * s);
			_setf(o + ( 1 << 2), y +  -22.851 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   19.629 * s,y +  -22.851 * s,x +   19.629 * s,y +  -14.160 * s,x +   23.323 * s,y +   -9.814 * s,x +   30.712 * s,y +   -9.814 * s, threshold);
			_vr.bezier8(x +   30.712 * s,y +   -9.814 * s,x +   33.740 * s,y +   -9.814 * s,x +   36.149 * s,y +  -10.897 * s,x +   37.939 * s,y +  -13.061 * s, threshold);
			_vr.bezier8(x +   37.939 * s,y +  -13.061 * s,x +   39.729 * s,y +  -15.226 * s,x +   40.624 * s,y +  -18.245 * s,x +   40.624 * s,y +  -22.119 * s, threshold);
			_vr.bezier8(x +   40.624 * s,y +  -22.119 * s,x +   40.624 * s,y +  -26.090 * s,x +   39.688 * s,y +  -29.239 * s,x +   37.817 * s,y +  -31.567 * s, threshold);
			_vr.bezier8(x +   37.817 * s,y +  -31.567 * s,x +   35.945 * s,y +  -33.894 * s,x +   33.528 * s,y +  -35.058 * s,x +   30.566 * s,y +  -35.058 * s, threshold);
			_vr.bezier8(x +   30.566 * s,y +  -35.058 * s,x +   23.275 * s,y +  -35.058 * s,x +   19.629 * s,y +  -30.989 * s,x +   19.629 * s,y +  -22.851 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.593 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 55:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   26.220 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   12.305 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   12.305 * s,y +       0. * s,x +   17.610 * s,y +  -16.341 * s,x +   26.725 * s,y +  -36.376 * s,x +   39.648 * s,y +  -60.106 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +    6.885 * s);
			_setf(o + ( 1 << 2), y +  -60.106 * s);
			_setf(o + ( 2 << 2), x +    6.885 * s);
			_setf(o + ( 3 << 2), y +  -71.825 * s);
			_setf(o + ( 4 << 2), x +   56.200 * s);
			_setf(o + ( 5 << 2), y +  -71.825 * s);
			_setf(o + ( 6 << 2), x +   56.200 * s);
			_setf(o + ( 7 << 2), y +  -66.405 * s);
			_setf(o + ( 8 << 2), x +   49.755 * s);
			_setf(o + ( 9 << 2), y +  -54.247 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   49.755 * s,y +  -54.247 * s,x +   47.593 * s,y +  -50.170 * s,x +   45.409 * s,y +  -45.662 * s,x +   43.066 * s,y +  -40.795 * s, threshold);
			_vr.bezier8(x +   43.066 * s,y +  -40.795 * s,x +   40.722 * s,y +  -35.929 * s,x +   38.443 * s,y +  -30.981 * s,x +   36.230 * s,y +  -25.952 * s, threshold);
			_vr.bezier8(x +   36.230 * s,y +  -25.952 * s,x +   34.016 * s,y +  -20.923 * s,x +   32.063 * s,y +  -16.219 * s,x +   30.371 * s,y +  -11.841 * s, threshold);
			_vr.bezier8(x +   30.371 * s,y +  -11.841 * s,x +   28.678 * s,y +   -7.462 * s,x +   27.294 * s,y +   -3.516 * s,x +   26.220 * s,y +       0. * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.593 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 56:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   17.187 * s);
			_setf(o + ( 1 << 2), y +  -39.160 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   17.187 * s,y +  -39.160 * s,x +   14.583 * s,y +  -40.917 * s,x +   12.451 * s,y +  -43.245 * s,x +   10.791 * s,y +  -46.142 * s, threshold);
			_vr.bezier8(x +   10.791 * s,y +  -46.142 * s,x +    9.130 * s,y +  -49.039 * s,x +    8.300 * s,y +  -51.936 * s,x +    8.300 * s,y +  -54.833 * s, threshold);
			_vr.bezier8(x +    8.300 * s,y +  -54.833 * s,x +    8.300 * s,y +  -60.334 * s,x +   10.245 * s,y +  -64.704 * s,x +   14.135 * s,y +  -67.943 * s, threshold);
			_vr.bezier8(x +   14.135 * s,y +  -67.943 * s,x +   18.025 * s,y +  -71.182 * s,x +   23.014 * s,y +  -72.802 * s,x +   29.101 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   29.101 * s,y +  -72.802 * s,x +   35.644 * s,y +  -72.802 * s,x +   40.754 * s,y +  -71.182 * s,x +   44.433 * s,y +  -67.943 * s, threshold);
			_vr.bezier8(x +   44.433 * s,y +  -67.943 * s,x +   48.111 * s,y +  -64.704 * s,x +   49.950 * s,y +  -60.318 * s,x +   49.950 * s,y +  -54.784 * s, threshold);
			_vr.bezier8(x +   49.950 * s,y +  -54.784 * s,x +   49.950 * s,y +  -51.887 * s,x +   48.925 * s,y +  -48.819 * s,x +   46.874 * s,y +  -45.580 * s, threshold);
			_vr.bezier8(x +   46.874 * s,y +  -45.580 * s,x +   44.823 * s,y +  -42.341 * s,x +   42.577 * s,y +  -40.071 * s,x +   40.136 * s,y +  -38.769 * s, threshold);
			_vr.bezier8(x +   40.136 * s,y +  -38.769 * s,x +   43.228 * s,y +  -37.337 * s,x +   46.085 * s,y +  -34.749 * s,x +   48.705 * s,y +  -31.005 * s, threshold);
			_vr.bezier8(x +   48.705 * s,y +  -31.005 * s,x +   51.325 * s,y +  -27.262 * s,x +   52.636 * s,y +  -23.746 * s,x +   52.636 * s,y +  -20.459 * s, threshold);
			_vr.bezier8(x +   52.636 * s,y +  -20.459 * s,x +   52.636 * s,y +  -13.688 * s,x +   50.503 * s,y +   -8.423 * s,x +   46.239 * s,y +   -4.663 * s, threshold);
			_vr.bezier8(x +   46.239 * s,y +   -4.663 * s,x +   41.975 * s,y +   -0.903 * s,x +   36.181 * s,y +    0.977 * s,x +   28.857 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   28.857 * s,y +    0.977 * s,x +   21.468 * s,y +    0.977 * s,x +   15.763 * s,y +   -0.863 * s,x +   11.743 * s,y +   -4.541 * s, threshold);
			_vr.bezier8(x +   11.743 * s,y +   -4.541 * s,x +    7.723 * s,y +   -8.219 * s,x +    5.712 * s,y +  -13.525 * s,x +    5.712 * s,y +  -20.459 * s, threshold);
			_vr.bezier8(x +    5.712 * s,y +  -20.459 * s,x +    5.712 * s,y +  -24.039 * s,x +    6.779 * s,y +  -27.555 * s,x +    8.911 * s,y +  -31.005 * s, threshold);
			_vr.bezier8(x +    8.911 * s,y +  -31.005 * s,x +   11.043 * s,y +  -34.456 * s,x +   13.802 * s,y +  -37.174 * s,x +   17.187 * s,y +  -39.160 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   30.273 * s);
			_setf(o + ( 1 << 2), y +  -44.042 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   30.273 * s,y +  -44.042 * s,x +   32.096 * s,y +  -44.889 * s,x +   33.707 * s,y +  -46.459 * s,x +   35.107 * s,y +  -48.754 * s, threshold);
			_vr.bezier8(x +   35.107 * s,y +  -48.754 * s,x +   36.506 * s,y +  -51.049 * s,x +   37.206 * s,y +  -53.124 * s,x +   37.206 * s,y +  -54.980 * s, threshold);
			_vr.bezier8(x +   37.206 * s,y +  -54.980 * s,x +   37.206 * s,y +  -57.128 * s,x +   36.466 * s,y +  -58.837 * s,x +   34.985 * s,y +  -60.106 * s, threshold);
			_vr.bezier8(x +   34.985 * s,y +  -60.106 * s,x +   33.503 * s,y +  -61.376 * s,x +   31.542 * s,y +  -62.011 * s,x +   29.101 * s,y +  -62.011 * s, threshold);
			_vr.bezier8(x +   29.101 * s,y +  -62.011 * s,x +   23.697 * s,y +  -62.011 * s,x +   20.995 * s,y +  -59.651 * s,x +   20.995 * s,y +  -54.931 * s, threshold);
			_vr.bezier8(x +   20.995 * s,y +  -54.931 * s,x +   20.995 * s,y +  -52.847 * s,x +   21.988 * s,y +  -50.723 * s,x +   23.974 * s,y +  -48.559 * s, threshold);
			_vr.bezier8(x +   23.974 * s,y +  -48.559 * s,x +   25.960 * s,y +  -46.394 * s,x +   28.059 * s,y +  -44.889 * s,x +   30.273 * s,y +  -44.042 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   27.734 * s);
			_setf(o + ( 1 << 2), y +  -34.033 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   27.734 * s,y +  -34.033 * s,x +   21.516 * s,y +  -30.517 * s,x +   18.408 * s,y +  -25.992 * s,x +   18.408 * s,y +  -20.459 * s, threshold);
			_vr.bezier8(x +   18.408 * s,y +  -20.459 * s,x +   18.408 * s,y +  -17.399 * s,x +   19.376 * s,y +  -14.860 * s,x +   21.313 * s,y +  -12.842 * s, threshold);
			_vr.bezier8(x +   21.313 * s,y +  -12.842 * s,x +   23.250 * s,y +  -10.823 * s,x +   25.764 * s,y +   -9.814 * s,x +   28.857 * s,y +   -9.814 * s, threshold);
			_vr.bezier8(x +   28.857 * s,y +   -9.814 * s,x +   32.112 * s,y +   -9.814 * s,x +   34.773 * s,y +  -10.701 * s,x +   36.840 * s,y +  -12.475 * s, threshold);
			_vr.bezier8(x +   36.840 * s,y +  -12.475 * s,x +   38.907 * s,y +  -14.249 * s,x +   39.940 * s,y +  -16.585 * s,x +   39.940 * s,y +  -19.482 * s, threshold);
			_vr.bezier8(x +   39.940 * s,y +  -19.482 * s,x +   39.940 * s,y +  -24.430 * s,x +   35.872 * s,y +  -29.280 * s,x +   27.734 * s,y +  -34.033 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.593 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 57:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   22.118 * s);
			_setf(o + ( 1 << 2), y +    1.367 * s);
			_setf(o + ( 2 << 2), x +   15.380 * s);
			_setf(o + ( 3 << 2), y +   -5.762 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   15.380 * s,y +   -5.762 * s,x +   25.276 * s,y +  -11.230 * s,x +   32.274 * s,y +  -18.375 * s,x +   36.376 * s,y +  -27.197 * s, threshold);
			_vr.bezier8(x +   36.376 * s,y +  -27.197 * s,x +   34.195 * s,y +  -26.220 * s,x +   31.412 * s,y +  -25.732 * s,x +   28.026 * s,y +  -25.732 * s, threshold);
			_vr.bezier8(x +   28.026 * s,y +  -25.732 * s,x +   21.321 * s,y +  -25.732 * s,x +   15.917 * s,y +  -27.815 * s,x +   11.816 * s,y +  -31.982 * s, threshold);
			_vr.bezier8(x +   11.816 * s,y +  -31.982 * s,x +    7.714 * s,y +  -36.149 * s,x +    5.664 * s,y +  -41.813 * s,x +    5.664 * s,y +  -48.974 * s, threshold);
			_vr.bezier8(x +    5.664 * s,y +  -48.974 * s,x +    5.664 * s,y +  -56.070 * s,x +    7.763 * s,y +  -61.815 * s,x +   11.962 * s,y +  -66.210 * s, threshold);
			_vr.bezier8(x +   11.962 * s,y +  -66.210 * s,x +   16.161 * s,y +  -70.604 * s,x +   21.434 * s,y +  -72.802 * s,x +   27.782 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   27.782 * s,y +  -72.802 * s,x +   44.449 * s,y +  -72.802 * s,x +   52.782 * s,y +  -62.319 * s,x +   52.782 * s,y +  -41.357 * s, threshold);
			_vr.bezier8(x +   52.782 * s,y +  -41.357 * s,x +   52.782 * s,y +  -32.633 * s,x +   49.567 * s,y +  -23.803 * s,x +   43.139 * s,y +  -14.868 * s, threshold);
			_vr.bezier8(x +   43.139 * s,y +  -14.868 * s,x +   36.710 * s,y +   -5.933 * s,x +   29.703 * s,y +   -0.521 * s,x +   22.118 * s,y +    1.367 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   18.603 * s);
			_setf(o + ( 1 << 2), y +  -49.462 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   18.603 * s,y +  -49.462 * s,x +   18.603 * s,y +  -45.458 * s,x +   19.547 * s,y +  -42.301 * s,x +   21.435 * s,y +  -39.990 * s, threshold);
			_vr.bezier8(x +   21.435 * s,y +  -39.990 * s,x +   23.323 * s,y +  -37.678 * s,x +   25.731 * s,y +  -36.523 * s,x +   28.661 * s,y +  -36.523 * s, threshold);
			_vr.bezier8(x +   28.661 * s,y +  -36.523 * s,x +   35.953 * s,y +  -36.523 * s,x +   39.599 * s,y +  -40.592 * s,x +   39.599 * s,y +  -48.730 * s, threshold);
			_vr.bezier8(x +   39.599 * s,y +  -48.730 * s,x +   39.599 * s,y +  -57.583 * s,x +   35.904 * s,y +  -62.011 * s,x +   28.515 * s,y +  -62.011 * s, threshold);
			_vr.bezier8(x +   28.515 * s,y +  -62.011 * s,x +   25.487 * s,y +  -62.011 * s,x +   23.079 * s,y +  -60.896 * s,x +   21.288 * s,y +  -58.666 * s, threshold);
			_vr.bezier8(x +   21.288 * s,y +  -58.666 * s,x +   19.498 * s,y +  -56.436 * s,x +   18.603 * s,y +  -53.368 * s,x +   18.603 * s,y +  -49.462 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.592 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 58:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    8.496 * s);
			_setf(o + ( 1 << 2), y +  -45.947 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +    8.496 * s,y +  -45.947 * s,x +    8.496 * s,y +  -48.388 * s,x +    9.351 * s,y +  -50.463 * s,x +   11.060 * s,y +  -52.172 * s, threshold);
			_vr.bezier8(x +   11.060 * s,y +  -52.172 * s,x +   12.769 * s,y +  -53.881 * s,x +   14.844 * s,y +  -54.735 * s,x +   17.285 * s,y +  -54.735 * s, threshold);
			_vr.bezier8(x +   17.285 * s,y +  -54.735 * s,x +   19.727 * s,y +  -54.735 * s,x +   21.802 * s,y +  -53.881 * s,x +   23.511 * s,y +  -52.172 * s, threshold);
			_vr.bezier8(x +   23.511 * s,y +  -52.172 * s,x +   25.220 * s,y +  -50.463 * s,x +   26.074 * s,y +  -48.388 * s,x +   26.074 * s,y +  -45.947 * s, threshold);
			_vr.bezier8(x +   26.074 * s,y +  -45.947 * s,x +   26.074 * s,y +  -43.505 * s,x +   25.220 * s,y +  -41.422 * s,x +   23.511 * s,y +  -39.697 * s, threshold);
			_vr.bezier8(x +   23.511 * s,y +  -39.697 * s,x +   21.802 * s,y +  -37.971 * s,x +   19.727 * s,y +  -37.109 * s,x +   17.285 * s,y +  -37.109 * s, threshold);
			_vr.bezier8(x +   17.285 * s,y +  -37.109 * s,x +   14.844 * s,y +  -37.109 * s,x +   12.769 * s,y +  -37.971 * s,x +   11.060 * s,y +  -39.697 * s, threshold);
			_vr.bezier8(x +   11.060 * s,y +  -39.697 * s,x +    9.351 * s,y +  -41.422 * s,x +    8.496 * s,y +  -43.505 * s,x +    8.496 * s,y +  -45.947 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    8.496 * s);
			_setf(o + ( 1 << 2), y +   -6.396 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +    8.496 * s,y +   -6.396 * s,x +    8.496 * s,y +   -8.838 * s,x +    9.351 * s,y +  -10.913 * s,x +   11.060 * s,y +  -12.622 * s, threshold);
			_vr.bezier8(x +   11.060 * s,y +  -12.622 * s,x +   12.769 * s,y +  -14.331 * s,x +   14.844 * s,y +  -15.185 * s,x +   17.285 * s,y +  -15.185 * s, threshold);
			_vr.bezier8(x +   17.285 * s,y +  -15.185 * s,x +   19.727 * s,y +  -15.185 * s,x +   21.802 * s,y +  -14.331 * s,x +   23.511 * s,y +  -12.622 * s, threshold);
			_vr.bezier8(x +   23.511 * s,y +  -12.622 * s,x +   25.220 * s,y +  -10.913 * s,x +   26.074 * s,y +   -8.838 * s,x +   26.074 * s,y +   -6.396 * s, threshold);
			_vr.bezier8(x +   26.074 * s,y +   -6.396 * s,x +   26.074 * s,y +   -3.955 * s,x +   25.220 * s,y +   -1.872 * s,x +   23.511 * s,y +   -0.146 * s, threshold);
			_vr.bezier8(x +   23.511 * s,y +   -0.146 * s,x +   21.802 * s,y +    1.579 * s,x +   19.727 * s,y +    2.441 * s,x +   17.285 * s,y +    2.441 * s, threshold);
			_vr.bezier8(x +   17.285 * s,y +    2.441 * s,x +   14.844 * s,y +    2.441 * s,x +   12.769 * s,y +    1.579 * s,x +   11.060 * s,y +   -0.146 * s, threshold);
			_vr.bezier8(x +   11.060 * s,y +   -0.146 * s,x +    9.351 * s,y +   -1.872 * s,x +    8.496 * s,y +   -3.955 * s,x +    8.496 * s,y +   -6.396 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.719 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 59:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    8.496 * s);
			_setf(o + ( 1 << 2), y +  -45.947 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +    8.496 * s,y +  -45.947 * s,x +    8.496 * s,y +  -48.388 * s,x +    9.350 * s,y +  -50.463 * s,x +   11.059 * s,y +  -52.172 * s, threshold);
			_vr.bezier8(x +   11.059 * s,y +  -52.172 * s,x +   12.768 * s,y +  -53.881 * s,x +   14.843 * s,y +  -54.735 * s,x +   17.284 * s,y +  -54.735 * s, threshold);
			_vr.bezier8(x +   17.284 * s,y +  -54.735 * s,x +   19.726 * s,y +  -54.735 * s,x +   21.801 * s,y +  -53.881 * s,x +   23.510 * s,y +  -52.172 * s, threshold);
			_vr.bezier8(x +   23.510 * s,y +  -52.172 * s,x +   25.219 * s,y +  -50.463 * s,x +   26.073 * s,y +  -48.388 * s,x +   26.073 * s,y +  -45.947 * s, threshold);
			_vr.bezier8(x +   26.073 * s,y +  -45.947 * s,x +   26.073 * s,y +  -43.505 * s,x +   25.219 * s,y +  -41.422 * s,x +   23.510 * s,y +  -39.697 * s, threshold);
			_vr.bezier8(x +   23.510 * s,y +  -39.697 * s,x +   21.801 * s,y +  -37.971 * s,x +   19.726 * s,y +  -37.109 * s,x +   17.284 * s,y +  -37.109 * s, threshold);
			_vr.bezier8(x +   17.284 * s,y +  -37.109 * s,x +   14.843 * s,y +  -37.109 * s,x +   12.768 * s,y +  -37.971 * s,x +   11.059 * s,y +  -39.697 * s, threshold);
			_vr.bezier8(x +   11.059 * s,y +  -39.697 * s,x +    9.350 * s,y +  -41.422 * s,x +    8.496 * s,y +  -43.505 * s,x +    8.496 * s,y +  -45.947 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   10.595 * s);
			_setf(o + ( 1 << 2), y +   18.261 * s);
			_setf(o + ( 2 << 2), x +    6.445 * s);
			_setf(o + ( 3 << 2), y +   12.939 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    6.445 * s,y +   12.939 * s,x +   12.402 * s,y +    8.480 * s,x +   15.380 * s,y +    4.980 * s,x +   15.380 * s,y +    2.441 * s, threshold);
			_vr.bezier8(x +   15.380 * s,y +    2.441 * s,x +   15.380 * s,y +    1.465 * s,x +   15.038 * s,y +    0.505 * s,x +   14.355 * s,y +   -0.439 * s, threshold);
			_vr.bezier8(x +   14.355 * s,y +   -0.439 * s,x +   11.262 * s,y +   -1.937 * s,x +    9.716 * s,y +   -4.036 * s,x +    9.716 * s,y +   -6.738 * s, threshold);
			_vr.bezier8(x +    9.716 * s,y +   -6.738 * s,x +    9.716 * s,y +   -8.691 * s,x +   10.530 * s,y +  -10.311 * s,x +   12.158 * s,y +  -11.596 * s, threshold);
			_vr.bezier8(x +   12.158 * s,y +  -11.596 * s,x +   13.785 * s,y +  -12.882 * s,x +   15.803 * s,y +  -13.525 * s,x +   18.212 * s,y +  -13.525 * s, threshold);
			_vr.bezier8(x +   18.212 * s,y +  -13.525 * s,x +   20.458 * s,y +  -13.525 * s,x +   22.419 * s,y +  -12.671 * s,x +   24.096 * s,y +  -10.962 * s, threshold);
			_vr.bezier8(x +   24.096 * s,y +  -10.962 * s,x +   25.772 * s,y +   -9.253 * s,x +   26.611 * s,y +   -7.275 * s,x +   26.611 * s,y +   -5.029 * s, threshold);
			_vr.bezier8(x +   26.611 * s,y +   -5.029 * s,x +   26.611 * s,y +   -0.895 * s,x +   25.642 * s,y +    2.873 * s,x +   23.705 * s,y +    6.274 * s, threshold);
			_vr.bezier8(x +   23.705 * s,y +    6.274 * s,x +   21.768 * s,y +    9.676 * s,x +   17.398 * s,y +   13.672 * s,x +   10.595 * s,y +   18.261 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.718 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 60:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +    9.375 * s);
			_setf(o + ( 1 << 2), y +  -27.197 * s);
			_setf(o + ( 2 << 2), x +    9.375 * s);
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
			_setf(o + (14 << 2), x +    9.375 * s);
			_setf(o + (15 << 2), y +  -27.197 * s);
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
			
			case 61:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +    8.740 * s);
			_setf(o + ( 1 << 2), y +  -36.376 * s);
			_setf(o + ( 2 << 2), x +    8.740 * s);
			_setf(o + ( 3 << 2), y +  -46.191 * s);
			_setf(o + ( 4 << 2), x +   52.587 * s);
			_setf(o + ( 5 << 2), y +  -46.191 * s);
			_setf(o + ( 6 << 2), x +   52.587 * s);
			_setf(o + ( 7 << 2), y +  -36.376 * s);
			_setf(o + ( 8 << 2), x +    8.740 * s);
			_setf(o + ( 9 << 2), y +  -36.376 * s);
			_setf(o + (10 << 2), x +    8.740 * s);
			_setf(o + (11 << 2), y +  -15.869 * s);
			_setf(o + (12 << 2), x +    8.740 * s);
			_setf(o + (13 << 2), y +  -25.683 * s);
			_setf(o + (14 << 2), x +   52.587 * s);
			_setf(o + (15 << 2), y +  -25.683 * s);
			_setf(o + (16 << 2), x +   52.587 * s);
			_setf(o + (17 << 2), y +  -15.869 * s);
			_setf(o + (18 << 2), x +    8.740 * s);
			_setf(o + (19 << 2), y +  -15.869 * s);
			_setf(o + (20 << 2), x +   58.592 * s);
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
			_setf(o + ( 0 << 2), x +   12.940 * s);
			_setf(o + ( 1 << 2), y +   -8.301 * s);
			_setf(o + ( 2 << 2), x +   12.940 * s);
			_setf(o + ( 3 << 2), y +  -19.433 * s);
			_setf(o + ( 4 << 2), x +   38.672 * s);
			_setf(o + ( 5 << 2), y +  -31.103 * s);
			_setf(o + ( 6 << 2), x +   12.940 * s);
			_setf(o + ( 7 << 2), y +  -42.626 * s);
			_setf(o + ( 8 << 2), x +   12.940 * s);
			_setf(o + ( 9 << 2), y +  -53.759 * s);
			_setf(o + (10 << 2), x +   51.953 * s);
			_setf(o + (11 << 2), y +  -35.058 * s);
			_setf(o + (12 << 2), x +   51.953 * s);
			_setf(o + (13 << 2), y +  -27.197 * s);
			_setf(o + (14 << 2), x +   12.940 * s);
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
			_setf(o + ( 0 << 2), x +   24.268 * s);
			_setf(o + ( 1 << 2), y +  -21.679 * s);
			_setf(o + ( 2 << 2), x +   14.941 * s);
			_setf(o + ( 3 << 2), y +  -21.679 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   14.941 * s,y +  -21.679 * s,x +   14.876 * s,y +  -21.907 * s,x +   14.575 * s,y +  -22.737 * s,x +   14.038 * s,y +  -24.170 * s, threshold);
			_vr.bezier8(x +   14.038 * s,y +  -24.170 * s,x +   13.501 * s,y +  -25.602 * s,x +   13.233 * s,y +  -26.855 * s,x +   13.233 * s,y +  -27.929 * s, threshold);
			_vr.bezier8(x +   13.233 * s,y +  -27.929 * s,x +   13.233 * s,y +  -29.980 * s,x +   13.517 * s,y +  -31.949 * s,x +   14.087 * s,y +  -33.837 * s, threshold);
			_vr.bezier8(x +   14.087 * s,y +  -33.837 * s,x +   14.657 * s,y +  -35.725 * s,x +   15.495 * s,y +  -37.491 * s,x +   16.602 * s,y +  -39.135 * s, threshold);
			_vr.bezier8(x +   16.602 * s,y +  -39.135 * s,x +   17.708 * s,y +  -40.779 * s,x +   19.897 * s,y +  -43.408 * s,x +   23.169 * s,y +  -47.021 * s, threshold);
			_vr.bezier8(x +   23.169 * s,y +  -47.021 * s,x +   26.440 * s,y +  -50.634 * s,x +   28.076 * s,y +  -53.612 * s,x +   28.076 * s,y +  -55.956 * s, threshold);
			_vr.bezier8(x +   28.076 * s,y +  -55.956 * s,x +   28.076 * s,y +  -60.513 * s,x +   25.098 * s,y +  -62.792 * s,x +   19.141 * s,y +  -62.792 * s, threshold);
			_vr.bezier8(x +   19.141 * s,y +  -62.792 * s,x +   16.244 * s,y +  -62.792 * s,x +   13.216 * s,y +  -61.343 * s,x +   10.059 * s,y +  -58.446 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    5.030 * s);
			_setf(o + ( 1 << 2), y +  -67.870 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    5.030 * s,y +  -67.870 * s,x +    9.229 * s,y +  -71.158 * s,x +   14.746 * s,y +  -72.802 * s,x +   21.582 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   21.582 * s,y +  -72.802 * s,x +   26.855 * s,y +  -72.802 * s,x +   31.258 * s,y +  -71.337 * s,x +   34.790 * s,y +  -68.407 * s, threshold);
			_vr.bezier8(x +   34.790 * s,y +  -68.407 * s,x +   38.322 * s,y +  -65.478 * s,x +   40.088 * s,y +  -61.587 * s,x +   40.088 * s,y +  -56.737 * s, threshold);
			_vr.bezier8(x +   40.088 * s,y +  -56.737 * s,x +   40.088 * s,y +  -53.417 * s,x +   39.445 * s,y +  -50.610 * s,x +   38.159 * s,y +  -48.315 * s, threshold);
			_vr.bezier8(x +   38.159 * s,y +  -48.315 * s,x +   36.873 * s,y +  -46.020 * s,x +   34.611 * s,y +  -43.326 * s,x +   31.372 * s,y +  -40.234 * s, threshold);
			_vr.bezier8(x +   31.372 * s,y +  -40.234 * s,x +   28.133 * s,y +  -37.141 * s,x +   26.025 * s,y +  -34.570 * s,x +   25.049 * s,y +  -32.519 * s, threshold);
			_vr.bezier8(x +   25.049 * s,y +  -32.519 * s,x +   24.072 * s,y +  -30.468 * s,x +   23.584 * s,y +  -28.222 * s,x +   23.584 * s,y +  -25.781 * s, threshold);
			_vr.bezier8(x +   23.584 * s,y +  -25.781 * s,x +   23.584 * s,y +  -25.260 * s,x +   23.812 * s,y +  -23.893 * s,x +   24.268 * s,y +  -21.679 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   20.117 * s);
			_setf(o + ( 1 << 2), y +  -15.039 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   20.117 * s,y +  -15.039 * s,x +   22.331 * s,y +  -15.039 * s,x +   24.211 * s,y +  -14.258 * s,x +   25.757 * s,y +  -12.695 * s, threshold);
			_vr.bezier8(x +   25.757 * s,y +  -12.695 * s,x +   27.303 * s,y +  -11.133 * s,x +   28.076 * s,y +   -9.245 * s,x +   28.076 * s,y +   -7.031 * s, threshold);
			_vr.bezier8(x +   28.076 * s,y +   -7.031 * s,x +   28.076 * s,y +   -4.818 * s,x +   27.303 * s,y +   -2.930 * s,x +   25.757 * s,y +   -1.367 * s, threshold);
			_vr.bezier8(x +   25.757 * s,y +   -1.367 * s,x +   24.211 * s,y +    0.195 * s,x +   22.331 * s,y +    0.977 * s,x +   20.117 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   20.117 * s,y +    0.977 * s,x +   17.904 * s,y +    0.977 * s,x +   16.016 * s,y +    0.195 * s,x +   14.453 * s,y +   -1.367 * s, threshold);
			_vr.bezier8(x +   14.453 * s,y +   -1.367 * s,x +   12.891 * s,y +   -2.930 * s,x +   12.109 * s,y +   -4.818 * s,x +   12.109 * s,y +   -7.031 * s, threshold);
			_vr.bezier8(x +   12.109 * s,y +   -7.031 * s,x +   12.109 * s,y +   -9.245 * s,x +   12.891 * s,y +  -11.133 * s,x +   14.453 * s,y +  -12.695 * s, threshold);
			_vr.bezier8(x +   14.453 * s,y +  -12.695 * s,x +   16.016 * s,y +  -14.258 * s,x +   17.904 * s,y +  -15.039 * s,x +   20.117 * s,y +  -15.039 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   43.798 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 64:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   45.019 * s);
			_setf(o + ( 1 << 2), y +  -14.502 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   45.019 * s,y +  -14.502 * s,x +   42.219 * s,y +  -12.353 * s,x +   38.948 * s,y +  -11.279 * s,x +   35.204 * s,y +  -11.279 * s, threshold);
			_vr.bezier8(x +   35.204 * s,y +  -11.279 * s,x +   31.396 * s,y +  -11.279 * s,x +   28.255 * s,y +  -12.313 * s,x +   25.781 * s,y +  -14.380 * s, threshold);
			_vr.bezier8(x +   25.781 * s,y +  -14.380 * s,x +   23.307 * s,y +  -16.447 * s,x +   22.070 * s,y +  -19.254 * s,x +   22.070 * s,y +  -22.802 * s, threshold);
			_vr.bezier8(x +   22.070 * s,y +  -22.802 * s,x +   22.070 * s,y +  -31.006 * s,x +   28.515 * s,y +  -35.335 * s,x +   41.406 * s,y +  -35.790 * s, threshold);
			_vr.bezier8(x +   41.406 * s,y +  -35.790 * s,x +   40.787 * s,y +  -38.850 * s,x +   39.420 * s,y +  -40.380 * s,x +   37.304 * s,y +  -40.380 * s, threshold);
			_vr.bezier8(x +   37.304 * s,y +  -40.380 * s,x +   34.244 * s,y +  -40.380 * s,x +   31.103 * s,y +  -39.453 * s,x +   27.880 * s,y +  -37.597 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   25.000 * s);
			_setf(o + ( 1 << 2), y +  -44.238 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   25.000 * s,y +  -44.238 * s,x +   28.580 * s,y +  -46.809 * s,x +   32.454 * s,y +  -48.095 * s,x +   36.621 * s,y +  -48.095 * s, threshold);
			_vr.bezier8(x +   36.621 * s,y +  -48.095 * s,x +   46.646 * s,y +  -48.095 * s,x +   51.659 * s,y +  -42.642 * s,x +   51.659 * s,y +  -31.738 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   51.659 * s);
			_setf(o + ( 1 << 2), y +  -21.240 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   51.659 * s,y +  -21.240 * s,x +   53.515 * s,y +  -20.035 * s,x +   55.012 * s,y +  -19.433 * s,x +   56.151 * s,y +  -19.433 * s, threshold);
			_vr.bezier8(x +   56.151 * s,y +  -19.433 * s,x +   61.230 * s,y +  -19.433 * s,x +   63.769 * s,y +  -23.714 * s,x +   63.769 * s,y +  -32.275 * s, threshold);
			_vr.bezier8(x +   63.769 * s,y +  -32.275 * s,x +   63.769 * s,y +  -39.697 * s,x +   61.612 * s,y +  -45.532 * s,x +   57.299 * s,y +  -49.780 * s, threshold);
			_vr.bezier8(x +   57.299 * s,y +  -49.780 * s,x +   52.986 * s,y +  -54.027 * s,x +   46.988 * s,y +  -56.151 * s,x +   39.306 * s,y +  -56.151 * s, threshold);
			_vr.bezier8(x +   39.306 * s,y +  -56.151 * s,x +   31.493 * s,y +  -56.151 * s,x +   25.203 * s,y +  -53.555 * s,x +   20.434 * s,y +  -48.364 * s, threshold);
			_vr.bezier8(x +   20.434 * s,y +  -48.364 * s,x +   15.665 * s,y +  -43.172 * s,x +   13.281 * s,y +  -36.523 * s,x +   13.281 * s,y +  -28.418 * s, threshold);
			_vr.bezier8(x +   13.281 * s,y +  -28.418 * s,x +   13.281 * s,y +  -20.443 * s,x +   15.633 * s,y +  -14.046 * s,x +   20.337 * s,y +   -9.228 * s, threshold);
			_vr.bezier8(x +   20.337 * s,y +   -9.228 * s,x +   25.040 * s,y +   -4.411 * s,x +   31.363 * s,y +   -2.002 * s,x +   39.306 * s,y +   -2.002 * s, threshold);
			_vr.bezier8(x +   39.306 * s,y +   -2.002 * s,x +   43.505 * s,y +   -2.002 * s,x +   46.890 * s,y +   -2.482 * s,x +   49.462 * s,y +   -3.442 * s, threshold);
			_vr.bezier8(x +   49.462 * s,y +   -3.442 * s,x +   52.034 * s,y +   -4.403 * s,x +   54.605 * s,y +   -6.022 * s,x +   57.177 * s,y +   -8.301 * s, threshold);
			_vr.bezier8(x +   57.177 * s,y +   -8.301 * s,x +   57.209 * s,y +   -8.268 * s,x +   57.226 * s,y +   -7.829 * s,x +   57.226 * s,y +   -6.982 * s, threshold);
			_vr.bezier8(x +   57.226 * s,y +   -6.982 * s,x +   57.226 * s,y +   -6.103 * s,x +   57.177 * s,y +   -4.834 * s,x +   57.177 * s,y +   -3.174 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   57.177 * s);
			_setf(o + ( 1 << 2), y +    1.758 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   57.177 * s,y +    1.758 * s,x +   51.578 * s,y +    4.948 * s,x +   45.621 * s,y +    6.543 * s,x +   39.306 * s,y +    6.543 * s, threshold);
			_vr.bezier8(x +   39.306 * s,y +    6.543 * s,x +   28.466 * s,y +    6.543 * s,x +   19.775 * s,y +    3.320 * s,x +   13.232 * s,y +   -3.125 * s, threshold);
			_vr.bezier8(x +   13.232 * s,y +   -3.125 * s,x +    6.689 * s,y +   -9.570 * s,x +    3.418 * s,y +  -18.001 * s,x +    3.418 * s,y +  -28.418 * s, threshold);
			_vr.bezier8(x +    3.418 * s,y +  -28.418 * s,x +    3.418 * s,y +  -38.996 * s,x +    6.730 * s,y +  -47.688 * s,x +   13.354 * s,y +  -54.491 * s, threshold);
			_vr.bezier8(x +   13.354 * s,y +  -54.491 * s,x +   19.978 * s,y +  -61.295 * s,x +   28.629 * s,y +  -64.696 * s,x +   39.306 * s,y +  -64.696 * s, threshold);
			_vr.bezier8(x +   39.306 * s,y +  -64.696 * s,x +   50.276 * s,y +  -64.696 * s,x +   58.739 * s,y +  -61.864 * s,x +   64.696 * s,y +  -56.200 * s, threshold);
			_vr.bezier8(x +   64.696 * s,y +  -56.200 * s,x +   70.653 * s,y +  -50.536 * s,x +   73.632 * s,y +  -42.512 * s,x +   73.632 * s,y +  -32.128 * s, threshold);
			_vr.bezier8(x +   73.632 * s,y +  -32.128 * s,x +   73.632 * s,y +  -26.464 * s,x +   72.053 * s,y +  -21.639 * s,x +   68.895 * s,y +  -17.651 * s, threshold);
			_vr.bezier8(x +   68.895 * s,y +  -17.651 * s,x +   65.738 * s,y +  -13.664 * s,x +   61.523 * s,y +  -11.670 * s,x +   56.249 * s,y +  -11.670 * s, threshold);
			_vr.bezier8(x +   56.249 * s,y +  -11.670 * s,x +   51.431 * s,y +  -11.670 * s,x +   47.688 * s,y +  -12.614 * s,x +   45.019 * s,y +  -14.502 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   41.601 * s);
			_setf(o + ( 1 << 2), y +  -29.150 * s);
			_setf(o + ( 2 << 2), x +   40.575 * s);
			_setf(o + ( 3 << 2), y +  -29.150 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   40.575 * s,y +  -29.150 * s,x +   35.204 * s,y +  -29.150 * s,x +   32.519 * s,y +  -27.116 * s,x +   32.519 * s,y +  -23.047 * s, threshold);
			_vr.bezier8(x +   32.519 * s,y +  -23.047 * s,x +   32.519 * s,y +  -21.777 * s,x +   32.991 * s,y +  -20.727 * s,x +   33.935 * s,y +  -19.897 * s, threshold);
			_vr.bezier8(x +   33.935 * s,y +  -19.897 * s,x +   34.879 * s,y +  -19.067 * s,x +   36.083 * s,y +  -18.652 * s,x +   37.548 * s,y +  -18.652 * s, threshold);
			_vr.bezier8(x +   37.548 * s,y +  -18.652 * s,x +   39.111 * s,y +  -18.652 * s,x +   40.462 * s,y +  -19.157 * s,x +   41.601 * s,y +  -20.166 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   41.601 * s);
			_setf(o + ( 1 << 2), y +  -29.150 * s);
			_setf(o + ( 2 << 2), x +   77.050 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 65:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   49.071 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   43.847 * s);
			_setf(o + ( 3 << 2), y +  -14.502 * s);
			_setf(o + ( 4 << 2), x +   19.335 * s);
			_setf(o + ( 5 << 2), y +  -14.502 * s);
			_setf(o + ( 6 << 2), x +   14.355 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    0.244 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   28.759 * s);
			_setf(o + (11 << 2), y +  -72.509 * s);
			_setf(o + (12 << 2), x +   34.325 * s);
			_setf(o + (13 << 2), y +  -72.509 * s);
			_setf(o + (14 << 2), x +   63.085 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   49.071 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   31.542 * s);
			_setf(o + (19 << 2), y +  -50.634 * s);
			_setf(o + (20 << 2), x +   22.948 * s);
			_setf(o + (21 << 2), y +  -24.218 * s);
			_setf(o + (22 << 2), x +   40.136 * s);
			_setf(o + (23 << 2), y +  -24.218 * s);
			_setf(o + (24 << 2), x +   31.542 * s);
			_setf(o + (25 << 2), y +  -50.634 * s);
			_setf(o + (26 << 2), x +   63.329 * s);
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
			_setf(o + ( 0 << 2), x +   29.198 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    7.324 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    7.324 * s);
			_setf(o + ( 5 << 2), y +  -71.483 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +    7.324 * s,y +  -71.483 * s,x +   16.959 * s,y +  -71.939 * s,x +   23.713 * s,y +  -72.167 * s,x +   27.587 * s,y +  -72.167 * s, threshold);
			_vr.bezier8(x +   27.587 * s,y +  -72.167 * s,x +   35.009 * s,y +  -72.167 * s,x +   40.811 * s,y +  -70.580 * s,x +   44.994 * s,y +  -67.406 * s, threshold);
			_vr.bezier8(x +   44.994 * s,y +  -67.406 * s,x +   49.177 * s,y +  -64.232 * s,x +   51.268 * s,y +  -59.700 * s,x +   51.268 * s,y +  -53.808 * s, threshold);
			_vr.bezier8(x +   51.268 * s,y +  -53.808 * s,x +   51.268 * s,y +  -48.144 * s,x +   48.274 * s,y +  -43.668 * s,x +   42.284 * s,y +  -40.380 * s, threshold);
			_vr.bezier8(x +   42.284 * s,y +  -40.380 * s,x +   51.171 * s,y +  -37.288 * s,x +   55.614 * s,y +  -30.908 * s,x +   55.614 * s,y +  -21.240 * s, threshold);
			_vr.bezier8(x +   55.614 * s,y +  -21.240 * s,x +   55.614 * s,y +  -14.730 * s,x +   53.156 * s,y +   -9.562 * s,x +   48.241 * s,y +   -5.737 * s, threshold);
			_vr.bezier8(x +   48.241 * s,y +   -5.737 * s,x +   43.326 * s,y +   -1.912 * s,x +   36.978 * s,y +       0. * s,x +   29.198 * s,y +       0. * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   20.019 * s);
			_setf(o + ( 1 << 2), y +  -61.327 * s);
			_setf(o + ( 2 << 2), x +   20.019 * s);
			_setf(o + ( 3 << 2), y +  -44.189 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   20.019 * s,y +  -44.189 * s,x +   21.972 * s,y +  -44.059 * s,x +   24.023 * s,y +  -43.993 * s,x +   26.171 * s,y +  -43.993 * s, threshold);
			_vr.bezier8(x +   26.171 * s,y +  -43.993 * s,x +   34.439 * s,y +  -43.993 * s,x +   38.573 * s,y +  -47.102 * s,x +   38.573 * s,y +  -53.319 * s, threshold);
			_vr.bezier8(x +   38.573 * s,y +  -53.319 * s,x +   38.573 * s,y +  -58.821 * s,x +   34.814 * s,y +  -61.571 * s,x +   27.294 * s,y +  -61.571 * s, threshold);
			_vr.bezier8(x +   27.294 * s,y +  -61.571 * s,x +   25.308 * s,y +  -61.571 * s,x +   22.883 * s,y +  -61.490 * s,x +   20.019 * s,y +  -61.327 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   20.019 * s);
			_setf(o + ( 1 << 2), y +  -34.277 * s);
			_setf(o + ( 2 << 2), x +   20.019 * s);
			_setf(o + ( 3 << 2), y +  -10.644 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   20.019 * s,y +  -10.644 * s,x +   22.590 * s,y +  -10.416 * s,x +   24.674 * s,y +  -10.303 * s,x +   26.269 * s,y +  -10.303 * s, threshold);
			_vr.bezier8(x +   26.269 * s,y +  -10.303 * s,x +   31.933 * s,y +  -10.303 * s,x +   36.042 * s,y +  -11.263 * s,x +   38.598 * s,y +  -13.183 * s, threshold);
			_vr.bezier8(x +   38.598 * s,y +  -13.183 * s,x +   41.153 * s,y +  -15.104 * s,x +   42.431 * s,y +  -18.294 * s,x +   42.431 * s,y +  -22.754 * s, threshold);
			_vr.bezier8(x +   42.431 * s,y +  -22.754 * s,x +   42.431 * s,y +  -26.822 * s,x +   41.243 * s,y +  -29.785 * s,x +   38.866 * s,y +  -31.640 * s, threshold);
			_vr.bezier8(x +   38.866 * s,y +  -31.640 * s,x +   36.490 * s,y +  -33.496 * s,x +   32.340 * s,y +  -34.423 * s,x +   26.415 * s,y +  -34.423 * s, threshold);
			_vr.bezier8(x +   26.415 * s,y +  -34.423 * s,x +   25.178 * s,y +  -34.423 * s,x +   23.046 * s,y +  -34.374 * s,x +   20.019 * s,y +  -34.277 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   59.520 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 67:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   56.347 * s);
			_setf(o + ( 1 << 2), y +  -67.724 * s);
			_setf(o + ( 2 << 2), x +   51.123 * s);
			_setf(o + ( 3 << 2), y +  -57.226 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   51.123 * s,y +  -57.226 * s,x +   48.291 * s,y +  -60.058 * s,x +   43.733 * s,y +  -61.474 * s,x +   37.451 * s,y +  -61.474 * s, threshold);
			_vr.bezier8(x +   37.451 * s,y +  -61.474 * s,x +   31.494 * s,y +  -61.474 * s,x +   26.611 * s,y +  -58.975 * s,x +   22.803 * s,y +  -53.979 * s, threshold);
			_vr.bezier8(x +   22.803 * s,y +  -53.979 * s,x +   18.994 * s,y +  -48.982 * s,x +   17.090 * s,y +  -42.659 * s,x +   17.090 * s,y +  -35.009 * s, threshold);
			_vr.bezier8(x +   17.090 * s,y +  -35.009 * s,x +   17.090 * s,y +  -27.360 * s,x +   18.856 * s,y +  -21.289 * s,x +   22.388 * s,y +  -16.797 * s, threshold);
			_vr.bezier8(x +   22.388 * s,y +  -16.797 * s,x +   25.919 * s,y +  -12.304 * s,x +   30.631 * s,y +  -10.058 * s,x +   36.523 * s,y +  -10.058 * s, threshold);
			_vr.bezier8(x +   36.523 * s,y +  -10.058 * s,x +   43.262 * s,y +  -10.058 * s,x +   48.535 * s,y +  -12.467 * s,x +   52.343 * s,y +  -17.285 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.251 * s);
			_setf(o + ( 1 << 2), y +   -7.031 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   58.251 * s,y +   -7.031 * s,x +   53.076 * s,y +   -1.530 * s,x +   45.491 * s,y +    1.221 * s,x +   35.498 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   35.498 * s,y +    1.221 * s,x +   25.504 * s,y +    1.221 * s,x +   17.741 * s,y +   -2.067 * s,x +   12.207 * s,y +   -8.642 * s, threshold);
			_vr.bezier8(x +   12.207 * s,y +   -8.642 * s,x +    6.673 * s,y +  -15.218 * s,x +    3.906 * s,y +  -24.186 * s,x +    3.906 * s,y +  -35.546 * s, threshold);
			_vr.bezier8(x +    3.906 * s,y +  -35.546 * s,x +    3.906 * s,y +  -46.126 * s,x +    6.974 * s,y +  -54.971 * s,x +   13.110 * s,y +  -62.084 * s, threshold);
			_vr.bezier8(x +   13.110 * s,y +  -62.084 * s,x +   19.246 * s,y +  -69.197 * s,x +   27.099 * s,y +  -72.753 * s,x +   36.670 * s,y +  -72.753 * s, threshold);
			_vr.bezier8(x +   36.670 * s,y +  -72.753 * s,x +   44.873 * s,y +  -72.753 * s,x +   51.432 * s,y +  -71.076 * s,x +   56.347 * s,y +  -67.724 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   61.181 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 68:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   23.193 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    7.324 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    7.324 * s);
			_setf(o + ( 5 << 2), y +  -71.483 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +    7.324 * s,y +  -71.483 * s,x +   17.448 * s,y +  -71.841 * s,x +   23.811 * s,y +  -72.020 * s,x +   26.416 * s,y +  -72.020 * s, threshold);
			_vr.bezier8(x +   26.416 * s,y +  -72.020 * s,x +   36.832 * s,y +  -72.020 * s,x +   45.092 * s,y +  -68.969 * s,x +   51.195 * s,y +  -62.865 * s, threshold);
			_vr.bezier8(x +   51.195 * s,y +  -62.865 * s,x +   57.299 * s,y +  -56.762 * s,x +   60.351 * s,y +  -48.664 * s,x +   60.351 * s,y +  -38.574 * s, threshold);
			_vr.bezier8(x +   60.351 * s,y +  -38.574 * s,x +   60.351 * s,y +  -12.858 * s,x +   47.964 * s,y +       0. * s,x +   23.193 * s,y +       0. * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   20.019 * s);
			_setf(o + ( 1 << 2), y +  -60.399 * s);
			_setf(o + ( 2 << 2), x +   20.019 * s);
			_setf(o + ( 3 << 2), y +  -11.572 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   20.019 * s,y +  -11.572 * s,x +   22.070 * s,y +  -11.377 * s,x +   24.284 * s,y +  -11.279 * s,x +   26.660 * s,y +  -11.279 * s, threshold);
			_vr.bezier8(x +   26.660 * s,y +  -11.279 * s,x +   33.072 * s,y +  -11.279 * s,x +   38.093 * s,y +  -13.607 * s,x +   41.723 * s,y +  -18.261 * s, threshold);
			_vr.bezier8(x +   41.723 * s,y +  -18.261 * s,x +   45.352 * s,y +  -22.916 * s,x +   47.167 * s,y +  -29.427 * s,x +   47.167 * s,y +  -37.792 * s, threshold);
			_vr.bezier8(x +   47.167 * s,y +  -37.792 * s,x +   47.167 * s,y +  -53.092 * s,x +   40.055 * s,y +  -60.741 * s,x +   25.830 * s,y +  -60.741 * s, threshold);
			_vr.bezier8(x +   25.830 * s,y +  -60.741 * s,x +   24.462 * s,y +  -60.741 * s,x +   22.526 * s,y +  -60.627 * s,x +   20.019 * s,y +  -60.399 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   64.257 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 69:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   20.019 * s);
			_setf(o + ( 1 << 2), y +  -60.253 * s);
			_setf(o + ( 2 << 2), x +   20.019 * s);
			_setf(o + ( 3 << 2), y +  -43.505 * s);
			_setf(o + ( 4 << 2), x +   43.651 * s);
			_setf(o + ( 5 << 2), y +  -43.505 * s);
			_setf(o + ( 6 << 2), x +   43.651 * s);
			_setf(o + ( 7 << 2), y +  -32.714 * s);
			_setf(o + ( 8 << 2), x +   20.019 * s);
			_setf(o + ( 9 << 2), y +  -32.714 * s);
			_setf(o + (10 << 2), x +   20.019 * s);
			_setf(o + (11 << 2), y +  -11.279 * s);
			_setf(o + (12 << 2), x +   52.440 * s);
			_setf(o + (13 << 2), y +  -11.279 * s);
			_setf(o + (14 << 2), x +   52.440 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +    7.324 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +    7.324 * s);
			_setf(o + (19 << 2), y +  -71.532 * s);
			_setf(o + (20 << 2), x +   52.977 * s);
			_setf(o + (21 << 2), y +  -71.532 * s);
			_setf(o + (22 << 2), x +   52.977 * s);
			_setf(o + (23 << 2), y +  -60.253 * s);
			_setf(o + (24 << 2), x +   20.019 * s);
			_setf(o + (25 << 2), y +  -60.253 * s);
			_setf(o + (26 << 2), x +   56.884 * s);
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
			_setf(o + ( 0 << 2), x +   20.019 * s);
			_setf(o + ( 1 << 2), y +  -60.253 * s);
			_setf(o + ( 2 << 2), x +   20.019 * s);
			_setf(o + ( 3 << 2), y +  -43.505 * s);
			_setf(o + ( 4 << 2), x +   45.165 * s);
			_setf(o + ( 5 << 2), y +  -43.505 * s);
			_setf(o + ( 6 << 2), x +   45.165 * s);
			_setf(o + ( 7 << 2), y +  -32.714 * s);
			_setf(o + ( 8 << 2), x +   20.019 * s);
			_setf(o + ( 9 << 2), y +  -32.714 * s);
			_setf(o + (10 << 2), x +   20.019 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    7.324 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +    7.324 * s);
			_setf(o + (15 << 2), y +  -71.532 * s);
			_setf(o + (16 << 2), x +   54.442 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   54.442 * s);
			_setf(o + (19 << 2), y +  -60.253 * s);
			_setf(o + (20 << 2), x +   20.019 * s);
			_setf(o + (21 << 2), y +  -60.253 * s);
			_setf(o + (22 << 2), x +   58.348 * s);
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
			_setf(o + ( 0 << 2), x +   60.156 * s);
			_setf(o + ( 1 << 2), y +  -65.722 * s);
			_setf(o + ( 2 << 2), x +   54.834 * s);
			_setf(o + ( 3 << 2), y +  -55.517 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   54.834 * s,y +  -55.517 * s,x +   53.336 * s,y +  -56.851 * s,x +   51.025 * s,y +  -58.178 * s,x +   47.900 * s,y +  -59.496 * s, threshold);
			_vr.bezier8(x +   47.900 * s,y +  -59.496 * s,x +   44.775 * s,y +  -60.814 * s,x +   42.090 * s,y +  -61.474 * s,x +   39.844 * s,y +  -61.474 * s, threshold);
			_vr.bezier8(x +   39.844 * s,y +  -61.474 * s,x +   32.812 * s,y +  -61.474 * s,x +   27.262 * s,y +  -59.089 * s,x +   23.193 * s,y +  -54.320 * s, threshold);
			_vr.bezier8(x +   23.193 * s,y +  -54.320 * s,x +   19.124 * s,y +  -49.552 * s,x +   17.090 * s,y +  -43.163 * s,x +   17.090 * s,y +  -35.156 * s, threshold);
			_vr.bezier8(x +   17.090 * s,y +  -35.156 * s,x +   17.090 * s,y +  -27.539 * s,x +   19.084 * s,y +  -21.451 * s,x +   23.071 * s,y +  -16.894 * s, threshold);
			_vr.bezier8(x +   23.071 * s,y +  -16.894 * s,x +   27.059 * s,y +  -12.337 * s,x +   32.487 * s,y +  -10.058 * s,x +   39.355 * s,y +  -10.058 * s, threshold);
			_vr.bezier8(x +   39.355 * s,y +  -10.058 * s,x +   43.880 * s,y +  -10.058 * s,x +   47.607 * s,y +  -11.295 * s,x +   50.537 * s,y +  -13.769 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   50.537 * s);
			_setf(o + ( 1 << 2), y +  -27.832 * s);
			_setf(o + ( 2 << 2), x +   40.625 * s);
			_setf(o + ( 3 << 2), y +  -27.832 * s);
			_setf(o + ( 4 << 2), x +   40.625 * s);
			_setf(o + ( 5 << 2), y +  -38.671 * s);
			_setf(o + ( 6 << 2), x +   63.232 * s);
			_setf(o + ( 7 << 2), y +  -38.671 * s);
			_setf(o + ( 8 << 2), x +   63.232 * s);
			_setf(o + ( 9 << 2), y +   -6.641 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   63.232 * s,y +   -6.641 * s,x +   60.205 * s,y +   -4.167 * s,x +   56.306 * s,y +   -2.238 * s,x +   51.538 * s,y +   -0.854 * s, threshold);
			_vr.bezier8(x +   51.538 * s,y +   -0.854 * s,x +   46.769 * s,y +    0.529 * s,x +   42.025 * s,y +    1.221 * s,x +   37.304 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   37.304 * s,y +    1.221 * s,x +   27.050 * s,y +    1.221 * s,x +   18.921 * s,y +   -2.140 * s,x +   12.915 * s,y +   -8.862 * s, threshold);
			_vr.bezier8(x +   12.915 * s,y +   -8.862 * s,x +    6.909 * s,y +  -15.584 * s,x +    3.907 * s,y +  -24.463 * s,x +    3.907 * s,y +  -35.497 * s, threshold);
			_vr.bezier8(x +    3.907 * s,y +  -35.497 * s,x +    3.907 * s,y +  -46.532 * s,x +    7.178 * s,y +  -55.500 * s,x +   13.721 * s,y +  -62.401 * s, threshold);
			_vr.bezier8(x +   13.721 * s,y +  -62.401 * s,x +   20.264 * s,y +  -69.302 * s,x +   29.069 * s,y +  -72.753 * s,x +   40.136 * s,y +  -72.753 * s, threshold);
			_vr.bezier8(x +   40.136 * s,y +  -72.753 * s,x +   47.982 * s,y +  -72.753 * s,x +   54.654 * s,y +  -70.409 * s,x +   60.156 * s,y +  -65.722 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   67.138 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 72:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   48.486 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   48.486 * s);
			_setf(o + ( 3 << 2), y +  -32.226 * s);
			_setf(o + ( 4 << 2), x +   20.019 * s);
			_setf(o + ( 5 << 2), y +  -32.226 * s);
			_setf(o + ( 6 << 2), x +   20.019 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    7.324 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +    7.324 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   20.019 * s);
			_setf(o + (13 << 2), y +  -71.532 * s);
			_setf(o + (14 << 2), x +   20.019 * s);
			_setf(o + (15 << 2), y +  -43.505 * s);
			_setf(o + (16 << 2), x +   48.486 * s);
			_setf(o + (17 << 2), y +  -43.505 * s);
			_setf(o + (18 << 2), x +   48.486 * s);
			_setf(o + (19 << 2), y +  -71.532 * s);
			_setf(o + (20 << 2), x +   61.034 * s);
			_setf(o + (21 << 2), y +  -71.532 * s);
			_setf(o + (22 << 2), x +   61.034 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   48.486 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   68.358 * s);
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
			_setf(o + ( 0 << 2), x +    7.568 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    7.568 * s);
			_setf(o + ( 3 << 2), y +  -71.532 * s);
			_setf(o + ( 4 << 2), x +   20.263 * s);
			_setf(o + ( 5 << 2), y +  -71.532 * s);
			_setf(o + ( 6 << 2), x +   20.263 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    7.568 * s);
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
			_setf(o + ( 0 << 2), x +    0.830 * s);
			_setf(o + ( 1 << 2), y +  -16.552 * s);
			_setf(o + ( 2 << 2), x +   12.158 * s);
			_setf(o + ( 3 << 2), y +  -16.552 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   12.158 * s,y +  -16.552 * s,x +   13.232 * s,y +  -12.386 * s,x +   16.715 * s,y +  -10.303 * s,x +   22.607 * s,y +  -10.303 * s, threshold);
			_vr.bezier8(x +   22.607 * s,y +  -10.303 * s,x +   26.774 * s,y +  -10.303 * s,x +   29.711 * s,y +  -11.653 * s,x +   31.420 * s,y +  -14.355 * s, threshold);
			_vr.bezier8(x +   31.420 * s,y +  -14.355 * s,x +   33.129 * s,y +  -17.057 * s,x +   33.984 * s,y +  -21.159 * s,x +   33.984 * s,y +  -26.660 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   33.984 * s);
			_setf(o + ( 1 << 2), y +  -71.532 * s);
			_setf(o + ( 2 << 2), x +   46.679 * s);
			_setf(o + ( 3 << 2), y +  -71.532 * s);
			_setf(o + ( 4 << 2), x +   46.679 * s);
			_setf(o + ( 5 << 2), y +  -27.050 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   46.679 * s,y +  -27.050 * s,x +   46.679 * s,y +  -17.546 * s,x +   44.661 * s,y +  -10.498 * s,x +   40.624 * s,y +   -5.908 * s, threshold);
			_vr.bezier8(x +   40.624 * s,y +   -5.908 * s,x +   36.588 * s,y +   -1.318 * s,x +   30.110 * s,y +    0.977 * s,x +   21.191 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   21.191 * s,y +    0.977 * s,x +   15.267 * s,y +    0.977 * s,x +   10.482 * s,y +   -0.570 * s,x +    6.836 * s,y +   -3.662 * s, threshold);
			_vr.bezier8(x +    6.836 * s,y +   -3.662 * s,x +    3.190 * s,y +   -6.754 * s,x +    1.188 * s,y +  -11.051 * s,x +    0.830 * s,y +  -16.552 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   53.271 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 75:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   47.899 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   27.978 * s);
			_setf(o + ( 3 << 2), y +  -30.468 * s);
			_setf(o + ( 4 << 2), x +   20.019 * s);
			_setf(o + ( 5 << 2), y +  -19.580 * s);
			_setf(o + ( 6 << 2), x +   20.019 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    7.324 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +    7.324 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   20.019 * s);
			_setf(o + (13 << 2), y +  -71.532 * s);
			_setf(o + (14 << 2), x +   20.019 * s);
			_setf(o + (15 << 2), y +  -37.304 * s);
			_setf(o + (16 << 2), x +   44.335 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   58.788 * s);
			_setf(o + (19 << 2), y +  -71.532 * s);
			_setf(o + (20 << 2), x +   36.376 * s);
			_setf(o + (21 << 2), y +  -40.283 * s);
			_setf(o + (22 << 2), x +   63.085 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   47.899 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   61.717 * s);
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
			_setf(o + ( 4 << 2), x +   20.020 * s);
			_setf(o + ( 5 << 2), y +  -71.532 * s);
			_setf(o + ( 6 << 2), x +   20.020 * s);
			_setf(o + ( 7 << 2), y +  -11.279 * s);
			_setf(o + ( 8 << 2), x +   52.343 * s);
			_setf(o + ( 9 << 2), y +  -11.279 * s);
			_setf(o + (10 << 2), x +   52.343 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    7.324 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   55.273 * s);
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
			_setf(o + ( 0 << 2), x +   74.022 * s);
			_setf(o + ( 1 << 2), y +    0.049 * s);
			_setf(o + ( 2 << 2), x +   61.718 * s);
			_setf(o + ( 3 << 2), y +    0.049 * s);
			_setf(o + ( 4 << 2), x +   54.296 * s);
			_setf(o + ( 5 << 2), y +  -38.525 * s);
			_setf(o + ( 6 << 2), x +   39.892 * s);
			_setf(o + ( 7 << 2), y +    0.977 * s);
			_setf(o + ( 8 << 2), x +   35.351 * s);
			_setf(o + ( 9 << 2), y +    0.977 * s);
			_setf(o + (10 << 2), x +   20.947 * s);
			_setf(o + (11 << 2), y +  -38.525 * s);
			_setf(o + (12 << 2), x +   13.232 * s);
			_setf(o + (13 << 2), y +    0.049 * s);
			_setf(o + (14 << 2), x +    0.977 * s);
			_setf(o + (15 << 2), y +    0.049 * s);
			_setf(o + (16 << 2), x +   15.381 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   22.119 * s);
			_setf(o + (19 << 2), y +  -71.532 * s);
			_setf(o + (20 << 2), x +   37.597 * s);
			_setf(o + (21 << 2), y +  -23.339 * s);
			_setf(o + (22 << 2), x +   52.734 * s);
			_setf(o + (23 << 2), y +  -71.532 * s);
			_setf(o + (24 << 2), x +   59.423 * s);
			_setf(o + (25 << 2), y +  -71.532 * s);
			_setf(o + (26 << 2), x +   74.022 * s);
			_setf(o + (27 << 2), y +    0.049 * s);
			_setf(o + (28 << 2), x +   74.511 * s);
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
			_setf(o + ( 0 << 2), x +   54.247 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			_setf(o + ( 2 << 2), x +   19.530 * s);
			_setf(o + ( 3 << 2), y +  -44.286 * s);
			_setf(o + ( 4 << 2), x +   19.530 * s);
			_setf(o + ( 5 << 2), y +    0.049 * s);
			_setf(o + ( 6 << 2), x +    7.324 * s);
			_setf(o + ( 7 << 2), y +    0.049 * s);
			_setf(o + ( 8 << 2), x +    7.324 * s);
			_setf(o + ( 9 << 2), y +  -71.532 * s);
			_setf(o + (10 << 2), x +   13.427 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   47.216 * s);
			_setf(o + (13 << 2), y +  -28.369 * s);
			_setf(o + (14 << 2), x +   47.216 * s);
			_setf(o + (15 << 2), y +  -71.532 * s);
			_setf(o + (16 << 2), x +   59.422 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   59.422 * s);
			_setf(o + (19 << 2), y +    0.977 * s);
			_setf(o + (20 << 2), x +   54.247 * s);
			_setf(o + (21 << 2), y +    0.977 * s);
			_setf(o + (22 << 2), x +   66.747 * s);
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
			_vr.bezier8(x +    3.906 * s,y +  -36.376 * s,x +    3.906 * s,y +  -46.565 * s,x +    6.697 * s,y +  -55.183 * s,x +   12.280 * s,y +  -62.230 * s, threshold);
			_vr.bezier8(x +   12.280 * s,y +  -62.230 * s,x +   17.862 * s,y +  -69.278 * s,x +   25.325 * s,y +  -72.802 * s,x +   34.667 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   34.667 * s,y +  -72.802 * s,x +   44.953 * s,y +  -72.802 * s,x +   52.814 * s,y +  -69.612 * s,x +   58.251 * s,y +  -63.231 * s, threshold);
			_vr.bezier8(x +   58.251 * s,y +  -63.231 * s,x +   63.687 * s,y +  -56.851 * s,x +   66.405 * s,y +  -47.900 * s,x +   66.405 * s,y +  -36.376 * s, threshold);
			_vr.bezier8(x +   66.405 * s,y +  -36.376 * s,x +   66.405 * s,y +  -24.853 * s,x +   63.565 * s,y +  -15.706 * s,x +   57.884 * s,y +   -8.935 * s, threshold);
			_vr.bezier8(x +   57.884 * s,y +   -8.935 * s,x +   52.204 * s,y +   -2.165 * s,x +   44.140 * s,y +    1.221 * s,x +   33.690 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   33.690 * s,y +    1.221 * s,x +   24.088 * s,y +    1.221 * s,x +   16.723 * s,y +   -2.132 * s,x +   11.596 * s,y +   -8.838 * s, threshold);
			_vr.bezier8(x +   11.596 * s,y +   -8.838 * s,x +    6.469 * s,y +  -15.543 * s,x +    3.906 * s,y +  -24.723 * s,x +    3.906 * s,y +  -36.376 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   17.089 * s);
			_setf(o + ( 1 << 2), y +  -36.376 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   17.089 * s,y +  -36.376 * s,x +   17.089 * s,y +  -28.011 * s,x +   18.505 * s,y +  -21.533 * s,x +   21.337 * s,y +  -16.943 * s, threshold);
			_vr.bezier8(x +   21.337 * s,y +  -16.943 * s,x +   24.169 * s,y +  -12.353 * s,x +   28.287 * s,y +  -10.058 * s,x +   33.690 * s,y +  -10.058 * s, threshold);
			_vr.bezier8(x +   33.690 * s,y +  -10.058 * s,x +   40.038 * s,y +  -10.058 * s,x +   44.880 * s,y +  -12.304 * s,x +   48.217 * s,y +  -16.797 * s, threshold);
			_vr.bezier8(x +   48.217 * s,y +  -16.797 * s,x +   51.553 * s,y +  -21.289 * s,x +   53.221 * s,y +  -27.815 * s,x +   53.221 * s,y +  -36.376 * s, threshold);
			_vr.bezier8(x +   53.221 * s,y +  -36.376 * s,x +   53.221 * s,y +  -53.141 * s,x +   47.037 * s,y +  -61.522 * s,x +   34.667 * s,y +  -61.522 * s, threshold);
			_vr.bezier8(x +   34.667 * s,y +  -61.522 * s,x +   29.003 * s,y +  -61.522 * s,x +   24.657 * s,y +  -59.252 * s,x +   21.630 * s,y +  -54.711 * s, threshold);
			_vr.bezier8(x +   21.630 * s,y +  -54.711 * s,x +   18.603 * s,y +  -50.170 * s,x +   17.089 * s,y +  -44.059 * s,x +   17.089 * s,y +  -36.376 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   70.311 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 80:
			
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   20.019 * s);
			_setf(o + ( 1 << 2), y +  -26.318 * s);
			_setf(o + ( 2 << 2), x +   20.019 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    7.324 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    7.324 * s);
			_setf(o + ( 7 << 2), y +  -71.483 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_vr.bezier8(x +    7.324 * s,y +  -71.483 * s,x +   15.787 * s,y +  -71.841 * s,x +   20.735 * s,y +  -72.020 * s,x +   22.168 * s,y +  -72.020 * s, threshold);
			_vr.bezier8(x +   22.168 * s,y +  -72.020 * s,x +   33.463 * s,y +  -72.020 * s,x +   41.723 * s,y +  -70.287 * s,x +   46.947 * s,y +  -66.820 * s, threshold);
			_vr.bezier8(x +   46.947 * s,y +  -66.820 * s,x +   52.172 * s,y +  -63.354 * s,x +   54.784 * s,y +  -57.942 * s,x +   54.784 * s,y +  -50.585 * s, threshold);
			_vr.bezier8(x +   54.784 * s,y +  -50.585 * s,x +   54.784 * s,y +  -34.179 * s,x +   45.117 * s,y +  -25.976 * s,x +   25.781 * s,y +  -25.976 * s, threshold);
			_vr.bezier8(x +   25.781 * s,y +  -25.976 * s,x +   24.349 * s,y +  -25.976 * s,x +   22.428 * s,y +  -26.090 * s,x +   20.019 * s,y +  -26.318 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   20.019 * s);
			_setf(o + ( 1 << 2), y +  -60.497 * s);
			_setf(o + ( 2 << 2), x +   20.019 * s);
			_setf(o + ( 3 << 2), y +  -37.597 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   20.019 * s,y +  -37.597 * s,x +   22.168 * s,y +  -37.369 * s,x +   23.860 * s,y +  -37.255 * s,x +   25.097 * s,y +  -37.255 * s, threshold);
			_vr.bezier8(x +   25.097 * s,y +  -37.255 * s,x +   30.891 * s,y +  -37.255 * s,x +   35.123 * s,y +  -38.224 * s,x +   37.792 * s,y +  -40.161 * s, threshold);
			_vr.bezier8(x +   37.792 * s,y +  -40.161 * s,x +   40.462 * s,y +  -42.097 * s,x +   41.796 * s,y +  -45.247 * s,x +   41.796 * s,y +  -49.609 * s, threshold);
			_vr.bezier8(x +   41.796 * s,y +  -49.609 * s,x +   41.796 * s,y +  -57.031 * s,x +   35.823 * s,y +  -60.741 * s,x +   23.877 * s,y +  -60.741 * s, threshold);
			_vr.bezier8(x +   23.877 * s,y +  -60.741 * s,x +   22.542 * s,y +  -60.741 * s,x +   21.256 * s,y +  -60.660 * s,x +   20.019 * s,y +  -60.497 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.690 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 81:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   75.146 * s);
			_setf(o + ( 1 << 2), y +   14.795 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   75.146 * s,y +   14.795 * s,x +   72.997 * s,y +   15.088 * s,x +   70.815 * s,y +   15.234 * s,x +   68.602 * s,y +   15.234 * s, threshold);
			_vr.bezier8(x +   68.602 * s,y +   15.234 * s,x +   62.547 * s,y +   15.234 * s,x +   56.973 * s,y +   14.005 * s,x +   51.879 * s,y +   11.548 * s, threshold);
			_vr.bezier8(x +   51.879 * s,y +   11.548 * s,x +   46.784 * s,y +    9.090 * s,x +   42.821 * s,y +    5.648 * s,x +   39.989 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   39.989 * s,y +    1.221 * s,x +   38.785 * s,y +    1.449 * s,x +   36.848 * s,y +    1.562 * s,x +   34.179 * s,y +    1.562 * s, threshold);
			_vr.bezier8(x +   34.179 * s,y +    1.562 * s,x +   24.772 * s,y +    1.562 * s,x +   17.374 * s,y +   -1.953 * s,x +   11.987 * s,y +   -8.984 * s, threshold);
			_vr.bezier8(x +   11.987 * s,y +   -8.984 * s,x +    6.600 * s,y +  -16.015 * s,x +    3.906 * s,y +  -25.065 * s,x +    3.906 * s,y +  -36.132 * s, threshold);
			_vr.bezier8(x +    3.906 * s,y +  -36.132 * s,x +    3.906 * s,y +  -46.614 * s,x +    6.657 * s,y +  -55.346 * s,x +   12.158 * s,y +  -62.328 * s, threshold);
			_vr.bezier8(x +   12.158 * s,y +  -62.328 * s,x +   17.659 * s,y +  -69.310 * s,x +   24.999 * s,y +  -72.802 * s,x +   34.179 * s,y +  -72.802 * s, threshold);
			_vr.bezier8(x +   34.179 * s,y +  -72.802 * s,x +   44.498 * s,y +  -72.802 * s,x +   52.448 * s,y +  -69.571 * s,x +   58.031 * s,y +  -63.109 * s, threshold);
			_vr.bezier8(x +   58.031 * s,y +  -63.109 * s,x +   63.613 * s,y +  -56.648 * s,x +   66.405 * s,y +  -47.656 * s,x +   66.405 * s,y +  -36.132 * s, threshold);
			_vr.bezier8(x +   66.405 * s,y +  -36.132 * s,x +   66.405 * s,y +  -19.043 * s,x +   60.807 * s,y +   -7.633 * s,x +   49.608 * s,y +   -1.904 * s, threshold);
			_vr.bezier8(x +   49.608 * s,y +   -1.904 * s,x +   53.156 * s,y +    2.002 * s,x +   59.048 * s,y +    3.955 * s,x +   67.284 * s,y +    3.955 * s, threshold);
			_vr.bezier8(x +   67.284 * s,y +    3.955 * s,x +   70.312 * s,y +    3.955 * s,x +   72.932 * s,y +    3.630 * s,x +   75.146 * s,y +    2.978 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   75.146 * s);
			_setf(o + ( 1 << 2), y +   14.795 * s);
			_setf(o + ( 2 << 2), x +   17.090 * s);
			_setf(o + ( 3 << 2), y +  -36.132 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_vr.bezier8(x +   17.090 * s,y +  -36.132 * s,x +   17.090 * s,y +  -28.646 * s,x +   18.587 * s,y +  -22.379 * s,x +   21.582 * s,y +  -17.334 * s, threshold);
			_vr.bezier8(x +   21.582 * s,y +  -17.334 * s,x +   24.576 * s,y +  -12.288 * s,x +   28.776 * s,y +   -9.765 * s,x +   34.179 * s,y +   -9.765 * s, threshold);
			_vr.bezier8(x +   34.179 * s,y +   -9.765 * s,x +   40.429 * s,y +   -9.765 * s,x +   45.165 * s,y +  -12.077 * s,x +   48.387 * s,y +  -16.699 * s, threshold);
			_vr.bezier8(x +   48.387 * s,y +  -16.699 * s,x +   51.610 * s,y +  -21.321 * s,x +   53.221 * s,y +  -27.799 * s,x +   53.221 * s,y +  -36.132 * s, threshold);
			_vr.bezier8(x +   53.221 * s,y +  -36.132 * s,x +   53.221 * s,y +  -53.027 * s,x +   46.874 * s,y +  -61.474 * s,x +   34.179 * s,y +  -61.474 * s, threshold);
			_vr.bezier8(x +   34.179 * s,y +  -61.474 * s,x +   28.580 * s,y +  -61.474 * s,x +   24.332 * s,y +  -59.211 * s,x +   21.435 * s,y +  -54.687 * s, threshold);
			_vr.bezier8(x +   21.435 * s,y +  -54.687 * s,x +   18.538 * s,y +  -50.162 * s,x +   17.090 * s,y +  -43.977 * s,x +   17.090 * s,y +  -36.132 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   70.898 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 82:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   47.655 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   28.564 * s);
			_setf(o + ( 3 << 2), y +  -29.541 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   28.564 * s,y +  -29.541 * s,x +   26.643 * s,y +  -29.573 * s,x +   23.958 * s,y +  -29.687 * s,x +   20.507 * s,y +  -29.882 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   20.507 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    7.324 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    7.324 * s);
			_setf(o + ( 5 << 2), y +  -71.532 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +    7.324 * s,y +  -71.532 * s,x +    8.040 * s,y +  -71.532 * s,x +   10.791 * s,y +  -71.654 * s,x +   15.576 * s,y +  -71.898 * s, threshold);
			_vr.bezier8(x +   15.576 * s,y +  -71.898 * s,x +   20.361 * s,y +  -72.142 * s,x +   24.218 * s,y +  -72.265 * s,x +   27.148 * s,y +  -72.265 * s, threshold);
			_vr.bezier8(x +   27.148 * s,y +  -72.265 * s,x +   45.312 * s,y +  -72.265 * s,x +   54.394 * s,y +  -65.234 * s,x +   54.394 * s,y +  -51.171 * s, threshold);
			_vr.bezier8(x +   54.394 * s,y +  -51.171 * s,x +   54.394 * s,y +  -46.939 * s,x +   53.140 * s,y +  -43.082 * s,x +   50.634 * s,y +  -39.599 * s, threshold);
			_vr.bezier8(x +   50.634 * s,y +  -39.599 * s,x +   48.127 * s,y +  -36.116 * s,x +   44.970 * s,y +  -33.658 * s,x +   41.161 * s,y +  -32.226 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   62.304 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   47.655 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   20.507 * s);
			_setf(o + ( 5 << 2), y +  -60.497 * s);
			_setf(o + ( 6 << 2), x +   20.507 * s);
			_setf(o + ( 7 << 2), y +  -40.624 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			_setb(o +  3, 2);
			_vr.bezier8(x +   20.507 * s,y +  -40.624 * s,x +   22.851 * s,y +  -40.429 * s,x +   24.641 * s,y +  -40.331 * s,x +   25.878 * s,y +  -40.331 * s, threshold);
			_vr.bezier8(x +   25.878 * s,y +  -40.331 * s,x +   31.184 * s,y +  -40.331 * s,x +   35.066 * s,y +  -41.080 * s,x +   37.524 * s,y +  -42.577 * s, threshold);
			_vr.bezier8(x +   37.524 * s,y +  -42.577 * s,x +   39.981 * s,y +  -44.075 * s,x +   41.210 * s,y +  -46.988 * s,x +   41.210 * s,y +  -51.318 * s, threshold);
			_vr.bezier8(x +   41.210 * s,y +  -51.318 * s,x +   41.210 * s,y +  -54.833 * s,x +   39.892 * s,y +  -57.291 * s,x +   37.255 * s,y +  -58.691 * s, threshold);
			_vr.bezier8(x +   37.255 * s,y +  -58.691 * s,x +   34.618 * s,y +  -60.090 * s,x +   30.468 * s,y +  -60.790 * s,x +   24.804 * s,y +  -60.790 * s, threshold);
			_vr.bezier8(x +   24.804 * s,y +  -60.790 * s,x +   23.437 * s,y +  -60.790 * s,x +   22.005 * s,y +  -60.692 * s,x +   20.507 * s,y +  -60.497 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   61.083 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 83:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    3.906 * s);
			_setf(o + ( 1 << 2), y +   -3.955 * s);
			_setf(o + ( 2 << 2), x +    8.594 * s);
			_setf(o + ( 3 << 2), y +  -15.332 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    8.594 * s,y +  -15.332 * s,x +   13.606 * s,y +  -11.816 * s,x +   18.538 * s,y +  -10.058 * s,x +   23.388 * s,y +  -10.058 * s, threshold);
			_vr.bezier8(x +   23.388 * s,y +  -10.058 * s,x +   30.842 * s,y +  -10.058 * s,x +   34.570 * s,y +  -12.663 * s,x +   34.570 * s,y +  -17.871 * s, threshold);
			_vr.bezier8(x +   34.570 * s,y +  -17.871 * s,x +   34.570 * s,y +  -20.312 * s,x +   33.691 * s,y +  -22.640 * s,x +   31.933 * s,y +  -24.853 * s, threshold);
			_vr.bezier8(x +   31.933 * s,y +  -24.853 * s,x +   30.175 * s,y +  -27.067 * s,x +   26.554 * s,y +  -29.549 * s,x +   21.069 * s,y +  -32.299 * s, threshold);
			_vr.bezier8(x +   21.069 * s,y +  -32.299 * s,x +   15.584 * s,y +  -35.050 * s,x +   11.889 * s,y +  -37.312 * s,x +    9.985 * s,y +  -39.086 * s, threshold);
			_vr.bezier8(x +    9.985 * s,y +  -39.086 * s,x +    8.081 * s,y +  -40.860 * s,x +    6.616 * s,y +  -42.968 * s,x +    5.591 * s,y +  -45.409 * s, threshold);
			_vr.bezier8(x +    5.591 * s,y +  -45.409 * s,x +    4.565 * s,y +  -47.851 * s,x +    4.053 * s,y +  -50.553 * s,x +    4.053 * s,y +  -53.515 * s, threshold);
			_vr.bezier8(x +    4.053 * s,y +  -53.515 * s,x +    4.053 * s,y +  -59.048 * s,x +    6.079 * s,y +  -63.638 * s,x +   10.132 * s,y +  -67.284 * s, threshold);
			_vr.bezier8(x +   10.132 * s,y +  -67.284 * s,x +   14.184 * s,y +  -70.930 * s,x +   19.384 * s,y +  -72.753 * s,x +   25.732 * s,y +  -72.753 * s, threshold);
			_vr.bezier8(x +   25.732 * s,y +  -72.753 * s,x +   34.000 * s,y +  -72.753 * s,x +   40.071 * s,y +  -71.207 * s,x +   43.945 * s,y +  -68.114 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   40.087 * s);
			_setf(o + ( 1 << 2), y +  -57.177 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   40.087 * s,y +  -57.177 * s,x +   35.628 * s,y +  -60.367 * s,x +   30.924 * s,y +  -61.962 * s,x +   25.976 * s,y +  -61.962 * s, threshold);
			_vr.bezier8(x +   25.976 * s,y +  -61.962 * s,x +   23.046 * s,y +  -61.962 * s,x +   20.776 * s,y +  -61.189 * s,x +   19.165 * s,y +  -59.643 * s, threshold);
			_vr.bezier8(x +   19.165 * s,y +  -59.643 * s,x +   17.553 * s,y +  -58.096 * s,x +   16.748 * s,y +  -56.086 * s,x +   16.748 * s,y +  -53.612 * s, threshold);
			_vr.bezier8(x +   16.748 * s,y +  -53.612 * s,x +   16.748 * s,y +  -49.511 * s,x +   21.292 * s,y +  -45.252 * s,x +   30.371 * s,y +  -40.820 * s, threshold);
			_vr.bezier8(x +   30.371 * s,y +  -40.820 * s,x +   35.158 * s,y +  -38.482 * s,x +   38.606 * s,y +  -36.319 * s,x +   40.722 * s,y +  -34.350 * s, threshold);
			_vr.bezier8(x +   40.722 * s,y +  -34.350 * s,x +   42.838 * s,y +  -32.381 * s,x +   44.449 * s,y +  -30.086 * s,x +   45.556 * s,y +  -27.465 * s, threshold);
			_vr.bezier8(x +   45.556 * s,y +  -27.465 * s,x +   46.663 * s,y +  -24.845 * s,x +   47.216 * s,y +  -21.924 * s,x +   47.216 * s,y +  -18.701 * s, threshold);
			_vr.bezier8(x +   47.216 * s,y +  -18.701 * s,x +   47.216 * s,y +  -12.906 * s,x +   44.929 * s,y +   -8.138 * s,x +   40.356 * s,y +   -4.394 * s, threshold);
			_vr.bezier8(x +   40.356 * s,y +   -4.394 * s,x +   35.782 * s,y +   -0.651 * s,x +   29.654 * s,y +    1.221 * s,x +   21.972 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   21.972 * s,y +    1.221 * s,x +   15.299 * s,y +    1.221 * s,x +    9.277 * s,y +   -0.505 * s,x +    3.906 * s,y +   -3.955 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   51.122 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 84:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +   36.425 * s);
			_setf(o + ( 1 << 2), y +  -60.253 * s);
			_setf(o + ( 2 << 2), x +   36.425 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   23.730 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   23.730 * s);
			_setf(o + ( 7 << 2), y +  -60.253 * s);
			_setf(o + ( 8 << 2), x +    0.977 * s);
			_setf(o + ( 9 << 2), y +  -60.253 * s);
			_setf(o + (10 << 2), x +    0.977 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   60.204 * s);
			_setf(o + (13 << 2), y +  -71.532 * s);
			_setf(o + (14 << 2), x +   60.204 * s);
			_setf(o + (15 << 2), y +  -60.253 * s);
			_setf(o + (16 << 2), x +   36.425 * s);
			_setf(o + (17 << 2), y +  -60.253 * s);
			_setf(o + (18 << 2), x +   61.181 * s);
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
			_setf(o + ( 2 << 2), x +   20.019 * s);
			_setf(o + ( 3 << 2), y +  -71.532 * s);
			_setf(o + ( 4 << 2), x +   20.019 * s);
			_setf(o + ( 5 << 2), y +  -23.047 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   20.019 * s,y +  -23.047 * s,x +   20.019 * s,y +  -19.206 * s,x +   21.191 * s,y +  -16.080 * s,x +   23.535 * s,y +  -13.672 * s, threshold);
			_vr.bezier8(x +   23.535 * s,y +  -13.672 * s,x +   25.878 * s,y +  -11.263 * s,x +   29.101 * s,y +  -10.058 * s,x +   33.202 * s,y +  -10.058 * s, threshold);
			_vr.bezier8(x +   33.202 * s,y +  -10.058 * s,x +   37.792 * s,y +  -10.058 * s,x +   41.365 * s,y +  -11.238 * s,x +   43.920 * s,y +  -13.598 * s, threshold);
			_vr.bezier8(x +   43.920 * s,y +  -13.598 * s,x +   46.475 * s,y +  -15.958 * s,x +   47.753 * s,y +  -19.189 * s,x +   47.753 * s,y +  -23.291 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   47.753 * s);
			_setf(o + ( 1 << 2), y +  -71.532 * s);
			_setf(o + ( 2 << 2), x +   60.448 * s);
			_setf(o + ( 3 << 2), y +  -71.532 * s);
			_setf(o + ( 4 << 2), x +   60.448 * s);
			_setf(o + ( 5 << 2), y +  -22.314 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   60.448 * s,y +  -22.314 * s,x +   60.448 * s,y +  -14.958 * s,x +   57.982 * s,y +   -9.196 * s,x +   53.051 * s,y +   -5.029 * s, threshold);
			_vr.bezier8(x +   53.051 * s,y +   -5.029 * s,x +   48.119 * s,y +   -0.863 * s,x +   41.536 * s,y +    1.221 * s,x +   33.300 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   33.300 * s,y +    1.221 * s,x +   24.999 * s,y +    1.221 * s,x +   18.595 * s,y +   -0.814 * s,x +   14.087 * s,y +   -4.883 * s, threshold);
			_vr.bezier8(x +   14.087 * s,y +   -4.883 * s,x +    9.578 * s,y +   -8.952 * s,x +    7.324 * s,y +  -14.779 * s,x +    7.324 * s,y +  -22.363 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    7.324 * s);
			_setf(o + ( 1 << 2), y +  -71.532 * s);
			_setf(o + ( 2 << 2), x +   67.772 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 86:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +   33.984 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			_setf(o + ( 2 << 2), x +   27.002 * s);
			_setf(o + ( 3 << 2), y +    0.977 * s);
			_setf(o + ( 4 << 2), x +    0.244 * s);
			_setf(o + ( 5 << 2), y +  -71.532 * s);
			_setf(o + ( 6 << 2), x +   14.209 * s);
			_setf(o + ( 7 << 2), y +  -71.532 * s);
			_setf(o + ( 8 << 2), x +   30.761 * s);
			_setf(o + ( 9 << 2), y +  -23.193 * s);
			_setf(o + (10 << 2), x +   48.242 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   61.913 * s);
			_setf(o + (13 << 2), y +  -71.532 * s);
			_setf(o + (14 << 2), x +   33.984 * s);
			_setf(o + (15 << 2), y +    0.977 * s);
			_setf(o + (16 << 2), x +   62.157 * s);
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
			_setf(o + ( 0 << 2), x +   64.990 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			_setf(o + ( 2 << 2), x +   59.765 * s);
			_setf(o + ( 3 << 2), y +    0.977 * s);
			_setf(o + ( 4 << 2), x +   44.140 * s);
			_setf(o + ( 5 << 2), y +  -44.140 * s);
			_setf(o + ( 6 << 2), x +   28.955 * s);
			_setf(o + ( 7 << 2), y +    0.977 * s);
			_setf(o + ( 8 << 2), x +   23.731 * s);
			_setf(o + ( 9 << 2), y +    0.977 * s);
			_setf(o + (10 << 2), x +    0.245 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   13.477 * s);
			_setf(o + (13 << 2), y +  -71.532 * s);
			_setf(o + (14 << 2), x +   26.904 * s);
			_setf(o + (15 << 2), y +  -28.369 * s);
			_setf(o + (16 << 2), x +   41.406 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   46.972 * s);
			_setf(o + (19 << 2), y +  -71.532 * s);
			_setf(o + (20 << 2), x +   61.523 * s);
			_setf(o + (21 << 2), y +  -28.369 * s);
			_setf(o + (22 << 2), x +   74.902 * s);
			_setf(o + (23 << 2), y +  -71.532 * s);
			_setf(o + (24 << 2), x +   88.134 * s);
			_setf(o + (25 << 2), y +  -71.532 * s);
			_setf(o + (26 << 2), x +   64.990 * s);
			_setf(o + (27 << 2), y +    0.977 * s);
			_setf(o + (28 << 2), x +   88.378 * s);
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
			_setf(o + ( 0 << 2), x +   45.995 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   29.101 * s);
			_setf(o + ( 3 << 2), y +  -25.732 * s);
			_setf(o + ( 4 << 2), x +   13.476 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    0.244 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   21.679 * s);
			_setf(o + ( 9 << 2), y +  -37.060 * s);
			_setf(o + (10 << 2), x +    1.953 * s);
			_setf(o + (11 << 2), y +  -71.581 * s);
			_setf(o + (12 << 2), x +   14.941 * s);
			_setf(o + (13 << 2), y +  -71.532 * s);
			_setf(o + (14 << 2), x +   29.443 * s);
			_setf(o + (15 << 2), y +  -47.362 * s);
			_setf(o + (16 << 2), x +   45.409 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   58.690 * s);
			_setf(o + (19 << 2), y +  -71.532 * s);
			_setf(o + (20 << 2), x +   36.035 * s);
			_setf(o + (21 << 2), y +  -36.865 * s);
			_setf(o + (22 << 2), x +   59.813 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   45.995 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   60.058 * s);
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
			_setf(o + ( 0 << 2), x +   37.060 * s);
			_setf(o + ( 1 << 2), y +  -29.345 * s);
			_setf(o + ( 2 << 2), x +   37.060 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   24.365 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   24.365 * s);
			_setf(o + ( 7 << 2), y +  -29.345 * s);
			_setf(o + ( 8 << 2), x +    0.244 * s);
			_setf(o + ( 9 << 2), y +  -71.532 * s);
			_setf(o + (10 << 2), x +   13.720 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   30.664 * s);
			_setf(o + (13 << 2), y +  -41.015 * s);
			_setf(o + (14 << 2), x +   47.655 * s);
			_setf(o + (15 << 2), y +  -71.532 * s);
			_setf(o + (16 << 2), x +   61.083 * s);
			_setf(o + (17 << 2), y +  -71.532 * s);
			_setf(o + (18 << 2), x +   37.060 * s);
			_setf(o + (19 << 2), y +  -29.345 * s);
			_setf(o + (20 << 2), x +   61.327 * s);
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
			_setf(o + ( 3 << 2), y +   -4.102 * s);
			_setf(o + ( 4 << 2), x +   33.740 * s);
			_setf(o + ( 5 << 2), y +  -60.253 * s);
			_setf(o + ( 6 << 2), x +    4.394 * s);
			_setf(o + ( 7 << 2), y +  -60.253 * s);
			_setf(o + ( 8 << 2), x +    4.394 * s);
			_setf(o + ( 9 << 2), y +  -71.532 * s);
			_setf(o + (10 << 2), x +   51.024 * s);
			_setf(o + (11 << 2), y +  -71.532 * s);
			_setf(o + (12 << 2), x +   51.024 * s);
			_setf(o + (13 << 2), y +  -67.431 * s);
			_setf(o + (14 << 2), x +   21.093 * s);
			_setf(o + (15 << 2), y +  -11.279 * s);
			_setf(o + (16 << 2), x +   52.099 * s);
			_setf(o + (17 << 2), y +  -11.279 * s);
			_setf(o + (18 << 2), x +   52.099 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +    3.906 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   56.005 * s);
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
			_setf(o + ( 0 << 2), x +    7.324 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			_setf(o + ( 2 << 2), x +    7.324 * s);
			_setf(o + ( 3 << 2), y +  -73.729 * s);
			_setf(o + ( 4 << 2), x +   32.861 * s);
			_setf(o + ( 5 << 2), y +  -73.729 * s);
			_setf(o + ( 6 << 2), x +   32.861 * s);
			_setf(o + ( 7 << 2), y +  -62.841 * s);
			_setf(o + ( 8 << 2), x +   20.019 * s);
			_setf(o + ( 9 << 2), y +  -62.841 * s);
			_setf(o + (10 << 2), x +   20.019 * s);
			_setf(o + (11 << 2), y +    9.619 * s);
			_setf(o + (12 << 2), x +   32.861 * s);
			_setf(o + (13 << 2), y +    9.619 * s);
			_setf(o + (14 << 2), x +   32.861 * s);
			_setf(o + (15 << 2), y +   20.508 * s);
			_setf(o + (16 << 2), x +    7.324 * s);
			_setf(o + (17 << 2), y +   20.508 * s);
			_setf(o + (18 << 2), x +   40.185 * s);
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
			_setf(o + ( 0 << 2), x +   25.781 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   -0.391 * s);
			_setf(o + ( 3 << 2), y +  -71.825 * s);
			_setf(o + ( 4 << 2), x +    9.668 * s);
			_setf(o + ( 5 << 2), y +  -71.825 * s);
			_setf(o + ( 6 << 2), x +   35.888 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   25.781 * s);
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
			_setf(o + ( 0 << 2), x +   32.861 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			_setf(o + ( 2 << 2), x +    7.324 * s);
			_setf(o + ( 3 << 2), y +   20.508 * s);
			_setf(o + ( 4 << 2), x +    7.324 * s);
			_setf(o + ( 5 << 2), y +    9.619 * s);
			_setf(o + ( 6 << 2), x +   20.166 * s);
			_setf(o + ( 7 << 2), y +    9.619 * s);
			_setf(o + ( 8 << 2), x +   20.166 * s);
			_setf(o + ( 9 << 2), y +  -62.841 * s);
			_setf(o + (10 << 2), x +    7.324 * s);
			_setf(o + (11 << 2), y +  -62.841 * s);
			_setf(o + (12 << 2), x +    7.324 * s);
			_setf(o + (13 << 2), y +  -73.729 * s);
			_setf(o + (14 << 2), x +   32.861 * s);
			_setf(o + (15 << 2), y +  -73.729 * s);
			_setf(o + (16 << 2), x +   32.861 * s);
			_setf(o + (17 << 2), y +   20.508 * s);
			_setf(o + (18 << 2), x +   40.185 * s);
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
			_setf(o + ( 0 << 2), x +   39.648 * s);
			_setf(o + ( 1 << 2), y +  -44.286 * s);
			_setf(o + ( 2 << 2), x +   29.199 * s);
			_setf(o + ( 3 << 2), y +  -61.767 * s);
			_setf(o + ( 4 << 2), x +   18.554 * s);
			_setf(o + ( 5 << 2), y +  -44.091 * s);
			_setf(o + ( 6 << 2), x +    9.180 * s);
			_setf(o + ( 7 << 2), y +  -44.091 * s);
			_setf(o + ( 8 << 2), x +   26.660 * s);
			_setf(o + ( 9 << 2), y +  -71.825 * s);
			_setf(o + (10 << 2), x +   31.884 * s);
			_setf(o + (11 << 2), y +  -71.825 * s);
			_setf(o + (12 << 2), x +   49.267 * s);
			_setf(o + (13 << 2), y +  -44.286 * s);
			_setf(o + (14 << 2), x +   39.648 * s);
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
			_setf(o + ( 0 << 2), x +   29.101 * s);
			_setf(o + ( 1 << 2), y +  -59.325 * s);
			_setf(o + ( 2 << 2), x +   18.066 * s);
			_setf(o + ( 3 << 2), y +  -73.632 * s);
			_setf(o + ( 4 << 2), x +   31.103 * s);
			_setf(o + ( 5 << 2), y +  -73.632 * s);
			_setf(o + ( 6 << 2), x +   39.355 * s);
			_setf(o + ( 7 << 2), y +  -59.325 * s);
			_setf(o + ( 8 << 2), x +   29.101 * s);
			_setf(o + ( 9 << 2), y +  -59.325 * s);
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
			_setf(o + ( 0 << 2), x +   35.692 * s);
			_setf(o + ( 1 << 2), y +   -5.224 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   35.692 * s,y +   -5.224 * s,x +   34.586 * s,y +   -3.402 * s,x +   32.657 * s,y +   -1.912 * s,x +   29.906 * s,y +   -0.757 * s, threshold);
			_vr.bezier8(x +   29.906 * s,y +   -0.757 * s,x +   27.156 * s,y +    0.399 * s,x +   24.283 * s,y +    0.977 * s,x +   21.288 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   21.288 * s,y +    0.977 * s,x +   15.657 * s,y +    0.977 * s,x +   11.230 * s,y +   -0.431 * s,x +    8.007 * s,y +   -3.247 * s, threshold);
			_vr.bezier8(x +    8.007 * s,y +   -3.247 * s,x +    4.785 * s,y +   -6.063 * s,x +    3.173 * s,y +  -10.058 * s,x +    3.173 * s,y +  -15.234 * s, threshold);
			_vr.bezier8(x +    3.173 * s,y +  -15.234 * s,x +    3.173 * s,y +  -21.289 * s,x +    5.444 * s,y +  -26.025 * s,x +    9.985 * s,y +  -29.443 * s, threshold);
			_vr.bezier8(x +    9.985 * s,y +  -29.443 * s,x +   14.526 * s,y +  -32.861 * s,x +   20.979 * s,y +  -34.570 * s,x +   29.345 * s,y +  -34.570 * s, threshold);
			_vr.bezier8(x +   29.345 * s,y +  -34.570 * s,x +   30.777 * s,y +  -34.570 * s,x +   32.470 * s,y +  -34.326 * s,x +   34.423 * s,y +  -33.837 * s, threshold);
			_vr.bezier8(x +   34.423 * s,y +  -33.837 * s,x +   34.423 * s,y +  -39.990 * s,x +   30.533 * s,y +  -43.066 * s,x +   22.753 * s,y +  -43.066 * s, threshold);
			_vr.bezier8(x +   22.753 * s,y +  -43.066 * s,x +   18.163 * s,y +  -43.066 * s,x +   14.322 * s,y +  -42.301 * s,x +   11.230 * s,y +  -40.771 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    8.593 * s);
			_setf(o + ( 1 << 2), y +  -50.243 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    8.593 * s,y +  -50.243 * s,x +   12.792 * s,y +  -52.262 * s,x +   17.789 * s,y +  -53.271 * s,x +   23.583 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   23.583 * s,y +  -53.271 * s,x +   31.558 * s,y +  -53.271 * s,x +   37.401 * s,y +  -51.456 * s,x +   41.112 * s,y +  -47.826 * s, threshold);
			_vr.bezier8(x +   41.112 * s,y +  -47.826 * s,x +   44.823 * s,y +  -44.197 * s,x +   46.679 * s,y +  -37.320 * s,x +   46.679 * s,y +  -27.197 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   46.679 * s);
			_setf(o + ( 1 << 2), y +  -16.015 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   46.679 * s,y +  -16.015 * s,x +   46.679 * s,y +   -9.049 * s,x +   48.078 * s,y +   -4.671 * s,x +   50.878 * s,y +   -2.881 * s, threshold);
			_vr.bezier8(x +   50.878 * s,y +   -2.881 * s,x +   49.869 * s,y +   -1.123 * s,x +   48.746 * s,y +   -0.041 * s,x +   47.509 * s,y +    0.366 * s, threshold);
			_vr.bezier8(x +   47.509 * s,y +    0.366 * s,x +   46.272 * s,y +    0.773 * s,x +   44.856 * s,y +    0.977 * s,x +   43.261 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   43.261 * s,y +    0.977 * s,x +   41.503 * s,y +    0.977 * s,x +   39.924 * s,y +    0.325 * s,x +   38.524 * s,y +   -0.976 * s, threshold);
			_vr.bezier8(x +   38.524 * s,y +   -0.976 * s,x +   37.125 * s,y +   -2.279 * s,x +   36.181 * s,y +   -3.695 * s,x +   35.692 * s,y +   -5.224 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   34.520 * s);
			_setf(o + ( 1 << 2), y +  -24.609 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   34.520 * s,y +  -24.609 * s,x +   32.437 * s,y +  -25.032 * s,x +   30.875 * s,y +  -25.244 * s,x +   29.833 * s,y +  -25.244 * s, threshold);
			_vr.bezier8(x +   29.833 * s,y +  -25.244 * s,x +   20.198 * s,y +  -25.244 * s,x +   15.380 * s,y +  -22.086 * s,x +   15.380 * s,y +  -15.771 * s, threshold);
			_vr.bezier8(x +   15.380 * s,y +  -15.771 * s,x +   15.380 * s,y +  -11.084 * s,x +   18.098 * s,y +   -8.740 * s,x +   23.534 * s,y +   -8.740 * s, threshold);
			_vr.bezier8(x +   23.534 * s,y +   -8.740 * s,x +   30.859 * s,y +   -8.740 * s,x +   34.520 * s,y +  -12.402 * s,x +   34.520 * s,y +  -19.726 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   34.520 * s);
			_setf(o + ( 1 << 2), y +  -24.609 * s);
			_setf(o + ( 2 << 2), x +   53.270 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 98:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   15.234 * s);
			_setf(o + ( 1 << 2), y +   -2.881 * s);
			_setf(o + ( 2 << 2), x +   12.500 * s);
			_setf(o + ( 3 << 2), y +    0.977 * s);
			_setf(o + ( 4 << 2), x +    5.615 * s);
			_setf(o + ( 5 << 2), y +    0.977 * s);
			_setf(o + ( 6 << 2), x +    5.615 * s);
			_setf(o + ( 7 << 2), y +  -71.776 * s);
			_setf(o + ( 8 << 2), x +   17.822 * s);
			_setf(o + ( 9 << 2), y +  -74.706 * s);
			_setf(o + (10 << 2), x +   17.822 * s);
			_setf(o + (11 << 2), y +  -50.292 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_vr.bezier8(x +   17.822 * s,y +  -50.292 * s,x +   21.077 * s,y +  -52.278 * s,x +   24.625 * s,y +  -53.271 * s,x +   28.466 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   28.466 * s,y +  -53.271 * s,x +   36.116 * s,y +  -53.271 * s,x +   42.284 * s,y +  -50.854 * s,x +   46.972 * s,y +  -46.020 * s, threshold);
			_vr.bezier8(x +   46.972 * s,y +  -46.020 * s,x +   51.659 * s,y +  -41.186 * s,x +   54.003 * s,y +  -34.993 * s,x +   54.003 * s,y +  -27.441 * s, threshold);
			_vr.bezier8(x +   54.003 * s,y +  -27.441 * s,x +   54.003 * s,y +  -18.685 * s,x +   51.643 * s,y +  -11.759 * s,x +   46.923 * s,y +   -6.665 * s, threshold);
			_vr.bezier8(x +   46.923 * s,y +   -6.665 * s,x +   42.203 * s,y +   -1.571 * s,x +   35.807 * s,y +    0.977 * s,x +   27.734 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   27.734 * s,y +    0.977 * s,x +   22.884 * s,y +    0.977 * s,x +   18.717 * s,y +   -0.309 * s,x +   15.234 * s,y +   -2.881 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   17.822 * s);
			_setf(o + ( 1 << 2), y +  -39.843 * s);
			_setf(o + ( 2 << 2), x +   17.822 * s);
			_setf(o + ( 3 << 2), y +  -12.549 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   17.822 * s,y +  -12.549 * s,x +   19.612 * s,y +  -10.433 * s,x +   22.037 * s,y +   -9.375 * s,x +   25.097 * s,y +   -9.375 * s, threshold);
			_vr.bezier8(x +   25.097 * s,y +   -9.375 * s,x +   30.989 * s,y +   -9.375 * s,x +   35.164 * s,y +  -10.775 * s,x +   37.621 * s,y +  -13.574 * s, threshold);
			_vr.bezier8(x +   37.621 * s,y +  -13.574 * s,x +   40.079 * s,y +  -16.373 * s,x +   41.308 * s,y +  -20.849 * s,x +   41.308 * s,y +  -27.001 * s, threshold);
			_vr.bezier8(x +   41.308 * s,y +  -27.001 * s,x +   41.308 * s,y +  -37.613 * s,x +   36.230 * s,y +  -42.919 * s,x +   26.074 * s,y +  -42.919 * s, threshold);
			_vr.bezier8(x +   26.074 * s,y +  -42.919 * s,x +   22.461 * s,y +  -42.919 * s,x +   19.710 * s,y +  -41.894 * s,x +   17.822 * s,y +  -39.843 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.153 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 99:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   47.607 * s);
			_setf(o + ( 1 << 2), y +  -48.144 * s);
			_setf(o + ( 2 << 2), x +   42.383 * s);
			_setf(o + ( 3 << 2), y +  -39.013 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   42.383 * s,y +  -39.013 * s,x +   39.518 * s,y +  -41.715 * s,x +   35.677 * s,y +  -43.066 * s,x +   30.859 * s,y +  -43.066 * s, threshold);
			_vr.bezier8(x +   30.859 * s,y +  -43.066 * s,x +   26.237 * s,y +  -43.066 * s,x +   22.583 * s,y +  -41.528 * s,x +   19.897 * s,y +  -38.452 * s, threshold);
			_vr.bezier8(x +   19.897 * s,y +  -38.452 * s,x +   17.212 * s,y +  -35.375 * s,x +   15.869 * s,y +  -31.119 * s,x +   15.869 * s,y +  -25.683 * s, threshold);
			_vr.bezier8(x +   15.869 * s,y +  -25.683 * s,x +   15.869 * s,y +  -14.714 * s,x +   21.093 * s,y +   -9.228 * s,x +   31.542 * s,y +   -9.228 * s, threshold);
			_vr.bezier8(x +   31.542 * s,y +   -9.228 * s,x +   36.068 * s,y +   -9.228 * s,x +   40.055 * s,y +  -10.726 * s,x +   43.506 * s,y +  -13.720 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   47.998 * s);
			_setf(o + ( 1 << 2), y +   -4.102 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   47.998 * s,y +   -4.102 * s,x +   44.450 * s,y +   -1.888 * s,x +   41.349 * s,y +   -0.488 * s,x +   38.696 * s,y +    0.098 * s, threshold);
			_vr.bezier8(x +   38.696 * s,y +    0.098 * s,x +   36.043 * s,y +    0.684 * s,x +   32.910 * s,y +    0.977 * s,x +   29.296 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   29.296 * s,y +    0.977 * s,x +   21.224 * s,y +    0.977 * s,x +   14.852 * s,y +   -1.375 * s,x +   10.181 * s,y +   -6.079 * s, threshold);
			_vr.bezier8(x +   10.181 * s,y +   -6.079 * s,x +    5.509 * s,y +  -10.783 * s,x +    3.174 * s,y +  -17.318 * s,x +    3.174 * s,y +  -25.683 * s, threshold);
			_vr.bezier8(x +    3.174 * s,y +  -25.683 * s,x +    3.174 * s,y +  -33.919 * s,x +    5.729 * s,y +  -40.575 * s,x +   10.840 * s,y +  -45.654 * s, threshold);
			_vr.bezier8(x +   10.840 * s,y +  -45.654 * s,x +   15.950 * s,y +  -50.732 * s,x +   22.916 * s,y +  -53.271 * s,x +   31.738 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   31.738 * s,y +  -53.271 * s,x +   37.825 * s,y +  -53.271 * s,x +   43.115 * s,y +  -51.562 * s,x +   47.607 * s,y +  -48.144 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   51.171 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 100:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   40.234 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   40.234 * s);
			_setf(o + ( 3 << 2), y +   -3.174 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   40.234 * s,y +   -3.174 * s,x +   39.225 * s,y +   -2.067 * s,x +   37.516 * s,y +   -1.099 * s,x +   35.107 * s,y +   -0.268 * s, threshold);
			_vr.bezier8(x +   35.107 * s,y +   -0.268 * s,x +   32.699 * s,y +    0.562 * s,x +   30.208 * s,y +    0.977 * s,x +   27.637 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   27.637 * s,y +    0.977 * s,x +   20.345 * s,y +    0.977 * s,x +   14.608 * s,y +   -1.335 * s,x +   10.425 * s,y +   -5.957 * s, threshold);
			_vr.bezier8(x +   10.425 * s,y +   -5.957 * s,x +    6.242 * s,y +  -10.579 * s,x +    4.151 * s,y +  -17.024 * s,x +    4.151 * s,y +  -25.293 * s, threshold);
			_vr.bezier8(x +    4.151 * s,y +  -25.293 * s,x +    4.151 * s,y +  -33.561 * s,x +    6.551 * s,y +  -40.291 * s,x +   11.353 * s,y +  -45.483 * s, threshold);
			_vr.bezier8(x +   11.353 * s,y +  -45.483 * s,x +   16.154 * s,y +  -50.675 * s,x +   22.168 * s,y +  -53.271 * s,x +   29.395 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   29.395 * s,y +  -53.271 * s,x +   33.366 * s,y +  -53.271 * s,x +   36.979 * s,y +  -52.457 * s,x +   40.234 * s,y +  -50.829 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   40.234 * s);
			_setf(o + ( 1 << 2), y +  -71.776 * s);
			_setf(o + ( 2 << 2), x +   52.441 * s);
			_setf(o + ( 3 << 2), y +  -74.706 * s);
			_setf(o + ( 4 << 2), x +   52.441 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   40.234 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   40.234 * s);
			_setf(o + ( 9 << 2), y +  -39.794 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 1);
			_vr.bezier8(x +   40.234 * s,y +  -39.794 * s,x +   37.630 * s,y +  -41.878 * s,x +   34.912 * s,y +  -42.919 * s,x +   32.080 * s,y +  -42.919 * s, threshold);
			_vr.bezier8(x +   32.080 * s,y +  -42.919 * s,x +   27.197 * s,y +  -42.919 * s,x +   23.438 * s,y +  -41.430 * s,x +   20.801 * s,y +  -38.452 * s, threshold);
			_vr.bezier8(x +   20.801 * s,y +  -38.452 * s,x +   18.164 * s,y +  -35.473 * s,x +   16.846 * s,y +  -31.201 * s,x +   16.846 * s,y +  -25.634 * s, threshold);
			_vr.bezier8(x +   16.846 * s,y +  -25.634 * s,x +   16.846 * s,y +  -14.762 * s,x +   22.087 * s,y +   -9.326 * s,x +   32.568 * s,y +   -9.326 * s, threshold);
			_vr.bezier8(x +   32.568 * s,y +   -9.326 * s,x +   33.740 * s,y +   -9.326 * s,x +   35.181 * s,y +   -9.676 * s,x +   36.890 * s,y +  -10.376 * s, threshold);
			_vr.bezier8(x +   36.890 * s,y +  -10.376 * s,x +   38.599 * s,y +  -11.076 * s,x +   39.713 * s,y +  -11.784 * s,x +   40.234 * s,y +  -12.500 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   40.234 * s);
			_setf(o + ( 1 << 2), y +  -39.794 * s);
			_setf(o + ( 2 << 2), x +   58.056 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 101:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   53.271 * s);
			_setf(o + ( 1 << 2), y +  -22.412 * s);
			_setf(o + ( 2 << 2), x +   15.918 * s);
			_setf(o + ( 3 << 2), y +  -22.412 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   15.918 * s,y +  -22.412 * s,x +   16.146 * s,y +  -18.245 * s,x +   17.578 * s,y +  -15.006 * s,x +   20.215 * s,y +  -12.695 * s, threshold);
			_vr.bezier8(x +   20.215 * s,y +  -12.695 * s,x +   22.851 * s,y +  -10.384 * s,x +   26.400 * s,y +   -9.228 * s,x +   30.859 * s,y +   -9.228 * s, threshold);
			_vr.bezier8(x +   30.859 * s,y +   -9.228 * s,x +   36.426 * s,y +   -9.228 * s,x +   40.657 * s,y +  -10.677 * s,x +   43.554 * s,y +  -13.574 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   48.290 * s);
			_setf(o + ( 1 << 2), y +   -4.248 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   48.290 * s,y +   -4.248 * s,x +   43.994 * s,y +   -0.765 * s,x +   37.581 * s,y +    0.977 * s,x +   29.052 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   29.052 * s,y +    0.977 * s,x +   21.078 * s,y +    0.977 * s,x +   14.770 * s,y +   -1.359 * s,x +   10.132 * s,y +   -6.030 * s, threshold);
			_vr.bezier8(x +   10.132 * s,y +   -6.030 * s,x +    5.493 * s,y +  -10.701 * s,x +    3.174 * s,y +  -17.220 * s,x +    3.174 * s,y +  -25.585 * s, threshold);
			_vr.bezier8(x +    3.174 * s,y +  -25.585 * s,x +    3.174 * s,y +  -33.821 * s,x +    5.721 * s,y +  -40.494 * s,x +   10.815 * s,y +  -45.605 * s, threshold);
			_vr.bezier8(x +   10.815 * s,y +  -45.605 * s,x +   15.910 * s,y +  -50.715 * s,x +   22.021 * s,y +  -53.271 * s,x +   29.150 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   29.150 * s,y +  -53.271 * s,x +   36.735 * s,y +  -53.271 * s,x +   42.822 * s,y +  -51.008 * s,x +   47.412 * s,y +  -46.484 * s, threshold);
			_vr.bezier8(x +   47.412 * s,y +  -46.484 * s,x +   52.001 * s,y +  -41.959 * s,x +   54.296 * s,y +  -36.197 * s,x +   54.296 * s,y +  -29.199 * s, threshold);
			_vr.bezier8(x +   54.296 * s,y +  -29.199 * s,x +   54.296 * s,y +  -27.701 * s,x +   53.954 * s,y +  -25.439 * s,x +   53.271 * s,y +  -22.412 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   16.357 * s);
			_setf(o + ( 1 << 2), y +  -31.591 * s);
			_setf(o + ( 2 << 2), x +   42.041 * s);
			_setf(o + ( 3 << 2), y +  -31.591 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   42.041 * s,y +  -31.591 * s,x +   41.194 * s,y +  -39.241 * s,x +   36.963 * s,y +  -43.066 * s,x +   29.345 * s,y +  -43.066 * s, threshold);
			_vr.bezier8(x +   29.345 * s,y +  -43.066 * s,x +   22.379 * s,y +  -43.066 * s,x +   18.050 * s,y +  -39.241 * s,x +   16.357 * s,y +  -31.591 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   57.470 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 102:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   35.742 * s);
			_setf(o + ( 1 << 2), y +  -62.548 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   35.742 * s,y +  -62.548 * s,x +   33.072 * s,y +  -63.427 * s,x +   31.022 * s,y +  -63.866 * s,x +   29.589 * s,y +  -63.866 * s, threshold);
			_vr.bezier8(x +   29.589 * s,y +  -63.866 * s,x +   27.278 * s,y +  -63.866 * s,x +   25.317 * s,y +  -62.873 * s,x +   23.706 * s,y +  -60.888 * s, threshold);
			_vr.bezier8(x +   23.706 * s,y +  -60.888 * s,x +   22.094 * s,y +  -58.902 * s,x +   21.289 * s,y +  -56.461 * s,x +   21.289 * s,y +  -53.564 * s, threshold);
			_vr.bezier8(x +   21.289 * s,y +  -53.564 * s,x +   21.289 * s,y +  -53.140 * s,x +   21.305 * s,y +  -52.717 * s,x +   21.338 * s,y +  -52.294 * s, threshold);
			o = _posf(18);
			_setf(o + ( 0 << 2), x +   32.177 * s);
			_setf(o + ( 1 << 2), y +  -52.294 * s);
			_setf(o + ( 2 << 2), x +   32.177 * s);
			_setf(o + ( 3 << 2), y +  -42.236 * s);
			_setf(o + ( 4 << 2), x +   21.533 * s);
			_setf(o + ( 5 << 2), y +  -42.236 * s);
			_setf(o + ( 6 << 2), x +   21.533 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    9.326 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +    9.326 * s);
			_setf(o + (11 << 2), y +  -42.236 * s);
			_setf(o + (12 << 2), x +    1.709 * s);
			_setf(o + (13 << 2), y +  -42.236 * s);
			_setf(o + (14 << 2), x +    1.709 * s);
			_setf(o + (15 << 2), y +  -52.294 * s);
			_setf(o + (16 << 2), x +    9.375 * s);
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
			_vr.bezier8(x +    9.375 * s,y +  -52.294 * s,x +    9.635 * s,y +  -58.707 * s,x +   11.531 * s,y +  -63.882 * s,x +   15.063 * s,y +  -67.821 * s, threshold);
			_vr.bezier8(x +   15.063 * s,y +  -67.821 * s,x +   18.595 * s,y +  -71.760 * s,x +   23.161 * s,y +  -73.729 * s,x +   28.759 * s,y +  -73.729 * s, threshold);
			_vr.bezier8(x +   28.759 * s,y +  -73.729 * s,x +   31.656 * s,y +  -73.729 * s,x +   35.188 * s,y +  -73.095 * s,x +   39.355 * s,y +  -71.825 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   35.742 * s);
			_setf(o + ( 1 << 2), y +  -62.548 * s);
			_setf(o + ( 2 << 2), x +   36.962 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 103:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    2.686 * s);
			_setf(o + ( 1 << 2), y +   13.428 * s);
			_setf(o + ( 2 << 2), x +   10.401 * s);
			_setf(o + ( 3 << 2), y +    3.906 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   10.401 * s,y +    3.906 * s,x +   14.665 * s,y +    7.812 * s,x +   19.417 * s,y +    9.766 * s,x +   24.658 * s,y +    9.766 * s, threshold);
			_vr.bezier8(x +   24.658 * s,y +    9.766 * s,x +   28.174 * s,y +    9.766 * s,x +   31.071 * s,y +    9.245 * s,x +   33.349 * s,y +    8.203 * s, threshold);
			_vr.bezier8(x +   33.349 * s,y +    8.203 * s,x +   35.628 * s,y +    7.161 * s,x +   36.767 * s,y +    5.729 * s,x +   36.767 * s,y +    3.906 * s, threshold);
			_vr.bezier8(x +   36.767 * s,y +    3.906 * s,x +   36.767 * s,y +    0.814 * s,x +   34.245 * s,y +   -0.732 * s,x +   29.199 * s,y +   -0.732 * s, threshold);
			_vr.bezier8(x +   29.199 * s,y +   -0.732 * s,x +   27.832 * s,y +   -0.732 * s,x +   25.797 * s,y +   -0.570 * s,x +   23.096 * s,y +   -0.244 * s, threshold);
			_vr.bezier8(x +   23.096 * s,y +   -0.244 * s,x +   20.394 * s,y +    0.081 * s,x +   18.359 * s,y +    0.244 * s,x +   16.992 * s,y +    0.244 * s, threshold);
			_vr.bezier8(x +   16.992 * s,y +    0.244 * s,x +    8.594 * s,y +    0.244 * s,x +    4.395 * s,y +   -2.767 * s,x +    4.395 * s,y +   -8.789 * s, threshold);
			_vr.bezier8(x +    4.395 * s,y +   -8.789 * s,x +    4.395 * s,y +  -10.514 * s,x +    5.095 * s,y +  -12.207 * s,x +    6.494 * s,y +  -13.867 * s, threshold);
			_vr.bezier8(x +    6.494 * s,y +  -13.867 * s,x +    7.894 * s,y +  -15.527 * s,x +    9.522 * s,y +  -16.748 * s,x +   11.377 * s,y +  -17.529 * s, threshold);
			_vr.bezier8(x +   11.377 * s,y +  -17.529 * s,x +    5.420 * s,y +  -21.403 * s,x +    2.442 * s,y +  -26.888 * s,x +    2.442 * s,y +  -33.984 * s, threshold);
			_vr.bezier8(x +    2.442 * s,y +  -33.984 * s,x +    2.442 * s,y +  -39.583 * s,x +    4.492 * s,y +  -44.213 * s,x +    8.594 * s,y +  -47.875 * s, threshold);
			_vr.bezier8(x +    8.594 * s,y +  -47.875 * s,x +   12.695 * s,y +  -51.537 * s,x +   17.741 * s,y +  -53.368 * s,x +   23.730 * s,y +  -53.368 * s, threshold);
			_vr.bezier8(x +   23.730 * s,y +  -53.368 * s,x +   28.418 * s,y +  -53.368 * s,x +   32.340 * s,y +  -52.489 * s,x +   35.498 * s,y +  -50.732 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   40.283 * s);
			_setf(o + ( 1 << 2), y +  -56.298 * s);
			_setf(o + ( 2 << 2), x +   48.730 * s);
			_setf(o + ( 3 << 2), y +  -48.632 * s);
			_setf(o + ( 4 << 2), x +   42.920 * s);
			_setf(o + ( 5 << 2), y +  -44.384 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   42.920 * s,y +  -44.384 * s,x +   44.938 * s,y +  -41.324 * s,x +   45.947 * s,y +  -37.711 * s,x +   45.947 * s,y +  -33.544 * s, threshold);
			_vr.bezier8(x +   45.947 * s,y +  -33.544 * s,x +   45.947 * s,y +  -27.587 * s,x +   44.132 * s,y +  -22.827 * s,x +   40.503 * s,y +  -19.262 * s, threshold);
			_vr.bezier8(x +   40.503 * s,y +  -19.262 * s,x +   36.873 * s,y +  -15.698 * s,x +   32.291 * s,y +  -13.916 * s,x +   26.758 * s,y +  -13.916 * s, threshold);
			_vr.bezier8(x +   26.758 * s,y +  -13.916 * s,x +   25.879 * s,y +  -13.916 * s,x +   24.700 * s,y +  -13.946 * s,x +   23.242 * s,y +  -14.160 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   21.240 * s);
			_setf(o + ( 1 << 2), y +  -14.453 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   21.240 * s,y +  -14.453 * s,x +   21.012 * s,y +  -14.453 * s,x +   20.142 * s,y +  -14.103 * s,x +   18.628 * s,y +  -13.403 * s, threshold);
			_vr.bezier8(x +   18.628 * s,y +  -13.403 * s,x +   17.114 * s,y +  -12.703 * s,x +   16.358 * s,y +  -11.979 * s,x +   16.358 * s,y +  -11.230 * s, threshold);
			_vr.bezier8(x +   16.358 * s,y +  -11.230 * s,x +   16.358 * s,y +   -9.928 * s,x +   17.480 * s,y +   -9.277 * s,x +   19.727 * s,y +   -9.277 * s, threshold);
			_vr.bezier8(x +   19.727 * s,y +   -9.277 * s,x +   20.736 * s,y +   -9.277 * s,x +   22.428 * s,y +   -9.521 * s,x +   24.805 * s,y +  -10.010 * s, threshold);
			_vr.bezier8(x +   24.805 * s,y +  -10.010 * s,x +   27.181 * s,y +  -10.498 * s,x +   29.215 * s,y +  -10.742 * s,x +   30.908 * s,y +  -10.742 * s, threshold);
			_vr.bezier8(x +   30.908 * s,y +  -10.742 * s,x +   42.789 * s,y +  -10.742 * s,x +   48.730 * s,y +   -5.973 * s,x +   48.730 * s,y +    3.564 * s, threshold);
			_vr.bezier8(x +   48.730 * s,y +    3.564 * s,x +   48.730 * s,y +    8.838 * s,x +   46.354 * s,y +   12.980 * s,x +   41.601 * s,y +   15.991 * s, threshold);
			_vr.bezier8(x +   41.601 * s,y +   15.991 * s,x +   36.849 * s,y +   19.002 * s,x +   31.120 * s,y +   20.508 * s,x +   24.414 * s,y +   20.508 * s, threshold);
			_vr.bezier8(x +   24.414 * s,y +   20.508 * s,x +   16.406 * s,y +   20.508 * s,x +    9.164 * s,y +   18.148 * s,x +    2.686 * s,y +   13.428 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   14.893 * s);
			_setf(o + ( 1 << 2), y +  -33.935 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   14.893 * s,y +  -33.935 * s,x +   14.893 * s,y +  -30.843 * s,x +   15.747 * s,y +  -28.361 * s,x +   17.456 * s,y +  -26.489 * s, threshold);
			_vr.bezier8(x +   17.456 * s,y +  -26.489 * s,x +   19.165 * s,y +  -24.617 * s,x +   21.468 * s,y +  -23.681 * s,x +   24.365 * s,y +  -23.681 * s, threshold);
			_vr.bezier8(x +   24.365 * s,y +  -23.681 * s,x +   27.262 * s,y +  -23.681 * s,x +   29.492 * s,y +  -24.593 * s,x +   31.055 * s,y +  -26.416 * s, threshold);
			_vr.bezier8(x +   31.055 * s,y +  -26.416 * s,x +   32.617 * s,y +  -28.238 * s,x +   33.398 * s,y +  -30.745 * s,x +   33.398 * s,y +  -33.935 * s, threshold);
			_vr.bezier8(x +   33.398 * s,y +  -33.935 * s,x +   33.398 * s,y +  -36.572 * s,x +   32.560 * s,y +  -38.801 * s,x +   30.884 * s,y +  -40.624 * s, threshold);
			_vr.bezier8(x +   30.884 * s,y +  -40.624 * s,x +   29.207 * s,y +  -42.447 * s,x +   27.034 * s,y +  -43.359 * s,x +   24.365 * s,y +  -43.359 * s, threshold);
			_vr.bezier8(x +   24.365 * s,y +  -43.359 * s,x +   21.566 * s,y +  -43.359 * s,x +   19.287 * s,y +  -42.480 * s,x +   17.529 * s,y +  -40.722 * s, threshold);
			_vr.bezier8(x +   17.529 * s,y +  -40.722 * s,x +   15.772 * s,y +  -38.964 * s,x +   14.893 * s,y +  -36.702 * s,x +   14.893 * s,y +  -33.935 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   50.195 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 104:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   40.429 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   40.429 * s);
			_setf(o + ( 3 << 2), y +  -32.226 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   40.429 * s,y +  -32.226 * s,x +   40.429 * s,y +  -35.449 * s,x +   39.420 * s,y +  -38.036 * s,x +   37.402 * s,y +  -39.990 * s, threshold);
			_vr.bezier8(x +   37.402 * s,y +  -39.990 * s,x +   35.383 * s,y +  -41.943 * s,x +   32.747 * s,y +  -42.919 * s,x +   29.492 * s,y +  -42.919 * s, threshold);
			_vr.bezier8(x +   29.492 * s,y +  -42.919 * s,x +   27.473 * s,y +  -42.919 * s,x +   25.439 * s,y +  -42.374 * s,x +   23.388 * s,y +  -41.283 * s, threshold);
			_vr.bezier8(x +   23.388 * s,y +  -41.283 * s,x +   21.337 * s,y +  -40.193 * s,x +   19.873 * s,y +  -38.948 * s,x +   18.994 * s,y +  -37.548 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   18.994 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    6.592 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    6.592 * s);
			_setf(o + ( 5 << 2), y +  -71.776 * s);
			_setf(o + ( 6 << 2), x +   18.994 * s);
			_setf(o + ( 7 << 2), y +  -74.706 * s);
			_setf(o + ( 8 << 2), x +   18.994 * s);
			_setf(o + ( 9 << 2), y +  -48.974 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   18.994 * s,y +  -48.974 * s,x +   22.151 * s,y +  -51.838 * s,x +   26.497 * s,y +  -53.271 * s,x +   32.031 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   32.031 * s,y +  -53.271 * s,x +   38.574 * s,y +  -53.271 * s,x +   43.652 * s,y +  -51.456 * s,x +   47.265 * s,y +  -47.826 * s, threshold);
			_vr.bezier8(x +   47.265 * s,y +  -47.826 * s,x +   50.878 * s,y +  -44.197 * s,x +   52.685 * s,y +  -38.997 * s,x +   52.685 * s,y +  -32.226 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   52.685 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   40.429 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   59.276 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 105:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   16.162 * s);
			_setf(o + ( 1 << 2), y +  -72.557 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   16.162 * s,y +  -72.557 * s,x +   18.115 * s,y +  -72.557 * s,x +   19.784 * s,y +  -71.866 * s,x +   21.167 * s,y +  -70.482 * s, threshold);
			_vr.bezier8(x +   21.167 * s,y +  -70.482 * s,x +   22.550 * s,y +  -69.099 * s,x +   23.242 * s,y +  -67.431 * s,x +   23.242 * s,y +  -65.477 * s, threshold);
			_vr.bezier8(x +   23.242 * s,y +  -65.477 * s,x +   23.242 * s,y +  -63.524 * s,x +   22.550 * s,y +  -61.856 * s,x +   21.167 * s,y +  -60.473 * s, threshold);
			_vr.bezier8(x +   21.167 * s,y +  -60.473 * s,x +   19.784 * s,y +  -59.089 * s,x +   18.115 * s,y +  -58.397 * s,x +   16.162 * s,y +  -58.397 * s, threshold);
			_vr.bezier8(x +   16.162 * s,y +  -58.397 * s,x +   14.209 * s,y +  -58.397 * s,x +   12.541 * s,y +  -59.089 * s,x +   11.157 * s,y +  -60.473 * s, threshold);
			_vr.bezier8(x +   11.157 * s,y +  -60.473 * s,x +    9.774 * s,y +  -61.856 * s,x +    9.082 * s,y +  -63.524 * s,x +    9.082 * s,y +  -65.477 * s, threshold);
			_vr.bezier8(x +    9.082 * s,y +  -65.477 * s,x +    9.082 * s,y +  -67.431 * s,x +    9.774 * s,y +  -69.099 * s,x +   11.157 * s,y +  -70.482 * s, threshold);
			_vr.bezier8(x +   11.157 * s,y +  -70.482 * s,x +   12.541 * s,y +  -71.866 * s,x +   14.209 * s,y +  -72.557 * s,x +   16.162 * s,y +  -72.557 * s, threshold);
			o = _posf(16);
			_setf(o + ( 0 << 2), x +    9.863 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    9.863 * s);
			_setf(o + ( 3 << 2), y +  -42.284 * s);
			_setf(o + ( 4 << 2), x +    3.174 * s);
			_setf(o + ( 5 << 2), y +  -42.284 * s);
			_setf(o + ( 6 << 2), x +    3.174 * s);
			_setf(o + ( 7 << 2), y +  -52.294 * s);
			_setf(o + ( 8 << 2), x +   22.217 * s);
			_setf(o + ( 9 << 2), y +  -52.294 * s);
			_setf(o + (10 << 2), x +   22.217 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    9.863 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   29.834 * s);
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
			_setf(o + ( 0 << 2), x +   21.777 * s);
			_setf(o + ( 1 << 2), y +  -72.557 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   21.777 * s,y +  -72.557 * s,x +   23.730 * s,y +  -72.557 * s,x +   25.398 * s,y +  -71.866 * s,x +   26.782 * s,y +  -70.482 * s, threshold);
			_vr.bezier8(x +   26.782 * s,y +  -70.482 * s,x +   28.165 * s,y +  -69.099 * s,x +   28.857 * s,y +  -67.431 * s,x +   28.857 * s,y +  -65.477 * s, threshold);
			_vr.bezier8(x +   28.857 * s,y +  -65.477 * s,x +   28.857 * s,y +  -63.524 * s,x +   28.165 * s,y +  -61.856 * s,x +   26.782 * s,y +  -60.473 * s, threshold);
			_vr.bezier8(x +   26.782 * s,y +  -60.473 * s,x +   25.398 * s,y +  -59.089 * s,x +   23.730 * s,y +  -58.397 * s,x +   21.777 * s,y +  -58.397 * s, threshold);
			_vr.bezier8(x +   21.777 * s,y +  -58.397 * s,x +   19.824 * s,y +  -58.397 * s,x +   18.155 * s,y +  -59.089 * s,x +   16.772 * s,y +  -60.473 * s, threshold);
			_vr.bezier8(x +   16.772 * s,y +  -60.473 * s,x +   15.389 * s,y +  -61.856 * s,x +   14.697 * s,y +  -63.524 * s,x +   14.697 * s,y +  -65.477 * s, threshold);
			_vr.bezier8(x +   14.697 * s,y +  -65.477 * s,x +   14.697 * s,y +  -67.431 * s,x +   15.389 * s,y +  -69.099 * s,x +   16.772 * s,y +  -70.482 * s, threshold);
			_vr.bezier8(x +   16.772 * s,y +  -70.482 * s,x +   18.155 * s,y +  -71.866 * s,x +   19.824 * s,y +  -72.557 * s,x +   21.777 * s,y +  -72.557 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   -0.586 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			_setf(o + ( 2 << 2), x +   -0.586 * s);
			_setf(o + ( 3 << 2), y +    9.619 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   -0.586 * s,y +    9.619 * s,x +    5.924 * s,y +    9.619 * s,x +   10.327 * s,y +    8.846 * s,x +   12.622 * s,y +    7.300 * s, threshold);
			_vr.bezier8(x +   12.622 * s,y +    7.300 * s,x +   14.917 * s,y +    5.754 * s,x +   16.064 * s,y +    2.978 * s,x +   16.064 * s,y +   -1.025 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   16.064 * s);
			_setf(o + ( 1 << 2), y +  -42.236 * s);
			_setf(o + ( 2 << 2), x +    6.640 * s);
			_setf(o + ( 3 << 2), y +  -42.236 * s);
			_setf(o + ( 4 << 2), x +    6.640 * s);
			_setf(o + ( 5 << 2), y +  -52.294 * s);
			_setf(o + ( 6 << 2), x +   28.271 * s);
			_setf(o + ( 7 << 2), y +  -52.294 * s);
			_setf(o + ( 8 << 2), x +   28.271 * s);
			_setf(o + ( 9 << 2), y +   -1.221 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   28.271 * s,y +   -1.221 * s,x +   28.271 * s,y +    6.266 * s,x +   25.919 * s,y +   11.759 * s,x +   21.215 * s,y +   15.259 * s, threshold);
			_vr.bezier8(x +   21.215 * s,y +   15.259 * s,x +   16.512 * s,y +   18.758 * s,x +    9.244 * s,y +   20.508 * s,x +   -0.586 * s,y +   20.508 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.669 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 107:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   40.039 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   24.658 * s);
			_setf(o + ( 3 << 2), y +  -23.681 * s);
			_setf(o + ( 4 << 2), x +   18.799 * s);
			_setf(o + ( 5 << 2), y +  -17.480 * s);
			_setf(o + ( 6 << 2), x +   18.799 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    6.592 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +    6.592 * s);
			_setf(o + (11 << 2), y +  -71.776 * s);
			_setf(o + (12 << 2), x +   18.799 * s);
			_setf(o + (13 << 2), y +  -74.706 * s);
			_setf(o + (14 << 2), x +   18.799 * s);
			_setf(o + (15 << 2), y +  -32.226 * s);
			_setf(o + (16 << 2), x +   36.230 * s);
			_setf(o + (17 << 2), y +  -52.294 * s);
			_setf(o + (18 << 2), x +   50.927 * s);
			_setf(o + (19 << 2), y +  -52.294 * s);
			_setf(o + (20 << 2), x +   33.252 * s);
			_setf(o + (21 << 2), y +  -32.470 * s);
			_setf(o + (22 << 2), x +   54.540 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   40.039 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   54.785 * s);
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
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    8.691 * s);
			_setf(o + ( 1 << 2), y +  -71.776 * s);
			_setf(o + ( 2 << 2), x +   20.898 * s);
			_setf(o + ( 3 << 2), y +  -74.706 * s);
			_setf(o + ( 4 << 2), x +   20.898 * s);
			_setf(o + ( 5 << 2), y +  -15.918 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   20.898 * s,y +  -15.918 * s,x +   20.898 * s,y +   -9.472 * s,x +   22.818 * s,y +   -5.631 * s,x +   26.659 * s,y +   -4.395 * s, threshold);
			_vr.bezier8(x +   26.659 * s,y +   -4.395 * s,x +   24.771 * s,y +   -0.814 * s,x +   21.549 * s,y +    0.977 * s,x +   16.991 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   16.991 * s,y +    0.977 * s,x +   11.458 * s,y +    0.977 * s,x +    8.691 * s,y +   -2.865 * s,x +    8.691 * s,y +  -10.547 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    8.691 * s);
			_setf(o + ( 1 << 2), y +  -71.776 * s);
			_setf(o + ( 2 << 2), x +   29.491 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 109:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   67.138 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   67.138 * s);
			_setf(o + ( 3 << 2), y +  -32.763 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   67.138 * s,y +  -32.763 * s,x +   67.138 * s,y +  -39.631 * s,x +   64.062 * s,y +  -43.066 * s,x +   57.909 * s,y +  -43.066 * s, threshold);
			_vr.bezier8(x +   57.909 * s,y +  -43.066 * s,x +   56.086 * s,y +  -43.066 * s,x +   54.329 * s,y +  -42.529 * s,x +   52.636 * s,y +  -41.454 * s, threshold);
			_vr.bezier8(x +   52.636 * s,y +  -41.454 * s,x +   50.943 * s,y +  -40.380 * s,x +   49.755 * s,y +  -39.143 * s,x +   49.071 * s,y +  -37.744 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   49.071 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   36.865 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   36.865 * s);
			_setf(o + ( 5 << 2), y +  -34.667 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   36.865 * s,y +  -34.667 * s,x +   36.865 * s,y +  -37.239 * s,x +   36.067 * s,y +  -39.282 * s,x +   34.472 * s,y +  -40.795 * s, threshold);
			_vr.bezier8(x +   34.472 * s,y +  -40.795 * s,x +   32.877 * s,y +  -42.309 * s,x +   30.631 * s,y +  -43.066 * s,x +   27.734 * s,y +  -43.066 * s, threshold);
			_vr.bezier8(x +   27.734 * s,y +  -43.066 * s,x +   26.204 * s,y +  -43.066 * s,x +   24.536 * s,y +  -42.496 * s,x +   22.729 * s,y +  -41.357 * s, threshold);
			_vr.bezier8(x +   22.729 * s,y +  -41.357 * s,x +   20.922 * s,y +  -40.217 * s,x +   19.612 * s,y +  -38.964 * s,x +   18.798 * s,y +  -37.597 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   18.798 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    6.592 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    6.592 * s);
			_setf(o + ( 5 << 2), y +  -52.294 * s);
			_setf(o + ( 6 << 2), x +   14.990 * s);
			_setf(o + ( 7 << 2), y +  -52.294 * s);
			_setf(o + ( 8 << 2), x +   17.480 * s);
			_setf(o + ( 9 << 2), y +  -47.704 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   17.480 * s,y +  -47.704 * s,x +   20.866 * s,y +  -51.415 * s,x +   25.244 * s,y +  -53.271 * s,x +   30.615 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   30.615 * s,y +  -53.271 * s,x +   37.548 * s,y +  -53.271 * s,x +   42.773 * s,y +  -51.383 * s,x +   46.288 * s,y +  -47.607 * s, threshold);
			_vr.bezier8(x +   46.288 * s,y +  -47.607 * s,x +   47.818 * s,y +  -49.332 * s,x +   49.950 * s,y +  -50.707 * s,x +   52.685 * s,y +  -51.733 * s, threshold);
			_vr.bezier8(x +   52.685 * s,y +  -51.733 * s,x +   55.419 * s,y +  -52.758 * s,x +   58.153 * s,y +  -53.271 * s,x +   60.888 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   60.888 * s,y +  -53.271 * s,x +   66.714 * s,y +  -53.271 * s,x +   71.247 * s,y +  -51.602 * s,x +   74.486 * s,y +  -48.266 * s, threshold);
			_vr.bezier8(x +   74.486 * s,y +  -48.266 * s,x +   77.725 * s,y +  -44.929 * s,x +   79.344 * s,y +  -40.347 * s,x +   79.344 * s,y +  -34.521 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   79.344 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   67.138 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   85.936 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 110:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   40.234 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   40.234 * s);
			_setf(o + ( 3 << 2), y +  -30.224 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   40.234 * s,y +  -30.224 * s,x +   40.234 * s,y +  -34.683 * s,x +   39.379 * s,y +  -37.939 * s,x +   37.671 * s,y +  -39.990 * s, threshold);
			_vr.bezier8(x +   37.671 * s,y +  -39.990 * s,x +   35.962 * s,y +  -42.040 * s,x +   33.170 * s,y +  -43.066 * s,x +   29.297 * s,y +  -43.066 * s, threshold);
			_vr.bezier8(x +   29.297 * s,y +  -43.066 * s,x +   27.506 * s,y +  -43.066 * s,x +   25.594 * s,y +  -42.561 * s,x +   23.559 * s,y +  -41.552 * s, threshold);
			_vr.bezier8(x +   23.559 * s,y +  -41.552 * s,x +   21.525 * s,y +  -40.543 * s,x +   19.938 * s,y +  -39.290 * s,x +   18.799 * s,y +  -37.792 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   18.799 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    6.592 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    6.592 * s);
			_setf(o + ( 5 << 2), y +  -52.294 * s);
			_setf(o + ( 6 << 2), x +   15.381 * s);
			_setf(o + ( 7 << 2), y +  -52.294 * s);
			_setf(o + ( 8 << 2), x +   17.627 * s);
			_setf(o + ( 9 << 2), y +  -47.411 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   17.627 * s,y +  -47.411 * s,x +   20.947 * s,y +  -51.318 * s,x +   25.846 * s,y +  -53.271 * s,x +   32.324 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   32.324 * s,y +  -53.271 * s,x +   38.541 * s,y +  -53.271 * s,x +   43.448 * s,y +  -51.407 * s,x +   47.045 * s,y +  -47.680 * s, threshold);
			_vr.bezier8(x +   47.045 * s,y +  -47.680 * s,x +   50.642 * s,y +  -43.953 * s,x +   52.441 * s,y +  -38.753 * s,x +   52.441 * s,y +  -32.080 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   52.441 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   40.234 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   59.032 * s);
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
			_vr.bezier8(x +    3.174 * s,y +  -26.269 * s,x +    3.174 * s,y +  -34.244 * s,x +    5.477 * s,y +  -40.738 * s,x +   10.083 * s,y +  -45.751 * s, threshold);
			_vr.bezier8(x +   10.083 * s,y +  -45.751 * s,x +   14.689 * s,y +  -50.764 * s,x +   20.768 * s,y +  -53.271 * s,x +   28.320 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   28.320 * s,y +  -53.271 * s,x +   36.263 * s,y +  -53.271 * s,x +   42.431 * s,y +  -50.862 * s,x +   46.826 * s,y +  -46.044 * s, threshold);
			_vr.bezier8(x +   46.826 * s,y +  -46.044 * s,x +   51.220 * s,y +  -41.227 * s,x +   53.418 * s,y +  -34.635 * s,x +   53.418 * s,y +  -26.269 * s, threshold);
			_vr.bezier8(x +   53.418 * s,y +  -26.269 * s,x +   53.418 * s,y +  -17.936 * s,x +   51.180 * s,y +  -11.312 * s,x +   46.704 * s,y +   -6.396 * s, threshold);
			_vr.bezier8(x +   46.704 * s,y +   -6.396 * s,x +   42.228 * s,y +   -1.481 * s,x +   36.100 * s,y +    0.977 * s,x +   28.320 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   28.320 * s,y +    0.977 * s,x +   20.378 * s,y +    0.977 * s,x +   14.201 * s,y +   -1.505 * s,x +    9.790 * s,y +   -6.470 * s, threshold);
			_vr.bezier8(x +    9.790 * s,y +   -6.470 * s,x +    5.380 * s,y +  -11.434 * s,x +    3.174 * s,y +  -18.034 * s,x +    3.174 * s,y +  -26.269 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   15.869 * s);
			_setf(o + ( 1 << 2), y +  -26.269 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   15.869 * s,y +  -26.269 * s,x +   15.869 * s,y +  -14.746 * s,x +   20.020 * s,y +   -8.984 * s,x +   28.320 * s,y +   -8.984 * s, threshold);
			_vr.bezier8(x +   28.320 * s,y +   -8.984 * s,x +   32.129 * s,y +   -8.984 * s,x +   35.148 * s,y +  -10.482 * s,x +   37.378 * s,y +  -13.476 * s, threshold);
			_vr.bezier8(x +   37.378 * s,y +  -13.476 * s,x +   39.608 * s,y +  -16.471 * s,x +   40.723 * s,y +  -20.736 * s,x +   40.723 * s,y +  -26.269 * s, threshold);
			_vr.bezier8(x +   40.723 * s,y +  -26.269 * s,x +   40.723 * s,y +  -37.629 * s,x +   36.588 * s,y +  -43.310 * s,x +   28.320 * s,y +  -43.310 * s, threshold);
			_vr.bezier8(x +   28.320 * s,y +  -43.310 * s,x +   24.512 * s,y +  -43.310 * s,x +   21.484 * s,y +  -41.812 * s,x +   19.238 * s,y +  -38.818 * s, threshold);
			_vr.bezier8(x +   19.238 * s,y +  -38.818 * s,x +   16.992 * s,y +  -35.823 * s,x +   15.869 * s,y +  -31.640 * s,x +   15.869 * s,y +  -26.269 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   56.591 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 112:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   17.822 * s);
			_setf(o + ( 1 << 2), y +   -1.318 * s);
			_setf(o + ( 2 << 2), x +   17.822 * s);
			_setf(o + ( 3 << 2), y +   20.508 * s);
			_setf(o + ( 4 << 2), x +    5.616 * s);
			_setf(o + ( 5 << 2), y +   20.508 * s);
			_setf(o + ( 6 << 2), x +    5.616 * s);
			_setf(o + ( 7 << 2), y +  -52.294 * s);
			_setf(o + ( 8 << 2), x +   17.822 * s);
			_setf(o + ( 9 << 2), y +  -52.294 * s);
			_setf(o + (10 << 2), x +   17.822 * s);
			_setf(o + (11 << 2), y +  -48.779 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_vr.bezier8(x +   17.822 * s,y +  -48.779 * s,x +   20.882 * s,y +  -51.773 * s,x +   24.642 * s,y +  -53.271 * s,x +   29.102 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   29.102 * s,y +  -53.271 * s,x +   45.768 * s,y +  -53.271 * s,x +   54.101 * s,y +  -44.092 * s,x +   54.101 * s,y +  -25.732 * s, threshold);
			_vr.bezier8(x +   54.101 * s,y +  -25.732 * s,x +   54.101 * s,y +  -17.171 * s,x +   51.798 * s,y +  -10.579 * s,x +   47.192 * s,y +   -5.957 * s, threshold);
			_vr.bezier8(x +   47.192 * s,y +   -5.957 * s,x +   42.586 * s,y +   -1.335 * s,x +   36.295 * s,y +    0.977 * s,x +   28.320 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   28.320 * s,y +    0.977 * s,x +   24.479 * s,y +    0.977 * s,x +   20.980 * s,y +    0.212 * s,x +   17.822 * s,y +   -1.318 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   17.822 * s);
			_setf(o + ( 1 << 2), y +  -39.501 * s);
			_setf(o + ( 2 << 2), x +   17.822 * s);
			_setf(o + ( 3 << 2), y +  -12.012 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   17.822 * s,y +  -12.012 * s,x +   20.036 * s,y +  -10.221 * s,x +   22.624 * s,y +   -9.326 * s,x +   25.586 * s,y +   -9.326 * s, threshold);
			_vr.bezier8(x +   25.586 * s,y +   -9.326 * s,x +   31.217 * s,y +   -9.326 * s,x +   35.262 * s,y +  -10.669 * s,x +   37.720 * s,y +  -13.354 * s, threshold);
			_vr.bezier8(x +   37.720 * s,y +  -13.354 * s,x +   40.177 * s,y +  -16.040 * s,x +   41.406 * s,y +  -20.280 * s,x +   41.406 * s,y +  -26.074 * s, threshold);
			_vr.bezier8(x +   41.406 * s,y +  -26.074 * s,x +   41.406 * s,y +  -32.259 * s,x +   40.185 * s,y +  -36.612 * s,x +   37.744 * s,y +  -39.135 * s, threshold);
			_vr.bezier8(x +   37.744 * s,y +  -39.135 * s,x +   35.303 * s,y +  -41.658 * s,x +   31.266 * s,y +  -42.919 * s,x +   25.635 * s,y +  -42.919 * s, threshold);
			_vr.bezier8(x +   25.635 * s,y +  -42.919 * s,x +   22.705 * s,y +  -42.919 * s,x +   20.101 * s,y +  -41.780 * s,x +   17.822 * s,y +  -39.501 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.251 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 113:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   40.576 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			_setf(o + ( 2 << 2), x +   40.576 * s);
			_setf(o + ( 3 << 2), y +   -1.465 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   40.576 * s,y +   -1.465 * s,x +   37.646 * s,y +    0.163 * s,x +   33.610 * s,y +    0.977 * s,x +   28.467 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   28.467 * s,y +    0.977 * s,x +   20.850 * s,y +    0.977 * s,x +   14.893 * s,y +   -1.343 * s,x +   10.596 * s,y +   -5.981 * s, threshold);
			_vr.bezier8(x +   10.596 * s,y +   -5.981 * s,x +    6.299 * s,y +  -10.620 * s,x +    4.151 * s,y +  -17.171 * s,x +    4.151 * s,y +  -25.634 * s, threshold);
			_vr.bezier8(x +    4.151 * s,y +  -25.634 * s,x +    4.151 * s,y +  -34.065 * s,x +    6.617 * s,y +  -40.779 * s,x +   11.548 * s,y +  -45.776 * s, threshold);
			_vr.bezier8(x +   11.548 * s,y +  -45.776 * s,x +   16.480 * s,y +  -50.772 * s,x +   22.786 * s,y +  -53.271 * s,x +   30.469 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   30.469 * s,y +  -53.271 * s,x +   35.026 * s,y +  -53.271 * s,x +   39.160 * s,y +  -51.904 * s,x +   42.871 * s,y +  -49.169 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   44.873 * s);
			_setf(o + ( 1 << 2), y +  -52.294 * s);
			_setf(o + ( 2 << 2), x +   52.783 * s);
			_setf(o + ( 3 << 2), y +  -52.294 * s);
			_setf(o + ( 4 << 2), x +   52.783 * s);
			_setf(o + ( 5 << 2), y +   20.508 * s);
			_setf(o + ( 6 << 2), x +   40.576 * s);
			_setf(o + ( 7 << 2), y +   20.508 * s);
			_setf(o + ( 8 << 2), x +   40.576 * s);
			_setf(o + ( 9 << 2), y +  -39.892 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 1);
			_vr.bezier8(x +   40.576 * s,y +  -39.892 * s,x +   38.395 * s,y +  -41.910 * s,x +   35.547 * s,y +  -42.919 * s,x +   32.031 * s,y +  -42.919 * s, threshold);
			_vr.bezier8(x +   32.031 * s,y +  -42.919 * s,x +   27.279 * s,y +  -42.919 * s,x +   23.560 * s,y +  -41.349 * s,x +   20.874 * s,y +  -38.207 * s, threshold);
			_vr.bezier8(x +   20.874 * s,y +  -38.207 * s,x +   18.189 * s,y +  -35.066 * s,x +   16.846 * s,y +  -30.875 * s,x +   16.846 * s,y +  -25.634 * s, threshold);
			_vr.bezier8(x +   16.846 * s,y +  -25.634 * s,x +   16.846 * s,y +  -14.763 * s,x +   21.777 * s,y +   -9.326 * s,x +   31.641 * s,y +   -9.326 * s, threshold);
			_vr.bezier8(x +   31.641 * s,y +   -9.326 * s,x +   35.254 * s,y +   -9.326 * s,x +   38.232 * s,y +  -10.172 * s,x +   40.576 * s,y +  -11.865 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   40.576 * s);
			_setf(o + ( 1 << 2), y +  -39.892 * s);
			_setf(o + ( 2 << 2), x +   58.398 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 114:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.816 * s);
			_setf(o + ( 1 << 2), y +  -40.917 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   36.816 * s,y +  -40.917 * s,x +   34.635 * s,y +  -42.350 * s,x +   32.242 * s,y +  -43.066 * s,x +   29.638 * s,y +  -43.066 * s, threshold);
			_vr.bezier8(x +   29.638 * s,y +  -43.066 * s,x +   26.806 * s,y +  -43.066 * s,x +   24.292 * s,y +  -41.780 * s,x +   22.094 * s,y +  -39.208 * s, threshold);
			_vr.bezier8(x +   22.094 * s,y +  -39.208 * s,x +   19.897 * s,y +  -36.637 * s,x +   18.799 * s,y +  -33.496 * s,x +   18.799 * s,y +  -29.785 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   18.799 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    6.592 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    6.592 * s);
			_setf(o + ( 5 << 2), y +  -52.294 * s);
			_setf(o + ( 6 << 2), x +   18.799 * s);
			_setf(o + ( 7 << 2), y +  -52.294 * s);
			_setf(o + ( 8 << 2), x +   18.799 * s);
			_setf(o + ( 9 << 2), y +  -47.509 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   18.799 * s,y +  -47.509 * s,x +   22.216 * s,y +  -51.350 * s,x +   26.757 * s,y +  -53.271 * s,x +   32.421 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   32.421 * s,y +  -53.271 * s,x +   36.588 * s,y +  -53.271 * s,x +   39.778 * s,y +  -52.636 * s,x +   41.992 * s,y +  -51.366 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   36.816 * s);
			_setf(o + ( 1 << 2), y +  -40.917 * s);
			_setf(o + ( 2 << 2), x +   42.724 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 115:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    3.369 * s);
			_setf(o + ( 1 << 2), y +   -3.369 * s);
			_setf(o + ( 2 << 2), x +    7.715 * s);
			_setf(o + ( 3 << 2), y +  -13.086 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +    7.715 * s,y +  -13.086 * s,x +   11.360 * s,y +  -10.189 * s,x +   15.478 * s,y +   -8.740 * s,x +   20.068 * s,y +   -8.740 * s, threshold);
			_vr.bezier8(x +   20.068 * s,y +   -8.740 * s,x +   24.820 * s,y +   -8.740 * s,x +   27.197 * s,y +  -10.433 * s,x +   27.197 * s,y +  -13.818 * s, threshold);
			_vr.bezier8(x +   27.197 * s,y +  -13.818 * s,x +   27.197 * s,y +  -15.804 * s,x +   26.481 * s,y +  -17.431 * s,x +   25.048 * s,y +  -18.701 * s, threshold);
			_vr.bezier8(x +   25.048 * s,y +  -18.701 * s,x +   23.616 * s,y +  -19.970 * s,x +   20.835 * s,y +  -21.473 * s,x +   16.699 * s,y +  -23.193 * s, threshold);
			_vr.bezier8(x +   16.699 * s,y +  -23.193 * s,x +    7.685 * s,y +  -26.941 * s,x +    3.174 * s,y +  -32.177 * s,x +    3.174 * s,y +  -38.915 * s, threshold);
			_vr.bezier8(x +    3.174 * s,y +  -38.915 * s,x +    3.174 * s,y +  -43.440 * s,x +    4.899 * s,y +  -46.964 * s,x +    8.349 * s,y +  -49.487 * s, threshold);
			_vr.bezier8(x +    8.349 * s,y +  -49.487 * s,x +   11.800 * s,y +  -52.009 * s,x +   16.210 * s,y +  -53.271 * s,x +   21.582 * s,y +  -53.271 * s, threshold);
			_vr.bezier8(x +   21.582 * s,y +  -53.271 * s,x +   27.018 * s,y +  -53.271 * s,x +   32.128 * s,y +  -52.050 * s,x +   36.913 * s,y +  -49.609 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   33.398 * s);
			_setf(o + ( 1 << 2), y +  -40.136 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   33.398 * s,y +  -40.136 * s,x +   30.729 * s,y +  -42.415 * s,x +   27.018 * s,y +  -43.554 * s,x +   22.265 * s,y +  -43.554 * s, threshold);
			_vr.bezier8(x +   22.265 * s,y +  -43.554 * s,x +   18.001 * s,y +  -43.554 * s,x +   15.869 * s,y +  -41.861 * s,x +   15.869 * s,y +  -38.476 * s, threshold);
			_vr.bezier8(x +   15.869 * s,y +  -38.476 * s,x +   15.869 * s,y +  -37.141 * s,x +   16.569 * s,y +  -35.937 * s,x +   17.968 * s,y +  -34.863 * s, threshold);
			_vr.bezier8(x +   17.968 * s,y +  -34.863 * s,x +   19.368 * s,y +  -33.789 * s,x +   22.363 * s,y +  -32.348 * s,x +   26.953 * s,y +  -30.542 * s, threshold);
			_vr.bezier8(x +   26.953 * s,y +  -30.542 * s,x +   31.542 * s,y +  -28.735 * s,x +   34.846 * s,y +  -26.546 * s,x +   36.865 * s,y +  -23.974 * s, threshold);
			_vr.bezier8(x +   36.865 * s,y +  -23.974 * s,x +   38.883 * s,y +  -21.403 * s,x +   39.892 * s,y +  -18.294 * s,x +   39.892 * s,y +  -14.648 * s, threshold);
			_vr.bezier8(x +   39.892 * s,y +  -14.648 * s,x +   39.892 * s,y +   -9.798 * s,x +   38.093 * s,y +   -5.981 * s,x +   34.496 * s,y +   -3.198 * s, threshold);
			_vr.bezier8(x +   34.496 * s,y +   -3.198 * s,x +   30.900 * s,y +   -0.415 * s,x +   26.009 * s,y +    0.977 * s,x +   19.824 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   19.824 * s,y +    0.977 * s,x +   16.341 * s,y +    0.977 * s,x +   13.550 * s,y +    0.692 * s,x +   11.450 * s,y +    0.122 * s, threshold);
			_vr.bezier8(x +   11.450 * s,y +    0.122 * s,x +    9.350 * s,y +   -0.448 * s,x +    6.657 * s,y +   -1.611 * s,x +    3.369 * s,y +   -3.369 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   43.066 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 116:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +    8.447 * s);
			_setf(o + ( 1 << 2), y +  -42.480 * s);
			_setf(o + ( 2 << 2), x +    2.392 * s);
			_setf(o + ( 3 << 2), y +  -42.480 * s);
			_setf(o + ( 4 << 2), x +    2.392 * s);
			_setf(o + ( 5 << 2), y +  -52.294 * s);
			_setf(o + ( 6 << 2), x +    8.447 * s);
			_setf(o + ( 7 << 2), y +  -52.294 * s);
			_setf(o + ( 8 << 2), x +    8.447 * s);
			_setf(o + ( 9 << 2), y +  -62.938 * s);
			_setf(o + (10 << 2), x +   20.654 * s);
			_setf(o + (11 << 2), y +  -67.431 * s);
			_setf(o + (12 << 2), x +   20.654 * s);
			_setf(o + (13 << 2), y +  -52.294 * s);
			_setf(o + (14 << 2), x +   35.009 * s);
			_setf(o + (15 << 2), y +  -52.294 * s);
			_setf(o + (16 << 2), x +   35.009 * s);
			_setf(o + (17 << 2), y +  -42.480 * s);
			_setf(o + (18 << 2), x +   20.654 * s);
			_setf(o + (19 << 2), y +  -42.480 * s);
			_setf(o + (20 << 2), x +   20.654 * s);
			_setf(o + (21 << 2), y +  -19.580 * s);
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
			_vr.bezier8(x +   20.654 * s,y +  -19.580 * s,x +   20.654 * s,y +  -15.836 * s,x +   21.240 * s,y +  -13.192 * s,x +   22.411 * s,y +  -11.645 * s, threshold);
			_vr.bezier8(x +   22.411 * s,y +  -11.645 * s,x +   23.583 * s,y +  -10.099 * s,x +   25.634 * s,y +   -9.326 * s,x +   28.564 * s,y +   -9.326 * s, threshold);
			_vr.bezier8(x +   28.564 * s,y +   -9.326 * s,x +   31.493 * s,y +   -9.326 * s,x +   34.228 * s,y +  -10.124 * s,x +   36.767 * s,y +  -11.719 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.767 * s);
			_setf(o + ( 1 << 2), y +   -0.488 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   36.767 * s,y +   -0.488 * s,x +   33.935 * s,y +    0.488 * s,x +   29.898 * s,y +    0.977 * s,x +   24.658 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   24.658 * s,y +    0.977 * s,x +   19.449 * s,y +    0.977 * s,x +   15.445 * s,y +   -0.496 * s,x +   12.646 * s,y +   -3.442 * s, threshold);
			_vr.bezier8(x +   12.646 * s,y +   -3.442 * s,x +    9.847 * s,y +   -6.388 * s,x +    8.447 * s,y +  -10.580 * s,x +    8.447 * s,y +  -16.015 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    8.447 * s);
			_setf(o + ( 1 << 2), y +  -42.480 * s);
			_setf(o + ( 2 << 2), x +   39.648 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 117:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   40.282 * s);
			_setf(o + ( 1 << 2), y +    0.049 * s);
			_setf(o + ( 2 << 2), x +   40.282 * s);
			_setf(o + ( 3 << 2), y +   -4.346 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   40.282 * s,y +   -4.346 * s,x +   38.557 * s,y +   -2.881 * s,x +   36.181 * s,y +   -1.628 * s,x +   33.153 * s,y +   -0.586 * s, threshold);
			_vr.bezier8(x +   33.153 * s,y +   -0.586 * s,x +   30.126 * s,y +    0.456 * s,x +   27.343 * s,y +    0.977 * s,x +   24.804 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   24.804 * s,y +    0.977 * s,x +   12.662 * s,y +    0.977 * s,x +    6.591 * s,y +   -5.469 * s,x +    6.591 * s,y +  -18.359 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    6.591 * s);
			_setf(o + ( 1 << 2), y +  -52.294 * s);
			_setf(o + ( 2 << 2), x +   18.798 * s);
			_setf(o + ( 3 << 2), y +  -52.294 * s);
			_setf(o + ( 4 << 2), x +   18.798 * s);
			_setf(o + ( 5 << 2), y +  -19.287 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   18.798 * s,y +  -19.287 * s,x +   18.798 * s,y +  -12.581 * s,x +   21.809 * s,y +   -9.228 * s,x +   27.831 * s,y +   -9.228 * s, threshold);
			_vr.bezier8(x +   27.831 * s,y +   -9.228 * s,x +   30.598 * s,y +   -9.228 * s,x +   33.170 * s,y +   -9.944 * s,x +   35.546 * s,y +  -11.377 * s, threshold);
			_vr.bezier8(x +   35.546 * s,y +  -11.377 * s,x +   37.922 * s,y +  -12.809 * s,x +   39.501 * s,y +  -14.469 * s,x +   40.282 * s,y +  -16.357 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   40.282 * s);
			_setf(o + ( 1 << 2), y +  -52.294 * s);
			_setf(o + ( 2 << 2), x +   52.489 * s);
			_setf(o + ( 3 << 2), y +  -52.294 * s);
			_setf(o + ( 4 << 2), x +   52.489 * s);
			_setf(o + ( 5 << 2), y +    0.049 * s);
			_setf(o + ( 6 << 2), x +   40.282 * s);
			_setf(o + ( 7 << 2), y +    0.049 * s);
			_setf(o + ( 8 << 2), x +   59.081 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 1);
			
			case 118:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +   28.271 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			_setf(o + ( 2 << 2), x +   23.877 * s);
			_setf(o + ( 3 << 2), y +    0.977 * s);
			_setf(o + ( 4 << 2), x +    0.244 * s);
			_setf(o + ( 5 << 2), y +  -52.294 * s);
			_setf(o + ( 6 << 2), x +   13.623 * s);
			_setf(o + ( 7 << 2), y +  -52.294 * s);
			_setf(o + ( 8 << 2), x +   26.123 * s);
			_setf(o + ( 9 << 2), y +  -20.361 * s);
			_setf(o + (10 << 2), x +   39.550 * s);
			_setf(o + (11 << 2), y +  -52.294 * s);
			_setf(o + (12 << 2), x +   52.489 * s);
			_setf(o + (13 << 2), y +  -52.294 * s);
			_setf(o + (14 << 2), x +   28.271 * s);
			_setf(o + (15 << 2), y +    0.977 * s);
			_setf(o + (16 << 2), x +   52.734 * s);
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
			_setf(o + ( 0 << 2), x +   57.958 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			_setf(o + ( 2 << 2), x +   53.514 * s);
			_setf(o + ( 3 << 2), y +    0.977 * s);
			_setf(o + ( 4 << 2), x +   39.159 * s);
			_setf(o + ( 5 << 2), y +  -31.152 * s);
			_setf(o + ( 6 << 2), x +   24.853 * s);
			_setf(o + ( 7 << 2), y +    0.977 * s);
			_setf(o + ( 8 << 2), x +   20.361 * s);
			_setf(o + ( 9 << 2), y +    0.977 * s);
			_setf(o + (10 << 2), x +    0.635 * s);
			_setf(o + (11 << 2), y +  -52.294 * s);
			_setf(o + (12 << 2), x +   13.476 * s);
			_setf(o + (13 << 2), y +  -52.294 * s);
			_setf(o + (14 << 2), x +   23.974 * s);
			_setf(o + (15 << 2), y +  -21.093 * s);
			_setf(o + (16 << 2), x +   36.767 * s);
			_setf(o + (17 << 2), y +  -52.294 * s);
			_setf(o + (18 << 2), x +   41.161 * s);
			_setf(o + (19 << 2), y +  -52.294 * s);
			_setf(o + (20 << 2), x +   54.393 * s);
			_setf(o + (21 << 2), y +  -20.898 * s);
			_setf(o + (22 << 2), x +   65.721 * s);
			_setf(o + (23 << 2), y +  -52.294 * s);
			_setf(o + (24 << 2), x +   77.733 * s);
			_setf(o + (25 << 2), y +  -52.294 * s);
			_setf(o + (26 << 2), x +   57.958 * s);
			_setf(o + (27 << 2), y +    0.977 * s);
			_setf(o + (28 << 2), x +   78.368 * s);
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
			_setf(o + ( 0 << 2), x +   40.184 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   26.757 * s);
			_setf(o + ( 3 << 2), y +  -17.041 * s);
			_setf(o + ( 4 << 2), x +   14.697 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    0.244 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   20.312 * s);
			_setf(o + ( 9 << 2), y +  -26.757 * s);
			_setf(o + (10 << 2), x +    1.855 * s);
			_setf(o + (11 << 2), y +  -52.294 * s);
			_setf(o + (12 << 2), x +   15.868 * s);
			_setf(o + (13 << 2), y +  -52.294 * s);
			_setf(o + (14 << 2), x +   26.903 * s);
			_setf(o + (15 << 2), y +  -36.328 * s);
			_setf(o + (16 << 2), x +   39.208 * s);
			_setf(o + (17 << 2), y +  -52.294 * s);
			_setf(o + (18 << 2), x +   53.124 * s);
			_setf(o + (19 << 2), y +  -52.294 * s);
			_setf(o + (20 << 2), x +   33.056 * s);
			_setf(o + (21 << 2), y +  -26.757 * s);
			_setf(o + (22 << 2), x +   54.979 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   40.184 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   55.223 * s);
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
			_setf(o + ( 0 << 2), x +   29.736 * s);
			_setf(o + ( 1 << 2), y +    8.398 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   29.736 * s,y +    8.398 * s,x +   28.423 * s,y +   11.877 * s,x +   25.643 * s,y +   14.770 * s,x +   21.362 * s,y +   17.065 * s, threshold);
			_vr.bezier8(x +   21.362 * s,y +   17.065 * s,x +   17.082 * s,y +   19.360 * s,x +   12.093 * s,y +   20.508 * s,x +    6.397 * s,y +   20.508 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    6.397 * s);
			_setf(o + ( 1 << 2), y +    9.717 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    6.397 * s,y +    9.717 * s,x +   15.804 * s,y +    9.717 * s,x +   20.508 * s,y +    7.357 * s,x +   20.508 * s,y +    2.637 * s, threshold);
			_vr.bezier8(x +   20.508 * s,y +    2.637 * s,x +   20.508 * s,y +   -0.488 * s,x +   19.201 * s,y +   -5.271 * s,x +   16.602 * s,y +  -11.719 * s, threshold);
			o = _posf(14);
			_setf(o + ( 0 << 2), x +    0.244 * s);
			_setf(o + ( 1 << 2), y +  -52.294 * s);
			_setf(o + ( 2 << 2), x +   12.891 * s);
			_setf(o + ( 3 << 2), y +  -52.294 * s);
			_setf(o + ( 4 << 2), x +   27.148 * s);
			_setf(o + ( 5 << 2), y +  -16.162 * s);
			_setf(o + ( 6 << 2), x +   39.990 * s);
			_setf(o + ( 7 << 2), y +  -52.294 * s);
			_setf(o + ( 8 << 2), x +   52.636 * s);
			_setf(o + ( 9 << 2), y +  -52.294 * s);
			_setf(o + (10 << 2), x +   29.736 * s);
			_setf(o + (11 << 2), y +    8.398 * s);
			_setf(o + (12 << 2), x +   53.369 * s);
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
			_setf(o + ( 0 << 2), x +    3.173 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    3.173 * s);
			_setf(o + ( 3 << 2), y +   -4.150 * s);
			_setf(o + ( 4 << 2), x +   31.542 * s);
			_setf(o + ( 5 << 2), y +  -41.650 * s);
			_setf(o + ( 6 << 2), x +    3.662 * s);
			_setf(o + ( 7 << 2), y +  -41.650 * s);
			_setf(o + ( 8 << 2), x +    3.662 * s);
			_setf(o + ( 9 << 2), y +  -52.294 * s);
			_setf(o + (10 << 2), x +   49.364 * s);
			_setf(o + (11 << 2), y +  -52.294 * s);
			_setf(o + (12 << 2), x +   49.364 * s);
			_setf(o + (13 << 2), y +  -47.997 * s);
			_setf(o + (14 << 2), x +   22.021 * s);
			_setf(o + (15 << 2), y +  -10.644 * s);
			_setf(o + (16 << 2), x +   49.657 * s);
			_setf(o + (17 << 2), y +  -10.644 * s);
			_setf(o + (18 << 2), x +   49.657 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +    3.173 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   52.831 * s);
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
			_setf(o + ( 0 << 2), x +   31.298 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   31.298 * s,y +   20.508 * s,x +   25.439 * s,y +   20.508 * s,x +   20.515 * s,y +   19.108 * s,x +   16.528 * s,y +   16.308 * s, threshold);
			_vr.bezier8(x +   16.528 * s,y +   16.308 * s,x +   12.540 * s,y +   13.509 * s,x +   10.547 * s,y +    9.733 * s,x +   10.547 * s,y +    4.980 * s, threshold);
			_vr.bezier8(x +   10.547 * s,y +    4.980 * s,x +   10.547 * s,y +    2.637 * s,x +   11.149 * s,y +   -0.814 * s,x +   12.353 * s,y +   -5.371 * s, threshold);
			_vr.bezier8(x +   12.353 * s,y +   -5.371 * s,x +   13.558 * s,y +   -9.928 * s,x +   14.160 * s,y +  -13.379 * s,x +   14.160 * s,y +  -15.722 * s, threshold);
			_vr.bezier8(x +   14.160 * s,y +  -15.722 * s,x +   14.160 * s,y +  -21.093 * s,x +   10.758 * s,y +  -23.991 * s,x +    3.955 * s,y +  -24.414 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    3.955 * s);
			_setf(o + ( 1 << 2), y +  -31.054 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    3.955 * s,y +  -31.054 * s,x +   10.758 * s,y +  -31.542 * s,x +   14.160 * s,y +  -34.716 * s,x +   14.160 * s,y +  -40.576 * s, threshold);
			_vr.bezier8(x +   14.160 * s,y +  -40.576 * s,x +   14.160 * s,y +  -42.659 * s,x +   13.558 * s,y +  -45.694 * s,x +   12.353 * s,y +  -49.682 * s, threshold);
			_vr.bezier8(x +   12.353 * s,y +  -49.682 * s,x +   11.149 * s,y +  -53.669 * s,x +   10.547 * s,y +  -56.705 * s,x +   10.547 * s,y +  -58.788 * s, threshold);
			_vr.bezier8(x +   10.547 * s,y +  -58.788 * s,x +   10.547 * s,y +  -63.313 * s,x +   12.548 * s,y +  -66.934 * s,x +   16.552 * s,y +  -69.652 * s, threshold);
			_vr.bezier8(x +   16.552 * s,y +  -69.652 * s,x +   20.556 * s,y +  -72.370 * s,x +   25.325 * s,y +  -73.729 * s,x +   30.859 * s,y +  -73.729 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   39.550 * s);
			_setf(o + ( 1 << 2), y +  -73.729 * s);
			_setf(o + ( 2 << 2), x +   39.550 * s);
			_setf(o + ( 3 << 2), y +  -64.599 * s);
			_setf(o + ( 4 << 2), x +   29.540 * s);
			_setf(o + ( 5 << 2), y +  -64.599 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   29.540 * s,y +  -64.599 * s,x +   25.178 * s,y +  -64.599 * s,x +   22.997 * s,y +  -62.173 * s,x +   22.997 * s,y +  -57.323 * s, threshold);
			_vr.bezier8(x +   22.997 * s,y +  -57.323 * s,x +   22.997 * s,y +  -55.500 * s,x +   23.510 * s,y +  -52.856 * s,x +   24.536 * s,y +  -49.389 * s, threshold);
			_vr.bezier8(x +   24.536 * s,y +  -49.389 * s,x +   25.561 * s,y +  -45.922 * s,x +   26.074 * s,y +  -43.277 * s,x +   26.074 * s,y +  -41.454 * s, threshold);
			_vr.bezier8(x +   26.074 * s,y +  -41.454 * s,x +   26.074 * s,y +  -36.442 * s,x +   22.949 * s,y +  -31.966 * s,x +   16.699 * s,y +  -28.027 * s, threshold);
			_vr.bezier8(x +   16.699 * s,y +  -28.027 * s,x +   22.949 * s,y +  -24.772 * s,x +   26.074 * s,y +  -20.768 * s,x +   26.074 * s,y +  -16.015 * s, threshold);
			_vr.bezier8(x +   26.074 * s,y +  -16.015 * s,x +   26.074 * s,y +  -13.997 * s,x +   25.561 * s,y +  -11.043 * s,x +   24.536 * s,y +   -7.153 * s, threshold);
			_vr.bezier8(x +   24.536 * s,y +   -7.153 * s,x +   23.510 * s,y +   -3.263 * s,x +   22.997 * s,y +   -0.326 * s,x +   22.997 * s,y +    1.660 * s, threshold);
			_vr.bezier8(x +   22.997 * s,y +    1.660 * s,x +   22.997 * s,y +    3.939 * s,x +   23.478 * s,y +    5.802 * s,x +   24.438 * s,y +    7.251 * s, threshold);
			_vr.bezier8(x +   24.438 * s,y +    7.251 * s,x +   25.398 * s,y +    8.699 * s,x +   26.782 * s,y +    9.692 * s,x +   28.588 * s,y +   10.229 * s, threshold);
			_vr.bezier8(x +   28.588 * s,y +   10.229 * s,x +   30.395 * s,y +   10.766 * s,x +   34.049 * s,y +   11.035 * s,x +   39.550 * s,y +   11.035 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   39.550 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			_setf(o + ( 2 << 2), x +   31.298 * s);
			_setf(o + ( 3 << 2), y +   20.508 * s);
			_setf(o + ( 4 << 2), x +   43.358 * s);
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
			_setf(o + ( 4 << 2), x +   34.717 * s);
			_setf(o + ( 5 << 2), y +  -73.729 * s);
			_setf(o + ( 6 << 2), x +   34.717 * s);
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
			_setf(o + ( 0 << 2), x +   39.551 * s);
			_setf(o + ( 1 << 2), y +  -24.414 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   39.551 * s,y +  -24.414 * s,x +   32.747 * s,y +  -23.991 * s,x +   29.346 * s,y +  -21.093 * s,x +   29.346 * s,y +  -15.722 * s, threshold);
			_vr.bezier8(x +   29.346 * s,y +  -15.722 * s,x +   29.346 * s,y +  -13.379 * s,x +   29.948 * s,y +   -9.928 * s,x +   31.152 * s,y +   -5.371 * s, threshold);
			_vr.bezier8(x +   31.152 * s,y +   -5.371 * s,x +   32.357 * s,y +   -0.814 * s,x +   32.959 * s,y +    2.637 * s,x +   32.959 * s,y +    4.980 * s, threshold);
			_vr.bezier8(x +   32.959 * s,y +    4.980 * s,x +   32.959 * s,y +    9.733 * s,x +   30.965 * s,y +   13.509 * s,x +   26.977 * s,y +   16.308 * s, threshold);
			_vr.bezier8(x +   26.977 * s,y +   16.308 * s,x +   22.990 * s,y +   19.108 * s,x +   18.066 * s,y +   20.508 * s,x +   12.207 * s,y +   20.508 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    3.955 * s);
			_setf(o + ( 1 << 2), y +   20.508 * s);
			_setf(o + ( 2 << 2), x +    3.955 * s);
			_setf(o + ( 3 << 2), y +   11.035 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_vr.bezier8(x +    3.955 * s,y +   11.035 * s,x +    9.457 * s,y +   11.035 * s,x +   13.110 * s,y +   10.766 * s,x +   14.917 * s,y +   10.229 * s, threshold);
			_vr.bezier8(x +   14.917 * s,y +   10.229 * s,x +   16.724 * s,y +    9.692 * s,x +   18.107 * s,y +    8.699 * s,x +   19.067 * s,y +    7.251 * s, threshold);
			_vr.bezier8(x +   19.067 * s,y +    7.251 * s,x +   20.028 * s,y +    5.802 * s,x +   20.508 * s,y +    3.939 * s,x +   20.508 * s,y +    1.660 * s, threshold);
			_vr.bezier8(x +   20.508 * s,y +    1.660 * s,x +   20.508 * s,y +   -0.326 * s,x +   19.995 * s,y +   -3.263 * s,x +   18.970 * s,y +   -7.153 * s, threshold);
			_vr.bezier8(x +   18.970 * s,y +   -7.153 * s,x +   17.944 * s,y +  -11.043 * s,x +   17.432 * s,y +  -13.997 * s,x +   17.432 * s,y +  -16.015 * s, threshold);
			_vr.bezier8(x +   17.432 * s,y +  -16.015 * s,x +   17.432 * s,y +  -20.768 * s,x +   20.557 * s,y +  -24.772 * s,x +   26.807 * s,y +  -28.027 * s, threshold);
			_vr.bezier8(x +   26.807 * s,y +  -28.027 * s,x +   20.557 * s,y +  -31.966 * s,x +   17.432 * s,y +  -36.442 * s,x +   17.432 * s,y +  -41.454 * s, threshold);
			_vr.bezier8(x +   17.432 * s,y +  -41.454 * s,x +   17.432 * s,y +  -43.277 * s,x +   17.944 * s,y +  -45.922 * s,x +   18.970 * s,y +  -49.389 * s, threshold);
			_vr.bezier8(x +   18.970 * s,y +  -49.389 * s,x +   19.995 * s,y +  -52.856 * s,x +   20.508 * s,y +  -55.500 * s,x +   20.508 * s,y +  -57.323 * s, threshold);
			_vr.bezier8(x +   20.508 * s,y +  -57.323 * s,x +   20.508 * s,y +  -62.173 * s,x +   18.327 * s,y +  -64.599 * s,x +   13.965 * s,y +  -64.599 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    3.955 * s);
			_setf(o + ( 1 << 2), y +  -64.599 * s);
			_setf(o + ( 2 << 2), x +    3.955 * s);
			_setf(o + ( 3 << 2), y +  -73.729 * s);
			_setf(o + ( 4 << 2), x +   12.647 * s);
			_setf(o + ( 5 << 2), y +  -73.729 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   12.647 * s,y +  -73.729 * s,x +   18.148 * s,y +  -73.729 * s,x +   22.909 * s,y +  -72.370 * s,x +   26.929 * s,y +  -69.652 * s, threshold);
			_vr.bezier8(x +   26.929 * s,y +  -69.652 * s,x +   30.949 * s,y +  -66.934 * s,x +   32.959 * s,y +  -63.313 * s,x +   32.959 * s,y +  -58.788 * s, threshold);
			_vr.bezier8(x +   32.959 * s,y +  -58.788 * s,x +   32.959 * s,y +  -56.705 * s,x +   32.357 * s,y +  -53.669 * s,x +   31.152 * s,y +  -49.682 * s, threshold);
			_vr.bezier8(x +   31.152 * s,y +  -49.682 * s,x +   29.948 * s,y +  -45.694 * s,x +   29.346 * s,y +  -42.659 * s,x +   29.346 * s,y +  -40.576 * s, threshold);
			_vr.bezier8(x +   29.346 * s,y +  -40.576 * s,x +   29.346 * s,y +  -34.716 * s,x +   32.747 * s,y +  -31.542 * s,x +   39.551 * s,y +  -31.054 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   39.551 * s);
			_setf(o + ( 1 << 2), y +  -24.414 * s);
			_setf(o + ( 2 << 2), x +   43.359 * s);
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
			_vr.bezier8(x +   19.531 * s,y +  -36.425 * s,x +   21.093 * s,y +  -36.425 * s,x +   22.656 * s,y +  -36.262 * s,x +   24.218 * s,y +  -35.937 * s, threshold);
			_vr.bezier8(x +   24.218 * s,y +  -35.937 * s,x +   25.781 * s,y +  -35.611 * s,x +   28.975 * s,y +  -34.661 * s,x +   33.837 * s,y +  -33.203 * s, threshold);
			_vr.bezier8(x +   33.837 * s,y +  -33.203 * s,x +   35.161 * s,y +  -32.806 * s,x +   36.360 * s,y +  -32.666 * s,x +   37.402 * s,y +  -32.666 * s, threshold);
			_vr.bezier8(x +   37.402 * s,y +  -32.666 * s,x +   39.355 * s,y +  -32.666 * s,x +   40.771 * s,y +  -33.919 * s,x +   41.650 * s,y +  -36.425 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   48.876 * s);
			_setf(o + ( 1 << 2), y +  -36.425 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   48.876 * s,y +  -36.425 * s,x +   47.639 * s,y +  -31.608 * s,x +   46.142 * s,y +  -28.230 * s,x +   44.384 * s,y +  -26.294 * s, threshold);
			_vr.bezier8(x +   44.384 * s,y +  -26.294 * s,x +   42.626 * s,y +  -24.357 * s,x +   40.364 * s,y +  -23.388 * s,x +   37.597 * s,y +  -23.388 * s, threshold);
			_vr.bezier8(x +   37.597 * s,y +  -23.388 * s,x +   36.067 * s,y +  -23.388 * s,x +   34.505 * s,y +  -23.551 * s,x +   32.910 * s,y +  -23.877 * s, threshold);
			_vr.bezier8(x +   32.910 * s,y +  -23.877 * s,x +   31.315 * s,y +  -24.202 * s,x +   28.963 * s,y +  -24.829 * s,x +   25.854 * s,y +  -25.756 * s, threshold);
			_vr.bezier8(x +   25.854 * s,y +  -25.756 * s,x +   22.745 * s,y +  -26.684 * s,x +   20.882 * s,y +  -27.148 * s,x +   20.263 * s,y +  -27.148 * s, threshold);
			_vr.bezier8(x +   20.263 * s,y +  -27.148 * s,x +   18.571 * s,y +  -27.148 * s,x +   17.122 * s,y +  -25.895 * s,x +   15.918 * s,y +  -23.388 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.593 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
		}
	}
	#end
}