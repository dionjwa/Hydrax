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

class BitstreamVeraSansBold extends de.polygonal.gl.text.ProportionalVectorFont
{
	public function new()
	{
		#if font_inline
		super(2048, 1901, -483, BOUNDS_TABLE, SPACING_TABLE, KERNING_TABLE);
		#else
		super(
		"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"+
		"Hf48IFaM8SISpIj5QpoKNJVoMFC7/wcmxGA0");
		#end
	}
	
	#if font_inline
	static var SPACING_TABLE:Array<Int> =
	[
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,  713,  934, 1067, 1716, 1425, 2052, 1786,  627,
		 936,  936, 1071, 1716,  778,  850,  778,  748, 1425, 1425, 1425, 1425, 1425, 1425, 1425, 1425, 1425, 1425,  819,  819,
		1716, 1716, 1716, 1188, 2048, 1585, 1561, 1503, 1700, 1399, 1399, 1681, 1714,  762,  762, 1587, 1305, 2038, 1714, 1741,
		1501, 1741, 1577, 1475, 1397, 1663, 1585, 2259, 1579, 1483, 1485,  936,  748,  936, 1716, 1024, 1024, 1382, 1466, 1214,
		1466, 1389,  891, 1466, 1458,  702,  702, 1362,  702, 2134, 1458, 1407, 1466, 1466, 1010, 1219,  979, 1458, 1335, 1892,
		1321, 1335, 1192, 1458,  748, 1458, 1716
	];

	static var KERNING_TABLE:Array<Int> =
	[
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,  127,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,  138,  161,  168,  173,    0,  178,  203,    0,    0,    0,  208,  225,    0,    0,  240,
		 255,  270,  273,  284,  287,  320,  323,  348,  369,  378,  403,    0,    0,    0,    0,    0,    0,  406,    0,    0,
		   0,    0,  409,    0,    0,    0,    0,  416,    0,    0,    0,    0,    0,    0,  421,    0,    0,    0,  426,  431,
		   0,  436,    0,    0,    0,    0,    0,   10,   84, -301,   86, -149,   87,  -92,   88, -167,   89, -301,   22,   44,
		  38,   46,   38,   58,   38,   59,   38,   84, -159,   85,  -63,   86, -139,   87,  -92,   89, -196,  118,  -73,  121,
		 -73,    6,   86,  -83,   87, -112,   89, -112,    4,   45,   47,   83,   38,    4,   45,   38,   89, -149,   24,   44,
		-329,   45,  -63,   46, -301,   58, -112,   59, -112,   65, -235,   97, -120,  101,  -83,  111,  -83,  114, -131,  117,
		-102,  121, -112,    4,   84,  -36,   89,  -45,   16,   45, -178,   67,  -92,   79,  -92,   85,  -36,  101,  -36,  111,
		 -36,  117,  -36,  121, -131,   14,   79,  -73,   84, -339,   85,  -73,   86, -282,   87, -159,   89, -319,  121, -139,
		  14,   44,  -45,   45,   38,   46,  -45,   65,  -55,   86,  -55,   88,  -73,   89,  -73,   14,   44, -376,   45,  -36,
		  46, -376,   65, -188,   97,  -55,  115,  -36,  121,   38,    2,   45,   38,   10,   44,   38,   46,   38,   84,  -92,
		  89, -112,  121,  -92,    2,   83,  -92,   32,   44, -292,   45, -301,   46, -311,   58, -112,   59, -112,   65, -159,
		  84,   47,   97, -264,   99, -272,  101, -272,  111, -272,  114, -225,  115, -272,  117, -225,  119, -225,  121, -243,
		   2,   65,  -63,   24,   44, -264,   45, -149,   46, -264,   58,  -92,   59,  -92,   65, -139,   79,  -36,   97, -112,
		 101, -112,  105,  -36,  111, -112,  117,  -73,   20,   44, -167,   45,  -92,   46, -167,   58,  -63,   59,  -63,   65,
		 -92,   97,  -73,  101,  -73,  111,  -73,  114,  -36,    8,   45, -167,   67,  -73,   79,  -73,  101,  -55,   24,   44,
		-339,   45, -301,   46, -339,   58, -178,   59, -178,   65, -196,   67,  -73,   79,  -73,   97, -188,  101, -188,  111,
		-188,  117, -149,    2,   45,  -36,    2,  121,  -63,    6,   44, -112,   45,  -36,   46, -112,    4,  101,  -55,  111,
		 -55,    4,   44, -301,   46, -292,    4,   44, -167,   46, -167,    4,   44, -131,   46, -131,    4,   44, -159,   46,
		-188
	];

	static var BOUNDS_TABLE:Array<Float> =
	[
		  33,     14.013,    -72.899,     31.591,          0,
		  34,      9.521,    -72.899,     42.577,    -45.800,
		  35,      6.787,    -71.776,     77.000,          0,
		  36,      7.813,    -75.975,     62.792,     14.697,
		  37,      3.223,    -74.218,     97.020,      1.416,
		  38,      6.006,    -74.218,     83.007,      1.416,
		  39,      9.521,    -72.899,     21.093,    -45.800,
		  40,      8.593,    -75.878,     37.694,     13.183,
		  41,      8.008,    -75.878,     37.109,     13.183,
		  42,      2.002,    -74.218,     50.293,    -27.783,
		  43,     10.595,    -62.694,     73.192,          0,
		  44,      5.322,    -18.896,     27.783,     14.209,
		  45,      5.420,    -35.888,     36.083,    -21.679,
		  46,     10.205,    -18.896,     27.783,          0,
		  47,          0,    -72.899,     36.523,      9.277,
		  48,      4.785,    -74.218,     64.794,      1.416,
		  49,     11.279,    -72.899,     62.694,          0,
		  50,      7.910,    -74.218,     60.888,          0,
		  51,      6.689,    -74.218,     61.620,      1.416,
		  52,      4.492,    -72.899,     64.989,          0,
		  53,      7.715,    -72.899,     62.597,      1.416,
		  54,      6.201,    -74.120,     64.208,      1.416,
		  55,      6.689,    -72.899,     61.620,          0,
		  56,      6.103,    -74.218,     63.378,      1.416,
		  57,      5.176,    -74.120,     63.183,      1.416,
		  58,     11.182,    -54.687,     28.808,          0,
		  59,      6.298,    -54.687,     28.808,     14.209,
		  60,     10.596,    -59.716,     73.192,     -2.978,
		  61,     10.596,    -48.193,     73.192,    -14.404,
		  62,     10.595,    -59.716,     73.192,     -2.978,
		  63,      6.884,    -74.218,     51.512,          0,
		  64,      6.592,    -70.311,     92.919,     17.383,
		  65,      0.489,    -72.899,     76.904,          0,
		  66,      9.179,    -72.899,     69.188,          0,
		  67,      4.981,    -74.218,     66.992,      1.416,
		  68,      9.179,    -72.899,     77.782,          0,
		  69,      9.180,    -72.899,     60.986,          0,
		  70,      9.179,    -72.899,     59.911,          0,
		  71,      4.980,    -74.218,     74.705,      1.416,
		  72,      9.180,    -72.899,     74.511,          0,
		  73,      9.180,    -72.899,     27.979,          0,
		  74,     -5.615,    -72.899,     27.978,     20.019,
		  75,      9.180,    -72.899,     80.517,          0,
		  76,      9.180,    -72.899,     60.986,          0,
		  77,      9.179,    -72.899,     90.282,          0,
		  78,      9.180,    -72.899,     74.511,          0,
		  79,      4.981,    -74.218,     79.980,      1.416,
		  80,      9.179,    -72.899,     69.188,          0,
		  81,      4.980,    -74.218,     79.979,     14.599,
		  82,      9.180,    -72.899,     74.999,          0,
		  83,      7.178,    -74.218,     64.696,      1.416,
		  84,      0.488,    -72.899,     67.675,          0,
		  85,      9.180,    -72.899,     72.021,      1.416,
		  86,      0.488,    -72.899,     76.903,          0,
		  87,      2.978,    -72.899,    107.176,          0,
		  88,      1.904,    -72.899,     75.096,          0,
		  89,     -0.977,    -72.899,     73.387,          0,
		  90,      4.492,    -72.899,     68.017,          0,
		  91,      8.593,    -75.975,     38.915,     13.183,
		  92,          0,    -72.899,     36.523,      9.277,
		  93,      6.787,    -75.975,     37.109,     13.183,
		  94,     10.108,    -72.899,     73.681,    -45.702,
		  95,          0,     14.306,     49.999,     23.584,
		  96,      4.590,    -79.979,     32.178,    -61.620,
		  97,      4.296,    -56.005,     59.618,      1.416,
		  98,      8.398,    -75.975,     67.089,      1.416,
		  99,      4.297,    -56.005,     52.587,      1.416,
		 100,      4.492,    -75.975,     63.183,      1.416,
		 101,      4.297,    -56.005,     62.988,      1.416,
		 102,      1.904,    -75.975,     44.384,          0,
		 103,      4.492,    -55.907,     63.182,     21.582,
		 104,      8.398,    -75.975,     63.378,          0,
		 105,      8.398,    -75.975,     25.878,          0,
		 106,     -3.321,    -75.975,     25.878,     21.582,
		 107,      8.398,    -75.975,     68.407,          0,
		 108,      8.398,    -75.975,     25.878,          0,
		 109,      8.300,    -56.005,     96.287,          0,
		 110,      8.399,    -56.005,     63.378,          0,
		 111,      4.296,    -56.005,     64.403,      1.416,
		 112,      8.398,    -56.005,     67.089,     20.800,
		 113,      4.492,    -55.907,     63.182,     20.800,
		 114,      8.398,    -56.005,     49.023,          0,
		 115,      5.176,    -56.005,     54.784,      1.416,
		 116,      1.319,    -70.214,     45.507,          0,
		 117,      7.813,    -54.687,     62.792,      1.416,
		 118,      1.513,    -54.687,     63.719,          0,
		 119,      3.516,    -54.687,     88.915,          0,
		 120,      1.514,    -54.687,     62.988,          0,
		 121,      1.221,    -54.687,     63.378,     21.582,
		 122,      4.492,    -54.687,     53.417,          0,
		 123,     12.500,    -75.975,     58.691,     16.308,
		 124,     12.695,    -76.415,     23.778,     23.584,
		 125,     12.500,    -75.975,     58.691,     16.308,
		 126,     10.595,    -41.503,     73.192,    -21.191
	];

