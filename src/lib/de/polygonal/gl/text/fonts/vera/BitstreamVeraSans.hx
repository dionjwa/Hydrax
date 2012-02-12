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

class BitstreamVeraSans extends de.polygonal.gl.text.ProportionalVectorFont
{
	public function new()
	{
		#if font_inline
		super(2048, 1901, -483, BOUNDS_TABLE, SPACING_TABLE, KERNING_TABLE);
		#else
		super(
		"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");
		#end
	}
	
	#if font_inline
	static var SPACING_TABLE:Array<Int> =
	[
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,  651,  821,  942, 1716, 1303, 1946, 1597,  563,
		 799,  799, 1024, 1716,  651,  739,  651,  690, 1303, 1303, 1303, 1303, 1303, 1303, 1303, 1303, 1303, 1303,  690,  690,
		1716, 1716, 1716, 1087, 2048, 1401, 1405, 1430, 1577, 1294, 1178, 1587, 1540,  604,  604, 1343, 1141, 1767, 1532, 1612,
		1235, 1612, 1423, 1300, 1251, 1499, 1401, 2025, 1403, 1251, 1403,  799,  690,  799, 1716, 1024, 1024, 1255, 1300, 1126,
		1300, 1260,  721, 1300, 1298,  569,  569, 1186,  569, 1995, 1298, 1253, 1300, 1300,  842, 1067,  803, 1298, 1212, 1675,
		1212, 1212, 1075, 1303,  690, 1303, 1716
	];

	static var KERNING_TABLE:Array<Int> =
	[
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,  127,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,  156,  201,  216,  219,    0,  226,  251,  256,    0,  259,  264,  291,    0,    0,  316,
		 331,  356,  359,  388,  391,  424,  427,  450,  473,  484,  507,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,  510,  513,    0,    0,    0,    0,  526,    0,    0,    0,  537,    0,    0,  544,    0,    0,    0,  573,  580,
		 585,  592,    0,    0,    0,    0,    0,   28,   65,  -45,   66,  -73,   71,   75,   74,  114,   79,   57,   81,   75,
		  84, -188,   86, -120,   87,  -83,   88, -102,   89, -243,  111,   38,  118,  -55,  121,  -36,   44,   45,  -45,   46,
		 -36,   58,  -36,   65,   57,   67,  -36,   71,  -36,   79,  -36,   81,  -36,   84, -159,   86, -131,   87, -112,   89,
		-159,   99,  -36,  100,  -36,  101,  -36,  102,  -73,  111,  -36,  113,  -36,  116,  -36,  118, -120,  119,  -83,  121,
		-139,   14,   67,  -36,   71,  -36,   79,  -36,   83,  -36,   86,  -63,   87,  -73,   89, -112,    2,   89,  -36,    6,
		  65,  -36,   86,  -36,   89, -112,   24,   46, -329,   58, -159,   65, -188,   83,  -36,   84,  -36,   97, -188,  101,
		-112,  105, -149,  111,  -73,  114, -149,  117, -112,  121, -188,    4,   84,  -73,   89, -102,    2,   46,  -36,    4,
		  45,  -73,   65,  -36,   26,   45, -215,   65,  -36,   67, -112,   79, -112,   84, -159,   85,  -55,   87,  -73,   89,
		 -73,   97,  -36,  101, -102,  111, -102,  117, -102,  121, -149,   24,   45,  -36,   65,   47,   79,  -73,   84, -282,
		  85, -102,   86, -225,   87, -188,   89, -272,  101,  -36,  111,  -36,  117,  -36,  121, -188,   14,   45,   57,   46,
		 -83,   58,  -36,   65,  -36,   86,  -36,   88, -131,   89, -112,   24,   45,  -45,   46, -319,   65, -131,   89,  -45,
		  97,  -92,  101,  -73,  105,  -45,  110,  -36,  111,  -73,  114,  -36,  115,  -36,  117,  -36,    2,   45,   57,   28,
		  45,  -83,   46,  -73,   58,  -63,   65,  -83,   67, -102,   84, -149,   86, -112,   87,  -83,   89, -131,   97,  -45,
		 101,  -92,  111,  -92,  117,  -92,  121, -112,    2,   65,   38,   32,   45, -188,   46, -243,   58, -225,   65, -159,
		  67, -120,   84,  -36,   97, -339,   99, -348,  101, -348,  105,  -63,  111, -348,  114, -301,  115, -339,  117, -311,
		 119, -339,  121, -319,    2,   90,  -36,   22,   45, -120,   46, -264,   58, -167,   65, -131,   79,  -36,   97, -159,
		 101, -159,  105,  -45,  111, -159,  117, -139,  121,  -55,   22,   45,  -83,   46, -235,   58, -120,   65, -112,   97,
		-131,  101, -120,  105,  -45,  111, -120,  114,  -92,  117,  -73,  121,  -36,   10,   45, -102,   67, -149,   79, -131,
		  84,  -36,  101,  -92,   22,   45, -243,   46, -415,   58, -272,   65, -159,   67, -112,   79, -112,   97, -282,  101,
		-272,  105,  -73,  111, -272,  117, -235,    2,   45,  -36,    2,  120,  -36,   12,   45, -112,   46, -149,   58,  -73,
		 116,  -36,  119,  -36,  121,  -36,   10,   97,  -36,  101,  -73,  111,  -73,  117,  -63,  121,  -73,    6,   45,   38,
		  46,  -36,  120,  -63,   28,   45, -131,   46, -188,   58,  -36,   99,  -45,  100,  -36,  101,  -45,  103,  -36,  104,
		 -36,  109,  -36,  110,  -36,  111,  -45,  113,  -36,  114,  -36,  120,  -55,    6,   45,  -55,   46, -159,   58, -112,
		   4,   46, -188,   58, -112,    6,   99,  -36,  101,  -63,  111,  -63,    6,   45,  -36,   46, -292,   58, -149
	];

	static var BOUNDS_TABLE:Array<Float> =
	[
		  33,     15.088,    -72.899,     25.000,          0,
		  34,      9.619,    -72.899,     36.376,    -45.800,
		  35,      7.714,    -71.776,     76.122,          0,
		  36,      8.301,    -75.975,     55.322,     14.697,
		  37,      5.517,    -74.218,     89.500,      1.416,
		  38,      6.298,    -74.218,     74.901,      1.416,
		  39,      9.619,    -72.899,     17.920,    -45.800,
		  40,      8.593,    -75.878,     31.005,     13.183,
		  41,      8.007,    -75.878,     30.419,     13.183,
		  42,      2.978,    -74.218,     47.021,    -28.613,
		  43,     10.596,    -62.694,     73.192,          0,
		  44,      7.715,    -12.402,     22.021,     11.621,
		  45,      4.882,    -31.396,     31.200,    -23.388,
		  46,     10.693,    -12.402,     20.996,          0,
		  47,          0,    -72.899,     33.691,      9.277,
		  48,      6.591,    -74.218,     56.981,      1.416,
		  49,     10.986,    -72.899,     54.393,          0,
		  50,      7.324,    -74.218,     53.612,          0,
		  51,      7.617,    -74.218,     55.614,      1.416,
		  52,      4.883,    -72.899,     58.007,          0,
		  53,      7.715,    -72.899,     54.882,      1.416,
		  54,      6.982,    -74.218,     57.323,      1.416,
		  55,      8.203,    -72.899,     55.077,          0,
		  56,      6.787,    -74.218,     56.787,      1.416,
		  57,      6.299,    -74.218,     56.591,      1.416,
		  58,     11.719,    -51.708,     22.022,          0,
		  59,      7.715,    -51.708,     22.021,     11.621,
		  60,     10.595,    -58.105,     73.192,     -4.590,
		  61,     10.595,    -45.409,     73.192,    -17.187,
		  62,     10.595,    -58.105,     73.192,     -4.590,
		  63,      7.178,    -74.218,     46.093,          0,
		  64,      6.591,    -70.409,     93.016,     17.383,
		  65,      0.781,    -72.899,     67.577,          0,
		  66,      9.814,    -72.899,     61.522,          0,
		  67,      5.615,    -74.218,     64.403,      1.416,
		  68,      9.814,    -72.899,     71.092,          0,
		  69,      9.814,    -72.899,     56.786,          0,
		  70,      9.814,    -72.899,     51.708,          0,
		  71,      5.615,    -74.218,     69.286,      1.416,
		  72,      9.814,    -72.899,     65.380,          0,
		  73,      9.814,    -72.899,     19.677,          0,
		  74,     -5.176,    -72.899,     19.677,     20.019,
		  75,      9.814,    -72.899,     67.674,          0,
		  76,      9.814,    -72.899,     55.175,          0,
		  77,      9.814,    -72.899,     76.512,          0,
		  78,      9.814,    -72.899,     64.989,          0,
		  79,      5.616,    -74.218,     73.095,      1.416,
		  80,      9.814,    -72.899,     56.884,          0,
		  81,      5.615,    -74.218,     73.095,     12.890,
		  82,      9.814,    -72.899,     66.600,          0,
		  83,      6.592,    -74.218,     57.910,      1.416,
		  84,     -0.293,    -72.899,     61.376,          0,
		  85,      8.691,    -72.899,     64.501,      1.416,
		  86,      0.781,    -72.899,     67.577,          0,
		  87,      3.321,    -72.899,     95.604,          0,
		  88,      2.978,    -72.899,     65.380,          0,
		  89,     -0.195,    -72.899,     61.278,          0,
		  90,      4.492,    -72.899,     64.013,          0,
		  91,      8.593,    -75.975,     29.296,     13.183,
		  92,          0,    -72.899,     33.691,      9.277,
		  93,      9.716,    -75.975,     30.419,     13.183,
		  94,     10.595,    -72.899,     73.192,    -45.702,
		  95,     -0.977,     16.601,     50.975,     23.584,
		  96,      8.301,    -79.979,     31.689,    -61.718,
		  97,      6.006,    -56.005,     52.197,      1.416,
		  98,      9.082,    -75.975,     58.007,      1.416,
		  99,      5.518,    -56.005,     48.778,      1.416,
		 100,      5.518,    -75.975,     54.394,      1.416,
		 101,      5.517,    -56.005,     56.200,      1.416,
		 102,      2.295,    -75.975,     37.109,          0,
		 103,      5.517,    -56.005,     54.394,     20.800,
		 104,      9.082,    -75.975,     54.882,          0,
		 105,      9.424,    -75.975,     18.408,          0,
		 106,     -1.807,    -75.975,     18.408,     20.800,
		 107,      9.082,    -75.975,     57.616,          0,
		 108,      9.424,    -75.975,     18.408,          0,
		 109,      9.082,    -56.005,     88.914,          0,
		 110,      9.082,    -56.005,     54.882,          0,
		 111,      5.518,    -56.005,     55.712,      1.416,
		 112,      9.082,    -56.005,     58.007,     20.800,
		 113,      5.517,    -56.005,     54.393,     20.800,
		 114,      9.082,    -56.005,     41.113,          0,
		 115,      5.420,    -56.005,     47.216,      1.416,
		 116,      2.685,    -70.214,     36.815,          0,
		 117,      8.496,    -54.687,     54.296,      1.416,
		 118,      2.978,    -54.687,     56.200,          0,
		 119,      4.199,    -54.687,     77.586,          0,
		 120,      2.880,    -54.687,     55.907,          0,
		 121,      2.979,    -54.687,     56.201,     20.800,
		 122,      4.297,    -54.687,     48.193,          0,
		 123,     12.499,    -75.975,     51.122,     16.308,
		 124,     12.695,    -76.415,     20.995,     23.584,
		 125,     12.500,    -75.975,     51.122,     16.308,
		 126,     10.596,    -39.892,     73.192,    -22.802
	];

