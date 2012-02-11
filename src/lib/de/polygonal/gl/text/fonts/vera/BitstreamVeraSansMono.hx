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

class BitstreamVeraSansMono extends de.polygonal.gl.text.MonospaceVectorFont
{
	public function new()
	{
		#if font_inline
		super(2048, 1901, -483, 1233, BOUNDS_TABLE);
		#else
		super(
		"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"+
		"");
		#end
	}
	
	#if font_inline
	static var BOUNDS_TABLE:Array<Float> =
	[
		  33,     25.195,    -72.899,     35.107,          0,
		  34,     16.504,    -72.899,     43.701,    -45.800,
		  35,      0.098,    -71.776,     60.009,          0,
		  36,      9.278,    -75.975,     54.394,     14.697,
		  37,      1.611,    -69.921,     58.592,          0,
		  38,      2.783,    -74.218,     59.618,      1.416,
		  39,     25.781,    -72.899,     34.277,    -45.800,
		  40,     20.800,    -75.878,     43.212,     13.183,
		  41,     16.992,    -75.878,     39.404,     13.183,
		  42,      8.105,    -74.218,     52.099,    -28.613,
		  43,      4.297,    -57.177,     55.908,     -5.517,
		  44,     19.678,    -14.795,     36.816,     14.013,
		  45,     17.382,    -31.396,     42.821,    -23.388,
		  46,     23.876,    -14.892,     36.181,          0,
		  47,      4.980,    -72.899,     52.685,      9.277,
		  48,      6.494,    -74.218,     53.710,      1.416,
		  49,     12.011,    -72.899,     53.417,          0,
		  50,      7.422,    -74.218,     51.708,          0,
		  51,      6.690,    -74.218,     52.685,      1.416,
		  52,      4.981,    -72.899,     55.420,          0,
		  53,      6.982,    -72.899,     52.196,      1.416,
		  54,      6.494,    -74.218,     53.710,      1.416,
		  55,      6.787,    -72.899,     52.685,          0,
		  56,      6.396,    -74.218,     53.808,      1.416,
		  57,      6.201,    -74.218,     53.417,      1.416,
		  58,     23.877,    -51.904,     36.181,          0,
		  59,     19.678,    -51.904,     36.816,     14.013,
		  60,      4.297,    -55.810,     55.908,     -6.885,
		  61,      4.296,    -45.409,     55.907,    -17.187,
		  62,      4.297,    -55.810,     55.907,     -6.885,
		  63,     11.914,    -74.218,     50.780,          0,
		  64,      1.318,    -68.114,     57.519,     15.576,
		  65,      1.807,    -72.899,     58.397,          0,
		  66,      8.105,    -72.899,     55.517,          0,
		  67,      6.787,    -74.218,     52.392,      1.416,
		  68,      6.690,    -72.899,     54.004,          0,
		  69,      9.619,    -72.899,     53.807,          0,
		  70,     11.377,    -72.899,     54.296,          0,
		  71,      4.980,    -74.218,     53.905,      1.416,
		  72,      6.689,    -72.899,     53.515,          0,
		  73,      9.814,    -72.899,     50.292,          0,
		  74,      5.322,    -72.899,     46.679,      1.416,
		  75,      6.690,    -72.899,     59.814,          0,
		  76,     10.498,    -72.899,     55.615,          0,
		  77,      4.199,    -72.899,     55.907,          0,
		  78,      6.787,    -72.899,     53.417,          0,
		  79,      5.713,    -74.218,     54.491,      1.416,
		  80,      9.619,    -72.899,     55.712,          0,
		  81,      5.713,    -74.218,     54.491,     13.183,
		  82,      6.982,    -72.899,     60.204,          0,
		  83,      6.787,    -74.218,     53.613,      1.416,
		  84,      2.295,    -72.899,     57.910,          0,
		  85,      7.177,    -72.899,     52.977,      1.416,
		  86,      2.783,    -72.899,     57.421,          0,
		  87,          0,    -72.899,     60.204,          0,
		  88,      0.879,    -72.899,     59.276,          0,
		  89,      1.807,    -72.899,     58.397,          0,
		  90,      7.617,    -72.899,     57.079,          0,
		  91,     22.607,    -75.975,     43.310,     13.183,
		  92,      4.981,    -72.899,     52.685,      9.277,
		  93,     16.894,    -75.975,     37.597,     13.183,
		  94,      3.515,    -72.899,     56.688,    -45.702,
		  95,          0,     19.677,     49.999,     23.584,
		  96,     13.623,    -79.979,     37.011,    -61.620,
		  97,      6.494,    -56.005,     51.708,      1.416,
		  98,      9.424,    -75.975,     54.296,      1.416,
		  99,      9.522,    -56.005,     51.806,      1.416,
		 100,      6.006,    -75.975,     50.879,      1.416,
		 101,      6.005,    -56.005,     54.296,      1.416,
		 102,      9.521,    -75.975,     51.903,          0,
		 103,      6.006,    -56.005,     50.878,     21.484,
		 104,      9.521,    -75.975,     51.318,          0,
		 105,      8.691,    -75.975,     53.319,          0,
		 106,      9.082,    -75.975,     38.281,     20.800,
		 107,     11.524,    -75.975,     58.691,          0,
		 108,      7.813,    -76.512,     50.488,          0,
		 109,      5.322,    -56.005,     55.419,          0,
		 110,      9.521,    -56.005,     51.317,          0,
		 111,      6.689,    -56.005,     53.515,      1.416,
		 112,      9.277,    -56.005,     54.101,     20.800,
		 113,      6.689,    -55.810,     51.513,     20.996,
		 114,     17.676,    -56.005,     56.396,          0,
		 115,     10.401,    -56.005,     50.292,      1.416,
		 116,      6.397,    -70.214,     50.390,          0,
		 117,      9.521,    -54.589,     51.317,      1.416,
		 118,      4.882,    -54.687,     55.321,          0,
		 119,          0,    -54.687,     60.204,          0,
		 120,      3.711,    -54.687,     56.493,          0,
		 121,      5.078,    -54.687,     56.298,     20.800,
		 122,      9.912,    -54.784,     50.781,          0,
		 123,     10.791,    -75.975,     49.414,     16.308,
		 124,     25.879,    -76.415,     34.277,     23.584,
		 125,     10.790,    -75.975,     49.413,     16.308,
		 126,      4.297,    -38.085,     55.907,    -24.023
	];