	override function _draw(charCode:Int, x:Float, y:Float, s:Float, threshold:Float):Void
	{
		var o = 0;
		switch (charCode)
		{			
			case 33:
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +   14.013 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   31.591 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   31.591 * s);
			_setf(o + ( 5 << 2), y +  -44.921 * s);
			_setf(o + ( 6 << 2), x +   29.101 * s);
			_setf(o + ( 7 << 2), y +  -24.511 * s);
			_setf(o + ( 8 << 2), x +   16.504 * s);
			_setf(o + ( 9 << 2), y +  -24.511 * s);
			_setf(o + (10 << 2), x +   14.013 * s);
			_setf(o + (11 << 2), y +  -44.921 * s);
			_setf(o + (12 << 2), x +   14.013 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   14.013 * s);
			_setf(o + (15 << 2), y +  -17.383 * s);
			_setf(o + (16 << 2), x +   31.591 * s);
			_setf(o + (17 << 2), y +  -17.383 * s);
			_setf(o + (18 << 2), x +   31.591 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   14.013 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   14.013 * s);
			_setf(o + (23 << 2), y +  -17.383 * s);
			_setf(o + (24 << 2), x +   45.605 * s);
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
			
			case 34:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +   42.577 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   42.577 * s);
			_setf(o + ( 3 << 2), y +  -45.800 * s);
			_setf(o + ( 4 << 2), x +   31.005 * s);
			_setf(o + ( 5 << 2), y +  -45.800 * s);
			_setf(o + ( 6 << 2), x +   31.005 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   42.577 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   21.093 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   21.093 * s);
			_setf(o + (13 << 2), y +  -45.800 * s);
			_setf(o + (14 << 2), x +    9.521 * s);
			_setf(o + (15 << 2), y +  -45.800 * s);
			_setf(o + (16 << 2), x +    9.521 * s);
			_setf(o + (17 << 2), y +  -72.899 * s);
			_setf(o + (18 << 2), x +   21.093 * s);
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
			_setf(o + ( 0 << 2), x +   44.481 * s);
			_setf(o + ( 1 << 2), y +  -71.776 * s);
			_setf(o + ( 2 << 2), x +   39.794 * s);
			_setf(o + ( 3 << 2), y +  -52.978 * s);
			_setf(o + ( 4 << 2), x +   52.684 * s);
			_setf(o + ( 5 << 2), y +  -52.978 * s);
			_setf(o + ( 6 << 2), x +   57.421 * s);
			_setf(o + ( 7 << 2), y +  -71.776 * s);
			_setf(o + ( 8 << 2), x +   68.211 * s);
			_setf(o + ( 9 << 2), y +  -71.776 * s);
			_setf(o + (10 << 2), x +   63.475 * s);
			_setf(o + (11 << 2), y +  -52.978 * s);
			_setf(o + (12 << 2), x +   77.000 * s);
			_setf(o + (13 << 2), y +  -52.978 * s);
			_setf(o + (14 << 2), x +   77.000 * s);
			_setf(o + (15 << 2), y +  -42.577 * s);
			_setf(o + (16 << 2), x +   60.887 * s);
			_setf(o + (17 << 2), y +  -42.577 * s);
			_setf(o + (18 << 2), x +   57.518 * s);
			_setf(o + (19 << 2), y +  -29.199 * s);
			_setf(o + (20 << 2), x +   71.385 * s);
			_setf(o + (21 << 2), y +  -29.199 * s);
			_setf(o + (22 << 2), x +   71.385 * s);
			_setf(o + (23 << 2), y +  -18.701 * s);
			_setf(o + (24 << 2), x +   54.979 * s);
			_setf(o + (25 << 2), y +  -18.701 * s);
			_setf(o + (26 << 2), x +   50.292 * s);
			_setf(o + (27 << 2), y +       0. * s);
			_setf(o + (28 << 2), x +   39.501 * s);
			_setf(o + (29 << 2), y +       0. * s);
			_setf(o + (30 << 2), x +   44.188 * s);
			_setf(o + (31 << 2), y +  -18.701 * s);
			_setf(o + (32 << 2), x +   31.298 * s);
			_setf(o + (33 << 2), y +  -18.701 * s);
			_setf(o + (34 << 2), x +   26.610 * s);
			_setf(o + (35 << 2), y +       0. * s);
			_setf(o + (36 << 2), x +   15.722 * s);
			_setf(o + (37 << 2), y +       0. * s);
			_setf(o + (38 << 2), x +   20.409 * s);
			_setf(o + (39 << 2), y +  -18.701 * s);
			_setf(o + (40 << 2), x +    6.787 * s);
			_setf(o + (41 << 2), y +  -18.701 * s);
			_setf(o + (42 << 2), x +    6.787 * s);
			_setf(o + (43 << 2), y +  -29.199 * s);
			_setf(o + (44 << 2), x +   22.802 * s);
			_setf(o + (45 << 2), y +  -29.199 * s);
			_setf(o + (46 << 2), x +   26.220 * s);
			_setf(o + (47 << 2), y +  -42.577 * s);
			_setf(o + (48 << 2), x +   12.402 * s);
			_setf(o + (49 << 2), y +  -42.577 * s);
			_setf(o + (50 << 2), x +   12.402 * s);
			_setf(o + (51 << 2), y +  -52.978 * s);
			_setf(o + (52 << 2), x +   28.905 * s);
			_setf(o + (53 << 2), y +  -52.978 * s);
			_setf(o + (54 << 2), x +   33.593 * s);
			_setf(o + (55 << 2), y +  -71.776 * s);
			_setf(o + (56 << 2), x +   44.481 * s);
			_setf(o + (57 << 2), y +  -71.776 * s);
			_setf(o + (58 << 2), x +   49.999 * s);
			_setf(o + (59 << 2), y +  -42.577 * s);
			_setf(o + (60 << 2), x +   37.108 * s);
			_setf(o + (61 << 2), y +  -42.577 * s);
			_setf(o + (62 << 2), x +   33.690 * s);
			_setf(o + (63 << 2), y +  -29.199 * s);
			_setf(o + (64 << 2), x +   46.581 * s);
			_setf(o + (65 << 2), y +  -29.199 * s);
			_setf(o + (66 << 2), x +   49.999 * s);
			_setf(o + (67 << 2), y +  -42.577 * s);
			_setf(o + (68 << 2), x +   83.787 * s);
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
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   38.818 * s);
			_setf(o + ( 1 << 2), y +   14.697 * s);
			_setf(o + ( 2 << 2), x +   30.908 * s);
			_setf(o + ( 3 << 2), y +   14.697 * s);
			_setf(o + ( 4 << 2), x +   30.859 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   30.859 * s,y +       0. * s,x +   26.790 * s,y +   -0.163 * s,x +   22.852 * s,y +   -0.618 * s,x +   19.043 * s,y +   -1.367 * s, threshold);
			_bez(x +   19.043 * s,y +   -1.367 * s,x +   15.234 * s,y +   -2.116 * s,x +   11.524 * s,y +   -3.157 * s,x +    7.910 * s,y +   -4.492 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    7.910 * s);
			_setf(o + ( 1 << 2), y +  -17.285 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    7.910 * s,y +  -17.285 * s,x +   11.654 * s,y +  -15.364 * s,x +   15.438 * s,y +  -13.891 * s,x +   19.263 * s,y +  -12.866 * s, threshold);
			_bez(x +   19.263 * s,y +  -12.866 * s,x +   23.088 * s,y +  -11.841 * s,x +   26.969 * s,y +  -11.263 * s,x +   30.908 * s,y +  -11.133 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   30.908 * s);
			_setf(o + ( 1 << 2), y +  -26.318 * s);
			_setf(o + ( 2 << 2), x +   29.297 * s);
			_setf(o + ( 3 << 2), y +  -26.611 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   29.297 * s,y +  -26.611 * s,x +   21.526 * s,y +  -28.024 * s,x +   15.991 * s,y +  -30.126 * s,x +   12.720 * s,y +  -33.056 * s, threshold);
			_bez(x +   12.720 * s,y +  -33.056 * s,x +    9.448 * s,y +  -35.986 * s,x +    7.813 * s,y +  -40.201 * s,x +    7.813 * s,y +  -45.702 * s, threshold);
			_bez(x +    7.813 * s,y +  -45.702 * s,x +    7.813 * s,y +  -51.529 * s,x +    9.807 * s,y +  -56.078 * s,x +   13.794 * s,y +  -59.350 * s, threshold);
			_bez(x +   13.794 * s,y +  -59.350 * s,x +   17.782 * s,y +  -62.621 * s,x +   23.470 * s,y +  -64.403 * s,x +   30.859 * s,y +  -64.696 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   30.908 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   38.818 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   38.818 * s);
			_setf(o + ( 5 << 2), y +  -64.892 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   38.818 * s,y +  -64.892 * s,x +   42.073 * s,y +  -64.631 * s,x +   45.328 * s,y +  -64.224 * s,x +   48.584 * s,y +  -63.671 * s, threshold);
			_bez(x +   48.584 * s,y +  -63.671 * s,x +   51.839 * s,y +  -63.118 * s,x +   55.110 * s,y +  -62.401 * s,x +   58.398 * s,y +  -61.522 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.398 * s);
			_setf(o + ( 1 << 2), y +  -49.120 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   58.398 * s,y +  -49.120 * s,x +   55.143 * s,y +  -50.488 * s,x +   51.888 * s,y +  -51.554 * s,x +   48.632 * s,y +  -52.319 * s, threshold);
			_bez(x +   48.632 * s,y +  -52.319 * s,x +   45.377 * s,y +  -53.083 * s,x +   42.106 * s,y +  -53.547 * s,x +   38.818 * s,y +  -53.710 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   38.818 * s);
			_setf(o + ( 1 << 2), y +  -39.697 * s);
			_setf(o + ( 2 << 2), x +   40.381 * s);
			_setf(o + ( 3 << 2), y +  -39.404 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   40.381 * s,y +  -39.404 * s,x +   48.607 * s,y +  -37.861 * s,x +   54.451 * s,y +  -35.929 * s,x +   57.788 * s,y +  -32.885 * s, threshold);
			_bez(x +   57.788 * s,y +  -32.885 * s,x +   61.124 * s,y +  -29.842 * s,x +   62.792 * s,y +  -25.342 * s,x +   62.792 * s,y +  -19.384 * s, threshold);
			_bez(x +   62.792 * s,y +  -19.384 * s,x +   62.792 * s,y +  -13.395 * s,x +   60.807 * s,y +   -8.797 * s,x +   56.835 * s,y +   -5.591 * s, threshold);
			_bez(x +   56.835 * s,y +   -5.591 * s,x +   52.864 * s,y +   -2.384 * s,x +   46.858 * s,y +   -0.553 * s,x +   38.818 * s,y +   -0.098 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   38.818 * s);
			_setf(o + ( 1 << 2), y +   14.697 * s);
			_setf(o + ( 2 << 2), x +   30.908 * s);
			_setf(o + ( 3 << 2), y +  -40.820 * s);
			_setf(o + ( 4 << 2), x +   30.908 * s);
			_setf(o + ( 5 << 2), y +  -53.564 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_setb(o +  2, 2);
			_bez(x +   30.908 * s,y +  -53.564 * s,x +   28.597 * s,y +  -53.433 * s,x +   26.750 * s,y +  -52.807 * s,x +   25.366 * s,y +  -51.684 * s, threshold);
			_bez(x +   25.366 * s,y +  -51.684 * s,x +   23.983 * s,y +  -50.561 * s,x +   23.291 * s,y +  -49.137 * s,x +   23.291 * s,y +  -47.411 * s, threshold);
			_bez(x +   23.291 * s,y +  -47.411 * s,x +   23.291 * s,y +  -45.491 * s,x +   23.926 * s,y +  -43.985 * s,x +   25.195 * s,y +  -42.895 * s, threshold);
			_bez(x +   25.195 * s,y +  -42.895 * s,x +   26.465 * s,y +  -41.804 * s,x +   28.369 * s,y +  -41.113 * s,x +   30.908 * s,y +  -40.820 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   38.818 * s);
			_setf(o + ( 1 << 2), y +  -24.902 * s);
			_setf(o + ( 2 << 2), x +   38.818 * s);
			_setf(o + ( 3 << 2), y +  -11.328 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   38.818 * s,y +  -11.328 * s,x +   41.650 * s,y +  -11.360 * s,x +   43.774 * s,y +  -11.914 * s,x +   45.190 * s,y +  -12.988 * s, threshold);
			_bez(x +   45.190 * s,y +  -12.988 * s,x +   46.606 * s,y +  -14.062 * s,x +   47.314 * s,y +  -15.674 * s,x +   47.314 * s,y +  -17.822 * s, threshold);
			_bez(x +   47.314 * s,y +  -17.822 * s,x +   47.314 * s,y +  -20.035 * s,x +   46.663 * s,y +  -21.687 * s,x +   45.361 * s,y +  -22.778 * s, threshold);
			_bez(x +   45.361 * s,y +  -22.778 * s,x +   44.059 * s,y +  -23.868 * s,x +   41.878 * s,y +  -24.576 * s,x +   38.818 * s,y +  -24.902 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   69.579 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 37:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   77.489 * s);
			_setf(o + ( 1 << 2), y +  -30.078 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   77.489 * s,y +  -30.078 * s,x +   75.178 * s,y +  -30.078 * s,x +   73.388 * s,y +  -29.077 * s,x +   72.118 * s,y +  -27.075 * s, threshold);
			_bez(x +   72.118 * s,y +  -27.075 * s,x +   70.849 * s,y +  -25.073 * s,x +   70.214 * s,y +  -22.217 * s,x +   70.214 * s,y +  -18.506 * s, threshold);
			_bez(x +   70.214 * s,y +  -18.506 * s,x +   70.214 * s,y +  -14.762 * s,x +   70.841 * s,y +  -11.889 * s,x +   72.094 * s,y +   -9.888 * s, threshold);
			_bez(x +   72.094 * s,y +   -9.888 * s,x +   73.347 * s,y +   -7.886 * s,x +   75.146 * s,y +   -6.885 * s,x +   77.489 * s,y +   -6.885 * s, threshold);
			_bez(x +   77.489 * s,y +   -6.885 * s,x +   79.833 * s,y +   -6.885 * s,x +   81.623 * s,y +   -7.886 * s,x +   82.860 * s,y +   -9.888 * s, threshold);
			_bez(x +   82.860 * s,y +   -9.888 * s,x +   84.097 * s,y +  -11.889 * s,x +   84.716 * s,y +  -14.762 * s,x +   84.716 * s,y +  -18.506 * s, threshold);
			_bez(x +   84.716 * s,y +  -18.506 * s,x +   84.716 * s,y +  -22.217 * s,x +   84.089 * s,y +  -25.073 * s,x +   82.836 * s,y +  -27.075 * s, threshold);
			_bez(x +   82.836 * s,y +  -27.075 * s,x +   81.583 * s,y +  -29.077 * s,x +   79.801 * s,y +  -30.078 * s,x +   77.489 * s,y +  -30.078 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   77.489 * s);
			_setf(o + ( 1 << 2), y +  -38.281 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   77.489 * s,y +  -38.281 * s,x +   83.544 * s,y +  -38.281 * s,x +   88.313 * s,y +  -36.523 * s,x +   91.796 * s,y +  -33.007 * s, threshold);
			_bez(x +   91.796 * s,y +  -33.007 * s,x +   95.279 * s,y +  -29.492 * s,x +   97.020 * s,y +  -24.658 * s,x +   97.020 * s,y +  -18.506 * s, threshold);
			_bez(x +   97.020 * s,y +  -18.506 * s,x +   97.020 * s,y +  -12.353 * s,x +   95.279 * s,y +   -7.495 * s,x +   91.796 * s,y +   -3.931 * s, threshold);
			_bez(x +   91.796 * s,y +   -3.931 * s,x +   88.313 * s,y +   -0.366 * s,x +   83.544 * s,y +    1.416 * s,x +   77.489 * s,y +    1.416 * s, threshold);
			_bez(x +   77.489 * s,y +    1.416 * s,x +   71.435 * s,y +    1.416 * s,x +   66.658 * s,y +   -0.366 * s,x +   63.159 * s,y +   -3.931 * s, threshold);
			_bez(x +   63.159 * s,y +   -3.931 * s,x +   59.659 * s,y +   -7.495 * s,x +   57.910 * s,y +  -12.353 * s,x +   57.910 * s,y +  -18.506 * s, threshold);
			_bez(x +   57.910 * s,y +  -18.506 * s,x +   57.910 * s,y +  -24.625 * s,x +   59.659 * s,y +  -29.451 * s,x +   63.159 * s,y +  -32.983 * s, threshold);
			_bez(x +   63.159 * s,y +  -32.983 * s,x +   66.658 * s,y +  -36.515 * s,x +   71.435 * s,y +  -38.281 * s,x +   77.489 * s,y +  -38.281 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   32.715 * s);
			_setf(o + ( 1 << 2), y +    1.416 * s);
			_setf(o + ( 2 << 2), x +   21.924 * s);
			_setf(o + ( 3 << 2), y +    1.416 * s);
			_setf(o + ( 4 << 2), x +   67.480 * s);
			_setf(o + ( 5 << 2), y +  -74.218 * s);
			_setf(o + ( 6 << 2), x +   78.319 * s);
			_setf(o + ( 7 << 2), y +  -74.218 * s);
			_setf(o + ( 8 << 2), x +   32.715 * s);
			_setf(o + ( 9 << 2), y +    1.416 * s);
			_setf(o + (10 << 2), x +   22.705 * s);
			_setf(o + (11 << 2), y +  -74.218 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_bez(x +   22.705 * s,y +  -74.218 * s,x +   28.760 * s,y +  -74.218 * s,x +   33.520 * s,y +  -72.452 * s,x +   36.987 * s,y +  -68.920 * s, threshold);
			_bez(x +   36.987 * s,y +  -68.920 * s,x +   40.454 * s,y +  -65.388 * s,x +   42.187 * s,y +  -60.546 * s,x +   42.187 * s,y +  -54.394 * s, threshold);
			_bez(x +   42.187 * s,y +  -54.394 * s,x +   42.187 * s,y +  -48.241 * s,x +   40.454 * s,y +  -43.391 * s,x +   36.987 * s,y +  -39.843 * s, threshold);
			_bez(x +   36.987 * s,y +  -39.843 * s,x +   33.520 * s,y +  -36.295 * s,x +   28.760 * s,y +  -34.521 * s,x +   22.705 * s,y +  -34.521 * s, threshold);
			_bez(x +   22.705 * s,y +  -34.521 * s,x +   16.650 * s,y +  -34.521 * s,x +   11.890 * s,y +  -36.295 * s,x +    8.423 * s,y +  -39.843 * s, threshold);
			_bez(x +    8.423 * s,y +  -39.843 * s,x +    4.956 * s,y +  -43.391 * s,x +    3.223 * s,y +  -48.241 * s,x +    3.223 * s,y +  -54.394 * s, threshold);
			_bez(x +    3.223 * s,y +  -54.394 * s,x +    3.223 * s,y +  -60.546 * s,x +    4.956 * s,y +  -65.388 * s,x +    8.423 * s,y +  -68.920 * s, threshold);
			_bez(x +    8.423 * s,y +  -68.920 * s,x +   11.890 * s,y +  -72.452 * s,x +   16.650 * s,y +  -74.218 * s,x +   22.705 * s,y +  -74.218 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   22.705 * s);
			_setf(o + ( 1 << 2), y +  -66.015 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   22.705 * s,y +  -66.015 * s,x +   20.361 * s,y +  -66.015 * s,x +   18.555 * s,y +  -65.006 * s,x +   17.285 * s,y +  -62.987 * s, threshold);
			_bez(x +   17.285 * s,y +  -62.987 * s,x +   16.016 * s,y +  -60.969 * s,x +   15.381 * s,y +  -58.105 * s,x +   15.381 * s,y +  -54.394 * s, threshold);
			_bez(x +   15.381 * s,y +  -54.394 * s,x +   15.381 * s,y +  -50.650 * s,x +   16.016 * s,y +  -47.761 * s,x +   17.285 * s,y +  -45.727 * s, threshold);
			_bez(x +   17.285 * s,y +  -45.727 * s,x +   18.555 * s,y +  -43.692 * s,x +   20.361 * s,y +  -42.675 * s,x +   22.705 * s,y +  -42.675 * s, threshold);
			_bez(x +   22.705 * s,y +  -42.675 * s,x +   25.049 * s,y +  -42.675 * s,x +   26.847 * s,y +  -43.692 * s,x +   28.101 * s,y +  -45.727 * s, threshold);
			_bez(x +   28.101 * s,y +  -45.727 * s,x +   29.354 * s,y +  -47.761 * s,x +   29.980 * s,y +  -50.650 * s,x +   29.980 * s,y +  -54.394 * s, threshold);
			_bez(x +   29.980 * s,y +  -54.394 * s,x +   29.980 * s,y +  -58.105 * s,x +   29.346 * s,y +  -60.969 * s,x +   28.076 * s,y +  -62.987 * s, threshold);
			_bez(x +   28.076 * s,y +  -62.987 * s,x +   26.807 * s,y +  -65.006 * s,x +   25.016 * s,y +  -66.015 * s,x +   22.705 * s,y +  -66.015 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +  100.194 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 38:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   39.013 * s);
			_setf(o + ( 1 << 2), y +  -48.388 * s);
			_setf(o + ( 2 << 2), x +   58.984 * s);
			_setf(o + ( 3 << 2), y +  -26.416 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   58.984 * s,y +  -26.416 * s,x +   60.709 * s,y +  -28.694 * s,x +   62.019 * s,y +  -31.250 * s,x +   62.914 * s,y +  -34.081 * s, threshold);
			_bez(x +   62.914 * s,y +  -34.081 * s,x +   63.809 * s,y +  -36.913 * s,x +   64.338 * s,y +  -40.120 * s,x +   64.501 * s,y +  -43.701 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   79.686 * s);
			_setf(o + ( 1 << 2), y +  -43.701 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   79.686 * s,y +  -43.701 * s,x +   79.198 * s,y +  -37.776 * s,x +   78.051 * s,y +  -32.503 * s,x +   76.244 * s,y +  -27.880 * s, threshold);
			_bez(x +   76.244 * s,y +  -27.880 * s,x +   74.437 * s,y +  -23.258 * s,x +   71.923 * s,y +  -19.205 * s,x +   68.700 * s,y +  -15.722 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   83.007 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   62.304 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   57.519 * s);
			_setf(o + ( 5 << 2), y +   -5.322 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   57.519 * s,y +   -5.322 * s,x +   54.101 * s,y +   -3.044 * s,x +   50.504 * s,y +   -1.351 * s,x +   46.728 * s,y +   -0.244 * s, threshold);
			_bez(x +   46.728 * s,y +   -0.244 * s,x +   42.952 * s,y +    0.863 * s,x +   38.948 * s,y +    1.416 * s,x +   34.716 * s,y +    1.416 * s, threshold);
			_bez(x +   34.716 * s,y +    1.416 * s,x +   26.156 * s,y +    1.416 * s,x +   19.230 * s,y +   -0.838 * s,x +   13.940 * s,y +   -5.347 * s, threshold);
			_bez(x +   13.940 * s,y +   -5.347 * s,x +    8.651 * s,y +   -9.855 * s,x +    6.006 * s,y +  -15.673 * s,x +    6.006 * s,y +  -22.802 * s, threshold);
			_bez(x +    6.006 * s,y +  -22.802 * s,x +    6.006 * s,y +  -27.555 * s,x +    7.170 * s,y +  -31.762 * s,x +    9.497 * s,y +  -35.424 * s, threshold);
			_bez(x +    9.497 * s,y +  -35.424 * s,x +   11.824 * s,y +  -39.086 * s,x +   15.625 * s,y +  -42.643 * s,x +   20.898 * s,y +  -46.093 * s, threshold);
			_bez(x +   20.898 * s,y +  -46.093 * s,x +   19.531 * s,y +  -47.818 * s,x +   18.522 * s,y +  -49.544 * s,x +   17.871 * s,y +  -51.269 * s, threshold);
			_bez(x +   17.871 * s,y +  -51.269 * s,x +   17.220 * s,y +  -52.994 * s,x +   16.894 * s,y +  -54.801 * s,x +   16.894 * s,y +  -56.689 * s, threshold);
			_bez(x +   16.894 * s,y +  -56.689 * s,x +   16.894 * s,y +  -61.995 * s,x +   18.961 * s,y +  -66.242 * s,x +   23.095 * s,y +  -69.433 * s, threshold);
			_bez(x +   23.095 * s,y +  -69.433 * s,x +   27.230 * s,y +  -72.623 * s,x +   32.731 * s,y +  -74.218 * s,x +   39.599 * s,y +  -74.218 * s, threshold);
			_bez(x +   39.599 * s,y +  -74.218 * s,x +   42.561 * s,y +  -74.218 * s,x +   45.646 * s,y +  -73.982 * s,x +   48.852 * s,y +  -73.510 * s, threshold);
			_bez(x +   48.852 * s,y +  -73.510 * s,x +   52.058 * s,y +  -73.038 * s,x +   55.403 * s,y +  -72.330 * s,x +   58.886 * s,y +  -71.386 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   58.886 * s);
			_setf(o + ( 1 << 2), y +  -57.812 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   58.886 * s,y +  -57.812 * s,x +   55.826 * s,y +  -59.374 * s,x +   52.929 * s,y +  -60.530 * s,x +   50.195 * s,y +  -61.278 * s, threshold);
			_bez(x +   50.195 * s,y +  -61.278 * s,x +   47.460 * s,y +  -62.027 * s,x +   44.791 * s,y +  -62.401 * s,x +   42.187 * s,y +  -62.401 * s, threshold);
			_bez(x +   42.187 * s,y +  -62.401 * s,x +   39.681 * s,y +  -62.401 * s,x +   37.736 * s,y +  -61.921 * s,x +   36.352 * s,y +  -60.961 * s, threshold);
			_bez(x +   36.352 * s,y +  -60.961 * s,x +   34.969 * s,y +  -60.001 * s,x +   34.277 * s,y +  -58.642 * s,x +   34.277 * s,y +  -56.884 * s, threshold);
			_bez(x +   34.277 * s,y +  -56.884 * s,x +   34.277 * s,y +  -55.777 * s,x +   34.676 * s,y +  -54.516 * s,x +   35.473 * s,y +  -53.100 * s, threshold);
			_bez(x +   35.473 * s,y +  -53.100 * s,x +   36.271 * s,y +  -51.684 * s,x +   37.448 * s,y +  -50.110 * s,x +   39.013 * s,y +  -48.388 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   29.297 * s);
			_setf(o + ( 1 << 2), y +  -36.279 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   29.297 * s,y +  -36.279 * s,x +   27.181 * s,y +  -34.749 * s,x +   25.586 * s,y +  -33.015 * s,x +   24.511 * s,y +  -31.079 * s, threshold);
			_bez(x +   24.511 * s,y +  -31.079 * s,x +   23.437 * s,y +  -29.142 * s,x +   22.900 * s,y +  -27.018 * s,x +   22.900 * s,y +  -24.707 * s, threshold);
			_bez(x +   22.900 * s,y +  -24.707 * s,x +   22.900 * s,y +  -20.963 * s,x +   24.284 * s,y +  -17.773 * s,x +   27.050 * s,y +  -15.136 * s, threshold);
			_bez(x +   27.050 * s,y +  -15.136 * s,x +   29.817 * s,y +  -12.500 * s,x +   33.138 * s,y +  -11.181 * s,x +   37.011 * s,y +  -11.181 * s, threshold);
			_bez(x +   37.011 * s,y +  -11.181 * s,x +   39.192 * s,y +  -11.181 * s,x +   41.227 * s,y +  -11.515 * s,x +   43.115 * s,y +  -12.182 * s, threshold);
			_bez(x +   43.115 * s,y +  -12.182 * s,x +   45.003 * s,y +  -12.850 * s,x +   46.760 * s,y +  -13.851 * s,x +   48.388 * s,y +  -15.185 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   29.297 * s);
			_setf(o + ( 1 << 2), y +  -36.279 * s);
			_setf(o + ( 2 << 2), x +   87.206 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 39:
			
			o = _posf(12);
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
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   37.694 * s);
			_setf(o + ( 1 << 2), y +   13.183 * s);
			_setf(o + ( 2 << 2), x +   23.193 * s);
			_setf(o + ( 3 << 2), y +   13.183 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   23.193 * s,y +   13.183 * s,x +   18.212 * s,y +    5.143 * s,x +   14.534 * s,y +   -2.498 * s,x +   12.158 * s,y +   -9.741 * s, threshold);
			_bez(x +   12.158 * s,y +   -9.741 * s,x +    9.781 * s,y +  -16.984 * s,x +    8.593 * s,y +  -24.170 * s,x +    8.593 * s,y +  -31.298 * s, threshold);
			_bez(x +    8.593 * s,y +  -31.298 * s,x +    8.593 * s,y +  -38.427 * s,x +    9.789 * s,y +  -45.645 * s,x +   12.182 * s,y +  -52.953 * s, threshold);
			_bez(x +   12.182 * s,y +  -52.953 * s,x +   14.575 * s,y +  -60.261 * s,x +   18.245 * s,y +  -67.903 * s,x +   23.193 * s,y +  -75.878 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   37.694 * s);
			_setf(o + ( 1 << 2), y +  -75.878 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   37.694 * s,y +  -75.878 * s,x +   33.528 * s,y +  -68.163 * s,x +   30.403 * s,y +  -60.619 * s,x +   28.319 * s,y +  -53.246 * s, threshold);
			_bez(x +   28.319 * s,y +  -53.246 * s,x +   26.236 * s,y +  -45.873 * s,x +   25.194 * s,y +  -38.590 * s,x +   25.194 * s,y +  -31.396 * s, threshold);
			_bez(x +   25.194 * s,y +  -31.396 * s,x +   25.194 * s,y +  -24.202 * s,x +   26.228 * s,y +  -16.911 * s,x +   28.295 * s,y +   -9.521 * s, threshold);
			_bez(x +   28.295 * s,y +   -9.521 * s,x +   30.362 * s,y +   -2.132 * s,x +   33.495 * s,y +    5.436 * s,x +   37.694 * s,y +   13.183 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   45.702 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 41:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    8.008 * s);
			_setf(o + ( 1 << 2), y +   13.183 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +    8.008 * s,y +   13.183 * s,x +   12.174 * s,y +    5.436 * s,x +   15.299 * s,y +   -2.132 * s,x +   17.382 * s,y +   -9.521 * s, threshold);
			_bez(x +   17.382 * s,y +   -9.521 * s,x +   19.466 * s,y +  -16.911 * s,x +   20.507 * s,y +  -24.202 * s,x +   20.507 * s,y +  -31.396 * s, threshold);
			_bez(x +   20.507 * s,y +  -31.396 * s,x +   20.507 * s,y +  -38.590 * s,x +   19.466 * s,y +  -45.873 * s,x +   17.382 * s,y +  -53.246 * s, threshold);
			_bez(x +   17.382 * s,y +  -53.246 * s,x +   15.299 * s,y +  -60.619 * s,x +   12.174 * s,y +  -68.163 * s,x +    8.008 * s,y +  -75.878 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   22.509 * s);
			_setf(o + ( 1 << 2), y +  -75.878 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   22.509 * s,y +  -75.878 * s,x +   27.457 * s,y +  -67.903 * s,x +   31.127 * s,y +  -60.261 * s,x +   33.520 * s,y +  -52.953 * s, threshold);
			_bez(x +   33.520 * s,y +  -52.953 * s,x +   35.912 * s,y +  -45.645 * s,x +   37.109 * s,y +  -38.427 * s,x +   37.109 * s,y +  -31.298 * s, threshold);
			_bez(x +   37.109 * s,y +  -31.298 * s,x +   37.109 * s,y +  -24.170 * s,x +   35.921 * s,y +  -16.984 * s,x +   33.544 * s,y +   -9.741 * s, threshold);
			_bez(x +   33.544 * s,y +   -9.741 * s,x +   31.168 * s,y +   -2.498 * s,x +   27.490 * s,y +    5.143 * s,x +   22.509 * s,y +   13.183 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    8.008 * s);
			_setf(o + ( 1 << 2), y +   13.183 * s);
			_setf(o + ( 2 << 2), x +   45.702 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 42:
			
			o = _posf(40);
			_setf(o + ( 0 << 2), x +   50.293 * s);
			_setf(o + ( 1 << 2), y +  -59.423 * s);
			_setf(o + ( 2 << 2), x +   34.179 * s);
			_setf(o + ( 3 << 2), y +  -50.976 * s);
			_setf(o + ( 4 << 2), x +   50.293 * s);
			_setf(o + ( 5 << 2), y +  -42.480 * s);
			_setf(o + ( 6 << 2), x +   46.582 * s);
			_setf(o + ( 7 << 2), y +  -35.595 * s);
			_setf(o + ( 8 << 2), x +   30.322 * s);
			_setf(o + ( 9 << 2), y +  -44.579 * s);
			_setf(o + (10 << 2), x +   30.322 * s);
			_setf(o + (11 << 2), y +  -27.783 * s);
			_setf(o + (12 << 2), x +   22.021 * s);
			_setf(o + (13 << 2), y +  -27.783 * s);
			_setf(o + (14 << 2), x +   22.021 * s);
			_setf(o + (15 << 2), y +  -44.579 * s);
			_setf(o + (16 << 2), x +    5.713 * s);
			_setf(o + (17 << 2), y +  -35.595 * s);
			_setf(o + (18 << 2), x +    2.002 * s);
			_setf(o + (19 << 2), y +  -42.480 * s);
			_setf(o + (20 << 2), x +   18.310 * s);
			_setf(o + (21 << 2), y +  -50.976 * s);
			_setf(o + (22 << 2), x +    2.002 * s);
			_setf(o + (23 << 2), y +  -59.423 * s);
			_setf(o + (24 << 2), x +    5.713 * s);
			_setf(o + (25 << 2), y +  -66.308 * s);
			_setf(o + (26 << 2), x +   22.021 * s);
			_setf(o + (27 << 2), y +  -57.421 * s);
			_setf(o + (28 << 2), x +   22.021 * s);
			_setf(o + (29 << 2), y +  -74.218 * s);
			_setf(o + (30 << 2), x +   30.322 * s);
			_setf(o + (31 << 2), y +  -74.218 * s);
			_setf(o + (32 << 2), x +   30.322 * s);
			_setf(o + (33 << 2), y +  -57.421 * s);
			_setf(o + (34 << 2), x +   46.582 * s);
			_setf(o + (35 << 2), y +  -66.308 * s);
			_setf(o + (36 << 2), x +   50.293 * s);
			_setf(o + (37 << 2), y +  -59.423 * s);
			_setf(o + (38 << 2), x +   52.295 * s);
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
			_setf(o + ( 0 << 2), x +   47.704 * s);
			_setf(o + ( 1 << 2), y +  -62.694 * s);
			_setf(o + ( 2 << 2), x +   47.704 * s);
			_setf(o + ( 3 << 2), y +  -37.109 * s);
			_setf(o + ( 4 << 2), x +   73.192 * s);
			_setf(o + ( 5 << 2), y +  -37.109 * s);
			_setf(o + ( 6 << 2), x +   73.192 * s);
			_setf(o + ( 7 << 2), y +  -25.586 * s);
			_setf(o + ( 8 << 2), x +   47.704 * s);
			_setf(o + ( 9 << 2), y +  -25.586 * s);
			_setf(o + (10 << 2), x +   47.704 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   36.083 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   36.083 * s);
			_setf(o + (15 << 2), y +  -25.586 * s);
			_setf(o + (16 << 2), x +   10.595 * s);
			_setf(o + (17 << 2), y +  -25.586 * s);
			_setf(o + (18 << 2), x +   10.595 * s);
			_setf(o + (19 << 2), y +  -37.109 * s);
			_setf(o + (20 << 2), x +   36.083 * s);
			_setf(o + (21 << 2), y +  -37.109 * s);
			_setf(o + (22 << 2), x +   36.083 * s);
			_setf(o + (23 << 2), y +  -62.694 * s);
			_setf(o + (24 << 2), x +   47.704 * s);
			_setf(o + (25 << 2), y +  -62.694 * s);
			_setf(o + (26 << 2), x +   83.787 * s);
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
			
			o = _posf(16);
			_setf(o + ( 0 << 2), x +   10.205 * s);
			_setf(o + ( 1 << 2), y +  -18.896 * s);
			_setf(o + ( 2 << 2), x +   27.783 * s);
			_setf(o + ( 3 << 2), y +  -18.896 * s);
			_setf(o + ( 4 << 2), x +   27.783 * s);
			_setf(o + ( 5 << 2), y +   -4.004 * s);
			_setf(o + ( 6 << 2), x +   15.723 * s);
			_setf(o + ( 7 << 2), y +   14.209 * s);
			_setf(o + ( 8 << 2), x +    5.322 * s);
			_setf(o + ( 9 << 2), y +   14.209 * s);
			_setf(o + (10 << 2), x +   10.205 * s);
			_setf(o + (11 << 2), y +   -4.004 * s);
			_setf(o + (12 << 2), x +   10.205 * s);
			_setf(o + (13 << 2), y +  -18.896 * s);
			_setf(o + (14 << 2), x +   37.988 * s);
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
			
			case 45:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +    5.420 * s);
			_setf(o + ( 1 << 2), y +  -35.888 * s);
			_setf(o + ( 2 << 2), x +   36.083 * s);
			_setf(o + ( 3 << 2), y +  -35.888 * s);
			_setf(o + ( 4 << 2), x +   36.083 * s);
			_setf(o + ( 5 << 2), y +  -21.679 * s);
			_setf(o + ( 6 << 2), x +    5.420 * s);
			_setf(o + ( 7 << 2), y +  -21.679 * s);
			_setf(o + ( 8 << 2), x +    5.420 * s);
			_setf(o + ( 9 << 2), y +  -35.888 * s);
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
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   10.205 * s);
			_setf(o + ( 1 << 2), y +  -18.896 * s);
			_setf(o + ( 2 << 2), x +   27.783 * s);
			_setf(o + ( 3 << 2), y +  -18.896 * s);
			_setf(o + ( 4 << 2), x +   27.783 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   10.205 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   10.205 * s);
			_setf(o + ( 9 << 2), y +  -18.896 * s);
			_setf(o + (10 << 2), x +   37.988 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
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
			_setf(o + ( 0 << 2), x +   45.995 * s);
			_setf(o + ( 1 << 2), y +  -36.523 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   45.995 * s,y +  -36.523 * s,x +   45.995 * s,y +  -45.637 * s,x +   45.141 * s,y +  -52.058 * s,x +   43.432 * s,y +  -55.785 * s, threshold);
			_bez(x +   43.432 * s,y +  -55.785 * s,x +   41.723 * s,y +  -59.512 * s,x +   38.850 * s,y +  -61.376 * s,x +   34.814 * s,y +  -61.376 * s, threshold);
			_bez(x +   34.814 * s,y +  -61.376 * s,x +   30.777 * s,y +  -61.376 * s,x +   27.897 * s,y +  -59.512 * s,x +   26.171 * s,y +  -55.785 * s, threshold);
			_bez(x +   26.171 * s,y +  -55.785 * s,x +   24.446 * s,y +  -52.058 * s,x +   23.583 * s,y +  -45.637 * s,x +   23.583 * s,y +  -36.523 * s, threshold);
			_bez(x +   23.583 * s,y +  -36.523 * s,x +   23.583 * s,y +  -27.311 * s,x +   24.446 * s,y +  -20.817 * s,x +   26.171 * s,y +  -17.041 * s, threshold);
			_bez(x +   26.171 * s,y +  -17.041 * s,x +   27.897 * s,y +  -13.265 * s,x +   30.777 * s,y +  -11.377 * s,x +   34.814 * s,y +  -11.377 * s, threshold);
			_bez(x +   34.814 * s,y +  -11.377 * s,x +   38.818 * s,y +  -11.377 * s,x +   41.682 * s,y +  -13.265 * s,x +   43.407 * s,y +  -17.041 * s, threshold);
			_bez(x +   43.407 * s,y +  -17.041 * s,x +   45.133 * s,y +  -20.817 * s,x +   45.995 * s,y +  -27.311 * s,x +   45.995 * s,y +  -36.523 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   64.794 * s);
			_setf(o + ( 1 << 2), y +  -36.376 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   64.794 * s,y +  -36.376 * s,x +   64.794 * s,y +  -24.299 * s,x +   62.190 * s,y +  -14.982 * s,x +   56.981 * s,y +   -8.423 * s, threshold);
			_bez(x +   56.981 * s,y +   -8.423 * s,x +   51.773 * s,y +   -1.864 * s,x +   44.384 * s,y +    1.416 * s,x +   34.814 * s,y +    1.416 * s, threshold);
			_bez(x +   34.814 * s,y +    1.416 * s,x +   25.211 * s,y +    1.416 * s,x +   17.806 * s,y +   -1.864 * s,x +   12.597 * s,y +   -8.423 * s, threshold);
			_bez(x +   12.597 * s,y +   -8.423 * s,x +    7.389 * s,y +  -14.982 * s,x +    4.785 * s,y +  -24.299 * s,x +    4.785 * s,y +  -36.376 * s, threshold);
			_bez(x +    4.785 * s,y +  -36.376 * s,x +    4.785 * s,y +  -48.486 * s,x +    7.389 * s,y +  -57.820 * s,x +   12.597 * s,y +  -64.379 * s, threshold);
			_bez(x +   12.597 * s,y +  -64.379 * s,x +   17.806 * s,y +  -70.938 * s,x +   25.211 * s,y +  -74.218 * s,x +   34.814 * s,y +  -74.218 * s, threshold);
			_bez(x +   34.814 * s,y +  -74.218 * s,x +   44.384 * s,y +  -74.218 * s,x +   51.773 * s,y +  -70.938 * s,x +   56.981 * s,y +  -64.379 * s, threshold);
			_bez(x +   56.981 * s,y +  -64.379 * s,x +   62.190 * s,y +  -57.820 * s,x +   64.794 * s,y +  -48.486 * s,x +   64.794 * s,y +  -36.376 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   69.579 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 49:
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +   11.718 * s);
			_setf(o + ( 1 << 2), y +  -12.988 * s);
			_setf(o + ( 2 << 2), x +   28.320 * s);
			_setf(o + ( 3 << 2), y +  -12.988 * s);
			_setf(o + ( 4 << 2), x +   28.320 * s);
			_setf(o + ( 5 << 2), y +  -60.106 * s);
			_setf(o + ( 6 << 2), x +   11.279 * s);
			_setf(o + ( 7 << 2), y +  -56.591 * s);
			_setf(o + ( 8 << 2), x +   11.279 * s);
			_setf(o + ( 9 << 2), y +  -69.384 * s);
			_setf(o + (10 << 2), x +   28.222 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   46.093 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   46.093 * s);
			_setf(o + (15 << 2), y +  -12.988 * s);
			_setf(o + (16 << 2), x +   62.694 * s);
			_setf(o + (17 << 2), y +  -12.988 * s);
			_setf(o + (18 << 2), x +   62.694 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   11.718 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   11.718 * s);
			_setf(o + (23 << 2), y +  -12.988 * s);
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
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   28.808 * s);
			_setf(o + ( 1 << 2), y +  -13.818 * s);
			_setf(o + ( 2 << 2), x +   60.888 * s);
			_setf(o + ( 3 << 2), y +  -13.818 * s);
			_setf(o + ( 4 << 2), x +   60.888 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    7.910 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    7.910 * s);
			_setf(o + ( 9 << 2), y +  -13.818 * s);
			_setf(o + (10 << 2), x +   34.521 * s);
			_setf(o + (11 << 2), y +  -37.304 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_bez(x +   34.521 * s,y +  -37.304 * s,x +   36.923 * s,y +  -39.424 * s,x +   38.655 * s,y +  -41.552 * s,x +   39.794 * s,y +  -43.603 * s, threshold);
			_bez(x +   39.794 * s,y +  -43.603 * s,x +   40.934 * s,y +  -45.654 * s,x +   41.503 * s,y +  -47.786 * s,x +   41.503 * s,y +  -49.999 * s, threshold);
			_bez(x +   41.503 * s,y +  -49.999 * s,x +   41.503 * s,y +  -53.417 * s,x +   40.356 * s,y +  -56.168 * s,x +   38.061 * s,y +  -58.251 * s, threshold);
			_bez(x +   38.061 * s,y +  -58.251 * s,x +   35.766 * s,y +  -60.334 * s,x +   32.714 * s,y +  -61.376 * s,x +   28.906 * s,y +  -61.376 * s, threshold);
			_bez(x +   28.906 * s,y +  -61.376 * s,x +   25.976 * s,y +  -61.376 * s,x +   22.770 * s,y +  -60.749 * s,x +   19.287 * s,y +  -59.496 * s, threshold);
			_bez(x +   19.287 * s,y +  -59.496 * s,x +   15.804 * s,y +  -58.243 * s,x +   12.077 * s,y +  -56.379 * s,x +    8.105 * s,y +  -53.905 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    8.105 * s);
			_setf(o + ( 1 << 2), y +  -69.921 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    8.105 * s,y +  -69.921 * s,x +   12.337 * s,y +  -71.321 * s,x +   16.520 * s,y +  -72.387 * s,x +   20.654 * s,y +  -73.119 * s, threshold);
			_bez(x +   20.654 * s,y +  -73.119 * s,x +   24.788 * s,y +  -73.851 * s,x +   28.841 * s,y +  -74.218 * s,x +   32.812 * s,y +  -74.218 * s, threshold);
			_bez(x +   32.812 * s,y +  -74.218 * s,x +   41.536 * s,y +  -74.218 * s,x +   48.315 * s,y +  -72.297 * s,x +   53.149 * s,y +  -68.456 * s, threshold);
			_bez(x +   53.149 * s,y +  -68.456 * s,x +   57.982 * s,y +  -64.615 * s,x +   60.399 * s,y +  -59.260 * s,x +   60.399 * s,y +  -52.392 * s, threshold);
			_bez(x +   60.399 * s,y +  -52.392 * s,x +   60.399 * s,y +  -48.421 * s,x +   59.374 * s,y +  -44.718 * s,x +   57.323 * s,y +  -41.284 * s, threshold);
			_bez(x +   57.323 * s,y +  -41.284 * s,x +   55.273 * s,y +  -37.849 * s,x +   50.954 * s,y +  -33.257 * s,x +   44.384 * s,y +  -27.490 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   28.808 * s);
			_setf(o + ( 1 << 2), y +  -13.818 * s);
			_setf(o + ( 2 << 2), x +   69.579 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 51:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   46.581 * s);
			_setf(o + ( 1 << 2), y +  -39.306 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   46.581 * s,y +  -39.306 * s,x +   51.497 * s,y +  -38.037 * s,x +   55.232 * s,y +  -35.831 * s,x +   57.787 * s,y +  -32.690 * s, threshold);
			_bez(x +   57.787 * s,y +  -32.690 * s,x +   60.343 * s,y +  -29.549 * s,x +   61.620 * s,y +  -25.553 * s,x +   61.620 * s,y +  -20.703 * s, threshold);
			_bez(x +   61.620 * s,y +  -20.703 * s,x +   61.620 * s,y +  -13.476 * s,x +   58.853 * s,y +   -7.983 * s,x +   53.319 * s,y +   -4.224 * s, threshold);
			_bez(x +   53.319 * s,y +   -4.224 * s,x +   47.786 * s,y +   -0.464 * s,x +   39.713 * s,y +    1.416 * s,x +   29.101 * s,y +    1.416 * s, threshold);
			_bez(x +   29.101 * s,y +    1.416 * s,x +   25.358 * s,y +    1.416 * s,x +   21.606 * s,y +    1.115 * s,x +   17.846 * s,y +    0.513 * s, threshold);
			_bez(x +   17.846 * s,y +    0.513 * s,x +   14.087 * s,y +   -0.090 * s,x +   10.368 * s,y +   -0.993 * s,x +    6.689 * s,y +   -2.197 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    6.689 * s);
			_setf(o + ( 1 << 2), y +  -16.699 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    6.689 * s,y +  -16.699 * s,x +   10.205 * s,y +  -14.941 * s,x +   13.696 * s,y +  -13.615 * s,x +   17.163 * s,y +  -12.720 * s, threshold);
			_bez(x +   17.163 * s,y +  -12.720 * s,x +   20.630 * s,y +  -11.824 * s,x +   24.039 * s,y +  -11.377 * s,x +   27.392 * s,y +  -11.377 * s, threshold);
			_bez(x +   27.392 * s,y +  -11.377 * s,x +   32.373 * s,y +  -11.377 * s,x +   36.189 * s,y +  -12.239 * s,x +   38.842 * s,y +  -13.965 * s, threshold);
			_bez(x +   38.842 * s,y +  -13.965 * s,x +   41.495 * s,y +  -15.690 * s,x +   42.822 * s,y +  -18.164 * s,x +   42.822 * s,y +  -21.386 * s, threshold);
			_bez(x +   42.822 * s,y +  -21.386 * s,x +   42.822 * s,y +  -24.707 * s,x +   41.463 * s,y +  -27.221 * s,x +   38.745 * s,y +  -28.930 * s, threshold);
			_bez(x +   38.745 * s,y +  -28.930 * s,x +   36.026 * s,y +  -30.639 * s,x +   32.014 * s,y +  -31.494 * s,x +   26.709 * s,y +  -31.494 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   19.189 * s);
			_setf(o + ( 1 << 2), y +  -31.494 * s);
			_setf(o + ( 2 << 2), x +   19.189 * s);
			_setf(o + ( 3 << 2), y +  -43.603 * s);
			_setf(o + ( 4 << 2), x +   27.099 * s);
			_setf(o + ( 5 << 2), y +  -43.603 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   27.099 * s,y +  -43.603 * s,x +   31.819 * s,y +  -43.603 * s,x +   35.335 * s,y +  -44.343 * s,x +   37.646 * s,y +  -45.824 * s, threshold);
			_bez(x +   37.646 * s,y +  -45.824 * s,x +   39.957 * s,y +  -47.306 * s,x +   41.113 * s,y +  -49.560 * s,x +   41.113 * s,y +  -52.587 * s, threshold);
			_bez(x +   41.113 * s,y +  -52.587 * s,x +   41.113 * s,y +  -55.387 * s,x +   39.990 * s,y +  -57.551 * s,x +   37.744 * s,y +  -59.081 * s, threshold);
			_bez(x +   37.744 * s,y +  -59.081 * s,x +   35.498 * s,y +  -60.611 * s,x +   32.324 * s,y +  -61.376 * s,x +   28.222 * s,y +  -61.376 * s, threshold);
			_bez(x +   28.222 * s,y +  -61.376 * s,x +   25.195 * s,y +  -61.376 * s,x +   22.135 * s,y +  -61.034 * s,x +   19.043 * s,y +  -60.351 * s, threshold);
			_bez(x +   19.043 * s,y +  -60.351 * s,x +   15.950 * s,y +  -59.667 * s,x +   12.874 * s,y +  -58.658 * s,x +    9.814 * s,y +  -57.323 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    9.814 * s);
			_setf(o + ( 1 << 2), y +  -71.093 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    9.814 * s,y +  -71.093 * s,x +   13.525 * s,y +  -72.134 * s,x +   17.204 * s,y +  -72.916 * s,x +   20.849 * s,y +  -73.436 * s, threshold);
			_bez(x +   20.849 * s,y +  -73.436 * s,x +   24.495 * s,y +  -73.957 * s,x +   28.076 * s,y +  -74.218 * s,x +   31.591 * s,y +  -74.218 * s, threshold);
			_bez(x +   31.591 * s,y +  -74.218 * s,x +   41.064 * s,y +  -74.218 * s,x +   48.152 * s,y +  -72.663 * s,x +   52.856 * s,y +  -69.555 * s, threshold);
			_bez(x +   52.856 * s,y +  -69.555 * s,x +   57.559 * s,y +  -66.446 * s,x +   59.911 * s,y +  -61.767 * s,x +   59.911 * s,y +  -55.517 * s, threshold);
			_bez(x +   59.911 * s,y +  -55.517 * s,x +   59.911 * s,y +  -51.252 * s,x +   58.788 * s,y +  -47.761 * s,x +   56.542 * s,y +  -45.043 * s, threshold);
			_bez(x +   56.542 * s,y +  -45.043 * s,x +   54.296 * s,y +  -42.325 * s,x +   50.976 * s,y +  -40.413 * s,x +   46.581 * s,y +  -39.306 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   69.579 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 52:
			
			o = _posf(34);
			_setf(o + ( 0 << 2), x +   36.816 * s);
			_setf(o + ( 1 << 2), y +  -57.421 * s);
			_setf(o + ( 2 << 2), x +   16.211 * s);
			_setf(o + ( 3 << 2), y +  -26.904 * s);
			_setf(o + ( 4 << 2), x +   36.816 * s);
			_setf(o + ( 5 << 2), y +  -26.904 * s);
			_setf(o + ( 6 << 2), x +   36.816 * s);
			_setf(o + ( 7 << 2), y +  -57.421 * s);
			_setf(o + ( 8 << 2), x +   33.691 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   54.589 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   54.589 * s);
			_setf(o + (13 << 2), y +  -26.904 * s);
			_setf(o + (14 << 2), x +   64.989 * s);
			_setf(o + (15 << 2), y +  -26.904 * s);
			_setf(o + (16 << 2), x +   64.989 * s);
			_setf(o + (17 << 2), y +  -13.281 * s);
			_setf(o + (18 << 2), x +   54.589 * s);
			_setf(o + (19 << 2), y +  -13.281 * s);
			_setf(o + (20 << 2), x +   54.589 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   36.816 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   36.816 * s);
			_setf(o + (25 << 2), y +  -13.281 * s);
			_setf(o + (26 << 2), x +    4.492 * s);
			_setf(o + (27 << 2), y +  -13.281 * s);
			_setf(o + (28 << 2), x +    4.492 * s);
			_setf(o + (29 << 2), y +  -29.394 * s);
			_setf(o + (30 << 2), x +   33.691 * s);
			_setf(o + (31 << 2), y +  -72.899 * s);
			_setf(o + (32 << 2), x +   69.579 * s);
			_setf(o + (33 << 2), y +       0. * s);
			o = _posb(17);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 1);
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
			
			case 53:
			
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   10.596 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   57.323 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   57.323 * s);
			_setf(o + ( 5 << 2), y +  -59.081 * s);
			_setf(o + ( 6 << 2), x +   25.586 * s);
			_setf(o + ( 7 << 2), y +  -59.081 * s);
			_setf(o + ( 8 << 2), x +   25.586 * s);
			_setf(o + ( 9 << 2), y +  -47.802 * s);
			o = _posb(5);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   25.586 * s,y +  -47.802 * s,x +   27.018 * s,y +  -48.193 * s,x +   28.458 * s,y +  -48.494 * s,x +   29.907 * s,y +  -48.705 * s, threshold);
			_bez(x +   29.907 * s,y +  -48.705 * s,x +   31.355 * s,y +  -48.917 * s,x +   32.861 * s,y +  -49.023 * s,x +   34.423 * s,y +  -49.023 * s, threshold);
			_bez(x +   34.423 * s,y +  -49.023 * s,x +   43.310 * s,y +  -49.023 * s,x +   50.227 * s,y +  -46.801 * s,x +   55.175 * s,y +  -42.358 * s, threshold);
			_bez(x +   55.175 * s,y +  -42.358 * s,x +   60.123 * s,y +  -37.914 * s,x +   62.597 * s,y +  -31.721 * s,x +   62.597 * s,y +  -23.779 * s, threshold);
			_bez(x +   62.597 * s,y +  -23.779 * s,x +   62.597 * s,y +  -15.902 * s,x +   59.903 * s,y +   -9.733 * s,x +   54.516 * s,y +   -5.273 * s, threshold);
			_bez(x +   54.516 * s,y +   -5.273 * s,x +   49.128 * s,y +   -0.814 * s,x +   41.650 * s,y +    1.416 * s,x +   32.080 * s,y +    1.416 * s, threshold);
			_bez(x +   32.080 * s,y +    1.416 * s,x +   27.946 * s,y +    1.416 * s,x +   23.852 * s,y +    1.017 * s,x +   19.800 * s,y +    0.220 * s, threshold);
			_bez(x +   19.800 * s,y +    0.220 * s,x +   15.747 * s,y +   -0.578 * s,x +   11.719 * s,y +   -1.790 * s,x +    7.715 * s,y +   -3.418 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    7.715 * s);
			_setf(o + ( 1 << 2), y +  -18.213 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    7.715 * s,y +  -18.213 * s,x +   11.686 * s,y +  -15.934 * s,x +   15.454 * s,y +  -14.225 * s,x +   19.018 * s,y +  -13.086 * s, threshold);
			_bez(x +   19.018 * s,y +  -13.086 * s,x +   22.583 * s,y +  -11.946 * s,x +   25.944 * s,y +  -11.377 * s,x +   29.101 * s,y +  -11.377 * s, threshold);
			_bez(x +   29.101 * s,y +  -11.377 * s,x +   33.658 * s,y +  -11.377 * s,x +   37.247 * s,y +  -12.492 * s,x +   39.868 * s,y +  -14.721 * s, threshold);
			_bez(x +   39.868 * s,y +  -14.721 * s,x +   42.488 * s,y +  -16.951 * s,x +   43.798 * s,y +  -19.970 * s,x +   43.798 * s,y +  -23.779 * s, threshold);
			_bez(x +   43.798 * s,y +  -23.779 * s,x +   43.798 * s,y +  -27.620 * s,x +   42.488 * s,y +  -30.647 * s,x +   39.868 * s,y +  -32.861 * s, threshold);
			_bez(x +   39.868 * s,y +  -32.861 * s,x +   37.247 * s,y +  -35.074 * s,x +   33.658 * s,y +  -36.181 * s,x +   29.101 * s,y +  -36.181 * s, threshold);
			_bez(x +   29.101 * s,y +  -36.181 * s,x +   26.399 * s,y +  -36.181 * s,x +   23.519 * s,y +  -35.831 * s,x +   20.459 * s,y +  -35.131 * s, threshold);
			_bez(x +   20.459 * s,y +  -35.131 * s,x +   17.399 * s,y +  -34.431 * s,x +   14.111 * s,y +  -33.349 * s,x +   10.596 * s,y +  -31.884 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   10.596 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   69.579 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 54:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.181 * s);
			_setf(o + ( 1 << 2), y +  -35.986 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   36.181 * s,y +  -35.986 * s,x +   32.893 * s,y +  -35.986 * s,x +   30.428 * s,y +  -34.920 * s,x +   28.784 * s,y +  -32.788 * s, threshold);
			_bez(x +   28.784 * s,y +  -32.788 * s,x +   27.140 * s,y +  -30.655 * s,x +   26.318 * s,y +  -27.457 * s,x +   26.318 * s,y +  -23.193 * s, threshold);
			_bez(x +   26.318 * s,y +  -23.193 * s,x +   26.318 * s,y +  -18.929 * s,x +   27.140 * s,y +  -15.731 * s,x +   28.784 * s,y +  -13.598 * s, threshold);
			_bez(x +   28.784 * s,y +  -13.598 * s,x +   30.428 * s,y +  -11.466 * s,x +   32.893 * s,y +  -10.400 * s,x +   36.181 * s,y +  -10.400 * s, threshold);
			_bez(x +   36.181 * s,y +  -10.400 * s,x +   39.502 * s,y +  -10.400 * s,x +   41.983 * s,y +  -11.466 * s,x +   43.627 * s,y +  -13.598 * s, threshold);
			_bez(x +   43.627 * s,y +  -13.598 * s,x +   45.271 * s,y +  -15.731 * s,x +   46.093 * s,y +  -18.929 * s,x +   46.093 * s,y +  -23.193 * s, threshold);
			_bez(x +   46.093 * s,y +  -23.193 * s,x +   46.093 * s,y +  -27.457 * s,x +   45.271 * s,y +  -30.655 * s,x +   43.627 * s,y +  -32.788 * s, threshold);
			_bez(x +   43.627 * s,y +  -32.788 * s,x +   41.983 * s,y +  -34.920 * s,x +   39.502 * s,y +  -35.986 * s,x +   36.181 * s,y +  -35.986 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   59.423 * s);
			_setf(o + ( 1 << 2), y +  -70.995 * s);
			_setf(o + ( 2 << 2), x +   59.423 * s);
			_setf(o + ( 3 << 2), y +  -57.519 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   59.423 * s,y +  -57.519 * s,x +   56.331 * s,y +  -58.983 * s,x +   53.417 * s,y +  -60.066 * s,x +   50.683 * s,y +  -60.766 * s, threshold);
			_bez(x +   50.683 * s,y +  -60.766 * s,x +   47.949 * s,y +  -61.466 * s,x +   45.279 * s,y +  -61.815 * s,x +   42.675 * s,y +  -61.815 * s, threshold);
			_bez(x +   42.675 * s,y +  -61.815 * s,x +   37.076 * s,y +  -61.815 * s,x +   32.714 * s,y +  -60.261 * s,x +   29.589 * s,y +  -57.152 * s, threshold);
			_bez(x +   29.589 * s,y +  -57.152 * s,x +   26.464 * s,y +  -54.044 * s,x +   24.642 * s,y +  -49.430 * s,x +   24.121 * s,y +  -43.310 * s, threshold);
			_bez(x +   24.121 * s,y +  -43.310 * s,x +   26.269 * s,y +  -44.905 * s,x +   28.597 * s,y +  -46.101 * s,x +   31.103 * s,y +  -46.899 * s, threshold);
			_bez(x +   31.103 * s,y +  -46.899 * s,x +   33.610 * s,y +  -47.696 * s,x +   36.344 * s,y +  -48.095 * s,x +   39.306 * s,y +  -48.095 * s, threshold);
			_bez(x +   39.306 * s,y +  -48.095 * s,x +   46.760 * s,y +  -48.095 * s,x +   52.774 * s,y +  -45.914 * s,x +   57.348 * s,y +  -41.552 * s, threshold);
			_bez(x +   57.348 * s,y +  -41.552 * s,x +   61.921 * s,y +  -37.190 * s,x +   64.208 * s,y +  -31.477 * s,x +   64.208 * s,y +  -24.414 * s, threshold);
			_bez(x +   64.208 * s,y +  -24.414 * s,x +   64.208 * s,y +  -16.601 * s,x +   61.653 * s,y +  -10.343 * s,x +   56.542 * s,y +   -5.640 * s, threshold);
			_bez(x +   56.542 * s,y +   -5.640 * s,x +   51.432 * s,y +   -0.936 * s,x +   44.579 * s,y +    1.416 * s,x +   35.986 * s,y +    1.416 * s, threshold);
			_bez(x +   35.986 * s,y +    1.416 * s,x +   26.513 * s,y +    1.416 * s,x +   19.181 * s,y +   -1.782 * s,x +   13.989 * s,y +   -8.179 * s, threshold);
			_bez(x +   13.989 * s,y +   -8.179 * s,x +    8.797 * s,y +  -14.575 * s,x +    6.201 * s,y +  -23.649 * s,x +    6.201 * s,y +  -35.400 * s, threshold);
			_bez(x +    6.201 * s,y +  -35.400 * s,x +    6.201 * s,y +  -47.444 * s,x +    9.237 * s,y +  -56.908 * s,x +   15.307 * s,y +  -63.793 * s, threshold);
			_bez(x +   15.307 * s,y +  -63.793 * s,x +   21.378 * s,y +  -70.678 * s,x +   29.704 * s,y +  -74.120 * s,x +   40.283 * s,y +  -74.120 * s, threshold);
			_bez(x +   40.283 * s,y +  -74.120 * s,x +   43.635 * s,y +  -74.120 * s,x +   46.891 * s,y +  -73.860 * s,x +   50.048 * s,y +  -73.339 * s, threshold);
			_bez(x +   50.048 * s,y +  -73.339 * s,x +   53.206 * s,y +  -72.818 * s,x +   56.331 * s,y +  -72.037 * s,x +   59.423 * s,y +  -70.995 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   69.579 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 55:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +    6.689 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   61.620 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   61.620 * s);
			_setf(o + ( 5 << 2), y +  -62.304 * s);
			_setf(o + ( 6 << 2), x +   33.203 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   14.892 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   41.796 * s);
			_setf(o + (11 << 2), y +  -59.081 * s);
			_setf(o + (12 << 2), x +    6.689 * s);
			_setf(o + (13 << 2), y +  -59.081 * s);
			_setf(o + (14 << 2), x +    6.689 * s);
			_setf(o + (15 << 2), y +  -72.899 * s);
			_setf(o + (16 << 2), x +   69.579 * s);
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
			
			case 56:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   34.814 * s);
			_setf(o + ( 1 << 2), y +  -32.617 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   34.814 * s,y +  -32.617 * s,x +   31.298 * s,y +  -32.617 * s,x +   28.597 * s,y +  -31.656 * s,x +   26.709 * s,y +  -29.736 * s, threshold);
			_bez(x +   26.709 * s,y +  -29.736 * s,x +   24.821 * s,y +  -27.815 * s,x +   23.877 * s,y +  -25.065 * s,x +   23.877 * s,y +  -21.484 * s, threshold);
			_bez(x +   23.877 * s,y +  -21.484 * s,x +   23.877 * s,y +  -17.903 * s,x +   24.821 * s,y +  -15.161 * s,x +   26.709 * s,y +  -13.257 * s, threshold);
			_bez(x +   26.709 * s,y +  -13.257 * s,x +   28.597 * s,y +  -11.352 * s,x +   31.298 * s,y +  -10.400 * s,x +   34.814 * s,y +  -10.400 * s, threshold);
			_bez(x +   34.814 * s,y +  -10.400 * s,x +   38.297 * s,y +  -10.400 * s,x +   40.966 * s,y +  -11.352 * s,x +   42.822 * s,y +  -13.257 * s, threshold);
			_bez(x +   42.822 * s,y +  -13.257 * s,x +   44.677 * s,y +  -15.161 * s,x +   45.605 * s,y +  -17.903 * s,x +   45.605 * s,y +  -21.484 * s, threshold);
			_bez(x +   45.605 * s,y +  -21.484 * s,x +   45.605 * s,y +  -25.097 * s,x +   44.677 * s,y +  -27.856 * s,x +   42.822 * s,y +  -29.760 * s, threshold);
			_bez(x +   42.822 * s,y +  -29.760 * s,x +   40.966 * s,y +  -31.665 * s,x +   38.297 * s,y +  -32.617 * s,x +   34.814 * s,y +  -32.617 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   21.093 * s);
			_setf(o + ( 1 << 2), y +  -38.818 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   21.093 * s,y +  -38.818 * s,x +   16.666 * s,y +  -40.152 * s,x +   13.330 * s,y +  -42.203 * s,x +   11.084 * s,y +  -44.970 * s, threshold);
			_bez(x +   11.084 * s,y +  -44.970 * s,x +    8.838 * s,y +  -47.737 * s,x +    7.715 * s,y +  -51.187 * s,x +    7.715 * s,y +  -55.321 * s, threshold);
			_bez(x +    7.715 * s,y +  -55.321 * s,x +    7.715 * s,y +  -61.474 * s,x +   10.010 * s,y +  -66.161 * s,x +   14.599 * s,y +  -69.384 * s, threshold);
			_bez(x +   14.599 * s,y +  -69.384 * s,x +   19.189 * s,y +  -72.606 * s,x +   25.927 * s,y +  -74.218 * s,x +   34.814 * s,y +  -74.218 * s, threshold);
			_bez(x +   34.814 * s,y +  -74.218 * s,x +   43.636 * s,y +  -74.218 * s,x +   50.341 * s,y +  -72.614 * s,x +   54.931 * s,y +  -69.408 * s, threshold);
			_bez(x +   54.931 * s,y +  -69.408 * s,x +   59.521 * s,y +  -66.202 * s,x +   61.816 * s,y +  -61.506 * s,x +   61.816 * s,y +  -55.321 * s, threshold);
			_bez(x +   61.816 * s,y +  -55.321 * s,x +   61.816 * s,y +  -51.187 * s,x +   60.684 * s,y +  -47.737 * s,x +   58.422 * s,y +  -44.970 * s, threshold);
			_bez(x +   58.422 * s,y +  -44.970 * s,x +   56.160 * s,y +  -42.203 * s,x +   52.815 * s,y +  -40.152 * s,x +   48.388 * s,y +  -38.818 * s, threshold);
			_bez(x +   48.388 * s,y +  -38.818 * s,x +   53.336 * s,y +  -37.451 * s,x +   57.071 * s,y +  -35.229 * s,x +   59.594 * s,y +  -32.153 * s, threshold);
			_bez(x +   59.594 * s,y +  -32.153 * s,x +   62.117 * s,y +  -29.077 * s,x +   63.378 * s,y +  -25.195 * s,x +   63.378 * s,y +  -20.507 * s, threshold);
			_bez(x +   63.378 * s,y +  -20.507 * s,x +   63.378 * s,y +  -13.281 * s,x +   60.977 * s,y +   -7.820 * s,x +   56.176 * s,y +   -4.126 * s, threshold);
			_bez(x +   56.176 * s,y +   -4.126 * s,x +   51.375 * s,y +   -0.431 * s,x +   44.254 * s,y +    1.416 * s,x +   34.814 * s,y +    1.416 * s, threshold);
			_bez(x +   34.814 * s,y +    1.416 * s,x +   25.341 * s,y +    1.416 * s,x +   18.188 * s,y +   -0.431 * s,x +   13.354 * s,y +   -4.126 * s, threshold);
			_bez(x +   13.354 * s,y +   -4.126 * s,x +    8.520 * s,y +   -7.820 * s,x +    6.103 * s,y +  -13.281 * s,x +    6.103 * s,y +  -20.507 * s, threshold);
			_bez(x +    6.103 * s,y +  -20.507 * s,x +    6.103 * s,y +  -25.195 * s,x +    7.365 * s,y +  -29.077 * s,x +    9.888 * s,y +  -32.153 * s, threshold);
			_bez(x +    9.888 * s,y +  -32.153 * s,x +   12.410 * s,y +  -35.229 * s,x +   16.146 * s,y +  -37.451 * s,x +   21.093 * s,y +  -38.818 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   25.488 * s);
			_setf(o + ( 1 << 2), y +  -53.417 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   25.488 * s,y +  -53.417 * s,x +   25.488 * s,y +  -50.520 * s,x +   26.294 * s,y +  -48.290 * s,x +   27.905 * s,y +  -46.728 * s, threshold);
			_bez(x +   27.905 * s,y +  -46.728 * s,x +   29.516 * s,y +  -45.165 * s,x +   31.819 * s,y +  -44.384 * s,x +   34.814 * s,y +  -44.384 * s, threshold);
			_bez(x +   34.814 * s,y +  -44.384 * s,x +   37.744 * s,y +  -44.384 * s,x +   40.006 * s,y +  -45.165 * s,x +   41.601 * s,y +  -46.728 * s, threshold);
			_bez(x +   41.601 * s,y +  -46.728 * s,x +   43.196 * s,y +  -48.290 * s,x +   43.994 * s,y +  -50.520 * s,x +   43.994 * s,y +  -53.417 * s, threshold);
			_bez(x +   43.994 * s,y +  -53.417 * s,x +   43.994 * s,y +  -56.314 * s,x +   43.196 * s,y +  -58.536 * s,x +   41.601 * s,y +  -60.082 * s, threshold);
			_bez(x +   41.601 * s,y +  -60.082 * s,x +   40.006 * s,y +  -61.628 * s,x +   37.744 * s,y +  -62.401 * s,x +   34.814 * s,y +  -62.401 * s, threshold);
			_bez(x +   34.814 * s,y +  -62.401 * s,x +   31.819 * s,y +  -62.401 * s,x +   29.516 * s,y +  -61.620 * s,x +   27.905 * s,y +  -60.058 * s, threshold);
			_bez(x +   27.905 * s,y +  -60.058 * s,x +   26.294 * s,y +  -58.495 * s,x +   25.488 * s,y +  -56.282 * s,x +   25.488 * s,y +  -53.417 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   69.579 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 57:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   10.010 * s);
			_setf(o + ( 1 << 2), y +   -1.611 * s);
			_setf(o + ( 2 << 2), x +   10.010 * s);
			_setf(o + ( 3 << 2), y +  -15.088 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   10.010 * s,y +  -15.088 * s,x +   13.004 * s,y +  -13.688 * s,x +   15.869 * s,y +  -12.638 * s,x +   18.603 * s,y +  -11.938 * s, threshold);
			_bez(x +   18.603 * s,y +  -11.938 * s,x +   21.338 * s,y +  -11.238 * s,x +   24.039 * s,y +  -10.889 * s,x +   26.709 * s,y +  -10.889 * s, threshold);
			_bez(x +   26.709 * s,y +  -10.889 * s,x +   32.307 * s,y +  -10.889 * s,x +   36.669 * s,y +  -12.443 * s,x +   39.794 * s,y +  -15.552 * s, threshold);
			_bez(x +   39.794 * s,y +  -15.552 * s,x +   42.919 * s,y +  -18.660 * s,x +   44.758 * s,y +  -23.274 * s,x +   45.312 * s,y +  -29.394 * s, threshold);
			_bez(x +   45.312 * s,y +  -29.394 * s,x +   43.098 * s,y +  -27.766 * s,x +   40.738 * s,y +  -26.546 * s,x +   38.232 * s,y +  -25.732 * s, threshold);
			_bez(x +   38.232 * s,y +  -25.732 * s,x +   35.725 * s,y +  -24.918 * s,x +   33.007 * s,y +  -24.511 * s,x +   30.078 * s,y +  -24.511 * s, threshold);
			_bez(x +   30.078 * s,y +  -24.511 * s,x +   22.623 * s,y +  -24.511 * s,x +   16.609 * s,y +  -26.684 * s,x +   12.036 * s,y +  -31.030 * s, threshold);
			_bez(x +   12.036 * s,y +  -31.030 * s,x +    7.462 * s,y +  -35.375 * s,x +    5.176 * s,y +  -41.097 * s,x +    5.176 * s,y +  -48.193 * s, threshold);
			_bez(x +    5.176 * s,y +  -48.193 * s,x +    5.176 * s,y +  -56.037 * s,x +    7.723 * s,y +  -62.320 * s,x +   12.817 * s,y +  -67.040 * s, threshold);
			_bez(x +   12.817 * s,y +  -67.040 * s,x +   17.911 * s,y +  -71.760 * s,x +   24.739 * s,y +  -74.120 * s,x +   33.300 * s,y +  -74.120 * s, threshold);
			_bez(x +   33.300 * s,y +  -74.120 * s,x +   42.805 * s,y +  -74.120 * s,x +   50.162 * s,y +  -70.914 * s,x +   55.370 * s,y +  -64.501 * s, threshold);
			_bez(x +   55.370 * s,y +  -64.501 * s,x +   60.578 * s,y +  -58.088 * s,x +   63.183 * s,y +  -49.023 * s,x +   63.183 * s,y +  -37.304 * s, threshold);
			_bez(x +   63.183 * s,y +  -37.304 * s,x +   63.183 * s,y +  -25.260 * s,x +   60.139 * s,y +  -15.796 * s,x +   54.052 * s,y +   -8.911 * s, threshold);
			_bez(x +   54.052 * s,y +   -8.911 * s,x +   47.965 * s,y +   -2.026 * s,x +   39.615 * s,y +    1.416 * s,x +   29.003 * s,y +    1.416 * s, threshold);
			_bez(x +   29.003 * s,y +    1.416 * s,x +   25.585 * s,y +    1.416 * s,x +   22.314 * s,y +    1.164 * s,x +   19.189 * s,y +    0.659 * s, threshold);
			_bez(x +   19.189 * s,y +    0.659 * s,x +   16.064 * s,y +    0.155 * s,x +   13.004 * s,y +   -0.602 * s,x +   10.010 * s,y +   -1.611 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   33.203 * s);
			_setf(o + ( 1 << 2), y +  -36.718 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   33.203 * s,y +  -36.718 * s,x +   36.490 * s,y +  -36.718 * s,x +   38.964 * s,y +  -37.784 * s,x +   40.624 * s,y +  -39.916 * s, threshold);
			_bez(x +   40.624 * s,y +  -39.916 * s,x +   42.284 * s,y +  -42.048 * s,x +   43.115 * s,y +  -45.247 * s,x +   43.115 * s,y +  -49.511 * s, threshold);
			_bez(x +   43.115 * s,y +  -49.511 * s,x +   43.115 * s,y +  -53.743 * s,x +   42.284 * s,y +  -56.933 * s,x +   40.624 * s,y +  -59.081 * s, threshold);
			_bez(x +   40.624 * s,y +  -59.081 * s,x +   38.964 * s,y +  -61.230 * s,x +   36.490 * s,y +  -62.304 * s,x +   33.203 * s,y +  -62.304 * s, threshold);
			_bez(x +   33.203 * s,y +  -62.304 * s,x +   29.915 * s,y +  -62.304 * s,x +   27.441 * s,y +  -61.230 * s,x +   25.781 * s,y +  -59.081 * s, threshold);
			_bez(x +   25.781 * s,y +  -59.081 * s,x +   24.121 * s,y +  -56.933 * s,x +   23.291 * s,y +  -53.743 * s,x +   23.291 * s,y +  -49.511 * s, threshold);
			_bez(x +   23.291 * s,y +  -49.511 * s,x +   23.291 * s,y +  -45.247 * s,x +   24.121 * s,y +  -42.048 * s,x +   25.781 * s,y +  -39.916 * s, threshold);
			_bez(x +   25.781 * s,y +  -39.916 * s,x +   27.441 * s,y +  -37.784 * s,x +   29.915 * s,y +  -36.718 * s,x +   33.203 * s,y +  -36.718 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   69.579 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 58:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +   11.182 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   28.808 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   28.808 * s);
			_setf(o + ( 5 << 2), y +  -35.790 * s);
			_setf(o + ( 6 << 2), x +   11.182 * s);
			_setf(o + ( 7 << 2), y +  -35.790 * s);
			_setf(o + ( 8 << 2), x +   11.182 * s);
			_setf(o + ( 9 << 2), y +  -54.687 * s);
			_setf(o + (10 << 2), x +   11.182 * s);
			_setf(o + (11 << 2), y +  -18.896 * s);
			_setf(o + (12 << 2), x +   28.808 * s);
			_setf(o + (13 << 2), y +  -18.896 * s);
			_setf(o + (14 << 2), x +   28.808 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   11.182 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   11.182 * s);
			_setf(o + (19 << 2), y +  -18.896 * s);
			_setf(o + (20 << 2), x +   39.990 * s);
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
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +   11.181 * s);
			_setf(o + ( 1 << 2), y +  -18.896 * s);
			_setf(o + ( 2 << 2), x +   28.808 * s);
			_setf(o + ( 3 << 2), y +  -18.896 * s);
			_setf(o + ( 4 << 2), x +   28.808 * s);
			_setf(o + ( 5 << 2), y +   -4.004 * s);
			_setf(o + ( 6 << 2), x +   16.699 * s);
			_setf(o + ( 7 << 2), y +   14.209 * s);
			_setf(o + ( 8 << 2), x +    6.298 * s);
			_setf(o + ( 9 << 2), y +   14.209 * s);
			_setf(o + (10 << 2), x +   11.181 * s);
			_setf(o + (11 << 2), y +   -4.004 * s);
			_setf(o + (12 << 2), x +   11.181 * s);
			_setf(o + (13 << 2), y +  -18.896 * s);
			_setf(o + (14 << 2), x +   11.181 * s);
			_setf(o + (15 << 2), y +  -54.687 * s);
			_setf(o + (16 << 2), x +   28.808 * s);
			_setf(o + (17 << 2), y +  -54.687 * s);
			_setf(o + (18 << 2), x +   28.808 * s);
			_setf(o + (19 << 2), y +  -35.790 * s);
			_setf(o + (20 << 2), x +   11.181 * s);
			_setf(o + (21 << 2), y +  -35.790 * s);
			_setf(o + (22 << 2), x +   11.181 * s);
			_setf(o + (23 << 2), y +  -54.687 * s);
			_setf(o + (24 << 2), x +   39.989 * s);
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
			
			case 60:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +   73.192 * s);
			_setf(o + ( 1 << 2), y +  -47.509 * s);
			_setf(o + ( 2 << 2), x +   26.123 * s);
			_setf(o + ( 3 << 2), y +  -31.298 * s);
			_setf(o + ( 4 << 2), x +   73.192 * s);
			_setf(o + ( 5 << 2), y +  -15.185 * s);
			_setf(o + ( 6 << 2), x +   73.192 * s);
			_setf(o + ( 7 << 2), y +   -2.978 * s);
			_setf(o + ( 8 << 2), x +   10.596 * s);
			_setf(o + ( 9 << 2), y +  -25.586 * s);
			_setf(o + (10 << 2), x +   10.596 * s);
			_setf(o + (11 << 2), y +  -37.109 * s);
			_setf(o + (12 << 2), x +   73.192 * s);
			_setf(o + (13 << 2), y +  -59.716 * s);
			_setf(o + (14 << 2), x +   73.192 * s);
			_setf(o + (15 << 2), y +  -47.509 * s);
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
			_setf(o + ( 0 << 2), x +   10.596 * s);
			_setf(o + ( 1 << 2), y +  -48.193 * s);
			_setf(o + ( 2 << 2), x +   73.192 * s);
			_setf(o + ( 3 << 2), y +  -48.193 * s);
			_setf(o + ( 4 << 2), x +   73.192 * s);
			_setf(o + ( 5 << 2), y +  -36.718 * s);
			_setf(o + ( 6 << 2), x +   10.596 * s);
			_setf(o + ( 7 << 2), y +  -36.718 * s);
			_setf(o + ( 8 << 2), x +   10.596 * s);
			_setf(o + ( 9 << 2), y +  -48.193 * s);
			_setf(o + (10 << 2), x +   10.596 * s);
			_setf(o + (11 << 2), y +  -25.976 * s);
			_setf(o + (12 << 2), x +   73.192 * s);
			_setf(o + (13 << 2), y +  -25.976 * s);
			_setf(o + (14 << 2), x +   73.192 * s);
			_setf(o + (15 << 2), y +  -14.404 * s);
			_setf(o + (16 << 2), x +   10.596 * s);
			_setf(o + (17 << 2), y +  -14.404 * s);
			_setf(o + (18 << 2), x +   10.596 * s);
			_setf(o + (19 << 2), y +  -25.976 * s);
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
			_setf(o + ( 1 << 2), y +  -47.509 * s);
			_setf(o + ( 2 << 2), x +   10.595 * s);
			_setf(o + ( 3 << 2), y +  -59.716 * s);
			_setf(o + ( 4 << 2), x +   73.192 * s);
			_setf(o + ( 5 << 2), y +  -37.109 * s);
			_setf(o + ( 6 << 2), x +   73.192 * s);
			_setf(o + ( 7 << 2), y +  -25.586 * s);
			_setf(o + ( 8 << 2), x +   10.595 * s);
			_setf(o + ( 9 << 2), y +   -2.978 * s);
			_setf(o + (10 << 2), x +   10.595 * s);
			_setf(o + (11 << 2), y +  -15.185 * s);
			_setf(o + (12 << 2), x +   57.714 * s);
			_setf(o + (13 << 2), y +  -31.298 * s);
			_setf(o + (14 << 2), x +   10.595 * s);
			_setf(o + (15 << 2), y +  -47.509 * s);
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
			
			case 63:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   34.618 * s);
			_setf(o + ( 1 << 2), y +  -24.609 * s);
			_setf(o + ( 2 << 2), x +   16.992 * s);
			_setf(o + ( 3 << 2), y +  -24.609 * s);
			_setf(o + ( 4 << 2), x +   16.992 * s);
			_setf(o + ( 5 << 2), y +  -27.002 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   16.992 * s,y +  -27.002 * s,x +   16.992 * s,y +  -29.671 * s,x +   17.529 * s,y +  -32.039 * s,x +   18.603 * s,y +  -34.106 * s, threshold);
			_bez(x +   18.603 * s,y +  -34.106 * s,x +   19.677 * s,y +  -36.173 * s,x +   21.908 * s,y +  -38.836 * s,x +   25.390 * s,y +  -41.992 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   28.515 * s);
			_setf(o + ( 1 << 2), y +  -44.824 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   28.515 * s,y +  -44.824 * s,x +   30.376 * s,y +  -46.510 * s,x +   31.729 * s,y +  -48.111 * s,x +   32.592 * s,y +  -49.609 * s, threshold);
			_bez(x +   32.592 * s,y +  -49.609 * s,x +   33.454 * s,y +  -51.106 * s,x +   33.886 * s,y +  -52.603 * s,x +   33.886 * s,y +  -54.101 * s, threshold);
			_bez(x +   33.886 * s,y +  -54.101 * s,x +   33.886 * s,y +  -56.379 * s,x +   33.105 * s,y +  -58.162 * s,x +   31.542 * s,y +  -59.447 * s, threshold);
			_bez(x +   31.542 * s,y +  -59.447 * s,x +   29.980 * s,y +  -60.733 * s,x +   27.799 * s,y +  -61.376 * s,x +   24.999 * s,y +  -61.376 * s, threshold);
			_bez(x +   24.999 * s,y +  -61.376 * s,x +   22.362 * s,y +  -61.376 * s,x +   19.514 * s,y +  -60.831 * s,x +   16.454 * s,y +  -59.740 * s, threshold);
			_bez(x +   16.454 * s,y +  -59.740 * s,x +   13.395 * s,y +  -58.650 * s,x +   10.205 * s,y +  -57.030 * s,x +    6.884 * s,y +  -54.882 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    6.884 * s);
			_setf(o + ( 1 << 2), y +  -70.214 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    6.884 * s,y +  -70.214 * s,x +   10.823 * s,y +  -71.581 * s,x +   14.420 * s,y +  -72.590 * s,x +   17.675 * s,y +  -73.241 * s, threshold);
			_bez(x +   17.675 * s,y +  -73.241 * s,x +   20.930 * s,y +  -73.892 * s,x +   24.071 * s,y +  -74.218 * s,x +   27.099 * s,y +  -74.218 * s, threshold);
			_bez(x +   27.099 * s,y +  -74.218 * s,x +   35.042 * s,y +  -74.218 * s,x +   41.096 * s,y +  -72.598 * s,x +   45.263 * s,y +  -69.359 * s, threshold);
			_bez(x +   45.263 * s,y +  -69.359 * s,x +   49.429 * s,y +  -66.120 * s,x +   51.512 * s,y +  -61.392 * s,x +   51.512 * s,y +  -55.175 * s, threshold);
			_bez(x +   51.512 * s,y +  -55.175 * s,x +   51.512 * s,y +  -51.985 * s,x +   50.878 * s,y +  -49.128 * s,x +   49.608 * s,y +  -46.606 * s, threshold);
			_bez(x +   49.608 * s,y +  -46.606 * s,x +   48.339 * s,y +  -44.083 * s,x +   46.261 * s,y +  -41.278 * s,x +   43.114 * s,y +  -38.476 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   39.989 * s);
			_setf(o + ( 1 << 2), y +  -35.693 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   39.989 * s,y +  -35.693 * s,x +   37.752 * s,y +  -33.701 * s,x +   36.327 * s,y +  -32.055 * s,x +   35.644 * s,y +  -30.834 * s, threshold);
			_bez(x +   35.644 * s,y +  -30.834 * s,x +   34.960 * s,y +  -29.614 * s,x +   34.618 * s,y +  -28.271 * s,x +   34.618 * s,y +  -26.806 * s, threshold);
			o = _posf(14);
			_setf(o + ( 0 << 2), x +   34.618 * s);
			_setf(o + ( 1 << 2), y +  -24.609 * s);
			_setf(o + ( 2 << 2), x +   16.992 * s);
			_setf(o + ( 3 << 2), y +  -17.383 * s);
			_setf(o + ( 4 << 2), x +   34.618 * s);
			_setf(o + ( 5 << 2), y +  -17.383 * s);
			_setf(o + ( 6 << 2), x +   34.618 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   16.992 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   16.992 * s);
			_setf(o + (11 << 2), y +  -17.383 * s);
			_setf(o + (12 << 2), x +   58.007 * s);
			_setf(o + (13 << 2), y +       0. * s);
			o = _posb(7);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 1);
			
			case 64:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   40.575 * s);
			_setf(o + ( 1 << 2), y +  -26.318 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   40.575 * s,y +  -26.318 * s,x +   40.575 * s,y +  -22.314 * s,x +   41.430 * s,y +  -19.157 * s,x +   43.139 * s,y +  -16.845 * s, threshold);
			_bez(x +   43.139 * s,y +  -16.845 * s,x +   44.848 * s,y +  -14.534 * s,x +   47.167 * s,y +  -13.379 * s,x +   50.097 * s,y +  -13.379 * s, threshold);
			_bez(x +   50.097 * s,y +  -13.379 * s,x +   52.994 * s,y +  -13.379 * s,x +   55.305 * s,y +  -14.542 * s,x +   57.030 * s,y +  -16.870 * s, threshold);
			_bez(x +   57.030 * s,y +  -16.870 * s,x +   58.756 * s,y +  -19.197 * s,x +   59.618 * s,y +  -22.347 * s,x +   59.618 * s,y +  -26.318 * s, threshold);
			_bez(x +   59.618 * s,y +  -26.318 * s,x +   59.618 * s,y +  -30.257 * s,x +   58.748 * s,y +  -33.374 * s,x +   57.006 * s,y +  -35.668 * s, threshold);
			_bez(x +   57.006 * s,y +  -35.668 * s,x +   55.265 * s,y +  -37.963 * s,x +   52.929 * s,y +  -39.111 * s,x +   49.999 * s,y +  -39.111 * s, threshold);
			_bez(x +   49.999 * s,y +  -39.111 * s,x +   47.135 * s,y +  -39.111 * s,x +   44.848 * s,y +  -37.963 * s,x +   43.139 * s,y +  -35.668 * s, threshold);
			_bez(x +   43.139 * s,y +  -35.668 * s,x +   41.430 * s,y +  -33.374 * s,x +   40.575 * s,y +  -30.257 * s,x +   40.575 * s,y +  -26.318 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.595 * s);
			_setf(o + ( 1 << 2), y +  -11.621 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   60.595 * s,y +  -11.621 * s,x +   59.618 * s,y +   -9.310 * s,x +   58.048 * s,y +   -7.511 * s,x +   55.883 * s,y +   -6.225 * s, threshold);
			_bez(x +   55.883 * s,y +   -6.225 * s,x +   53.718 * s,y +   -4.940 * s,x +   51.187 * s,y +   -4.297 * s,x +   48.290 * s,y +   -4.297 * s, threshold);
			_bez(x +   48.290 * s,y +   -4.297 * s,x +   42.691 * s,y +   -4.297 * s,x +   38.142 * s,y +   -6.323 * s,x +   34.643 * s,y +  -10.376 * s, threshold);
			_bez(x +   34.643 * s,y +  -10.376 * s,x +   31.144 * s,y +  -14.428 * s,x +   29.394 * s,y +  -19.710 * s,x +   29.394 * s,y +  -26.220 * s, threshold);
			_bez(x +   29.394 * s,y +  -26.220 * s,x +   29.394 * s,y +  -32.731 * s,x +   31.152 * s,y +  -38.020 * s,x +   34.667 * s,y +  -42.089 * s, threshold);
			_bez(x +   34.667 * s,y +  -42.089 * s,x +   38.183 * s,y +  -46.158 * s,x +   42.724 * s,y +  -48.193 * s,x +   48.290 * s,y +  -48.193 * s, threshold);
			_bez(x +   48.290 * s,y +  -48.193 * s,x +   51.187 * s,y +  -48.193 * s,x +   53.718 * s,y +  -47.542 * s,x +   55.883 * s,y +  -46.240 * s, threshold);
			_bez(x +   55.883 * s,y +  -46.240 * s,x +   58.048 * s,y +  -44.937 * s,x +   59.618 * s,y +  -43.131 * s,x +   60.595 * s,y +  -40.820 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   60.595 * s);
			_setf(o + ( 1 << 2), y +  -47.216 * s);
			_setf(o + ( 2 << 2), x +   70.800 * s);
			_setf(o + ( 3 << 2), y +  -47.216 * s);
			_setf(o + ( 4 << 2), x +   70.800 * s);
			_setf(o + ( 5 << 2), y +  -13.379 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   70.800 * s,y +  -13.379 * s,x +   74.836 * s,y +  -13.997 * s,x +   78.010 * s,y +  -15.942 * s,x +   80.321 * s,y +  -19.214 * s, threshold);
			_bez(x +   80.321 * s,y +  -19.214 * s,x +   82.632 * s,y +  -22.485 * s,x +   83.788 * s,y +  -26.676 * s,x +   83.788 * s,y +  -31.787 * s, threshold);
			_bez(x +   83.788 * s,y +  -31.787 * s,x +   83.788 * s,y +  -35.042 * s,x +   83.316 * s,y +  -38.093 * s,x +   82.372 * s,y +  -40.942 * s, threshold);
			_bez(x +   82.372 * s,y +  -40.942 * s,x +   81.428 * s,y +  -43.790 * s,x +   79.968 * s,y +  -46.381 * s,x +   78.075 * s,y +  -48.779 * s, threshold);
			_bez(x +   78.075 * s,y +  -48.779 * s,x +   74.956 * s,y +  -52.728 * s,x +   71.117 * s,y +  -55.810 * s,x +   66.478 * s,y +  -57.958 * s, threshold);
			_bez(x +   66.478 * s,y +  -57.958 * s,x +   61.840 * s,y +  -60.106 * s,x +   56.819 * s,y +  -61.181 * s,x +   51.415 * s,y +  -61.181 * s, threshold);
			_bez(x +   51.415 * s,y +  -61.181 * s,x +   47.639 * s,y +  -61.181 * s,x +   44.026 * s,y +  -60.684 * s,x +   40.575 * s,y +  -59.691 * s, threshold);
			_bez(x +   40.575 * s,y +  -59.691 * s,x +   37.125 * s,y +  -58.699 * s,x +   33.930 * s,y +  -57.250 * s,x +   31.005 * s,y +  -55.321 * s, threshold);
			_bez(x +   31.005 * s,y +  -55.321 * s,x +   26.182 * s,y +  -52.140 * s,x +   22.436 * s,y +  -48.005 * s,x +   19.751 * s,y +  -42.944 * s, threshold);
			_bez(x +   19.751 * s,y +  -42.944 * s,x +   17.065 * s,y +  -37.882 * s,x +   15.722 * s,y +  -32.405 * s,x +   15.722 * s,y +  -26.513 * s, threshold);
			_bez(x +   15.722 * s,y +  -26.513 * s,x +   15.722 * s,y +  -21.663 * s,x +   16.593 * s,y +  -17.114 * s,x +   18.335 * s,y +  -12.866 * s, threshold);
			_bez(x +   18.335 * s,y +  -12.866 * s,x +   20.076 * s,y +   -8.618 * s,x +   22.583 * s,y +   -4.858 * s,x +   25.878 * s,y +   -1.611 * s, threshold);
			_bez(x +   25.878 * s,y +   -1.611 * s,x +   29.125 * s,y +    1.587 * s,x +   32.869 * s,y +    4.012 * s,x +   37.084 * s,y +    5.688 * s, threshold);
			_bez(x +   37.084 * s,y +    5.688 * s,x +   41.300 * s,y +    7.365 * s,x +   45.800 * s,y +    8.203 * s,x +   50.585 * s,y +    8.203 * s, threshold);
			_bez(x +   50.585 * s,y +    8.203 * s,x +   54.687 * s,y +    8.203 * s,x +   58.788 * s,y +    7.438 * s,x +   62.890 * s,y +    5.908 * s, threshold);
			_bez(x +   62.890 * s,y +    5.908 * s,x +   66.991 * s,y +    4.378 * s,x +   70.490 * s,y +    2.311 * s,x +   73.387 * s,y +   -0.293 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   78.612 * s);
			_setf(o + ( 1 << 2), y +    7.617 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   78.612 * s,y +    7.617 * s,x +   74.543 * s,y +   10.775 * s,x +   70.108 * s,y +   13.192 * s,x +   65.307 * s,y +   14.868 * s, threshold);
			_bez(x +   65.307 * s,y +   14.868 * s,x +   60.505 * s,y +   16.544 * s,x +   55.631 * s,y +   17.383 * s,x +   50.683 * s,y +   17.383 * s, threshold);
			_bez(x +   50.683 * s,y +   17.383 * s,x +   44.661 * s,y +   17.383 * s,x +   38.980 * s,y +   16.316 * s,x +   33.642 * s,y +   14.184 * s, threshold);
			_bez(x +   33.642 * s,y +   14.184 * s,x +   28.304 * s,y +   12.052 * s,x +   23.551 * s,y +    8.952 * s,x +   19.384 * s,y +    4.883 * s, threshold);
			_bez(x +   19.384 * s,y +    4.883 * s,x +   15.218 * s,y +    0.814 * s,x +   12.044 * s,y +   -3.898 * s,x +    9.863 * s,y +   -9.253 * s, threshold);
			_bez(x +    9.863 * s,y +   -9.253 * s,x +    7.682 * s,y +  -14.608 * s,x +    6.592 * s,y +  -20.361 * s,x +    6.592 * s,y +  -26.513 * s, threshold);
			_bez(x +    6.592 * s,y +  -26.513 * s,x +    6.592 * s,y +  -32.438 * s,x +    7.698 * s,y +  -38.085 * s,x +    9.912 * s,y +  -43.456 * s, threshold);
			_bez(x +    9.912 * s,y +  -43.456 * s,x +   12.125 * s,y +  -48.827 * s,x +   15.275 * s,y +  -53.556 * s,x +   19.384 * s,y +  -57.616 * s, threshold);
			_bez(x +   19.384 * s,y +  -57.616 * s,x +   23.478 * s,y +  -61.661 * s,x +   28.263 * s,y +  -64.778 * s,x +   33.715 * s,y +  -66.991 * s, threshold);
			_bez(x +   33.715 * s,y +  -66.991 * s,x +   39.168 * s,y +  -69.205 * s,x +   44.823 * s,y +  -70.311 * s,x +   50.683 * s,y +  -70.311 * s, threshold);
			_bez(x +   50.683 * s,y +  -70.311 * s,x +   57.974 * s,y +  -70.311 * s,x +   64.599 * s,y +  -68.920 * s,x +   70.556 * s,y +  -66.137 * s, threshold);
			_bez(x +   70.556 * s,y +  -66.137 * s,x +   76.512 * s,y +  -63.354 * s,x +   81.491 * s,y +  -59.340 * s,x +   85.497 * s,y +  -54.101 * s, threshold);
			_bez(x +   85.497 * s,y +  -54.101 * s,x +   87.936 * s,y +  -50.910 * s,x +   89.785 * s,y +  -47.452 * s,x +   91.039 * s,y +  -43.725 * s, threshold);
			_bez(x +   91.039 * s,y +  -43.725 * s,x +   92.292 * s,y +  -39.998 * s,x +   92.919 * s,y +  -36.084 * s,x +   92.919 * s,y +  -31.982 * s, threshold);
			_bez(x +   92.919 * s,y +  -31.982 * s,x +   92.919 * s,y +  -23.160 * s,x +   90.265 * s,y +  -16.308 * s,x +   84.960 * s,y +  -11.426 * s, threshold);
			_bez(x +   84.960 * s,y +  -11.426 * s,x +   79.654 * s,y +   -6.543 * s,x +   72.167 * s,y +   -4.101 * s,x +   62.499 * s,y +   -4.101 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   60.595 * s);
			_setf(o + ( 1 << 2), y +   -4.101 * s);
			_setf(o + ( 2 << 2), x +   60.595 * s);
			_setf(o + ( 3 << 2), y +  -11.621 * s);
			_setf(o + ( 4 << 2), x +   99.998 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 65:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   53.418 * s);
			_setf(o + ( 1 << 2), y +  -13.281 * s);
			_setf(o + ( 2 << 2), x +   24.024 * s);
			_setf(o + ( 3 << 2), y +  -13.281 * s);
			_setf(o + ( 4 << 2), x +   19.385 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    0.489 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   27.490 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   49.902 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   76.904 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   58.007 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   53.418 * s);
			_setf(o + (17 << 2), y +  -13.281 * s);
			_setf(o + (18 << 2), x +   28.711 * s);
			_setf(o + (19 << 2), y +  -26.806 * s);
			_setf(o + (20 << 2), x +   48.681 * s);
			_setf(o + (21 << 2), y +  -26.806 * s);
			_setf(o + (22 << 2), x +   38.721 * s);
			_setf(o + (23 << 2), y +  -55.810 * s);
			_setf(o + (24 << 2), x +   28.711 * s);
			_setf(o + (25 << 2), y +  -26.806 * s);
			_setf(o + (26 << 2), x +   77.392 * s);
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
			_setf(o + ( 0 << 2), x +   38.378 * s);
			_setf(o + ( 1 << 2), y +  -44.677 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   38.378 * s,y +  -44.677 * s,x +   41.340 * s,y +  -44.677 * s,x +   43.586 * s,y +  -45.328 * s,x +   45.116 * s,y +  -46.630 * s, threshold);
			_bez(x +   45.116 * s,y +  -46.630 * s,x +   46.646 * s,y +  -47.932 * s,x +   47.411 * s,y +  -49.853 * s,x +   47.411 * s,y +  -52.392 * s, threshold);
			_bez(x +   47.411 * s,y +  -52.392 * s,x +   47.411 * s,y +  -54.898 * s,x +   46.646 * s,y +  -56.811 * s,x +   45.116 * s,y +  -58.129 * s, threshold);
			_bez(x +   45.116 * s,y +  -58.129 * s,x +   43.586 * s,y +  -59.447 * s,x +   41.340 * s,y +  -60.106 * s,x +   38.378 * s,y +  -60.106 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   27.978 * s);
			_setf(o + ( 1 << 2), y +  -60.106 * s);
			_setf(o + ( 2 << 2), x +   27.978 * s);
			_setf(o + ( 3 << 2), y +  -44.677 * s);
			_setf(o + ( 4 << 2), x +   38.378 * s);
			_setf(o + ( 5 << 2), y +  -44.677 * s);
			_setf(o + ( 6 << 2), x +   39.013 * s);
			_setf(o + ( 7 << 2), y +  -12.793 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			_bez(x +   39.013 * s,y +  -12.793 * s,x +   42.789 * s,y +  -12.793 * s,x +   45.629 * s,y +  -13.590 * s,x +   47.533 * s,y +  -15.185 * s, threshold);
			_bez(x +   47.533 * s,y +  -15.185 * s,x +   49.438 * s,y +  -16.780 * s,x +   50.390 * s,y +  -19.189 * s,x +   50.390 * s,y +  -22.412 * s, threshold);
			_bez(x +   50.390 * s,y +  -22.412 * s,x +   50.390 * s,y +  -25.569 * s,x +   49.446 * s,y +  -27.937 * s,x +   47.558 * s,y +  -29.516 * s, threshold);
			_bez(x +   47.558 * s,y +  -29.516 * s,x +   45.670 * s,y +  -31.095 * s,x +   42.821 * s,y +  -31.884 * s,x +   39.013 * s,y +  -31.884 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   27.978 * s);
			_setf(o + ( 1 << 2), y +  -31.884 * s);
			_setf(o + ( 2 << 2), x +   27.978 * s);
			_setf(o + ( 3 << 2), y +  -12.793 * s);
			_setf(o + ( 4 << 2), x +   39.013 * s);
			_setf(o + ( 5 << 2), y +  -12.793 * s);
			_setf(o + ( 6 << 2), x +   56.493 * s);
			_setf(o + ( 7 << 2), y +  -39.013 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			_bez(x +   56.493 * s,y +  -39.013 * s,x +   60.530 * s,y +  -37.841 * s,x +   63.654 * s,y +  -35.677 * s,x +   65.868 * s,y +  -32.519 * s, threshold);
			_bez(x +   65.868 * s,y +  -32.519 * s,x +   68.081 * s,y +  -29.362 * s,x +   69.188 * s,y +  -25.488 * s,x +   69.188 * s,y +  -20.898 * s, threshold);
			_bez(x +   69.188 * s,y +  -20.898 * s,x +   69.188 * s,y +  -13.867 * s,x +   66.812 * s,y +   -8.626 * s,x +   62.059 * s,y +   -5.176 * s, threshold);
			_bez(x +   62.059 * s,y +   -5.176 * s,x +   57.307 * s,y +   -1.725 * s,x +   50.080 * s,y +       0. * s,x +   40.380 * s,y +       0. * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    9.179 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    9.179 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   37.402 * s);
			_setf(o + ( 5 << 2), y +  -72.899 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   37.402 * s,y +  -72.899 * s,x +   47.525 * s,y +  -72.899 * s,x +   54.857 * s,y +  -71.369 * s,x +   59.398 * s,y +  -68.309 * s, threshold);
			_bez(x +   59.398 * s,y +  -68.309 * s,x +   63.939 * s,y +  -65.250 * s,x +   66.210 * s,y +  -60.351 * s,x +   66.210 * s,y +  -53.612 * s, threshold);
			_bez(x +   66.210 * s,y +  -53.612 * s,x +   66.210 * s,y +  -50.064 * s,x +   65.380 * s,y +  -47.045 * s,x +   63.720 * s,y +  -44.555 * s, threshold);
			_bez(x +   63.720 * s,y +  -44.555 * s,x +   62.059 * s,y +  -42.065 * s,x +   59.651 * s,y +  -40.217 * s,x +   56.493 * s,y +  -39.013 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   76.219 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 67:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   66.992 * s);
			_setf(o + ( 1 << 2), y +   -4.004 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   66.992 * s,y +   -4.004 * s,x +   63.541 * s,y +   -2.214 * s,x +   59.944 * s,y +   -0.863 * s,x +   56.201 * s,y +    0.049 * s, threshold);
			_bez(x +   56.201 * s,y +    0.049 * s,x +   52.457 * s,y +    0.960 * s,x +   48.551 * s,y +    1.416 * s,x +   44.482 * s,y +    1.416 * s, threshold);
			_bez(x +   44.482 * s,y +    1.416 * s,x +   32.341 * s,y +    1.416 * s,x +   22.721 * s,y +   -1.978 * s,x +   15.625 * s,y +   -8.765 * s, threshold);
			_bez(x +   15.625 * s,y +   -8.765 * s,x +    8.529 * s,y +  -15.551 * s,x +    4.981 * s,y +  -24.755 * s,x +    4.981 * s,y +  -36.376 * s, threshold);
			_bez(x +    4.981 * s,y +  -36.376 * s,x +    4.981 * s,y +  -48.030 * s,x +    8.529 * s,y +  -57.250 * s,x +   15.625 * s,y +  -64.037 * s, threshold);
			_bez(x +   15.625 * s,y +  -64.037 * s,x +   22.721 * s,y +  -70.824 * s,x +   32.341 * s,y +  -74.218 * s,x +   44.482 * s,y +  -74.218 * s, threshold);
			_bez(x +   44.482 * s,y +  -74.218 * s,x +   48.551 * s,y +  -74.218 * s,x +   52.457 * s,y +  -73.762 * s,x +   56.201 * s,y +  -72.850 * s, threshold);
			_bez(x +   56.201 * s,y +  -72.850 * s,x +   59.944 * s,y +  -71.939 * s,x +   63.541 * s,y +  -70.588 * s,x +   66.992 * s,y +  -68.798 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   66.992 * s);
			_setf(o + ( 1 << 2), y +  -53.710 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   66.992 * s,y +  -53.710 * s,x +   63.509 * s,y +  -56.086 * s,x +   60.074 * s,y +  -57.828 * s,x +   56.689 * s,y +  -58.935 * s, threshold);
			_bez(x +   56.689 * s,y +  -58.935 * s,x +   53.304 * s,y +  -60.041 * s,x +   49.739 * s,y +  -60.595 * s,x +   45.996 * s,y +  -60.595 * s, threshold);
			_bez(x +   45.996 * s,y +  -60.595 * s,x +   39.290 * s,y +  -60.595 * s,x +   34.017 * s,y +  -58.446 * s,x +   30.176 * s,y +  -54.150 * s, threshold);
			_bez(x +   30.176 * s,y +  -54.150 * s,x +   26.335 * s,y +  -49.853 * s,x +   24.414 * s,y +  -43.928 * s,x +   24.414 * s,y +  -36.376 * s, threshold);
			_bez(x +   24.414 * s,y +  -36.376 * s,x +   24.414 * s,y +  -28.857 * s,x +   26.335 * s,y +  -22.949 * s,x +   30.176 * s,y +  -18.652 * s, threshold);
			_bez(x +   30.176 * s,y +  -18.652 * s,x +   34.017 * s,y +  -14.355 * s,x +   39.290 * s,y +  -12.207 * s,x +   45.996 * s,y +  -12.207 * s, threshold);
			_bez(x +   45.996 * s,y +  -12.207 * s,x +   49.739 * s,y +  -12.207 * s,x +   53.304 * s,y +  -12.760 * s,x +   56.689 * s,y +  -13.867 * s, threshold);
			_bez(x +   56.689 * s,y +  -13.867 * s,x +   60.074 * s,y +  -14.974 * s,x +   63.509 * s,y +  -16.715 * s,x +   66.992 * s,y +  -19.091 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   66.992 * s);
			_setf(o + ( 1 << 2), y +   -4.004 * s);
			_setf(o + ( 2 << 2), x +   73.388 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 68:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   27.978 * s);
			_setf(o + ( 1 << 2), y +  -58.691 * s);
			_setf(o + ( 2 << 2), x +   27.978 * s);
			_setf(o + ( 3 << 2), y +  -14.209 * s);
			_setf(o + ( 4 << 2), x +   34.716 * s);
			_setf(o + ( 5 << 2), y +  -14.209 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   34.716 * s,y +  -14.209 * s,x +   42.398 * s,y +  -14.209 * s,x +   48.266 * s,y +  -16.113 * s,x +   52.318 * s,y +  -19.922 * s, threshold);
			_bez(x +   52.318 * s,y +  -19.922 * s,x +   56.371 * s,y +  -23.730 * s,x +   58.397 * s,y +  -29.264 * s,x +   58.397 * s,y +  -36.523 * s, threshold);
			_bez(x +   58.397 * s,y +  -36.523 * s,x +   58.397 * s,y +  -43.750 * s,x +   56.379 * s,y +  -49.251 * s,x +   52.343 * s,y +  -53.027 * s, threshold);
			_bez(x +   52.343 * s,y +  -53.027 * s,x +   48.306 * s,y +  -56.803 * s,x +   42.431 * s,y +  -58.691 * s,x +   34.716 * s,y +  -58.691 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   27.978 * s);
			_setf(o + ( 1 << 2), y +  -58.691 * s);
			_setf(o + ( 2 << 2), x +    9.179 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   29.003 * s);
			_setf(o + ( 5 << 2), y +  -72.899 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_setb(o +  2, 2);
			_bez(x +   29.003 * s,y +  -72.899 * s,x +   40.070 * s,y +  -72.899 * s,x +   48.315 * s,y +  -72.110 * s,x +   53.734 * s,y +  -70.531 * s, threshold);
			_bez(x +   53.734 * s,y +  -70.531 * s,x +   59.154 * s,y +  -68.952 * s,x +   63.789 * s,y +  -66.263 * s,x +   67.675 * s,y +  -62.499 * s, threshold);
			_bez(x +   67.675 * s,y +  -62.499 * s,x +   71.081 * s,y +  -59.199 * s,x +   73.632 * s,y +  -55.419 * s,x +   75.292 * s,y +  -51.122 * s, threshold);
			_bez(x +   75.292 * s,y +  -51.122 * s,x +   76.952 * s,y +  -46.825 * s,x +   77.782 * s,y +  -41.959 * s,x +   77.782 * s,y +  -36.523 * s, threshold);
			_bez(x +   77.782 * s,y +  -36.523 * s,x +   77.782 * s,y +  -31.022 * s,x +   76.952 * s,y +  -26.115 * s,x +   75.292 * s,y +  -21.801 * s, threshold);
			_bez(x +   75.292 * s,y +  -21.801 * s,x +   73.632 * s,y +  -17.488 * s,x +   71.088 * s,y +  -13.692 * s,x +   67.675 * s,y +  -10.400 * s, threshold);
			_bez(x +   67.675 * s,y +  -10.400 * s,x +   63.764 * s,y +   -6.629 * s,x +   59.081 * s,y +   -3.947 * s,x +   53.612 * s,y +   -2.368 * s, threshold);
			_bez(x +   53.612 * s,y +   -2.368 * s,x +   48.144 * s,y +   -0.789 * s,x +   39.941 * s,y +       0. * s,x +   29.003 * s,y +       0. * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    9.179 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    9.179 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   83.006 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 69:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +    9.180 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   59.912 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   59.912 * s);
			_setf(o + ( 5 << 2), y +  -58.691 * s);
			_setf(o + ( 6 << 2), x +   27.979 * s);
			_setf(o + ( 7 << 2), y +  -58.691 * s);
			_setf(o + ( 8 << 2), x +   27.979 * s);
			_setf(o + ( 9 << 2), y +  -45.116 * s);
			_setf(o + (10 << 2), x +   58.007 * s);
			_setf(o + (11 << 2), y +  -45.116 * s);
			_setf(o + (12 << 2), x +   58.007 * s);
			_setf(o + (13 << 2), y +  -30.908 * s);
			_setf(o + (14 << 2), x +   27.979 * s);
			_setf(o + (15 << 2), y +  -30.908 * s);
			_setf(o + (16 << 2), x +   27.979 * s);
			_setf(o + (17 << 2), y +  -14.209 * s);
			_setf(o + (18 << 2), x +   60.986 * s);
			_setf(o + (19 << 2), y +  -14.209 * s);
			_setf(o + (20 << 2), x +   60.986 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +    9.180 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +    9.180 * s);
			_setf(o + (25 << 2), y +  -72.899 * s);
			_setf(o + (26 << 2), x +   68.310 * s);
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
			_setf(o + ( 0 << 2), x +    9.179 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   59.911 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   59.911 * s);
			_setf(o + ( 5 << 2), y +  -58.691 * s);
			_setf(o + ( 6 << 2), x +   27.978 * s);
			_setf(o + ( 7 << 2), y +  -58.691 * s);
			_setf(o + ( 8 << 2), x +   27.978 * s);
			_setf(o + ( 9 << 2), y +  -45.116 * s);
			_setf(o + (10 << 2), x +   58.007 * s);
			_setf(o + (11 << 2), y +  -45.116 * s);
			_setf(o + (12 << 2), x +   58.007 * s);
			_setf(o + (13 << 2), y +  -30.908 * s);
			_setf(o + (14 << 2), x +   27.978 * s);
			_setf(o + (15 << 2), y +  -30.908 * s);
			_setf(o + (16 << 2), x +   27.978 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +    9.179 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +    9.179 * s);
			_setf(o + (21 << 2), y +  -72.899 * s);
			_setf(o + (22 << 2), x +   68.309 * s);
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
			_setf(o + ( 0 << 2), x +   74.705 * s);
			_setf(o + ( 1 << 2), y +   -5.420 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   74.705 * s,y +   -5.420 * s,x +   70.019 * s,y +   -3.141 * s,x +   65.152 * s,y +   -1.432 * s,x +   60.106 * s,y +   -0.293 * s, threshold);
			_bez(x +   60.106 * s,y +   -0.293 * s,x +   55.060 * s,y +    0.846 * s,x +   49.852 * s,y +    1.416 * s,x +   44.482 * s,y +    1.416 * s, threshold);
			_bez(x +   44.482 * s,y +    1.416 * s,x +   32.340 * s,y +    1.416 * s,x +   22.720 * s,y +   -1.978 * s,x +   15.625 * s,y +   -8.765 * s, threshold);
			_bez(x +   15.625 * s,y +   -8.765 * s,x +    8.528 * s,y +  -15.551 * s,x +    4.980 * s,y +  -24.755 * s,x +    4.980 * s,y +  -36.376 * s, threshold);
			_bez(x +    4.980 * s,y +  -36.376 * s,x +    4.980 * s,y +  -48.127 * s,x +    8.594 * s,y +  -57.372 * s,x +   15.820 * s,y +  -64.110 * s, threshold);
			_bez(x +   15.820 * s,y +  -64.110 * s,x +   23.046 * s,y +  -70.849 * s,x +   32.942 * s,y +  -74.218 * s,x +   45.508 * s,y +  -74.218 * s, threshold);
			_bez(x +   45.508 * s,y +  -74.218 * s,x +   50.357 * s,y +  -74.218 * s,x +   55.004 * s,y +  -73.762 * s,x +   59.447 * s,y +  -72.850 * s, threshold);
			_bez(x +   59.447 * s,y +  -72.850 * s,x +   63.890 * s,y +  -71.939 * s,x +   68.082 * s,y +  -70.588 * s,x +   72.021 * s,y +  -68.798 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   72.021 * s);
			_setf(o + ( 1 << 2), y +  -53.710 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   72.021 * s,y +  -53.710 * s,x +   67.951 * s,y +  -56.021 * s,x +   63.906 * s,y +  -57.747 * s,x +   59.886 * s,y +  -58.886 * s, threshold);
			_bez(x +   59.886 * s,y +  -58.886 * s,x +   55.866 * s,y +  -60.025 * s,x +   51.838 * s,y +  -60.595 * s,x +   47.801 * s,y +  -60.595 * s, threshold);
			_bez(x +   47.801 * s,y +  -60.595 * s,x +   40.315 * s,y +  -60.595 * s,x +   34.545 * s,y +  -58.503 * s,x +   30.492 * s,y +  -54.320 * s, threshold);
			_bez(x +   30.492 * s,y +  -54.320 * s,x +   26.440 * s,y +  -50.138 * s,x +   24.413 * s,y +  -44.156 * s,x +   24.413 * s,y +  -36.376 * s, threshold);
			_bez(x +   24.413 * s,y +  -36.376 * s,x +   24.413 * s,y +  -28.662 * s,x +   26.366 * s,y +  -22.705 * s,x +   30.272 * s,y +  -18.506 * s, threshold);
			_bez(x +   30.272 * s,y +  -18.506 * s,x +   34.179 * s,y +  -14.306 * s,x +   39.729 * s,y +  -12.207 * s,x +   46.923 * s,y +  -12.207 * s, threshold);
			_bez(x +   46.923 * s,y +  -12.207 * s,x +   48.876 * s,y +  -12.207 * s,x +   50.690 * s,y +  -12.329 * s,x +   52.367 * s,y +  -12.573 * s, threshold);
			_bez(x +   52.367 * s,y +  -12.573 * s,x +   54.043 * s,y +  -12.817 * s,x +   55.549 * s,y +  -13.200 * s,x +   56.883 * s,y +  -13.720 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   56.883 * s);
			_setf(o + ( 1 << 2), y +  -27.880 * s);
			_setf(o + ( 2 << 2), x +   45.410 * s);
			_setf(o + ( 3 << 2), y +  -27.880 * s);
			_setf(o + ( 4 << 2), x +   45.410 * s);
			_setf(o + ( 5 << 2), y +  -40.478 * s);
			_setf(o + ( 6 << 2), x +   74.705 * s);
			_setf(o + ( 7 << 2), y +  -40.478 * s);
			_setf(o + ( 8 << 2), x +   74.705 * s);
			_setf(o + ( 9 << 2), y +   -5.420 * s);
			_setf(o + (10 << 2), x +   82.079 * s);
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
			_setf(o + ( 0 << 2), x +    9.180 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   27.978 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   27.978 * s);
			_setf(o + ( 5 << 2), y +  -45.116 * s);
			_setf(o + ( 6 << 2), x +   55.712 * s);
			_setf(o + ( 7 << 2), y +  -45.116 * s);
			_setf(o + ( 8 << 2), x +   55.712 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   74.511 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   74.511 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   55.712 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   55.712 * s);
			_setf(o + (17 << 2), y +  -30.908 * s);
			_setf(o + (18 << 2), x +   27.978 * s);
			_setf(o + (19 << 2), y +  -30.908 * s);
			_setf(o + (20 << 2), x +   27.978 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +    9.180 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +    9.180 * s);
			_setf(o + (25 << 2), y +  -72.899 * s);
			_setf(o + (26 << 2), x +   83.690 * s);
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
			_setf(o + ( 0 << 2), x +    9.180 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   27.979 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   27.979 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    9.180 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    9.180 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   37.207 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 74:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    9.179 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   27.978 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   27.978 * s);
			_setf(o + ( 5 << 2), y +   -7.080 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   27.978 * s,y +   -7.080 * s,x +   27.978 * s,y +    2.002 * s,x +   25.512 * s,y +    8.789 * s,x +   20.581 * s,y +   13.281 * s, threshold);
			_bez(x +   20.581 * s,y +   13.281 * s,x +   15.649 * s,y +   17.773 * s,x +    8.186 * s,y +   20.019 * s,x +   -1.807 * s,y +   20.019 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   -5.615 * s);
			_setf(o + ( 1 << 2), y +   20.019 * s);
			_setf(o + ( 2 << 2), x +   -5.615 * s);
			_setf(o + ( 3 << 2), y +    5.810 * s);
			_setf(o + ( 4 << 2), x +   -2.686 * s);
			_setf(o + ( 5 << 2), y +    5.810 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   -2.686 * s,y +    5.810 * s,x +    1.221 * s,y +    5.810 * s,x +    4.175 * s,y +    4.720 * s,x +    6.177 * s,y +    2.539 * s, threshold);
			_bez(x +    6.177 * s,y +    2.539 * s,x +    8.178 * s,y +    0.358 * s,x +    9.179 * s,y +   -2.848 * s,x +    9.179 * s,y +   -7.080 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    9.179 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   37.206 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 75:
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +    9.180 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   27.978 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   27.978 * s);
			_setf(o + ( 5 << 2), y +  -46.288 * s);
			_setf(o + ( 6 << 2), x +   55.078 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   76.903 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   41.797 * s);
			_setf(o + (11 << 2), y +  -38.378 * s);
			_setf(o + (12 << 2), x +   80.517 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   56.982 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   27.978 * s);
			_setf(o + (17 << 2), y +  -28.710 * s);
			_setf(o + (18 << 2), x +   27.978 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +    9.180 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +    9.180 * s);
			_setf(o + (23 << 2), y +  -72.899 * s);
			_setf(o + (24 << 2), x +   77.489 * s);
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
			
			case 76:
			
			o = _posf(16);
			_setf(o + ( 0 << 2), x +    9.180 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   27.978 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   27.978 * s);
			_setf(o + ( 5 << 2), y +  -14.209 * s);
			_setf(o + ( 6 << 2), x +   60.986 * s);
			_setf(o + ( 7 << 2), y +  -14.209 * s);
			_setf(o + ( 8 << 2), x +   60.986 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +    9.180 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    9.180 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   63.720 * s);
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
			_setf(o + ( 0 << 2), x +    9.179 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   33.105 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   49.706 * s);
			_setf(o + ( 5 << 2), y +  -33.886 * s);
			_setf(o + ( 6 << 2), x +   66.405 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   90.282 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   90.282 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   72.509 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   72.509 * s);
			_setf(o + (15 << 2), y +  -53.319 * s);
			_setf(o + (16 << 2), x +   55.712 * s);
			_setf(o + (17 << 2), y +  -14.013 * s);
			_setf(o + (18 << 2), x +   43.798 * s);
			_setf(o + (19 << 2), y +  -14.013 * s);
			_setf(o + (20 << 2), x +   27.001 * s);
			_setf(o + (21 << 2), y +  -53.319 * s);
			_setf(o + (22 << 2), x +   27.001 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +    9.179 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +    9.179 * s);
			_setf(o + (27 << 2), y +  -72.899 * s);
			_setf(o + (28 << 2), x +   99.510 * s);
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
			_setf(o + ( 0 << 2), x +    9.180 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   30.176 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   56.689 * s);
			_setf(o + ( 5 << 2), y +  -22.900 * s);
			_setf(o + ( 6 << 2), x +   56.689 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   74.511 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   74.511 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   53.515 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   27.002 * s);
			_setf(o + (15 << 2), y +  -49.999 * s);
			_setf(o + (16 << 2), x +   27.002 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +    9.180 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +    9.180 * s);
			_setf(o + (21 << 2), y +  -72.899 * s);
			_setf(o + (22 << 2), x +   83.690 * s);
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
			_setf(o + ( 0 << 2), x +   42.480 * s);
			_setf(o + ( 1 << 2), y +  -60.595 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   42.480 * s,y +  -60.595 * s,x +   36.751 * s,y +  -60.595 * s,x +   32.308 * s,y +  -58.479 * s,x +   29.150 * s,y +  -54.247 * s, threshold);
			_bez(x +   29.150 * s,y +  -54.247 * s,x +   25.993 * s,y +  -50.015 * s,x +   24.414 * s,y +  -44.058 * s,x +   24.414 * s,y +  -36.376 * s, threshold);
			_bez(x +   24.414 * s,y +  -36.376 * s,x +   24.414 * s,y +  -28.727 * s,x +   25.993 * s,y +  -22.786 * s,x +   29.150 * s,y +  -18.554 * s, threshold);
			_bez(x +   29.150 * s,y +  -18.554 * s,x +   32.308 * s,y +  -14.323 * s,x +   36.751 * s,y +  -12.207 * s,x +   42.480 * s,y +  -12.207 * s, threshold);
			_bez(x +   42.480 * s,y +  -12.207 * s,x +   48.242 * s,y +  -12.207 * s,x +   52.701 * s,y +  -14.323 * s,x +   55.859 * s,y +  -18.554 * s, threshold);
			_bez(x +   55.859 * s,y +  -18.554 * s,x +   59.016 * s,y +  -22.786 * s,x +   60.595 * s,y +  -28.727 * s,x +   60.595 * s,y +  -36.376 * s, threshold);
			_bez(x +   60.595 * s,y +  -36.376 * s,x +   60.595 * s,y +  -44.058 * s,x +   59.016 * s,y +  -50.015 * s,x +   55.859 * s,y +  -54.247 * s, threshold);
			_bez(x +   55.859 * s,y +  -54.247 * s,x +   52.701 * s,y +  -58.479 * s,x +   48.242 * s,y +  -60.595 * s,x +   42.480 * s,y +  -60.595 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   42.480 * s);
			_setf(o + ( 1 << 2), y +  -74.218 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   42.480 * s,y +  -74.218 * s,x +   54.199 * s,y +  -74.218 * s,x +   63.378 * s,y +  -70.865 * s,x +   70.019 * s,y +  -64.159 * s, threshold);
			_bez(x +   70.019 * s,y +  -64.159 * s,x +   76.659 * s,y +  -57.453 * s,x +   79.980 * s,y +  -48.193 * s,x +   79.980 * s,y +  -36.376 * s, threshold);
			_bez(x +   79.980 * s,y +  -36.376 * s,x +   79.980 * s,y +  -24.593 * s,x +   76.659 * s,y +  -15.348 * s,x +   70.019 * s,y +   -8.642 * s, threshold);
			_bez(x +   70.019 * s,y +   -8.642 * s,x +   63.378 * s,y +   -1.937 * s,x +   54.199 * s,y +    1.416 * s,x +   42.480 * s,y +    1.416 * s, threshold);
			_bez(x +   42.480 * s,y +    1.416 * s,x +   30.794 * s,y +    1.416 * s,x +   21.623 * s,y +   -1.937 * s,x +   14.966 * s,y +   -8.642 * s, threshold);
			_bez(x +   14.966 * s,y +   -8.642 * s,x +    8.309 * s,y +  -15.348 * s,x +    4.981 * s,y +  -24.593 * s,x +    4.981 * s,y +  -36.376 * s, threshold);
			_bez(x +    4.981 * s,y +  -36.376 * s,x +    4.981 * s,y +  -48.193 * s,x +    8.309 * s,y +  -57.453 * s,x +   14.966 * s,y +  -64.159 * s, threshold);
			_bez(x +   14.966 * s,y +  -64.159 * s,x +   21.623 * s,y +  -70.865 * s,x +   30.794 * s,y +  -74.218 * s,x +   42.480 * s,y +  -74.218 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   85.009 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 80:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    9.179 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   40.380 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   40.380 * s,y +  -72.899 * s,x +   49.657 * s,y +  -72.899 * s,x +   56.778 * s,y +  -70.840 * s,x +   61.742 * s,y +  -66.723 * s, threshold);
			_bez(x +   61.742 * s,y +  -66.723 * s,x +   66.706 * s,y +  -62.605 * s,x +   69.188 * s,y +  -56.738 * s,x +   69.188 * s,y +  -49.120 * s, threshold);
			_bez(x +   69.188 * s,y +  -49.120 * s,x +   69.188 * s,y +  -41.471 * s,x +   66.706 * s,y +  -35.587 * s,x +   61.742 * s,y +  -31.469 * s, threshold);
			_bez(x +   61.742 * s,y +  -31.469 * s,x +   56.778 * s,y +  -27.351 * s,x +   49.657 * s,y +  -25.293 * s,x +   40.380 * s,y +  -25.293 * s, threshold);
			o = _posf(14);
			_setf(o + ( 0 << 2), x +   27.978 * s);
			_setf(o + ( 1 << 2), y +  -25.293 * s);
			_setf(o + ( 2 << 2), x +   27.978 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    9.179 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    9.179 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   27.978 * s);
			_setf(o + ( 9 << 2), y +  -59.276 * s);
			_setf(o + (10 << 2), x +   27.978 * s);
			_setf(o + (11 << 2), y +  -38.915 * s);
			_setf(o + (12 << 2), x +   38.378 * s);
			_setf(o + (13 << 2), y +  -38.915 * s);
			o = _posb(7);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 1);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_bez(x +   38.378 * s,y +  -38.915 * s,x +   42.024 * s,y +  -38.915 * s,x +   44.840 * s,y +  -39.802 * s,x +   46.825 * s,y +  -41.576 * s, threshold);
			_bez(x +   46.825 * s,y +  -41.576 * s,x +   48.811 * s,y +  -43.351 * s,x +   49.804 * s,y +  -45.865 * s,x +   49.804 * s,y +  -49.120 * s, threshold);
			_bez(x +   49.804 * s,y +  -49.120 * s,x +   49.804 * s,y +  -52.375 * s,x +   48.811 * s,y +  -54.882 * s,x +   46.825 * s,y +  -56.640 * s, threshold);
			_bez(x +   46.825 * s,y +  -56.640 * s,x +   44.840 * s,y +  -58.397 * s,x +   42.024 * s,y +  -59.276 * s,x +   38.378 * s,y +  -59.276 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   27.978 * s);
			_setf(o + ( 1 << 2), y +  -59.276 * s);
			_setf(o + ( 2 << 2), x +   73.290 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 81:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   44.481 * s);
			_setf(o + ( 1 << 2), y +    1.318 * s);
			_setf(o + ( 2 << 2), x +   43.017 * s);
			_setf(o + ( 3 << 2), y +    1.318 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   43.017 * s,y +    1.318 * s,x +   31.005 * s,y +    1.318 * s,x +   21.663 * s,y +   -2.002 * s,x +   14.990 * s,y +   -8.642 * s, threshold);
			_bez(x +   14.990 * s,y +   -8.642 * s,x +    8.317 * s,y +  -15.283 * s,x +    4.980 * s,y +  -24.528 * s,x +    4.980 * s,y +  -36.376 * s, threshold);
			_bez(x +    4.980 * s,y +  -36.376 * s,x +    4.980 * s,y +  -48.193 * s,x +    8.308 * s,y +  -57.453 * s,x +   14.965 * s,y +  -64.159 * s, threshold);
			_bez(x +   14.965 * s,y +  -64.159 * s,x +   21.622 * s,y +  -70.865 * s,x +   30.793 * s,y +  -74.218 * s,x +   42.479 * s,y +  -74.218 * s, threshold);
			_bez(x +   42.479 * s,y +  -74.218 * s,x +   54.296 * s,y +  -74.218 * s,x +   63.500 * s,y +  -70.897 * s,x +   70.091 * s,y +  -64.257 * s, threshold);
			_bez(x +   70.091 * s,y +  -64.257 * s,x +   76.683 * s,y +  -57.616 * s,x +   79.979 * s,y +  -48.323 * s,x +   79.979 * s,y +  -36.376 * s, threshold);
			_bez(x +   79.979 * s,y +  -36.376 * s,x +   79.979 * s,y +  -28.173 * s,x +   78.229 * s,y +  -21.110 * s,x +   74.730 * s,y +  -15.185 * s, threshold);
			_bez(x +   74.730 * s,y +  -15.185 * s,x +   71.231 * s,y +   -9.261 * s,x +   66.193 * s,y +   -4.801 * s,x +   59.618 * s,y +   -1.807 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   74.315 * s);
			_setf(o + ( 1 << 2), y +   14.599 * s);
			_setf(o + ( 2 << 2), x +   56.395 * s);
			_setf(o + ( 3 << 2), y +   14.599 * s);
			_setf(o + ( 4 << 2), x +   44.481 * s);
			_setf(o + ( 5 << 2), y +    1.318 * s);
			_setf(o + ( 6 << 2), x +   42.479 * s);
			_setf(o + ( 7 << 2), y +  -60.595 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			_bez(x +   42.479 * s,y +  -60.595 * s,x +   36.751 * s,y +  -60.595 * s,x +   32.307 * s,y +  -58.479 * s,x +   29.150 * s,y +  -54.247 * s, threshold);
			_bez(x +   29.150 * s,y +  -54.247 * s,x +   25.992 * s,y +  -50.015 * s,x +   24.413 * s,y +  -44.058 * s,x +   24.413 * s,y +  -36.376 * s, threshold);
			_bez(x +   24.413 * s,y +  -36.376 * s,x +   24.413 * s,y +  -28.564 * s,x +   25.960 * s,y +  -22.583 * s,x +   29.052 * s,y +  -18.432 * s, threshold);
			_bez(x +   29.052 * s,y +  -18.432 * s,x +   32.144 * s,y +  -14.282 * s,x +   36.620 * s,y +  -12.207 * s,x +   42.479 * s,y +  -12.207 * s, threshold);
			_bez(x +   42.479 * s,y +  -12.207 * s,x +   48.241 * s,y +  -12.207 * s,x +   52.701 * s,y +  -14.323 * s,x +   55.858 * s,y +  -18.554 * s, threshold);
			_bez(x +   55.858 * s,y +  -18.554 * s,x +   59.016 * s,y +  -22.786 * s,x +   60.594 * s,y +  -28.727 * s,x +   60.594 * s,y +  -36.376 * s, threshold);
			_bez(x +   60.594 * s,y +  -36.376 * s,x +   60.594 * s,y +  -44.058 * s,x +   59.016 * s,y +  -50.015 * s,x +   55.858 * s,y +  -54.247 * s, threshold);
			_bez(x +   55.858 * s,y +  -54.247 * s,x +   52.701 * s,y +  -58.479 * s,x +   48.241 * s,y +  -60.595 * s,x +   42.479 * s,y +  -60.595 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   85.008 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 82:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   35.888 * s);
			_setf(o + ( 1 << 2), y +  -40.575 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   35.888 * s,y +  -40.575 * s,x +   39.827 * s,y +  -40.575 * s,x +   42.651 * s,y +  -41.308 * s,x +   44.360 * s,y +  -42.773 * s, threshold);
			_bez(x +   44.360 * s,y +  -42.773 * s,x +   46.069 * s,y +  -44.238 * s,x +   46.923 * s,y +  -46.646 * s,x +   46.923 * s,y +  -49.999 * s, threshold);
			_bez(x +   46.923 * s,y +  -49.999 * s,x +   46.923 * s,y +  -53.319 * s,x +   46.069 * s,y +  -55.696 * s,x +   44.360 * s,y +  -57.128 * s, threshold);
			_bez(x +   44.360 * s,y +  -57.128 * s,x +   42.651 * s,y +  -58.560 * s,x +   39.827 * s,y +  -59.276 * s,x +   35.888 * s,y +  -59.276 * s, threshold);
			o = _posf(16);
			_setf(o + ( 0 << 2), x +   27.978 * s);
			_setf(o + ( 1 << 2), y +  -59.276 * s);
			_setf(o + ( 2 << 2), x +   27.978 * s);
			_setf(o + ( 3 << 2), y +  -40.575 * s);
			_setf(o + ( 4 << 2), x +   35.888 * s);
			_setf(o + ( 5 << 2), y +  -40.575 * s);
			_setf(o + ( 6 << 2), x +   27.978 * s);
			_setf(o + ( 7 << 2), y +  -27.587 * s);
			_setf(o + ( 8 << 2), x +   27.978 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +    9.180 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    9.180 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   37.890 * s);
			_setf(o + (15 << 2), y +  -72.899 * s);
			o = _posb(8);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_bez(x +   37.890 * s,y +  -72.899 * s,x +   47.492 * s,y +  -72.899 * s,x +   54.532 * s,y +  -71.288 * s,x +   59.008 * s,y +  -68.065 * s, threshold);
			_bez(x +   59.008 * s,y +  -68.065 * s,x +   63.484 * s,y +  -64.843 * s,x +   65.722 * s,y +  -59.748 * s,x +   65.722 * s,y +  -52.782 * s, threshold);
			_bez(x +   65.722 * s,y +  -52.782 * s,x +   65.722 * s,y +  -47.965 * s,x +   64.558 * s,y +  -44.010 * s,x +   62.231 * s,y +  -40.917 * s, threshold);
			_bez(x +   62.231 * s,y +  -40.917 * s,x +   59.903 * s,y +  -37.825 * s,x +   56.396 * s,y +  -35.546 * s,x +   51.708 * s,y +  -34.081 * s, threshold);
			_bez(x +   51.708 * s,y +  -34.081 * s,x +   54.280 * s,y +  -33.496 * s,x +   56.583 * s,y +  -32.169 * s,x +   58.617 * s,y +  -30.102 * s, threshold);
			_bez(x +   58.617 * s,y +  -30.102 * s,x +   60.652 * s,y +  -28.035 * s,x +   62.721 * s,y +  -24.907 * s,x +   64.794 * s,y +  -20.703 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   74.999 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   54.980 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   46.093 * s);
			_setf(o + ( 5 << 2), y +  -18.115 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   46.093 * s,y +  -18.115 * s,x +   44.304 * s,y +  -21.761 * s,x +   42.488 * s,y +  -24.251 * s,x +   40.649 * s,y +  -25.585 * s, threshold);
			_bez(x +   40.649 * s,y +  -25.585 * s,x +   38.810 * s,y +  -26.920 * s,x +   36.360 * s,y +  -27.587 * s,x +   33.300 * s,y +  -27.587 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   27.978 * s);
			_setf(o + ( 1 << 2), y +  -27.587 * s);
			_setf(o + ( 2 << 2), x +   77.001 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 83:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   59.911 * s);
			_setf(o + ( 1 << 2), y +  -70.604 * s);
			_setf(o + ( 2 << 2), x +   59.911 * s);
			_setf(o + ( 3 << 2), y +  -55.175 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   59.911 * s,y +  -55.175 * s,x +   55.907 * s,y +  -56.965 * s,x +   52.001 * s,y +  -58.316 * s,x +   48.193 * s,y +  -59.228 * s, threshold);
			_bez(x +   48.193 * s,y +  -59.228 * s,x +   44.384 * s,y +  -60.139 * s,x +   40.787 * s,y +  -60.595 * s,x +   37.402 * s,y +  -60.595 * s, threshold);
			_bez(x +   37.402 * s,y +  -60.595 * s,x +   32.909 * s,y +  -60.595 * s,x +   29.589 * s,y +  -59.976 * s,x +   27.441 * s,y +  -58.739 * s, threshold);
			_bez(x +   27.441 * s,y +  -58.739 * s,x +   25.293 * s,y +  -57.502 * s,x +   24.218 * s,y +  -55.582 * s,x +   24.218 * s,y +  -52.978 * s, threshold);
			_bez(x +   24.218 * s,y +  -52.978 * s,x +   24.218 * s,y +  -51.024 * s,x +   24.943 * s,y +  -49.503 * s,x +   26.391 * s,y +  -48.412 * s, threshold);
			_bez(x +   26.391 * s,y +  -48.412 * s,x +   27.840 * s,y +  -47.322 * s,x +   30.465 * s,y +  -46.372 * s,x +   34.277 * s,y +  -45.605 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   42.284 * s);
			_setf(o + ( 1 << 2), y +  -43.993 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   42.284 * s,y +  -43.993 * s,x +   50.389 * s,y +  -42.363 * s,x +   56.151 * s,y +  -39.892 * s,x +   59.569 * s,y +  -36.572 * s, threshold);
			_bez(x +   59.569 * s,y +  -36.572 * s,x +   62.987 * s,y +  -33.251 * s,x +   64.696 * s,y +  -28.531 * s,x +   64.696 * s,y +  -22.412 * s, threshold);
			_bez(x +   64.696 * s,y +  -22.412 * s,x +   64.696 * s,y +  -14.372 * s,x +   62.312 * s,y +   -8.390 * s,x +   57.543 * s,y +   -4.468 * s, threshold);
			_bez(x +   57.543 * s,y +   -4.468 * s,x +   52.774 * s,y +   -0.545 * s,x +   45.490 * s,y +    1.416 * s,x +   35.693 * s,y +    1.416 * s, threshold);
			_bez(x +   35.693 * s,y +    1.416 * s,x +   31.070 * s,y +    1.416 * s,x +   26.432 * s,y +    0.977 * s,x +   21.777 * s,y +    0.098 * s, threshold);
			_bez(x +   21.777 * s,y +    0.098 * s,x +   17.122 * s,y +   -0.781 * s,x +   12.467 * s,y +   -2.083 * s,x +    7.812 * s,y +   -3.808 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    7.812 * s);
			_setf(o + ( 1 << 2), y +  -19.677 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    7.812 * s,y +  -19.677 * s,x +   12.467 * s,y +  -17.203 * s,x +   16.967 * s,y +  -15.340 * s,x +   21.313 * s,y +  -14.087 * s, threshold);
			_bez(x +   21.313 * s,y +  -14.087 * s,x +   25.659 * s,y +  -12.833 * s,x +   29.850 * s,y +  -12.207 * s,x +   33.886 * s,y +  -12.207 * s, threshold);
			_bez(x +   33.886 * s,y +  -12.207 * s,x +   37.988 * s,y +  -12.207 * s,x +   41.129 * s,y +  -12.890 * s,x +   43.310 * s,y +  -14.258 * s, threshold);
			_bez(x +   43.310 * s,y +  -14.258 * s,x +   45.491 * s,y +  -15.625 * s,x +   46.581 * s,y +  -17.578 * s,x +   46.581 * s,y +  -20.117 * s, threshold);
			_bez(x +   46.581 * s,y +  -20.117 * s,x +   46.581 * s,y +  -22.395 * s,x +   45.841 * s,y +  -24.153 * s,x +   44.360 * s,y +  -25.390 * s, threshold);
			_bez(x +   44.360 * s,y +  -25.390 * s,x +   42.879 * s,y +  -26.627 * s,x +   39.924 * s,y +  -27.730 * s,x +   35.497 * s,y +  -28.710 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   28.222 * s);
			_setf(o + ( 1 << 2), y +  -30.322 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   28.222 * s,y +  -30.322 * s,x +   20.942 * s,y +  -31.934 * s,x +   15.600 * s,y +  -34.374 * s,x +   12.231 * s,y +  -37.792 * s, threshold);
			_bez(x +   12.231 * s,y +  -37.792 * s,x +    8.862 * s,y +  -41.210 * s,x +    7.178 * s,y +  -45.816 * s,x +    7.178 * s,y +  -51.610 * s, threshold);
			_bez(x +    7.178 * s,y +  -51.610 * s,x +    7.178 * s,y +  -58.869 * s,x +    9.521 * s,y +  -64.452 * s,x +   14.209 * s,y +  -68.358 * s, threshold);
			_bez(x +   14.209 * s,y +  -68.358 * s,x +   18.896 * s,y +  -72.265 * s,x +   25.634 * s,y +  -74.218 * s,x +   34.423 * s,y +  -74.218 * s, threshold);
			_bez(x +   34.423 * s,y +  -74.218 * s,x +   38.427 * s,y +  -74.218 * s,x +   42.545 * s,y +  -73.916 * s,x +   46.777 * s,y +  -73.314 * s, threshold);
			_bez(x +   46.777 * s,y +  -73.314 * s,x +   51.008 * s,y +  -72.712 * s,x +   55.386 * s,y +  -71.809 * s,x +   59.911 * s,y +  -70.604 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   72.020 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 84:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +    0.488 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   67.675 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   67.675 * s);
			_setf(o + ( 5 << 2), y +  -58.690 * s);
			_setf(o + ( 6 << 2), x +   43.506 * s);
			_setf(o + ( 7 << 2), y +  -58.690 * s);
			_setf(o + ( 8 << 2), x +   43.506 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   24.707 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   24.707 * s);
			_setf(o + (13 << 2), y +  -58.690 * s);
			_setf(o + (14 << 2), x +    0.488 * s);
			_setf(o + (15 << 2), y +  -58.690 * s);
			_setf(o + (16 << 2), x +    0.488 * s);
			_setf(o + (17 << 2), y +  -72.899 * s);
			_setf(o + (18 << 2), x +   68.212 * s);
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
			_setf(o + ( 0 << 2), x +    9.180 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   27.978 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   27.978 * s);
			_setf(o + ( 5 << 2), y +  -29.199 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   27.978 * s,y +  -29.199 * s,x +   27.978 * s,y +  -23.177 * s,x +   28.963 * s,y +  -18.872 * s,x +   30.932 * s,y +  -16.284 * s, threshold);
			_bez(x +   30.932 * s,y +  -16.284 * s,x +   32.902 * s,y +  -13.696 * s,x +   36.116 * s,y +  -12.402 * s,x +   40.576 * s,y +  -12.402 * s, threshold);
			_bez(x +   40.576 * s,y +  -12.402 * s,x +   45.068 * s,y +  -12.402 * s,x +   48.299 * s,y +  -13.696 * s,x +   50.268 * s,y +  -16.284 * s, threshold);
			_bez(x +   50.268 * s,y +  -16.284 * s,x +   52.237 * s,y +  -18.872 * s,x +   53.222 * s,y +  -23.177 * s,x +   53.222 * s,y +  -29.199 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   53.222 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   72.021 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   72.021 * s);
			_setf(o + ( 5 << 2), y +  -29.199 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   72.021 * s,y +  -29.199 * s,x +   72.021 * s,y +  -18.880 * s,x +   69.433 * s,y +  -11.198 * s,x +   64.257 * s,y +   -6.152 * s, threshold);
			_bez(x +   64.257 * s,y +   -6.152 * s,x +   59.081 * s,y +   -1.107 * s,x +   51.187 * s,y +    1.416 * s,x +   40.576 * s,y +    1.416 * s, threshold);
			_bez(x +   40.576 * s,y +    1.416 * s,x +   29.997 * s,y +    1.416 * s,x +   22.119 * s,y +   -1.107 * s,x +   16.943 * s,y +   -6.152 * s, threshold);
			_bez(x +   16.943 * s,y +   -6.152 * s,x +   11.768 * s,y +  -11.198 * s,x +    9.180 * s,y +  -18.880 * s,x +    9.180 * s,y +  -29.199 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    9.180 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   81.200 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 86:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +    0.488 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   19.385 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   38.720 * s);
			_setf(o + ( 5 << 2), y +  -19.091 * s);
			_setf(o + ( 6 << 2), x +   58.007 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   76.903 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   49.902 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   27.490 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +    0.488 * s);
			_setf(o + (15 << 2), y +  -72.899 * s);
			_setf(o + (16 << 2), x +   77.392 * s);
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
			_setf(o + ( 0 << 2), x +    2.978 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   20.995 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   33.593 * s);
			_setf(o + ( 5 << 2), y +  -19.922 * s);
			_setf(o + ( 6 << 2), x +   46.093 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   64.208 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   76.707 * s);
			_setf(o + (11 << 2), y +  -19.922 * s);
			_setf(o + (12 << 2), x +   89.305 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +  107.176 * s);
			_setf(o + (15 << 2), y +  -72.899 * s);
			_setf(o + (16 << 2), x +   89.988 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   68.309 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   55.077 * s);
			_setf(o + (21 << 2), y +  -55.419 * s);
			_setf(o + (22 << 2), x +   41.991 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   20.312 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +    2.978 * s);
			_setf(o + (27 << 2), y +  -72.899 * s);
			_setf(o + (28 << 2), x +  110.301 * s);
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
			_setf(o + ( 0 << 2), x +   49.803 * s);
			_setf(o + ( 1 << 2), y +  -37.206 * s);
			_setf(o + ( 2 << 2), x +   75.096 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   55.516 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   38.476 * s);
			_setf(o + ( 7 << 2), y +  -24.902 * s);
			_setf(o + ( 8 << 2), x +   21.581 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +    1.904 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   27.196 * s);
			_setf(o + (13 << 2), y +  -37.206 * s);
			_setf(o + (14 << 2), x +    2.880 * s);
			_setf(o + (15 << 2), y +  -72.899 * s);
			_setf(o + (16 << 2), x +   22.509 * s);
			_setf(o + (17 << 2), y +  -72.899 * s);
			_setf(o + (18 << 2), x +   38.476 * s);
			_setf(o + (19 << 2), y +  -49.413 * s);
			_setf(o + (20 << 2), x +   54.393 * s);
			_setf(o + (21 << 2), y +  -72.899 * s);
			_setf(o + (22 << 2), x +   74.120 * s);
			_setf(o + (23 << 2), y +  -72.899 * s);
			_setf(o + (24 << 2), x +   49.803 * s);
			_setf(o + (25 << 2), y +  -37.206 * s);
			_setf(o + (26 << 2), x +   77.098 * s);
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
			_setf(o + ( 0 << 2), x +   -0.977 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   19.580 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   36.181 * s);
			_setf(o + ( 5 << 2), y +  -46.923 * s);
			_setf(o + ( 6 << 2), x +   52.782 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   73.387 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   45.605 * s);
			_setf(o + (11 << 2), y +  -30.712 * s);
			_setf(o + (12 << 2), x +   45.605 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   26.806 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   26.806 * s);
			_setf(o + (17 << 2), y +  -30.712 * s);
			_setf(o + (18 << 2), x +   -0.977 * s);
			_setf(o + (19 << 2), y +  -72.899 * s);
			_setf(o + (20 << 2), x +   72.411 * s);
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
			_setf(o + ( 0 << 2), x +    5.615 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   66.894 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   66.894 * s);
			_setf(o + ( 5 << 2), y +  -61.522 * s);
			_setf(o + ( 6 << 2), x +   27.783 * s);
			_setf(o + ( 7 << 2), y +  -14.209 * s);
			_setf(o + ( 8 << 2), x +   68.017 * s);
			_setf(o + ( 9 << 2), y +  -14.209 * s);
			_setf(o + (10 << 2), x +   68.017 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    4.492 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +    4.492 * s);
			_setf(o + (15 << 2), y +  -11.377 * s);
			_setf(o + (16 << 2), x +   43.603 * s);
			_setf(o + (17 << 2), y +  -58.691 * s);
			_setf(o + (18 << 2), x +    5.615 * s);
			_setf(o + (19 << 2), y +  -58.691 * s);
			_setf(o + (20 << 2), x +    5.615 * s);
			_setf(o + (21 << 2), y +  -72.899 * s);
			_setf(o + (22 << 2), x +   72.509 * s);
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
			_setf(o + ( 0 << 2), x +    8.593 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   38.915 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   38.915 * s);
			_setf(o + ( 5 << 2), y +  -64.989 * s);
			_setf(o + ( 6 << 2), x +   25.195 * s);
			_setf(o + ( 7 << 2), y +  -64.989 * s);
			_setf(o + ( 8 << 2), x +   25.195 * s);
			_setf(o + ( 9 << 2), y +    2.197 * s);
			_setf(o + (10 << 2), x +   38.915 * s);
			_setf(o + (11 << 2), y +    2.197 * s);
			_setf(o + (12 << 2), x +   38.915 * s);
			_setf(o + (13 << 2), y +   13.183 * s);
			_setf(o + (14 << 2), x +    8.593 * s);
			_setf(o + (15 << 2), y +   13.183 * s);
			_setf(o + (16 << 2), x +    8.593 * s);
			_setf(o + (17 << 2), y +  -75.975 * s);
			_setf(o + (18 << 2), x +   45.702 * s);
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
			_setf(o + ( 0 << 2), x +   25.683 * s);
			_setf(o + ( 1 << 2), y +    9.277 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   10.791 * s);
			_setf(o + ( 5 << 2), y +  -72.899 * s);
			_setf(o + ( 6 << 2), x +   36.523 * s);
			_setf(o + ( 7 << 2), y +    9.277 * s);
			_setf(o + ( 8 << 2), x +   25.683 * s);
			_setf(o + ( 9 << 2), y +    9.277 * s);
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
			_setf(o + ( 0 << 2), x +   37.109 * s);
			_setf(o + ( 1 << 2), y +   13.183 * s);
			_setf(o + ( 2 << 2), x +    6.787 * s);
			_setf(o + ( 3 << 2), y +   13.183 * s);
			_setf(o + ( 4 << 2), x +    6.787 * s);
			_setf(o + ( 5 << 2), y +    2.197 * s);
			_setf(o + ( 6 << 2), x +   20.507 * s);
			_setf(o + ( 7 << 2), y +    2.197 * s);
			_setf(o + ( 8 << 2), x +   20.507 * s);
			_setf(o + ( 9 << 2), y +  -64.989 * s);
			_setf(o + (10 << 2), x +    6.787 * s);
			_setf(o + (11 << 2), y +  -64.989 * s);
			_setf(o + (12 << 2), x +    6.787 * s);
			_setf(o + (13 << 2), y +  -75.975 * s);
			_setf(o + (14 << 2), x +   37.109 * s);
			_setf(o + (15 << 2), y +  -75.975 * s);
			_setf(o + (16 << 2), x +   37.109 * s);
			_setf(o + (17 << 2), y +   13.183 * s);
			_setf(o + (18 << 2), x +   45.702 * s);
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
			_setf(o + ( 0 << 2), x +   47.900 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   73.681 * s);
			_setf(o + ( 3 << 2), y +  -45.702 * s);
			_setf(o + ( 4 << 2), x +   61.913 * s);
			_setf(o + ( 5 << 2), y +  -45.702 * s);
			_setf(o + ( 6 << 2), x +   41.894 * s);
			_setf(o + ( 7 << 2), y +  -60.399 * s);
			_setf(o + ( 8 << 2), x +   21.924 * s);
			_setf(o + ( 9 << 2), y +  -45.702 * s);
			_setf(o + (10 << 2), x +   10.108 * s);
			_setf(o + (11 << 2), y +  -45.702 * s);
			_setf(o + (12 << 2), x +   35.888 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   47.900 * s);
			_setf(o + (15 << 2), y +  -72.899 * s);
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
			
			case 95:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   49.999 * s);
			_setf(o + ( 1 << 2), y +   14.306 * s);
			_setf(o + ( 2 << 2), x +   49.999 * s);
			_setf(o + ( 3 << 2), y +   23.584 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +   23.584 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +   14.306 * s);
			_setf(o + ( 8 << 2), x +   49.999 * s);
			_setf(o + ( 9 << 2), y +   14.306 * s);
			_setf(o + (10 << 2), x +   49.999 * s);
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
			_setf(o + ( 0 << 2), x +   18.408 * s);
			_setf(o + ( 1 << 2), y +  -79.979 * s);
			_setf(o + ( 2 << 2), x +   32.178 * s);
			_setf(o + ( 3 << 2), y +  -61.620 * s);
			_setf(o + ( 4 << 2), x +   22.607 * s);
			_setf(o + ( 5 << 2), y +  -61.620 * s);
			_setf(o + ( 6 << 2), x +    4.590 * s);
			_setf(o + ( 7 << 2), y +  -79.979 * s);
			_setf(o + ( 8 << 2), x +   18.408 * s);
			_setf(o + ( 9 << 2), y +  -79.979 * s);
			_setf(o + (10 << 2), x +   50.000 * s);
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
			_setf(o + ( 0 << 2), x +   32.909 * s);
			_setf(o + ( 1 << 2), y +  -24.609 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   32.909 * s,y +  -24.609 * s,x +   29.264 * s,y +  -24.609 * s,x +   26.521 * s,y +  -23.991 * s,x +   24.682 * s,y +  -22.754 * s, threshold);
			_bez(x +   24.682 * s,y +  -22.754 * s,x +   22.843 * s,y +  -21.517 * s,x +   21.923 * s,y +  -19.694 * s,x +   21.923 * s,y +  -17.285 * s, threshold);
			_bez(x +   21.923 * s,y +  -17.285 * s,x +   21.923 * s,y +  -15.071 * s,x +   22.664 * s,y +  -13.338 * s,x +   24.145 * s,y +  -12.085 * s, threshold);
			_bez(x +   24.145 * s,y +  -12.085 * s,x +   25.626 * s,y +  -10.832 * s,x +   27.685 * s,y +  -10.205 * s,x +   30.321 * s,y +  -10.205 * s, threshold);
			_bez(x +   30.321 * s,y +  -10.205 * s,x +   33.609 * s,y +  -10.205 * s,x +   36.376 * s,y +  -11.385 * s,x +   38.622 * s,y +  -13.745 * s, threshold);
			_bez(x +   38.622 * s,y +  -13.745 * s,x +   40.868 * s,y +  -16.105 * s,x +   41.991 * s,y +  -19.059 * s,x +   41.991 * s,y +  -22.607 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   41.991 * s);
			_setf(o + ( 1 << 2), y +  -24.609 * s);
			_setf(o + ( 2 << 2), x +   32.909 * s);
			_setf(o + ( 3 << 2), y +  -24.609 * s);
			_setf(o + ( 4 << 2), x +   59.618 * s);
			_setf(o + ( 5 << 2), y +  -31.201 * s);
			_setf(o + ( 6 << 2), x +   59.618 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   41.991 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   41.991 * s);
			_setf(o + (11 << 2), y +   -8.105 * s);
			o = _posb(6);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_bez(x +   41.991 * s,y +   -8.105 * s,x +   39.647 * s,y +   -4.785 * s,x +   37.011 * s,y +   -2.368 * s,x +   34.081 * s,y +   -0.854 * s, threshold);
			_bez(x +   34.081 * s,y +   -0.854 * s,x +   31.151 * s,y +    0.659 * s,x +   27.587 * s,y +    1.416 * s,x +   23.388 * s,y +    1.416 * s, threshold);
			_bez(x +   23.388 * s,y +    1.416 * s,x +   17.724 * s,y +    1.416 * s,x +   13.126 * s,y +   -0.236 * s,x +    9.594 * s,y +   -3.540 * s, threshold);
			_bez(x +    9.594 * s,y +   -3.540 * s,x +    6.062 * s,y +   -6.844 * s,x +    4.296 * s,y +  -11.133 * s,x +    4.296 * s,y +  -16.406 * s, threshold);
			_bez(x +    4.296 * s,y +  -16.406 * s,x +    4.296 * s,y +  -22.819 * s,x +    6.502 * s,y +  -27.522 * s,x +   10.913 * s,y +  -30.517 * s, threshold);
			_bez(x +   10.913 * s,y +  -30.517 * s,x +   15.323 * s,y +  -33.512 * s,x +   22.249 * s,y +  -35.009 * s,x +   31.689 * s,y +  -35.009 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   41.991 * s);
			_setf(o + ( 1 << 2), y +  -35.009 * s);
			_setf(o + ( 2 << 2), x +   41.991 * s);
			_setf(o + ( 3 << 2), y +  -36.376 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   41.991 * s,y +  -36.376 * s,x +   41.991 * s,y +  -39.143 * s,x +   40.901 * s,y +  -41.170 * s,x +   38.720 * s,y +  -42.455 * s, threshold);
			_bez(x +   38.720 * s,y +  -42.455 * s,x +   36.539 * s,y +  -43.741 * s,x +   33.137 * s,y +  -44.384 * s,x +   28.515 * s,y +  -44.384 * s, threshold);
			_bez(x +   28.515 * s,y +  -44.384 * s,x +   24.771 * s,y +  -44.384 * s,x +   21.288 * s,y +  -44.010 * s,x +   18.066 * s,y +  -43.261 * s, threshold);
			_bez(x +   18.066 * s,y +  -43.261 * s,x +   14.843 * s,y +  -42.512 * s,x +   11.848 * s,y +  -41.389 * s,x +    9.081 * s,y +  -39.892 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    9.081 * s);
			_setf(o + ( 1 << 2), y +  -53.222 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    9.081 * s,y +  -53.222 * s,x +   12.825 * s,y +  -54.133 * s,x +   16.585 * s,y +  -54.825 * s,x +   20.361 * s,y +  -55.297 * s, threshold);
			_bez(x +   20.361 * s,y +  -55.297 * s,x +   24.137 * s,y +  -55.769 * s,x +   27.913 * s,y +  -56.005 * s,x +   31.689 * s,y +  -56.005 * s, threshold);
			_bez(x +   31.689 * s,y +  -56.005 * s,x +   41.552 * s,y +  -56.005 * s,x +   48.672 * s,y +  -54.060 * s,x +   53.051 * s,y +  -50.170 * s, threshold);
			_bez(x +   53.051 * s,y +  -50.170 * s,x +   57.429 * s,y +  -46.280 * s,x +   59.618 * s,y +  -39.957 * s,x +   59.618 * s,y +  -31.201 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   67.479 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 98:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   37.499 * s);
			_setf(o + ( 1 << 2), y +  -11.279 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   37.499 * s,y +  -11.279 * s,x +   41.243 * s,y +  -11.279 * s,x +   44.099 * s,y +  -12.646 * s,x +   46.069 * s,y +  -15.381 * s, threshold);
			_bez(x +   46.069 * s,y +  -15.381 * s,x +   48.038 * s,y +  -18.115 * s,x +   49.023 * s,y +  -22.086 * s,x +   49.023 * s,y +  -27.294 * s, threshold);
			_bez(x +   49.023 * s,y +  -27.294 * s,x +   49.023 * s,y +  -32.503 * s,x +   48.038 * s,y +  -36.474 * s,x +   46.069 * s,y +  -39.208 * s, threshold);
			_bez(x +   46.069 * s,y +  -39.208 * s,x +   44.099 * s,y +  -41.943 * s,x +   41.243 * s,y +  -43.310 * s,x +   37.499 * s,y +  -43.310 * s, threshold);
			_bez(x +   37.499 * s,y +  -43.310 * s,x +   33.756 * s,y +  -43.310 * s,x +   30.883 * s,y +  -41.935 * s,x +   28.881 * s,y +  -39.184 * s, threshold);
			_bez(x +   28.881 * s,y +  -39.184 * s,x +   26.879 * s,y +  -36.433 * s,x +   25.878 * s,y +  -32.470 * s,x +   25.878 * s,y +  -27.294 * s, threshold);
			_bez(x +   25.878 * s,y +  -27.294 * s,x +   25.878 * s,y +  -22.119 * s,x +   26.879 * s,y +  -18.156 * s,x +   28.881 * s,y +  -15.405 * s, threshold);
			_bez(x +   28.881 * s,y +  -15.405 * s,x +   30.883 * s,y +  -12.654 * s,x +   33.756 * s,y +  -11.279 * s,x +   37.499 * s,y +  -11.279 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   25.878 * s);
			_setf(o + ( 1 << 2), y +  -46.679 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   25.878 * s,y +  -46.679 * s,x +   28.287 * s,y +  -49.869 * s,x +   30.957 * s,y +  -52.221 * s,x +   33.886 * s,y +  -53.735 * s, threshold);
			_bez(x +   33.886 * s,y +  -53.735 * s,x +   36.816 * s,y +  -55.248 * s,x +   40.185 * s,y +  -56.005 * s,x +   43.993 * s,y +  -56.005 * s, threshold);
			_bez(x +   43.993 * s,y +  -56.005 * s,x +   50.732 * s,y +  -56.005 * s,x +   56.265 * s,y +  -53.328 * s,x +   60.595 * s,y +  -47.973 * s, threshold);
			_bez(x +   60.595 * s,y +  -47.973 * s,x +   64.924 * s,y +  -42.618 * s,x +   67.089 * s,y +  -35.725 * s,x +   67.089 * s,y +  -27.294 * s, threshold);
			_bez(x +   67.089 * s,y +  -27.294 * s,x +   67.089 * s,y +  -18.864 * s,x +   64.924 * s,y +  -11.971 * s,x +   60.595 * s,y +   -6.616 * s, threshold);
			_bez(x +   60.595 * s,y +   -6.616 * s,x +   56.265 * s,y +   -1.261 * s,x +   50.732 * s,y +    1.416 * s,x +   43.993 * s,y +    1.416 * s, threshold);
			_bez(x +   43.993 * s,y +    1.416 * s,x +   40.185 * s,y +    1.416 * s,x +   36.816 * s,y +    0.659 * s,x +   33.886 * s,y +   -0.854 * s, threshold);
			_bez(x +   33.886 * s,y +   -0.854 * s,x +   30.957 * s,y +   -2.368 * s,x +   28.287 * s,y +   -4.720 * s,x +   25.878 * s,y +   -7.910 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   25.878 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    8.398 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    8.398 * s);
			_setf(o + ( 5 << 2), y +  -75.975 * s);
			_setf(o + ( 6 << 2), x +   25.878 * s);
			_setf(o + ( 7 << 2), y +  -75.975 * s);
			_setf(o + ( 8 << 2), x +   25.878 * s);
			_setf(o + ( 9 << 2), y +  -46.679 * s);
			_setf(o + (10 << 2), x +   71.581 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 99:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   52.587 * s);
			_setf(o + ( 1 << 2), y +  -52.978 * s);
			_setf(o + ( 2 << 2), x +   52.587 * s);
			_setf(o + ( 3 << 2), y +  -38.720 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   52.587 * s,y +  -38.720 * s,x +   50.211 * s,y +  -40.348 * s,x +   47.826 * s,y +  -41.552 * s,x +   45.434 * s,y +  -42.333 * s, threshold);
			_bez(x +   45.434 * s,y +  -42.333 * s,x +   43.041 * s,y +  -43.115 * s,x +   40.559 * s,y +  -43.505 * s,x +   37.988 * s,y +  -43.505 * s, threshold);
			_bez(x +   37.988 * s,y +  -43.505 * s,x +   33.105 * s,y +  -43.505 * s,x +   29.304 * s,y +  -42.081 * s,x +   26.586 * s,y +  -39.233 * s, threshold);
			_bez(x +   26.586 * s,y +  -39.233 * s,x +   23.868 * s,y +  -36.385 * s,x +   22.509 * s,y +  -32.405 * s,x +   22.509 * s,y +  -27.294 * s, threshold);
			_bez(x +   22.509 * s,y +  -27.294 * s,x +   22.509 * s,y +  -22.184 * s,x +   23.868 * s,y +  -18.204 * s,x +   26.586 * s,y +  -15.356 * s, threshold);
			_bez(x +   26.586 * s,y +  -15.356 * s,x +   29.304 * s,y +  -12.508 * s,x +   33.105 * s,y +  -11.084 * s,x +   37.988 * s,y +  -11.084 * s, threshold);
			_bez(x +   37.988 * s,y +  -11.084 * s,x +   40.722 * s,y +  -11.084 * s,x +   43.318 * s,y +  -11.491 * s,x +   45.776 * s,y +  -12.304 * s, threshold);
			_bez(x +   45.776 * s,y +  -12.304 * s,x +   48.233 * s,y +  -13.118 * s,x +   50.504 * s,y +  -14.323 * s,x +   52.587 * s,y +  -15.918 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   52.587 * s);
			_setf(o + ( 1 << 2), y +   -1.611 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   52.587 * s,y +   -1.611 * s,x +   49.853 * s,y +   -0.602 * s,x +   47.078 * s,y +    0.155 * s,x +   44.262 * s,y +    0.659 * s, threshold);
			_bez(x +   44.262 * s,y +    0.659 * s,x +   41.446 * s,y +    1.164 * s,x +   38.622 * s,y +    1.416 * s,x +   35.790 * s,y +    1.416 * s, threshold);
			_bez(x +   35.790 * s,y +    1.416 * s,x +   25.927 * s,y +    1.416 * s,x +   18.213 * s,y +   -1.115 * s,x +   12.646 * s,y +   -6.177 * s, threshold);
			_bez(x +   12.646 * s,y +   -6.177 * s,x +    7.080 * s,y +  -11.238 * s,x +    4.297 * s,y +  -18.278 * s,x +    4.297 * s,y +  -27.294 * s, threshold);
			_bez(x +    4.297 * s,y +  -27.294 * s,x +    4.297 * s,y +  -36.311 * s,x +    7.080 * s,y +  -43.351 * s,x +   12.646 * s,y +  -48.412 * s, threshold);
			_bez(x +   12.646 * s,y +  -48.412 * s,x +   18.213 * s,y +  -53.474 * s,x +   25.927 * s,y +  -56.005 * s,x +   35.790 * s,y +  -56.005 * s, threshold);
			_bez(x +   35.790 * s,y +  -56.005 * s,x +   38.655 * s,y +  -56.005 * s,x +   41.479 * s,y +  -55.753 * s,x +   44.262 * s,y +  -55.248 * s, threshold);
			_bez(x +   44.262 * s,y +  -55.248 * s,x +   47.045 * s,y +  -54.744 * s,x +   49.820 * s,y +  -53.987 * s,x +   52.587 * s,y +  -52.978 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   59.276 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 100:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   45.605 * s);
			_setf(o + ( 1 << 2), y +  -46.679 * s);
			_setf(o + ( 2 << 2), x +   45.605 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   63.183 * s);
			_setf(o + ( 5 << 2), y +  -75.975 * s);
			_setf(o + ( 6 << 2), x +   63.183 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   45.605 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   45.605 * s);
			_setf(o + (11 << 2), y +   -7.910 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_bez(x +   45.605 * s,y +   -7.910 * s,x +   43.196 * s,y +   -4.687 * s,x +   40.543 * s,y +   -2.327 * s,x +   37.646 * s,y +   -0.830 * s, threshold);
			_bez(x +   37.646 * s,y +   -0.830 * s,x +   34.749 * s,y +    0.667 * s,x +   31.396 * s,y +    1.416 * s,x +   27.588 * s,y +    1.416 * s, threshold);
			_bez(x +   27.588 * s,y +    1.416 * s,x +   20.850 * s,y +    1.416 * s,x +   15.316 * s,y +   -1.261 * s,x +   10.987 * s,y +   -6.616 * s, threshold);
			_bez(x +   10.987 * s,y +   -6.616 * s,x +    6.657 * s,y +  -11.971 * s,x +    4.492 * s,y +  -18.864 * s,x +    4.492 * s,y +  -27.294 * s, threshold);
			_bez(x +    4.492 * s,y +  -27.294 * s,x +    4.492 * s,y +  -35.725 * s,x +    6.657 * s,y +  -42.618 * s,x +   10.987 * s,y +  -47.973 * s, threshold);
			_bez(x +   10.987 * s,y +  -47.973 * s,x +   15.316 * s,y +  -53.328 * s,x +   20.849 * s,y +  -56.005 * s,x +   27.588 * s,y +  -56.005 * s, threshold);
			_bez(x +   27.588 * s,y +  -56.005 * s,x +   31.364 * s,y +  -56.005 * s,x +   34.708 * s,y +  -55.248 * s,x +   37.622 * s,y +  -53.735 * s, threshold);
			_bez(x +   37.622 * s,y +  -53.735 * s,x +   40.535 * s,y +  -52.221 * s,x +   43.196 * s,y +  -49.869 * s,x +   45.605 * s,y +  -46.679 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   34.082 * s);
			_setf(o + ( 1 << 2), y +  -11.279 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   34.082 * s,y +  -11.279 * s,x +   37.825 * s,y +  -11.279 * s,x +   40.682 * s,y +  -12.646 * s,x +   42.651 * s,y +  -15.381 * s, threshold);
			_bez(x +   42.651 * s,y +  -15.381 * s,x +   44.620 * s,y +  -18.115 * s,x +   45.605 * s,y +  -22.086 * s,x +   45.605 * s,y +  -27.294 * s, threshold);
			_bez(x +   45.605 * s,y +  -27.294 * s,x +   45.605 * s,y +  -32.503 * s,x +   44.620 * s,y +  -36.474 * s,x +   42.651 * s,y +  -39.208 * s, threshold);
			_bez(x +   42.651 * s,y +  -39.208 * s,x +   40.682 * s,y +  -41.943 * s,x +   37.825 * s,y +  -43.310 * s,x +   34.082 * s,y +  -43.310 * s, threshold);
			_bez(x +   34.082 * s,y +  -43.310 * s,x +   30.371 * s,y +  -43.310 * s,x +   27.531 * s,y +  -41.943 * s,x +   25.561 * s,y +  -39.208 * s, threshold);
			_bez(x +   25.561 * s,y +  -39.208 * s,x +   23.592 * s,y +  -36.474 * s,x +   22.607 * s,y +  -32.503 * s,x +   22.607 * s,y +  -27.294 * s, threshold);
			_bez(x +   22.607 * s,y +  -27.294 * s,x +   22.607 * s,y +  -22.086 * s,x +   23.592 * s,y +  -18.115 * s,x +   25.561 * s,y +  -15.381 * s, threshold);
			_bez(x +   25.561 * s,y +  -15.381 * s,x +   27.531 * s,y +  -12.646 * s,x +   30.371 * s,y +  -11.279 * s,x +   34.082 * s,y +  -11.279 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   71.581 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 101:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   62.988 * s);
			_setf(o + ( 1 << 2), y +  -27.490 * s);
			_setf(o + ( 2 << 2), x +   62.988 * s);
			_setf(o + ( 3 << 2), y +  -22.509 * s);
			_setf(o + ( 4 << 2), x +   22.119 * s);
			_setf(o + ( 5 << 2), y +  -22.509 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   22.119 * s,y +  -22.509 * s,x +   22.542 * s,y +  -18.408 * s,x +   24.023 * s,y +  -15.332 * s,x +   26.562 * s,y +  -13.281 * s, threshold);
			_bez(x +   26.562 * s,y +  -13.281 * s,x +   29.101 * s,y +  -11.230 * s,x +   32.650 * s,y +  -10.205 * s,x +   37.207 * s,y +  -10.205 * s, threshold);
			_bez(x +   37.207 * s,y +  -10.205 * s,x +   40.885 * s,y +  -10.205 * s,x +   44.653 * s,y +  -10.750 * s,x +   48.510 * s,y +  -11.841 * s, threshold);
			_bez(x +   48.510 * s,y +  -11.841 * s,x +   52.368 * s,y +  -12.931 * s,x +   56.331 * s,y +  -14.583 * s,x +   60.400 * s,y +  -16.797 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.400 * s);
			_setf(o + ( 1 << 2), y +   -3.320 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   60.400 * s,y +   -3.320 * s,x +   56.266 * s,y +   -1.758 * s,x +   52.132 * s,y +   -0.578 * s,x +   47.998 * s,y +    0.220 * s, threshold);
			_bez(x +   47.998 * s,y +    0.220 * s,x +   43.864 * s,y +    1.017 * s,x +   39.729 * s,y +    1.416 * s,x +   35.595 * s,y +    1.416 * s, threshold);
			_bez(x +   35.595 * s,y +    1.416 * s,x +   25.700 * s,y +    1.416 * s,x +   18.009 * s,y +   -1.099 * s,x +   12.525 * s,y +   -6.128 * s, threshold);
			_bez(x +   12.525 * s,y +   -6.128 * s,x +    7.040 * s,y +  -11.157 * s,x +    4.297 * s,y +  -18.212 * s,x +    4.297 * s,y +  -27.294 * s, threshold);
			_bez(x +    4.297 * s,y +  -27.294 * s,x +    4.297 * s,y +  -36.213 * s,x +    6.991 * s,y +  -43.229 * s,x +   12.378 * s,y +  -48.339 * s, threshold);
			_bez(x +   12.378 * s,y +  -48.339 * s,x +   17.765 * s,y +  -53.450 * s,x +   25.179 * s,y +  -56.005 * s,x +   34.619 * s,y +  -56.005 * s, threshold);
			_bez(x +   34.619 * s,y +  -56.005 * s,x +   43.213 * s,y +  -56.005 * s,x +   50.089 * s,y +  -53.417 * s,x +   55.248 * s,y +  -48.241 * s, threshold);
			_bez(x +   55.248 * s,y +  -48.241 * s,x +   60.408 * s,y +  -43.066 * s,x +   62.988 * s,y +  -36.148 * s,x +   62.988 * s,y +  -27.490 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   45.019 * s);
			_setf(o + ( 1 << 2), y +  -33.300 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   45.019 * s,y +  -33.300 * s,x +   45.019 * s,y +  -36.621 * s,x +   44.051 * s,y +  -39.298 * s,x +   42.114 * s,y +  -41.332 * s, threshold);
			_bez(x +   42.114 * s,y +  -41.332 * s,x +   40.177 * s,y +  -43.367 * s,x +   37.646 * s,y +  -44.384 * s,x +   34.521 * s,y +  -44.384 * s, threshold);
			_bez(x +   34.521 * s,y +  -44.384 * s,x +   31.136 * s,y +  -44.384 * s,x +   28.385 * s,y +  -43.432 * s,x +   26.269 * s,y +  -41.528 * s, threshold);
			_bez(x +   26.269 * s,y +  -41.528 * s,x +   24.154 * s,y +  -39.623 * s,x +   22.835 * s,y +  -36.881 * s,x +   22.314 * s,y +  -33.300 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   45.019 * s);
			_setf(o + ( 1 << 2), y +  -33.300 * s);
			_setf(o + ( 2 << 2), x +   67.822 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 102:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   44.384 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   44.384 * s);
			_setf(o + ( 3 << 2), y +  -64.501 * s);
			_setf(o + ( 4 << 2), x +   34.716 * s);
			_setf(o + ( 5 << 2), y +  -64.501 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   34.716 * s,y +  -64.501 * s,x +   32.242 * s,y +  -64.501 * s,x +   30.517 * s,y +  -64.053 * s,x +   29.540 * s,y +  -63.158 * s, threshold);
			_bez(x +   29.540 * s,y +  -63.158 * s,x +   28.564 * s,y +  -62.263 * s,x +   28.075 * s,y +  -60.709 * s,x +   28.075 * s,y +  -58.495 * s, threshold);
			o = _posf(22);
			_setf(o + ( 0 << 2), x +   28.075 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   43.016 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   43.016 * s);
			_setf(o + ( 5 << 2), y +  -42.187 * s);
			_setf(o + ( 6 << 2), x +   28.075 * s);
			_setf(o + ( 7 << 2), y +  -42.187 * s);
			_setf(o + ( 8 << 2), x +   28.075 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   10.595 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   10.595 * s);
			_setf(o + (13 << 2), y +  -42.187 * s);
			_setf(o + (14 << 2), x +    1.904 * s);
			_setf(o + (15 << 2), y +  -42.187 * s);
			_setf(o + (16 << 2), x +    1.904 * s);
			_setf(o + (17 << 2), y +  -54.687 * s);
			_setf(o + (18 << 2), x +   10.595 * s);
			_setf(o + (19 << 2), y +  -54.687 * s);
			_setf(o + (20 << 2), x +   10.595 * s);
			_setf(o + (21 << 2), y +  -58.495 * s);
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
			_bez(x +   10.595 * s,y +  -58.495 * s,x +   10.595 * s,y +  -64.452 * s,x +   12.255 * s,y +  -68.855 * s,x +   15.575 * s,y +  -71.703 * s, threshold);
			_bez(x +   15.575 * s,y +  -71.703 * s,x +   18.896 * s,y +  -74.551 * s,x +   24.039 * s,y +  -75.975 * s,x +   31.005 * s,y +  -75.975 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   44.384 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   43.505 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 103:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   45.604 * s);
			_setf(o + ( 1 << 2), y +   -9.277 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   45.604 * s,y +   -9.277 * s,x +   43.196 * s,y +   -6.087 * s,x +   40.543 * s,y +   -3.743 * s,x +   37.646 * s,y +   -2.246 * s, threshold);
			_bez(x +   37.646 * s,y +   -2.246 * s,x +   34.749 * s,y +   -0.749 * s,x +   31.396 * s,y +       0. * s,x +   27.587 * s,y +       0. * s, threshold);
			_bez(x +   27.587 * s,y +       0. * s,x +   20.914 * s,y +       0. * s,x +   15.397 * s,y +   -2.629 * s,x +   11.035 * s,y +   -7.886 * s, threshold);
			_bez(x +   11.035 * s,y +   -7.886 * s,x +    6.673 * s,y +  -13.143 * s,x +    4.492 * s,y +  -19.840 * s,x +    4.492 * s,y +  -27.978 * s, threshold);
			_bez(x +    4.492 * s,y +  -27.978 * s,x +    4.492 * s,y +  -36.148 * s,x +    6.673 * s,y +  -42.846 * s,x +   11.035 * s,y +  -48.071 * s, threshold);
			_bez(x +   11.035 * s,y +  -48.071 * s,x +   15.397 * s,y +  -53.295 * s,x +   20.914 * s,y +  -55.907 * s,x +   27.587 * s,y +  -55.907 * s, threshold);
			_bez(x +   27.587 * s,y +  -55.907 * s,x +   31.396 * s,y +  -55.907 * s,x +   34.749 * s,y +  -55.159 * s,x +   37.646 * s,y +  -53.661 * s, threshold);
			_bez(x +   37.646 * s,y +  -53.661 * s,x +   40.543 * s,y +  -52.164 * s,x +   43.196 * s,y +  -49.804 * s,x +   45.604 * s,y +  -46.581 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   45.604 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   63.182 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   63.182 * s);
			_setf(o + ( 5 << 2), y +   -5.517 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   63.182 * s,y +   -5.517 * s,x +   63.182 * s,y +    3.271 * s,x +   60.407 * s,y +    9.985 * s,x +   54.857 * s,y +   14.624 * s, threshold);
			_bez(x +   54.857 * s,y +   14.624 * s,x +   49.307 * s,y +   19.262 * s,x +   41.259 * s,y +   21.582 * s,x +   30.712 * s,y +   21.582 * s, threshold);
			_bez(x +   30.712 * s,y +   21.582 * s,x +   27.294 * s,y +   21.582 * s,x +   23.990 * s,y +   21.321 * s,x +   20.800 * s,y +   20.800 * s, threshold);
			_bez(x +   20.800 * s,y +   20.800 * s,x +   17.610 * s,y +   20.280 * s,x +   14.404 * s,y +   19.482 * s,x +   11.181 * s,y +   18.408 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   11.181 * s);
			_setf(o + ( 1 << 2), y +    4.785 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   11.181 * s,y +    4.785 * s,x +   14.241 * s,y +    6.543 * s,x +   17.236 * s,y +    7.853 * s,x +   20.165 * s,y +    8.716 * s, threshold);
			_bez(x +   20.165 * s,y +    8.716 * s,x +   23.095 * s,y +    9.578 * s,x +   26.041 * s,y +   10.010 * s,x +   29.003 * s,y +   10.010 * s, threshold);
			_bez(x +   29.003 * s,y +   10.010 * s,x +   34.732 * s,y +   10.010 * s,x +   38.931 * s,y +    8.756 * s,x +   41.601 * s,y +    6.250 * s, threshold);
			_bez(x +   41.601 * s,y +    6.250 * s,x +   44.270 * s,y +    3.743 * s,x +   45.604 * s,y +   -0.179 * s,x +   45.604 * s,y +   -5.517 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   45.604 * s);
			_setf(o + ( 1 << 2), y +   -9.277 * s);
			_setf(o + ( 2 << 2), x +   34.081 * s);
			_setf(o + ( 3 << 2), y +  -43.310 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_bez(x +   34.081 * s,y +  -43.310 * s,x +   30.468 * s,y +  -43.310 * s,x +   27.652 * s,y +  -41.975 * s,x +   25.634 * s,y +  -39.306 * s, threshold);
			_bez(x +   25.634 * s,y +  -39.306 * s,x +   23.616 * s,y +  -36.637 * s,x +   22.607 * s,y +  -32.861 * s,x +   22.607 * s,y +  -27.978 * s, threshold);
			_bez(x +   22.607 * s,y +  -27.978 * s,x +   22.607 * s,y +  -22.965 * s,x +   23.583 * s,y +  -19.165 * s,x +   25.536 * s,y +  -16.577 * s, threshold);
			_bez(x +   25.536 * s,y +  -16.577 * s,x +   27.490 * s,y +  -13.989 * s,x +   30.338 * s,y +  -12.695 * s,x +   34.081 * s,y +  -12.695 * s, threshold);
			_bez(x +   34.081 * s,y +  -12.695 * s,x +   37.727 * s,y +  -12.695 * s,x +   40.559 * s,y +  -14.030 * s,x +   42.577 * s,y +  -16.699 * s, threshold);
			_bez(x +   42.577 * s,y +  -16.699 * s,x +   44.595 * s,y +  -19.368 * s,x +   45.604 * s,y +  -23.128 * s,x +   45.604 * s,y +  -27.978 * s, threshold);
			_bez(x +   45.604 * s,y +  -27.978 * s,x +   45.604 * s,y +  -32.861 * s,x +   44.595 * s,y +  -36.637 * s,x +   42.577 * s,y +  -39.306 * s, threshold);
			_bez(x +   42.577 * s,y +  -39.306 * s,x +   40.559 * s,y +  -41.975 * s,x +   37.727 * s,y +  -43.310 * s,x +   34.081 * s,y +  -43.310 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   71.581 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 104:
			
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   63.378 * s);
			_setf(o + ( 1 << 2), y +  -33.300 * s);
			_setf(o + ( 2 << 2), x +   63.378 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   45.800 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   45.800 * s);
			_setf(o + ( 7 << 2), y +   -5.420 * s);
			_setf(o + ( 8 << 2), x +   45.800 * s);
			_setf(o + ( 9 << 2), y +  -25.390 * s);
			o = _posb(5);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   45.800 * s,y +  -25.390 * s,x +   45.800 * s,y +  -30.175 * s,x +   45.694 * s,y +  -33.463 * s,x +   45.482 * s,y +  -35.253 * s, threshold);
			_bez(x +   45.482 * s,y +  -35.253 * s,x +   45.271 * s,y +  -37.044 * s,x +   44.899 * s,y +  -38.359 * s,x +   44.384 * s,y +  -39.208 * s, threshold);
			_bez(x +   44.384 * s,y +  -39.208 * s,x +   43.695 * s,y +  -40.344 * s,x +   42.772 * s,y +  -41.235 * s,x +   41.601 * s,y +  -41.869 * s, threshold);
			_bez(x +   41.601 * s,y +  -41.869 * s,x +   40.429 * s,y +  -42.504 * s,x +   39.094 * s,y +  -42.822 * s,x +   37.597 * s,y +  -42.822 * s, threshold);
			_bez(x +   37.597 * s,y +  -42.822 * s,x +   33.951 * s,y +  -42.822 * s,x +   31.086 * s,y +  -41.414 * s,x +   29.003 * s,y +  -38.598 * s, threshold);
			_bez(x +   29.003 * s,y +  -38.598 * s,x +   26.920 * s,y +  -35.782 * s,x +   25.878 * s,y +  -31.884 * s,x +   25.878 * s,y +  -26.904 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   25.878 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    8.398 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    8.398 * s);
			_setf(o + ( 5 << 2), y +  -75.975 * s);
			_setf(o + ( 6 << 2), x +   25.878 * s);
			_setf(o + ( 7 << 2), y +  -75.975 * s);
			_setf(o + ( 8 << 2), x +   25.878 * s);
			_setf(o + ( 9 << 2), y +  -46.679 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   25.878 * s,y +  -46.679 * s,x +   28.515 * s,y +  -49.869 * s,x +   31.314 * s,y +  -52.221 * s,x +   34.276 * s,y +  -53.735 * s, threshold);
			_bez(x +   34.276 * s,y +  -53.735 * s,x +   37.239 * s,y +  -55.248 * s,x +   40.510 * s,y +  -56.005 * s,x +   44.091 * s,y +  -56.005 * s, threshold);
			_bez(x +   44.091 * s,y +  -56.005 * s,x +   50.406 * s,y +  -56.005 * s,x +   55.199 * s,y +  -54.068 * s,x +   58.470 * s,y +  -50.195 * s, threshold);
			_bez(x +   58.470 * s,y +  -50.195 * s,x +   61.742 * s,y +  -46.321 * s,x +   63.378 * s,y +  -40.689 * s,x +   63.378 * s,y +  -33.300 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   71.190 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 105:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +    8.398 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   25.878 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   25.878 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    8.398 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    8.398 * s);
			_setf(o + ( 9 << 2), y +  -54.687 * s);
			_setf(o + (10 << 2), x +    8.398 * s);
			_setf(o + (11 << 2), y +  -75.975 * s);
			_setf(o + (12 << 2), x +   25.878 * s);
			_setf(o + (13 << 2), y +  -75.975 * s);
			_setf(o + (14 << 2), x +   25.878 * s);
			_setf(o + (15 << 2), y +  -61.718 * s);
			_setf(o + (16 << 2), x +    8.398 * s);
			_setf(o + (17 << 2), y +  -61.718 * s);
			_setf(o + (18 << 2), x +    8.398 * s);
			_setf(o + (19 << 2), y +  -75.975 * s);
			_setf(o + (20 << 2), x +   34.277 * s);
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
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    8.398 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   25.878 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   25.878 * s);
			_setf(o + ( 5 << 2), y +   -0.977 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   25.878 * s,y +   -0.977 * s,x +   25.878 * s,y +    6.348 * s,x +   24.120 * s,y +   11.938 * s,x +   20.605 * s,y +   15.796 * s, threshold);
			_bez(x +   20.605 * s,y +   15.796 * s,x +   17.089 * s,y +   19.653 * s,x +   11.995 * s,y +   21.582 * s,x +    5.322 * s,y +   21.582 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   -3.321 * s);
			_setf(o + ( 1 << 2), y +   21.582 * s);
			_setf(o + ( 2 << 2), x +   -3.321 * s);
			_setf(o + ( 3 << 2), y +   10.107 * s);
			_setf(o + ( 4 << 2), x +   -0.293 * s);
			_setf(o + ( 5 << 2), y +   10.107 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   -0.293 * s,y +   10.107 * s,x +    3.027 * s,y +   10.107 * s,x +    5.306 * s,y +    9.359 * s,x +    6.543 * s,y +    7.861 * s, threshold);
			_bez(x +    6.543 * s,y +    7.861 * s,x +    7.780 * s,y +    6.364 * s,x +    8.398 * s,y +    3.418 * s,x +    8.398 * s,y +   -0.977 * s, threshold);
			o = _posf(14);
			_setf(o + ( 0 << 2), x +    8.398 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +    8.398 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   25.878 * s);
			_setf(o + ( 5 << 2), y +  -75.975 * s);
			_setf(o + ( 6 << 2), x +   25.878 * s);
			_setf(o + ( 7 << 2), y +  -61.718 * s);
			_setf(o + ( 8 << 2), x +    8.398 * s);
			_setf(o + ( 9 << 2), y +  -61.718 * s);
			_setf(o + (10 << 2), x +    8.398 * s);
			_setf(o + (11 << 2), y +  -75.975 * s);
			_setf(o + (12 << 2), x +   34.277 * s);
			_setf(o + (13 << 2), y +       0. * s);
			o = _posb(7);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 1);
			
			case 107:
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +    8.398 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   25.878 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   25.878 * s);
			_setf(o + ( 5 << 2), y +  -34.619 * s);
			_setf(o + ( 6 << 2), x +   45.995 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   66.308 * s);
			_setf(o + ( 9 << 2), y +  -54.687 * s);
			_setf(o + (10 << 2), x +   39.599 * s);
			_setf(o + (11 << 2), y +  -29.589 * s);
			_setf(o + (12 << 2), x +   68.407 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   47.216 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   25.878 * s);
			_setf(o + (17 << 2), y +  -22.802 * s);
			_setf(o + (18 << 2), x +   25.878 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +    8.398 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +    8.398 * s);
			_setf(o + (23 << 2), y +  -75.975 * s);
			_setf(o + (24 << 2), x +   66.503 * s);
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
			
			case 108:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +    8.398 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   25.878 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   25.878 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    8.398 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    8.398 * s);
			_setf(o + ( 9 << 2), y +  -75.975 * s);
			_setf(o + (10 << 2), x +   34.277 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 109:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   59.081 * s);
			_setf(o + ( 1 << 2), y +  -45.605 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   59.081 * s,y +  -45.605 * s,x +   61.294 * s,y +  -48.990 * s,x +   63.923 * s,y +  -51.570 * s,x +   66.966 * s,y +  -53.344 * s, threshold);
			_bez(x +   66.966 * s,y +  -53.344 * s,x +   70.010 * s,y +  -55.118 * s,x +   73.355 * s,y +  -56.005 * s,x +   77.000 * s,y +  -56.005 * s, threshold);
			_bez(x +   77.000 * s,y +  -56.005 * s,x +   83.283 * s,y +  -56.005 * s,x +   88.068 * s,y +  -54.068 * s,x +   91.356 * s,y +  -50.195 * s, threshold);
			_bez(x +   91.356 * s,y +  -50.195 * s,x +   94.643 * s,y +  -46.321 * s,x +   96.287 * s,y +  -40.689 * s,x +   96.287 * s,y +  -33.300 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   96.287 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   78.709 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   78.709 * s);
			_setf(o + ( 5 << 2), y +  -28.515 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   78.709 * s,y +  -28.515 * s,x +   78.709 * s,y +  -28.940 * s,x +   78.766 * s,y +  -29.378 * s,x +   78.783 * s,y +  -29.834 * s, threshold);
			_bez(x +   78.783 * s,y +  -29.834 * s,x +   78.799 * s,y +  -30.289 * s,x +   78.807 * s,y +  -30.940 * s,x +   78.807 * s,y +  -31.787 * s, threshold);
			_bez(x +   78.807 * s,y +  -31.787 * s,x +   78.807 * s,y +  -35.660 * s,x +   78.237 * s,y +  -38.468 * s,x +   77.098 * s,y +  -40.209 * s, threshold);
			_bez(x +   77.098 * s,y +  -40.209 * s,x +   75.959 * s,y +  -41.951 * s,x +   74.120 * s,y +  -42.822 * s,x +   71.581 * s,y +  -42.822 * s, threshold);
			_bez(x +   71.581 * s,y +  -42.822 * s,x +   68.260 * s,y +  -42.822 * s,x +   65.697 * s,y +  -41.454 * s,x +   63.890 * s,y +  -38.720 * s, threshold);
			_bez(x +   63.890 * s,y +  -38.720 * s,x +   62.084 * s,y +  -35.986 * s,x +   61.083 * s,y +  -32.031 * s,x +   61.083 * s,y +  -26.855 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   61.083 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   43.505 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   43.505 * s);
			_setf(o + ( 5 << 2), y +  -28.515 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   43.505 * s,y +  -28.515 * s,x +   43.505 * s,y +  -34.570 * s,x +   42.984 * s,y +  -38.468 * s,x +   41.942 * s,y +  -40.209 * s, threshold);
			_bez(x +   41.942 * s,y +  -40.209 * s,x +   40.901 * s,y +  -41.951 * s,x +   39.045 * s,y +  -42.822 * s,x +   36.376 * s,y +  -42.822 * s, threshold);
			_bez(x +   36.376 * s,y +  -42.822 * s,x +   33.023 * s,y +  -42.822 * s,x +   30.435 * s,y +  -41.446 * s,x +   28.613 * s,y +  -38.696 * s, threshold);
			_bez(x +   28.613 * s,y +  -38.696 * s,x +   26.790 * s,y +  -35.945 * s,x +   25.878 * s,y +  -32.014 * s,x +   25.878 * s,y +  -26.904 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   25.878 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    8.300 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    8.300 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   25.878 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   25.878 * s);
			_setf(o + ( 9 << 2), y +  -46.679 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   25.878 * s,y +  -46.679 * s,x +   28.027 * s,y +  -49.771 * s,x +   30.492 * s,y +  -52.099 * s,x +   33.276 * s,y +  -53.661 * s, threshold);
			_bez(x +   33.276 * s,y +  -53.661 * s,x +   36.059 * s,y +  -55.224 * s,x +   39.127 * s,y +  -56.005 * s,x +   42.480 * s,y +  -56.005 * s, threshold);
			_bez(x +   42.480 * s,y +  -56.005 * s,x +   46.255 * s,y +  -56.005 * s,x +   49.592 * s,y +  -55.094 * s,x +   52.489 * s,y +  -53.271 * s, threshold);
			_bez(x +   52.489 * s,y +  -53.271 * s,x +   55.386 * s,y +  -51.448 * s,x +   57.583 * s,y +  -48.892 * s,x +   59.081 * s,y +  -45.605 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +  104.197 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 110:
			
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   63.378 * s);
			_setf(o + ( 1 << 2), y +  -33.300 * s);
			_setf(o + ( 2 << 2), x +   63.378 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   45.800 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   45.800 * s);
			_setf(o + ( 7 << 2), y +   -5.420 * s);
			_setf(o + ( 8 << 2), x +   45.800 * s);
			_setf(o + ( 9 << 2), y +  -25.488 * s);
			o = _posb(5);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   45.800 * s,y +  -25.488 * s,x +   45.800 * s,y +  -30.208 * s,x +   45.695 * s,y +  -33.463 * s,x +   45.483 * s,y +  -35.253 * s, threshold);
			_bez(x +   45.483 * s,y +  -35.253 * s,x +   45.271 * s,y +  -37.044 * s,x +   44.900 * s,y +  -38.359 * s,x +   44.384 * s,y +  -39.208 * s, threshold);
			_bez(x +   44.384 * s,y +  -39.208 * s,x +   43.695 * s,y +  -40.344 * s,x +   42.773 * s,y +  -41.235 * s,x +   41.601 * s,y +  -41.869 * s, threshold);
			_bez(x +   41.601 * s,y +  -41.869 * s,x +   40.429 * s,y +  -42.504 * s,x +   39.095 * s,y +  -42.822 * s,x +   37.597 * s,y +  -42.822 * s, threshold);
			_bez(x +   37.597 * s,y +  -42.822 * s,x +   33.952 * s,y +  -42.822 * s,x +   31.087 * s,y +  -41.414 * s,x +   29.004 * s,y +  -38.598 * s, threshold);
			_bez(x +   29.004 * s,y +  -38.598 * s,x +   26.920 * s,y +  -35.782 * s,x +   25.879 * s,y +  -31.884 * s,x +   25.879 * s,y +  -26.904 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   25.879 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    8.399 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    8.399 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   25.879 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   25.879 * s);
			_setf(o + ( 9 << 2), y +  -46.679 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   25.879 * s,y +  -46.679 * s,x +   28.515 * s,y +  -49.869 * s,x +   31.315 * s,y +  -52.221 * s,x +   34.277 * s,y +  -53.735 * s, threshold);
			_bez(x +   34.277 * s,y +  -53.735 * s,x +   37.239 * s,y +  -55.248 * s,x +   40.511 * s,y +  -56.005 * s,x +   44.091 * s,y +  -56.005 * s, threshold);
			_bez(x +   44.091 * s,y +  -56.005 * s,x +   50.406 * s,y +  -56.005 * s,x +   55.200 * s,y +  -54.068 * s,x +   58.471 * s,y +  -50.195 * s, threshold);
			_bez(x +   58.471 * s,y +  -50.195 * s,x +   61.743 * s,y +  -46.321 * s,x +   63.378 * s,y +  -40.689 * s,x +   63.378 * s,y +  -33.300 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   71.191 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 111:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   34.423 * s);
			_setf(o + ( 1 << 2), y +  -43.505 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   34.423 * s,y +  -43.505 * s,x +   30.549 * s,y +  -43.505 * s,x +   27.595 * s,y +  -42.114 * s,x +   25.561 * s,y +  -39.330 * s, threshold);
			_bez(x +   25.561 * s,y +  -39.330 * s,x +   23.526 * s,y +  -36.547 * s,x +   22.509 * s,y +  -32.535 * s,x +   22.509 * s,y +  -27.294 * s, threshold);
			_bez(x +   22.509 * s,y +  -27.294 * s,x +   22.509 * s,y +  -22.054 * s,x +   23.526 * s,y +  -18.042 * s,x +   25.561 * s,y +  -15.259 * s, threshold);
			_bez(x +   25.561 * s,y +  -15.259 * s,x +   27.595 * s,y +  -12.475 * s,x +   30.549 * s,y +  -11.084 * s,x +   34.423 * s,y +  -11.084 * s, threshold);
			_bez(x +   34.423 * s,y +  -11.084 * s,x +   38.232 * s,y +  -11.084 * s,x +   41.145 * s,y +  -12.475 * s,x +   43.163 * s,y +  -15.259 * s, threshold);
			_bez(x +   43.163 * s,y +  -15.259 * s,x +   45.181 * s,y +  -18.042 * s,x +   46.190 * s,y +  -22.054 * s,x +   46.190 * s,y +  -27.294 * s, threshold);
			_bez(x +   46.190 * s,y +  -27.294 * s,x +   46.190 * s,y +  -32.535 * s,x +   45.181 * s,y +  -36.547 * s,x +   43.163 * s,y +  -39.330 * s, threshold);
			_bez(x +   43.163 * s,y +  -39.330 * s,x +   41.145 * s,y +  -42.114 * s,x +   38.232 * s,y +  -43.505 * s,x +   34.423 * s,y +  -43.505 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   34.423 * s);
			_setf(o + ( 1 << 2), y +  -56.005 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   34.423 * s,y +  -56.005 * s,x +   43.830 * s,y +  -56.005 * s,x +   51.179 * s,y +  -53.466 * s,x +   56.468 * s,y +  -48.388 * s, threshold);
			_bez(x +   56.468 * s,y +  -48.388 * s,x +   61.758 * s,y +  -43.310 * s,x +   64.403 * s,y +  -36.279 * s,x +   64.403 * s,y +  -27.294 * s, threshold);
			_bez(x +   64.403 * s,y +  -27.294 * s,x +   64.403 * s,y +  -18.310 * s,x +   61.758 * s,y +  -11.279 * s,x +   56.468 * s,y +   -6.201 * s, threshold);
			_bez(x +   56.468 * s,y +   -6.201 * s,x +   51.179 * s,y +   -1.123 * s,x +   43.830 * s,y +    1.416 * s,x +   34.423 * s,y +    1.416 * s, threshold);
			_bez(x +   34.423 * s,y +    1.416 * s,x +   24.983 * s,y +    1.416 * s,x +   17.602 * s,y +   -1.123 * s,x +   12.280 * s,y +   -6.201 * s, threshold);
			_bez(x +   12.280 * s,y +   -6.201 * s,x +    6.958 * s,y +  -11.279 * s,x +    4.296 * s,y +  -18.310 * s,x +    4.296 * s,y +  -27.294 * s, threshold);
			_bez(x +    4.296 * s,y +  -27.294 * s,x +    4.296 * s,y +  -36.279 * s,x +    6.958 * s,y +  -43.310 * s,x +   12.280 * s,y +  -48.388 * s, threshold);
			_bez(x +   12.280 * s,y +  -48.388 * s,x +   17.602 * s,y +  -53.466 * s,x +   24.983 * s,y +  -56.005 * s,x +   34.423 * s,y +  -56.005 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   68.700 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 112:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   25.878 * s);
			_setf(o + ( 1 << 2), y +   -7.910 * s);
			_setf(o + ( 2 << 2), x +   25.878 * s);
			_setf(o + ( 3 << 2), y +   20.800 * s);
			_setf(o + ( 4 << 2), x +    8.398 * s);
			_setf(o + ( 5 << 2), y +   20.800 * s);
			_setf(o + ( 6 << 2), x +    8.398 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   25.878 * s);
			_setf(o + ( 9 << 2), y +  -54.687 * s);
			_setf(o + (10 << 2), x +   25.878 * s);
			_setf(o + (11 << 2), y +  -46.679 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_bez(x +   25.878 * s,y +  -46.679 * s,x +   28.287 * s,y +  -49.869 * s,x +   30.956 * s,y +  -52.221 * s,x +   33.886 * s,y +  -53.735 * s, threshold);
			_bez(x +   33.886 * s,y +  -53.735 * s,x +   36.816 * s,y +  -55.248 * s,x +   40.185 * s,y +  -56.005 * s,x +   43.993 * s,y +  -56.005 * s, threshold);
			_bez(x +   43.993 * s,y +  -56.005 * s,x +   50.731 * s,y +  -56.005 * s,x +   56.265 * s,y +  -53.328 * s,x +   60.595 * s,y +  -47.973 * s, threshold);
			_bez(x +   60.595 * s,y +  -47.973 * s,x +   64.924 * s,y +  -42.618 * s,x +   67.089 * s,y +  -35.725 * s,x +   67.089 * s,y +  -27.294 * s, threshold);
			_bez(x +   67.089 * s,y +  -27.294 * s,x +   67.089 * s,y +  -18.864 * s,x +   64.924 * s,y +  -11.971 * s,x +   60.595 * s,y +   -6.616 * s, threshold);
			_bez(x +   60.595 * s,y +   -6.616 * s,x +   56.265 * s,y +   -1.261 * s,x +   50.731 * s,y +    1.416 * s,x +   43.993 * s,y +    1.416 * s, threshold);
			_bez(x +   43.993 * s,y +    1.416 * s,x +   40.185 * s,y +    1.416 * s,x +   36.816 * s,y +    0.659 * s,x +   33.886 * s,y +   -0.854 * s, threshold);
			_bez(x +   33.886 * s,y +   -0.854 * s,x +   30.956 * s,y +   -2.368 * s,x +   28.287 * s,y +   -4.720 * s,x +   25.878 * s,y +   -7.910 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   37.499 * s);
			_setf(o + ( 1 << 2), y +  -43.310 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   37.499 * s,y +  -43.310 * s,x +   33.756 * s,y +  -43.310 * s,x +   30.883 * s,y +  -41.935 * s,x +   28.881 * s,y +  -39.184 * s, threshold);
			_bez(x +   28.881 * s,y +  -39.184 * s,x +   26.879 * s,y +  -36.433 * s,x +   25.878 * s,y +  -32.470 * s,x +   25.878 * s,y +  -27.294 * s, threshold);
			_bez(x +   25.878 * s,y +  -27.294 * s,x +   25.878 * s,y +  -22.119 * s,x +   26.879 * s,y +  -18.156 * s,x +   28.881 * s,y +  -15.405 * s, threshold);
			_bez(x +   28.881 * s,y +  -15.405 * s,x +   30.883 * s,y +  -12.654 * s,x +   33.756 * s,y +  -11.279 * s,x +   37.499 * s,y +  -11.279 * s, threshold);
			_bez(x +   37.499 * s,y +  -11.279 * s,x +   41.243 * s,y +  -11.279 * s,x +   44.099 * s,y +  -12.646 * s,x +   46.068 * s,y +  -15.381 * s, threshold);
			_bez(x +   46.068 * s,y +  -15.381 * s,x +   48.038 * s,y +  -18.115 * s,x +   49.022 * s,y +  -22.086 * s,x +   49.022 * s,y +  -27.294 * s, threshold);
			_bez(x +   49.022 * s,y +  -27.294 * s,x +   49.022 * s,y +  -32.503 * s,x +   48.038 * s,y +  -36.474 * s,x +   46.068 * s,y +  -39.208 * s, threshold);
			_bez(x +   46.068 * s,y +  -39.208 * s,x +   44.099 * s,y +  -41.943 * s,x +   41.243 * s,y +  -43.310 * s,x +   37.499 * s,y +  -43.310 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   71.581 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 113:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   34.081 * s);
			_setf(o + ( 1 << 2), y +  -43.310 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   34.081 * s,y +  -43.310 * s,x +   30.370 * s,y +  -43.310 * s,x +   27.530 * s,y +  -41.943 * s,x +   25.561 * s,y +  -39.208 * s, threshold);
			_bez(x +   25.561 * s,y +  -39.208 * s,x +   23.591 * s,y +  -36.474 * s,x +   22.607 * s,y +  -32.503 * s,x +   22.607 * s,y +  -27.294 * s, threshold);
			_bez(x +   22.607 * s,y +  -27.294 * s,x +   22.607 * s,y +  -22.086 * s,x +   23.591 * s,y +  -18.115 * s,x +   25.561 * s,y +  -15.381 * s, threshold);
			_bez(x +   25.561 * s,y +  -15.381 * s,x +   27.530 * s,y +  -12.646 * s,x +   30.370 * s,y +  -11.279 * s,x +   34.081 * s,y +  -11.279 * s, threshold);
			_bez(x +   34.081 * s,y +  -11.279 * s,x +   37.825 * s,y +  -11.279 * s,x +   40.681 * s,y +  -12.646 * s,x +   42.650 * s,y +  -15.381 * s, threshold);
			_bez(x +   42.650 * s,y +  -15.381 * s,x +   44.620 * s,y +  -18.115 * s,x +   45.604 * s,y +  -22.086 * s,x +   45.604 * s,y +  -27.294 * s, threshold);
			_bez(x +   45.604 * s,y +  -27.294 * s,x +   45.604 * s,y +  -32.503 * s,x +   44.620 * s,y +  -36.474 * s,x +   42.650 * s,y +  -39.208 * s, threshold);
			_bez(x +   42.650 * s,y +  -39.208 * s,x +   40.681 * s,y +  -41.943 * s,x +   37.825 * s,y +  -43.310 * s,x +   34.081 * s,y +  -43.310 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   45.604 * s);
			_setf(o + ( 1 << 2), y +   -7.910 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   45.604 * s,y +   -7.910 * s,x +   43.196 * s,y +   -4.687 * s,x +   40.543 * s,y +   -2.327 * s,x +   37.646 * s,y +   -0.830 * s, threshold);
			_bez(x +   37.646 * s,y +   -0.830 * s,x +   34.748 * s,y +    0.667 * s,x +   31.396 * s,y +    1.416 * s,x +   27.587 * s,y +    1.416 * s, threshold);
			_bez(x +   27.587 * s,y +    1.416 * s,x +   20.849 * s,y +    1.416 * s,x +   15.315 * s,y +   -1.261 * s,x +   10.986 * s,y +   -6.616 * s, threshold);
			_bez(x +   10.986 * s,y +   -6.616 * s,x +    6.656 * s,y +  -11.971 * s,x +    4.492 * s,y +  -18.864 * s,x +    4.492 * s,y +  -27.294 * s, threshold);
			_bez(x +    4.492 * s,y +  -27.294 * s,x +    4.492 * s,y +  -35.725 * s,x +    6.656 * s,y +  -42.602 * s,x +   10.986 * s,y +  -47.924 * s, threshold);
			_bez(x +   10.986 * s,y +  -47.924 * s,x +   15.315 * s,y +  -53.246 * s,x +   20.849 * s,y +  -55.907 * s,x +   27.587 * s,y +  -55.907 * s, threshold);
			_bez(x +   27.587 * s,y +  -55.907 * s,x +   31.396 * s,y +  -55.907 * s,x +   34.748 * s,y +  -55.159 * s,x +   37.646 * s,y +  -53.661 * s, threshold);
			_bez(x +   37.646 * s,y +  -53.661 * s,x +   40.543 * s,y +  -52.164 * s,x +   43.196 * s,y +  -49.804 * s,x +   45.604 * s,y +  -46.581 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   45.604 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   63.182 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   63.182 * s);
			_setf(o + ( 5 << 2), y +   20.800 * s);
			_setf(o + ( 6 << 2), x +   45.604 * s);
			_setf(o + ( 7 << 2), y +   20.800 * s);
			_setf(o + ( 8 << 2), x +   45.604 * s);
			_setf(o + ( 9 << 2), y +   -7.910 * s);
			_setf(o + (10 << 2), x +   71.581 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 114:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   49.023 * s);
			_setf(o + ( 1 << 2), y +  -39.794 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   49.023 * s,y +  -39.794 * s,x +   47.493 * s,y +  -40.510 * s,x +   45.971 * s,y +  -41.039 * s,x +   44.457 * s,y +  -41.381 * s, threshold);
			_bez(x +   44.457 * s,y +  -41.381 * s,x +   42.944 * s,y +  -41.723 * s,x +   41.422 * s,y +  -41.894 * s,x +   39.892 * s,y +  -41.894 * s, threshold);
			_bez(x +   39.892 * s,y +  -41.894 * s,x +   35.400 * s,y +  -41.894 * s,x +   31.941 * s,y +  -40.453 * s,x +   29.516 * s,y +  -37.573 * s, threshold);
			_bez(x +   29.516 * s,y +  -37.573 * s,x +   27.091 * s,y +  -34.692 * s,x +   25.878 * s,y +  -30.566 * s,x +   25.878 * s,y +  -25.195 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   25.878 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    8.398 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    8.398 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   25.878 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   25.878 * s);
			_setf(o + ( 9 << 2), y +  -45.702 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   25.878 * s,y +  -45.702 * s,x +   28.125 * s,y +  -49.283 * s,x +   30.704 * s,y +  -51.895 * s,x +   33.618 * s,y +  -53.539 * s, threshold);
			_bez(x +   33.618 * s,y +  -53.539 * s,x +   36.531 * s,y +  -55.183 * s,x +   40.022 * s,y +  -56.005 * s,x +   44.091 * s,y +  -56.005 * s, threshold);
			_bez(x +   44.091 * s,y +  -56.005 * s,x +   44.677 * s,y +  -56.005 * s,x +   45.312 * s,y +  -55.981 * s,x +   45.995 * s,y +  -55.932 * s, threshold);
			_bez(x +   45.995 * s,y +  -55.932 * s,x +   46.679 * s,y +  -55.883 * s,x +   47.672 * s,y +  -55.777 * s,x +   48.974 * s,y +  -55.614 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   49.023 * s);
			_setf(o + ( 1 << 2), y +  -39.794 * s);
			_setf(o + ( 2 << 2), x +   49.316 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 115:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   51.122 * s);
			_setf(o + ( 1 << 2), y +  -52.978 * s);
			_setf(o + ( 2 << 2), x +   51.122 * s);
			_setf(o + ( 3 << 2), y +  -39.697 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   51.122 * s,y +  -39.697 * s,x +   47.378 * s,y +  -41.259 * s,x +   43.765 * s,y +  -42.431 * s,x +   40.283 * s,y +  -43.212 * s, threshold);
			_bez(x +   40.283 * s,y +  -43.212 * s,x +   36.800 * s,y +  -43.993 * s,x +   33.512 * s,y +  -44.384 * s,x +   30.420 * s,y +  -44.384 * s, threshold);
			_bez(x +   30.420 * s,y +  -44.384 * s,x +   27.099 * s,y +  -44.384 * s,x +   24.634 * s,y +  -43.969 * s,x +   23.022 * s,y +  -43.139 * s, threshold);
			_bez(x +   23.022 * s,y +  -43.139 * s,x +   21.411 * s,y +  -42.309 * s,x +   20.605 * s,y +  -41.031 * s,x +   20.605 * s,y +  -39.306 * s, threshold);
			_bez(x +   20.605 * s,y +  -39.306 * s,x +   20.605 * s,y +  -37.906 * s,x +   21.216 * s,y +  -36.832 * s,x +   22.436 * s,y +  -36.083 * s, threshold);
			_bez(x +   22.436 * s,y +  -36.083 * s,x +   23.657 * s,y +  -35.335 * s,x +   25.858 * s,y +  -34.873 * s,x +   29.004 * s,y +  -34.423 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   32.080 * s);
			_setf(o + ( 1 << 2), y +  -33.984 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   32.080 * s,y +  -33.984 * s,x +   41.012 * s,y +  -32.708 * s,x +   47.053 * s,y +  -30.973 * s,x +   50.145 * s,y +  -28.369 * s, threshold);
			_bez(x +   50.145 * s,y +  -28.369 * s,x +   53.238 * s,y +  -25.765 * s,x +   54.784 * s,y +  -21.679 * s,x +   54.784 * s,y +  -16.113 * s, threshold);
			_bez(x +   54.784 * s,y +  -16.113 * s,x +   54.784 * s,y +  -10.286 * s,x +   52.636 * s,y +   -5.908 * s,x +   48.339 * s,y +   -2.978 * s, threshold);
			_bez(x +   48.339 * s,y +   -2.978 * s,x +   44.042 * s,y +   -0.049 * s,x +   37.630 * s,y +    1.416 * s,x +   29.101 * s,y +    1.416 * s, threshold);
			_bez(x +   29.101 * s,y +    1.416 * s,x +   25.488 * s,y +    1.416 * s,x +   21.753 * s,y +    1.131 * s,x +   17.895 * s,y +    0.562 * s, threshold);
			_bez(x +   17.895 * s,y +    0.562 * s,x +   14.038 * s,y +   -0.008 * s,x +   10.075 * s,y +   -0.863 * s,x +    6.006 * s,y +   -2.002 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    6.006 * s);
			_setf(o + ( 1 << 2), y +  -15.283 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    6.006 * s,y +  -15.283 * s,x +    9.489 * s,y +  -13.590 * s,x +   13.061 * s,y +  -12.321 * s,x +   16.723 * s,y +  -11.474 * s, threshold);
			_bez(x +   16.723 * s,y +  -11.474 * s,x +   20.386 * s,y +  -10.628 * s,x +   24.104 * s,y +  -10.205 * s,x +   27.881 * s,y +  -10.205 * s, threshold);
			_bez(x +   27.881 * s,y +  -10.205 * s,x +   31.299 * s,y +  -10.205 * s,x +   33.870 * s,y +  -10.677 * s,x +   35.595 * s,y +  -11.621 * s, threshold);
			_bez(x +   35.595 * s,y +  -11.621 * s,x +   37.320 * s,y +  -12.565 * s,x +   38.183 * s,y +  -13.965 * s,x +   38.183 * s,y +  -15.820 * s, threshold);
			_bez(x +   38.183 * s,y +  -15.820 * s,x +   38.183 * s,y +  -17.383 * s,x +   37.589 * s,y +  -18.546 * s,x +   36.401 * s,y +  -19.311 * s, threshold);
			_bez(x +   36.401 * s,y +  -19.311 * s,x +   35.213 * s,y +  -20.076 * s,x +   32.841 * s,y +  -20.643 * s,x +   29.296 * s,y +  -21.093 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   26.220 * s);
			_setf(o + ( 1 << 2), y +  -21.484 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   26.220 * s,y +  -21.484 * s,x +   18.442 * s,y +  -22.472 * s,x +   12.988 * s,y +  -24.267 * s,x +    9.863 * s,y +  -26.904 * s, threshold);
			_bez(x +    9.863 * s,y +  -26.904 * s,x +    6.738 * s,y +  -29.541 * s,x +    5.176 * s,y +  -33.544 * s,x +    5.176 * s,y +  -38.915 * s, threshold);
			_bez(x +    5.176 * s,y +  -38.915 * s,x +    5.176 * s,y +  -44.710 * s,x +    7.161 * s,y +  -49.006 * s,x +   11.133 * s,y +  -51.806 * s, threshold);
			_bez(x +   11.133 * s,y +  -51.806 * s,x +   15.104 * s,y +  -54.605 * s,x +   21.191 * s,y +  -56.005 * s,x +   29.394 * s,y +  -56.005 * s, threshold);
			_bez(x +   29.394 * s,y +  -56.005 * s,x +   32.617 * s,y +  -56.005 * s,x +   36.002 * s,y +  -55.761 * s,x +   39.550 * s,y +  -55.273 * s, threshold);
			_bez(x +   39.550 * s,y +  -55.273 * s,x +   43.098 * s,y +  -54.784 * s,x +   46.955 * s,y +  -54.019 * s,x +   51.122 * s,y +  -52.978 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   59.520 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 116:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   27.490 * s);
			_setf(o + ( 1 << 2), y +  -70.214 * s);
			_setf(o + ( 2 << 2), x +   27.490 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   45.507 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   45.507 * s);
			_setf(o + ( 7 << 2), y +  -42.187 * s);
			_setf(o + ( 8 << 2), x +   27.490 * s);
			_setf(o + ( 9 << 2), y +  -42.187 * s);
			_setf(o + (10 << 2), x +   27.490 * s);
			_setf(o + (11 << 2), y +  -18.994 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_bez(x +   27.490 * s,y +  -18.994 * s,x +   27.490 * s,y +  -16.455 * s,x +   27.995 * s,y +  -14.738 * s,x +   29.004 * s,y +  -13.843 * s, threshold);
			_bez(x +   29.004 * s,y +  -13.843 * s,x +   30.013 * s,y +  -12.947 * s,x +   32.015 * s,y +  -12.500 * s,x +   35.009 * s,y +  -12.500 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   43.994 * s);
			_setf(o + ( 1 << 2), y +  -12.500 * s);
			_setf(o + ( 2 << 2), x +   43.994 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   29.004 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   29.004 * s,y +       0. * s,x +   22.103 * s,y +       0. * s,x +   17.212 * s,y +   -1.440 * s,x +   14.331 * s,y +   -4.321 * s, threshold);
			_bez(x +   14.331 * s,y +   -4.321 * s,x +   11.450 * s,y +   -7.202 * s,x +   10.010 * s,y +  -12.093 * s,x +   10.010 * s,y +  -18.994 * s, threshold);
			o = _posf(14);
			_setf(o + ( 0 << 2), x +   10.010 * s);
			_setf(o + ( 1 << 2), y +  -42.187 * s);
			_setf(o + ( 2 << 2), x +    1.319 * s);
			_setf(o + ( 3 << 2), y +  -42.187 * s);
			_setf(o + ( 4 << 2), x +    1.319 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   10.010 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   10.010 * s);
			_setf(o + ( 9 << 2), y +  -70.214 * s);
			_setf(o + (10 << 2), x +   27.490 * s);
			_setf(o + (11 << 2), y +  -70.214 * s);
			_setf(o + (12 << 2), x +   47.802 * s);
			_setf(o + (13 << 2), y +       0. * s);
			o = _posb(7);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 1);
			
			case 117:
			
			o = _posf(8);
			_setf(o + ( 0 << 2), x +    7.813 * s);
			_setf(o + ( 1 << 2), y +  -21.289 * s);
			_setf(o + ( 2 << 2), x +    7.813 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   25.390 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   25.390 * s);
			_setf(o + ( 7 << 2), y +  -49.218 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_bez(x +   25.390 * s,y +  -49.218 * s,x +   25.390 * s,y +  -46.256 * s,x +   25.374 * s,y +  -42.537 * s,x +   25.342 * s,y +  -38.061 * s, threshold);
			_bez(x +   25.342 * s,y +  -38.061 * s,x +   25.309 * s,y +  -33.585 * s,x +   25.293 * s,y +  -30.598 * s,x +   25.293 * s,y +  -29.101 * s, threshold);
			_bez(x +   25.293 * s,y +  -29.101 * s,x +   25.293 * s,y +  -24.707 * s,x +   25.407 * s,y +  -21.541 * s,x +   25.635 * s,y +  -19.604 * s, threshold);
			_bez(x +   25.635 * s,y +  -19.604 * s,x +   25.862 * s,y +  -17.667 * s,x +   26.253 * s,y +  -16.260 * s,x +   26.806 * s,y +  -15.381 * s, threshold);
			_bez(x +   26.806 * s,y +  -15.381 * s,x +   27.523 * s,y +  -14.242 * s,x +   28.458 * s,y +  -13.362 * s,x +   29.614 * s,y +  -12.744 * s, threshold);
			_bez(x +   29.614 * s,y +  -12.744 * s,x +   30.770 * s,y +  -12.125 * s,x +   32.096 * s,y +  -11.816 * s,x +   33.593 * s,y +  -11.816 * s, threshold);
			_bez(x +   33.593 * s,y +  -11.816 * s,x +   37.239 * s,y +  -11.816 * s,x +   40.104 * s,y +  -13.216 * s,x +   42.187 * s,y +  -16.015 * s, threshold);
			_bez(x +   42.187 * s,y +  -16.015 * s,x +   44.270 * s,y +  -18.815 * s,x +   45.312 * s,y +  -22.705 * s,x +   45.312 * s,y +  -27.685 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   45.312 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   62.792 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   62.792 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   45.312 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   45.312 * s);
			_setf(o + ( 9 << 2), y +   -7.910 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   45.312 * s,y +   -7.910 * s,x +   42.675 * s,y +   -4.720 * s,x +   39.884 * s,y +   -2.368 * s,x +   36.938 * s,y +   -0.854 * s, threshold);
			_bez(x +   36.938 * s,y +   -0.854 * s,x +   33.992 * s,y +    0.659 * s,x +   30.745 * s,y +    1.416 * s,x +   27.197 * s,y +    1.416 * s, threshold);
			_bez(x +   27.197 * s,y +    1.416 * s,x +   20.882 * s,y +    1.416 * s,x +   16.073 * s,y +   -0.521 * s,x +   12.769 * s,y +   -4.394 * s, threshold);
			_bez(x +   12.769 * s,y +   -4.394 * s,x +    9.465 * s,y +   -8.268 * s,x +    7.813 * s,y +  -13.900 * s,x +    7.813 * s,y +  -21.289 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   71.191 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 118:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +    1.513 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   18.993 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   32.616 * s);
			_setf(o + ( 5 << 2), y +  -16.894 * s);
			_setf(o + ( 6 << 2), x +   46.190 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   63.719 * s);
			_setf(o + ( 9 << 2), y +  -54.687 * s);
			_setf(o + (10 << 2), x +   42.186 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   22.997 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +    1.513 * s);
			_setf(o + (15 << 2), y +  -54.687 * s);
			_setf(o + (16 << 2), x +   65.184 * s);
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
			_setf(o + ( 0 << 2), x +    3.516 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   20.508 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   29.687 * s);
			_setf(o + ( 5 << 2), y +  -16.992 * s);
			_setf(o + ( 6 << 2), x +   38.915 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   53.515 * s);
			_setf(o + ( 9 << 2), y +  -54.687 * s);
			_setf(o + (10 << 2), x +   62.694 * s);
			_setf(o + (11 << 2), y +  -17.383 * s);
			_setf(o + (12 << 2), x +   71.923 * s);
			_setf(o + (13 << 2), y +  -54.687 * s);
			_setf(o + (14 << 2), x +   88.915 * s);
			_setf(o + (15 << 2), y +  -54.687 * s);
			_setf(o + (16 << 2), x +   74.511 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   55.419 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   46.191 * s);
			_setf(o + (21 << 2), y +  -37.597 * s);
			_setf(o + (22 << 2), x +   37.011 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   17.920 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +    3.516 * s);
			_setf(o + (27 << 2), y +  -54.687 * s);
			_setf(o + (28 << 2), x +   92.381 * s);
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
			_setf(o + ( 0 << 2), x +   22.217 * s);
			_setf(o + ( 1 << 2), y +  -27.978 * s);
			_setf(o + ( 2 << 2), x +    2.491 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   20.996 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   32.178 * s);
			_setf(o + ( 7 << 2), y +  -38.476 * s);
			_setf(o + ( 8 << 2), x +   43.506 * s);
			_setf(o + ( 9 << 2), y +  -54.687 * s);
			_setf(o + (10 << 2), x +   62.011 * s);
			_setf(o + (11 << 2), y +  -54.687 * s);
			_setf(o + (12 << 2), x +   42.285 * s);
			_setf(o + (13 << 2), y +  -28.076 * s);
			_setf(o + (14 << 2), x +   62.988 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   44.482 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   32.178 * s);
			_setf(o + (19 << 2), y +  -17.285 * s);
			_setf(o + (20 << 2), x +   20.020 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +    1.514 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   22.217 * s);
			_setf(o + (25 << 2), y +  -27.978 * s);
			_setf(o + (26 << 2), x +   64.501 * s);
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
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +    1.221 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   18.701 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   33.398 * s);
			_setf(o + ( 5 << 2), y +  -17.578 * s);
			_setf(o + ( 6 << 2), x +   45.898 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   63.378 * s);
			_setf(o + ( 9 << 2), y +  -54.687 * s);
			_setf(o + (10 << 2), x +   40.381 * s);
			_setf(o + (11 << 2), y +    5.176 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_bez(x +   40.381 * s,y +    5.176 * s,x +   38.046 * s,y +   11.254 * s,x +   35.376 * s,y +   15.519 * s,x +   32.300 * s,y +   17.944 * s, threshold);
			_bez(x +   32.300 * s,y +   17.944 * s,x +   29.224 * s,y +   20.369 * s,x +   25.163 * s,y +   21.582 * s,x +   20.117 * s,y +   21.582 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   10.010 * s);
			_setf(o + ( 1 << 2), y +   21.582 * s);
			_setf(o + ( 2 << 2), x +   10.010 * s);
			_setf(o + ( 3 << 2), y +   10.107 * s);
			_setf(o + ( 4 << 2), x +   15.479 * s);
			_setf(o + ( 5 << 2), y +   10.107 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   15.479 * s,y +   10.107 * s,x +   18.441 * s,y +   10.107 * s,x +   20.597 * s,y +    9.635 * s,x +   21.948 * s,y +    8.691 * s, threshold);
			_bez(x +   21.948 * s,y +    8.691 * s,x +   23.299 * s,y +    7.747 * s,x +   24.314 * s,y +    6.043 * s,x +   25.098 * s,y +    3.613 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   25.586 * s);
			_setf(o + ( 1 << 2), y +    2.100 * s);
			_setf(o + ( 2 << 2), x +    1.221 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   65.185 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 122:
			
			o = _posf(24);
			_setf(o + ( 0 << 2), x +    5.713 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   53.417 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   53.417 * s);
			_setf(o + ( 5 << 2), y +  -42.480 * s);
			_setf(o + ( 6 << 2), x +   24.609 * s);
			_setf(o + ( 7 << 2), y +  -12.500 * s);
			_setf(o + ( 8 << 2), x +   53.417 * s);
			_setf(o + ( 9 << 2), y +  -12.500 * s);
			_setf(o + (10 << 2), x +   53.417 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    4.492 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +    4.492 * s);
			_setf(o + (15 << 2), y +  -12.207 * s);
			_setf(o + (16 << 2), x +   33.300 * s);
			_setf(o + (17 << 2), y +  -42.187 * s);
			_setf(o + (18 << 2), x +    5.713 * s);
			_setf(o + (19 << 2), y +  -42.187 * s);
			_setf(o + (20 << 2), x +    5.713 * s);
			_setf(o + (21 << 2), y +  -54.687 * s);
			_setf(o + (22 << 2), x +   58.202 * s);
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
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   58.691 * s);
			_setf(o + ( 1 << 2), y +    5.322 * s);
			_setf(o + ( 2 << 2), x +   58.691 * s);
			_setf(o + ( 3 << 2), y +   16.308 * s);
			_setf(o + ( 4 << 2), x +   48.095 * s);
			_setf(o + ( 5 << 2), y +   16.308 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   48.095 * s,y +   16.308 * s,x +   40.999 * s,y +   16.308 * s,x +   35.823 * s,y +   14.876 * s,x +   32.568 * s,y +   12.012 * s, threshold);
			_bez(x +   32.568 * s,y +   12.012 * s,x +   29.313 * s,y +    9.147 * s,x +   27.685 * s,y +    4.573 * s,x +   27.685 * s,y +   -1.709 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   27.685 * s);
			_setf(o + ( 1 << 2), y +  -11.084 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   27.685 * s,y +  -11.084 * s,x +   27.685 * s,y +  -15.967 * s,x +   26.806 * s,y +  -19.360 * s,x +   25.048 * s,y +  -21.264 * s, threshold);
			_bez(x +   25.048 * s,y +  -21.264 * s,x +   23.291 * s,y +  -23.169 * s,x +   20.100 * s,y +  -24.121 * s,x +   15.478 * s,y +  -24.121 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   12.500 * s);
			_setf(o + ( 1 << 2), y +  -24.121 * s);
			_setf(o + ( 2 << 2), x +   12.500 * s);
			_setf(o + ( 3 << 2), y +  -35.009 * s);
			_setf(o + ( 4 << 2), x +   15.478 * s);
			_setf(o + ( 5 << 2), y +  -35.009 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   15.478 * s,y +  -35.009 * s,x +   20.100 * s,y +  -35.009 * s,x +   23.291 * s,y +  -35.953 * s,x +   25.048 * s,y +  -37.841 * s, threshold);
			_bez(x +   25.048 * s,y +  -37.841 * s,x +   26.806 * s,y +  -39.729 * s,x +   27.685 * s,y +  -43.115 * s,x +   27.685 * s,y +  -47.997 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   27.685 * s);
			_setf(o + ( 1 << 2), y +  -58.007 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   27.685 * s,y +  -58.007 * s,x +   27.685 * s,y +  -64.289 * s,x +   29.313 * s,y +  -68.855 * s,x +   32.568 * s,y +  -71.703 * s, threshold);
			_bez(x +   32.568 * s,y +  -71.703 * s,x +   35.823 * s,y +  -74.551 * s,x +   40.999 * s,y +  -75.975 * s,x +   48.095 * s,y +  -75.975 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   58.691 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   58.691 * s);
			_setf(o + ( 3 << 2), y +  -64.989 * s);
			_setf(o + ( 4 << 2), x +   55.322 * s);
			_setf(o + ( 5 << 2), y +  -64.989 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   55.322 * s,y +  -64.989 * s,x +   50.732 * s,y +  -64.989 * s,x +   47.745 * s,y +  -64.281 * s,x +   46.362 * s,y +  -62.865 * s, threshold);
			_bez(x +   46.362 * s,y +  -62.865 * s,x +   44.978 * s,y +  -61.449 * s,x +   44.287 * s,y +  -58.430 * s,x +   44.287 * s,y +  -53.808 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   44.287 * s);
			_setf(o + ( 1 << 2), y +  -45.702 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   44.287 * s,y +  -45.702 * s,x +   44.287 * s,y +  -40.592 * s,x +   43.554 * s,y +  -36.881 * s,x +   42.089 * s,y +  -34.570 * s, threshold);
			_bez(x +   42.089 * s,y +  -34.570 * s,x +   40.625 * s,y +  -32.259 * s,x +   38.102 * s,y +  -30.696 * s,x +   34.521 * s,y +  -29.882 * s, threshold);
			_bez(x +   34.521 * s,y +  -29.882 * s,x +   38.134 * s,y +  -29.003 * s,x +   40.665 * s,y +  -27.408 * s,x +   42.114 * s,y +  -25.097 * s, threshold);
			_bez(x +   42.114 * s,y +  -25.097 * s,x +   43.562 * s,y +  -22.786 * s,x +   44.287 * s,y +  -19.091 * s,x +   44.287 * s,y +  -14.013 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   44.287 * s);
			_setf(o + ( 1 << 2), y +   -5.908 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   44.287 * s,y +   -5.908 * s,x +   44.287 * s,y +   -1.253 * s,x +   44.978 * s,y +    1.782 * s,x +   46.362 * s,y +    3.198 * s, threshold);
			_bez(x +   46.362 * s,y +    3.198 * s,x +   47.745 * s,y +    4.614 * s,x +   50.732 * s,y +    5.322 * s,x +   55.322 * s,y +    5.322 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   58.691 * s);
			_setf(o + ( 1 << 2), y +    5.322 * s);
			_setf(o + ( 2 << 2), x +   71.191 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 124:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   23.778 * s);
			_setf(o + ( 1 << 2), y +  -76.415 * s);
			_setf(o + ( 2 << 2), x +   23.778 * s);
			_setf(o + ( 3 << 2), y +   23.584 * s);
			_setf(o + ( 4 << 2), x +   12.695 * s);
			_setf(o + ( 5 << 2), y +   23.584 * s);
			_setf(o + ( 6 << 2), x +   12.695 * s);
			_setf(o + ( 7 << 2), y +  -76.415 * s);
			_setf(o + ( 8 << 2), x +   23.778 * s);
			_setf(o + ( 9 << 2), y +  -76.415 * s);
			_setf(o + (10 << 2), x +   36.522 * s);
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
			_setf(o + ( 0 << 2), x +   12.500 * s);
			_setf(o + ( 1 << 2), y +    5.322 * s);
			_setf(o + ( 2 << 2), x +   15.918 * s);
			_setf(o + ( 3 << 2), y +    5.322 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   15.918 * s,y +    5.322 * s,x +   20.475 * s,y +    5.322 * s,x +   23.446 * s,y +    4.614 * s,x +   24.829 * s,y +    3.198 * s, threshold);
			_bez(x +   24.829 * s,y +    3.198 * s,x +   26.213 * s,y +    1.782 * s,x +   26.904 * s,y +   -1.253 * s,x +   26.904 * s,y +   -5.908 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   26.904 * s);
			_setf(o + ( 1 << 2), y +  -14.013 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   26.904 * s,y +  -14.013 * s,x +   26.904 * s,y +  -19.091 * s,x +   27.637 * s,y +  -22.786 * s,x +   29.102 * s,y +  -25.097 * s, threshold);
			_bez(x +   29.102 * s,y +  -25.097 * s,x +   30.566 * s,y +  -27.408 * s,x +   33.105 * s,y +  -29.003 * s,x +   36.719 * s,y +  -29.882 * s, threshold);
			_bez(x +   36.719 * s,y +  -29.882 * s,x +   33.105 * s,y +  -30.696 * s,x +   30.566 * s,y +  -32.259 * s,x +   29.102 * s,y +  -34.570 * s, threshold);
			_bez(x +   29.102 * s,y +  -34.570 * s,x +   27.637 * s,y +  -36.881 * s,x +   26.904 * s,y +  -40.592 * s,x +   26.904 * s,y +  -45.702 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   26.904 * s);
			_setf(o + ( 1 << 2), y +  -53.808 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   26.904 * s,y +  -53.808 * s,x +   26.904 * s,y +  -58.430 * s,x +   26.213 * s,y +  -61.449 * s,x +   24.829 * s,y +  -62.865 * s, threshold);
			_bez(x +   24.829 * s,y +  -62.865 * s,x +   23.446 * s,y +  -64.281 * s,x +   20.475 * s,y +  -64.989 * s,x +   15.918 * s,y +  -64.989 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   12.500 * s);
			_setf(o + ( 1 << 2), y +  -64.989 * s);
			_setf(o + ( 2 << 2), x +   12.500 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   23.096 * s);
			_setf(o + ( 5 << 2), y +  -75.975 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   23.096 * s,y +  -75.975 * s,x +   30.192 * s,y +  -75.975 * s,x +   35.368 * s,y +  -74.551 * s,x +   38.623 * s,y +  -71.703 * s, threshold);
			_bez(x +   38.623 * s,y +  -71.703 * s,x +   41.878 * s,y +  -68.855 * s,x +   43.506 * s,y +  -64.289 * s,x +   43.506 * s,y +  -58.007 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   43.506 * s);
			_setf(o + ( 1 << 2), y +  -47.997 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   43.506 * s,y +  -47.997 * s,x +   43.506 * s,y +  -43.115 * s,x +   44.384 * s,y +  -39.729 * s,x +   46.142 * s,y +  -37.841 * s, threshold);
			_bez(x +   46.142 * s,y +  -37.841 * s,x +   47.900 * s,y +  -35.953 * s,x +   51.090 * s,y +  -35.009 * s,x +   55.712 * s,y +  -35.009 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   58.691 * s);
			_setf(o + ( 1 << 2), y +  -35.009 * s);
			_setf(o + ( 2 << 2), x +   58.691 * s);
			_setf(o + ( 3 << 2), y +  -24.121 * s);
			_setf(o + ( 4 << 2), x +   55.712 * s);
			_setf(o + ( 5 << 2), y +  -24.121 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   55.712 * s,y +  -24.121 * s,x +   51.090 * s,y +  -24.121 * s,x +   47.900 * s,y +  -23.169 * s,x +   46.142 * s,y +  -21.264 * s, threshold);
			_bez(x +   46.142 * s,y +  -21.264 * s,x +   44.384 * s,y +  -19.360 * s,x +   43.506 * s,y +  -15.967 * s,x +   43.506 * s,y +  -11.084 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   43.506 * s);
			_setf(o + ( 1 << 2), y +   -1.709 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   43.506 * s,y +   -1.709 * s,x +   43.506 * s,y +    4.573 * s,x +   41.878 * s,y +    9.147 * s,x +   38.623 * s,y +   12.012 * s, threshold);
			_bez(x +   38.623 * s,y +   12.012 * s,x +   35.368 * s,y +   14.876 * s,x +   30.192 * s,y +   16.308 * s,x +   23.096 * s,y +   16.308 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   12.500 * s);
			_setf(o + ( 1 << 2), y +   16.308 * s);
			_setf(o + ( 2 << 2), x +   12.500 * s);
			_setf(o + ( 3 << 2), y +    5.322 * s);
			_setf(o + ( 4 << 2), x +   71.191 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 126:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   73.192 * s);
			_setf(o + ( 1 << 2), y +  -41.503 * s);
			_setf(o + ( 2 << 2), x +   73.192 * s);
			_setf(o + ( 3 << 2), y +  -29.589 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   73.192 * s,y +  -29.589 * s,x +   69.741 * s,y +  -26.985 * s,x +   66.560 * s,y +  -25.122 * s,x +   63.646 * s,y +  -23.999 * s, threshold);
			_bez(x +   63.646 * s,y +  -23.999 * s,x +   60.733 * s,y +  -22.876 * s,x +   57.714 * s,y +  -22.314 * s,x +   54.589 * s,y +  -22.314 * s, threshold);
			_bez(x +   54.589 * s,y +  -22.314 * s,x +   51.106 * s,y +  -22.314 * s,x +   47.033 * s,y +  -23.250 * s,x +   42.382 * s,y +  -25.146 * s, threshold);
			_bez(x +   42.382 * s,y +  -25.146 * s,x +   41.923 * s,y +  -25.333 * s,x +   41.566 * s,y +  -25.482 * s,x +   41.308 * s,y +  -25.586 * s, threshold);
			_bez(x +   41.308 * s,y +  -25.586 * s,x +   41.078 * s,y +  -25.678 * s,x +   40.723 * s,y +  -25.832 * s,x +   40.233 * s,y +  -26.025 * s, threshold);
			_bez(x +   40.233 * s,y +  -26.025 * s,x +   35.189 * s,y +  -28.013 * s,x +   31.135 * s,y +  -29.003 * s,x +   28.075 * s,y +  -29.003 * s, threshold);
			_bez(x +   28.075 * s,y +  -29.003 * s,x +   25.211 * s,y +  -29.003 * s,x +   22.379 * s,y +  -28.377 * s,x +   19.579 * s,y +  -27.124 * s, threshold);
			_bez(x +   19.579 * s,y +  -27.124 * s,x +   16.780 * s,y +  -25.870 * s,x +   13.785 * s,y +  -23.893 * s,x +   10.595 * s,y +  -21.191 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   10.595 * s);
			_setf(o + ( 1 << 2), y +  -33.105 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   10.595 * s,y +  -33.105 * s,x +   14.078 * s,y +  -35.709 * s,x +   17.268 * s,y +  -37.573 * s,x +   20.165 * s,y +  -38.696 * s, threshold);
			_bez(x +   20.165 * s,y +  -38.696 * s,x +   23.063 * s,y +  -39.819 * s,x +   26.073 * s,y +  -40.380 * s,x +   29.198 * s,y +  -40.380 * s, threshold);
			_bez(x +   29.198 * s,y +  -40.380 * s,x +   32.682 * s,y +  -40.380 * s,x +   36.750 * s,y +  -39.434 * s,x +   41.405 * s,y +  -37.548 * s, threshold);
			_bez(x +   41.405 * s,y +  -37.548 * s,x +   41.893 * s,y +  -37.351 * s,x +   42.252 * s,y +  -37.206 * s,x +   42.480 * s,y +  -37.109 * s, threshold);
			_bez(x +   42.480 * s,y +  -37.109 * s,x +   42.707 * s,y +  -37.011 * s,x +   43.064 * s,y +  -36.862 * s,x +   43.554 * s,y +  -36.669 * s, threshold);
			_bez(x +   43.554 * s,y +  -36.669 * s,x +   48.598 * s,y +  -34.681 * s,x +   52.652 * s,y +  -33.691 * s,x +   55.712 * s,y +  -33.691 * s, threshold);
			_bez(x +   55.712 * s,y +  -33.691 * s,x +   58.511 * s,y +  -33.691 * s,x +   61.286 * s,y +  -34.301 * s,x +   64.037 * s,y +  -35.522 * s, threshold);
			_bez(x +   64.037 * s,y +  -35.522 * s,x +   66.787 * s,y +  -36.743 * s,x +   69.839 * s,y +  -38.736 * s,x +   73.192 * s,y +  -41.503 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   83.787 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
		}
	}
	#end
}