	override function _draw(charCode:Int, x:Float, y:Float, s:Float, threshold:Float):Void
	{
		var o = 0;
		switch (charCode)
		{			
			case 33:
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +   15.088 * s);
			_setf(o + ( 1 << 2), y +  -12.402 * s);
			_setf(o + ( 2 << 2), x +   25.000 * s);
			_setf(o + ( 3 << 2), y +  -12.402 * s);
			_setf(o + ( 4 << 2), x +   25.000 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   15.088 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   15.088 * s);
			_setf(o + ( 9 << 2), y +  -12.402 * s);
			_setf(o + (10 << 2), x +   15.088 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   25.000 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   25.000 * s);
			_setf(o + (15 << 2), y +  -40.917 * s);
			_setf(o + (16 << 2), x +   24.023 * s);
			_setf(o + (17 << 2), y +  -23.486 * s);
			_setf(o + (18 << 2), x +   16.113 * s);
			_setf(o + (19 << 2), y +  -23.486 * s);
			_setf(o + (20 << 2), x +   15.088 * s);
			_setf(o + (21 << 2), y +  -40.917 * s);
			_setf(o + (22 << 2), x +   15.088 * s);
			_setf(o + (23 << 2), y +  -72.899 * s);
			_setf(o + (24 << 2), x +   40.087 * s);
			_setf(o + (25 << 2), y +       0. * s);
			o = _posb(13);
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
			
			case 34:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +   17.920 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   17.920 * s);
			_setf(o + ( 3 << 2), y +  -45.800 * s);
			_setf(o + ( 4 << 2), x +    9.619 * s);
			_setf(o + ( 5 << 2), y +  -45.800 * s);
			_setf(o + ( 6 << 2), x +    9.619 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   17.920 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   36.376 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   36.376 * s);
			_setf(o + (13 << 2), y +  -45.800 * s);
			_setf(o + (14 << 2), x +   28.076 * s);
			_setf(o + (15 << 2), y +  -45.800 * s);
			_setf(o + (16 << 2), x +   28.076 * s);
			_setf(o + (17 << 2), y +  -72.899 * s);
			_setf(o + (18 << 2), x +   36.376 * s);
			_setf(o + (19 << 2), y +  -72.899 * s);
			_setf(o + (20 << 2), x +   45.995 * s);
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
			_setf(o + ( 0 << 2), x +   51.122 * s);
			_setf(o + ( 1 << 2), y +  -43.993 * s);
			_setf(o + ( 2 << 2), x +   36.913 * s);
			_setf(o + ( 3 << 2), y +  -43.993 * s);
			_setf(o + ( 4 << 2), x +   32.812 * s);
			_setf(o + ( 5 << 2), y +  -27.685 * s);
			_setf(o + ( 6 << 2), x +   47.118 * s);
			_setf(o + ( 7 << 2), y +  -27.685 * s);
			_setf(o + ( 8 << 2), x +   51.122 * s);
			_setf(o + ( 9 << 2), y +  -43.993 * s);
			_setf(o + (10 << 2), x +   43.798 * s);
			_setf(o + (11 << 2), y +  -71.776 * s);
			_setf(o + (12 << 2), x +   38.720 * s);
			_setf(o + (13 << 2), y +  -51.513 * s);
			_setf(o + (14 << 2), x +   52.977 * s);
			_setf(o + (15 << 2), y +  -51.513 * s);
			_setf(o + (16 << 2), x +   58.104 * s);
			_setf(o + (17 << 2), y +  -71.776 * s);
			_setf(o + (18 << 2), x +   65.917 * s);
			_setf(o + (19 << 2), y +  -71.776 * s);
			_setf(o + (20 << 2), x +   60.887 * s);
			_setf(o + (21 << 2), y +  -51.513 * s);
			_setf(o + (22 << 2), x +   76.122 * s);
			_setf(o + (23 << 2), y +  -51.513 * s);
			_setf(o + (24 << 2), x +   76.122 * s);
			_setf(o + (25 << 2), y +  -43.993 * s);
			_setf(o + (26 << 2), x +   58.983 * s);
			_setf(o + (27 << 2), y +  -43.993 * s);
			_setf(o + (28 << 2), x +   54.979 * s);
			_setf(o + (29 << 2), y +  -27.685 * s);
			_setf(o + (30 << 2), x +   70.506 * s);
			_setf(o + (31 << 2), y +  -27.685 * s);
			_setf(o + (32 << 2), x +   70.506 * s);
			_setf(o + (33 << 2), y +  -20.215 * s);
			_setf(o + (34 << 2), x +   53.075 * s);
			_setf(o + (35 << 2), y +  -20.215 * s);
			_setf(o + (36 << 2), x +   47.997 * s);
			_setf(o + (37 << 2), y +       0. * s);
			_setf(o + (38 << 2), x +   40.185 * s);
			_setf(o + (39 << 2), y +       0. * s);
			_setf(o + (40 << 2), x +   45.214 * s);
			_setf(o + (41 << 2), y +  -20.215 * s);
			_setf(o + (42 << 2), x +   30.907 * s);
			_setf(o + (43 << 2), y +  -20.215 * s);
			_setf(o + (44 << 2), x +   25.878 * s);
			_setf(o + (45 << 2), y +       0. * s);
			_setf(o + (46 << 2), x +   18.017 * s);
			_setf(o + (47 << 2), y +       0. * s);
			_setf(o + (48 << 2), x +   23.095 * s);
			_setf(o + (49 << 2), y +  -20.215 * s);
			_setf(o + (50 << 2), x +    7.714 * s);
			_setf(o + (51 << 2), y +  -20.215 * s);
			_setf(o + (52 << 2), x +    7.714 * s);
			_setf(o + (53 << 2), y +  -27.685 * s);
			_setf(o + (54 << 2), x +   24.902 * s);
			_setf(o + (55 << 2), y +  -27.685 * s);
			_setf(o + (56 << 2), x +   29.003 * s);
			_setf(o + (57 << 2), y +  -43.993 * s);
			_setf(o + (58 << 2), x +   13.281 * s);
			_setf(o + (59 << 2), y +  -43.993 * s);
			_setf(o + (60 << 2), x +   13.281 * s);
			_setf(o + (61 << 2), y +  -51.513 * s);
			_setf(o + (62 << 2), x +   30.907 * s);
			_setf(o + (63 << 2), y +  -51.513 * s);
			_setf(o + (64 << 2), x +   35.888 * s);
			_setf(o + (65 << 2), y +  -71.776 * s);
			_setf(o + (66 << 2), x +   43.798 * s);
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
			_setf(o + ( 0 << 2), x +   33.789 * s);
			_setf(o + ( 1 << 2), y +   14.697 * s);
			_setf(o + ( 2 << 2), x +   28.906 * s);
			_setf(o + ( 3 << 2), y +   14.697 * s);
			_setf(o + ( 4 << 2), x +   28.857 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   28.857 * s,y +       0. * s,x +   25.439 * s,y +   -0.065 * s,x +   22.022 * s,y +   -0.464 * s,x +   18.604 * s,y +   -1.196 * s, threshold);
			_bez(x +   18.604 * s,y +   -1.196 * s,x +   15.186 * s,y +   -1.929 * s,x +   11.752 * s,y +   -3.027 * s,x +    8.301 * s,y +   -4.492 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    8.301 * s);
			_setf(o + ( 1 << 2), y +  -13.281 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    8.301 * s,y +  -13.281 * s,x +   11.621 * s,y +  -11.198 * s,x +   14.982 * s,y +   -9.627 * s,x +   18.384 * s,y +   -8.569 * s, threshold);
			_bez(x +   18.384 * s,y +   -8.569 * s,x +   21.786 * s,y +   -7.511 * s,x +   25.293 * s,y +   -6.966 * s,x +   28.906 * s,y +   -6.933 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   28.906 * s);
			_setf(o + ( 1 << 2), y +  -29.199 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   28.906 * s,y +  -29.199 * s,x +   21.712 * s,y +  -30.371 * s,x +   16.480 * s,y +  -32.356 * s,x +   13.208 * s,y +  -35.156 * s, threshold);
			_bez(x +   13.208 * s,y +  -35.156 * s,x +    9.937 * s,y +  -37.955 * s,x +    8.301 * s,y +  -41.796 * s,x +    8.301 * s,y +  -46.679 * s, threshold);
			_bez(x +    8.301 * s,y +  -46.679 * s,x +    8.301 * s,y +  -51.985 * s,x +   10.075 * s,y +  -56.168 * s,x +   13.623 * s,y +  -59.228 * s, threshold);
			_bez(x +   13.623 * s,y +  -59.228 * s,x +   17.171 * s,y +  -62.287 * s,x +   22.266 * s,y +  -64.045 * s,x +   28.906 * s,y +  -64.501 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   28.906 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   33.789 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   33.789 * s);
			_setf(o + ( 5 << 2), y +  -64.647 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   33.789 * s,y +  -64.647 * s,x +   36.816 * s,y +  -64.517 * s,x +   39.746 * s,y +  -64.200 * s,x +   42.578 * s,y +  -63.695 * s, threshold);
			_bez(x +   42.578 * s,y +  -63.695 * s,x +   45.410 * s,y +  -63.191 * s,x +   48.177 * s,y +  -62.499 * s,x +   50.879 * s,y +  -61.620 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   50.879 * s);
			_setf(o + ( 1 << 2), y +  -53.075 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   50.879 * s,y +  -53.075 * s,x +   48.177 * s,y +  -54.443 * s,x +   45.402 * s,y +  -55.500 * s,x +   42.553 * s,y +  -56.249 * s, threshold);
			_bez(x +   42.553 * s,y +  -56.249 * s,x +   39.705 * s,y +  -56.998 * s,x +   36.784 * s,y +  -57.437 * s,x +   33.789 * s,y +  -57.567 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   33.789 * s);
			_setf(o + ( 1 << 2), y +  -36.718 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   33.789 * s,y +  -36.718 * s,x +   41.178 * s,y +  -35.579 * s,x +   46.614 * s,y +  -33.544 * s,x +   50.097 * s,y +  -30.615 * s, threshold);
			_bez(x +   50.097 * s,y +  -30.615 * s,x +   53.580 * s,y +  -27.685 * s,x +   55.322 * s,y +  -23.682 * s,x +   55.322 * s,y +  -18.603 * s, threshold);
			_bez(x +   55.322 * s,y +  -18.603 * s,x +   55.322 * s,y +  -13.102 * s,x +   53.475 * s,y +   -8.765 * s,x +   49.780 * s,y +   -5.591 * s, threshold);
			_bez(x +   49.780 * s,y +   -5.591 * s,x +   46.085 * s,y +   -2.417 * s,x +   40.755 * s,y +   -0.586 * s,x +   33.789 * s,y +   -0.098 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   33.789 * s);
			_setf(o + ( 1 << 2), y +   14.697 * s);
			_setf(o + ( 2 << 2), x +   28.906 * s);
			_setf(o + ( 3 << 2), y +  -37.597 * s);
			_setf(o + ( 4 << 2), x +   28.906 * s);
			_setf(o + ( 5 << 2), y +  -57.616 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_setb(o +  2, 2);
			_bez(x +   28.906 * s,y +  -57.616 * s,x +   25.130 * s,y +  -57.193 * s,x +   22.249 * s,y +  -56.119 * s,x +   20.264 * s,y +  -54.394 * s, threshold);
			_bez(x +   20.264 * s,y +  -54.394 * s,x +   18.278 * s,y +  -52.668 * s,x +   17.285 * s,y +  -50.373 * s,x +   17.285 * s,y +  -47.509 * s, threshold);
			_bez(x +   17.285 * s,y +  -47.509 * s,x +   17.285 * s,y +  -44.710 * s,x +   18.205 * s,y +  -42.529 * s,x +   20.044 * s,y +  -40.966 * s, threshold);
			_bez(x +   20.044 * s,y +  -40.966 * s,x +   21.883 * s,y +  -39.404 * s,x +   24.837 * s,y +  -38.281 * s,x +   28.906 * s,y +  -37.597 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   33.789 * s);
			_setf(o + ( 1 << 2), y +  -28.222 * s);
			_setf(o + ( 2 << 2), x +   33.789 * s);
			_setf(o + ( 3 << 2), y +   -7.080 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   33.789 * s,y +   -7.080 * s,x +   37.923 * s,y +   -7.633 * s,x +   41.040 * s,y +   -8.805 * s,x +   43.139 * s,y +  -10.596 * s, threshold);
			_bez(x +   43.139 * s,y +  -10.596 * s,x +   45.239 * s,y +  -12.386 * s,x +   46.289 * s,y +  -14.746 * s,x +   46.289 * s,y +  -17.676 * s, threshold);
			_bez(x +   46.289 * s,y +  -17.676 * s,x +   46.289 * s,y +  -20.540 * s,x +   45.288 * s,y +  -22.819 * s,x +   43.286 * s,y +  -24.511 * s, threshold);
			_bez(x +   43.286 * s,y +  -24.511 * s,x +   41.284 * s,y +  -26.204 * s,x +   38.118 * s,y +  -27.441 * s,x +   33.789 * s,y +  -28.222 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   63.623 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 37:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   72.703 * s);
			_setf(o + ( 1 << 2), y +  -32.080 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   72.703 * s,y +  -32.080 * s,x +   69.871 * s,y +  -32.080 * s,x +   67.650 * s,y +  -30.875 * s,x +   66.039 * s,y +  -28.466 * s, threshold);
			_bez(x +   66.039 * s,y +  -28.466 * s,x +   64.427 * s,y +  -26.058 * s,x +   63.622 * s,y +  -22.705 * s,x +   63.622 * s,y +  -18.408 * s, threshold);
			_bez(x +   63.622 * s,y +  -18.408 * s,x +   63.622 * s,y +  -14.176 * s,x +   64.427 * s,y +  -10.848 * s,x +   66.039 * s,y +   -8.423 * s, threshold);
			_bez(x +   66.039 * s,y +   -8.423 * s,x +   67.650 * s,y +   -5.998 * s,x +   69.871 * s,y +   -4.785 * s,x +   72.703 * s,y +   -4.785 * s, threshold);
			_bez(x +   72.703 * s,y +   -4.785 * s,x +   75.470 * s,y +   -4.785 * s,x +   77.659 * s,y +   -5.998 * s,x +   79.271 * s,y +   -8.423 * s, threshold);
			_bez(x +   79.271 * s,y +   -8.423 * s,x +   80.882 * s,y +  -10.848 * s,x +   81.688 * s,y +  -14.176 * s,x +   81.688 * s,y +  -18.408 * s, threshold);
			_bez(x +   81.688 * s,y +  -18.408 * s,x +   81.688 * s,y +  -22.672 * s,x +   80.882 * s,y +  -26.017 * s,x +   79.271 * s,y +  -28.442 * s, threshold);
			_bez(x +   79.271 * s,y +  -28.442 * s,x +   77.659 * s,y +  -30.867 * s,x +   75.470 * s,y +  -32.080 * s,x +   72.703 * s,y +  -32.080 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   72.703 * s);
			_setf(o + ( 1 << 2), y +  -38.281 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   72.703 * s,y +  -38.281 * s,x +   77.846 * s,y +  -38.281 * s,x +   81.932 * s,y +  -36.490 * s,x +   84.959 * s,y +  -32.910 * s, threshold);
			_bez(x +   84.959 * s,y +  -32.910 * s,x +   87.986 * s,y +  -29.329 * s,x +   89.500 * s,y +  -24.495 * s,x +   89.500 * s,y +  -18.408 * s, threshold);
			_bez(x +   89.500 * s,y +  -18.408 * s,x +   89.500 * s,y +  -12.321 * s,x +   87.978 * s,y +   -7.495 * s,x +   84.935 * s,y +   -3.931 * s, threshold);
			_bez(x +   84.935 * s,y +   -3.931 * s,x +   81.891 * s,y +   -0.366 * s,x +   77.814 * s,y +    1.416 * s,x +   72.703 * s,y +    1.416 * s, threshold);
			_bez(x +   72.703 * s,y +    1.416 * s,x +   67.495 * s,y +    1.416 * s,x +   63.377 * s,y +   -0.366 * s,x +   60.350 * s,y +   -3.931 * s, threshold);
			_bez(x +   60.350 * s,y +   -3.931 * s,x +   57.323 * s,y +   -7.495 * s,x +   55.809 * s,y +  -12.321 * s,x +   55.809 * s,y +  -18.408 * s, threshold);
			_bez(x +   55.809 * s,y +  -18.408 * s,x +   55.809 * s,y +  -24.527 * s,x +   57.331 * s,y +  -29.370 * s,x +   60.375 * s,y +  -32.934 * s, threshold);
			_bez(x +   60.375 * s,y +  -32.934 * s,x +   63.418 * s,y +  -36.498 * s,x +   67.528 * s,y +  -38.281 * s,x +   72.703 * s,y +  -38.281 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   22.314 * s);
			_setf(o + ( 1 << 2), y +  -68.017 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   22.314 * s,y +  -68.017 * s,x +   19.514 * s,y +  -68.017 * s,x +   17.309 * s,y +  -66.804 * s,x +   15.698 * s,y +  -64.379 * s, threshold);
			_bez(x +   15.698 * s,y +  -64.379 * s,x +   14.086 * s,y +  -61.954 * s,x +   13.281 * s,y +  -58.625 * s,x +   13.281 * s,y +  -54.394 * s, threshold);
			_bez(x +   13.281 * s,y +  -54.394 * s,x +   13.281 * s,y +  -50.097 * s,x +   14.078 * s,y +  -46.744 * s,x +   15.673 * s,y +  -44.335 * s, threshold);
			_bez(x +   15.673 * s,y +  -44.335 * s,x +   17.268 * s,y +  -41.926 * s,x +   19.482 * s,y +  -40.722 * s,x +   22.314 * s,y +  -40.722 * s, threshold);
			_bez(x +   22.314 * s,y +  -40.722 * s,x +   25.146 * s,y +  -40.722 * s,x +   27.367 * s,y +  -41.926 * s,x +   28.979 * s,y +  -44.335 * s, threshold);
			_bez(x +   28.979 * s,y +  -44.335 * s,x +   30.590 * s,y +  -46.744 * s,x +   31.396 * s,y +  -50.097 * s,x +   31.396 * s,y +  -54.394 * s, threshold);
			_bez(x +   31.396 * s,y +  -54.394 * s,x +   31.396 * s,y +  -58.593 * s,x +   30.582 * s,y +  -61.913 * s,x +   28.954 * s,y +  -64.354 * s, threshold);
			_bez(x +   28.954 * s,y +  -64.354 * s,x +   27.327 * s,y +  -66.796 * s,x +   25.113 * s,y +  -68.017 * s,x +   22.314 * s,y +  -68.017 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   66.405 * s);
			_setf(o + ( 1 << 2), y +  -74.218 * s);
			_setf(o + ( 2 << 2), x +   74.217 * s);
			_setf(o + ( 3 << 2), y +  -74.218 * s);
			_setf(o + ( 4 << 2), x +   28.612 * s);
			_setf(o + ( 5 << 2), y +    1.416 * s);
			_setf(o + ( 6 << 2), x +   20.800 * s);
			_setf(o + ( 7 << 2), y +    1.416 * s);
			_setf(o + ( 8 << 2), x +   66.405 * s);
			_setf(o + ( 9 << 2), y +  -74.218 * s);
			_setf(o + (10 << 2), x +   22.314 * s);
			_setf(o + (11 << 2), y +  -74.218 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_bez(x +   22.314 * s,y +  -74.218 * s,x +   27.457 * s,y +  -74.218 * s,x +   31.558 * s,y +  -72.435 * s,x +   34.618 * s,y +  -68.871 * s, threshold);
			_bez(x +   34.618 * s,y +  -68.871 * s,x +   37.678 * s,y +  -65.307 * s,x +   39.208 * s,y +  -60.481 * s,x +   39.208 * s,y +  -54.394 * s, threshold);
			_bez(x +   39.208 * s,y +  -54.394 * s,x +   39.208 * s,y +  -48.241 * s,x +   37.686 * s,y +  -43.391 * s,x +   34.643 * s,y +  -39.843 * s, threshold);
			_bez(x +   34.643 * s,y +  -39.843 * s,x +   31.599 * s,y +  -36.295 * s,x +   27.489 * s,y +  -34.521 * s,x +   22.314 * s,y +  -34.521 * s, threshold);
			_bez(x +   22.314 * s,y +  -34.521 * s,x +   17.138 * s,y +  -34.521 * s,x +   13.045 * s,y +  -36.303 * s,x +   10.034 * s,y +  -39.868 * s, threshold);
			_bez(x +   10.034 * s,y +  -39.868 * s,x +    7.023 * s,y +  -43.432 * s,x +    5.517 * s,y +  -48.274 * s,x +    5.517 * s,y +  -54.394 * s, threshold);
			_bez(x +    5.517 * s,y +  -54.394 * s,x +    5.517 * s,y +  -60.448 * s,x +    7.031 * s,y +  -65.266 * s,x +   10.058 * s,y +  -68.847 * s, threshold);
			_bez(x +   10.058 * s,y +  -68.847 * s,x +   13.085 * s,y +  -72.427 * s,x +   17.170 * s,y +  -74.218 * s,x +   22.314 * s,y +  -74.218 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   95.018 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 38:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   24.316 * s);
			_setf(o + ( 1 << 2), y +  -39.208 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   24.316 * s,y +  -39.208 * s,x +   21.353 * s,y +  -36.572 * s,x +   19.181 * s,y +  -33.943 * s,x +   17.797 * s,y +  -31.323 * s, threshold);
			_bez(x +   17.797 * s,y +  -31.323 * s,x +   16.414 * s,y +  -28.702 * s,x +   15.722 * s,y +  -25.960 * s,x +   15.722 * s,y +  -23.095 * s, threshold);
			_bez(x +   15.722 * s,y +  -23.095 * s,x +   15.722 * s,y +  -18.343 * s,x +   17.447 * s,y +  -14.388 * s,x +   20.898 * s,y +  -11.230 * s, threshold);
			_bez(x +   20.898 * s,y +  -11.230 * s,x +   24.348 * s,y +   -8.073 * s,x +   28.678 * s,y +   -6.494 * s,x +   33.886 * s,y +   -6.494 * s, threshold);
			_bez(x +   33.886 * s,y +   -6.494 * s,x +   36.978 * s,y +   -6.494 * s,x +   39.875 * s,y +   -7.007 * s,x +   42.577 * s,y +   -8.032 * s, threshold);
			_bez(x +   42.577 * s,y +   -8.032 * s,x +   45.279 * s,y +   -9.057 * s,x +   47.818 * s,y +  -10.612 * s,x +   50.194 * s,y +  -12.695 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   24.316 * s);
			_setf(o + ( 1 << 2), y +  -39.208 * s);
			_setf(o + ( 2 << 2), x +   31.200 * s);
			_setf(o + ( 3 << 2), y +  -44.677 * s);
			_setf(o + ( 4 << 2), x +   56.005 * s);
			_setf(o + ( 5 << 2), y +  -19.287 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_setb(o +  2, 2);
			_bez(x +   56.005 * s,y +  -19.287 * s,x +   57.925 * s,y +  -22.184 * s,x +   59.422 * s,y +  -25.284 * s,x +   60.497 * s,y +  -28.588 * s, threshold);
			_bez(x +   60.497 * s,y +  -28.588 * s,x +   61.571 * s,y +  -31.892 * s,x +   62.206 * s,y +  -35.400 * s,x +   62.401 * s,y +  -39.111 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   71.483 * s);
			_setf(o + ( 1 << 2), y +  -39.111 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   71.483 * s,y +  -39.111 * s,x +   71.092 * s,y +  -34.814 * s,x +   70.051 * s,y +  -30.566 * s,x +   68.358 * s,y +  -26.367 * s, threshold);
			_bez(x +   68.358 * s,y +  -26.367 * s,x +   66.665 * s,y +  -22.168 * s,x +   64.305 * s,y +  -18.017 * s,x +   61.278 * s,y +  -13.916 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   74.901 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   62.596 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   55.614 * s);
			_setf(o + ( 5 << 2), y +   -7.178 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   55.614 * s,y +   -7.178 * s,x +   52.229 * s,y +   -4.281 * s,x +   48.680 * s,y +   -2.124 * s,x +   44.970 * s,y +   -0.708 * s, threshold);
			_bez(x +   44.970 * s,y +   -0.708 * s,x +   41.259 * s,y +    0.708 * s,x +   37.271 * s,y +    1.416 * s,x +   33.007 * s,y +    1.416 * s, threshold);
			_bez(x +   33.007 * s,y +    1.416 * s,x +   25.162 * s,y +    1.416 * s,x +   18.749 * s,y +   -0.822 * s,x +   13.769 * s,y +   -5.298 * s, threshold);
			_bez(x +   13.769 * s,y +   -5.298 * s,x +    8.788 * s,y +   -9.774 * s,x +    6.298 * s,y +  -15.511 * s,x +    6.298 * s,y +  -22.509 * s, threshold);
			_bez(x +    6.298 * s,y +  -22.509 * s,x +    6.298 * s,y +  -26.676 * s,x +    7.389 * s,y +  -30.590 * s,x +    9.570 * s,y +  -34.252 * s, threshold);
			_bez(x +    9.570 * s,y +  -34.252 * s,x +   11.751 * s,y +  -37.914 * s,x +   15.022 * s,y +  -41.357 * s,x +   19.384 * s,y +  -44.579 * s, threshold);
			_bez(x +   19.384 * s,y +  -44.579 * s,x +   17.822 * s,y +  -46.630 * s,x +   16.633 * s,y +  -48.673 * s,x +   15.820 * s,y +  -50.707 * s, threshold);
			_bez(x +   15.820 * s,y +  -50.707 * s,x +   15.006 * s,y +  -52.742 * s,x +   14.599 * s,y +  -54.735 * s,x +   14.599 * s,y +  -56.689 * s, threshold);
			_bez(x +   14.599 * s,y +  -56.689 * s,x +   14.599 * s,y +  -61.962 * s,x +   16.406 * s,y +  -66.202 * s,x +   20.019 * s,y +  -69.408 * s, threshold);
			_bez(x +   20.019 * s,y +  -69.408 * s,x +   23.632 * s,y +  -72.614 * s,x +   28.433 * s,y +  -74.218 * s,x +   34.423 * s,y +  -74.218 * s, threshold);
			_bez(x +   34.423 * s,y +  -74.218 * s,x +   37.125 * s,y +  -74.218 * s,x +   39.818 * s,y +  -73.925 * s,x +   42.504 * s,y +  -73.339 * s, threshold);
			_bez(x +   42.504 * s,y +  -73.339 * s,x +   45.189 * s,y +  -72.753 * s,x +   47.915 * s,y +  -71.874 * s,x +   50.682 * s,y +  -70.702 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   50.682 * s);
			_setf(o + ( 1 << 2), y +  -61.815 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   50.682 * s,y +  -61.815 * s,x +   47.850 * s,y +  -63.345 * s,x +   45.149 * s,y +  -64.509 * s,x +   42.577 * s,y +  -65.307 * s, threshold);
			_bez(x +   42.577 * s,y +  -65.307 * s,x +   40.005 * s,y +  -66.104 * s,x +   37.613 * s,y +  -66.503 * s,x +   35.399 * s,y +  -66.503 * s, threshold);
			_bez(x +   35.399 * s,y +  -66.503 * s,x +   31.981 * s,y +  -66.503 * s,x +   29.206 * s,y +  -65.600 * s,x +   27.074 * s,y +  -63.793 * s, threshold);
			_bez(x +   27.074 * s,y +  -63.793 * s,x +   24.942 * s,y +  -61.986 * s,x +   23.876 * s,y +  -59.651 * s,x +   23.876 * s,y +  -56.786 * s, threshold);
			_bez(x +   23.876 * s,y +  -56.786 * s,x +   23.876 * s,y +  -55.126 * s,x +   24.356 * s,y +  -53.458 * s,x +   25.317 * s,y +  -51.781 * s, threshold);
			_bez(x +   25.317 * s,y +  -51.781 * s,x +   26.277 * s,y +  -50.105 * s,x +   28.224 * s,y +  -47.723 * s,x +   31.200 * s,y +  -44.677 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   77.977 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 39:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   17.920 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   17.920 * s);
			_setf(o + ( 3 << 2), y +  -45.800 * s);
			_setf(o + ( 4 << 2), x +    9.619 * s);
			_setf(o + ( 5 << 2), y +  -45.800 * s);
			_setf(o + ( 6 << 2), x +    9.619 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   17.920 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   27.490 * s);
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
			_setf(o + ( 0 << 2), x +   31.005 * s);
			_setf(o + ( 1 << 2), y +  -75.878 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   31.005 * s,y +  -75.878 * s,x +   26.643 * s,y +  -68.391 * s,x +   23.404 * s,y +  -60.985 * s,x +   21.288 * s,y +  -53.661 * s, threshold);
			_bez(x +   21.288 * s,y +  -53.661 * s,x +   19.173 * s,y +  -46.337 * s,x +   18.115 * s,y +  -38.915 * s,x +   18.115 * s,y +  -31.396 * s, threshold);
			_bez(x +   18.115 * s,y +  -31.396 * s,x +   18.115 * s,y +  -23.877 * s,x +   19.181 * s,y +  -16.430 * s,x +   21.313 * s,y +   -9.057 * s, threshold);
			_bez(x +   21.313 * s,y +   -9.057 * s,x +   23.445 * s,y +   -1.685 * s,x +   26.676 * s,y +    5.729 * s,x +   31.005 * s,y +   13.183 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   23.193 * s);
			_setf(o + ( 1 << 2), y +   13.183 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   23.193 * s,y +   13.183 * s,x +   18.310 * s,y +    5.534 * s,x +   14.656 * s,y +   -1.986 * s,x +   12.231 * s,y +   -9.375 * s, threshold);
			_bez(x +   12.231 * s,y +   -9.375 * s,x +    9.806 * s,y +  -16.764 * s,x +    8.593 * s,y +  -24.105 * s,x +    8.593 * s,y +  -31.396 * s, threshold);
			_bez(x +    8.593 * s,y +  -31.396 * s,x +    8.593 * s,y +  -38.655 * s,x +    9.798 * s,y +  -45.963 * s,x +   12.207 * s,y +  -53.319 * s, threshold);
			_bez(x +   12.207 * s,y +  -53.319 * s,x +   14.615 * s,y +  -60.676 * s,x +   18.277 * s,y +  -68.196 * s,x +   23.193 * s,y +  -75.878 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   31.005 * s);
			_setf(o + ( 1 << 2), y +  -75.878 * s);
			_setf(o + ( 2 << 2), x +   39.013 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 41:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    8.007 * s);
			_setf(o + ( 1 << 2), y +  -75.878 * s);
			_setf(o + ( 2 << 2), x +   15.820 * s);
			_setf(o + ( 3 << 2), y +  -75.878 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   15.820 * s,y +  -75.878 * s,x +   20.703 * s,y +  -68.196 * s,x +   24.356 * s,y +  -60.676 * s,x +   26.782 * s,y +  -53.319 * s, threshold);
			_bez(x +   26.782 * s,y +  -53.319 * s,x +   29.207 * s,y +  -45.963 * s,x +   30.419 * s,y +  -38.655 * s,x +   30.419 * s,y +  -31.396 * s, threshold);
			_bez(x +   30.419 * s,y +  -31.396 * s,x +   30.419 * s,y +  -24.105 * s,x +   29.207 * s,y +  -16.764 * s,x +   26.782 * s,y +   -9.375 * s, threshold);
			_bez(x +   26.782 * s,y +   -9.375 * s,x +   24.356 * s,y +   -1.986 * s,x +   20.703 * s,y +    5.534 * s,x +   15.820 * s,y +   13.183 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    8.007 * s);
			_setf(o + ( 1 << 2), y +   13.183 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    8.007 * s,y +   13.183 * s,x +   12.337 * s,y +    5.729 * s,x +   15.568 * s,y +   -1.685 * s,x +   17.700 * s,y +   -9.057 * s, threshold);
			_bez(x +   17.700 * s,y +   -9.057 * s,x +   19.832 * s,y +  -16.430 * s,x +   20.898 * s,y +  -23.877 * s,x +   20.898 * s,y +  -31.396 * s, threshold);
			_bez(x +   20.898 * s,y +  -31.396 * s,x +   20.898 * s,y +  -38.915 * s,x +   19.832 * s,y +  -46.337 * s,x +   17.700 * s,y +  -53.661 * s, threshold);
			_bez(x +   17.700 * s,y +  -53.661 * s,x +   15.568 * s,y +  -60.985 * s,x +   12.337 * s,y +  -68.391 * s,x +    8.007 * s,y +  -75.878 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   39.013 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 42:
			
			o = _posf(40);
			_setf(o + ( 0 << 2), x +   47.021 * s);
			_setf(o + ( 1 << 2), y +  -60.888 * s);
			_setf(o + ( 2 << 2), x +   29.492 * s);
			_setf(o + ( 3 << 2), y +  -51.415 * s);
			_setf(o + ( 4 << 2), x +   47.021 * s);
			_setf(o + ( 5 << 2), y +  -41.894 * s);
			_setf(o + ( 6 << 2), x +   44.189 * s);
			_setf(o + ( 7 << 2), y +  -37.109 * s);
			_setf(o + ( 8 << 2), x +   27.783 * s);
			_setf(o + ( 9 << 2), y +  -47.021 * s);
			_setf(o + (10 << 2), x +   27.783 * s);
			_setf(o + (11 << 2), y +  -28.613 * s);
			_setf(o + (12 << 2), x +   22.216 * s);
			_setf(o + (13 << 2), y +  -28.613 * s);
			_setf(o + (14 << 2), x +   22.216 * s);
			_setf(o + (15 << 2), y +  -47.021 * s);
			_setf(o + (16 << 2), x +    5.811 * s);
			_setf(o + (17 << 2), y +  -37.109 * s);
			_setf(o + (18 << 2), x +    2.978 * s);
			_setf(o + (19 << 2), y +  -41.894 * s);
			_setf(o + (20 << 2), x +   20.507 * s);
			_setf(o + (21 << 2), y +  -51.415 * s);
			_setf(o + (22 << 2), x +    2.978 * s);
			_setf(o + (23 << 2), y +  -60.888 * s);
			_setf(o + (24 << 2), x +    5.811 * s);
			_setf(o + (25 << 2), y +  -65.722 * s);
			_setf(o + (26 << 2), x +   22.216 * s);
			_setf(o + (27 << 2), y +  -55.810 * s);
			_setf(o + (28 << 2), x +   22.216 * s);
			_setf(o + (29 << 2), y +  -74.218 * s);
			_setf(o + (30 << 2), x +   27.783 * s);
			_setf(o + (31 << 2), y +  -74.218 * s);
			_setf(o + (32 << 2), x +   27.783 * s);
			_setf(o + (33 << 2), y +  -55.810 * s);
			_setf(o + (34 << 2), x +   44.189 * s);
			_setf(o + (35 << 2), y +  -65.722 * s);
			_setf(o + (36 << 2), x +   47.021 * s);
			_setf(o + (37 << 2), y +  -60.888 * s);
			_setf(o + (38 << 2), x +   49.999 * s);
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
			_setf(o + ( 0 << 2), x +   45.996 * s);
			_setf(o + ( 1 << 2), y +  -62.694 * s);
			_setf(o + ( 2 << 2), x +   45.996 * s);
			_setf(o + ( 3 << 2), y +  -35.497 * s);
			_setf(o + ( 4 << 2), x +   73.192 * s);
			_setf(o + ( 5 << 2), y +  -35.497 * s);
			_setf(o + ( 6 << 2), x +   73.192 * s);
			_setf(o + ( 7 << 2), y +  -27.197 * s);
			_setf(o + ( 8 << 2), x +   45.996 * s);
			_setf(o + ( 9 << 2), y +  -27.197 * s);
			_setf(o + (10 << 2), x +   45.996 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   37.792 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   37.792 * s);
			_setf(o + (15 << 2), y +  -27.197 * s);
			_setf(o + (16 << 2), x +   10.596 * s);
			_setf(o + (17 << 2), y +  -27.197 * s);
			_setf(o + (18 << 2), x +   10.596 * s);
			_setf(o + (19 << 2), y +  -35.497 * s);
			_setf(o + (20 << 2), x +   37.792 * s);
			_setf(o + (21 << 2), y +  -35.497 * s);
			_setf(o + (22 << 2), x +   37.792 * s);
			_setf(o + (23 << 2), y +  -62.694 * s);
			_setf(o + (24 << 2), x +   45.996 * s);
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
			
			o = _posf(16);
			_setf(o + ( 0 << 2), x +   11.719 * s);
			_setf(o + ( 1 << 2), y +  -12.402 * s);
			_setf(o + ( 2 << 2), x +   22.021 * s);
			_setf(o + ( 3 << 2), y +  -12.402 * s);
			_setf(o + ( 4 << 2), x +   22.021 * s);
			_setf(o + ( 5 << 2), y +   -4.004 * s);
			_setf(o + ( 6 << 2), x +   14.013 * s);
			_setf(o + ( 7 << 2), y +   11.621 * s);
			_setf(o + ( 8 << 2), x +    7.715 * s);
			_setf(o + ( 9 << 2), y +   11.621 * s);
			_setf(o + (10 << 2), x +   11.719 * s);
			_setf(o + (11 << 2), y +   -4.004 * s);
			_setf(o + (12 << 2), x +   11.719 * s);
			_setf(o + (13 << 2), y +  -12.402 * s);
			_setf(o + (14 << 2), x +   31.787 * s);
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
			_setf(o + ( 0 << 2), x +    4.882 * s);
			_setf(o + ( 1 << 2), y +  -31.396 * s);
			_setf(o + ( 2 << 2), x +   31.200 * s);
			_setf(o + ( 3 << 2), y +  -31.396 * s);
			_setf(o + ( 4 << 2), x +   31.200 * s);
			_setf(o + ( 5 << 2), y +  -23.388 * s);
			_setf(o + ( 6 << 2), x +    4.882 * s);
			_setf(o + ( 7 << 2), y +  -23.388 * s);
			_setf(o + ( 8 << 2), x +    4.882 * s);
			_setf(o + ( 9 << 2), y +  -31.396 * s);
			_setf(o + (10 << 2), x +   36.083 * s);
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
			_setf(o + ( 0 << 2), x +   10.693 * s);
			_setf(o + ( 1 << 2), y +  -12.402 * s);
			_setf(o + ( 2 << 2), x +   20.996 * s);
			_setf(o + ( 3 << 2), y +  -12.402 * s);
			_setf(o + ( 4 << 2), x +   20.996 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   10.693 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   10.693 * s);
			_setf(o + ( 9 << 2), y +  -12.402 * s);
			_setf(o + (10 << 2), x +   31.787 * s);
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
			_setf(o + ( 0 << 2), x +   25.390 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   33.691 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +    8.300 * s);
			_setf(o + ( 5 << 2), y +    9.277 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +    9.277 * s);
			_setf(o + ( 8 << 2), x +   25.390 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   33.691 * s);
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
			_setf(o + ( 0 << 2), x +   31.786 * s);
			_setf(o + ( 1 << 2), y +  -66.405 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   31.786 * s,y +  -66.405 * s,x +   26.708 * s,y +  -66.405 * s,x +   22.891 * s,y +  -63.907 * s,x +   20.336 * s,y +  -58.910 * s, threshold);
			_bez(x +   20.336 * s,y +  -58.910 * s,x +   17.781 * s,y +  -53.914 * s,x +   16.503 * s,y +  -46.402 * s,x +   16.503 * s,y +  -36.376 * s, threshold);
			_bez(x +   16.503 * s,y +  -36.376 * s,x +   16.503 * s,y +  -26.384 * s,x +   17.781 * s,y +  -18.888 * s,x +   20.336 * s,y +  -13.891 * s, threshold);
			_bez(x +   20.336 * s,y +  -13.891 * s,x +   22.891 * s,y +   -8.895 * s,x +   26.708 * s,y +   -6.396 * s,x +   31.786 * s,y +   -6.396 * s, threshold);
			_bez(x +   31.786 * s,y +   -6.396 * s,x +   36.897 * s,y +   -6.396 * s,x +   40.730 * s,y +   -8.895 * s,x +   43.285 * s,y +  -13.891 * s, threshold);
			_bez(x +   43.285 * s,y +  -13.891 * s,x +   45.840 * s,y +  -18.888 * s,x +   47.118 * s,y +  -26.384 * s,x +   47.118 * s,y +  -36.376 * s, threshold);
			_bez(x +   47.118 * s,y +  -36.376 * s,x +   47.118 * s,y +  -46.402 * s,x +   45.840 * s,y +  -53.914 * s,x +   43.285 * s,y +  -58.910 * s, threshold);
			_bez(x +   43.285 * s,y +  -58.910 * s,x +   40.730 * s,y +  -63.907 * s,x +   36.897 * s,y +  -66.405 * s,x +   31.786 * s,y +  -66.405 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   31.786 * s);
			_setf(o + ( 1 << 2), y +  -74.218 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   31.786 * s,y +  -74.218 * s,x +   39.957 * s,y +  -74.218 * s,x +   46.198 * s,y +  -70.987 * s,x +   50.511 * s,y +  -64.525 * s, threshold);
			_bez(x +   50.511 * s,y +  -64.525 * s,x +   54.825 * s,y +  -58.064 * s,x +   56.981 * s,y +  -48.681 * s,x +   56.981 * s,y +  -36.376 * s, threshold);
			_bez(x +   56.981 * s,y +  -36.376 * s,x +   56.981 * s,y +  -24.104 * s,x +   54.825 * s,y +  -14.738 * s,x +   50.511 * s,y +   -8.276 * s, threshold);
			_bez(x +   50.511 * s,y +   -8.276 * s,x +   46.198 * s,y +   -1.815 * s,x +   39.957 * s,y +    1.416 * s,x +   31.786 * s,y +    1.416 * s, threshold);
			_bez(x +   31.786 * s,y +    1.416 * s,x +   23.616 * s,y +    1.416 * s,x +   17.374 * s,y +   -1.815 * s,x +   13.061 * s,y +   -8.276 * s, threshold);
			_bez(x +   13.061 * s,y +   -8.276 * s,x +    8.748 * s,y +  -14.738 * s,x +    6.591 * s,y +  -24.104 * s,x +    6.591 * s,y +  -36.376 * s, threshold);
			_bez(x +    6.591 * s,y +  -36.376 * s,x +    6.591 * s,y +  -48.681 * s,x +    8.748 * s,y +  -58.064 * s,x +   13.061 * s,y +  -64.525 * s, threshold);
			_bez(x +   13.061 * s,y +  -64.525 * s,x +   17.374 * s,y +  -70.987 * s,x +   23.616 * s,y +  -74.218 * s,x +   31.786 * s,y +  -74.218 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   63.622 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 49:
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +   12.402 * s);
			_setf(o + ( 1 << 2), y +   -8.301 * s);
			_setf(o + ( 2 << 2), x +   28.515 * s);
			_setf(o + ( 3 << 2), y +   -8.301 * s);
			_setf(o + ( 4 << 2), x +   28.515 * s);
			_setf(o + ( 5 << 2), y +  -63.915 * s);
			_setf(o + ( 6 << 2), x +   10.986 * s);
			_setf(o + ( 7 << 2), y +  -60.399 * s);
			_setf(o + ( 8 << 2), x +   10.986 * s);
			_setf(o + ( 9 << 2), y +  -69.384 * s);
			_setf(o + (10 << 2), x +   28.417 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   38.280 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   38.280 * s);
			_setf(o + (15 << 2), y +   -8.301 * s);
			_setf(o + (16 << 2), x +   54.393 * s);
			_setf(o + (17 << 2), y +   -8.301 * s);
			_setf(o + (18 << 2), x +   54.393 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   12.402 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   12.402 * s);
			_setf(o + (23 << 2), y +   -8.301 * s);
			_setf(o + (24 << 2), x +   63.622 * s);
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
			
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   19.189 * s);
			_setf(o + ( 1 << 2), y +   -8.301 * s);
			_setf(o + ( 2 << 2), x +   53.612 * s);
			_setf(o + ( 3 << 2), y +   -8.301 * s);
			_setf(o + ( 4 << 2), x +   53.612 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    7.324 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    7.324 * s);
			_setf(o + ( 9 << 2), y +   -8.301 * s);
			o = _posb(5);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +    7.324 * s,y +   -8.301 * s,x +   11.067 * s,y +  -12.174 * s,x +   16.170 * s,y +  -17.374 * s,x +   22.631 * s,y +  -23.901 * s, threshold);
			_bez(x +   22.631 * s,y +  -23.901 * s,x +   29.093 * s,y +  -30.428 * s,x +   33.146 * s,y +  -34.641 * s,x +   34.814 * s,y +  -36.523 * s, threshold);
			_bez(x +   34.814 * s,y +  -36.523 * s,x +   37.964 * s,y +  -40.078 * s,x +   40.176 * s,y +  -43.074 * s,x +   41.430 * s,y +  -45.532 * s, threshold);
			_bez(x +   41.430 * s,y +  -45.532 * s,x +   42.683 * s,y +  -47.989 * s,x +   43.310 * s,y +  -50.406 * s,x +   43.310 * s,y +  -52.782 * s, threshold);
			_bez(x +   43.310 * s,y +  -52.782 * s,x +   43.310 * s,y +  -56.656 * s,x +   41.951 * s,y +  -59.814 * s,x +   39.232 * s,y +  -62.255 * s, threshold);
			_bez(x +   39.232 * s,y +  -62.255 * s,x +   36.514 * s,y +  -64.696 * s,x +   32.974 * s,y +  -65.917 * s,x +   28.613 * s,y +  -65.917 * s, threshold);
			_bez(x +   28.613 * s,y +  -65.917 * s,x +   25.520 * s,y +  -65.917 * s,x +   22.257 * s,y +  -65.380 * s,x +   18.823 * s,y +  -64.306 * s, threshold);
			_bez(x +   18.823 * s,y +  -64.306 * s,x +   15.388 * s,y +  -63.231 * s,x +   11.718 * s,y +  -61.604 * s,x +    7.812 * s,y +  -59.423 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    7.812 * s);
			_setf(o + ( 1 << 2), y +  -69.384 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    7.812 * s,y +  -69.384 * s,x +   11.783 * s,y +  -70.979 * s,x +   15.494 * s,y +  -72.183 * s,x +   18.945 * s,y +  -72.997 * s, threshold);
			_bez(x +   18.945 * s,y +  -72.997 * s,x +   22.395 * s,y +  -73.811 * s,x +   25.553 * s,y +  -74.218 * s,x +   28.417 * s,y +  -74.218 * s, threshold);
			_bez(x +   28.417 * s,y +  -74.218 * s,x +   35.969 * s,y +  -74.218 * s,x +   41.991 * s,y +  -72.330 * s,x +   46.483 * s,y +  -68.554 * s, threshold);
			_bez(x +   46.483 * s,y +  -68.554 * s,x +   50.975 * s,y +  -64.778 * s,x +   53.222 * s,y +  -59.732 * s,x +   53.222 * s,y +  -53.417 * s, threshold);
			_bez(x +   53.222 * s,y +  -53.417 * s,x +   53.222 * s,y +  -50.422 * s,x +   52.660 * s,y +  -47.582 * s,x +   51.537 * s,y +  -44.897 * s, threshold);
			_bez(x +   51.537 * s,y +  -44.897 * s,x +   50.414 * s,y +  -42.211 * s,x +   48.393 * s,y +  -39.027 * s,x +   45.409 * s,y +  -35.400 * s, threshold);
			_bez(x +   45.409 * s,y +  -35.400 * s,x +   44.617 * s,y +  -34.437 * s,x +   42.008 * s,y +  -31.730 * s,x +   37.646 * s,y +  -27.221 * s, threshold);
			_bez(x +   37.646 * s,y +  -27.221 * s,x +   33.284 * s,y +  -22.713 * s,x +   27.131 * s,y +  -16.406 * s,x +   19.189 * s,y +   -8.301 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   63.622 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 51:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   40.575 * s);
			_setf(o + ( 1 << 2), y +  -39.306 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   40.575 * s,y +  -39.306 * s,x +   45.295 * s,y +  -38.297 * s,x +   48.982 * s,y +  -36.197 * s,x +   51.635 * s,y +  -33.007 * s, threshold);
			_bez(x +   51.635 * s,y +  -33.007 * s,x +   54.288 * s,y +  -29.817 * s,x +   55.614 * s,y +  -25.879 * s,x +   55.614 * s,y +  -21.191 * s, threshold);
			_bez(x +   55.614 * s,y +  -21.191 * s,x +   55.614 * s,y +  -13.997 * s,x +   53.140 * s,y +   -8.431 * s,x +   48.192 * s,y +   -4.492 * s, threshold);
			_bez(x +   48.192 * s,y +   -4.492 * s,x +   43.245 * s,y +   -0.553 * s,x +   36.213 * s,y +    1.416 * s,x +   27.099 * s,y +    1.416 * s, threshold);
			_bez(x +   27.099 * s,y +    1.416 * s,x +   24.039 * s,y +    1.416 * s,x +   20.890 * s,y +    1.115 * s,x +   17.651 * s,y +    0.513 * s, threshold);
			_bez(x +   17.651 * s,y +    0.513 * s,x +   14.412 * s,y +   -0.090 * s,x +   11.067 * s,y +   -0.993 * s,x +    7.617 * s,y +   -2.197 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    7.617 * s);
			_setf(o + ( 1 << 2), y +  -11.719 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    7.617 * s,y +  -11.719 * s,x +   10.351 * s,y +  -10.124 * s,x +   13.346 * s,y +   -8.919 * s,x +   16.601 * s,y +   -8.105 * s, threshold);
			_bez(x +   16.601 * s,y +   -8.105 * s,x +   19.856 * s,y +   -7.292 * s,x +   23.258 * s,y +   -6.885 * s,x +   26.806 * s,y +   -6.885 * s, threshold);
			_bez(x +   26.806 * s,y +   -6.885 * s,x +   32.991 * s,y +   -6.885 * s,x +   37.703 * s,y +   -8.105 * s,x +   40.942 * s,y +  -10.547 * s, threshold);
			_bez(x +   40.942 * s,y +  -10.547 * s,x +   44.180 * s,y +  -12.988 * s,x +   45.800 * s,y +  -16.536 * s,x +   45.800 * s,y +  -21.191 * s, threshold);
			_bez(x +   45.800 * s,y +  -21.191 * s,x +   45.800 * s,y +  -25.488 * s,x +   44.294 * s,y +  -28.849 * s,x +   41.283 * s,y +  -31.274 * s, threshold);
			_bez(x +   41.283 * s,y +  -31.274 * s,x +   38.272 * s,y +  -33.699 * s,x +   34.081 * s,y +  -34.912 * s,x +   28.710 * s,y +  -34.912 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   20.214 * s);
			_setf(o + ( 1 << 2), y +  -34.912 * s);
			_setf(o + ( 2 << 2), x +   20.214 * s);
			_setf(o + ( 3 << 2), y +  -43.017 * s);
			_setf(o + ( 4 << 2), x +   29.101 * s);
			_setf(o + ( 5 << 2), y +  -43.017 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   29.101 * s,y +  -43.017 * s,x +   33.951 * s,y +  -43.017 * s,x +   37.662 * s,y +  -43.985 * s,x +   40.234 * s,y +  -45.922 * s, threshold);
			_bez(x +   40.234 * s,y +  -45.922 * s,x +   42.805 * s,y +  -47.859 * s,x +   44.091 * s,y +  -50.650 * s,x +   44.091 * s,y +  -54.296 * s, threshold);
			_bez(x +   44.091 * s,y +  -54.296 * s,x +   44.091 * s,y +  -58.039 * s,x +   42.764 * s,y +  -60.912 * s,x +   40.111 * s,y +  -62.914 * s, threshold);
			_bez(x +   40.111 * s,y +  -62.914 * s,x +   37.459 * s,y +  -64.916 * s,x +   33.658 * s,y +  -65.917 * s,x +   28.710 * s,y +  -65.917 * s, threshold);
			_bez(x +   28.710 * s,y +  -65.917 * s,x +   26.009 * s,y +  -65.917 * s,x +   23.111 * s,y +  -65.624 * s,x +   20.019 * s,y +  -65.038 * s, threshold);
			_bez(x +   20.019 * s,y +  -65.038 * s,x +   16.927 * s,y +  -64.452 * s,x +   13.525 * s,y +  -63.541 * s,x +    9.814 * s,y +  -62.304 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    9.814 * s);
			_setf(o + ( 1 << 2), y +  -71.093 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    9.814 * s,y +  -71.093 * s,x +   13.558 * s,y +  -72.134 * s,x +   17.065 * s,y +  -72.916 * s,x +   20.336 * s,y +  -73.436 * s, threshold);
			_bez(x +   20.336 * s,y +  -73.436 * s,x +   23.608 * s,y +  -73.957 * s,x +   26.692 * s,y +  -74.218 * s,x +   29.589 * s,y +  -74.218 * s, threshold);
			_bez(x +   29.589 * s,y +  -74.218 * s,x +   37.076 * s,y +  -74.218 * s,x +   43.000 * s,y +  -72.517 * s,x +   47.362 * s,y +  -69.115 * s, threshold);
			_bez(x +   47.362 * s,y +  -69.115 * s,x +   51.724 * s,y +  -65.714 * s,x +   53.905 * s,y +  -61.116 * s,x +   53.905 * s,y +  -55.321 * s, threshold);
			_bez(x +   53.905 * s,y +  -55.321 * s,x +   53.905 * s,y +  -51.285 * s,x +   52.750 * s,y +  -47.875 * s,x +   50.438 * s,y +  -45.092 * s, threshold);
			_bez(x +   50.438 * s,y +  -45.092 * s,x +   48.127 * s,y +  -42.309 * s,x +   44.840 * s,y +  -40.380 * s,x +   40.575 * s,y +  -39.306 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   63.622 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 52:
			
			o = _posf(34);
			_setf(o + ( 0 << 2), x +   37.792 * s);
			_setf(o + ( 1 << 2), y +  -64.306 * s);
			_setf(o + ( 2 << 2), x +   12.890 * s);
			_setf(o + ( 3 << 2), y +  -25.390 * s);
			_setf(o + ( 4 << 2), x +   37.792 * s);
			_setf(o + ( 5 << 2), y +  -25.390 * s);
			_setf(o + ( 6 << 2), x +   37.792 * s);
			_setf(o + ( 7 << 2), y +  -64.306 * s);
			_setf(o + ( 8 << 2), x +   35.204 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   47.607 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   47.607 * s);
			_setf(o + (13 << 2), y +  -25.390 * s);
			_setf(o + (14 << 2), x +   58.007 * s);
			_setf(o + (15 << 2), y +  -25.390 * s);
			_setf(o + (16 << 2), x +   58.007 * s);
			_setf(o + (17 << 2), y +  -17.187 * s);
			_setf(o + (18 << 2), x +   47.607 * s);
			_setf(o + (19 << 2), y +  -17.187 * s);
			_setf(o + (20 << 2), x +   47.607 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   37.792 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   37.792 * s);
			_setf(o + (25 << 2), y +  -17.187 * s);
			_setf(o + (26 << 2), x +    4.883 * s);
			_setf(o + (27 << 2), y +  -17.187 * s);
			_setf(o + (28 << 2), x +    4.883 * s);
			_setf(o + (29 << 2), y +  -26.709 * s);
			_setf(o + (30 << 2), x +   35.204 * s);
			_setf(o + (31 << 2), y +  -72.899 * s);
			_setf(o + (32 << 2), x +   63.622 * s);
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
			_setf(o + ( 0 << 2), x +   10.791 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   49.511 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   49.511 * s);
			_setf(o + ( 5 << 2), y +  -64.599 * s);
			_setf(o + ( 6 << 2), x +   19.824 * s);
			_setf(o + ( 7 << 2), y +  -64.599 * s);
			_setf(o + ( 8 << 2), x +   19.824 * s);
			_setf(o + ( 9 << 2), y +  -46.728 * s);
			o = _posb(5);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   19.824 * s,y +  -46.728 * s,x +   21.256 * s,y +  -47.216 * s,x +   22.688 * s,y +  -47.582 * s,x +   24.121 * s,y +  -47.826 * s, threshold);
			_bez(x +   24.121 * s,y +  -47.826 * s,x +   25.553 * s,y +  -48.071 * s,x +   26.985 * s,y +  -48.193 * s,x +   28.418 * s,y +  -48.193 * s, threshold);
			_bez(x +   28.418 * s,y +  -48.193 * s,x +   36.555 * s,y +  -48.193 * s,x +   43.001 * s,y +  -45.963 * s,x +   47.753 * s,y +  -41.503 * s, threshold);
			_bez(x +   47.753 * s,y +  -41.503 * s,x +   52.506 * s,y +  -37.044 * s,x +   54.882 * s,y +  -31.006 * s,x +   54.882 * s,y +  -23.388 * s, threshold);
			_bez(x +   54.882 * s,y +  -23.388 * s,x +   54.882 * s,y +  -15.543 * s,x +   52.441 * s,y +   -9.448 * s,x +   47.558 * s,y +   -5.102 * s, threshold);
			_bez(x +   47.558 * s,y +   -5.102 * s,x +   42.675 * s,y +   -0.757 * s,x +   35.791 * s,y +    1.416 * s,x +   26.904 * s,y +    1.416 * s, threshold);
			_bez(x +   26.904 * s,y +    1.416 * s,x +   23.844 * s,y +    1.416 * s,x +   20.727 * s,y +    1.156 * s,x +   17.553 * s,y +    0.635 * s, threshold);
			_bez(x +   17.553 * s,y +    0.635 * s,x +   14.380 * s,y +    0.114 * s,x +   11.100 * s,y +   -0.667 * s,x +    7.715 * s,y +   -1.709 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    7.715 * s);
			_setf(o + ( 1 << 2), y +  -11.621 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    7.715 * s,y +  -11.621 * s,x +   10.644 * s,y +  -10.026 * s,x +   13.672 * s,y +   -8.838 * s,x +   16.797 * s,y +   -8.057 * s, threshold);
			_bez(x +   16.797 * s,y +   -8.057 * s,x +   19.922 * s,y +   -7.275 * s,x +   23.225 * s,y +   -6.885 * s,x +   26.709 * s,y +   -6.885 * s, threshold);
			_bez(x +   26.709 * s,y +   -6.885 * s,x +   32.340 * s,y +   -6.885 * s,x +   36.800 * s,y +   -8.366 * s,x +   40.087 * s,y +  -11.328 * s, threshold);
			_bez(x +   40.087 * s,y +  -11.328 * s,x +   43.375 * s,y +  -14.290 * s,x +   45.019 * s,y +  -18.310 * s,x +   45.019 * s,y +  -23.388 * s, threshold);
			_bez(x +   45.019 * s,y +  -23.388 * s,x +   45.019 * s,y +  -28.466 * s,x +   43.375 * s,y +  -32.486 * s,x +   40.087 * s,y +  -35.449 * s, threshold);
			_bez(x +   40.087 * s,y +  -35.449 * s,x +   36.800 * s,y +  -38.411 * s,x +   32.340 * s,y +  -39.892 * s,x +   26.709 * s,y +  -39.892 * s, threshold);
			_bez(x +   26.709 * s,y +  -39.892 * s,x +   24.072 * s,y +  -39.892 * s,x +   21.443 * s,y +  -39.599 * s,x +   18.823 * s,y +  -39.013 * s, threshold);
			_bez(x +   18.823 * s,y +  -39.013 * s,x +   16.203 * s,y +  -38.427 * s,x +   13.525 * s,y +  -37.516 * s,x +   10.791 * s,y +  -36.279 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   10.791 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   63.622 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 54:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   33.007 * s);
			_setf(o + ( 1 << 2), y +  -40.380 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   33.007 * s,y +  -40.380 * s,x +   28.580 * s,y +  -40.380 * s,x +   25.073 * s,y +  -38.867 * s,x +   22.485 * s,y +  -35.839 * s, threshold);
			_bez(x +   22.485 * s,y +  -35.839 * s,x +   19.897 * s,y +  -32.812 * s,x +   18.603 * s,y +  -28.662 * s,x +   18.603 * s,y +  -23.388 * s, threshold);
			_bez(x +   18.603 * s,y +  -23.388 * s,x +   18.603 * s,y +  -18.148 * s,x +   19.897 * s,y +  -14.005 * s,x +   22.485 * s,y +  -10.962 * s, threshold);
			_bez(x +   22.485 * s,y +  -10.962 * s,x +   25.073 * s,y +   -7.918 * s,x +   28.580 * s,y +   -6.396 * s,x +   33.007 * s,y +   -6.396 * s, threshold);
			_bez(x +   33.007 * s,y +   -6.396 * s,x +   37.434 * s,y +   -6.396 * s,x +   40.942 * s,y +   -7.918 * s,x +   43.530 * s,y +  -10.962 * s, threshold);
			_bez(x +   43.530 * s,y +  -10.962 * s,x +   46.118 * s,y +  -14.005 * s,x +   47.412 * s,y +  -18.148 * s,x +   47.412 * s,y +  -23.388 * s, threshold);
			_bez(x +   47.412 * s,y +  -23.388 * s,x +   47.412 * s,y +  -28.662 * s,x +   46.118 * s,y +  -32.812 * s,x +   43.530 * s,y +  -35.839 * s, threshold);
			_bez(x +   43.530 * s,y +  -35.839 * s,x +   40.942 * s,y +  -38.867 * s,x +   37.434 * s,y +  -40.380 * s,x +   33.007 * s,y +  -40.380 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   52.587 * s);
			_setf(o + ( 1 << 2), y +  -71.288 * s);
			_setf(o + ( 2 << 2), x +   52.587 * s);
			_setf(o + ( 3 << 2), y +  -62.304 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   52.587 * s,y +  -62.304 * s,x +   50.113 * s,y +  -63.476 * s,x +   47.615 * s,y +  -64.371 * s,x +   45.092 * s,y +  -64.989 * s, threshold);
			_bez(x +   45.092 * s,y +  -64.989 * s,x +   42.569 * s,y +  -65.608 * s,x +   40.071 * s,y +  -65.917 * s,x +   37.597 * s,y +  -65.917 * s, threshold);
			_bez(x +   37.597 * s,y +  -65.917 * s,x +   31.087 * s,y +  -65.917 * s,x +   26.115 * s,y +  -63.720 * s,x +   22.680 * s,y +  -59.325 * s, threshold);
			_bez(x +   22.680 * s,y +  -59.325 * s,x +   19.246 * s,y +  -54.931 * s,x +   17.285 * s,y +  -48.290 * s,x +   16.797 * s,y +  -39.404 * s, threshold);
			_bez(x +   16.797 * s,y +  -39.404 * s,x +   18.717 * s,y +  -42.236 * s,x +   21.126 * s,y +  -44.408 * s,x +   24.023 * s,y +  -45.922 * s, threshold);
			_bez(x +   24.023 * s,y +  -45.922 * s,x +   26.920 * s,y +  -47.436 * s,x +   30.110 * s,y +  -48.193 * s,x +   33.593 * s,y +  -48.193 * s, threshold);
			_bez(x +   33.593 * s,y +  -48.193 * s,x +   40.918 * s,y +  -48.193 * s,x +   46.704 * s,y +  -45.971 * s,x +   50.952 * s,y +  -41.528 * s, threshold);
			_bez(x +   50.952 * s,y +  -41.528 * s,x +   55.199 * s,y +  -37.084 * s,x +   57.323 * s,y +  -31.038 * s,x +   57.323 * s,y +  -23.388 * s, threshold);
			_bez(x +   57.323 * s,y +  -23.388 * s,x +   57.323 * s,y +  -15.902 * s,x +   55.110 * s,y +   -9.896 * s,x +   50.683 * s,y +   -5.371 * s, threshold);
			_bez(x +   50.683 * s,y +   -5.371 * s,x +   46.256 * s,y +   -0.846 * s,x +   40.364 * s,y +    1.416 * s,x +   33.007 * s,y +    1.416 * s, threshold);
			_bez(x +   33.007 * s,y +    1.416 * s,x +   24.577 * s,y +    1.416 * s,x +   18.131 * s,y +   -1.815 * s,x +   13.672 * s,y +   -8.276 * s, threshold);
			_bez(x +   13.672 * s,y +   -8.276 * s,x +    9.212 * s,y +  -14.738 * s,x +    6.982 * s,y +  -24.104 * s,x +    6.982 * s,y +  -36.376 * s, threshold);
			_bez(x +    6.982 * s,y +  -36.376 * s,x +    6.982 * s,y +  -47.900 * s,x +    9.717 * s,y +  -57.087 * s,x +   15.185 * s,y +  -63.939 * s, threshold);
			_bez(x +   15.185 * s,y +  -63.939 * s,x +   20.654 * s,y +  -70.792 * s,x +   27.995 * s,y +  -74.218 * s,x +   37.207 * s,y +  -74.218 * s, threshold);
			_bez(x +   37.207 * s,y +  -74.218 * s,x +   39.680 * s,y +  -74.218 * s,x +   42.179 * s,y +  -73.973 * s,x +   44.702 * s,y +  -73.485 * s, threshold);
			_bez(x +   44.702 * s,y +  -73.485 * s,x +   47.224 * s,y +  -72.997 * s,x +   49.853 * s,y +  -72.265 * s,x +   52.587 * s,y +  -71.288 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   63.622 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 55:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +    8.203 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   55.077 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   55.077 * s);
			_setf(o + ( 5 << 2), y +  -68.700 * s);
			_setf(o + ( 6 << 2), x +   28.613 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   18.310 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   43.212 * s);
			_setf(o + (11 << 2), y +  -64.599 * s);
			_setf(o + (12 << 2), x +    8.203 * s);
			_setf(o + (13 << 2), y +  -64.599 * s);
			_setf(o + (14 << 2), x +    8.203 * s);
			_setf(o + (15 << 2), y +  -72.899 * s);
			_setf(o + (16 << 2), x +   63.622 * s);
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
			_setf(o + ( 0 << 2), x +   31.787 * s);
			_setf(o + ( 1 << 2), y +  -34.619 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   31.787 * s,y +  -34.619 * s,x +   27.099 * s,y +  -34.619 * s,x +   23.413 * s,y +  -33.365 * s,x +   20.727 * s,y +  -30.859 * s, threshold);
			_bez(x +   20.727 * s,y +  -30.859 * s,x +   18.042 * s,y +  -28.352 * s,x +   16.699 * s,y +  -24.902 * s,x +   16.699 * s,y +  -20.507 * s, threshold);
			_bez(x +   16.699 * s,y +  -20.507 * s,x +   16.699 * s,y +  -16.113 * s,x +   18.042 * s,y +  -12.663 * s,x +   20.727 * s,y +  -10.156 * s, threshold);
			_bez(x +   20.727 * s,y +  -10.156 * s,x +   23.413 * s,y +   -7.650 * s,x +   27.099 * s,y +   -6.396 * s,x +   31.787 * s,y +   -6.396 * s, threshold);
			_bez(x +   31.787 * s,y +   -6.396 * s,x +   36.474 * s,y +   -6.396 * s,x +   40.169 * s,y +   -7.658 * s,x +   42.871 * s,y +  -10.180 * s, threshold);
			_bez(x +   42.871 * s,y +  -10.180 * s,x +   45.572 * s,y +  -12.703 * s,x +   46.923 * s,y +  -16.146 * s,x +   46.923 * s,y +  -20.507 * s, threshold);
			_bez(x +   46.923 * s,y +  -20.507 * s,x +   46.923 * s,y +  -24.902 * s,x +   45.581 * s,y +  -28.352 * s,x +   42.895 * s,y +  -30.859 * s, threshold);
			_bez(x +   42.895 * s,y +  -30.859 * s,x +   40.210 * s,y +  -33.365 * s,x +   36.507 * s,y +  -34.619 * s,x +   31.787 * s,y +  -34.619 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   21.924 * s);
			_setf(o + ( 1 << 2), y +  -38.818 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   21.924 * s,y +  -38.818 * s,x +   17.692 * s,y +  -39.859 * s,x +   14.396 * s,y +  -41.829 * s,x +   12.036 * s,y +  -44.726 * s, threshold);
			_bez(x +   12.036 * s,y +  -44.726 * s,x +    9.676 * s,y +  -47.623 * s,x +    8.496 * s,y +  -51.155 * s,x +    8.496 * s,y +  -55.321 * s, threshold);
			_bez(x +    8.496 * s,y +  -55.321 * s,x +    8.496 * s,y +  -61.148 * s,x +   10.571 * s,y +  -65.754 * s,x +   14.722 * s,y +  -69.140 * s, threshold);
			_bez(x +   14.722 * s,y +  -69.140 * s,x +   18.872 * s,y +  -72.525 * s,x +   24.560 * s,y +  -74.218 * s,x +   31.787 * s,y +  -74.218 * s, threshold);
			_bez(x +   31.787 * s,y +  -74.218 * s,x +   39.046 * s,y +  -74.218 * s,x +   44.742 * s,y +  -72.525 * s,x +   48.876 * s,y +  -69.140 * s, threshold);
			_bez(x +   48.876 * s,y +  -69.140 * s,x +   53.011 * s,y +  -65.754 * s,x +   55.078 * s,y +  -61.148 * s,x +   55.078 * s,y +  -55.321 * s, threshold);
			_bez(x +   55.078 * s,y +  -55.321 * s,x +   55.078 * s,y +  -51.155 * s,x +   53.898 * s,y +  -47.623 * s,x +   51.538 * s,y +  -44.726 * s, threshold);
			_bez(x +   51.538 * s,y +  -44.726 * s,x +   49.178 * s,y +  -41.829 * s,x +   45.898 * s,y +  -39.859 * s,x +   41.699 * s,y +  -38.818 * s, threshold);
			_bez(x +   41.699 * s,y +  -38.818 * s,x +   46.451 * s,y +  -37.711 * s,x +   50.154 * s,y +  -35.546 * s,x +   52.807 * s,y +  -32.324 * s, threshold);
			_bez(x +   52.807 * s,y +  -32.324 * s,x +   55.460 * s,y +  -29.101 * s,x +   56.787 * s,y +  -25.162 * s,x +   56.787 * s,y +  -20.507 * s, threshold);
			_bez(x +   56.787 * s,y +  -20.507 * s,x +   56.787 * s,y +  -13.444 * s,x +   54.630 * s,y +   -8.024 * s,x +   50.317 * s,y +   -4.248 * s, threshold);
			_bez(x +   50.317 * s,y +   -4.248 * s,x +   46.004 * s,y +   -0.472 * s,x +   39.827 * s,y +    1.416 * s,x +   31.787 * s,y +    1.416 * s, threshold);
			_bez(x +   31.787 * s,y +    1.416 * s,x +   23.747 * s,y +    1.416 * s,x +   17.570 * s,y +   -0.472 * s,x +   13.257 * s,y +   -4.248 * s, threshold);
			_bez(x +   13.257 * s,y +   -4.248 * s,x +    8.944 * s,y +   -8.024 * s,x +    6.787 * s,y +  -13.444 * s,x +    6.787 * s,y +  -20.507 * s, threshold);
			_bez(x +    6.787 * s,y +  -20.507 * s,x +    6.787 * s,y +  -25.162 * s,x +    8.122 * s,y +  -29.101 * s,x +   10.791 * s,y +  -32.324 * s, threshold);
			_bez(x +   10.791 * s,y +  -32.324 * s,x +   13.460 * s,y +  -35.546 * s,x +   17.171 * s,y +  -37.711 * s,x +   21.924 * s,y +  -38.818 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   18.311 * s);
			_setf(o + ( 1 << 2), y +  -54.394 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   18.311 * s,y +  -54.394 * s,x +   18.311 * s,y +  -50.618 * s,x +   19.491 * s,y +  -47.672 * s,x +   21.851 * s,y +  -45.556 * s, threshold);
			_bez(x +   21.851 * s,y +  -45.556 * s,x +   24.211 * s,y +  -43.440 * s,x +   27.523 * s,y +  -42.382 * s,x +   31.787 * s,y +  -42.382 * s, threshold);
			_bez(x +   31.787 * s,y +  -42.382 * s,x +   36.018 * s,y +  -42.382 * s,x +   39.331 * s,y +  -43.440 * s,x +   41.723 * s,y +  -45.556 * s, threshold);
			_bez(x +   41.723 * s,y +  -45.556 * s,x +   44.116 * s,y +  -47.672 * s,x +   45.312 * s,y +  -50.618 * s,x +   45.312 * s,y +  -54.394 * s, threshold);
			_bez(x +   45.312 * s,y +  -54.394 * s,x +   45.312 * s,y +  -58.170 * s,x +   44.116 * s,y +  -61.116 * s,x +   41.723 * s,y +  -63.231 * s, threshold);
			_bez(x +   41.723 * s,y +  -63.231 * s,x +   39.331 * s,y +  -65.347 * s,x +   36.018 * s,y +  -66.405 * s,x +   31.787 * s,y +  -66.405 * s, threshold);
			_bez(x +   31.787 * s,y +  -66.405 * s,x +   27.523 * s,y +  -66.405 * s,x +   24.211 * s,y +  -65.347 * s,x +   21.851 * s,y +  -63.231 * s, threshold);
			_bez(x +   21.851 * s,y +  -63.231 * s,x +   19.491 * s,y +  -61.116 * s,x +   18.311 * s,y +  -58.170 * s,x +   18.311 * s,y +  -54.394 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   63.622 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 57:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   10.987 * s);
			_setf(o + ( 1 << 2), y +   -1.514 * s);
			_setf(o + ( 2 << 2), x +   10.987 * s);
			_setf(o + ( 3 << 2), y +  -10.498 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   10.987 * s,y +  -10.498 * s,x +   13.460 * s,y +   -9.326 * s,x +   15.967 * s,y +   -8.431 * s,x +   18.506 * s,y +   -7.812 * s, threshold);
			_bez(x +   18.506 * s,y +   -7.812 * s,x +   21.045 * s,y +   -7.194 * s,x +   23.535 * s,y +   -6.885 * s,x +   25.977 * s,y +   -6.885 * s, threshold);
			_bez(x +   25.977 * s,y +   -6.885 * s,x +   32.487 * s,y +   -6.885 * s,x +   37.459 * s,y +   -9.074 * s,x +   40.893 * s,y +  -13.452 * s, threshold);
			_bez(x +   40.893 * s,y +  -13.452 * s,x +   44.327 * s,y +  -17.830 * s,x +   46.289 * s,y +  -24.479 * s,x +   46.777 * s,y +  -33.398 * s, threshold);
			_bez(x +   46.777 * s,y +  -33.398 * s,x +   44.889 * s,y +  -30.598 * s,x +   42.496 * s,y +  -28.450 * s,x +   39.599 * s,y +  -26.953 * s, threshold);
			_bez(x +   39.599 * s,y +  -26.953 * s,x +   36.702 * s,y +  -25.455 * s,x +   33.496 * s,y +  -24.707 * s,x +   29.980 * s,y +  -24.707 * s, threshold);
			_bez(x +   29.980 * s,y +  -24.707 * s,x +   22.689 * s,y +  -24.707 * s,x +   16.919 * s,y +  -26.912 * s,x +   12.671 * s,y +  -31.323 * s, threshold);
			_bez(x +   12.671 * s,y +  -31.323 * s,x +    8.423 * s,y +  -35.733 * s,x +    6.299 * s,y +  -41.764 * s,x +    6.299 * s,y +  -49.413 * s, threshold);
			_bez(x +    6.299 * s,y +  -49.413 * s,x +    6.299 * s,y +  -56.900 * s,x +    8.513 * s,y +  -62.906 * s,x +   12.940 * s,y +  -67.431 * s, threshold);
			_bez(x +   12.940 * s,y +  -67.431 * s,x +   17.367 * s,y +  -71.955 * s,x +   23.258 * s,y +  -74.218 * s,x +   30.615 * s,y +  -74.218 * s, threshold);
			_bez(x +   30.615 * s,y +  -74.218 * s,x +   39.046 * s,y +  -74.218 * s,x +   45.483 * s,y +  -70.987 * s,x +   49.926 * s,y +  -64.525 * s, threshold);
			_bez(x +   49.926 * s,y +  -64.525 * s,x +   54.370 * s,y +  -58.064 * s,x +   56.591 * s,y +  -48.681 * s,x +   56.591 * s,y +  -36.376 * s, threshold);
			_bez(x +   56.591 * s,y +  -36.376 * s,x +   56.591 * s,y +  -24.885 * s,x +   53.865 * s,y +  -15.714 * s,x +   48.413 * s,y +   -8.862 * s, threshold);
			_bez(x +   48.413 * s,y +   -8.862 * s,x +   42.960 * s,y +   -2.010 * s,x +   35.628 * s,y +    1.416 * s,x +   26.416 * s,y +    1.416 * s, threshold);
			_bez(x +   26.416 * s,y +    1.416 * s,x +   23.942 * s,y +    1.416 * s,x +   21.436 * s,y +    1.172 * s,x +   18.897 * s,y +    0.684 * s, threshold);
			_bez(x +   18.897 * s,y +    0.684 * s,x +   16.358 * s,y +    0.195 * s,x +   13.721 * s,y +   -0.537 * s,x +   10.987 * s,y +   -1.514 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   30.615 * s);
			_setf(o + ( 1 << 2), y +  -32.421 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   30.615 * s,y +  -32.421 * s,x +   35.042 * s,y +  -32.421 * s,x +   38.550 * s,y +  -33.935 * s,x +   41.137 * s,y +  -36.962 * s, threshold);
			_bez(x +   41.137 * s,y +  -36.962 * s,x +   43.725 * s,y +  -39.990 * s,x +   45.019 * s,y +  -44.140 * s,x +   45.019 * s,y +  -49.413 * s, threshold);
			_bez(x +   45.019 * s,y +  -49.413 * s,x +   45.019 * s,y +  -54.654 * s,x +   43.725 * s,y +  -58.796 * s,x +   41.137 * s,y +  -61.840 * s, threshold);
			_bez(x +   41.137 * s,y +  -61.840 * s,x +   38.550 * s,y +  -64.883 * s,x +   35.042 * s,y +  -66.405 * s,x +   30.615 * s,y +  -66.405 * s, threshold);
			_bez(x +   30.615 * s,y +  -66.405 * s,x +   26.188 * s,y +  -66.405 * s,x +   22.681 * s,y +  -64.883 * s,x +   20.093 * s,y +  -61.840 * s, threshold);
			_bez(x +   20.093 * s,y +  -61.840 * s,x +   17.505 * s,y +  -58.796 * s,x +   16.211 * s,y +  -54.654 * s,x +   16.211 * s,y +  -49.413 * s, threshold);
			_bez(x +   16.211 * s,y +  -49.413 * s,x +   16.211 * s,y +  -44.140 * s,x +   17.505 * s,y +  -39.990 * s,x +   20.093 * s,y +  -36.962 * s, threshold);
			_bez(x +   20.093 * s,y +  -36.962 * s,x +   22.681 * s,y +  -33.935 * s,x +   26.188 * s,y +  -32.421 * s,x +   30.615 * s,y +  -32.421 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   63.622 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 58:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +   11.719 * s);
			_setf(o + ( 1 << 2), y +  -12.402 * s);
			_setf(o + ( 2 << 2), x +   22.022 * s);
			_setf(o + ( 3 << 2), y +  -12.402 * s);
			_setf(o + ( 4 << 2), x +   22.022 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   11.719 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   11.719 * s);
			_setf(o + ( 9 << 2), y +  -12.402 * s);
			_setf(o + (10 << 2), x +   11.719 * s);
			_setf(o + (11 << 2), y +  -51.708 * s);
			_setf(o + (12 << 2), x +   22.022 * s);
			_setf(o + (13 << 2), y +  -51.708 * s);
			_setf(o + (14 << 2), x +   22.022 * s);
			_setf(o + (15 << 2), y +  -39.306 * s);
			_setf(o + (16 << 2), x +   11.719 * s);
			_setf(o + (17 << 2), y +  -39.306 * s);
			_setf(o + (18 << 2), x +   11.719 * s);
			_setf(o + (19 << 2), y +  -51.708 * s);
			_setf(o + (20 << 2), x +   33.691 * s);
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
			_setf(o + ( 0 << 2), x +   11.719 * s);
			_setf(o + ( 1 << 2), y +  -51.708 * s);
			_setf(o + ( 2 << 2), x +   22.021 * s);
			_setf(o + ( 3 << 2), y +  -51.708 * s);
			_setf(o + ( 4 << 2), x +   22.021 * s);
			_setf(o + ( 5 << 2), y +  -39.306 * s);
			_setf(o + ( 6 << 2), x +   11.719 * s);
			_setf(o + ( 7 << 2), y +  -39.306 * s);
			_setf(o + ( 8 << 2), x +   11.719 * s);
			_setf(o + ( 9 << 2), y +  -51.708 * s);
			_setf(o + (10 << 2), x +   11.719 * s);
			_setf(o + (11 << 2), y +  -12.402 * s);
			_setf(o + (12 << 2), x +   22.021 * s);
			_setf(o + (13 << 2), y +  -12.402 * s);
			_setf(o + (14 << 2), x +   22.021 * s);
			_setf(o + (15 << 2), y +   -4.004 * s);
			_setf(o + (16 << 2), x +   14.014 * s);
			_setf(o + (17 << 2), y +   11.621 * s);
			_setf(o + (18 << 2), x +    7.715 * s);
			_setf(o + (19 << 2), y +   11.621 * s);
			_setf(o + (20 << 2), x +   11.719 * s);
			_setf(o + (21 << 2), y +   -4.004 * s);
			_setf(o + (22 << 2), x +   11.719 * s);
			_setf(o + (23 << 2), y +  -12.402 * s);
			_setf(o + (24 << 2), x +   33.691 * s);
			_setf(o + (25 << 2), y +       0. * s);
			o = _posb(13);
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
			
			case 60:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +   73.192 * s);
			_setf(o + ( 1 << 2), y +  -49.218 * s);
			_setf(o + ( 2 << 2), x +   22.802 * s);
			_setf(o + ( 3 << 2), y +  -31.298 * s);
			_setf(o + ( 4 << 2), x +   73.192 * s);
			_setf(o + ( 5 << 2), y +  -13.476 * s);
			_setf(o + ( 6 << 2), x +   73.192 * s);
			_setf(o + ( 7 << 2), y +   -4.590 * s);
			_setf(o + ( 8 << 2), x +   10.595 * s);
			_setf(o + ( 9 << 2), y +  -27.294 * s);
			_setf(o + (10 << 2), x +   10.595 * s);
			_setf(o + (11 << 2), y +  -35.400 * s);
			_setf(o + (12 << 2), x +   73.192 * s);
			_setf(o + (13 << 2), y +  -58.105 * s);
			_setf(o + (14 << 2), x +   73.192 * s);
			_setf(o + (15 << 2), y +  -49.218 * s);
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
			_setf(o + ( 1 << 2), y +  -45.409 * s);
			_setf(o + ( 2 << 2), x +   73.192 * s);
			_setf(o + ( 3 << 2), y +  -45.409 * s);
			_setf(o + ( 4 << 2), x +   73.192 * s);
			_setf(o + ( 5 << 2), y +  -37.206 * s);
			_setf(o + ( 6 << 2), x +   10.595 * s);
			_setf(o + ( 7 << 2), y +  -37.206 * s);
			_setf(o + ( 8 << 2), x +   10.595 * s);
			_setf(o + ( 9 << 2), y +  -45.409 * s);
			_setf(o + (10 << 2), x +   10.595 * s);
			_setf(o + (11 << 2), y +  -25.488 * s);
			_setf(o + (12 << 2), x +   73.192 * s);
			_setf(o + (13 << 2), y +  -25.488 * s);
			_setf(o + (14 << 2), x +   73.192 * s);
			_setf(o + (15 << 2), y +  -17.187 * s);
			_setf(o + (16 << 2), x +   10.595 * s);
			_setf(o + (17 << 2), y +  -17.187 * s);
			_setf(o + (18 << 2), x +   10.595 * s);
			_setf(o + (19 << 2), y +  -25.488 * s);
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
			_setf(o + ( 1 << 2), y +  -49.218 * s);
			_setf(o + ( 2 << 2), x +   10.595 * s);
			_setf(o + ( 3 << 2), y +  -58.105 * s);
			_setf(o + ( 4 << 2), x +   73.192 * s);
			_setf(o + ( 5 << 2), y +  -35.400 * s);
			_setf(o + ( 6 << 2), x +   73.192 * s);
			_setf(o + ( 7 << 2), y +  -27.294 * s);
			_setf(o + ( 8 << 2), x +   10.595 * s);
			_setf(o + ( 9 << 2), y +   -4.590 * s);
			_setf(o + (10 << 2), x +   10.595 * s);
			_setf(o + (11 << 2), y +  -13.476 * s);
			_setf(o + (12 << 2), x +   60.887 * s);
			_setf(o + (13 << 2), y +  -31.298 * s);
			_setf(o + (14 << 2), x +   10.595 * s);
			_setf(o + (15 << 2), y +  -49.218 * s);
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
			
			o = _posf(16);
			_setf(o + ( 0 << 2), x +   19.092 * s);
			_setf(o + ( 1 << 2), y +  -12.402 * s);
			_setf(o + ( 2 << 2), x +   29.004 * s);
			_setf(o + ( 3 << 2), y +  -12.402 * s);
			_setf(o + ( 4 << 2), x +   29.004 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   19.092 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   19.092 * s);
			_setf(o + ( 9 << 2), y +  -12.402 * s);
			_setf(o + (10 << 2), x +   28.711 * s);
			_setf(o + (11 << 2), y +  -19.580 * s);
			_setf(o + (12 << 2), x +   19.385 * s);
			_setf(o + (13 << 2), y +  -19.580 * s);
			_setf(o + (14 << 2), x +   19.385 * s);
			_setf(o + (15 << 2), y +  -27.099 * s);
			o = _posb(8);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_bez(x +   19.385 * s,y +  -27.099 * s,x +   19.385 * s,y +  -30.387 * s,x +   19.841 * s,y +  -33.089 * s,x +   20.752 * s,y +  -35.205 * s, threshold);
			_bez(x +   20.752 * s,y +  -35.205 * s,x +   21.663 * s,y +  -37.320 * s,x +   23.632 * s,y +  -39.728 * s,x +   26.514 * s,y +  -42.577 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   30.908 * s);
			_setf(o + ( 1 << 2), y +  -46.923 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   30.908 * s,y +  -46.923 * s,x +   32.710 * s,y +  -48.705 * s,x +   34.106 * s,y +  -50.276 * s,x +   34.936 * s,y +  -51.806 * s, threshold);
			_bez(x +   34.936 * s,y +  -51.806 * s,x +   35.766 * s,y +  -53.336 * s,x +   36.181 * s,y +  -54.898 * s,x +   36.181 * s,y +  -56.493 * s, threshold);
			_bez(x +   36.181 * s,y +  -56.493 * s,x +   36.181 * s,y +  -59.390 * s,x +   35.115 * s,y +  -61.734 * s,x +   32.983 * s,y +  -63.524 * s, threshold);
			_bez(x +   32.983 * s,y +  -63.524 * s,x +   30.851 * s,y +  -65.315 * s,x +   28.027 * s,y +  -66.210 * s,x +   24.512 * s,y +  -66.210 * s, threshold);
			_bez(x +   24.512 * s,y +  -66.210 * s,x +   21.940 * s,y +  -66.210 * s,x +   19.198 * s,y +  -65.640 * s,x +   16.284 * s,y +  -64.501 * s, threshold);
			_bez(x +   16.284 * s,y +  -64.501 * s,x +   13.371 * s,y +  -63.362 * s,x +   10.335 * s,y +  -61.702 * s,x +    7.178 * s,y +  -59.521 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    7.178 * s);
			_setf(o + ( 1 << 2), y +  -68.700 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    7.178 * s,y +  -68.700 * s,x +   10.238 * s,y +  -70.556 * s,x +   13.338 * s,y +  -71.939 * s,x +   16.480 * s,y +  -72.850 * s, threshold);
			_bez(x +   16.480 * s,y +  -72.850 * s,x +   19.621 * s,y +  -73.762 * s,x +   22.868 * s,y +  -74.218 * s,x +   26.221 * s,y +  -74.218 * s, threshold);
			_bez(x +   26.221 * s,y +  -74.218 * s,x +   32.210 * s,y +  -74.218 * s,x +   37.020 * s,y +  -72.639 * s,x +   40.649 * s,y +  -69.481 * s, threshold);
			_bez(x +   40.649 * s,y +  -69.481 * s,x +   44.279 * s,y +  -66.324 * s,x +   46.093 * s,y +  -62.157 * s,x +   46.093 * s,y +  -56.982 * s, threshold);
			_bez(x +   46.093 * s,y +  -56.982 * s,x +   46.093 * s,y +  -54.508 * s,x +   45.507 * s,y +  -52.156 * s,x +   44.336 * s,y +  -49.926 * s, threshold);
			_bez(x +   44.336 * s,y +  -49.926 * s,x +   43.164 * s,y +  -47.696 * s,x +   41.081 * s,y +  -45.214 * s,x +   38.183 * s,y +  -42.382 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   33.887 * s);
			_setf(o + ( 1 << 2), y +  -38.183 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   33.887 * s,y +  -38.183 * s,x +   32.339 * s,y +  -36.671 * s,x +   31.274 * s,y +  -35.457 * s,x +   30.640 * s,y +  -34.594 * s, threshold);
			_bez(x +   30.640 * s,y +  -34.594 * s,x +   30.005 * s,y +  -33.732 * s,x +   29.546 * s,y +  -32.897 * s,x +   29.297 * s,y +  -32.080 * s, threshold);
			_bez(x +   29.297 * s,y +  -32.080 * s,x +   29.090 * s,y +  -31.399 * s,x +   28.955 * s,y +  -30.566 * s,x +   28.857 * s,y +  -29.589 * s, threshold);
			_bez(x +   28.857 * s,y +  -29.589 * s,x +   28.760 * s,y +  -28.613 * s,x +   28.711 * s,y +  -27.278 * s,x +   28.711 * s,y +  -25.586 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   28.711 * s);
			_setf(o + ( 1 << 2), y +  -19.580 * s);
			_setf(o + ( 2 << 2), x +   53.076 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 64:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   37.206 * s);
			_setf(o + ( 1 << 2), y +  -26.220 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   37.206 * s,y +  -26.220 * s,x +   37.206 * s,y +  -21.566 * s,x +   38.362 * s,y +  -17.911 * s,x +   40.673 * s,y +  -15.259 * s, threshold);
			_bez(x +   40.673 * s,y +  -15.259 * s,x +   42.984 * s,y +  -12.606 * s,x +   46.158 * s,y +  -11.279 * s,x +   50.194 * s,y +  -11.279 * s, threshold);
			_bez(x +   50.194 * s,y +  -11.279 * s,x +   54.198 * s,y +  -11.279 * s,x +   57.347 * s,y +  -12.614 * s,x +   59.642 * s,y +  -15.283 * s, threshold);
			_bez(x +   59.642 * s,y +  -15.283 * s,x +   61.937 * s,y +  -17.952 * s,x +   63.085 * s,y +  -21.598 * s,x +   63.085 * s,y +  -26.220 * s, threshold);
			_bez(x +   63.085 * s,y +  -26.220 * s,x +   63.085 * s,y +  -30.777 * s,x +   61.913 * s,y +  -34.399 * s,x +   59.569 * s,y +  -37.084 * s, threshold);
			_bez(x +   59.569 * s,y +  -37.084 * s,x +   57.225 * s,y +  -39.770 * s,x +   54.068 * s,y +  -41.113 * s,x +   50.097 * s,y +  -41.113 * s, threshold);
			_bez(x +   50.097 * s,y +  -41.113 * s,x +   46.158 * s,y +  -41.113 * s,x +   43.025 * s,y +  -39.778 * s,x +   40.697 * s,y +  -37.109 * s, threshold);
			_bez(x +   40.697 * s,y +  -37.109 * s,x +   38.370 * s,y +  -34.440 * s,x +   37.206 * s,y +  -30.810 * s,x +   37.206 * s,y +  -26.220 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   63.817 * s);
			_setf(o + ( 1 << 2), y +  -11.621 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   63.817 * s,y +  -11.621 * s,x +   61.864 * s,y +   -9.114 * s,x +   59.626 * s,y +   -7.267 * s,x +   57.103 * s,y +   -6.079 * s, threshold);
			_bez(x +   57.103 * s,y +   -6.079 * s,x +   54.581 * s,y +   -4.891 * s,x +   51.643 * s,y +   -4.297 * s,x +   48.290 * s,y +   -4.297 * s, threshold);
			_bez(x +   48.290 * s,y +   -4.297 * s,x +   42.691 * s,y +   -4.297 * s,x +   38.142 * s,y +   -6.323 * s,x +   34.643 * s,y +  -10.376 * s, threshold);
			_bez(x +   34.643 * s,y +  -10.376 * s,x +   31.143 * s,y +  -14.428 * s,x +   29.394 * s,y +  -19.710 * s,x +   29.394 * s,y +  -26.220 * s, threshold);
			_bez(x +   29.394 * s,y +  -26.220 * s,x +   29.394 * s,y +  -32.731 * s,x +   31.152 * s,y +  -38.020 * s,x +   34.667 * s,y +  -42.089 * s, threshold);
			_bez(x +   34.667 * s,y +  -42.089 * s,x +   38.183 * s,y +  -46.158 * s,x +   42.723 * s,y +  -48.193 * s,x +   48.290 * s,y +  -48.193 * s, threshold);
			_bez(x +   48.290 * s,y +  -48.193 * s,x +   51.643 * s,y +  -48.193 * s,x +   54.589 * s,y +  -47.582 * s,x +   57.128 * s,y +  -46.362 * s, threshold);
			_bez(x +   57.128 * s,y +  -46.362 * s,x +   59.667 * s,y +  -45.141 * s,x +   61.897 * s,y +  -43.294 * s,x +   63.817 * s,y +  -40.820 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   63.817 * s);
			_setf(o + ( 1 << 2), y +  -47.216 * s);
			_setf(o + ( 2 << 2), x +   70.799 * s);
			_setf(o + ( 3 << 2), y +  -47.216 * s);
			_setf(o + ( 4 << 2), x +   70.799 * s);
			_setf(o + ( 5 << 2), y +  -11.279 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   70.799 * s,y +  -11.279 * s,x +   75.552 * s,y +  -11.995 * s,x +   79.271 * s,y +  -14.168 * s,x +   81.956 * s,y +  -17.798 * s, threshold);
			_bez(x +   81.956 * s,y +  -17.798 * s,x +   84.642 * s,y +  -21.427 * s,x +   85.985 * s,y +  -26.122 * s,x +   85.985 * s,y +  -31.884 * s, threshold);
			_bez(x +   85.985 * s,y +  -31.884 * s,x +   85.985 * s,y +  -35.367 * s,x +   85.472 * s,y +  -38.639 * s,x +   84.447 * s,y +  -41.699 * s, threshold);
			_bez(x +   84.447 * s,y +  -41.699 * s,x +   83.421 * s,y +  -44.758 * s,x +   81.861 * s,y +  -47.586 * s,x +   79.784 * s,y +  -50.195 * s, threshold);
			_bez(x +   79.784 * s,y +  -50.195 * s,x +   76.392 * s,y +  -54.454 * s,x +   72.272 * s,y +  -57.722 * s,x +   67.406 * s,y +  -59.984 * s, threshold);
			_bez(x +   67.406 * s,y +  -59.984 * s,x +   62.539 * s,y +  -62.247 * s,x +   57.242 * s,y +  -63.378 * s,x +   51.513 * s,y +  -63.378 * s, threshold);
			_bez(x +   51.513 * s,y +  -63.378 * s,x +   47.509 * s,y +  -63.378 * s,x +   43.668 * s,y +  -62.849 * s,x +   39.989 * s,y +  -61.791 * s, threshold);
			_bez(x +   39.989 * s,y +  -61.791 * s,x +   36.311 * s,y +  -60.733 * s,x +   32.924 * s,y +  -59.139 * s,x +   29.784 * s,y +  -57.079 * s, threshold);
			_bez(x +   29.784 * s,y +  -57.079 * s,x +   24.689 * s,y +  -53.736 * s,x +   20.678 * s,y +  -49.405 * s,x +   17.797 * s,y +  -44.018 * s, threshold);
			_bez(x +   17.797 * s,y +  -44.018 * s,x +   14.916 * s,y +  -38.631 * s,x +   13.476 * s,y +  -32.796 * s,x +   13.476 * s,y +  -26.513 * s, threshold);
			_bez(x +   13.476 * s,y +  -26.513 * s,x +   13.476 * s,y +  -21.337 * s,x +   14.412 * s,y +  -16.487 * s,x +   16.284 * s,y +  -11.963 * s, threshold);
			_bez(x +   16.284 * s,y +  -11.963 * s,x +   18.155 * s,y +   -7.438 * s,x +   20.881 * s,y +   -3.466 * s,x +   24.413 * s,y +       0. * s, threshold);
			_bez(x +   24.413 * s,y +       0. * s,x +   27.847 * s,y +    3.370 * s,x +   31.786 * s,y +    5.965 * s,x +   36.278 * s,y +    7.739 * s, threshold);
			_bez(x +   36.278 * s,y +    7.739 * s,x +   40.771 * s,y +    9.513 * s,x +   45.572 * s,y +   10.400 * s,x +   50.683 * s,y +   10.400 * s, threshold);
			_bez(x +   50.683 * s,y +   10.400 * s,x +   54.882 * s,y +   10.400 * s,x +   59.008 * s,y +    9.692 * s,x +   63.060 * s,y +    8.276 * s, threshold);
			_bez(x +   63.060 * s,y +    8.276 * s,x +   67.113 * s,y +    6.860 * s,x +   70.832 * s,y +    4.834 * s,x +   74.217 * s,y +    2.197 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   78.612 * s);
			_setf(o + ( 1 << 2), y +    7.617 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   78.612 * s,y +    7.617 * s,x +   74.543 * s,y +   10.775 * s,x +   70.108 * s,y +   13.192 * s,x +   65.306 * s,y +   14.868 * s, threshold);
			_bez(x +   65.306 * s,y +   14.868 * s,x +   60.505 * s,y +   16.544 * s,x +   55.630 * s,y +   17.383 * s,x +   50.683 * s,y +   17.383 * s, threshold);
			_bez(x +   50.683 * s,y +   17.383 * s,x +   44.660 * s,y +   17.383 * s,x +   38.980 * s,y +   16.316 * s,x +   33.642 * s,y +   14.184 * s, threshold);
			_bez(x +   33.642 * s,y +   14.184 * s,x +   28.303 * s,y +   12.052 * s,x +   23.551 * s,y +    8.952 * s,x +   19.384 * s,y +    4.883 * s, threshold);
			_bez(x +   19.384 * s,y +    4.883 * s,x +   15.218 * s,y +    0.814 * s,x +   12.044 * s,y +   -3.898 * s,x +    9.863 * s,y +   -9.253 * s, threshold);
			_bez(x +    9.863 * s,y +   -9.253 * s,x +    7.682 * s,y +  -14.608 * s,x +    6.591 * s,y +  -20.361 * s,x +    6.591 * s,y +  -26.513 * s, threshold);
			_bez(x +    6.591 * s,y +  -26.513 * s,x +    6.591 * s,y +  -32.438 * s,x +    7.698 * s,y +  -38.085 * s,x +    9.912 * s,y +  -43.456 * s, threshold);
			_bez(x +    9.912 * s,y +  -43.456 * s,x +   12.125 * s,y +  -48.827 * s,x +   15.275 * s,y +  -53.555 * s,x +   19.384 * s,y +  -57.616 * s, threshold);
			_bez(x +   19.384 * s,y +  -57.616 * s,x +   23.575 * s,y +  -61.758 * s,x +   28.433 * s,y +  -64.916 * s,x +   33.935 * s,y +  -67.113 * s, threshold);
			_bez(x +   33.935 * s,y +  -67.113 * s,x +   39.436 * s,y +  -69.310 * s,x +   45.263 * s,y +  -70.409 * s,x +   51.415 * s,y +  -70.409 * s, threshold);
			_bez(x +   51.415 * s,y +  -70.409 * s,x +   58.316 * s,y +  -70.409 * s,x +   64.720 * s,y +  -68.993 * s,x +   70.628 * s,y +  -66.161 * s, threshold);
			_bez(x +   70.628 * s,y +  -66.161 * s,x +   76.537 * s,y +  -63.329 * s,x +   81.497 * s,y +  -59.312 * s,x +   85.496 * s,y +  -54.101 * s, threshold);
			_bez(x +   85.496 * s,y +  -54.101 * s,x +   87.942 * s,y +  -50.914 * s,x +   89.801 * s,y +  -47.444 * s,x +   91.087 * s,y +  -43.701 * s, threshold);
			_bez(x +   91.087 * s,y +  -43.701 * s,x +   92.373 * s,y +  -39.957 * s,x +   93.016 * s,y +  -36.083 * s,x +   93.016 * s,y +  -32.080 * s, threshold);
			_bez(x +   93.016 * s,y +  -32.080 * s,x +   93.016 * s,y +  -23.519 * s,x +   90.428 * s,y +  -16.764 * s,x +   85.252 * s,y +  -11.816 * s, threshold);
			_bez(x +   85.252 * s,y +  -11.816 * s,x +   80.077 * s,y +   -6.868 * s,x +   72.931 * s,y +   -4.297 * s,x +   63.817 * s,y +   -4.101 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   63.817 * s);
			_setf(o + ( 1 << 2), y +  -11.621 * s);
			_setf(o + ( 2 << 2), x +   99.998 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 65:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   34.179 * s);
			_setf(o + ( 1 << 2), y +  -63.183 * s);
			_setf(o + ( 2 << 2), x +   20.801 * s);
			_setf(o + ( 3 << 2), y +  -26.904 * s);
			_setf(o + ( 4 << 2), x +   47.607 * s);
			_setf(o + ( 5 << 2), y +  -26.904 * s);
			_setf(o + ( 6 << 2), x +   34.179 * s);
			_setf(o + ( 7 << 2), y +  -63.183 * s);
			_setf(o + ( 8 << 2), x +   28.613 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   39.794 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   67.577 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   57.323 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   50.683 * s);
			_setf(o + (17 << 2), y +  -18.701 * s);
			_setf(o + (18 << 2), x +   17.822 * s);
			_setf(o + (19 << 2), y +  -18.701 * s);
			_setf(o + (20 << 2), x +   11.182 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +    0.781 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   28.613 * s);
			_setf(o + (25 << 2), y +  -72.899 * s);
			_setf(o + (26 << 2), x +   68.407 * s);
			_setf(o + (27 << 2), y +       0. * s);
			o = _posb(14);
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
			_setb(o + 13, 1);
			
			case 66:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   19.677 * s);
			_setf(o + ( 1 << 2), y +  -34.814 * s);
			_setf(o + ( 2 << 2), x +   19.677 * s);
			_setf(o + ( 3 << 2), y +   -8.105 * s);
			_setf(o + ( 4 << 2), x +   35.497 * s);
			_setf(o + ( 5 << 2), y +   -8.105 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   35.497 * s,y +   -8.105 * s,x +   40.803 * s,y +   -8.105 * s,x +   44.734 * s,y +   -9.204 * s,x +   47.289 * s,y +  -11.401 * s, threshold);
			_bez(x +   47.289 * s,y +  -11.401 * s,x +   49.845 * s,y +  -13.598 * s,x +   51.122 * s,y +  -16.959 * s,x +   51.122 * s,y +  -21.484 * s, threshold);
			_bez(x +   51.122 * s,y +  -21.484 * s,x +   51.122 * s,y +  -26.041 * s,x +   49.845 * s,y +  -29.402 * s,x +   47.289 * s,y +  -31.567 * s, threshold);
			_bez(x +   47.289 * s,y +  -31.567 * s,x +   44.734 * s,y +  -33.732 * s,x +   40.803 * s,y +  -34.814 * s,x +   35.497 * s,y +  -34.814 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   19.677 * s);
			_setf(o + ( 1 << 2), y +  -34.814 * s);
			_setf(o + ( 2 << 2), x +   19.677 * s);
			_setf(o + ( 3 << 2), y +  -64.794 * s);
			_setf(o + ( 4 << 2), x +   19.677 * s);
			_setf(o + ( 5 << 2), y +  -42.822 * s);
			_setf(o + ( 6 << 2), x +   34.277 * s);
			_setf(o + ( 7 << 2), y +  -42.822 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_bez(x +   34.277 * s,y +  -42.822 * s,x +   39.094 * s,y +  -42.822 * s,x +   42.683 * s,y +  -43.725 * s,x +   45.043 * s,y +  -45.532 * s, threshold);
			_bez(x +   45.043 * s,y +  -45.532 * s,x +   47.403 * s,y +  -47.338 * s,x +   48.583 * s,y +  -50.097 * s,x +   48.583 * s,y +  -53.808 * s, threshold);
			_bez(x +   48.583 * s,y +  -53.808 * s,x +   48.583 * s,y +  -57.486 * s,x +   47.403 * s,y +  -60.237 * s,x +   45.043 * s,y +  -62.060 * s, threshold);
			_bez(x +   45.043 * s,y +  -62.060 * s,x +   42.683 * s,y +  -63.882 * s,x +   39.094 * s,y +  -64.794 * s,x +   34.277 * s,y +  -64.794 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   19.677 * s);
			_setf(o + ( 1 << 2), y +  -64.794 * s);
			_setf(o + ( 2 << 2), x +    9.814 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   35.009 * s);
			_setf(o + ( 5 << 2), y +  -72.899 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_setb(o +  2, 2);
			_bez(x +   35.009 * s,y +  -72.899 * s,x +   42.529 * s,y +  -72.899 * s,x +   48.323 * s,y +  -71.337 * s,x +   52.392 * s,y +  -68.212 * s, threshold);
			_bez(x +   52.392 * s,y +  -68.212 * s,x +   56.461 * s,y +  -65.087 * s,x +   58.495 * s,y +  -60.644 * s,x +   58.495 * s,y +  -54.882 * s, threshold);
			_bez(x +   58.495 * s,y +  -54.882 * s,x +   58.495 * s,y +  -50.423 * s,x +   57.453 * s,y +  -46.874 * s,x +   55.370 * s,y +  -44.238 * s, threshold);
			_bez(x +   55.370 * s,y +  -44.238 * s,x +   53.287 * s,y +  -41.601 * s,x +   50.227 * s,y +  -39.957 * s,x +   46.191 * s,y +  -39.306 * s, threshold);
			_bez(x +   46.191 * s,y +  -39.306 * s,x +   51.041 * s,y +  -38.264 * s,x +   54.809 * s,y +  -36.092 * s,x +   57.494 * s,y +  -32.788 * s, threshold);
			_bez(x +   57.494 * s,y +  -32.788 * s,x +   60.180 * s,y +  -29.484 * s,x +   61.522 * s,y +  -25.358 * s,x +   61.522 * s,y +  -20.410 * s, threshold);
			_bez(x +   61.522 * s,y +  -20.410 * s,x +   61.522 * s,y +  -13.899 * s,x +   59.309 * s,y +   -8.870 * s,x +   54.882 * s,y +   -5.322 * s, threshold);
			_bez(x +   54.882 * s,y +   -5.322 * s,x +   50.455 * s,y +   -1.774 * s,x +   44.156 * s,y +       0. * s,x +   35.986 * s,y +       0. * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    9.814 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    9.814 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   68.602 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 67:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   64.403 * s);
			_setf(o + ( 1 << 2), y +  -67.284 * s);
			_setf(o + ( 2 << 2), x +   64.403 * s);
			_setf(o + ( 3 << 2), y +  -56.884 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   64.403 * s,y +  -56.884 * s,x +   61.083 * s,y +  -59.976 * s,x +   57.543 * s,y +  -62.287 * s,x +   53.783 * s,y +  -63.817 * s, threshold);
			_bez(x +   53.783 * s,y +  -63.817 * s,x +   50.023 * s,y +  -65.347 * s,x +   46.028 * s,y +  -66.112 * s,x +   41.796 * s,y +  -66.112 * s, threshold);
			_bez(x +   41.796 * s,y +  -66.112 * s,x +   33.463 * s,y +  -66.112 * s,x +   27.083 * s,y +  -63.565 * s,x +   22.656 * s,y +  -58.471 * s, threshold);
			_bez(x +   22.656 * s,y +  -58.471 * s,x +   18.229 * s,y +  -53.376 * s,x +   16.015 * s,y +  -46.011 * s,x +   16.015 * s,y +  -36.376 * s, threshold);
			_bez(x +   16.015 * s,y +  -36.376 * s,x +   16.015 * s,y +  -26.774 * s,x +   18.229 * s,y +  -19.425 * s,x +   22.656 * s,y +  -14.331 * s, threshold);
			_bez(x +   22.656 * s,y +  -14.331 * s,x +   27.083 * s,y +   -9.236 * s,x +   33.463 * s,y +   -6.689 * s,x +   41.796 * s,y +   -6.689 * s, threshold);
			_bez(x +   41.796 * s,y +   -6.689 * s,x +   46.028 * s,y +   -6.689 * s,x +   50.023 * s,y +   -7.454 * s,x +   53.783 * s,y +   -8.984 * s, threshold);
			_bez(x +   53.783 * s,y +   -8.984 * s,x +   57.543 * s,y +  -10.514 * s,x +   61.083 * s,y +  -12.825 * s,x +   64.403 * s,y +  -15.918 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   64.403 * s);
			_setf(o + ( 1 << 2), y +   -5.615 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   64.403 * s,y +   -5.615 * s,x +   60.953 * s,y +   -3.271 * s,x +   57.299 * s,y +   -1.514 * s,x +   53.441 * s,y +   -0.342 * s, threshold);
			_bez(x +   53.441 * s,y +   -0.342 * s,x +   49.584 * s,y +    0.830 * s,x +   45.507 * s,y +    1.416 * s,x +   41.210 * s,y +    1.416 * s, threshold);
			_bez(x +   41.210 * s,y +    1.416 * s,x +   30.175 * s,y +    1.416 * s,x +   21.484 * s,y +   -1.961 * s,x +   15.136 * s,y +   -8.716 * s, threshold);
			_bez(x +   15.136 * s,y +   -8.716 * s,x +    8.789 * s,y +  -15.470 * s,x +    5.615 * s,y +  -24.690 * s,x +    5.615 * s,y +  -36.376 * s, threshold);
			_bez(x +    5.615 * s,y +  -36.376 * s,x +    5.615 * s,y +  -48.095 * s,x +    8.789 * s,y +  -57.331 * s,x +   15.136 * s,y +  -64.086 * s, threshold);
			_bez(x +   15.136 * s,y +  -64.086 * s,x +   21.484 * s,y +  -70.840 * s,x +   30.175 * s,y +  -74.218 * s,x +   41.210 * s,y +  -74.218 * s, threshold);
			_bez(x +   41.210 * s,y +  -74.218 * s,x +   45.572 * s,y +  -74.218 * s,x +   49.682 * s,y +  -73.640 * s,x +   53.539 * s,y +  -72.484 * s, threshold);
			_bez(x +   53.539 * s,y +  -72.484 * s,x +   57.396 * s,y +  -71.329 * s,x +   61.018 * s,y +  -69.595 * s,x +   64.403 * s,y +  -67.284 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   69.823 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 68:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   19.677 * s);
			_setf(o + ( 1 << 2), y +  -64.794 * s);
			_setf(o + ( 2 << 2), x +   19.677 * s);
			_setf(o + ( 3 << 2), y +   -8.105 * s);
			_setf(o + ( 4 << 2), x +   31.591 * s);
			_setf(o + ( 5 << 2), y +   -8.105 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   31.591 * s,y +   -8.105 * s,x +   41.650 * s,y +   -8.105 * s,x +   49.014 * s,y +  -10.384 * s,x +   53.686 * s,y +  -14.941 * s, threshold);
			_bez(x +   53.686 * s,y +  -14.941 * s,x +   58.357 * s,y +  -19.498 * s,x +   60.692 * s,y +  -26.692 * s,x +   60.692 * s,y +  -36.523 * s, threshold);
			_bez(x +   60.692 * s,y +  -36.523 * s,x +   60.692 * s,y +  -46.289 * s,x +   58.357 * s,y +  -53.442 * s,x +   53.686 * s,y +  -57.983 * s, threshold);
			_bez(x +   53.686 * s,y +  -57.983 * s,x +   49.014 * s,y +  -62.523 * s,x +   41.650 * s,y +  -64.794 * s,x +   31.591 * s,y +  -64.794 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   19.677 * s);
			_setf(o + ( 1 << 2), y +  -64.794 * s);
			_setf(o + ( 2 << 2), x +    9.814 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   30.077 * s);
			_setf(o + ( 5 << 2), y +  -72.899 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_setb(o +  2, 2);
			_bez(x +   30.077 * s,y +  -72.899 * s,x +   44.205 * s,y +  -72.899 * s,x +   54.573 * s,y +  -69.961 * s,x +   61.181 * s,y +  -64.086 * s, threshold);
			_bez(x +   61.181 * s,y +  -64.086 * s,x +   67.788 * s,y +  -58.210 * s,x +   71.092 * s,y +  -49.023 * s,x +   71.092 * s,y +  -36.523 * s, threshold);
			_bez(x +   71.092 * s,y +  -36.523 * s,x +   71.092 * s,y +  -23.958 * s,x +   67.772 * s,y +  -14.730 * s,x +   61.132 * s,y +   -8.838 * s, threshold);
			_bez(x +   61.132 * s,y +   -8.838 * s,x +   54.491 * s,y +   -2.946 * s,x +   44.140 * s,y +       0. * s,x +   30.077 * s,y +       0. * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    9.814 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    9.814 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   77.001 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 69:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +    9.814 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   55.907 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   55.907 * s);
			_setf(o + ( 5 << 2), y +  -64.599 * s);
			_setf(o + ( 6 << 2), x +   19.677 * s);
			_setf(o + ( 7 << 2), y +  -64.599 * s);
			_setf(o + ( 8 << 2), x +   19.677 * s);
			_setf(o + ( 9 << 2), y +  -43.017 * s);
			_setf(o + (10 << 2), x +   54.393 * s);
			_setf(o + (11 << 2), y +  -43.017 * s);
			_setf(o + (12 << 2), x +   54.393 * s);
			_setf(o + (13 << 2), y +  -34.716 * s);
			_setf(o + (14 << 2), x +   19.677 * s);
			_setf(o + (15 << 2), y +  -34.716 * s);
			_setf(o + (16 << 2), x +   19.677 * s);
			_setf(o + (17 << 2), y +   -8.301 * s);
			_setf(o + (18 << 2), x +   56.786 * s);
			_setf(o + (19 << 2), y +   -8.301 * s);
			_setf(o + (20 << 2), x +   56.786 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +    9.814 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +    9.814 * s);
			_setf(o + (25 << 2), y +  -72.899 * s);
			_setf(o + (26 << 2), x +   63.182 * s);
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
			_setf(o + ( 0 << 2), x +    9.814 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   51.708 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   51.708 * s);
			_setf(o + ( 5 << 2), y +  -64.599 * s);
			_setf(o + ( 6 << 2), x +   19.678 * s);
			_setf(o + ( 7 << 2), y +  -64.599 * s);
			_setf(o + ( 8 << 2), x +   19.678 * s);
			_setf(o + ( 9 << 2), y +  -43.115 * s);
			_setf(o + (10 << 2), x +   48.583 * s);
			_setf(o + (11 << 2), y +  -43.115 * s);
			_setf(o + (12 << 2), x +   48.583 * s);
			_setf(o + (13 << 2), y +  -34.814 * s);
			_setf(o + (14 << 2), x +   19.678 * s);
			_setf(o + (15 << 2), y +  -34.814 * s);
			_setf(o + (16 << 2), x +   19.678 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +    9.814 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +    9.814 * s);
			_setf(o + (21 << 2), y +  -72.899 * s);
			_setf(o + (22 << 2), x +   57.519 * s);
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
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   59.520 * s);
			_setf(o + ( 1 << 2), y +  -10.400 * s);
			_setf(o + ( 2 << 2), x +   59.520 * s);
			_setf(o + ( 3 << 2), y +  -29.980 * s);
			_setf(o + ( 4 << 2), x +   43.407 * s);
			_setf(o + ( 5 << 2), y +  -29.980 * s);
			_setf(o + ( 6 << 2), x +   43.407 * s);
			_setf(o + ( 7 << 2), y +  -38.085 * s);
			_setf(o + ( 8 << 2), x +   69.286 * s);
			_setf(o + ( 9 << 2), y +  -38.085 * s);
			_setf(o + (10 << 2), x +   69.286 * s);
			_setf(o + (11 << 2), y +   -6.787 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_bez(x +   69.286 * s,y +   -6.787 * s,x +   65.477 * s,y +   -4.085 * s,x +   61.278 * s,y +   -2.043 * s,x +   56.688 * s,y +   -0.659 * s, threshold);
			_bez(x +   56.688 * s,y +   -0.659 * s,x +   52.099 * s,y +    0.724 * s,x +   47.200 * s,y +    1.416 * s,x +   41.991 * s,y +    1.416 * s, threshold);
			_bez(x +   41.991 * s,y +    1.416 * s,x +   30.599 * s,y +    1.416 * s,x +   21.687 * s,y +   -1.912 * s,x +   15.258 * s,y +   -8.569 * s, threshold);
			_bez(x +   15.258 * s,y +   -8.569 * s,x +    8.829 * s,y +  -15.226 * s,x +    5.615 * s,y +  -24.495 * s,x +    5.615 * s,y +  -36.376 * s, threshold);
			_bez(x +    5.615 * s,y +  -36.376 * s,x +    5.615 * s,y +  -48.291 * s,x +    8.829 * s,y +  -57.576 * s,x +   15.258 * s,y +  -64.232 * s, threshold);
			_bez(x +   15.258 * s,y +  -64.232 * s,x +   21.687 * s,y +  -70.889 * s,x +   30.598 * s,y +  -74.218 * s,x +   41.991 * s,y +  -74.218 * s, threshold);
			_bez(x +   41.991 * s,y +  -74.218 * s,x +   46.744 * s,y +  -74.218 * s,x +   51.260 * s,y +  -73.632 * s,x +   55.541 * s,y +  -72.460 * s, threshold);
			_bez(x +   55.541 * s,y +  -72.460 * s,x +   59.821 * s,y +  -71.288 * s,x +   63.768 * s,y +  -69.563 * s,x +   67.382 * s,y +  -67.284 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   67.382 * s);
			_setf(o + ( 1 << 2), y +  -56.786 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   67.382 * s,y +  -56.786 * s,x +   63.736 * s,y +  -59.879 * s,x +   59.862 * s,y +  -62.206 * s,x +   55.761 * s,y +  -63.769 * s, threshold);
			_bez(x +   55.761 * s,y +  -63.769 * s,x +   51.659 * s,y +  -65.331 * s,x +   47.346 * s,y +  -66.112 * s,x +   42.821 * s,y +  -66.112 * s, threshold);
			_bez(x +   42.821 * s,y +  -66.112 * s,x +   33.903 * s,y +  -66.112 * s,x +   27.205 * s,y +  -63.622 * s,x +   22.729 * s,y +  -58.642 * s, threshold);
			_bez(x +   22.729 * s,y +  -58.642 * s,x +   18.253 * s,y +  -53.661 * s,x +   16.015 * s,y +  -46.240 * s,x +   16.015 * s,y +  -36.376 * s, threshold);
			_bez(x +   16.015 * s,y +  -36.376 * s,x +   16.015 * s,y +  -26.546 * s,x +   18.253 * s,y +  -19.140 * s,x +   22.729 * s,y +  -14.160 * s, threshold);
			_bez(x +   22.729 * s,y +  -14.160 * s,x +   27.205 * s,y +   -9.180 * s,x +   33.903 * s,y +   -6.689 * s,x +   42.821 * s,y +   -6.689 * s, threshold);
			_bez(x +   42.821 * s,y +   -6.689 * s,x +   46.304 * s,y +   -6.689 * s,x +   49.413 * s,y +   -6.990 * s,x +   52.147 * s,y +   -7.593 * s, threshold);
			_bez(x +   52.147 * s,y +   -7.593 * s,x +   54.882 * s,y +   -8.195 * s,x +   57.339 * s,y +   -9.131 * s,x +   59.520 * s,y +  -10.400 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   77.489 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 72:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +    9.814 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   19.677 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   19.677 * s);
			_setf(o + ( 5 << 2), y +  -43.017 * s);
			_setf(o + ( 6 << 2), x +   55.517 * s);
			_setf(o + ( 7 << 2), y +  -43.017 * s);
			_setf(o + ( 8 << 2), x +   55.517 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   65.380 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   65.380 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   55.517 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   55.517 * s);
			_setf(o + (17 << 2), y +  -34.716 * s);
			_setf(o + (18 << 2), x +   19.677 * s);
			_setf(o + (19 << 2), y +  -34.716 * s);
			_setf(o + (20 << 2), x +   19.677 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +    9.814 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +    9.814 * s);
			_setf(o + (25 << 2), y +  -72.899 * s);
			_setf(o + (26 << 2), x +   75.194 * s);
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
			_setf(o + ( 0 << 2), x +    9.814 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   19.677 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   19.677 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    9.814 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    9.814 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   29.492 * s);
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
			_setf(o + ( 0 << 2), x +    9.814 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   19.677 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   19.677 * s);
			_setf(o + ( 5 << 2), y +   -5.078 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   19.677 * s,y +   -5.078 * s,x +   19.677 * s,y +    3.711 * s,x +   18.009 * s,y +   10.091 * s,x +   14.673 * s,y +   14.062 * s, threshold);
			_bez(x +   14.673 * s,y +   14.062 * s,x +   11.336 * s,y +   18.034 * s,x +    5.973 * s,y +   20.019 * s,x +   -1.416 * s,y +   20.019 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   -5.176 * s);
			_setf(o + ( 1 << 2), y +   20.019 * s);
			_setf(o + ( 2 << 2), x +   -5.176 * s);
			_setf(o + ( 3 << 2), y +   11.719 * s);
			_setf(o + ( 4 << 2), x +   -2.100 * s);
			_setf(o + ( 5 << 2), y +   11.719 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   -2.100 * s,y +   11.719 * s,x +    2.262 * s,y +   11.719 * s,x +    5.338 * s,y +   10.498 * s,x +    7.129 * s,y +    8.057 * s, threshold);
			_bez(x +    7.129 * s,y +    8.057 * s,x +    8.919 * s,y +    5.615 * s,x +    9.814 * s,y +    1.237 * s,x +    9.814 * s,y +   -5.078 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    9.814 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   29.492 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 75:
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +    9.814 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   19.677 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   19.677 * s);
			_setf(o + ( 5 << 2), y +  -42.089 * s);
			_setf(o + ( 6 << 2), x +   52.392 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   65.087 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   28.906 * s);
			_setf(o + (11 << 2), y +  -38.915 * s);
			_setf(o + (12 << 2), x +   67.674 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   54.687 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   19.677 * s);
			_setf(o + (17 << 2), y +  -35.107 * s);
			_setf(o + (18 << 2), x +   19.677 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +    9.814 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +    9.814 * s);
			_setf(o + (23 << 2), y +  -72.899 * s);
			_setf(o + (24 << 2), x +   65.575 * s);
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
			_setf(o + ( 0 << 2), x +    9.814 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   19.677 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   19.677 * s);
			_setf(o + ( 5 << 2), y +   -8.301 * s);
			_setf(o + ( 6 << 2), x +   55.175 * s);
			_setf(o + ( 7 << 2), y +   -8.301 * s);
			_setf(o + ( 8 << 2), x +   55.175 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +    9.814 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    9.814 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   55.712 * s);
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
			_setf(o + ( 0 << 2), x +    9.814 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   24.511 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   43.114 * s);
			_setf(o + ( 5 << 2), y +  -23.291 * s);
			_setf(o + ( 6 << 2), x +   61.815 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   76.512 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   76.512 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   66.893 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   66.893 * s);
			_setf(o + (15 << 2), y +  -64.013 * s);
			_setf(o + (16 << 2), x +   48.095 * s);
			_setf(o + (17 << 2), y +  -14.013 * s);
			_setf(o + (18 << 2), x +   38.183 * s);
			_setf(o + (19 << 2), y +  -14.013 * s);
			_setf(o + (20 << 2), x +   19.384 * s);
			_setf(o + (21 << 2), y +  -64.013 * s);
			_setf(o + (22 << 2), x +   19.384 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +    9.814 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +    9.814 * s);
			_setf(o + (27 << 2), y +  -72.899 * s);
			_setf(o + (28 << 2), x +   86.278 * s);
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
			_setf(o + ( 0 << 2), x +    9.814 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   23.095 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   55.419 * s);
			_setf(o + ( 5 << 2), y +  -11.914 * s);
			_setf(o + ( 6 << 2), x +   55.419 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   64.989 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   64.989 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   51.708 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   19.384 * s);
			_setf(o + (15 << 2), y +  -60.985 * s);
			_setf(o + (16 << 2), x +   19.384 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +    9.814 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +    9.814 * s);
			_setf(o + (21 << 2), y +  -72.899 * s);
			_setf(o + (22 << 2), x +   74.803 * s);
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
			_setf(o + ( 0 << 2), x +   39.404 * s);
			_setf(o + ( 1 << 2), y +  -66.210 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   39.404 * s,y +  -66.210 * s,x +   32.243 * s,y +  -66.210 * s,x +   26.554 * s,y +  -63.541 * s,x +   22.339 * s,y +  -58.202 * s, threshold);
			_bez(x +   22.339 * s,y +  -58.202 * s,x +   18.124 * s,y +  -52.864 * s,x +   16.016 * s,y +  -45.588 * s,x +   16.016 * s,y +  -36.376 * s, threshold);
			_bez(x +   16.016 * s,y +  -36.376 * s,x +   16.016 * s,y +  -27.197 * s,x +   18.124 * s,y +  -19.938 * s,x +   22.339 * s,y +  -14.599 * s, threshold);
			_bez(x +   22.339 * s,y +  -14.599 * s,x +   26.554 * s,y +   -9.261 * s,x +   32.243 * s,y +   -6.592 * s,x +   39.404 * s,y +   -6.592 * s, threshold);
			_bez(x +   39.404 * s,y +   -6.592 * s,x +   46.565 * s,y +   -6.592 * s,x +   52.238 * s,y +   -9.261 * s,x +   56.420 * s,y +  -14.599 * s, threshold);
			_bez(x +   56.420 * s,y +  -14.599 * s,x +   60.603 * s,y +  -19.938 * s,x +   62.695 * s,y +  -27.197 * s,x +   62.695 * s,y +  -36.376 * s, threshold);
			_bez(x +   62.695 * s,y +  -36.376 * s,x +   62.695 * s,y +  -45.588 * s,x +   60.603 * s,y +  -52.864 * s,x +   56.420 * s,y +  -58.202 * s, threshold);
			_bez(x +   56.420 * s,y +  -58.202 * s,x +   52.238 * s,y +  -63.541 * s,x +   46.565 * s,y +  -66.210 * s,x +   39.404 * s,y +  -66.210 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   39.404 * s);
			_setf(o + ( 1 << 2), y +  -74.218 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   39.404 * s,y +  -74.218 * s,x +   49.626 * s,y +  -74.218 * s,x +   57.796 * s,y +  -70.792 * s,x +   63.915 * s,y +  -63.939 * s, threshold);
			_bez(x +   63.915 * s,y +  -63.939 * s,x +   70.035 * s,y +  -57.087 * s,x +   73.095 * s,y +  -47.900 * s,x +   73.095 * s,y +  -36.376 * s, threshold);
			_bez(x +   73.095 * s,y +  -36.376 * s,x +   73.095 * s,y +  -24.885 * s,x +   70.035 * s,y +  -15.714 * s,x +   63.915 * s,y +   -8.862 * s, threshold);
			_bez(x +   63.915 * s,y +   -8.862 * s,x +   57.796 * s,y +   -2.010 * s,x +   49.626 * s,y +    1.416 * s,x +   39.404 * s,y +    1.416 * s, threshold);
			_bez(x +   39.404 * s,y +    1.416 * s,x +   29.150 * s,y +    1.416 * s,x +   20.956 * s,y +   -2.002 * s,x +   14.820 * s,y +   -8.838 * s, threshold);
			_bez(x +   14.820 * s,y +   -8.838 * s,x +    8.684 * s,y +  -15.674 * s,x +    5.616 * s,y +  -24.853 * s,x +    5.616 * s,y +  -36.376 * s, threshold);
			_bez(x +    5.616 * s,y +  -36.376 * s,x +    5.616 * s,y +  -47.900 * s,x +    8.684 * s,y +  -57.087 * s,x +   14.820 * s,y +  -63.939 * s, threshold);
			_bez(x +   14.820 * s,y +  -63.939 * s,x +   20.956 * s,y +  -70.792 * s,x +   29.150 * s,y +  -74.218 * s,x +   39.404 * s,y +  -74.218 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   78.710 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 80:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   19.678 * s);
			_setf(o + ( 1 << 2), y +  -64.794 * s);
			_setf(o + ( 2 << 2), x +   19.678 * s);
			_setf(o + ( 3 << 2), y +  -37.402 * s);
			_setf(o + ( 4 << 2), x +   32.080 * s);
			_setf(o + ( 5 << 2), y +  -37.402 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   32.080 * s,y +  -37.402 * s,x +   36.670 * s,y +  -37.402 * s,x +   40.218 * s,y +  -38.590 * s,x +   42.724 * s,y +  -40.966 * s, threshold);
			_bez(x +   42.724 * s,y +  -40.966 * s,x +   45.231 * s,y +  -43.342 * s,x +   46.484 * s,y +  -46.728 * s,x +   46.484 * s,y +  -51.122 * s, threshold);
			_bez(x +   46.484 * s,y +  -51.122 * s,x +   46.484 * s,y +  -55.484 * s,x +   45.231 * s,y +  -58.853 * s,x +   42.724 * s,y +  -61.230 * s, threshold);
			_bez(x +   42.724 * s,y +  -61.230 * s,x +   40.218 * s,y +  -63.606 * s,x +   36.670 * s,y +  -64.794 * s,x +   32.080 * s,y +  -64.794 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   19.678 * s);
			_setf(o + ( 1 << 2), y +  -64.794 * s);
			_setf(o + ( 2 << 2), x +    9.814 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   32.080 * s);
			_setf(o + ( 5 << 2), y +  -72.899 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_setb(o +  2, 2);
			_bez(x +   32.080 * s,y +  -72.899 * s,x +   40.250 * s,y +  -72.899 * s,x +   46.427 * s,y +  -71.052 * s,x +   50.610 * s,y +  -67.357 * s, threshold);
			_bez(x +   50.610 * s,y +  -67.357 * s,x +   54.793 * s,y +  -63.663 * s,x +   56.884 * s,y +  -58.251 * s,x +   56.884 * s,y +  -51.122 * s, threshold);
			_bez(x +   56.884 * s,y +  -51.122 * s,x +   56.884 * s,y +  -43.928 * s,x +   54.793 * s,y +  -38.492 * s,x +   50.610 * s,y +  -34.814 * s, threshold);
			_bez(x +   50.610 * s,y +  -34.814 * s,x +   46.427 * s,y +  -31.136 * s,x +   40.250 * s,y +  -29.296 * s,x +   32.080 * s,y +  -29.296 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   19.678 * s);
			_setf(o + ( 1 << 2), y +  -29.296 * s);
			_setf(o + ( 2 << 2), x +   19.678 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    9.814 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    9.814 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   60.302 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 1);
			
			case 81:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   39.404 * s);
			_setf(o + ( 1 << 2), y +  -66.210 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   39.404 * s,y +  -66.210 * s,x +   32.242 * s,y +  -66.210 * s,x +   26.554 * s,y +  -63.541 * s,x +   22.338 * s,y +  -58.202 * s, threshold);
			_bez(x +   22.338 * s,y +  -58.202 * s,x +   18.123 * s,y +  -52.864 * s,x +   16.015 * s,y +  -45.588 * s,x +   16.015 * s,y +  -36.376 * s, threshold);
			_bez(x +   16.015 * s,y +  -36.376 * s,x +   16.015 * s,y +  -27.197 * s,x +   18.123 * s,y +  -19.938 * s,x +   22.338 * s,y +  -14.599 * s, threshold);
			_bez(x +   22.338 * s,y +  -14.599 * s,x +   26.554 * s,y +   -9.261 * s,x +   32.242 * s,y +   -6.592 * s,x +   39.404 * s,y +   -6.592 * s, threshold);
			_bez(x +   39.404 * s,y +   -6.592 * s,x +   46.565 * s,y +   -6.592 * s,x +   52.237 * s,y +   -9.261 * s,x +   56.420 * s,y +  -14.599 * s, threshold);
			_bez(x +   56.420 * s,y +  -14.599 * s,x +   60.603 * s,y +  -19.938 * s,x +   62.694 * s,y +  -27.197 * s,x +   62.694 * s,y +  -36.376 * s, threshold);
			_bez(x +   62.694 * s,y +  -36.376 * s,x +   62.694 * s,y +  -45.588 * s,x +   60.603 * s,y +  -52.864 * s,x +   56.420 * s,y +  -58.202 * s, threshold);
			_bez(x +   56.420 * s,y +  -58.202 * s,x +   52.237 * s,y +  -63.541 * s,x +   46.565 * s,y +  -66.210 * s,x +   39.404 * s,y +  -66.210 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   53.222 * s);
			_setf(o + ( 1 << 2), y +   -1.318 * s);
			_setf(o + ( 2 << 2), x +   66.210 * s);
			_setf(o + ( 3 << 2), y +   12.890 * s);
			_setf(o + ( 4 << 2), x +   54.296 * s);
			_setf(o + ( 5 << 2), y +   12.890 * s);
			_setf(o + ( 6 << 2), x +   43.505 * s);
			_setf(o + ( 7 << 2), y +    1.221 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_bez(x +   43.505 * s,y +    1.221 * s,x +   42.431 * s,y +    1.286 * s,x +   41.609 * s,y +    1.335 * s,x +   41.039 * s,y +    1.367 * s, threshold);
			_bez(x +   41.039 * s,y +    1.367 * s,x +   40.470 * s,y +    1.400 * s,x +   39.925 * s,y +    1.416 * s,x +   39.404 * s,y +    1.416 * s, threshold);
			_bez(x +   39.404 * s,y +    1.416 * s,x +   29.149 * s,y +    1.416 * s,x +   20.955 * s,y +   -2.010 * s,x +   14.819 * s,y +   -8.862 * s, threshold);
			_bez(x +   14.819 * s,y +   -8.862 * s,x +    8.683 * s,y +  -15.714 * s,x +    5.615 * s,y +  -24.885 * s,x +    5.615 * s,y +  -36.376 * s, threshold);
			_bez(x +    5.615 * s,y +  -36.376 * s,x +    5.615 * s,y +  -47.900 * s,x +    8.683 * s,y +  -57.087 * s,x +   14.819 * s,y +  -63.939 * s, threshold);
			_bez(x +   14.819 * s,y +  -63.939 * s,x +   20.955 * s,y +  -70.792 * s,x +   29.149 * s,y +  -74.218 * s,x +   39.404 * s,y +  -74.218 * s, threshold);
			_bez(x +   39.404 * s,y +  -74.218 * s,x +   49.625 * s,y +  -74.218 * s,x +   57.795 * s,y +  -70.792 * s,x +   63.915 * s,y +  -63.939 * s, threshold);
			_bez(x +   63.915 * s,y +  -63.939 * s,x +   70.035 * s,y +  -57.087 * s,x +   73.095 * s,y +  -47.900 * s,x +   73.095 * s,y +  -36.376 * s, threshold);
			_bez(x +   73.095 * s,y +  -36.376 * s,x +   73.095 * s,y +  -27.913 * s,x +   71.394 * s,y +  -20.670 * s,x +   67.992 * s,y +  -14.648 * s, threshold);
			_bez(x +   67.992 * s,y +  -14.648 * s,x +   64.590 * s,y +   -8.626 * s,x +   59.667 * s,y +   -4.183 * s,x +   53.222 * s,y +   -1.318 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   78.710 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 82:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   44.384 * s);
			_setf(o + ( 1 << 2), y +  -34.179 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   44.384 * s,y +  -34.179 * s,x +   46.500 * s,y +  -33.463 * s,x +   48.559 * s,y +  -31.933 * s,x +   50.561 * s,y +  -29.589 * s, threshold);
			_bez(x +   50.561 * s,y +  -29.589 * s,x +   52.563 * s,y +  -27.246 * s,x +   54.539 * s,y +  -24.006 * s,x +   56.591 * s,y +  -19.922 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   66.600 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   56.005 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   46.679 * s);
			_setf(o + ( 5 << 2), y +  -18.701 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   46.679 * s,y +  -18.701 * s,x +   44.249 * s,y +  -23.573 * s,x +   41.935 * s,y +  -26.822 * s,x +   39.672 * s,y +  -28.417 * s, threshold);
			_bez(x +   39.672 * s,y +  -28.417 * s,x +   37.410 * s,y +  -30.012 * s,x +   34.326 * s,y +  -30.810 * s,x +   30.419 * s,y +  -30.810 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   19.677 * s);
			_setf(o + ( 1 << 2), y +  -30.810 * s);
			_setf(o + ( 2 << 2), x +   19.677 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    9.814 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    9.814 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   32.080 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   32.080 * s,y +  -72.899 * s,x +   40.413 * s,y +  -72.899 * s,x +   46.630 * s,y +  -71.158 * s,x +   50.732 * s,y +  -67.675 * s, threshold);
			_bez(x +   50.732 * s,y +  -67.675 * s,x +   54.833 * s,y +  -64.192 * s,x +   56.884 * s,y +  -58.935 * s,x +   56.884 * s,y +  -51.903 * s, threshold);
			_bez(x +   56.884 * s,y +  -51.903 * s,x +   56.884 * s,y +  -47.314 * s,x +   55.818 * s,y +  -43.505 * s,x +   53.686 * s,y +  -40.478 * s, threshold);
			_bez(x +   53.686 * s,y +  -40.478 * s,x +   51.554 * s,y +  -37.451 * s,x +   48.453 * s,y +  -35.351 * s,x +   44.384 * s,y +  -34.179 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   19.677 * s);
			_setf(o + ( 1 << 2), y +  -64.794 * s);
			_setf(o + ( 2 << 2), x +   19.677 * s);
			_setf(o + ( 3 << 2), y +  -38.915 * s);
			_setf(o + ( 4 << 2), x +   32.080 * s);
			_setf(o + ( 5 << 2), y +  -38.915 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   32.080 * s,y +  -38.915 * s,x +   36.832 * s,y +  -38.915 * s,x +   40.421 * s,y +  -40.014 * s,x +   42.846 * s,y +  -42.211 * s, threshold);
			_bez(x +   42.846 * s,y +  -42.211 * s,x +   45.271 * s,y +  -44.408 * s,x +   46.484 * s,y +  -47.639 * s,x +   46.484 * s,y +  -51.903 * s, threshold);
			_bez(x +   46.484 * s,y +  -51.903 * s,x +   46.484 * s,y +  -56.168 * s,x +   45.271 * s,y +  -59.382 * s,x +   42.846 * s,y +  -61.547 * s, threshold);
			_bez(x +   42.846 * s,y +  -61.547 * s,x +   40.421 * s,y +  -63.712 * s,x +   36.832 * s,y +  -64.794 * s,x +   32.080 * s,y +  -64.794 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   19.677 * s);
			_setf(o + ( 1 << 2), y +  -64.794 * s);
			_setf(o + ( 2 << 2), x +   69.481 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 83:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   53.515 * s);
			_setf(o + ( 1 << 2), y +  -70.507 * s);
			_setf(o + ( 2 << 2), x +   53.515 * s);
			_setf(o + ( 3 << 2), y +  -60.888 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   53.515 * s,y +  -60.888 * s,x +   49.772 * s,y +  -62.678 * s,x +   46.240 * s,y +  -64.013 * s,x +   42.920 * s,y +  -64.892 * s, threshold);
			_bez(x +   42.920 * s,y +  -64.892 * s,x +   39.599 * s,y +  -65.770 * s,x +   36.393 * s,y +  -66.210 * s,x +   33.301 * s,y +  -66.210 * s, threshold);
			_bez(x +   33.301 * s,y +  -66.210 * s,x +   27.929 * s,y +  -66.210 * s,x +   23.787 * s,y +  -65.168 * s,x +   20.874 * s,y +  -63.085 * s, threshold);
			_bez(x +   20.874 * s,y +  -63.085 * s,x +   17.960 * s,y +  -61.002 * s,x +   16.504 * s,y +  -58.039 * s,x +   16.504 * s,y +  -54.198 * s, threshold);
			_bez(x +   16.504 * s,y +  -54.198 * s,x +   16.504 * s,y +  -50.976 * s,x +   17.472 * s,y +  -48.542 * s,x +   19.409 * s,y +  -46.899 * s, threshold);
			_bez(x +   19.409 * s,y +  -46.899 * s,x +   21.346 * s,y +  -45.255 * s,x +   25.035 * s,y +  -44.023 * s,x +   30.420 * s,y +  -42.919 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.377 * s);
			_setf(o + ( 1 << 2), y +  -41.699 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   36.377 * s,y +  -41.699 * s,x +   43.713 * s,y +  -40.195 * s,x +   49.161 * s,y +  -37.833 * s,x +   52.661 * s,y +  -34.301 * s, threshold);
			_bez(x +   52.661 * s,y +  -34.301 * s,x +   56.160 * s,y +  -30.769 * s,x +   57.910 * s,y +  -26.041 * s,x +   57.910 * s,y +  -20.117 * s, threshold);
			_bez(x +   57.910 * s,y +  -20.117 * s,x +   57.910 * s,y +  -13.053 * s,x +   55.541 * s,y +   -7.698 * s,x +   50.805 * s,y +   -4.053 * s, threshold);
			_bez(x +   50.805 * s,y +   -4.053 * s,x +   46.069 * s,y +   -0.407 * s,x +   39.127 * s,y +    1.416 * s,x +   29.980 * s,y +    1.416 * s, threshold);
			_bez(x +   29.980 * s,y +    1.416 * s,x +   26.530 * s,y +    1.416 * s,x +   22.860 * s,y +    1.025 * s,x +   18.969 * s,y +    0.244 * s, threshold);
			_bez(x +   18.969 * s,y +    0.244 * s,x +   15.079 * s,y +   -0.537 * s,x +   11.051 * s,y +   -1.693 * s,x +    6.885 * s,y +   -3.223 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    6.885 * s);
			_setf(o + ( 1 << 2), y +  -13.379 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    6.885 * s,y +  -13.379 * s,x +   10.888 * s,y +  -11.133 * s,x +   14.811 * s,y +   -9.440 * s,x +   18.652 * s,y +   -8.301 * s, threshold);
			_bez(x +   18.652 * s,y +   -8.301 * s,x +   22.493 * s,y +   -7.161 * s,x +   26.269 * s,y +   -6.592 * s,x +   29.980 * s,y +   -6.592 * s, threshold);
			_bez(x +   29.980 * s,y +   -6.592 * s,x +   35.612 * s,y +   -6.592 * s,x +   39.957 * s,y +   -7.698 * s,x +   43.017 * s,y +   -9.912 * s, threshold);
			_bez(x +   43.017 * s,y +   -9.912 * s,x +   46.077 * s,y +  -12.126 * s,x +   47.607 * s,y +  -15.283 * s,x +   47.607 * s,y +  -19.384 * s, threshold);
			_bez(x +   47.607 * s,y +  -19.384 * s,x +   47.607 * s,y +  -22.965 * s,x +   46.508 * s,y +  -25.765 * s,x +   44.311 * s,y +  -27.783 * s, threshold);
			_bez(x +   44.311 * s,y +  -27.783 * s,x +   42.114 * s,y +  -29.801 * s,x +   38.515 * s,y +  -31.344 * s,x +   33.496 * s,y +  -32.324 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   27.490 * s);
			_setf(o + ( 1 << 2), y +  -33.496 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   27.490 * s,y +  -33.496 * s,x +   20.127 * s,y +  -34.932 * s,x +   14.811 * s,y +  -37.255 * s,x +   11.523 * s,y +  -40.380 * s, threshold);
			_bez(x +   11.523 * s,y +  -40.380 * s,x +    8.236 * s,y +  -43.505 * s,x +    6.592 * s,y +  -47.851 * s,x +    6.592 * s,y +  -53.417 * s, threshold);
			_bez(x +    6.592 * s,y +  -53.417 * s,x +    6.592 * s,y +  -59.862 * s,x +    8.862 * s,y +  -64.940 * s,x +   13.403 * s,y +  -68.651 * s, threshold);
			_bez(x +   13.403 * s,y +  -68.651 * s,x +   17.944 * s,y +  -72.362 * s,x +   24.203 * s,y +  -74.218 * s,x +   32.178 * s,y +  -74.218 * s, threshold);
			_bez(x +   32.178 * s,y +  -74.218 * s,x +   35.596 * s,y +  -74.218 * s,x +   39.079 * s,y +  -73.908 * s,x +   42.627 * s,y +  -73.290 * s, threshold);
			_bez(x +   42.627 * s,y +  -73.290 * s,x +   46.175 * s,y +  -72.671 * s,x +   49.804 * s,y +  -71.744 * s,x +   53.515 * s,y +  -70.507 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   63.476 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 84:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +   -0.293 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   61.376 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   61.376 * s);
			_setf(o + ( 5 << 2), y +  -64.599 * s);
			_setf(o + ( 6 << 2), x +   35.497 * s);
			_setf(o + ( 7 << 2), y +  -64.599 * s);
			_setf(o + ( 8 << 2), x +   35.497 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   25.585 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   25.585 * s);
			_setf(o + (13 << 2), y +  -64.599 * s);
			_setf(o + (14 << 2), x +   -0.293 * s);
			_setf(o + (15 << 2), y +  -64.599 * s);
			_setf(o + (16 << 2), x +   -0.293 * s);
			_setf(o + (17 << 2), y +  -72.899 * s);
			_setf(o + (18 << 2), x +   61.083 * s);
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
			_setf(o + ( 0 << 2), x +    8.691 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   18.603 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   18.603 * s);
			_setf(o + ( 5 << 2), y +  -28.613 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   18.603 * s,y +  -28.613 * s,x +   18.603 * s,y +  -20.800 * s,x +   20.019 * s,y +  -15.177 * s,x +   22.851 * s,y +  -11.743 * s, threshold);
			_bez(x +   22.851 * s,y +  -11.743 * s,x +   25.683 * s,y +   -8.309 * s,x +   30.273 * s,y +   -6.592 * s,x +   36.621 * s,y +   -6.592 * s, threshold);
			_bez(x +   36.621 * s,y +   -6.592 * s,x +   42.935 * s,y +   -6.592 * s,x +   47.509 * s,y +   -8.309 * s,x +   50.341 * s,y +  -11.743 * s, threshold);
			_bez(x +   50.341 * s,y +  -11.743 * s,x +   53.173 * s,y +  -15.177 * s,x +   54.589 * s,y +  -20.800 * s,x +   54.589 * s,y +  -28.613 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   54.589 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   64.501 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   64.501 * s);
			_setf(o + ( 5 << 2), y +  -27.392 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   64.501 * s,y +  -27.392 * s,x +   64.501 * s,y +  -17.888 * s,x +   62.149 * s,y +  -10.709 * s,x +   57.445 * s,y +   -5.859 * s, threshold);
			_bez(x +   57.445 * s,y +   -5.859 * s,x +   52.742 * s,y +   -1.009 * s,x +   45.800 * s,y +    1.416 * s,x +   36.621 * s,y +    1.416 * s, threshold);
			_bez(x +   36.621 * s,y +    1.416 * s,x +   27.409 * s,y +    1.416 * s,x +   20.450 * s,y +   -1.009 * s,x +   15.747 * s,y +   -5.859 * s, threshold);
			_bez(x +   15.747 * s,y +   -5.859 * s,x +   11.043 * s,y +  -10.709 * s,x +    8.691 * s,y +  -17.888 * s,x +    8.691 * s,y +  -27.392 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    8.691 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   73.192 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 86:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +   28.613 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    0.781 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   11.084 * s);
			_setf(o + ( 5 << 2), y +  -72.899 * s);
			_setf(o + ( 6 << 2), x +   34.179 * s);
			_setf(o + ( 7 << 2), y +  -11.523 * s);
			_setf(o + ( 8 << 2), x +   57.324 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   67.577 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   39.795 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   28.613 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   68.407 * s);
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
			_setf(o + ( 0 << 2), x +    3.321 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   13.281 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   28.613 * s);
			_setf(o + ( 5 << 2), y +  -11.279 * s);
			_setf(o + ( 6 << 2), x +   43.896 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   54.980 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   70.312 * s);
			_setf(o + (11 << 2), y +  -11.279 * s);
			_setf(o + (12 << 2), x +   85.595 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   95.604 * s);
			_setf(o + (15 << 2), y +  -72.899 * s);
			_setf(o + (16 << 2), x +   77.294 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   64.892 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   49.511 * s);
			_setf(o + (21 << 2), y +  -63.280 * s);
			_setf(o + (22 << 2), x +   33.984 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   21.582 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +    3.321 * s);
			_setf(o + (27 << 2), y +  -72.899 * s);
			_setf(o + (28 << 2), x +   98.876 * s);
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
			_setf(o + ( 0 << 2), x +    6.299 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   16.894 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   35.009 * s);
			_setf(o + ( 5 << 2), y +  -45.800 * s);
			_setf(o + ( 6 << 2), x +   53.222 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   63.817 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   40.380 * s);
			_setf(o + (11 << 2), y +  -37.890 * s);
			_setf(o + (12 << 2), x +   65.380 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   54.784 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   34.277 * s);
			_setf(o + (17 << 2), y +  -31.005 * s);
			_setf(o + (18 << 2), x +   13.623 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +    2.978 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   29.003 * s);
			_setf(o + (23 << 2), y +  -38.915 * s);
			_setf(o + (24 << 2), x +    6.299 * s);
			_setf(o + (25 << 2), y +  -72.899 * s);
			_setf(o + (26 << 2), x +   68.505 * s);
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
			_setf(o + ( 0 << 2), x +   -0.195 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   10.400 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   30.615 * s);
			_setf(o + ( 5 << 2), y +  -42.919 * s);
			_setf(o + ( 6 << 2), x +   50.683 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   61.278 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   35.497 * s);
			_setf(o + (11 << 2), y +  -34.716 * s);
			_setf(o + (12 << 2), x +   35.497 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   25.585 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   25.585 * s);
			_setf(o + (17 << 2), y +  -34.716 * s);
			_setf(o + (18 << 2), x +   -0.195 * s);
			_setf(o + (19 << 2), y +  -72.899 * s);
			_setf(o + (20 << 2), x +   61.083 * s);
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
			_setf(o + ( 2 << 2), x +   62.890 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   62.890 * s);
			_setf(o + ( 5 << 2), y +  -65.380 * s);
			_setf(o + ( 6 << 2), x +   16.797 * s);
			_setf(o + ( 7 << 2), y +   -8.301 * s);
			_setf(o + ( 8 << 2), x +   64.013 * s);
			_setf(o + ( 9 << 2), y +   -8.301 * s);
			_setf(o + (10 << 2), x +   64.013 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    4.492 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +    4.492 * s);
			_setf(o + (15 << 2), y +   -7.519 * s);
			_setf(o + (16 << 2), x +   50.585 * s);
			_setf(o + (17 << 2), y +  -64.599 * s);
			_setf(o + (18 << 2), x +    5.615 * s);
			_setf(o + (19 << 2), y +  -64.599 * s);
			_setf(o + (20 << 2), x +    5.615 * s);
			_setf(o + (21 << 2), y +  -72.899 * s);
			_setf(o + (22 << 2), x +   68.505 * s);
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
			_setf(o + ( 2 << 2), x +   29.296 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   29.296 * s);
			_setf(o + ( 5 << 2), y +  -68.993 * s);
			_setf(o + ( 6 << 2), x +   17.578 * s);
			_setf(o + ( 7 << 2), y +  -68.993 * s);
			_setf(o + ( 8 << 2), x +   17.578 * s);
			_setf(o + ( 9 << 2), y +    6.201 * s);
			_setf(o + (10 << 2), x +   29.296 * s);
			_setf(o + (11 << 2), y +    6.201 * s);
			_setf(o + (12 << 2), x +   29.296 * s);
			_setf(o + (13 << 2), y +   13.183 * s);
			_setf(o + (14 << 2), x +    8.593 * s);
			_setf(o + (15 << 2), y +   13.183 * s);
			_setf(o + (16 << 2), x +    8.593 * s);
			_setf(o + (17 << 2), y +  -75.975 * s);
			_setf(o + (18 << 2), x +   39.013 * s);
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
			_setf(o + ( 0 << 2), x +    8.301 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   33.691 * s);
			_setf(o + ( 3 << 2), y +    9.277 * s);
			_setf(o + ( 4 << 2), x +   25.390 * s);
			_setf(o + ( 5 << 2), y +    9.277 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +    8.301 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   33.691 * s);
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
			_setf(o + ( 0 << 2), x +   30.419 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   30.419 * s);
			_setf(o + ( 3 << 2), y +   13.183 * s);
			_setf(o + ( 4 << 2), x +    9.716 * s);
			_setf(o + ( 5 << 2), y +   13.183 * s);
			_setf(o + ( 6 << 2), x +    9.716 * s);
			_setf(o + ( 7 << 2), y +    6.201 * s);
			_setf(o + ( 8 << 2), x +   21.386 * s);
			_setf(o + ( 9 << 2), y +    6.201 * s);
			_setf(o + (10 << 2), x +   21.386 * s);
			_setf(o + (11 << 2), y +  -68.993 * s);
			_setf(o + (12 << 2), x +    9.716 * s);
			_setf(o + (13 << 2), y +  -68.993 * s);
			_setf(o + (14 << 2), x +    9.716 * s);
			_setf(o + (15 << 2), y +  -75.975 * s);
			_setf(o + (16 << 2), x +   30.419 * s);
			_setf(o + (17 << 2), y +  -75.975 * s);
			_setf(o + (18 << 2), x +   39.013 * s);
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
			_setf(o + ( 0 << 2), x +   46.679 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   73.192 * s);
			_setf(o + ( 3 << 2), y +  -45.702 * s);
			_setf(o + ( 4 << 2), x +   63.378 * s);
			_setf(o + ( 5 << 2), y +  -45.702 * s);
			_setf(o + ( 6 << 2), x +   41.894 * s);
			_setf(o + ( 7 << 2), y +  -64.989 * s);
			_setf(o + ( 8 << 2), x +   20.410 * s);
			_setf(o + ( 9 << 2), y +  -45.702 * s);
			_setf(o + (10 << 2), x +   10.595 * s);
			_setf(o + (11 << 2), y +  -45.702 * s);
			_setf(o + (12 << 2), x +   37.109 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   46.679 * s);
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
			_setf(o + ( 0 << 2), x +   50.975 * s);
			_setf(o + ( 1 << 2), y +   16.601 * s);
			_setf(o + ( 2 << 2), x +   50.975 * s);
			_setf(o + ( 3 << 2), y +   23.584 * s);
			_setf(o + ( 4 << 2), x +   -0.977 * s);
			_setf(o + ( 5 << 2), y +   23.584 * s);
			_setf(o + ( 6 << 2), x +   -0.977 * s);
			_setf(o + ( 7 << 2), y +   16.601 * s);
			_setf(o + ( 8 << 2), x +   50.975 * s);
			_setf(o + ( 9 << 2), y +   16.601 * s);
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
			_setf(o + ( 0 << 2), x +   17.920 * s);
			_setf(o + ( 1 << 2), y +  -79.979 * s);
			_setf(o + ( 2 << 2), x +   31.689 * s);
			_setf(o + ( 3 << 2), y +  -61.718 * s);
			_setf(o + ( 4 << 2), x +   24.218 * s);
			_setf(o + ( 5 << 2), y +  -61.718 * s);
			_setf(o + ( 6 << 2), x +    8.301 * s);
			_setf(o + ( 7 << 2), y +  -79.979 * s);
			_setf(o + ( 8 << 2), x +   17.920 * s);
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
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   34.277 * s);
			_setf(o + ( 1 << 2), y +  -27.490 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   34.277 * s,y +  -27.490 * s,x +   27.018 * s,y +  -27.490 * s,x +   21.989 * s,y +  -26.660 * s,x +   19.189 * s,y +  -25.000 * s, threshold);
			_bez(x +   19.189 * s,y +  -25.000 * s,x +   16.390 * s,y +  -23.339 * s,x +   14.990 * s,y +  -20.508 * s,x +   14.990 * s,y +  -16.504 * s, threshold);
			_bez(x +   14.990 * s,y +  -16.504 * s,x +   14.990 * s,y +  -13.314 * s,x +   16.040 * s,y +  -10.783 * s,x +   18.139 * s,y +   -8.911 * s, threshold);
			_bez(x +   18.139 * s,y +   -8.911 * s,x +   20.239 * s,y +   -7.039 * s,x +   23.095 * s,y +   -6.103 * s,x +   26.709 * s,y +   -6.103 * s, threshold);
			_bez(x +   26.709 * s,y +   -6.103 * s,x +   31.689 * s,y +   -6.103 * s,x +   35.685 * s,y +   -7.869 * s,x +   38.696 * s,y +  -11.401 * s, threshold);
			_bez(x +   38.696 * s,y +  -11.401 * s,x +   41.707 * s,y +  -14.933 * s,x +   43.212 * s,y +  -19.629 * s,x +   43.212 * s,y +  -25.488 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   43.212 * s);
			_setf(o + ( 1 << 2), y +  -27.490 * s);
			_setf(o + ( 2 << 2), x +   34.277 * s);
			_setf(o + ( 3 << 2), y +  -27.490 * s);
			_setf(o + ( 4 << 2), x +   52.197 * s);
			_setf(o + ( 5 << 2), y +  -31.201 * s);
			_setf(o + ( 6 << 2), x +   52.197 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   43.212 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   43.212 * s);
			_setf(o + (11 << 2), y +   -8.301 * s);
			o = _posb(6);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_bez(x +   43.212 * s,y +   -8.301 * s,x +   41.162 * s,y +   -4.980 * s,x +   38.606 * s,y +   -2.531 * s,x +   35.546 * s,y +   -0.952 * s, threshold);
			_bez(x +   35.546 * s,y +   -0.952 * s,x +   32.487 * s,y +    0.627 * s,x +   28.743 * s,y +    1.416 * s,x +   24.316 * s,y +    1.416 * s, threshold);
			_bez(x +   24.316 * s,y +    1.416 * s,x +   18.717 * s,y +    1.416 * s,x +   14.266 * s,y +   -0.155 * s,x +   10.962 * s,y +   -3.296 * s, threshold);
			_bez(x +   10.962 * s,y +   -3.296 * s,x +    7.658 * s,y +   -6.437 * s,x +    6.006 * s,y +  -10.644 * s,x +    6.006 * s,y +  -15.918 * s, threshold);
			_bez(x +    6.006 * s,y +  -15.918 * s,x +    6.006 * s,y +  -22.070 * s,x +    8.065 * s,y +  -26.709 * s,x +   12.183 * s,y +  -29.833 * s, threshold);
			_bez(x +   12.183 * s,y +  -29.833 * s,x +   16.300 * s,y +  -32.958 * s,x +   22.445 * s,y +  -34.521 * s,x +   30.615 * s,y +  -34.521 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   43.212 * s);
			_setf(o + ( 1 << 2), y +  -34.521 * s);
			_setf(o + ( 2 << 2), x +   43.212 * s);
			_setf(o + ( 3 << 2), y +  -35.400 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   43.212 * s,y +  -35.400 * s,x +   43.212 * s,y +  -39.534 * s,x +   41.853 * s,y +  -42.732 * s,x +   39.135 * s,y +  -44.994 * s, threshold);
			_bez(x +   39.135 * s,y +  -44.994 * s,x +   36.417 * s,y +  -47.257 * s,x +   32.600 * s,y +  -48.388 * s,x +   27.685 * s,y +  -48.388 * s, threshold);
			_bez(x +   27.685 * s,y +  -48.388 * s,x +   24.560 * s,y +  -48.388 * s,x +   21.517 * s,y +  -48.014 * s,x +   18.555 * s,y +  -47.265 * s, threshold);
			_bez(x +   18.555 * s,y +  -47.265 * s,x +   15.592 * s,y +  -46.516 * s,x +   12.744 * s,y +  -45.393 * s,x +   10.010 * s,y +  -43.896 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   10.010 * s);
			_setf(o + ( 1 << 2), y +  -52.196 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   10.010 * s,y +  -52.196 * s,x +   13.297 * s,y +  -53.466 * s,x +   16.487 * s,y +  -54.418 * s,x +   19.580 * s,y +  -55.053 * s, threshold);
			_bez(x +   19.580 * s,y +  -55.053 * s,x +   22.672 * s,y +  -55.688 * s,x +   25.683 * s,y +  -56.005 * s,x +   28.613 * s,y +  -56.005 * s, threshold);
			_bez(x +   28.613 * s,y +  -56.005 * s,x +   36.523 * s,y +  -56.005 * s,x +   42.431 * s,y +  -53.954 * s,x +   46.337 * s,y +  -49.853 * s, threshold);
			_bez(x +   46.337 * s,y +  -49.853 * s,x +   50.243 * s,y +  -45.751 * s,x +   52.197 * s,y +  -39.534 * s,x +   52.197 * s,y +  -31.201 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   61.278 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 98:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   48.681 * s);
			_setf(o + ( 1 << 2), y +  -27.294 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   48.681 * s,y +  -27.294 * s,x +   48.681 * s,y +  -33.902 * s,x +   47.322 * s,y +  -39.086 * s,x +   44.604 * s,y +  -42.846 * s, threshold);
			_bez(x +   44.604 * s,y +  -42.846 * s,x +   41.886 * s,y +  -46.606 * s,x +   38.150 * s,y +  -48.486 * s,x +   33.398 * s,y +  -48.486 * s, threshold);
			_bez(x +   33.398 * s,y +  -48.486 * s,x +   28.645 * s,y +  -48.486 * s,x +   24.910 * s,y +  -46.606 * s,x +   22.192 * s,y +  -42.846 * s, threshold);
			_bez(x +   22.192 * s,y +  -42.846 * s,x +   19.474 * s,y +  -39.086 * s,x +   18.115 * s,y +  -33.902 * s,x +   18.115 * s,y +  -27.294 * s, threshold);
			_bez(x +   18.115 * s,y +  -27.294 * s,x +   18.115 * s,y +  -20.687 * s,x +   19.474 * s,y +  -15.503 * s,x +   22.192 * s,y +  -11.743 * s, threshold);
			_bez(x +   22.192 * s,y +  -11.743 * s,x +   24.910 * s,y +   -7.983 * s,x +   28.645 * s,y +   -6.103 * s,x +   33.398 * s,y +   -6.103 * s, threshold);
			_bez(x +   33.398 * s,y +   -6.103 * s,x +   38.150 * s,y +   -6.103 * s,x +   41.886 * s,y +   -7.983 * s,x +   44.604 * s,y +  -11.743 * s, threshold);
			_bez(x +   44.604 * s,y +  -11.743 * s,x +   47.322 * s,y +  -15.503 * s,x +   48.681 * s,y +  -20.687 * s,x +   48.681 * s,y +  -27.294 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   18.115 * s);
			_setf(o + ( 1 << 2), y +  -46.386 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   18.115 * s,y +  -46.386 * s,x +   20.003 * s,y +  -49.641 * s,x +   22.387 * s,y +  -52.058 * s,x +   25.268 * s,y +  -53.637 * s, threshold);
			_bez(x +   25.268 * s,y +  -53.637 * s,x +   28.149 * s,y +  -55.216 * s,x +   31.591 * s,y +  -56.005 * s,x +   35.595 * s,y +  -56.005 * s, threshold);
			_bez(x +   35.595 * s,y +  -56.005 * s,x +   42.236 * s,y +  -56.005 * s,x +   47.631 * s,y +  -53.368 * s,x +   51.781 * s,y +  -48.095 * s, threshold);
			_bez(x +   51.781 * s,y +  -48.095 * s,x +   55.932 * s,y +  -42.822 * s,x +   58.007 * s,y +  -35.888 * s,x +   58.007 * s,y +  -27.294 * s, threshold);
			_bez(x +   58.007 * s,y +  -27.294 * s,x +   58.007 * s,y +  -18.701 * s,x +   55.932 * s,y +  -11.767 * s,x +   51.781 * s,y +   -6.494 * s, threshold);
			_bez(x +   51.781 * s,y +   -6.494 * s,x +   47.631 * s,y +   -1.221 * s,x +   42.236 * s,y +    1.416 * s,x +   35.595 * s,y +    1.416 * s, threshold);
			_bez(x +   35.595 * s,y +    1.416 * s,x +   31.591 * s,y +    1.416 * s,x +   28.149 * s,y +    0.627 * s,x +   25.268 * s,y +   -0.952 * s, threshold);
			_bez(x +   25.268 * s,y +   -0.952 * s,x +   22.387 * s,y +   -2.531 * s,x +   20.003 * s,y +   -4.948 * s,x +   18.115 * s,y +   -8.203 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   18.115 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    9.082 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    9.082 * s);
			_setf(o + ( 5 << 2), y +  -75.975 * s);
			_setf(o + ( 6 << 2), x +   18.115 * s);
			_setf(o + ( 7 << 2), y +  -75.975 * s);
			_setf(o + ( 8 << 2), x +   18.115 * s);
			_setf(o + ( 9 << 2), y +  -46.386 * s);
			_setf(o + (10 << 2), x +   63.476 * s);
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
			_setf(o + ( 0 << 2), x +   48.778 * s);
			_setf(o + ( 1 << 2), y +  -52.587 * s);
			_setf(o + ( 2 << 2), x +   48.778 * s);
			_setf(o + ( 3 << 2), y +  -44.189 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   48.778 * s,y +  -44.189 * s,x +   46.239 * s,y +  -45.588 * s,x +   43.692 * s,y +  -46.638 * s,x +   41.137 * s,y +  -47.338 * s, threshold);
			_bez(x +   41.137 * s,y +  -47.338 * s,x +   38.581 * s,y +  -48.038 * s,x +   36.002 * s,y +  -48.388 * s,x +   33.398 * s,y +  -48.388 * s, threshold);
			_bez(x +   33.398 * s,y +  -48.388 * s,x +   27.571 * s,y +  -48.388 * s,x +   23.046 * s,y +  -46.541 * s,x +   19.824 * s,y +  -42.846 * s, threshold);
			_bez(x +   19.824 * s,y +  -42.846 * s,x +   16.601 * s,y +  -39.151 * s,x +   14.990 * s,y +  -33.968 * s,x +   14.990 * s,y +  -27.294 * s, threshold);
			_bez(x +   14.990 * s,y +  -27.294 * s,x +   14.990 * s,y +  -20.621 * s,x +   16.601 * s,y +  -15.438 * s,x +   19.824 * s,y +  -11.743 * s, threshold);
			_bez(x +   19.824 * s,y +  -11.743 * s,x +   23.046 * s,y +   -8.048 * s,x +   27.571 * s,y +   -6.201 * s,x +   33.398 * s,y +   -6.201 * s, threshold);
			_bez(x +   33.398 * s,y +   -6.201 * s,x +   36.002 * s,y +   -6.201 * s,x +   38.581 * s,y +   -6.551 * s,x +   41.137 * s,y +   -7.251 * s, threshold);
			_bez(x +   41.137 * s,y +   -7.251 * s,x +   43.692 * s,y +   -7.951 * s,x +   46.239 * s,y +   -9.001 * s,x +   48.778 * s,y +  -10.400 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   48.778 * s);
			_setf(o + ( 1 << 2), y +   -2.100 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   48.778 * s,y +   -2.100 * s,x +   46.272 * s,y +   -0.928 * s,x +   43.676 * s,y +   -0.049 * s,x +   40.990 * s,y +    0.537 * s, threshold);
			_bez(x +   40.990 * s,y +    0.537 * s,x +   38.305 * s,y +    1.123 * s,x +   35.448 * s,y +    1.416 * s,x +   32.421 * s,y +    1.416 * s, threshold);
			_bez(x +   32.421 * s,y +    1.416 * s,x +   24.186 * s,y +    1.416 * s,x +   17.643 * s,y +   -1.172 * s,x +   12.793 * s,y +   -6.348 * s, threshold);
			_bez(x +   12.793 * s,y +   -6.348 * s,x +    7.943 * s,y +  -11.523 * s,x +    5.518 * s,y +  -18.505 * s,x +    5.518 * s,y +  -27.294 * s, threshold);
			_bez(x +    5.518 * s,y +  -27.294 * s,x +    5.518 * s,y +  -36.213 * s,x +    7.967 * s,y +  -43.229 * s,x +   12.866 * s,y +  -48.339 * s, threshold);
			_bez(x +   12.866 * s,y +  -48.339 * s,x +   17.765 * s,y +  -53.450 * s,x +   24.479 * s,y +  -56.005 * s,x +   33.007 * s,y +  -56.005 * s, threshold);
			_bez(x +   33.007 * s,y +  -56.005 * s,x +   35.774 * s,y +  -56.005 * s,x +   38.476 * s,y +  -55.720 * s,x +   41.112 * s,y +  -55.151 * s, threshold);
			_bez(x +   41.112 * s,y +  -55.151 * s,x +   43.749 * s,y +  -54.581 * s,x +   46.304 * s,y +  -53.726 * s,x +   48.778 * s,y +  -52.587 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   54.979 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 100:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   45.410 * s);
			_setf(o + ( 1 << 2), y +  -46.386 * s);
			_setf(o + ( 2 << 2), x +   45.410 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   54.394 * s);
			_setf(o + ( 5 << 2), y +  -75.975 * s);
			_setf(o + ( 6 << 2), x +   54.394 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   45.410 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   45.410 * s);
			_setf(o + (11 << 2), y +   -8.203 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_bez(x +   45.410 * s,y +   -8.203 * s,x +   43.522 * s,y +   -4.948 * s,x +   41.137 * s,y +   -2.531 * s,x +   38.256 * s,y +   -0.952 * s, threshold);
			_bez(x +   38.256 * s,y +   -0.952 * s,x +   35.376 * s,y +    0.627 * s,x +   31.917 * s,y +    1.416 * s,x +   27.881 * s,y +    1.416 * s, threshold);
			_bez(x +   27.881 * s,y +    1.416 * s,x +   21.273 * s,y +    1.416 * s,x +   15.894 * s,y +   -1.221 * s,x +   11.743 * s,y +   -6.494 * s, threshold);
			_bez(x +   11.743 * s,y +   -6.494 * s,x +    7.593 * s,y +  -11.767 * s,x +    5.518 * s,y +  -18.701 * s,x +    5.518 * s,y +  -27.294 * s, threshold);
			_bez(x +    5.518 * s,y +  -27.294 * s,x +    5.518 * s,y +  -35.888 * s,x +    7.593 * s,y +  -42.822 * s,x +   11.743 * s,y +  -48.095 * s, threshold);
			_bez(x +   11.743 * s,y +  -48.095 * s,x +   15.894 * s,y +  -53.368 * s,x +   21.273 * s,y +  -56.005 * s,x +   27.881 * s,y +  -56.005 * s, threshold);
			_bez(x +   27.881 * s,y +  -56.005 * s,x +   31.917 * s,y +  -56.005 * s,x +   35.376 * s,y +  -55.216 * s,x +   38.256 * s,y +  -53.637 * s, threshold);
			_bez(x +   38.256 * s,y +  -53.637 * s,x +   41.137 * s,y +  -52.058 * s,x +   43.522 * s,y +  -49.641 * s,x +   45.410 * s,y +  -46.386 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   14.795 * s);
			_setf(o + ( 1 << 2), y +  -27.294 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   14.795 * s,y +  -27.294 * s,x +   14.795 * s,y +  -20.687 * s,x +   16.154 * s,y +  -15.503 * s,x +   18.872 * s,y +  -11.743 * s, threshold);
			_bez(x +   18.872 * s,y +  -11.743 * s,x +   21.590 * s,y +   -7.983 * s,x +   25.325 * s,y +   -6.103 * s,x +   30.078 * s,y +   -6.103 * s, threshold);
			_bez(x +   30.078 * s,y +   -6.103 * s,x +   34.830 * s,y +   -6.103 * s,x +   38.574 * s,y +   -7.983 * s,x +   41.308 * s,y +  -11.743 * s, threshold);
			_bez(x +   41.308 * s,y +  -11.743 * s,x +   44.042 * s,y +  -15.503 * s,x +   45.410 * s,y +  -20.687 * s,x +   45.410 * s,y +  -27.294 * s, threshold);
			_bez(x +   45.410 * s,y +  -27.294 * s,x +   45.410 * s,y +  -33.902 * s,x +   44.042 * s,y +  -39.086 * s,x +   41.308 * s,y +  -42.846 * s, threshold);
			_bez(x +   41.308 * s,y +  -42.846 * s,x +   38.574 * s,y +  -46.606 * s,x +   34.830 * s,y +  -48.486 * s,x +   30.078 * s,y +  -48.486 * s, threshold);
			_bez(x +   30.078 * s,y +  -48.486 * s,x +   25.325 * s,y +  -48.486 * s,x +   21.590 * s,y +  -46.606 * s,x +   18.872 * s,y +  -42.846 * s, threshold);
			_bez(x +   18.872 * s,y +  -42.846 * s,x +   16.154 * s,y +  -39.086 * s,x +   14.795 * s,y +  -33.902 * s,x +   14.795 * s,y +  -27.294 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   63.476 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 101:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   56.200 * s);
			_setf(o + ( 1 << 2), y +  -29.589 * s);
			_setf(o + ( 2 << 2), x +   56.200 * s);
			_setf(o + ( 3 << 2), y +  -25.195 * s);
			_setf(o + ( 4 << 2), x +   14.892 * s);
			_setf(o + ( 5 << 2), y +  -25.195 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   14.892 * s,y +  -25.195 * s,x +   15.283 * s,y +  -19.010 * s,x +   17.146 * s,y +  -14.298 * s,x +   20.483 * s,y +  -11.059 * s, threshold);
			_bez(x +   20.483 * s,y +  -11.059 * s,x +   23.819 * s,y +   -7.820 * s,x +   28.466 * s,y +   -6.201 * s,x +   34.423 * s,y +   -6.201 * s, threshold);
			_bez(x +   34.423 * s,y +   -6.201 * s,x +   37.874 * s,y +   -6.201 * s,x +   41.218 * s,y +   -6.624 * s,x +   44.457 * s,y +   -7.471 * s, threshold);
			_bez(x +   44.457 * s,y +   -7.471 * s,x +   47.696 * s,y +   -8.317 * s,x +   50.910 * s,y +   -9.586 * s,x +   54.101 * s,y +  -11.279 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   54.101 * s);
			_setf(o + ( 1 << 2), y +   -2.783 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   54.101 * s,y +   -2.783 * s,x +   50.878 * s,y +   -1.416 * s,x +   47.574 * s,y +   -0.374 * s,x +   44.189 * s,y +    0.342 * s, threshold);
			_bez(x +   44.189 * s,y +    0.342 * s,x +   40.803 * s,y +    1.058 * s,x +   37.369 * s,y +    1.416 * s,x +   33.886 * s,y +    1.416 * s, threshold);
			_bez(x +   33.886 * s,y +    1.416 * s,x +   25.162 * s,y +    1.416 * s,x +   18.253 * s,y +   -1.123 * s,x +   13.159 * s,y +   -6.201 * s, threshold);
			_bez(x +   13.159 * s,y +   -6.201 * s,x +    8.064 * s,y +  -11.279 * s,x +    5.517 * s,y +  -18.148 * s,x +    5.517 * s,y +  -26.806 * s, threshold);
			_bez(x +    5.517 * s,y +  -26.806 * s,x +    5.517 * s,y +  -35.758 * s,x +    7.934 * s,y +  -42.862 * s,x +   12.768 * s,y +  -48.119 * s, threshold);
			_bez(x +   12.768 * s,y +  -48.119 * s,x +   17.602 * s,y +  -53.376 * s,x +   24.120 * s,y +  -56.005 * s,x +   32.324 * s,y +  -56.005 * s, threshold);
			_bez(x +   32.324 * s,y +  -56.005 * s,x +   39.680 * s,y +  -56.005 * s,x +   45.499 * s,y +  -53.637 * s,x +   49.779 * s,y +  -48.901 * s, threshold);
			_bez(x +   49.779 * s,y +  -48.901 * s,x +   54.060 * s,y +  -44.164 * s,x +   56.200 * s,y +  -37.727 * s,x +   56.200 * s,y +  -29.589 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   47.216 * s);
			_setf(o + ( 1 << 2), y +  -32.226 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   47.216 * s,y +  -32.226 * s,x +   47.151 * s,y +  -37.141 * s,x +   45.775 * s,y +  -41.064 * s,x +   43.090 * s,y +  -43.993 * s, threshold);
			_bez(x +   43.090 * s,y +  -43.993 * s,x +   40.404 * s,y +  -46.923 * s,x +   36.848 * s,y +  -48.388 * s,x +   32.421 * s,y +  -48.388 * s, threshold);
			_bez(x +   32.421 * s,y +  -48.388 * s,x +   27.408 * s,y +  -48.388 * s,x +   23.396 * s,y +  -46.972 * s,x +   20.385 * s,y +  -44.140 * s, threshold);
			_bez(x +   20.385 * s,y +  -44.140 * s,x +   17.374 * s,y +  -41.308 * s,x +   15.641 * s,y +  -37.320 * s,x +   15.185 * s,y +  -32.177 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   47.216 * s);
			_setf(o + ( 1 << 2), y +  -32.226 * s);
			_setf(o + ( 2 << 2), x +   61.522 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 102:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   37.109 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   37.109 * s);
			_setf(o + ( 3 << 2), y +  -68.505 * s);
			_setf(o + ( 4 << 2), x +   28.515 * s);
			_setf(o + ( 5 << 2), y +  -68.505 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   28.515 * s,y +  -68.505 * s,x +   25.293 * s,y +  -68.505 * s,x +   23.055 * s,y +  -67.854 * s,x +   21.802 * s,y +  -66.552 * s, threshold);
			_bez(x +   21.802 * s,y +  -66.552 * s,x +   20.548 * s,y +  -65.250 * s,x +   19.922 * s,y +  -62.906 * s,x +   19.922 * s,y +  -59.521 * s, threshold);
			o = _posf(22);
			_setf(o + ( 0 << 2), x +   19.922 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   34.717 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   34.717 * s);
			_setf(o + ( 5 << 2), y +  -47.704 * s);
			_setf(o + ( 6 << 2), x +   19.922 * s);
			_setf(o + ( 7 << 2), y +  -47.704 * s);
			_setf(o + ( 8 << 2), x +   19.922 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   10.889 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   10.889 * s);
			_setf(o + (13 << 2), y +  -47.704 * s);
			_setf(o + (14 << 2), x +    2.295 * s);
			_setf(o + (15 << 2), y +  -47.704 * s);
			_setf(o + (16 << 2), x +    2.295 * s);
			_setf(o + (17 << 2), y +  -54.687 * s);
			_setf(o + (18 << 2), x +   10.889 * s);
			_setf(o + (19 << 2), y +  -54.687 * s);
			_setf(o + (20 << 2), x +   10.889 * s);
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
			_bez(x +   10.889 * s,y +  -58.495 * s,x +   10.889 * s,y +  -64.582 * s,x +   12.305 * s,y +  -69.017 * s,x +   15.137 * s,y +  -71.801 * s, threshold);
			_bez(x +   15.137 * s,y +  -71.801 * s,x +   17.969 * s,y +  -74.584 * s,x +   22.461 * s,y +  -75.975 * s,x +   28.613 * s,y +  -75.975 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   37.109 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   35.205 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 103:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   45.409 * s);
			_setf(o + ( 1 << 2), y +  -27.978 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   45.409 * s,y +  -27.978 * s,x +   45.409 * s,y +  -34.488 * s,x +   44.067 * s,y +  -39.534 * s,x +   41.381 * s,y +  -43.115 * s, threshold);
			_bez(x +   41.381 * s,y +  -43.115 * s,x +   38.696 * s,y +  -46.695 * s,x +   34.927 * s,y +  -48.486 * s,x +   30.077 * s,y +  -48.486 * s, threshold);
			_bez(x +   30.077 * s,y +  -48.486 * s,x +   25.260 * s,y +  -48.486 * s,x +   21.508 * s,y +  -46.695 * s,x +   18.823 * s,y +  -43.115 * s, threshold);
			_bez(x +   18.823 * s,y +  -43.115 * s,x +   16.137 * s,y +  -39.534 * s,x +   14.795 * s,y +  -34.488 * s,x +   14.795 * s,y +  -27.978 * s, threshold);
			_bez(x +   14.795 * s,y +  -27.978 * s,x +   14.795 * s,y +  -21.500 * s,x +   16.137 * s,y +  -16.471 * s,x +   18.823 * s,y +  -12.890 * s, threshold);
			_bez(x +   18.823 * s,y +  -12.890 * s,x +   21.508 * s,y +   -9.310 * s,x +   25.260 * s,y +   -7.519 * s,x +   30.077 * s,y +   -7.519 * s, threshold);
			_bez(x +   30.077 * s,y +   -7.519 * s,x +   34.927 * s,y +   -7.519 * s,x +   38.696 * s,y +   -9.310 * s,x +   41.381 * s,y +  -12.890 * s, threshold);
			_bez(x +   41.381 * s,y +  -12.890 * s,x +   44.067 * s,y +  -16.471 * s,x +   45.409 * s,y +  -21.500 * s,x +   45.409 * s,y +  -27.978 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   54.394 * s);
			_setf(o + ( 1 << 2), y +   -6.787 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   54.394 * s,y +   -6.787 * s,x +   54.394 * s,y +    2.522 * s,x +   52.326 * s,y +    9.448 * s,x +   48.192 * s,y +   13.989 * s, threshold);
			_bez(x +   48.192 * s,y +   13.989 * s,x +   44.058 * s,y +   18.530 * s,x +   37.727 * s,y +   20.800 * s,x +   29.199 * s,y +   20.800 * s, threshold);
			_bez(x +   29.199 * s,y +   20.800 * s,x +   26.041 * s,y +   20.800 * s,x +   23.063 * s,y +   20.564 * s,x +   20.263 * s,y +   20.092 * s, threshold);
			_bez(x +   20.263 * s,y +   20.092 * s,x +   17.464 * s,y +   19.620 * s,x +   14.746 * s,y +   18.896 * s,x +   12.109 * s,y +   17.920 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   12.109 * s);
			_setf(o + ( 1 << 2), y +    9.180 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   12.109 * s,y +    9.180 * s,x +   14.746 * s,y +   10.612 * s,x +   17.350 * s,y +   11.670 * s,x +   19.921 * s,y +   12.353 * s, threshold);
			_bez(x +   19.921 * s,y +   12.353 * s,x +   22.493 * s,y +   13.037 * s,x +   25.113 * s,y +   13.379 * s,x +   27.783 * s,y +   13.379 * s, threshold);
			_bez(x +   27.783 * s,y +   13.379 * s,x +   33.674 * s,y +   13.379 * s,x +   38.085 * s,y +   11.841 * s,x +   41.015 * s,y +    8.765 * s, threshold);
			_bez(x +   41.015 * s,y +    8.765 * s,x +   43.944 * s,y +    5.688 * s,x +   45.409 * s,y +    1.041 * s,x +   45.409 * s,y +   -5.176 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   45.409 * s);
			_setf(o + ( 1 << 2), y +   -9.619 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   45.409 * s,y +   -9.619 * s,x +   43.554 * s,y +   -6.396 * s,x +   41.178 * s,y +   -3.988 * s,x +   38.280 * s,y +   -2.393 * s, threshold);
			_bez(x +   38.280 * s,y +   -2.393 * s,x +   35.383 * s,y +   -0.798 * s,x +   31.917 * s,y +       0. * s,x +   27.880 * s,y +       0. * s, threshold);
			_bez(x +   27.880 * s,y +       0. * s,x +   21.175 * s,y +       0. * s,x +   15.771 * s,y +   -2.555 * s,x +   11.670 * s,y +   -7.666 * s, threshold);
			_bez(x +   11.670 * s,y +   -7.666 * s,x +    7.568 * s,y +  -12.776 * s,x +    5.517 * s,y +  -19.547 * s,x +    5.517 * s,y +  -27.978 * s, threshold);
			_bez(x +    5.517 * s,y +  -27.978 * s,x +    5.517 * s,y +  -36.441 * s,x +    7.568 * s,y +  -43.229 * s,x +   11.670 * s,y +  -48.339 * s, threshold);
			_bez(x +   11.670 * s,y +  -48.339 * s,x +   15.771 * s,y +  -53.450 * s,x +   21.175 * s,y +  -56.005 * s,x +   27.880 * s,y +  -56.005 * s, threshold);
			_bez(x +   27.880 * s,y +  -56.005 * s,x +   31.917 * s,y +  -56.005 * s,x +   35.383 * s,y +  -55.207 * s,x +   38.280 * s,y +  -53.612 * s, threshold);
			_bez(x +   38.280 * s,y +  -53.612 * s,x +   41.178 * s,y +  -52.017 * s,x +   43.554 * s,y +  -49.609 * s,x +   45.409 * s,y +  -46.386 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   45.409 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   54.394 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   54.394 * s);
			_setf(o + ( 5 << 2), y +   -6.787 * s);
			_setf(o + ( 6 << 2), x +   63.475 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			
			case 104:
			
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   54.882 * s);
			_setf(o + ( 1 << 2), y +  -33.007 * s);
			_setf(o + ( 2 << 2), x +   54.882 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   45.898 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   45.898 * s);
			_setf(o + ( 7 << 2), y +  -32.714 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_bez(x +   45.898 * s,y +  -32.714 * s,x +   45.898 * s,y +  -37.890 * s,x +   44.889 * s,y +  -41.764 * s,x +   42.871 * s,y +  -44.335 * s, threshold);
			_bez(x +   42.871 * s,y +  -44.335 * s,x +   40.853 * s,y +  -46.907 * s,x +   37.825 * s,y +  -48.193 * s,x +   33.789 * s,y +  -48.193 * s, threshold);
			_bez(x +   33.789 * s,y +  -48.193 * s,x +   28.939 * s,y +  -48.193 * s,x +   25.114 * s,y +  -46.646 * s,x +   22.315 * s,y +  -43.554 * s, threshold);
			_bez(x +   22.315 * s,y +  -43.554 * s,x +   19.515 * s,y +  -40.462 * s,x +   18.115 * s,y +  -36.246 * s,x +   18.115 * s,y +  -30.908 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   18.115 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    9.082 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    9.082 * s);
			_setf(o + ( 5 << 2), y +  -75.975 * s);
			_setf(o + ( 6 << 2), x +   18.115 * s);
			_setf(o + ( 7 << 2), y +  -75.975 * s);
			_setf(o + ( 8 << 2), x +   18.115 * s);
			_setf(o + ( 9 << 2), y +  -46.191 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   18.115 * s,y +  -46.191 * s,x +   20.264 * s,y +  -49.478 * s,x +   22.795 * s,y +  -51.936 * s,x +   25.708 * s,y +  -53.564 * s, threshold);
			_bez(x +   25.708 * s,y +  -53.564 * s,x +   28.621 * s,y +  -55.191 * s,x +   31.982 * s,y +  -56.005 * s,x +   35.791 * s,y +  -56.005 * s, threshold);
			_bez(x +   35.791 * s,y +  -56.005 * s,x +   42.074 * s,y +  -56.005 * s,x +   46.826 * s,y +  -54.060 * s,x +   50.048 * s,y +  -50.170 * s, threshold);
			_bez(x +   50.048 * s,y +  -50.170 * s,x +   53.271 * s,y +  -46.280 * s,x +   54.882 * s,y +  -40.559 * s,x +   54.882 * s,y +  -33.007 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   63.378 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 105:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +    9.424 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   18.408 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   18.408 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    9.424 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    9.424 * s);
			_setf(o + ( 9 << 2), y +  -54.687 * s);
			_setf(o + (10 << 2), x +    9.424 * s);
			_setf(o + (11 << 2), y +  -75.975 * s);
			_setf(o + (12 << 2), x +   18.408 * s);
			_setf(o + (13 << 2), y +  -75.975 * s);
			_setf(o + (14 << 2), x +   18.408 * s);
			_setf(o + (15 << 2), y +  -64.599 * s);
			_setf(o + (16 << 2), x +    9.424 * s);
			_setf(o + (17 << 2), y +  -64.599 * s);
			_setf(o + (18 << 2), x +    9.424 * s);
			_setf(o + (19 << 2), y +  -75.975 * s);
			_setf(o + (20 << 2), x +   27.783 * s);
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
			_setf(o + ( 0 << 2), x +    9.424 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   18.408 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   18.408 * s);
			_setf(o + ( 5 << 2), y +    0.977 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   18.408 * s,y +    0.977 * s,x +   18.408 * s,y +    7.942 * s,x +   17.082 * s,y +   12.988 * s,x +   14.429 * s,y +   16.113 * s, threshold);
			_bez(x +   14.429 * s,y +   16.113 * s,x +   11.776 * s,y +   19.238 * s,x +    7.503 * s,y +   20.800 * s,x +    1.611 * s,y +   20.800 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   -1.807 * s);
			_setf(o + ( 1 << 2), y +   20.800 * s);
			_setf(o + ( 2 << 2), x +   -1.807 * s);
			_setf(o + ( 3 << 2), y +   13.183 * s);
			_setf(o + ( 4 << 2), x +    0.586 * s);
			_setf(o + ( 5 << 2), y +   13.183 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +    0.586 * s,y +   13.183 * s,x +    4.004 * s,y +   13.183 * s,x +    6.331 * s,y +   12.394 * s,x +    7.568 * s,y +   10.815 * s, threshold);
			_bez(x +    7.568 * s,y +   10.815 * s,x +    8.805 * s,y +    9.237 * s,x +    9.424 * s,y +    5.957 * s,x +    9.424 * s,y +    0.977 * s, threshold);
			o = _posf(14);
			_setf(o + ( 0 << 2), x +    9.424 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +    9.424 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   18.408 * s);
			_setf(o + ( 5 << 2), y +  -75.975 * s);
			_setf(o + ( 6 << 2), x +   18.408 * s);
			_setf(o + ( 7 << 2), y +  -64.599 * s);
			_setf(o + ( 8 << 2), x +    9.424 * s);
			_setf(o + ( 9 << 2), y +  -64.599 * s);
			_setf(o + (10 << 2), x +    9.424 * s);
			_setf(o + (11 << 2), y +  -75.975 * s);
			_setf(o + (12 << 2), x +   27.783 * s);
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
			_setf(o + ( 0 << 2), x +    9.082 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   18.115 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   18.115 * s);
			_setf(o + ( 5 << 2), y +  -31.103 * s);
			_setf(o + ( 6 << 2), x +   44.921 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   56.396 * s);
			_setf(o + ( 9 << 2), y +  -54.687 * s);
			_setf(o + (10 << 2), x +   27.392 * s);
			_setf(o + (11 << 2), y +  -29.101 * s);
			_setf(o + (12 << 2), x +   57.616 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   45.898 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   18.115 * s);
			_setf(o + (17 << 2), y +  -26.709 * s);
			_setf(o + (18 << 2), x +   18.115 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +    9.082 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +    9.082 * s);
			_setf(o + (23 << 2), y +  -75.975 * s);
			_setf(o + (24 << 2), x +   57.909 * s);
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
			_setf(o + ( 0 << 2), x +    9.424 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   18.408 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   18.408 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    9.424 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    9.424 * s);
			_setf(o + ( 9 << 2), y +  -75.975 * s);
			_setf(o + (10 << 2), x +   27.783 * s);
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
			_setf(o + ( 0 << 2), x +   52.001 * s);
			_setf(o + ( 1 << 2), y +  -44.189 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   52.001 * s,y +  -44.189 * s,x +   54.247 * s,y +  -48.225 * s,x +   56.933 * s,y +  -51.204 * s,x +   60.058 * s,y +  -53.124 * s, threshold);
			_bez(x +   60.058 * s,y +  -53.124 * s,x +   63.183 * s,y +  -55.045 * s,x +   66.861 * s,y +  -56.005 * s,x +   71.092 * s,y +  -56.005 * s, threshold);
			_bez(x +   71.092 * s,y +  -56.005 * s,x +   76.789 * s,y +  -56.005 * s,x +   81.183 * s,y +  -54.011 * s,x +   84.276 * s,y +  -50.024 * s, threshold);
			_bez(x +   84.276 * s,y +  -50.024 * s,x +   87.368 * s,y +  -46.036 * s,x +   88.914 * s,y +  -40.364 * s,x +   88.914 * s,y +  -33.007 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   88.914 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   79.881 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   79.881 * s);
			_setf(o + ( 5 << 2), y +  -32.714 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   79.881 * s,y +  -32.714 * s,x +   79.881 * s,y +  -37.955 * s,x +   78.954 * s,y +  -41.845 * s,x +   77.098 * s,y +  -44.384 * s, threshold);
			_bez(x +   77.098 * s,y +  -44.384 * s,x +   75.243 * s,y +  -46.923 * s,x +   72.411 * s,y +  -48.193 * s,x +   68.602 * s,y +  -48.193 * s, threshold);
			_bez(x +   68.602 * s,y +  -48.193 * s,x +   63.947 * s,y +  -48.193 * s,x +   60.269 * s,y +  -46.646 * s,x +   57.567 * s,y +  -43.554 * s, threshold);
			_bez(x +   57.567 * s,y +  -43.554 * s,x +   54.866 * s,y +  -40.462 * s,x +   53.515 * s,y +  -36.246 * s,x +   53.515 * s,y +  -30.908 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   53.515 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   44.482 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   44.482 * s);
			_setf(o + ( 5 << 2), y +  -32.714 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   44.482 * s,y +  -32.714 * s,x +   44.482 * s,y +  -37.988 * s,x +   43.554 * s,y +  -41.886 * s,x +   41.699 * s,y +  -44.408 * s, threshold);
			_bez(x +   41.699 * s,y +  -44.408 * s,x +   39.843 * s,y +  -46.931 * s,x +   36.979 * s,y +  -48.193 * s,x +   33.105 * s,y +  -48.193 * s, threshold);
			_bez(x +   33.105 * s,y +  -48.193 * s,x +   28.515 * s,y +  -48.193 * s,x +   24.869 * s,y +  -46.638 * s,x +   22.168 * s,y +  -43.530 * s, threshold);
			_bez(x +   22.168 * s,y +  -43.530 * s,x +   19.466 * s,y +  -40.421 * s,x +   18.115 * s,y +  -36.214 * s,x +   18.115 * s,y +  -30.908 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   18.115 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    9.082 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    9.082 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   18.115 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   18.115 * s);
			_setf(o + ( 9 << 2), y +  -46.191 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   18.115 * s,y +  -46.191 * s,x +   20.166 * s,y +  -49.544 * s,x +   22.623 * s,y +  -52.017 * s,x +   25.488 * s,y +  -53.612 * s, threshold);
			_bez(x +   25.488 * s,y +  -53.612 * s,x +   28.352 * s,y +  -55.207 * s,x +   31.754 * s,y +  -56.005 * s,x +   35.693 * s,y +  -56.005 * s, threshold);
			_bez(x +   35.693 * s,y +  -56.005 * s,x +   39.664 * s,y +  -56.005 * s,x +   43.041 * s,y +  -54.996 * s,x +   45.824 * s,y +  -52.978 * s, threshold);
			_bez(x +   45.824 * s,y +  -52.978 * s,x +   48.608 * s,y +  -50.959 * s,x +   50.666 * s,y +  -48.030 * s,x +   52.001 * s,y +  -44.189 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   97.410 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 110:
			
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   54.882 * s);
			_setf(o + ( 1 << 2), y +  -33.007 * s);
			_setf(o + ( 2 << 2), x +   54.882 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   45.898 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   45.898 * s);
			_setf(o + ( 7 << 2), y +  -32.714 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_bez(x +   45.898 * s,y +  -32.714 * s,x +   45.898 * s,y +  -37.890 * s,x +   44.889 * s,y +  -41.764 * s,x +   42.871 * s,y +  -44.335 * s, threshold);
			_bez(x +   42.871 * s,y +  -44.335 * s,x +   40.853 * s,y +  -46.907 * s,x +   37.825 * s,y +  -48.193 * s,x +   33.789 * s,y +  -48.193 * s, threshold);
			_bez(x +   33.789 * s,y +  -48.193 * s,x +   28.939 * s,y +  -48.193 * s,x +   25.114 * s,y +  -46.646 * s,x +   22.314 * s,y +  -43.554 * s, threshold);
			_bez(x +   22.314 * s,y +  -43.554 * s,x +   19.515 * s,y +  -40.462 * s,x +   18.115 * s,y +  -36.246 * s,x +   18.115 * s,y +  -30.908 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   18.115 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    9.082 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    9.082 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   18.115 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   18.115 * s);
			_setf(o + ( 9 << 2), y +  -46.191 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   18.115 * s,y +  -46.191 * s,x +   20.264 * s,y +  -49.478 * s,x +   22.795 * s,y +  -51.936 * s,x +   25.708 * s,y +  -53.564 * s, threshold);
			_bez(x +   25.708 * s,y +  -53.564 * s,x +   28.621 * s,y +  -55.191 * s,x +   31.982 * s,y +  -56.005 * s,x +   35.791 * s,y +  -56.005 * s, threshold);
			_bez(x +   35.791 * s,y +  -56.005 * s,x +   42.073 * s,y +  -56.005 * s,x +   46.826 * s,y +  -54.060 * s,x +   50.048 * s,y +  -50.170 * s, threshold);
			_bez(x +   50.048 * s,y +  -50.170 * s,x +   53.271 * s,y +  -46.280 * s,x +   54.882 * s,y +  -40.559 * s,x +   54.882 * s,y +  -33.007 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   63.378 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 111:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   30.615 * s);
			_setf(o + ( 1 << 2), y +  -48.388 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   30.615 * s,y +  -48.388 * s,x +   25.797 * s,y +  -48.388 * s,x +   21.989 * s,y +  -46.508 * s,x +   19.189 * s,y +  -42.748 * s, threshold);
			_bez(x +   19.189 * s,y +  -42.748 * s,x +   16.390 * s,y +  -38.989 * s,x +   14.990 * s,y +  -33.837 * s,x +   14.990 * s,y +  -27.294 * s, threshold);
			_bez(x +   14.990 * s,y +  -27.294 * s,x +   14.990 * s,y +  -20.752 * s,x +   16.382 * s,y +  -15.600 * s,x +   19.165 * s,y +  -11.841 * s, threshold);
			_bez(x +   19.165 * s,y +  -11.841 * s,x +   21.948 * s,y +   -8.081 * s,x +   25.765 * s,y +   -6.201 * s,x +   30.615 * s,y +   -6.201 * s, threshold);
			_bez(x +   30.615 * s,y +   -6.201 * s,x +   35.400 * s,y +   -6.201 * s,x +   39.192 * s,y +   -8.089 * s,x +   41.992 * s,y +  -11.865 * s, threshold);
			_bez(x +   41.992 * s,y +  -11.865 * s,x +   44.791 * s,y +  -15.641 * s,x +   46.191 * s,y +  -20.784 * s,x +   46.191 * s,y +  -27.294 * s, threshold);
			_bez(x +   46.191 * s,y +  -27.294 * s,x +   46.191 * s,y +  -33.772 * s,x +   44.791 * s,y +  -38.907 * s,x +   41.992 * s,y +  -42.700 * s, threshold);
			_bez(x +   41.992 * s,y +  -42.700 * s,x +   39.192 * s,y +  -46.492 * s,x +   35.400 * s,y +  -48.388 * s,x +   30.615 * s,y +  -48.388 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   30.615 * s);
			_setf(o + ( 1 << 2), y +  -56.005 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   30.615 * s,y +  -56.005 * s,x +   38.428 * s,y +  -56.005 * s,x +   44.563 * s,y +  -53.466 * s,x +   49.023 * s,y +  -48.388 * s, threshold);
			_bez(x +   49.023 * s,y +  -48.388 * s,x +   53.483 * s,y +  -43.310 * s,x +   55.712 * s,y +  -36.279 * s,x +   55.712 * s,y +  -27.294 * s, threshold);
			_bez(x +   55.712 * s,y +  -27.294 * s,x +   55.712 * s,y +  -18.343 * s,x +   53.483 * s,y +  -11.320 * s,x +   49.023 * s,y +   -6.225 * s, threshold);
			_bez(x +   49.023 * s,y +   -6.225 * s,x +   44.563 * s,y +   -1.131 * s,x +   38.428 * s,y +    1.416 * s,x +   30.615 * s,y +    1.416 * s, threshold);
			_bez(x +   30.615 * s,y +    1.416 * s,x +   22.770 * s,y +    1.416 * s,x +   16.626 * s,y +   -1.131 * s,x +   12.183 * s,y +   -6.225 * s, threshold);
			_bez(x +   12.183 * s,y +   -6.225 * s,x +    7.739 * s,y +  -11.320 * s,x +    5.518 * s,y +  -18.343 * s,x +    5.518 * s,y +  -27.294 * s, threshold);
			_bez(x +    5.518 * s,y +  -27.294 * s,x +    5.518 * s,y +  -36.279 * s,x +    7.739 * s,y +  -43.310 * s,x +   12.183 * s,y +  -48.388 * s, threshold);
			_bez(x +   12.183 * s,y +  -48.388 * s,x +   16.626 * s,y +  -53.466 * s,x +   22.770 * s,y +  -56.005 * s,x +   30.615 * s,y +  -56.005 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   61.181 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 112:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   18.115 * s);
			_setf(o + ( 1 << 2), y +   -8.203 * s);
			_setf(o + ( 2 << 2), x +   18.115 * s);
			_setf(o + ( 3 << 2), y +   20.800 * s);
			_setf(o + ( 4 << 2), x +    9.082 * s);
			_setf(o + ( 5 << 2), y +   20.800 * s);
			_setf(o + ( 6 << 2), x +    9.082 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   18.115 * s);
			_setf(o + ( 9 << 2), y +  -54.687 * s);
			_setf(o + (10 << 2), x +   18.115 * s);
			_setf(o + (11 << 2), y +  -46.386 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_bez(x +   18.115 * s,y +  -46.386 * s,x +   20.003 * s,y +  -49.641 * s,x +   22.387 * s,y +  -52.058 * s,x +   25.268 * s,y +  -53.637 * s, threshold);
			_bez(x +   25.268 * s,y +  -53.637 * s,x +   28.149 * s,y +  -55.216 * s,x +   31.591 * s,y +  -56.005 * s,x +   35.595 * s,y +  -56.005 * s, threshold);
			_bez(x +   35.595 * s,y +  -56.005 * s,x +   42.236 * s,y +  -56.005 * s,x +   47.631 * s,y +  -53.368 * s,x +   51.781 * s,y +  -48.095 * s, threshold);
			_bez(x +   51.781 * s,y +  -48.095 * s,x +   55.932 * s,y +  -42.822 * s,x +   58.007 * s,y +  -35.888 * s,x +   58.007 * s,y +  -27.294 * s, threshold);
			_bez(x +   58.007 * s,y +  -27.294 * s,x +   58.007 * s,y +  -18.701 * s,x +   55.932 * s,y +  -11.767 * s,x +   51.781 * s,y +   -6.494 * s, threshold);
			_bez(x +   51.781 * s,y +   -6.494 * s,x +   47.631 * s,y +   -1.221 * s,x +   42.236 * s,y +    1.416 * s,x +   35.595 * s,y +    1.416 * s, threshold);
			_bez(x +   35.595 * s,y +    1.416 * s,x +   31.591 * s,y +    1.416 * s,x +   28.149 * s,y +    0.627 * s,x +   25.268 * s,y +   -0.952 * s, threshold);
			_bez(x +   25.268 * s,y +   -0.952 * s,x +   22.387 * s,y +   -2.531 * s,x +   20.003 * s,y +   -4.948 * s,x +   18.115 * s,y +   -8.203 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   48.681 * s);
			_setf(o + ( 1 << 2), y +  -27.294 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   48.681 * s,y +  -27.294 * s,x +   48.681 * s,y +  -33.902 * s,x +   47.322 * s,y +  -39.086 * s,x +   44.604 * s,y +  -42.846 * s, threshold);
			_bez(x +   44.604 * s,y +  -42.846 * s,x +   41.886 * s,y +  -46.606 * s,x +   38.150 * s,y +  -48.486 * s,x +   33.398 * s,y +  -48.486 * s, threshold);
			_bez(x +   33.398 * s,y +  -48.486 * s,x +   28.645 * s,y +  -48.486 * s,x +   24.910 * s,y +  -46.606 * s,x +   22.192 * s,y +  -42.846 * s, threshold);
			_bez(x +   22.192 * s,y +  -42.846 * s,x +   19.474 * s,y +  -39.086 * s,x +   18.115 * s,y +  -33.902 * s,x +   18.115 * s,y +  -27.294 * s, threshold);
			_bez(x +   18.115 * s,y +  -27.294 * s,x +   18.115 * s,y +  -20.687 * s,x +   19.474 * s,y +  -15.503 * s,x +   22.192 * s,y +  -11.743 * s, threshold);
			_bez(x +   22.192 * s,y +  -11.743 * s,x +   24.910 * s,y +   -7.983 * s,x +   28.645 * s,y +   -6.103 * s,x +   33.398 * s,y +   -6.103 * s, threshold);
			_bez(x +   33.398 * s,y +   -6.103 * s,x +   38.150 * s,y +   -6.103 * s,x +   41.886 * s,y +   -7.983 * s,x +   44.604 * s,y +  -11.743 * s, threshold);
			_bez(x +   44.604 * s,y +  -11.743 * s,x +   47.322 * s,y +  -15.503 * s,x +   48.681 * s,y +  -20.687 * s,x +   48.681 * s,y +  -27.294 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   63.476 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 113:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   14.794 * s);
			_setf(o + ( 1 << 2), y +  -27.294 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   14.794 * s,y +  -27.294 * s,x +   14.794 * s,y +  -20.687 * s,x +   16.153 * s,y +  -15.503 * s,x +   18.871 * s,y +  -11.743 * s, threshold);
			_bez(x +   18.871 * s,y +  -11.743 * s,x +   21.589 * s,y +   -7.983 * s,x +   25.325 * s,y +   -6.103 * s,x +   30.077 * s,y +   -6.103 * s, threshold);
			_bez(x +   30.077 * s,y +   -6.103 * s,x +   34.830 * s,y +   -6.103 * s,x +   38.573 * s,y +   -7.983 * s,x +   41.308 * s,y +  -11.743 * s, threshold);
			_bez(x +   41.308 * s,y +  -11.743 * s,x +   44.042 * s,y +  -15.503 * s,x +   45.409 * s,y +  -20.687 * s,x +   45.409 * s,y +  -27.294 * s, threshold);
			_bez(x +   45.409 * s,y +  -27.294 * s,x +   45.409 * s,y +  -33.902 * s,x +   44.042 * s,y +  -39.086 * s,x +   41.308 * s,y +  -42.846 * s, threshold);
			_bez(x +   41.308 * s,y +  -42.846 * s,x +   38.573 * s,y +  -46.606 * s,x +   34.830 * s,y +  -48.486 * s,x +   30.077 * s,y +  -48.486 * s, threshold);
			_bez(x +   30.077 * s,y +  -48.486 * s,x +   25.325 * s,y +  -48.486 * s,x +   21.589 * s,y +  -46.606 * s,x +   18.871 * s,y +  -42.846 * s, threshold);
			_bez(x +   18.871 * s,y +  -42.846 * s,x +   16.153 * s,y +  -39.086 * s,x +   14.794 * s,y +  -33.902 * s,x +   14.794 * s,y +  -27.294 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   45.409 * s);
			_setf(o + ( 1 << 2), y +   -8.203 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   45.409 * s,y +   -8.203 * s,x +   43.521 * s,y +   -4.948 * s,x +   41.137 * s,y +   -2.531 * s,x +   38.256 * s,y +   -0.952 * s, threshold);
			_bez(x +   38.256 * s,y +   -0.952 * s,x +   35.375 * s,y +    0.627 * s,x +   31.916 * s,y +    1.416 * s,x +   27.880 * s,y +    1.416 * s, threshold);
			_bez(x +   27.880 * s,y +    1.416 * s,x +   21.272 * s,y +    1.416 * s,x +   15.893 * s,y +   -1.221 * s,x +   11.743 * s,y +   -6.494 * s, threshold);
			_bez(x +   11.743 * s,y +   -6.494 * s,x +    7.592 * s,y +  -11.767 * s,x +    5.517 * s,y +  -18.701 * s,x +    5.517 * s,y +  -27.294 * s, threshold);
			_bez(x +    5.517 * s,y +  -27.294 * s,x +    5.517 * s,y +  -35.888 * s,x +    7.592 * s,y +  -42.822 * s,x +   11.743 * s,y +  -48.095 * s, threshold);
			_bez(x +   11.743 * s,y +  -48.095 * s,x +   15.893 * s,y +  -53.368 * s,x +   21.272 * s,y +  -56.005 * s,x +   27.880 * s,y +  -56.005 * s, threshold);
			_bez(x +   27.880 * s,y +  -56.005 * s,x +   31.916 * s,y +  -56.005 * s,x +   35.375 * s,y +  -55.216 * s,x +   38.256 * s,y +  -53.637 * s, threshold);
			_bez(x +   38.256 * s,y +  -53.637 * s,x +   41.137 * s,y +  -52.058 * s,x +   43.521 * s,y +  -49.641 * s,x +   45.409 * s,y +  -46.386 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   45.409 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   54.393 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   54.393 * s);
			_setf(o + ( 5 << 2), y +   20.800 * s);
			_setf(o + ( 6 << 2), x +   45.409 * s);
			_setf(o + ( 7 << 2), y +   20.800 * s);
			_setf(o + ( 8 << 2), x +   45.409 * s);
			_setf(o + ( 9 << 2), y +   -8.203 * s);
			_setf(o + (10 << 2), x +   63.475 * s);
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
			_setf(o + ( 0 << 2), x +   41.113 * s);
			_setf(o + ( 1 << 2), y +  -46.288 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   41.113 * s,y +  -46.288 * s,x +   40.104 * s,y +  -46.874 * s,x +   39.005 * s,y +  -47.306 * s,x +   37.817 * s,y +  -47.582 * s, threshold);
			_bez(x +   37.817 * s,y +  -47.582 * s,x +   36.629 * s,y +  -47.859 * s,x +   35.319 * s,y +  -47.997 * s,x +   33.886 * s,y +  -47.997 * s, threshold);
			_bez(x +   33.886 * s,y +  -47.997 * s,x +   28.808 * s,y +  -47.997 * s,x +   24.910 * s,y +  -46.345 * s,x +   22.192 * s,y +  -43.041 * s, threshold);
			_bez(x +   22.192 * s,y +  -43.041 * s,x +   19.474 * s,y +  -39.737 * s,x +   18.115 * s,y +  -34.993 * s,x +   18.115 * s,y +  -28.808 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   18.115 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    9.082 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    9.082 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   18.115 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   18.115 * s);
			_setf(o + ( 9 << 2), y +  -46.191 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   18.115 * s,y +  -46.191 * s,x +   20.003 * s,y +  -49.511 * s,x +   22.461 * s,y +  -51.977 * s,x +   25.488 * s,y +  -53.588 * s, threshold);
			_bez(x +   25.488 * s,y +  -53.588 * s,x +   28.515 * s,y +  -55.199 * s,x +   32.194 * s,y +  -56.005 * s,x +   36.523 * s,y +  -56.005 * s, threshold);
			_bez(x +   36.523 * s,y +  -56.005 * s,x +   37.142 * s,y +  -56.005 * s,x +   37.825 * s,y +  -55.964 * s,x +   38.574 * s,y +  -55.883 * s, threshold);
			_bez(x +   38.574 * s,y +  -55.883 * s,x +   39.322 * s,y +  -55.802 * s,x +   40.153 * s,y +  -55.679 * s,x +   41.064 * s,y +  -55.517 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   41.113 * s);
			_setf(o + ( 1 << 2), y +  -46.288 * s);
			_setf(o + ( 2 << 2), x +   41.113 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 115:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   44.286 * s);
			_setf(o + ( 1 << 2), y +  -53.075 * s);
			_setf(o + ( 2 << 2), x +   44.286 * s);
			_setf(o + ( 3 << 2), y +  -44.579 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   44.286 * s,y +  -44.579 * s,x +   41.747 * s,y +  -45.881 * s,x +   39.111 * s,y +  -46.858 * s,x +   36.376 * s,y +  -47.509 * s, threshold);
			_bez(x +   36.376 * s,y +  -47.509 * s,x +   33.642 * s,y +  -48.160 * s,x +   30.810 * s,y +  -48.486 * s,x +   27.880 * s,y +  -48.486 * s, threshold);
			_bez(x +   27.880 * s,y +  -48.486 * s,x +   23.421 * s,y +  -48.486 * s,x +   20.076 * s,y +  -47.802 * s,x +   17.846 * s,y +  -46.435 * s, threshold);
			_bez(x +   17.846 * s,y +  -46.435 * s,x +   15.616 * s,y +  -45.068 * s,x +   14.502 * s,y +  -43.017 * s,x +   14.502 * s,y +  -40.283 * s, threshold);
			_bez(x +   14.502 * s,y +  -40.283 * s,x +   14.502 * s,y +  -38.199 * s,x +   15.299 * s,y +  -36.564 * s,x +   16.894 * s,y +  -35.375 * s, threshold);
			_bez(x +   16.894 * s,y +  -35.375 * s,x +   18.489 * s,y +  -34.187 * s,x +   21.695 * s,y +  -33.053 * s,x +   26.513 * s,y +  -31.982 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   29.589 * s);
			_setf(o + ( 1 << 2), y +  -31.298 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   29.589 * s,y +  -31.298 * s,x +   35.959 * s,y +  -29.883 * s,x +   40.502 * s,y +  -28.002 * s,x +   43.188 * s,y +  -25.512 * s, threshold);
			_bez(x +   43.188 * s,y +  -25.512 * s,x +   45.873 * s,y +  -23.022 * s,x +   47.216 * s,y +  -19.547 * s,x +   47.216 * s,y +  -15.088 * s, threshold);
			_bez(x +   47.216 * s,y +  -15.088 * s,x +   47.216 * s,y +  -10.009 * s,x +   45.206 * s,y +   -5.989 * s,x +   41.186 * s,y +   -3.027 * s, threshold);
			_bez(x +   41.186 * s,y +   -3.027 * s,x +   37.166 * s,y +   -0.065 * s,x +   31.640 * s,y +    1.416 * s,x +   24.609 * s,y +    1.416 * s, threshold);
			_bez(x +   24.609 * s,y +    1.416 * s,x +   21.679 * s,y +    1.416 * s,x +   18.627 * s,y +    1.131 * s,x +   15.454 * s,y +    0.562 * s, threshold);
			_bez(x +   15.454 * s,y +    0.562 * s,x +   12.280 * s,y +   -0.008 * s,x +    8.935 * s,y +   -0.863 * s,x +    5.420 * s,y +   -2.002 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    5.420 * s);
			_setf(o + ( 1 << 2), y +  -11.279 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    5.420 * s,y +  -11.279 * s,x +    8.740 * s,y +   -9.554 * s,x +   12.011 * s,y +   -8.260 * s,x +   15.234 * s,y +   -7.397 * s, threshold);
			_bez(x +   15.234 * s,y +   -7.397 * s,x +   18.457 * s,y +   -6.535 * s,x +   21.647 * s,y +   -6.103 * s,x +   24.804 * s,y +   -6.103 * s, threshold);
			_bez(x +   24.804 * s,y +   -6.103 * s,x +   29.036 * s,y +   -6.103 * s,x +   32.291 * s,y +   -6.828 * s,x +   34.570 * s,y +   -8.276 * s, threshold);
			_bez(x +   34.570 * s,y +   -8.276 * s,x +   36.848 * s,y +   -9.725 * s,x +   37.988 * s,y +  -11.767 * s,x +   37.988 * s,y +  -14.404 * s, threshold);
			_bez(x +   37.988 * s,y +  -14.404 * s,x +   37.988 * s,y +  -16.845 * s,x +   37.166 * s,y +  -18.717 * s,x +   35.522 * s,y +  -20.019 * s, threshold);
			_bez(x +   35.522 * s,y +  -20.019 * s,x +   33.878 * s,y +  -21.321 * s,x +   30.251 * s,y +  -22.479 * s,x +   24.706 * s,y +  -23.779 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   21.582 * s);
			_setf(o + ( 1 << 2), y +  -24.511 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   21.582 * s,y +  -24.511 * s,x +   16.043 * s,y +  -25.809 * s,x +   11.995 * s,y +  -27.482 * s,x +    9.521 * s,y +  -29.907 * s, threshold);
			_bez(x +    9.521 * s,y +  -29.907 * s,x +    7.047 * s,y +  -32.332 * s,x +    5.810 * s,y +  -35.660 * s,x +    5.810 * s,y +  -39.892 * s, threshold);
			_bez(x +    5.810 * s,y +  -39.892 * s,x +    5.810 * s,y +  -45.035 * s,x +    7.633 * s,y +  -49.006 * s,x +   11.279 * s,y +  -51.806 * s, threshold);
			_bez(x +   11.279 * s,y +  -51.806 * s,x +   14.925 * s,y +  -54.605 * s,x +   20.101 * s,y +  -56.005 * s,x +   26.806 * s,y +  -56.005 * s, threshold);
			_bez(x +   26.806 * s,y +  -56.005 * s,x +   30.126 * s,y +  -56.005 * s,x +   33.251 * s,y +  -55.761 * s,x +   36.181 * s,y +  -55.273 * s, threshold);
			_bez(x +   36.181 * s,y +  -55.273 * s,x +   39.111 * s,y +  -54.784 * s,x +   41.812 * s,y +  -54.052 * s,x +   44.286 * s,y +  -53.075 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   52.099 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 116:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   18.310 * s);
			_setf(o + ( 1 << 2), y +  -70.214 * s);
			_setf(o + ( 2 << 2), x +   18.310 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   36.815 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   36.815 * s);
			_setf(o + ( 7 << 2), y +  -47.704 * s);
			_setf(o + ( 8 << 2), x +   18.310 * s);
			_setf(o + ( 9 << 2), y +  -47.704 * s);
			_setf(o + (10 << 2), x +   18.310 * s);
			_setf(o + (11 << 2), y +  -18.017 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_bez(x +   18.310 * s,y +  -18.017 * s,x +   18.310 * s,y +  -13.558 * s,x +   18.920 * s,y +  -10.693 * s,x +   20.141 * s,y +   -9.424 * s, threshold);
			_bez(x +   20.141 * s,y +   -9.424 * s,x +   21.362 * s,y +   -8.154 * s,x +   23.844 * s,y +   -7.519 * s,x +   27.587 * s,y +   -7.519 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   36.815 * s);
			_setf(o + ( 1 << 2), y +   -7.519 * s);
			_setf(o + ( 2 << 2), x +   36.815 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   27.587 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   27.587 * s,y +       0. * s,x +   20.654 * s,y +       0. * s,x +   15.869 * s,y +   -1.294 * s,x +   13.232 * s,y +   -3.882 * s, threshold);
			_bez(x +   13.232 * s,y +   -3.882 * s,x +   10.595 * s,y +   -6.470 * s,x +    9.277 * s,y +  -11.181 * s,x +    9.277 * s,y +  -18.017 * s, threshold);
			o = _posf(14);
			_setf(o + ( 0 << 2), x +    9.277 * s);
			_setf(o + ( 1 << 2), y +  -47.704 * s);
			_setf(o + ( 2 << 2), x +    2.685 * s);
			_setf(o + ( 3 << 2), y +  -47.704 * s);
			_setf(o + ( 4 << 2), x +    2.685 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +    9.277 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +    9.277 * s);
			_setf(o + ( 9 << 2), y +  -70.214 * s);
			_setf(o + (10 << 2), x +   18.310 * s);
			_setf(o + (11 << 2), y +  -70.214 * s);
			_setf(o + (12 << 2), x +   39.208 * s);
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
			_setf(o + ( 0 << 2), x +    8.496 * s);
			_setf(o + ( 1 << 2), y +  -21.582 * s);
			_setf(o + ( 2 << 2), x +    8.496 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   17.480 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   17.480 * s);
			_setf(o + ( 7 << 2), y +  -21.923 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_bez(x +   17.480 * s,y +  -21.923 * s,x +   17.480 * s,y +  -16.748 * s,x +   18.489 * s,y +  -12.866 * s,x +   20.507 * s,y +  -10.278 * s, threshold);
			_bez(x +   20.507 * s,y +  -10.278 * s,x +   22.526 * s,y +   -7.690 * s,x +   25.553 * s,y +   -6.396 * s,x +   29.589 * s,y +   -6.396 * s, threshold);
			_bez(x +   29.589 * s,y +   -6.396 * s,x +   34.439 * s,y +   -6.396 * s,x +   38.273 * s,y +   -7.943 * s,x +   41.088 * s,y +  -11.035 * s, threshold);
			_bez(x +   41.088 * s,y +  -11.035 * s,x +   43.904 * s,y +  -14.127 * s,x +   45.312 * s,y +  -18.343 * s,x +   45.312 * s,y +  -23.681 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   45.312 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   54.296 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   54.296 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   45.312 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   45.312 * s);
			_setf(o + ( 9 << 2), y +   -8.398 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   45.312 * s,y +   -8.398 * s,x +   43.131 * s,y +   -5.078 * s,x +   40.600 * s,y +   -2.612 * s,x +   37.719 * s,y +   -1.001 * s, threshold);
			_bez(x +   37.719 * s,y +   -1.001 * s,x +   34.838 * s,y +    0.610 * s,x +   31.494 * s,y +    1.416 * s,x +   27.685 * s,y +    1.416 * s, threshold);
			_bez(x +   27.685 * s,y +    1.416 * s,x +   21.402 * s,y +    1.416 * s,x +   16.634 * s,y +   -0.537 * s,x +   13.379 * s,y +   -4.443 * s, threshold);
			_bez(x +   13.379 * s,y +   -4.443 * s,x +   10.123 * s,y +   -8.349 * s,x +    8.496 * s,y +  -14.062 * s,x +    8.496 * s,y +  -21.582 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   63.378 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 118:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +    2.978 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   12.500 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   29.589 * s);
			_setf(o + ( 5 << 2), y +   -8.789 * s);
			_setf(o + ( 6 << 2), x +   46.679 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   56.200 * s);
			_setf(o + ( 9 << 2), y +  -54.687 * s);
			_setf(o + (10 << 2), x +   35.693 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   23.486 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +    2.978 * s);
			_setf(o + (15 << 2), y +  -54.687 * s);
			_setf(o + (16 << 2), x +   59.179 * s);
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
			_setf(o + ( 0 << 2), x +    4.199 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   13.183 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   24.413 * s);
			_setf(o + ( 5 << 2), y +  -12.012 * s);
			_setf(o + ( 6 << 2), x +   35.595 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   46.190 * s);
			_setf(o + ( 9 << 2), y +  -54.687 * s);
			_setf(o + (10 << 2), x +   57.421 * s);
			_setf(o + (11 << 2), y +  -12.012 * s);
			_setf(o + (12 << 2), x +   68.602 * s);
			_setf(o + (13 << 2), y +  -54.687 * s);
			_setf(o + (14 << 2), x +   77.586 * s);
			_setf(o + (15 << 2), y +  -54.687 * s);
			_setf(o + (16 << 2), x +   63.280 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   52.684 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   40.917 * s);
			_setf(o + (21 << 2), y +  -44.824 * s);
			_setf(o + (22 << 2), x +   29.101 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   18.505 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +    4.199 * s);
			_setf(o + (27 << 2), y +  -54.687 * s);
			_setf(o + (28 << 2), x +   81.786 * s);
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
			_setf(o + ( 0 << 2), x +   54.882 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   35.106 * s);
			_setf(o + ( 3 << 2), y +  -28.076 * s);
			_setf(o + ( 4 << 2), x +   55.907 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   45.311 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   29.394 * s);
			_setf(o + ( 9 << 2), y +  -21.484 * s);
			_setf(o + (10 << 2), x +   13.476 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    2.880 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   24.120 * s);
			_setf(o + (15 << 2), y +  -28.613 * s);
			_setf(o + (16 << 2), x +    4.687 * s);
			_setf(o + (17 << 2), y +  -54.687 * s);
			_setf(o + (18 << 2), x +   15.283 * s);
			_setf(o + (19 << 2), y +  -54.687 * s);
			_setf(o + (20 << 2), x +   29.784 * s);
			_setf(o + (21 << 2), y +  -35.205 * s);
			_setf(o + (22 << 2), x +   44.286 * s);
			_setf(o + (23 << 2), y +  -54.687 * s);
			_setf(o + (24 << 2), x +   54.882 * s);
			_setf(o + (25 << 2), y +  -54.687 * s);
			_setf(o + (26 << 2), x +   59.178 * s);
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
			_setf(o + ( 0 << 2), x +   32.178 * s);
			_setf(o + ( 1 << 2), y +    5.078 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   32.178 * s,y +    5.078 * s,x +   29.571 * s,y +   11.562 * s,x +   27.165 * s,y +   15.836 * s,x +   24.756 * s,y +   17.822 * s, threshold);
			_bez(x +   24.756 * s,y +   17.822 * s,x +   22.347 * s,y +   19.808 * s,x +   19.124 * s,y +   20.800 * s,x +   15.088 * s,y +   20.800 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    7.910 * s);
			_setf(o + ( 1 << 2), y +   20.800 * s);
			_setf(o + ( 2 << 2), x +    7.910 * s);
			_setf(o + ( 3 << 2), y +   13.281 * s);
			_setf(o + ( 4 << 2), x +   13.184 * s);
			_setf(o + ( 5 << 2), y +   13.281 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   13.184 * s,y +   13.281 * s,x +   15.658 * s,y +   13.281 * s,x +   17.578 * s,y +   12.695 * s,x +   18.945 * s,y +   11.523 * s, threshold);
			_bez(x +   18.945 * s,y +   11.523 * s,x +   20.313 * s,y +   10.351 * s,x +   21.780 * s,y +    7.567 * s,x +   23.486 * s,y +    3.223 * s, threshold);
			o = _posf(16);
			_setf(o + ( 0 << 2), x +   25.098 * s);
			_setf(o + ( 1 << 2), y +   -0.879 * s);
			_setf(o + ( 2 << 2), x +    2.979 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   12.500 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   29.590 * s);
			_setf(o + ( 7 << 2), y +  -11.914 * s);
			_setf(o + ( 8 << 2), x +   46.679 * s);
			_setf(o + ( 9 << 2), y +  -54.687 * s);
			_setf(o + (10 << 2), x +   56.201 * s);
			_setf(o + (11 << 2), y +  -54.687 * s);
			_setf(o + (12 << 2), x +   32.178 * s);
			_setf(o + (13 << 2), y +    5.078 * s);
			_setf(o + (14 << 2), x +   59.179 * s);
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
			
			case 122:
			
			o = _posf(24);
			_setf(o + ( 0 << 2), x +    5.518 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   48.193 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   48.193 * s);
			_setf(o + ( 5 << 2), y +  -46.484 * s);
			_setf(o + ( 6 << 2), x +   14.404 * s);
			_setf(o + ( 7 << 2), y +   -7.178 * s);
			_setf(o + ( 8 << 2), x +   48.193 * s);
			_setf(o + ( 9 << 2), y +   -7.178 * s);
			_setf(o + (10 << 2), x +   48.193 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    4.297 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +    4.297 * s);
			_setf(o + (15 << 2), y +   -8.203 * s);
			_setf(o + (16 << 2), x +   38.085 * s);
			_setf(o + (17 << 2), y +  -47.509 * s);
			_setf(o + (18 << 2), x +    5.518 * s);
			_setf(o + (19 << 2), y +  -47.509 * s);
			_setf(o + (20 << 2), x +    5.518 * s);
			_setf(o + (21 << 2), y +  -54.687 * s);
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
			
			case 123:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   51.122 * s);
			_setf(o + ( 1 << 2), y +    9.277 * s);
			_setf(o + ( 2 << 2), x +   51.122 * s);
			_setf(o + ( 3 << 2), y +   16.308 * s);
			_setf(o + ( 4 << 2), x +   48.094 * s);
			_setf(o + ( 5 << 2), y +   16.308 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   48.094 * s,y +   16.308 * s,x +   39.989 * s,y +   16.308 * s,x +   34.561 * s,y +   15.104 * s,x +   31.811 * s,y +   12.695 * s, threshold);
			_bez(x +   31.811 * s,y +   12.695 * s,x +   29.060 * s,y +   10.286 * s,x +   27.685 * s,y +    5.485 * s,x +   27.685 * s,y +   -1.709 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   27.685 * s);
			_setf(o + ( 1 << 2), y +  -13.379 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   27.685 * s,y +  -13.379 * s,x +   27.685 * s,y +  -18.294 * s,x +   26.806 * s,y +  -21.696 * s,x +   25.048 * s,y +  -23.584 * s, threshold);
			_bez(x +   25.048 * s,y +  -23.584 * s,x +   23.290 * s,y +  -25.472 * s,x +   20.100 * s,y +  -26.416 * s,x +   15.478 * s,y +  -26.416 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   12.499 * s);
			_setf(o + ( 1 << 2), y +  -26.416 * s);
			_setf(o + ( 2 << 2), x +   12.499 * s);
			_setf(o + ( 3 << 2), y +  -33.398 * s);
			_setf(o + ( 4 << 2), x +   15.478 * s);
			_setf(o + ( 5 << 2), y +  -33.398 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   15.478 * s,y +  -33.398 * s,x +   20.132 * s,y +  -33.398 * s,x +   23.331 * s,y +  -34.334 * s,x +   25.072 * s,y +  -36.205 * s, threshold);
			_bez(x +   25.072 * s,y +  -36.205 * s,x +   26.814 * s,y +  -38.077 * s,x +   27.685 * s,y +  -41.438 * s,x +   27.685 * s,y +  -46.288 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   27.685 * s);
			_setf(o + ( 1 << 2), y +  -58.007 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   27.685 * s,y +  -58.007 * s,x +   27.685 * s,y +  -65.201 * s,x +   29.060 * s,y +  -69.994 * s,x +   31.811 * s,y +  -72.387 * s, threshold);
			_bez(x +   31.811 * s,y +  -72.387 * s,x +   34.561 * s,y +  -74.779 * s,x +   39.989 * s,y +  -75.975 * s,x +   48.094 * s,y +  -75.975 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   51.122 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   51.122 * s);
			_setf(o + ( 3 << 2), y +  -68.993 * s);
			_setf(o + ( 4 << 2), x +   47.802 * s);
			_setf(o + ( 5 << 2), y +  -68.993 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   47.802 * s,y +  -68.993 * s,x +   43.212 * s,y +  -68.993 * s,x +   40.217 * s,y +  -68.277 * s,x +   38.817 * s,y +  -66.845 * s, threshold);
			_bez(x +   38.817 * s,y +  -66.845 * s,x +   37.418 * s,y +  -65.412 * s,x +   36.718 * s,y +  -62.401 * s,x +   36.718 * s,y +  -57.812 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.718 * s);
			_setf(o + ( 1 << 2), y +  -45.702 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   36.718 * s,y +  -45.702 * s,x +   36.718 * s,y +  -40.592 * s,x +   35.977 * s,y +  -36.881 * s,x +   34.496 * s,y +  -34.570 * s, threshold);
			_bez(x +   34.496 * s,y +  -34.570 * s,x +   33.015 * s,y +  -32.259 * s,x +   30.484 * s,y +  -30.696 * s,x +   26.903 * s,y +  -29.882 * s, threshold);
			_bez(x +   26.903 * s,y +  -29.882 * s,x +   30.517 * s,y +  -29.003 * s,x +   33.056 * s,y +  -27.408 * s,x +   34.520 * s,y +  -25.097 * s, threshold);
			_bez(x +   34.520 * s,y +  -25.097 * s,x +   35.985 * s,y +  -22.786 * s,x +   36.718 * s,y +  -19.091 * s,x +   36.718 * s,y +  -14.013 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.718 * s);
			_setf(o + ( 1 << 2), y +   -1.904 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   36.718 * s,y +   -1.904 * s,x +   36.718 * s,y +    2.686 * s,x +   37.418 * s,y +    5.697 * s,x +   38.817 * s,y +    7.129 * s, threshold);
			_bez(x +   38.817 * s,y +    7.129 * s,x +   40.217 * s,y +    8.561 * s,x +   43.212 * s,y +    9.277 * s,x +   47.802 * s,y +    9.277 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   51.122 * s);
			_setf(o + ( 1 << 2), y +    9.277 * s);
			_setf(o + ( 2 << 2), x +   63.622 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 124:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   20.995 * s);
			_setf(o + ( 1 << 2), y +  -76.415 * s);
			_setf(o + ( 2 << 2), x +   20.995 * s);
			_setf(o + ( 3 << 2), y +   23.584 * s);
			_setf(o + ( 4 << 2), x +   12.695 * s);
			_setf(o + ( 5 << 2), y +   23.584 * s);
			_setf(o + ( 6 << 2), x +   12.695 * s);
			_setf(o + ( 7 << 2), y +  -76.415 * s);
			_setf(o + ( 8 << 2), x +   20.995 * s);
			_setf(o + ( 9 << 2), y +  -76.415 * s);
			_setf(o + (10 << 2), x +   33.690 * s);
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
			_setf(o + ( 1 << 2), y +    9.277 * s);
			_setf(o + ( 2 << 2), x +   15.918 * s);
			_setf(o + ( 3 << 2), y +    9.277 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   15.918 * s,y +    9.277 * s,x +   20.475 * s,y +    9.277 * s,x +   23.445 * s,y +    8.577 * s,x +   24.829 * s,y +    7.178 * s, threshold);
			_bez(x +   24.829 * s,y +    7.178 * s,x +   26.212 * s,y +    5.778 * s,x +   26.904 * s,y +    2.750 * s,x +   26.904 * s,y +   -1.904 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   26.904 * s);
			_setf(o + ( 1 << 2), y +  -14.013 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   26.904 * s,y +  -14.013 * s,x +   26.904 * s,y +  -19.091 * s,x +   27.636 * s,y +  -22.786 * s,x +   29.101 * s,y +  -25.097 * s, threshold);
			_bez(x +   29.101 * s,y +  -25.097 * s,x +   30.566 * s,y +  -27.408 * s,x +   33.105 * s,y +  -29.003 * s,x +   36.718 * s,y +  -29.882 * s, threshold);
			_bez(x +   36.718 * s,y +  -29.882 * s,x +   33.105 * s,y +  -30.696 * s,x +   30.566 * s,y +  -32.259 * s,x +   29.101 * s,y +  -34.570 * s, threshold);
			_bez(x +   29.101 * s,y +  -34.570 * s,x +   27.636 * s,y +  -36.881 * s,x +   26.904 * s,y +  -40.592 * s,x +   26.904 * s,y +  -45.702 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   26.904 * s);
			_setf(o + ( 1 << 2), y +  -57.812 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   26.904 * s,y +  -57.812 * s,x +   26.904 * s,y +  -62.434 * s,x +   26.212 * s,y +  -65.453 * s,x +   24.829 * s,y +  -66.869 * s, threshold);
			_bez(x +   24.829 * s,y +  -66.869 * s,x +   23.445 * s,y +  -68.285 * s,x +   20.475 * s,y +  -68.993 * s,x +   15.918 * s,y +  -68.993 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   12.500 * s);
			_setf(o + ( 1 << 2), y +  -68.993 * s);
			_setf(o + ( 2 << 2), x +   12.500 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   15.576 * s);
			_setf(o + ( 5 << 2), y +  -75.975 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   15.576 * s,y +  -75.975 * s,x +   23.681 * s,y +  -75.975 * s,x +   29.093 * s,y +  -74.779 * s,x +   31.811 * s,y +  -72.387 * s, threshold);
			_bez(x +   31.811 * s,y +  -72.387 * s,x +   34.529 * s,y +  -69.994 * s,x +   35.888 * s,y +  -65.201 * s,x +   35.888 * s,y +  -58.007 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   35.888 * s);
			_setf(o + ( 1 << 2), y +  -46.288 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   35.888 * s,y +  -46.288 * s,x +   35.888 * s,y +  -41.438 * s,x +   36.767 * s,y +  -38.077 * s,x +   38.525 * s,y +  -36.205 * s, threshold);
			_bez(x +   38.525 * s,y +  -36.205 * s,x +   40.283 * s,y +  -34.334 * s,x +   43.473 * s,y +  -33.398 * s,x +   48.095 * s,y +  -33.398 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   51.122 * s);
			_setf(o + ( 1 << 2), y +  -33.398 * s);
			_setf(o + ( 2 << 2), x +   51.122 * s);
			_setf(o + ( 3 << 2), y +  -26.416 * s);
			_setf(o + ( 4 << 2), x +   48.095 * s);
			_setf(o + ( 5 << 2), y +  -26.416 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   48.095 * s,y +  -26.416 * s,x +   43.473 * s,y +  -26.416 * s,x +   40.283 * s,y +  -25.472 * s,x +   38.525 * s,y +  -23.584 * s, threshold);
			_bez(x +   38.525 * s,y +  -23.584 * s,x +   36.767 * s,y +  -21.696 * s,x +   35.888 * s,y +  -18.294 * s,x +   35.888 * s,y +  -13.379 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   35.888 * s);
			_setf(o + ( 1 << 2), y +   -1.709 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   35.888 * s,y +   -1.709 * s,x +   35.888 * s,y +    5.485 * s,x +   34.529 * s,y +   10.286 * s,x +   31.811 * s,y +   12.695 * s, threshold);
			_bez(x +   31.811 * s,y +   12.695 * s,x +   29.093 * s,y +   15.104 * s,x +   23.681 * s,y +   16.308 * s,x +   15.576 * s,y +   16.308 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   12.500 * s);
			_setf(o + ( 1 << 2), y +   16.308 * s);
			_setf(o + ( 2 << 2), x +   12.500 * s);
			_setf(o + ( 3 << 2), y +    9.277 * s);
			_setf(o + ( 4 << 2), x +   63.622 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 126:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   73.192 * s);
			_setf(o + ( 1 << 2), y +  -39.892 * s);
			_setf(o + ( 2 << 2), x +   73.192 * s);
			_setf(o + ( 3 << 2), y +  -31.201 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   73.192 * s,y +  -31.201 * s,x +   69.774 * s,y +  -28.629 * s,x +   66.609 * s,y +  -26.790 * s,x +   63.695 * s,y +  -25.683 * s, threshold);
			_bez(x +   63.695 * s,y +  -25.683 * s,x +   60.782 * s,y +  -24.576 * s,x +   57.746 * s,y +  -24.023 * s,x +   54.589 * s,y +  -24.023 * s, threshold);
			_bez(x +   54.589 * s,y +  -24.023 * s,x +   51.008 * s,y +  -24.023 * s,x +   46.846 * s,y +  -24.995 * s,x +   42.089 * s,y +  -26.904 * s, threshold);
			_bez(x +   42.089 * s,y +  -26.904 * s,x +   41.736 * s,y +  -27.046 * s,x +   41.470 * s,y +  -27.129 * s,x +   41.308 * s,y +  -27.197 * s, threshold);
			_bez(x +   41.308 * s,y +  -27.197 * s,x +   41.079 * s,y +  -27.292 * s,x +   40.713 * s,y +  -27.399 * s,x +   40.234 * s,y +  -27.587 * s, threshold);
			_bez(x +   40.234 * s,y +  -27.587 * s,x +   35.178 * s,y +  -29.580 * s,x +   31.136 * s,y +  -30.615 * s,x +   28.076 * s,y +  -30.615 * s, threshold);
			_bez(x +   28.076 * s,y +  -30.615 * s,x +   25.211 * s,y +  -30.615 * s,x +   22.379 * s,y +  -29.988 * s,x +   19.580 * s,y +  -28.735 * s, threshold);
			_bez(x +   19.580 * s,y +  -28.735 * s,x +   16.780 * s,y +  -27.482 * s,x +   13.786 * s,y +  -25.504 * s,x +   10.596 * s,y +  -22.802 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   10.596 * s);
			_setf(o + ( 1 << 2), y +  -31.494 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   10.596 * s,y +  -31.494 * s,x +   14.013 * s,y +  -34.065 * s,x +   17.179 * s,y +  -35.913 * s,x +   20.092 * s,y +  -37.036 * s, threshold);
			_bez(x +   20.092 * s,y +  -37.036 * s,x +   23.006 * s,y +  -38.159 * s,x +   26.041 * s,y +  -38.720 * s,x +   29.199 * s,y +  -38.720 * s, threshold);
			_bez(x +   29.199 * s,y +  -38.720 * s,x +   32.779 * s,y +  -38.720 * s,x +   36.962 * s,y +  -37.741 * s,x +   41.747 * s,y +  -35.790 * s, threshold);
			_bez(x +   41.747 * s,y +  -35.790 * s,x +   42.072 * s,y +  -35.658 * s,x +   42.316 * s,y +  -35.560 * s,x +   42.480 * s,y +  -35.497 * s, threshold);
			_bez(x +   42.480 * s,y +  -35.497 * s,x +   42.739 * s,y +  -35.398 * s,x +   43.104 * s,y +  -35.285 * s,x +   43.554 * s,y +  -35.107 * s, threshold);
			_bez(x +   43.554 * s,y +  -35.107 * s,x +   48.606 * s,y +  -33.104 * s,x +   52.652 * s,y +  -32.080 * s,x +   55.712 * s,y +  -32.080 * s, threshold);
			_bez(x +   55.712 * s,y +  -32.080 * s,x +   58.511 * s,y +  -32.080 * s,x +   61.287 * s,y +  -32.698 * s,x +   64.037 * s,y +  -33.935 * s, threshold);
			_bez(x +   64.037 * s,y +  -33.935 * s,x +   66.788 * s,y +  -35.172 * s,x +   69.839 * s,y +  -37.158 * s,x +   73.192 * s,y +  -39.892 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   83.788 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
		}
	}
	#end
}