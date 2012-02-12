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
package de.polygonal.gl.text.fonts.vera;

import de.polygonal.gl.VectorRenderer;
import de.polygonal.gl.text.VectorFont;
import flash.Memory;

class BitstreamVeraSerifBold extends de.polygonal.gl.text.ProportionalVectorFont
{
	public function new()
	{
		#if font_inline
		super(2048, 1923, -483, BOUNDS_TABLE, SPACING_TABLE, KERNING_TABLE);
		#else
		super(
		"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");
		#end
	}
	
	#if font_inline
	static var SPACING_TABLE:Array<Int> =
	[
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,  713,  899, 1067, 1716, 1425, 1946, 1849,  627,
		 969,  969, 1071, 1716,  713,  850,  713,  748, 1425, 1425, 1425, 1425, 1425, 1425, 1425, 1425, 1425, 1425,  756,  756,
		1716, 1716, 1716, 1200, 2048, 1589, 1731, 1630, 1776, 1561, 1454, 1749, 1935,  958,  969, 1780, 1440, 2267, 1872, 1784,
		1540, 1784, 1702, 1479, 1524, 1786, 1589, 2300, 1589, 1462, 1495,  969,  748,  969, 1716, 1024, 1024, 1327, 1432, 1247,
		1432, 1303,  881, 1432, 1489,  778,  741, 1419,  778, 2167, 1489, 1366, 1432, 1432, 1079, 1153,  946, 1489, 1190, 1763,
		1221, 1190, 1163, 1317,  745, 1317, 1716
	];

	static var KERNING_TABLE:Array<Int> =
	[
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,  127,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,  138,  157,  168,  173,  182,  185,  208,    0,    0,  215,  224,  247,    0,  260,  269,
		 280,  299,  306,  319,  328,  361,  374,  401,  428,  437,  462,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,  467,    0,    0,    0,    0,  474,    0,    0,    0,  477,    0,    0,  480,    0,    0,    0,  485,  490,
		 495,  498,    0,    0,    0,    0,    0,   10,   84, -339,   86, -149,   87, -112,   88, -149,   89, -225,   18,   84,
		-112,   86, -149,   87, -102,   89, -102,  102,  -36,  116,  -36,  118,  -83,  119,  -83,  121,  -83,   10,   45,   38,
		  67,   38,   71,   38,   79,   38,   89,  -36,    4,   44,  -36,   46,  -36,    8,   44,  -73,   45,   38,   46,  -73,
		  86,  -36,    2,   45,   38,   22,   44, -206,   45,  -92,   46, -206,   58,  -73,   59,  -73,   65, -120,   97, -112,
		 101, -112,  111, -112,  114,  -36,  117,  -36,    6,   44,  -73,   45,   38,   46,  -73,    8,   44,  -83,   46, -159,
		  58,  -83,   59,  -83,   22,   45, -149,   65,  -83,   67,  -55,   79,  -55,   85,  -73,   87,  -73,   89,  -55,  101,
		 -45,  111,  -45,  117,  -45,  121,  -92,   12,   84, -167,   85, -112,   86, -243,   87, -139,   89, -131,  121,  -73,
		   8,   44, -131,   46, -131,   58,  -73,   59,  -73,   10,   44, -120,   45,   75,   46, -120,   86,  -36,   88,  -36,
		  18,   44, -264,   45, -112,   46, -339,   58,  -73,   59,  -73,   65, -149,   97,  -55,  101,  -55,  111,  -55,    6,
		  44, -102,   45,   75,   46, -102,   12,   84,  -36,   86,  -73,   87,  -45,   89,  -63,   97,   47,  121,  -36,    8,
		  44,  -73,   45,   75,   46,  -73,   83,  -45,   32,   44, -225,   45, -339,   46, -264,   58,  -73,   59,  -73,   65,
		-112,   84,  -73,   97, -196,   99, -235,  101, -235,  111, -235,  114, -149,  115, -188,  117, -188,  119, -225,  121,
		-225,   12,   44, -188,   45,  -36,   46, -188,   58,  -73,   59,  -73,   65,  -63,   26,   44, -358,   45, -149,   46,
		-358,   58, -206,   59, -206,   65, -159,   79,  -36,   97, -188,  101, -188,  105,  -36,  111, -188,  117, -131,  121,
		 -83,   26,   44, -319,   45, -112,   46, -319,   58, -139,   59, -139,   65, -131,   97, -178,  101, -167,  105,  -36,
		 111, -167,  114,  -92,  117,  -83,  121,  -45,    8,   45,  -73,   65,  -73,   67,  -36,   79,  -36,   24,   44, -264,
		  45, -206,   46, -264,   58, -253,   59, -253,   65, -131,   67,  -36,   97, -159,  101, -178,  105,  -36,  111, -178,
		 117, -178,    4,   44,  -36,   46,  -36,    6,   44,  -45,   45,  -73,   46,  -73,    2,   45,  -83,    2,   46,  -36,
		   4,   44, -149,   46, -188,    4,   44, -167,   46, -206,    4,   44, -167,   46, -206,    2,   45,  -36,    4,   44,
		-196,   46, -235
	];

	static var BOUNDS_TABLE:Array<Float> =
	[
		  33,     12.695,    -72.899,     31.201,      1.416,
		  34,      9.521,    -72.899,     42.577,    -45.800,
		  35,      6.787,    -71.776,     77.000,          0,
		  36,      8.887,    -76.122,     61.279,     14.599,
		  37,      2.393,    -74.218,     92.577,      1.416,
		  38,      4.004,    -74.218,     88.476,      1.416,
		  39,      9.522,    -72.899,     21.094,    -45.800,
		  40,      9.424,    -75.975,     42.089,     15.576,
		  41,      5.078,    -75.975,     37.792,     15.576,
		  42,      2.197,    -74.218,     50.097,    -27.783,
		  43,     10.595,    -62.694,     73.192,     -0.098,
		  44,      1.318,    -15.576,     25.097,     16.504,
		  45,      5.419,    -33.398,     36.083,    -20.215,
		  46,      8.105,    -17.187,     26.708,      1.416,
		  47,          0,    -72.899,     36.523,      9.277,
		  48,      4.687,    -74.218,     64.891,      1.416,
		  49,     12.206,    -74.218,     59.618,          0,
		  50,      6.689,    -74.218,     60.595,          0,
		  51,      6.982,    -74.218,     63.183,      1.416,
		  52,      4.102,    -74.218,     65.478,          0,
		  53,      8.203,    -72.899,     62.011,      1.416,
		  54,      6.299,    -74.218,     64.208,      1.416,
		  55,      7.910,    -72.899,     61.278,          0,
		  56,      5.176,    -74.218,     64.208,      1.416,
		  57,      5.420,    -74.218,     63.280,      1.416,
		  58,      9.180,    -49.023,     27.685,      1.416,
		  59,      2.587,    -49.023,     27.685,     16.113,
		  60,     10.596,    -59.521,     73.192,     -3.223,
		  61,     10.595,    -47.997,     73.192,    -14.697,
		  62,     10.595,    -59.521,     73.192,     -3.223,
		  63,      6.494,    -74.218,     54.101,      1.416,
		  64,      6.592,    -70.311,     92.919,     17.383,
		  65,     -0.781,    -72.899,     78.710,          0,
		  66,      4.688,    -72.899,     79.003,          0,
		  67,      4.199,    -74.218,     74.510,      1.416,
		  68,      4.688,    -72.899,     82.519,          0,
		  69,      4.687,    -72.899,     71.092,          0,
		  70,      4.687,    -72.899,     69.677,          0,
		  71,      4.199,    -74.218,     77.489,      1.416,
		  72,      4.688,    -72.899,     89.989,          0,
		  73,      4.687,    -72.899,     42.187,          0,
		  74,     -7.324,    -72.899,     43.505,     20.800,
		  75,      4.688,    -72.899,     89.989,          0,
		  76,      4.688,    -72.899,     68.114,          0,
		  77,      4.199,    -72.899,    106.004,          0,
		  78,      4.394,    -72.899,     87.401,          0,
		  79,      4.199,    -74.218,     82.811,      1.416,
		  80,      4.687,    -72.899,     72.704,          0,
		  81,      4.199,    -74.218,     82.811,     18.017,
		  82,      4.687,    -72.899,     83.690,          0,
		  83,      6.592,    -74.218,     66.210,      1.416,
		  84,      1.123,    -72.899,     73.387,          0,
		  85,      3.418,    -72.899,     85.008,      1.416,
		  86,     -0.585,    -72.899,     79.003,          0,
		  87,     -0.879,    -72.899,    113.475,          0,
		  88,      0.488,    -72.899,     77.489,          0,
		  89,     -0.879,    -72.899,     72.313,          0,
		  90,      3.711,    -72.899,     69.384,          0,
		  91,     12.500,    -75.975,     40.185,     13.183,
		  92,          0,    -72.899,     36.523,      9.277,
		  93,      7.080,    -75.975,     34.814,     13.183,
		  94,     10.107,    -72.899,     73.680,    -45.702,
		  95,          0,     14.306,     50.000,     23.584,
		  96,      6.885,    -79.979,     33.105,    -61.620,
		  97,      4.102,    -53.319,     62.499,      1.416,
		  98,      2.295,    -75.975,     65.917,      1.416,
		  99,      4.101,    -53.319,     56.396,      1.416,
		 100,      4.101,    -75.975,     67.577,      1.416,
		 101,      4.101,    -53.319,     59.081,      1.416,
		 102,      3.076,    -75.975,     48.388,          0,
		 103,      4.102,    -53.319,     67.578,     22.216,
		 104,      3.076,    -75.975,     70.409,          0,
		 105,      3.418,    -75.975,     35.497,          0,
		 106,     -7.422,    -75.975,     27.978,     22.216,
		 107,      3.418,    -75.975,     70.995,          0,
		 108,      3.418,    -75.975,     35.497,          0,
		 109,      3.418,    -53.319,    103.515,          0,
		 110,      3.418,    -53.319,     70.409,          0,
		 111,      4.102,    -53.319,     62.695,      1.416,
		 112,      2.295,    -53.319,     65.917,     20.800,
		 113,      4.101,    -53.319,     67.577,     20.800,
		 114,      2.880,    -53.319,     53.710,          0,
		 115,      4.297,    -53.319,     52.197,      1.416,
		 116,      2.393,    -68.017,     45.703,      1.416,
		 117,      2.295,    -51.904,     69.286,      1.416,
		 118,     -1.807,    -51.904,     60.595,          0,
		 119,     -0.879,    -51.904,     88.084,          0,
		 120,          0,    -51.904,     60.302,          0,
		 121,     -1.318,    -51.904,     60.497,     22.216,
		 122,      3.515,    -51.904,     53.417,          0,
		 123,      8.398,    -75.975,     55.321,     16.308,
		 124,     12.890,    -76.415,     23.388,     23.584,
		 125,      9.082,    -75.975,     55.907,     16.308,
		 126,     10.595,    -40.576,     73.192,    -22.119
	];

	override function _draw(charCode:Int, x:Float, y:Float, s:Float, threshold:Float):Void
	{
		var o = 0;
		switch (charCode)
		{			
			case 33:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   12.695 * s);
			_setf(o + ( 1 << 2), y +   -7.910 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   12.695 * s,y +   -7.910 * s,x +   12.695 * s,y +  -10.449 * s,x +   13.598 * s,y +  -12.630 * s,x +   15.405 * s,y +  -14.453 * s, threshold);
			_bez(x +   15.405 * s,y +  -14.453 * s,x +   17.212 * s,y +  -16.276 * s,x +   19.384 * s,y +  -17.187 * s,x +   21.923 * s,y +  -17.187 * s, threshold);
			_bez(x +   21.923 * s,y +  -17.187 * s,x +   24.463 * s,y +  -17.187 * s,x +   26.643 * s,y +  -16.276 * s,x +   28.466 * s,y +  -14.453 * s, threshold);
			_bez(x +   28.466 * s,y +  -14.453 * s,x +   30.289 * s,y +  -12.630 * s,x +   31.201 * s,y +  -10.449 * s,x +   31.201 * s,y +   -7.910 * s, threshold);
			_bez(x +   31.201 * s,y +   -7.910 * s,x +   31.201 * s,y +   -5.339 * s,x +   30.289 * s,y +   -3.141 * s,x +   28.466 * s,y +   -1.318 * s, threshold);
			_bez(x +   28.466 * s,y +   -1.318 * s,x +   26.643 * s,y +    0.505 * s,x +   24.463 * s,y +    1.416 * s,x +   21.923 * s,y +    1.416 * s, threshold);
			_bez(x +   21.923 * s,y +    1.416 * s,x +   19.384 * s,y +    1.416 * s,x +   17.212 * s,y +    0.505 * s,x +   15.405 * s,y +   -1.318 * s, threshold);
			_bez(x +   15.405 * s,y +   -1.318 * s,x +   13.598 * s,y +   -3.141 * s,x +   12.695 * s,y +   -5.339 * s,x +   12.695 * s,y +   -7.910 * s, threshold);
			o = _posf(16);
			_setf(o + ( 0 << 2), x +   12.793 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   31.103 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   25.293 * s);
			_setf(o + ( 5 << 2), y +  -31.787 * s);
			_setf(o + ( 6 << 2), x +   25.293 * s);
			_setf(o + ( 7 << 2), y +  -22.509 * s);
			_setf(o + ( 8 << 2), x +   18.506 * s);
			_setf(o + ( 9 << 2), y +  -22.509 * s);
			_setf(o + (10 << 2), x +   18.506 * s);
			_setf(o + (11 << 2), y +  -31.787 * s);
			_setf(o + (12 << 2), x +   12.793 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   43.896 * s);
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
			
			case 34:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +   21.093 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   21.093 * s);
			_setf(o + ( 3 << 2), y +  -45.800 * s);
			_setf(o + ( 4 << 2), x +    9.521 * s);
			_setf(o + ( 5 << 2), y +  -45.800 * s);
			_setf(o + ( 6 << 2), x +    9.521 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   21.093 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   42.577 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   42.577 * s);
			_setf(o + (13 << 2), y +  -45.800 * s);
			_setf(o + (14 << 2), x +   31.005 * s);
			_setf(o + (15 << 2), y +  -45.800 * s);
			_setf(o + (16 << 2), x +   31.005 * s);
			_setf(o + (17 << 2), y +  -72.899 * s);
			_setf(o + (18 << 2), x +   42.577 * s);
			_setf(o + (19 << 2), y +  -72.899 * s);
			_setf(o + (20 << 2), x +   52.099 * s);
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
			_setf(o + ( 0 << 2), x +   49.999 * s);
			_setf(o + ( 1 << 2), y +  -42.577 * s);
			_setf(o + ( 2 << 2), x +   37.108 * s);
			_setf(o + ( 3 << 2), y +  -42.577 * s);
			_setf(o + ( 4 << 2), x +   33.691 * s);
			_setf(o + ( 5 << 2), y +  -29.199 * s);
			_setf(o + ( 6 << 2), x +   46.581 * s);
			_setf(o + ( 7 << 2), y +  -29.199 * s);
			_setf(o + ( 8 << 2), x +   49.999 * s);
			_setf(o + ( 9 << 2), y +  -42.577 * s);
			_setf(o + (10 << 2), x +   44.481 * s);
			_setf(o + (11 << 2), y +  -71.776 * s);
			_setf(o + (12 << 2), x +   39.794 * s);
			_setf(o + (13 << 2), y +  -52.978 * s);
			_setf(o + (14 << 2), x +   52.684 * s);
			_setf(o + (15 << 2), y +  -52.978 * s);
			_setf(o + (16 << 2), x +   57.421 * s);
			_setf(o + (17 << 2), y +  -71.776 * s);
			_setf(o + (18 << 2), x +   68.211 * s);
			_setf(o + (19 << 2), y +  -71.776 * s);
			_setf(o + (20 << 2), x +   63.475 * s);
			_setf(o + (21 << 2), y +  -52.978 * s);
			_setf(o + (22 << 2), x +   77.000 * s);
			_setf(o + (23 << 2), y +  -52.978 * s);
			_setf(o + (24 << 2), x +   77.000 * s);
			_setf(o + (25 << 2), y +  -42.577 * s);
			_setf(o + (26 << 2), x +   60.887 * s);
			_setf(o + (27 << 2), y +  -42.577 * s);
			_setf(o + (28 << 2), x +   57.518 * s);
			_setf(o + (29 << 2), y +  -29.199 * s);
			_setf(o + (30 << 2), x +   71.385 * s);
			_setf(o + (31 << 2), y +  -29.199 * s);
			_setf(o + (32 << 2), x +   71.385 * s);
			_setf(o + (33 << 2), y +  -18.701 * s);
			_setf(o + (34 << 2), x +   54.979 * s);
			_setf(o + (35 << 2), y +  -18.701 * s);
			_setf(o + (36 << 2), x +   50.292 * s);
			_setf(o + (37 << 2), y +       0. * s);
			_setf(o + (38 << 2), x +   39.501 * s);
			_setf(o + (39 << 2), y +       0. * s);
			_setf(o + (40 << 2), x +   44.188 * s);
			_setf(o + (41 << 2), y +  -18.701 * s);
			_setf(o + (42 << 2), x +   31.298 * s);
			_setf(o + (43 << 2), y +  -18.701 * s);
			_setf(o + (44 << 2), x +   26.611 * s);
			_setf(o + (45 << 2), y +       0. * s);
			_setf(o + (46 << 2), x +   15.722 * s);
			_setf(o + (47 << 2), y +       0. * s);
			_setf(o + (48 << 2), x +   20.409 * s);
			_setf(o + (49 << 2), y +  -18.701 * s);
			_setf(o + (50 << 2), x +    6.787 * s);
			_setf(o + (51 << 2), y +  -18.701 * s);
			_setf(o + (52 << 2), x +    6.787 * s);
			_setf(o + (53 << 2), y +  -29.199 * s);
			_setf(o + (54 << 2), x +   22.802 * s);
			_setf(o + (55 << 2), y +  -29.199 * s);
			_setf(o + (56 << 2), x +   26.220 * s);
			_setf(o + (57 << 2), y +  -42.577 * s);
			_setf(o + (58 << 2), x +   12.402 * s);
			_setf(o + (59 << 2), y +  -42.577 * s);
			_setf(o + (60 << 2), x +   12.402 * s);
			_setf(o + (61 << 2), y +  -52.978 * s);
			_setf(o + (62 << 2), x +   28.905 * s);
			_setf(o + (63 << 2), y +  -52.978 * s);
			_setf(o + (64 << 2), x +   33.593 * s);
			_setf(o + (65 << 2), y +  -71.776 * s);
			_setf(o + (66 << 2), x +   44.481 * s);
			_setf(o + (67 << 2), y +  -71.776 * s);
			_setf(o + (68 << 2), x +   83.787 * s);
			_setf(o + (69 << 2), y +       0. * s);
			o = _posb(35);
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
			_setb(o + 29, 2);
			_setb(o + 30, 2);
			_setb(o + 31, 2);
			_setb(o + 32, 2);
			_setb(o + 33, 2);
			_setb(o + 34, 1);
			
			case 36:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    9.522 * s);
			_setf(o + ( 1 << 2), y +   -2.881 * s);
			_setf(o + ( 2 << 2), x +    9.522 * s);
			_setf(o + ( 3 << 2), y +  -17.090 * s);
			_setf(o + ( 4 << 2), x +   15.381 * s);
			_setf(o + ( 5 << 2), y +  -17.090 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   15.381 * s,y +  -17.090 * s,x +   15.934 * s,y +  -12.728 * s,x +   17.489 * s,y +   -9.473 * s,x +   20.044 * s,y +   -7.324 * s, threshold);
			_bez(x +   20.044 * s,y +   -7.324 * s,x +   22.599 * s,y +   -5.176 * s,x +   26.221 * s,y +   -4.101 * s,x +   30.908 * s,y +   -4.101 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   31.592 * s);
			_setf(o + ( 1 << 2), y +   -4.101 * s);
			_setf(o + ( 2 << 2), x +   31.592 * s);
			_setf(o + ( 3 << 2), y +  -23.877 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   31.592 * s,y +  -23.877 * s,x +   23.486 * s,y +  -25.667 * s,x +   17.676 * s,y +  -28.108 * s,x +   14.160 * s,y +  -31.201 * s, threshold);
			_bez(x +   14.160 * s,y +  -31.201 * s,x +   10.645 * s,y +  -34.293 * s,x +    8.887 * s,y +  -38.492 * s,x +    8.887 * s,y +  -43.798 * s, threshold);
			_bez(x +    8.887 * s,y +  -43.798 * s,x +    8.887 * s,y +  -49.658 * s,x +   10.881 * s,y +  -54.272 * s,x +   14.868 * s,y +  -57.641 * s, threshold);
			_bez(x +   14.868 * s,y +  -57.641 * s,x +   18.856 * s,y +  -61.010 * s,x +   24.430 * s,y +  -62.792 * s,x +   31.592 * s,y +  -62.987 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   31.592 * s);
			_setf(o + ( 1 << 2), y +  -76.122 * s);
			_setf(o + ( 2 << 2), x +   37.500 * s);
			_setf(o + ( 3 << 2), y +  -76.122 * s);
			_setf(o + ( 4 << 2), x +   37.500 * s);
			_setf(o + ( 5 << 2), y +  -62.987 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   37.500 * s,y +  -62.987 * s,x +   41.146 * s,y +  -62.792 * s,x +   44.637 * s,y +  -62.344 * s,x +   47.973 * s,y +  -61.645 * s, threshold);
			_bez(x +   47.973 * s,y +  -61.645 * s,x +   51.310 * s,y +  -60.945 * s,x +   54.557 * s,y +  -59.960 * s,x +   57.714 * s,y +  -58.691 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   57.714 * s);
			_setf(o + ( 1 << 2), y +  -45.409 * s);
			_setf(o + ( 2 << 2), x +   51.806 * s);
			_setf(o + ( 3 << 2), y +  -45.409 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   51.806 * s,y +  -45.409 * s,x +   51.285 * s,y +  -49.185 * s,x +   49.780 * s,y +  -52.123 * s,x +   47.290 * s,y +  -54.223 * s, threshold);
			_bez(x +   47.290 * s,y +  -54.223 * s,x +   44.800 * s,y +  -56.322 * s,x +   41.536 * s,y +  -57.405 * s,x +   37.500 * s,y +  -57.470 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   37.500 * s);
			_setf(o + ( 1 << 2), y +  -39.306 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   37.500 * s,y +  -39.306 * s,x +   46.256 * s,y +  -37.385 * s,x +   52.408 * s,y +  -34.806 * s,x +   55.957 * s,y +  -31.567 * s, threshold);
			_bez(x +   55.957 * s,y +  -31.567 * s,x +   59.505 * s,y +  -28.328 * s,x +   61.279 * s,y +  -23.779 * s,x +   61.279 * s,y +  -17.920 * s, threshold);
			_bez(x +   61.279 * s,y +  -17.920 * s,x +   61.279 * s,y +  -11.898 * s,x +   59.220 * s,y +   -7.218 * s,x +   55.102 * s,y +   -3.882 * s, threshold);
			_bez(x +   55.102 * s,y +   -3.882 * s,x +   50.984 * s,y +   -0.545 * s,x +   45.117 * s,y +    1.221 * s,x +   37.500 * s,y +    1.416 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   37.500 * s);
			_setf(o + ( 1 << 2), y +   14.599 * s);
			_setf(o + ( 2 << 2), x +   31.592 * s);
			_setf(o + ( 3 << 2), y +   14.599 * s);
			_setf(o + ( 4 << 2), x +   31.592 * s);
			_setf(o + ( 5 << 2), y +    1.416 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   31.592 * s,y +    1.416 * s,x +   28.011 * s,y +    1.351 * s,x +   24.382 * s,y +    0.960 * s,x +   20.703 * s,y +    0.244 * s, threshold);
			_bez(x +   20.703 * s,y +    0.244 * s,x +   17.025 * s,y +   -0.472 * s,x +   13.298 * s,y +   -1.514 * s,x +    9.522 * s,y +   -2.881 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   31.592 * s);
			_setf(o + ( 1 << 2), y +  -57.519 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   31.592 * s,y +  -57.519 * s,x +   28.825 * s,y +  -57.161 * s,x +   26.636 * s,y +  -56.298 * s,x +   25.024 * s,y +  -54.931 * s, threshold);
			_bez(x +   25.024 * s,y +  -54.931 * s,x +   23.413 * s,y +  -53.564 * s,x +   22.607 * s,y +  -51.887 * s,x +   22.607 * s,y +  -49.902 * s, threshold);
			_bez(x +   22.607 * s,y +  -49.902 * s,x +   22.607 * s,y +  -47.623 * s,x +   23.299 * s,y +  -45.784 * s,x +   24.683 * s,y +  -44.384 * s, threshold);
			_bez(x +   24.683 * s,y +  -44.384 * s,x +   26.066 * s,y +  -42.984 * s,x +   28.369 * s,y +  -41.829 * s,x +   31.592 * s,y +  -40.917 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   31.592 * s);
			_setf(o + ( 1 << 2), y +  -57.519 * s);
			_setf(o + ( 2 << 2), x +   37.500 * s);
			_setf(o + ( 3 << 2), y +   -4.101 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_bez(x +   37.500 * s,y +   -4.101 * s,x +   40.788 * s,y +   -4.460 * s,x +   43.278 * s,y +   -5.347 * s,x +   44.970 * s,y +   -6.763 * s, threshold);
			_bez(x +   44.970 * s,y +   -6.763 * s,x +   46.663 * s,y +   -8.179 * s,x +   47.509 * s,y +  -10.091 * s,x +   47.509 * s,y +  -12.500 * s, threshold);
			_bez(x +   47.509 * s,y +  -12.500 * s,x +   47.509 * s,y +  -14.909 * s,x +   46.720 * s,y +  -16.894 * s,x +   45.141 * s,y +  -18.457 * s, threshold);
			_bez(x +   45.141 * s,y +  -18.457 * s,x +   43.563 * s,y +  -20.019 * s,x +   41.015 * s,y +  -21.305 * s,x +   37.500 * s,y +  -22.314 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   37.500 * s);
			_setf(o + ( 1 << 2), y +   -4.101 * s);
			_setf(o + ( 2 << 2), x +   69.579 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 37:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   21.582 * s);
			_setf(o + ( 1 << 2), y +  -69.286 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   21.582 * s,y +  -69.286 * s,x +   19.499 * s,y +  -69.286 * s,x +   18.001 * s,y +  -68.155 * s,x +   17.090 * s,y +  -65.893 * s, threshold);
			_bez(x +   17.090 * s,y +  -65.893 * s,x +   16.179 * s,y +  -63.630 * s,x +   15.723 * s,y +  -59.797 * s,x +   15.723 * s,y +  -54.394 * s, threshold);
			_bez(x +   15.723 * s,y +  -54.394 * s,x +   15.723 * s,y +  -48.958 * s,x +   16.179 * s,y +  -45.100 * s,x +   17.090 * s,y +  -42.822 * s, threshold);
			_bez(x +   17.090 * s,y +  -42.822 * s,x +   18.001 * s,y +  -40.543 * s,x +   19.499 * s,y +  -39.404 * s,x +   21.582 * s,y +  -39.404 * s, threshold);
			_bez(x +   21.582 * s,y +  -39.404 * s,x +   23.698 * s,y +  -39.404 * s,x +   25.212 * s,y +  -40.543 * s,x +   26.123 * s,y +  -42.822 * s, threshold);
			_bez(x +   26.123 * s,y +  -42.822 * s,x +   27.034 * s,y +  -45.100 * s,x +   27.490 * s,y +  -48.958 * s,x +   27.490 * s,y +  -54.394 * s, threshold);
			_bez(x +   27.490 * s,y +  -54.394 * s,x +   27.490 * s,y +  -59.797 * s,x +   27.034 * s,y +  -63.630 * s,x +   26.123 * s,y +  -65.893 * s, threshold);
			_bez(x +   26.123 * s,y +  -65.893 * s,x +   25.212 * s,y +  -68.155 * s,x +   23.698 * s,y +  -69.286 * s,x +   21.582 * s,y +  -69.286 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   21.582 * s);
			_setf(o + ( 1 << 2), y +  -74.218 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   21.582 * s,y +  -74.218 * s,x +   27.799 * s,y +  -74.218 * s,x +   32.560 * s,y +  -72.517 * s,x +   35.864 * s,y +  -69.115 * s, threshold);
			_bez(x +   35.864 * s,y +  -69.115 * s,x +   39.168 * s,y +  -65.714 * s,x +   40.820 * s,y +  -60.806 * s,x +   40.820 * s,y +  -54.394 * s, threshold);
			_bez(x +   40.820 * s,y +  -54.394 * s,x +   40.820 * s,y +  -47.981 * s,x +   39.168 * s,y +  -43.066 * s,x +   35.864 * s,y +  -39.648 * s, threshold);
			_bez(x +   35.864 * s,y +  -39.648 * s,x +   32.560 * s,y +  -36.230 * s,x +   27.799 * s,y +  -34.521 * s,x +   21.582 * s,y +  -34.521 * s, threshold);
			_bez(x +   21.582 * s,y +  -34.521 * s,x +   15.397 * s,y +  -34.521 * s,x +   10.653 * s,y +  -36.230 * s,x +    7.349 * s,y +  -39.648 * s, threshold);
			_bez(x +    7.349 * s,y +  -39.648 * s,x +    4.045 * s,y +  -43.066 * s,x +    2.393 * s,y +  -47.981 * s,x +    2.393 * s,y +  -54.394 * s, threshold);
			_bez(x +    2.393 * s,y +  -54.394 * s,x +    2.393 * s,y +  -60.806 * s,x +    4.045 * s,y +  -65.714 * s,x +    7.349 * s,y +  -69.115 * s, threshold);
			_bez(x +    7.349 * s,y +  -69.115 * s,x +   10.653 * s,y +  -72.517 * s,x +   15.397 * s,y +  -74.218 * s,x +   21.582 * s,y +  -74.218 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   66.113 * s);
			_setf(o + ( 1 << 2), y +  -74.218 * s);
			_setf(o + ( 2 << 2), x +   74.511 * s);
			_setf(o + ( 3 << 2), y +  -74.218 * s);
			_setf(o + ( 4 << 2), x +   28.906 * s);
			_setf(o + ( 5 << 2), y +    1.416 * s);
			_setf(o + ( 6 << 2), x +   20.508 * s);
			_setf(o + ( 7 << 2), y +    1.416 * s);
			_setf(o + ( 8 << 2), x +   66.113 * s);
			_setf(o + ( 9 << 2), y +  -74.218 * s);
			_setf(o + (10 << 2), x +   73.388 * s);
			_setf(o + (11 << 2), y +  -38.281 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_bez(x +   73.388 * s,y +  -38.281 * s,x +   79.605 * s,y +  -38.281 * s,x +   84.358 * s,y +  -36.580 * s,x +   87.646 * s,y +  -33.178 * s, threshold);
			_bez(x +   87.646 * s,y +  -33.178 * s,x +   90.933 * s,y +  -29.777 * s,x +   92.577 * s,y +  -24.886 * s,x +   92.577 * s,y +  -18.506 * s, threshold);
			_bez(x +   92.577 * s,y +  -18.506 * s,x +   92.577 * s,y +  -12.093 * s,x +   90.933 * s,y +   -7.169 * s,x +   87.646 * s,y +   -3.735 * s, threshold);
			_bez(x +   87.646 * s,y +   -3.735 * s,x +   84.358 * s,y +   -0.301 * s,x +   79.605 * s,y +    1.416 * s,x +   73.388 * s,y +    1.416 * s, threshold);
			_bez(x +   73.388 * s,y +    1.416 * s,x +   67.203 * s,y +    1.416 * s,x +   62.459 * s,y +   -0.301 * s,x +   59.155 * s,y +   -3.735 * s, threshold);
			_bez(x +   59.155 * s,y +   -3.735 * s,x +   55.851 * s,y +   -7.169 * s,x +   54.199 * s,y +  -12.093 * s,x +   54.199 * s,y +  -18.506 * s, threshold);
			_bez(x +   54.199 * s,y +  -18.506 * s,x +   54.199 * s,y +  -24.886 * s,x +   55.851 * s,y +  -29.777 * s,x +   59.155 * s,y +  -33.178 * s, threshold);
			_bez(x +   59.155 * s,y +  -33.178 * s,x +   62.459 * s,y +  -36.580 * s,x +   67.203 * s,y +  -38.281 * s,x +   73.388 * s,y +  -38.281 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   73.388 * s);
			_setf(o + ( 1 << 2), y +  -33.398 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   73.388 * s,y +  -33.398 * s,x +   71.272 * s,y +  -33.398 * s,x +   69.758 * s,y +  -32.267 * s,x +   68.847 * s,y +  -30.004 * s, threshold);
			_bez(x +   68.847 * s,y +  -30.004 * s,x +   67.936 * s,y +  -27.742 * s,x +   67.480 * s,y +  -23.909 * s,x +   67.480 * s,y +  -18.506 * s, threshold);
			_bez(x +   67.480 * s,y +  -18.506 * s,x +   67.480 * s,y +  -13.070 * s,x +   67.944 * s,y +   -9.212 * s,x +   68.871 * s,y +   -6.933 * s, threshold);
			_bez(x +   68.871 * s,y +   -6.933 * s,x +   69.799 * s,y +   -4.655 * s,x +   71.305 * s,y +   -3.516 * s,x +   73.388 * s,y +   -3.516 * s, threshold);
			_bez(x +   73.388 * s,y +   -3.516 * s,x +   75.504 * s,y +   -3.516 * s,x +   77.017 * s,y +   -4.655 * s,x +   77.929 * s,y +   -6.933 * s, threshold);
			_bez(x +   77.929 * s,y +   -6.933 * s,x +   78.840 * s,y +   -9.212 * s,x +   79.296 * s,y +  -13.070 * s,x +   79.296 * s,y +  -18.506 * s, threshold);
			_bez(x +   79.296 * s,y +  -18.506 * s,x +   79.296 * s,y +  -23.909 * s,x +   78.840 * s,y +  -27.742 * s,x +   77.929 * s,y +  -30.004 * s, threshold);
			_bez(x +   77.929 * s,y +  -30.004 * s,x +   77.017 * s,y +  -32.267 * s,x +   75.504 * s,y +  -33.398 * s,x +   73.388 * s,y +  -33.398 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   95.018 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 38:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   88.476 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   65.087 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   58.886 * s);
			_setf(o + ( 5 << 2), y +   -6.396 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   58.886 * s,y +   -6.396 * s,x +   55.631 * s,y +   -3.792 * s,x +   52.034 * s,y +   -1.839 * s,x +   48.095 * s,y +   -0.537 * s, threshold);
			_bez(x +   48.095 * s,y +   -0.537 * s,x +   44.157 * s,y +    0.765 * s,x +   39.860 * s,y +    1.416 * s,x +   35.205 * s,y +    1.416 * s, threshold);
			_bez(x +   35.205 * s,y +    1.416 * s,x +   25.439 * s,y +    1.416 * s,x +   17.798 * s,y +   -0.667 * s,x +   12.281 * s,y +   -4.834 * s, threshold);
			_bez(x +   12.281 * s,y +   -4.834 * s,x +    6.763 * s,y +   -9.001 * s,x +    4.004 * s,y +  -14.730 * s,x +    4.004 * s,y +  -22.021 * s, threshold);
			_bez(x +    4.004 * s,y +  -22.021 * s,x +    4.004 * s,y +  -27.327 * s,x +    5.412 * s,y +  -31.860 * s,x +    8.228 * s,y +  -35.620 * s, threshold);
			_bez(x +    8.228 * s,y +  -35.620 * s,x +   11.044 * s,y +  -39.379 * s,x +   15.462 * s,y +  -42.610 * s,x +   21.485 * s,y +  -45.312 * s, threshold);
			_bez(x +   21.485 * s,y +  -45.312 * s,x +   19.824 * s,y +  -47.493 * s,x +   18.579 * s,y +  -49.576 * s,x +   17.749 * s,y +  -51.562 * s, threshold);
			_bez(x +   17.749 * s,y +  -51.562 * s,x +   16.919 * s,y +  -53.547 * s,x +   16.504 * s,y +  -55.468 * s,x +   16.504 * s,y +  -57.323 * s, threshold);
			_bez(x +   16.504 * s,y +  -57.323 * s,x +   16.504 * s,y +  -62.662 * s,x +   18.742 * s,y +  -66.812 * s,x +   23.218 * s,y +  -69.774 * s, threshold);
			_bez(x +   23.218 * s,y +  -69.774 * s,x +   27.694 * s,y +  -72.737 * s,x +   33.984 * s,y +  -74.218 * s,x +   42.090 * s,y +  -74.218 * s, threshold);
			_bez(x +   42.090 * s,y +  -74.218 * s,x +   44.498 * s,y +  -74.218 * s,x +   47.306 * s,y +  -74.022 * s,x +   50.512 * s,y +  -73.632 * s, threshold);
			_bez(x +   50.512 * s,y +  -73.632 * s,x +   53.719 * s,y +  -73.241 * s,x +   57.340 * s,y +  -72.671 * s,x +   61.376 * s,y +  -71.923 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   61.376 * s);
			_setf(o + ( 1 << 2), y +  -56.689 * s);
			_setf(o + ( 2 << 2), x +   55.078 * s);
			_setf(o + ( 3 << 2), y +  -56.689 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   55.078 * s,y +  -56.689 * s,x +   54.492 * s,y +  -60.725 * s,x +   53.255 * s,y +  -63.671 * s,x +   51.367 * s,y +  -65.526 * s, threshold);
			_bez(x +   51.367 * s,y +  -65.526 * s,x +   49.479 * s,y +  -67.382 * s,x +   46.793 * s,y +  -68.309 * s,x +   43.310 * s,y +  -68.309 * s, threshold);
			_bez(x +   43.310 * s,y +  -68.309 * s,x +   40.023 * s,y +  -68.309 * s,x +   37.435 * s,y +  -67.528 * s,x +   35.547 * s,y +  -65.966 * s, threshold);
			_bez(x +   35.547 * s,y +  -65.966 * s,x +   33.659 * s,y +  -64.403 * s,x +   32.715 * s,y +  -62.287 * s,x +   32.715 * s,y +  -59.618 * s, threshold);
			_bez(x +   32.715 * s,y +  -59.618 * s,x +   32.715 * s,y +  -56.624 * s,x +   35.623 * s,y +  -52.159 * s,x +   41.455 * s,y +  -46.240 * s, threshold);
			_bez(x +   41.455 * s,y +  -46.240 * s,x +   42.101 * s,y +  -45.584 * s,x +   42.617 * s,y +  -45.140 * s,x +   42.920 * s,y +  -44.824 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   65.380 * s);
			_setf(o + ( 1 << 2), y +  -21.289 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   65.380 * s,y +  -21.289 * s,x +   67.333 * s,y +  -23.502 * s,x +   68.863 * s,y +  -26.058 * s,x +   69.970 * s,y +  -28.955 * s, threshold);
			_bez(x +   69.970 * s,y +  -28.955 * s,x +   71.077 * s,y +  -31.852 * s,x +   71.777 * s,y +  -35.139 * s,x +   72.070 * s,y +  -38.818 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   63.183 * s);
			_setf(o + ( 1 << 2), y +  -38.818 * s);
			_setf(o + ( 2 << 2), x +   63.183 * s);
			_setf(o + ( 3 << 2), y +  -44.677 * s);
			_setf(o + ( 4 << 2), x +   87.597 * s);
			_setf(o + ( 5 << 2), y +  -44.677 * s);
			_setf(o + ( 6 << 2), x +   87.597 * s);
			_setf(o + ( 7 << 2), y +  -38.818 * s);
			_setf(o + ( 8 << 2), x +   79.003 * s);
			_setf(o + ( 9 << 2), y +  -38.818 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   79.003 * s,y +  -38.818 * s,x +   78.450 * s,y +  -34.065 * s,x +   77.433 * s,y +  -29.850 * s,x +   75.951 * s,y +  -26.171 * s, threshold);
			_bez(x +   75.951 * s,y +  -26.171 * s,x +   74.470 * s,y +  -22.493 * s,x +   72.525 * s,y +  -19.238 * s,x +   70.117 * s,y +  -16.406 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   80.175 * s);
			_setf(o + ( 1 << 2), y +   -5.908 * s);
			_setf(o + ( 2 << 2), x +   88.476 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   88.476 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   54.297 * s);
			_setf(o + ( 7 << 2), y +  -11.181 * s);
			_setf(o + ( 8 << 2), x +   26.709 * s);
			_setf(o + ( 9 << 2), y +  -39.892 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			_setb(o +  4, 2);
			_bez(x +   26.709 * s,y +  -39.892 * s,x +   24.919 * s,y +  -37.711 * s,x +   23.568 * s,y +  -35.392 * s,x +   22.656 * s,y +  -32.934 * s, threshold);
			_bez(x +   22.656 * s,y +  -32.934 * s,x +   21.745 * s,y +  -30.476 * s,x +   21.289 * s,y +  -27.897 * s,x +   21.289 * s,y +  -25.195 * s, threshold);
			_bez(x +   21.289 * s,y +  -25.195 * s,x +   21.289 * s,y +  -19.694 * s,x +   23.023 * s,y +  -15.169 * s,x +   26.489 * s,y +  -11.621 * s, threshold);
			_bez(x +   26.489 * s,y +  -11.621 * s,x +   29.956 * s,y +   -8.073 * s,x +   34.359 * s,y +   -6.299 * s,x +   39.697 * s,y +   -6.299 * s, threshold);
			_bez(x +   39.697 * s,y +   -6.299 * s,x +   42.236 * s,y +   -6.299 * s,x +   44.702 * s,y +   -6.697 * s,x +   47.094 * s,y +   -7.495 * s, threshold);
			_bez(x +   47.094 * s,y +   -7.495 * s,x +   49.487 * s,y +   -8.293 * s,x +   51.888 * s,y +   -9.521 * s,x +   54.297 * s,y +  -11.181 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   90.282 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 39:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   21.094 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   21.094 * s);
			_setf(o + ( 3 << 2), y +  -45.800 * s);
			_setf(o + ( 4 << 2), x +    9.522 * s);
			_setf(o + ( 5 << 2), y +  -45.800 * s);
			_setf(o + ( 6 << 2), x +    9.522 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   21.094 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   30.615 * s);
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
			_setf(o + ( 0 << 2), x +   42.089 * s);
			_setf(o + ( 1 << 2), y +   15.576 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   42.089 * s,y +   15.576 * s,x +   31.119 * s,y +   11.507 * s,x +   22.933 * s,y +    5.680 * s,x +   17.529 * s,y +   -1.904 * s, threshold);
			_bez(x +   17.529 * s,y +   -1.904 * s,x +   12.126 * s,y +   -9.489 * s,x +    9.424 * s,y +  -18.912 * s,x +    9.424 * s,y +  -30.175 * s, threshold);
			_bez(x +    9.424 * s,y +  -30.175 * s,x +    9.424 * s,y +  -41.438 * s,x +   12.093 * s,y +  -50.813 * s,x +   17.431 * s,y +  -58.300 * s, threshold);
			_bez(x +   17.431 * s,y +  -58.300 * s,x +   22.770 * s,y +  -65.787 * s,x +   30.989 * s,y +  -71.679 * s,x +   42.089 * s,y +  -75.975 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   42.089 * s);
			_setf(o + ( 1 << 2), y +  -70.116 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   42.089 * s,y +  -70.116 * s,x +   36.946 * s,y +  -66.991 * s,x +   33.243 * s,y +  -62.361 * s,x +   30.981 * s,y +  -56.225 * s, threshold);
			_bez(x +   30.981 * s,y +  -56.225 * s,x +   28.719 * s,y +  -50.089 * s,x +   27.588 * s,y +  -41.406 * s,x +   27.588 * s,y +  -30.175 * s, threshold);
			_bez(x +   27.588 * s,y +  -30.175 * s,x +   27.588 * s,y +  -18.977 * s,x +   28.719 * s,y +  -10.311 * s,x +   30.981 * s,y +   -4.175 * s, threshold);
			_bez(x +   30.981 * s,y +   -4.175 * s,x +   33.243 * s,y +    1.961 * s,x +   36.946 * s,y +    6.592 * s,x +   42.089 * s,y +    9.717 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   42.089 * s);
			_setf(o + ( 1 << 2), y +   15.576 * s);
			_setf(o + ( 2 << 2), x +   47.314 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 41:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    5.078 * s);
			_setf(o + ( 1 << 2), y +   15.576 * s);
			_setf(o + ( 2 << 2), x +    5.078 * s);
			_setf(o + ( 3 << 2), y +    9.717 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +    5.078 * s,y +    9.717 * s,x +   10.221 * s,y +    6.592 * s,x +   13.924 * s,y +    1.961 * s,x +   16.186 * s,y +   -4.175 * s, threshold);
			_bez(x +   16.186 * s,y +   -4.175 * s,x +   18.449 * s,y +  -10.311 * s,x +   19.580 * s,y +  -18.977 * s,x +   19.580 * s,y +  -30.175 * s, threshold);
			_bez(x +   19.580 * s,y +  -30.175 * s,x +   19.580 * s,y +  -41.406 * s,x +   18.449 * s,y +  -50.089 * s,x +   16.186 * s,y +  -56.225 * s, threshold);
			_bez(x +   16.186 * s,y +  -56.225 * s,x +   13.924 * s,y +  -62.361 * s,x +   10.221 * s,y +  -66.991 * s,x +    5.078 * s,y +  -70.116 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    5.078 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    5.078 * s,y +  -75.975 * s,x +   16.178 * s,y +  -71.679 * s,x +   24.405 * s,y +  -65.787 * s,x +   29.760 * s,y +  -58.300 * s, threshold);
			_bez(x +   29.760 * s,y +  -58.300 * s,x +   35.115 * s,y +  -50.813 * s,x +   37.792 * s,y +  -41.438 * s,x +   37.792 * s,y +  -30.175 * s, threshold);
			_bez(x +   37.792 * s,y +  -30.175 * s,x +   37.792 * s,y +  -18.912 * s,x +   35.082 * s,y +   -9.489 * s,x +   29.663 * s,y +   -1.904 * s, threshold);
			_bez(x +   29.663 * s,y +   -1.904 * s,x +   24.243 * s,y +    5.680 * s,x +   16.048 * s,y +   11.507 * s,x +    5.078 * s,y +   15.576 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   47.314 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 42:
			
			o = _posf(40);
			_setf(o + ( 0 << 2), x +   50.097 * s);
			_setf(o + ( 1 << 2), y +  -59.179 * s);
			_setf(o + ( 2 << 2), x +   32.519 * s);
			_setf(o + ( 3 << 2), y +  -50.976 * s);
			_setf(o + ( 4 << 2), x +   50.097 * s);
			_setf(o + ( 5 << 2), y +  -42.675 * s);
			_setf(o + ( 6 << 2), x +   45.312 * s);
			_setf(o + ( 7 << 2), y +  -35.107 * s);
			_setf(o + ( 8 << 2), x +   29.296 * s);
			_setf(o + ( 9 << 2), y +  -46.777 * s);
			_setf(o + (10 << 2), x +   30.615 * s);
			_setf(o + (11 << 2), y +  -27.783 * s);
			_setf(o + (12 << 2), x +   21.679 * s);
			_setf(o + (13 << 2), y +  -27.783 * s);
			_setf(o + (14 << 2), x +   22.998 * s);
			_setf(o + (15 << 2), y +  -46.777 * s);
			_setf(o + (16 << 2), x +    6.982 * s);
			_setf(o + (17 << 2), y +  -35.107 * s);
			_setf(o + (18 << 2), x +    2.197 * s);
			_setf(o + (19 << 2), y +  -42.675 * s);
			_setf(o + (20 << 2), x +   19.824 * s);
			_setf(o + (21 << 2), y +  -50.976 * s);
			_setf(o + (22 << 2), x +    2.197 * s);
			_setf(o + (23 << 2), y +  -59.179 * s);
			_setf(o + (24 << 2), x +    6.982 * s);
			_setf(o + (25 << 2), y +  -66.894 * s);
			_setf(o + (26 << 2), x +   22.998 * s);
			_setf(o + (27 << 2), y +  -55.077 * s);
			_setf(o + (28 << 2), x +   21.679 * s);
			_setf(o + (29 << 2), y +  -74.218 * s);
			_setf(o + (30 << 2), x +   30.615 * s);
			_setf(o + (31 << 2), y +  -74.218 * s);
			_setf(o + (32 << 2), x +   29.296 * s);
			_setf(o + (33 << 2), y +  -55.077 * s);
			_setf(o + (34 << 2), x +   45.312 * s);
			_setf(o + (35 << 2), y +  -66.894 * s);
			_setf(o + (36 << 2), x +   50.097 * s);
			_setf(o + (37 << 2), y +  -59.179 * s);
			_setf(o + (38 << 2), x +   52.294 * s);
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
			_setb(o + 19, 1);
			
			case 43:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   47.509 * s);
			_setf(o + ( 1 << 2), y +  -62.694 * s);
			_setf(o + ( 2 << 2), x +   47.509 * s);
			_setf(o + ( 3 << 2), y +  -37.011 * s);
			_setf(o + ( 4 << 2), x +   73.192 * s);
			_setf(o + ( 5 << 2), y +  -37.011 * s);
			_setf(o + ( 6 << 2), x +   73.192 * s);
			_setf(o + ( 7 << 2), y +  -25.781 * s);
			_setf(o + ( 8 << 2), x +   47.509 * s);
			_setf(o + ( 9 << 2), y +  -25.781 * s);
			_setf(o + (10 << 2), x +   47.509 * s);
			_setf(o + (11 << 2), y +   -0.098 * s);
			_setf(o + (12 << 2), x +   36.279 * s);
			_setf(o + (13 << 2), y +   -0.098 * s);
			_setf(o + (14 << 2), x +   36.279 * s);
			_setf(o + (15 << 2), y +  -25.781 * s);
			_setf(o + (16 << 2), x +   10.595 * s);
			_setf(o + (17 << 2), y +  -25.781 * s);
			_setf(o + (18 << 2), x +   10.595 * s);
			_setf(o + (19 << 2), y +  -37.011 * s);
			_setf(o + (20 << 2), x +   36.279 * s);
			_setf(o + (21 << 2), y +  -37.011 * s);
			_setf(o + (22 << 2), x +   36.279 * s);
			_setf(o + (23 << 2), y +  -62.694 * s);
			_setf(o + (24 << 2), x +   47.509 * s);
			_setf(o + (25 << 2), y +  -62.694 * s);
			_setf(o + (26 << 2), x +   83.788 * s);
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
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    1.318 * s);
			_setf(o + ( 1 << 2), y +    9.619 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +    1.318 * s,y +    9.619 * s,x +    4.703 * s,y +    6.885 * s,x +    7.194 * s,y +    3.825 * s,x +    8.789 * s,y +    0.439 * s, threshold);
			_bez(x +    8.789 * s,y +    0.439 * s,x +   10.384 * s,y +   -2.946 * s,x +   11.181 * s,y +   -6.885 * s,x +   11.181 * s,y +  -11.377 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   11.181 * s);
			_setf(o + ( 1 << 2), y +  -15.576 * s);
			_setf(o + ( 2 << 2), x +   25.097 * s);
			_setf(o + ( 3 << 2), y +  -15.576 * s);
			_setf(o + ( 4 << 2), x +   25.097 * s);
			_setf(o + ( 5 << 2), y +  -15.185 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   25.097 * s,y +  -15.185 * s,x +   25.097 * s,y +   -7.992 * s,x +   23.591 * s,y +   -1.798 * s,x +   20.580 * s,y +    3.394 * s, threshold);
			_bez(x +   20.580 * s,y +    3.394 * s,x +   17.569 * s,y +    8.585 * s,x +   12.939 * s,y +   12.956 * s,x +    6.689 * s,y +   16.504 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    1.318 * s);
			_setf(o + ( 1 << 2), y +    9.619 * s);
			_setf(o + ( 2 << 2), x +   34.814 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 45:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +    5.419 * s);
			_setf(o + ( 1 << 2), y +  -33.398 * s);
			_setf(o + ( 2 << 2), x +   36.083 * s);
			_setf(o + ( 3 << 2), y +  -33.398 * s);
			_setf(o + ( 4 << 2), x +   36.083 * s);
			_setf(o + ( 5 << 2), y +  -20.215 * s);
			_setf(o + ( 6 << 2), x +    5.419 * s);
			_setf(o + ( 7 << 2), y +  -20.215 * s);
			_setf(o + ( 8 << 2), x +    5.419 * s);
			_setf(o + ( 9 << 2), y +  -33.398 * s);
			_setf(o + (10 << 2), x +   41.503 * s);
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
			_setf(o + ( 0 << 2), x +    8.105 * s);
			_setf(o + ( 1 << 2), y +   -7.910 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +    8.105 * s,y +   -7.910 * s,x +    8.105 * s,y +  -10.449 * s,x +    9.017 * s,y +  -12.630 * s,x +   10.839 * s,y +  -14.453 * s, threshold);
			_bez(x +   10.839 * s,y +  -14.453 * s,x +   12.662 * s,y +  -16.276 * s,x +   14.843 * s,y +  -17.187 * s,x +   17.382 * s,y +  -17.187 * s, threshold);
			_bez(x +   17.382 * s,y +  -17.187 * s,x +   19.954 * s,y +  -17.187 * s,x +   22.151 * s,y +  -16.276 * s,x +   23.974 * s,y +  -14.453 * s, threshold);
			_bez(x +   23.974 * s,y +  -14.453 * s,x +   25.797 * s,y +  -12.630 * s,x +   26.708 * s,y +  -10.449 * s,x +   26.708 * s,y +   -7.910 * s, threshold);
			_bez(x +   26.708 * s,y +   -7.910 * s,x +   26.708 * s,y +   -5.339 * s,x +   25.797 * s,y +   -3.141 * s,x +   23.974 * s,y +   -1.318 * s, threshold);
			_bez(x +   23.974 * s,y +   -1.318 * s,x +   22.151 * s,y +    0.505 * s,x +   19.954 * s,y +    1.416 * s,x +   17.382 * s,y +    1.416 * s, threshold);
			_bez(x +   17.382 * s,y +    1.416 * s,x +   14.843 * s,y +    1.416 * s,x +   12.662 * s,y +    0.505 * s,x +   10.839 * s,y +   -1.318 * s, threshold);
			_bez(x +   10.839 * s,y +   -1.318 * s,x +    9.017 * s,y +   -3.141 * s,x +    8.105 * s,y +   -5.339 * s,x +    8.105 * s,y +   -7.910 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   34.814 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 47:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   25.683 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   36.523 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   10.791 * s);
			_setf(o + ( 5 << 2), y +    9.277 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +    9.277 * s);
			_setf(o + ( 8 << 2), x +   25.683 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   36.523 * s);
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
			_setf(o + ( 0 << 2), x +   34.814 * s);
			_setf(o + ( 1 << 2), y +   -4.297 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   34.814 * s,y +   -4.297 * s,x +   38.720 * s,y +   -4.297 * s,x +   41.397 * s,y +   -6.071 * s,x +   42.846 * s,y +   -9.619 * s, threshold);
			_bez(x +   42.846 * s,y +   -9.619 * s,x +   44.294 * s,y +  -13.167 * s,x +   45.018 * s,y +  -22.086 * s,x +   45.018 * s,y +  -36.376 * s, threshold);
			_bez(x +   45.018 * s,y +  -36.376 * s,x +   45.018 * s,y +  -50.569 * s,x +   44.294 * s,y +  -59.472 * s,x +   42.846 * s,y +  -63.085 * s, threshold);
			_bez(x +   42.846 * s,y +  -63.085 * s,x +   41.397 * s,y +  -66.698 * s,x +   38.720 * s,y +  -68.505 * s,x +   34.814 * s,y +  -68.505 * s, threshold);
			_bez(x +   34.814 * s,y +  -68.505 * s,x +   30.907 * s,y +  -68.505 * s,x +   28.230 * s,y +  -66.731 * s,x +   26.781 * s,y +  -63.183 * s, threshold);
			_bez(x +   26.781 * s,y +  -63.183 * s,x +   25.333 * s,y +  -59.634 * s,x +   24.609 * s,y +  -50.699 * s,x +   24.609 * s,y +  -36.376 * s, threshold);
			_bez(x +   24.609 * s,y +  -36.376 * s,x +   24.609 * s,y +  -22.087 * s,x +   25.333 * s,y +  -13.167 * s,x +   26.781 * s,y +   -9.619 * s, threshold);
			_bez(x +   26.781 * s,y +   -9.619 * s,x +   28.230 * s,y +   -6.071 * s,x +   30.907 * s,y +   -4.297 * s,x +   34.814 * s,y +   -4.297 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   34.814 * s);
			_setf(o + ( 1 << 2), y +    1.416 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   34.814 * s,y +    1.416 * s,x +   25.081 * s,y +    1.416 * s,x +   17.626 * s,y +   -1.831 * s,x +   12.451 * s,y +   -8.325 * s, threshold);
			_bez(x +   12.451 * s,y +   -8.325 * s,x +    7.275 * s,y +  -14.819 * s,x +    4.687 * s,y +  -24.170 * s,x +    4.687 * s,y +  -36.376 * s, threshold);
			_bez(x +    4.687 * s,y +  -36.376 * s,x +    4.687 * s,y +  -48.583 * s,x +    7.275 * s,y +  -57.942 * s,x +   12.451 * s,y +  -64.452 * s, threshold);
			_bez(x +   12.451 * s,y +  -64.452 * s,x +   17.626 * s,y +  -70.962 * s,x +   25.081 * s,y +  -74.218 * s,x +   34.814 * s,y +  -74.218 * s, threshold);
			_bez(x +   34.814 * s,y +  -74.218 * s,x +   44.513 * s,y +  -74.218 * s,x +   51.952 * s,y +  -70.962 * s,x +   57.128 * s,y +  -64.452 * s, threshold);
			_bez(x +   57.128 * s,y +  -64.452 * s,x +   62.303 * s,y +  -57.942 * s,x +   64.891 * s,y +  -48.583 * s,x +   64.891 * s,y +  -36.376 * s, threshold);
			_bez(x +   64.891 * s,y +  -36.376 * s,x +   64.891 * s,y +  -24.170 * s,x +   62.303 * s,y +  -14.819 * s,x +   57.128 * s,y +   -8.325 * s, threshold);
			_bez(x +   57.128 * s,y +   -8.325 * s,x +   51.952 * s,y +   -1.831 * s,x +   44.513 * s,y +    1.416 * s,x +   34.814 * s,y +    1.416 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   69.579 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 49:
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +   13.720 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   13.720 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   27.392 * s);
			_setf(o + ( 5 << 2), y +   -5.908 * s);
			_setf(o + ( 6 << 2), x +   27.392 * s);
			_setf(o + ( 7 << 2), y +  -64.892 * s);
			_setf(o + ( 8 << 2), x +   12.206 * s);
			_setf(o + ( 9 << 2), y +  -55.907 * s);
			_setf(o + (10 << 2), x +   12.206 * s);
			_setf(o + (11 << 2), y +  -63.183 * s);
			_setf(o + (12 << 2), x +   30.517 * s);
			_setf(o + (13 << 2), y +  -74.218 * s);
			_setf(o + (14 << 2), x +   45.897 * s);
			_setf(o + (15 << 2), y +  -74.218 * s);
			_setf(o + (16 << 2), x +   45.897 * s);
			_setf(o + (17 << 2), y +   -5.908 * s);
			_setf(o + (18 << 2), x +   59.618 * s);
			_setf(o + (19 << 2), y +   -5.908 * s);
			_setf(o + (20 << 2), x +   59.618 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   13.720 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   69.579 * s);
			_setf(o + (25 << 2), y +       0. * s);
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
			_setb(o + 12, 1);
			
			case 50:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   13.183 * s);
			_setf(o + ( 1 << 2), y +  -54.882 * s);
			_setf(o + ( 2 << 2), x +    7.324 * s);
			_setf(o + ( 3 << 2), y +  -54.882 * s);
			_setf(o + ( 4 << 2), x +    7.324 * s);
			_setf(o + ( 5 << 2), y +  -70.604 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +    7.324 * s,y +  -70.604 * s,x +   11.295 * s,y +  -71.809 * s,x +   15.226 * s,y +  -72.712 * s,x +   19.116 * s,y +  -73.314 * s, threshold);
			_bez(x +   19.116 * s,y +  -73.314 * s,x +   23.006 * s,y +  -73.917 * s,x +   26.936 * s,y +  -74.218 * s,x +   30.908 * s,y +  -74.218 * s, threshold);
			_bez(x +   30.908 * s,y +  -74.218 * s,x +   40.185 * s,y +  -74.218 * s,x +   47.419 * s,y +  -72.321 * s,x +   52.611 * s,y +  -68.529 * s, threshold);
			_bez(x +   52.611 * s,y +  -68.529 * s,x +   57.803 * s,y +  -64.737 * s,x +   60.399 * s,y +  -59.455 * s,x +   60.399 * s,y +  -52.685 * s, threshold);
			_bez(x +   60.399 * s,y +  -52.685 * s,x +   60.399 * s,y +  -47.867 * s,x +   58.967 * s,y +  -43.546 * s,x +   56.103 * s,y +  -39.721 * s, threshold);
			_bez(x +   56.103 * s,y +  -39.721 * s,x +   53.238 * s,y +  -35.896 * s,x +   47.743 * s,y +  -31.403 * s,x +   39.697 * s,y +  -26.123 * s, threshold);
			o = _posf(16);
			_setf(o + ( 0 << 2), x +   19.384 * s);
			_setf(o + ( 1 << 2), y +  -12.793 * s);
			_setf(o + ( 2 << 2), x +   53.905 * s);
			_setf(o + ( 3 << 2), y +  -12.793 * s);
			_setf(o + ( 4 << 2), x +   53.905 * s);
			_setf(o + ( 5 << 2), y +  -21.386 * s);
			_setf(o + ( 6 << 2), x +   60.595 * s);
			_setf(o + ( 7 << 2), y +  -21.386 * s);
			_setf(o + ( 8 << 2), x +   60.595 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +    6.689 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    6.689 * s);
			_setf(o + (13 << 2), y +  -11.914 * s);
			_setf(o + (14 << 2), x +   17.480 * s);
			_setf(o + (15 << 2), y +  -19.384 * s);
			o = _posb(8);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_bez(x +   17.480 * s,y +  -19.384 * s,x +   26.678 * s,y +  -25.752 * s,x +   32.828 * s,y +  -31.136 * s,x +   35.888 * s,y +  -35.595 * s, threshold);
			_bez(x +   35.888 * s,y +  -35.595 * s,x +   38.948 * s,y +  -40.055 * s,x +   40.478 * s,y +  -45.263 * s,x +   40.478 * s,y +  -51.220 * s, threshold);
			_bez(x +   40.478 * s,y +  -51.220 * s,x +   40.478 * s,y +  -56.851 * s,x +   39.314 * s,y +  -61.140 * s,x +   36.987 * s,y +  -64.086 * s, threshold);
			_bez(x +   36.987 * s,y +  -64.086 * s,x +   34.659 * s,y +  -67.032 * s,x +   31.266 * s,y +  -68.505 * s,x +   26.806 * s,y +  -68.505 * s, threshold);
			_bez(x +   26.806 * s,y +  -68.505 * s,x +   22.965 * s,y +  -68.505 * s,x +   19.889 * s,y +  -67.341 * s,x +   17.578 * s,y +  -65.014 * s, threshold);
			_bez(x +   17.578 * s,y +  -65.014 * s,x +   15.267 * s,y +  -62.686 * s,x +   13.802 * s,y +  -59.309 * s,x +   13.183 * s,y +  -54.882 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   69.579 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 51:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    8.594 * s);
			_setf(o + ( 1 << 2), y +  -70.800 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +    8.594 * s,y +  -70.800 * s,x +   12.890 * s,y +  -71.939 * s,x +   17.057 * s,y +  -72.793 * s,x +   21.093 * s,y +  -73.363 * s, threshold);
			_bez(x +   21.093 * s,y +  -73.363 * s,x +   25.130 * s,y +  -73.933 * s,x +   29.069 * s,y +  -74.218 * s,x +   32.910 * s,y +  -74.218 * s, threshold);
			_bez(x +   32.910 * s,y +  -74.218 * s,x +   41.699 * s,y +  -74.218 * s,x +   48.445 * s,y +  -72.647 * s,x +   53.149 * s,y +  -69.506 * s, threshold);
			_bez(x +   53.149 * s,y +  -69.506 * s,x +   57.852 * s,y +  -66.365 * s,x +   60.204 * s,y +  -61.864 * s,x +   60.204 * s,y +  -56.005 * s, threshold);
			_bez(x +   60.204 * s,y +  -56.005 * s,x +   60.204 * s,y +  -51.611 * s,x +   58.853 * s,y +  -48.046 * s,x +   56.151 * s,y +  -45.312 * s, threshold);
			_bez(x +   56.151 * s,y +  -45.312 * s,x +   53.450 * s,y +  -42.577 * s,x +   49.495 * s,y +  -40.738 * s,x +   44.286 * s,y +  -39.794 * s, threshold);
			_bez(x +   44.286 * s,y +  -39.794 * s,x +   50.634 * s,y +  -38.785 * s,x +   55.370 * s,y +  -36.621 * s,x +   58.495 * s,y +  -33.300 * s, threshold);
			_bez(x +   58.495 * s,y +  -33.300 * s,x +   61.620 * s,y +  -29.980 * s,x +   63.183 * s,y +  -25.439 * s,x +   63.183 * s,y +  -19.677 * s, threshold);
			_bez(x +   63.183 * s,y +  -19.677 * s,x +   63.183 * s,y +  -12.874 * s,x +   60.489 * s,y +   -7.658 * s,x +   55.102 * s,y +   -4.028 * s, threshold);
			_bez(x +   55.102 * s,y +   -4.028 * s,x +   49.714 * s,y +   -0.399 * s,x +   41.910 * s,y +    1.416 * s,x +   31.689 * s,y +    1.416 * s, threshold);
			_bez(x +   31.689 * s,y +    1.416 * s,x +   27.848 * s,y +    1.416 * s,x +   23.885 * s,y +    1.090 * s,x +   19.799 * s,y +    0.439 * s, threshold);
			_bez(x +   19.799 * s,y +    0.439 * s,x +   15.714 * s,y +   -0.212 * s,x +   11.442 * s,y +   -1.188 * s,x +    6.982 * s,y +   -2.490 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    6.982 * s);
			_setf(o + ( 1 << 2), y +  -18.506 * s);
			_setf(o + ( 2 << 2), x +   12.890 * s);
			_setf(o + ( 3 << 2), y +  -18.506 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   12.890 * s,y +  -18.506 * s,x +   13.249 * s,y +  -13.883 * s,x +   14.697 * s,y +  -10.360 * s,x +   17.236 * s,y +   -7.934 * s, threshold);
			_bez(x +   17.236 * s,y +   -7.934 * s,x +   19.775 * s,y +   -5.509 * s,x +   23.291 * s,y +   -4.297 * s,x +   27.783 * s,y +   -4.297 * s, threshold);
			_bez(x +   27.783 * s,y +   -4.297 * s,x +   32.730 * s,y +   -4.297 * s,x +   36.555 * s,y +   -5.672 * s,x +   39.257 * s,y +   -8.423 * s, threshold);
			_bez(x +   39.257 * s,y +   -8.423 * s,x +   41.959 * s,y +  -11.173 * s,x +   43.310 * s,y +  -15.072 * s,x +   43.310 * s,y +  -20.117 * s, threshold);
			_bez(x +   43.310 * s,y +  -20.117 * s,x +   43.310 * s,y +  -25.390 * s,x +   41.902 * s,y +  -29.459 * s,x +   39.086 * s,y +  -32.324 * s, threshold);
			_bez(x +   39.086 * s,y +  -32.324 * s,x +   36.271 * s,y +  -35.188 * s,x +   32.275 * s,y +  -36.621 * s,x +   27.099 * s,y +  -36.621 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   23.877 * s);
			_setf(o + ( 1 << 2), y +  -36.621 * s);
			_setf(o + ( 2 << 2), x +   23.877 * s);
			_setf(o + ( 3 << 2), y +  -42.480 * s);
			_setf(o + ( 4 << 2), x +   26.416 * s);
			_setf(o + ( 5 << 2), y +  -42.480 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   26.416 * s,y +  -42.480 * s,x +   31.201 * s,y +  -42.480 * s,x +   34.798 * s,y +  -43.587 * s,x +   37.206 * s,y +  -45.800 * s, threshold);
			_bez(x +   37.206 * s,y +  -45.800 * s,x +   39.615 * s,y +  -48.014 * s,x +   40.820 * s,y +  -51.317 * s,x +   40.820 * s,y +  -55.712 * s, threshold);
			_bez(x +   40.820 * s,y +  -55.712 * s,x +   40.820 * s,y +  -59.846 * s,x +   39.689 * s,y +  -63.012 * s,x +   37.426 * s,y +  -65.209 * s, threshold);
			_bez(x +   37.426 * s,y +  -65.209 * s,x +   35.164 * s,y +  -67.406 * s,x +   31.917 * s,y +  -68.505 * s,x +   27.685 * s,y +  -68.505 * s, threshold);
			_bez(x +   27.685 * s,y +  -68.505 * s,x +   23.844 * s,y +  -68.505 * s,x +   20.800 * s,y +  -67.455 * s,x +   18.554 * s,y +  -65.355 * s, threshold);
			_bez(x +   18.554 * s,y +  -65.355 * s,x +   16.308 * s,y +  -63.256 * s,x +   14.958 * s,y +  -60.204 * s,x +   14.502 * s,y +  -56.200 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    8.594 * s);
			_setf(o + ( 1 << 2), y +  -56.200 * s);
			_setf(o + ( 2 << 2), x +    8.594 * s);
			_setf(o + ( 3 << 2), y +  -70.800 * s);
			_setf(o + ( 4 << 2), x +   69.579 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 52:
			
			o = _posf(42);
			_setf(o + ( 0 << 2), x +   63.817 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   23.681 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   23.681 * s);
			_setf(o + ( 5 << 2), y +   -5.908 * s);
			_setf(o + ( 6 << 2), x +   34.521 * s);
			_setf(o + ( 7 << 2), y +   -5.908 * s);
			_setf(o + ( 8 << 2), x +   34.521 * s);
			_setf(o + ( 9 << 2), y +  -19.189 * s);
			_setf(o + (10 << 2), x +    4.102 * s);
			_setf(o + (11 << 2), y +  -19.189 * s);
			_setf(o + (12 << 2), x +    4.102 * s);
			_setf(o + (13 << 2), y +  -24.804 * s);
			_setf(o + (14 << 2), x +   34.619 * s);
			_setf(o + (15 << 2), y +  -74.218 * s);
			_setf(o + (16 << 2), x +   52.978 * s);
			_setf(o + (17 << 2), y +  -74.218 * s);
			_setf(o + (18 << 2), x +   52.978 * s);
			_setf(o + (19 << 2), y +  -25.488 * s);
			_setf(o + (20 << 2), x +   65.478 * s);
			_setf(o + (21 << 2), y +  -25.488 * s);
			_setf(o + (22 << 2), x +   65.478 * s);
			_setf(o + (23 << 2), y +  -19.189 * s);
			_setf(o + (24 << 2), x +   52.978 * s);
			_setf(o + (25 << 2), y +  -19.189 * s);
			_setf(o + (26 << 2), x +   52.978 * s);
			_setf(o + (27 << 2), y +   -5.908 * s);
			_setf(o + (28 << 2), x +   63.817 * s);
			_setf(o + (29 << 2), y +   -5.908 * s);
			_setf(o + (30 << 2), x +   63.817 * s);
			_setf(o + (31 << 2), y +       0. * s);
			_setf(o + (32 << 2), x +   34.521 * s);
			_setf(o + (33 << 2), y +  -25.488 * s);
			_setf(o + (34 << 2), x +   34.521 * s);
			_setf(o + (35 << 2), y +  -60.888 * s);
			_setf(o + (36 << 2), x +   12.793 * s);
			_setf(o + (37 << 2), y +  -25.488 * s);
			_setf(o + (38 << 2), x +   34.521 * s);
			_setf(o + (39 << 2), y +  -25.488 * s);
			_setf(o + (40 << 2), x +   69.579 * s);
			_setf(o + (41 << 2), y +       0. * s);
			o = _posb(21);
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
			_setb(o + 16, 1);
			_setb(o + 17, 2);
			_setb(o + 18, 2);
			_setb(o + 19, 2);
			_setb(o + 20, 1);
			
			case 53:
			
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   56.396 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   56.396 * s);
			_setf(o + ( 3 << 2), y +  -60.106 * s);
			_setf(o + ( 4 << 2), x +   17.383 * s);
			_setf(o + ( 5 << 2), y +  -60.106 * s);
			_setf(o + ( 6 << 2), x +   17.383 * s);
			_setf(o + ( 7 << 2), y +  -44.091 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_bez(x +   17.383 * s,y +  -44.091 * s,x +   19.531 * s,y +  -45.751 * s,x +   21.924 * s,y +  -47.004 * s,x +   24.560 * s,y +  -47.851 * s, threshold);
			_bez(x +   24.560 * s,y +  -47.851 * s,x +   27.197 * s,y +  -48.697 * s,x +   29.980 * s,y +  -49.120 * s,x +   32.910 * s,y +  -49.120 * s, threshold);
			_bez(x +   32.910 * s,y +  -49.120 * s,x +   41.894 * s,y +  -49.120 * s,x +   48.990 * s,y +  -46.850 * s,x +   54.198 * s,y +  -42.309 * s, threshold);
			_bez(x +   54.198 * s,y +  -42.309 * s,x +   59.407 * s,y +  -37.768 * s,x +   62.011 * s,y +  -31.592 * s,x +   62.011 * s,y +  -23.779 * s, threshold);
			_bez(x +   62.011 * s,y +  -23.779 * s,x +   62.011 * s,y +  -15.836 * s,x +   59.407 * s,y +   -9.652 * s,x +   54.198 * s,y +   -5.225 * s, threshold);
			_bez(x +   54.198 * s,y +   -5.225 * s,x +   48.990 * s,y +   -0.798 * s,x +   41.699 * s,y +    1.416 * s,x +   32.324 * s,y +    1.416 * s, threshold);
			_bez(x +   32.324 * s,y +    1.416 * s,x +   28.352 * s,y +    1.416 * s,x +   24.406 * s,y +    1.090 * s,x +   20.483 * s,y +    0.439 * s, threshold);
			_bez(x +   20.483 * s,y +    0.439 * s,x +   16.561 * s,y +   -0.212 * s,x +   12.467 * s,y +   -1.221 * s,x +    8.203 * s,y +   -2.588 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    8.203 * s);
			_setf(o + ( 1 << 2), y +  -18.506 * s);
			_setf(o + ( 2 << 2), x +   14.062 * s);
			_setf(o + ( 3 << 2), y +  -18.506 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   14.062 * s,y +  -18.506 * s,x +   14.258 * s,y +  -13.720 * s,x +   15.503 * s,y +  -10.156 * s,x +   17.798 * s,y +   -7.812 * s, threshold);
			_bez(x +   17.798 * s,y +   -7.812 * s,x +   20.092 * s,y +   -5.469 * s,x +   23.486 * s,y +   -4.297 * s,x +   27.978 * s,y +   -4.297 * s, threshold);
			_bez(x +   27.978 * s,y +   -4.297 * s,x +   32.763 * s,y +   -4.297 * s,x +   36.311 * s,y +   -5.900 * s,x +   38.622 * s,y +   -9.106 * s, threshold);
			_bez(x +   38.622 * s,y +   -9.106 * s,x +   40.934 * s,y +  -12.313 * s,x +   42.089 * s,y +  -17.204 * s,x +   42.089 * s,y +  -23.779 * s, threshold);
			_bez(x +   42.089 * s,y +  -23.779 * s,x +   42.089 * s,y +  -30.257 * s,x +   40.958 * s,y +  -35.099 * s,x +   38.696 * s,y +  -38.305 * s, threshold);
			_bez(x +   38.696 * s,y +  -38.305 * s,x +   36.433 * s,y +  -41.511 * s,x +   33.007 * s,y +  -43.115 * s,x +   28.418 * s,y +  -43.115 * s, threshold);
			_bez(x +   28.418 * s,y +  -43.115 * s,x +   25.944 * s,y +  -43.115 * s,x +   23.738 * s,y +  -42.602 * s,x +   21.801 * s,y +  -41.577 * s, threshold);
			_bez(x +   21.801 * s,y +  -41.577 * s,x +   19.865 * s,y +  -40.551 * s,x +   18.066 * s,y +  -38.964 * s,x +   16.406 * s,y +  -36.816 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   11.523 * s);
			_setf(o + ( 1 << 2), y +  -36.816 * s);
			_setf(o + ( 2 << 2), x +   11.523 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   56.396 * s);
			_setf(o + ( 5 << 2), y +  -72.899 * s);
			_setf(o + ( 6 << 2), x +   69.579 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			
			case 54:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   24.609 * s);
			_setf(o + ( 1 << 2), y +  -43.212 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   24.609 * s,y +  -43.212 * s,x +   26.725 * s,y +  -44.905 * s,x +   29.093 * s,y +  -46.174 * s,x +   31.713 * s,y +  -47.021 * s, threshold);
			_bez(x +   31.713 * s,y +  -47.021 * s,x +   34.334 * s,y +  -47.867 * s,x +   37.190 * s,y +  -48.290 * s,x +   40.283 * s,y +  -48.290 * s, threshold);
			_bez(x +   40.283 * s,y +  -48.290 * s,x +   47.737 * s,y +  -48.290 * s,x +   53.588 * s,y +  -46.109 * s,x +   57.836 * s,y +  -41.747 * s, threshold);
			_bez(x +   57.836 * s,y +  -41.747 * s,x +   62.084 * s,y +  -37.385 * s,x +   64.208 * s,y +  -31.396 * s,x +   64.208 * s,y +  -23.779 * s, threshold);
			_bez(x +   64.208 * s,y +  -23.779 * s,x +   64.208 * s,y +  -15.739 * s,x +   61.816 * s,y +   -9.529 * s,x +   57.030 * s,y +   -5.151 * s, threshold);
			_bez(x +   57.030 * s,y +   -5.151 * s,x +   52.245 * s,y +   -0.773 * s,x +   45.442 * s,y +    1.416 * s,x +   36.621 * s,y +    1.416 * s, threshold);
			_bez(x +   36.621 * s,y +    1.416 * s,x +   26.659 * s,y +    1.416 * s,x +   19.116 * s,y +   -1.587 * s,x +   13.989 * s,y +   -7.593 * s, threshold);
			_bez(x +   13.989 * s,y +   -7.593 * s,x +    8.862 * s,y +  -13.598 * s,x +    6.299 * s,y +  -22.429 * s,x +    6.299 * s,y +  -34.081 * s, threshold);
			_bez(x +    6.299 * s,y +  -34.081 * s,x +    6.299 * s,y +  -47.330 * s,x +    9.147 * s,y +  -57.331 * s,x +   14.844 * s,y +  -64.086 * s, threshold);
			_bez(x +   14.844 * s,y +  -64.086 * s,x +   20.540 * s,y +  -70.840 * s,x +   28.987 * s,y +  -74.218 * s,x +   40.185 * s,y +  -74.218 * s, threshold);
			_bez(x +   40.185 * s,y +  -74.218 * s,x +   43.115 * s,y +  -74.218 * s,x +   46.256 * s,y +  -73.973 * s,x +   49.609 * s,y +  -73.485 * s, threshold);
			_bez(x +   49.609 * s,y +  -73.485 * s,x +   52.961 * s,y +  -72.997 * s,x +   56.558 * s,y +  -72.265 * s,x +   60.399 * s,y +  -71.288 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   60.399 * s);
			_setf(o + ( 1 << 2), y +  -58.398 * s);
			_setf(o + ( 2 << 2), x +   54.491 * s);
			_setf(o + ( 3 << 2), y +  -58.398 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   54.491 * s,y +  -58.398 * s,x +   53.678 * s,y +  -61.718 * s,x +   52.140 * s,y +  -64.232 * s,x +   49.877 * s,y +  -65.941 * s, threshold);
			_bez(x +   49.877 * s,y +  -65.941 * s,x +   47.615 * s,y +  -67.650 * s,x +   44.693 * s,y +  -68.505 * s,x +   41.113 * s,y +  -68.505 * s, threshold);
			_bez(x +   41.113 * s,y +  -68.505 * s,x +   35.319 * s,y +  -68.505 * s,x +   31.127 * s,y +  -66.519 * s,x +   28.540 * s,y +  -62.548 * s, threshold);
			_bez(x +   28.540 * s,y +  -62.548 * s,x +   25.952 * s,y +  -58.577 * s,x +   24.642 * s,y +  -52.131 * s,x +   24.609 * s,y +  -43.212 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   35.498 * s);
			_setf(o + ( 1 << 2), y +   -4.297 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   35.498 * s,y +   -4.297 * s,x +   38.850 * s,y +   -4.297 * s,x +   41.243 * s,y +   -5.721 * s,x +   42.675 * s,y +   -8.569 * s, threshold);
			_bez(x +   42.675 * s,y +   -8.569 * s,x +   44.107 * s,y +  -11.417 * s,x +   44.824 * s,y +  -16.357 * s,x +   44.824 * s,y +  -23.388 * s, threshold);
			_bez(x +   44.824 * s,y +  -23.388 * s,x +   44.824 * s,y +  -30.419 * s,x +   44.107 * s,y +  -35.359 * s,x +   42.675 * s,y +  -38.207 * s, threshold);
			_bez(x +   42.675 * s,y +  -38.207 * s,x +   41.243 * s,y +  -41.056 * s,x +   38.850 * s,y +  -42.480 * s,x +   35.498 * s,y +  -42.480 * s, threshold);
			_bez(x +   35.498 * s,y +  -42.480 * s,x +   32.145 * s,y +  -42.480 * s,x +   29.760 * s,y +  -41.056 * s,x +   28.344 * s,y +  -38.207 * s, threshold);
			_bez(x +   28.344 * s,y +  -38.207 * s,x +   26.928 * s,y +  -35.359 * s,x +   26.220 * s,y +  -30.419 * s,x +   26.220 * s,y +  -23.388 * s, threshold);
			_bez(x +   26.220 * s,y +  -23.388 * s,x +   26.220 * s,y +  -16.357 * s,x +   26.928 * s,y +  -11.417 * s,x +   28.344 * s,y +   -8.569 * s, threshold);
			_bez(x +   28.344 * s,y +   -8.569 * s,x +   29.760 * s,y +   -5.721 * s,x +   32.145 * s,y +   -4.297 * s,x +   35.498 * s,y +   -4.297 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   69.579 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 55:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +   61.278 * s);
			_setf(o + ( 1 << 2), y +  -60.497 * s);
			_setf(o + ( 2 << 2), x +   31.201 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   21.289 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   50.585 * s);
			_setf(o + ( 7 << 2), y +  -59.081 * s);
			_setf(o + ( 8 << 2), x +   14.599 * s);
			_setf(o + ( 9 << 2), y +  -59.081 * s);
			_setf(o + (10 << 2), x +   14.599 * s);
			_setf(o + (11 << 2), y +  -49.218 * s);
			_setf(o + (12 << 2), x +    7.910 * s);
			_setf(o + (13 << 2), y +  -49.218 * s);
			_setf(o + (14 << 2), x +    7.910 * s);
			_setf(o + (15 << 2), y +  -72.899 * s);
			_setf(o + (16 << 2), x +   61.278 * s);
			_setf(o + (17 << 2), y +  -72.899 * s);
			_setf(o + (18 << 2), x +   61.278 * s);
			_setf(o + (19 << 2), y +  -60.497 * s);
			_setf(o + (20 << 2), x +   69.579 * s);
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
			
			case 56:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   46.484 * s);
			_setf(o + ( 1 << 2), y +  -38.818 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   46.484 * s,y +  -38.818 * s,x +   52.278 * s,y +  -37.874 * s,x +   56.680 * s,y +  -35.742 * s,x +   59.692 * s,y +  -32.421 * s, threshold);
			_bez(x +   59.692 * s,y +  -32.421 * s,x +   62.703 * s,y +  -29.101 * s,x +   64.208 * s,y +  -24.756 * s,x +   64.208 * s,y +  -19.384 * s, threshold);
			_bez(x +   64.208 * s,y +  -19.384 * s,x +   64.208 * s,y +  -12.679 * s,x +   61.677 * s,y +   -7.536 * s,x +   56.615 * s,y +   -3.955 * s, threshold);
			_bez(x +   56.615 * s,y +   -3.955 * s,x +   51.554 * s,y +   -0.374 * s,x +   44.254 * s,y +    1.416 * s,x +   34.716 * s,y +    1.416 * s, threshold);
			_bez(x +   34.716 * s,y +    1.416 * s,x +   25.179 * s,y +    1.416 * s,x +   17.871 * s,y +   -0.374 * s,x +   12.793 * s,y +   -3.955 * s, threshold);
			_bez(x +   12.793 * s,y +   -3.955 * s,x +    7.715 * s,y +   -7.536 * s,x +    5.176 * s,y +  -12.679 * s,x +    5.176 * s,y +  -19.384 * s, threshold);
			_bez(x +    5.176 * s,y +  -19.384 * s,x +    5.176 * s,y +  -24.756 * s,x +    6.689 * s,y +  -29.101 * s,x +    9.717 * s,y +  -32.421 * s, threshold);
			_bez(x +    9.717 * s,y +  -32.421 * s,x +   12.744 * s,y +  -35.742 * s,x +   17.138 * s,y +  -37.874 * s,x +   22.900 * s,y +  -38.818 * s, threshold);
			_bez(x +   22.900 * s,y +  -38.818 * s,x +   17.789 * s,y +  -39.990 * s,x +   13.965 * s,y +  -41.951 * s,x +   11.426 * s,y +  -44.701 * s, threshold);
			_bez(x +   11.426 * s,y +  -44.701 * s,x +    8.887 * s,y +  -47.452 * s,x +    7.617 * s,y +  -50.943 * s,x +    7.617 * s,y +  -55.175 * s, threshold);
			_bez(x +    7.617 * s,y +  -55.175 * s,x +    7.617 * s,y +  -61.360 * s,x +    9.928 * s,y +  -66.080 * s,x +   14.551 * s,y +  -69.335 * s, threshold);
			_bez(x +   14.551 * s,y +  -69.335 * s,x +   19.173 * s,y +  -72.590 * s,x +   25.895 * s,y +  -74.218 * s,x +   34.716 * s,y +  -74.218 * s, threshold);
			_bez(x +   34.716 * s,y +  -74.218 * s,x +   43.505 * s,y +  -74.218 * s,x +   50.219 * s,y +  -72.590 * s,x +   54.858 * s,y +  -69.335 * s, threshold);
			_bez(x +   54.858 * s,y +  -69.335 * s,x +   59.496 * s,y +  -66.080 * s,x +   61.816 * s,y +  -61.360 * s,x +   61.816 * s,y +  -55.175 * s, threshold);
			_bez(x +   61.816 * s,y +  -55.175 * s,x +   61.816 * s,y +  -50.943 * s,x +   60.538 * s,y +  -47.452 * s,x +   57.983 * s,y +  -44.701 * s, threshold);
			_bez(x +   57.983 * s,y +  -44.701 * s,x +   55.427 * s,y +  -41.951 * s,x +   51.594 * s,y +  -39.990 * s,x +   46.484 * s,y +  -38.818 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   42.919 * s);
			_setf(o + ( 1 << 2), y +  -54.980 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   42.919 * s,y +  -54.980 * s,x +   42.919 * s,y +  -60.123 * s,x +   42.301 * s,y +  -63.663 * s,x +   41.064 * s,y +  -65.600 * s, threshold);
			_bez(x +   41.064 * s,y +  -65.600 * s,x +   39.827 * s,y +  -67.536 * s,x +   37.711 * s,y +  -68.505 * s,x +   34.716 * s,y +  -68.505 * s, threshold);
			_bez(x +   34.716 * s,y +  -68.505 * s,x +   31.689 * s,y +  -68.505 * s,x +   29.565 * s,y +  -67.536 * s,x +   28.344 * s,y +  -65.600 * s, threshold);
			_bez(x +   28.344 * s,y +  -65.600 * s,x +   27.124 * s,y +  -63.663 * s,x +   26.513 * s,y +  -60.123 * s,x +   26.513 * s,y +  -54.980 * s, threshold);
			_bez(x +   26.513 * s,y +  -54.980 * s,x +   26.513 * s,y +  -49.869 * s,x +   27.124 * s,y +  -46.362 * s,x +   28.344 * s,y +  -44.457 * s, threshold);
			_bez(x +   28.344 * s,y +  -44.457 * s,x +   29.565 * s,y +  -42.553 * s,x +   31.689 * s,y +  -41.601 * s,x +   34.716 * s,y +  -41.601 * s, threshold);
			_bez(x +   34.716 * s,y +  -41.601 * s,x +   37.744 * s,y +  -41.601 * s,x +   39.868 * s,y +  -42.553 * s,x +   41.088 * s,y +  -44.457 * s, threshold);
			_bez(x +   41.088 * s,y +  -44.457 * s,x +   42.309 * s,y +  -46.362 * s,x +   42.919 * s,y +  -49.869 * s,x +   42.919 * s,y +  -54.980 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   44.824 * s);
			_setf(o + ( 1 << 2), y +  -20.215 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   44.824 * s,y +  -20.215 * s,x +   44.824 * s,y +  -26.172 * s,x +   44.067 * s,y +  -30.273 * s,x +   42.553 * s,y +  -32.519 * s, threshold);
			_bez(x +   42.553 * s,y +  -32.519 * s,x +   41.039 * s,y +  -34.765 * s,x +   38.427 * s,y +  -35.888 * s,x +   34.716 * s,y +  -35.888 * s, threshold);
			_bez(x +   34.716 * s,y +  -35.888 * s,x +   30.973 * s,y +  -35.888 * s,x +   28.352 * s,y +  -34.765 * s,x +   26.855 * s,y +  -32.519 * s, threshold);
			_bez(x +   26.855 * s,y +  -32.519 * s,x +   25.358 * s,y +  -30.273 * s,x +   24.609 * s,y +  -26.172 * s,x +   24.609 * s,y +  -20.215 * s, threshold);
			_bez(x +   24.609 * s,y +  -20.215 * s,x +   24.609 * s,y +  -14.193 * s,x +   25.366 * s,y +  -10.034 * s,x +   26.880 * s,y +   -7.739 * s, threshold);
			_bez(x +   26.880 * s,y +   -7.739 * s,x +   28.393 * s,y +   -5.444 * s,x +   31.005 * s,y +   -4.297 * s,x +   34.716 * s,y +   -4.297 * s, threshold);
			_bez(x +   34.716 * s,y +   -4.297 * s,x +   38.395 * s,y +   -4.297 * s,x +   40.999 * s,y +   -5.444 * s,x +   42.529 * s,y +   -7.739 * s, threshold);
			_bez(x +   42.529 * s,y +   -7.739 * s,x +   44.059 * s,y +  -10.034 * s,x +   44.824 * s,y +  -14.193 * s,x +   44.824 * s,y +  -20.215 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   69.579 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 57:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   34.081 * s);
			_setf(o + ( 1 << 2), y +  -68.505 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   34.081 * s,y +  -68.505 * s,x +   30.729 * s,y +  -68.505 * s,x +   28.344 * s,y +  -67.081 * s,x +   26.928 * s,y +  -64.232 * s, threshold);
			_bez(x +   26.928 * s,y +  -64.232 * s,x +   25.512 * s,y +  -61.384 * s,x +   24.804 * s,y +  -56.444 * s,x +   24.804 * s,y +  -49.413 * s, threshold);
			_bez(x +   24.804 * s,y +  -49.413 * s,x +   24.804 * s,y +  -42.382 * s,x +   25.512 * s,y +  -37.442 * s,x +   26.928 * s,y +  -34.594 * s, threshold);
			_bez(x +   26.928 * s,y +  -34.594 * s,x +   28.344 * s,y +  -31.746 * s,x +   30.729 * s,y +  -30.322 * s,x +   34.081 * s,y +  -30.322 * s, threshold);
			_bez(x +   34.081 * s,y +  -30.322 * s,x +   37.434 * s,y +  -30.322 * s,x +   39.827 * s,y +  -31.746 * s,x +   41.259 * s,y +  -34.594 * s, threshold);
			_bez(x +   41.259 * s,y +  -34.594 * s,x +   42.691 * s,y +  -37.442 * s,x +   43.407 * s,y +  -42.382 * s,x +   43.407 * s,y +  -49.413 * s, threshold);
			_bez(x +   43.407 * s,y +  -49.413 * s,x +   43.407 * s,y +  -56.444 * s,x +   42.691 * s,y +  -61.384 * s,x +   41.259 * s,y +  -64.232 * s, threshold);
			_bez(x +   41.259 * s,y +  -64.232 * s,x +   39.827 * s,y +  -67.081 * s,x +   37.434 * s,y +  -68.505 * s,x +   34.081 * s,y +  -68.505 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   44.970 * s);
			_setf(o + ( 1 << 2), y +  -29.687 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   44.970 * s,y +  -29.687 * s,x +   42.822 * s,y +  -27.962 * s,x +   40.437 * s,y +  -26.668 * s,x +   37.817 * s,y +  -25.805 * s, threshold);
			_bez(x +   37.817 * s,y +  -25.805 * s,x +   35.196 * s,y +  -24.943 * s,x +   32.356 * s,y +  -24.511 * s,x +   29.296 * s,y +  -24.511 * s, threshold);
			_bez(x +   29.296 * s,y +  -24.511 * s,x +   21.874 * s,y +  -24.511 * s,x +   16.040 * s,y +  -26.684 * s,x +   11.792 * s,y +  -31.030 * s, threshold);
			_bez(x +   11.792 * s,y +  -31.030 * s,x +    7.544 * s,y +  -35.375 * s,x +    5.420 * s,y +  -41.373 * s,x +    5.420 * s,y +  -49.023 * s, threshold);
			_bez(x +    5.420 * s,y +  -49.023 * s,x +    5.420 * s,y +  -57.095 * s,x +    7.796 * s,y +  -63.313 * s,x +   12.549 * s,y +  -67.675 * s, threshold);
			_bez(x +   12.549 * s,y +  -67.675 * s,x +   17.301 * s,y +  -72.037 * s,x +   24.088 * s,y +  -74.218 * s,x +   32.910 * s,y +  -74.218 * s, threshold);
			_bez(x +   32.910 * s,y +  -74.218 * s,x +   42.871 * s,y +  -74.218 * s,x +   50.422 * s,y +  -71.207 * s,x +   55.566 * s,y +  -65.185 * s, threshold);
			_bez(x +   55.566 * s,y +  -65.185 * s,x +   60.709 * s,y +  -59.162 * s,x +   63.280 * s,y +  -50.341 * s,x +   63.280 * s,y +  -38.720 * s, threshold);
			_bez(x +   63.280 * s,y +  -38.720 * s,x +   63.280 * s,y +  -25.471 * s,x +   60.432 * s,y +  -15.470 * s,x +   54.735 * s,y +   -8.716 * s, threshold);
			_bez(x +   54.735 * s,y +   -8.716 * s,x +   49.039 * s,y +   -1.961 * s,x +   40.592 * s,y +    1.416 * s,x +   29.394 * s,y +    1.416 * s, threshold);
			_bez(x +   29.394 * s,y +    1.416 * s,x +   26.464 * s,y +    1.416 * s,x +   23.323 * s,y +    1.172 * s,x +   19.970 * s,y +    0.684 * s, threshold);
			_bez(x +   19.970 * s,y +    0.684 * s,x +   16.618 * s,y +    0.195 * s,x +   13.021 * s,y +   -0.537 * s,x +    9.179 * s,y +   -1.514 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    9.179 * s);
			_setf(o + ( 1 << 2), y +  -14.404 * s);
			_setf(o + ( 2 << 2), x +   15.088 * s);
			_setf(o + ( 3 << 2), y +  -14.404 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   15.088 * s,y +  -14.404 * s,x +   15.901 * s,y +  -11.084 * s,x +   17.439 * s,y +   -8.569 * s,x +   19.702 * s,y +   -6.860 * s, threshold);
			_bez(x +   19.702 * s,y +   -6.860 * s,x +   21.964 * s,y +   -5.151 * s,x +   24.902 * s,y +   -4.297 * s,x +   28.515 * s,y +   -4.297 * s, threshold);
			_bez(x +   28.515 * s,y +   -4.297 * s,x +   34.244 * s,y +   -4.297 * s,x +   38.411 * s,y +   -6.291 * s,x +   41.015 * s,y +  -10.278 * s, threshold);
			_bez(x +   41.015 * s,y +  -10.278 * s,x +   43.619 * s,y +  -14.266 * s,x +   44.937 * s,y +  -20.735 * s,x +   44.970 * s,y +  -29.687 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   69.579 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 58:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    9.180 * s);
			_setf(o + ( 1 << 2), y +  -39.697 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +    9.180 * s,y +  -39.697 * s,x +    9.180 * s,y +  -42.268 * s,x +   10.083 * s,y +  -44.465 * s,x +   11.890 * s,y +  -46.288 * s, threshold);
			_bez(x +   11.890 * s,y +  -46.288 * s,x +   13.696 * s,y +  -48.111 * s,x +   15.869 * s,y +  -49.023 * s,x +   18.408 * s,y +  -49.023 * s, threshold);
			_bez(x +   18.408 * s,y +  -49.023 * s,x +   20.947 * s,y +  -49.023 * s,x +   23.128 * s,y +  -48.103 * s,x +   24.951 * s,y +  -46.264 * s, threshold);
			_bez(x +   24.951 * s,y +  -46.264 * s,x +   26.774 * s,y +  -44.425 * s,x +   27.685 * s,y +  -42.236 * s,x +   27.685 * s,y +  -39.697 * s, threshold);
			_bez(x +   27.685 * s,y +  -39.697 * s,x +   27.685 * s,y +  -37.158 * s,x +   26.782 * s,y +  -34.993 * s,x +   24.975 * s,y +  -33.203 * s, threshold);
			_bez(x +   24.975 * s,y +  -33.203 * s,x +   23.169 * s,y +  -31.412 * s,x +   20.979 * s,y +  -30.517 * s,x +   18.408 * s,y +  -30.517 * s, threshold);
			_bez(x +   18.408 * s,y +  -30.517 * s,x +   15.836 * s,y +  -30.517 * s,x +   13.655 * s,y +  -31.412 * s,x +   11.865 * s,y +  -33.203 * s, threshold);
			_bez(x +   11.865 * s,y +  -33.203 * s,x +   10.075 * s,y +  -34.993 * s,x +    9.180 * s,y +  -37.158 * s,x +    9.180 * s,y +  -39.697 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    9.180 * s);
			_setf(o + ( 1 << 2), y +   -7.910 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +    9.180 * s,y +   -7.910 * s,x +    9.180 * s,y +  -10.449 * s,x +   10.083 * s,y +  -12.630 * s,x +   11.890 * s,y +  -14.453 * s, threshold);
			_bez(x +   11.890 * s,y +  -14.453 * s,x +   13.696 * s,y +  -16.276 * s,x +   15.869 * s,y +  -17.187 * s,x +   18.408 * s,y +  -17.187 * s, threshold);
			_bez(x +   18.408 * s,y +  -17.187 * s,x +   20.947 * s,y +  -17.187 * s,x +   23.128 * s,y +  -16.276 * s,x +   24.951 * s,y +  -14.453 * s, threshold);
			_bez(x +   24.951 * s,y +  -14.453 * s,x +   26.774 * s,y +  -12.630 * s,x +   27.685 * s,y +  -10.449 * s,x +   27.685 * s,y +   -7.910 * s, threshold);
			_bez(x +   27.685 * s,y +   -7.910 * s,x +   27.685 * s,y +   -5.339 * s,x +   26.774 * s,y +   -3.141 * s,x +   24.951 * s,y +   -1.318 * s, threshold);
			_bez(x +   24.951 * s,y +   -1.318 * s,x +   23.128 * s,y +    0.505 * s,x +   20.947 * s,y +    1.416 * s,x +   18.408 * s,y +    1.416 * s, threshold);
			_bez(x +   18.408 * s,y +    1.416 * s,x +   15.869 * s,y +    1.416 * s,x +   13.696 * s,y +    0.505 * s,x +   11.890 * s,y +   -1.318 * s, threshold);
			_bez(x +   11.890 * s,y +   -1.318 * s,x +   10.083 * s,y +   -3.141 * s,x +    9.180 * s,y +   -5.339 * s,x +    9.180 * s,y +   -7.910 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.914 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 59:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    9.179 * s);
			_setf(o + ( 1 << 2), y +  -39.697 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +    9.179 * s,y +  -39.697 * s,x +    9.179 * s,y +  -42.268 * s,x +   10.082 * s,y +  -44.465 * s,x +   11.889 * s,y +  -46.288 * s, threshold);
			_bez(x +   11.889 * s,y +  -46.288 * s,x +   13.696 * s,y +  -48.111 * s,x +   15.868 * s,y +  -49.023 * s,x +   18.407 * s,y +  -49.023 * s, threshold);
			_bez(x +   18.407 * s,y +  -49.023 * s,x +   20.946 * s,y +  -49.023 * s,x +   23.127 * s,y +  -48.103 * s,x +   24.950 * s,y +  -46.264 * s, threshold);
			_bez(x +   24.950 * s,y +  -46.264 * s,x +   26.773 * s,y +  -44.425 * s,x +   27.685 * s,y +  -42.236 * s,x +   27.685 * s,y +  -39.697 * s, threshold);
			_bez(x +   27.685 * s,y +  -39.697 * s,x +   27.685 * s,y +  -37.158 * s,x +   26.781 * s,y +  -34.993 * s,x +   24.975 * s,y +  -33.203 * s, threshold);
			_bez(x +   24.975 * s,y +  -33.203 * s,x +   23.168 * s,y +  -31.412 * s,x +   20.979 * s,y +  -30.517 * s,x +   18.407 * s,y +  -30.517 * s, threshold);
			_bez(x +   18.407 * s,y +  -30.517 * s,x +   15.836 * s,y +  -30.517 * s,x +   13.655 * s,y +  -31.412 * s,x +   11.865 * s,y +  -33.203 * s, threshold);
			_bez(x +   11.865 * s,y +  -33.203 * s,x +   10.074 * s,y +  -34.993 * s,x +    9.179 * s,y +  -37.158 * s,x +    9.179 * s,y +  -39.697 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    2.587 * s);
			_setf(o + ( 1 << 2), y +    9.180 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +    2.587 * s,y +    9.180 * s,x +    6.005 * s,y +    6.478 * s,x +    8.512 * s,y +    3.442 * s,x +   10.107 * s,y +    0.073 * s, threshold);
			_bez(x +   10.107 * s,y +    0.073 * s,x +   11.702 * s,y +   -3.296 * s,x +   12.499 * s,y +   -7.226 * s,x +   12.499 * s,y +  -11.719 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   12.499 * s);
			_setf(o + ( 1 << 2), y +  -16.015 * s);
			_setf(o + ( 2 << 2), x +   26.415 * s);
			_setf(o + ( 3 << 2), y +  -16.015 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   26.415 * s,y +  -16.015 * s,x +   26.415 * s,y +   -8.691 * s,x +   24.901 * s,y +   -2.393 * s,x +   21.874 * s,y +    2.881 * s, threshold);
			_bez(x +   21.874 * s,y +    2.881 * s,x +   18.847 * s,y +    8.154 * s,x +   14.225 * s,y +   12.565 * s,x +    8.007 * s,y +   16.113 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    2.587 * s);
			_setf(o + ( 1 << 2), y +    9.180 * s);
			_setf(o + ( 2 << 2), x +   36.913 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 60:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +   73.192 * s);
			_setf(o + ( 1 << 2), y +  -47.802 * s);
			_setf(o + ( 2 << 2), x +   25.390 * s);
			_setf(o + ( 3 << 2), y +  -31.298 * s);
			_setf(o + ( 4 << 2), x +   73.192 * s);
			_setf(o + ( 5 << 2), y +  -14.892 * s);
			_setf(o + ( 6 << 2), x +   73.192 * s);
			_setf(o + ( 7 << 2), y +   -3.223 * s);
			_setf(o + ( 8 << 2), x +   10.596 * s);
			_setf(o + ( 9 << 2), y +  -25.879 * s);
			_setf(o + (10 << 2), x +   10.596 * s);
			_setf(o + (11 << 2), y +  -36.913 * s);
			_setf(o + (12 << 2), x +   73.192 * s);
			_setf(o + (13 << 2), y +  -59.521 * s);
			_setf(o + (14 << 2), x +   73.192 * s);
			_setf(o + (15 << 2), y +  -47.802 * s);
			_setf(o + (16 << 2), x +   83.788 * s);
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
			_setf(o + ( 0 << 2), x +   10.595 * s);
			_setf(o + ( 1 << 2), y +  -25.781 * s);
			_setf(o + ( 2 << 2), x +   73.192 * s);
			_setf(o + ( 3 << 2), y +  -25.781 * s);
			_setf(o + ( 4 << 2), x +   73.192 * s);
			_setf(o + ( 5 << 2), y +  -14.697 * s);
			_setf(o + ( 6 << 2), x +   10.595 * s);
			_setf(o + ( 7 << 2), y +  -14.697 * s);
			_setf(o + ( 8 << 2), x +   10.595 * s);
			_setf(o + ( 9 << 2), y +  -25.781 * s);
			_setf(o + (10 << 2), x +   10.595 * s);
			_setf(o + (11 << 2), y +  -47.997 * s);
			_setf(o + (12 << 2), x +   73.192 * s);
			_setf(o + (13 << 2), y +  -47.997 * s);
			_setf(o + (14 << 2), x +   73.192 * s);
			_setf(o + (15 << 2), y +  -36.913 * s);
			_setf(o + (16 << 2), x +   10.595 * s);
			_setf(o + (17 << 2), y +  -36.913 * s);
			_setf(o + (18 << 2), x +   10.595 * s);
			_setf(o + (19 << 2), y +  -47.997 * s);
			_setf(o + (20 << 2), x +   83.788 * s);
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
			_setf(o + ( 0 << 2), x +   10.595 * s);
			_setf(o + ( 1 << 2), y +  -47.802 * s);
			_setf(o + ( 2 << 2), x +   10.595 * s);
			_setf(o + ( 3 << 2), y +  -59.521 * s);
			_setf(o + ( 4 << 2), x +   73.192 * s);
			_setf(o + ( 5 << 2), y +  -36.913 * s);
			_setf(o + ( 6 << 2), x +   73.192 * s);
			_setf(o + ( 7 << 2), y +  -25.879 * s);
			_setf(o + ( 8 << 2), x +   10.595 * s);
			_setf(o + ( 9 << 2), y +   -3.223 * s);
			_setf(o + (10 << 2), x +   10.595 * s);
			_setf(o + (11 << 2), y +  -14.892 * s);
			_setf(o + (12 << 2), x +   58.397 * s);
			_setf(o + (13 << 2), y +  -31.298 * s);
			_setf(o + (14 << 2), x +   10.595 * s);
			_setf(o + (15 << 2), y +  -47.802 * s);
			_setf(o + (16 << 2), x +   83.787 * s);
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
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   16.699 * s);
			_setf(o + ( 1 << 2), y +   -7.910 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   16.699 * s,y +   -7.910 * s,x +   16.699 * s,y +  -10.449 * s,x +   17.611 * s,y +  -12.630 * s,x +   19.434 * s,y +  -14.453 * s, threshold);
			_bez(x +   19.434 * s,y +  -14.453 * s,x +   21.257 * s,y +  -16.276 * s,x +   23.437 * s,y +  -17.187 * s,x +   25.977 * s,y +  -17.187 * s, threshold);
			_bez(x +   25.977 * s,y +  -17.187 * s,x +   28.548 * s,y +  -17.187 * s,x +   30.745 * s,y +  -16.276 * s,x +   32.568 * s,y +  -14.453 * s, threshold);
			_bez(x +   32.568 * s,y +  -14.453 * s,x +   34.391 * s,y +  -12.630 * s,x +   35.303 * s,y +  -10.449 * s,x +   35.303 * s,y +   -7.910 * s, threshold);
			_bez(x +   35.303 * s,y +   -7.910 * s,x +   35.303 * s,y +   -5.339 * s,x +   34.391 * s,y +   -3.141 * s,x +   32.568 * s,y +   -1.318 * s, threshold);
			_bez(x +   32.568 * s,y +   -1.318 * s,x +   30.745 * s,y +    0.505 * s,x +   28.548 * s,y +    1.416 * s,x +   25.977 * s,y +    1.416 * s, threshold);
			_bez(x +   25.977 * s,y +    1.416 * s,x +   23.437 * s,y +    1.416 * s,x +   21.257 * s,y +    0.505 * s,x +   19.434 * s,y +   -1.318 * s, threshold);
			_bez(x +   19.434 * s,y +   -1.318 * s,x +   17.611 * s,y +   -3.141 * s,x +   16.699 * s,y +   -5.339 * s,x +   16.699 * s,y +   -7.910 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    6.494 * s);
			_setf(o + ( 1 << 2), y +  -70.897 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +    6.494 * s,y +  -70.897 * s,x +   10.531 * s,y +  -72.004 * s,x +   14.372 * s,y +  -72.834 * s,x +   18.018 * s,y +  -73.388 * s, threshold);
			_bez(x +   18.018 * s,y +  -73.388 * s,x +   21.663 * s,y +  -73.941 * s,x +   25.195 * s,y +  -74.218 * s,x +   28.613 * s,y +  -74.218 * s, threshold);
			_bez(x +   28.613 * s,y +  -74.218 * s,x +   36.816 * s,y +  -74.218 * s,x +   43.115 * s,y +  -72.419 * s,x +   47.509 * s,y +  -68.822 * s, threshold);
			_bez(x +   47.509 * s,y +  -68.822 * s,x +   51.904 * s,y +  -65.225 * s,x +   54.101 * s,y +  -60.090 * s,x +   54.101 * s,y +  -53.417 * s, threshold);
			_bez(x +   54.101 * s,y +  -53.417 * s,x +   54.101 * s,y +  -46.842 * s,x +   51.977 * s,y +  -41.658 * s,x +   47.729 * s,y +  -37.866 * s, threshold);
			_bez(x +   47.729 * s,y +  -37.866 * s,x +   43.481 * s,y +  -34.073 * s,x +   37.370 * s,y +  -31.884 * s,x +   29.394 * s,y +  -31.298 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   29.394 * s);
			_setf(o + ( 1 << 2), y +  -21.289 * s);
			_setf(o + ( 2 << 2), x +   22.607 * s);
			_setf(o + ( 3 << 2), y +  -21.289 * s);
			_setf(o + ( 4 << 2), x +   22.607 * s);
			_setf(o + ( 5 << 2), y +  -35.888 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   22.607 * s,y +  -35.888 * s,x +   27.165 * s,y +  -37.288 * s,x +   30.501 * s,y +  -39.485 * s,x +   32.617 * s,y +  -42.480 * s, threshold);
			_bez(x +   32.617 * s,y +  -42.480 * s,x +   34.733 * s,y +  -45.475 * s,x +   35.791 * s,y +  -49.478 * s,x +   35.791 * s,y +  -54.491 * s, threshold);
			_bez(x +   35.791 * s,y +  -54.491 * s,x +   35.791 * s,y +  -59.179 * s,x +   34.798 * s,y +  -62.719 * s,x +   32.812 * s,y +  -65.111 * s, threshold);
			_bez(x +   32.812 * s,y +  -65.111 * s,x +   30.827 * s,y +  -67.504 * s,x +   27.897 * s,y +  -68.700 * s,x +   24.023 * s,y +  -68.700 * s, threshold);
			_bez(x +   24.023 * s,y +  -68.700 * s,x +   20.443 * s,y +  -68.700 * s,x +   17.684 * s,y +  -67.626 * s,x +   15.747 * s,y +  -65.478 * s, threshold);
			_bez(x +   15.747 * s,y +  -65.478 * s,x +   13.810 * s,y +  -63.329 * s,x +   12.695 * s,y +  -60.139 * s,x +   12.402 * s,y +  -55.907 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    6.494 * s);
			_setf(o + ( 1 << 2), y +  -55.907 * s);
			_setf(o + ( 2 << 2), x +    6.494 * s);
			_setf(o + ( 3 << 2), y +  -70.897 * s);
			_setf(o + ( 4 << 2), x +   58.593 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 64:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   62.108 * s);
			_setf(o + ( 1 << 2), y +  -24.609 * s);
			_setf(o + ( 2 << 2), x +   62.108 * s);
			_setf(o + ( 3 << 2), y +  -28.320 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   62.108 * s,y +  -28.320 * s,x +   62.108 * s,y +  -32.519 * s,x +   61.099 * s,y +  -35.896 * s,x +   59.081 * s,y +  -38.452 * s, threshold);
			_bez(x +   59.081 * s,y +  -38.452 * s,x +   57.063 * s,y +  -41.007 * s,x +   54.410 * s,y +  -42.285 * s,x +   51.122 * s,y +  -42.285 * s, threshold);
			_bez(x +   51.122 * s,y +  -42.285 * s,x +   47.899 * s,y +  -42.285 * s,x +   45.304 * s,y +  -40.860 * s,x +   43.334 * s,y +  -38.012 * s, threshold);
			_bez(x +   43.334 * s,y +  -38.012 * s,x +   41.365 * s,y +  -35.164 * s,x +   40.380 * s,y +  -31.331 * s,x +   40.380 * s,y +  -26.513 * s, threshold);
			_bez(x +   40.380 * s,y +  -26.513 * s,x +   40.380 * s,y +  -21.696 * s,x +   41.365 * s,y +  -17.855 * s,x +   43.334 * s,y +  -14.990 * s, threshold);
			_bez(x +   43.334 * s,y +  -14.990 * s,x +   45.304 * s,y +  -12.125 * s,x +   47.899 * s,y +  -10.693 * s,x +   51.122 * s,y +  -10.693 * s, threshold);
			_bez(x +   51.122 * s,y +  -10.693 * s,x +   54.410 * s,y +  -10.693 * s,x +   57.063 * s,y +  -11.955 * s,x +   59.081 * s,y +  -14.477 * s, threshold);
			_bez(x +   59.081 * s,y +  -14.477 * s,x +   61.099 * s,y +  -17.000 * s,x +   62.108 * s,y +  -20.377 * s,x +   62.108 * s,y +  -24.609 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   62.108 * s);
			_setf(o + ( 1 << 2), y +  -11.719 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   62.108 * s,y +  -11.719 * s,x +   60.676 * s,y +   -9.375 * s,x +   58.796 * s,y +   -7.585 * s,x +   56.469 * s,y +   -6.348 * s, threshold);
			_bez(x +   56.469 * s,y +   -6.348 * s,x +   54.141 * s,y +   -5.111 * s,x +   51.513 * s,y +   -4.492 * s,x +   48.583 * s,y +   -4.492 * s, threshold);
			_bez(x +   48.583 * s,y +   -4.492 * s,x +   42.366 * s,y +   -4.492 * s,x +   37.483 * s,y +   -6.445 * s,x +   33.935 * s,y +  -10.351 * s, threshold);
			_bez(x +   33.935 * s,y +  -10.351 * s,x +   30.387 * s,y +  -14.258 * s,x +   28.613 * s,y +  -19.645 * s,x +   28.613 * s,y +  -26.513 * s, threshold);
			_bez(x +   28.613 * s,y +  -26.513 * s,x +   28.613 * s,y +  -33.382 * s,x +   30.387 * s,y +  -38.761 * s,x +   33.935 * s,y +  -42.651 * s, threshold);
			_bez(x +   33.935 * s,y +  -42.651 * s,x +   37.483 * s,y +  -46.541 * s,x +   42.366 * s,y +  -48.486 * s,x +   48.583 * s,y +  -48.486 * s, threshold);
			_bez(x +   48.583 * s,y +  -48.486 * s,x +   51.513 * s,y +  -48.486 * s,x +   54.141 * s,y +  -47.867 * s,x +   56.469 * s,y +  -46.630 * s, threshold);
			_bez(x +   56.469 * s,y +  -46.630 * s,x +   58.796 * s,y +  -45.393 * s,x +   60.676 * s,y +  -43.619 * s,x +   62.108 * s,y +  -41.308 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   62.108 * s);
			_setf(o + ( 1 << 2), y +  -47.411 * s);
			_setf(o + ( 2 << 2), x +   72.802 * s);
			_setf(o + ( 3 << 2), y +  -47.411 * s);
			_setf(o + ( 4 << 2), x +   72.802 * s);
			_setf(o + ( 5 << 2), y +  -11.181 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   72.802 * s,y +  -11.181 * s,x +   77.456 * s,y +  -12.451 * s,x +   81.053 * s,y +  -14.990 * s,x +   83.592 * s,y +  -18.799 * s, threshold);
			_bez(x +   83.592 * s,y +  -18.799 * s,x +   86.131 * s,y +  -22.607 * s,x +   87.401 * s,y +  -27.376 * s,x +   87.401 * s,y +  -33.105 * s, threshold);
			_bez(x +   87.401 * s,y +  -33.105 * s,x +   87.401 * s,y +  -37.760 * s,x +   86.506 * s,y +  -41.992 * s,x +   84.715 * s,y +  -45.800 * s, threshold);
			_bez(x +   84.715 * s,y +  -45.800 * s,x +   82.925 * s,y +  -49.609 * s,x +   80.192 * s,y +  -53.077 * s,x +   76.512 * s,y +  -56.200 * s, threshold);
			_bez(x +   76.512 * s,y +  -56.200 * s,x +   73.519 * s,y +  -58.741 * s,x +   70.002 * s,y +  -60.692 * s,x +   65.966 * s,y +  -62.060 * s, threshold);
			_bez(x +   65.966 * s,y +  -62.060 * s,x +   61.929 * s,y +  -63.427 * s,x +   57.632 * s,y +  -64.110 * s,x +   53.075 * s,y +  -64.110 * s, threshold);
			_bez(x +   53.075 * s,y +  -64.110 * s,x +   48.844 * s,y +  -64.110 * s,x +   44.889 * s,y +  -63.541 * s,x +   41.210 * s,y +  -62.401 * s, threshold);
			_bez(x +   41.210 * s,y +  -62.401 * s,x +   37.532 * s,y +  -61.262 * s,x +   34.152 * s,y +  -59.584 * s,x +   31.103 * s,y +  -57.323 * s, threshold);
			_bez(x +   31.103 * s,y +  -57.323 * s,x +   26.470 * s,y +  -53.888 * s,x +   22.924 * s,y +  -49.478 * s,x +   20.434 * s,y +  -44.140 * s, threshold);
			_bez(x +   20.434 * s,y +  -44.140 * s,x +   17.944 * s,y +  -38.801 * s,x +   16.699 * s,y +  -32.926 * s,x +   16.699 * s,y +  -26.513 * s, threshold);
			_bez(x +   16.699 * s,y +  -26.513 * s,x +   16.699 * s,y +  -21.468 * s,x +   17.488 * s,y +  -16.707 * s,x +   19.067 * s,y +  -12.231 * s, threshold);
			_bez(x +   19.067 * s,y +  -12.231 * s,x +   20.646 * s,y +   -7.755 * s,x +   22.866 * s,y +   -3.858 * s,x +   25.781 * s,y +   -0.586 * s, threshold);
			_bez(x +   25.781 * s,y +   -0.586 * s,x +   29.246 * s,y +    3.304 * s,x +   33.276 * s,y +    6.217 * s,x +   37.817 * s,y +    8.203 * s, threshold);
			_bez(x +   37.817 * s,y +    8.203 * s,x +   42.358 * s,y +   10.189 * s,x +   47.281 * s,y +   11.181 * s,x +   52.587 * s,y +   11.181 * s, threshold);
			_bez(x +   52.587 * s,y +   11.181 * s,x +   56.558 * s,y +   11.181 * s,x +   60.399 * s,y +   10.628 * s,x +   64.110 * s,y +    9.521 * s, threshold);
			_bez(x +   64.110 * s,y +    9.521 * s,x +   67.821 * s,y +    8.415 * s,x +   71.353 * s,y +    6.771 * s,x +   74.706 * s,y +    4.590 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   77.489 * s);
			_setf(o + ( 1 << 2), y +    9.180 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   77.489 * s,y +    9.180 * s,x +   73.322 * s,y +   11.914 * s,x +   68.985 * s,y +   13.965 * s,x +   64.476 * s,y +   15.332 * s, threshold);
			_bez(x +   64.476 * s,y +   15.332 * s,x +   59.968 * s,y +   16.699 * s,x +   55.370 * s,y +   17.383 * s,x +   50.683 * s,y +   17.383 * s, threshold);
			_bez(x +   50.683 * s,y +   17.383 * s,x +   44.368 * s,y +   17.383 * s,x +   38.574 * s,y +   16.357 * s,x +   33.300 * s,y +   14.306 * s, threshold);
			_bez(x +   33.300 * s,y +   14.306 * s,x +   28.027 * s,y +   12.256 * s,x +   23.331 * s,y +    9.171 * s,x +   19.189 * s,y +    5.078 * s, threshold);
			_bez(x +   19.189 * s,y +    5.078 * s,x +   15.096 * s,y +    1.033 * s,x +   11.963 * s,y +   -3.670 * s,x +    9.814 * s,y +   -9.057 * s, threshold);
			_bez(x +    9.814 * s,y +   -9.057 * s,x +    7.666 * s,y +  -14.445 * s,x +    6.592 * s,y +  -20.263 * s,x +    6.592 * s,y +  -26.513 * s, threshold);
			_bez(x +    6.592 * s,y +  -26.513 * s,x +    6.592 * s,y +  -32.763 * s,x +    7.666 * s,y +  -38.574 * s,x +    9.814 * s,y +  -43.945 * s, threshold);
			_bez(x +    9.814 * s,y +  -43.945 * s,x +   11.963 * s,y +  -49.316 * s,x +   15.080 * s,y +  -54.044 * s,x +   19.189 * s,y +  -58.105 * s, threshold);
			_bez(x +   19.189 * s,y +  -58.105 * s,x +   23.348 * s,y +  -62.214 * s,x +   28.100 * s,y +  -65.266 * s,x +   33.422 * s,y +  -67.284 * s, threshold);
			_bez(x +   33.422 * s,y +  -67.284 * s,x +   38.744 * s,y +  -69.302 * s,x +   44.742 * s,y +  -70.311 * s,x +   51.415 * s,y +  -70.311 * s, threshold);
			_bez(x +   51.415 * s,y +  -70.311 * s,x +   57.209 * s,y +  -70.311 * s,x +   62.483 * s,y +  -69.522 * s,x +   67.235 * s,y +  -67.943 * s, threshold);
			_bez(x +   67.235 * s,y +  -67.943 * s,x +   71.988 * s,y +  -66.365 * s,x +   76.218 * s,y +  -63.960 * s,x +   79.979 * s,y +  -60.790 * s, threshold);
			_bez(x +   79.979 * s,y +  -60.790 * s,x +   84.291 * s,y +  -57.156 * s,x +   87.548 * s,y +  -53.059 * s,x +   89.696 * s,y +  -48.437 * s, threshold);
			_bez(x +   89.696 * s,y +  -48.437 * s,x +   91.844 * s,y +  -43.814 * s,x +   92.919 * s,y +  -38.671 * s,x +   92.919 * s,y +  -33.007 * s, threshold);
			_bez(x +   92.919 * s,y +  -33.007 * s,x +   92.919 * s,y +  -24.023 * s,x +   90.347 * s,y +  -17.024 * s,x +   85.204 * s,y +  -12.012 * s, threshold);
			_bez(x +   85.204 * s,y +  -12.012 * s,x +   80.061 * s,y +   -6.999 * s,x +   72.866 * s,y +   -4.492 * s,x +   63.622 * s,y +   -4.492 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   62.108 * s);
			_setf(o + ( 1 << 2), y +   -4.492 * s);
			_setf(o + ( 2 << 2), x +   62.108 * s);
			_setf(o + ( 3 << 2), y +  -11.719 * s);
			_setf(o + ( 4 << 2), x +   99.998 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 65:
			
			o = _posf(44);
			_setf(o + ( 0 << 2), x +   -0.781 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   -0.781 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +    5.176 * s);
			_setf(o + ( 5 << 2), y +   -5.908 * s);
			_setf(o + ( 6 << 2), x +   32.617 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   44.287 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   71.777 * s);
			_setf(o + (11 << 2), y +   -5.908 * s);
			_setf(o + (12 << 2), x +   78.710 * s);
			_setf(o + (13 << 2), y +   -5.908 * s);
			_setf(o + (14 << 2), x +   78.710 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   44.580 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   44.580 * s);
			_setf(o + (19 << 2), y +   -5.908 * s);
			_setf(o + (20 << 2), x +   51.709 * s);
			_setf(o + (21 << 2), y +   -5.908 * s);
			_setf(o + (22 << 2), x +   45.703 * s);
			_setf(o + (23 << 2), y +  -20.800 * s);
			_setf(o + (24 << 2), x +   18.311 * s);
			_setf(o + (25 << 2), y +  -20.800 * s);
			_setf(o + (26 << 2), x +   12.207 * s);
			_setf(o + (27 << 2), y +   -5.908 * s);
			_setf(o + (28 << 2), x +   20.899 * s);
			_setf(o + (29 << 2), y +   -5.908 * s);
			_setf(o + (30 << 2), x +   20.899 * s);
			_setf(o + (31 << 2), y +       0. * s);
			_setf(o + (32 << 2), x +   -0.781 * s);
			_setf(o + (33 << 2), y +       0. * s);
			_setf(o + (34 << 2), x +   20.703 * s);
			_setf(o + (35 << 2), y +  -26.709 * s);
			_setf(o + (36 << 2), x +   43.310 * s);
			_setf(o + (37 << 2), y +  -26.709 * s);
			_setf(o + (38 << 2), x +   32.080 * s);
			_setf(o + (39 << 2), y +  -54.589 * s);
			_setf(o + (40 << 2), x +   20.703 * s);
			_setf(o + (41 << 2), y +  -26.709 * s);
			_setf(o + (42 << 2), x +   77.587 * s);
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
			_setb(o + 17, 1);
			_setb(o + 18, 2);
			_setb(o + 19, 2);
			_setb(o + 20, 2);
			_setb(o + 21, 1);
			
			case 66:
			
			o = _posf(14);
			_setf(o + ( 0 << 2), x +    4.688 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    4.688 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   14.014 * s);
			_setf(o + ( 5 << 2), y +   -5.908 * s);
			_setf(o + ( 6 << 2), x +   14.014 * s);
			_setf(o + ( 7 << 2), y +  -66.991 * s);
			_setf(o + ( 8 << 2), x +    4.688 * s);
			_setf(o + ( 9 << 2), y +  -66.991 * s);
			_setf(o + (10 << 2), x +    4.688 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   47.900 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			o = _posb(7);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_bez(x +   47.900 * s,y +  -72.899 * s,x +   56.786 * s,y +  -72.899 * s,x +   63.459 * s,y +  -71.402 * s,x +   67.919 * s,y +  -68.407 * s, threshold);
			_bez(x +   67.919 * s,y +  -68.407 * s,x +   72.379 * s,y +  -65.412 * s,x +   74.608 * s,y +  -60.904 * s,x +   74.608 * s,y +  -54.882 * s, threshold);
			_bez(x +   74.608 * s,y +  -54.882 * s,x +   74.608 * s,y +  -50.553 * s,x +   73.070 * s,y +  -47.118 * s,x +   69.994 * s,y +  -44.579 * s, threshold);
			_bez(x +   69.994 * s,y +  -44.579 * s,x +   66.918 * s,y +  -42.040 * s,x +   62.353 * s,y +  -40.445 * s,x +   56.298 * s,y +  -39.794 * s, threshold);
			_bez(x +   56.298 * s,y +  -39.794 * s,x +   63.622 * s,y +  -39.111 * s,x +   69.237 * s,y +  -37.158 * s,x +   73.144 * s,y +  -33.935 * s, threshold);
			_bez(x +   73.144 * s,y +  -33.935 * s,x +   77.050 * s,y +  -30.712 * s,x +   79.003 * s,y +  -26.432 * s,x +   79.003 * s,y +  -21.093 * s, threshold);
			_bez(x +   79.003 * s,y +  -21.093 * s,x +   79.003 * s,y +  -13.867 * s,x +   76.277 * s,y +   -8.545 * s,x +   70.824 * s,y +   -5.127 * s, threshold);
			_bez(x +   70.824 * s,y +   -5.127 * s,x +   65.372 * s,y +   -1.709 * s,x +   56.835 * s,y +       0. * s,x +   45.214 * s,y +       0. * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    4.688 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   32.812 * s);
			_setf(o + ( 3 << 2), y +  -42.480 * s);
			_setf(o + ( 4 << 2), x +   39.209 * s);
			_setf(o + ( 5 << 2), y +  -42.480 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_setb(o +  2, 2);
			_bez(x +   39.209 * s,y +  -42.480 * s,x +   44.807 * s,y +  -42.480 * s,x +   48.958 * s,y +  -43.497 * s,x +   51.660 * s,y +  -45.532 * s, threshold);
			_bez(x +   51.660 * s,y +  -45.532 * s,x +   54.361 * s,y +  -47.566 * s,x +   55.712 * s,y +  -50.683 * s,x +   55.712 * s,y +  -54.882 * s, threshold);
			_bez(x +   55.712 * s,y +  -54.882 * s,x +   55.712 * s,y +  -59.114 * s,x +   54.402 * s,y +  -62.190 * s,x +   51.782 * s,y +  -64.110 * s, threshold);
			_bez(x +   51.782 * s,y +  -64.110 * s,x +   49.161 * s,y +  -66.031 * s,x +   44.970 * s,y +  -66.991 * s,x +   39.209 * s,y +  -66.991 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   32.812 * s);
			_setf(o + ( 1 << 2), y +  -66.991 * s);
			_setf(o + ( 2 << 2), x +   32.812 * s);
			_setf(o + ( 3 << 2), y +  -42.480 * s);
			_setf(o + ( 4 << 2), x +   32.812 * s);
			_setf(o + ( 5 << 2), y +   -5.908 * s);
			_setf(o + ( 6 << 2), x +   39.794 * s);
			_setf(o + ( 7 << 2), y +   -5.908 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			_setb(o +  3, 2);
			_bez(x +   39.794 * s,y +   -5.908 * s,x +   46.012 * s,y +   -5.908 * s,x +   50.618 * s,y +   -7.145 * s,x +   53.613 * s,y +   -9.619 * s, threshold);
			_bez(x +   53.613 * s,y +   -9.619 * s,x +   56.607 * s,y +  -12.093 * s,x +   58.105 * s,y +  -15.917 * s,x +   58.105 * s,y +  -21.093 * s, threshold);
			_bez(x +   58.105 * s,y +  -21.093 * s,x +   58.105 * s,y +  -26.302 * s,x +   56.591 * s,y +  -30.192 * s,x +   53.564 * s,y +  -32.763 * s, threshold);
			_bez(x +   53.564 * s,y +  -32.763 * s,x +   50.537 * s,y +  -35.335 * s,x +   45.947 * s,y +  -36.621 * s,x +   39.794 * s,y +  -36.621 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   32.812 * s);
			_setf(o + ( 1 << 2), y +  -36.621 * s);
			_setf(o + ( 2 << 2), x +   32.812 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   84.520 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 67:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   74.510 * s);
			_setf(o + ( 1 << 2), y +  -20.800 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   74.510 * s,y +  -20.800 * s,x +   72.590 * s,y +  -13.281 * s,x +   69.139 * s,y +   -7.698 * s,x +   64.159 * s,y +   -4.053 * s, threshold);
			_bez(x +   64.159 * s,y +   -4.053 * s,x +   59.179 * s,y +   -0.407 * s,x +   52.489 * s,y +    1.416 * s,x +   44.091 * s,y +    1.416 * s, threshold);
			_bez(x +   44.091 * s,y +    1.416 * s,x +   31.786 * s,y +    1.416 * s,x +   22.062 * s,y +   -1.978 * s,x +   14.917 * s,y +   -8.765 * s, threshold);
			_bez(x +   14.917 * s,y +   -8.765 * s,x +    7.771 * s,y +  -15.551 * s,x +    4.199 * s,y +  -24.755 * s,x +    4.199 * s,y +  -36.376 * s, threshold);
			_bez(x +    4.199 * s,y +  -36.376 * s,x +    4.199 * s,y +  -48.030 * s,x +    7.771 * s,y +  -57.250 * s,x +   14.917 * s,y +  -64.037 * s, threshold);
			_bez(x +   14.917 * s,y +  -64.037 * s,x +   22.062 * s,y +  -70.824 * s,x +   31.786 * s,y +  -74.218 * s,x +   44.091 * s,y +  -74.218 * s, threshold);
			_bez(x +   44.091 * s,y +  -74.218 * s,x +   48.420 * s,y +  -74.218 * s,x +   52.929 * s,y +  -73.697 * s,x +   57.616 * s,y +  -72.655 * s, threshold);
			_bez(x +   57.616 * s,y +  -72.655 * s,x +   62.304 * s,y +  -71.613 * s,x +   67.268 * s,y +  -70.035 * s,x +   72.508 * s,y +  -67.919 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   72.508 * s);
			_setf(o + ( 1 << 2), y +  -49.999 * s);
			_setf(o + ( 2 << 2), x +   66.307 * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   66.307 * s,y +  -49.999 * s,x +   65.038 * s,y +  -56.119 * s,x +   62.727 * s,y +  -60.701 * s,x +   59.374 * s,y +  -63.744 * s, threshold);
			_bez(x +   59.374 * s,y +  -63.744 * s,x +   56.021 * s,y +  -66.788 * s,x +   51.594 * s,y +  -68.309 * s,x +   46.093 * s,y +  -68.309 * s, threshold);
			_bez(x +   46.093 * s,y +  -68.309 * s,x +   38.997 * s,y +  -68.309 * s,x +   33.723 * s,y +  -65.697 * s,x +   30.273 * s,y +  -60.473 * s, threshold);
			_bez(x +   30.273 * s,y +  -60.473 * s,x +   26.822 * s,y +  -55.248 * s,x +   25.097 * s,y +  -47.216 * s,x +   25.097 * s,y +  -36.376 * s, threshold);
			_bez(x +   25.097 * s,y +  -36.376 * s,x +   25.097 * s,y +  -25.537 * s,x +   26.822 * s,y +  -17.513 * s,x +   30.273 * s,y +  -12.304 * s, threshold);
			_bez(x +   30.273 * s,y +  -12.304 * s,x +   33.723 * s,y +   -7.096 * s,x +   39.029 * s,y +   -4.492 * s,x +   46.190 * s,y +   -4.492 * s, threshold);
			_bez(x +   46.190 * s,y +   -4.492 * s,x +   51.040 * s,y +   -4.492 * s,x +   55.004 * s,y +   -5.843 * s,x +   58.080 * s,y +   -8.545 * s, threshold);
			_bez(x +   58.080 * s,y +   -8.545 * s,x +   61.156 * s,y +  -11.247 * s,x +   63.394 * s,y +  -15.332 * s,x +   64.794 * s,y +  -20.800 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   74.510 * s);
			_setf(o + ( 1 << 2), y +  -20.800 * s);
			_setf(o + ( 2 << 2), x +   79.588 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 68:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   32.812 * s);
			_setf(o + ( 1 << 2), y +   -5.908 * s);
			_setf(o + ( 2 << 2), x +   39.599 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   39.599 * s,y +   -5.908 * s,x +   47.216 * s,y +   -5.908 * s,x +   52.791 * s,y +   -8.349 * s,x +   56.323 * s,y +  -13.232 * s, threshold);
			_bez(x +   56.323 * s,y +  -13.232 * s,x +   59.855 * s,y +  -18.115 * s,x +   61.621 * s,y +  -25.878 * s,x +   61.621 * s,y +  -36.523 * s, threshold);
			_bez(x +   61.621 * s,y +  -36.523 * s,x +   61.621 * s,y +  -47.102 * s,x +   59.863 * s,y +  -54.825 * s,x +   56.347 * s,y +  -59.691 * s, threshold);
			_bez(x +   56.347 * s,y +  -59.691 * s,x +   52.832 * s,y +  -64.558 * s,x +   47.249 * s,y +  -66.991 * s,x +   39.599 * s,y +  -66.991 * s, threshold);
			o = _posf(18);
			_setf(o + ( 0 << 2), x +   32.812 * s);
			_setf(o + ( 1 << 2), y +  -66.991 * s);
			_setf(o + ( 2 << 2), x +   32.812 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +    4.688 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    4.688 * s);
			_setf(o + ( 7 << 2), y +   -5.908 * s);
			_setf(o + ( 8 << 2), x +   14.014 * s);
			_setf(o + ( 9 << 2), y +   -5.908 * s);
			_setf(o + (10 << 2), x +   14.014 * s);
			_setf(o + (11 << 2), y +  -66.991 * s);
			_setf(o + (12 << 2), x +    4.688 * s);
			_setf(o + (13 << 2), y +  -66.991 * s);
			_setf(o + (14 << 2), x +    4.688 * s);
			_setf(o + (15 << 2), y +  -72.899 * s);
			_setf(o + (16 << 2), x +   42.090 * s);
			_setf(o + (17 << 2), y +  -72.899 * s);
			o = _posb(9);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_setb(o +  8, 2);
			_bez(x +   42.090 * s,y +  -72.899 * s,x +   55.175 * s,y +  -72.899 * s,x +   65.185 * s,y +  -69.774 * s,x +   72.118 * s,y +  -63.524 * s, threshold);
			_bez(x +   72.118 * s,y +  -63.524 * s,x +   79.052 * s,y +  -57.275 * s,x +   82.519 * s,y +  -48.274 * s,x +   82.519 * s,y +  -36.523 * s, threshold);
			_bez(x +   82.519 * s,y +  -36.523 * s,x +   82.519 * s,y +  -24.706 * s,x +   79.044 * s,y +  -15.665 * s,x +   72.094 * s,y +   -9.399 * s, threshold);
			_bez(x +   72.094 * s,y +   -9.399 * s,x +   65.144 * s,y +   -3.133 * s,x +   55.143 * s,y +       0. * s,x +   42.090 * s,y +       0. * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    4.688 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   86.718 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 69:
			
			o = _posf(52);
			_setf(o + ( 0 << 2), x +    4.687 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    4.687 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   14.013 * s);
			_setf(o + ( 5 << 2), y +   -5.908 * s);
			_setf(o + ( 6 << 2), x +   14.013 * s);
			_setf(o + ( 7 << 2), y +  -66.991 * s);
			_setf(o + ( 8 << 2), x +    4.687 * s);
			_setf(o + ( 9 << 2), y +  -66.991 * s);
			_setf(o + (10 << 2), x +    4.687 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   70.214 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   70.214 * s);
			_setf(o + (15 << 2), y +  -55.712 * s);
			_setf(o + (16 << 2), x +   63.475 * s);
			_setf(o + (17 << 2), y +  -55.712 * s);
			_setf(o + (18 << 2), x +   63.475 * s);
			_setf(o + (19 << 2), y +  -66.210 * s);
			_setf(o + (20 << 2), x +   32.812 * s);
			_setf(o + (21 << 2), y +  -66.210 * s);
			_setf(o + (22 << 2), x +   32.812 * s);
			_setf(o + (23 << 2), y +  -42.822 * s);
			_setf(o + (24 << 2), x +   51.903 * s);
			_setf(o + (25 << 2), y +  -42.822 * s);
			_setf(o + (26 << 2), x +   51.903 * s);
			_setf(o + (27 << 2), y +  -52.099 * s);
			_setf(o + (28 << 2), x +   58.593 * s);
			_setf(o + (29 << 2), y +  -52.099 * s);
			_setf(o + (30 << 2), x +   58.593 * s);
			_setf(o + (31 << 2), y +  -26.904 * s);
			_setf(o + (32 << 2), x +   51.903 * s);
			_setf(o + (33 << 2), y +  -26.904 * s);
			_setf(o + (34 << 2), x +   51.903 * s);
			_setf(o + (35 << 2), y +  -36.181 * s);
			_setf(o + (36 << 2), x +   32.812 * s);
			_setf(o + (37 << 2), y +  -36.181 * s);
			_setf(o + (38 << 2), x +   32.812 * s);
			_setf(o + (39 << 2), y +   -6.689 * s);
			_setf(o + (40 << 2), x +   64.403 * s);
			_setf(o + (41 << 2), y +   -6.689 * s);
			_setf(o + (42 << 2), x +   64.403 * s);
			_setf(o + (43 << 2), y +  -17.187 * s);
			_setf(o + (44 << 2), x +   71.092 * s);
			_setf(o + (45 << 2), y +  -17.187 * s);
			_setf(o + (46 << 2), x +   71.092 * s);
			_setf(o + (47 << 2), y +       0. * s);
			_setf(o + (48 << 2), x +    4.687 * s);
			_setf(o + (49 << 2), y +       0. * s);
			_setf(o + (50 << 2), x +   76.219 * s);
			_setf(o + (51 << 2), y +       0. * s);
			o = _posb(26);
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
			_setb(o + 25, 1);
			
			case 70:
			
			o = _posf(48);
			_setf(o + ( 0 << 2), x +    4.687 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    4.687 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   14.013 * s);
			_setf(o + ( 5 << 2), y +   -5.908 * s);
			_setf(o + ( 6 << 2), x +   14.013 * s);
			_setf(o + ( 7 << 2), y +  -66.991 * s);
			_setf(o + ( 8 << 2), x +    4.687 * s);
			_setf(o + ( 9 << 2), y +  -66.991 * s);
			_setf(o + (10 << 2), x +    4.687 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   69.677 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   69.677 * s);
			_setf(o + (15 << 2), y +  -55.712 * s);
			_setf(o + (16 << 2), x +   62.987 * s);
			_setf(o + (17 << 2), y +  -55.712 * s);
			_setf(o + (18 << 2), x +   62.987 * s);
			_setf(o + (19 << 2), y +  -66.210 * s);
			_setf(o + (20 << 2), x +   32.910 * s);
			_setf(o + (21 << 2), y +  -66.210 * s);
			_setf(o + (22 << 2), x +   32.910 * s);
			_setf(o + (23 << 2), y +  -42.822 * s);
			_setf(o + (24 << 2), x +   51.415 * s);
			_setf(o + (25 << 2), y +  -42.822 * s);
			_setf(o + (26 << 2), x +   51.415 * s);
			_setf(o + (27 << 2), y +  -52.099 * s);
			_setf(o + (28 << 2), x +   58.105 * s);
			_setf(o + (29 << 2), y +  -52.099 * s);
			_setf(o + (30 << 2), x +   58.105 * s);
			_setf(o + (31 << 2), y +  -26.904 * s);
			_setf(o + (32 << 2), x +   51.415 * s);
			_setf(o + (33 << 2), y +  -26.904 * s);
			_setf(o + (34 << 2), x +   51.415 * s);
			_setf(o + (35 << 2), y +  -36.181 * s);
			_setf(o + (36 << 2), x +   32.910 * s);
			_setf(o + (37 << 2), y +  -36.181 * s);
			_setf(o + (38 << 2), x +   32.910 * s);
			_setf(o + (39 << 2), y +   -5.908 * s);
			_setf(o + (40 << 2), x +   44.384 * s);
			_setf(o + (41 << 2), y +   -5.908 * s);
			_setf(o + (42 << 2), x +   44.384 * s);
			_setf(o + (43 << 2), y +       0. * s);
			_setf(o + (44 << 2), x +    4.687 * s);
			_setf(o + (45 << 2), y +       0. * s);
			_setf(o + (46 << 2), x +   70.995 * s);
			_setf(o + (47 << 2), y +       0. * s);
			o = _posb(24);
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
			_setb(o + 23, 1);
			
			case 71:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   68.798 * s);
			_setf(o + ( 1 << 2), y +  -49.999 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   68.798 * s,y +  -49.999 * s,x +   67.333 * s,y +  -56.444 * s,x +   64.892 * s,y +  -61.107 * s,x +   61.474 * s,y +  -63.988 * s, threshold);
			_bez(x +   61.474 * s,y +  -63.988 * s,x +   58.056 * s,y +  -66.869 * s,x +   53.238 * s,y +  -68.309 * s,x +   47.021 * s,y +  -68.309 * s, threshold);
			_bez(x +   47.021 * s,y +  -68.309 * s,x +   39.469 * s,y +  -68.309 * s,x +   33.927 * s,y +  -65.746 * s,x +   30.395 * s,y +  -60.619 * s, threshold);
			_bez(x +   30.395 * s,y +  -60.619 * s,x +   26.863 * s,y +  -55.492 * s,x +   25.097 * s,y +  -47.411 * s,x +   25.097 * s,y +  -36.376 * s, threshold);
			_bez(x +   25.097 * s,y +  -36.376 * s,x +   25.097 * s,y +  -25.439 * s,x +   26.790 * s,y +  -17.391 * s,x +   30.175 * s,y +  -12.231 * s, threshold);
			_bez(x +   30.175 * s,y +  -12.231 * s,x +   33.561 * s,y +   -7.072 * s,x +   38.834 * s,y +   -4.492 * s,x +   45.995 * s,y +   -4.492 * s, threshold);
			_bez(x +   45.995 * s,y +   -4.492 * s,x +   48.730 * s,y +   -4.492 * s,x +   51.269 * s,y +   -4.801 * s,x +   53.612 * s,y +   -5.420 * s, threshold);
			_bez(x +   53.612 * s,y +   -5.420 * s,x +   55.956 * s,y +   -6.038 * s,x +   58.088 * s,y +   -6.966 * s,x +   60.009 * s,y +   -8.203 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   60.009 * s);
			_setf(o + ( 1 << 2), y +  -28.222 * s);
			_setf(o + ( 2 << 2), x +   51.220 * s);
			_setf(o + ( 3 << 2), y +  -28.222 * s);
			_setf(o + ( 4 << 2), x +   51.220 * s);
			_setf(o + ( 5 << 2), y +  -34.081 * s);
			_setf(o + ( 6 << 2), x +   77.489 * s);
			_setf(o + ( 7 << 2), y +  -34.081 * s);
			_setf(o + ( 8 << 2), x +   77.489 * s);
			_setf(o + ( 9 << 2), y +   -6.103 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   77.489 * s,y +   -6.103 * s,x +   72.020 * s,y +   -3.564 * s,x +   66.560 * s,y +   -1.676 * s,x +   61.107 * s,y +   -0.439 * s, threshold);
			_bez(x +   61.107 * s,y +   -0.439 * s,x +   55.655 * s,y +    0.798 * s,x +   50.081 * s,y +    1.416 * s,x +   44.384 * s,y +    1.416 * s, threshold);
			_bez(x +   44.384 * s,y +    1.416 * s,x +   31.884 * s,y +    1.416 * s,x +   22.062 * s,y +   -1.953 * s,x +   14.917 * s,y +   -8.691 * s, threshold);
			_bez(x +   14.917 * s,y +   -8.691 * s,x +    7.772 * s,y +  -15.429 * s,x +    4.199 * s,y +  -24.658 * s,x +    4.199 * s,y +  -36.376 * s, threshold);
			_bez(x +    4.199 * s,y +  -36.376 * s,x +    4.199 * s,y +  -48.127 * s,x +    7.772 * s,y +  -57.372 * s,x +   14.917 * s,y +  -64.110 * s, threshold);
			_bez(x +   14.917 * s,y +  -64.110 * s,x +   22.062 * s,y +  -70.849 * s,x +   31.884 * s,y +  -74.218 * s,x +   44.384 * s,y +  -74.218 * s, threshold);
			_bez(x +   44.384 * s,y +  -74.218 * s,x +   49.592 * s,y +  -74.218 * s,x +   54.719 * s,y +  -73.697 * s,x +   59.765 * s,y +  -72.655 * s, threshold);
			_bez(x +   59.765 * s,y +  -72.655 * s,x +   64.810 * s,y +  -71.613 * s,x +   69.888 * s,y +  -70.035 * s,x +   74.999 * s,y +  -67.919 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   74.999 * s);
			_setf(o + ( 1 << 2), y +  -49.999 * s);
			_setf(o + ( 2 << 2), x +   68.798 * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			_setf(o + ( 4 << 2), x +   85.399 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 72:
			
			o = _posf(60);
			_setf(o + ( 0 << 2), x +    4.688 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    4.688 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   14.014 * s);
			_setf(o + ( 5 << 2), y +   -5.908 * s);
			_setf(o + ( 6 << 2), x +   14.014 * s);
			_setf(o + ( 7 << 2), y +  -66.991 * s);
			_setf(o + ( 8 << 2), x +    4.688 * s);
			_setf(o + ( 9 << 2), y +  -66.991 * s);
			_setf(o + (10 << 2), x +    4.688 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   42.187 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   42.187 * s);
			_setf(o + (15 << 2), y +  -66.991 * s);
			_setf(o + (16 << 2), x +   32.812 * s);
			_setf(o + (17 << 2), y +  -66.991 * s);
			_setf(o + (18 << 2), x +   32.812 * s);
			_setf(o + (19 << 2), y +  -42.480 * s);
			_setf(o + (20 << 2), x +   61.816 * s);
			_setf(o + (21 << 2), y +  -42.480 * s);
			_setf(o + (22 << 2), x +   61.816 * s);
			_setf(o + (23 << 2), y +  -66.991 * s);
			_setf(o + (24 << 2), x +   52.490 * s);
			_setf(o + (25 << 2), y +  -66.991 * s);
			_setf(o + (26 << 2), x +   52.490 * s);
			_setf(o + (27 << 2), y +  -72.899 * s);
			_setf(o + (28 << 2), x +   89.989 * s);
			_setf(o + (29 << 2), y +  -72.899 * s);
			_setf(o + (30 << 2), x +   89.989 * s);
			_setf(o + (31 << 2), y +  -66.991 * s);
			_setf(o + (32 << 2), x +   80.614 * s);
			_setf(o + (33 << 2), y +  -66.991 * s);
			_setf(o + (34 << 2), x +   80.614 * s);
			_setf(o + (35 << 2), y +   -5.908 * s);
			_setf(o + (36 << 2), x +   89.989 * s);
			_setf(o + (37 << 2), y +   -5.908 * s);
			_setf(o + (38 << 2), x +   89.989 * s);
			_setf(o + (39 << 2), y +       0. * s);
			_setf(o + (40 << 2), x +   52.490 * s);
			_setf(o + (41 << 2), y +       0. * s);
			_setf(o + (42 << 2), x +   52.490 * s);
			_setf(o + (43 << 2), y +   -5.908 * s);
			_setf(o + (44 << 2), x +   61.816 * s);
			_setf(o + (45 << 2), y +   -5.908 * s);
			_setf(o + (46 << 2), x +   61.816 * s);
			_setf(o + (47 << 2), y +  -35.790 * s);
			_setf(o + (48 << 2), x +   32.812 * s);
			_setf(o + (49 << 2), y +  -35.790 * s);
			_setf(o + (50 << 2), x +   32.812 * s);
			_setf(o + (51 << 2), y +   -5.908 * s);
			_setf(o + (52 << 2), x +   42.187 * s);
			_setf(o + (53 << 2), y +   -5.908 * s);
			_setf(o + (54 << 2), x +   42.187 * s);
			_setf(o + (55 << 2), y +       0. * s);
			_setf(o + (56 << 2), x +    4.688 * s);
			_setf(o + (57 << 2), y +       0. * s);
			_setf(o + (58 << 2), x +   94.481 * s);
			_setf(o + (59 << 2), y +       0. * s);
			o = _posb(30);
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
			
			case 73:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +    4.687 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    4.687 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   14.014 * s);
			_setf(o + ( 5 << 2), y +   -5.908 * s);
			_setf(o + ( 6 << 2), x +   14.014 * s);
			_setf(o + ( 7 << 2), y +  -66.991 * s);
			_setf(o + ( 8 << 2), x +    4.687 * s);
			_setf(o + ( 9 << 2), y +  -66.991 * s);
			_setf(o + (10 << 2), x +    4.687 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   42.187 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   42.187 * s);
			_setf(o + (15 << 2), y +  -66.991 * s);
			_setf(o + (16 << 2), x +   32.812 * s);
			_setf(o + (17 << 2), y +  -66.991 * s);
			_setf(o + (18 << 2), x +   32.812 * s);
			_setf(o + (19 << 2), y +   -5.908 * s);
			_setf(o + (20 << 2), x +   42.187 * s);
			_setf(o + (21 << 2), y +   -5.908 * s);
			_setf(o + (22 << 2), x +   42.187 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +    4.687 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   46.777 * s);
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
			
			case 74:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   -7.324 * s);
			_setf(o + ( 1 << 2), y +   17.480 * s);
			_setf(o + ( 2 << 2), x +   -7.324 * s);
			_setf(o + ( 3 << 2), y +    6.006 * s);
			_setf(o + ( 4 << 2), x +   -0.977 * s);
			_setf(o + ( 5 << 2), y +    6.006 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   -0.977 * s,y +    6.006 * s,x +   -0.782 * s,y +    9.066 * s,x +   -0.057 * s,y +   11.312 * s,x +    1.196 * s,y +   12.744 * s, threshold);
			_bez(x +    1.196 * s,y +   12.744 * s,x +    2.449 * s,y +   14.176 * s,x +    4.313 * s,y +   14.892 * s,x +    6.787 * s,y +   14.892 * s, threshold);
			_bez(x +    6.787 * s,y +   14.892 * s,x +    9.944 * s,y +   14.892 * s,x +   12.150 * s,y +   13.680 * s,x +   13.403 * s,y +   11.255 * s, threshold);
			_bez(x +   13.403 * s,y +   11.255 * s,x +   14.656 * s,y +    8.830 * s,x +   15.283 * s,y +    4.280 * s,x +   15.283 * s,y +   -2.393 * s, threshold);
			o = _posf(14);
			_setf(o + ( 0 << 2), x +   15.283 * s);
			_setf(o + ( 1 << 2), y +  -66.991 * s);
			_setf(o + ( 2 << 2), x +    4.687 * s);
			_setf(o + ( 3 << 2), y +  -66.991 * s);
			_setf(o + ( 4 << 2), x +    4.687 * s);
			_setf(o + ( 5 << 2), y +  -72.899 * s);
			_setf(o + ( 6 << 2), x +   43.505 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   43.505 * s);
			_setf(o + ( 9 << 2), y +  -66.991 * s);
			_setf(o + (10 << 2), x +   34.179 * s);
			_setf(o + (11 << 2), y +  -66.991 * s);
			_setf(o + (12 << 2), x +   34.179 * s);
			_setf(o + (13 << 2), y +   -2.002 * s);
			o = _posb(7);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_bez(x +   34.179 * s,y +   -2.002 * s,x +   34.179 * s,y +    5.908 * s,x +   32.185 * s,y +   11.686 * s,x +   28.197 * s,y +   15.332 * s, threshold);
			_bez(x +   28.197 * s,y +   15.332 * s,x +   24.210 * s,y +   18.978 * s,x +   17.871 * s,y +   20.800 * s,x +    9.179 * s,y +   20.800 * s, threshold);
			_bez(x +    9.179 * s,y +   20.800 * s,x +    6.477 * s,y +   20.800 * s,x +    3.759 * s,y +   20.524 * s,x +    1.025 * s,y +   19.970 * s, threshold);
			_bez(x +    1.025 * s,y +   19.970 * s,x +   -1.709 * s,y +   19.417 * s,x +   -4.492 * s,y +   18.587 * s,x +   -7.324 * s,y +   17.480 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   47.313 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 75:
			
			o = _posf(54);
			_setf(o + ( 0 << 2), x +    4.688 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    4.688 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   14.014 * s);
			_setf(o + ( 5 << 2), y +   -5.908 * s);
			_setf(o + ( 6 << 2), x +   14.014 * s);
			_setf(o + ( 7 << 2), y +  -66.991 * s);
			_setf(o + ( 8 << 2), x +    4.688 * s);
			_setf(o + ( 9 << 2), y +  -66.991 * s);
			_setf(o + (10 << 2), x +    4.688 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   42.187 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   42.187 * s);
			_setf(o + (15 << 2), y +  -66.991 * s);
			_setf(o + (16 << 2), x +   32.812 * s);
			_setf(o + (17 << 2), y +  -66.991 * s);
			_setf(o + (18 << 2), x +   32.812 * s);
			_setf(o + (19 << 2), y +  -40.380 * s);
			_setf(o + (20 << 2), x +   63.720 * s);
			_setf(o + (21 << 2), y +  -66.991 * s);
			_setf(o + (22 << 2), x +   55.908 * s);
			_setf(o + (23 << 2), y +  -66.991 * s);
			_setf(o + (24 << 2), x +   55.908 * s);
			_setf(o + (25 << 2), y +  -72.899 * s);
			_setf(o + (26 << 2), x +   83.105 * s);
			_setf(o + (27 << 2), y +  -72.899 * s);
			_setf(o + (28 << 2), x +   83.105 * s);
			_setf(o + (29 << 2), y +  -66.991 * s);
			_setf(o + (30 << 2), x +   73.388 * s);
			_setf(o + (31 << 2), y +  -66.991 * s);
			_setf(o + (32 << 2), x +   47.216 * s);
			_setf(o + (33 << 2), y +  -44.482 * s);
			_setf(o + (34 << 2), x +   82.812 * s);
			_setf(o + (35 << 2), y +   -5.908 * s);
			_setf(o + (36 << 2), x +   89.989 * s);
			_setf(o + (37 << 2), y +   -5.908 * s);
			_setf(o + (38 << 2), x +   89.989 * s);
			_setf(o + (39 << 2), y +       0. * s);
			_setf(o + (40 << 2), x +   65.283 * s);
			_setf(o + (41 << 2), y +       0. * s);
			_setf(o + (42 << 2), x +   32.812 * s);
			_setf(o + (43 << 2), y +  -35.400 * s);
			_setf(o + (44 << 2), x +   32.812 * s);
			_setf(o + (45 << 2), y +   -5.908 * s);
			_setf(o + (46 << 2), x +   42.187 * s);
			_setf(o + (47 << 2), y +   -5.908 * s);
			_setf(o + (48 << 2), x +   42.187 * s);
			_setf(o + (49 << 2), y +       0. * s);
			_setf(o + (50 << 2), x +    4.688 * s);
			_setf(o + (51 << 2), y +       0. * s);
			_setf(o + (52 << 2), x +   86.913 * s);
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
			
			case 76:
			
			o = _posf(32);
			_setf(o + ( 0 << 2), x +    4.688 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    4.688 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   14.014 * s);
			_setf(o + ( 5 << 2), y +   -5.908 * s);
			_setf(o + ( 6 << 2), x +   14.014 * s);
			_setf(o + ( 7 << 2), y +  -66.991 * s);
			_setf(o + ( 8 << 2), x +    4.688 * s);
			_setf(o + ( 9 << 2), y +  -66.991 * s);
			_setf(o + (10 << 2), x +    4.688 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   42.187 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   42.187 * s);
			_setf(o + (15 << 2), y +  -66.991 * s);
			_setf(o + (16 << 2), x +   32.812 * s);
			_setf(o + (17 << 2), y +  -66.991 * s);
			_setf(o + (18 << 2), x +   32.812 * s);
			_setf(o + (19 << 2), y +   -6.689 * s);
			_setf(o + (20 << 2), x +   61.523 * s);
			_setf(o + (21 << 2), y +   -6.689 * s);
			_setf(o + (22 << 2), x +   61.523 * s);
			_setf(o + (23 << 2), y +  -18.213 * s);
			_setf(o + (24 << 2), x +   68.114 * s);
			_setf(o + (25 << 2), y +  -18.213 * s);
			_setf(o + (26 << 2), x +   68.114 * s);
			_setf(o + (27 << 2), y +       0. * s);
			_setf(o + (28 << 2), x +    4.688 * s);
			_setf(o + (29 << 2), y +       0. * s);
			_setf(o + (30 << 2), x +   70.312 * s);
			_setf(o + (31 << 2), y +       0. * s);
			o = _posb(16);
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
			
			case 77:
			
			o = _posf(54);
			_setf(o + ( 0 << 2), x +    4.199 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    4.199 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   13.476 * s);
			_setf(o + ( 5 << 2), y +   -5.908 * s);
			_setf(o + ( 6 << 2), x +   13.476 * s);
			_setf(o + ( 7 << 2), y +  -66.991 * s);
			_setf(o + ( 8 << 2), x +    4.199 * s);
			_setf(o + ( 9 << 2), y +  -66.991 * s);
			_setf(o + (10 << 2), x +    4.199 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   34.277 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   55.077 * s);
			_setf(o + (15 << 2), y +  -26.123 * s);
			_setf(o + (16 << 2), x +   75.975 * s);
			_setf(o + (17 << 2), y +  -72.899 * s);
			_setf(o + (18 << 2), x +  106.004 * s);
			_setf(o + (19 << 2), y +  -72.899 * s);
			_setf(o + (20 << 2), x +  106.004 * s);
			_setf(o + (21 << 2), y +  -66.991 * s);
			_setf(o + (22 << 2), x +   96.678 * s);
			_setf(o + (23 << 2), y +  -66.991 * s);
			_setf(o + (24 << 2), x +   96.678 * s);
			_setf(o + (25 << 2), y +   -5.908 * s);
			_setf(o + (26 << 2), x +  106.004 * s);
			_setf(o + (27 << 2), y +   -5.908 * s);
			_setf(o + (28 << 2), x +  106.004 * s);
			_setf(o + (29 << 2), y +       0. * s);
			_setf(o + (30 << 2), x +   68.505 * s);
			_setf(o + (31 << 2), y +       0. * s);
			_setf(o + (32 << 2), x +   68.505 * s);
			_setf(o + (33 << 2), y +   -5.908 * s);
			_setf(o + (34 << 2), x +   77.782 * s);
			_setf(o + (35 << 2), y +   -5.908 * s);
			_setf(o + (36 << 2), x +   77.782 * s);
			_setf(o + (37 << 2), y +  -61.522 * s);
			_setf(o + (38 << 2), x +   55.175 * s);
			_setf(o + (39 << 2), y +  -10.693 * s);
			_setf(o + (40 << 2), x +   42.822 * s);
			_setf(o + (41 << 2), y +  -10.693 * s);
			_setf(o + (42 << 2), x +   20.312 * s);
			_setf(o + (43 << 2), y +  -61.522 * s);
			_setf(o + (44 << 2), x +   20.312 * s);
			_setf(o + (45 << 2), y +   -5.908 * s);
			_setf(o + (46 << 2), x +   29.589 * s);
			_setf(o + (47 << 2), y +   -5.908 * s);
			_setf(o + (48 << 2), x +   29.589 * s);
			_setf(o + (49 << 2), y +       0. * s);
			_setf(o + (50 << 2), x +    4.199 * s);
			_setf(o + (51 << 2), y +       0. * s);
			_setf(o + (52 << 2), x +  110.692 * s);
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
			
			case 78:
			
			o = _posf(44);
			_setf(o + ( 0 << 2), x +    4.394 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    4.394 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   13.720 * s);
			_setf(o + ( 5 << 2), y +   -5.908 * s);
			_setf(o + ( 6 << 2), x +   13.720 * s);
			_setf(o + ( 7 << 2), y +  -66.991 * s);
			_setf(o + ( 8 << 2), x +    4.394 * s);
			_setf(o + ( 9 << 2), y +  -66.991 * s);
			_setf(o + (10 << 2), x +    4.394 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   27.197 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   71.190 * s);
			_setf(o + (15 << 2), y +  -21.289 * s);
			_setf(o + (16 << 2), x +   71.190 * s);
			_setf(o + (17 << 2), y +  -66.991 * s);
			_setf(o + (18 << 2), x +   61.913 * s);
			_setf(o + (19 << 2), y +  -66.991 * s);
			_setf(o + (20 << 2), x +   61.913 * s);
			_setf(o + (21 << 2), y +  -72.899 * s);
			_setf(o + (22 << 2), x +   87.401 * s);
			_setf(o + (23 << 2), y +  -72.899 * s);
			_setf(o + (24 << 2), x +   87.401 * s);
			_setf(o + (25 << 2), y +  -66.991 * s);
			_setf(o + (26 << 2), x +   78.075 * s);
			_setf(o + (27 << 2), y +  -66.991 * s);
			_setf(o + (28 << 2), x +   78.075 * s);
			_setf(o + (29 << 2), y +       0. * s);
			_setf(o + (30 << 2), x +   65.282 * s);
			_setf(o + (31 << 2), y +       0. * s);
			_setf(o + (32 << 2), x +   20.605 * s);
			_setf(o + (33 << 2), y +  -52.685 * s);
			_setf(o + (34 << 2), x +   20.605 * s);
			_setf(o + (35 << 2), y +   -5.908 * s);
			_setf(o + (36 << 2), x +   29.882 * s);
			_setf(o + (37 << 2), y +   -5.908 * s);
			_setf(o + (38 << 2), x +   29.882 * s);
			_setf(o + (39 << 2), y +       0. * s);
			_setf(o + (40 << 2), x +    4.394 * s);
			_setf(o + (41 << 2), y +       0. * s);
			_setf(o + (42 << 2), x +   91.405 * s);
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
			
			case 79:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   43.505 * s);
			_setf(o + ( 1 << 2), y +   -4.492 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   43.505 * s,y +   -4.492 * s,x +   49.722 * s,y +   -4.492 * s,x +   54.344 * s,y +   -7.112 * s,x +   57.372 * s,y +  -12.353 * s, threshold);
			_bez(x +   57.372 * s,y +  -12.353 * s,x +   60.399 * s,y +  -17.594 * s,x +   61.913 * s,y +  -25.602 * s,x +   61.913 * s,y +  -36.376 * s, threshold);
			_bez(x +   61.913 * s,y +  -36.376 * s,x +   61.913 * s,y +  -47.183 * s,x +   60.399 * s,y +  -55.207 * s,x +   57.372 * s,y +  -60.448 * s, threshold);
			_bez(x +   57.372 * s,y +  -60.448 * s,x +   54.344 * s,y +  -65.689 * s,x +   49.722 * s,y +  -68.309 * s,x +   43.505 * s,y +  -68.309 * s, threshold);
			_bez(x +   43.505 * s,y +  -68.309 * s,x +   37.320 * s,y +  -68.309 * s,x +   32.706 * s,y +  -65.665 * s,x +   29.662 * s,y +  -60.375 * s, threshold);
			_bez(x +   29.662 * s,y +  -60.375 * s,x +   26.619 * s,y +  -55.085 * s,x +   25.097 * s,y +  -47.086 * s,x +   25.097 * s,y +  -36.376 * s, threshold);
			_bez(x +   25.097 * s,y +  -36.376 * s,x +   25.097 * s,y +  -25.700 * s,x +   26.619 * s,y +  -17.716 * s,x +   29.662 * s,y +  -12.427 * s, threshold);
			_bez(x +   29.662 * s,y +  -12.427 * s,x +   32.706 * s,y +   -7.137 * s,x +   37.320 * s,y +   -4.492 * s,x +   43.505 * s,y +   -4.492 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   43.505 * s);
			_setf(o + ( 1 << 2), y +    1.416 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   43.505 * s,y +    1.416 * s,x +   31.233 * s,y +    1.416 * s,x +   21.614 * s,y +   -1.937 * s,x +   14.648 * s,y +   -8.642 * s, threshold);
			_bez(x +   14.648 * s,y +   -8.642 * s,x +    7.682 * s,y +  -15.348 * s,x +    4.199 * s,y +  -24.593 * s,x +    4.199 * s,y +  -36.376 * s, threshold);
			_bez(x +    4.199 * s,y +  -36.376 * s,x +    4.199 * s,y +  -48.160 * s,x +    7.690 * s,y +  -57.413 * s,x +   14.672 * s,y +  -64.135 * s, threshold);
			_bez(x +   14.672 * s,y +  -64.135 * s,x +   21.654 * s,y +  -70.857 * s,x +   31.266 * s,y +  -74.218 * s,x +   43.505 * s,y +  -74.218 * s, threshold);
			_bez(x +   43.505 * s,y +  -74.218 * s,x +   55.776 * s,y +  -74.218 * s,x +   65.396 * s,y +  -70.865 * s,x +   72.362 * s,y +  -64.159 * s, threshold);
			_bez(x +   72.362 * s,y +  -64.159 * s,x +   79.328 * s,y +  -57.453 * s,x +   82.811 * s,y +  -48.193 * s,x +   82.811 * s,y +  -36.376 * s, threshold);
			_bez(x +   82.811 * s,y +  -36.376 * s,x +   82.811 * s,y +  -24.593 * s,x +   79.320 * s,y +  -15.348 * s,x +   72.337 * s,y +   -8.642 * s, threshold);
			_bez(x +   72.337 * s,y +   -8.642 * s,x +   65.355 * s,y +   -1.937 * s,x +   55.744 * s,y +    1.416 * s,x +   43.505 * s,y +    1.416 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   87.108 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 80:
			
			o = _posf(14);
			_setf(o + ( 0 << 2), x +    4.687 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    4.687 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   14.013 * s);
			_setf(o + ( 5 << 2), y +   -5.908 * s);
			_setf(o + ( 6 << 2), x +   14.013 * s);
			_setf(o + ( 7 << 2), y +  -66.991 * s);
			_setf(o + ( 8 << 2), x +    4.687 * s);
			_setf(o + ( 9 << 2), y +  -66.991 * s);
			_setf(o + (10 << 2), x +    4.687 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   46.190 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			o = _posb(7);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_bez(x +   46.190 * s,y +  -72.899 * s,x +   54.296 * s,y +  -72.899 * s,x +   60.741 * s,y +  -70.971 * s,x +   65.526 * s,y +  -67.113 * s, threshold);
			_bez(x +   65.526 * s,y +  -67.113 * s,x +   70.311 * s,y +  -63.256 * s,x +   72.704 * s,y +  -58.088 * s,x +   72.704 * s,y +  -51.610 * s, threshold);
			_bez(x +   72.704 * s,y +  -51.610 * s,x +   72.704 * s,y +  -45.100 * s,x +   70.303 * s,y +  -39.900 * s,x +   65.501 * s,y +  -36.010 * s, threshold);
			_bez(x +   65.501 * s,y +  -36.010 * s,x +   60.700 * s,y +  -32.120 * s,x +   54.263 * s,y +  -30.175 * s,x +   46.190 * s,y +  -30.175 * s, threshold);
			o = _posf(14);
			_setf(o + ( 0 << 2), x +   32.812 * s);
			_setf(o + ( 1 << 2), y +  -30.175 * s);
			_setf(o + ( 2 << 2), x +   32.812 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   44.579 * s);
			_setf(o + ( 5 << 2), y +   -5.908 * s);
			_setf(o + ( 6 << 2), x +   44.579 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    4.687 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   32.812 * s);
			_setf(o + (11 << 2), y +  -36.083 * s);
			_setf(o + (12 << 2), x +   38.280 * s);
			_setf(o + (13 << 2), y +  -36.083 * s);
			o = _posb(7);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_setb(o +  6, 2);
			_bez(x +   38.280 * s,y +  -36.083 * s,x +   42.512 * s,y +  -36.083 * s,x +   45.889 * s,y +  -37.491 * s,x +   48.412 * s,y +  -40.307 * s, threshold);
			_bez(x +   48.412 * s,y +  -40.307 * s,x +   50.935 * s,y +  -43.123 * s,x +   52.196 * s,y +  -46.890 * s,x +   52.196 * s,y +  -51.610 * s, threshold);
			_bez(x +   52.196 * s,y +  -51.610 * s,x +   52.196 * s,y +  -56.298 * s,x +   50.943 * s,y +  -60.033 * s,x +   48.436 * s,y +  -62.816 * s, threshold);
			_bez(x +   48.436 * s,y +  -62.816 * s,x +   45.930 * s,y +  -65.600 * s,x +   42.544 * s,y +  -66.991 * s,x +   38.280 * s,y +  -66.991 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   32.812 * s);
			_setf(o + ( 1 << 2), y +  -66.991 * s);
			_setf(o + ( 2 << 2), x +   32.812 * s);
			_setf(o + ( 3 << 2), y +  -36.083 * s);
			_setf(o + ( 4 << 2), x +   75.194 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 81:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   43.212 * s);
			_setf(o + ( 1 << 2), y +    1.416 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   43.212 * s,y +    1.416 * s,x +   30.907 * s,y +    1.221 * s,x +   21.329 * s,y +   -2.197 * s,x +   14.477 * s,y +   -8.838 * s, threshold);
			_bez(x +   14.477 * s,y +   -8.838 * s,x +    7.625 * s,y +  -15.478 * s,x +    4.199 * s,y +  -24.657 * s,x +    4.199 * s,y +  -36.376 * s, threshold);
			_bez(x +    4.199 * s,y +  -36.376 * s,x +    4.199 * s,y +  -48.160 * s,x +    7.690 * s,y +  -57.413 * s,x +   14.672 * s,y +  -64.135 * s, threshold);
			_bez(x +   14.672 * s,y +  -64.135 * s,x +   21.655 * s,y +  -70.857 * s,x +   31.266 * s,y +  -74.218 * s,x +   43.505 * s,y +  -74.218 * s, threshold);
			_bez(x +   43.505 * s,y +  -74.218 * s,x +   55.777 * s,y +  -74.218 * s,x +   65.396 * s,y +  -70.865 * s,x +   72.362 * s,y +  -64.159 * s, threshold);
			_bez(x +   72.362 * s,y +  -64.159 * s,x +   79.328 * s,y +  -57.453 * s,x +   82.811 * s,y +  -48.193 * s,x +   82.811 * s,y +  -36.376 * s, threshold);
			_bez(x +   82.811 * s,y +  -36.376 * s,x +   82.811 * s,y +  -26.025 * s,x +   80.134 * s,y +  -17.627 * s,x +   74.779 * s,y +  -11.181 * s, threshold);
			_bez(x +   74.779 * s,y +  -11.181 * s,x +   69.424 * s,y +   -4.736 * s,x +   61.799 * s,y +   -0.749 * s,x +   51.903 * s,y +    0.781 * s, threshold);
			_bez(x +   51.903 * s,y +    0.781 * s,x +   53.628 * s,y +    2.637 * s,x +   55.728 * s,y +    3.971 * s,x +   58.202 * s,y +    4.785 * s, threshold);
			_bez(x +   58.202 * s,y +    4.785 * s,x +   60.676 * s,y +    5.599 * s,x +   63.882 * s,y +    6.006 * s,x +   67.821 * s,y +    6.006 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   70.311 * s);
			_setf(o + ( 1 << 2), y +    6.006 * s);
			_setf(o + ( 2 << 2), x +   70.311 * s);
			_setf(o + ( 3 << 2), y +   18.017 * s);
			_setf(o + ( 4 << 2), x +   68.895 * s);
			_setf(o + ( 5 << 2), y +   18.017 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   68.895 * s,y +   18.017 * s,x +   62.710 * s,y +   18.017 * s,x +   57.551 * s,y +   16.683 * s,x +   53.417 * s,y +   14.013 * s, threshold);
			_bez(x +   53.417 * s,y +   14.013 * s,x +   49.283 * s,y +   11.344 * s,x +   45.881 * s,y +    7.145 * s,x +   43.212 * s,y +    1.416 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   43.505 * s);
			_setf(o + ( 1 << 2), y +   -4.492 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   43.505 * s,y +   -4.492 * s,x +   49.722 * s,y +   -4.492 * s,x +   54.345 * s,y +   -7.112 * s,x +   57.372 * s,y +  -12.353 * s, threshold);
			_bez(x +   57.372 * s,y +  -12.353 * s,x +   60.399 * s,y +  -17.594 * s,x +   61.913 * s,y +  -25.602 * s,x +   61.913 * s,y +  -36.376 * s, threshold);
			_bez(x +   61.913 * s,y +  -36.376 * s,x +   61.913 * s,y +  -47.183 * s,x +   60.399 * s,y +  -55.207 * s,x +   57.372 * s,y +  -60.448 * s, threshold);
			_bez(x +   57.372 * s,y +  -60.448 * s,x +   54.345 * s,y +  -65.689 * s,x +   49.722 * s,y +  -68.309 * s,x +   43.505 * s,y +  -68.309 * s, threshold);
			_bez(x +   43.505 * s,y +  -68.309 * s,x +   37.320 * s,y +  -68.309 * s,x +   32.706 * s,y +  -65.665 * s,x +   29.662 * s,y +  -60.375 * s, threshold);
			_bez(x +   29.662 * s,y +  -60.375 * s,x +   26.619 * s,y +  -55.085 * s,x +   25.097 * s,y +  -47.086 * s,x +   25.097 * s,y +  -36.376 * s, threshold);
			_bez(x +   25.097 * s,y +  -36.376 * s,x +   25.097 * s,y +  -25.700 * s,x +   26.619 * s,y +  -17.716 * s,x +   29.662 * s,y +  -12.427 * s, threshold);
			_bez(x +   29.662 * s,y +  -12.427 * s,x +   32.706 * s,y +   -7.137 * s,x +   37.320 * s,y +   -4.492 * s,x +   43.505 * s,y +   -4.492 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   87.108 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 82:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   53.075 * s);
			_setf(o + ( 1 << 2), y +  -35.595 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   53.075 * s,y +  -35.595 * s,x +   55.972 * s,y +  -35.172 * s,x +   58.414 * s,y +  -34.212 * s,x +   60.399 * s,y +  -32.714 * s, threshold);
			_bez(x +   60.399 * s,y +  -32.714 * s,x +   62.385 * s,y +  -31.217 * s,x +   64.095 * s,y +  -29.044 * s,x +   65.575 * s,y +  -26.220 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   76.219 * s);
			_setf(o + ( 1 << 2), y +   -5.908 * s);
			_setf(o + ( 2 << 2), x +   83.690 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   83.690 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   59.716 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   48.095 * s);
			_setf(o + ( 9 << 2), y +  -22.021 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   48.095 * s,y +  -22.021 * s,x +   45.724 * s,y +  -26.514 * s,x +   43.936 * s,y +  -29.484 * s,x +   42.358 * s,y +  -30.737 * s, threshold);
			_bez(x +   42.358 * s,y +  -30.737 * s,x +   40.779 * s,y +  -31.990 * s,x +   38.590 * s,y +  -32.617 * s,x +   35.791 * s,y +  -32.617 * s, threshold);
			o = _posf(22);
			_setf(o + ( 0 << 2), x +   32.812 * s);
			_setf(o + ( 1 << 2), y +  -32.617 * s);
			_setf(o + ( 2 << 2), x +   32.812 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   42.187 * s);
			_setf(o + ( 5 << 2), y +   -5.908 * s);
			_setf(o + ( 6 << 2), x +   42.187 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    4.687 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +    4.687 * s);
			_setf(o + (11 << 2), y +   -5.908 * s);
			_setf(o + (12 << 2), x +   14.013 * s);
			_setf(o + (13 << 2), y +   -5.908 * s);
			_setf(o + (14 << 2), x +   14.013 * s);
			_setf(o + (15 << 2), y +  -66.991 * s);
			_setf(o + (16 << 2), x +    4.687 * s);
			_setf(o + (17 << 2), y +  -66.991 * s);
			_setf(o + (18 << 2), x +    4.687 * s);
			_setf(o + (19 << 2), y +  -72.899 * s);
			_setf(o + (20 << 2), x +   46.288 * s);
			_setf(o + (21 << 2), y +  -72.899 * s);
			o = _posb(11);
			_setb(o +  0, 2);
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
			_bez(x +   46.288 * s,y +  -72.899 * s,x +   54.751 * s,y +  -72.899 * s,x +   61.286 * s,y +  -71.198 * s,x +   65.892 * s,y +  -67.797 * s, threshold);
			_bez(x +   65.892 * s,y +  -67.797 * s,x +   70.499 * s,y +  -64.395 * s,x +   72.802 * s,y +  -59.569 * s,x +   72.802 * s,y +  -53.319 * s, threshold);
			_bez(x +   72.802 * s,y +  -53.319 * s,x +   72.802 * s,y +  -48.241 * s,x +   71.166 * s,y +  -44.229 * s,x +   67.894 * s,y +  -41.283 * s, threshold);
			_bez(x +   67.894 * s,y +  -41.283 * s,x +   64.623 * s,y +  -38.338 * s,x +   59.683 * s,y +  -36.441 * s,x +   53.075 * s,y +  -35.595 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   32.812 * s);
			_setf(o + ( 1 << 2), y +  -38.476 * s);
			_setf(o + ( 2 << 2), x +   39.208 * s);
			_setf(o + ( 3 << 2), y +  -38.476 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   39.208 * s,y +  -38.476 * s,x +   43.765 * s,y +  -38.476 * s,x +   47.273 * s,y +  -39.713 * s,x +   49.731 * s,y +  -42.187 * s, threshold);
			_bez(x +   49.731 * s,y +  -42.187 * s,x +   52.188 * s,y +  -44.661 * s,x +   53.417 * s,y +  -48.193 * s,x +   53.417 * s,y +  -52.782 * s, threshold);
			_bez(x +   53.417 * s,y +  -52.782 * s,x +   53.417 * s,y +  -57.372 * s,x +   52.188 * s,y +  -60.888 * s,x +   49.731 * s,y +  -63.329 * s, threshold);
			_bez(x +   49.731 * s,y +  -63.329 * s,x +   47.273 * s,y +  -65.770 * s,x +   43.765 * s,y +  -66.991 * s,x +   39.208 * s,y +  -66.991 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   32.812 * s);
			_setf(o + ( 1 << 2), y +  -66.991 * s);
			_setf(o + ( 2 << 2), x +   32.812 * s);
			_setf(o + ( 3 << 2), y +  -38.476 * s);
			_setf(o + ( 4 << 2), x +   83.104 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 83:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    7.715 * s);
			_setf(o + ( 1 << 2), y +   -3.516 * s);
			_setf(o + ( 2 << 2), x +    7.715 * s);
			_setf(o + ( 3 << 2), y +  -20.800 * s);
			_setf(o + ( 4 << 2), x +   13.916 * s);
			_setf(o + ( 5 << 2), y +  -20.800 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   13.916 * s,y +  -20.800 * s,x +   14.860 * s,y +  -15.332 * s,x +   17.090 * s,y +  -11.247 * s,x +   20.605 * s,y +   -8.545 * s, threshold);
			_bez(x +   20.605 * s,y +   -8.545 * s,x +   24.121 * s,y +   -5.843 * s,x +   28.987 * s,y +   -4.492 * s,x +   35.205 * s,y +   -4.492 * s, threshold);
			_bez(x +   35.205 * s,y +   -4.492 * s,x +   40.250 * s,y +   -4.492 * s,x +   44.091 * s,y +   -5.452 * s,x +   46.728 * s,y +   -7.373 * s, threshold);
			_bez(x +   46.728 * s,y +   -7.373 * s,x +   49.365 * s,y +   -9.293 * s,x +   50.683 * s,y +  -12.109 * s,x +   50.683 * s,y +  -15.820 * s, threshold);
			_bez(x +   50.683 * s,y +  -15.820 * s,x +   50.683 * s,y +  -18.750 * s,x +   49.788 * s,y +  -21.028 * s,x +   47.998 * s,y +  -22.656 * s, threshold);
			_bez(x +   47.998 * s,y +  -22.656 * s,x +   46.207 * s,y +  -24.283 * s,x +   42.518 * s,y +  -25.821 * s,x +   36.914 * s,y +  -27.197 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   25.976 * s);
			_setf(o + ( 1 << 2), y +  -29.882 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   25.976 * s,y +  -29.882 * s,x +   18.830 * s,y +  -31.637 * s,x +   13.835 * s,y +  -34.236 * s,x +   10.938 * s,y +  -37.475 * s, threshold);
			_bez(x +   10.938 * s,y +  -37.475 * s,x +    8.040 * s,y +  -40.714 * s,x +    6.592 * s,y +  -45.328 * s,x +    6.592 * s,y +  -51.318 * s, threshold);
			_bez(x +    6.592 * s,y +  -51.318 * s,x +    6.592 * s,y +  -58.544 * s,x +    8.993 * s,y +  -64.167 * s,x +   13.794 * s,y +  -68.187 * s, threshold);
			_bez(x +   13.794 * s,y +  -68.187 * s,x +   18.595 * s,y +  -72.208 * s,x +   25.325 * s,y +  -74.218 * s,x +   33.984 * s,y +  -74.218 * s, threshold);
			_bez(x +   33.984 * s,y +  -74.218 * s,x +   38.248 * s,y +  -74.218 * s,x +   42.683 * s,y +  -73.860 * s,x +   47.289 * s,y +  -73.143 * s, threshold);
			_bez(x +   47.289 * s,y +  -73.143 * s,x +   51.896 * s,y +  -72.427 * s,x +   56.672 * s,y +  -71.353 * s,x +   61.620 * s,y +  -69.921 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   61.620 * s);
			_setf(o + ( 1 << 2), y +  -53.808 * s);
			_setf(o + ( 2 << 2), x +   55.419 * s);
			_setf(o + ( 3 << 2), y +  -53.808 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   55.419 * s,y +  -53.808 * s,x +   54.475 * s,y +  -58.821 * s,x +   52.408 * s,y +  -62.491 * s,x +   49.218 * s,y +  -64.818 * s, threshold);
			_bez(x +   49.218 * s,y +  -64.818 * s,x +   46.028 * s,y +  -67.146 * s,x +   41.487 * s,y +  -68.309 * s,x +   35.595 * s,y +  -68.309 * s, threshold);
			_bez(x +   35.595 * s,y +  -68.309 * s,x +   30.778 * s,y +  -68.309 * s,x +   27.140 * s,y +  -67.471 * s,x +   24.682 * s,y +  -65.795 * s, threshold);
			_bez(x +   24.682 * s,y +  -65.795 * s,x +   22.225 * s,y +  -64.118 * s,x +   20.996 * s,y +  -61.620 * s,x +   20.996 * s,y +  -58.300 * s, threshold);
			_bez(x +   20.996 * s,y +  -58.300 * s,x +   20.996 * s,y +  -55.273 * s,x +   21.842 * s,y +  -52.970 * s,x +   23.535 * s,y +  -51.391 * s, threshold);
			_bez(x +   23.535 * s,y +  -51.391 * s,x +   25.228 * s,y +  -49.812 * s,x +   29.361 * s,y +  -48.110 * s,x +   35.986 * s,y +  -46.484 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   46.923 * s);
			_setf(o + ( 1 << 2), y +  -43.798 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   46.923 * s,y +  -43.798 * s,x +   53.701 * s,y +  -42.134 * s,x +   58.601 * s,y +  -39.469 * s,x +   61.645 * s,y +  -35.888 * s, threshold);
			_bez(x +   61.645 * s,y +  -35.888 * s,x +   64.688 * s,y +  -32.307 * s,x +   66.210 * s,y +  -27.376 * s,x +   66.210 * s,y +  -21.093 * s, threshold);
			_bez(x +   66.210 * s,y +  -21.093 * s,x +   66.210 * s,y +  -13.737 * s,x +   63.671 * s,y +   -8.146 * s,x +   58.593 * s,y +   -4.321 * s, threshold);
			_bez(x +   58.593 * s,y +   -4.321 * s,x +   53.515 * s,y +   -0.496 * s,x +   46.045 * s,y +    1.416 * s,x +   36.181 * s,y +    1.416 * s, threshold);
			_bez(x +   36.181 * s,y +    1.416 * s,x +   31.429 * s,y +    1.416 * s,x +   26.709 * s,y +    1.009 * s,x +   22.021 * s,y +    0.195 * s, threshold);
			_bez(x +   22.021 * s,y +    0.195 * s,x +   17.334 * s,y +   -0.618 * s,x +   12.565 * s,y +   -1.855 * s,x +    7.715 * s,y +   -3.516 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   72.216 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 84:
			
			o = _posf(36);
			_setf(o + ( 0 << 2), x +   18.115 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   18.115 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   27.783 * s);
			_setf(o + ( 5 << 2), y +   -5.908 * s);
			_setf(o + ( 6 << 2), x +   27.783 * s);
			_setf(o + ( 7 << 2), y +  -66.210 * s);
			_setf(o + ( 8 << 2), x +    7.812 * s);
			_setf(o + ( 9 << 2), y +  -66.210 * s);
			_setf(o + (10 << 2), x +    7.812 * s);
			_setf(o + (11 << 2), y +  -54.687 * s);
			_setf(o + (12 << 2), x +    1.123 * s);
			_setf(o + (13 << 2), y +  -54.687 * s);
			_setf(o + (14 << 2), x +    1.123 * s);
			_setf(o + (15 << 2), y +  -72.899 * s);
			_setf(o + (16 << 2), x +   73.387 * s);
			_setf(o + (17 << 2), y +  -72.899 * s);
			_setf(o + (18 << 2), x +   73.387 * s);
			_setf(o + (19 << 2), y +  -54.687 * s);
			_setf(o + (20 << 2), x +   66.796 * s);
			_setf(o + (21 << 2), y +  -54.687 * s);
			_setf(o + (22 << 2), x +   66.796 * s);
			_setf(o + (23 << 2), y +  -66.210 * s);
			_setf(o + (24 << 2), x +   46.679 * s);
			_setf(o + (25 << 2), y +  -66.210 * s);
			_setf(o + (26 << 2), x +   46.679 * s);
			_setf(o + (27 << 2), y +   -5.908 * s);
			_setf(o + (28 << 2), x +   56.395 * s);
			_setf(o + (29 << 2), y +   -5.908 * s);
			_setf(o + (30 << 2), x +   56.395 * s);
			_setf(o + (31 << 2), y +       0. * s);
			_setf(o + (32 << 2), x +   18.115 * s);
			_setf(o + (33 << 2), y +       0. * s);
			_setf(o + (34 << 2), x +   74.413 * s);
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
			
			case 85:
			
			o = _posf(14);
			_setf(o + ( 0 << 2), x +   12.695 * s);
			_setf(o + ( 1 << 2), y +  -66.991 * s);
			_setf(o + ( 2 << 2), x +    3.418 * s);
			_setf(o + ( 3 << 2), y +  -66.991 * s);
			_setf(o + ( 4 << 2), x +    3.418 * s);
			_setf(o + ( 5 << 2), y +  -72.899 * s);
			_setf(o + ( 6 << 2), x +   40.917 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   40.917 * s);
			_setf(o + ( 9 << 2), y +  -66.991 * s);
			_setf(o + (10 << 2), x +   31.591 * s);
			_setf(o + (11 << 2), y +  -66.991 * s);
			_setf(o + (12 << 2), x +   31.591 * s);
			_setf(o + (13 << 2), y +  -30.517 * s);
			o = _posb(7);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_bez(x +   31.591 * s,y +  -30.517 * s,x +   31.591 * s,y +  -21.435 * s,x +   33.007 * s,y +  -15.079 * s,x +   35.839 * s,y +  -11.450 * s, threshold);
			_bez(x +   35.839 * s,y +  -11.450 * s,x +   38.671 * s,y +   -7.821 * s,x +   43.521 * s,y +   -6.006 * s,x +   50.390 * s,y +   -6.006 * s, threshold);
			_bez(x +   50.390 * s,y +   -6.006 * s,x +   57.095 * s,y +   -6.006 * s,x +   61.856 * s,y +   -7.837 * s,x +   64.672 * s,y +  -11.499 * s, threshold);
			_bez(x +   64.672 * s,y +  -11.499 * s,x +   67.487 * s,y +  -15.161 * s,x +   68.895 * s,y +  -21.501 * s,x +   68.895 * s,y +  -30.517 * s, threshold);
			o = _posf(14);
			_setf(o + ( 0 << 2), x +   68.895 * s);
			_setf(o + ( 1 << 2), y +  -66.991 * s);
			_setf(o + ( 2 << 2), x +   59.618 * s);
			_setf(o + ( 3 << 2), y +  -66.991 * s);
			_setf(o + ( 4 << 2), x +   59.618 * s);
			_setf(o + ( 5 << 2), y +  -72.899 * s);
			_setf(o + ( 6 << 2), x +   85.008 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   85.008 * s);
			_setf(o + ( 9 << 2), y +  -66.991 * s);
			_setf(o + (10 << 2), x +   75.682 * s);
			_setf(o + (11 << 2), y +  -66.991 * s);
			_setf(o + (12 << 2), x +   75.682 * s);
			_setf(o + (13 << 2), y +  -29.492 * s);
			o = _posb(7);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_bez(x +   75.682 * s,y +  -29.492 * s,x +   75.682 * s,y +  -18.359 * s,x +   73.273 * s,y +  -10.425 * s,x +   68.456 * s,y +   -5.688 * s, threshold);
			_bez(x +   68.456 * s,y +   -5.688 * s,x +   63.638 * s,y +   -0.952 * s,x +   55.549 * s,y +    1.416 * s,x +   44.189 * s,y +    1.416 * s, threshold);
			_bez(x +   44.189 * s,y +    1.416 * s,x +   32.893 * s,y +    1.416 * s,x +   24.820 * s,y +   -0.977 * s,x +   19.970 * s,y +   -5.762 * s, threshold);
			_bez(x +   19.970 * s,y +   -5.762 * s,x +   15.120 * s,y +  -10.547 * s,x +   12.695 * s,y +  -18.489 * s,x +   12.695 * s,y +  -29.589 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   12.695 * s);
			_setf(o + ( 1 << 2), y +  -66.991 * s);
			_setf(o + ( 2 << 2), x +   87.205 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 86:
			
			o = _posf(34);
			_setf(o + ( 0 << 2), x +   79.003 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   79.003 * s);
			_setf(o + ( 3 << 2), y +  -66.991 * s);
			_setf(o + ( 4 << 2), x +   72.900 * s);
			_setf(o + ( 5 << 2), y +  -66.991 * s);
			_setf(o + ( 6 << 2), x +   45.410 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   33.789 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +    6.299 * s);
			_setf(o + (11 << 2), y +  -66.991 * s);
			_setf(o + (12 << 2), x +   -0.585 * s);
			_setf(o + (13 << 2), y +  -66.991 * s);
			_setf(o + (14 << 2), x +   -0.585 * s);
			_setf(o + (15 << 2), y +  -72.899 * s);
			_setf(o + (16 << 2), x +   33.594 * s);
			_setf(o + (17 << 2), y +  -72.899 * s);
			_setf(o + (18 << 2), x +   33.594 * s);
			_setf(o + (19 << 2), y +  -66.991 * s);
			_setf(o + (20 << 2), x +   26.514 * s);
			_setf(o + (21 << 2), y +  -66.991 * s);
			_setf(o + (22 << 2), x +   46.191 * s);
			_setf(o + (23 << 2), y +  -18.701 * s);
			_setf(o + (24 << 2), x +   66.015 * s);
			_setf(o + (25 << 2), y +  -66.991 * s);
			_setf(o + (26 << 2), x +   57.324 * s);
			_setf(o + (27 << 2), y +  -66.991 * s);
			_setf(o + (28 << 2), x +   57.324 * s);
			_setf(o + (29 << 2), y +  -72.899 * s);
			_setf(o + (30 << 2), x +   79.003 * s);
			_setf(o + (31 << 2), y +  -72.899 * s);
			_setf(o + (32 << 2), x +   77.587 * s);
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
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 2);
			_setb(o + 16, 1);
			
			case 87:
			
			o = _posf(46);
			_setf(o + ( 0 << 2), x +   85.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   72.606 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   56.103 * s);
			_setf(o + ( 5 << 2), y +  -53.075 * s);
			_setf(o + ( 6 << 2), x +   39.599 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   27.002 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +    6.201 * s);
			_setf(o + (11 << 2), y +  -66.991 * s);
			_setf(o + (12 << 2), x +   -0.879 * s);
			_setf(o + (13 << 2), y +  -66.991 * s);
			_setf(o + (14 << 2), x +   -0.879 * s);
			_setf(o + (15 << 2), y +  -72.899 * s);
			_setf(o + (16 << 2), x +   33.691 * s);
			_setf(o + (17 << 2), y +  -72.899 * s);
			_setf(o + (18 << 2), x +   33.691 * s);
			_setf(o + (19 << 2), y +  -66.991 * s);
			_setf(o + (20 << 2), x +   25.879 * s);
			_setf(o + (21 << 2), y +  -66.991 * s);
			_setf(o + (22 << 2), x +   39.794 * s);
			_setf(o + (23 << 2), y +  -22.216 * s);
			_setf(o + (24 << 2), x +   55.517 * s);
			_setf(o + (25 << 2), y +  -72.899 * s);
			_setf(o + (26 << 2), x +   69.384 * s);
			_setf(o + (27 << 2), y +  -72.899 * s);
			_setf(o + (28 << 2), x +   85.399 * s);
			_setf(o + (29 << 2), y +  -21.386 * s);
			_setf(o + (30 << 2), x +   99.608 * s);
			_setf(o + (31 << 2), y +  -66.991 * s);
			_setf(o + (32 << 2), x +   90.917 * s);
			_setf(o + (33 << 2), y +  -66.991 * s);
			_setf(o + (34 << 2), x +   90.917 * s);
			_setf(o + (35 << 2), y +  -72.899 * s);
			_setf(o + (36 << 2), x +  113.475 * s);
			_setf(o + (37 << 2), y +  -72.899 * s);
			_setf(o + (38 << 2), x +  113.475 * s);
			_setf(o + (39 << 2), y +  -66.991 * s);
			_setf(o + (40 << 2), x +  106.004 * s);
			_setf(o + (41 << 2), y +  -66.991 * s);
			_setf(o + (42 << 2), x +   85.204 * s);
			_setf(o + (43 << 2), y +       0. * s);
			_setf(o + (44 << 2), x +  112.303 * s);
			_setf(o + (45 << 2), y +       0. * s);
			o = _posb(23);
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
			_setb(o + 22, 1);
			
			case 88:
			
			o = _posf(60);
			_setf(o + ( 0 << 2), x +   33.886 * s);
			_setf(o + ( 1 << 2), y +  -28.076 * s);
			_setf(o + ( 2 << 2), x +   18.701 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   27.685 * s);
			_setf(o + ( 5 << 2), y +   -5.908 * s);
			_setf(o + ( 6 << 2), x +   27.685 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    1.807 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +    1.807 * s);
			_setf(o + (11 << 2), y +   -5.908 * s);
			_setf(o + (12 << 2), x +   10.791 * s);
			_setf(o + (13 << 2), y +   -5.908 * s);
			_setf(o + (14 << 2), x +   29.980 * s);
			_setf(o + (15 << 2), y +  -33.789 * s);
			_setf(o + (16 << 2), x +    7.178 * s);
			_setf(o + (17 << 2), y +  -66.991 * s);
			_setf(o + (18 << 2), x +    0.488 * s);
			_setf(o + (19 << 2), y +  -66.991 * s);
			_setf(o + (20 << 2), x +    0.488 * s);
			_setf(o + (21 << 2), y +  -72.899 * s);
			_setf(o + (22 << 2), x +   36.718 * s);
			_setf(o + (23 << 2), y +  -72.899 * s);
			_setf(o + (24 << 2), x +   36.718 * s);
			_setf(o + (25 << 2), y +  -66.991 * s);
			_setf(o + (26 << 2), x +   28.710 * s);
			_setf(o + (27 << 2), y +  -66.991 * s);
			_setf(o + (28 << 2), x +   42.822 * s);
			_setf(o + (29 << 2), y +  -46.484 * s);
			_setf(o + (30 << 2), x +   56.786 * s);
			_setf(o + (31 << 2), y +  -66.991 * s);
			_setf(o + (32 << 2), x +   48.290 * s);
			_setf(o + (33 << 2), y +  -66.991 * s);
			_setf(o + (34 << 2), x +   48.290 * s);
			_setf(o + (35 << 2), y +  -72.899 * s);
			_setf(o + (36 << 2), x +   73.680 * s);
			_setf(o + (37 << 2), y +  -72.899 * s);
			_setf(o + (38 << 2), x +   73.680 * s);
			_setf(o + (39 << 2), y +  -66.991 * s);
			_setf(o + (40 << 2), x +   64.696 * s);
			_setf(o + (41 << 2), y +  -66.991 * s);
			_setf(o + (42 << 2), x +   46.679 * s);
			_setf(o + (43 << 2), y +  -40.820 * s);
			_setf(o + (44 << 2), x +   70.604 * s);
			_setf(o + (45 << 2), y +   -5.908 * s);
			_setf(o + (46 << 2), x +   77.489 * s);
			_setf(o + (47 << 2), y +   -5.908 * s);
			_setf(o + (48 << 2), x +   77.489 * s);
			_setf(o + (49 << 2), y +       0. * s);
			_setf(o + (50 << 2), x +   41.113 * s);
			_setf(o + (51 << 2), y +       0. * s);
			_setf(o + (52 << 2), x +   41.113 * s);
			_setf(o + (53 << 2), y +   -5.908 * s);
			_setf(o + (54 << 2), x +   49.218 * s);
			_setf(o + (55 << 2), y +   -5.908 * s);
			_setf(o + (56 << 2), x +   33.886 * s);
			_setf(o + (57 << 2), y +  -28.076 * s);
			_setf(o + (58 << 2), x +   77.587 * s);
			_setf(o + (59 << 2), y +       0. * s);
			o = _posb(30);
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
			
			case 89:
			
			o = _posf(46);
			_setf(o + ( 0 << 2), x +   17.187 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   17.187 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   27.001 * s);
			_setf(o + ( 5 << 2), y +   -5.908 * s);
			_setf(o + ( 6 << 2), x +   27.001 * s);
			_setf(o + ( 7 << 2), y +  -30.175 * s);
			_setf(o + ( 8 << 2), x +    5.322 * s);
			_setf(o + ( 9 << 2), y +  -66.991 * s);
			_setf(o + (10 << 2), x +   -0.879 * s);
			_setf(o + (11 << 2), y +  -66.991 * s);
			_setf(o + (12 << 2), x +   -0.879 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   34.081 * s);
			_setf(o + (15 << 2), y +  -72.899 * s);
			_setf(o + (16 << 2), x +   34.081 * s);
			_setf(o + (17 << 2), y +  -66.991 * s);
			_setf(o + (18 << 2), x +   25.976 * s);
			_setf(o + (19 << 2), y +  -66.991 * s);
			_setf(o + (20 << 2), x +   42.382 * s);
			_setf(o + (21 << 2), y +  -39.208 * s);
			_setf(o + (22 << 2), x +   58.690 * s);
			_setf(o + (23 << 2), y +  -66.991 * s);
			_setf(o + (24 << 2), x +   51.415 * s);
			_setf(o + (25 << 2), y +  -66.991 * s);
			_setf(o + (26 << 2), x +   51.415 * s);
			_setf(o + (27 << 2), y +  -72.899 * s);
			_setf(o + (28 << 2), x +   72.313 * s);
			_setf(o + (29 << 2), y +  -72.899 * s);
			_setf(o + (30 << 2), x +   72.313 * s);
			_setf(o + (31 << 2), y +  -66.991 * s);
			_setf(o + (32 << 2), x +   66.112 * s);
			_setf(o + (33 << 2), y +  -66.991 * s);
			_setf(o + (34 << 2), x +   45.897 * s);
			_setf(o + (35 << 2), y +  -32.714 * s);
			_setf(o + (36 << 2), x +   45.897 * s);
			_setf(o + (37 << 2), y +   -5.908 * s);
			_setf(o + (38 << 2), x +   55.712 * s);
			_setf(o + (39 << 2), y +   -5.908 * s);
			_setf(o + (40 << 2), x +   55.712 * s);
			_setf(o + (41 << 2), y +       0. * s);
			_setf(o + (42 << 2), x +   17.187 * s);
			_setf(o + (43 << 2), y +       0. * s);
			_setf(o + (44 << 2), x +   71.385 * s);
			_setf(o + (45 << 2), y +       0. * s);
			o = _posb(23);
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
			_setb(o + 22, 1);
			
			case 90:
			
			o = _posf(32);
			_setf(o + ( 0 << 2), x +    3.711 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    3.711 * s);
			_setf(o + ( 3 << 2), y +   -6.885 * s);
			_setf(o + ( 4 << 2), x +   47.216 * s);
			_setf(o + ( 5 << 2), y +  -66.210 * s);
			_setf(o + ( 6 << 2), x +   12.305 * s);
			_setf(o + ( 7 << 2), y +  -66.210 * s);
			_setf(o + ( 8 << 2), x +   12.305 * s);
			_setf(o + ( 9 << 2), y +  -55.321 * s);
			_setf(o + (10 << 2), x +    5.615 * s);
			_setf(o + (11 << 2), y +  -55.321 * s);
			_setf(o + (12 << 2), x +    5.615 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   68.896 * s);
			_setf(o + (15 << 2), y +  -72.899 * s);
			_setf(o + (16 << 2), x +   68.896 * s);
			_setf(o + (17 << 2), y +  -66.015 * s);
			_setf(o + (18 << 2), x +   25.879 * s);
			_setf(o + (19 << 2), y +   -6.689 * s);
			_setf(o + (20 << 2), x +   62.695 * s);
			_setf(o + (21 << 2), y +   -6.689 * s);
			_setf(o + (22 << 2), x +   62.695 * s);
			_setf(o + (23 << 2), y +  -16.894 * s);
			_setf(o + (24 << 2), x +   69.384 * s);
			_setf(o + (25 << 2), y +  -16.894 * s);
			_setf(o + (26 << 2), x +   69.384 * s);
			_setf(o + (27 << 2), y +       0. * s);
			_setf(o + (28 << 2), x +    3.711 * s);
			_setf(o + (29 << 2), y +       0. * s);
			_setf(o + (30 << 2), x +   72.997 * s);
			_setf(o + (31 << 2), y +       0. * s);
			o = _posb(16);
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
			
			case 91:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +   12.500 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   40.185 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   40.185 * s);
			_setf(o + ( 5 << 2), y +  -70.116 * s);
			_setf(o + ( 6 << 2), x +   29.785 * s);
			_setf(o + ( 7 << 2), y +  -70.116 * s);
			_setf(o + ( 8 << 2), x +   29.785 * s);
			_setf(o + ( 9 << 2), y +    7.324 * s);
			_setf(o + (10 << 2), x +   40.185 * s);
			_setf(o + (11 << 2), y +    7.324 * s);
			_setf(o + (12 << 2), x +   40.185 * s);
			_setf(o + (13 << 2), y +   13.183 * s);
			_setf(o + (14 << 2), x +   12.500 * s);
			_setf(o + (15 << 2), y +   13.183 * s);
			_setf(o + (16 << 2), x +   12.500 * s);
			_setf(o + (17 << 2), y +  -75.975 * s);
			_setf(o + (18 << 2), x +   47.314 * s);
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
			_setf(o + ( 0 << 2), x +   10.791 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   36.523 * s);
			_setf(o + ( 3 << 2), y +    9.277 * s);
			_setf(o + ( 4 << 2), x +   25.683 * s);
			_setf(o + ( 5 << 2), y +    9.277 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   10.791 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   36.523 * s);
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
			_setf(o + ( 0 << 2), x +   34.814 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   34.814 * s);
			_setf(o + ( 3 << 2), y +   13.183 * s);
			_setf(o + ( 4 << 2), x +    7.080 * s);
			_setf(o + ( 5 << 2), y +   13.183 * s);
			_setf(o + ( 6 << 2), x +    7.080 * s);
			_setf(o + ( 7 << 2), y +    7.324 * s);
			_setf(o + ( 8 << 2), x +   17.480 * s);
			_setf(o + ( 9 << 2), y +    7.324 * s);
			_setf(o + (10 << 2), x +   17.480 * s);
			_setf(o + (11 << 2), y +  -70.116 * s);
			_setf(o + (12 << 2), x +    7.080 * s);
			_setf(o + (13 << 2), y +  -70.116 * s);
			_setf(o + (14 << 2), x +    7.080 * s);
			_setf(o + (15 << 2), y +  -75.975 * s);
			_setf(o + (16 << 2), x +   34.814 * s);
			_setf(o + (17 << 2), y +  -75.975 * s);
			_setf(o + (18 << 2), x +   47.314 * s);
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
			_setf(o + ( 0 << 2), x +   47.509 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   73.680 * s);
			_setf(o + ( 3 << 2), y +  -45.702 * s);
			_setf(o + ( 4 << 2), x +   63.280 * s);
			_setf(o + ( 5 << 2), y +  -45.702 * s);
			_setf(o + ( 6 << 2), x +   41.893 * s);
			_setf(o + ( 7 << 2), y +  -61.083 * s);
			_setf(o + ( 8 << 2), x +   20.507 * s);
			_setf(o + ( 9 << 2), y +  -45.702 * s);
			_setf(o + (10 << 2), x +   10.107 * s);
			_setf(o + (11 << 2), y +  -45.702 * s);
			_setf(o + (12 << 2), x +   36.620 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   47.509 * s);
			_setf(o + (15 << 2), y +  -72.899 * s);
			_setf(o + (16 << 2), x +   83.787 * s);
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
			_setf(o + ( 0 << 2), x +   50.000 * s);
			_setf(o + ( 1 << 2), y +   14.306 * s);
			_setf(o + ( 2 << 2), x +   50.000 * s);
			_setf(o + ( 3 << 2), y +   23.584 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +   23.584 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +   14.306 * s);
			_setf(o + ( 8 << 2), x +   50.000 * s);
			_setf(o + ( 9 << 2), y +   14.306 * s);
			_setf(o + (10 << 2), x +   50.000 * s);
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
			_setf(o + ( 0 << 2), x +   20.507 * s);
			_setf(o + ( 1 << 2), y +  -79.979 * s);
			_setf(o + ( 2 << 2), x +   33.105 * s);
			_setf(o + ( 3 << 2), y +  -61.620 * s);
			_setf(o + ( 4 << 2), x +   25.097 * s);
			_setf(o + ( 5 << 2), y +  -61.620 * s);
			_setf(o + ( 6 << 2), x +    6.885 * s);
			_setf(o + ( 7 << 2), y +  -79.979 * s);
			_setf(o + ( 8 << 2), x +   20.507 * s);
			_setf(o + ( 9 << 2), y +  -79.979 * s);
			_setf(o + (10 << 2), x +   49.999 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 97:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   55.078 * s);
			_setf(o + ( 1 << 2), y +  -31.884 * s);
			_setf(o + ( 2 << 2), x +   55.078 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   62.499 * s);
			_setf(o + ( 5 << 2), y +   -5.908 * s);
			_setf(o + ( 6 << 2), x +   62.499 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   37.792 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   37.792 * s);
			_setf(o + (11 << 2), y +   -6.592 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_bez(x +   37.792 * s,y +   -6.592 * s,x +   35.514 * s,y +   -3.857 * s,x +   32.975 * s,y +   -1.839 * s,x +   30.175 * s,y +   -0.537 * s, threshold);
			_bez(x +   30.175 * s,y +   -0.537 * s,x +   27.376 * s,y +    0.765 * s,x +   24.186 * s,y +    1.416 * s,x +   20.605 * s,y +    1.416 * s, threshold);
			_bez(x +   20.605 * s,y +    1.416 * s,x +   15.299 * s,y +    1.416 * s,x +   11.222 * s,y +   -0.008 * s,x +    8.374 * s,y +   -2.856 * s, threshold);
			_bez(x +    8.374 * s,y +   -2.856 * s,x +    5.526 * s,y +   -5.705 * s,x +    4.102 * s,y +   -9.782 * s,x +    4.102 * s,y +  -15.088 * s, threshold);
			_bez(x +    4.102 * s,y +  -15.088 * s,x +    4.102 * s,y +  -20.914 * s,x +    6.144 * s,y +  -25.276 * s,x +   10.229 * s,y +  -28.173 * s, threshold);
			_bez(x +   10.229 * s,y +  -28.173 * s,x +   14.315 * s,y +  -31.070 * s,x +   20.475 * s,y +  -32.519 * s,x +   28.710 * s,y +  -32.519 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   37.792 * s);
			_setf(o + ( 1 << 2), y +  -32.519 * s);
			_setf(o + ( 2 << 2), x +   37.792 * s);
			_setf(o + ( 3 << 2), y +  -35.595 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   37.792 * s,y +  -35.595 * s,x +   37.792 * s,y +  -39.794 * s,x +   36.800 * s,y +  -42.895 * s,x +   34.814 * s,y +  -44.897 * s, threshold);
			_bez(x +   34.814 * s,y +  -44.897 * s,x +   32.828 * s,y +  -46.899 * s,x +   29.752 * s,y +  -47.900 * s,x +   25.586 * s,y +  -47.900 * s, threshold);
			_bez(x +   25.586 * s,y +  -47.900 * s,x +   22.135 * s,y +  -47.900 * s,x +   19.474 * s,y +  -47.192 * s,x +   17.602 * s,y +  -45.776 * s, threshold);
			_bez(x +   17.602 * s,y +  -45.776 * s,x +   15.731 * s,y +  -44.360 * s,x +   14.404 * s,y +  -42.040 * s,x +   13.623 * s,y +  -38.818 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    8.105 * s);
			_setf(o + ( 1 << 2), y +  -38.818 * s);
			_setf(o + ( 2 << 2), x +    8.105 * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +    8.105 * s,y +  -49.999 * s,x +   11.198 * s,y +  -51.106 * s,x +   14.404 * s,y +  -51.936 * s,x +   17.724 * s,y +  -52.489 * s, threshold);
			_bez(x +   17.724 * s,y +  -52.489 * s,x +   21.045 * s,y +  -53.043 * s,x +   24.544 * s,y +  -53.319 * s,x +   28.222 * s,y +  -53.319 * s, threshold);
			_bez(x +   28.222 * s,y +  -53.319 * s,x +   37.500 * s,y +  -53.319 * s,x +   44.295 * s,y +  -51.594 * s,x +   48.608 * s,y +  -48.144 * s, threshold);
			_bez(x +   48.608 * s,y +  -48.144 * s,x +   52.921 * s,y +  -44.693 * s,x +   55.078 * s,y +  -39.273 * s,x +   55.078 * s,y +  -31.884 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   37.792 * s);
			_setf(o + ( 1 << 2), y +  -16.308 * s);
			_setf(o + ( 2 << 2), x +   37.792 * s);
			_setf(o + ( 3 << 2), y +  -26.709 * s);
			_setf(o + ( 4 << 2), x +   31.298 * s);
			_setf(o + ( 5 << 2), y +  -26.709 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   31.298 * s,y +  -26.709 * s,x +   28.076 * s,y +  -26.709 * s,x +   25.602 * s,y +  -25.830 * s,x +   23.877 * s,y +  -24.072 * s, threshold);
			_bez(x +   23.877 * s,y +  -24.072 * s,x +   22.151 * s,y +  -22.314 * s,x +   21.289 * s,y +  -19.791 * s,x +   21.289 * s,y +  -16.504 * s, threshold);
			_bez(x +   21.289 * s,y +  -16.504 * s,x +   21.289 * s,y +  -13.216 * s,x +   21.915 * s,y +  -10.758 * s,x +   23.169 * s,y +   -9.131 * s, threshold);
			_bez(x +   23.169 * s,y +   -9.131 * s,x +   24.422 * s,y +   -7.503 * s,x +   26.334 * s,y +   -6.689 * s,x +   28.906 * s,y +   -6.689 * s, threshold);
			_bez(x +   28.906 * s,y +   -6.689 * s,x +   31.575 * s,y +   -6.689 * s,x +   33.723 * s,y +   -7.568 * s,x +   35.351 * s,y +   -9.326 * s, threshold);
			_bez(x +   35.351 * s,y +   -9.326 * s,x +   36.979 * s,y +  -11.084 * s,x +   37.792 * s,y +  -13.411 * s,x +   37.792 * s,y +  -16.308 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   64.794 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 98:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +    9.717 * s);
			_setf(o + ( 1 << 2), y +   -5.908 * s);
			_setf(o + ( 2 << 2), x +    9.717 * s);
			_setf(o + ( 3 << 2), y +  -70.116 * s);
			_setf(o + ( 4 << 2), x +    2.295 * s);
			_setf(o + ( 5 << 2), y +  -70.116 * s);
			_setf(o + ( 6 << 2), x +    2.295 * s);
			_setf(o + ( 7 << 2), y +  -75.975 * s);
			_setf(o + ( 8 << 2), x +   27.002 * s);
			_setf(o + ( 9 << 2), y +  -75.975 * s);
			_setf(o + (10 << 2), x +   27.002 * s);
			_setf(o + (11 << 2), y +  -45.312 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_bez(x +   27.002 * s,y +  -45.312 * s,x +   28.467 * s,y +  -48.014 * s,x +   30.436 * s,y +  -50.024 * s,x +   32.910 * s,y +  -51.342 * s, threshold);
			_bez(x +   32.910 * s,y +  -51.342 * s,x +   35.384 * s,y +  -52.660 * s,x +   38.444 * s,y +  -53.319 * s,x +   42.089 * s,y +  -53.319 * s, threshold);
			_bez(x +   42.089 * s,y +  -53.319 * s,x +   49.478 * s,y +  -53.319 * s,x +   55.297 * s,y +  -50.886 * s,x +   59.545 * s,y +  -46.020 * s, threshold);
			_bez(x +   59.545 * s,y +  -46.020 * s,x +   63.793 * s,y +  -41.153 * s,x +   65.917 * s,y +  -34.472 * s,x +   65.917 * s,y +  -25.976 * s, threshold);
			_bez(x +   65.917 * s,y +  -25.976 * s,x +   65.917 * s,y +  -17.480 * s,x +   63.793 * s,y +  -10.791 * s,x +   59.545 * s,y +   -5.908 * s, threshold);
			_bez(x +   59.545 * s,y +   -5.908 * s,x +   55.297 * s,y +   -1.025 * s,x +   49.478 * s,y +    1.416 * s,x +   42.089 * s,y +    1.416 * s, threshold);
			_bez(x +   42.089 * s,y +    1.416 * s,x +   38.444 * s,y +    1.416 * s,x +   35.384 * s,y +    0.757 * s,x +   32.910 * s,y +   -0.562 * s, threshold);
			_bez(x +   32.910 * s,y +   -0.562 * s,x +   30.436 * s,y +   -1.880 * s,x +   28.467 * s,y +   -3.890 * s,x +   27.002 * s,y +   -6.592 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   27.002 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    2.295 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    2.295 * s);
			_setf(o + ( 5 << 2), y +   -5.908 * s);
			_setf(o + ( 6 << 2), x +    9.717 * s);
			_setf(o + ( 7 << 2), y +   -5.908 * s);
			_setf(o + ( 8 << 2), x +   27.002 * s);
			_setf(o + ( 9 << 2), y +  -23.388 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 1);
			_bez(x +   27.002 * s,y +  -23.388 * s,x +   27.002 * s,y +  -17.334 * s,x +   27.775 * s,y +  -12.956 * s,x +   29.321 * s,y +  -10.254 * s, threshold);
			_bez(x +   29.321 * s,y +  -10.254 * s,x +   30.867 * s,y +   -7.552 * s,x +   33.366 * s,y +   -6.201 * s,x +   36.816 * s,y +   -6.201 * s, threshold);
			_bez(x +   36.816 * s,y +   -6.201 * s,x +   40.364 * s,y +   -6.201 * s,x +   42.862 * s,y +   -7.633 * s,x +   44.311 * s,y +  -10.498 * s, threshold);
			_bez(x +   44.311 * s,y +  -10.498 * s,x +   45.760 * s,y +  -13.362 * s,x +   46.484 * s,y +  -18.522 * s,x +   46.484 * s,y +  -25.976 * s, threshold);
			_bez(x +   46.484 * s,y +  -25.976 * s,x +   46.484 * s,y +  -33.430 * s,x +   45.760 * s,y +  -38.582 * s,x +   44.311 * s,y +  -41.430 * s, threshold);
			_bez(x +   44.311 * s,y +  -41.430 * s,x +   42.862 * s,y +  -44.278 * s,x +   40.364 * s,y +  -45.702 * s,x +   36.816 * s,y +  -45.702 * s, threshold);
			_bez(x +   36.816 * s,y +  -45.702 * s,x +   33.366 * s,y +  -45.702 * s,x +   30.867 * s,y +  -44.352 * s,x +   29.321 * s,y +  -41.650 * s, threshold);
			_bez(x +   29.321 * s,y +  -41.650 * s,x +   27.775 * s,y +  -38.948 * s,x +   27.002 * s,y +  -34.570 * s,x +   27.002 * s,y +  -28.515 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   27.002 * s);
			_setf(o + ( 1 << 2), y +  -23.388 * s);
			_setf(o + ( 2 << 2), x +   69.921 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 99:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   56.396 * s);
			_setf(o + ( 1 << 2), y +  -16.211 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   56.396 * s,y +  -16.211 * s,x +   55.159 * s,y +  -10.286 * s,x +   52.628 * s,y +   -5.867 * s,x +   48.803 * s,y +   -2.954 * s, threshold);
			_bez(x +   48.803 * s,y +   -2.954 * s,x +   44.978 * s,y +   -0.041 * s,x +   39.778 * s,y +    1.416 * s,x +   33.203 * s,y +    1.416 * s, threshold);
			_bez(x +   33.203 * s,y +    1.416 * s,x +   23.958 * s,y +    1.416 * s,x +   16.797 * s,y +   -0.977 * s,x +   11.719 * s,y +   -5.762 * s, threshold);
			_bez(x +   11.719 * s,y +   -5.762 * s,x +    6.640 * s,y +  -10.547 * s,x +    4.101 * s,y +  -17.285 * s,x +    4.101 * s,y +  -25.976 * s, threshold);
			_bez(x +    4.101 * s,y +  -25.976 * s,x +    4.101 * s,y +  -34.570 * s,x +    6.608 * s,y +  -41.275 * s,x +   11.621 * s,y +  -46.093 * s, threshold);
			_bez(x +   11.621 * s,y +  -46.093 * s,x +   16.634 * s,y +  -50.911 * s,x +   23.600 * s,y +  -53.319 * s,x +   32.519 * s,y +  -53.319 * s, threshold);
			_bez(x +   32.519 * s,y +  -53.319 * s,x +   36.132 * s,y +  -53.319 * s,x +   39.778 * s,y +  -52.978 * s,x +   43.456 * s,y +  -52.294 * s, threshold);
			_bez(x +   43.456 * s,y +  -52.294 * s,x +   47.135 * s,y +  -51.611 * s,x +   50.878 * s,y +  -50.585 * s,x +   54.687 * s,y +  -49.218 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   54.687 * s);
			_setf(o + ( 1 << 2), y +  -34.814 * s);
			_setf(o + ( 2 << 2), x +   49.218 * s);
			_setf(o + ( 3 << 2), y +  -34.814 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   49.218 * s,y +  -34.814 * s,x +   48.697 * s,y +  -39.208 * s,x +   47.411 * s,y +  -42.472 * s,x +   45.361 * s,y +  -44.604 * s, threshold);
			_bez(x +   45.361 * s,y +  -44.604 * s,x +   43.310 * s,y +  -46.736 * s,x +   40.429 * s,y +  -47.802 * s,x +   36.718 * s,y +  -47.802 * s, threshold);
			_bez(x +   36.718 * s,y +  -47.802 * s,x +   31.901 * s,y +  -47.802 * s,x +   28.474 * s,y +  -46.174 * s,x +   26.440 * s,y +  -42.919 * s, threshold);
			_bez(x +   26.440 * s,y +  -42.919 * s,x +   24.406 * s,y +  -39.664 * s,x +   23.388 * s,y +  -34.016 * s,x +   23.388 * s,y +  -25.976 * s, threshold);
			_bez(x +   23.388 * s,y +  -25.976 * s,x +   23.388 * s,y +  -18.131 * s,x +   24.381 * s,y +  -12.524 * s,x +   26.367 * s,y +   -9.155 * s, threshold);
			_bez(x +   26.367 * s,y +   -9.155 * s,x +   28.352 * s,y +   -5.786 * s,x +   31.591 * s,y +   -4.101 * s,x +   36.083 * s,y +   -4.101 * s, threshold);
			_bez(x +   36.083 * s,y +   -4.101 * s,x +   39.566 * s,y +   -4.101 * s,x +   42.358 * s,y +   -5.143 * s,x +   44.457 * s,y +   -7.226 * s, threshold);
			_bez(x +   44.457 * s,y +   -7.226 * s,x +   46.557 * s,y +   -9.310 * s,x +   47.835 * s,y +  -12.304 * s,x +   48.290 * s,y +  -16.211 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   56.396 * s);
			_setf(o + ( 1 << 2), y +  -16.211 * s);
			_setf(o + ( 2 << 2), x +   60.888 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 100:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   42.919 * s);
			_setf(o + ( 1 << 2), y +  -23.388 * s);
			_setf(o + ( 2 << 2), x +   42.919 * s);
			_setf(o + ( 3 << 2), y +  -28.515 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   42.919 * s,y +  -28.515 * s,x +   42.919 * s,y +  -34.570 * s,x +   42.138 * s,y +  -38.948 * s,x +   40.575 * s,y +  -41.650 * s, threshold);
			_bez(x +   40.575 * s,y +  -41.650 * s,x +   39.013 * s,y +  -44.352 * s,x +   36.523 * s,y +  -45.702 * s,x +   33.105 * s,y +  -45.702 * s, threshold);
			_bez(x +   33.105 * s,y +  -45.702 * s,x +   29.524 * s,y +  -45.702 * s,x +   27.009 * s,y +  -44.278 * s,x +   25.561 * s,y +  -41.430 * s, threshold);
			_bez(x +   25.561 * s,y +  -41.430 * s,x +   24.112 * s,y +  -38.582 * s,x +   23.388 * s,y +  -33.430 * s,x +   23.388 * s,y +  -25.976 * s, threshold);
			_bez(x +   23.388 * s,y +  -25.976 * s,x +   23.388 * s,y +  -18.522 * s,x +   24.120 * s,y +  -13.362 * s,x +   25.585 * s,y +  -10.498 * s, threshold);
			_bez(x +   25.585 * s,y +  -10.498 * s,x +   27.050 * s,y +   -7.633 * s,x +   29.557 * s,y +   -6.201 * s,x +   33.105 * s,y +   -6.201 * s, threshold);
			_bez(x +   33.105 * s,y +   -6.201 * s,x +   36.523 * s,y +   -6.201 * s,x +   39.013 * s,y +   -7.552 * s,x +   40.575 * s,y +  -10.254 * s, threshold);
			_bez(x +   40.575 * s,y +  -10.254 * s,x +   42.138 * s,y +  -12.956 * s,x +   42.919 * s,y +  -17.334 * s,x +   42.919 * s,y +  -23.388 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +   -5.908 * s);
			_setf(o + ( 2 << 2), x +   67.577 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   67.577 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   42.919 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   42.919 * s);
			_setf(o + ( 9 << 2), y +   -6.592 * s);
			o = _posb(5);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   42.919 * s,y +   -6.592 * s,x +   41.454 * s,y +   -3.890 * s,x +   39.477 * s,y +   -1.880 * s,x +   36.986 * s,y +   -0.562 * s, threshold);
			_bez(x +   36.986 * s,y +   -0.562 * s,x +   34.496 * s,y +    0.757 * s,x +   31.428 * s,y +    1.416 * s,x +   27.782 * s,y +    1.416 * s, threshold);
			_bez(x +   27.782 * s,y +    1.416 * s,x +   20.426 * s,y +    1.416 * s,x +   14.640 * s,y +   -1.025 * s,x +   10.424 * s,y +   -5.908 * s, threshold);
			_bez(x +   10.424 * s,y +   -5.908 * s,x +    6.209 * s,y +  -10.791 * s,x +    4.101 * s,y +  -17.480 * s,x +    4.101 * s,y +  -25.976 * s, threshold);
			_bez(x +    4.101 * s,y +  -25.976 * s,x +    4.101 * s,y +  -34.505 * s,x +    6.209 * s,y +  -41.194 * s,x +   10.424 * s,y +  -46.044 * s, threshold);
			_bez(x +   10.424 * s,y +  -46.044 * s,x +   14.640 * s,y +  -50.894 * s,x +   20.426 * s,y +  -53.319 * s,x +   27.782 * s,y +  -53.319 * s, threshold);
			_bez(x +   27.782 * s,y +  -53.319 * s,x +   31.428 * s,y +  -53.319 * s,x +   34.496 * s,y +  -52.660 * s,x +   36.986 * s,y +  -51.342 * s, threshold);
			_bez(x +   36.986 * s,y +  -51.342 * s,x +   39.477 * s,y +  -50.024 * s,x +   41.454 * s,y +  -48.014 * s,x +   42.919 * s,y +  -45.312 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   42.919 * s);
			_setf(o + ( 1 << 2), y +  -70.116 * s);
			_setf(o + ( 2 << 2), x +   35.497 * s);
			_setf(o + ( 3 << 2), y +  -70.116 * s);
			_setf(o + ( 4 << 2), x +   35.497 * s);
			_setf(o + ( 5 << 2), y +  -75.975 * s);
			_setf(o + ( 6 << 2), x +   60.204 * s);
			_setf(o + ( 7 << 2), y +  -75.975 * s);
			_setf(o + ( 8 << 2), x +   60.204 * s);
			_setf(o + ( 9 << 2), y +   -5.908 * s);
			_setf(o + (10 << 2), x +   69.921 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 101:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   40.087 * s);
			_setf(o + ( 1 << 2), y +  -29.296 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   40.087 * s,y +  -29.296 * s,x +   40.087 * s,y +  -36.132 * s,x +   39.452 * s,y +  -40.925 * s,x +   38.183 * s,y +  -43.676 * s, threshold);
			_bez(x +   38.183 * s,y +  -43.676 * s,x +   36.913 * s,y +  -46.427 * s,x +   34.748 * s,y +  -47.802 * s,x +   31.688 * s,y +  -47.802 * s, threshold);
			_bez(x +   31.688 * s,y +  -47.802 * s,x +   28.726 * s,y +  -47.802 * s,x +   26.602 * s,y +  -46.451 * s,x +   25.317 * s,y +  -43.749 * s, threshold);
			_bez(x +   25.317 * s,y +  -43.749 * s,x +   24.031 * s,y +  -41.048 * s,x +   23.388 * s,y +  -36.523 * s,x +   23.388 * s,y +  -30.175 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   23.388 * s);
			_setf(o + ( 1 << 2), y +  -29.296 * s);
			_setf(o + ( 2 << 2), x +   40.087 * s);
			_setf(o + ( 3 << 2), y +  -29.296 * s);
			_setf(o + ( 4 << 2), x +   59.081 * s);
			_setf(o + ( 5 << 2), y +  -23.486 * s);
			_setf(o + ( 6 << 2), x +   23.388 * s);
			_setf(o + ( 7 << 2), y +  -23.486 * s);
			_setf(o + ( 8 << 2), x +   23.388 * s);
			_setf(o + ( 9 << 2), y +  -23.095 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   23.388 * s,y +  -23.095 * s,x +   23.388 * s,y +  -16.390 * s,x +   24.397 * s,y +  -11.548 * s,x +   26.415 * s,y +   -8.569 * s, threshold);
			_bez(x +   26.415 * s,y +   -8.569 * s,x +   28.433 * s,y +   -5.591 * s,x +   31.688 * s,y +   -4.101 * s,x +   36.181 * s,y +   -4.101 * s, threshold);
			_bez(x +   36.181 * s,y +   -4.101 * s,x +   39.924 * s,y +   -4.101 * s,x +   42.951 * s,y +   -5.094 * s,x +   45.262 * s,y +   -7.080 * s, threshold);
			_bez(x +   45.262 * s,y +   -7.080 * s,x +   47.574 * s,y +   -9.066 * s,x +   49.055 * s,y +  -11.946 * s,x +   49.706 * s,y +  -15.722 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   57.811 * s);
			_setf(o + ( 1 << 2), y +  -15.722 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   57.811 * s,y +  -15.722 * s,x +   56.411 * s,y +   -9.831 * s,x +   53.628 * s,y +   -5.501 * s,x +   49.462 * s,y +   -2.734 * s, threshold);
			_bez(x +   49.462 * s,y +   -2.734 * s,x +   45.295 * s,y +    0.033 * s,x +   39.468 * s,y +    1.416 * s,x +   31.981 * s,y +    1.416 * s, threshold);
			_bez(x +   31.981 * s,y +    1.416 * s,x +   22.997 * s,y +    1.416 * s,x +   16.104 * s,y +   -0.952 * s,x +   11.303 * s,y +   -5.688 * s, threshold);
			_bez(x +   11.303 * s,y +   -5.688 * s,x +    6.502 * s,y +  -10.425 * s,x +    4.101 * s,y +  -17.187 * s,x +    4.101 * s,y +  -25.976 * s, threshold);
			_bez(x +    4.101 * s,y +  -25.976 * s,x +    4.101 * s,y +  -34.570 * s,x +    6.559 * s,y +  -41.275 * s,x +   11.474 * s,y +  -46.093 * s, threshold);
			_bez(x +   11.474 * s,y +  -46.093 * s,x +   16.389 * s,y +  -50.911 * s,x +   23.225 * s,y +  -53.319 * s,x +   31.981 * s,y +  -53.319 * s, threshold);
			_bez(x +   31.981 * s,y +  -53.319 * s,x +   40.575 * s,y +  -53.319 * s,x +   47.167 * s,y +  -50.789 * s,x +   51.757 * s,y +  -45.727 * s, threshold);
			_bez(x +   51.757 * s,y +  -45.727 * s,x +   56.346 * s,y +  -40.665 * s,x +   58.788 * s,y +  -33.251 * s,x +   59.081 * s,y +  -23.486 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   63.622 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 102:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   48.388 * s);
			_setf(o + ( 1 << 2), y +  -62.987 * s);
			_setf(o + ( 2 << 2), x +   42.919 * s);
			_setf(o + ( 3 << 2), y +  -62.987 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   42.919 * s,y +  -62.987 * s,x +   42.658 * s,y +  -65.526 * s,x +   41.918 * s,y +  -67.414 * s,x +   40.697 * s,y +  -68.651 * s, threshold);
			_bez(x +   40.697 * s,y +  -68.651 * s,x +   39.477 * s,y +  -69.888 * s,x +   37.743 * s,y +  -70.507 * s,x +   35.497 * s,y +  -70.507 * s, threshold);
			_bez(x +   35.497 * s,y +  -70.507 * s,x +   32.893 * s,y +  -70.507 * s,x +   31.005 * s,y +  -69.571 * s,x +   29.833 * s,y +  -67.699 * s, threshold);
			_bez(x +   29.833 * s,y +  -67.699 * s,x +   28.661 * s,y +  -65.827 * s,x +   28.075 * s,y +  -62.792 * s,x +   28.075 * s,y +  -58.593 * s, threshold);
			o = _posf(30);
			_setf(o + ( 0 << 2), x +   28.075 * s);
			_setf(o + ( 1 << 2), y +  -51.904 * s);
			_setf(o + ( 2 << 2), x +   41.112 * s);
			_setf(o + ( 3 << 2), y +  -51.904 * s);
			_setf(o + ( 4 << 2), x +   41.112 * s);
			_setf(o + ( 5 << 2), y +  -45.995 * s);
			_setf(o + ( 6 << 2), x +   28.075 * s);
			_setf(o + ( 7 << 2), y +  -45.995 * s);
			_setf(o + ( 8 << 2), x +   28.075 * s);
			_setf(o + ( 9 << 2), y +   -5.908 * s);
			_setf(o + (10 << 2), x +   38.085 * s);
			_setf(o + (11 << 2), y +   -5.908 * s);
			_setf(o + (12 << 2), x +   38.085 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +    3.418 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +    3.418 * s);
			_setf(o + (17 << 2), y +   -5.908 * s);
			_setf(o + (18 << 2), x +   10.790 * s);
			_setf(o + (19 << 2), y +   -5.908 * s);
			_setf(o + (20 << 2), x +   10.790 * s);
			_setf(o + (21 << 2), y +  -45.995 * s);
			_setf(o + (22 << 2), x +    3.076 * s);
			_setf(o + (23 << 2), y +  -45.995 * s);
			_setf(o + (24 << 2), x +    3.076 * s);
			_setf(o + (25 << 2), y +  -51.904 * s);
			_setf(o + (26 << 2), x +   10.790 * s);
			_setf(o + (27 << 2), y +  -51.904 * s);
			_setf(o + (28 << 2), x +   10.790 * s);
			_setf(o + (29 << 2), y +  -58.398 * s);
			o = _posb(15);
			_setb(o +  0, 2);
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
			_bez(x +   10.790 * s,y +  -58.398 * s,x +   10.790 * s,y +  -64.159 * s,x +   12.630 * s,y +  -68.529 * s,x +   16.308 * s,y +  -71.508 * s, threshold);
			_bez(x +   16.308 * s,y +  -71.508 * s,x +   19.986 * s,y +  -74.486 * s,x +   25.389 * s,y +  -75.975 * s,x +   32.519 * s,y +  -75.975 * s, threshold);
			_bez(x +   32.519 * s,y +  -75.975 * s,x +   35.286 * s,y +  -75.975 * s,x +   37.987 * s,y +  -75.821 * s,x +   40.624 * s,y +  -75.512 * s, threshold);
			_bez(x +   40.624 * s,y +  -75.512 * s,x +   43.261 * s,y +  -75.202 * s,x +   45.848 * s,y +  -74.738 * s,x +   48.388 * s,y +  -74.120 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   48.388 * s);
			_setf(o + ( 1 << 2), y +  -62.987 * s);
			_setf(o + ( 2 << 2), x +   43.016 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 103:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   60.205 * s);
			_setf(o + ( 1 << 2), y +  -45.995 * s);
			_setf(o + ( 2 << 2), x +   60.205 * s);
			_setf(o + ( 3 << 2), y +   -0.684 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   60.205 * s,y +   -0.684 * s,x +   60.205 * s,y +    6.608 * s,x +   57.609 * s,y +   12.248 * s,x +   52.417 * s,y +   16.235 * s, threshold);
			_bez(x +   52.417 * s,y +   16.235 * s,x +   47.225 * s,y +   20.223 * s,x +   39.893 * s,y +   22.216 * s,x +   30.420 * s,y +   22.216 * s, threshold);
			_bez(x +   30.420 * s,y +   22.216 * s,x +   26.969 * s,y +   22.216 * s,x +   23.470 * s,y +   21.948 * s,x +   19.922 * s,y +   21.411 * s, threshold);
			_bez(x +   19.922 * s,y +   21.411 * s,x +   16.374 * s,y +   20.874 * s,x +   12.728 * s,y +   20.068 * s,x +    8.985 * s,y +   18.994 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    8.985 * s);
			_setf(o + ( 1 << 2), y +    6.592 * s);
			_setf(o + ( 2 << 2), x +   14.502 * s);
			_setf(o + ( 3 << 2), y +    6.592 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   14.502 * s,y +    6.592 * s,x +   14.991 * s,y +   10.010 * s,x +   16.366 * s,y +   12.549 * s,x +   18.628 * s,y +   14.209 * s, threshold);
			_bez(x +   18.628 * s,y +   14.209 * s,x +   20.890 * s,y +   15.869 * s,x +   24.121 * s,y +   16.699 * s,x +   28.320 * s,y +   16.699 * s, threshold);
			_bez(x +   28.320 * s,y +   16.699 * s,x +   33.659 * s,y +   16.699 * s,x +   37.427 * s,y +   15.421 * s,x +   39.624 * s,y +   12.866 * s, threshold);
			_bez(x +   39.624 * s,y +   12.866 * s,x +   41.821 * s,y +   10.311 * s,x +   42.920 * s,y +    5.794 * s,x +   42.920 * s,y +   -0.684 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   42.920 * s);
			_setf(o + ( 1 << 2), y +   -6.592 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   42.920 * s,y +   -6.592 * s,x +   41.455 * s,y +   -3.890 * s,x +   39.477 * s,y +   -1.880 * s,x +   36.987 * s,y +   -0.562 * s, threshold);
			_bez(x +   36.987 * s,y +   -0.562 * s,x +   34.497 * s,y +    0.757 * s,x +   31.429 * s,y +    1.416 * s,x +   27.783 * s,y +    1.416 * s, threshold);
			_bez(x +   27.783 * s,y +    1.416 * s,x +   20.427 * s,y +    1.416 * s,x +   14.641 * s,y +   -1.025 * s,x +   10.425 * s,y +   -5.908 * s, threshold);
			_bez(x +   10.425 * s,y +   -5.908 * s,x +    6.210 * s,y +  -10.791 * s,x +    4.102 * s,y +  -17.480 * s,x +    4.102 * s,y +  -25.976 * s, threshold);
			_bez(x +    4.102 * s,y +  -25.976 * s,x +    4.102 * s,y +  -34.505 * s,x +    6.210 * s,y +  -41.194 * s,x +   10.425 * s,y +  -46.044 * s, threshold);
			_bez(x +   10.425 * s,y +  -46.044 * s,x +   14.641 * s,y +  -50.894 * s,x +   20.427 * s,y +  -53.319 * s,x +   27.783 * s,y +  -53.319 * s, threshold);
			_bez(x +   27.783 * s,y +  -53.319 * s,x +   31.429 * s,y +  -53.319 * s,x +   34.497 * s,y +  -52.660 * s,x +   36.987 * s,y +  -51.342 * s, threshold);
			_bez(x +   36.987 * s,y +  -51.342 * s,x +   39.477 * s,y +  -50.024 * s,x +   41.455 * s,y +  -48.014 * s,x +   42.920 * s,y +  -45.312 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   42.920 * s);
			_setf(o + ( 1 << 2), y +  -51.904 * s);
			_setf(o + ( 2 << 2), x +   67.578 * s);
			_setf(o + ( 3 << 2), y +  -51.904 * s);
			_setf(o + ( 4 << 2), x +   67.578 * s);
			_setf(o + ( 5 << 2), y +  -45.995 * s);
			_setf(o + ( 6 << 2), x +   60.205 * s);
			_setf(o + ( 7 << 2), y +  -45.995 * s);
			_setf(o + ( 8 << 2), x +   42.920 * s);
			_setf(o + ( 9 << 2), y +  -28.515 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 1);
			_bez(x +   42.920 * s,y +  -28.515 * s,x +   42.920 * s,y +  -34.570 * s,x +   42.139 * s,y +  -38.948 * s,x +   40.576 * s,y +  -41.650 * s, threshold);
			_bez(x +   40.576 * s,y +  -41.650 * s,x +   39.014 * s,y +  -44.352 * s,x +   36.523 * s,y +  -45.702 * s,x +   33.105 * s,y +  -45.702 * s, threshold);
			_bez(x +   33.105 * s,y +  -45.702 * s,x +   29.525 * s,y +  -45.702 * s,x +   27.010 * s,y +  -44.278 * s,x +   25.562 * s,y +  -41.430 * s, threshold);
			_bez(x +   25.562 * s,y +  -41.430 * s,x +   24.113 * s,y +  -38.582 * s,x +   23.389 * s,y +  -33.430 * s,x +   23.389 * s,y +  -25.976 * s, threshold);
			_bez(x +   23.389 * s,y +  -25.976 * s,x +   23.389 * s,y +  -18.522 * s,x +   24.121 * s,y +  -13.362 * s,x +   25.586 * s,y +  -10.498 * s, threshold);
			_bez(x +   25.586 * s,y +  -10.498 * s,x +   27.051 * s,y +   -7.633 * s,x +   29.557 * s,y +   -6.201 * s,x +   33.105 * s,y +   -6.201 * s, threshold);
			_bez(x +   33.105 * s,y +   -6.201 * s,x +   36.523 * s,y +   -6.201 * s,x +   39.014 * s,y +   -7.552 * s,x +   40.576 * s,y +  -10.254 * s, threshold);
			_bez(x +   40.576 * s,y +  -10.254 * s,x +   42.139 * s,y +  -12.956 * s,x +   42.920 * s,y +  -17.334 * s,x +   42.920 * s,y +  -23.388 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   42.920 * s);
			_setf(o + ( 1 << 2), y +  -28.515 * s);
			_setf(o + ( 2 << 2), x +   69.921 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 104:
			
			o = _posf(16);
			_setf(o + ( 0 << 2), x +    3.418 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    3.418 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   10.791 * s);
			_setf(o + ( 5 << 2), y +   -5.908 * s);
			_setf(o + ( 6 << 2), x +   10.791 * s);
			_setf(o + ( 7 << 2), y +  -70.116 * s);
			_setf(o + ( 8 << 2), x +    3.076 * s);
			_setf(o + ( 9 << 2), y +  -70.116 * s);
			_setf(o + (10 << 2), x +    3.076 * s);
			_setf(o + (11 << 2), y +  -75.975 * s);
			_setf(o + (12 << 2), x +   28.076 * s);
			_setf(o + (13 << 2), y +  -75.975 * s);
			_setf(o + (14 << 2), x +   28.076 * s);
			_setf(o + (15 << 2), y +  -44.579 * s);
			o = _posb(8);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_bez(x +   28.076 * s,y +  -44.579 * s,x +   30.159 * s,y +  -47.672 * s,x +   32.535 * s,y +  -49.902 * s,x +   35.204 * s,y +  -51.269 * s, threshold);
			_bez(x +   35.204 * s,y +  -51.269 * s,x +   37.874 * s,y +  -52.636 * s,x +   41.243 * s,y +  -53.319 * s,x +   45.312 * s,y +  -53.319 * s, threshold);
			_bez(x +   45.312 * s,y +  -53.319 * s,x +   51.139 * s,y +  -53.319 * s,x +   55.541 * s,y +  -51.602 * s,x +   58.520 * s,y +  -48.168 * s, threshold);
			_bez(x +   58.520 * s,y +  -48.168 * s,x +   61.498 * s,y +  -44.734 * s,x +   62.987 * s,y +  -39.680 * s,x +   62.987 * s,y +  -33.007 * s, threshold);
			o = _posf(14);
			_setf(o + ( 0 << 2), x +   62.987 * s);
			_setf(o + ( 1 << 2), y +   -5.908 * s);
			_setf(o + ( 2 << 2), x +   70.409 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   70.409 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   39.404 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   39.404 * s);
			_setf(o + ( 9 << 2), y +   -5.908 * s);
			_setf(o + (10 << 2), x +   45.702 * s);
			_setf(o + (11 << 2), y +   -5.908 * s);
			_setf(o + (12 << 2), x +   45.702 * s);
			_setf(o + (13 << 2), y +  -33.496 * s);
			o = _posb(7);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_bez(x +   45.702 * s,y +  -33.496 * s,x +   45.702 * s,y +  -37.890 * s,x +   45.141 * s,y +  -40.942 * s,x +   44.018 * s,y +  -42.651 * s, threshold);
			_bez(x +   44.018 * s,y +  -42.651 * s,x +   42.895 * s,y +  -44.360 * s,x +   40.950 * s,y +  -45.214 * s,x +   38.183 * s,y +  -45.214 * s, threshold);
			_bez(x +   38.183 * s,y +  -45.214 * s,x +   34.700 * s,y +  -45.214 * s,x +   32.145 * s,y +  -43.936 * s,x +   30.517 * s,y +  -41.381 * s, threshold);
			_bez(x +   30.517 * s,y +  -41.381 * s,x +   28.889 * s,y +  -38.826 * s,x +   28.076 * s,y +  -34.765 * s,x +   28.076 * s,y +  -29.199 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   28.076 * s);
			_setf(o + ( 1 << 2), y +   -5.908 * s);
			_setf(o + ( 2 << 2), x +   34.423 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   34.423 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    3.418 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   72.704 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 1);
			
			case 105:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    9.179 * s);
			_setf(o + ( 1 << 2), y +  -66.601 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +    9.179 * s,y +  -66.601 * s,x +    9.179 * s,y +  -69.237 * s,x +   10.091 * s,y +  -71.459 * s,x +   11.914 * s,y +  -73.265 * s, threshold);
			_bez(x +   11.914 * s,y +  -73.265 * s,x +   13.737 * s,y +  -75.072 * s,x +   15.966 * s,y +  -75.975 * s,x +   18.603 * s,y +  -75.975 * s, threshold);
			_bez(x +   18.603 * s,y +  -75.975 * s,x +   21.175 * s,y +  -75.975 * s,x +   23.364 * s,y +  -75.072 * s,x +   25.170 * s,y +  -73.265 * s, threshold);
			_bez(x +   25.170 * s,y +  -73.265 * s,x +   26.977 * s,y +  -71.459 * s,x +   27.880 * s,y +  -69.237 * s,x +   27.880 * s,y +  -66.601 * s, threshold);
			_bez(x +   27.880 * s,y +  -66.601 * s,x +   27.880 * s,y +  -64.029 * s,x +   26.977 * s,y +  -61.840 * s,x +   25.170 * s,y +  -60.033 * s, threshold);
			_bez(x +   25.170 * s,y +  -60.033 * s,x +   23.364 * s,y +  -58.227 * s,x +   21.175 * s,y +  -57.323 * s,x +   18.603 * s,y +  -57.323 * s, threshold);
			_bez(x +   18.603 * s,y +  -57.323 * s,x +   15.966 * s,y +  -57.323 * s,x +   13.737 * s,y +  -58.219 * s,x +   11.914 * s,y +  -60.009 * s, threshold);
			_bez(x +   11.914 * s,y +  -60.009 * s,x +   10.091 * s,y +  -61.799 * s,x +    9.179 * s,y +  -63.996 * s,x +    9.179 * s,y +  -66.601 * s, threshold);
			o = _posf(24);
			_setf(o + ( 0 << 2), x +   28.076 * s);
			_setf(o + ( 1 << 2), y +   -5.908 * s);
			_setf(o + ( 2 << 2), x +   35.497 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   35.497 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    3.418 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    3.418 * s);
			_setf(o + ( 9 << 2), y +   -5.908 * s);
			_setf(o + (10 << 2), x +   10.791 * s);
			_setf(o + (11 << 2), y +   -5.908 * s);
			_setf(o + (12 << 2), x +   10.791 * s);
			_setf(o + (13 << 2), y +  -45.995 * s);
			_setf(o + (14 << 2), x +    3.418 * s);
			_setf(o + (15 << 2), y +  -45.995 * s);
			_setf(o + (16 << 2), x +    3.418 * s);
			_setf(o + (17 << 2), y +  -51.904 * s);
			_setf(o + (18 << 2), x +   28.076 * s);
			_setf(o + (19 << 2), y +  -51.904 * s);
			_setf(o + (20 << 2), x +   28.076 * s);
			_setf(o + (21 << 2), y +   -5.908 * s);
			_setf(o + (22 << 2), x +   37.988 * s);
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
			
			case 106:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    8.691 * s);
			_setf(o + ( 1 << 2), y +  -66.601 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +    8.691 * s,y +  -66.601 * s,x +    8.691 * s,y +  -69.237 * s,x +    9.594 * s,y +  -71.459 * s,x +   11.401 * s,y +  -73.265 * s, threshold);
			_bez(x +   11.401 * s,y +  -73.265 * s,x +   13.207 * s,y +  -75.072 * s,x +   15.445 * s,y +  -75.975 * s,x +   18.115 * s,y +  -75.975 * s, threshold);
			_bez(x +   18.115 * s,y +  -75.975 * s,x +   20.654 * s,y +  -75.975 * s,x +   22.835 * s,y +  -75.064 * s,x +   24.657 * s,y +  -73.241 * s, threshold);
			_bez(x +   24.657 * s,y +  -73.241 * s,x +   26.480 * s,y +  -71.418 * s,x +   27.392 * s,y +  -69.205 * s,x +   27.392 * s,y +  -66.601 * s, threshold);
			_bez(x +   27.392 * s,y +  -66.601 * s,x +   27.392 * s,y +  -64.029 * s,x +   26.488 * s,y +  -61.840 * s,x +   24.682 * s,y +  -60.033 * s, threshold);
			_bez(x +   24.682 * s,y +  -60.033 * s,x +   22.875 * s,y +  -58.227 * s,x +   20.686 * s,y +  -57.323 * s,x +   18.115 * s,y +  -57.323 * s, threshold);
			_bez(x +   18.115 * s,y +  -57.323 * s,x +   15.478 * s,y +  -57.323 * s,x +   13.248 * s,y +  -58.219 * s,x +   11.425 * s,y +  -60.009 * s, threshold);
			_bez(x +   11.425 * s,y +  -60.009 * s,x +    9.602 * s,y +  -61.799 * s,x +    8.691 * s,y +  -63.996 * s,x +    8.691 * s,y +  -66.601 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   10.693 * s);
			_setf(o + ( 1 << 2), y +  -45.995 * s);
			_setf(o + ( 2 << 2), x +    3.320 * s);
			_setf(o + ( 3 << 2), y +  -45.995 * s);
			_setf(o + ( 4 << 2), x +    3.320 * s);
			_setf(o + ( 5 << 2), y +  -51.904 * s);
			_setf(o + ( 6 << 2), x +   27.978 * s);
			_setf(o + ( 7 << 2), y +  -51.904 * s);
			_setf(o + ( 8 << 2), x +   27.978 * s);
			_setf(o + ( 9 << 2), y +    6.103 * s);
			o = _posb(5);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   27.978 * s,y +    6.103 * s,x +   27.978 * s,y +   11.409 * s,x +   26.098 * s,y +   15.421 * s,x +   22.338 * s,y +   18.139 * s, threshold);
			_bez(x +   22.338 * s,y +   18.139 * s,x +   18.578 * s,y +   20.857 * s,x +   13.037 * s,y +   22.216 * s,x +    5.712 * s,y +   22.216 * s, threshold);
			_bez(x +    5.712 * s,y +   22.216 * s,x +    3.759 * s,y +   22.216 * s,x +    1.676 * s,y +   22.054 * s,x +   -0.537 * s,y +   21.728 * s, threshold);
			_bez(x +   -0.537 * s,y +   21.728 * s,x +   -2.751 * s,y +   21.403 * s,x +   -5.046 * s,y +   20.931 * s,x +   -7.422 * s,y +   20.312 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   -7.422 * s);
			_setf(o + ( 1 << 2), y +    9.277 * s);
			_setf(o + ( 2 << 2), x +   -1.905 * s);
			_setf(o + ( 3 << 2), y +    9.326 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   -1.905 * s,y +    9.326 * s,x +   -1.840 * s,y +   11.930 * s,x +   -1.327 * s,y +   13.810 * s,x +   -0.367 * s,y +   14.966 * s, threshold);
			_bez(x +   -0.367 * s,y +   14.966 * s,x +    0.594 * s,y +   16.121 * s,x +    2.148 * s,y +   16.699 * s,x +    4.296 * s,y +   16.699 * s, threshold);
			_bez(x +    4.296 * s,y +   16.699 * s,x +    6.673 * s,y +   16.699 * s,x +    8.333 * s,y +   15.934 * s,x +    9.277 * s,y +   14.404 * s, threshold);
			_bez(x +    9.277 * s,y +   14.404 * s,x +   10.221 * s,y +   12.874 * s,x +   10.693 * s,y +   10.107 * s,x +   10.693 * s,y +    6.103 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   10.693 * s);
			_setf(o + ( 1 << 2), y +  -45.995 * s);
			_setf(o + ( 2 << 2), x +   36.181 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 107:
			
			o = _posf(56);
			_setf(o + ( 0 << 2), x +   34.618 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    3.418 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    3.418 * s);
			_setf(o + ( 5 << 2), y +   -5.908 * s);
			_setf(o + ( 6 << 2), x +   10.791 * s);
			_setf(o + ( 7 << 2), y +   -5.908 * s);
			_setf(o + ( 8 << 2), x +   10.791 * s);
			_setf(o + ( 9 << 2), y +  -70.116 * s);
			_setf(o + (10 << 2), x +    3.418 * s);
			_setf(o + (11 << 2), y +  -70.116 * s);
			_setf(o + (12 << 2), x +    3.418 * s);
			_setf(o + (13 << 2), y +  -75.975 * s);
			_setf(o + (14 << 2), x +   28.075 * s);
			_setf(o + (15 << 2), y +  -75.975 * s);
			_setf(o + (16 << 2), x +   28.075 * s);
			_setf(o + (17 << 2), y +  -27.197 * s);
			_setf(o + (18 << 2), x +   49.022 * s);
			_setf(o + (19 << 2), y +  -45.995 * s);
			_setf(o + (20 << 2), x +   42.821 * s);
			_setf(o + (21 << 2), y +  -45.995 * s);
			_setf(o + (22 << 2), x +   42.821 * s);
			_setf(o + (23 << 2), y +  -51.904 * s);
			_setf(o + (24 << 2), x +   66.503 * s);
			_setf(o + (25 << 2), y +  -51.904 * s);
			_setf(o + (26 << 2), x +   66.503 * s);
			_setf(o + (27 << 2), y +  -45.995 * s);
			_setf(o + (28 << 2), x +   56.884 * s);
			_setf(o + (29 << 2), y +  -45.995 * s);
			_setf(o + (30 << 2), x +   43.505 * s);
			_setf(o + (31 << 2), y +  -33.984 * s);
			_setf(o + (32 << 2), x +   65.380 * s);
			_setf(o + (33 << 2), y +   -5.908 * s);
			_setf(o + (34 << 2), x +   70.995 * s);
			_setf(o + (35 << 2), y +   -5.908 * s);
			_setf(o + (36 << 2), x +   70.995 * s);
			_setf(o + (37 << 2), y +       0. * s);
			_setf(o + (38 << 2), x +   41.210 * s);
			_setf(o + (39 << 2), y +       0. * s);
			_setf(o + (40 << 2), x +   41.210 * s);
			_setf(o + (41 << 2), y +   -5.908 * s);
			_setf(o + (42 << 2), x +   47.313 * s);
			_setf(o + (43 << 2), y +   -5.908 * s);
			_setf(o + (44 << 2), x +   32.909 * s);
			_setf(o + (45 << 2), y +  -24.414 * s);
			_setf(o + (46 << 2), x +   28.075 * s);
			_setf(o + (47 << 2), y +  -20.117 * s);
			_setf(o + (48 << 2), x +   28.075 * s);
			_setf(o + (49 << 2), y +   -5.908 * s);
			_setf(o + (50 << 2), x +   34.618 * s);
			_setf(o + (51 << 2), y +   -5.908 * s);
			_setf(o + (52 << 2), x +   34.618 * s);
			_setf(o + (53 << 2), y +       0. * s);
			_setf(o + (54 << 2), x +   69.286 * s);
			_setf(o + (55 << 2), y +       0. * s);
			o = _posb(28);
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
			_setb(o + 27, 1);
			
			case 108:
			
			o = _posf(24);
			_setf(o + ( 0 << 2), x +   28.076 * s);
			_setf(o + ( 1 << 2), y +   -5.908 * s);
			_setf(o + ( 2 << 2), x +   35.497 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   35.497 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    3.418 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    3.418 * s);
			_setf(o + ( 9 << 2), y +   -5.908 * s);
			_setf(o + (10 << 2), x +   10.791 * s);
			_setf(o + (11 << 2), y +   -5.908 * s);
			_setf(o + (12 << 2), x +   10.791 * s);
			_setf(o + (13 << 2), y +  -70.116 * s);
			_setf(o + (14 << 2), x +    3.418 * s);
			_setf(o + (15 << 2), y +  -70.116 * s);
			_setf(o + (16 << 2), x +    3.418 * s);
			_setf(o + (17 << 2), y +  -75.975 * s);
			_setf(o + (18 << 2), x +   28.076 * s);
			_setf(o + (19 << 2), y +  -75.975 * s);
			_setf(o + (20 << 2), x +   28.076 * s);
			_setf(o + (21 << 2), y +   -5.908 * s);
			_setf(o + (22 << 2), x +   37.987 * s);
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
			
			case 109:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.693 * s);
			_setf(o + ( 1 << 2), y +  -43.408 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   60.693 * s,y +  -43.408 * s,x +   63.102 * s,y +  -46.858 * s,x +   65.706 * s,y +  -49.373 * s,x +   68.505 * s,y +  -50.951 * s, threshold);
			_bez(x +   68.505 * s,y +  -50.951 * s,x +   71.305 * s,y +  -52.530 * s,x +   74.576 * s,y +  -53.319 * s,x +   78.320 * s,y +  -53.319 * s, threshold);
			_bez(x +   78.320 * s,y +  -53.319 * s,x +   84.277 * s,y +  -53.319 * s,x +   88.728 * s,y +  -51.635 * s,x +   91.674 * s,y +  -48.266 * s, threshold);
			_bez(x +   91.674 * s,y +  -48.266 * s,x +   94.620 * s,y +  -44.897 * s,x +   96.093 * s,y +  -39.810 * s,x +   96.093 * s,y +  -33.007 * s, threshold);
			o = _posf(14);
			_setf(o + ( 0 << 2), x +   96.093 * s);
			_setf(o + ( 1 << 2), y +   -5.908 * s);
			_setf(o + ( 2 << 2), x +  103.515 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +  103.515 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   72.607 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   72.607 * s);
			_setf(o + ( 9 << 2), y +   -5.908 * s);
			_setf(o + (10 << 2), x +   78.808 * s);
			_setf(o + (11 << 2), y +   -5.908 * s);
			_setf(o + (12 << 2), x +   78.808 * s);
			_setf(o + (13 << 2), y +  -30.419 * s);
			o = _posb(7);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_bez(x +   78.808 * s,y +  -30.419 * s,x +   78.808 * s,y +  -36.897 * s,x +   78.311 * s,y +  -40.982 * s,x +   77.319 * s,y +  -42.675 * s, threshold);
			_bez(x +   77.319 * s,y +  -42.675 * s,x +   76.326 * s,y +  -44.368 * s,x +   74.478 * s,y +  -45.214 * s,x +   71.777 * s,y +  -45.214 * s, threshold);
			_bez(x +   71.777 * s,y +  -45.214 * s,x +   68.717 * s,y +  -45.214 * s,x +   66.341 * s,y +  -44.034 * s,x +   64.648 * s,y +  -41.674 * s, threshold);
			_bez(x +   64.648 * s,y +  -41.674 * s,x +   62.955 * s,y +  -39.314 * s,x +   62.109 * s,y +  -35.953 * s,x +   62.109 * s,y +  -31.591 * s, threshold);
			o = _posf(14);
			_setf(o + ( 0 << 2), x +   62.109 * s);
			_setf(o + ( 1 << 2), y +   -5.908 * s);
			_setf(o + ( 2 << 2), x +   68.310 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   68.310 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   38.623 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   38.623 * s);
			_setf(o + ( 9 << 2), y +   -5.908 * s);
			_setf(o + (10 << 2), x +   44.824 * s);
			_setf(o + (11 << 2), y +   -5.908 * s);
			_setf(o + (12 << 2), x +   44.824 * s);
			_setf(o + (13 << 2), y +  -30.419 * s);
			o = _posb(7);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_bez(x +   44.824 * s,y +  -30.419 * s,x +   44.824 * s,y +  -36.897 * s,x +   44.319 * s,y +  -40.982 * s,x +   43.310 * s,y +  -42.675 * s, threshold);
			_bez(x +   43.310 * s,y +  -42.675 * s,x +   42.301 * s,y +  -44.368 * s,x +   40.462 * s,y +  -45.214 * s,x +   37.793 * s,y +  -45.214 * s, threshold);
			_bez(x +   37.793 * s,y +  -45.214 * s,x +   34.701 * s,y +  -45.214 * s,x +   32.308 * s,y +  -44.034 * s,x +   30.615 * s,y +  -41.674 * s, threshold);
			_bez(x +   30.615 * s,y +  -41.674 * s,x +   28.923 * s,y +  -39.314 * s,x +   28.076 * s,y +  -35.953 * s,x +   28.076 * s,y +  -31.591 * s, threshold);
			o = _posf(22);
			_setf(o + ( 0 << 2), x +   28.076 * s);
			_setf(o + ( 1 << 2), y +   -5.908 * s);
			_setf(o + ( 2 << 2), x +   34.277 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   34.277 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    3.418 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    3.418 * s);
			_setf(o + ( 9 << 2), y +   -5.908 * s);
			_setf(o + (10 << 2), x +   10.791 * s);
			_setf(o + (11 << 2), y +   -5.908 * s);
			_setf(o + (12 << 2), x +   10.791 * s);
			_setf(o + (13 << 2), y +  -45.995 * s);
			_setf(o + (14 << 2), x +    3.418 * s);
			_setf(o + (15 << 2), y +  -45.995 * s);
			_setf(o + (16 << 2), x +    3.418 * s);
			_setf(o + (17 << 2), y +  -51.904 * s);
			_setf(o + (18 << 2), x +   28.076 * s);
			_setf(o + (19 << 2), y +  -51.904 * s);
			_setf(o + (20 << 2), x +   28.076 * s);
			_setf(o + (21 << 2), y +  -44.579 * s);
			o = _posb(11);
			_setb(o +  0, 2);
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
			_bez(x +   28.076 * s,y +  -44.579 * s,x +   30.094 * s,y +  -47.607 * s,x +   32.406 * s,y +  -49.820 * s,x +   35.010 * s,y +  -51.220 * s, threshold);
			_bez(x +   35.010 * s,y +  -51.220 * s,x +   37.614 * s,y +  -52.620 * s,x +   40.706 * s,y +  -53.319 * s,x +   44.287 * s,y +  -53.319 * s, threshold);
			_bez(x +   44.287 * s,y +  -53.319 * s,x +   48.518 * s,y +  -53.319 * s,x +   51.953 * s,y +  -52.514 * s,x +   54.589 * s,y +  -50.903 * s, threshold);
			_bez(x +   54.589 * s,y +  -50.903 * s,x +   57.226 * s,y +  -49.291 * s,x +   59.261 * s,y +  -46.793 * s,x +   60.693 * s,y +  -43.408 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +  105.809 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 110:
			
			o = _posf(16);
			_setf(o + ( 0 << 2), x +    3.418 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    3.418 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   10.791 * s);
			_setf(o + ( 5 << 2), y +   -5.908 * s);
			_setf(o + ( 6 << 2), x +   10.791 * s);
			_setf(o + ( 7 << 2), y +  -45.995 * s);
			_setf(o + ( 8 << 2), x +    3.418 * s);
			_setf(o + ( 9 << 2), y +  -45.995 * s);
			_setf(o + (10 << 2), x +    3.418 * s);
			_setf(o + (11 << 2), y +  -51.904 * s);
			_setf(o + (12 << 2), x +   28.076 * s);
			_setf(o + (13 << 2), y +  -51.904 * s);
			_setf(o + (14 << 2), x +   28.076 * s);
			_setf(o + (15 << 2), y +  -44.579 * s);
			o = _posb(8);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_bez(x +   28.076 * s,y +  -44.579 * s,x +   30.159 * s,y +  -47.672 * s,x +   32.536 * s,y +  -49.902 * s,x +   35.205 * s,y +  -51.269 * s, threshold);
			_bez(x +   35.205 * s,y +  -51.269 * s,x +   37.874 * s,y +  -52.636 * s,x +   41.243 * s,y +  -53.319 * s,x +   45.312 * s,y +  -53.319 * s, threshold);
			_bez(x +   45.312 * s,y +  -53.319 * s,x +   51.139 * s,y +  -53.319 * s,x +   55.542 * s,y +  -51.602 * s,x +   58.520 * s,y +  -48.168 * s, threshold);
			_bez(x +   58.520 * s,y +  -48.168 * s,x +   61.498 * s,y +  -44.734 * s,x +   62.988 * s,y +  -39.680 * s,x +   62.988 * s,y +  -33.007 * s, threshold);
			o = _posf(14);
			_setf(o + ( 0 << 2), x +   62.988 * s);
			_setf(o + ( 1 << 2), y +   -5.908 * s);
			_setf(o + ( 2 << 2), x +   70.409 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   70.409 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   39.404 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   39.404 * s);
			_setf(o + ( 9 << 2), y +   -5.908 * s);
			_setf(o + (10 << 2), x +   45.703 * s);
			_setf(o + (11 << 2), y +   -5.908 * s);
			_setf(o + (12 << 2), x +   45.703 * s);
			_setf(o + (13 << 2), y +  -33.496 * s);
			o = _posb(7);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_bez(x +   45.703 * s,y +  -33.496 * s,x +   45.703 * s,y +  -37.890 * s,x +   45.141 * s,y +  -40.942 * s,x +   44.018 * s,y +  -42.651 * s, threshold);
			_bez(x +   44.018 * s,y +  -42.651 * s,x +   42.895 * s,y +  -44.360 * s,x +   40.950 * s,y +  -45.214 * s,x +   38.183 * s,y +  -45.214 * s, threshold);
			_bez(x +   38.183 * s,y +  -45.214 * s,x +   34.700 * s,y +  -45.214 * s,x +   32.145 * s,y +  -43.936 * s,x +   30.518 * s,y +  -41.381 * s, threshold);
			_bez(x +   30.518 * s,y +  -41.381 * s,x +   28.890 * s,y +  -38.826 * s,x +   28.076 * s,y +  -34.765 * s,x +   28.076 * s,y +  -29.199 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   28.076 * s);
			_setf(o + ( 1 << 2), y +   -5.908 * s);
			_setf(o + ( 2 << 2), x +   34.424 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   34.424 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    3.418 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   72.704 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 1);
			
			case 111:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   33.398 * s);
			_setf(o + ( 1 << 2), y +   -4.101 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   33.398 * s,y +   -4.101 * s,x +   37.044 * s,y +   -4.101 * s,x +   39.608 * s,y +   -5.664 * s,x +   41.089 * s,y +   -8.789 * s, threshold);
			_bez(x +   41.089 * s,y +   -8.789 * s,x +   42.570 * s,y +  -11.914 * s,x +   43.310 * s,y +  -17.643 * s,x +   43.310 * s,y +  -25.976 * s, threshold);
			_bez(x +   43.310 * s,y +  -25.976 * s,x +   43.310 * s,y +  -34.309 * s,x +   42.578 * s,y +  -40.030 * s,x +   41.113 * s,y +  -43.139 * s, threshold);
			_bez(x +   41.113 * s,y +  -43.139 * s,x +   39.648 * s,y +  -46.248 * s,x +   37.077 * s,y +  -47.802 * s,x +   33.398 * s,y +  -47.802 * s, threshold);
			_bez(x +   33.398 * s,y +  -47.802 * s,x +   29.720 * s,y +  -47.802 * s,x +   27.132 * s,y +  -46.231 * s,x +   25.635 * s,y +  -43.090 * s, threshold);
			_bez(x +   25.635 * s,y +  -43.090 * s,x +   24.137 * s,y +  -39.949 * s,x +   23.389 * s,y +  -34.244 * s,x +   23.389 * s,y +  -25.976 * s, threshold);
			_bez(x +   23.389 * s,y +  -25.976 * s,x +   23.389 * s,y +  -17.708 * s,x +   24.137 * s,y +  -11.995 * s,x +   25.635 * s,y +   -8.838 * s, threshold);
			_bez(x +   25.635 * s,y +   -8.838 * s,x +   27.132 * s,y +   -5.680 * s,x +   29.720 * s,y +   -4.101 * s,x +   33.398 * s,y +   -4.101 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   33.398 * s);
			_setf(o + ( 1 << 2), y +    1.416 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   33.398 * s,y +    1.416 * s,x +   24.251 * s,y +    1.416 * s,x +   17.082 * s,y +   -1.017 * s,x +   11.890 * s,y +   -5.884 * s, threshold);
			_bez(x +   11.890 * s,y +   -5.884 * s,x +    6.698 * s,y +  -10.750 * s,x +    4.102 * s,y +  -17.448 * s,x +    4.102 * s,y +  -25.976 * s, threshold);
			_bez(x +    4.102 * s,y +  -25.976 * s,x +    4.102 * s,y +  -34.537 * s,x +    6.698 * s,y +  -41.235 * s,x +   11.890 * s,y +  -46.069 * s, threshold);
			_bez(x +   11.890 * s,y +  -46.069 * s,x +   17.082 * s,y +  -50.903 * s,x +   24.251 * s,y +  -53.319 * s,x +   33.398 * s,y +  -53.319 * s, threshold);
			_bez(x +   33.398 * s,y +  -53.319 * s,x +   42.578 * s,y +  -53.319 * s,x +   49.755 * s,y +  -50.903 * s,x +   54.931 * s,y +  -46.069 * s, threshold);
			_bez(x +   54.931 * s,y +  -46.069 * s,x +   60.107 * s,y +  -41.235 * s,x +   62.695 * s,y +  -34.537 * s,x +   62.695 * s,y +  -25.976 * s, threshold);
			_bez(x +   62.695 * s,y +  -25.976 * s,x +   62.695 * s,y +  -17.448 * s,x +   60.099 * s,y +  -10.750 * s,x +   54.907 * s,y +   -5.884 * s, threshold);
			_bez(x +   54.907 * s,y +   -5.884 * s,x +   49.715 * s,y +   -1.017 * s,x +   42.545 * s,y +    1.416 * s,x +   33.398 * s,y +    1.416 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   66.699 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 112:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   27.001 * s);
			_setf(o + ( 1 << 2), y +  -28.515 * s);
			_setf(o + ( 2 << 2), x +   27.001 * s);
			_setf(o + ( 3 << 2), y +  -23.388 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   27.001 * s,y +  -23.388 * s,x +   27.001 * s,y +  -17.334 * s,x +   27.775 * s,y +  -12.956 * s,x +   29.321 * s,y +  -10.254 * s, threshold);
			_bez(x +   29.321 * s,y +  -10.254 * s,x +   30.867 * s,y +   -7.552 * s,x +   33.365 * s,y +   -6.201 * s,x +   36.816 * s,y +   -6.201 * s, threshold);
			_bez(x +   36.816 * s,y +   -6.201 * s,x +   40.364 * s,y +   -6.201 * s,x +   42.862 * s,y +   -7.633 * s,x +   44.311 * s,y +  -10.498 * s, threshold);
			_bez(x +   44.311 * s,y +  -10.498 * s,x +   45.759 * s,y +  -13.362 * s,x +   46.484 * s,y +  -18.522 * s,x +   46.484 * s,y +  -25.976 * s, threshold);
			_bez(x +   46.484 * s,y +  -25.976 * s,x +   46.484 * s,y +  -33.430 * s,x +   45.759 * s,y +  -38.582 * s,x +   44.311 * s,y +  -41.430 * s, threshold);
			_bez(x +   44.311 * s,y +  -41.430 * s,x +   42.862 * s,y +  -44.278 * s,x +   40.364 * s,y +  -45.702 * s,x +   36.816 * s,y +  -45.702 * s, threshold);
			_bez(x +   36.816 * s,y +  -45.702 * s,x +   33.365 * s,y +  -45.702 * s,x +   30.867 * s,y +  -44.352 * s,x +   29.321 * s,y +  -41.650 * s, threshold);
			_bez(x +   29.321 * s,y +  -41.650 * s,x +   27.775 * s,y +  -38.948 * s,x +   27.001 * s,y +  -34.570 * s,x +   27.001 * s,y +  -28.515 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +    9.717 * s);
			_setf(o + ( 1 << 2), y +  -45.995 * s);
			_setf(o + ( 2 << 2), x +    2.295 * s);
			_setf(o + ( 3 << 2), y +  -45.995 * s);
			_setf(o + ( 4 << 2), x +    2.295 * s);
			_setf(o + ( 5 << 2), y +  -51.904 * s);
			_setf(o + ( 6 << 2), x +   27.001 * s);
			_setf(o + ( 7 << 2), y +  -51.904 * s);
			_setf(o + ( 8 << 2), x +   27.001 * s);
			_setf(o + ( 9 << 2), y +  -45.312 * s);
			o = _posb(5);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   27.001 * s,y +  -45.312 * s,x +   28.466 * s,y +  -48.014 * s,x +   30.436 * s,y +  -50.024 * s,x +   32.910 * s,y +  -51.342 * s, threshold);
			_bez(x +   32.910 * s,y +  -51.342 * s,x +   35.384 * s,y +  -52.660 * s,x +   38.443 * s,y +  -53.319 * s,x +   42.089 * s,y +  -53.319 * s, threshold);
			_bez(x +   42.089 * s,y +  -53.319 * s,x +   49.478 * s,y +  -53.319 * s,x +   55.297 * s,y +  -50.886 * s,x +   59.545 * s,y +  -46.020 * s, threshold);
			_bez(x +   59.545 * s,y +  -46.020 * s,x +   63.793 * s,y +  -41.153 * s,x +   65.917 * s,y +  -34.472 * s,x +   65.917 * s,y +  -25.976 * s, threshold);
			_bez(x +   65.917 * s,y +  -25.976 * s,x +   65.917 * s,y +  -17.480 * s,x +   63.793 * s,y +  -10.791 * s,x +   59.545 * s,y +   -5.908 * s, threshold);
			_bez(x +   59.545 * s,y +   -5.908 * s,x +   55.297 * s,y +   -1.025 * s,x +   49.478 * s,y +    1.416 * s,x +   42.089 * s,y +    1.416 * s, threshold);
			_bez(x +   42.089 * s,y +    1.416 * s,x +   38.443 * s,y +    1.416 * s,x +   35.384 * s,y +    0.757 * s,x +   32.910 * s,y +   -0.562 * s, threshold);
			_bez(x +   32.910 * s,y +   -0.562 * s,x +   30.436 * s,y +   -1.880 * s,x +   28.466 * s,y +   -3.890 * s,x +   27.001 * s,y +   -6.592 * s, threshold);
			o = _posf(16);
			_setf(o + ( 0 << 2), x +   27.001 * s);
			_setf(o + ( 1 << 2), y +   14.892 * s);
			_setf(o + ( 2 << 2), x +   35.009 * s);
			_setf(o + ( 3 << 2), y +   14.892 * s);
			_setf(o + ( 4 << 2), x +   35.009 * s);
			_setf(o + ( 5 << 2), y +   20.800 * s);
			_setf(o + ( 6 << 2), x +    2.295 * s);
			_setf(o + ( 7 << 2), y +   20.800 * s);
			_setf(o + ( 8 << 2), x +    2.295 * s);
			_setf(o + ( 9 << 2), y +   14.892 * s);
			_setf(o + (10 << 2), x +    9.717 * s);
			_setf(o + (11 << 2), y +   14.892 * s);
			_setf(o + (12 << 2), x +    9.717 * s);
			_setf(o + (13 << 2), y +  -45.995 * s);
			_setf(o + (14 << 2), x +   69.921 * s);
			_setf(o + (15 << 2), y +       0. * s);
			o = _posb(8);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 1);
			
			case 113:
			
			o = _posf(16);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +  -45.995 * s);
			_setf(o + ( 2 << 2), x +   60.204 * s);
			_setf(o + ( 3 << 2), y +   14.892 * s);
			_setf(o + ( 4 << 2), x +   67.577 * s);
			_setf(o + ( 5 << 2), y +   14.892 * s);
			_setf(o + ( 6 << 2), x +   67.577 * s);
			_setf(o + ( 7 << 2), y +   20.800 * s);
			_setf(o + ( 8 << 2), x +   34.911 * s);
			_setf(o + ( 9 << 2), y +   20.800 * s);
			_setf(o + (10 << 2), x +   34.911 * s);
			_setf(o + (11 << 2), y +   14.892 * s);
			_setf(o + (12 << 2), x +   42.919 * s);
			_setf(o + (13 << 2), y +   14.892 * s);
			_setf(o + (14 << 2), x +   42.919 * s);
			_setf(o + (15 << 2), y +   -6.592 * s);
			o = _posb(8);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_bez(x +   42.919 * s,y +   -6.592 * s,x +   41.454 * s,y +   -3.890 * s,x +   39.477 * s,y +   -1.880 * s,x +   36.987 * s,y +   -0.562 * s, threshold);
			_bez(x +   36.987 * s,y +   -0.562 * s,x +   34.496 * s,y +    0.757 * s,x +   31.428 * s,y +    1.416 * s,x +   27.783 * s,y +    1.416 * s, threshold);
			_bez(x +   27.783 * s,y +    1.416 * s,x +   20.426 * s,y +    1.416 * s,x +   14.640 * s,y +   -1.025 * s,x +   10.425 * s,y +   -5.908 * s, threshold);
			_bez(x +   10.425 * s,y +   -5.908 * s,x +    6.209 * s,y +  -10.791 * s,x +    4.101 * s,y +  -17.480 * s,x +    4.101 * s,y +  -25.976 * s, threshold);
			_bez(x +    4.101 * s,y +  -25.976 * s,x +    4.101 * s,y +  -34.505 * s,x +    6.209 * s,y +  -41.194 * s,x +   10.425 * s,y +  -46.044 * s, threshold);
			_bez(x +   10.425 * s,y +  -46.044 * s,x +   14.640 * s,y +  -50.894 * s,x +   20.426 * s,y +  -53.319 * s,x +   27.783 * s,y +  -53.319 * s, threshold);
			_bez(x +   27.783 * s,y +  -53.319 * s,x +   31.428 * s,y +  -53.319 * s,x +   34.496 * s,y +  -52.660 * s,x +   36.987 * s,y +  -51.342 * s, threshold);
			_bez(x +   36.987 * s,y +  -51.342 * s,x +   39.477 * s,y +  -50.024 * s,x +   41.454 * s,y +  -48.014 * s,x +   42.919 * s,y +  -45.312 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   42.919 * s);
			_setf(o + ( 1 << 2), y +  -51.904 * s);
			_setf(o + ( 2 << 2), x +   67.577 * s);
			_setf(o + ( 3 << 2), y +  -51.904 * s);
			_setf(o + ( 4 << 2), x +   67.577 * s);
			_setf(o + ( 5 << 2), y +  -45.995 * s);
			_setf(o + ( 6 << 2), x +   60.204 * s);
			_setf(o + ( 7 << 2), y +  -45.995 * s);
			_setf(o + ( 8 << 2), x +   42.919 * s);
			_setf(o + ( 9 << 2), y +  -28.515 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 1);
			_bez(x +   42.919 * s,y +  -28.515 * s,x +   42.919 * s,y +  -34.570 * s,x +   42.138 * s,y +  -38.948 * s,x +   40.575 * s,y +  -41.650 * s, threshold);
			_bez(x +   40.575 * s,y +  -41.650 * s,x +   39.013 * s,y +  -44.352 * s,x +   36.523 * s,y +  -45.702 * s,x +   33.105 * s,y +  -45.702 * s, threshold);
			_bez(x +   33.105 * s,y +  -45.702 * s,x +   29.524 * s,y +  -45.702 * s,x +   27.009 * s,y +  -44.278 * s,x +   25.561 * s,y +  -41.430 * s, threshold);
			_bez(x +   25.561 * s,y +  -41.430 * s,x +   24.112 * s,y +  -38.582 * s,x +   23.388 * s,y +  -33.430 * s,x +   23.388 * s,y +  -25.976 * s, threshold);
			_bez(x +   23.388 * s,y +  -25.976 * s,x +   23.388 * s,y +  -18.522 * s,x +   24.121 * s,y +  -13.362 * s,x +   25.585 * s,y +  -10.498 * s, threshold);
			_bez(x +   25.585 * s,y +  -10.498 * s,x +   27.050 * s,y +   -7.633 * s,x +   29.557 * s,y +   -6.201 * s,x +   33.105 * s,y +   -6.201 * s, threshold);
			_bez(x +   33.105 * s,y +   -6.201 * s,x +   36.523 * s,y +   -6.201 * s,x +   39.013 * s,y +   -7.552 * s,x +   40.575 * s,y +  -10.254 * s, threshold);
			_bez(x +   40.575 * s,y +  -10.254 * s,x +   42.138 * s,y +  -12.956 * s,x +   42.919 * s,y +  -17.334 * s,x +   42.919 * s,y +  -23.388 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   42.919 * s);
			_setf(o + ( 1 << 2), y +  -28.515 * s);
			_setf(o + ( 2 << 2), x +   69.921 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 114:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   53.710 * s);
			_setf(o + ( 1 << 2), y +  -52.489 * s);
			_setf(o + ( 2 << 2), x +   53.710 * s);
			_setf(o + ( 3 << 2), y +  -37.011 * s);
			_setf(o + ( 4 << 2), x +   48.192 * s);
			_setf(o + ( 5 << 2), y +  -37.011 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   48.192 * s,y +  -37.011 * s,x +   47.997 * s,y +  -39.778 * s,x +   47.248 * s,y +  -41.837 * s,x +   45.946 * s,y +  -43.188 * s, threshold);
			_bez(x +   45.946 * s,y +  -43.188 * s,x +   44.644 * s,y +  -44.539 * s,x +   42.756 * s,y +  -45.214 * s,x +   40.282 * s,y +  -45.214 * s, threshold);
			_bez(x +   40.282 * s,y +  -45.214 * s,x +   36.506 * s,y +  -45.214 * s,x +   33.528 * s,y +  -43.554 * s,x +   31.347 * s,y +  -40.234 * s, threshold);
			_bez(x +   31.347 * s,y +  -40.234 * s,x +   29.166 * s,y +  -36.913 * s,x +   28.075 * s,y +  -32.307 * s,x +   28.075 * s,y +  -26.416 * s, threshold);
			o = _posf(22);
			_setf(o + ( 0 << 2), x +   28.075 * s);
			_setf(o + ( 1 << 2), y +   -5.908 * s);
			_setf(o + ( 2 << 2), x +   37.499 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   37.499 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    3.418 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    3.418 * s);
			_setf(o + ( 9 << 2), y +   -5.908 * s);
			_setf(o + (10 << 2), x +   10.790 * s);
			_setf(o + (11 << 2), y +   -5.908 * s);
			_setf(o + (12 << 2), x +   10.790 * s);
			_setf(o + (13 << 2), y +  -45.995 * s);
			_setf(o + (14 << 2), x +    2.880 * s);
			_setf(o + (15 << 2), y +  -45.995 * s);
			_setf(o + (16 << 2), x +    2.880 * s);
			_setf(o + (17 << 2), y +  -51.904 * s);
			_setf(o + (18 << 2), x +   28.075 * s);
			_setf(o + (19 << 2), y +  -51.904 * s);
			_setf(o + (20 << 2), x +   28.075 * s);
			_setf(o + (21 << 2), y +  -42.675 * s);
			o = _posb(11);
			_setb(o +  0, 2);
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
			_bez(x +   28.075 * s,y +  -42.675 * s,x +   29.768 * s,y +  -46.288 * s,x +   32.006 * s,y +  -48.966 * s,x +   34.789 * s,y +  -50.707 * s, threshold);
			_bez(x +   34.789 * s,y +  -50.707 * s,x +   37.572 * s,y +  -52.449 * s,x +   40.982 * s,y +  -53.319 * s,x +   45.018 * s,y +  -53.319 * s, threshold);
			_bez(x +   45.018 * s,y +  -53.319 * s,x +   46.028 * s,y +  -53.319 * s,x +   47.256 * s,y +  -53.246 * s,x +   48.705 * s,y +  -53.100 * s, threshold);
			_bez(x +   48.705 * s,y +  -53.100 * s,x +   50.153 * s,y +  -52.953 * s,x +   51.822 * s,y +  -52.750 * s,x +   53.710 * s,y +  -52.489 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   52.684 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 115:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    4.688 * s);
			_setf(o + ( 1 << 2), y +   -1.514 * s);
			_setf(o + ( 2 << 2), x +    4.688 * s);
			_setf(o + ( 3 << 2), y +  -16.015 * s);
			_setf(o + ( 4 << 2), x +   10.205 * s);
			_setf(o + ( 5 << 2), y +  -16.015 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   10.205 * s,y +  -16.015 * s,x +   10.661 * s,y +  -12.142 * s,x +   12.110 * s,y +   -9.188 * s,x +   14.551 * s,y +   -7.153 * s, threshold);
			_bez(x +   14.551 * s,y +   -7.153 * s,x +   16.992 * s,y +   -5.119 * s,x +   20.313 * s,y +   -4.101 * s,x +   24.512 * s,y +   -4.101 * s, threshold);
			_bez(x +   24.512 * s,y +   -4.101 * s,x +   28.027 * s,y +   -4.101 * s,x +   30.721 * s,y +   -4.712 * s,x +   32.593 * s,y +   -5.933 * s, threshold);
			_bez(x +   32.593 * s,y +   -5.933 * s,x +   34.464 * s,y +   -7.153 * s,x +   35.400 * s,y +   -8.903 * s,x +   35.400 * s,y +  -11.181 * s, threshold);
			_bez(x +   35.400 * s,y +  -11.181 * s,x +   35.400 * s,y +  -13.265 * s,x +   34.806 * s,y +  -14.876 * s,x +   33.618 * s,y +  -16.015 * s, threshold);
			_bez(x +   33.618 * s,y +  -16.015 * s,x +   32.430 * s,y +  -17.155 * s,x +   30.122 * s,y +  -18.129 * s,x +   26.709 * s,y +  -18.994 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   19.580 * s);
			_setf(o + ( 1 << 2), y +  -20.800 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   19.580 * s,y +  -20.800 * s,x +   14.215 * s,y +  -22.160 * s,x +   10.319 * s,y +  -24.047 * s,x +    7.910 * s,y +  -26.538 * s, threshold);
			_bez(x +    7.910 * s,y +  -26.538 * s,x +    5.502 * s,y +  -29.028 * s,x +    4.297 * s,y +  -32.389 * s,x +    4.297 * s,y +  -36.621 * s, threshold);
			_bez(x +    4.297 * s,y +  -36.621 * s,x +    4.297 * s,y +  -42.252 * s,x +    6.250 * s,y +  -46.443 * s,x +   10.156 * s,y +  -49.194 * s, threshold);
			_bez(x +   10.156 * s,y +  -49.194 * s,x +   14.063 * s,y +  -51.944 * s,x +   20.085 * s,y +  -53.319 * s,x +   28.223 * s,y +  -53.319 * s, threshold);
			_bez(x +   28.223 * s,y +  -53.319 * s,x +   31.282 * s,y +  -53.319 * s,x +   34.546 * s,y +  -53.067 * s,x +   38.012 * s,y +  -52.563 * s, threshold);
			_bez(x +   38.012 * s,y +  -52.563 * s,x +   41.479 * s,y +  -52.058 * s,x +   45.312 * s,y +  -51.269 * s,x +   49.511 * s,y +  -50.195 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   49.511 * s);
			_setf(o + ( 1 << 2), y +  -37.109 * s);
			_setf(o + ( 2 << 2), x +   43.994 * s);
			_setf(o + ( 3 << 2), y +  -37.109 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   43.994 * s,y +  -37.109 * s,x +   43.701 * s,y +  -40.657 * s,x +   42.439 * s,y +  -43.326 * s,x +   40.210 * s,y +  -45.116 * s, threshold);
			_bez(x +   40.210 * s,y +  -45.116 * s,x +   37.980 * s,y +  -46.907 * s,x +   34.782 * s,y +  -47.802 * s,x +   30.615 * s,y +  -47.802 * s, threshold);
			_bez(x +   30.615 * s,y +  -47.802 * s,x +   27.099 * s,y +  -47.802 * s,x +   24.438 * s,y +  -47.240 * s,x +   22.632 * s,y +  -46.117 * s, threshold);
			_bez(x +   22.632 * s,y +  -46.117 * s,x +   20.825 * s,y +  -44.994 * s,x +   19.922 * s,y +  -43.359 * s,x +   19.922 * s,y +  -41.210 * s, threshold);
			_bez(x +   19.922 * s,y +  -41.210 * s,x +   19.922 * s,y +  -39.453 * s,x +   20.443 * s,y +  -38.069 * s,x +   21.484 * s,y +  -37.060 * s, threshold);
			_bez(x +   21.484 * s,y +  -37.060 * s,x +   22.526 * s,y +  -36.051 * s,x +   24.399 * s,y +  -35.210 * s,x +   27.100 * s,y +  -34.521 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   34.180 * s);
			_setf(o + ( 1 << 2), y +  -32.714 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   34.180 * s,y +  -32.714 * s,x +   40.980 * s,y +  -30.979 * s,x +   45.686 * s,y +  -28.857 * s,x +   48.291 * s,y +  -26.318 * s, threshold);
			_bez(x +   48.291 * s,y +  -26.318 * s,x +   50.895 * s,y +  -23.779 * s,x +   52.197 * s,y +  -20.247 * s,x +   52.197 * s,y +  -15.722 * s, threshold);
			_bez(x +   52.197 * s,y +  -15.722 * s,x +   52.197 * s,y +   -9.863 * s,x +   50.105 * s,y +   -5.542 * s,x +   45.923 * s,y +   -2.759 * s, threshold);
			_bez(x +   45.923 * s,y +   -2.759 * s,x +   41.740 * s,y +    0.024 * s,x +   35.238 * s,y +    1.416 * s,x +   26.416 * s,y +    1.416 * s, threshold);
			_bez(x +   26.416 * s,y +    1.416 * s,x +   23.193 * s,y +    1.416 * s,x +   19.775 * s,y +    1.172 * s,x +   16.162 * s,y +    0.684 * s, threshold);
			_bez(x +   16.162 * s,y +    0.684 * s,x +   12.549 * s,y +    0.195 * s,x +    8.724 * s,y +   -0.537 * s,x +    4.688 * s,y +   -1.514 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   56.298 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 116:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +    9.912 * s);
			_setf(o + ( 1 << 2), y +  -45.995 * s);
			_setf(o + ( 2 << 2), x +    2.393 * s);
			_setf(o + ( 3 << 2), y +  -45.995 * s);
			_setf(o + ( 4 << 2), x +    2.393 * s);
			_setf(o + ( 5 << 2), y +  -51.904 * s);
			_setf(o + ( 6 << 2), x +    9.912 * s);
			_setf(o + ( 7 << 2), y +  -51.904 * s);
			_setf(o + ( 8 << 2), x +    9.912 * s);
			_setf(o + ( 9 << 2), y +  -68.017 * s);
			_setf(o + (10 << 2), x +   27.197 * s);
			_setf(o + (11 << 2), y +  -68.017 * s);
			_setf(o + (12 << 2), x +   27.197 * s);
			_setf(o + (13 << 2), y +  -51.904 * s);
			_setf(o + (14 << 2), x +   41.601 * s);
			_setf(o + (15 << 2), y +  -51.904 * s);
			_setf(o + (16 << 2), x +   41.601 * s);
			_setf(o + (17 << 2), y +  -45.995 * s);
			_setf(o + (18 << 2), x +   27.197 * s);
			_setf(o + (19 << 2), y +  -45.995 * s);
			_setf(o + (20 << 2), x +   27.197 * s);
			_setf(o + (21 << 2), y +  -14.209 * s);
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
			_bez(x +   27.197 * s,y +  -14.209 * s,x +   27.197 * s,y +   -9.684 * s,x +   27.555 * s,y +   -6.868 * s,x +   28.271 * s,y +   -5.762 * s, threshold);
			_bez(x +   28.271 * s,y +   -5.762 * s,x +   28.987 * s,y +   -4.655 * s,x +   30.290 * s,y +   -4.101 * s,x +   32.178 * s,y +   -4.101 * s, threshold);
			_bez(x +   32.178 * s,y +   -4.101 * s,x +   34.261 * s,y +   -4.101 * s,x +   35.807 * s,y +   -4.801 * s,x +   36.816 * s,y +   -6.201 * s, threshold);
			_bez(x +   36.816 * s,y +   -6.201 * s,x +   37.825 * s,y +   -7.601 * s,x +   38.362 * s,y +   -9.765 * s,x +   38.427 * s,y +  -12.695 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   45.703 * s);
			_setf(o + ( 1 << 2), y +  -12.695 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   45.703 * s,y +  -12.695 * s,x +   45.410 * s,y +   -7.487 * s,x +   43.986 * s,y +   -3.833 * s,x +   41.430 * s,y +   -1.733 * s, threshold);
			_bez(x +   41.430 * s,y +   -1.733 * s,x +   38.875 * s,y +    0.366 * s,x +   34.472 * s,y +    1.416 * s,x +   28.223 * s,y +    1.416 * s, threshold);
			_bez(x +   28.223 * s,y +    1.416 * s,x +   21.094 * s,y +    1.416 * s,x +   16.260 * s,y +    0.301 * s,x +   13.721 * s,y +   -1.929 * s, threshold);
			_bez(x +   13.721 * s,y +   -1.929 * s,x +   11.182 * s,y +   -4.158 * s,x +    9.912 * s,y +   -8.252 * s,x +    9.912 * s,y +  -14.209 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    9.912 * s);
			_setf(o + ( 1 << 2), y +  -45.995 * s);
			_setf(o + ( 2 << 2), x +   46.191 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 117:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   61.913 * s);
			_setf(o + ( 1 << 2), y +  -51.904 * s);
			_setf(o + ( 2 << 2), x +   61.913 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   69.286 * s);
			_setf(o + ( 5 << 2), y +   -5.908 * s);
			_setf(o + ( 6 << 2), x +   69.286 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   44.579 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   44.579 * s);
			_setf(o + (11 << 2), y +   -7.324 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_bez(x +   44.579 * s,y +   -7.324 * s,x +   42.529 * s,y +   -4.232 * s,x +   40.169 * s,y +   -2.002 * s,x +   37.499 * s,y +   -0.635 * s, threshold);
			_bez(x +   37.499 * s,y +   -0.635 * s,x +   34.830 * s,y +    0.732 * s,x +   31.461 * s,y +    1.416 * s,x +   27.392 * s,y +    1.416 * s, threshold);
			_bez(x +   27.392 * s,y +    1.416 * s,x +   21.565 * s,y +    1.416 * s,x +   17.163 * s,y +   -0.301 * s,x +   14.184 * s,y +   -3.735 * s, threshold);
			_bez(x +   14.184 * s,y +   -3.735 * s,x +   11.206 * s,y +   -7.169 * s,x +    9.717 * s,y +  -12.223 * s,x +    9.717 * s,y +  -18.896 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +    9.717 * s);
			_setf(o + ( 1 << 2), y +  -45.995 * s);
			_setf(o + ( 2 << 2), x +    2.295 * s);
			_setf(o + ( 3 << 2), y +  -45.995 * s);
			_setf(o + ( 4 << 2), x +    2.295 * s);
			_setf(o + ( 5 << 2), y +  -51.904 * s);
			_setf(o + ( 6 << 2), x +   27.002 * s);
			_setf(o + ( 7 << 2), y +  -51.904 * s);
			_setf(o + ( 8 << 2), x +   27.002 * s);
			_setf(o + ( 9 << 2), y +  -21.582 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   27.002 * s,y +  -21.582 * s,x +   27.002 * s,y +  -15.136 * s,x +   27.539 * s,y +  -11.043 * s,x +   28.613 * s,y +   -9.302 * s, threshold);
			_bez(x +   28.613 * s,y +   -9.302 * s,x +   29.687 * s,y +   -7.560 * s,x +   31.657 * s,y +   -6.689 * s,x +   34.521 * s,y +   -6.689 * s, threshold);
			_bez(x +   34.521 * s,y +   -6.689 * s,x +   38.004 * s,y +   -6.689 * s,x +   40.551 * s,y +   -7.975 * s,x +   42.162 * s,y +  -10.547 * s, threshold);
			_bez(x +   42.162 * s,y +  -10.547 * s,x +   43.774 * s,y +  -13.118 * s,x +   44.579 * s,y +  -17.204 * s,x +   44.579 * s,y +  -22.802 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   44.579 * s);
			_setf(o + ( 1 << 2), y +  -45.995 * s);
			_setf(o + ( 2 << 2), x +   38.281 * s);
			_setf(o + ( 3 << 2), y +  -45.995 * s);
			_setf(o + ( 4 << 2), x +   38.281 * s);
			_setf(o + ( 5 << 2), y +  -51.904 * s);
			_setf(o + ( 6 << 2), x +   61.913 * s);
			_setf(o + ( 7 << 2), y +  -51.904 * s);
			_setf(o + ( 8 << 2), x +   72.704 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 1);
			
			case 118:
			
			o = _posf(34);
			_setf(o + ( 0 << 2), x +   22.314 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    3.906 * s);
			_setf(o + ( 3 << 2), y +  -45.995 * s);
			_setf(o + ( 4 << 2), x +   -1.807 * s);
			_setf(o + ( 5 << 2), y +  -45.995 * s);
			_setf(o + ( 6 << 2), x +   -1.807 * s);
			_setf(o + ( 7 << 2), y +  -51.904 * s);
			_setf(o + ( 8 << 2), x +   27.978 * s);
			_setf(o + ( 9 << 2), y +  -51.904 * s);
			_setf(o + (10 << 2), x +   27.978 * s);
			_setf(o + (11 << 2), y +  -45.995 * s);
			_setf(o + (12 << 2), x +   21.679 * s);
			_setf(o + (13 << 2), y +  -45.995 * s);
			_setf(o + (14 << 2), x +   34.814 * s);
			_setf(o + (15 << 2), y +  -13.183 * s);
			_setf(o + (16 << 2), x +   47.900 * s);
			_setf(o + (17 << 2), y +  -45.995 * s);
			_setf(o + (18 << 2), x +   41.113 * s);
			_setf(o + (19 << 2), y +  -45.995 * s);
			_setf(o + (20 << 2), x +   41.113 * s);
			_setf(o + (21 << 2), y +  -51.904 * s);
			_setf(o + (22 << 2), x +   60.595 * s);
			_setf(o + (23 << 2), y +  -51.904 * s);
			_setf(o + (24 << 2), x +   60.595 * s);
			_setf(o + (25 << 2), y +  -45.995 * s);
			_setf(o + (26 << 2), x +   54.589 * s);
			_setf(o + (27 << 2), y +  -45.995 * s);
			_setf(o + (28 << 2), x +   36.181 * s);
			_setf(o + (29 << 2), y +       0. * s);
			_setf(o + (30 << 2), x +   22.314 * s);
			_setf(o + (31 << 2), y +       0. * s);
			_setf(o + (32 << 2), x +   58.105 * s);
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
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 2);
			_setb(o + 16, 1);
			
			case 119:
			
			o = _posf(46);
			_setf(o + ( 0 << 2), x +   53.905 * s);
			_setf(o + ( 1 << 2), y +  -51.904 * s);
			_setf(o + ( 2 << 2), x +   65.721 * s);
			_setf(o + ( 3 << 2), y +  -17.285 * s);
			_setf(o + ( 4 << 2), x +   75.487 * s);
			_setf(o + ( 5 << 2), y +  -45.995 * s);
			_setf(o + ( 6 << 2), x +   68.700 * s);
			_setf(o + ( 7 << 2), y +  -45.995 * s);
			_setf(o + ( 8 << 2), x +   68.700 * s);
			_setf(o + ( 9 << 2), y +  -51.904 * s);
			_setf(o + (10 << 2), x +   88.084 * s);
			_setf(o + (11 << 2), y +  -51.904 * s);
			_setf(o + (12 << 2), x +   88.084 * s);
			_setf(o + (13 << 2), y +  -45.995 * s);
			_setf(o + (14 << 2), x +   81.981 * s);
			_setf(o + (15 << 2), y +  -45.995 * s);
			_setf(o + (16 << 2), x +   66.307 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   54.393 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   43.407 * s);
			_setf(o + (21 << 2), y +  -32.519 * s);
			_setf(o + (22 << 2), x +   32.323 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   20.507 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +    4.785 * s);
			_setf(o + (27 << 2), y +  -45.995 * s);
			_setf(o + (28 << 2), x +   -0.879 * s);
			_setf(o + (29 << 2), y +  -45.995 * s);
			_setf(o + (30 << 2), x +   -0.879 * s);
			_setf(o + (31 << 2), y +  -51.904 * s);
			_setf(o + (32 << 2), x +   28.515 * s);
			_setf(o + (33 << 2), y +  -51.904 * s);
			_setf(o + (34 << 2), x +   28.515 * s);
			_setf(o + (35 << 2), y +  -45.995 * s);
			_setf(o + (36 << 2), x +   22.411 * s);
			_setf(o + (37 << 2), y +  -45.995 * s);
			_setf(o + (38 << 2), x +   31.981 * s);
			_setf(o + (39 << 2), y +  -17.920 * s);
			_setf(o + (40 << 2), x +   43.602 * s);
			_setf(o + (41 << 2), y +  -51.904 * s);
			_setf(o + (42 << 2), x +   53.905 * s);
			_setf(o + (43 << 2), y +  -51.904 * s);
			_setf(o + (44 << 2), x +   86.082 * s);
			_setf(o + (45 << 2), y +       0. * s);
			o = _posb(23);
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
			_setb(o + 22, 1);
			
			case 120:
			
			o = _posf(60);
			_setf(o + ( 0 << 2), x +   35.107 * s);
			_setf(o + ( 1 << 2), y +  -33.105 * s);
			_setf(o + ( 2 << 2), x +   44.286 * s);
			_setf(o + ( 3 << 2), y +  -45.995 * s);
			_setf(o + ( 4 << 2), x +   37.890 * s);
			_setf(o + ( 5 << 2), y +  -45.995 * s);
			_setf(o + ( 6 << 2), x +   37.890 * s);
			_setf(o + ( 7 << 2), y +  -51.904 * s);
			_setf(o + ( 8 << 2), x +   58.105 * s);
			_setf(o + ( 9 << 2), y +  -51.904 * s);
			_setf(o + (10 << 2), x +   58.105 * s);
			_setf(o + (11 << 2), y +  -45.995 * s);
			_setf(o + (12 << 2), x +   51.220 * s);
			_setf(o + (13 << 2), y +  -45.995 * s);
			_setf(o + (14 << 2), x +   37.988 * s);
			_setf(o + (15 << 2), y +  -27.490 * s);
			_setf(o + (16 << 2), x +   53.417 * s);
			_setf(o + (17 << 2), y +   -5.908 * s);
			_setf(o + (18 << 2), x +   60.302 * s);
			_setf(o + (19 << 2), y +   -5.908 * s);
			_setf(o + (20 << 2), x +   60.302 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   27.295 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   27.295 * s);
			_setf(o + (25 << 2), y +   -5.908 * s);
			_setf(o + (26 << 2), x +   33.984 * s);
			_setf(o + (27 << 2), y +   -5.908 * s);
			_setf(o + (28 << 2), x +   24.218 * s);
			_setf(o + (29 << 2), y +  -19.580 * s);
			_setf(o + (30 << 2), x +   14.404 * s);
			_setf(o + (31 << 2), y +   -5.908 * s);
			_setf(o + (32 << 2), x +   21.386 * s);
			_setf(o + (33 << 2), y +   -5.908 * s);
			_setf(o + (34 << 2), x +   21.386 * s);
			_setf(o + (35 << 2), y +       0. * s);
			_setf(o + (36 << 2), x +       0. * s);
			_setf(o + (37 << 2), y +       0. * s);
			_setf(o + (38 << 2), x +       0. * s);
			_setf(o + (39 << 2), y +   -5.908 * s);
			_setf(o + (40 << 2), x +    7.422 * s);
			_setf(o + (41 << 2), y +   -5.908 * s);
			_setf(o + (42 << 2), x +   21.191 * s);
			_setf(o + (43 << 2), y +  -25.293 * s);
			_setf(o + (44 << 2), x +    6.299 * s);
			_setf(o + (45 << 2), y +  -45.995 * s);
			_setf(o + (46 << 2), x +    0.488 * s);
			_setf(o + (47 << 2), y +  -45.995 * s);
			_setf(o + (48 << 2), x +    0.488 * s);
			_setf(o + (49 << 2), y +  -51.904 * s);
			_setf(o + (50 << 2), x +   32.177 * s);
			_setf(o + (51 << 2), y +  -51.904 * s);
			_setf(o + (52 << 2), x +   32.177 * s);
			_setf(o + (53 << 2), y +  -45.995 * s);
			_setf(o + (54 << 2), x +   25.878 * s);
			_setf(o + (55 << 2), y +  -45.995 * s);
			_setf(o + (56 << 2), x +   35.107 * s);
			_setf(o + (57 << 2), y +  -33.105 * s);
			_setf(o + (58 << 2), x +   59.618 * s);
			_setf(o + (59 << 2), y +       0. * s);
			o = _posb(30);
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
			
			case 121:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   31.201 * s);
			_setf(o + ( 1 << 2), y +   11.719 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   31.201 * s,y +   11.719 * s,x +   29.677 * s,y +   15.543 * s,x +   27.750 * s,y +   18.229 * s,x +   25.537 * s,y +   19.824 * s, threshold);
			_bez(x +   25.537 * s,y +   19.824 * s,x +   23.323 * s,y +   21.419 * s,x +   20.345 * s,y +   22.216 * s,x +   16.601 * s,y +   22.216 * s, threshold);
			_bez(x +   16.601 * s,y +   22.216 * s,x +   15.006 * s,y +   22.216 * s,x +   13.232 * s,y +   22.037 * s,x +   11.279 * s,y +   21.679 * s, threshold);
			_bez(x +   11.279 * s,y +   21.679 * s,x +    9.326 * s,y +   21.321 * s,x +    7.194 * s,y +   20.800 * s,x +    4.883 * s,y +   20.117 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    4.883 * s);
			_setf(o + ( 1 << 2), y +    9.277 * s);
			_setf(o + ( 2 << 2), x +   10.400 * s);
			_setf(o + ( 3 << 2), y +    9.326 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   10.400 * s,y +    9.326 * s,x +   10.498 * s,y +   11.833 * s,x +   11.092 * s,y +   13.688 * s,x +   12.182 * s,y +   14.892 * s, threshold);
			_bez(x +   12.182 * s,y +   14.892 * s,x +   13.273 * s,y +   16.097 * s,x +   14.909 * s,y +   16.699 * s,x +   17.090 * s,y +   16.699 * s, threshold);
			_bez(x +   17.090 * s,y +   16.699 * s,x +   19.205 * s,y +   16.699 * s,x +   20.914 * s,y +   16.121 * s,x +   22.216 * s,y +   14.966 * s, threshold);
			_bez(x +   22.216 * s,y +   14.966 * s,x +   23.518 * s,y +   13.810 * s,x +   24.743 * s,y +   11.588 * s,x +   26.123 * s,y +    8.398 * s, threshold);
			o = _posf(32);
			_setf(o + ( 0 << 2), x +   26.904 * s);
			_setf(o + ( 1 << 2), y +    6.592 * s);
			_setf(o + ( 2 << 2), x +    4.297 * s);
			_setf(o + ( 3 << 2), y +  -45.995 * s);
			_setf(o + ( 4 << 2), x +   -1.318 * s);
			_setf(o + ( 5 << 2), y +  -45.995 * s);
			_setf(o + ( 6 << 2), x +   -1.318 * s);
			_setf(o + ( 7 << 2), y +  -51.904 * s);
			_setf(o + ( 8 << 2), x +   28.613 * s);
			_setf(o + ( 9 << 2), y +  -51.904 * s);
			_setf(o + (10 << 2), x +   28.613 * s);
			_setf(o + (11 << 2), y +  -45.995 * s);
			_setf(o + (12 << 2), x +   22.412 * s);
			_setf(o + (13 << 2), y +  -45.995 * s);
			_setf(o + (14 << 2), x +   35.595 * s);
			_setf(o + (15 << 2), y +  -15.283 * s);
			_setf(o + (16 << 2), x +   47.900 * s);
			_setf(o + (17 << 2), y +  -45.995 * s);
			_setf(o + (18 << 2), x +   41.015 * s);
			_setf(o + (19 << 2), y +  -45.995 * s);
			_setf(o + (20 << 2), x +   41.015 * s);
			_setf(o + (21 << 2), y +  -51.904 * s);
			_setf(o + (22 << 2), x +   60.497 * s);
			_setf(o + (23 << 2), y +  -51.904 * s);
			_setf(o + (24 << 2), x +   60.497 * s);
			_setf(o + (25 << 2), y +  -45.995 * s);
			_setf(o + (26 << 2), x +   54.199 * s);
			_setf(o + (27 << 2), y +  -45.995 * s);
			_setf(o + (28 << 2), x +   31.201 * s);
			_setf(o + (29 << 2), y +   11.719 * s);
			_setf(o + (30 << 2), x +   58.105 * s);
			_setf(o + (31 << 2), y +       0. * s);
			o = _posb(16);
			_setb(o +  0, 2);
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
			
			case 122:
			
			o = _posf(32);
			_setf(o + ( 0 << 2), x +    3.515 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    3.515 * s);
			_setf(o + ( 3 << 2), y +   -5.908 * s);
			_setf(o + ( 4 << 2), x +   33.300 * s);
			_setf(o + ( 5 << 2), y +  -46.191 * s);
			_setf(o + ( 6 << 2), x +   10.888 * s);
			_setf(o + ( 7 << 2), y +  -46.191 * s);
			_setf(o + ( 8 << 2), x +   10.888 * s);
			_setf(o + ( 9 << 2), y +  -37.304 * s);
			_setf(o + (10 << 2), x +    5.078 * s);
			_setf(o + (11 << 2), y +  -37.304 * s);
			_setf(o + (12 << 2), x +    5.078 * s);
			_setf(o + (13 << 2), y +  -51.904 * s);
			_setf(o + (14 << 2), x +   53.417 * s);
			_setf(o + (15 << 2), y +  -51.904 * s);
			_setf(o + (16 << 2), x +   53.417 * s);
			_setf(o + (17 << 2), y +  -46.093 * s);
			_setf(o + (18 << 2), x +   23.583 * s);
			_setf(o + (19 << 2), y +   -5.810 * s);
			_setf(o + (20 << 2), x +   47.606 * s);
			_setf(o + (21 << 2), y +   -5.810 * s);
			_setf(o + (22 << 2), x +   47.606 * s);
			_setf(o + (23 << 2), y +  -15.185 * s);
			_setf(o + (24 << 2), x +   53.417 * s);
			_setf(o + (25 << 2), y +  -15.185 * s);
			_setf(o + (26 << 2), x +   53.417 * s);
			_setf(o + (27 << 2), y +       0. * s);
			_setf(o + (28 << 2), x +    3.515 * s);
			_setf(o + (29 << 2), y +       0. * s);
			_setf(o + (30 << 2), x +   56.786 * s);
			_setf(o + (31 << 2), y +       0. * s);
			o = _posb(16);
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
			
			case 123:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   55.321 * s);
			_setf(o + ( 1 << 2), y +   10.400 * s);
			_setf(o + ( 2 << 2), x +   55.321 * s);
			_setf(o + ( 3 << 2), y +   16.308 * s);
			_setf(o + ( 4 << 2), x +   48.095 * s);
			_setf(o + ( 5 << 2), y +   16.308 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   48.095 * s,y +   16.308 * s,x +   40.413 * s,y +   16.308 * s,x +   35.237 * s,y +   15.910 * s,x +   32.568 * s,y +   15.112 * s, threshold);
			_bez(x +   32.568 * s,y +   15.112 * s,x +   29.899 * s,y +   14.315 * s,x +   27.750 * s,y +   12.907 * s,x +   26.123 * s,y +   10.889 * s, threshold);
			_bez(x +   26.123 * s,y +   10.889 * s,x +   25.178 * s,y +    9.717 * s,x +   24.503 * s,y +    8.236 * s,x +   24.096 * s,y +    6.445 * s, threshold);
			_bez(x +   24.096 * s,y +    6.445 * s,x +   23.689 * s,y +    4.655 * s,x +   23.486 * s,y +    1.937 * s,x +   23.486 * s,y +   -1.709 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   23.486 * s);
			_setf(o + ( 1 << 2), y +  -13.916 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   23.486 * s,y +  -13.916 * s,x +   23.486 * s,y +  -18.831 * s,x +   22.615 * s,y +  -22.225 * s,x +   20.874 * s,y +  -24.096 * s, threshold);
			_bez(x +   20.874 * s,y +  -24.096 * s,x +   19.132 * s,y +  -25.968 * s,x +   15.967 * s,y +  -26.904 * s,x +   11.377 * s,y +  -26.904 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    8.398 * s);
			_setf(o + ( 1 << 2), y +  -26.904 * s);
			_setf(o + ( 2 << 2), x +    8.398 * s);
			_setf(o + ( 3 << 2), y +  -32.812 * s);
			_setf(o + ( 4 << 2), x +   11.377 * s);
			_setf(o + ( 5 << 2), y +  -32.812 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   11.377 * s,y +  -32.812 * s,x +   15.967 * s,y +  -32.812 * s,x +   19.132 * s,y +  -33.748 * s,x +   20.874 * s,y +  -35.620 * s, threshold);
			_bez(x +   20.874 * s,y +  -35.620 * s,x +   22.615 * s,y +  -37.491 * s,x +   23.486 * s,y +  -40.885 * s,x +   23.486 * s,y +  -45.800 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   23.486 * s);
			_setf(o + ( 1 << 2), y +  -58.007 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   23.486 * s,y +  -58.007 * s,x +   23.486 * s,y +  -61.653 * s,x +   23.689 * s,y +  -64.363 * s,x +   24.096 * s,y +  -66.137 * s, threshold);
			_bez(x +   24.096 * s,y +  -66.137 * s,x +   24.503 * s,y +  -67.911 * s,x +   25.162 * s,y +  -69.413 * s,x +   26.123 * s,y +  -70.604 * s, threshold);
			_bez(x +   26.123 * s,y +  -70.604 * s,x +   27.734 * s,y +  -72.603 * s,x +   29.899 * s,y +  -73.982 * s,x +   32.568 * s,y +  -74.779 * s, threshold);
			_bez(x +   32.568 * s,y +  -74.779 * s,x +   35.237 * s,y +  -75.577 * s,x +   40.413 * s,y +  -75.975 * s,x +   48.095 * s,y +  -75.975 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   55.321 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   55.321 * s);
			_setf(o + ( 3 << 2), y +  -70.116 * s);
			_setf(o + ( 4 << 2), x +   50.292 * s);
			_setf(o + ( 5 << 2), y +  -70.116 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   50.292 * s,y +  -70.116 * s,x +   46.647 * s,y +  -70.116 * s,x +   44.156 * s,y +  -69.351 * s,x +   42.822 * s,y +  -67.821 * s, threshold);
			_bez(x +   42.822 * s,y +  -67.821 * s,x +   41.487 * s,y +  -66.291 * s,x +   40.820 * s,y +  -63.313 * s,x +   40.820 * s,y +  -58.886 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   40.820 * s);
			_setf(o + ( 1 << 2), y +  -45.702 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   40.820 * s,y +  -45.702 * s,x +   40.820 * s,y +  -40.527 * s,x +   40.014 * s,y +  -36.840 * s,x +   38.403 * s,y +  -34.643 * s, threshold);
			_bez(x +   38.403 * s,y +  -34.643 * s,x +   36.791 * s,y +  -32.446 * s,x +   33.886 * s,y +  -30.859 * s,x +   29.687 * s,y +  -29.882 * s, threshold);
			_bez(x +   29.687 * s,y +  -29.882 * s,x +   33.951 * s,y +  -28.776 * s,x +   36.873 * s,y +  -27.148 * s,x +   38.452 * s,y +  -25.000 * s, threshold);
			_bez(x +   38.452 * s,y +  -25.000 * s,x +   40.030 * s,y +  -22.851 * s,x +   40.820 * s,y +  -19.189 * s,x +   40.820 * s,y +  -14.013 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   40.820 * s);
			_setf(o + ( 1 << 2), y +   -0.781 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   40.820 * s,y +   -0.781 * s,x +   40.820 * s,y +    3.613 * s,x +   41.487 * s,y +    6.575 * s,x +   42.822 * s,y +    8.105 * s, threshold);
			_bez(x +   42.822 * s,y +    8.105 * s,x +   44.156 * s,y +    9.635 * s,x +   46.647 * s,y +   10.400 * s,x +   50.292 * s,y +   10.400 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   55.321 * s);
			_setf(o + ( 1 << 2), y +   10.400 * s);
			_setf(o + ( 2 << 2), x +   64.306 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 124:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   23.388 * s);
			_setf(o + ( 1 << 2), y +  -76.415 * s);
			_setf(o + ( 2 << 2), x +   23.388 * s);
			_setf(o + ( 3 << 2), y +   23.584 * s);
			_setf(o + ( 4 << 2), x +   12.890 * s);
			_setf(o + ( 5 << 2), y +   23.584 * s);
			_setf(o + ( 6 << 2), x +   12.890 * s);
			_setf(o + ( 7 << 2), y +  -76.415 * s);
			_setf(o + ( 8 << 2), x +   23.388 * s);
			_setf(o + ( 9 << 2), y +  -76.415 * s);
			_setf(o + (10 << 2), x +   36.376 * s);
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
			_setf(o + ( 0 << 2), x +    9.082 * s);
			_setf(o + ( 1 << 2), y +   10.400 * s);
			_setf(o + ( 2 << 2), x +   14.014 * s);
			_setf(o + ( 3 << 2), y +   10.400 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   14.014 * s,y +   10.400 * s,x +   17.627 * s,y +   10.400 * s,x +   20.109 * s,y +    9.635 * s,x +   21.460 * s,y +    8.105 * s, threshold);
			_bez(x +   21.460 * s,y +    8.105 * s,x +   22.811 * s,y +    6.575 * s,x +   23.486 * s,y +    3.613 * s,x +   23.486 * s,y +   -0.781 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   23.486 * s);
			_setf(o + ( 1 << 2), y +  -14.013 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   23.486 * s,y +  -14.013 * s,x +   23.486 * s,y +  -19.124 * s,x +   24.284 * s,y +  -22.770 * s,x +   25.879 * s,y +  -24.951 * s, threshold);
			_bez(x +   25.879 * s,y +  -24.951 * s,x +   27.474 * s,y +  -27.132 * s,x +   30.420 * s,y +  -28.776 * s,x +   34.716 * s,y +  -29.882 * s, threshold);
			_bez(x +   34.716 * s,y +  -29.882 * s,x +   30.485 * s,y +  -30.859 * s,x +   27.555 * s,y +  -32.454 * s,x +   25.927 * s,y +  -34.667 * s, threshold);
			_bez(x +   25.927 * s,y +  -34.667 * s,x +   24.300 * s,y +  -36.881 * s,x +   23.486 * s,y +  -40.560 * s,x +   23.486 * s,y +  -45.702 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   23.486 * s);
			_setf(o + ( 1 << 2), y +  -58.886 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   23.486 * s,y +  -58.886 * s,x +   23.486 * s,y +  -63.313 * s,x +   22.811 * s,y +  -66.291 * s,x +   21.460 * s,y +  -67.821 * s, threshold);
			_bez(x +   21.460 * s,y +  -67.821 * s,x +   20.109 * s,y +  -69.351 * s,x +   17.627 * s,y +  -70.116 * s,x +   14.014 * s,y +  -70.116 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    9.082 * s);
			_setf(o + ( 1 << 2), y +  -70.116 * s);
			_setf(o + ( 2 << 2), x +    9.082 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   16.211 * s);
			_setf(o + ( 5 << 2), y +  -75.975 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   16.211 * s,y +  -75.975 * s,x +   23.893 * s,y +  -75.975 * s,x +   29.069 * s,y +  -75.577 * s,x +   31.738 * s,y +  -74.779 * s, threshold);
			_bez(x +   31.738 * s,y +  -74.779 * s,x +   34.407 * s,y +  -73.982 * s,x +   36.572 * s,y +  -72.603 * s,x +   38.183 * s,y +  -70.604 * s, threshold);
			_bez(x +   38.183 * s,y +  -70.604 * s,x +   39.143 * s,y +  -69.413 * s,x +   39.802 * s,y +  -67.911 * s,x +   40.209 * s,y +  -66.137 * s, threshold);
			_bez(x +   40.209 * s,y +  -66.137 * s,x +   40.616 * s,y +  -64.363 * s,x +   40.820 * s,y +  -61.653 * s,x +   40.820 * s,y +  -58.007 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   40.820 * s);
			_setf(o + ( 1 << 2), y +  -45.800 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   40.820 * s,y +  -45.800 * s,x +   40.820 * s,y +  -40.885 * s,x +   41.691 * s,y +  -37.491 * s,x +   43.432 * s,y +  -35.620 * s, threshold);
			_bez(x +   43.432 * s,y +  -35.620 * s,x +   45.174 * s,y +  -33.748 * s,x +   48.323 * s,y +  -32.812 * s,x +   52.880 * s,y +  -32.812 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   55.907 * s);
			_setf(o + ( 1 << 2), y +  -32.812 * s);
			_setf(o + ( 2 << 2), x +   55.907 * s);
			_setf(o + ( 3 << 2), y +  -26.904 * s);
			_setf(o + ( 4 << 2), x +   52.880 * s);
			_setf(o + ( 5 << 2), y +  -26.904 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   52.880 * s,y +  -26.904 * s,x +   48.323 * s,y +  -26.904 * s,x +   45.174 * s,y +  -25.968 * s,x +   43.432 * s,y +  -24.096 * s, threshold);
			_bez(x +   43.432 * s,y +  -24.096 * s,x +   41.691 * s,y +  -22.225 * s,x +   40.820 * s,y +  -18.831 * s,x +   40.820 * s,y +  -13.916 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   40.820 * s);
			_setf(o + ( 1 << 2), y +   -1.709 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   40.820 * s,y +   -1.709 * s,x +   40.820 * s,y +    1.937 * s,x +   40.616 * s,y +    4.655 * s,x +   40.209 * s,y +    6.445 * s, threshold);
			_bez(x +   40.209 * s,y +    6.445 * s,x +   39.802 * s,y +    8.236 * s,x +   39.127 * s,y +    9.717 * s,x +   38.183 * s,y +   10.889 * s, threshold);
			_bez(x +   38.183 * s,y +   10.889 * s,x +   36.556 * s,y +   12.907 * s,x +   34.407 * s,y +   14.315 * s,x +   31.738 * s,y +   15.112 * s, threshold);
			_bez(x +   31.738 * s,y +   15.112 * s,x +   29.069 * s,y +   15.910 * s,x +   23.893 * s,y +   16.308 * s,x +   16.211 * s,y +   16.308 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    9.082 * s);
			_setf(o + ( 1 << 2), y +   16.308 * s);
			_setf(o + ( 2 << 2), x +    9.082 * s);
			_setf(o + ( 3 << 2), y +   10.400 * s);
			_setf(o + ( 4 << 2), x +   64.306 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 126:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   73.192 * s);
			_setf(o + ( 1 << 2), y +  -40.576 * s);
			_setf(o + ( 2 << 2), x +   73.192 * s);
			_setf(o + ( 3 << 2), y +  -30.517 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   73.192 * s,y +  -30.517 * s,x +   70.165 * s,y +  -27.718 * s,x +   67.129 * s,y +  -25.651 * s,x +   64.086 * s,y +  -24.316 * s, threshold);
			_bez(x +   64.086 * s,y +  -24.316 * s,x +   61.042 * s,y +  -22.981 * s,x +   57.876 * s,y +  -22.314 * s,x +   54.589 * s,y +  -22.314 * s, threshold);
			_bez(x +   54.589 * s,y +  -22.314 * s,x +   51.496 * s,y +  -22.314 * s,x +   47.481 * s,y +  -23.271 * s,x +   42.528 * s,y +  -25.146 * s, threshold);
			_bez(x +   42.528 * s,y +  -25.146 * s,x +   41.980 * s,y +  -25.354 * s,x +   41.566 * s,y +  -25.482 * s,x +   41.308 * s,y +  -25.586 * s, threshold);
			_bez(x +   41.308 * s,y +  -25.586 * s,x +   41.078 * s,y +  -25.678 * s,x +   40.754 * s,y +  -25.814 * s,x +   40.331 * s,y +  -25.976 * s, threshold);
			_bez(x +   40.331 * s,y +  -25.976 * s,x +   34.732 * s,y +  -28.125 * s,x +   30.354 * s,y +  -29.199 * s,x +   27.197 * s,y +  -29.199 * s, threshold);
			_bez(x +   27.197 * s,y +  -29.199 * s,x +   24.690 * s,y +  -29.199 * s,x +   22.078 * s,y +  -28.613 * s,x +   19.360 * s,y +  -27.441 * s, threshold);
			_bez(x +   19.360 * s,y +  -27.441 * s,x +   16.642 * s,y +  -26.269 * s,x +   13.720 * s,y +  -24.495 * s,x +   10.595 * s,y +  -22.119 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   10.595 * s);
			_setf(o + ( 1 << 2), y +  -32.177 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   10.595 * s,y +  -32.177 * s,x +   13.720 * s,y +  -35.009 * s,x +   16.788 * s,y +  -37.084 * s,x +   19.799 * s,y +  -38.403 * s, threshold);
			_bez(x +   19.799 * s,y +  -38.403 * s,x +   22.810 * s,y +  -39.721 * s,x +   25.943 * s,y +  -40.380 * s,x +   29.198 * s,y +  -40.380 * s, threshold);
			_bez(x +   29.198 * s,y +  -40.380 * s,x +   32.291 * s,y +  -40.380 * s,x +   36.297 * s,y +  -39.458 * s,x +   41.210 * s,y +  -37.597 * s, threshold);
			_bez(x +   41.210 * s,y +  -37.597 * s,x +   41.798 * s,y +  -37.374 * s,x +   42.221 * s,y +  -37.212 * s,x +   42.480 * s,y +  -37.109 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   43.212 * s);
			_setf(o + ( 1 << 2), y +  -36.816 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   43.212 * s,y +  -36.816 * s,x +   48.830 * s,y +  -34.569 * s,x +   53.303 * s,y +  -33.496 * s,x +   56.591 * s,y +  -33.496 * s, threshold);
			_bez(x +   56.591 * s,y +  -33.496 * s,x +   59.097 * s,y +  -33.496 * s,x +   61.709 * s,y +  -34.081 * s,x +   64.427 * s,y +  -35.253 * s, threshold);
			_bez(x +   64.427 * s,y +  -35.253 * s,x +   67.145 * s,y +  -36.425 * s,x +   70.067 * s,y +  -38.199 * s,x +   73.192 * s,y +  -40.576 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   83.788 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
		}
	}
	#end
}