	override function _draw(charCode:Int, x:Float, y:Float, s:Float, threshold:Float):Void
	{
		var o = 0;
		switch (charCode)
		{			
			case 33:
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +   25.195 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   35.107 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   35.107 * s);
			_setf(o + ( 5 << 2), y +  -40.917 * s);
			_setf(o + ( 6 << 2), x +   34.081 * s);
			_setf(o + ( 7 << 2), y +  -23.486 * s);
			_setf(o + ( 8 << 2), x +   26.220 * s);
			_setf(o + ( 9 << 2), y +  -23.486 * s);
			_setf(o + (10 << 2), x +   25.195 * s);
			_setf(o + (11 << 2), y +  -40.917 * s);
			_setf(o + (12 << 2), x +   25.195 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   25.195 * s);
			_setf(o + (15 << 2), y +  -12.402 * s);
			_setf(o + (16 << 2), x +   35.107 * s);
			_setf(o + (17 << 2), y +  -12.402 * s);
			_setf(o + (18 << 2), x +   35.107 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   25.195 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   25.195 * s);
			_setf(o + (23 << 2), y +  -12.402 * s);
			_setf(o + (24 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   43.701 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   43.701 * s);
			_setf(o + ( 3 << 2), y +  -45.800 * s);
			_setf(o + ( 4 << 2), x +   35.205 * s);
			_setf(o + ( 5 << 2), y +  -45.800 * s);
			_setf(o + ( 6 << 2), x +   35.205 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   43.701 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   25.000 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   25.000 * s);
			_setf(o + (13 << 2), y +  -45.800 * s);
			_setf(o + (14 << 2), x +   16.504 * s);
			_setf(o + (15 << 2), y +  -45.800 * s);
			_setf(o + (16 << 2), x +   16.504 * s);
			_setf(o + (17 << 2), y +  -72.899 * s);
			_setf(o + (18 << 2), x +   25.000 * s);
			_setf(o + (19 << 2), y +  -72.899 * s);
			_setf(o + (20 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   33.398 * s);
			_setf(o + ( 1 << 2), y +  -71.776 * s);
			_setf(o + ( 2 << 2), x +   28.320 * s);
			_setf(o + ( 3 << 2), y +  -51.513 * s);
			_setf(o + ( 4 << 2), x +   40.283 * s);
			_setf(o + ( 5 << 2), y +  -51.513 * s);
			_setf(o + ( 6 << 2), x +   45.410 * s);
			_setf(o + ( 7 << 2), y +  -71.776 * s);
			_setf(o + ( 8 << 2), x +   53.222 * s);
			_setf(o + ( 9 << 2), y +  -71.776 * s);
			_setf(o + (10 << 2), x +   48.095 * s);
			_setf(o + (11 << 2), y +  -51.513 * s);
			_setf(o + (12 << 2), x +   60.009 * s);
			_setf(o + (13 << 2), y +  -51.513 * s);
			_setf(o + (14 << 2), x +   60.009 * s);
			_setf(o + (15 << 2), y +  -43.993 * s);
			_setf(o + (16 << 2), x +   46.289 * s);
			_setf(o + (17 << 2), y +  -43.993 * s);
			_setf(o + (18 << 2), x +   42.187 * s);
			_setf(o + (19 << 2), y +  -27.685 * s);
			_setf(o + (20 << 2), x +   54.394 * s);
			_setf(o + (21 << 2), y +  -27.685 * s);
			_setf(o + (22 << 2), x +   54.394 * s);
			_setf(o + (23 << 2), y +  -20.215 * s);
			_setf(o + (24 << 2), x +   40.283 * s);
			_setf(o + (25 << 2), y +  -20.215 * s);
			_setf(o + (26 << 2), x +   35.205 * s);
			_setf(o + (27 << 2), y +       0. * s);
			_setf(o + (28 << 2), x +   27.392 * s);
			_setf(o + (29 << 2), y +       0. * s);
			_setf(o + (30 << 2), x +   32.519 * s);
			_setf(o + (31 << 2), y +  -20.215 * s);
			_setf(o + (32 << 2), x +   20.508 * s);
			_setf(o + (33 << 2), y +  -20.215 * s);
			_setf(o + (34 << 2), x +   15.381 * s);
			_setf(o + (35 << 2), y +       0. * s);
			_setf(o + (36 << 2), x +    7.617 * s);
			_setf(o + (37 << 2), y +       0. * s);
			_setf(o + (38 << 2), x +   12.695 * s);
			_setf(o + (39 << 2), y +  -20.215 * s);
			_setf(o + (40 << 2), x +    0.098 * s);
			_setf(o + (41 << 2), y +  -20.215 * s);
			_setf(o + (42 << 2), x +    0.098 * s);
			_setf(o + (43 << 2), y +  -27.685 * s);
			_setf(o + (44 << 2), x +   14.600 * s);
			_setf(o + (45 << 2), y +  -27.685 * s);
			_setf(o + (46 << 2), x +   18.701 * s);
			_setf(o + (47 << 2), y +  -43.993 * s);
			_setf(o + (48 << 2), x +    5.713 * s);
			_setf(o + (49 << 2), y +  -43.993 * s);
			_setf(o + (50 << 2), x +    5.713 * s);
			_setf(o + (51 << 2), y +  -51.513 * s);
			_setf(o + (52 << 2), x +   20.508 * s);
			_setf(o + (53 << 2), y +  -51.513 * s);
			_setf(o + (54 << 2), x +   25.586 * s);
			_setf(o + (55 << 2), y +  -71.776 * s);
			_setf(o + (56 << 2), x +   33.398 * s);
			_setf(o + (57 << 2), y +  -71.776 * s);
			_setf(o + (58 << 2), x +   38.476 * s);
			_setf(o + (59 << 2), y +  -43.993 * s);
			_setf(o + (60 << 2), x +   26.514 * s);
			_setf(o + (61 << 2), y +  -43.993 * s);
			_setf(o + (62 << 2), x +   22.412 * s);
			_setf(o + (63 << 2), y +  -27.685 * s);
			_setf(o + (64 << 2), x +   34.424 * s);
			_setf(o + (65 << 2), y +  -27.685 * s);
			_setf(o + (66 << 2), x +   38.476 * s);
			_setf(o + (67 << 2), y +  -43.993 * s);
			_setf(o + (68 << 2), x +   60.204 * s);
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
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   33.789 * s);
			_setf(o + ( 1 << 2), y +  -28.320 * s);
			_setf(o + ( 2 << 2), x +   33.789 * s);
			_setf(o + ( 3 << 2), y +   -7.129 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   33.789 * s,y +   -7.129 * s,x +   37.370 * s,y +   -7.226 * s,x +   40.169 * s,y +   -8.219 * s,x +   42.187 * s,y +  -10.107 * s, threshold);
			_bez(x +   42.187 * s,y +  -10.107 * s,x +   44.205 * s,y +  -11.995 * s,x +   45.215 * s,y +  -14.567 * s,x +   45.215 * s,y +  -17.822 * s, threshold);
			_bez(x +   45.215 * s,y +  -17.822 * s,x +   45.215 * s,y +  -20.849 * s,x +   44.303 * s,y +  -23.201 * s,x +   42.480 * s,y +  -24.878 * s, threshold);
			_bez(x +   42.480 * s,y +  -24.878 * s,x +   40.657 * s,y +  -26.554 * s,x +   37.760 * s,y +  -27.701 * s,x +   33.789 * s,y +  -28.320 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   28.906 * s);
			_setf(o + ( 1 << 2), y +  -37.597 * s);
			_setf(o + ( 2 << 2), x +   28.906 * s);
			_setf(o + ( 3 << 2), y +  -57.763 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   28.906 * s,y +  -57.763 * s,x +   25.521 * s,y +  -57.633 * s,x +   22.876 * s,y +  -56.656 * s,x +   20.972 * s,y +  -54.833 * s, threshold);
			_bez(x +   20.972 * s,y +  -54.833 * s,x +   19.068 * s,y +  -53.010 * s,x +   18.115 * s,y +  -50.569 * s,x +   18.115 * s,y +  -47.509 * s, threshold);
			_bez(x +   18.115 * s,y +  -47.509 * s,x +   18.115 * s,y +  -44.710 * s,x +   19.002 * s,y +  -42.496 * s,x +   20.776 * s,y +  -40.869 * s, threshold);
			_bez(x +   20.776 * s,y +  -40.869 * s,x +   22.551 * s,y +  -39.241 * s,x +   25.260 * s,y +  -38.150 * s,x +   28.906 * s,y +  -37.597 * s, threshold);
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
			_bez(x +   28.857 * s,y +       0. * s,x +   25.537 * s,y +   -0.163 * s,x +   22.241 * s,y +   -0.618 * s,x +   18.970 * s,y +   -1.367 * s, threshold);
			_bez(x +   18.970 * s,y +   -1.367 * s,x +   15.698 * s,y +   -2.116 * s,x +   12.468 * s,y +   -3.157 * s,x +    9.278 * s,y +   -4.492 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    9.278 * s);
			_setf(o + ( 1 << 2), y +  -13.281 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    9.278 * s,y +  -13.281 * s,x +   12.533 * s,y +  -11.263 * s,x +   15.812 * s,y +   -9.717 * s,x +   19.116 * s,y +   -8.642 * s, threshold);
			_bez(x +   19.116 * s,y +   -8.642 * s,x +   22.420 * s,y +   -7.568 * s,x +   25.684 * s,y +   -6.999 * s,x +   28.906 * s,y +   -6.933 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   28.906 * s);
			_setf(o + ( 1 << 2), y +  -29.296 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   28.906 * s,y +  -29.296 * s,x +   22.396 * s,y +  -30.306 * s,x +   17.497 * s,y +  -32.291 * s,x +   14.209 * s,y +  -35.253 * s, threshold);
			_bez(x +   14.209 * s,y +  -35.253 * s,x +   10.921 * s,y +  -38.216 * s,x +    9.278 * s,y +  -42.138 * s,x +    9.278 * s,y +  -47.021 * s, threshold);
			_bez(x +    9.278 * s,y +  -47.021 * s,x +    9.278 * s,y +  -52.131 * s,x +   10.995 * s,y +  -56.208 * s,x +   14.429 * s,y +  -59.252 * s, threshold);
			_bez(x +   14.429 * s,y +  -59.252 * s,x +   17.863 * s,y +  -62.296 * s,x +   22.689 * s,y +  -64.045 * s,x +   28.906 * s,y +  -64.501 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   28.906 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   33.789 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   33.838 * s);
			_setf(o + ( 5 << 2), y +  -64.501 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   33.838 * s,y +  -64.501 * s,x +   36.409 * s,y +  -64.338 * s,x +   39.014 * s,y +  -64.013 * s,x +   41.650 * s,y +  -63.524 * s, threshold);
			_bez(x +   41.650 * s,y +  -63.524 * s,x +   44.287 * s,y +  -63.036 * s,x +   46.972 * s,y +  -62.369 * s,x +   49.707 * s,y +  -61.522 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   49.707 * s);
			_setf(o + ( 1 << 2), y +  -53.075 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   49.707 * s,y +  -53.075 * s,x +   46.940 * s,y +  -54.475 * s,x +   44.246 * s,y +  -55.557 * s,x +   41.626 * s,y +  -56.322 * s, threshold);
			_bez(x +   41.626 * s,y +  -56.322 * s,x +   39.005 * s,y +  -57.087 * s,x +   36.393 * s,y +  -57.535 * s,x +   33.789 * s,y +  -57.665 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   33.789 * s);
			_setf(o + ( 1 << 2), y +  -36.621 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   33.789 * s,y +  -36.621 * s,x +   40.495 * s,y +  -35.611 * s,x +   45.605 * s,y +  -33.528 * s,x +   49.121 * s,y +  -30.371 * s, threshold);
			_bez(x +   49.121 * s,y +  -30.371 * s,x +   52.636 * s,y +  -27.213 * s,x +   54.394 * s,y +  -23.128 * s,x +   54.394 * s,y +  -18.115 * s, threshold);
			_bez(x +   54.394 * s,y +  -18.115 * s,x +   54.394 * s,y +  -13.102 * s,x +   52.498 * s,y +   -8.919 * s,x +   48.706 * s,y +   -5.566 * s, threshold);
			_bez(x +   48.706 * s,y +   -5.566 * s,x +   44.913 * s,y +   -2.214 * s,x +   39.958 * s,y +   -0.391 * s,x +   33.838 * s,y +   -0.098 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   33.789 * s);
			_setf(o + ( 1 << 2), y +   14.697 * s);
			_setf(o + ( 2 << 2), x +   60.205 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 37:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   33.983 * s);
			_setf(o + ( 1 << 2), y +  -15.576 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   33.983 * s,y +  -15.576 * s,x +   33.983 * s,y +  -13.037 * s,x +   34.838 * s,y +  -10.905 * s,x +   36.547 * s,y +   -9.180 * s, threshold);
			_bez(x +   36.547 * s,y +   -9.180 * s,x +   38.256 * s,y +   -7.454 * s,x +   40.380 * s,y +   -6.592 * s,x +   42.919 * s,y +   -6.592 * s, threshold);
			_bez(x +   42.919 * s,y +   -6.592 * s,x +   45.425 * s,y +   -6.592 * s,x +   47.549 * s,y +   -7.462 * s,x +   49.291 * s,y +   -9.204 * s, threshold);
			_bez(x +   49.291 * s,y +   -9.204 * s,x +   51.032 * s,y +  -10.945 * s,x +   51.903 * s,y +  -13.069 * s,x +   51.903 * s,y +  -15.576 * s, threshold);
			_bez(x +   51.903 * s,y +  -15.576 * s,x +   51.903 * s,y +  -18.082 * s,x +   51.024 * s,y +  -20.215 * s,x +   49.266 * s,y +  -21.972 * s, threshold);
			_bez(x +   49.266 * s,y +  -21.972 * s,x +   47.509 * s,y +  -23.730 * s,x +   45.393 * s,y +  -24.609 * s,x +   42.919 * s,y +  -24.609 * s, threshold);
			_bez(x +   42.919 * s,y +  -24.609 * s,x +   40.380 * s,y +  -24.609 * s,x +   38.256 * s,y +  -23.746 * s,x +   36.547 * s,y +  -22.021 * s, threshold);
			_bez(x +   36.547 * s,y +  -22.021 * s,x +   34.838 * s,y +  -20.296 * s,x +   33.983 * s,y +  -18.147 * s,x +   33.983 * s,y +  -15.576 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   27.392 * s);
			_setf(o + ( 1 << 2), y +  -15.576 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   27.392 * s,y +  -15.576 * s,x +   27.392 * s,y +  -19.970 * s,x +   28.889 * s,y +  -23.673 * s,x +   31.884 * s,y +  -26.684 * s, threshold);
			_bez(x +   31.884 * s,y +  -26.684 * s,x +   34.879 * s,y +  -29.695 * s,x +   38.557 * s,y +  -31.201 * s,x +   42.919 * s,y +  -31.201 * s, threshold);
			_bez(x +   42.919 * s,y +  -31.201 * s,x +   45.002 * s,y +  -31.201 * s,x +   46.980 * s,y +  -30.810 * s,x +   48.851 * s,y +  -30.029 * s, threshold);
			_bez(x +   48.851 * s,y +  -30.029 * s,x +   50.723 * s,y +  -29.248 * s,x +   52.416 * s,y +  -28.116 * s,x +   53.905 * s,y +  -26.611 * s, threshold);
			_bez(x +   53.905 * s,y +  -26.611 * s,x +   55.410 * s,y +  -25.089 * s,x +   56.558 * s,y +  -23.372 * s,x +   57.372 * s,y +  -21.484 * s, threshold);
			_bez(x +   57.372 * s,y +  -21.484 * s,x +   58.186 * s,y +  -19.596 * s,x +   58.592 * s,y +  -17.627 * s,x +   58.592 * s,y +  -15.576 * s, threshold);
			_bez(x +   58.592 * s,y +  -15.576 * s,x +   58.592 * s,y +  -11.247 * s,x +   57.079 * s,y +   -7.568 * s,x +   54.051 * s,y +   -4.541 * s, threshold);
			_bez(x +   54.051 * s,y +   -4.541 * s,x +   51.024 * s,y +   -1.514 * s,x +   47.313 * s,y +       0. * s,x +   42.919 * s,y +       0. * s, threshold);
			_bez(x +   42.919 * s,y +       0. * s,x +   38.492 * s,y +       0. * s,x +   34.797 * s,y +   -1.489 * s,x +   31.835 * s,y +   -4.468 * s, threshold);
			_bez(x +   31.835 * s,y +   -4.468 * s,x +   28.873 * s,y +   -7.446 * s,x +   27.392 * s,y +  -11.149 * s,x +   27.392 * s,y +  -15.576 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +    5.908 * s);
			_setf(o + ( 1 << 2), y +  -22.705 * s);
			_setf(o + ( 2 << 2), x +    4.199 * s);
			_setf(o + ( 3 << 2), y +  -27.392 * s);
			_setf(o + ( 4 << 2), x +   55.077 * s);
			_setf(o + ( 5 << 2), y +  -47.802 * s);
			_setf(o + ( 6 << 2), x +   57.079 * s);
			_setf(o + ( 7 << 2), y +  -43.115 * s);
			_setf(o + ( 8 << 2), x +    5.908 * s);
			_setf(o + ( 9 << 2), y +  -22.705 * s);
			_setf(o + (10 << 2), x +    8.203 * s);
			_setf(o + (11 << 2), y +  -54.296 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_bez(x +    8.203 * s,y +  -54.296 * s,x +    8.203 * s,y +  -51.725 * s,x +    9.057 * s,y +  -49.584 * s,x +   10.766 * s,y +  -47.875 * s, threshold);
			_bez(x +   10.766 * s,y +  -47.875 * s,x +   12.475 * s,y +  -46.166 * s,x +   14.615 * s,y +  -45.312 * s,x +   17.187 * s,y +  -45.312 * s, threshold);
			_bez(x +   17.187 * s,y +  -45.312 * s,x +   19.693 * s,y +  -45.312 * s,x +   21.825 * s,y +  -46.183 * s,x +   23.583 * s,y +  -47.924 * s, threshold);
			_bez(x +   23.583 * s,y +  -47.924 * s,x +   25.341 * s,y +  -49.666 * s,x +   26.220 * s,y +  -51.790 * s,x +   26.220 * s,y +  -54.296 * s, threshold);
			_bez(x +   26.220 * s,y +  -54.296 * s,x +   26.220 * s,y +  -56.803 * s,x +   25.341 * s,y +  -58.926 * s,x +   23.583 * s,y +  -60.668 * s, threshold);
			_bez(x +   23.583 * s,y +  -60.668 * s,x +   21.825 * s,y +  -62.410 * s,x +   19.693 * s,y +  -63.280 * s,x +   17.187 * s,y +  -63.280 * s, threshold);
			_bez(x +   17.187 * s,y +  -63.280 * s,x +   14.680 * s,y +  -63.280 * s,x +   12.556 * s,y +  -62.418 * s,x +   10.815 * s,y +  -60.692 * s, threshold);
			_bez(x +   10.815 * s,y +  -60.692 * s,x +    9.073 * s,y +  -58.967 * s,x +    8.203 * s,y +  -56.835 * s,x +    8.203 * s,y +  -54.296 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    1.611 * s);
			_setf(o + ( 1 << 2), y +  -54.296 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +    1.611 * s,y +  -54.296 * s,x +    1.611 * s,y +  -58.691 * s,x +    3.108 * s,y +  -62.393 * s,x +    6.103 * s,y +  -65.404 * s, threshold);
			_bez(x +    6.103 * s,y +  -65.404 * s,x +    9.098 * s,y +  -68.415 * s,x +   12.792 * s,y +  -69.921 * s,x +   17.187 * s,y +  -69.921 * s, threshold);
			_bez(x +   17.187 * s,y +  -69.921 * s,x +   19.270 * s,y +  -69.921 * s,x +   21.264 * s,y +  -69.530 * s,x +   23.168 * s,y +  -68.749 * s, threshold);
			_bez(x +   23.168 * s,y +  -68.749 * s,x +   25.072 * s,y +  -67.968 * s,x +   26.757 * s,y +  -66.845 * s,x +   28.222 * s,y +  -65.380 * s, threshold);
			_bez(x +   28.222 * s,y +  -65.380 * s,x +   29.687 * s,y +  -63.915 * s,x +   30.818 * s,y +  -62.230 * s,x +   31.615 * s,y +  -60.326 * s, threshold);
			_bez(x +   31.615 * s,y +  -60.326 * s,x +   32.413 * s,y +  -58.422 * s,x +   32.812 * s,y +  -56.412 * s,x +   32.812 * s,y +  -54.296 * s, threshold);
			_bez(x +   32.812 * s,y +  -54.296 * s,x +   32.812 * s,y +  -49.934 * s,x +   31.298 * s,y +  -46.248 * s,x +   28.271 * s,y +  -43.237 * s, threshold);
			_bez(x +   28.271 * s,y +  -43.237 * s,x +   25.243 * s,y +  -40.226 * s,x +   21.549 * s,y +  -38.720 * s,x +   17.187 * s,y +  -38.720 * s, threshold);
			_bez(x +   17.187 * s,y +  -38.720 * s,x +   12.792 * s,y +  -38.720 * s,x +    9.098 * s,y +  -40.217 * s,x +    6.103 * s,y +  -43.212 * s, threshold);
			_bez(x +    6.103 * s,y +  -43.212 * s,x +    3.108 * s,y +  -46.207 * s,x +    1.611 * s,y +  -49.902 * s,x +    1.611 * s,y +  -54.296 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 38:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   26.708 * s);
			_setf(o + ( 1 << 2), y +  -44.286 * s);
			_setf(o + ( 2 << 2), x +   47.020 * s);
			_setf(o + ( 3 << 2), y +  -16.992 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   47.020 * s,y +  -16.992 * s,x +   48.290 * s,y +  -18.587 * s,x +   49.234 * s,y +  -20.605 * s,x +   49.852 * s,y +  -23.047 * s, threshold);
			_bez(x +   49.852 * s,y +  -23.047 * s,x +   50.471 * s,y +  -25.488 * s,x +   50.780 * s,y +  -28.401 * s,x +   50.780 * s,y +  -31.787 * s, threshold);
			_bez(x +   50.780 * s,y +  -31.787 * s,x +   50.780 * s,y +  -32.828 * s,x +   50.731 * s,y +  -34.488 * s,x +   50.634 * s,y +  -36.767 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   50.585 * s);
			_setf(o + ( 1 << 2), y +  -37.109 * s);
			_setf(o + ( 2 << 2), x +   58.593 * s);
			_setf(o + ( 3 << 2), y +  -37.109 * s);
			_setf(o + ( 4 << 2), x +   58.593 * s);
			_setf(o + ( 5 << 2), y +  -35.205 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   58.593 * s,y +  -35.205 * s,x +   58.593 * s,y +  -29.964 * s,x +   57.990 * s,y +  -25.366 * s,x +   56.786 * s,y +  -21.411 * s, threshold);
			_bez(x +   56.786 * s,y +  -21.411 * s,x +   55.582 * s,y +  -17.456 * s,x +   53.759 * s,y +  -14.046 * s,x +   51.317 * s,y +  -11.181 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   59.618 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   49.218 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   45.409 * s);
			_setf(o + ( 5 << 2), y +   -5.322 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   45.409 * s,y +   -5.322 * s,x +   42.707 * s,y +   -3.044 * s,x +   39.843 * s,y +   -1.351 * s,x +   36.816 * s,y +   -0.244 * s, threshold);
			_bez(x +   36.816 * s,y +   -0.244 * s,x +   33.788 * s,y +    0.863 * s,x +   30.549 * s,y +    1.416 * s,x +   27.099 * s,y +    1.416 * s, threshold);
			_bez(x +   27.099 * s,y +    1.416 * s,x +   20.067 * s,y +    1.416 * s,x +   14.257 * s,y +   -0.773 * s,x +    9.668 * s,y +   -5.151 * s, threshold);
			_bez(x +    9.668 * s,y +   -5.151 * s,x +    5.078 * s,y +   -9.529 * s,x +    2.783 * s,y +  -15.039 * s,x +    2.783 * s,y +  -21.679 * s, threshold);
			_bez(x +    2.783 * s,y +  -21.679 * s,x +    2.783 * s,y +  -26.139 * s,x +    3.906 * s,y +  -30.273 * s,x +    6.152 * s,y +  -34.081 * s, threshold);
			_bez(x +    6.152 * s,y +  -34.081 * s,x +    8.398 * s,y +  -37.890 * s,x +   11.783 * s,y +  -41.422 * s,x +   16.308 * s,y +  -44.677 * s, threshold);
			_bez(x +   16.308 * s,y +  -44.677 * s,x +   14.680 * s,y +  -47.021 * s,x +   13.476 * s,y +  -49.316 * s,x +   12.695 * s,y +  -51.562 * s, threshold);
			_bez(x +   12.695 * s,y +  -51.562 * s,x +   11.914 * s,y +  -53.808 * s,x +   11.523 * s,y +  -56.086 * s,x +   11.523 * s,y +  -58.398 * s, threshold);
			_bez(x +   11.523 * s,y +  -58.398 * s,x +   11.523 * s,y +  -63.280 * s,x +   13.142 * s,y +  -67.138 * s,x +   16.381 * s,y +  -69.970 * s, threshold);
			_bez(x +   16.381 * s,y +  -69.970 * s,x +   19.620 * s,y +  -72.802 * s,x +   24.056 * s,y +  -74.218 * s,x +   29.687 * s,y +  -74.218 * s, threshold);
			_bez(x +   29.687 * s,y +  -74.218 * s,x +   31.803 * s,y +  -74.218 * s,x +   33.927 * s,y +  -74.022 * s,x +   36.059 * s,y +  -73.632 * s, threshold);
			_bez(x +   36.059 * s,y +  -73.632 * s,x +   38.191 * s,y +  -73.241 * s,x +   40.396 * s,y +  -72.671 * s,x +   42.675 * s,y +  -71.923 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   42.675 * s);
			_setf(o + ( 1 << 2), y +  -62.987 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   42.675 * s,y +  -62.987 * s,x +   40.754 * s,y +  -64.257 * s,x +   38.777 * s,y +  -65.193 * s,x +   36.742 * s,y +  -65.795 * s, threshold);
			_bez(x +   36.742 * s,y +  -65.795 * s,x +   34.708 * s,y +  -66.397 * s,x +   32.568 * s,y +  -66.698 * s,x +   30.322 * s,y +  -66.698 * s, threshold);
			_bez(x +   30.322 * s,y +  -66.698 * s,x +   27.164 * s,y +  -66.698 * s,x +   24.674 * s,y +  -65.958 * s,x +   22.851 * s,y +  -64.477 * s, threshold);
			_bez(x +   22.851 * s,y +  -64.477 * s,x +   21.028 * s,y +  -62.995 * s,x +   20.117 * s,y +  -61.002 * s,x +   20.117 * s,y +  -58.495 * s, threshold);
			_bez(x +   20.117 * s,y +  -58.495 * s,x +   20.117 * s,y +  -56.575 * s,x +   20.589 * s,y +  -54.565 * s,x +   21.533 * s,y +  -52.465 * s, threshold);
			_bez(x +   21.533 * s,y +  -52.465 * s,x +   22.477 * s,y +  -50.365 * s,x +   24.209 * s,y +  -47.645 * s,x +   26.708 * s,y +  -44.286 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   20.312 * s);
			_setf(o + ( 1 << 2), y +  -39.208 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   20.312 * s,y +  -39.208 * s,x +   17.317 * s,y +  -36.832 * s,x +   15.079 * s,y +  -34.318 * s,x +   13.598 * s,y +  -31.665 * s, threshold);
			_bez(x +   13.598 * s,y +  -31.665 * s,x +   12.117 * s,y +  -29.012 * s,x +   11.377 * s,y +  -26.188 * s,x +   11.377 * s,y +  -23.193 * s, threshold);
			_bez(x +   11.377 * s,y +  -23.193 * s,x +   11.377 * s,y +  -18.278 * s,x +   13.004 * s,y +  -14.201 * s,x +   16.259 * s,y +  -10.962 * s, threshold);
			_bez(x +   16.259 * s,y +  -10.962 * s,x +   19.514 * s,y +   -7.723 * s,x +   23.665 * s,y +   -6.103 * s,x +   28.710 * s,y +   -6.103 * s, threshold);
			_bez(x +   28.710 * s,y +   -6.103 * s,x +   30.077 * s,y +   -6.103 * s,x +   31.510 * s,y +   -6.299 * s,x +   33.007 * s,y +   -6.689 * s, threshold);
			_bez(x +   33.007 * s,y +   -6.689 * s,x +   34.504 * s,y +   -7.080 * s,x +   35.977 * s,y +   -7.636 * s,x +   37.402 * s,y +   -8.398 * s, threshold);
			_bez(x +   37.402 * s,y +   -8.398 * s,x +   38.288 * s,y +   -8.873 * s,x +   39.005 * s,y +   -9.318 * s,x +   39.574 * s,y +   -9.692 * s, threshold);
			_bez(x +   39.574 * s,y +   -9.692 * s,x +   40.144 * s,y +  -10.067 * s,x +   40.689 * s,y +  -10.465 * s,x +   41.210 * s,y +  -10.889 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   20.312 * s);
			_setf(o + ( 1 << 2), y +  -39.208 * s);
			_setf(o + ( 2 << 2), x +   60.204 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 39:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   34.277 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   34.277 * s);
			_setf(o + ( 3 << 2), y +  -45.800 * s);
			_setf(o + ( 4 << 2), x +   25.781 * s);
			_setf(o + ( 5 << 2), y +  -45.800 * s);
			_setf(o + ( 6 << 2), x +   25.781 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   34.277 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   43.212 * s);
			_setf(o + ( 1 << 2), y +  -75.878 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   43.212 * s,y +  -75.878 * s,x +   38.883 * s,y +  -68.456 * s,x +   35.652 * s,y +  -61.059 * s,x +   33.520 * s,y +  -53.686 * s, threshold);
			_bez(x +   33.520 * s,y +  -53.686 * s,x +   31.388 * s,y +  -46.313 * s,x +   30.322 * s,y +  -38.883 * s,x +   30.322 * s,y +  -31.396 * s, threshold);
			_bez(x +   30.322 * s,y +  -31.396 * s,x +   30.322 * s,y +  -23.942 * s,x +   31.388 * s,y +  -16.520 * s,x +   33.520 * s,y +   -9.131 * s, threshold);
			_bez(x +   33.520 * s,y +   -9.131 * s,x +   35.652 * s,y +   -1.742 * s,x +   38.883 * s,y +    5.697 * s,x +   43.212 * s,y +   13.183 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   35.400 * s);
			_setf(o + ( 1 << 2), y +   13.183 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   35.400 * s,y +   13.183 * s,x +   30.485 * s,y +    5.436 * s,x +   26.823 * s,y +   -2.108 * s,x +   24.414 * s,y +   -9.448 * s, threshold);
			_bez(x +   24.414 * s,y +   -9.448 * s,x +   22.005 * s,y +  -16.788 * s,x +   20.800 * s,y +  -24.105 * s,x +   20.800 * s,y +  -31.396 * s, threshold);
			_bez(x +   20.800 * s,y +  -31.396 * s,x +   20.800 * s,y +  -38.655 * s,x +   22.005 * s,y +  -45.963 * s,x +   24.414 * s,y +  -53.319 * s, threshold);
			_bez(x +   24.414 * s,y +  -53.319 * s,x +   26.823 * s,y +  -60.676 * s,x +   30.485 * s,y +  -68.196 * s,x +   35.400 * s,y +  -75.878 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   43.212 * s);
			_setf(o + ( 1 << 2), y +  -75.878 * s);
			_setf(o + ( 2 << 2), x +   60.204 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 41:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   16.992 * s);
			_setf(o + ( 1 << 2), y +  -75.878 * s);
			_setf(o + ( 2 << 2), x +   24.804 * s);
			_setf(o + ( 3 << 2), y +  -75.878 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   24.804 * s,y +  -75.878 * s,x +   29.720 * s,y +  -68.196 * s,x +   33.382 * s,y +  -60.676 * s,x +   35.791 * s,y +  -53.319 * s, threshold);
			_bez(x +   35.791 * s,y +  -53.319 * s,x +   38.199 * s,y +  -45.963 * s,x +   39.404 * s,y +  -38.655 * s,x +   39.404 * s,y +  -31.396 * s, threshold);
			_bez(x +   39.404 * s,y +  -31.396 * s,x +   39.404 * s,y +  -24.072 * s,x +   38.199 * s,y +  -16.732 * s,x +   35.791 * s,y +   -9.375 * s, threshold);
			_bez(x +   35.791 * s,y +   -9.375 * s,x +   33.382 * s,y +   -2.018 * s,x +   29.720 * s,y +    5.501 * s,x +   24.804 * s,y +   13.183 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   16.992 * s);
			_setf(o + ( 1 << 2), y +   13.183 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   16.992 * s,y +   13.183 * s,x +   21.321 * s,y +    5.631 * s,x +   24.552 * s,y +   -1.839 * s,x +   26.684 * s,y +   -9.228 * s, threshold);
			_bez(x +   26.684 * s,y +   -9.228 * s,x +   28.816 * s,y +  -16.618 * s,x +   29.882 * s,y +  -24.007 * s,x +   29.882 * s,y +  -31.396 * s, threshold);
			_bez(x +   29.882 * s,y +  -31.396 * s,x +   29.882 * s,y +  -38.818 * s,x +   28.816 * s,y +  -46.223 * s,x +   26.684 * s,y +  -53.612 * s, threshold);
			_bez(x +   26.684 * s,y +  -53.612 * s,x +   24.552 * s,y +  -61.002 * s,x +   21.321 * s,y +  -68.423 * s,x +   16.992 * s,y +  -75.878 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 42:
			
			o = _posf(40);
			_setf(o + ( 0 << 2), x +   52.099 * s);
			_setf(o + ( 1 << 2), y +  -60.888 * s);
			_setf(o + ( 2 << 2), x +   34.619 * s);
			_setf(o + ( 3 << 2), y +  -51.415 * s);
			_setf(o + ( 4 << 2), x +   52.099 * s);
			_setf(o + ( 5 << 2), y +  -41.894 * s);
			_setf(o + ( 6 << 2), x +   49.316 * s);
			_setf(o + ( 7 << 2), y +  -37.109 * s);
			_setf(o + ( 8 << 2), x +   32.910 * s);
			_setf(o + ( 9 << 2), y +  -47.021 * s);
			_setf(o + (10 << 2), x +   32.910 * s);
			_setf(o + (11 << 2), y +  -28.613 * s);
			_setf(o + (12 << 2), x +   27.294 * s);
			_setf(o + (13 << 2), y +  -28.613 * s);
			_setf(o + (14 << 2), x +   27.294 * s);
			_setf(o + (15 << 2), y +  -47.021 * s);
			_setf(o + (16 << 2), x +   10.889 * s);
			_setf(o + (17 << 2), y +  -37.109 * s);
			_setf(o + (18 << 2), x +    8.105 * s);
			_setf(o + (19 << 2), y +  -41.894 * s);
			_setf(o + (20 << 2), x +   25.586 * s);
			_setf(o + (21 << 2), y +  -51.415 * s);
			_setf(o + (22 << 2), x +    8.105 * s);
			_setf(o + (23 << 2), y +  -60.888 * s);
			_setf(o + (24 << 2), x +   10.889 * s);
			_setf(o + (25 << 2), y +  -65.722 * s);
			_setf(o + (26 << 2), x +   27.294 * s);
			_setf(o + (27 << 2), y +  -55.810 * s);
			_setf(o + (28 << 2), x +   27.294 * s);
			_setf(o + (29 << 2), y +  -74.218 * s);
			_setf(o + (30 << 2), x +   32.910 * s);
			_setf(o + (31 << 2), y +  -74.218 * s);
			_setf(o + (32 << 2), x +   32.910 * s);
			_setf(o + (33 << 2), y +  -55.810 * s);
			_setf(o + (34 << 2), x +   49.316 * s);
			_setf(o + (35 << 2), y +  -65.722 * s);
			_setf(o + (36 << 2), x +   52.099 * s);
			_setf(o + (37 << 2), y +  -60.888 * s);
			_setf(o + (38 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   34.179 * s);
			_setf(o + ( 1 << 2), y +  -57.177 * s);
			_setf(o + ( 2 << 2), x +   34.179 * s);
			_setf(o + ( 3 << 2), y +  -35.497 * s);
			_setf(o + ( 4 << 2), x +   55.908 * s);
			_setf(o + ( 5 << 2), y +  -35.497 * s);
			_setf(o + ( 6 << 2), x +   55.908 * s);
			_setf(o + ( 7 << 2), y +  -27.197 * s);
			_setf(o + ( 8 << 2), x +   34.179 * s);
			_setf(o + ( 9 << 2), y +  -27.197 * s);
			_setf(o + (10 << 2), x +   34.179 * s);
			_setf(o + (11 << 2), y +   -5.517 * s);
			_setf(o + (12 << 2), x +   25.976 * s);
			_setf(o + (13 << 2), y +   -5.517 * s);
			_setf(o + (14 << 2), x +   25.976 * s);
			_setf(o + (15 << 2), y +  -27.197 * s);
			_setf(o + (16 << 2), x +    4.297 * s);
			_setf(o + (17 << 2), y +  -27.197 * s);
			_setf(o + (18 << 2), x +    4.297 * s);
			_setf(o + (19 << 2), y +  -35.497 * s);
			_setf(o + (20 << 2), x +   25.976 * s);
			_setf(o + (21 << 2), y +  -35.497 * s);
			_setf(o + (22 << 2), x +   25.976 * s);
			_setf(o + (23 << 2), y +  -57.177 * s);
			_setf(o + (24 << 2), x +   34.179 * s);
			_setf(o + (25 << 2), y +  -57.177 * s);
			_setf(o + (26 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   24.512 * s);
			_setf(o + ( 1 << 2), y +  -14.795 * s);
			_setf(o + ( 2 << 2), x +   36.816 * s);
			_setf(o + ( 3 << 2), y +  -14.795 * s);
			_setf(o + ( 4 << 2), x +   36.816 * s);
			_setf(o + ( 5 << 2), y +   -4.687 * s);
			_setf(o + ( 6 << 2), x +   27.197 * s);
			_setf(o + ( 7 << 2), y +   14.013 * s);
			_setf(o + ( 8 << 2), x +   19.678 * s);
			_setf(o + ( 9 << 2), y +   14.013 * s);
			_setf(o + (10 << 2), x +   24.512 * s);
			_setf(o + (11 << 2), y +   -4.687 * s);
			_setf(o + (12 << 2), x +   24.512 * s);
			_setf(o + (13 << 2), y +  -14.795 * s);
			_setf(o + (14 << 2), x +   60.205 * s);
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
			_setf(o + ( 0 << 2), x +   17.382 * s);
			_setf(o + ( 1 << 2), y +  -31.396 * s);
			_setf(o + ( 2 << 2), x +   42.821 * s);
			_setf(o + ( 3 << 2), y +  -31.396 * s);
			_setf(o + ( 4 << 2), x +   42.821 * s);
			_setf(o + ( 5 << 2), y +  -23.388 * s);
			_setf(o + ( 6 << 2), x +   17.382 * s);
			_setf(o + ( 7 << 2), y +  -23.388 * s);
			_setf(o + ( 8 << 2), x +   17.382 * s);
			_setf(o + ( 9 << 2), y +  -31.396 * s);
			_setf(o + (10 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   23.876 * s);
			_setf(o + ( 1 << 2), y +  -14.892 * s);
			_setf(o + ( 2 << 2), x +   36.181 * s);
			_setf(o + ( 3 << 2), y +  -14.892 * s);
			_setf(o + ( 4 << 2), x +   36.181 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   23.876 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   23.876 * s);
			_setf(o + ( 9 << 2), y +  -14.892 * s);
			_setf(o + (10 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   43.407 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   52.685 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   14.306 * s);
			_setf(o + ( 5 << 2), y +    9.277 * s);
			_setf(o + ( 6 << 2), x +    4.980 * s);
			_setf(o + ( 7 << 2), y +    9.277 * s);
			_setf(o + ( 8 << 2), x +   43.407 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   23.584 * s);
			_setf(o + ( 1 << 2), y +  -36.621 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   23.584 * s,y +  -36.621 * s,x +   23.584 * s,y +  -38.411 * s,x +   24.210 * s,y +  -39.957 * s,x +   25.464 * s,y +  -41.259 * s, threshold);
			_bez(x +   25.464 * s,y +  -41.259 * s,x +   26.717 * s,y +  -42.561 * s,x +   28.222 * s,y +  -43.212 * s,x +   29.980 * s,y +  -43.212 * s, threshold);
			_bez(x +   29.980 * s,y +  -43.212 * s,x +   31.803 * s,y +  -43.212 * s,x +   33.365 * s,y +  -42.561 * s,x +   34.667 * s,y +  -41.259 * s, threshold);
			_bez(x +   34.667 * s,y +  -41.259 * s,x +   35.970 * s,y +  -39.957 * s,x +   36.621 * s,y +  -38.411 * s,x +   36.621 * s,y +  -36.621 * s, threshold);
			_bez(x +   36.621 * s,y +  -36.621 * s,x +   36.621 * s,y +  -34.798 * s,x +   35.978 * s,y +  -33.251 * s,x +   34.692 * s,y +  -31.982 * s, threshold);
			_bez(x +   34.692 * s,y +  -31.982 * s,x +   33.406 * s,y +  -30.712 * s,x +   31.835 * s,y +  -30.078 * s,x +   29.980 * s,y +  -30.078 * s, threshold);
			_bez(x +   29.980 * s,y +  -30.078 * s,x +   28.157 * s,y +  -30.078 * s,x +   26.635 * s,y +  -30.696 * s,x +   25.415 * s,y +  -31.933 * s, threshold);
			_bez(x +   25.415 * s,y +  -31.933 * s,x +   24.194 * s,y +  -33.170 * s,x +   23.584 * s,y +  -34.733 * s,x +   23.584 * s,y +  -36.621 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   30.078 * s);
			_setf(o + ( 1 << 2), y +  -66.405 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   30.078 * s,y +  -66.405 * s,x +   25.488 * s,y +  -66.405 * s,x +   22.062 * s,y +  -63.931 * s,x +   19.800 * s,y +  -58.983 * s, threshold);
			_bez(x +   19.800 * s,y +  -58.983 * s,x +   17.537 * s,y +  -54.036 * s,x +   16.406 * s,y +  -46.500 * s,x +   16.406 * s,y +  -36.376 * s, threshold);
			_bez(x +   16.406 * s,y +  -36.376 * s,x +   16.406 * s,y +  -26.286 * s,x +   17.537 * s,y +  -18.766 * s,x +   19.800 * s,y +  -13.818 * s, threshold);
			_bez(x +   19.800 * s,y +  -13.818 * s,x +   22.062 * s,y +   -8.870 * s,x +   25.488 * s,y +   -6.396 * s,x +   30.078 * s,y +   -6.396 * s, threshold);
			_bez(x +   30.078 * s,y +   -6.396 * s,x +   34.700 * s,y +   -6.396 * s,x +   38.142 * s,y +   -8.870 * s,x +   40.405 * s,y +  -13.818 * s, threshold);
			_bez(x +   40.405 * s,y +  -13.818 * s,x +   42.667 * s,y +  -18.766 * s,x +   43.798 * s,y +  -26.286 * s,x +   43.798 * s,y +  -36.376 * s, threshold);
			_bez(x +   43.798 * s,y +  -36.376 * s,x +   43.798 * s,y +  -46.500 * s,x +   42.667 * s,y +  -54.036 * s,x +   40.405 * s,y +  -58.983 * s, threshold);
			_bez(x +   40.405 * s,y +  -58.983 * s,x +   38.142 * s,y +  -63.931 * s,x +   34.700 * s,y +  -66.405 * s,x +   30.078 * s,y +  -66.405 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   30.078 * s);
			_setf(o + ( 1 << 2), y +  -74.218 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   30.078 * s,y +  -74.218 * s,x +   37.858 * s,y +  -74.218 * s,x +   43.741 * s,y +  -71.028 * s,x +   47.729 * s,y +  -64.647 * s, threshold);
			_bez(x +   47.729 * s,y +  -64.647 * s,x +   51.716 * s,y +  -58.267 * s,x +   53.710 * s,y +  -48.843 * s,x +   53.710 * s,y +  -36.376 * s, threshold);
			_bez(x +   53.710 * s,y +  -36.376 * s,x +   53.710 * s,y +  -23.942 * s,x +   51.716 * s,y +  -14.534 * s,x +   47.729 * s,y +   -8.154 * s, threshold);
			_bez(x +   47.729 * s,y +   -8.154 * s,x +   43.741 * s,y +   -1.774 * s,x +   37.858 * s,y +    1.416 * s,x +   30.078 * s,y +    1.416 * s, threshold);
			_bez(x +   30.078 * s,y +    1.416 * s,x +   22.298 * s,y +    1.416 * s,x +   16.422 * s,y +   -1.774 * s,x +   12.451 * s,y +   -8.154 * s, threshold);
			_bez(x +   12.451 * s,y +   -8.154 * s,x +    8.480 * s,y +  -14.534 * s,x +    6.494 * s,y +  -23.942 * s,x +    6.494 * s,y +  -36.376 * s, threshold);
			_bez(x +    6.494 * s,y +  -36.376 * s,x +    6.494 * s,y +  -48.843 * s,x +    8.480 * s,y +  -58.267 * s,x +   12.451 * s,y +  -64.647 * s, threshold);
			_bez(x +   12.451 * s,y +  -64.647 * s,x +   16.422 * s,y +  -71.028 * s,x +   22.298 * s,y +  -74.218 * s,x +   30.078 * s,y +  -74.218 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 49:
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +   13.183 * s);
			_setf(o + ( 1 << 2), y +   -8.301 * s);
			_setf(o + ( 2 << 2), x +   28.515 * s);
			_setf(o + ( 3 << 2), y +   -8.301 * s);
			_setf(o + ( 4 << 2), x +   28.515 * s);
			_setf(o + ( 5 << 2), y +  -64.013 * s);
			_setf(o + ( 6 << 2), x +   12.011 * s);
			_setf(o + ( 7 << 2), y +  -60.302 * s);
			_setf(o + ( 8 << 2), x +   12.011 * s);
			_setf(o + ( 9 << 2), y +  -69.286 * s);
			_setf(o + (10 << 2), x +   28.417 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   38.281 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   38.281 * s);
			_setf(o + (15 << 2), y +   -8.301 * s);
			_setf(o + (16 << 2), x +   53.417 * s);
			_setf(o + (17 << 2), y +   -8.301 * s);
			_setf(o + (18 << 2), x +   53.417 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   13.183 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   13.183 * s);
			_setf(o + (23 << 2), y +   -8.301 * s);
			_setf(o + (24 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   18.213 * s);
			_setf(o + ( 1 << 2), y +   -8.301 * s);
			_setf(o + ( 2 << 2), x +   51.708 * s);
			_setf(o + ( 3 << 2), y +   -8.301 * s);
			_setf(o + ( 4 << 2), x +   51.708 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    7.422 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    7.422 * s);
			_setf(o + ( 9 << 2), y +   -8.301 * s);
			o = _posb(5);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +    7.422 * s,y +   -8.301 * s,x +   13.509 * s,y +  -14.713 * s,x +   18.831 * s,y +  -20.377 * s,x +   23.388 * s,y +  -25.293 * s, threshold);
			_bez(x +   23.388 * s,y +  -25.293 * s,x +   27.946 * s,y +  -30.208 * s,x +   31.115 * s,y +  -33.651 * s,x +   32.812 * s,y +  -35.693 * s, threshold);
			_bez(x +   32.812 * s,y +  -35.693 * s,x +   36.095 * s,y +  -39.641 * s,x +   38.265 * s,y +  -42.879 * s,x +   39.404 * s,y +  -45.336 * s, threshold);
			_bez(x +   39.404 * s,y +  -45.336 * s,x +   40.543 * s,y +  -47.794 * s,x +   41.113 * s,y +  -50.309 * s,x +   41.113 * s,y +  -52.880 * s, threshold);
			_bez(x +   41.113 * s,y +  -52.880 * s,x +   41.113 * s,y +  -56.949 * s,x +   39.917 * s,y +  -60.139 * s,x +   37.524 * s,y +  -62.450 * s, threshold);
			_bez(x +   37.524 * s,y +  -62.450 * s,x +   35.131 * s,y +  -64.761 * s,x +   31.852 * s,y +  -65.917 * s,x +   27.685 * s,y +  -65.917 * s, threshold);
			_bez(x +   27.685 * s,y +  -65.917 * s,x +   24.723 * s,y +  -65.917 * s,x +   21.614 * s,y +  -65.380 * s,x +   18.359 * s,y +  -64.306 * s, threshold);
			_bez(x +   18.359 * s,y +  -64.306 * s,x +   15.104 * s,y +  -63.231 * s,x +   11.653 * s,y +  -61.604 * s,x +    8.008 * s,y +  -59.423 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    8.008 * s);
			_setf(o + ( 1 << 2), y +  -69.384 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    8.008 * s,y +  -69.384 * s,x +   11.361 * s,y +  -70.979 * s,x +   14.656 * s,y +  -72.183 * s,x +   17.895 * s,y +  -72.997 * s, threshold);
			_bez(x +   17.895 * s,y +  -72.997 * s,x +   21.134 * s,y +  -73.811 * s,x +   24.332 * s,y +  -74.218 * s,x +   27.490 * s,y +  -74.218 * s, threshold);
			_bez(x +   27.490 * s,y +  -74.218 * s,x +   34.619 * s,y +  -74.218 * s,x +   40.356 * s,y +  -72.321 * s,x +   44.702 * s,y +  -68.529 * s, threshold);
			_bez(x +   44.702 * s,y +  -68.529 * s,x +   49.047 * s,y +  -64.737 * s,x +   51.220 * s,y +  -59.765 * s,x +   51.220 * s,y +  -53.612 * s, threshold);
			_bez(x +   51.220 * s,y +  -53.612 * s,x +   51.220 * s,y +  -50.488 * s,x +   50.496 * s,y +  -47.363 * s,x +   49.047 * s,y +  -44.238 * s, threshold);
			_bez(x +   49.047 * s,y +  -44.238 * s,x +   47.599 * s,y +  -41.113 * s,x +   45.246 * s,y +  -37.662 * s,x +   41.992 * s,y +  -33.886 * s, threshold);
			_bez(x +   41.992 * s,y +  -33.886 * s,x +   40.168 * s,y +  -31.771 * s,x +   37.524 * s,y +  -28.841 * s,x +   34.057 * s,y +  -25.097 * s, threshold);
			_bez(x +   34.057 * s,y +  -25.097 * s,x +   30.590 * s,y +  -21.354 * s,x +   25.309 * s,y +  -15.755 * s,x +   18.213 * s,y +   -8.301 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 51:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   37.890 * s);
			_setf(o + ( 1 << 2), y +  -39.013 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   37.890 * s,y +  -39.013 * s,x +   42.675 * s,y +  -37.744 * s,x +   46.337 * s,y +  -35.489 * s,x +   48.877 * s,y +  -32.250 * s, threshold);
			_bez(x +   48.877 * s,y +  -32.250 * s,x +   51.416 * s,y +  -29.012 * s,x +   52.685 * s,y +  -24.967 * s,x +   52.685 * s,y +  -20.117 * s, threshold);
			_bez(x +   52.685 * s,y +  -20.117 * s,x +   52.685 * s,y +  -13.411 * s,x +   50.431 * s,y +   -8.146 * s,x +   45.922 * s,y +   -4.321 * s, threshold);
			_bez(x +   45.922 * s,y +   -4.321 * s,x +   41.414 * s,y +   -0.496 * s,x +   35.172 * s,y +    1.416 * s,x +   27.197 * s,y +    1.416 * s, threshold);
			_bez(x +   27.197 * s,y +    1.416 * s,x +   23.844 * s,y +    1.416 * s,x +   20.426 * s,y +    1.107 * s,x +   16.943 * s,y +    0.488 * s, threshold);
			_bez(x +   16.943 * s,y +    0.488 * s,x +   13.460 * s,y +   -0.130 * s,x +   10.042 * s,y +   -1.025 * s,x +    6.690 * s,y +   -2.197 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    6.690 * s);
			_setf(o + ( 1 << 2), y +  -12.012 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    6.690 * s,y +  -12.012 * s,x +   10.010 * s,y +  -10.286 * s,x +   13.281 * s,y +   -9.001 * s,x +   16.504 * s,y +   -8.154 * s, threshold);
			_bez(x +   16.504 * s,y +   -8.154 * s,x +   19.727 * s,y +   -7.308 * s,x +   22.933 * s,y +   -6.885 * s,x +   26.123 * s,y +   -6.885 * s, threshold);
			_bez(x +   26.123 * s,y +   -6.885 * s,x +   31.526 * s,y +   -6.885 * s,x +   35.677 * s,y +   -8.105 * s,x +   38.574 * s,y +  -10.547 * s, threshold);
			_bez(x +   38.574 * s,y +  -10.547 * s,x +   41.471 * s,y +  -12.988 * s,x +   42.920 * s,y +  -16.504 * s,x +   42.920 * s,y +  -21.093 * s, threshold);
			_bez(x +   42.920 * s,y +  -21.093 * s,x +   42.920 * s,y +  -25.325 * s,x +   41.471 * s,y +  -28.686 * s,x +   38.574 * s,y +  -31.176 * s, threshold);
			_bez(x +   38.574 * s,y +  -31.176 * s,x +   35.677 * s,y +  -33.666 * s,x +   31.754 * s,y +  -34.912 * s,x +   26.807 * s,y +  -34.912 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   19.287 * s);
			_setf(o + ( 1 << 2), y +  -34.912 * s);
			_setf(o + ( 2 << 2), x +   19.287 * s);
			_setf(o + ( 3 << 2), y +  -43.017 * s);
			_setf(o + ( 4 << 2), x +   26.807 * s);
			_setf(o + ( 5 << 2), y +  -43.017 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   26.807 * s,y +  -43.017 * s,x +   31.331 * s,y +  -43.017 * s,x +   34.863 * s,y +  -44.010 * s,x +   37.402 * s,y +  -45.995 * s, threshold);
			_bez(x +   37.402 * s,y +  -45.995 * s,x +   39.941 * s,y +  -47.981 * s,x +   41.211 * s,y +  -50.748 * s,x +   41.211 * s,y +  -54.296 * s, threshold);
			_bez(x +   41.211 * s,y +  -54.296 * s,x +   41.211 * s,y +  -58.039 * s,x +   40.031 * s,y +  -60.912 * s,x +   37.671 * s,y +  -62.914 * s, threshold);
			_bez(x +   37.671 * s,y +  -62.914 * s,x +   35.311 * s,y +  -64.916 * s,x +   31.950 * s,y +  -65.917 * s,x +   27.588 * s,y +  -65.917 * s, threshold);
			_bez(x +   27.588 * s,y +  -65.917 * s,x +   24.691 * s,y +  -65.917 * s,x +   21.696 * s,y +  -65.591 * s,x +   18.604 * s,y +  -64.940 * s, threshold);
			_bez(x +   18.604 * s,y +  -64.940 * s,x +   15.511 * s,y +  -64.289 * s,x +   12.272 * s,y +  -63.313 * s,x +    8.887 * s,y +  -62.011 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    8.887 * s);
			_setf(o + ( 1 << 2), y +  -71.093 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    8.887 * s,y +  -71.093 * s,x +   12.826 * s,y +  -72.134 * s,x +   16.333 * s,y +  -72.916 * s,x +   19.409 * s,y +  -73.436 * s, threshold);
			_bez(x +   19.409 * s,y +  -73.436 * s,x +   22.485 * s,y +  -73.957 * s,x +   25.212 * s,y +  -74.218 * s,x +   27.588 * s,y +  -74.218 * s, threshold);
			_bez(x +   27.588 * s,y +  -74.218 * s,x +   34.684 * s,y +  -74.218 * s,x +   40.356 * s,y +  -72.435 * s,x +   44.604 * s,y +  -68.871 * s, threshold);
			_bez(x +   44.604 * s,y +  -68.871 * s,x +   48.852 * s,y +  -65.307 * s,x +   50.976 * s,y +  -60.579 * s,x +   50.976 * s,y +  -54.687 * s, threshold);
			_bez(x +   50.976 * s,y +  -54.687 * s,x +   50.976 * s,y +  -50.683 * s,x +   49.861 * s,y +  -47.346 * s,x +   47.631 * s,y +  -44.677 * s, threshold);
			_bez(x +   47.631 * s,y +  -44.677 * s,x +   45.402 * s,y +  -42.008 * s,x +   42.155 * s,y +  -40.120 * s,x +   37.890 * s,y +  -39.013 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 52:
			
			o = _posf(34);
			_setf(o + ( 0 << 2), x +   35.889 * s);
			_setf(o + ( 1 << 2), y +  -63.915 * s);
			_setf(o + ( 2 << 2), x +   12.891 * s);
			_setf(o + ( 3 << 2), y +  -25.390 * s);
			_setf(o + ( 4 << 2), x +   35.889 * s);
			_setf(o + ( 5 << 2), y +  -25.390 * s);
			_setf(o + ( 6 << 2), x +   35.889 * s);
			_setf(o + ( 7 << 2), y +  -63.915 * s);
			_setf(o + ( 8 << 2), x +   34.277 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   45.703 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   45.703 * s);
			_setf(o + (13 << 2), y +  -25.390 * s);
			_setf(o + (14 << 2), x +   55.420 * s);
			_setf(o + (15 << 2), y +  -25.390 * s);
			_setf(o + (16 << 2), x +   55.420 * s);
			_setf(o + (17 << 2), y +  -17.383 * s);
			_setf(o + (18 << 2), x +   45.703 * s);
			_setf(o + (19 << 2), y +  -17.383 * s);
			_setf(o + (20 << 2), x +   45.703 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   35.889 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   35.889 * s);
			_setf(o + (25 << 2), y +  -17.383 * s);
			_setf(o + (26 << 2), x +    4.981 * s);
			_setf(o + (27 << 2), y +  -17.383 * s);
			_setf(o + (28 << 2), x +    4.981 * s);
			_setf(o + (29 << 2), y +  -26.709 * s);
			_setf(o + (30 << 2), x +   34.277 * s);
			_setf(o + (31 << 2), y +  -72.899 * s);
			_setf(o + (32 << 2), x +   60.205 * s);
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
			_setf(o + ( 0 << 2), x +   10.107 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   47.020 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   47.020 * s);
			_setf(o + ( 5 << 2), y +  -64.599 * s);
			_setf(o + ( 6 << 2), x +   19.091 * s);
			_setf(o + ( 7 << 2), y +  -64.599 * s);
			_setf(o + ( 8 << 2), x +   19.091 * s);
			_setf(o + ( 9 << 2), y +  -46.679 * s);
			o = _posb(5);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   19.091 * s,y +  -46.679 * s,x +   20.491 * s,y +  -47.200 * s,x +   21.899 * s,y +  -47.582 * s,x +   23.315 * s,y +  -47.826 * s, threshold);
			_bez(x +   23.315 * s,y +  -47.826 * s,x +   24.731 * s,y +  -48.071 * s,x +   26.155 * s,y +  -48.193 * s,x +   27.587 * s,y +  -48.193 * s, threshold);
			_bez(x +   27.587 * s,y +  -48.193 * s,x +   35.139 * s,y +  -48.193 * s,x +   41.129 * s,y +  -45.963 * s,x +   45.556 * s,y +  -41.503 * s, threshold);
			_bez(x +   45.556 * s,y +  -41.503 * s,x +   49.983 * s,y +  -37.044 * s,x +   52.196 * s,y +  -31.005 * s,x +   52.196 * s,y +  -23.388 * s, threshold);
			_bez(x +   52.196 * s,y +  -23.388 * s,x +   52.196 * s,y +  -15.706 * s,x +   49.877 * s,y +   -9.652 * s,x +   45.238 * s,y +   -5.225 * s, threshold);
			_bez(x +   45.238 * s,y +   -5.225 * s,x +   40.600 * s,y +   -0.798 * s,x +   34.260 * s,y +    1.416 * s,x +   26.220 * s,y +    1.416 * s, threshold);
			_bez(x +   26.220 * s,y +    1.416 * s,x +   22.346 * s,y +    1.416 * s,x +   18.806 * s,y +    1.156 * s,x +   15.600 * s,y +    0.635 * s, threshold);
			_bez(x +   15.600 * s,y +    0.635 * s,x +   12.394 * s,y +    0.114 * s,x +    9.521 * s,y +   -0.667 * s,x +    6.982 * s,y +   -1.709 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    6.982 * s);
			_setf(o + ( 1 << 2), y +  -11.719 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    6.982 * s,y +  -11.719 * s,x +    9.977 * s,y +  -10.091 * s,x +   12.988 * s,y +   -8.878 * s,x +   16.015 * s,y +   -8.081 * s, threshold);
			_bez(x +   16.015 * s,y +   -8.081 * s,x +   19.042 * s,y +   -7.283 * s,x +   22.135 * s,y +   -6.885 * s,x +   25.292 * s,y +   -6.885 * s, threshold);
			_bez(x +   25.292 * s,y +   -6.885 * s,x +   30.728 * s,y +   -6.885 * s,x +   34.919 * s,y +   -8.317 * s,x +   37.865 * s,y +  -11.181 * s, threshold);
			_bez(x +   37.865 * s,y +  -11.181 * s,x +   40.811 * s,y +  -14.046 * s,x +   42.284 * s,y +  -18.115 * s,x +   42.284 * s,y +  -23.388 * s, threshold);
			_bez(x +   42.284 * s,y +  -23.388 * s,x +   42.284 * s,y +  -28.597 * s,x +   40.762 * s,y +  -32.649 * s,x +   37.719 * s,y +  -35.546 * s, threshold);
			_bez(x +   37.719 * s,y +  -35.546 * s,x +   34.675 * s,y +  -38.443 * s,x +   30.435 * s,y +  -39.892 * s,x +   24.999 * s,y +  -39.892 * s, threshold);
			_bez(x +   24.999 * s,y +  -39.892 * s,x +   22.362 * s,y +  -39.892 * s,x +   19.791 * s,y +  -39.591 * s,x +   17.284 * s,y +  -38.989 * s, threshold);
			_bez(x +   17.284 * s,y +  -38.989 * s,x +   14.778 * s,y +  -38.386 * s,x +   12.385 * s,y +  -37.483 * s,x +   10.107 * s,y +  -36.279 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   10.107 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   60.204 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 54:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   48.388 * s);
			_setf(o + ( 1 << 2), y +  -71.288 * s);
			_setf(o + ( 2 << 2), x +   48.388 * s);
			_setf(o + ( 3 << 2), y +  -62.206 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   48.388 * s,y +  -62.206 * s,x +   46.337 * s,y +  -63.410 * s,x +   44.156 * s,y +  -64.330 * s,x +   41.845 * s,y +  -64.965 * s, threshold);
			_bez(x +   41.845 * s,y +  -64.965 * s,x +   39.534 * s,y +  -65.600 * s,x +   37.125 * s,y +  -65.917 * s,x +   34.618 * s,y +  -65.917 * s, threshold);
			_bez(x +   34.618 * s,y +  -65.917 * s,x +   28.368 * s,y +  -65.917 * s,x +   23.632 * s,y +  -63.565 * s,x +   20.410 * s,y +  -58.861 * s, threshold);
			_bez(x +   20.410 * s,y +  -58.861 * s,x +   17.187 * s,y +  -54.158 * s,x +   15.576 * s,y +  -47.232 * s,x +   15.576 * s,y +  -38.085 * s, threshold);
			_bez(x +   15.576 * s,y +  -38.085 * s,x +   17.138 * s,y +  -41.340 * s,x +   19.303 * s,y +  -43.839 * s,x +   22.070 * s,y +  -45.580 * s, threshold);
			_bez(x +   22.070 * s,y +  -45.580 * s,x +   24.837 * s,y +  -47.322 * s,x +   28.010 * s,y +  -48.193 * s,x +   31.591 * s,y +  -48.193 * s, threshold);
			_bez(x +   31.591 * s,y +  -48.193 * s,x +   38.622 * s,y +  -48.193 * s,x +   44.066 * s,y +  -46.036 * s,x +   47.924 * s,y +  -41.723 * s, threshold);
			_bez(x +   47.924 * s,y +  -41.723 * s,x +   51.781 * s,y +  -37.410 * s,x +   53.710 * s,y +  -31.298 * s,x +   53.710 * s,y +  -23.388 * s, threshold);
			_bez(x +   53.710 * s,y +  -23.388 * s,x +   53.710 * s,y +  -15.511 * s,x +   51.724 * s,y +   -9.407 * s,x +   47.753 * s,y +   -5.078 * s, threshold);
			_bez(x +   47.753 * s,y +   -5.078 * s,x +   43.782 * s,y +   -0.749 * s,x +   38.199 * s,y +    1.416 * s,x +   31.005 * s,y +    1.416 * s, threshold);
			_bez(x +   31.005 * s,y +    1.416 * s,x +   22.542 * s,y +    1.416 * s,x +   16.341 * s,y +   -1.619 * s,x +   12.402 * s,y +   -7.690 * s, threshold);
			_bez(x +   12.402 * s,y +   -7.690 * s,x +    8.463 * s,y +  -13.761 * s,x +    6.494 * s,y +  -23.323 * s,x +    6.494 * s,y +  -36.376 * s, threshold);
			_bez(x +    6.494 * s,y +  -36.376 * s,x +    6.494 * s,y +  -48.681 * s,x +    8.862 * s,y +  -58.064 * s,x +   13.598 * s,y +  -64.525 * s, threshold);
			_bez(x +   13.598 * s,y +  -64.525 * s,x +   18.334 * s,y +  -70.987 * s,x +   25.194 * s,y +  -74.218 * s,x +   34.179 * s,y +  -74.218 * s, threshold);
			_bez(x +   34.179 * s,y +  -74.218 * s,x +   36.588 * s,y +  -74.218 * s,x +   38.997 * s,y +  -73.965 * s,x +   41.405 * s,y +  -73.461 * s, threshold);
			_bez(x +   41.405 * s,y +  -73.461 * s,x +   43.814 * s,y +  -72.956 * s,x +   46.142 * s,y +  -72.232 * s,x +   48.388 * s,y +  -71.288 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   30.810 * s);
			_setf(o + ( 1 << 2), y +  -40.478 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   30.810 * s,y +  -40.478 * s,x +   26.611 * s,y +  -40.478 * s,x +   23.307 * s,y +  -38.964 * s,x +   20.898 * s,y +  -35.937 * s, threshold);
			_bez(x +   20.898 * s,y +  -35.937 * s,x +   18.489 * s,y +  -32.910 * s,x +   17.285 * s,y +  -28.727 * s,x +   17.285 * s,y +  -23.388 * s, threshold);
			_bez(x +   17.285 * s,y +  -23.388 * s,x +   17.285 * s,y +  -18.050 * s,x +   18.489 * s,y +  -13.867 * s,x +   20.898 * s,y +  -10.840 * s, threshold);
			_bez(x +   20.898 * s,y +  -10.840 * s,x +   23.307 * s,y +   -7.812 * s,x +   26.611 * s,y +   -6.299 * s,x +   30.810 * s,y +   -6.299 * s, threshold);
			_bez(x +   30.810 * s,y +   -6.299 * s,x +   35.172 * s,y +   -6.299 * s,x +   38.459 * s,y +   -7.739 * s,x +   40.673 * s,y +  -10.620 * s, threshold);
			_bez(x +   40.673 * s,y +  -10.620 * s,x +   42.886 * s,y +  -13.501 * s,x +   43.993 * s,y +  -17.757 * s,x +   43.993 * s,y +  -23.388 * s, threshold);
			_bez(x +   43.993 * s,y +  -23.388 * s,x +   43.993 * s,y +  -29.052 * s,x +   42.886 * s,y +  -33.317 * s,x +   40.673 * s,y +  -36.181 * s, threshold);
			_bez(x +   40.673 * s,y +  -36.181 * s,x +   38.459 * s,y +  -39.046 * s,x +   35.172 * s,y +  -40.478 * s,x +   30.810 * s,y +  -40.478 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 55:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +    6.787 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   52.685 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   52.685 * s);
			_setf(o + ( 5 << 2), y +  -68.700 * s);
			_setf(o + ( 6 << 2), x +   26.611 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   16.308 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   41.698 * s);
			_setf(o + (11 << 2), y +  -64.599 * s);
			_setf(o + (12 << 2), x +    6.787 * s);
			_setf(o + (13 << 2), y +  -64.599 * s);
			_setf(o + (14 << 2), x +    6.787 * s);
			_setf(o + (15 << 2), y +  -72.899 * s);
			_setf(o + (16 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   30.078 * s);
			_setf(o + ( 1 << 2), y +  -34.619 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   30.078 * s,y +  -34.619 * s,x +   25.683 * s,y +  -34.619 * s,x +   22.290 * s,y +  -33.390 * s,x +   19.897 * s,y +  -30.932 * s, threshold);
			_bez(x +   19.897 * s,y +  -30.932 * s,x +   17.505 * s,y +  -28.474 * s,x +   16.308 * s,y +  -25.000 * s,x +   16.308 * s,y +  -20.507 * s, threshold);
			_bez(x +   16.308 * s,y +  -20.507 * s,x +   16.308 * s,y +  -16.015 * s,x +   17.521 * s,y +  -12.524 * s,x +   19.946 * s,y +  -10.034 * s, threshold);
			_bez(x +   19.946 * s,y +  -10.034 * s,x +   22.371 * s,y +   -7.544 * s,x +   25.748 * s,y +   -6.299 * s,x +   30.078 * s,y +   -6.299 * s, threshold);
			_bez(x +   30.078 * s,y +   -6.299 * s,x +   34.505 * s,y +   -6.299 * s,x +   37.914 * s,y +   -7.528 * s,x +   40.307 * s,y +   -9.985 * s, threshold);
			_bez(x +   40.307 * s,y +   -9.985 * s,x +   42.700 * s,y +  -12.443 * s,x +   43.896 * s,y +  -15.950 * s,x +   43.896 * s,y +  -20.507 * s, threshold);
			_bez(x +   43.896 * s,y +  -20.507 * s,x +   43.896 * s,y +  -24.967 * s,x +   42.683 * s,y +  -28.434 * s,x +   40.258 * s,y +  -30.908 * s, threshold);
			_bez(x +   40.258 * s,y +  -30.908 * s,x +   37.833 * s,y +  -33.382 * s,x +   34.440 * s,y +  -34.619 * s,x +   30.078 * s,y +  -34.619 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   21.484 * s);
			_setf(o + ( 1 << 2), y +  -38.720 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   21.484 * s,y +  -38.720 * s,x +   17.285 * s,y +  -39.794 * s,x +   14.005 * s,y +  -41.796 * s,x +   11.645 * s,y +  -44.726 * s, threshold);
			_bez(x +   11.645 * s,y +  -44.726 * s,x +    9.285 * s,y +  -47.656 * s,x +    8.105 * s,y +  -51.187 * s,x +    8.105 * s,y +  -55.321 * s, threshold);
			_bez(x +    8.105 * s,y +  -55.321 * s,x +    8.105 * s,y +  -61.116 * s,x +   10.075 * s,y +  -65.714 * s,x +   14.013 * s,y +  -69.115 * s, threshold);
			_bez(x +   14.013 * s,y +  -69.115 * s,x +   17.952 * s,y +  -72.517 * s,x +   23.307 * s,y +  -74.218 * s,x +   30.078 * s,y +  -74.218 * s, threshold);
			_bez(x +   30.078 * s,y +  -74.218 * s,x +   36.881 * s,y +  -74.218 * s,x +   42.252 * s,y +  -72.517 * s,x +   46.191 * s,y +  -69.115 * s, threshold);
			_bez(x +   46.191 * s,y +  -69.115 * s,x +   50.129 * s,y +  -65.714 * s,x +   52.099 * s,y +  -61.116 * s,x +   52.099 * s,y +  -55.321 * s, threshold);
			_bez(x +   52.099 * s,y +  -55.321 * s,x +   52.099 * s,y +  -51.187 * s,x +   50.919 * s,y +  -47.656 * s,x +   48.559 * s,y +  -44.726 * s, threshold);
			_bez(x +   48.559 * s,y +  -44.726 * s,x +   46.199 * s,y +  -41.796 * s,x +   42.919 * s,y +  -39.794 * s,x +   38.720 * s,y +  -38.720 * s, threshold);
			_bez(x +   38.720 * s,y +  -38.720 * s,x +   43.603 * s,y +  -37.646 * s,x +   47.338 * s,y +  -35.481 * s,x +   49.926 * s,y +  -32.226 * s, threshold);
			_bez(x +   49.926 * s,y +  -32.226 * s,x +   52.514 * s,y +  -28.971 * s,x +   53.808 * s,y +  -24.756 * s,x +   53.808 * s,y +  -19.580 * s, threshold);
			_bez(x +   53.808 * s,y +  -19.580 * s,x +   53.808 * s,y +  -13.004 * s,x +   51.708 * s,y +   -7.861 * s,x +   47.509 * s,y +   -4.150 * s, threshold);
			_bez(x +   47.509 * s,y +   -4.150 * s,x +   43.310 * s,y +   -0.439 * s,x +   37.499 * s,y +    1.416 * s,x +   30.078 * s,y +    1.416 * s, threshold);
			_bez(x +   30.078 * s,y +    1.416 * s,x +   22.656 * s,y +    1.416 * s,x +   16.854 * s,y +   -0.431 * s,x +   12.671 * s,y +   -4.126 * s, threshold);
			_bez(x +   12.671 * s,y +   -4.126 * s,x +    8.488 * s,y +   -7.820 * s,x +    6.396 * s,y +  -12.939 * s,x +    6.396 * s,y +  -19.482 * s, threshold);
			_bez(x +    6.396 * s,y +  -19.482 * s,x +    6.396 * s,y +  -24.690 * s,x +    7.690 * s,y +  -28.930 * s,x +   10.278 * s,y +  -32.202 * s, threshold);
			_bez(x +   10.278 * s,y +  -32.202 * s,x +   12.866 * s,y +  -35.473 * s,x +   16.601 * s,y +  -37.646 * s,x +   21.484 * s,y +  -38.720 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   17.920 * s);
			_setf(o + ( 1 << 2), y +  -54.394 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   17.920 * s,y +  -54.394 * s,x +   17.920 * s,y +  -50.487 * s,x +   18.961 * s,y +  -47.509 * s,x +   21.045 * s,y +  -45.458 * s, threshold);
			_bez(x +   21.045 * s,y +  -45.458 * s,x +   23.128 * s,y +  -43.408 * s,x +   26.139 * s,y +  -42.382 * s,x +   30.078 * s,y +  -42.382 * s, threshold);
			_bez(x +   30.078 * s,y +  -42.382 * s,x +   34.049 * s,y +  -42.382 * s,x +   37.076 * s,y +  -43.408 * s,x +   39.160 * s,y +  -45.458 * s, threshold);
			_bez(x +   39.160 * s,y +  -45.458 * s,x +   41.243 * s,y +  -47.509 * s,x +   42.285 * s,y +  -50.487 * s,x +   42.285 * s,y +  -54.394 * s, threshold);
			_bez(x +   42.285 * s,y +  -54.394 * s,x +   42.285 * s,y +  -58.365 * s,x +   41.251 * s,y +  -61.392 * s,x +   39.184 * s,y +  -63.476 * s, threshold);
			_bez(x +   39.184 * s,y +  -63.476 * s,x +   37.117 * s,y +  -65.559 * s,x +   34.082 * s,y +  -66.601 * s,x +   30.078 * s,y +  -66.601 * s, threshold);
			_bez(x +   30.078 * s,y +  -66.601 * s,x +   26.139 * s,y +  -66.601 * s,x +   23.128 * s,y +  -65.551 * s,x +   21.045 * s,y +  -63.451 * s, threshold);
			_bez(x +   21.045 * s,y +  -63.451 * s,x +   18.961 * s,y +  -61.352 * s,x +   17.920 * s,y +  -58.332 * s,x +   17.920 * s,y +  -54.394 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 57:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   29.101 * s);
			_setf(o + ( 1 << 2), y +  -32.324 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   29.101 * s,y +  -32.324 * s,x +   33.300 * s,y +  -32.324 * s,x +   36.596 * s,y +  -33.837 * s,x +   38.989 * s,y +  -36.865 * s, threshold);
			_bez(x +   38.989 * s,y +  -36.865 * s,x +   41.381 * s,y +  -39.892 * s,x +   42.577 * s,y +  -44.075 * s,x +   42.577 * s,y +  -49.413 * s, threshold);
			_bez(x +   42.577 * s,y +  -49.413 * s,x +   42.577 * s,y +  -54.752 * s,x +   41.381 * s,y +  -58.935 * s,x +   38.989 * s,y +  -61.962 * s, threshold);
			_bez(x +   38.989 * s,y +  -61.962 * s,x +   36.596 * s,y +  -64.989 * s,x +   33.300 * s,y +  -66.503 * s,x +   29.101 * s,y +  -66.503 * s, threshold);
			_bez(x +   29.101 * s,y +  -66.503 * s,x +   24.739 * s,y +  -66.503 * s,x +   21.451 * s,y +  -65.062 * s,x +   19.238 * s,y +  -62.182 * s, threshold);
			_bez(x +   19.238 * s,y +  -62.182 * s,x +   17.024 * s,y +  -59.301 * s,x +   15.918 * s,y +  -55.045 * s,x +   15.918 * s,y +  -49.413 * s, threshold);
			_bez(x +   15.918 * s,y +  -49.413 * s,x +   15.918 * s,y +  -43.749 * s,x +   17.016 * s,y +  -39.485 * s,x +   19.214 * s,y +  -36.621 * s, threshold);
			_bez(x +   19.214 * s,y +  -36.621 * s,x +   21.411 * s,y +  -33.756 * s,x +   24.707 * s,y +  -32.324 * s,x +   29.101 * s,y +  -32.324 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   11.523 * s);
			_setf(o + ( 1 << 2), y +   -1.514 * s);
			_setf(o + ( 2 << 2), x +   11.523 * s);
			_setf(o + ( 3 << 2), y +  -10.596 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   11.523 * s,y +  -10.596 * s,x +   13.574 * s,y +   -9.391 * s,x +   15.755 * s,y +   -8.472 * s,x +   18.066 * s,y +   -7.837 * s, threshold);
			_bez(x +   18.066 * s,y +   -7.837 * s,x +   20.377 * s,y +   -7.202 * s,x +   22.786 * s,y +   -6.885 * s,x +   25.293 * s,y +   -6.885 * s, threshold);
			_bez(x +   25.293 * s,y +   -6.885 * s,x +   31.543 * s,y +   -6.885 * s,x +   36.271 * s,y +   -9.236 * s,x +   39.477 * s,y +  -13.940 * s, threshold);
			_bez(x +   39.477 * s,y +  -13.940 * s,x +   42.683 * s,y +  -18.644 * s,x +   44.286 * s,y +  -25.569 * s,x +   44.286 * s,y +  -34.716 * s, threshold);
			_bez(x +   44.286 * s,y +  -34.716 * s,x +   42.756 * s,y +  -31.461 * s,x +   40.608 * s,y +  -28.963 * s,x +   37.841 * s,y +  -27.221 * s, threshold);
			_bez(x +   37.841 * s,y +  -27.221 * s,x +   35.074 * s,y +  -25.480 * s,x +   31.901 * s,y +  -24.609 * s,x +   28.320 * s,y +  -24.609 * s, threshold);
			_bez(x +   28.320 * s,y +  -24.609 * s,x +   21.289 * s,y +  -24.609 * s,x +   15.844 * s,y +  -26.774 * s,x +   11.987 * s,y +  -31.103 * s, threshold);
			_bez(x +   11.987 * s,y +  -31.103 * s,x +    8.130 * s,y +  -35.432 * s,x +    6.201 * s,y +  -41.568 * s,x +    6.201 * s,y +  -49.511 * s, threshold);
			_bez(x +    6.201 * s,y +  -49.511 * s,x +    6.201 * s,y +  -57.356 * s,x +    8.179 * s,y +  -63.435 * s,x +   12.134 * s,y +  -67.748 * s, threshold);
			_bez(x +   12.134 * s,y +  -67.748 * s,x +   16.089 * s,y +  -72.061 * s,x +   21.679 * s,y +  -74.218 * s,x +   28.906 * s,y +  -74.218 * s, threshold);
			_bez(x +   28.906 * s,y +  -74.218 * s,x +   37.369 * s,y +  -74.218 * s,x +   43.570 * s,y +  -71.174 * s,x +   47.509 * s,y +  -65.087 * s, threshold);
			_bez(x +   47.509 * s,y +  -65.087 * s,x +   51.448 * s,y +  -59.000 * s,x +   53.417 * s,y +  -49.430 * s,x +   53.417 * s,y +  -36.376 * s, threshold);
			_bez(x +   53.417 * s,y +  -36.376 * s,x +   53.417 * s,y +  -24.104 * s,x +   51.049 * s,y +  -14.738 * s,x +   46.313 * s,y +   -8.276 * s, threshold);
			_bez(x +   46.313 * s,y +   -8.276 * s,x +   41.576 * s,y +   -1.815 * s,x +   34.700 * s,y +    1.416 * s,x +   25.683 * s,y +    1.416 * s, threshold);
			_bez(x +   25.683 * s,y +    1.416 * s,x +   23.307 * s,y +    1.416 * s,x +   20.914 * s,y +    1.164 * s,x +   18.506 * s,y +    0.659 * s, threshold);
			_bez(x +   18.506 * s,y +    0.659 * s,x +   16.097 * s,y +    0.155 * s,x +   13.769 * s,y +   -0.570 * s,x +   11.523 * s,y +   -1.514 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 58:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +   23.877 * s);
			_setf(o + ( 1 << 2), y +  -51.904 * s);
			_setf(o + ( 2 << 2), x +   36.181 * s);
			_setf(o + ( 3 << 2), y +  -51.904 * s);
			_setf(o + ( 4 << 2), x +   36.181 * s);
			_setf(o + ( 5 << 2), y +  -37.109 * s);
			_setf(o + ( 6 << 2), x +   23.877 * s);
			_setf(o + ( 7 << 2), y +  -37.109 * s);
			_setf(o + ( 8 << 2), x +   23.877 * s);
			_setf(o + ( 9 << 2), y +  -51.904 * s);
			_setf(o + (10 << 2), x +   23.877 * s);
			_setf(o + (11 << 2), y +  -14.892 * s);
			_setf(o + (12 << 2), x +   36.181 * s);
			_setf(o + (13 << 2), y +  -14.892 * s);
			_setf(o + (14 << 2), x +   36.181 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   23.877 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   23.877 * s);
			_setf(o + (19 << 2), y +  -14.892 * s);
			_setf(o + (20 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   24.512 * s);
			_setf(o + ( 1 << 2), y +  -14.795 * s);
			_setf(o + ( 2 << 2), x +   36.816 * s);
			_setf(o + ( 3 << 2), y +  -14.795 * s);
			_setf(o + ( 4 << 2), x +   36.816 * s);
			_setf(o + ( 5 << 2), y +   -4.687 * s);
			_setf(o + ( 6 << 2), x +   27.197 * s);
			_setf(o + ( 7 << 2), y +   14.013 * s);
			_setf(o + ( 8 << 2), x +   19.678 * s);
			_setf(o + ( 9 << 2), y +   14.013 * s);
			_setf(o + (10 << 2), x +   24.512 * s);
			_setf(o + (11 << 2), y +   -4.687 * s);
			_setf(o + (12 << 2), x +   24.512 * s);
			_setf(o + (13 << 2), y +  -14.795 * s);
			_setf(o + (14 << 2), x +   23.877 * s);
			_setf(o + (15 << 2), y +  -51.904 * s);
			_setf(o + (16 << 2), x +   36.181 * s);
			_setf(o + (17 << 2), y +  -51.904 * s);
			_setf(o + (18 << 2), x +   36.181 * s);
			_setf(o + (19 << 2), y +  -37.109 * s);
			_setf(o + (20 << 2), x +   23.877 * s);
			_setf(o + (21 << 2), y +  -37.109 * s);
			_setf(o + (22 << 2), x +   23.877 * s);
			_setf(o + (23 << 2), y +  -51.904 * s);
			_setf(o + (24 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   55.908 * s);
			_setf(o + ( 1 << 2), y +  -46.923 * s);
			_setf(o + ( 2 << 2), x +   14.405 * s);
			_setf(o + ( 3 << 2), y +  -31.298 * s);
			_setf(o + ( 4 << 2), x +   55.908 * s);
			_setf(o + ( 5 << 2), y +  -15.820 * s);
			_setf(o + ( 6 << 2), x +   55.908 * s);
			_setf(o + ( 7 << 2), y +   -6.885 * s);
			_setf(o + ( 8 << 2), x +    4.297 * s);
			_setf(o + ( 9 << 2), y +  -27.294 * s);
			_setf(o + (10 << 2), x +    4.297 * s);
			_setf(o + (11 << 2), y +  -35.400 * s);
			_setf(o + (12 << 2), x +   55.908 * s);
			_setf(o + (13 << 2), y +  -55.810 * s);
			_setf(o + (14 << 2), x +   55.908 * s);
			_setf(o + (15 << 2), y +  -46.923 * s);
			_setf(o + (16 << 2), x +   60.205 * s);
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
			_setf(o + ( 0 << 2), x +    4.296 * s);
			_setf(o + ( 1 << 2), y +  -25.586 * s);
			_setf(o + ( 2 << 2), x +   55.907 * s);
			_setf(o + ( 3 << 2), y +  -25.586 * s);
			_setf(o + ( 4 << 2), x +   55.907 * s);
			_setf(o + ( 5 << 2), y +  -17.187 * s);
			_setf(o + ( 6 << 2), x +    4.296 * s);
			_setf(o + ( 7 << 2), y +  -17.187 * s);
			_setf(o + ( 8 << 2), x +    4.296 * s);
			_setf(o + ( 9 << 2), y +  -25.586 * s);
			_setf(o + (10 << 2), x +    4.296 * s);
			_setf(o + (11 << 2), y +  -45.409 * s);
			_setf(o + (12 << 2), x +   55.907 * s);
			_setf(o + (13 << 2), y +  -45.409 * s);
			_setf(o + (14 << 2), x +   55.907 * s);
			_setf(o + (15 << 2), y +  -37.109 * s);
			_setf(o + (16 << 2), x +    4.296 * s);
			_setf(o + (17 << 2), y +  -37.109 * s);
			_setf(o + (18 << 2), x +    4.296 * s);
			_setf(o + (19 << 2), y +  -45.409 * s);
			_setf(o + (20 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +    4.297 * s);
			_setf(o + ( 1 << 2), y +  -46.923 * s);
			_setf(o + ( 2 << 2), x +    4.297 * s);
			_setf(o + ( 3 << 2), y +  -55.810 * s);
			_setf(o + ( 4 << 2), x +   55.907 * s);
			_setf(o + ( 5 << 2), y +  -35.400 * s);
			_setf(o + ( 6 << 2), x +   55.907 * s);
			_setf(o + ( 7 << 2), y +  -27.294 * s);
			_setf(o + ( 8 << 2), x +    4.297 * s);
			_setf(o + ( 9 << 2), y +   -6.885 * s);
			_setf(o + (10 << 2), x +    4.297 * s);
			_setf(o + (11 << 2), y +  -15.820 * s);
			_setf(o + (12 << 2), x +   45.800 * s);
			_setf(o + (13 << 2), y +  -31.298 * s);
			_setf(o + (14 << 2), x +    4.297 * s);
			_setf(o + (15 << 2), y +  -46.923 * s);
			_setf(o + (16 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   33.398 * s);
			_setf(o + ( 1 << 2), y +  -19.580 * s);
			_setf(o + ( 2 << 2), x +   24.121 * s);
			_setf(o + ( 3 << 2), y +  -19.580 * s);
			_setf(o + ( 4 << 2), x +   24.121 * s);
			_setf(o + ( 5 << 2), y +  -27.099 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   24.121 * s,y +  -27.099 * s,x +   24.121 * s,y +  -30.289 * s,x +   24.617 * s,y +  -32.999 * s,x +   25.610 * s,y +  -35.229 * s, threshold);
			_bez(x +   25.610 * s,y +  -35.229 * s,x +   26.603 * s,y +  -37.459 * s,x +   28.484 * s,y +  -39.891 * s,x +   31.201 * s,y +  -42.577 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   35.595 * s);
			_setf(o + ( 1 << 2), y +  -46.923 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   35.595 * s,y +  -46.923 * s,x +   37.576 * s,y +  -48.882 * s,x +   39.005 * s,y +  -50.520 * s,x +   39.770 * s,y +  -51.952 * s, threshold);
			_bez(x +   39.770 * s,y +  -51.952 * s,x +   40.535 * s,y +  -53.385 * s,x +   40.917 * s,y +  -54.898 * s,x +   40.917 * s,y +  -56.493 * s, threshold);
			_bez(x +   40.917 * s,y +  -56.493 * s,x +   40.917 * s,y +  -59.390 * s,x +   39.851 * s,y +  -61.734 * s,x +   37.719 * s,y +  -63.524 * s, threshold);
			_bez(x +   37.719 * s,y +  -63.524 * s,x +   35.587 * s,y +  -65.315 * s,x +   32.747 * s,y +  -66.210 * s,x +   29.199 * s,y +  -66.210 * s, threshold);
			_bez(x +   29.199 * s,y +  -66.210 * s,x +   26.660 * s,y +  -66.210 * s,x +   23.942 * s,y +  -65.648 * s,x +   21.044 * s,y +  -64.525 * s, threshold);
			_bez(x +   21.044 * s,y +  -64.525 * s,x +   18.147 * s,y +  -63.402 * s,x +   15.104 * s,y +  -61.734 * s,x +   11.914 * s,y +  -59.521 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   11.914 * s);
			_setf(o + ( 1 << 2), y +  -68.700 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   11.914 * s,y +  -68.700 * s,x +   14.974 * s,y +  -70.556 * s,x +   18.058 * s,y +  -71.939 * s,x +   21.167 * s,y +  -72.850 * s, threshold);
			_bez(x +   21.167 * s,y +  -72.850 * s,x +   24.275 * s,y +  -73.762 * s,x +   27.522 * s,y +  -74.218 * s,x +   30.908 * s,y +  -74.218 * s, threshold);
			_bez(x +   30.908 * s,y +  -74.218 * s,x +   36.962 * s,y +  -74.218 * s,x +   41.788 * s,y +  -72.655 * s,x +   45.385 * s,y +  -69.530 * s, threshold);
			_bez(x +   45.385 * s,y +  -69.530 * s,x +   48.982 * s,y +  -66.405 * s,x +   50.780 * s,y +  -62.222 * s,x +   50.780 * s,y +  -56.982 * s, threshold);
			_bez(x +   50.780 * s,y +  -56.982 * s,x +   50.780 * s,y +  -54.508 * s,x +   50.235 * s,y +  -52.205 * s,x +   49.145 * s,y +  -50.072 * s, threshold);
			_bez(x +   49.145 * s,y +  -50.072 * s,x +   48.054 * s,y +  -47.940 * s,x +   45.981 * s,y +  -45.374 * s,x +   42.919 * s,y +  -42.382 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   38.622 * s);
			_setf(o + ( 1 << 2), y +  -38.183 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   38.622 * s,y +  -38.183 * s,x +   36.400 * s,y +  -36.011 * s,x +   34.944 * s,y +  -34.277 * s,x +   34.326 * s,y +  -32.910 * s, threshold);
			_bez(x +   34.326 * s,y +  -32.910 * s,x +   33.707 * s,y +  -31.542 * s,x +   33.398 * s,y +  -29.866 * s,x +   33.398 * s,y +  -27.880 * s, threshold);
			o = _posf(16);
			_setf(o + ( 0 << 2), x +   33.398 * s);
			_setf(o + ( 1 << 2), y +  -25.586 * s);
			_setf(o + ( 2 << 2), x +   33.398 * s);
			_setf(o + ( 3 << 2), y +  -19.580 * s);
			_setf(o + ( 4 << 2), x +   23.779 * s);
			_setf(o + ( 5 << 2), y +  -12.402 * s);
			_setf(o + ( 6 << 2), x +   33.691 * s);
			_setf(o + ( 7 << 2), y +  -12.402 * s);
			_setf(o + ( 8 << 2), x +   33.691 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   23.779 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   23.779 * s);
			_setf(o + (13 << 2), y +  -12.402 * s);
			_setf(o + (14 << 2), x +   60.204 * s);
			_setf(o + (15 << 2), y +       0. * s);
			o = _posb(8);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 1);
			
			case 64:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   50.683 * s);
			_setf(o + ( 1 << 2), y +  -26.611 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   50.683 * s,y +  -26.611 * s,x +   50.683 * s,y +  -30.810 * s,x +   49.641 * s,y +  -34.171 * s,x +   47.558 * s,y +  -36.694 * s, threshold);
			_bez(x +   47.558 * s,y +  -36.694 * s,x +   45.475 * s,y +  -39.217 * s,x +   42.691 * s,y +  -40.478 * s,x +   39.208 * s,y +  -40.478 * s, threshold);
			_bez(x +   39.208 * s,y +  -40.478 * s,x +   35.725 * s,y +  -40.478 * s,x +   32.934 * s,y +  -39.217 * s,x +   30.835 * s,y +  -36.694 * s, threshold);
			_bez(x +   30.835 * s,y +  -36.694 * s,x +   28.735 * s,y +  -34.171 * s,x +   27.685 * s,y +  -30.810 * s,x +   27.685 * s,y +  -26.611 * s, threshold);
			_bez(x +   27.685 * s,y +  -26.611 * s,x +   27.685 * s,y +  -22.379 * s,x +   28.735 * s,y +  -19.002 * s,x +   30.835 * s,y +  -16.479 * s, threshold);
			_bez(x +   30.835 * s,y +  -16.479 * s,x +   32.934 * s,y +  -13.956 * s,x +   35.725 * s,y +  -12.695 * s,x +   39.208 * s,y +  -12.695 * s, threshold);
			_bez(x +   39.208 * s,y +  -12.695 * s,x +   42.691 * s,y +  -12.695 * s,x +   45.475 * s,y +  -13.956 * s,x +   47.558 * s,y +  -16.479 * s, threshold);
			_bez(x +   47.558 * s,y +  -16.479 * s,x +   49.641 * s,y +  -19.002 * s,x +   50.683 * s,y +  -22.379 * s,x +   50.683 * s,y +  -26.611 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   57.519 * s);
			_setf(o + ( 1 << 2), y +   -6.592 * s);
			_setf(o + ( 2 << 2), x +   50.488 * s);
			_setf(o + ( 3 << 2), y +   -6.592 * s);
			_setf(o + ( 4 << 2), x +   50.488 * s);
			_setf(o + ( 5 << 2), y +  -12.012 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   50.488 * s,y +  -12.012 * s,x +   49.283 * s,y +   -9.961 * s,x +   47.615 * s,y +   -8.382 * s,x +   45.483 * s,y +   -7.275 * s, threshold);
			_bez(x +   45.483 * s,y +   -7.275 * s,x +   43.351 * s,y +   -6.169 * s,x +   40.950 * s,y +   -5.615 * s,x +   38.281 * s,y +   -5.615 * s, threshold);
			_bez(x +   38.281 * s,y +   -5.615 * s,x +   33.040 * s,y +   -5.615 * s,x +   28.702 * s,y +   -7.585 * s,x +   25.268 * s,y +  -11.523 * s, threshold);
			_bez(x +   25.268 * s,y +  -11.523 * s,x +   21.834 * s,y +  -15.462 * s,x +   20.117 * s,y +  -20.491 * s,x +   20.117 * s,y +  -26.611 * s, threshold);
			_bez(x +   20.117 * s,y +  -26.611 * s,x +   20.117 * s,y +  -32.731 * s,x +   21.834 * s,y +  -37.760 * s,x +   25.268 * s,y +  -41.699 * s, threshold);
			_bez(x +   25.268 * s,y +  -41.699 * s,x +   28.702 * s,y +  -45.637 * s,x +   33.040 * s,y +  -47.607 * s,x +   38.281 * s,y +  -47.607 * s, threshold);
			_bez(x +   38.281 * s,y +  -47.607 * s,x +   40.885 * s,y +  -47.607 * s,x +   43.277 * s,y +  -47.037 * s,x +   45.458 * s,y +  -45.898 * s, threshold);
			_bez(x +   45.458 * s,y +  -45.898 * s,x +   47.639 * s,y +  -44.758 * s,x +   49.316 * s,y +  -43.196 * s,x +   50.488 * s,y +  -41.210 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   50.488 * s);
			_setf(o + ( 1 << 2), y +  -44.286 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   50.488 * s,y +  -44.286 * s,x +   50.488 * s,y +  -49.364 * s,x +   49.055 * s,y +  -53.450 * s,x +   46.191 * s,y +  -56.542 * s, threshold);
			_bez(x +   46.191 * s,y +  -56.542 * s,x +   43.326 * s,y +  -59.634 * s,x +   39.534 * s,y +  -61.181 * s,x +   34.814 * s,y +  -61.181 * s, threshold);
			_bez(x +   34.814 * s,y +  -61.181 * s,x +   26.806 * s,y +  -61.181 * s,x +   20.434 * s,y +  -58.064 * s,x +   15.698 * s,y +  -51.830 * s, threshold);
			_bez(x +   15.698 * s,y +  -51.830 * s,x +   10.962 * s,y +  -45.597 * s,x +    8.594 * s,y +  -37.158 * s,x +    8.594 * s,y +  -26.513 * s, threshold);
			_bez(x +    8.594 * s,y +  -26.513 * s,x +    8.594 * s,y +  -15.804 * s,x +   11.279 * s,y +   -7.275 * s,x +   16.650 * s,y +   -0.928 * s, threshold);
			_bez(x +   16.650 * s,y +   -0.928 * s,x +   22.021 * s,y +    5.420 * s,x +   29.166 * s,y +    8.594 * s,x +   38.085 * s,y +    8.594 * s, threshold);
			_bez(x +   38.085 * s,y +    8.594 * s,x +   39.843 * s,y +    8.594 * s,x +   41.601 * s,y +    8.431 * s,x +   43.359 * s,y +    8.105 * s, threshold);
			_bez(x +   43.359 * s,y +    8.105 * s,x +   45.117 * s,y +    7.780 * s,x +   46.923 * s,y +    7.275 * s,x +   48.779 * s,y +    6.592 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   51.122 * s);
			_setf(o + ( 1 << 2), y +   13.183 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   51.122 * s,y +   13.183 * s,x +   49.072 * s,y +   13.997 * s,x +   47.045 * s,y +   14.599 * s,x +   45.043 * s,y +   14.990 * s, threshold);
			_bez(x +   45.043 * s,y +   14.990 * s,x +   43.041 * s,y +   15.381 * s,x +   41.096 * s,y +   15.576 * s,x +   39.208 * s,y +   15.576 * s, threshold);
			_bez(x +   39.208 * s,y +   15.576 * s,x +   27.587 * s,y +   15.576 * s,x +   18.367 * s,y +   11.784 * s,x +   11.548 * s,y +    4.199 * s, threshold);
			_bez(x +   11.548 * s,y +    4.199 * s,x +    4.728 * s,y +   -3.385 * s,x +    1.318 * s,y +  -13.623 * s,x +    1.318 * s,y +  -26.513 * s, threshold);
			_bez(x +    1.318 * s,y +  -26.513 * s,x +    1.318 * s,y +  -39.208 * s,x +    4.378 * s,y +  -49.316 * s,x +   10.498 * s,y +  -56.835 * s, threshold);
			_bez(x +   10.498 * s,y +  -56.835 * s,x +   16.618 * s,y +  -64.354 * s,x +   24.821 * s,y +  -68.114 * s,x +   35.107 * s,y +  -68.114 * s, threshold);
			_bez(x +   35.107 * s,y +  -68.114 * s,x +   41.910 * s,y +  -68.114 * s,x +   47.346 * s,y +  -65.949 * s,x +   51.415 * s,y +  -61.620 * s, threshold);
			_bez(x +   51.415 * s,y +  -61.620 * s,x +   55.484 * s,y +  -57.291 * s,x +   57.519 * s,y +  -51.480 * s,x +   57.519 * s,y +  -44.189 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   57.519 * s);
			_setf(o + ( 1 << 2), y +   -6.592 * s);
			_setf(o + ( 2 << 2), x +   60.204 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 65:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   30.078 * s);
			_setf(o + ( 1 << 2), y +  -64.208 * s);
			_setf(o + ( 2 << 2), x +   19.677 * s);
			_setf(o + ( 3 << 2), y +  -26.904 * s);
			_setf(o + ( 4 << 2), x +   40.478 * s);
			_setf(o + ( 5 << 2), y +  -26.904 * s);
			_setf(o + ( 6 << 2), x +   30.078 * s);
			_setf(o + ( 7 << 2), y +  -64.208 * s);
			_setf(o + ( 8 << 2), x +   24.121 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   36.083 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   58.397 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   48.193 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   42.822 * s);
			_setf(o + (17 << 2), y +  -18.994 * s);
			_setf(o + (18 << 2), x +   17.285 * s);
			_setf(o + (19 << 2), y +  -18.994 * s);
			_setf(o + (20 << 2), x +   12.011 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +    1.807 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   24.121 * s);
			_setf(o + (25 << 2), y +  -72.899 * s);
			_setf(o + (26 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   18.017 * s);
			_setf(o + ( 1 << 2), y +  -34.814 * s);
			_setf(o + ( 2 << 2), x +   18.017 * s);
			_setf(o + ( 3 << 2), y +   -8.105 * s);
			_setf(o + ( 4 << 2), x +   29.687 * s);
			_setf(o + ( 5 << 2), y +   -8.105 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   29.687 * s,y +   -8.105 * s,x +   35.416 * s,y +   -8.105 * s,x +   39.501 * s,y +   -9.106 * s,x +   41.943 * s,y +  -11.108 * s, threshold);
			_bez(x +   41.943 * s,y +  -11.108 * s,x +   44.384 * s,y +  -13.110 * s,x +   45.605 * s,y +  -16.406 * s,x +   45.605 * s,y +  -20.996 * s, threshold);
			_bez(x +   45.605 * s,y +  -20.996 * s,x +   45.605 * s,y +  -25.748 * s,x +   44.319 * s,y +  -29.239 * s,x +   41.748 * s,y +  -31.469 * s, threshold);
			_bez(x +   41.748 * s,y +  -31.469 * s,x +   39.176 * s,y +  -33.699 * s,x +   35.156 * s,y +  -34.814 * s,x +   29.687 * s,y +  -34.814 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   18.017 * s);
			_setf(o + ( 1 << 2), y +  -34.814 * s);
			_setf(o + ( 2 << 2), x +   18.017 * s);
			_setf(o + ( 3 << 2), y +  -64.794 * s);
			_setf(o + ( 4 << 2), x +   18.017 * s);
			_setf(o + ( 5 << 2), y +  -42.822 * s);
			_setf(o + ( 6 << 2), x +   29.492 * s);
			_setf(o + ( 7 << 2), y +  -42.822 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_bez(x +   29.492 * s,y +  -42.822 * s,x +   34.244 * s,y +  -42.822 * s,x +   37.687 * s,y +  -43.733 * s,x +   39.819 * s,y +  -45.556 * s, threshold);
			_bez(x +   39.819 * s,y +  -45.556 * s,x +   41.951 * s,y +  -47.379 * s,x +   43.017 * s,y +  -50.325 * s,x +   43.017 * s,y +  -54.394 * s, threshold);
			_bez(x +   43.017 * s,y +  -54.394 * s,x +   43.017 * s,y +  -58.072 * s,x +   41.967 * s,y +  -60.725 * s,x +   39.868 * s,y +  -62.353 * s, threshold);
			_bez(x +   39.868 * s,y +  -62.353 * s,x +   37.768 * s,y +  -63.980 * s,x +   34.309 * s,y +  -64.794 * s,x +   29.492 * s,y +  -64.794 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   18.017 * s);
			_setf(o + ( 1 << 2), y +  -64.794 * s);
			_setf(o + ( 2 << 2), x +    8.105 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   29.687 * s);
			_setf(o + ( 5 << 2), y +  -72.899 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_setb(o +  2, 2);
			_bez(x +   29.687 * s,y +  -72.899 * s,x +   37.141 * s,y +  -72.899 * s,x +   42.887 * s,y +  -71.288 * s,x +   46.923 * s,y +  -68.065 * s, threshold);
			_bez(x +   46.923 * s,y +  -68.065 * s,x +   50.960 * s,y +  -64.843 * s,x +   52.978 * s,y +  -60.285 * s,x +   52.978 * s,y +  -54.394 * s, threshold);
			_bez(x +   52.978 * s,y +  -54.394 * s,x +   52.978 * s,y +  -49.934 * s,x +   51.912 * s,y +  -46.419 * s,x +   49.780 * s,y +  -43.847 * s, threshold);
			_bez(x +   49.780 * s,y +  -43.847 * s,x +   47.648 * s,y +  -41.275 * s,x +   44.449 * s,y +  -39.664 * s,x +   40.185 * s,y +  -39.013 * s, threshold);
			_bez(x +   40.185 * s,y +  -39.013 * s,x +   44.970 * s,y +  -38.297 * s,x +   48.722 * s,y +  -36.254 * s,x +   51.440 * s,y +  -32.885 * s, threshold);
			_bez(x +   51.440 * s,y +  -32.885 * s,x +   54.158 * s,y +  -29.516 * s,x +   55.517 * s,y +  -25.227 * s,x +   55.517 * s,y +  -20.019 * s, threshold);
			_bez(x +   55.517 * s,y +  -20.019 * s,x +   55.517 * s,y +  -13.411 * s,x +   53.352 * s,y +   -8.423 * s,x +   49.023 * s,y +   -5.054 * s, threshold);
			_bez(x +   49.023 * s,y +   -5.054 * s,x +   44.693 * s,y +   -1.685 * s,x +   38.248 * s,y +       0. * s,x +   29.687 * s,y +       0. * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    8.105 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    8.105 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   60.204 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 67:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   52.392 * s);
			_setf(o + ( 1 << 2), y +   -2.588 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   52.392 * s,y +   -2.588 * s,x +   49.886 * s,y +   -1.253 * s,x +   47.314 * s,y +   -0.252 * s,x +   44.677 * s,y +    0.415 * s, threshold);
			_bez(x +   44.677 * s,y +    0.415 * s,x +   42.041 * s,y +    1.082 * s,x +   39.241 * s,y +    1.416 * s,x +   36.279 * s,y +    1.416 * s, threshold);
			_bez(x +   36.279 * s,y +    1.416 * s,x +   26.937 * s,y +    1.416 * s,x +   19.686 * s,y +   -1.888 * s,x +   14.526 * s,y +   -8.496 * s, threshold);
			_bez(x +   14.526 * s,y +   -8.496 * s,x +    9.367 * s,y +  -15.104 * s,x +    6.787 * s,y +  -24.397 * s,x +    6.787 * s,y +  -36.376 * s, threshold);
			_bez(x +    6.787 * s,y +  -36.376 * s,x +    6.787 * s,y +  -48.291 * s,x +    9.383 * s,y +  -57.576 * s,x +   14.575 * s,y +  -64.232 * s, threshold);
			_bez(x +   14.575 * s,y +  -64.232 * s,x +   19.767 * s,y +  -70.889 * s,x +   27.001 * s,y +  -74.218 * s,x +   36.279 * s,y +  -74.218 * s, threshold);
			_bez(x +   36.279 * s,y +  -74.218 * s,x +   39.241 * s,y +  -74.218 * s,x +   42.041 * s,y +  -73.884 * s,x +   44.677 * s,y +  -73.217 * s, threshold);
			_bez(x +   44.677 * s,y +  -73.217 * s,x +   47.314 * s,y +  -72.549 * s,x +   49.886 * s,y +  -71.548 * s,x +   52.392 * s,y +  -70.214 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   52.392 * s);
			_setf(o + ( 1 << 2), y +  -60.106 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   52.392 * s,y +  -60.106 * s,x +   49.983 * s,y +  -62.092 * s,x +   47.395 * s,y +  -63.606 * s,x +   44.629 * s,y +  -64.647 * s, threshold);
			_bez(x +   44.629 * s,y +  -64.647 * s,x +   41.862 * s,y +  -65.689 * s,x +   39.079 * s,y +  -66.210 * s,x +   36.279 * s,y +  -66.210 * s, threshold);
			_bez(x +   36.279 * s,y +  -66.210 * s,x +   29.866 * s,y +  -66.210 * s,x +   25.065 * s,y +  -63.736 * s,x +   21.875 * s,y +  -58.788 * s, threshold);
			_bez(x +   21.875 * s,y +  -58.788 * s,x +   18.685 * s,y +  -53.840 * s,x +   17.090 * s,y +  -46.369 * s,x +   17.090 * s,y +  -36.376 * s, threshold);
			_bez(x +   17.090 * s,y +  -36.376 * s,x +   17.090 * s,y +  -26.415 * s,x +   18.685 * s,y +  -18.961 * s,x +   21.875 * s,y +  -14.013 * s, threshold);
			_bez(x +   21.875 * s,y +  -14.013 * s,x +   25.065 * s,y +   -9.066 * s,x +   29.867 * s,y +   -6.592 * s,x +   36.279 * s,y +   -6.592 * s, threshold);
			_bez(x +   36.279 * s,y +   -6.592 * s,x +   39.143 * s,y +   -6.592 * s,x +   41.951 * s,y +   -7.113 * s,x +   44.702 * s,y +   -8.154 * s, threshold);
			_bez(x +   44.702 * s,y +   -8.154 * s,x +   47.452 * s,y +   -9.196 * s,x +   50.016 * s,y +  -10.709 * s,x +   52.392 * s,y +  -12.695 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   52.392 * s);
			_setf(o + ( 1 << 2), y +   -2.588 * s);
			_setf(o + ( 2 << 2), x +   60.204 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 68:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   21.289 * s);
			_setf(o + ( 1 << 2), y +   -8.105 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   21.289 * s,y +   -8.105 * s,x +   29.590 * s,y +   -8.105 * s,x +   35.384 * s,y +  -10.148 * s,x +   38.672 * s,y +  -14.233 * s, threshold);
			_bez(x +   38.672 * s,y +  -14.233 * s,x +   41.959 * s,y +  -18.318 * s,x +   43.603 * s,y +  -25.699 * s,x +   43.603 * s,y +  -36.376 * s, threshold);
			_bez(x +   43.603 * s,y +  -36.376 * s,x +   43.603 * s,y +  -47.151 * s,x +   41.968 * s,y +  -54.581 * s,x +   38.696 * s,y +  -58.666 * s, threshold);
			_bez(x +   38.696 * s,y +  -58.666 * s,x +   35.425 * s,y +  -62.751 * s,x +   29.622 * s,y +  -64.794 * s,x +   21.289 * s,y +  -64.794 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   16.602 * s);
			_setf(o + ( 1 << 2), y +  -64.794 * s);
			_setf(o + ( 2 << 2), x +   16.602 * s);
			_setf(o + ( 3 << 2), y +   -8.105 * s);
			_setf(o + ( 4 << 2), x +   21.289 * s);
			_setf(o + ( 5 << 2), y +   -8.105 * s);
			_setf(o + ( 6 << 2), x +   21.484 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			_bez(x +   21.484 * s,y +  -72.899 * s,x +   32.617 * s,y +  -72.899 * s,x +   40.820 * s,y +  -69.937 * s,x +   46.093 * s,y +  -64.013 * s, threshold);
			_bez(x +   46.093 * s,y +  -64.013 * s,x +   51.367 * s,y +  -58.088 * s,x +   54.004 * s,y +  -48.876 * s,x +   54.004 * s,y +  -36.376 * s, threshold);
			_bez(x +   54.004 * s,y +  -36.376 * s,x +   54.004 * s,y +  -23.942 * s,x +   51.367 * s,y +  -14.770 * s,x +   46.093 * s,y +   -8.862 * s, threshold);
			_bez(x +   46.093 * s,y +   -8.862 * s,x +   40.820 * s,y +   -2.954 * s,x +   32.617 * s,y +       0. * s,x +   21.484 * s,y +       0. * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +    6.690 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    6.690 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   21.484 * s);
			_setf(o + ( 5 << 2), y +  -72.899 * s);
			_setf(o + ( 6 << 2), x +   60.205 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			
			case 69:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +    9.619 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   52.880 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   52.880 * s);
			_setf(o + ( 5 << 2), y +  -64.599 * s);
			_setf(o + ( 6 << 2), x +   19.482 * s);
			_setf(o + ( 7 << 2), y +  -64.599 * s);
			_setf(o + ( 8 << 2), x +   19.482 * s);
			_setf(o + ( 9 << 2), y +  -43.017 * s);
			_setf(o + (10 << 2), x +   51.415 * s);
			_setf(o + (11 << 2), y +  -43.017 * s);
			_setf(o + (12 << 2), x +   51.415 * s);
			_setf(o + (13 << 2), y +  -34.716 * s);
			_setf(o + (14 << 2), x +   19.482 * s);
			_setf(o + (15 << 2), y +  -34.716 * s);
			_setf(o + (16 << 2), x +   19.482 * s);
			_setf(o + (17 << 2), y +   -8.301 * s);
			_setf(o + (18 << 2), x +   53.807 * s);
			_setf(o + (19 << 2), y +   -8.301 * s);
			_setf(o + (20 << 2), x +   53.807 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +    9.619 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +    9.619 * s);
			_setf(o + (25 << 2), y +  -72.899 * s);
			_setf(o + (26 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   11.377 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   54.296 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   54.296 * s);
			_setf(o + ( 5 << 2), y +  -64.599 * s);
			_setf(o + ( 6 << 2), x +   21.288 * s);
			_setf(o + ( 7 << 2), y +  -64.599 * s);
			_setf(o + ( 8 << 2), x +   21.288 * s);
			_setf(o + ( 9 << 2), y +  -43.115 * s);
			_setf(o + (10 << 2), x +   51.220 * s);
			_setf(o + (11 << 2), y +  -43.115 * s);
			_setf(o + (12 << 2), x +   51.220 * s);
			_setf(o + (13 << 2), y +  -34.814 * s);
			_setf(o + (14 << 2), x +   21.288 * s);
			_setf(o + (15 << 2), y +  -34.814 * s);
			_setf(o + (16 << 2), x +   21.288 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   11.377 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   11.377 * s);
			_setf(o + (21 << 2), y +  -72.899 * s);
			_setf(o + (22 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   53.905 * s);
			_setf(o + ( 1 << 2), y +   -6.006 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   53.905 * s,y +   -6.006 * s,x +   51.269 * s,y +   -3.564 * s,x +   48.298 * s,y +   -1.717 * s,x +   44.994 * s,y +   -0.464 * s, threshold);
			_bez(x +   44.994 * s,y +   -0.464 * s,x +   41.690 * s,y +    0.789 * s,x +   38.118 * s,y +    1.416 * s,x +   34.277 * s,y +    1.416 * s, threshold);
			_bez(x +   34.277 * s,y +    1.416 * s,x +   25.032 * s,y +    1.416 * s,x +   17.838 * s,y +   -1.896 * s,x +   12.695 * s,y +   -8.520 * s, threshold);
			_bez(x +   12.695 * s,y +   -8.520 * s,x +    7.552 * s,y +  -15.145 * s,x +    4.980 * s,y +  -24.430 * s,x +    4.980 * s,y +  -36.376 * s, threshold);
			_bez(x +    4.980 * s,y +  -36.376 * s,x +    4.980 * s,y +  -48.291 * s,x +    7.584 * s,y +  -57.576 * s,x +   12.793 * s,y +  -64.232 * s, threshold);
			_bez(x +   12.793 * s,y +  -64.232 * s,x +   18.001 * s,y +  -70.889 * s,x +   25.243 * s,y +  -74.218 * s,x +   34.521 * s,y +  -74.218 * s, threshold);
			_bez(x +   34.521 * s,y +  -74.218 * s,x +   37.581 * s,y +  -74.218 * s,x +   40.510 * s,y +  -73.786 * s,x +   43.310 * s,y +  -72.924 * s, threshold);
			_bez(x +   43.310 * s,y +  -72.924 * s,x +   46.109 * s,y +  -72.061 * s,x +   48.811 * s,y +  -70.751 * s,x +   51.415 * s,y +  -68.993 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   51.415 * s);
			_setf(o + ( 1 << 2), y +  -58.886 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   51.415 * s,y +  -58.886 * s,x +   48.778 * s,y +  -61.392 * s,x +   46.077 * s,y +  -63.240 * s,x +   43.310 * s,y +  -64.428 * s, threshold);
			_bez(x +   43.310 * s,y +  -64.428 * s,x +   40.543 * s,y +  -65.616 * s,x +   37.613 * s,y +  -66.210 * s,x +   34.521 * s,y +  -66.210 * s, threshold);
			_bez(x +   34.521 * s,y +  -66.210 * s,x +   28.108 * s,y +  -66.210 * s,x +   23.299 * s,y +  -63.728 * s,x +   20.092 * s,y +  -58.764 * s, threshold);
			_bez(x +   20.092 * s,y +  -58.764 * s,x +   16.886 * s,y +  -53.800 * s,x +   15.283 * s,y +  -46.338 * s,x +   15.283 * s,y +  -36.376 * s, threshold);
			_bez(x +   15.283 * s,y +  -36.376 * s,x +   15.283 * s,y +  -26.253 * s,x +   16.837 * s,y +  -18.758 * s,x +   19.946 * s,y +  -13.891 * s, threshold);
			_bez(x +   19.946 * s,y +  -13.891 * s,x +   23.055 * s,y +   -9.025 * s,x +   27.831 * s,y +   -6.592 * s,x +   34.277 * s,y +   -6.592 * s, threshold);
			_bez(x +   34.277 * s,y +   -6.592 * s,x +   36.458 * s,y +   -6.592 * s,x +   38.370 * s,y +   -6.844 * s,x +   40.014 * s,y +   -7.349 * s, threshold);
			_bez(x +   40.014 * s,y +   -7.349 * s,x +   41.658 * s,y +   -7.853 * s,x +   43.147 * s,y +   -8.642 * s,x +   44.482 * s,y +   -9.717 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   44.482 * s);
			_setf(o + ( 1 << 2), y +  -29.296 * s);
			_setf(o + ( 2 << 2), x +   33.886 * s);
			_setf(o + ( 3 << 2), y +  -29.296 * s);
			_setf(o + ( 4 << 2), x +   33.886 * s);
			_setf(o + ( 5 << 2), y +  -37.402 * s);
			_setf(o + ( 6 << 2), x +   53.905 * s);
			_setf(o + ( 7 << 2), y +  -37.402 * s);
			_setf(o + ( 8 << 2), x +   53.905 * s);
			_setf(o + ( 9 << 2), y +   -6.006 * s);
			_setf(o + (10 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +    6.689 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   16.601 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   16.601 * s);
			_setf(o + ( 5 << 2), y +  -43.017 * s);
			_setf(o + ( 6 << 2), x +   43.603 * s);
			_setf(o + ( 7 << 2), y +  -43.017 * s);
			_setf(o + ( 8 << 2), x +   43.603 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   53.515 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   53.515 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   43.603 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   43.603 * s);
			_setf(o + (17 << 2), y +  -34.716 * s);
			_setf(o + (18 << 2), x +   16.601 * s);
			_setf(o + (19 << 2), y +  -34.716 * s);
			_setf(o + (20 << 2), x +   16.601 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +    6.689 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +    6.689 * s);
			_setf(o + (25 << 2), y +  -72.899 * s);
			_setf(o + (26 << 2), x +   60.204 * s);
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
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +    9.814 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   50.292 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   50.292 * s);
			_setf(o + ( 5 << 2), y +  -64.599 * s);
			_setf(o + ( 6 << 2), x +   35.009 * s);
			_setf(o + ( 7 << 2), y +  -64.599 * s);
			_setf(o + ( 8 << 2), x +   35.009 * s);
			_setf(o + ( 9 << 2), y +   -8.301 * s);
			_setf(o + (10 << 2), x +   50.292 * s);
			_setf(o + (11 << 2), y +   -8.301 * s);
			_setf(o + (12 << 2), x +   50.292 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +    9.814 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +    9.814 * s);
			_setf(o + (17 << 2), y +   -8.301 * s);
			_setf(o + (18 << 2), x +   25.097 * s);
			_setf(o + (19 << 2), y +   -8.301 * s);
			_setf(o + (20 << 2), x +   25.097 * s);
			_setf(o + (21 << 2), y +  -64.599 * s);
			_setf(o + (22 << 2), x +    9.814 * s);
			_setf(o + (23 << 2), y +  -64.599 * s);
			_setf(o + (24 << 2), x +    9.814 * s);
			_setf(o + (25 << 2), y +  -72.899 * s);
			_setf(o + (26 << 2), x +   60.204 * s);
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
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    5.322 * s);
			_setf(o + ( 1 << 2), y +   -2.978 * s);
			_setf(o + ( 2 << 2), x +    5.322 * s);
			_setf(o + ( 3 << 2), y +  -14.502 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +    5.322 * s,y +  -14.502 * s,x +    8.284 * s,y +  -11.865 * s,x +   11.344 * s,y +   -9.888 * s,x +   14.502 * s,y +   -8.569 * s, threshold);
			_bez(x +   14.502 * s,y +   -8.569 * s,x +   17.659 * s,y +   -7.251 * s,x +   20.931 * s,y +   -6.592 * s,x +   24.316 * s,y +   -6.592 * s, threshold);
			_bez(x +   24.316 * s,y +   -6.592 * s,x +   28.971 * s,y +   -6.592 * s,x +   32.218 * s,y +   -7.804 * s,x +   34.057 * s,y +  -10.229 * s, threshold);
			_bez(x +   34.057 * s,y +  -10.229 * s,x +   35.896 * s,y +  -12.654 * s,x +   36.816 * s,y +  -17.171 * s,x +   36.816 * s,y +  -23.779 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   36.816 * s);
			_setf(o + ( 1 << 2), y +  -64.599 * s);
			_setf(o + ( 2 << 2), x +   18.213 * s);
			_setf(o + ( 3 << 2), y +  -64.599 * s);
			_setf(o + ( 4 << 2), x +   18.213 * s);
			_setf(o + ( 5 << 2), y +  -72.899 * s);
			_setf(o + ( 6 << 2), x +   46.679 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   46.679 * s);
			_setf(o + ( 9 << 2), y +  -23.779 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   46.679 * s,y +  -23.779 * s,x +   46.679 * s,y +  -14.599 * s,x +   44.962 * s,y +   -8.105 * s,x +   41.528 * s,y +   -4.297 * s, threshold);
			_bez(x +   41.528 * s,y +   -4.297 * s,x +   38.094 * s,y +   -0.488 * s,x +   32.357 * s,y +    1.416 * s,x +   24.316 * s,y +    1.416 * s, threshold);
			_bez(x +   24.316 * s,y +    1.416 * s,x +   21.191 * s,y +    1.416 * s,x +   18.082 * s,y +    1.058 * s,x +   14.990 * s,y +    0.342 * s, threshold);
			_bez(x +   14.990 * s,y +    0.342 * s,x +   11.898 * s,y +   -0.374 * s,x +    8.675 * s,y +   -1.481 * s,x +    5.322 * s,y +   -2.978 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 75:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +    6.690 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   16.602 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   16.602 * s);
			_setf(o + ( 5 << 2), y +  -40.478 * s);
			_setf(o + ( 6 << 2), x +   47.412 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   58.984 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   30.615 * s);
			_setf(o + (11 << 2), y +  -43.115 * s);
			_setf(o + (12 << 2), x +   59.814 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   47.900 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   24.121 * s);
			_setf(o + (17 << 2), y +  -36.523 * s);
			_setf(o + (18 << 2), x +   16.602 * s);
			_setf(o + (19 << 2), y +  -28.515 * s);
			_setf(o + (20 << 2), x +   16.602 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +    6.690 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +    6.690 * s);
			_setf(o + (25 << 2), y +  -72.899 * s);
			_setf(o + (26 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   10.498 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   20.410 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   20.410 * s);
			_setf(o + ( 5 << 2), y +   -8.301 * s);
			_setf(o + ( 6 << 2), x +   55.615 * s);
			_setf(o + ( 7 << 2), y +   -8.301 * s);
			_setf(o + ( 8 << 2), x +   55.615 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   10.498 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   10.498 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   60.205 * s);
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
			_setf(o + ( 0 << 2), x +    4.199 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   17.382 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   29.980 * s);
			_setf(o + ( 5 << 2), y +  -35.790 * s);
			_setf(o + ( 6 << 2), x +   42.675 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   55.907 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   55.907 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   46.776 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   46.776 * s);
			_setf(o + (15 << 2), y +  -64.403 * s);
			_setf(o + (16 << 2), x +   33.788 * s);
			_setf(o + (17 << 2), y +  -25.976 * s);
			_setf(o + (18 << 2), x +   26.318 * s);
			_setf(o + (19 << 2), y +  -25.976 * s);
			_setf(o + (20 << 2), x +   13.281 * s);
			_setf(o + (21 << 2), y +  -64.403 * s);
			_setf(o + (22 << 2), x +   13.281 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +    4.199 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +    4.199 * s);
			_setf(o + (27 << 2), y +  -72.899 * s);
			_setf(o + (28 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +    6.787 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   19.287 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   43.896 * s);
			_setf(o + ( 5 << 2), y +  -12.890 * s);
			_setf(o + ( 6 << 2), x +   43.896 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   53.417 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   53.417 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   40.917 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   16.308 * s);
			_setf(o + (15 << 2), y +  -60.009 * s);
			_setf(o + (16 << 2), x +   16.308 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +    6.787 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +    6.787 * s);
			_setf(o + (21 << 2), y +  -72.899 * s);
			_setf(o + (22 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   44.189 * s);
			_setf(o + ( 1 << 2), y +  -36.376 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   44.189 * s,y +  -36.376 * s,x +   44.189 * s,y +  -47.086 * s,x +   43.090 * s,y +  -54.735 * s,x +   40.893 * s,y +  -59.325 * s, threshold);
			_bez(x +   40.893 * s,y +  -59.325 * s,x +   38.696 * s,y +  -63.915 * s,x +   35.091 * s,y +  -66.210 * s,x +   30.078 * s,y +  -66.210 * s, threshold);
			_bez(x +   30.078 * s,y +  -66.210 * s,x +   25.097 * s,y +  -66.210 * s,x +   21.508 * s,y +  -63.915 * s,x +   19.311 * s,y +  -59.325 * s, threshold);
			_bez(x +   19.311 * s,y +  -59.325 * s,x +   17.114 * s,y +  -54.735 * s,x +   16.015 * s,y +  -47.086 * s,x +   16.015 * s,y +  -36.376 * s, threshold);
			_bez(x +   16.015 * s,y +  -36.376 * s,x +   16.015 * s,y +  -25.700 * s,x +   17.114 * s,y +  -18.066 * s,x +   19.311 * s,y +  -13.476 * s, threshold);
			_bez(x +   19.311 * s,y +  -13.476 * s,x +   21.508 * s,y +   -8.887 * s,x +   25.097 * s,y +   -6.592 * s,x +   30.078 * s,y +   -6.592 * s, threshold);
			_bez(x +   30.078 * s,y +   -6.592 * s,x +   35.091 * s,y +   -6.592 * s,x +   38.696 * s,y +   -8.878 * s,x +   40.893 * s,y +  -13.452 * s, threshold);
			_bez(x +   40.893 * s,y +  -13.452 * s,x +   43.090 * s,y +  -18.025 * s,x +   44.189 * s,y +  -25.667 * s,x +   44.189 * s,y +  -36.376 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   54.491 * s);
			_setf(o + ( 1 << 2), y +  -36.376 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   54.491 * s,y +  -36.376 * s,x +   54.491 * s,y +  -23.681 * s,x +   52.481 * s,y +  -14.209 * s,x +   48.461 * s,y +   -7.959 * s, threshold);
			_bez(x +   48.461 * s,y +   -7.959 * s,x +   44.441 * s,y +   -1.709 * s,x +   38.313 * s,y +    1.416 * s,x +   30.078 * s,y +    1.416 * s, threshold);
			_bez(x +   30.078 * s,y +    1.416 * s,x +   21.842 * s,y +    1.416 * s,x +   15.722 * s,y +   -1.693 * s,x +   11.718 * s,y +   -7.910 * s, threshold);
			_bez(x +   11.718 * s,y +   -7.910 * s,x +    7.715 * s,y +  -14.127 * s,x +    5.713 * s,y +  -23.616 * s,x +    5.713 * s,y +  -36.376 * s, threshold);
			_bez(x +    5.713 * s,y +  -36.376 * s,x +    5.713 * s,y +  -49.104 * s,x +    7.723 * s,y +  -58.593 * s,x +   11.743 * s,y +  -64.843 * s, threshold);
			_bez(x +   11.743 * s,y +  -64.843 * s,x +   15.763 * s,y +  -71.093 * s,x +   21.874 * s,y +  -74.218 * s,x +   30.078 * s,y +  -74.218 * s, threshold);
			_bez(x +   30.078 * s,y +  -74.218 * s,x +   38.313 * s,y +  -74.218 * s,x +   44.441 * s,y +  -71.093 * s,x +   48.461 * s,y +  -64.843 * s, threshold);
			_bez(x +   48.461 * s,y +  -64.843 * s,x +   52.481 * s,y +  -58.593 * s,x +   54.491 * s,y +  -49.104 * s,x +   54.491 * s,y +  -36.376 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 80:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   19.482 * s);
			_setf(o + ( 1 << 2), y +  -64.794 * s);
			_setf(o + ( 2 << 2), x +   19.482 * s);
			_setf(o + ( 3 << 2), y +  -37.402 * s);
			_setf(o + ( 4 << 2), x +   30.908 * s);
			_setf(o + ( 5 << 2), y +  -37.402 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   30.908 * s,y +  -37.402 * s,x +   35.465 * s,y +  -37.402 * s,x +   39.021 * s,y +  -38.606 * s,x +   41.577 * s,y +  -41.015 * s, threshold);
			_bez(x +   41.577 * s,y +  -41.015 * s,x +   44.132 * s,y +  -43.424 * s,x +   45.409 * s,y +  -46.793 * s,x +   45.409 * s,y +  -51.122 * s, threshold);
			_bez(x +   45.409 * s,y +  -51.122 * s,x +   45.409 * s,y +  -55.452 * s,x +   44.140 * s,y +  -58.813 * s,x +   41.601 * s,y +  -61.205 * s, threshold);
			_bez(x +   41.601 * s,y +  -61.205 * s,x +   39.062 * s,y +  -63.598 * s,x +   35.498 * s,y +  -64.794 * s,x +   30.908 * s,y +  -64.794 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   19.482 * s);
			_setf(o + ( 1 << 2), y +  -64.794 * s);
			_setf(o + ( 2 << 2), x +    9.619 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   30.908 * s);
			_setf(o + ( 5 << 2), y +  -72.899 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_setb(o +  2, 2);
			_bez(x +   30.908 * s,y +  -72.899 * s,x +   39.046 * s,y +  -72.899 * s,x +   45.214 * s,y +  -71.052 * s,x +   49.413 * s,y +  -67.357 * s, threshold);
			_bez(x +   49.413 * s,y +  -67.357 * s,x +   53.612 * s,y +  -63.663 * s,x +   55.712 * s,y +  -58.251 * s,x +   55.712 * s,y +  -51.122 * s, threshold);
			_bez(x +   55.712 * s,y +  -51.122 * s,x +   55.712 * s,y +  -43.928 * s,x +   53.621 * s,y +  -38.492 * s,x +   49.438 * s,y +  -34.814 * s, threshold);
			_bez(x +   49.438 * s,y +  -34.814 * s,x +   45.255 * s,y +  -31.136 * s,x +   39.078 * s,y +  -29.296 * s,x +   30.908 * s,y +  -29.296 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   19.482 * s);
			_setf(o + ( 1 << 2), y +  -29.296 * s);
			_setf(o + ( 2 << 2), x +   19.482 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    9.619 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    9.619 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   60.204 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 1);
			
			case 81:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   31.982 * s);
			_setf(o + ( 1 << 2), y +    1.318 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   31.982 * s,y +    1.318 * s,x +   31.754 * s,y +    1.318 * s,x +   31.429 * s,y +    1.335 * s,x +   31.005 * s,y +    1.367 * s, threshold);
			_bez(x +   31.005 * s,y +    1.367 * s,x +   30.582 * s,y +    1.400 * s,x +   30.240 * s,y +    1.416 * s,x +   29.980 * s,y +    1.416 * s, threshold);
			_bez(x +   29.980 * s,y +    1.416 * s,x +   21.842 * s,y +    1.416 * s,x +   15.763 * s,y +   -1.709 * s,x +   11.743 * s,y +   -7.959 * s, threshold);
			_bez(x +   11.743 * s,y +   -7.959 * s,x +    7.723 * s,y +  -14.209 * s,x +    5.713 * s,y +  -23.681 * s,x +    5.713 * s,y +  -36.376 * s, threshold);
			_bez(x +    5.713 * s,y +  -36.376 * s,x +    5.713 * s,y +  -49.104 * s,x +    7.723 * s,y +  -58.593 * s,x +   11.743 * s,y +  -64.843 * s, threshold);
			_bez(x +   11.743 * s,y +  -64.843 * s,x +   15.763 * s,y +  -71.093 * s,x +   21.874 * s,y +  -74.218 * s,x +   30.078 * s,y +  -74.218 * s, threshold);
			_bez(x +   30.078 * s,y +  -74.218 * s,x +   38.313 * s,y +  -74.218 * s,x +   44.441 * s,y +  -71.093 * s,x +   48.461 * s,y +  -64.843 * s, threshold);
			_bez(x +   48.461 * s,y +  -64.843 * s,x +   52.481 * s,y +  -58.593 * s,x +   54.491 * s,y +  -49.104 * s,x +   54.491 * s,y +  -36.376 * s, threshold);
			_bez(x +   54.491 * s,y +  -36.376 * s,x +   54.491 * s,y +  -26.806 * s,x +   53.376 * s,y +  -19.100 * s,x +   51.147 * s,y +  -13.257 * s, threshold);
			_bez(x +   51.147 * s,y +  -13.257 * s,x +   48.917 * s,y +   -7.414 * s,x +   45.540 * s,y +   -3.320 * s,x +   41.015 * s,y +   -0.976 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   50.780 * s);
			_setf(o + ( 1 << 2), y +    8.301 * s);
			_setf(o + ( 2 << 2), x +   43.407 * s);
			_setf(o + ( 3 << 2), y +   13.183 * s);
			_setf(o + ( 4 << 2), x +   31.982 * s);
			_setf(o + ( 5 << 2), y +    1.318 * s);
			_setf(o + ( 6 << 2), x +   44.189 * s);
			_setf(o + ( 7 << 2), y +  -36.376 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			_bez(x +   44.189 * s,y +  -36.376 * s,x +   44.189 * s,y +  -47.086 * s,x +   43.090 * s,y +  -54.735 * s,x +   40.893 * s,y +  -59.325 * s, threshold);
			_bez(x +   40.893 * s,y +  -59.325 * s,x +   38.696 * s,y +  -63.915 * s,x +   35.091 * s,y +  -66.210 * s,x +   30.078 * s,y +  -66.210 * s, threshold);
			_bez(x +   30.078 * s,y +  -66.210 * s,x +   25.097 * s,y +  -66.210 * s,x +   21.508 * s,y +  -63.915 * s,x +   19.311 * s,y +  -59.325 * s, threshold);
			_bez(x +   19.311 * s,y +  -59.325 * s,x +   17.114 * s,y +  -54.735 * s,x +   16.015 * s,y +  -47.086 * s,x +   16.015 * s,y +  -36.376 * s, threshold);
			_bez(x +   16.015 * s,y +  -36.376 * s,x +   16.015 * s,y +  -25.700 * s,x +   17.114 * s,y +  -18.066 * s,x +   19.311 * s,y +  -13.476 * s, threshold);
			_bez(x +   19.311 * s,y +  -13.476 * s,x +   21.508 * s,y +   -8.887 * s,x +   25.097 * s,y +   -6.592 * s,x +   30.078 * s,y +   -6.592 * s, threshold);
			_bez(x +   30.078 * s,y +   -6.592 * s,x +   35.091 * s,y +   -6.592 * s,x +   38.696 * s,y +   -8.878 * s,x +   40.893 * s,y +  -13.452 * s, threshold);
			_bez(x +   40.893 * s,y +  -13.452 * s,x +   43.090 * s,y +  -18.025 * s,x +   44.189 * s,y +  -25.667 * s,x +   44.189 * s,y +  -36.376 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 82:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   37.109 * s);
			_setf(o + ( 1 << 2), y +  -34.423 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   37.109 * s,y +  -34.423 * s,x +   39.648 * s,y +  -33.772 * s,x +   41.813 * s,y +  -32.543 * s,x +   43.603 * s,y +  -30.737 * s, threshold);
			_bez(x +   43.603 * s,y +  -30.737 * s,x +   45.393 * s,y +  -28.930 * s,x +   47.608 * s,y +  -25.317 * s,x +   50.292 * s,y +  -19.922 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   49.609 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   40.917 * s);
			_setf(o + ( 5 << 2), y +  -18.408 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   40.917 * s,y +  -18.408 * s,x +   38.437 * s,y +  -23.661 * s,x +   36.157 * s,y +  -27.026 * s,x +   34.155 * s,y +  -28.540 * s, threshold);
			_bez(x +   34.155 * s,y +  -28.540 * s,x +   32.153 * s,y +  -30.053 * s,x +   29.541 * s,y +  -30.810 * s,x +   26.318 * s,y +  -30.810 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   16.894 * s);
			_setf(o + ( 1 << 2), y +  -30.810 * s);
			_setf(o + ( 2 << 2), x +   16.894 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    6.982 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    6.982 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   27.294 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   27.294 * s,y +  -72.899 * s,x +   35.302 * s,y +  -72.899 * s,x +   41.438 * s,y +  -71.093 * s,x +   45.703 * s,y +  -67.479 * s, threshold);
			_bez(x +   45.703 * s,y +  -67.479 * s,x +   49.967 * s,y +  -63.866 * s,x +   52.099 * s,y +  -58.642 * s,x +   52.099 * s,y +  -51.806 * s, threshold);
			_bez(x +   52.099 * s,y +  -51.806 * s,x +   52.099 * s,y +  -46.988 * s,x +   50.789 * s,y +  -43.058 * s,x +   48.168 * s,y +  -40.014 * s, threshold);
			_bez(x +   48.168 * s,y +  -40.014 * s,x +   45.548 * s,y +  -36.970 * s,x +   41.861 * s,y +  -35.107 * s,x +   37.109 * s,y +  -34.423 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   16.894 * s);
			_setf(o + ( 1 << 2), y +  -64.794 * s);
			_setf(o + ( 2 << 2), x +   16.894 * s);
			_setf(o + ( 3 << 2), y +  -38.915 * s);
			_setf(o + ( 4 << 2), x +   27.685 * s);
			_setf(o + ( 5 << 2), y +  -38.915 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   27.685 * s,y +  -38.915 * s,x +   32.405 * s,y +  -38.915 * s,x +   35.921 * s,y +  -39.973 * s,x +   38.232 * s,y +  -42.089 * s, threshold);
			_bez(x +   38.232 * s,y +  -42.089 * s,x +   40.543 * s,y +  -44.205 * s,x +   41.699 * s,y +  -47.444 * s,x +   41.699 * s,y +  -51.806 * s, threshold);
			_bez(x +   41.699 * s,y +  -51.806 * s,x +   41.699 * s,y +  -56.005 * s,x +   40.470 * s,y +  -59.219 * s,x +   38.012 * s,y +  -61.449 * s, threshold);
			_bez(x +   38.012 * s,y +  -61.449 * s,x +   35.555 * s,y +  -63.679 * s,x +   31.982 * s,y +  -64.794 * s,x +   27.294 * s,y +  -64.794 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   16.894 * s);
			_setf(o + ( 1 << 2), y +  -64.794 * s);
			_setf(o + ( 2 << 2), x +   60.204 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 83:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   49.414 * s);
			_setf(o + ( 1 << 2), y +  -70.409 * s);
			_setf(o + ( 2 << 2), x +   49.414 * s);
			_setf(o + ( 3 << 2), y +  -60.399 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   49.414 * s,y +  -60.399 * s,x +   46.419 * s,y +  -62.320 * s,x +   43.416 * s,y +  -63.769 * s,x +   40.405 * s,y +  -64.745 * s, threshold);
			_bez(x +   40.405 * s,y +  -64.745 * s,x +   37.394 * s,y +  -65.722 * s,x +   34.358 * s,y +  -66.210 * s,x +   31.299 * s,y +  -66.210 * s, threshold);
			_bez(x +   31.299 * s,y +  -66.210 * s,x +   26.644 * s,y +  -66.210 * s,x +   22.965 * s,y +  -65.128 * s,x +   20.264 * s,y +  -62.963 * s, threshold);
			_bez(x +   20.264 * s,y +  -62.963 * s,x +   17.562 * s,y +  -60.798 * s,x +   16.211 * s,y +  -57.877 * s,x +   16.211 * s,y +  -54.198 * s, threshold);
			_bez(x +   16.211 * s,y +  -54.198 * s,x +   16.211 * s,y +  -50.976 * s,x +   17.098 * s,y +  -48.518 * s,x +   18.872 * s,y +  -46.825 * s, threshold);
			_bez(x +   18.872 * s,y +  -46.825 * s,x +   20.646 * s,y +  -45.133 * s,x +   23.950 * s,y +  -43.678 * s,x +   28.808 * s,y +  -42.577 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   33.984 * s);
			_setf(o + ( 1 << 2), y +  -41.406 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   33.984 * s,y +  -41.406 * s,x +   40.830 * s,y +  -39.855 * s,x +   45.800 * s,y +  -37.304 * s,x +   48.925 * s,y +  -33.886 * s, threshold);
			_bez(x +   48.925 * s,y +  -33.886 * s,x +   52.050 * s,y +  -30.468 * s,x +   53.613 * s,y +  -25.813 * s,x +   53.613 * s,y +  -19.922 * s, threshold);
			_bez(x +   53.613 * s,y +  -19.922 * s,x +   53.613 * s,y +  -12.988 * s,x +   51.464 * s,y +   -7.698 * s,x +   47.168 * s,y +   -4.053 * s, threshold);
			_bez(x +   47.168 * s,y +   -4.053 * s,x +   42.871 * s,y +   -0.407 * s,x +   36.621 * s,y +    1.416 * s,x +   28.418 * s,y +    1.416 * s, threshold);
			_bez(x +   28.418 * s,y +    1.416 * s,x +   25.000 * s,y +    1.416 * s,x +   21.566 * s,y +    1.050 * s,x +   18.115 * s,y +    0.317 * s, threshold);
			_bez(x +   18.115 * s,y +    0.317 * s,x +   14.665 * s,y +   -0.415 * s,x +   11.198 * s,y +   -1.514 * s,x +    7.715 * s,y +   -2.978 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    7.715 * s);
			_setf(o + ( 1 << 2), y +  -13.476 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    7.715 * s,y +  -13.476 * s,x +   11.458 * s,y +  -11.100 * s,x +   14.998 * s,y +   -9.359 * s,x +   18.335 * s,y +   -8.252 * s, threshold);
			_bez(x +   18.335 * s,y +   -8.252 * s,x +   21.671 * s,y +   -7.145 * s,x +   25.032 * s,y +   -6.592 * s,x +   28.418 * s,y +   -6.592 * s, threshold);
			_bez(x +   28.418 * s,y +   -6.592 * s,x +   33.398 * s,y +   -6.592 * s,x +   37.272 * s,y +   -7.707 * s,x +   40.039 * s,y +   -9.936 * s, threshold);
			_bez(x +   40.039 * s,y +   -9.936 * s,x +   42.806 * s,y +  -12.166 * s,x +   44.189 * s,y +  -15.283 * s,x +   44.189 * s,y +  -19.287 * s, threshold);
			_bez(x +   44.189 * s,y +  -19.287 * s,x +   44.189 * s,y +  -22.932 * s,x +   43.237 * s,y +  -25.716 * s,x +   41.333 * s,y +  -27.636 * s, threshold);
			_bez(x +   41.333 * s,y +  -27.636 * s,x +   39.428 * s,y +  -29.557 * s,x +   36.105 * s,y +  -30.990 * s,x +   31.396 * s,y +  -32.080 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   26.123 * s);
			_setf(o + ( 1 << 2), y +  -33.300 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   26.123 * s,y +  -33.300 * s,x +   19.360 * s,y +  -34.866 * s,x +   14.437 * s,y +  -37.141 * s,x +   11.377 * s,y +  -40.234 * s, threshold);
			_bez(x +   11.377 * s,y +  -40.234 * s,x +    8.317 * s,y +  -43.326 * s,x +    6.787 * s,y +  -47.477 * s,x +    6.787 * s,y +  -52.685 * s, threshold);
			_bez(x +    6.787 * s,y +  -52.685 * s,x +    6.787 * s,y +  -59.195 * s,x +    8.976 * s,y +  -64.411 * s,x +   13.355 * s,y +  -68.334 * s, threshold);
			_bez(x +   13.355 * s,y +  -68.334 * s,x +   17.733 * s,y +  -72.256 * s,x +   23.551 * s,y +  -74.218 * s,x +   30.810 * s,y +  -74.218 * s, threshold);
			_bez(x +   30.810 * s,y +  -74.218 * s,x +   33.610 * s,y +  -74.218 * s,x +   36.556 * s,y +  -73.900 * s,x +   39.648 * s,y +  -73.265 * s, threshold);
			_bez(x +   39.648 * s,y +  -73.265 * s,x +   42.741 * s,y +  -72.631 * s,x +   45.996 * s,y +  -71.679 * s,x +   49.414 * s,y +  -70.409 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 84:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +    2.295 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   57.910 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   57.910 * s);
			_setf(o + ( 5 << 2), y +  -64.599 * s);
			_setf(o + ( 6 << 2), x +   35.107 * s);
			_setf(o + ( 7 << 2), y +  -64.599 * s);
			_setf(o + ( 8 << 2), x +   35.107 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   25.195 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   25.195 * s);
			_setf(o + (13 << 2), y +  -64.599 * s);
			_setf(o + (14 << 2), x +    2.295 * s);
			_setf(o + (15 << 2), y +  -64.599 * s);
			_setf(o + (16 << 2), x +    2.295 * s);
			_setf(o + (17 << 2), y +  -72.899 * s);
			_setf(o + (18 << 2), x +   60.205 * s);
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
			
			o = _posf(8);
			_setf(o + ( 0 << 2), x +    7.177 * s);
			_setf(o + ( 1 << 2), y +  -27.978 * s);
			_setf(o + ( 2 << 2), x +    7.177 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   17.089 * s);
			_setf(o + ( 5 << 2), y +  -72.899 * s);
			_setf(o + ( 6 << 2), x +   17.089 * s);
			_setf(o + ( 7 << 2), y +  -23.486 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_bez(x +   17.089 * s,y +  -23.486 * s,x +   17.089 * s,y +  -19.938 * s,x +   17.187 * s,y +  -17.407 * s,x +   17.382 * s,y +  -15.893 * s, threshold);
			_bez(x +   17.382 * s,y +  -15.893 * s,x +   17.577 * s,y +  -14.380 * s,x +   17.944 * s,y +  -13.230 * s,x +   18.408 * s,y +  -12.402 * s, threshold);
			_bez(x +   18.408 * s,y +  -12.402 * s,x +   19.474 * s,y +  -10.495 * s,x +   20.955 * s,y +   -9.033 * s,x +   22.924 * s,y +   -8.056 * s, threshold);
			_bez(x +   22.924 * s,y +   -8.056 * s,x +   24.893 * s,y +   -7.080 * s,x +   27.278 * s,y +   -6.592 * s,x +   30.077 * s,y +   -6.592 * s, threshold);
			_bez(x +   30.077 * s,y +   -6.592 * s,x +   32.909 * s,y +   -6.592 * s,x +   35.302 * s,y +   -7.080 * s,x +   37.255 * s,y +   -8.056 * s, threshold);
			_bez(x +   37.255 * s,y +   -8.056 * s,x +   39.208 * s,y +   -9.033 * s,x +   40.704 * s,y +  -10.491 * s,x +   41.796 * s,y +  -12.402 * s, threshold);
			_bez(x +   41.796 * s,y +  -12.402 * s,x +   42.267 * s,y +  -13.226 * s,x +   42.626 * s,y +  -14.371 * s,x +   42.821 * s,y +  -15.869 * s, threshold);
			_bez(x +   42.821 * s,y +  -15.869 * s,x +   43.016 * s,y +  -17.366 * s,x +   43.114 * s,y +  -19.873 * s,x +   43.114 * s,y +  -23.388 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   43.114 * s);
			_setf(o + ( 1 << 2), y +  -27.978 * s);
			_setf(o + ( 2 << 2), x +   43.114 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   52.977 * s);
			_setf(o + ( 5 << 2), y +  -72.899 * s);
			_setf(o + ( 6 << 2), x +   52.977 * s);
			_setf(o + ( 7 << 2), y +  -27.978 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_bez(x +   52.977 * s,y +  -27.978 * s,x +   52.977 * s,y +  -20.524 * s,x +   52.513 * s,y +  -15.226 * s,x +   51.586 * s,y +  -12.085 * s, threshold);
			_bez(x +   51.586 * s,y +  -12.085 * s,x +   50.658 * s,y +   -8.943 * s,x +   49.058 * s,y +   -6.344 * s,x +   46.776 * s,y +   -4.297 * s, threshold);
			_bez(x +   46.776 * s,y +   -4.297 * s,x +   44.631 * s,y +   -2.372 * s,x +   42.170 * s,y +   -0.944 * s,x +   39.403 * s,y +       0. * s, threshold);
			_bez(x +   39.403 * s,y +       0. * s,x +   36.636 * s,y +    0.944 * s,x +   33.528 * s,y +    1.416 * s,x +   30.077 * s,y +    1.416 * s, threshold);
			_bez(x +   30.077 * s,y +    1.416 * s,x +   26.659 * s,y +    1.416 * s,x +   23.567 * s,y +    0.944 * s,x +   20.800 * s,y +       0. * s, threshold);
			_bez(x +   20.800 * s,y +       0. * s,x +   18.033 * s,y +   -0.944 * s,x +   15.549 * s,y +   -2.365 * s,x +   13.378 * s,y +   -4.297 * s, threshold);
			_bez(x +   13.378 * s,y +   -4.297 * s,x +   11.122 * s,y +   -6.304 * s,x +    9.537 * s,y +   -8.927 * s,x +    8.593 * s,y +  -12.134 * s, threshold);
			_bez(x +    8.593 * s,y +  -12.134 * s,x +    7.649 * s,y +  -15.340 * s,x +    7.177 * s,y +  -20.621 * s,x +    7.177 * s,y +  -27.978 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 86:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +   30.077 * s);
			_setf(o + ( 1 << 2), y +   -8.301 * s);
			_setf(o + ( 2 << 2), x +   47.216 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   57.421 * s);
			_setf(o + ( 5 << 2), y +  -72.899 * s);
			_setf(o + ( 6 << 2), x +   36.083 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   24.120 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +    2.783 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   12.988 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   30.077 * s);
			_setf(o + (15 << 2), y +   -8.301 * s);
			_setf(o + (16 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +    9.619 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   16.601 * s);
			_setf(o + ( 5 << 2), y +  -13.721 * s);
			_setf(o + ( 6 << 2), x +   24.902 * s);
			_setf(o + ( 7 << 2), y +  -52.880 * s);
			_setf(o + ( 8 << 2), x +   35.204 * s);
			_setf(o + ( 9 << 2), y +  -52.880 * s);
			_setf(o + (10 << 2), x +   43.603 * s);
			_setf(o + (11 << 2), y +  -13.623 * s);
			_setf(o + (12 << 2), x +   50.585 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   60.204 * s);
			_setf(o + (15 << 2), y +  -72.899 * s);
			_setf(o + (16 << 2), x +   49.316 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   39.990 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   30.078 * s);
			_setf(o + (21 << 2), y +  -43.310 * s);
			_setf(o + (22 << 2), x +   20.214 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   10.888 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +       0. * s);
			_setf(o + (27 << 2), y +  -72.899 * s);
			_setf(o + (28 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +    4.199 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   14.795 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   30.810 * s);
			_setf(o + ( 5 << 2), y +  -45.409 * s);
			_setf(o + ( 6 << 2), x +   47.118 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   57.714 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   35.888 * s);
			_setf(o + (11 << 2), y +  -38.622 * s);
			_setf(o + (12 << 2), x +   59.276 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   48.681 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   30.810 * s);
			_setf(o + (17 << 2), y +  -31.396 * s);
			_setf(o + (18 << 2), x +   11.523 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +    0.879 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   25.293 * s);
			_setf(o + (23 << 2), y +  -38.622 * s);
			_setf(o + (24 << 2), x +    4.199 * s);
			_setf(o + (25 << 2), y +  -72.899 * s);
			_setf(o + (26 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +    1.807 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   12.304 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   30.078 * s);
			_setf(o + ( 5 << 2), y +  -40.722 * s);
			_setf(o + ( 6 << 2), x +   47.802 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   58.397 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   35.009 * s);
			_setf(o + (11 << 2), y +  -32.714 * s);
			_setf(o + (12 << 2), x +   35.009 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   25.097 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   25.097 * s);
			_setf(o + (17 << 2), y +  -32.714 * s);
			_setf(o + (18 << 2), x +    1.807 * s);
			_setf(o + (19 << 2), y +  -72.899 * s);
			_setf(o + (20 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +    8.691 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   56.005 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   56.005 * s);
			_setf(o + ( 5 << 2), y +  -65.380 * s);
			_setf(o + ( 6 << 2), x +   17.920 * s);
			_setf(o + ( 7 << 2), y +   -8.301 * s);
			_setf(o + ( 8 << 2), x +   57.079 * s);
			_setf(o + ( 9 << 2), y +   -8.301 * s);
			_setf(o + (10 << 2), x +   57.079 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    7.617 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +    7.617 * s);
			_setf(o + (15 << 2), y +   -7.519 * s);
			_setf(o + (16 << 2), x +   44.677 * s);
			_setf(o + (17 << 2), y +  -64.599 * s);
			_setf(o + (18 << 2), x +    8.691 * s);
			_setf(o + (19 << 2), y +  -64.599 * s);
			_setf(o + (20 << 2), x +    8.691 * s);
			_setf(o + (21 << 2), y +  -72.899 * s);
			_setf(o + (22 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   22.607 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   43.310 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   43.310 * s);
			_setf(o + ( 5 << 2), y +  -68.993 * s);
			_setf(o + ( 6 << 2), x +   31.592 * s);
			_setf(o + ( 7 << 2), y +  -68.993 * s);
			_setf(o + ( 8 << 2), x +   31.592 * s);
			_setf(o + ( 9 << 2), y +    6.201 * s);
			_setf(o + (10 << 2), x +   43.310 * s);
			_setf(o + (11 << 2), y +    6.201 * s);
			_setf(o + (12 << 2), x +   43.310 * s);
			_setf(o + (13 << 2), y +   13.183 * s);
			_setf(o + (14 << 2), x +   22.607 * s);
			_setf(o + (15 << 2), y +   13.183 * s);
			_setf(o + (16 << 2), x +   22.607 * s);
			_setf(o + (17 << 2), y +  -75.975 * s);
			_setf(o + (18 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   14.307 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   52.685 * s);
			_setf(o + ( 3 << 2), y +    9.277 * s);
			_setf(o + ( 4 << 2), x +   43.408 * s);
			_setf(o + ( 5 << 2), y +    9.277 * s);
			_setf(o + ( 6 << 2), x +    4.981 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   14.307 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   60.205 * s);
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
			_setf(o + ( 0 << 2), x +   37.597 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   37.597 * s);
			_setf(o + ( 3 << 2), y +   13.183 * s);
			_setf(o + ( 4 << 2), x +   16.894 * s);
			_setf(o + ( 5 << 2), y +   13.183 * s);
			_setf(o + ( 6 << 2), x +   16.894 * s);
			_setf(o + ( 7 << 2), y +    6.201 * s);
			_setf(o + ( 8 << 2), x +   28.612 * s);
			_setf(o + ( 9 << 2), y +    6.201 * s);
			_setf(o + (10 << 2), x +   28.612 * s);
			_setf(o + (11 << 2), y +  -68.993 * s);
			_setf(o + (12 << 2), x +   16.894 * s);
			_setf(o + (13 << 2), y +  -68.993 * s);
			_setf(o + (14 << 2), x +   16.894 * s);
			_setf(o + (15 << 2), y +  -75.975 * s);
			_setf(o + (16 << 2), x +   37.597 * s);
			_setf(o + (17 << 2), y +  -75.975 * s);
			_setf(o + (18 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   34.423 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   56.688 * s);
			_setf(o + ( 3 << 2), y +  -45.702 * s);
			_setf(o + ( 4 << 2), x +   47.997 * s);
			_setf(o + ( 5 << 2), y +  -45.702 * s);
			_setf(o + ( 6 << 2), x +   30.077 * s);
			_setf(o + ( 7 << 2), y +  -64.989 * s);
			_setf(o + ( 8 << 2), x +   12.207 * s);
			_setf(o + ( 9 << 2), y +  -45.702 * s);
			_setf(o + (10 << 2), x +    3.515 * s);
			_setf(o + (11 << 2), y +  -45.702 * s);
			_setf(o + (12 << 2), x +   25.781 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   34.423 * s);
			_setf(o + (15 << 2), y +  -72.899 * s);
			_setf(o + (16 << 2), x +   60.204 * s);
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
			_setf(o + ( 1 << 2), y +   19.677 * s);
			_setf(o + ( 2 << 2), x +   49.999 * s);
			_setf(o + ( 3 << 2), y +   23.584 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +   23.584 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +   19.677 * s);
			_setf(o + ( 8 << 2), x +   49.999 * s);
			_setf(o + ( 9 << 2), y +   19.677 * s);
			_setf(o + (10 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   23.291 * s);
			_setf(o + ( 1 << 2), y +  -79.979 * s);
			_setf(o + ( 2 << 2), x +   37.011 * s);
			_setf(o + ( 3 << 2), y +  -61.620 * s);
			_setf(o + ( 4 << 2), x +   29.492 * s);
			_setf(o + ( 5 << 2), y +  -61.620 * s);
			_setf(o + ( 6 << 2), x +   13.623 * s);
			_setf(o + ( 7 << 2), y +  -79.979 * s);
			_setf(o + ( 8 << 2), x +   23.291 * s);
			_setf(o + ( 9 << 2), y +  -79.979 * s);
			_setf(o + (10 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   34.277 * s);
			_setf(o + ( 1 << 2), y +  -27.490 * s);
			_setf(o + ( 2 << 2), x +   31.298 * s);
			_setf(o + ( 3 << 2), y +  -27.490 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   31.298 * s,y +  -27.490 * s,x +   26.058 * s,y +  -27.490 * s,x +   22.111 * s,y +  -26.570 * s,x +   19.458 * s,y +  -24.731 * s, threshold);
			_bez(x +   19.458 * s,y +  -24.731 * s,x +   16.805 * s,y +  -22.892 * s,x +   15.478 * s,y +  -20.149 * s,x +   15.478 * s,y +  -16.504 * s, threshold);
			_bez(x +   15.478 * s,y +  -16.504 * s,x +   15.478 * s,y +  -13.216 * s,x +   16.471 * s,y +  -10.661 * s,x +   18.457 * s,y +   -8.838 * s, threshold);
			_bez(x +   18.457 * s,y +   -8.838 * s,x +   20.442 * s,y +   -7.015 * s,x +   23.193 * s,y +   -6.103 * s,x +   26.709 * s,y +   -6.103 * s, threshold);
			_bez(x +   26.709 * s,y +   -6.103 * s,x +   31.656 * s,y +   -6.103 * s,x +   35.546 * s,y +   -7.820 * s,x +   38.378 * s,y +  -11.255 * s, threshold);
			_bez(x +   38.378 * s,y +  -11.255 * s,x +   41.210 * s,y +  -14.689 * s,x +   42.675 * s,y +  -19.433 * s,x +   42.675 * s,y +  -25.488 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   42.675 * s);
			_setf(o + ( 1 << 2), y +  -27.490 * s);
			_setf(o + ( 2 << 2), x +   34.277 * s);
			_setf(o + ( 3 << 2), y +  -27.490 * s);
			_setf(o + ( 4 << 2), x +   51.708 * s);
			_setf(o + ( 5 << 2), y +  -31.201 * s);
			_setf(o + ( 6 << 2), x +   51.708 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   42.675 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   42.675 * s);
			_setf(o + (11 << 2), y +   -8.105 * s);
			o = _posb(6);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_bez(x +   42.675 * s,y +   -8.105 * s,x +   40.755 * s,y +   -4.850 * s,x +   38.338 * s,y +   -2.449 * s,x +   35.424 * s,y +   -0.903 * s, threshold);
			_bez(x +   35.424 * s,y +   -0.903 * s,x +   32.511 * s,y +    0.643 * s,x +   28.971 * s,y +    1.416 * s,x +   24.804 * s,y +    1.416 * s, threshold);
			_bez(x +   24.804 * s,y +    1.416 * s,x +   19.238 * s,y +    1.416 * s,x +   14.795 * s,y +   -0.155 * s,x +   11.474 * s,y +   -3.296 * s, threshold);
			_bez(x +   11.474 * s,y +   -3.296 * s,x +    8.154 * s,y +   -6.437 * s,x +    6.494 * s,y +  -10.644 * s,x +    6.494 * s,y +  -15.918 * s, threshold);
			_bez(x +    6.494 * s,y +  -15.918 * s,x +    6.494 * s,y +  -22.005 * s,x +    8.537 * s,y +  -26.627 * s,x +   12.622 * s,y +  -29.785 * s, threshold);
			_bez(x +   12.622 * s,y +  -29.785 * s,x +   16.707 * s,y +  -32.942 * s,x +   22.705 * s,y +  -34.521 * s,x +   30.615 * s,y +  -34.521 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   42.675 * s);
			_setf(o + ( 1 << 2), y +  -34.521 * s);
			_setf(o + ( 2 << 2), x +   42.675 * s);
			_setf(o + ( 3 << 2), y +  -35.937 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   42.675 * s,y +  -35.937 * s,x +   42.675 * s,y +  -40.299 * s,x +   41.536 * s,y +  -43.464 * s,x +   39.355 * s,y +  -45.434 * s, threshold);
			_bez(x +   39.355 * s,y +  -45.434 * s,x +   37.174 * s,y +  -47.403 * s,x +   33.691 * s,y +  -48.388 * s,x +   28.906 * s,y +  -48.388 * s, threshold);
			_bez(x +   28.906 * s,y +  -48.388 * s,x +   25.846 * s,y +  -48.388 * s,x +   22.754 * s,y +  -47.948 * s,x +   19.629 * s,y +  -47.070 * s, threshold);
			_bez(x +   19.629 * s,y +  -47.070 * s,x +   16.504 * s,y +  -46.191 * s,x +   13.460 * s,y +  -44.905 * s,x +   10.498 * s,y +  -43.212 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   10.498 * s);
			_setf(o + ( 1 << 2), y +  -52.196 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   10.498 * s,y +  -52.196 * s,x +   13.818 * s,y +  -53.466 * s,x +   17.000 * s,y +  -54.418 * s,x +   20.044 * s,y +  -55.053 * s, threshold);
			_bez(x +   20.044 * s,y +  -55.053 * s,x +   23.087 * s,y +  -55.688 * s,x +   26.041 * s,y +  -56.005 * s,x +   28.906 * s,y +  -56.005 * s, threshold);
			_bez(x +   28.906 * s,y +  -56.005 * s,x +   33.430 * s,y +  -56.005 * s,x +   37.296 * s,y +  -55.338 * s,x +   40.502 * s,y +  -54.003 * s, threshold);
			_bez(x +   40.502 * s,y +  -54.003 * s,x +   43.709 * s,y +  -52.668 * s,x +   46.294 * s,y +  -50.659 * s,x +   48.290 * s,y +  -47.997 * s, threshold);
			_bez(x +   48.290 * s,y +  -47.997 * s,x +   49.517 * s,y +  -46.362 * s,x +   50.406 * s,y +  -44.360 * s,x +   50.927 * s,y +  -41.967 * s, threshold);
			_bez(x +   50.927 * s,y +  -41.967 * s,x +   51.448 * s,y +  -39.575 * s,x +   51.708 * s,y +  -35.986 * s,x +   51.708 * s,y +  -31.201 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 98:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   44.824 * s);
			_setf(o + ( 1 << 2), y +  -27.294 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   44.824 * s,y +  -27.294 * s,x +   44.824 * s,y +  -34.261 * s,x +   43.717 * s,y +  -39.518 * s,x +   41.503 * s,y +  -43.066 * s, threshold);
			_bez(x +   41.503 * s,y +  -43.066 * s,x +   39.290 * s,y +  -46.614 * s,x +   36.018 * s,y +  -48.388 * s,x +   31.689 * s,y +  -48.388 * s, threshold);
			_bez(x +   31.689 * s,y +  -48.388 * s,x +   27.327 * s,y +  -48.388 * s,x +   24.023 * s,y +  -46.606 * s,x +   21.777 * s,y +  -43.041 * s, threshold);
			_bez(x +   21.777 * s,y +  -43.041 * s,x +   19.531 * s,y +  -39.477 * s,x +   18.408 * s,y +  -34.228 * s,x +   18.408 * s,y +  -27.294 * s, threshold);
			_bez(x +   18.408 * s,y +  -27.294 * s,x +   18.408 * s,y +  -20.394 * s,x +   19.531 * s,y +  -15.153 * s,x +   21.777 * s,y +  -11.572 * s, threshold);
			_bez(x +   21.777 * s,y +  -11.572 * s,x +   24.023 * s,y +   -7.991 * s,x +   27.327 * s,y +   -6.201 * s,x +   31.689 * s,y +   -6.201 * s, threshold);
			_bez(x +   31.689 * s,y +   -6.201 * s,x +   36.018 * s,y +   -6.201 * s,x +   39.290 * s,y +   -7.975 * s,x +   41.503 * s,y +  -11.523 * s, threshold);
			_bez(x +   41.503 * s,y +  -11.523 * s,x +   43.717 * s,y +  -15.071 * s,x +   44.824 * s,y +  -20.328 * s,x +   44.824 * s,y +  -27.294 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   18.408 * s);
			_setf(o + ( 1 << 2), y +  -47.704 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   18.408 * s,y +  -47.704 * s,x +   19.840 * s,y +  -50.374 * s,x +   21.818 * s,y +  -52.424 * s,x +   24.341 * s,y +  -53.857 * s, threshold);
			_bez(x +   24.341 * s,y +  -53.857 * s,x +   26.863 * s,y +  -55.289 * s,x +   29.785 * s,y +  -56.005 * s,x +   33.105 * s,y +  -56.005 * s, threshold);
			_bez(x +   33.105 * s,y +  -56.005 * s,x +   39.681 * s,y +  -56.005 * s,x +   44.856 * s,y +  -53.474 * s,x +   48.632 * s,y +  -48.412 * s, threshold);
			_bez(x +   48.632 * s,y +  -48.412 * s,x +   52.408 * s,y +  -43.351 * s,x +   54.296 * s,y +  -36.377 * s,x +   54.296 * s,y +  -27.490 * s, threshold);
			_bez(x +   54.296 * s,y +  -27.490 * s,x +   54.296 * s,y +  -18.473 * s,x +   52.400 * s,y +  -11.401 * s,x +   48.608 * s,y +   -6.274 * s, threshold);
			_bez(x +   48.608 * s,y +   -6.274 * s,x +   44.816 * s,y +   -1.147 * s,x +   39.615 * s,y +    1.416 * s,x +   33.007 * s,y +    1.416 * s, threshold);
			_bez(x +   33.007 * s,y +    1.416 * s,x +   29.752 * s,y +    1.416 * s,x +   26.879 * s,y +    0.708 * s,x +   24.389 * s,y +   -0.708 * s, threshold);
			_bez(x +   24.389 * s,y +   -0.708 * s,x +   21.899 * s,y +   -2.124 * s,x +   19.905 * s,y +   -4.183 * s,x +   18.408 * s,y +   -6.885 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   18.408 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    9.424 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    9.424 * s);
			_setf(o + ( 5 << 2), y +  -75.975 * s);
			_setf(o + ( 6 << 2), x +   18.408 * s);
			_setf(o + ( 7 << 2), y +  -75.975 * s);
			_setf(o + ( 8 << 2), x +   18.408 * s);
			_setf(o + ( 9 << 2), y +  -47.704 * s);
			_setf(o + (10 << 2), x +   60.204 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 99:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   51.806 * s);
			_setf(o + ( 1 << 2), y +   -2.783 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   51.806 * s,y +   -2.783 * s,x +   49.397 * s,y +   -1.383 * s,x +   46.915 * s,y +   -0.334 * s,x +   44.360 * s,y +    0.366 * s, threshold);
			_bez(x +   44.360 * s,y +    0.366 * s,x +   41.805 * s,y +    1.066 * s,x +   39.192 * s,y +    1.416 * s,x +   36.523 * s,y +    1.416 * s, threshold);
			_bez(x +   36.523 * s,y +    1.416 * s,x +   28.060 * s,y +    1.416 * s,x +   21.444 * s,y +   -1.123 * s,x +   16.675 * s,y +   -6.201 * s, threshold);
			_bez(x +   16.675 * s,y +   -6.201 * s,x +   11.906 * s,y +  -11.279 * s,x +    9.522 * s,y +  -18.310 * s,x +    9.522 * s,y +  -27.294 * s, threshold);
			_bez(x +    9.522 * s,y +  -27.294 * s,x +    9.522 * s,y +  -36.279 * s,x +   11.906 * s,y +  -43.310 * s,x +   16.675 * s,y +  -48.388 * s, threshold);
			_bez(x +   16.675 * s,y +  -48.388 * s,x +   21.444 * s,y +  -53.466 * s,x +   28.060 * s,y +  -56.005 * s,x +   36.523 * s,y +  -56.005 * s, threshold);
			_bez(x +   36.523 * s,y +  -56.005 * s,x +   39.160 * s,y +  -56.005 * s,x +   41.731 * s,y +  -55.663 * s,x +   44.238 * s,y +  -54.980 * s, threshold);
			_bez(x +   44.238 * s,y +  -54.980 * s,x +   46.744 * s,y +  -54.296 * s,x +   49.267 * s,y +  -53.238 * s,x +   51.806 * s,y +  -51.806 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   51.806 * s);
			_setf(o + ( 1 << 2), y +  -42.382 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   51.806 * s,y +  -42.382 * s,x +   49.430 * s,y +  -44.498 * s,x +   47.045 * s,y +  -46.028 * s,x +   44.653 * s,y +  -46.972 * s, threshold);
			_bez(x +   44.653 * s,y +  -46.972 * s,x +   42.260 * s,y +  -47.916 * s,x +   39.551 * s,y +  -48.388 * s,x +   36.523 * s,y +  -48.388 * s, threshold);
			_bez(x +   36.523 * s,y +  -48.388 * s,x +   30.892 * s,y +  -48.388 * s,x +   26.562 * s,y +  -46.565 * s,x +   23.535 * s,y +  -42.919 * s, threshold);
			_bez(x +   23.535 * s,y +  -42.919 * s,x +   20.508 * s,y +  -39.273 * s,x +   18.994 * s,y +  -34.065 * s,x +   18.994 * s,y +  -27.294 * s, threshold);
			_bez(x +   18.994 * s,y +  -27.294 * s,x +   18.994 * s,y +  -20.556 * s,x +   20.516 * s,y +  -15.356 * s,x +   23.559 * s,y +  -11.694 * s, threshold);
			_bez(x +   23.559 * s,y +  -11.694 * s,x +   26.603 * s,y +   -8.032 * s,x +   30.924 * s,y +   -6.201 * s,x +   36.523 * s,y +   -6.201 * s, threshold);
			_bez(x +   36.523 * s,y +   -6.201 * s,x +   39.648 * s,y +   -6.201 * s,x +   42.448 * s,y +   -6.681 * s,x +   44.921 * s,y +   -7.641 * s, threshold);
			_bez(x +   44.921 * s,y +   -7.641 * s,x +   47.395 * s,y +   -8.602 * s,x +   49.690 * s,y +  -10.091 * s,x +   51.806 * s,y +  -12.109 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   51.806 * s);
			_setf(o + ( 1 << 2), y +   -2.783 * s);
			_setf(o + ( 2 << 2), x +   60.204 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 100:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   41.894 * s);
			_setf(o + ( 1 << 2), y +  -47.704 * s);
			_setf(o + ( 2 << 2), x +   41.894 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   50.879 * s);
			_setf(o + ( 5 << 2), y +  -75.975 * s);
			_setf(o + ( 6 << 2), x +   50.879 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   41.894 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   41.894 * s);
			_setf(o + (11 << 2), y +   -6.885 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_bez(x +   41.894 * s,y +   -6.885 * s,x +   40.397 * s,y +   -4.183 * s,x +   38.403 * s,y +   -2.124 * s,x +   35.913 * s,y +   -0.708 * s, threshold);
			_bez(x +   35.913 * s,y +   -0.708 * s,x +   33.423 * s,y +    0.708 * s,x +   30.550 * s,y +    1.416 * s,x +   27.295 * s,y +    1.416 * s, threshold);
			_bez(x +   27.295 * s,y +    1.416 * s,x +   20.687 * s,y +    1.416 * s,x +   15.487 * s,y +   -1.147 * s,x +   11.695 * s,y +   -6.274 * s, threshold);
			_bez(x +   11.695 * s,y +   -6.274 * s,x +    7.902 * s,y +  -11.401 * s,x +    6.006 * s,y +  -18.473 * s,x +    6.006 * s,y +  -27.490 * s, threshold);
			_bez(x +    6.006 * s,y +  -27.490 * s,x +    6.006 * s,y +  -36.377 * s,x +    7.910 * s,y +  -43.351 * s,x +   11.719 * s,y +  -48.412 * s, threshold);
			_bez(x +   11.719 * s,y +  -48.412 * s,x +   15.528 * s,y +  -53.474 * s,x +   20.720 * s,y +  -56.005 * s,x +   27.295 * s,y +  -56.005 * s, threshold);
			_bez(x +   27.295 * s,y +  -56.005 * s,x +   30.583 * s,y +  -56.005 * s,x +   33.480 * s,y +  -55.297 * s,x +   35.986 * s,y +  -53.881 * s, threshold);
			_bez(x +   35.986 * s,y +  -53.881 * s,x +   38.493 * s,y +  -52.465 * s,x +   40.462 * s,y +  -50.406 * s,x +   41.894 * s,y +  -47.704 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   15.479 * s);
			_setf(o + ( 1 << 2), y +  -27.294 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   15.479 * s,y +  -27.294 * s,x +   15.479 * s,y +  -20.328 * s,x +   16.585 * s,y +  -15.071 * s,x +   18.799 * s,y +  -11.523 * s, threshold);
			_bez(x +   18.799 * s,y +  -11.523 * s,x +   21.012 * s,y +   -7.975 * s,x +   24.284 * s,y +   -6.201 * s,x +   28.613 * s,y +   -6.201 * s, threshold);
			_bez(x +   28.613 * s,y +   -6.201 * s,x +   32.943 * s,y +   -6.201 * s,x +   36.238 * s,y +   -7.991 * s,x +   38.501 * s,y +  -11.572 * s, threshold);
			_bez(x +   38.501 * s,y +  -11.572 * s,x +   40.763 * s,y +  -15.153 * s,x +   41.894 * s,y +  -20.394 * s,x +   41.894 * s,y +  -27.294 * s, threshold);
			_bez(x +   41.894 * s,y +  -27.294 * s,x +   41.894 * s,y +  -34.228 * s,x +   40.763 * s,y +  -39.477 * s,x +   38.501 * s,y +  -43.041 * s, threshold);
			_bez(x +   38.501 * s,y +  -43.041 * s,x +   36.238 * s,y +  -46.606 * s,x +   32.943 * s,y +  -48.388 * s,x +   28.613 * s,y +  -48.388 * s, threshold);
			_bez(x +   28.613 * s,y +  -48.388 * s,x +   24.284 * s,y +  -48.388 * s,x +   21.012 * s,y +  -46.614 * s,x +   18.799 * s,y +  -43.066 * s, threshold);
			_bez(x +   18.799 * s,y +  -43.066 * s,x +   16.585 * s,y +  -39.518 * s,x +   15.479 * s,y +  -34.261 * s,x +   15.479 * s,y +  -27.294 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.205 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 101:
			
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   54.296 * s);
			_setf(o + ( 1 << 2), y +  -29.589 * s);
			_setf(o + ( 2 << 2), x +   54.296 * s);
			_setf(o + ( 3 << 2), y +  -25.195 * s);
			_setf(o + ( 4 << 2), x +   15.380 * s);
			_setf(o + ( 5 << 2), y +  -25.195 * s);
			_setf(o + ( 6 << 2), x +   15.380 * s);
			_setf(o + ( 7 << 2), y +  -24.902 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_bez(x +   15.380 * s,y +  -24.902 * s,x +   15.380 * s,y +  -18.945 * s,x +   16.935 * s,y +  -14.339 * s,x +   20.043 * s,y +  -11.084 * s, threshold);
			_bez(x +   20.043 * s,y +  -11.084 * s,x +   23.152 * s,y +   -7.829 * s,x +   27.538 * s,y +   -6.201 * s,x +   33.202 * s,y +   -6.201 * s, threshold);
			_bez(x +   33.202 * s,y +   -6.201 * s,x +   36.067 * s,y +   -6.201 * s,x +   39.061 * s,y +   -6.657 * s,x +   42.186 * s,y +   -7.568 * s, threshold);
			_bez(x +   42.186 * s,y +   -7.568 * s,x +   45.311 * s,y +   -8.480 * s,x +   48.648 * s,y +   -9.863 * s,x +   52.196 * s,y +  -11.719 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   52.196 * s);
			_setf(o + ( 1 << 2), y +   -2.783 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   52.196 * s,y +   -2.783 * s,x +   48.778 * s,y +   -1.383 * s,x +   45.482 * s,y +   -0.334 * s,x +   42.309 * s,y +    0.366 * s, threshold);
			_bez(x +   42.309 * s,y +    0.366 * s,x +   39.135 * s,y +    1.066 * s,x +   36.067 * s,y +    1.416 * s,x +   33.105 * s,y +    1.416 * s, threshold);
			_bez(x +   33.105 * s,y +    1.416 * s,x +   24.608 * s,y +    1.416 * s,x +   17.968 * s,y +   -1.131 * s,x +   13.183 * s,y +   -6.225 * s, threshold);
			_bez(x +   13.183 * s,y +   -6.225 * s,x +    8.398 * s,y +  -11.320 * s,x +    6.005 * s,y +  -18.343 * s,x +    6.005 * s,y +  -27.294 * s, threshold);
			_bez(x +    6.005 * s,y +  -27.294 * s,x +    6.005 * s,y +  -36.018 * s,x +    8.349 * s,y +  -42.984 * s,x +   13.036 * s,y +  -48.193 * s, threshold);
			_bez(x +   13.036 * s,y +  -48.193 * s,x +   17.724 * s,y +  -53.401 * s,x +   23.974 * s,y +  -56.005 * s,x +   31.786 * s,y +  -56.005 * s, threshold);
			_bez(x +   31.786 * s,y +  -56.005 * s,x +   38.752 * s,y +  -56.005 * s,x +   44.245 * s,y +  -53.645 * s,x +   48.265 * s,y +  -48.925 * s, threshold);
			_bez(x +   48.265 * s,y +  -48.925 * s,x +   52.286 * s,y +  -44.205 * s,x +   54.296 * s,y +  -37.760 * s,x +   54.296 * s,y +  -29.589 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   45.311 * s);
			_setf(o + ( 1 << 2), y +  -32.226 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   45.311 * s,y +  -32.226 * s,x +   45.181 * s,y +  -37.499 * s,x +   43.936 * s,y +  -41.511 * s,x +   41.576 * s,y +  -44.262 * s, threshold);
			_bez(x +   41.576 * s,y +  -44.262 * s,x +   39.216 * s,y +  -47.013 * s,x +   35.823 * s,y +  -48.388 * s,x +   31.396 * s,y +  -48.388 * s, threshold);
			_bez(x +   31.396 * s,y +  -48.388 * s,x +   27.066 * s,y +  -48.388 * s,x +   23.502 * s,y +  -46.956 * s,x +   20.702 * s,y +  -44.091 * s, threshold);
			_bez(x +   20.702 * s,y +  -44.091 * s,x +   17.903 * s,y +  -41.227 * s,x +   16.243 * s,y +  -37.255 * s,x +   15.722 * s,y +  -32.177 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   45.311 * s);
			_setf(o + ( 1 << 2), y +  -32.226 * s);
			_setf(o + ( 2 << 2), x +   60.204 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 102:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   51.903 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   51.903 * s);
			_setf(o + ( 3 << 2), y +  -68.505 * s);
			_setf(o + ( 4 << 2), x +   41.698 * s);
			_setf(o + ( 5 << 2), y +  -68.505 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   41.698 * s,y +  -68.505 * s,x +   38.476 * s,y +  -68.505 * s,x +   36.238 * s,y +  -67.846 * s,x +   34.985 * s,y +  -66.527 * s, threshold);
			_bez(x +   34.985 * s,y +  -66.527 * s,x +   33.731 * s,y +  -65.209 * s,x +   33.105 * s,y +  -62.873 * s,x +   33.105 * s,y +  -59.521 * s, threshold);
			o = _posf(22);
			_setf(o + ( 0 << 2), x +   33.105 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   51.903 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   51.903 * s);
			_setf(o + ( 5 << 2), y +  -47.704 * s);
			_setf(o + ( 6 << 2), x +   33.105 * s);
			_setf(o + ( 7 << 2), y +  -47.704 * s);
			_setf(o + ( 8 << 2), x +   33.105 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   24.120 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   24.120 * s);
			_setf(o + (13 << 2), y +  -47.704 * s);
			_setf(o + (14 << 2), x +    9.521 * s);
			_setf(o + (15 << 2), y +  -47.704 * s);
			_setf(o + (16 << 2), x +    9.521 * s);
			_setf(o + (17 << 2), y +  -54.687 * s);
			_setf(o + (18 << 2), x +   24.120 * s);
			_setf(o + (19 << 2), y +  -54.687 * s);
			_setf(o + (20 << 2), x +   24.120 * s);
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
			_bez(x +   24.120 * s,y +  -58.495 * s,x +   24.120 * s,y +  -64.485 * s,x +   25.496 * s,y +  -68.895 * s,x +   28.246 * s,y +  -71.727 * s, threshold);
			_bez(x +   28.246 * s,y +  -71.727 * s,x +   30.997 * s,y +  -74.559 * s,x +   35.286 * s,y +  -75.975 * s,x +   41.112 * s,y +  -75.975 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   51.903 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   60.204 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 103:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   41.894 * s);
			_setf(o + ( 1 << 2), y +  -27.783 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   41.894 * s,y +  -27.783 * s,x +   41.894 * s,y +  -34.521 * s,x +   40.795 * s,y +  -39.640 * s,x +   38.598 * s,y +  -43.139 * s, threshold);
			_bez(x +   38.598 * s,y +  -43.139 * s,x +   36.401 * s,y +  -46.638 * s,x +   33.202 * s,y +  -48.388 * s,x +   29.003 * s,y +  -48.388 * s, threshold);
			_bez(x +   29.003 * s,y +  -48.388 * s,x +   24.609 * s,y +  -48.388 * s,x +   21.256 * s,y +  -46.638 * s,x +   18.945 * s,y +  -43.139 * s, threshold);
			_bez(x +   18.945 * s,y +  -43.139 * s,x +   16.634 * s,y +  -39.640 * s,x +   15.478 * s,y +  -34.521 * s,x +   15.478 * s,y +  -27.783 * s, threshold);
			_bez(x +   15.478 * s,y +  -27.783 * s,x +   15.478 * s,y +  -21.045 * s,x +   16.642 * s,y +  -15.910 * s,x +   18.969 * s,y +  -12.378 * s, threshold);
			_bez(x +   18.969 * s,y +  -12.378 * s,x +   21.297 * s,y +   -8.846 * s,x +   24.674 * s,y +   -7.080 * s,x +   29.101 * s,y +   -7.080 * s, threshold);
			_bez(x +   29.101 * s,y +   -7.080 * s,x +   33.235 * s,y +   -7.080 * s,x +   36.401 * s,y +   -8.854 * s,x +   38.598 * s,y +  -12.402 * s, threshold);
			_bez(x +   38.598 * s,y +  -12.402 * s,x +   40.795 * s,y +  -15.950 * s,x +   41.894 * s,y +  -21.077 * s,x +   41.894 * s,y +  -27.783 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   50.878 * s);
			_setf(o + ( 1 << 2), y +   -3.516 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   50.878 * s,y +   -3.516 * s,x +   50.878 * s,y +    4.687 * s,x +   48.941 * s,y +   10.905 * s,x +   45.068 * s,y +   15.136 * s, threshold);
			_bez(x +   45.068 * s,y +   15.136 * s,x +   41.194 * s,y +   19.368 * s,x +   35.498 * s,y +   21.484 * s,x +   27.978 * s,y +   21.484 * s, threshold);
			_bez(x +   27.978 * s,y +   21.484 * s,x +   25.504 * s,y +   21.484 * s,x +   22.916 * s,y +   21.256 * s,x +   20.214 * s,y +   20.800 * s, threshold);
			_bez(x +   20.214 * s,y +   20.800 * s,x +   17.513 * s,y +   20.345 * s,x +   14.811 * s,y +   19.677 * s,x +   12.109 * s,y +   18.799 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   12.109 * s);
			_setf(o + ( 1 << 2), y +    9.912 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   12.109 * s,y +    9.912 * s,x +   15.299 * s,y +   11.409 * s,x +   18.196 * s,y +   12.516 * s,x +   20.800 * s,y +   13.232 * s, threshold);
			_bez(x +   20.800 * s,y +   13.232 * s,x +   23.404 * s,y +   13.948 * s,x +   25.797 * s,y +   14.306 * s,x +   27.978 * s,y +   14.306 * s, threshold);
			_bez(x +   27.978 * s,y +   14.306 * s,x +   32.828 * s,y +   14.306 * s,x +   36.360 * s,y +   12.988 * s,x +   38.574 * s,y +   10.351 * s, threshold);
			_bez(x +   38.574 * s,y +   10.351 * s,x +   40.787 * s,y +    7.715 * s,x +   41.894 * s,y +    3.532 * s,x +   41.894 * s,y +   -2.197 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   41.894 * s);
			_setf(o + ( 1 << 2), y +   -2.588 * s);
			_setf(o + ( 2 << 2), x +   41.894 * s);
			_setf(o + ( 3 << 2), y +   -8.691 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   41.894 * s,y +   -8.691 * s,x +   40.461 * s,y +   -5.631 * s,x +   38.508 * s,y +   -3.353 * s,x +   36.034 * s,y +   -1.855 * s, threshold);
			_bez(x +   36.034 * s,y +   -1.855 * s,x +   33.561 * s,y +   -0.358 * s,x +   30.549 * s,y +    0.391 * s,x +   27.001 * s,y +    0.391 * s, threshold);
			_bez(x +   27.001 * s,y +    0.391 * s,x +   20.621 * s,y +    0.391 * s,x +   15.527 * s,y +   -2.165 * s,x +   11.718 * s,y +   -7.275 * s, threshold);
			_bez(x +   11.718 * s,y +   -7.275 * s,x +    7.910 * s,y +  -12.386 * s,x +    6.006 * s,y +  -19.222 * s,x +    6.006 * s,y +  -27.783 * s, threshold);
			_bez(x +    6.006 * s,y +  -27.783 * s,x +    6.006 * s,y +  -36.377 * s,x +    7.910 * s,y +  -43.229 * s,x +   11.718 * s,y +  -48.339 * s, threshold);
			_bez(x +   11.718 * s,y +  -48.339 * s,x +   15.527 * s,y +  -53.450 * s,x +   20.621 * s,y +  -56.005 * s,x +   27.001 * s,y +  -56.005 * s, threshold);
			_bez(x +   27.001 * s,y +  -56.005 * s,x +   30.517 * s,y +  -56.005 * s,x +   33.495 * s,y +  -55.305 * s,x +   35.937 * s,y +  -53.905 * s, threshold);
			_bez(x +   35.937 * s,y +  -53.905 * s,x +   38.378 * s,y +  -52.506 * s,x +   40.364 * s,y +  -50.341 * s,x +   41.894 * s,y +  -47.411 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   41.894 * s);
			_setf(o + ( 1 << 2), y +  -54.491 * s);
			_setf(o + ( 2 << 2), x +   50.878 * s);
			_setf(o + ( 3 << 2), y +  -54.491 * s);
			_setf(o + ( 4 << 2), x +   50.878 * s);
			_setf(o + ( 5 << 2), y +   -3.516 * s);
			_setf(o + ( 6 << 2), x +   60.204 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			
			case 104:
			
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   51.318 * s);
			_setf(o + ( 1 << 2), y +  -33.886 * s);
			_setf(o + ( 2 << 2), x +   51.318 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   42.285 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   42.285 * s);
			_setf(o + ( 7 << 2), y +  -33.886 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_bez(x +   42.285 * s,y +  -33.886 * s,x +   42.285 * s,y +  -38.801 * s,x +   41.422 * s,y +  -42.415 * s,x +   39.697 * s,y +  -44.726 * s, threshold);
			_bez(x +   39.697 * s,y +  -44.726 * s,x +   37.971 * s,y +  -47.037 * s,x +   35.270 * s,y +  -48.193 * s,x +   31.591 * s,y +  -48.193 * s, threshold);
			_bez(x +   31.591 * s,y +  -48.193 * s,x +   27.392 * s,y +  -48.193 * s,x +   24.161 * s,y +  -46.703 * s,x +   21.899 * s,y +  -43.725 * s, threshold);
			_bez(x +   21.899 * s,y +  -43.725 * s,x +   19.637 * s,y +  -40.746 * s,x +   18.506 * s,y +  -36.474 * s,x +   18.506 * s,y +  -30.908 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   18.506 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    9.521 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    9.521 * s);
			_setf(o + ( 5 << 2), y +  -75.975 * s);
			_setf(o + ( 6 << 2), x +   18.506 * s);
			_setf(o + ( 7 << 2), y +  -75.975 * s);
			_setf(o + ( 8 << 2), x +   18.506 * s);
			_setf(o + ( 9 << 2), y +  -46.484 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   18.506 * s,y +  -46.484 * s,x +   20.101 * s,y +  -49.609 * s,x +   22.265 * s,y +  -51.977 * s,x +   25.000 * s,y +  -53.588 * s, threshold);
			_bez(x +   25.000 * s,y +  -53.588 * s,x +   27.734 * s,y +  -55.199 * s,x +   30.973 * s,y +  -56.005 * s,x +   34.716 * s,y +  -56.005 * s, threshold);
			_bez(x +   34.716 * s,y +  -56.005 * s,x +   40.283 * s,y +  -56.005 * s,x +   44.441 * s,y +  -54.174 * s,x +   47.192 * s,y +  -50.512 * s, threshold);
			_bez(x +   47.192 * s,y +  -50.512 * s,x +   49.942 * s,y +  -46.850 * s,x +   51.318 * s,y +  -41.308 * s,x +   51.318 * s,y +  -33.886 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 105:
			
			o = _posf(34);
			_setf(o + ( 0 << 2), x +   12.500 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   35.497 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   35.497 * s);
			_setf(o + ( 5 << 2), y +   -6.982 * s);
			_setf(o + ( 6 << 2), x +   53.319 * s);
			_setf(o + ( 7 << 2), y +   -6.982 * s);
			_setf(o + ( 8 << 2), x +   53.319 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +    8.691 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    8.691 * s);
			_setf(o + (13 << 2), y +   -6.982 * s);
			_setf(o + (14 << 2), x +   26.513 * s);
			_setf(o + (15 << 2), y +   -6.982 * s);
			_setf(o + (16 << 2), x +   26.513 * s);
			_setf(o + (17 << 2), y +  -47.704 * s);
			_setf(o + (18 << 2), x +   12.500 * s);
			_setf(o + (19 << 2), y +  -47.704 * s);
			_setf(o + (20 << 2), x +   12.500 * s);
			_setf(o + (21 << 2), y +  -54.687 * s);
			_setf(o + (22 << 2), x +   26.513 * s);
			_setf(o + (23 << 2), y +  -75.975 * s);
			_setf(o + (24 << 2), x +   35.497 * s);
			_setf(o + (25 << 2), y +  -75.975 * s);
			_setf(o + (26 << 2), x +   35.497 * s);
			_setf(o + (27 << 2), y +  -64.599 * s);
			_setf(o + (28 << 2), x +   26.513 * s);
			_setf(o + (29 << 2), y +  -64.599 * s);
			_setf(o + (30 << 2), x +   26.513 * s);
			_setf(o + (31 << 2), y +  -75.975 * s);
			_setf(o + (32 << 2), x +   60.204 * s);
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
			_setb(o + 11, 1);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 2);
			_setb(o + 16, 1);
			
			case 106:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   29.296 * s);
			_setf(o + ( 1 << 2), y +    0.977 * s);
			_setf(o + ( 2 << 2), x +   29.296 * s);
			_setf(o + ( 3 << 2), y +  -47.704 * s);
			_setf(o + ( 4 << 2), x +   13.818 * s);
			_setf(o + ( 5 << 2), y +  -47.704 * s);
			_setf(o + ( 6 << 2), x +   13.818 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   38.281 * s);
			_setf(o + ( 9 << 2), y +  -54.687 * s);
			_setf(o + (10 << 2), x +   38.281 * s);
			_setf(o + (11 << 2), y +    0.977 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_bez(x +   38.281 * s,y +    0.977 * s,x +   38.281 * s,y +    7.324 * s,x +   36.824 * s,y +   12.215 * s,x +   33.911 * s,y +   15.649 * s, threshold);
			_bez(x +   33.911 * s,y +   15.649 * s,x +   30.997 * s,y +   19.083 * s,x +   26.855 * s,y +   20.800 * s,x +   21.484 * s,y +   20.800 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    9.082 * s);
			_setf(o + ( 1 << 2), y +   20.800 * s);
			_setf(o + ( 2 << 2), x +    9.082 * s);
			_setf(o + ( 3 << 2), y +   13.183 * s);
			_setf(o + ( 4 << 2), x +   20.508 * s);
			_setf(o + ( 5 << 2), y +   13.183 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   20.508 * s,y +   13.183 * s,x +   23.437 * s,y +   13.183 * s,x +   25.634 * s,y +   12.166 * s,x +   27.099 * s,y +   10.132 * s, threshold);
			_bez(x +   27.099 * s,y +   10.132 * s,x +   28.564 * s,y +    8.097 * s,x +   29.296 * s,y +    5.045 * s,x +   29.296 * s,y +    0.977 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   29.296 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   38.281 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   38.281 * s);
			_setf(o + ( 5 << 2), y +  -64.599 * s);
			_setf(o + ( 6 << 2), x +   29.296 * s);
			_setf(o + ( 7 << 2), y +  -64.599 * s);
			_setf(o + ( 8 << 2), x +   29.296 * s);
			_setf(o + ( 9 << 2), y +  -75.975 * s);
			_setf(o + (10 << 2), x +   60.204 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 107:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   11.524 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   20.801 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   20.801 * s);
			_setf(o + ( 5 << 2), y +  -31.982 * s);
			_setf(o + ( 6 << 2), x +   44.384 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   55.322 * s);
			_setf(o + ( 9 << 2), y +  -54.687 * s);
			_setf(o + (10 << 2), x +   33.789 * s);
			_setf(o + (11 << 2), y +  -34.081 * s);
			_setf(o + (12 << 2), x +   58.691 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   47.705 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   27.490 * s);
			_setf(o + (17 << 2), y +  -28.222 * s);
			_setf(o + (18 << 2), x +   20.801 * s);
			_setf(o + (19 << 2), y +  -21.923 * s);
			_setf(o + (20 << 2), x +   20.801 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   11.524 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   11.524 * s);
			_setf(o + (25 << 2), y +  -75.975 * s);
			_setf(o + (26 << 2), x +   60.204 * s);
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
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   31.201 * s);
			_setf(o + ( 1 << 2), y +  -19.824 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   31.201 * s,y +  -19.824 * s,x +   31.201 * s,y +  -15.788 * s,x +   31.942 * s,y +  -12.744 * s,x +   33.423 * s,y +  -10.693 * s, threshold);
			_bez(x +   33.423 * s,y +  -10.693 * s,x +   34.904 * s,y +   -8.642 * s,x +   37.093 * s,y +   -7.617 * s,x +   39.990 * s,y +   -7.617 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   50.488 * s);
			_setf(o + ( 1 << 2), y +   -7.617 * s);
			_setf(o + ( 2 << 2), x +   50.488 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   39.111 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   39.111 * s,y +       0. * s,x +   33.740 * s,y +       0. * s,x +   29.582 * s,y +   -1.725 * s,x +   26.636 * s,y +   -5.176 * s, threshold);
			_bez(x +   26.636 * s,y +   -5.176 * s,x +   23.690 * s,y +   -8.626 * s,x +   22.217 * s,y +  -13.509 * s,x +   22.217 * s,y +  -19.824 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   22.217 * s);
			_setf(o + ( 1 << 2), y +  -69.481 * s);
			_setf(o + ( 2 << 2), x +    7.813 * s);
			_setf(o + ( 3 << 2), y +  -69.481 * s);
			_setf(o + ( 4 << 2), x +    7.813 * s);
			_setf(o + ( 5 << 2), y +  -76.512 * s);
			_setf(o + ( 6 << 2), x +   31.201 * s);
			_setf(o + ( 7 << 2), y +  -76.512 * s);
			_setf(o + ( 8 << 2), x +   31.201 * s);
			_setf(o + ( 9 << 2), y +  -19.824 * s);
			_setf(o + (10 << 2), x +   60.205 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 109:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   33.007 * s);
			_setf(o + ( 1 << 2), y +  -49.120 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   33.007 * s,y +  -49.120 * s,x +   34.114 * s,y +  -51.464 * s,x +   35.522 * s,y +  -53.197 * s,x +   37.230 * s,y +  -54.320 * s, threshold);
			_bez(x +   37.230 * s,y +  -54.320 * s,x +   38.939 * s,y +  -55.443 * s,x +   40.998 * s,y +  -56.005 * s,x +   43.407 * s,y +  -56.005 * s, threshold);
			_bez(x +   43.407 * s,y +  -56.005 * s,x +   47.802 * s,y +  -56.005 * s,x +   50.902 * s,y +  -54.304 * s,x +   52.709 * s,y +  -50.903 * s, threshold);
			_bez(x +   52.709 * s,y +  -50.903 * s,x +   54.515 * s,y +  -47.501 * s,x +   55.419 * s,y +  -41.096 * s,x +   55.419 * s,y +  -31.689 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   55.419 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   47.216 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   47.216 * s);
			_setf(o + ( 5 << 2), y +  -31.298 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   47.216 * s,y +  -31.298 * s,x +   47.216 * s,y +  -39.013 * s,x +   46.784 * s,y +  -43.806 * s,x +   45.922 * s,y +  -45.678 * s, threshold);
			_bez(x +   45.922 * s,y +  -45.678 * s,x +   45.059 * s,y +  -47.550 * s,x +   43.488 * s,y +  -48.486 * s,x +   41.210 * s,y +  -48.486 * s, threshold);
			_bez(x +   41.210 * s,y +  -48.486 * s,x +   38.606 * s,y +  -48.486 * s,x +   36.824 * s,y +  -47.485 * s,x +   35.863 * s,y +  -45.483 * s, threshold);
			_bez(x +   35.863 * s,y +  -45.483 * s,x +   34.903 * s,y +  -43.481 * s,x +   34.423 * s,y +  -38.753 * s,x +   34.423 * s,y +  -31.298 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   34.423 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   26.220 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   26.220 * s);
			_setf(o + ( 5 << 2), y +  -31.298 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   26.220 * s,y +  -31.298 * s,x +   26.220 * s,y +  -39.111 * s,x +   25.756 * s,y +  -43.928 * s,x +   24.828 * s,y +  -45.751 * s, threshold);
			_bez(x +   24.828 * s,y +  -45.751 * s,x +   23.901 * s,y +  -47.574 * s,x +   22.232 * s,y +  -48.486 * s,x +   19.824 * s,y +  -48.486 * s, threshold);
			_bez(x +   19.824 * s,y +  -48.486 * s,x +   17.447 * s,y +  -48.486 * s,x +   15.795 * s,y +  -47.485 * s,x +   14.868 * s,y +  -45.483 * s, threshold);
			_bez(x +   14.868 * s,y +  -45.483 * s,x +   13.940 * s,y +  -43.481 * s,x +   13.476 * s,y +  -38.753 * s,x +   13.476 * s,y +  -31.298 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   13.476 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    5.322 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    5.322 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   13.476 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   13.476 * s);
			_setf(o + ( 9 << 2), y +  -49.999 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   13.476 * s,y +  -49.999 * s,x +   14.550 * s,y +  -51.952 * s,x +   15.893 * s,y +  -53.442 * s,x +   17.504 * s,y +  -54.467 * s, threshold);
			_bez(x +   17.504 * s,y +  -54.467 * s,x +   19.115 * s,y +  -55.492 * s,x +   20.946 * s,y +  -56.005 * s,x +   22.997 * s,y +  -56.005 * s, threshold);
			_bez(x +   22.997 * s,y +  -56.005 * s,x +   25.471 * s,y +  -56.005 * s,x +   27.530 * s,y +  -55.435 * s,x +   29.174 * s,y +  -54.296 * s, threshold);
			_bez(x +   29.174 * s,y +  -54.296 * s,x +   30.818 * s,y +  -53.157 * s,x +   32.095 * s,y +  -51.431 * s,x +   33.007 * s,y +  -49.120 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 110:
			
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   51.317 * s);
			_setf(o + ( 1 << 2), y +  -33.886 * s);
			_setf(o + ( 2 << 2), x +   51.317 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   42.284 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   42.284 * s);
			_setf(o + ( 7 << 2), y +  -33.886 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_bez(x +   42.284 * s,y +  -33.886 * s,x +   42.284 * s,y +  -38.801 * s,x +   41.422 * s,y +  -42.415 * s,x +   39.696 * s,y +  -44.726 * s, threshold);
			_bez(x +   39.696 * s,y +  -44.726 * s,x +   37.971 * s,y +  -47.037 * s,x +   35.269 * s,y +  -48.193 * s,x +   31.591 * s,y +  -48.193 * s, threshold);
			_bez(x +   31.591 * s,y +  -48.193 * s,x +   27.392 * s,y +  -48.193 * s,x +   24.161 * s,y +  -46.703 * s,x +   21.899 * s,y +  -43.725 * s, threshold);
			_bez(x +   21.899 * s,y +  -43.725 * s,x +   19.636 * s,y +  -40.746 * s,x +   18.505 * s,y +  -36.474 * s,x +   18.505 * s,y +  -30.908 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   18.505 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    9.521 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    9.521 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   18.505 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   18.505 * s);
			_setf(o + ( 9 << 2), y +  -46.484 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   18.505 * s,y +  -46.484 * s,x +   20.100 * s,y +  -49.609 * s,x +   22.265 * s,y +  -51.977 * s,x +   24.999 * s,y +  -53.588 * s, threshold);
			_bez(x +   24.999 * s,y +  -53.588 * s,x +   27.734 * s,y +  -55.199 * s,x +   30.972 * s,y +  -56.005 * s,x +   34.716 * s,y +  -56.005 * s, threshold);
			_bez(x +   34.716 * s,y +  -56.005 * s,x +   40.283 * s,y +  -56.005 * s,x +   44.441 * s,y +  -54.174 * s,x +   47.191 * s,y +  -50.512 * s, threshold);
			_bez(x +   47.191 * s,y +  -50.512 * s,x +   49.942 * s,y +  -46.850 * s,x +   51.317 * s,y +  -41.308 * s,x +   51.317 * s,y +  -33.886 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 111:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   30.078 * s);
			_setf(o + ( 1 << 2), y +  -48.388 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   30.078 * s,y +  -48.388 * s,x +   25.520 * s,y +  -48.388 * s,x +   22.070 * s,y +  -46.614 * s,x +   19.726 * s,y +  -43.066 * s, threshold);
			_bez(x +   19.726 * s,y +  -43.066 * s,x +   17.382 * s,y +  -39.518 * s,x +   16.211 * s,y +  -34.261 * s,x +   16.211 * s,y +  -27.294 * s, threshold);
			_bez(x +   16.211 * s,y +  -27.294 * s,x +   16.211 * s,y +  -20.361 * s,x +   17.382 * s,y +  -15.112 * s,x +   19.726 * s,y +  -11.548 * s, threshold);
			_bez(x +   19.726 * s,y +  -11.548 * s,x +   22.070 * s,y +   -7.983 * s,x +   25.520 * s,y +   -6.201 * s,x +   30.078 * s,y +   -6.201 * s, threshold);
			_bez(x +   30.078 * s,y +   -6.201 * s,x +   34.667 * s,y +   -6.201 * s,x +   38.134 * s,y +   -7.983 * s,x +   40.478 * s,y +  -11.548 * s, threshold);
			_bez(x +   40.478 * s,y +  -11.548 * s,x +   42.821 * s,y +  -15.112 * s,x +   43.993 * s,y +  -20.361 * s,x +   43.993 * s,y +  -27.294 * s, threshold);
			_bez(x +   43.993 * s,y +  -27.294 * s,x +   43.993 * s,y +  -34.261 * s,x +   42.821 * s,y +  -39.518 * s,x +   40.478 * s,y +  -43.066 * s, threshold);
			_bez(x +   40.478 * s,y +  -43.066 * s,x +   38.134 * s,y +  -46.614 * s,x +   34.667 * s,y +  -48.388 * s,x +   30.078 * s,y +  -48.388 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   30.078 * s);
			_setf(o + ( 1 << 2), y +  -56.005 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   30.078 * s,y +  -56.005 * s,x +   37.662 * s,y +  -56.005 * s,x +   43.464 * s,y +  -53.547 * s,x +   47.485 * s,y +  -48.632 * s, threshold);
			_bez(x +   47.485 * s,y +  -48.632 * s,x +   51.505 * s,y +  -43.717 * s,x +   53.515 * s,y +  -36.604 * s,x +   53.515 * s,y +  -27.294 * s, threshold);
			_bez(x +   53.515 * s,y +  -27.294 * s,x +   53.515 * s,y +  -17.952 * s,x +   51.513 * s,y +  -10.832 * s,x +   47.509 * s,y +   -5.933 * s, threshold);
			_bez(x +   47.509 * s,y +   -5.933 * s,x +   43.505 * s,y +   -1.033 * s,x +   37.695 * s,y +    1.416 * s,x +   30.078 * s,y +    1.416 * s, threshold);
			_bez(x +   30.078 * s,y +    1.416 * s,x +   22.493 * s,y +    1.416 * s,x +   16.699 * s,y +   -1.033 * s,x +   12.695 * s,y +   -5.933 * s, threshold);
			_bez(x +   12.695 * s,y +   -5.933 * s,x +    8.691 * s,y +  -10.832 * s,x +    6.689 * s,y +  -17.952 * s,x +    6.689 * s,y +  -27.294 * s, threshold);
			_bez(x +    6.689 * s,y +  -27.294 * s,x +    6.689 * s,y +  -36.604 * s,x +    8.691 * s,y +  -43.717 * s,x +   12.695 * s,y +  -48.632 * s, threshold);
			_bez(x +   12.695 * s,y +  -48.632 * s,x +   16.699 * s,y +  -53.547 * s,x +   22.493 * s,y +  -56.005 * s,x +   30.078 * s,y +  -56.005 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 112:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   18.310 * s);
			_setf(o + ( 1 << 2), y +   -6.885 * s);
			_setf(o + ( 2 << 2), x +   18.310 * s);
			_setf(o + ( 3 << 2), y +   20.800 * s);
			_setf(o + ( 4 << 2), x +    9.277 * s);
			_setf(o + ( 5 << 2), y +   20.800 * s);
			_setf(o + ( 6 << 2), x +    9.277 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   18.310 * s);
			_setf(o + ( 9 << 2), y +  -54.687 * s);
			_setf(o + (10 << 2), x +   18.310 * s);
			_setf(o + (11 << 2), y +  -47.704 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_bez(x +   18.310 * s,y +  -47.704 * s,x +   19.808 * s,y +  -50.406 * s,x +   21.801 * s,y +  -52.465 * s,x +   24.292 * s,y +  -53.881 * s, threshold);
			_bez(x +   24.292 * s,y +  -53.881 * s,x +   26.782 * s,y +  -55.297 * s,x +   29.655 * s,y +  -56.005 * s,x +   32.910 * s,y +  -56.005 * s, threshold);
			_bez(x +   32.910 * s,y +  -56.005 * s,x +   39.517 * s,y +  -56.005 * s,x +   44.701 * s,y +  -53.450 * s,x +   48.461 * s,y +  -48.339 * s, threshold);
			_bez(x +   48.461 * s,y +  -48.339 * s,x +   52.221 * s,y +  -43.229 * s,x +   54.101 * s,y +  -36.149 * s,x +   54.101 * s,y +  -27.099 * s, threshold);
			_bez(x +   54.101 * s,y +  -27.099 * s,x +   54.101 * s,y +  -18.212 * s,x +   52.213 * s,y +  -11.238 * s,x +   48.437 * s,y +   -6.177 * s, threshold);
			_bez(x +   48.437 * s,y +   -6.177 * s,x +   44.661 * s,y +   -1.115 * s,x +   39.485 * s,y +    1.416 * s,x +   32.910 * s,y +    1.416 * s, threshold);
			_bez(x +   32.910 * s,y +    1.416 * s,x +   29.589 * s,y +    1.416 * s,x +   26.684 * s,y +    0.708 * s,x +   24.194 * s,y +   -0.708 * s, threshold);
			_bez(x +   24.194 * s,y +   -0.708 * s,x +   21.704 * s,y +   -2.124 * s,x +   19.743 * s,y +   -4.183 * s,x +   18.310 * s,y +   -6.885 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   44.677 * s);
			_setf(o + ( 1 << 2), y +  -27.294 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   44.677 * s,y +  -27.294 * s,x +   44.677 * s,y +  -34.261 * s,x +   43.578 * s,y +  -39.518 * s,x +   41.381 * s,y +  -43.066 * s, threshold);
			_bez(x +   41.381 * s,y +  -43.066 * s,x +   39.184 * s,y +  -46.614 * s,x +   35.921 * s,y +  -48.388 * s,x +   31.591 * s,y +  -48.388 * s, threshold);
			_bez(x +   31.591 * s,y +  -48.388 * s,x +   27.229 * s,y +  -48.388 * s,x +   23.925 * s,y +  -46.606 * s,x +   21.679 * s,y +  -43.041 * s, threshold);
			_bez(x +   21.679 * s,y +  -43.041 * s,x +   19.433 * s,y +  -39.477 * s,x +   18.310 * s,y +  -34.228 * s,x +   18.310 * s,y +  -27.294 * s, threshold);
			_bez(x +   18.310 * s,y +  -27.294 * s,x +   18.310 * s,y +  -20.394 * s,x +   19.433 * s,y +  -15.153 * s,x +   21.679 * s,y +  -11.572 * s, threshold);
			_bez(x +   21.679 * s,y +  -11.572 * s,x +   23.925 * s,y +   -7.991 * s,x +   27.229 * s,y +   -6.201 * s,x +   31.591 * s,y +   -6.201 * s, threshold);
			_bez(x +   31.591 * s,y +   -6.201 * s,x +   35.921 * s,y +   -6.201 * s,x +   39.184 * s,y +   -7.975 * s,x +   41.381 * s,y +  -11.523 * s, threshold);
			_bez(x +   41.381 * s,y +  -11.523 * s,x +   43.578 * s,y +  -15.071 * s,x +   44.677 * s,y +  -20.328 * s,x +   44.677 * s,y +  -27.294 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 113:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   16.211 * s);
			_setf(o + ( 1 << 2), y +  -27.099 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   16.211 * s,y +  -27.099 * s,x +   16.211 * s,y +  -20.133 * s,x +   17.309 * s,y +  -14.876 * s,x +   19.506 * s,y +  -11.328 * s, threshold);
			_bez(x +   19.506 * s,y +  -11.328 * s,x +   21.704 * s,y +   -7.780 * s,x +   24.967 * s,y +   -6.006 * s,x +   29.296 * s,y +   -6.006 * s, threshold);
			_bez(x +   29.296 * s,y +   -6.006 * s,x +   33.626 * s,y +   -6.006 * s,x +   36.905 * s,y +   -7.788 * s,x +   39.135 * s,y +  -11.352 * s, threshold);
			_bez(x +   39.135 * s,y +  -11.352 * s,x +   41.365 * s,y +  -14.917 * s,x +   42.480 * s,y +  -20.166 * s,x +   42.480 * s,y +  -27.099 * s, threshold);
			_bez(x +   42.480 * s,y +  -27.099 * s,x +   42.480 * s,y +  -34.033 * s,x +   41.365 * s,y +  -39.282 * s,x +   39.135 * s,y +  -42.846 * s, threshold);
			_bez(x +   39.135 * s,y +  -42.846 * s,x +   36.905 * s,y +  -46.410 * s,x +   33.626 * s,y +  -48.193 * s,x +   29.296 * s,y +  -48.193 * s, threshold);
			_bez(x +   29.296 * s,y +  -48.193 * s,x +   24.967 * s,y +  -48.193 * s,x +   21.704 * s,y +  -46.419 * s,x +   19.506 * s,y +  -42.870 * s, threshold);
			_bez(x +   19.506 * s,y +  -42.870 * s,x +   17.309 * s,y +  -39.322 * s,x +   16.211 * s,y +  -34.065 * s,x +   16.211 * s,y +  -27.099 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   42.480 * s);
			_setf(o + ( 1 << 2), y +   -6.787 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   42.480 * s,y +   -6.787 * s,x +   41.015 * s,y +   -4.085 * s,x +   39.037 * s,y +   -2.010 * s,x +   36.547 * s,y +   -0.562 * s, threshold);
			_bez(x +   36.547 * s,y +   -0.562 * s,x +   34.057 * s,y +    0.887 * s,x +   31.168 * s,y +    1.611 * s,x +   27.880 * s,y +    1.611 * s, threshold);
			_bez(x +   27.880 * s,y +    1.611 * s,x +   21.337 * s,y +    1.611 * s,x +   16.170 * s,y +   -0.920 * s,x +   12.378 * s,y +   -5.981 * s, threshold);
			_bez(x +   12.378 * s,y +   -5.981 * s,x +    8.585 * s,y +  -11.043 * s,x +    6.689 * s,y +  -18.017 * s,x +    6.689 * s,y +  -26.904 * s, threshold);
			_bez(x +    6.689 * s,y +  -26.904 * s,x +    6.689 * s,y +  -35.953 * s,x +    8.577 * s,y +  -43.033 * s,x +   12.353 * s,y +  -48.144 * s, threshold);
			_bez(x +   12.353 * s,y +  -48.144 * s,x +   16.129 * s,y +  -53.254 * s,x +   21.305 * s,y +  -55.810 * s,x +   27.880 * s,y +  -55.810 * s, threshold);
			_bez(x +   27.880 * s,y +  -55.810 * s,x +   31.136 * s,y +  -55.810 * s,x +   34.008 * s,y +  -55.102 * s,x +   36.499 * s,y +  -53.686 * s, threshold);
			_bez(x +   36.499 * s,y +  -53.686 * s,x +   38.989 * s,y +  -52.270 * s,x +   40.982 * s,y +  -50.211 * s,x +   42.480 * s,y +  -47.509 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   42.480 * s);
			_setf(o + ( 1 << 2), y +  -54.491 * s);
			_setf(o + ( 2 << 2), x +   51.513 * s);
			_setf(o + ( 3 << 2), y +  -54.491 * s);
			_setf(o + ( 4 << 2), x +   51.513 * s);
			_setf(o + ( 5 << 2), y +   20.996 * s);
			_setf(o + ( 6 << 2), x +   42.480 * s);
			_setf(o + ( 7 << 2), y +   20.996 * s);
			_setf(o + ( 8 << 2), x +   42.480 * s);
			_setf(o + ( 9 << 2), y +   -6.787 * s);
			_setf(o + (10 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   56.396 * s);
			_setf(o + ( 1 << 2), y +  -43.408 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   56.396 * s,y +  -43.408 * s,x +   54.475 * s,y +  -44.905 * s,x +   52.522 * s,y +  -45.995 * s,x +   50.536 * s,y +  -46.679 * s, threshold);
			_bez(x +   50.536 * s,y +  -46.679 * s,x +   48.551 * s,y +  -47.363 * s,x +   46.370 * s,y +  -47.704 * s,x +   43.994 * s,y +  -47.704 * s, threshold);
			_bez(x +   43.994 * s,y +  -47.704 * s,x +   38.395 * s,y +  -47.704 * s,x +   34.114 * s,y +  -45.947 * s,x +   31.152 * s,y +  -42.431 * s, threshold);
			_bez(x +   31.152 * s,y +  -42.431 * s,x +   28.190 * s,y +  -38.915 * s,x +   26.709 * s,y +  -33.837 * s,x +   26.709 * s,y +  -27.197 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   26.709 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   17.676 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   17.676 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   26.709 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   26.709 * s);
			_setf(o + ( 9 << 2), y +  -43.993 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   26.709 * s,y +  -43.993 * s,x +   28.206 * s,y +  -47.867 * s,x +   30.509 * s,y +  -50.837 * s,x +   33.618 * s,y +  -52.904 * s, threshold);
			_bez(x +   33.618 * s,y +  -52.904 * s,x +   36.726 * s,y +  -54.971 * s,x +   40.413 * s,y +  -56.005 * s,x +   44.677 * s,y +  -56.005 * s, threshold);
			_bez(x +   44.677 * s,y +  -56.005 * s,x +   46.891 * s,y +  -56.005 * s,x +   48.958 * s,y +  -55.728 * s,x +   50.878 * s,y +  -55.175 * s, threshold);
			_bez(x +   50.878 * s,y +  -55.175 * s,x +   52.799 * s,y +  -54.622 * s,x +   54.638 * s,y +  -53.759 * s,x +   56.396 * s,y +  -52.587 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   56.396 * s);
			_setf(o + ( 1 << 2), y +  -43.408 * s);
			_setf(o + ( 2 << 2), x +   60.204 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 115:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   47.509 * s);
			_setf(o + ( 1 << 2), y +  -52.782 * s);
			_setf(o + ( 2 << 2), x +   47.509 * s);
			_setf(o + ( 3 << 2), y +  -43.993 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   47.509 * s,y +  -43.993 * s,x +   44.938 * s,y +  -45.491 * s,x +   42.350 * s,y +  -46.614 * s,x +   39.746 * s,y +  -47.363 * s, threshold);
			_bez(x +   39.746 * s,y +  -47.363 * s,x +   37.142 * s,y +  -48.111 * s,x +   34.489 * s,y +  -48.486 * s,x +   31.787 * s,y +  -48.486 * s, threshold);
			_bez(x +   31.787 * s,y +  -48.486 * s,x +   27.718 * s,y +  -48.486 * s,x +   24.683 * s,y +  -47.826 * s,x +   22.681 * s,y +  -46.508 * s, threshold);
			_bez(x +   22.681 * s,y +  -46.508 * s,x +   20.679 * s,y +  -45.190 * s,x +   19.678 * s,y +  -43.180 * s,x +   19.678 * s,y +  -40.478 * s, threshold);
			_bez(x +   19.678 * s,y +  -40.478 * s,x +   19.678 * s,y +  -38.036 * s,x +   20.426 * s,y +  -36.214 * s,x +   21.924 * s,y +  -35.009 * s, threshold);
			_bez(x +   21.924 * s,y +  -35.009 * s,x +   23.421 * s,y +  -33.805 * s,x +   27.146 * s,y +  -32.621 * s,x +   33.105 * s,y +  -31.494 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.718 * s);
			_setf(o + ( 1 << 2), y +  -30.810 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   36.718 * s,y +  -30.810 * s,x +   41.178 * s,y +  -29.966 * s,x +   44.555 * s,y +  -28.271 * s,x +   46.850 * s,y +  -25.732 * s, threshold);
			_bez(x +   46.850 * s,y +  -25.732 * s,x +   49.145 * s,y +  -23.193 * s,x +   50.292 * s,y +  -19.889 * s,x +   50.292 * s,y +  -15.820 * s, threshold);
			_bez(x +   50.292 * s,y +  -15.820 * s,x +   50.292 * s,y +  -10.417 * s,x +   48.372 * s,y +   -6.193 * s,x +   44.531 * s,y +   -3.149 * s, threshold);
			_bez(x +   44.531 * s,y +   -3.149 * s,x +   40.690 * s,y +   -0.106 * s,x +   35.351 * s,y +    1.416 * s,x +   28.515 * s,y +    1.416 * s, threshold);
			_bez(x +   28.515 * s,y +    1.416 * s,x +   25.814 * s,y +    1.416 * s,x +   22.982 * s,y +    1.131 * s,x +   20.020 * s,y +    0.562 * s, threshold);
			_bez(x +   20.020 * s,y +    0.562 * s,x +   17.057 * s,y +   -0.008 * s,x +   13.851 * s,y +   -0.863 * s,x +   10.401 * s,y +   -2.002 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   10.401 * s);
			_setf(o + ( 1 << 2), y +  -11.279 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   10.401 * s,y +  -11.279 * s,x +   13.753 * s,y +   -9.554 * s,x +   16.960 * s,y +   -8.260 * s,x +   20.020 * s,y +   -7.397 * s, threshold);
			_bez(x +   20.020 * s,y +   -7.397 * s,x +   23.079 * s,y +   -6.535 * s,x +   25.976 * s,y +   -6.103 * s,x +   28.711 * s,y +   -6.103 * s, threshold);
			_bez(x +   28.711 * s,y +   -6.103 * s,x +   32.682 * s,y +   -6.103 * s,x +   35.758 * s,y +   -6.909 * s,x +   37.939 * s,y +   -8.520 * s, threshold);
			_bez(x +   37.939 * s,y +   -8.520 * s,x +   40.120 * s,y +  -10.132 * s,x +   41.211 * s,y +  -12.386 * s,x +   41.211 * s,y +  -15.283 * s, threshold);
			_bez(x +   41.211 * s,y +  -15.283 * s,x +   41.211 * s,y +  -19.450 * s,x +   37.138 * s,y +  -21.953 * s,x +   29.248 * s,y +  -23.925 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   28.857 * s);
			_setf(o + ( 1 << 2), y +  -24.023 * s);
			_setf(o + ( 2 << 2), x +   25.488 * s);
			_setf(o + ( 3 << 2), y +  -24.707 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   25.488 * s,y +  -24.707 * s,x +   20.320 * s,y +  -25.755 * s,x +   16.536 * s,y +  -27.417 * s,x +   14.160 * s,y +  -29.809 * s, threshold);
			_bez(x +   14.160 * s,y +  -29.809 * s,x +   11.784 * s,y +  -32.202 * s,x +   10.596 * s,y +  -35.465 * s,x +   10.596 * s,y +  -39.599 * s, threshold);
			_bez(x +   10.596 * s,y +  -39.599 * s,x +   10.596 * s,y +  -44.840 * s,x +   12.370 * s,y +  -48.884 * s,x +   15.918 * s,y +  -51.733 * s, threshold);
			_bez(x +   15.918 * s,y +  -51.733 * s,x +   19.466 * s,y +  -54.581 * s,x +   24.528 * s,y +  -56.005 * s,x +   31.103 * s,y +  -56.005 * s, threshold);
			_bez(x +   31.103 * s,y +  -56.005 * s,x +   34.033 * s,y +  -56.005 * s,x +   36.849 * s,y +  -55.736 * s,x +   39.550 * s,y +  -55.199 * s, threshold);
			_bez(x +   39.550 * s,y +  -55.199 * s,x +   42.252 * s,y +  -54.662 * s,x +   44.905 * s,y +  -53.857 * s,x +   47.509 * s,y +  -52.782 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 116:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   29.980 * s);
			_setf(o + ( 1 << 2), y +  -70.214 * s);
			_setf(o + ( 2 << 2), x +   29.980 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   50.390 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   50.390 * s);
			_setf(o + ( 7 << 2), y +  -47.704 * s);
			_setf(o + ( 8 << 2), x +   29.980 * s);
			_setf(o + ( 9 << 2), y +  -47.704 * s);
			_setf(o + (10 << 2), x +   29.980 * s);
			_setf(o + (11 << 2), y +  -18.017 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_bez(x +   29.980 * s,y +  -18.017 * s,x +   29.980 * s,y +  -13.981 * s,x +   30.745 * s,y +  -11.165 * s,x +   32.275 * s,y +   -9.570 * s, threshold);
			_bez(x +   32.275 * s,y +   -9.570 * s,x +   33.805 * s,y +   -7.975 * s,x +   36.474 * s,y +   -7.178 * s,x +   40.283 * s,y +   -7.178 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   50.390 * s);
			_setf(o + ( 1 << 2), y +   -7.178 * s);
			_setf(o + ( 2 << 2), x +   50.390 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   39.404 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   39.404 * s,y +       0. * s,x +   32.666 * s,y +       0. * s,x +   27.913 * s,y +   -1.351 * s,x +   25.147 * s,y +   -4.053 * s, threshold);
			_bez(x +   25.147 * s,y +   -4.053 * s,x +   22.380 * s,y +   -6.754 * s,x +   20.996 * s,y +  -11.410 * s,x +   20.996 * s,y +  -18.017 * s, threshold);
			o = _posf(14);
			_setf(o + ( 0 << 2), x +   20.996 * s);
			_setf(o + ( 1 << 2), y +  -47.704 * s);
			_setf(o + ( 2 << 2), x +    6.397 * s);
			_setf(o + ( 3 << 2), y +  -47.704 * s);
			_setf(o + ( 4 << 2), x +    6.397 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   20.996 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   20.996 * s);
			_setf(o + ( 9 << 2), y +  -70.214 * s);
			_setf(o + (10 << 2), x +   29.980 * s);
			_setf(o + (11 << 2), y +  -70.214 * s);
			_setf(o + (12 << 2), x +   60.205 * s);
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
			_setf(o + ( 0 << 2), x +    9.521 * s);
			_setf(o + ( 1 << 2), y +  -20.703 * s);
			_setf(o + ( 2 << 2), x +    9.521 * s);
			_setf(o + ( 3 << 2), y +  -54.589 * s);
			_setf(o + ( 4 << 2), x +   18.505 * s);
			_setf(o + ( 5 << 2), y +  -54.589 * s);
			_setf(o + ( 6 << 2), x +   18.505 * s);
			_setf(o + ( 7 << 2), y +  -20.703 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_bez(x +   18.505 * s,y +  -20.703 * s,x +   18.505 * s,y +  -15.788 * s,x +   19.376 * s,y +  -12.174 * s,x +   21.117 * s,y +   -9.863 * s, threshold);
			_bez(x +   21.117 * s,y +   -9.863 * s,x +   22.859 * s,y +   -7.552 * s,x +   25.553 * s,y +   -6.396 * s,x +   29.198 * s,y +   -6.396 * s, threshold);
			_bez(x +   29.198 * s,y +   -6.396 * s,x +   33.430 * s,y +   -6.396 * s,x +   36.669 * s,y +   -7.886 * s,x +   38.915 * s,y +  -10.864 * s, threshold);
			_bez(x +   38.915 * s,y +  -10.864 * s,x +   41.161 * s,y +  -13.843 * s,x +   42.284 * s,y +  -18.115 * s,x +   42.284 * s,y +  -23.681 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   42.284 * s);
			_setf(o + ( 1 << 2), y +  -54.589 * s);
			_setf(o + ( 2 << 2), x +   51.317 * s);
			_setf(o + ( 3 << 2), y +  -54.589 * s);
			_setf(o + ( 4 << 2), x +   51.317 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   42.284 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   42.284 * s);
			_setf(o + ( 9 << 2), y +   -8.203 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   42.284 * s,y +   -8.203 * s,x +   40.689 * s,y +   -5.045 * s,x +   38.516 * s,y +   -2.653 * s,x +   35.766 * s,y +   -1.025 * s, threshold);
			_bez(x +   35.766 * s,y +   -1.025 * s,x +   33.015 * s,y +    0.602 * s,x +   29.800 * s,y +    1.416 * s,x +   26.122 * s,y +    1.416 * s, threshold);
			_bez(x +   26.122 * s,y +    1.416 * s,x +   20.523 * s,y +    1.416 * s,x +   16.357 * s,y +   -0.415 * s,x +   13.622 * s,y +   -4.077 * s, threshold);
			_bez(x +   13.622 * s,y +   -4.077 * s,x +   10.888 * s,y +   -7.739 * s,x +    9.521 * s,y +  -13.281 * s,x +    9.521 * s,y +  -20.703 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 118:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +    4.882 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   14.208 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   30.077 * s);
			_setf(o + ( 5 << 2), y +   -8.789 * s);
			_setf(o + ( 6 << 2), x +   45.995 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   55.321 * s);
			_setf(o + ( 9 << 2), y +  -54.687 * s);
			_setf(o + (10 << 2), x +   35.888 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   24.316 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +    4.882 * s);
			_setf(o + (15 << 2), y +  -54.687 * s);
			_setf(o + (16 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +    8.886 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   18.408 * s);
			_setf(o + ( 5 << 2), y +  -10.498 * s);
			_setf(o + ( 6 << 2), x +   26.220 * s);
			_setf(o + ( 7 << 2), y +  -38.720 * s);
			_setf(o + ( 8 << 2), x +   33.886 * s);
			_setf(o + ( 9 << 2), y +  -38.720 * s);
			_setf(o + (10 << 2), x +   41.796 * s);
			_setf(o + (11 << 2), y +  -10.498 * s);
			_setf(o + (12 << 2), x +   51.317 * s);
			_setf(o + (13 << 2), y +  -54.687 * s);
			_setf(o + (14 << 2), x +   60.204 * s);
			_setf(o + (15 << 2), y +  -54.687 * s);
			_setf(o + (16 << 2), x +   47.411 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   38.818 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   30.078 * s);
			_setf(o + (21 << 2), y +  -29.980 * s);
			_setf(o + (22 << 2), x +   21.386 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   12.793 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +       0. * s);
			_setf(o + (27 << 2), y +  -54.687 * s);
			_setf(o + (28 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   54.589 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   35.009 * s);
			_setf(o + ( 3 << 2), y +  -28.515 * s);
			_setf(o + ( 4 << 2), x +   56.493 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   46.093 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   30.078 * s);
			_setf(o + ( 9 << 2), y +  -21.923 * s);
			_setf(o + (10 << 2), x +   14.111 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    3.711 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   25.195 * s);
			_setf(o + (15 << 2), y +  -28.515 * s);
			_setf(o + (16 << 2), x +    5.615 * s);
			_setf(o + (17 << 2), y +  -54.687 * s);
			_setf(o + (18 << 2), x +   15.576 * s);
			_setf(o + (19 << 2), y +  -54.687 * s);
			_setf(o + (20 << 2), x +   30.078 * s);
			_setf(o + (21 << 2), y +  -34.912 * s);
			_setf(o + (22 << 2), x +   44.482 * s);
			_setf(o + (23 << 2), y +  -54.687 * s);
			_setf(o + (24 << 2), x +   54.589 * s);
			_setf(o + (25 << 2), y +  -54.687 * s);
			_setf(o + (26 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   41.894 * s);
			_setf(o + ( 1 << 2), y +  -17.578 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   41.894 * s,y +  -17.578 * s,x +   40.413 * s,y +  -13.763 * s,x +   38.502 * s,y +   -8.752 * s,x +   36.181 * s,y +   -2.539 * s, threshold);
			_bez(x +   36.181 * s,y +   -2.539 * s,x +   32.969 * s,y +    6.059 * s,x +   30.797 * s,y +   11.297 * s,x +   29.687 * s,y +   13.183 * s, threshold);
			_bez(x +   29.687 * s,y +   13.183 * s,x +   28.192 * s,y +   15.724 * s,x +   26.318 * s,y +   17.627 * s,x +   24.072 * s,y +   18.896 * s, threshold);
			_bez(x +   24.072 * s,y +   18.896 * s,x +   21.826 * s,y +   20.166 * s,x +   19.205 * s,y +   20.800 * s,x +   16.211 * s,y +   20.800 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    8.984 * s);
			_setf(o + ( 1 << 2), y +   20.800 * s);
			_setf(o + ( 2 << 2), x +    8.984 * s);
			_setf(o + ( 3 << 2), y +   13.281 * s);
			_setf(o + ( 4 << 2), x +   14.306 * s);
			_setf(o + ( 5 << 2), y +   13.281 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   14.306 * s,y +   13.281 * s,x +   16.943 * s,y +   13.281 * s,x +   19.010 * s,y +   12.516 * s,x +   20.507 * s,y +   10.986 * s, threshold);
			_bez(x +   20.507 * s,y +   10.986 * s,x +   22.005 * s,y +    9.456 * s,x +   23.909 * s,y +    5.501 * s,x +   26.220 * s,y +   -0.879 * s, threshold);
			o = _posf(14);
			_setf(o + ( 0 << 2), x +    5.078 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   14.599 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   30.810 * s);
			_setf(o + ( 5 << 2), y +  -11.914 * s);
			_setf(o + ( 6 << 2), x +   46.777 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   56.298 * s);
			_setf(o + ( 9 << 2), y +  -54.687 * s);
			_setf(o + (10 << 2), x +   41.894 * s);
			_setf(o + (11 << 2), y +  -17.578 * s);
			_setf(o + (12 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   11.084 * s);
			_setf(o + ( 1 << 2), y +  -54.784 * s);
			_setf(o + ( 2 << 2), x +   50.781 * s);
			_setf(o + ( 3 << 2), y +  -54.784 * s);
			_setf(o + ( 4 << 2), x +   50.781 * s);
			_setf(o + ( 5 << 2), y +  -46.581 * s);
			_setf(o + ( 6 << 2), x +   19.384 * s);
			_setf(o + ( 7 << 2), y +   -7.324 * s);
			_setf(o + ( 8 << 2), x +   50.781 * s);
			_setf(o + ( 9 << 2), y +   -7.324 * s);
			_setf(o + (10 << 2), x +   50.781 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    9.912 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +    9.912 * s);
			_setf(o + (15 << 2), y +   -8.301 * s);
			_setf(o + (16 << 2), x +   41.308 * s);
			_setf(o + (17 << 2), y +  -47.607 * s);
			_setf(o + (18 << 2), x +   11.084 * s);
			_setf(o + (19 << 2), y +  -47.607 * s);
			_setf(o + (20 << 2), x +   11.084 * s);
			_setf(o + (21 << 2), y +  -54.784 * s);
			_setf(o + (22 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   49.414 * s);
			_setf(o + ( 1 << 2), y +    9.277 * s);
			_setf(o + ( 2 << 2), x +   49.414 * s);
			_setf(o + ( 3 << 2), y +   16.308 * s);
			_setf(o + ( 4 << 2), x +   46.289 * s);
			_setf(o + ( 5 << 2), y +   16.308 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   46.289 * s,y +   16.308 * s,x +   38.183 * s,y +   16.308 * s,x +   32.755 * s,y +   15.104 * s,x +   30.005 * s,y +   12.695 * s, threshold);
			_bez(x +   30.005 * s,y +   12.695 * s,x +   27.254 * s,y +   10.286 * s,x +   25.879 * s,y +    5.485 * s,x +   25.879 * s,y +   -1.709 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   25.879 * s);
			_setf(o + ( 1 << 2), y +  -13.379 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   25.879 * s,y +  -13.379 * s,x +   25.879 * s,y +  -18.294 * s,x +   25.008 * s,y +  -21.696 * s,x +   23.267 * s,y +  -23.584 * s, threshold);
			_bez(x +   23.267 * s,y +  -23.584 * s,x +   21.525 * s,y +  -25.472 * s,x +   18.375 * s,y +  -26.416 * s,x +   13.818 * s,y +  -26.416 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   10.791 * s);
			_setf(o + ( 1 << 2), y +  -26.416 * s);
			_setf(o + ( 2 << 2), x +   10.791 * s);
			_setf(o + ( 3 << 2), y +  -33.398 * s);
			_setf(o + ( 4 << 2), x +   13.818 * s);
			_setf(o + ( 5 << 2), y +  -33.398 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   13.818 * s,y +  -33.398 * s,x +   18.408 * s,y +  -33.398 * s,x +   21.566 * s,y +  -34.326 * s,x +   23.291 * s,y +  -36.181 * s, threshold);
			_bez(x +   23.291 * s,y +  -36.181 * s,x +   25.016 * s,y +  -38.037 * s,x +   25.879 * s,y +  -41.406 * s,x +   25.879 * s,y +  -46.288 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   25.879 * s);
			_setf(o + ( 1 << 2), y +  -58.007 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   25.879 * s,y +  -58.007 * s,x +   25.879 * s,y +  -65.201 * s,x +   27.254 * s,y +  -69.994 * s,x +   30.005 * s,y +  -72.387 * s, threshold);
			_bez(x +   30.005 * s,y +  -72.387 * s,x +   32.755 * s,y +  -74.779 * s,x +   38.183 * s,y +  -75.975 * s,x +   46.289 * s,y +  -75.975 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   49.414 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   49.414 * s);
			_setf(o + ( 3 << 2), y +  -68.993 * s);
			_setf(o + ( 4 << 2), x +   45.996 * s);
			_setf(o + ( 5 << 2), y +  -68.993 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   45.996 * s,y +  -68.993 * s,x +   41.439 * s,y +  -68.993 * s,x +   38.468 * s,y +  -68.285 * s,x +   37.085 * s,y +  -66.869 * s, threshold);
			_bez(x +   37.085 * s,y +  -66.869 * s,x +   35.701 * s,y +  -65.453 * s,x +   35.010 * s,y +  -62.434 * s,x +   35.010 * s,y +  -57.812 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   35.010 * s);
			_setf(o + ( 1 << 2), y +  -45.702 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   35.010 * s,y +  -45.702 * s,x +   35.010 * s,y +  -40.592 * s,x +   34.269 * s,y +  -36.881 * s,x +   32.788 * s,y +  -34.570 * s, threshold);
			_bez(x +   32.788 * s,y +  -34.570 * s,x +   31.307 * s,y +  -32.259 * s,x +   28.776 * s,y +  -30.696 * s,x +   25.195 * s,y +  -29.882 * s, threshold);
			_bez(x +   25.195 * s,y +  -29.882 * s,x +   28.808 * s,y +  -29.003 * s,x +   31.347 * s,y +  -27.408 * s,x +   32.812 * s,y +  -25.097 * s, threshold);
			_bez(x +   32.812 * s,y +  -25.097 * s,x +   34.277 * s,y +  -22.786 * s,x +   35.010 * s,y +  -19.091 * s,x +   35.010 * s,y +  -14.013 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   35.010 * s);
			_setf(o + ( 1 << 2), y +   -1.904 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   35.010 * s,y +   -1.904 * s,x +   35.010 * s,y +    2.750 * s,x +   35.701 * s,y +    5.778 * s,x +   37.085 * s,y +    7.178 * s, threshold);
			_bez(x +   37.085 * s,y +    7.178 * s,x +   38.468 * s,y +    8.577 * s,x +   41.439 * s,y +    9.277 * s,x +   45.996 * s,y +    9.277 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   49.414 * s);
			_setf(o + ( 1 << 2), y +    9.277 * s);
			_setf(o + ( 2 << 2), x +   60.204 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 124:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   34.277 * s);
			_setf(o + ( 1 << 2), y +  -76.415 * s);
			_setf(o + ( 2 << 2), x +   34.277 * s);
			_setf(o + ( 3 << 2), y +   23.584 * s);
			_setf(o + ( 4 << 2), x +   25.879 * s);
			_setf(o + ( 5 << 2), y +   23.584 * s);
			_setf(o + ( 6 << 2), x +   25.879 * s);
			_setf(o + ( 7 << 2), y +  -76.415 * s);
			_setf(o + ( 8 << 2), x +   34.277 * s);
			_setf(o + ( 9 << 2), y +  -76.415 * s);
			_setf(o + (10 << 2), x +   60.205 * s);
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
			_setf(o + ( 0 << 2), x +   10.790 * s);
			_setf(o + ( 1 << 2), y +    9.277 * s);
			_setf(o + ( 2 << 2), x +   14.111 * s);
			_setf(o + ( 3 << 2), y +    9.277 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   14.111 * s,y +    9.277 * s,x +   18.700 * s,y +    9.277 * s,x +   21.695 * s,y +    8.561 * s,x +   23.095 * s,y +    7.129 * s, threshold);
			_bez(x +   23.095 * s,y +    7.129 * s,x +   24.495 * s,y +    5.697 * s,x +   25.195 * s,y +    2.686 * s,x +   25.195 * s,y +   -1.904 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   25.195 * s);
			_setf(o + ( 1 << 2), y +  -14.013 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   25.195 * s,y +  -14.013 * s,x +   25.195 * s,y +  -19.091 * s,x +   25.927 * s,y +  -22.786 * s,x +   27.392 * s,y +  -25.097 * s, threshold);
			_bez(x +   27.392 * s,y +  -25.097 * s,x +   28.857 * s,y +  -27.408 * s,x +   31.396 * s,y +  -29.003 * s,x +   35.009 * s,y +  -29.882 * s, threshold);
			_bez(x +   35.009 * s,y +  -29.882 * s,x +   31.428 * s,y +  -30.696 * s,x +   28.897 * s,y +  -32.259 * s,x +   27.416 * s,y +  -34.570 * s, threshold);
			_bez(x +   27.416 * s,y +  -34.570 * s,x +   25.935 * s,y +  -36.881 * s,x +   25.195 * s,y +  -40.592 * s,x +   25.195 * s,y +  -45.702 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   25.195 * s);
			_setf(o + ( 1 << 2), y +  -57.812 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   25.195 * s,y +  -57.812 * s,x +   25.195 * s,y +  -62.401 * s,x +   24.495 * s,y +  -65.412 * s,x +   23.095 * s,y +  -66.845 * s, threshold);
			_bez(x +   23.095 * s,y +  -66.845 * s,x +   21.695 * s,y +  -68.277 * s,x +   18.700 * s,y +  -68.993 * s,x +   14.111 * s,y +  -68.993 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   10.790 * s);
			_setf(o + ( 1 << 2), y +  -68.993 * s);
			_setf(o + ( 2 << 2), x +   10.790 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   13.818 * s);
			_setf(o + ( 5 << 2), y +  -75.975 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   13.818 * s,y +  -75.975 * s,x +   21.923 * s,y +  -75.975 * s,x +   27.343 * s,y +  -74.779 * s,x +   30.077 * s,y +  -72.387 * s, threshold);
			_bez(x +   30.077 * s,y +  -72.387 * s,x +   32.812 * s,y +  -69.994 * s,x +   34.179 * s,y +  -65.201 * s,x +   34.179 * s,y +  -58.007 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   34.179 * s);
			_setf(o + ( 1 << 2), y +  -46.288 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   34.179 * s,y +  -46.288 * s,x +   34.179 * s,y +  -41.406 * s,x +   35.050 * s,y +  -38.037 * s,x +   36.791 * s,y +  -36.181 * s, threshold);
			_bez(x +   36.791 * s,y +  -36.181 * s,x +   38.533 * s,y +  -34.326 * s,x +   41.698 * s,y +  -33.398 * s,x +   46.288 * s,y +  -33.398 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   49.413 * s);
			_setf(o + ( 1 << 2), y +  -33.398 * s);
			_setf(o + ( 2 << 2), x +   49.413 * s);
			_setf(o + ( 3 << 2), y +  -26.416 * s);
			_setf(o + ( 4 << 2), x +   46.288 * s);
			_setf(o + ( 5 << 2), y +  -26.416 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   46.288 * s,y +  -26.416 * s,x +   41.698 * s,y +  -26.416 * s,x +   38.533 * s,y +  -25.472 * s,x +   36.791 * s,y +  -23.584 * s, threshold);
			_bez(x +   36.791 * s,y +  -23.584 * s,x +   35.050 * s,y +  -21.696 * s,x +   34.179 * s,y +  -18.294 * s,x +   34.179 * s,y +  -13.379 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   34.179 * s);
			_setf(o + ( 1 << 2), y +   -1.709 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   34.179 * s,y +   -1.709 * s,x +   34.179 * s,y +    5.485 * s,x +   32.812 * s,y +   10.286 * s,x +   30.077 * s,y +   12.695 * s, threshold);
			_bez(x +   30.077 * s,y +   12.695 * s,x +   27.343 * s,y +   15.104 * s,x +   21.923 * s,y +   16.308 * s,x +   13.818 * s,y +   16.308 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   10.790 * s);
			_setf(o + ( 1 << 2), y +   16.308 * s);
			_setf(o + ( 2 << 2), x +   10.790 * s);
			_setf(o + ( 3 << 2), y +    9.277 * s);
			_setf(o + ( 4 << 2), x +   60.204 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 126:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   55.907 * s);
			_setf(o + ( 1 << 2), y +  -38.085 * s);
			_setf(o + ( 2 << 2), x +   55.907 * s);
			_setf(o + ( 3 << 2), y +  -29.589 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   55.907 * s,y +  -29.589 * s,x +   53.466 * s,y +  -27.669 * s,x +   51.081 * s,y +  -26.261 * s,x +   48.754 * s,y +  -25.366 * s, threshold);
			_bez(x +   48.754 * s,y +  -25.366 * s,x +   46.426 * s,y +  -24.471 * s,x +   43.977 * s,y +  -24.023 * s,x +   41.405 * s,y +  -24.023 * s, threshold);
			_bez(x +   41.405 * s,y +  -24.023 * s,x +   38.476 * s,y +  -24.023 * s,x +   35.171 * s,y +  -24.852 * s,x +   31.493 * s,y +  -26.513 * s, threshold);
			_bez(x +   31.493 * s,y +  -26.513 * s,x +   30.777 * s,y +  -26.837 * s,x +   30.233 * s,y +  -27.049 * s,x +   29.882 * s,y +  -27.197 * s, threshold);
			_bez(x +   29.882 * s,y +  -27.197 * s,x +   27.368 * s,y +  -28.254 * s,x +   25.284 * s,y +  -29.003 * s,x +   23.608 * s,y +  -29.394 * s, threshold);
			_bez(x +   23.608 * s,y +  -29.394 * s,x +   21.931 * s,y +  -29.785 * s,x +   20.263 * s,y +  -29.980 * s,x +   18.603 * s,y +  -29.980 * s, threshold);
			_bez(x +   18.603 * s,y +  -29.980 * s,x +   16.031 * s,y +  -29.980 * s,x +   13.598 * s,y +  -29.500 * s,x +   11.303 * s,y +  -28.540 * s, threshold);
			_bez(x +   11.303 * s,y +  -28.540 * s,x +    9.008 * s,y +  -27.579 * s,x +    6.673 * s,y +  -26.074 * s,x +    4.297 * s,y +  -24.023 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    4.297 * s);
			_setf(o + ( 1 << 2), y +  -32.519 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    4.297 * s,y +  -32.519 * s,x +    6.836 * s,y +  -34.472 * s,x +    9.293 * s,y +  -35.888 * s,x +   11.669 * s,y +  -36.767 * s, threshold);
			_bez(x +   11.669 * s,y +  -36.767 * s,x +   14.046 * s,y +  -37.646 * s,x +   16.585 * s,y +  -38.085 * s,x +   19.287 * s,y +  -38.085 * s, threshold);
			_bez(x +   19.287 * s,y +  -38.085 * s,x +   21.012 * s,y +  -38.085 * s,x +   22.688 * s,y +  -37.906 * s,x +   24.316 * s,y +  -37.548 * s, threshold);
			_bez(x +   24.316 * s,y +  -37.548 * s,x +   25.943 * s,y +  -37.190 * s,x +   27.961 * s,y +  -36.506 * s,x +   30.370 * s,y +  -35.497 * s, threshold);
			_bez(x +   30.370 * s,y +  -35.497 * s,x +   30.761 * s,y +  -35.334 * s,x +   31.298 * s,y +  -35.090 * s,x +   31.982 * s,y +  -34.765 * s, threshold);
			_bez(x +   31.982 * s,y +  -34.765 * s,x +   35.758 * s,y +  -32.974 * s,x +   39.159 * s,y +  -32.080 * s,x +   42.187 * s,y +  -32.080 * s, threshold);
			_bez(x +   42.187 * s,y +  -32.080 * s,x +   44.465 * s,y +  -32.080 * s,x +   46.719 * s,y +  -32.576 * s,x +   48.949 * s,y +  -33.569 * s, threshold);
			_bez(x +   48.949 * s,y +  -33.569 * s,x +   51.179 * s,y +  -34.562 * s,x +   53.498 * s,y +  -36.067 * s,x +   55.907 * s,y +  -38.085 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
		}
	}
	#end
}