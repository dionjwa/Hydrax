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

class AndaleMono extends de.polygonal.gl.text.MonospaceVectorFont
{
	public function new()
	{
		#if font_inline
		super(2048, 1858, -446, 1229, BOUNDS_TABLE);
		#else
		super(
		"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");
		#end
	}
	
	#if font_inline
	static var BOUNDS_TABLE:Array<Float> =
	[
		  33,     23.388,    -68.895,     35.497,      1.318,
		  34,     17.383,    -68.895,     42.577,    -43.505,
		  35,      4.296,    -68.895,     56.005,          0,
		  36,     11.083,    -74.999,     49.901,      6.885,
		  37,      2.295,    -70.214,     57.617,      1.318,
		  38,      3.906,    -70.214,     59.911,      1.318,
		  39,     26.318,    -68.895,     33.789,    -43.505,
		  40,     21.484,    -70.116,     46.776,     14.404,
		  41,     13.183,    -70.116,     38.476,     14.404,
		  42,     12.695,    -68.895,     47.216,    -30.712,
		  43,      6.884,    -58.495,     53.075,    -12.109,
		  44,     24.120,    -10.791,     36.620,     11.719,
		  45,     14.990,    -31.201,     43.994,    -23.779,
		  46,     23.681,    -11.181,     35.791,      1.318,
		  47,     10.498,    -70.214,     47.607,      1.318,
		  48,      7.177,    -70.214,     52.587,      1.318,
		  49,     13.476,    -69.286,     49.706,          0,
		  50,     10.010,    -70.214,     47.899,          0,
		  51,      9.716,    -70.214,     48.192,      1.318,
		  52,      5.908,    -68.895,     52.391,          0,
		  53,     10.986,    -68.895,     48.779,      1.318,
		  54,      9.180,    -70.214,     52.099,      1.318,
		  55,      9.717,    -68.895,     50.585,          0,
		  56,      8.008,    -70.214,     51.708,      1.318,
		  57,      8.691,    -70.311,     51.610,      1.221,
		  58,     23.779,    -51.611,     35.497,      0.781,
		  59,     24.120,    -51.611,     36.620,     11.719,
		  60,     11.083,    -60.009,     47.606,    -10.498,
		  61,      6.885,    -48.290,     53.076,    -22.314,
		  62,     12.988,    -60.009,     49.511,    -10.498,
		  63,     11.719,    -70.214,     46.484,      1.318,
		  64,      4.785,    -69.823,     55.907,      7.910,
		  65,      2.783,    -68.895,     57.421,          0,
		  66,     10.205,    -68.895,     52.978,          0,
		  67,      6.201,    -70.214,     52.294,      1.318,
		  68,     10.204,    -68.895,     53.612,          0,
		  69,     12.500,    -68.895,     48.486,          0,
		  70,     12.500,    -68.895,     49.023,          0,
		  71,      6.201,    -70.214,     52.196,      1.318,
		  72,     10.205,    -68.895,     49.804,          0,
		  73,     14.013,    -68.895,     45.312,          0,
		  74,      7.617,    -68.895,     42.284,      1.318,
		  75,     10.205,    -68.895,     58.885,          0,
		  76,     12.499,    -68.895,     49.999,          0,
		  77,      8.399,    -68.895,     52.197,          0,
		  78,      9.180,    -68.895,     50.781,          0,
		  79,      6.201,    -70.214,     53.612,      1.318,
		  80,     12.500,    -68.895,     51.806,          0,
		  81,      6.201,    -70.214,     55.419,     12.695,
		  82,     10.205,    -68.895,     57.323,          0,
		  83,     11.083,    -70.214,     49.901,      1.318,
		  84,      4.785,    -68.895,     55.321,          0,
		  85,     10.205,    -68.895,     49.804,      1.318,
		  86,      2.588,    -68.895,     57.177,          0,
		  87,      2.100,    -68.895,     57.909,          0,
		  88,      4.199,    -68.895,     56.786,          0,
		  89,      4.590,    -68.895,     55.614,          0,
		  90,      8.887,    -68.895,     50.780,          0,
		  91,     25.488,    -68.895,     44.481,     13.183,
		  92,     10.400,    -70.214,     47.509,      1.318,
		  93,     13.623,    -68.895,     33.105,     12.988,
		  94,      5.420,    -74.999,     54.882,    -38.476,
		  95,          0,     15.381,     60.009,     21.777,
		  96,     16.992,    -71.581,     37.695,    -56.884,
		  97,     10.498,    -52.099,     50.976,      1.318,
		  98,     10.498,    -68.895,     52.880,      1.318,
		  99,      8.593,    -52.099,     49.511,      1.318,
		 100,      7.079,    -68.895,     49.510,      1.318,
		 101,      8.301,    -52.099,     51.220,      1.318,
		 102,     10.889,    -70.116,     50.195,          0,
		 103,      8.691,    -52.099,     53.612,     20.117,
		 104,     10.498,    -68.895,     49.706,          0,
		 105,     14.404,    -70.116,     38.476,          0,
		 106,     10.498,    -70.116,     38.476,     20.117,
		 107,     10.498,    -68.895,     54.686,          0,
		 108,     11.913,    -68.895,     45.995,          0,
		 109,      6.299,    -52.099,     53.710,          0,
		 110,     10.498,    -52.099,     49.706,          0,
		 111,      7.080,    -52.099,     52.880,      1.318,
		 112,     10.498,    -52.099,     52.880,     20.117,
		 113,      7.080,    -52.099,     49.511,     20.117,
		 114,     15.918,    -52.099,     50.487,          0,
		 115,     11.376,    -52.099,     49.022,      1.318,
		 116,     11.718,    -64.794,     50.194,      1.221,
		 117,     10.401,    -50.878,     49.609,      1.221,
		 118,      6.592,    -50.878,     52.001,          0,
		 119,      5.615,    -50.878,     55.712,          0,
		 120,      7.080,    -50.878,     51.513,          0,
		 121,      5.713,    -50.878,     52.001,     20.117,
		 122,      9.912,    -50.878,     49.023,          0,
		 123,     17.480,    -68.895,     44.677,     16.699,
		 124,     25.976,    -68.895,     33.495,     18.701,
		 125,     15.088,    -68.895,     42.285,     16.699,
		 126,      2.881,    -32.910,     56.396,    -18.603
	];

	override function _draw(charCode:Int, x:Float, y:Float, s:Float, threshold:Float):Void
	{
		var o = 0;
		switch (charCode)
		{			
			case 33:
			
			o = _posf(16);
			_setf(o + ( 0 << 2), x +   33.593 * s);
			_setf(o + ( 1 << 2), y +  -46.484 * s);
			_setf(o + ( 2 << 2), x +   31.298 * s);
			_setf(o + ( 3 << 2), y +  -20.703 * s);
			_setf(o + ( 4 << 2), x +   27.099 * s);
			_setf(o + ( 5 << 2), y +  -20.703 * s);
			_setf(o + ( 6 << 2), x +   24.804 * s);
			_setf(o + ( 7 << 2), y +  -46.484 * s);
			_setf(o + ( 8 << 2), x +   24.804 * s);
			_setf(o + ( 9 << 2), y +  -68.895 * s);
			_setf(o + (10 << 2), x +   33.593 * s);
			_setf(o + (11 << 2), y +  -68.895 * s);
			_setf(o + (12 << 2), x +   33.593 * s);
			_setf(o + (13 << 2), y +  -46.484 * s);
			_setf(o + (14 << 2), x +   29.394 * s);
			_setf(o + (15 << 2), y +  -11.181 * s);
			o = _posb(8);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 1);
			_vr.bezier8(x +   29.394 * s,y +  -11.181 * s,x +   31.119 * s,y +  -11.181 * s,x +   32.568 * s,y +  -10.596 * s,x +   33.740 * s,y +   -9.424 * s, threshold);
			_vr.bezier8(x +   33.740 * s,y +   -9.424 * s,x +   34.912 * s,y +   -8.252 * s,x +   35.497 * s,y +   -6.803 * s,x +   35.497 * s,y +   -5.078 * s, threshold);
			_vr.bezier8(x +   35.497 * s,y +   -5.078 * s,x +   35.497 * s,y +   -3.353 * s,x +   34.903 * s,y +   -1.855 * s,x +   33.715 * s,y +   -0.586 * s, threshold);
			_vr.bezier8(x +   33.715 * s,y +   -0.586 * s,x +   32.527 * s,y +    0.684 * s,x +   31.087 * s,y +    1.318 * s,x +   29.394 * s,y +    1.318 * s, threshold);
			_vr.bezier8(x +   29.394 * s,y +    1.318 * s,x +   27.734 * s,y +    1.318 * s,x +   26.318 * s,y +    0.692 * s,x +   25.146 * s,y +   -0.562 * s, threshold);
			_vr.bezier8(x +   25.146 * s,y +   -0.562 * s,x +   23.974 * s,y +   -1.815 * s,x +   23.388 * s,y +   -3.320 * s,x +   23.388 * s,y +   -5.078 * s, threshold);
			_vr.bezier8(x +   23.388 * s,y +   -5.078 * s,x +   23.388 * s,y +   -6.836 * s,x +   23.966 * s,y +   -8.293 * s,x +   25.122 * s,y +   -9.448 * s, threshold);
			_vr.bezier8(x +   25.122 * s,y +   -9.448 * s,x +   26.277 * s,y +  -10.604 * s,x +   27.701 * s,y +  -11.181 * s,x +   29.394 * s,y +  -11.181 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.009 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 34:
			
			o = _posf(30);
			_setf(o + ( 0 << 2), x +   42.577 * s);
			_setf(o + ( 1 << 2), y +  -57.177 * s);
			_setf(o + ( 2 << 2), x +   40.820 * s);
			_setf(o + ( 3 << 2), y +  -43.505 * s);
			_setf(o + ( 4 << 2), x +   36.913 * s);
			_setf(o + ( 5 << 2), y +  -43.505 * s);
			_setf(o + ( 6 << 2), x +   35.107 * s);
			_setf(o + ( 7 << 2), y +  -57.177 * s);
			_setf(o + ( 8 << 2), x +   35.107 * s);
			_setf(o + ( 9 << 2), y +  -68.895 * s);
			_setf(o + (10 << 2), x +   42.577 * s);
			_setf(o + (11 << 2), y +  -68.895 * s);
			_setf(o + (12 << 2), x +   42.577 * s);
			_setf(o + (13 << 2), y +  -57.177 * s);
			_setf(o + (14 << 2), x +   24.902 * s);
			_setf(o + (15 << 2), y +  -57.177 * s);
			_setf(o + (16 << 2), x +   23.095 * s);
			_setf(o + (17 << 2), y +  -43.505 * s);
			_setf(o + (18 << 2), x +   19.189 * s);
			_setf(o + (19 << 2), y +  -43.505 * s);
			_setf(o + (20 << 2), x +   17.383 * s);
			_setf(o + (21 << 2), y +  -57.177 * s);
			_setf(o + (22 << 2), x +   17.383 * s);
			_setf(o + (23 << 2), y +  -68.895 * s);
			_setf(o + (24 << 2), x +   24.902 * s);
			_setf(o + (25 << 2), y +  -68.895 * s);
			_setf(o + (26 << 2), x +   24.902 * s);
			_setf(o + (27 << 2), y +  -57.177 * s);
			_setf(o + (28 << 2), x +   60.009 * s);
			_setf(o + (29 << 2), y +       0. * s);
			o = _posb(15);
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
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 1);
			
			case 35:
			
			o = _posf(70);
			_setf(o + ( 0 << 2), x +   56.005 * s);
			_setf(o + ( 1 << 2), y +  -19.384 * s);
			_setf(o + ( 2 << 2), x +   40.478 * s);
			_setf(o + ( 3 << 2), y +  -19.384 * s);
			_setf(o + ( 4 << 2), x +   36.376 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   29.491 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   33.593 * s);
			_setf(o + ( 9 << 2), y +  -19.384 * s);
			_setf(o + (10 << 2), x +   20.507 * s);
			_setf(o + (11 << 2), y +  -19.384 * s);
			_setf(o + (12 << 2), x +   16.406 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +    9.521 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   13.623 * s);
			_setf(o + (17 << 2), y +  -19.384 * s);
			_setf(o + (18 << 2), x +    4.296 * s);
			_setf(o + (19 << 2), y +  -19.384 * s);
			_setf(o + (20 << 2), x +    4.296 * s);
			_setf(o + (21 << 2), y +  -25.781 * s);
			_setf(o + (22 << 2), x +   14.990 * s);
			_setf(o + (23 << 2), y +  -25.781 * s);
			_setf(o + (24 << 2), x +   18.701 * s);
			_setf(o + (25 << 2), y +  -43.310 * s);
			_setf(o + (26 << 2), x +    4.296 * s);
			_setf(o + (27 << 2), y +  -43.310 * s);
			_setf(o + (28 << 2), x +    4.296 * s);
			_setf(o + (29 << 2), y +  -49.706 * s);
			_setf(o + (30 << 2), x +   20.019 * s);
			_setf(o + (31 << 2), y +  -49.706 * s);
			_setf(o + (32 << 2), x +   24.120 * s);
			_setf(o + (33 << 2), y +  -68.895 * s);
			_setf(o + (34 << 2), x +   31.005 * s);
			_setf(o + (35 << 2), y +  -68.895 * s);
			_setf(o + (36 << 2), x +   26.904 * s);
			_setf(o + (37 << 2), y +  -49.706 * s);
			_setf(o + (38 << 2), x +   39.989 * s);
			_setf(o + (39 << 2), y +  -49.706 * s);
			_setf(o + (40 << 2), x +   44.091 * s);
			_setf(o + (41 << 2), y +  -68.895 * s);
			_setf(o + (42 << 2), x +   50.975 * s);
			_setf(o + (43 << 2), y +  -68.895 * s);
			_setf(o + (44 << 2), x +   46.923 * s);
			_setf(o + (45 << 2), y +  -49.706 * s);
			_setf(o + (46 << 2), x +   56.005 * s);
			_setf(o + (47 << 2), y +  -49.706 * s);
			_setf(o + (48 << 2), x +   56.005 * s);
			_setf(o + (49 << 2), y +  -43.310 * s);
			_setf(o + (50 << 2), x +   45.604 * s);
			_setf(o + (51 << 2), y +  -43.310 * s);
			_setf(o + (52 << 2), x +   41.894 * s);
			_setf(o + (53 << 2), y +  -25.781 * s);
			_setf(o + (54 << 2), x +   56.005 * s);
			_setf(o + (55 << 2), y +  -25.781 * s);
			_setf(o + (56 << 2), x +   56.005 * s);
			_setf(o + (57 << 2), y +  -19.384 * s);
			_setf(o + (58 << 2), x +   38.720 * s);
			_setf(o + (59 << 2), y +  -43.310 * s);
			_setf(o + (60 << 2), x +   25.585 * s);
			_setf(o + (61 << 2), y +  -43.310 * s);
			_setf(o + (62 << 2), x +   21.923 * s);
			_setf(o + (63 << 2), y +  -25.781 * s);
			_setf(o + (64 << 2), x +   35.009 * s);
			_setf(o + (65 << 2), y +  -25.781 * s);
			_setf(o + (66 << 2), x +   38.720 * s);
			_setf(o + (67 << 2), y +  -43.310 * s);
			_setf(o + (68 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   33.300 * s);
			_setf(o + ( 1 << 2), y +  -39.501 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   33.300 * s,y +  -39.501 * s,x +   39.452 * s,y +  -36.865 * s,x +   43.757 * s,y +  -33.943 * s,x +   46.215 * s,y +  -30.737 * s, threshold);
			_vr.bezier8(x +   46.215 * s,y +  -30.737 * s,x +   48.672 * s,y +  -27.530 * s,x +   49.901 * s,y +  -23.893 * s,x +   49.901 * s,y +  -19.824 * s, threshold);
			_vr.bezier8(x +   49.901 * s,y +  -19.824 * s,x +   49.901 * s,y +  -14.681 * s,x +   48.428 * s,y +  -10.311 * s,x +   45.482 * s,y +   -6.714 * s, threshold);
			_vr.bezier8(x +   45.482 * s,y +   -6.714 * s,x +   42.536 * s,y +   -3.117 * s,x +   38.475 * s,y +   -0.684 * s,x +   33.300 * s,y +    0.586 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   33.300 * s);
			_setf(o + ( 1 << 2), y +    6.885 * s);
			_setf(o + ( 2 << 2), x +   27.587 * s);
			_setf(o + ( 3 << 2), y +    6.885 * s);
			_setf(o + ( 4 << 2), x +   27.587 * s);
			_setf(o + ( 5 << 2), y +    1.318 * s);
			_setf(o + ( 6 << 2), x +   27.196 * s);
			_setf(o + ( 7 << 2), y +    1.318 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_vr.bezier8(x +   27.196 * s,y +    1.318 * s,x +   21.272 * s,y +    1.318 * s,x +   16.080 * s,y +    0.146 * s,x +   11.620 * s,y +   -2.197 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   13.281 * s);
			_setf(o + ( 1 << 2), y +   -9.082 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   13.281 * s,y +   -9.082 * s,x +   18.521 * s,y +   -6.706 * s,x +   23.095 * s,y +   -5.517 * s,x +   27.001 * s,y +   -5.517 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   27.587 * s);
			_setf(o + ( 1 << 2), y +   -5.517 * s);
			_setf(o + ( 2 << 2), x +   27.587 * s);
			_setf(o + ( 3 << 2), y +  -33.984 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_vr.bezier8(x +   27.587 * s,y +  -33.984 * s,x +   20.588 * s,y +  -36.979 * s,x +   16.088 * s,y +  -39.933 * s,x +   14.086 * s,y +  -42.846 * s, threshold);
			_vr.bezier8(x +   14.086 * s,y +  -42.846 * s,x +   12.084 * s,y +  -45.759 * s,x +   11.083 * s,y +  -48.844 * s,x +   11.083 * s,y +  -52.099 * s, threshold);
			_vr.bezier8(x +   11.083 * s,y +  -52.099 * s,x +   11.083 * s,y +  -56.721 * s,x +   12.532 * s,y +  -60.595 * s,x +   15.429 * s,y +  -63.720 * s, threshold);
			_vr.bezier8(x +   15.429 * s,y +  -63.720 * s,x +   18.326 * s,y +  -66.845 * s,x +   22.379 * s,y +  -68.879 * s,x +   27.587 * s,y +  -69.823 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   27.587 * s);
			_setf(o + ( 1 << 2), y +  -74.999 * s);
			_setf(o + ( 2 << 2), x +   33.300 * s);
			_setf(o + ( 3 << 2), y +  -74.999 * s);
			_setf(o + ( 4 << 2), x +   33.300 * s);
			_setf(o + ( 5 << 2), y +  -70.214 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   33.300 * s,y +  -70.214 * s,x +   37.759 * s,y +  -70.214 * s,x +   42.154 * s,y +  -69.514 * s,x +   46.483 * s,y +  -68.114 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   44.677 * s);
			_setf(o + ( 1 << 2), y +  -61.278 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   44.677 * s,y +  -61.278 * s,x +   40.705 * s,y +  -62.678 * s,x +   36.913 * s,y +  -63.378 * s,x +   33.300 * s,y +  -63.378 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   33.300 * s);
			_setf(o + ( 1 << 2), y +  -39.501 * s);
			_setf(o + ( 2 << 2), x +   27.587 * s);
			_setf(o + ( 3 << 2), y +  -42.187 * s);
			_setf(o + ( 4 << 2), x +   27.587 * s);
			_setf(o + ( 5 << 2), y +  -62.694 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_setb(o +  2, 2);
			_vr.bezier8(x +   27.587 * s,y +  -62.694 * s,x +   21.793 * s,y +  -61.164 * s,x +   18.896 * s,y +  -57.730 * s,x +   18.896 * s,y +  -52.392 * s, threshold);
			_vr.bezier8(x +   18.896 * s,y +  -52.392 * s,x +   18.896 * s,y +  -48.453 * s,x +   21.793 * s,y +  -45.051 * s,x +   27.587 * s,y +  -42.187 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   33.300 * s);
			_setf(o + ( 1 << 2), y +   -6.396 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   33.300 * s,y +   -6.396 * s,x +   39.159 * s,y +   -8.512 * s,x +   42.089 * s,y +  -12.646 * s,x +   42.089 * s,y +  -18.799 * s, threshold);
			_vr.bezier8(x +   42.089 * s,y +  -18.799 * s,x +   42.089 * s,y +  -21.533 * s,x +   41.397 * s,y +  -23.860 * s,x +   40.014 * s,y +  -25.781 * s, threshold);
			_vr.bezier8(x +   40.014 * s,y +  -25.781 * s,x +   38.630 * s,y +  -27.701 * s,x +   36.392 * s,y +  -29.508 * s,x +   33.300 * s,y +  -31.201 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   33.300 * s);
			_setf(o + ( 1 << 2), y +   -6.396 * s);
			_setf(o + ( 2 << 2), x +   60.008 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 37:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   16.113 * s);
			_setf(o + ( 1 << 2), y +  -70.214 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   16.113 * s,y +  -70.214 * s,x +   20.443 * s,y +  -70.214 * s,x +   23.820 * s,y +  -68.700 * s,x +   26.245 * s,y +  -65.673 * s, threshold);
			_vr.bezier8(x +   26.245 * s,y +  -65.673 * s,x +   28.670 * s,y +  -62.646 * s,x +   29.883 * s,y +  -58.723 * s,x +   29.883 * s,y +  -53.905 * s, threshold);
			_vr.bezier8(x +   29.883 * s,y +  -53.905 * s,x +   29.883 * s,y +  -49.088 * s,x +   28.662 * s,y +  -45.165 * s,x +   26.221 * s,y +  -42.138 * s, threshold);
			_vr.bezier8(x +   26.221 * s,y +  -42.138 * s,x +   23.779 * s,y +  -39.111 * s,x +   20.410 * s,y +  -37.597 * s,x +   16.113 * s,y +  -37.597 * s, threshold);
			_vr.bezier8(x +   16.113 * s,y +  -37.597 * s,x +   11.849 * s,y +  -37.597 * s,x +    8.480 * s,y +  -39.119 * s,x +    6.006 * s,y +  -42.162 * s, threshold);
			_vr.bezier8(x +    6.006 * s,y +  -42.162 * s,x +    3.532 * s,y +  -45.206 * s,x +    2.295 * s,y +  -49.120 * s,x +    2.295 * s,y +  -53.905 * s, threshold);
			_vr.bezier8(x +    2.295 * s,y +  -53.905 * s,x +    2.295 * s,y +  -58.593 * s,x +    3.540 * s,y +  -62.483 * s,x +    6.031 * s,y +  -65.575 * s, threshold);
			_vr.bezier8(x +    6.031 * s,y +  -65.575 * s,x +    8.521 * s,y +  -68.668 * s,x +   11.882 * s,y +  -70.214 * s,x +   16.113 * s,y +  -70.214 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   16.113 * s);
			_setf(o + ( 1 << 2), y +  -43.505 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   16.113 * s,y +  -43.505 * s,x +   20.638 * s,y +  -43.505 * s,x +   22.900 * s,y +  -46.972 * s,x +   22.900 * s,y +  -53.905 * s, threshold);
			_vr.bezier8(x +   22.900 * s,y +  -53.905 * s,x +   22.900 * s,y +  -60.839 * s,x +   20.638 * s,y +  -64.306 * s,x +   16.113 * s,y +  -64.306 * s, threshold);
			_vr.bezier8(x +   16.113 * s,y +  -64.306 * s,x +   11.556 * s,y +  -64.306 * s,x +    9.278 * s,y +  -60.839 * s,x +    9.278 * s,y +  -53.905 * s, threshold);
			_vr.bezier8(x +    9.278 * s,y +  -53.905 * s,x +    9.278 * s,y +  -46.972 * s,x +   11.556 * s,y +  -43.505 * s,x +   16.113 * s,y +  -43.505 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   51.416 * s);
			_setf(o + ( 1 << 2), y +  -68.895 * s);
			_setf(o + ( 2 << 2), x +   14.990 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    8.203 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   44.580 * s);
			_setf(o + ( 7 << 2), y +  -68.895 * s);
			_setf(o + ( 8 << 2), x +   51.416 * s);
			_setf(o + ( 9 << 2), y +  -68.895 * s);
			_setf(o + (10 << 2), x +   43.798 * s);
			_setf(o + (11 << 2), y +  -31.298 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_vr.bezier8(x +   43.798 * s,y +  -31.298 * s,x +   48.128 * s,y +  -31.298 * s,x +   51.513 * s,y +  -29.793 * s,x +   53.955 * s,y +  -26.782 * s, threshold);
			_vr.bezier8(x +   53.955 * s,y +  -26.782 * s,x +   56.396 * s,y +  -23.771 * s,x +   57.617 * s,y +  -19.840 * s,x +   57.617 * s,y +  -14.990 * s, threshold);
			_vr.bezier8(x +   57.617 * s,y +  -14.990 * s,x +   57.617 * s,y +  -10.205 * s,x +   56.388 * s,y +   -6.291 * s,x +   53.930 * s,y +   -3.247 * s, threshold);
			_vr.bezier8(x +   53.930 * s,y +   -3.247 * s,x +   51.473 * s,y +   -0.203 * s,x +   48.095 * s,y +    1.318 * s,x +   43.798 * s,y +    1.318 * s, threshold);
			_vr.bezier8(x +   43.798 * s,y +    1.318 * s,x +   39.534 * s,y +    1.318 * s,x +   36.165 * s,y +   -0.212 * s,x +   33.691 * s,y +   -3.271 * s, threshold);
			_vr.bezier8(x +   33.691 * s,y +   -3.271 * s,x +   31.217 * s,y +   -6.331 * s,x +   29.980 * s,y +  -10.238 * s,x +   29.980 * s,y +  -14.990 * s, threshold);
			_vr.bezier8(x +   29.980 * s,y +  -14.990 * s,x +   29.980 * s,y +  -19.710 * s,x +   31.225 * s,y +  -23.608 * s,x +   33.716 * s,y +  -26.684 * s, threshold);
			_vr.bezier8(x +   33.716 * s,y +  -26.684 * s,x +   36.206 * s,y +  -29.760 * s,x +   39.567 * s,y +  -31.298 * s,x +   43.798 * s,y +  -31.298 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   43.798 * s);
			_setf(o + ( 1 << 2), y +   -4.590 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   43.798 * s,y +   -4.590 * s,x +   48.323 * s,y +   -4.590 * s,x +   50.585 * s,y +   -8.057 * s,x +   50.585 * s,y +  -14.990 * s, threshold);
			_vr.bezier8(x +   50.585 * s,y +  -14.990 * s,x +   50.585 * s,y +  -21.923 * s,x +   48.323 * s,y +  -25.390 * s,x +   43.798 * s,y +  -25.390 * s, threshold);
			_vr.bezier8(x +   43.798 * s,y +  -25.390 * s,x +   39.274 * s,y +  -25.390 * s,x +   37.011 * s,y +  -21.923 * s,x +   37.011 * s,y +  -14.990 * s, threshold);
			_vr.bezier8(x +   37.011 * s,y +  -14.990 * s,x +   37.011 * s,y +   -8.057 * s,x +   39.274 * s,y +   -4.590 * s,x +   43.798 * s,y +   -4.590 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.009 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 38:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   59.911 * s);
			_setf(o + ( 1 << 2), y +   -0.391 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   59.911 * s,y +   -0.391 * s,x +   58.479 * s,y +    0.195 * s,x +   56.705 * s,y +    0.488 * s,x +   54.589 * s,y +    0.488 * s, threshold);
			_vr.bezier8(x +   54.589 * s,y +    0.488 * s,x +   52.864 * s,y +    0.488 * s,x +   51.155 * s,y +   -0.122 * s,x +   49.462 * s,y +   -1.343 * s, threshold);
			_vr.bezier8(x +   49.462 * s,y +   -1.343 * s,x +   47.770 * s,y +   -2.563 * s,x +   45.589 * s,y +   -4.948 * s,x +   42.919 * s,y +   -8.496 * s, threshold);
			_vr.bezier8(x +   42.919 * s,y +   -8.496 * s,x +   37.841 * s,y +   -1.953 * s,x +   31.705 * s,y +    1.318 * s,x +   24.512 * s,y +    1.318 * s, threshold);
			_vr.bezier8(x +   24.512 * s,y +    1.318 * s,x +   18.750 * s,y +    1.318 * s,x +   13.875 * s,y +   -0.513 * s,x +    9.888 * s,y +   -4.175 * s, threshold);
			_vr.bezier8(x +    9.888 * s,y +   -4.175 * s,x +    5.900 * s,y +   -7.837 * s,x +    3.906 * s,y +  -12.386 * s,x +    3.906 * s,y +  -17.822 * s, threshold);
			_vr.bezier8(x +    3.906 * s,y +  -17.822 * s,x +    3.906 * s,y +  -21.305 * s,x +    4.948 * s,y +  -24.601 * s,x +    7.031 * s,y +  -27.710 * s, threshold);
			_vr.bezier8(x +    7.031 * s,y +  -27.710 * s,x +    9.115 * s,y +  -30.818 * s,x +   13.005 * s,y +  -34.342 * s,x +   18.701 * s,y +  -38.281 * s, threshold);
			_vr.bezier8(x +   18.701 * s,y +  -38.281 * s,x +   13.297 * s,y +  -44.628 * s,x +   10.596 * s,y +  -50.162 * s,x +   10.596 * s,y +  -54.882 * s, threshold);
			_vr.bezier8(x +   10.596 * s,y +  -54.882 * s,x +   10.596 * s,y +  -59.439 * s,x +   12.101 * s,y +  -63.134 * s,x +   15.112 * s,y +  -65.966 * s, threshold);
			_vr.bezier8(x +   15.112 * s,y +  -65.966 * s,x +   18.123 * s,y +  -68.798 * s,x +   21.924 * s,y +  -70.214 * s,x +   26.513 * s,y +  -70.214 * s, threshold);
			_vr.bezier8(x +   26.513 * s,y +  -70.214 * s,x +   30.778 * s,y +  -70.214 * s,x +   34.293 * s,y +  -69.001 * s,x +   37.060 * s,y +  -66.576 * s, threshold);
			_vr.bezier8(x +   37.060 * s,y +  -66.576 * s,x +   39.827 * s,y +  -64.151 * s,x +   41.210 * s,y +  -60.790 * s,x +   41.210 * s,y +  -56.493 * s, threshold);
			_vr.bezier8(x +   41.210 * s,y +  -56.493 * s,x +   41.210 * s,y +  -53.401 * s,x +   40.266 * s,y +  -50.439 * s,x +   38.378 * s,y +  -47.607 * s, threshold);
			_vr.bezier8(x +   38.378 * s,y +  -47.607 * s,x +   36.490 * s,y +  -44.775 * s,x +   32.959 * s,y +  -41.471 * s,x +   27.783 * s,y +  -37.695 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   42.187 * s);
			_setf(o + ( 1 << 2), y +  -19.922 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   42.187 * s,y +  -19.922 * s,x +   44.401 * s,y +  -25.586 * s,x +   46.053 * s,y +  -29.524 * s,x +   47.143 * s,y +  -31.738 * s, threshold);
			_vr.bezier8(x +   47.143 * s,y +  -31.738 * s,x +   48.233 * s,y +  -33.951 * s,x +   49.772 * s,y +  -35.864 * s,x +   51.757 * s,y +  -37.475 * s, threshold);
			_vr.bezier8(x +   51.757 * s,y +  -37.475 * s,x +   53.743 * s,y +  -39.086 * s,x +   56.298 * s,y +  -39.892 * s,x +   59.423 * s,y +  -39.892 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   59.814 * s);
			_setf(o + ( 1 << 2), y +  -39.892 * s);
			_setf(o + ( 2 << 2), x +   59.814 * s);
			_setf(o + ( 3 << 2), y +  -33.203 * s);
			_setf(o + ( 4 << 2), x +   59.423 * s);
			_setf(o + ( 5 << 2), y +  -33.203 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   59.423 * s,y +  -33.203 * s,x +   57.437 * s,y +  -33.203 * s,x +   55.533 * s,y +  -32.145 * s,x +   53.710 * s,y +  -30.029 * s, threshold);
			_vr.bezier8(x +   53.710 * s,y +  -30.029 * s,x +   51.887 * s,y +  -27.913 * s,x +   49.479 * s,y +  -22.737 * s,x +   46.484 * s,y +  -14.502 * s, threshold);
			_vr.bezier8(x +   46.484 * s,y +  -14.502 * s,x +   48.925 * s,y +  -11.572 * s,x +   50.829 * s,y +   -9.473 * s,x +   52.197 * s,y +   -8.203 * s, threshold);
			_vr.bezier8(x +   52.197 * s,y +   -8.203 * s,x +   53.564 * s,y +   -6.933 * s,x +   55.094 * s,y +   -6.299 * s,x +   56.786 * s,y +   -6.299 * s, threshold);
			_vr.bezier8(x +   56.786 * s,y +   -6.299 * s,x +   57.568 * s,y +   -6.299 * s,x +   58.609 * s,y +   -6.396 * s,x +   59.911 * s,y +   -6.592 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   59.911 * s);
			_setf(o + ( 1 << 2), y +   -0.391 * s);
			_setf(o + ( 2 << 2), x +   24.219 * s);
			_setf(o + ( 3 << 2), y +  -42.285 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_vr.bezier8(x +   24.219 * s,y +  -42.285 * s,x +   28.060 * s,y +  -44.954 * s,x +   30.737 * s,y +  -47.314 * s,x +   32.251 * s,y +  -49.364 * s, threshold);
			_vr.bezier8(x +   32.251 * s,y +  -49.364 * s,x +   33.764 * s,y +  -51.415 * s,x +   34.521 * s,y +  -53.596 * s,x +   34.521 * s,y +  -55.907 * s, threshold);
			_vr.bezier8(x +   34.521 * s,y +  -55.907 * s,x +   34.521 * s,y +  -58.446 * s,x +   33.748 * s,y +  -60.367 * s,x +   32.202 * s,y +  -61.669 * s, threshold);
			_vr.bezier8(x +   32.202 * s,y +  -61.669 * s,x +   30.656 * s,y +  -62.971 * s,x +   28.792 * s,y +  -63.622 * s,x +   26.611 * s,y +  -63.622 * s, threshold);
			_vr.bezier8(x +   26.611 * s,y +  -63.622 * s,x +   24.072 * s,y +  -63.622 * s,x +   21.948 * s,y +  -62.849 * s,x +   20.239 * s,y +  -61.303 * s, threshold);
			_vr.bezier8(x +   20.239 * s,y +  -61.303 * s,x +   18.530 * s,y +  -59.757 * s,x +   17.676 * s,y +  -57.616 * s,x +   17.676 * s,y +  -54.882 * s, threshold);
			_vr.bezier8(x +   17.676 * s,y +  -54.882 * s,x +   17.676 * s,y +  -51.366 * s,x +   19.857 * s,y +  -47.167 * s,x +   24.219 * s,y +  -42.285 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   38.818 * s);
			_setf(o + ( 1 << 2), y +  -13.476 * s);
			_setf(o + ( 2 << 2), x +   22.412 * s);
			_setf(o + ( 3 << 2), y +  -33.691 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   22.412 * s,y +  -33.691 * s,x +   18.571 * s,y +  -30.891 * s,x +   15.861 * s,y +  -28.312 * s,x +   14.282 * s,y +  -25.952 * s, threshold);
			_vr.bezier8(x +   14.282 * s,y +  -25.952 * s,x +   12.703 * s,y +  -23.592 * s,x +   11.914 * s,y +  -20.979 * s,x +   11.914 * s,y +  -18.115 * s, threshold);
			_vr.bezier8(x +   11.914 * s,y +  -18.115 * s,x +   11.914 * s,y +  -14.534 * s,x +   13.175 * s,y +  -11.523 * s,x +   15.698 * s,y +   -9.082 * s, threshold);
			_vr.bezier8(x +   15.698 * s,y +   -9.082 * s,x +   18.221 * s,y +   -6.641 * s,x +   21.224 * s,y +   -5.420 * s,x +   24.707 * s,y +   -5.420 * s, threshold);
			_vr.bezier8(x +   24.707 * s,y +   -5.420 * s,x +   30.143 * s,y +   -5.420 * s,x +   34.847 * s,y +   -8.105 * s,x +   38.818 * s,y +  -13.476 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.009 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 39:
			
			o = _posf(16);
			_setf(o + ( 0 << 2), x +   33.789 * s);
			_setf(o + ( 1 << 2), y +  -57.177 * s);
			_setf(o + ( 2 << 2), x +   31.982 * s);
			_setf(o + ( 3 << 2), y +  -43.505 * s);
			_setf(o + ( 4 << 2), x +   28.076 * s);
			_setf(o + ( 5 << 2), y +  -43.505 * s);
			_setf(o + ( 6 << 2), x +   26.318 * s);
			_setf(o + ( 7 << 2), y +  -57.177 * s);
			_setf(o + ( 8 << 2), x +   26.318 * s);
			_setf(o + ( 9 << 2), y +  -68.895 * s);
			_setf(o + (10 << 2), x +   33.789 * s);
			_setf(o + (11 << 2), y +  -68.895 * s);
			_setf(o + (12 << 2), x +   33.789 * s);
			_setf(o + (13 << 2), y +  -57.177 * s);
			_setf(o + (14 << 2), x +   60.009 * s);
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
			
			case 40:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   46.776 * s);
			_setf(o + ( 1 << 2), y +   10.205 * s);
			_setf(o + ( 2 << 2), x +   43.798 * s);
			_setf(o + ( 3 << 2), y +   14.404 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   43.798 * s,y +   14.404 * s,x +   36.539 * s,y +    8.903 * s,x +   31.005 * s,y +    2.506 * s,x +   27.197 * s,y +   -4.785 * s, threshold);
			_vr.bezier8(x +   27.197 * s,y +   -4.785 * s,x +   23.388 * s,y +  -12.077 * s,x +   21.484 * s,y +  -19.775 * s,x +   21.484 * s,y +  -27.880 * s, threshold);
			_vr.bezier8(x +   21.484 * s,y +  -27.880 * s,x +   21.484 * s,y +  -36.051 * s,x +   23.372 * s,y +  -43.757 * s,x +   27.148 * s,y +  -51.000 * s, threshold);
			_vr.bezier8(x +   27.148 * s,y +  -51.000 * s,x +   30.924 * s,y +  -58.243 * s,x +   36.474 * s,y +  -64.615 * s,x +   43.798 * s,y +  -70.116 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   46.776 * s);
			_setf(o + ( 1 << 2), y +  -65.917 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   46.776 * s,y +  -65.917 * s,x +   40.820 * s,y +  -60.578 * s,x +   36.531 * s,y +  -54.988 * s,x +   33.910 * s,y +  -49.145 * s, threshold);
			_vr.bezier8(x +   33.910 * s,y +  -49.145 * s,x +   31.290 * s,y +  -43.302 * s,x +   29.980 * s,y +  -36.246 * s,x +   29.980 * s,y +  -27.978 * s, threshold);
			_vr.bezier8(x +   29.980 * s,y +  -27.978 * s,x +   29.980 * s,y +  -19.417 * s,x +   31.339 * s,y +  -12.215 * s,x +   34.057 * s,y +   -6.372 * s, threshold);
			_vr.bezier8(x +   34.057 * s,y +   -6.372 * s,x +   36.775 * s,y +   -0.529 * s,x +   41.015 * s,y +    4.997 * s,x +   46.776 * s,y +   10.205 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.009 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 41:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   16.211 * s);
			_setf(o + ( 1 << 2), y +  -70.116 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   16.211 * s,y +  -70.116 * s,x +   23.502 * s,y +  -64.615 * s,x +   29.036 * s,y +  -58.243 * s,x +   32.812 * s,y +  -51.000 * s, threshold);
			_vr.bezier8(x +   32.812 * s,y +  -51.000 * s,x +   36.588 * s,y +  -43.757 * s,x +   38.476 * s,y +  -36.051 * s,x +   38.476 * s,y +  -27.880 * s, threshold);
			_vr.bezier8(x +   38.476 * s,y +  -27.880 * s,x +   38.476 * s,y +  -19.775 * s,x +   36.580 * s,y +  -12.077 * s,x +   32.788 * s,y +   -4.785 * s, threshold);
			_vr.bezier8(x +   32.788 * s,y +   -4.785 * s,x +   28.995 * s,y +    2.506 * s,x +   23.470 * s,y +    8.903 * s,x +   16.211 * s,y +   14.404 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   13.183 * s);
			_setf(o + ( 1 << 2), y +   10.205 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   13.183 * s,y +   10.205 * s,x +   19.140 * s,y +    4.932 * s,x +   23.429 * s,y +   -0.675 * s,x +   26.049 * s,y +   -6.616 * s, threshold);
			_vr.bezier8(x +   26.049 * s,y +   -6.616 * s,x +   28.670 * s,y +  -12.557 * s,x +   29.980 * s,y +  -19.677 * s,x +   29.980 * s,y +  -27.978 * s, threshold);
			_vr.bezier8(x +   29.980 * s,y +  -27.978 * s,x +   29.980 * s,y +  -36.539 * s,x +   28.629 * s,y +  -43.701 * s,x +   25.927 * s,y +  -49.462 * s, threshold);
			_vr.bezier8(x +   25.927 * s,y +  -49.462 * s,x +   23.226 * s,y +  -55.224 * s,x +   18.978 * s,y +  -60.709 * s,x +   13.183 * s,y +  -65.917 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   16.211 * s);
			_setf(o + ( 1 << 2), y +  -70.116 * s);
			_setf(o + ( 2 << 2), x +   60.009 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 42:
			
			o = _posf(40);
			_setf(o + ( 0 << 2), x +   47.216 * s);
			_setf(o + ( 1 << 2), y +  -41.894 * s);
			_setf(o + ( 2 << 2), x +   44.286 * s);
			_setf(o + ( 3 << 2), y +  -37.011 * s);
			_setf(o + ( 4 << 2), x +   32.714 * s);
			_setf(o + ( 5 << 2), y +  -44.677 * s);
			_setf(o + ( 6 << 2), x +   32.714 * s);
			_setf(o + ( 7 << 2), y +  -30.712 * s);
			_setf(o + ( 8 << 2), x +   27.294 * s);
			_setf(o + ( 9 << 2), y +  -30.712 * s);
			_setf(o + (10 << 2), x +   27.294 * s);
			_setf(o + (11 << 2), y +  -44.677 * s);
			_setf(o + (12 << 2), x +   15.576 * s);
			_setf(o + (13 << 2), y +  -36.913 * s);
			_setf(o + (14 << 2), x +   12.695 * s);
			_setf(o + (15 << 2), y +  -41.894 * s);
			_setf(o + (16 << 2), x +   25.000 * s);
			_setf(o + (17 << 2), y +  -49.902 * s);
			_setf(o + (18 << 2), x +   12.695 * s);
			_setf(o + (19 << 2), y +  -57.909 * s);
			_setf(o + (20 << 2), x +   15.576 * s);
			_setf(o + (21 << 2), y +  -62.792 * s);
			_setf(o + (22 << 2), x +   27.294 * s);
			_setf(o + (23 << 2), y +  -54.980 * s);
			_setf(o + (24 << 2), x +   27.294 * s);
			_setf(o + (25 << 2), y +  -68.895 * s);
			_setf(o + (26 << 2), x +   32.714 * s);
			_setf(o + (27 << 2), y +  -68.895 * s);
			_setf(o + (28 << 2), x +   32.714 * s);
			_setf(o + (29 << 2), y +  -55.077 * s);
			_setf(o + (30 << 2), x +   44.286 * s);
			_setf(o + (31 << 2), y +  -62.792 * s);
			_setf(o + (32 << 2), x +   47.216 * s);
			_setf(o + (33 << 2), y +  -57.909 * s);
			_setf(o + (34 << 2), x +   35.107 * s);
			_setf(o + (35 << 2), y +  -49.902 * s);
			_setf(o + (36 << 2), x +   47.216 * s);
			_setf(o + (37 << 2), y +  -41.894 * s);
			_setf(o + (38 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   53.075 * s);
			_setf(o + ( 1 << 2), y +  -32.080 * s);
			_setf(o + ( 2 << 2), x +   33.300 * s);
			_setf(o + ( 3 << 2), y +  -32.080 * s);
			_setf(o + ( 4 << 2), x +   33.300 * s);
			_setf(o + ( 5 << 2), y +  -12.109 * s);
			_setf(o + ( 6 << 2), x +   26.904 * s);
			_setf(o + ( 7 << 2), y +  -12.109 * s);
			_setf(o + ( 8 << 2), x +   26.904 * s);
			_setf(o + ( 9 << 2), y +  -32.080 * s);
			_setf(o + (10 << 2), x +    6.884 * s);
			_setf(o + (11 << 2), y +  -32.080 * s);
			_setf(o + (12 << 2), x +    6.884 * s);
			_setf(o + (13 << 2), y +  -38.476 * s);
			_setf(o + (14 << 2), x +   26.904 * s);
			_setf(o + (15 << 2), y +  -38.476 * s);
			_setf(o + (16 << 2), x +   26.904 * s);
			_setf(o + (17 << 2), y +  -58.495 * s);
			_setf(o + (18 << 2), x +   33.300 * s);
			_setf(o + (19 << 2), y +  -58.495 * s);
			_setf(o + (20 << 2), x +   33.300 * s);
			_setf(o + (21 << 2), y +  -38.476 * s);
			_setf(o + (22 << 2), x +   53.075 * s);
			_setf(o + (23 << 2), y +  -38.476 * s);
			_setf(o + (24 << 2), x +   53.075 * s);
			_setf(o + (25 << 2), y +  -32.080 * s);
			_setf(o + (26 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   30.077 * s);
			_setf(o + ( 1 << 2), y +    1.318 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   30.077 * s,y +    1.318 * s,x +   28.384 * s,y +    1.123 * s,x +   26.985 * s,y +    0.423 * s,x +   25.878 * s,y +   -0.781 * s, threshold);
			_vr.bezier8(x +   25.878 * s,y +   -0.781 * s,x +   24.771 * s,y +   -1.986 * s,x +   24.218 * s,y +   -3.353 * s,x +   24.218 * s,y +   -4.883 * s, threshold);
			_vr.bezier8(x +   24.218 * s,y +   -4.883 * s,x +   24.218 * s,y +   -6.543 * s,x +   24.755 * s,y +   -7.943 * s,x +   25.829 * s,y +   -9.082 * s, threshold);
			_vr.bezier8(x +   25.829 * s,y +   -9.082 * s,x +   26.903 * s,y +  -10.221 * s,x +   28.254 * s,y +  -10.791 * s,x +   29.882 * s,y +  -10.791 * s, threshold);
			_vr.bezier8(x +   29.882 * s,y +  -10.791 * s,x +   31.705 * s,y +  -10.791 * s,x +   33.283 * s,y +  -10.050 * s,x +   34.618 * s,y +   -8.569 * s, threshold);
			_vr.bezier8(x +   34.618 * s,y +   -8.569 * s,x +   35.953 * s,y +   -7.088 * s,x +   36.620 * s,y +   -5.306 * s,x +   36.620 * s,y +   -3.223 * s, threshold);
			_vr.bezier8(x +   36.620 * s,y +   -3.223 * s,x +   36.620 * s,y +    3.158 * s,x +   33.072 * s,y +    8.138 * s,x +   25.976 * s,y +   11.719 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   24.120 * s);
			_setf(o + ( 1 << 2), y +    8.203 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   24.120 * s,y +    8.203 * s,x +   28.092 * s,y +    6.250 * s,x +   30.077 * s,y +    3.955 * s,x +   30.077 * s,y +    1.318 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.008 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 45:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   43.994 * s);
			_setf(o + ( 1 << 2), y +  -23.779 * s);
			_setf(o + ( 2 << 2), x +   14.990 * s);
			_setf(o + ( 3 << 2), y +  -23.779 * s);
			_setf(o + ( 4 << 2), x +   14.990 * s);
			_setf(o + ( 5 << 2), y +  -31.201 * s);
			_setf(o + ( 6 << 2), x +   43.994 * s);
			_setf(o + ( 7 << 2), y +  -31.201 * s);
			_setf(o + ( 8 << 2), x +   43.994 * s);
			_setf(o + ( 9 << 2), y +  -23.779 * s);
			_setf(o + (10 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   29.687 * s);
			_setf(o + ( 1 << 2), y +  -11.181 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   29.687 * s,y +  -11.181 * s,x +   31.412 * s,y +  -11.181 * s,x +   32.861 * s,y +  -10.596 * s,x +   34.033 * s,y +   -9.424 * s, threshold);
			_vr.bezier8(x +   34.033 * s,y +   -9.424 * s,x +   35.205 * s,y +   -8.252 * s,x +   35.791 * s,y +   -6.803 * s,x +   35.791 * s,y +   -5.078 * s, threshold);
			_vr.bezier8(x +   35.791 * s,y +   -5.078 * s,x +   35.791 * s,y +   -3.320 * s,x +   35.197 * s,y +   -1.815 * s,x +   34.008 * s,y +   -0.562 * s, threshold);
			_vr.bezier8(x +   34.008 * s,y +   -0.562 * s,x +   32.820 * s,y +    0.692 * s,x +   31.380 * s,y +    1.318 * s,x +   29.687 * s,y +    1.318 * s, threshold);
			_vr.bezier8(x +   29.687 * s,y +    1.318 * s,x +   28.027 * s,y +    1.318 * s,x +   26.611 * s,y +    0.692 * s,x +   25.439 * s,y +   -0.562 * s, threshold);
			_vr.bezier8(x +   25.439 * s,y +   -0.562 * s,x +   24.267 * s,y +   -1.815 * s,x +   23.681 * s,y +   -3.320 * s,x +   23.681 * s,y +   -5.078 * s, threshold);
			_vr.bezier8(x +   23.681 * s,y +   -5.078 * s,x +   23.681 * s,y +   -6.836 * s,x +   24.259 * s,y +   -8.293 * s,x +   25.415 * s,y +   -9.448 * s, threshold);
			_vr.bezier8(x +   25.415 * s,y +   -9.448 * s,x +   26.570 * s,y +  -10.604 * s,x +   27.995 * s,y +  -11.181 * s,x +   29.687 * s,y +  -11.181 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.009 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 47:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   47.607 * s);
			_setf(o + ( 1 << 2), y +  -70.214 * s);
			_setf(o + ( 2 << 2), x +   17.676 * s);
			_setf(o + ( 3 << 2), y +    1.318 * s);
			_setf(o + ( 4 << 2), x +   10.498 * s);
			_setf(o + ( 5 << 2), y +    1.318 * s);
			_setf(o + ( 6 << 2), x +   40.283 * s);
			_setf(o + ( 7 << 2), y +  -70.214 * s);
			_setf(o + ( 8 << 2), x +   47.607 * s);
			_setf(o + ( 9 << 2), y +  -70.214 * s);
			_setf(o + (10 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   29.882 * s);
			_setf(o + ( 1 << 2), y +  -70.214 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   29.882 * s,y +  -70.214 * s,x +   37.174 * s,y +  -70.214 * s,x +   42.781 * s,y +  -67.081 * s,x +   46.703 * s,y +  -60.814 * s, threshold);
			_vr.bezier8(x +   46.703 * s,y +  -60.814 * s,x +   50.626 * s,y +  -54.548 * s,x +   52.587 * s,y +  -45.752 * s,x +   52.587 * s,y +  -34.423 * s, threshold);
			_vr.bezier8(x +   52.587 * s,y +  -34.423 * s,x +   52.587 * s,y +  -23.454 * s,x +   50.683 * s,y +  -14.754 * s,x +   46.874 * s,y +   -8.325 * s, threshold);
			_vr.bezier8(x +   46.874 * s,y +   -8.325 * s,x +   43.066 * s,y +   -1.896 * s,x +   37.402 * s,y +    1.318 * s,x +   29.882 * s,y +    1.318 * s, threshold);
			_vr.bezier8(x +   29.882 * s,y +    1.318 * s,x +   22.623 * s,y +    1.318 * s,x +   17.024 * s,y +   -1.807 * s,x +   13.086 * s,y +   -8.057 * s, threshold);
			_vr.bezier8(x +   13.086 * s,y +   -8.057 * s,x +    9.147 * s,y +  -14.306 * s,x +    7.177 * s,y +  -23.095 * s,x +    7.177 * s,y +  -34.423 * s, threshold);
			_vr.bezier8(x +    7.177 * s,y +  -34.423 * s,x +    7.177 * s,y +  -45.426 * s,x +    9.090 * s,y +  -54.141 * s,x +   12.915 * s,y +  -60.570 * s, threshold);
			_vr.bezier8(x +   12.915 * s,y +  -60.570 * s,x +   16.739 * s,y +  -66.999 * s,x +   22.395 * s,y +  -70.214 * s,x +   29.882 * s,y +  -70.214 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   29.882 * s);
			_setf(o + ( 1 << 2), y +   -5.713 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   29.882 * s,y +   -5.713 * s,x +   34.700 * s,y +   -5.713 * s,x +   38.272 * s,y +   -8.000 * s,x +   40.600 * s,y +  -12.573 * s, threshold);
			_vr.bezier8(x +   40.600 * s,y +  -12.573 * s,x +   42.927 * s,y +  -17.147 * s,x +   44.091 * s,y +  -24.430 * s,x +   44.091 * s,y +  -34.423 * s, threshold);
			_vr.bezier8(x +   44.091 * s,y +  -34.423 * s,x +   44.091 * s,y +  -44.449 * s,x +   42.927 * s,y +  -51.733 * s,x +   40.600 * s,y +  -56.274 * s, threshold);
			_vr.bezier8(x +   40.600 * s,y +  -56.274 * s,x +   38.272 * s,y +  -60.814 * s,x +   34.700 * s,y +  -63.085 * s,x +   29.882 * s,y +  -63.085 * s, threshold);
			_vr.bezier8(x +   29.882 * s,y +  -63.085 * s,x +   25.130 * s,y +  -63.085 * s,x +   21.582 * s,y +  -60.758 * s,x +   19.238 * s,y +  -56.103 * s, threshold);
			_vr.bezier8(x +   19.238 * s,y +  -56.103 * s,x +   16.894 * s,y +  -51.448 * s,x +   15.722 * s,y +  -44.221 * s,x +   15.722 * s,y +  -34.423 * s, threshold);
			_vr.bezier8(x +   15.722 * s,y +  -34.423 * s,x +   15.722 * s,y +  -24.495 * s,x +   16.886 * s,y +  -17.228 * s,x +   19.213 * s,y +  -12.622 * s, threshold);
			_vr.bezier8(x +   19.213 * s,y +  -12.622 * s,x +   21.541 * s,y +   -8.016 * s,x +   25.097 * s,y +   -5.713 * s,x +   29.882 * s,y +   -5.713 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   29.687 * s);
			_setf(o + ( 1 << 2), y +  -41.747 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   29.687 * s,y +  -41.747 * s,x +   31.738 * s,y +  -41.747 * s,x +   33.471 * s,y +  -41.039 * s,x +   34.887 * s,y +  -39.623 * s, threshold);
			_vr.bezier8(x +   34.887 * s,y +  -39.623 * s,x +   36.303 * s,y +  -38.207 * s,x +   37.011 * s,y +  -36.474 * s,x +   37.011 * s,y +  -34.423 * s, threshold);
			_vr.bezier8(x +   37.011 * s,y +  -34.423 * s,x +   37.011 * s,y +  -32.307 * s,x +   36.295 * s,y +  -30.493 * s,x +   34.863 * s,y +  -28.979 * s, threshold);
			_vr.bezier8(x +   34.863 * s,y +  -28.979 * s,x +   33.430 * s,y +  -27.465 * s,x +   31.705 * s,y +  -26.709 * s,x +   29.687 * s,y +  -26.709 * s, threshold);
			_vr.bezier8(x +   29.687 * s,y +  -26.709 * s,x +   27.701 * s,y +  -26.709 * s,x +   26.000 * s,y +  -27.465 * s,x +   24.584 * s,y +  -28.979 * s, threshold);
			_vr.bezier8(x +   24.584 * s,y +  -28.979 * s,x +   23.168 * s,y +  -30.493 * s,x +   22.460 * s,y +  -32.307 * s,x +   22.460 * s,y +  -34.423 * s, threshold);
			_vr.bezier8(x +   22.460 * s,y +  -34.423 * s,x +   22.460 * s,y +  -36.507 * s,x +   23.152 * s,y +  -38.248 * s,x +   24.536 * s,y +  -39.648 * s, threshold);
			_vr.bezier8(x +   24.536 * s,y +  -39.648 * s,x +   25.919 * s,y +  -41.048 * s,x +   27.636 * s,y +  -41.747 * s,x +   29.687 * s,y +  -41.747 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.009 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 49:
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +   49.706 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   13.476 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   13.476 * s);
			_setf(o + ( 5 << 2), y +   -6.982 * s);
			_setf(o + ( 6 << 2), x +   28.076 * s);
			_setf(o + ( 7 << 2), y +   -6.982 * s);
			_setf(o + ( 8 << 2), x +   28.076 * s);
			_setf(o + ( 9 << 2), y +  -60.497 * s);
			_setf(o + (10 << 2), x +   14.306 * s);
			_setf(o + (11 << 2), y +  -53.612 * s);
			_setf(o + (12 << 2), x +   14.306 * s);
			_setf(o + (13 << 2), y +  -61.620 * s);
			_setf(o + (14 << 2), x +   29.199 * s);
			_setf(o + (15 << 2), y +  -69.286 * s);
			_setf(o + (16 << 2), x +   36.083 * s);
			_setf(o + (17 << 2), y +  -69.286 * s);
			_setf(o + (18 << 2), x +   36.083 * s);
			_setf(o + (19 << 2), y +   -6.982 * s);
			_setf(o + (20 << 2), x +   49.706 * s);
			_setf(o + (21 << 2), y +   -6.982 * s);
			_setf(o + (22 << 2), x +   49.706 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   47.899 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   10.010 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   10.010 * s);
			_setf(o + ( 5 << 2), y +   -5.810 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   10.010 * s,y +   -5.810 * s,x +   19.612 * s,y +  -16.520 * s,x +   25.846 * s,y +  -23.698 * s,x +   28.711 * s,y +  -27.343 * s, threshold);
			_vr.bezier8(x +   28.711 * s,y +  -27.343 * s,x +   31.575 * s,y +  -30.989 * s,x +   33.902 * s,y +  -34.814 * s,x +   35.693 * s,y +  -38.818 * s, threshold);
			_vr.bezier8(x +   35.693 * s,y +  -38.818 * s,x +   37.483 * s,y +  -42.822 * s,x +   38.378 * s,y +  -46.809 * s,x +   38.378 * s,y +  -50.780 * s, threshold);
			_vr.bezier8(x +   38.378 * s,y +  -50.780 * s,x +   38.378 * s,y +  -54.621 * s,x +   37.214 * s,y +  -57.649 * s,x +   34.887 * s,y +  -59.862 * s, threshold);
			_vr.bezier8(x +   34.887 * s,y +  -59.862 * s,x +   32.560 * s,y +  -62.076 * s,x +   29.296 * s,y +  -63.183 * s,x +   25.097 * s,y +  -63.183 * s, threshold);
			_vr.bezier8(x +   25.097 * s,y +  -63.183 * s,x +   21.875 * s,y +  -63.183 * s,x +   17.545 * s,y +  -62.190 * s,x +   12.109 * s,y +  -60.204 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   10.986 * s);
			_setf(o + ( 1 << 2), y +  -67.089 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   10.986 * s,y +  -67.089 * s,x +   15.902 * s,y +  -69.172 * s,x +   21.045 * s,y +  -70.214 * s,x +   26.416 * s,y +  -70.214 * s, threshold);
			_vr.bezier8(x +   26.416 * s,y +  -70.214 * s,x +   32.568 * s,y +  -70.214 * s,x +   37.524 * s,y +  -68.480 * s,x +   41.283 * s,y +  -65.014 * s, threshold);
			_vr.bezier8(x +   41.283 * s,y +  -65.014 * s,x +   45.043 * s,y +  -61.547 * s,x +   46.923 * s,y +  -56.916 * s,x +   46.923 * s,y +  -51.122 * s, threshold);
			_vr.bezier8(x +   46.923 * s,y +  -51.122 * s,x +   46.923 * s,y +  -46.988 * s,x +   45.955 * s,y +  -42.887 * s,x +   44.018 * s,y +  -38.818 * s, threshold);
			_vr.bezier8(x +   44.018 * s,y +  -38.818 * s,x +   42.081 * s,y +  -34.749 * s,x +   39.599 * s,y +  -30.843 * s,x +   36.572 * s,y +  -27.099 * s, threshold);
			_vr.bezier8(x +   36.572 * s,y +  -27.099 * s,x +   33.544 * s,y +  -23.356 * s,x +   27.653 * s,y +  -16.650 * s,x +   18.896 * s,y +   -6.982 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   47.899 * s);
			_setf(o + ( 1 << 2), y +   -6.982 * s);
			_setf(o + ( 2 << 2), x +   47.899 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   60.009 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 51:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   34.276 * s);
			_setf(o + ( 1 << 2), y +  -37.011 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   34.276 * s,y +  -37.011 * s,x +   38.476 * s,y +  -35.839 * s,x +   41.845 * s,y +  -33.699 * s,x +   44.384 * s,y +  -30.590 * s, threshold);
			_vr.bezier8(x +   44.384 * s,y +  -30.590 * s,x +   46.923 * s,y +  -27.482 * s,x +   48.192 * s,y +  -23.991 * s,x +   48.192 * s,y +  -20.117 * s, threshold);
			_vr.bezier8(x +   48.192 * s,y +  -20.117 * s,x +   48.192 * s,y +  -14.062 * s,x +   45.832 * s,y +   -8.976 * s,x +   41.112 * s,y +   -4.858 * s, threshold);
			_vr.bezier8(x +   41.112 * s,y +   -4.858 * s,x +   36.392 * s,y +   -0.741 * s,x +   30.826 * s,y +    1.318 * s,x +   24.413 * s,y +    1.318 * s, threshold);
			_vr.bezier8(x +   24.413 * s,y +    1.318 * s,x +   18.945 * s,y +    1.318 * s,x +   14.046 * s,y +    0.114 * s,x +    9.716 * s,y +   -2.295 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   11.279 * s);
			_setf(o + ( 1 << 2), y +   -8.887 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   11.279 * s,y +   -8.887 * s,x +   15.803 * s,y +   -6.771 * s,x +   20.279 * s,y +   -5.713 * s,x +   24.706 * s,y +   -5.713 * s, threshold);
			_vr.bezier8(x +   24.706 * s,y +   -5.713 * s,x +   28.873 * s,y +   -5.713 * s,x +   32.429 * s,y +   -7.007 * s,x +   35.375 * s,y +   -9.595 * s, threshold);
			_vr.bezier8(x +   35.375 * s,y +   -9.595 * s,x +   38.321 * s,y +  -12.182 * s,x +   39.794 * s,y +  -15.511 * s,x +   39.794 * s,y +  -19.580 * s, threshold);
			_vr.bezier8(x +   39.794 * s,y +  -19.580 * s,x +   39.794 * s,y +  -23.584 * s,x +   38.215 * s,y +  -26.839 * s,x +   35.058 * s,y +  -29.345 * s, threshold);
			_vr.bezier8(x +   35.058 * s,y +  -29.345 * s,x +   31.900 * s,y +  -31.852 * s,x +   27.717 * s,y +  -33.105 * s,x +   22.509 * s,y +  -33.105 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   20.410 * s);
			_setf(o + ( 1 << 2), y +  -33.105 * s);
			_setf(o + ( 2 << 2), x +   20.410 * s);
			_setf(o + ( 3 << 2), y +  -39.697 * s);
			_setf(o + ( 4 << 2), x +   20.995 * s);
			_setf(o + ( 5 << 2), y +  -39.697 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   20.995 * s,y +  -39.697 * s,x +   26.008 * s,y +  -39.697 * s,x +   30.142 * s,y +  -40.877 * s,x +   33.398 * s,y +  -43.237 * s, threshold);
			_vr.bezier8(x +   33.398 * s,y +  -43.237 * s,x +   36.653 * s,y +  -45.597 * s,x +   38.280 * s,y +  -48.778 * s,x +   38.280 * s,y +  -52.782 * s, threshold);
			_vr.bezier8(x +   38.280 * s,y +  -52.782 * s,x +   38.280 * s,y +  -56.037 * s,x +   37.108 * s,y +  -58.585 * s,x +   34.765 * s,y +  -60.424 * s, threshold);
			_vr.bezier8(x +   34.765 * s,y +  -60.424 * s,x +   32.421 * s,y +  -62.263 * s,x +   29.198 * s,y +  -63.183 * s,x +   25.097 * s,y +  -63.183 * s, threshold);
			_vr.bezier8(x +   25.097 * s,y +  -63.183 * s,x +   21.549 * s,y +  -63.183 * s,x +   17.578 * s,y +  -62.222 * s,x +   13.183 * s,y +  -60.302 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   12.109 * s);
			_setf(o + ( 1 << 2), y +  -67.186 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   12.109 * s,y +  -67.186 * s,x +   16.536 * s,y +  -69.205 * s,x +   20.995 * s,y +  -70.214 * s,x +   25.488 * s,y +  -70.214 * s, threshold);
			_vr.bezier8(x +   25.488 * s,y +  -70.214 * s,x +   31.640 * s,y +  -70.214 * s,x +   36.710 * s,y +  -68.594 * s,x +   40.697 * s,y +  -65.355 * s, threshold);
			_vr.bezier8(x +   40.697 * s,y +  -65.355 * s,x +   44.685 * s,y +  -62.117 * s,x +   46.679 * s,y +  -57.958 * s,x +   46.679 * s,y +  -52.880 * s, threshold);
			_vr.bezier8(x +   46.679 * s,y +  -52.880 * s,x +   46.679 * s,y +  -49.364 * s,x +   45.466 * s,y +  -46.085 * s,x +   43.041 * s,y +  -43.041 * s, threshold);
			_vr.bezier8(x +   43.041 * s,y +  -43.041 * s,x +   40.616 * s,y +  -39.998 * s,x +   37.694 * s,y +  -38.085 * s,x +   34.276 * s,y +  -37.304 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   34.276 * s);
			_setf(o + ( 1 << 2), y +  -37.011 * s);
			_setf(o + ( 2 << 2), x +   60.009 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 52:
			
			o = _posf(34);
			_setf(o + ( 0 << 2), x +   52.391 * s);
			_setf(o + ( 1 << 2), y +  -15.918 * s);
			_setf(o + ( 2 << 2), x +   43.895 * s);
			_setf(o + ( 3 << 2), y +  -15.918 * s);
			_setf(o + ( 4 << 2), x +   43.895 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   35.888 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   35.888 * s);
			_setf(o + ( 9 << 2), y +  -15.918 * s);
			_setf(o + (10 << 2), x +    5.908 * s);
			_setf(o + (11 << 2), y +  -15.918 * s);
			_setf(o + (12 << 2), x +    5.908 * s);
			_setf(o + (13 << 2), y +  -22.021 * s);
			_setf(o + (14 << 2), x +   33.104 * s);
			_setf(o + (15 << 2), y +  -68.895 * s);
			_setf(o + (16 << 2), x +   43.895 * s);
			_setf(o + (17 << 2), y +  -68.895 * s);
			_setf(o + (18 << 2), x +   43.895 * s);
			_setf(o + (19 << 2), y +  -22.900 * s);
			_setf(o + (20 << 2), x +   52.391 * s);
			_setf(o + (21 << 2), y +  -22.900 * s);
			_setf(o + (22 << 2), x +   52.391 * s);
			_setf(o + (23 << 2), y +  -15.918 * s);
			_setf(o + (24 << 2), x +   35.888 * s);
			_setf(o + (25 << 2), y +  -22.900 * s);
			_setf(o + (26 << 2), x +   35.888 * s);
			_setf(o + (27 << 2), y +  -60.985 * s);
			_setf(o + (28 << 2), x +   14.013 * s);
			_setf(o + (29 << 2), y +  -22.900 * s);
			_setf(o + (30 << 2), x +   35.888 * s);
			_setf(o + (31 << 2), y +  -22.900 * s);
			_setf(o + (32 << 2), x +   60.008 * s);
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
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   21.191 * s);
			_setf(o + ( 1 << 2), y +  -41.113 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   21.191 * s,y +  -41.113 * s,x +   23.405 * s,y +  -41.699 * s,x +   25.570 * s,y +  -41.992 * s,x +   27.685 * s,y +  -41.992 * s, threshold);
			_vr.bezier8(x +   27.685 * s,y +  -41.992 * s,x +   34.196 * s,y +  -41.992 * s,x +   39.339 * s,y +  -39.998 * s,x +   43.115 * s,y +  -36.010 * s, threshold);
			_vr.bezier8(x +   43.115 * s,y +  -36.010 * s,x +   46.891 * s,y +  -32.023 * s,x +   48.779 * s,y +  -27.050 * s,x +   48.779 * s,y +  -21.093 * s, threshold);
			_vr.bezier8(x +   48.779 * s,y +  -21.093 * s,x +   48.779 * s,y +  -14.844 * s,x +   46.582 * s,y +   -9.546 * s,x +   42.187 * s,y +   -5.200 * s, threshold);
			_vr.bezier8(x +   42.187 * s,y +   -5.200 * s,x +   37.793 * s,y +   -0.854 * s,x +   32.438 * s,y +    1.318 * s,x +   26.123 * s,y +    1.318 * s, threshold);
			_vr.bezier8(x +   26.123 * s,y +    1.318 * s,x +   20.101 * s,y +    1.318 * s,x +   15.055 * s,y +    0.309 * s,x +   10.986 * s,y +   -1.709 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   12.598 * s);
			_setf(o + ( 1 << 2), y +   -8.496 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   12.598 * s,y +   -8.496 * s,x +   17.025 * s,y +   -6.641 * s,x +   21.598 * s,y +   -5.713 * s,x +   26.318 * s,y +   -5.713 * s, threshold);
			_vr.bezier8(x +   26.318 * s,y +   -5.713 * s,x +   30.518 * s,y +   -5.713 * s,x +   33.911 * s,y +   -7.064 * s,x +   36.499 * s,y +   -9.765 * s, threshold);
			_vr.bezier8(x +   36.499 * s,y +   -9.765 * s,x +   39.087 * s,y +  -12.467 * s,x +   40.381 * s,y +  -16.243 * s,x +   40.381 * s,y +  -21.093 * s, threshold);
			_vr.bezier8(x +   40.381 * s,y +  -21.093 * s,x +   40.381 * s,y +  -25.683 * s,x +   39.160 * s,y +  -29.215 * s,x +   36.719 * s,y +  -31.689 * s, threshold);
			_vr.bezier8(x +   36.719 * s,y +  -31.689 * s,x +   34.277 * s,y +  -34.163 * s,x +   31.136 * s,y +  -35.400 * s,x +   27.295 * s,y +  -35.400 * s, threshold);
			_vr.bezier8(x +   27.295 * s,y +  -35.400 * s,x +   24.495 * s,y +  -35.400 * s,x +   21.729 * s,y +  -34.863 * s,x +   18.994 * s,y +  -33.789 * s, threshold);
			o = _posf(14);
			_setf(o + ( 0 << 2), x +   14.209 * s);
			_setf(o + ( 1 << 2), y +  -35.986 * s);
			_setf(o + ( 2 << 2), x +   14.209 * s);
			_setf(o + ( 3 << 2), y +  -68.895 * s);
			_setf(o + ( 4 << 2), x +   45.703 * s);
			_setf(o + ( 5 << 2), y +  -68.895 * s);
			_setf(o + ( 6 << 2), x +   45.703 * s);
			_setf(o + ( 7 << 2), y +  -61.913 * s);
			_setf(o + ( 8 << 2), x +   21.191 * s);
			_setf(o + ( 9 << 2), y +  -61.913 * s);
			_setf(o + (10 << 2), x +   21.191 * s);
			_setf(o + (11 << 2), y +  -41.113 * s);
			_setf(o + (12 << 2), x +   60.009 * s);
			_setf(o + (13 << 2), y +       0. * s);
			o = _posb(7);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 1);
			
			case 54:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   17.676 * s);
			_setf(o + ( 1 << 2), y +  -35.888 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   17.676 * s,y +  -35.888 * s,x +   21.972 * s,y +  -39.371 * s,x +   26.644 * s,y +  -41.113 * s,x +   31.689 * s,y +  -41.113 * s, threshold);
			_vr.bezier8(x +   31.689 * s,y +  -41.113 * s,x +   37.516 * s,y +  -41.113 * s,x +   42.374 * s,y +  -39.249 * s,x +   46.264 * s,y +  -35.522 * s, threshold);
			_vr.bezier8(x +   46.264 * s,y +  -35.522 * s,x +   50.154 * s,y +  -31.795 * s,x +   52.099 * s,y +  -26.985 * s,x +   52.099 * s,y +  -21.093 * s, threshold);
			_vr.bezier8(x +   52.099 * s,y +  -21.093 * s,x +   52.099 * s,y +  -14.616 * s,x +   50.374 * s,y +   -9.261 * s,x +   46.923 * s,y +   -5.029 * s, threshold);
			_vr.bezier8(x +   46.923 * s,y +   -5.029 * s,x +   43.473 * s,y +   -0.798 * s,x +   38.867 * s,y +    1.318 * s,x +   33.105 * s,y +    1.318 * s, threshold);
			_vr.bezier8(x +   33.105 * s,y +    1.318 * s,x +   25.748 * s,y +    1.318 * s,x +   19.922 * s,y +   -2.059 * s,x +   15.625 * s,y +   -8.813 * s, threshold);
			_vr.bezier8(x +   15.625 * s,y +   -8.813 * s,x +   11.328 * s,y +  -15.568 * s,x +    9.180 * s,y +  -23.827 * s,x +    9.180 * s,y +  -33.593 * s, threshold);
			_vr.bezier8(x +    9.180 * s,y +  -33.593 * s,x +    9.180 * s,y +  -44.010 * s,x +   11.418 * s,y +  -52.717 * s,x +   15.893 * s,y +  -59.716 * s, threshold);
			_vr.bezier8(x +   15.893 * s,y +  -59.716 * s,x +   20.369 * s,y +  -66.714 * s,x +   26.497 * s,y +  -70.214 * s,x +   34.277 * s,y +  -70.214 * s, threshold);
			_vr.bezier8(x +   34.277 * s,y +  -70.214 * s,x +   39.648 * s,y +  -70.214 * s,x +   44.287 * s,y +  -69.416 * s,x +   48.193 * s,y +  -67.821 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   46.923 * s);
			_setf(o + ( 1 << 2), y +  -60.692 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   46.923 * s,y +  -60.692 * s,x +   42.399 * s,y +  -62.353 * s,x +   38.265 * s,y +  -63.183 * s,x +   34.521 * s,y +  -63.183 * s, threshold);
			_vr.bezier8(x +   34.521 * s,y +  -63.183 * s,x +   29.215 * s,y +  -63.183 * s,x +   25.081 * s,y +  -60.644 * s,x +   22.119 * s,y +  -55.566 * s, threshold);
			_vr.bezier8(x +   22.119 * s,y +  -55.566 * s,x +   19.157 * s,y +  -50.488 * s,x +   17.676 * s,y +  -43.928 * s,x +   17.676 * s,y +  -35.888 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   17.920 * s);
			_setf(o + ( 1 << 2), y +  -29.003 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   17.920 * s,y +  -29.003 * s,x +   17.920 * s,y +  -23.112 * s,x +   19.303 * s,y +  -17.757 * s,x +   22.070 * s,y +  -12.939 * s, threshold);
			_vr.bezier8(x +   22.070 * s,y +  -12.939 * s,x +   24.837 * s,y +   -8.122 * s,x +   28.320 * s,y +   -5.713 * s,x +   32.519 * s,y +   -5.713 * s, threshold);
			_vr.bezier8(x +   32.519 * s,y +   -5.713 * s,x +   36.067 * s,y +   -5.713 * s,x +   38.802 * s,y +   -7.015 * s,x +   40.722 * s,y +   -9.619 * s, threshold);
			_vr.bezier8(x +   40.722 * s,y +   -9.619 * s,x +   42.643 * s,y +  -12.223 * s,x +   43.603 * s,y +  -15.820 * s,x +   43.603 * s,y +  -20.410 * s, threshold);
			_vr.bezier8(x +   43.603 * s,y +  -20.410 * s,x +   43.603 * s,y +  -24.641 * s,x +   42.545 * s,y +  -27.978 * s,x +   40.429 * s,y +  -30.419 * s, threshold);
			_vr.bezier8(x +   40.429 * s,y +  -30.419 * s,x +   38.313 * s,y +  -32.861 * s,x +   35.335 * s,y +  -34.081 * s,x +   31.494 * s,y +  -34.081 * s, threshold);
			_vr.bezier8(x +   31.494 * s,y +  -34.081 * s,x +   26.513 * s,y +  -34.081 * s,x +   21.989 * s,y +  -32.389 * s,x +   17.920 * s,y +  -29.003 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.009 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 55:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +   50.585 * s);
			_setf(o + ( 1 << 2), y +  -63.183 * s);
			_setf(o + ( 2 << 2), x +   23.291 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   15.088 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   41.992 * s);
			_setf(o + ( 7 << 2), y +  -61.913 * s);
			_setf(o + ( 8 << 2), x +    9.717 * s);
			_setf(o + ( 9 << 2), y +  -61.913 * s);
			_setf(o + (10 << 2), x +    9.717 * s);
			_setf(o + (11 << 2), y +  -68.895 * s);
			_setf(o + (12 << 2), x +   50.585 * s);
			_setf(o + (13 << 2), y +  -68.895 * s);
			_setf(o + (14 << 2), x +   50.585 * s);
			_setf(o + (15 << 2), y +  -63.183 * s);
			_setf(o + (16 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   36.913 * s);
			_setf(o + ( 1 << 2), y +  -37.792 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   36.913 * s,y +  -37.792 * s,x +   41.601 * s,y +  -36.425 * s,x +   45.238 * s,y +  -34.098 * s,x +   47.826 * s,y +  -30.810 * s, threshold);
			_vr.bezier8(x +   47.826 * s,y +  -30.810 * s,x +   50.414 * s,y +  -27.522 * s,x +   51.708 * s,y +  -23.681 * s,x +   51.708 * s,y +  -19.287 * s, threshold);
			_vr.bezier8(x +   51.708 * s,y +  -19.287 * s,x +   51.708 * s,y +  -12.972 * s,x +   49.617 * s,y +   -7.959 * s,x +   45.434 * s,y +   -4.248 * s, threshold);
			_vr.bezier8(x +   45.434 * s,y +   -4.248 * s,x +   41.251 * s,y +   -0.537 * s,x +   36.100 * s,y +    1.318 * s,x +   29.980 * s,y +    1.318 * s, threshold);
			_vr.bezier8(x +   29.980 * s,y +    1.318 * s,x +   23.567 * s,y +    1.318 * s,x +   18.302 * s,y +   -0.553 * s,x +   14.184 * s,y +   -4.297 * s, threshold);
			_vr.bezier8(x +   14.184 * s,y +   -4.297 * s,x +   10.066 * s,y +   -8.040 * s,x +    8.008 * s,y +  -13.004 * s,x +    8.008 * s,y +  -19.189 * s, threshold);
			_vr.bezier8(x +    8.008 * s,y +  -19.189 * s,x +    8.008 * s,y +  -23.551 * s,x +    9.342 * s,y +  -27.392 * s,x +   12.011 * s,y +  -30.712 * s, threshold);
			_vr.bezier8(x +   12.011 * s,y +  -30.712 * s,x +   14.681 * s,y +  -34.033 * s,x +   18.408 * s,y +  -36.393 * s,x +   23.193 * s,y +  -37.792 * s, threshold);
			_vr.bezier8(x +   23.193 * s,y +  -37.792 * s,x +   19.384 * s,y +  -38.769 * s,x +   16.333 * s,y +  -40.649 * s,x +   14.038 * s,y +  -43.432 * s, threshold);
			_vr.bezier8(x +   14.038 * s,y +  -43.432 * s,x +   11.743 * s,y +  -46.215 * s,x +   10.595 * s,y +  -49.332 * s,x +   10.595 * s,y +  -52.782 * s, threshold);
			_vr.bezier8(x +   10.595 * s,y +  -52.782 * s,x +   10.595 * s,y +  -57.209 * s,x +   12.353 * s,y +  -61.221 * s,x +   15.869 * s,y +  -64.818 * s, threshold);
			_vr.bezier8(x +   15.869 * s,y +  -64.818 * s,x +   19.384 * s,y +  -68.415 * s,x +   24.023 * s,y +  -70.214 * s,x +   29.785 * s,y +  -70.214 * s, threshold);
			_vr.bezier8(x +   29.785 * s,y +  -70.214 * s,x +   35.481 * s,y +  -70.214 * s,x +   40.193 * s,y +  -68.423 * s,x +   43.920 * s,y +  -64.843 * s, threshold);
			_vr.bezier8(x +   43.920 * s,y +  -64.843 * s,x +   47.647 * s,y +  -61.262 * s,x +   49.511 * s,y +  -57.242 * s,x +   49.511 * s,y +  -52.782 * s, threshold);
			_vr.bezier8(x +   49.511 * s,y +  -52.782 * s,x +   49.511 * s,y +  -49.430 * s,x +   48.339 * s,y +  -46.345 * s,x +   45.995 * s,y +  -43.530 * s, threshold);
			_vr.bezier8(x +   45.995 * s,y +  -43.530 * s,x +   43.652 * s,y +  -40.714 * s,x +   40.624 * s,y +  -38.801 * s,x +   36.913 * s,y +  -37.792 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   29.785 * s);
			_setf(o + ( 1 << 2), y +  -41.113 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   29.785 * s,y +  -41.113 * s,x +   29.947 * s,y +  -41.113 * s,x +   30.729 * s,y +  -41.308 * s,x +   32.128 * s,y +  -41.699 * s, threshold);
			_vr.bezier8(x +   32.128 * s,y +  -41.699 * s,x +   33.528 * s,y +  -42.089 * s,x +   34.724 * s,y +  -42.569 * s,x +   35.717 * s,y +  -43.139 * s, threshold);
			_vr.bezier8(x +   35.717 * s,y +  -43.139 * s,x +   36.710 * s,y +  -43.709 * s,x +   37.629 * s,y +  -44.433 * s,x +   38.476 * s,y +  -45.312 * s, threshold);
			_vr.bezier8(x +   38.476 * s,y +  -45.312 * s,x +   39.322 * s,y +  -46.191 * s,x +   40.006 * s,y +  -47.224 * s,x +   40.527 * s,y +  -48.412 * s, threshold);
			_vr.bezier8(x +   40.527 * s,y +  -48.412 * s,x +   41.047 * s,y +  -49.600 * s,x +   41.308 * s,y +  -50.927 * s,x +   41.308 * s,y +  -52.392 * s, threshold);
			_vr.bezier8(x +   41.308 * s,y +  -52.392 * s,x +   41.308 * s,y +  -55.517 * s,x +   40.185 * s,y +  -58.113 * s,x +   37.939 * s,y +  -60.180 * s, threshold);
			_vr.bezier8(x +   37.939 * s,y +  -60.180 * s,x +   35.693 * s,y +  -62.247 * s,x +   32.975 * s,y +  -63.280 * s,x +   29.785 * s,y +  -63.280 * s, threshold);
			_vr.bezier8(x +   29.785 * s,y +  -63.280 * s,x +   26.692 * s,y +  -63.280 * s,x +   24.039 * s,y +  -62.222 * s,x +   21.826 * s,y +  -60.106 * s, threshold);
			_vr.bezier8(x +   21.826 * s,y +  -60.106 * s,x +   19.612 * s,y +  -57.991 * s,x +   18.505 * s,y +  -55.419 * s,x +   18.505 * s,y +  -52.392 * s, threshold);
			_vr.bezier8(x +   18.505 * s,y +  -52.392 * s,x +   18.505 * s,y +  -50.471 * s,x +   18.904 * s,y +  -48.795 * s,x +   19.702 * s,y +  -47.363 * s, threshold);
			_vr.bezier8(x +   19.702 * s,y +  -47.363 * s,x +   20.499 * s,y +  -45.930 * s,x +   21.492 * s,y +  -44.775 * s,x +   22.680 * s,y +  -43.896 * s, threshold);
			_vr.bezier8(x +   22.680 * s,y +  -43.896 * s,x +   23.868 * s,y +  -43.017 * s,x +   25.235 * s,y +  -42.333 * s,x +   26.782 * s,y +  -41.845 * s, threshold);
			_vr.bezier8(x +   26.782 * s,y +  -41.845 * s,x +   28.328 * s,y +  -41.357 * s,x +   29.329 * s,y +  -41.113 * s,x +   29.785 * s,y +  -41.113 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   29.785 * s);
			_setf(o + ( 1 << 2), y +  -34.277 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   29.785 * s,y +  -34.277 * s,x +   20.865 * s,y +  -31.673 * s,x +   16.406 * s,y +  -26.774 * s,x +   16.406 * s,y +  -19.580 * s, threshold);
			_vr.bezier8(x +   16.406 * s,y +  -19.580 * s,x +   16.406 * s,y +  -15.381 * s,x +   17.757 * s,y +  -12.020 * s,x +   20.459 * s,y +   -9.497 * s, threshold);
			_vr.bezier8(x +   20.459 * s,y +   -9.497 * s,x +   23.160 * s,y +   -6.974 * s,x +   26.334 * s,y +   -5.713 * s,x +   29.980 * s,y +   -5.713 * s, threshold);
			_vr.bezier8(x +   29.980 * s,y +   -5.713 * s,x +   33.756 * s,y +   -5.713 * s,x +   36.938 * s,y +   -6.958 * s,x +   39.526 * s,y +   -9.448 * s, threshold);
			_vr.bezier8(x +   39.526 * s,y +   -9.448 * s,x +   42.113 * s,y +  -11.938 * s,x +   43.407 * s,y +  -15.315 * s,x +   43.407 * s,y +  -19.580 * s, threshold);
			_vr.bezier8(x +   43.407 * s,y +  -19.580 * s,x +   43.407 * s,y +  -22.802 * s,x +   42.512 * s,y +  -25.691 * s,x +   40.722 * s,y +  -28.247 * s, threshold);
			_vr.bezier8(x +   40.722 * s,y +  -28.247 * s,x +   38.932 * s,y +  -30.802 * s,x +   35.286 * s,y +  -32.812 * s,x +   29.785 * s,y +  -34.277 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.009 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 57:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   43.115 * s);
			_setf(o + ( 1 << 2), y +  -33.105 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   43.115 * s,y +  -33.105 * s,x +   39.143 * s,y +  -29.622 * s,x +   34.472 * s,y +  -27.880 * s,x +   29.101 * s,y +  -27.880 * s, threshold);
			_vr.bezier8(x +   29.101 * s,y +  -27.880 * s,x +   23.274 * s,y +  -27.880 * s,x +   18.416 * s,y +  -29.744 * s,x +   14.526 * s,y +  -33.471 * s, threshold);
			_vr.bezier8(x +   14.526 * s,y +  -33.471 * s,x +   10.636 * s,y +  -37.198 * s,x +    8.691 * s,y +  -42.008 * s,x +    8.691 * s,y +  -47.900 * s, threshold);
			_vr.bezier8(x +    8.691 * s,y +  -47.900 * s,x +    8.691 * s,y +  -54.214 * s,x +   10.555 * s,y +  -59.529 * s,x +   14.282 * s,y +  -63.842 * s, threshold);
			_vr.bezier8(x +   14.282 * s,y +  -63.842 * s,x +   18.009 * s,y +  -68.155 * s,x +   22.819 * s,y +  -70.311 * s,x +   28.710 * s,y +  -70.311 * s, threshold);
			_vr.bezier8(x +   28.710 * s,y +  -70.311 * s,x +   35.904 * s,y +  -70.311 * s,x +   41.519 * s,y +  -67.024 * s,x +   45.556 * s,y +  -60.448 * s, threshold);
			_vr.bezier8(x +   45.556 * s,y +  -60.448 * s,x +   49.592 * s,y +  -53.873 * s,x +   51.610 * s,y +  -45.523 * s,x +   51.610 * s,y +  -35.400 * s, threshold);
			_vr.bezier8(x +   51.610 * s,y +  -35.400 * s,x +   51.610 * s,y +  -25.276 * s,x +   49.242 * s,y +  -16.642 * s,x +   44.506 * s,y +   -9.497 * s, threshold);
			_vr.bezier8(x +   44.506 * s,y +   -9.497 * s,x +   39.770 * s,y +   -2.352 * s,x +   33.430 * s,y +    1.221 * s,x +   25.488 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   25.488 * s,y +    1.221 * s,x +   20.150 * s,y +    1.221 * s,x +   15.527 * s,y +    0.407 * s,x +   11.621 * s,y +   -1.221 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   12.890 * s);
			_setf(o + ( 1 << 2), y +   -8.301 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   12.890 * s,y +   -8.301 * s,x +   17.382 * s,y +   -6.641 * s,x +   21.517 * s,y +   -5.810 * s,x +   25.293 * s,y +   -5.810 * s, threshold);
			_vr.bezier8(x +   25.293 * s,y +   -5.810 * s,x +   30.696 * s,y +   -5.810 * s,x +   35.017 * s,y +   -8.431 * s,x +   38.256 * s,y +  -13.672 * s, threshold);
			_vr.bezier8(x +   38.256 * s,y +  -13.672 * s,x +   41.495 * s,y +  -18.912 * s,x +   43.115 * s,y +  -25.390 * s,x +   43.115 * s,y +  -33.105 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   42.919 * s);
			_setf(o + ( 1 << 2), y +  -39.990 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   42.919 * s,y +  -39.990 * s,x +   42.919 * s,y +  -46.174 * s,x +   41.666 * s,y +  -51.602 * s,x +   39.159 * s,y +  -56.274 * s, threshold);
			_vr.bezier8(x +   39.159 * s,y +  -56.274 * s,x +   36.653 * s,y +  -60.945 * s,x +   33.365 * s,y +  -63.280 * s,x +   29.296 * s,y +  -63.280 * s, threshold);
			_vr.bezier8(x +   29.296 * s,y +  -63.280 * s,x +   25.618 * s,y +  -63.280 * s,x +   22.680 * s,y +  -61.921 * s,x +   20.483 * s,y +  -59.203 * s, threshold);
			_vr.bezier8(x +   20.483 * s,y +  -59.203 * s,x +   18.286 * s,y +  -56.485 * s,x +   17.187 * s,y +  -52.945 * s,x +   17.187 * s,y +  -48.583 * s, threshold);
			_vr.bezier8(x +   17.187 * s,y +  -48.583 * s,x +   17.187 * s,y +  -44.579 * s,x +   18.302 * s,y +  -41.300 * s,x +   20.532 * s,y +  -38.745 * s, threshold);
			_vr.bezier8(x +   20.532 * s,y +  -38.745 * s,x +   22.762 * s,y +  -36.189 * s,x +   25.683 * s,y +  -34.912 * s,x +   29.296 * s,y +  -34.912 * s, threshold);
			_vr.bezier8(x +   29.296 * s,y +  -34.912 * s,x +   34.277 * s,y +  -34.912 * s,x +   38.492 * s,y +  -36.584 * s,x +   42.284 * s,y +  -39.501 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   42.919 * s);
			_setf(o + ( 1 << 2), y +  -39.990 * s);
			_setf(o + ( 2 << 2), x +   60.009 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 58:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   29.589 * s);
			_setf(o + ( 1 << 2), y +  -51.611 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   29.589 * s,y +  -51.611 * s,x +   31.249 * s,y +  -51.611 * s,x +   32.649 * s,y +  -51.049 * s,x +   33.788 * s,y +  -49.926 * s, threshold);
			_vr.bezier8(x +   33.788 * s,y +  -49.926 * s,x +   34.928 * s,y +  -48.803 * s,x +   35.497 * s,y +  -47.428 * s,x +   35.497 * s,y +  -45.800 * s, threshold);
			_vr.bezier8(x +   35.497 * s,y +  -45.800 * s,x +   35.497 * s,y +  -44.172 * s,x +   34.928 * s,y +  -42.797 * s,x +   33.788 * s,y +  -41.674 * s, threshold);
			_vr.bezier8(x +   33.788 * s,y +  -41.674 * s,x +   32.649 * s,y +  -40.551 * s,x +   31.249 * s,y +  -39.990 * s,x +   29.589 * s,y +  -39.990 * s, threshold);
			_vr.bezier8(x +   29.589 * s,y +  -39.990 * s,x +   27.962 * s,y +  -39.990 * s,x +   26.586 * s,y +  -40.551 * s,x +   25.463 * s,y +  -41.674 * s, threshold);
			_vr.bezier8(x +   25.463 * s,y +  -41.674 * s,x +   24.341 * s,y +  -42.797 * s,x +   23.779 * s,y +  -44.172 * s,x +   23.779 * s,y +  -45.800 * s, threshold);
			_vr.bezier8(x +   23.779 * s,y +  -45.800 * s,x +   23.779 * s,y +  -47.428 * s,x +   24.341 * s,y +  -48.803 * s,x +   25.463 * s,y +  -49.926 * s, threshold);
			_vr.bezier8(x +   25.463 * s,y +  -49.926 * s,x +   26.586 * s,y +  -51.049 * s,x +   27.962 * s,y +  -51.611 * s,x +   29.589 * s,y +  -51.611 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   29.589 * s);
			_setf(o + ( 1 << 2), y +  -10.791 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   29.589 * s,y +  -10.791 * s,x +   31.249 * s,y +  -10.791 * s,x +   32.649 * s,y +  -10.237 * s,x +   33.788 * s,y +   -9.131 * s, threshold);
			_vr.bezier8(x +   33.788 * s,y +   -9.131 * s,x +   34.928 * s,y +   -8.024 * s,x +   35.497 * s,y +   -6.641 * s,x +   35.497 * s,y +   -4.980 * s, threshold);
			_vr.bezier8(x +   35.497 * s,y +   -4.980 * s,x +   35.497 * s,y +   -3.353 * s,x +   34.928 * s,y +   -1.986 * s,x +   33.788 * s,y +   -0.879 * s, threshold);
			_vr.bezier8(x +   33.788 * s,y +   -0.879 * s,x +   32.649 * s,y +    0.228 * s,x +   31.249 * s,y +    0.781 * s,x +   29.589 * s,y +    0.781 * s, threshold);
			_vr.bezier8(x +   29.589 * s,y +    0.781 * s,x +   27.962 * s,y +    0.781 * s,x +   26.586 * s,y +    0.228 * s,x +   25.463 * s,y +   -0.879 * s, threshold);
			_vr.bezier8(x +   25.463 * s,y +   -0.879 * s,x +   24.341 * s,y +   -1.986 * s,x +   23.779 * s,y +   -3.353 * s,x +   23.779 * s,y +   -4.980 * s, threshold);
			_vr.bezier8(x +   23.779 * s,y +   -4.980 * s,x +   23.779 * s,y +   -6.641 * s,x +   24.341 * s,y +   -8.024 * s,x +   25.463 * s,y +   -9.131 * s, threshold);
			_vr.bezier8(x +   25.463 * s,y +   -9.131 * s,x +   26.586 * s,y +  -10.237 * s,x +   27.962 * s,y +  -10.791 * s,x +   29.589 * s,y +  -10.791 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.009 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 59:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   29.980 * s);
			_setf(o + ( 1 << 2), y +  -51.611 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   29.980 * s,y +  -51.611 * s,x +   31.640 * s,y +  -51.611 * s,x +   33.040 * s,y +  -51.049 * s,x +   34.179 * s,y +  -49.926 * s, threshold);
			_vr.bezier8(x +   34.179 * s,y +  -49.926 * s,x +   35.318 * s,y +  -48.803 * s,x +   35.888 * s,y +  -47.428 * s,x +   35.888 * s,y +  -45.800 * s, threshold);
			_vr.bezier8(x +   35.888 * s,y +  -45.800 * s,x +   35.888 * s,y +  -44.140 * s,x +   35.318 * s,y +  -42.757 * s,x +   34.179 * s,y +  -41.650 * s, threshold);
			_vr.bezier8(x +   34.179 * s,y +  -41.650 * s,x +   33.040 * s,y +  -40.543 * s,x +   31.640 * s,y +  -39.990 * s,x +   29.980 * s,y +  -39.990 * s, threshold);
			_vr.bezier8(x +   29.980 * s,y +  -39.990 * s,x +   28.352 * s,y +  -39.990 * s,x +   26.985 * s,y +  -40.551 * s,x +   25.878 * s,y +  -41.674 * s, threshold);
			_vr.bezier8(x +   25.878 * s,y +  -41.674 * s,x +   24.771 * s,y +  -42.797 * s,x +   24.218 * s,y +  -44.172 * s,x +   24.218 * s,y +  -45.800 * s, threshold);
			_vr.bezier8(x +   24.218 * s,y +  -45.800 * s,x +   24.218 * s,y +  -47.428 * s,x +   24.771 * s,y +  -48.803 * s,x +   25.878 * s,y +  -49.926 * s, threshold);
			_vr.bezier8(x +   25.878 * s,y +  -49.926 * s,x +   26.985 * s,y +  -51.049 * s,x +   28.352 * s,y +  -51.611 * s,x +   29.980 * s,y +  -51.611 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   30.077 * s);
			_setf(o + ( 1 << 2), y +    1.318 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   30.077 * s,y +    1.318 * s,x +   28.385 * s,y +    1.123 * s,x +   26.985 * s,y +    0.423 * s,x +   25.878 * s,y +   -0.781 * s, threshold);
			_vr.bezier8(x +   25.878 * s,y +   -0.781 * s,x +   24.771 * s,y +   -1.986 * s,x +   24.218 * s,y +   -3.353 * s,x +   24.218 * s,y +   -4.883 * s, threshold);
			_vr.bezier8(x +   24.218 * s,y +   -4.883 * s,x +   24.218 * s,y +   -6.543 * s,x +   24.755 * s,y +   -7.943 * s,x +   25.829 * s,y +   -9.082 * s, threshold);
			_vr.bezier8(x +   25.829 * s,y +   -9.082 * s,x +   26.904 * s,y +  -10.221 * s,x +   28.254 * s,y +  -10.791 * s,x +   29.882 * s,y +  -10.791 * s, threshold);
			_vr.bezier8(x +   29.882 * s,y +  -10.791 * s,x +   31.705 * s,y +  -10.791 * s,x +   33.284 * s,y +  -10.050 * s,x +   34.618 * s,y +   -8.569 * s, threshold);
			_vr.bezier8(x +   34.618 * s,y +   -8.569 * s,x +   35.953 * s,y +   -7.088 * s,x +   36.620 * s,y +   -5.306 * s,x +   36.620 * s,y +   -3.223 * s, threshold);
			_vr.bezier8(x +   36.620 * s,y +   -3.223 * s,x +   36.620 * s,y +    3.158 * s,x +   33.072 * s,y +    8.138 * s,x +   25.976 * s,y +   11.719 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   24.120 * s);
			_setf(o + ( 1 << 2), y +    8.203 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   24.120 * s,y +    8.203 * s,x +   28.092 * s,y +    6.250 * s,x +   30.077 * s,y +    3.955 * s,x +   30.077 * s,y +    1.318 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.009 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 60:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +   47.606 * s);
			_setf(o + ( 1 << 2), y +  -10.498 * s);
			_setf(o + ( 2 << 2), x +   11.083 * s);
			_setf(o + ( 3 << 2), y +  -32.421 * s);
			_setf(o + ( 4 << 2), x +   11.083 * s);
			_setf(o + ( 5 << 2), y +  -38.281 * s);
			_setf(o + ( 6 << 2), x +   47.606 * s);
			_setf(o + ( 7 << 2), y +  -60.009 * s);
			_setf(o + ( 8 << 2), x +   47.606 * s);
			_setf(o + ( 9 << 2), y +  -52.978 * s);
			_setf(o + (10 << 2), x +   18.310 * s);
			_setf(o + (11 << 2), y +  -35.107 * s);
			_setf(o + (12 << 2), x +   47.606 * s);
			_setf(o + (13 << 2), y +  -17.676 * s);
			_setf(o + (14 << 2), x +   47.606 * s);
			_setf(o + (15 << 2), y +  -10.498 * s);
			_setf(o + (16 << 2), x +   60.008 * s);
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
			_setf(o + ( 0 << 2), x +   53.076 * s);
			_setf(o + ( 1 << 2), y +  -41.894 * s);
			_setf(o + ( 2 << 2), x +    6.885 * s);
			_setf(o + ( 3 << 2), y +  -41.894 * s);
			_setf(o + ( 4 << 2), x +    6.885 * s);
			_setf(o + ( 5 << 2), y +  -48.290 * s);
			_setf(o + ( 6 << 2), x +   53.076 * s);
			_setf(o + ( 7 << 2), y +  -48.290 * s);
			_setf(o + ( 8 << 2), x +   53.076 * s);
			_setf(o + ( 9 << 2), y +  -41.894 * s);
			_setf(o + (10 << 2), x +   53.076 * s);
			_setf(o + (11 << 2), y +  -22.314 * s);
			_setf(o + (12 << 2), x +    6.885 * s);
			_setf(o + (13 << 2), y +  -22.314 * s);
			_setf(o + (14 << 2), x +    6.885 * s);
			_setf(o + (15 << 2), y +  -28.710 * s);
			_setf(o + (16 << 2), x +   53.076 * s);
			_setf(o + (17 << 2), y +  -28.710 * s);
			_setf(o + (18 << 2), x +   53.076 * s);
			_setf(o + (19 << 2), y +  -22.314 * s);
			_setf(o + (20 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   49.511 * s);
			_setf(o + ( 1 << 2), y +  -32.421 * s);
			_setf(o + ( 2 << 2), x +   12.988 * s);
			_setf(o + ( 3 << 2), y +  -10.498 * s);
			_setf(o + ( 4 << 2), x +   12.988 * s);
			_setf(o + ( 5 << 2), y +  -17.676 * s);
			_setf(o + ( 6 << 2), x +   42.285 * s);
			_setf(o + ( 7 << 2), y +  -35.107 * s);
			_setf(o + ( 8 << 2), x +   12.988 * s);
			_setf(o + ( 9 << 2), y +  -52.978 * s);
			_setf(o + (10 << 2), x +   12.988 * s);
			_setf(o + (11 << 2), y +  -60.009 * s);
			_setf(o + (12 << 2), x +   49.511 * s);
			_setf(o + (13 << 2), y +  -38.281 * s);
			_setf(o + (14 << 2), x +   49.511 * s);
			_setf(o + (15 << 2), y +  -32.421 * s);
			_setf(o + (16 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   11.719 * s);
			_setf(o + ( 1 << 2), y +  -66.308 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   11.719 * s,y +  -66.308 * s,x +   17.480 * s,y +  -68.912 * s,x +   22.640 * s,y +  -70.214 * s,x +   27.197 * s,y +  -70.214 * s, threshold);
			_vr.bezier8(x +   27.197 * s,y +  -70.214 * s,x +   33.349 * s,y +  -70.214 * s,x +   38.102 * s,y +  -68.830 * s,x +   41.454 * s,y +  -66.063 * s, threshold);
			_vr.bezier8(x +   41.454 * s,y +  -66.063 * s,x +   44.807 * s,y +  -63.297 * s,x +   46.484 * s,y +  -59.211 * s,x +   46.484 * s,y +  -53.808 * s, threshold);
			_vr.bezier8(x +   46.484 * s,y +  -53.808 * s,x +   46.484 * s,y +  -48.209 * s,x +   42.860 * s,y +  -42.392 * s,x +   35.595 * s,y +  -36.376 * s, threshold);
			_vr.bezier8(x +   35.595 * s,y +  -36.376 * s,x +   32.443 * s,y +  -33.766 * s,x +   30.509 * s,y +  -32.039 * s,x +   29.809 * s,y +  -31.176 * s, threshold);
			_vr.bezier8(x +   29.809 * s,y +  -31.176 * s,x +   29.109 * s,y +  -30.314 * s,x +   28.548 * s,y +  -29.264 * s,x +   28.125 * s,y +  -28.027 * s, threshold);
			_vr.bezier8(x +   28.125 * s,y +  -28.027 * s,x +   27.701 * s,y +  -26.790 * s,x +   27.490 * s,y +  -25.244 * s,x +   27.490 * s,y +  -23.388 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   27.490 * s);
			_setf(o + ( 1 << 2), y +  -20.703 * s);
			_setf(o + ( 2 << 2), x +   20.800 * s);
			_setf(o + ( 3 << 2), y +  -20.703 * s);
			_setf(o + ( 4 << 2), x +   20.800 * s);
			_setf(o + ( 5 << 2), y +  -23.486 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   20.800 * s,y +  -23.486 * s,x +   20.800 * s,y +  -29.150 * s,x +   22.616 * s,y +  -33.551 * s,x +   26.220 * s,y +  -36.718 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   32.666 * s);
			_setf(o + ( 1 << 2), y +  -42.382 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   32.666 * s,y +  -42.382 * s,x +   34.713 * s,y +  -44.181 * s,x +   36.279 * s,y +  -45.922 * s,x +   37.255 * s,y +  -47.729 * s, threshold);
			_vr.bezier8(x +   37.255 * s,y +  -47.729 * s,x +   38.232 * s,y +  -49.535 * s,x +   38.720 * s,y +  -51.464 * s,x +   38.720 * s,y +  -53.515 * s, threshold);
			_vr.bezier8(x +   38.720 * s,y +  -53.515 * s,x +   38.720 * s,y +  -56.900 * s,x +   37.646 * s,y +  -59.496 * s,x +   35.498 * s,y +  -61.303 * s, threshold);
			_vr.bezier8(x +   35.498 * s,y +  -61.303 * s,x +   33.349 * s,y +  -63.109 * s,x +   30.420 * s,y +  -64.013 * s,x +   26.709 * s,y +  -64.013 * s, threshold);
			_vr.bezier8(x +   26.709 * s,y +  -64.013 * s,x +   23.356 * s,y +  -64.013 * s,x +   19.124 * s,y +  -62.808 * s,x +   14.013 * s,y +  -60.399 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   11.719 * s);
			_setf(o + ( 1 << 2), y +  -66.308 * s);
			_setf(o + ( 2 << 2), x +   25.000 * s);
			_setf(o + ( 3 << 2), y +  -11.181 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_vr.bezier8(x +   25.000 * s,y +  -11.181 * s,x +   26.725 * s,y +  -11.181 * s,x +   28.173 * s,y +  -10.596 * s,x +   29.345 * s,y +   -9.424 * s, threshold);
			_vr.bezier8(x +   29.345 * s,y +   -9.424 * s,x +   30.517 * s,y +   -8.252 * s,x +   31.103 * s,y +   -6.803 * s,x +   31.103 * s,y +   -5.078 * s, threshold);
			_vr.bezier8(x +   31.103 * s,y +   -5.078 * s,x +   31.103 * s,y +   -3.320 * s,x +   30.509 * s,y +   -1.815 * s,x +   29.321 * s,y +   -0.562 * s, threshold);
			_vr.bezier8(x +   29.321 * s,y +   -0.562 * s,x +   28.133 * s,y +    0.692 * s,x +   26.692 * s,y +    1.318 * s,x +   25.000 * s,y +    1.318 * s, threshold);
			_vr.bezier8(x +   25.000 * s,y +    1.318 * s,x +   23.339 * s,y +    1.318 * s,x +   21.923 * s,y +    0.692 * s,x +   20.752 * s,y +   -0.562 * s, threshold);
			_vr.bezier8(x +   20.752 * s,y +   -0.562 * s,x +   19.580 * s,y +   -1.815 * s,x +   18.994 * s,y +   -3.320 * s,x +   18.994 * s,y +   -5.078 * s, threshold);
			_vr.bezier8(x +   18.994 * s,y +   -5.078 * s,x +   18.994 * s,y +   -6.836 * s,x +   19.572 * s,y +   -8.293 * s,x +   20.727 * s,y +   -9.448 * s, threshold);
			_vr.bezier8(x +   20.727 * s,y +   -9.448 * s,x +   21.883 * s,y +  -10.604 * s,x +   23.307 * s,y +  -11.181 * s,x +   25.000 * s,y +  -11.181 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.009 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 64:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   47.314 * s);
			_setf(o + ( 1 << 2), y +    3.809 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   47.314 * s,y +    3.809 * s,x +   42.398 * s,y +    6.543 * s,x +   37.092 * s,y +    7.910 * s,x +   31.396 * s,y +    7.910 * s, threshold);
			_vr.bezier8(x +   31.396 * s,y +    7.910 * s,x +   23.519 * s,y +    7.910 * s,x +   17.114 * s,y +    4.696 * s,x +   12.182 * s,y +   -1.733 * s, threshold);
			_vr.bezier8(x +   12.182 * s,y +   -1.733 * s,x +    7.251 * s,y +   -8.162 * s,x +    4.785 * s,y +  -16.813 * s,x +    4.785 * s,y +  -27.685 * s, threshold);
			_vr.bezier8(x +    4.785 * s,y +  -27.685 * s,x +    4.785 * s,y +  -40.738 * s,x +    7.218 * s,y +  -51.025 * s,x +   12.085 * s,y +  -58.544 * s, threshold);
			_vr.bezier8(x +   12.085 * s,y +  -58.544 * s,x +   16.951 * s,y +  -66.063 * s,x +   23.323 * s,y +  -69.823 * s,x +   31.201 * s,y +  -69.823 * s, threshold);
			_vr.bezier8(x +   31.201 * s,y +  -69.823 * s,x +   38.492 * s,y +  -69.823 * s,x +   44.433 * s,y +  -66.853 * s,x +   49.023 * s,y +  -60.912 * s, threshold);
			_vr.bezier8(x +   49.023 * s,y +  -60.912 * s,x +   53.612 * s,y +  -54.971 * s,x +   55.907 * s,y +  -46.972 * s,x +   55.907 * s,y +  -36.913 * s, threshold);
			_vr.bezier8(x +   55.907 * s,y +  -36.913 * s,x +   55.907 * s,y +  -29.394 * s,x +   54.402 * s,y +  -23.177 * s,x +   51.391 * s,y +  -18.261 * s, threshold);
			_vr.bezier8(x +   51.391 * s,y +  -18.261 * s,x +   48.380 * s,y +  -13.346 * s,x +   44.482 * s,y +  -10.889 * s,x +   39.696 * s,y +  -10.889 * s, threshold);
			_vr.bezier8(x +   39.696 * s,y +  -10.889 * s,x +   36.409 * s,y +  -10.889 * s,x +   34.309 * s,y +  -12.825 * s,x +   33.398 * s,y +  -16.699 * s, threshold);
			_vr.bezier8(x +   33.398 * s,y +  -16.699 * s,x +   31.542 * s,y +  -12.825 * s,x +   28.906 * s,y +  -10.889 * s,x +   25.488 * s,y +  -10.889 * s, threshold);
			_vr.bezier8(x +   25.488 * s,y +  -10.889 * s,x +   23.014 * s,y +  -10.889 * s,x +   20.947 * s,y +  -12.191 * s,x +   19.287 * s,y +  -14.795 * s, threshold);
			_vr.bezier8(x +   19.287 * s,y +  -14.795 * s,x +   17.627 * s,y +  -17.399 * s,x +   16.796 * s,y +  -20.800 * s,x +   16.796 * s,y +  -25.000 * s, threshold);
			_vr.bezier8(x +   16.796 * s,y +  -25.000 * s,x +   16.796 * s,y +  -31.575 * s,x +   18.204 * s,y +  -37.068 * s,x +   21.020 * s,y +  -41.479 * s, threshold);
			_vr.bezier8(x +   21.020 * s,y +  -41.479 * s,x +   23.836 * s,y +  -45.890 * s,x +   27.327 * s,y +  -48.095 * s,x +   31.493 * s,y +  -48.095 * s, threshold);
			_vr.bezier8(x +   31.493 * s,y +  -48.095 * s,x +   33.121 * s,y +  -48.095 * s,x +   34.797 * s,y +  -47.493 * s,x +   36.523 * s,y +  -46.288 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   36.718 * s);
			_setf(o + ( 1 << 2), y +  -47.509 * s);
			_setf(o + ( 2 << 2), x +   42.821 * s);
			_setf(o + ( 3 << 2), y +  -47.509 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_vr.bezier8(x +   42.821 * s,y +  -47.509 * s,x +   40.868 * s,y +  -29.964 * s,x +   39.892 * s,y +  -20.556 * s,x +   39.892 * s,y +  -19.287 * s, threshold);
			_vr.bezier8(x +   39.892 * s,y +  -19.287 * s,x +   39.892 * s,y +  -18.408 * s,x +   40.079 * s,y +  -17.676 * s,x +   40.453 * s,y +  -17.090 * s, threshold);
			_vr.bezier8(x +   40.453 * s,y +  -17.090 * s,x +   40.828 * s,y +  -16.504 * s,x +   41.308 * s,y +  -16.211 * s,x +   41.894 * s,y +  -16.211 * s, threshold);
			_vr.bezier8(x +   41.894 * s,y +  -16.211 * s,x +   44.075 * s,y +  -16.211 * s,x +   46.068 * s,y +  -18.156 * s,x +   47.875 * s,y +  -22.046 * s, threshold);
			_vr.bezier8(x +   47.875 * s,y +  -22.046 * s,x +   49.682 * s,y +  -25.935 * s,x +   50.585 * s,y +  -30.892 * s,x +   50.585 * s,y +  -36.913 * s, threshold);
			_vr.bezier8(x +   50.585 * s,y +  -36.913 * s,x +   50.585 * s,y +  -45.507 * s,x +   48.827 * s,y +  -52.302 * s,x +   45.312 * s,y +  -57.299 * s, threshold);
			_vr.bezier8(x +   45.312 * s,y +  -57.299 * s,x +   41.796 * s,y +  -62.296 * s,x +   37.092 * s,y +  -64.794 * s,x +   31.201 * s,y +  -64.794 * s, threshold);
			_vr.bezier8(x +   31.201 * s,y +  -64.794 * s,x +   24.886 * s,y +  -64.794 * s,x +   19.791 * s,y +  -61.490 * s,x +   15.918 * s,y +  -54.882 * s, threshold);
			_vr.bezier8(x +   15.918 * s,y +  -54.882 * s,x +   12.044 * s,y +  -48.274 * s,x +   10.107 * s,y +  -39.209 * s,x +   10.107 * s,y +  -27.685 * s, threshold);
			_vr.bezier8(x +   10.107 * s,y +  -27.685 * s,x +   10.107 * s,y +  -18.440 * s,x +   12.068 * s,y +  -11.051 * s,x +   15.991 * s,y +   -5.517 * s, threshold);
			_vr.bezier8(x +   15.991 * s,y +   -5.517 * s,x +   19.913 * s,y +    0.016 * s,x +   25.048 * s,y +    2.783 * s,x +   31.396 * s,y +    2.783 * s, threshold);
			_vr.bezier8(x +   31.396 * s,y +    2.783 * s,x +   36.637 * s,y +    2.783 * s,x +   41.568 * s,y +    1.660 * s,x +   46.191 * s,y +   -0.586 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   47.314 * s);
			_setf(o + ( 1 << 2), y +    3.809 * s);
			_setf(o + ( 2 << 2), x +   35.790 * s);
			_setf(o + ( 3 << 2), y +  -41.015 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_vr.bezier8(x +   35.790 * s,y +  -41.015 * s,x +   34.814 * s,y +  -42.219 * s,x +   33.479 * s,y +  -42.822 * s,x +   31.786 * s,y +  -42.822 * s, threshold);
			_vr.bezier8(x +   31.786 * s,y +  -42.822 * s,x +   29.117 * s,y +  -42.822 * s,x +   26.985 * s,y +  -41.259 * s,x +   25.390 * s,y +  -38.134 * s, threshold);
			_vr.bezier8(x +   25.390 * s,y +  -38.134 * s,x +   23.795 * s,y +  -35.009 * s,x +   22.998 * s,y +  -30.859 * s,x +   22.998 * s,y +  -25.683 * s, threshold);
			_vr.bezier8(x +   22.998 * s,y +  -25.683 * s,x +   22.998 * s,y +  -22.721 * s,x +   23.404 * s,y +  -20.402 * s,x +   24.218 * s,y +  -18.725 * s, threshold);
			_vr.bezier8(x +   24.218 * s,y +  -18.725 * s,x +   25.032 * s,y +  -17.049 * s,x +   26.057 * s,y +  -16.211 * s,x +   27.294 * s,y +  -16.211 * s, threshold);
			_vr.bezier8(x +   27.294 * s,y +  -16.211 * s,x +   29.150 * s,y +  -16.211 * s,x +   30.680 * s,y +  -17.106 * s,x +   31.884 * s,y +  -18.896 * s, threshold);
			_vr.bezier8(x +   31.884 * s,y +  -18.896 * s,x +   33.089 * s,y +  -20.687 * s,x +   33.707 * s,y +  -21.958 * s,x +   33.788 * s,y +  -22.705 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   35.790 * s);
			_setf(o + ( 1 << 2), y +  -41.015 * s);
			_setf(o + ( 2 << 2), x +   60.009 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 65:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   57.421 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   49.023 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   41.406 * s);
			_setf(o + ( 5 << 2), y +  -24.121 * s);
			_setf(o + ( 6 << 2), x +   18.798 * s);
			_setf(o + ( 7 << 2), y +  -24.121 * s);
			_setf(o + ( 8 << 2), x +   11.084 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +    2.783 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   25.293 * s);
			_setf(o + (13 << 2), y +  -68.895 * s);
			_setf(o + (14 << 2), x +   34.912 * s);
			_setf(o + (15 << 2), y +  -68.895 * s);
			_setf(o + (16 << 2), x +   57.421 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   39.111 * s);
			_setf(o + (19 << 2), y +  -31.103 * s);
			_setf(o + (20 << 2), x +   30.078 * s);
			_setf(o + (21 << 2), y +  -59.618 * s);
			_setf(o + (22 << 2), x +   21.093 * s);
			_setf(o + (23 << 2), y +  -31.103 * s);
			_setf(o + (24 << 2), x +   39.111 * s);
			_setf(o + (25 << 2), y +  -31.103 * s);
			_setf(o + (26 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   38.280 * s);
			_setf(o + ( 1 << 2), y +  -37.792 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   38.280 * s,y +  -37.792 * s,x +   42.870 * s,y +  -36.718 * s,x +   46.467 * s,y +  -34.635 * s,x +   49.071 * s,y +  -31.542 * s, threshold);
			_vr.bezier8(x +   49.071 * s,y +  -31.542 * s,x +   51.675 * s,y +  -28.450 * s,x +   52.978 * s,y +  -24.772 * s,x +   52.978 * s,y +  -20.507 * s, threshold);
			_vr.bezier8(x +   52.978 * s,y +  -20.507 * s,x +   52.978 * s,y +  -14.257 * s,x +   50.707 * s,y +   -9.277 * s,x +   46.166 * s,y +   -5.566 * s, threshold);
			_vr.bezier8(x +   46.166 * s,y +   -5.566 * s,x +   41.625 * s,y +   -1.855 * s,x +   36.165 * s,y +       0. * s,x +   29.785 * s,y +       0. * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   10.205 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   10.205 * s);
			_setf(o + ( 3 << 2), y +  -68.895 * s);
			_setf(o + ( 4 << 2), x +   29.296 * s);
			_setf(o + ( 5 << 2), y +  -68.895 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   29.296 * s,y +  -68.895 * s,x +   35.937 * s,y +  -68.895 * s,x +   41.129 * s,y +  -67.439 * s,x +   44.872 * s,y +  -64.525 * s, threshold);
			_vr.bezier8(x +   44.872 * s,y +  -64.525 * s,x +   48.616 * s,y +  -61.612 * s,x +   50.487 * s,y +  -57.502 * s,x +   50.487 * s,y +  -52.196 * s, threshold);
			_vr.bezier8(x +   50.487 * s,y +  -52.196 * s,x +   50.487 * s,y +  -48.941 * s,x +   49.405 * s,y +  -46.044 * s,x +   47.240 * s,y +  -43.505 * s, threshold);
			_vr.bezier8(x +   47.240 * s,y +  -43.505 * s,x +   45.076 * s,y +  -40.966 * s,x +   42.089 * s,y +  -39.127 * s,x +   38.280 * s,y +  -37.988 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   38.280 * s);
			_setf(o + ( 1 << 2), y +  -37.792 * s);
			_setf(o + ( 2 << 2), x +   18.213 * s);
			_setf(o + ( 3 << 2), y +  -41.503 * s);
			_setf(o + ( 4 << 2), x +   27.588 * s);
			_setf(o + ( 5 << 2), y +  -41.503 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_setb(o +  2, 2);
			_vr.bezier8(x +   27.588 * s,y +  -41.503 * s,x +   37.385 * s,y +  -41.503 * s,x +   42.284 * s,y +  -45.002 * s,x +   42.284 * s,y +  -52.001 * s, threshold);
			_vr.bezier8(x +   42.284 * s,y +  -52.001 * s,x +   42.284 * s,y +  -55.191 * s,x +   41.080 * s,y +  -57.641 * s,x +   38.671 * s,y +  -59.350 * s, threshold);
			_vr.bezier8(x +   38.671 * s,y +  -59.350 * s,x +   36.262 * s,y +  -61.059 * s,x +   32.730 * s,y +  -61.913 * s,x +   28.076 * s,y +  -61.913 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   18.213 * s);
			_setf(o + ( 1 << 2), y +  -61.913 * s);
			_setf(o + ( 2 << 2), x +   18.213 * s);
			_setf(o + ( 3 << 2), y +  -41.503 * s);
			_setf(o + ( 4 << 2), x +   18.213 * s);
			_setf(o + ( 5 << 2), y +   -6.982 * s);
			_setf(o + ( 6 << 2), x +   27.294 * s);
			_setf(o + ( 7 << 2), y +   -6.982 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			_setb(o +  3, 2);
			_vr.bezier8(x +   27.294 * s,y +   -6.982 * s,x +   32.600 * s,y +   -6.982 * s,x +   36.808 * s,y +   -8.187 * s,x +   39.916 * s,y +  -10.596 * s, threshold);
			_vr.bezier8(x +   39.916 * s,y +  -10.596 * s,x +   43.025 * s,y +  -13.004 * s,x +   44.579 * s,y +  -16.308 * s,x +   44.579 * s,y +  -20.507 * s, threshold);
			_vr.bezier8(x +   44.579 * s,y +  -20.507 * s,x +   44.579 * s,y +  -24.967 * s,x +   43.049 * s,y +  -28.418 * s,x +   39.989 * s,y +  -30.859 * s, threshold);
			_vr.bezier8(x +   39.989 * s,y +  -30.859 * s,x +   36.930 * s,y +  -33.300 * s,x +   32.502 * s,y +  -34.521 * s,x +   26.709 * s,y +  -34.521 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   18.213 * s);
			_setf(o + ( 1 << 2), y +  -34.521 * s);
			_setf(o + ( 2 << 2), x +   18.213 * s);
			_setf(o + ( 3 << 2), y +   -6.982 * s);
			_setf(o + ( 4 << 2), x +   60.009 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 67:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   52.294 * s);
			_setf(o + ( 1 << 2), y +   -4.297 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   52.294 * s,y +   -4.297 * s,x +   46.890 * s,y +   -0.553 * s,x +   40.624 * s,y +    1.318 * s,x +   33.495 * s,y +    1.318 * s, threshold);
			_vr.bezier8(x +   33.495 * s,y +    1.318 * s,x +   24.576 * s,y +    1.318 * s,x +   17.797 * s,y +   -1.742 * s,x +   13.159 * s,y +   -7.861 * s, threshold);
			_vr.bezier8(x +   13.159 * s,y +   -7.861 * s,x +    8.520 * s,y +  -13.981 * s,x +    6.201 * s,y +  -22.835 * s,x +    6.201 * s,y +  -34.423 * s, threshold);
			_vr.bezier8(x +    6.201 * s,y +  -34.423 * s,x +    6.201 * s,y +  -45.621 * s,x +    8.447 * s,y +  -54.386 * s,x +   12.939 * s,y +  -60.717 * s, threshold);
			_vr.bezier8(x +   12.939 * s,y +  -60.717 * s,x +   17.431 * s,y +  -67.048 * s,x +   24.283 * s,y +  -70.214 * s,x +   33.495 * s,y +  -70.214 * s, threshold);
			_vr.bezier8(x +   33.495 * s,y +  -70.214 * s,x +   36.816 * s,y +  -70.214 * s,x +   40.103 * s,y +  -69.791 * s,x +   43.358 * s,y +  -68.944 * s, threshold);
			_vr.bezier8(x +   43.358 * s,y +  -68.944 * s,x +   46.614 * s,y +  -68.098 * s,x +   49.234 * s,y +  -66.975 * s,x +   51.220 * s,y +  -65.575 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   48.583 * s);
			_setf(o + ( 1 << 2), y +  -59.276 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   48.583 * s,y +  -59.276 * s,x +   43.993 * s,y +  -61.881 * s,x +   38.964 * s,y +  -63.183 * s,x +   33.495 * s,y +  -63.183 * s, threshold);
			_vr.bezier8(x +   33.495 * s,y +  -63.183 * s,x +   27.148 * s,y +  -63.183 * s,x +   22.428 * s,y +  -60.880 * s,x +   19.335 * s,y +  -56.274 * s, threshold);
			_vr.bezier8(x +   19.335 * s,y +  -56.274 * s,x +   16.243 * s,y +  -51.667 * s,x +   14.697 * s,y +  -44.384 * s,x +   14.697 * s,y +  -34.423 * s, threshold);
			_vr.bezier8(x +   14.697 * s,y +  -34.423 * s,x +   14.697 * s,y +  -15.283 * s,x +   20.963 * s,y +   -5.713 * s,x +   33.495 * s,y +   -5.713 * s, threshold);
			_vr.bezier8(x +   33.495 * s,y +   -5.713 * s,x +   38.801 * s,y +   -5.713 * s,x +   44.237 * s,y +   -7.340 * s,x +   49.804 * s,y +  -10.596 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   52.294 * s);
			_setf(o + ( 1 << 2), y +   -4.297 * s);
			_setf(o + ( 2 << 2), x +   60.009 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 68:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   10.204 * s);
			_setf(o + ( 1 << 2), y +  -68.895 * s);
			_setf(o + ( 2 << 2), x +   23.778 * s);
			_setf(o + ( 3 << 2), y +  -68.895 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   23.778 * s,y +  -68.895 * s,x +   32.795 * s,y +  -68.895 * s,x +   40.022 * s,y +  -65.827 * s,x +   45.458 * s,y +  -59.691 * s, threshold);
			_vr.bezier8(x +   45.458 * s,y +  -59.691 * s,x +   50.894 * s,y +  -53.555 * s,x +   53.612 * s,y +  -45.133 * s,x +   53.612 * s,y +  -34.423 * s, threshold);
			_vr.bezier8(x +   53.612 * s,y +  -34.423 * s,x +   53.612 * s,y +  -23.485 * s,x +   50.853 * s,y +  -15.014 * s,x +   45.336 * s,y +   -9.009 * s, threshold);
			_vr.bezier8(x +   45.336 * s,y +   -9.009 * s,x +   39.818 * s,y +   -3.003 * s,x +   32.746 * s,y +       0. * s,x +   24.120 * s,y +       0. * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   10.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   10.204 * s);
			_setf(o + ( 3 << 2), y +  -68.895 * s);
			_setf(o + ( 4 << 2), x +   18.212 * s);
			_setf(o + ( 5 << 2), y +   -6.982 * s);
			_setf(o + ( 6 << 2), x +   23.876 * s);
			_setf(o + ( 7 << 2), y +   -6.982 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			_setb(o +  3, 2);
			_vr.bezier8(x +   23.876 * s,y +   -6.982 * s,x +   30.419 * s,y +   -6.982 * s,x +   35.595 * s,y +   -9.407 * s,x +   39.403 * s,y +  -14.258 * s, threshold);
			_vr.bezier8(x +   39.403 * s,y +  -14.258 * s,x +   43.212 * s,y +  -19.108 * s,x +   45.116 * s,y +  -25.829 * s,x +   45.116 * s,y +  -34.423 * s, threshold);
			_vr.bezier8(x +   45.116 * s,y +  -34.423 * s,x +   45.116 * s,y +  -42.952 * s,x +   43.204 * s,y +  -49.666 * s,x +   39.379 * s,y +  -54.565 * s, threshold);
			_vr.bezier8(x +   39.379 * s,y +  -54.565 * s,x +   35.554 * s,y +  -59.464 * s,x +   30.386 * s,y +  -61.913 * s,x +   23.876 * s,y +  -61.913 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   18.212 * s);
			_setf(o + ( 1 << 2), y +  -61.913 * s);
			_setf(o + ( 2 << 2), x +   18.212 * s);
			_setf(o + ( 3 << 2), y +   -6.982 * s);
			_setf(o + ( 4 << 2), x +   60.008 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 69:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   48.486 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   12.500 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   12.500 * s);
			_setf(o + ( 5 << 2), y +  -68.895 * s);
			_setf(o + ( 6 << 2), x +   48.193 * s);
			_setf(o + ( 7 << 2), y +  -68.895 * s);
			_setf(o + ( 8 << 2), x +   48.193 * s);
			_setf(o + ( 9 << 2), y +  -61.913 * s);
			_setf(o + (10 << 2), x +   20.508 * s);
			_setf(o + (11 << 2), y +  -61.913 * s);
			_setf(o + (12 << 2), x +   20.508 * s);
			_setf(o + (13 << 2), y +  -40.576 * s);
			_setf(o + (14 << 2), x +   47.119 * s);
			_setf(o + (15 << 2), y +  -40.576 * s);
			_setf(o + (16 << 2), x +   47.119 * s);
			_setf(o + (17 << 2), y +  -33.593 * s);
			_setf(o + (18 << 2), x +   20.508 * s);
			_setf(o + (19 << 2), y +  -33.593 * s);
			_setf(o + (20 << 2), x +   20.508 * s);
			_setf(o + (21 << 2), y +   -6.982 * s);
			_setf(o + (22 << 2), x +   48.486 * s);
			_setf(o + (23 << 2), y +   -6.982 * s);
			_setf(o + (24 << 2), x +   48.486 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   49.023 * s);
			_setf(o + ( 1 << 2), y +  -61.913 * s);
			_setf(o + ( 2 << 2), x +   20.508 * s);
			_setf(o + ( 3 << 2), y +  -61.913 * s);
			_setf(o + ( 4 << 2), x +   20.508 * s);
			_setf(o + ( 5 << 2), y +  -39.404 * s);
			_setf(o + ( 6 << 2), x +   46.484 * s);
			_setf(o + ( 7 << 2), y +  -39.404 * s);
			_setf(o + ( 8 << 2), x +   46.484 * s);
			_setf(o + ( 9 << 2), y +  -32.421 * s);
			_setf(o + (10 << 2), x +   20.508 * s);
			_setf(o + (11 << 2), y +  -32.421 * s);
			_setf(o + (12 << 2), x +   20.508 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   12.500 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   12.500 * s);
			_setf(o + (17 << 2), y +  -68.895 * s);
			_setf(o + (18 << 2), x +   49.023 * s);
			_setf(o + (19 << 2), y +  -68.895 * s);
			_setf(o + (20 << 2), x +   49.023 * s);
			_setf(o + (21 << 2), y +  -61.913 * s);
			_setf(o + (22 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   52.196 * s);
			_setf(o + ( 1 << 2), y +   -4.883 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   52.196 * s,y +   -4.883 * s,x +   46.565 * s,y +   -0.749 * s,x +   40.332 * s,y +    1.318 * s,x +   33.496 * s,y +    1.318 * s, threshold);
			_vr.bezier8(x +   33.496 * s,y +    1.318 * s,x +   24.544 * s,y +    1.318 * s,x +   17.757 * s,y +   -1.717 * s,x +   13.135 * s,y +   -7.788 * s, threshold);
			_vr.bezier8(x +   13.135 * s,y +   -7.788 * s,x +    8.512 * s,y +  -13.859 * s,x +    6.201 * s,y +  -22.737 * s,x +    6.201 * s,y +  -34.423 * s, threshold);
			_vr.bezier8(x +    6.201 * s,y +  -34.423 * s,x +    6.201 * s,y +  -45.719 * s,x +    8.439 * s,y +  -54.508 * s,x +   12.915 * s,y +  -60.790 * s, threshold);
			_vr.bezier8(x +   12.915 * s,y +  -60.790 * s,x +   17.391 * s,y +  -67.073 * s,x +   24.251 * s,y +  -70.214 * s,x +   33.496 * s,y +  -70.214 * s, threshold);
			_vr.bezier8(x +   33.496 * s,y +  -70.214 * s,x +   36.816 * s,y +  -70.214 * s,x +   40.104 * s,y +  -69.791 * s,x +   43.359 * s,y +  -68.944 * s, threshold);
			_vr.bezier8(x +   43.359 * s,y +  -68.944 * s,x +   46.614 * s,y +  -68.098 * s,x +   49.234 * s,y +  -66.975 * s,x +   51.220 * s,y +  -65.575 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   48.583 * s);
			_setf(o + ( 1 << 2), y +  -59.276 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   48.583 * s,y +  -59.276 * s,x +   43.993 * s,y +  -61.881 * s,x +   38.964 * s,y +  -63.183 * s,x +   33.496 * s,y +  -63.183 * s, threshold);
			_vr.bezier8(x +   33.496 * s,y +  -63.183 * s,x +   27.181 * s,y +  -63.183 * s,x +   22.469 * s,y +  -60.871 * s,x +   19.360 * s,y +  -56.249 * s, threshold);
			_vr.bezier8(x +   19.360 * s,y +  -56.249 * s,x +   16.251 * s,y +  -51.627 * s,x +   14.697 * s,y +  -44.352 * s,x +   14.697 * s,y +  -34.423 * s, threshold);
			_vr.bezier8(x +   14.697 * s,y +  -34.423 * s,x +   14.697 * s,y +  -15.282 * s,x +   20.964 * s,y +   -5.713 * s,x +   33.496 * s,y +   -5.713 * s, threshold);
			_vr.bezier8(x +   33.496 * s,y +   -5.713 * s,x +   38.215 * s,y +   -5.713 * s,x +   41.780 * s,y +   -6.706 * s,x +   44.189 * s,y +   -8.691 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   44.189 * s);
			_setf(o + ( 1 << 2), y +  -25.683 * s);
			_setf(o + ( 2 << 2), x +   31.787 * s);
			_setf(o + ( 3 << 2), y +  -25.683 * s);
			_setf(o + ( 4 << 2), x +   31.787 * s);
			_setf(o + ( 5 << 2), y +  -32.617 * s);
			_setf(o + ( 6 << 2), x +   52.196 * s);
			_setf(o + ( 7 << 2), y +  -32.617 * s);
			_setf(o + ( 8 << 2), x +   52.196 * s);
			_setf(o + ( 9 << 2), y +   -4.883 * s);
			_setf(o + (10 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   49.804 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   41.796 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   41.796 * s);
			_setf(o + ( 5 << 2), y +  -34.179 * s);
			_setf(o + ( 6 << 2), x +   18.212 * s);
			_setf(o + ( 7 << 2), y +  -34.179 * s);
			_setf(o + ( 8 << 2), x +   18.212 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   10.205 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   10.205 * s);
			_setf(o + (13 << 2), y +  -68.895 * s);
			_setf(o + (14 << 2), x +   18.212 * s);
			_setf(o + (15 << 2), y +  -68.895 * s);
			_setf(o + (16 << 2), x +   18.212 * s);
			_setf(o + (17 << 2), y +  -41.210 * s);
			_setf(o + (18 << 2), x +   41.796 * s);
			_setf(o + (19 << 2), y +  -41.210 * s);
			_setf(o + (20 << 2), x +   41.796 * s);
			_setf(o + (21 << 2), y +  -68.895 * s);
			_setf(o + (22 << 2), x +   49.804 * s);
			_setf(o + (23 << 2), y +  -68.895 * s);
			_setf(o + (24 << 2), x +   49.804 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   45.312 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   14.013 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   14.013 * s);
			_setf(o + ( 5 << 2), y +   -6.982 * s);
			_setf(o + ( 6 << 2), x +   25.878 * s);
			_setf(o + ( 7 << 2), y +   -6.982 * s);
			_setf(o + ( 8 << 2), x +   25.878 * s);
			_setf(o + ( 9 << 2), y +  -61.913 * s);
			_setf(o + (10 << 2), x +   14.013 * s);
			_setf(o + (11 << 2), y +  -61.913 * s);
			_setf(o + (12 << 2), x +   14.013 * s);
			_setf(o + (13 << 2), y +  -68.895 * s);
			_setf(o + (14 << 2), x +   45.312 * s);
			_setf(o + (15 << 2), y +  -68.895 * s);
			_setf(o + (16 << 2), x +   45.312 * s);
			_setf(o + (17 << 2), y +  -61.913 * s);
			_setf(o + (18 << 2), x +   33.886 * s);
			_setf(o + (19 << 2), y +  -61.913 * s);
			_setf(o + (20 << 2), x +   33.886 * s);
			_setf(o + (21 << 2), y +   -6.982 * s);
			_setf(o + (22 << 2), x +   45.312 * s);
			_setf(o + (23 << 2), y +   -6.982 * s);
			_setf(o + (24 << 2), x +   45.312 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   60.009 * s);
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
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   42.284 * s);
			_setf(o + ( 1 << 2), y +  -18.310 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   42.284 * s,y +  -18.310 * s,x +   42.284 * s,y +  -11.995 * s,x +   40.632 * s,y +   -7.145 * s,x +   37.328 * s,y +   -3.760 * s, threshold);
			_vr.bezier8(x +   37.328 * s,y +   -3.760 * s,x +   34.024 * s,y +   -0.374 * s,x +   29.183 * s,y +    1.318 * s,x +   22.802 * s,y +    1.318 * s, threshold);
			_vr.bezier8(x +   22.802 * s,y +    1.318 * s,x +   17.236 * s,y +    1.318 * s,x +   12.174 * s,y +    0.146 * s,x +    7.617 * s,y +   -2.197 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   10.010 * s);
			_setf(o + ( 1 << 2), y +   -8.594 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   10.010 * s,y +   -8.594 * s,x +   13.883 * s,y +   -6.673 * s,x +   18.148 * s,y +   -5.713 * s,x +   22.802 * s,y +   -5.713 * s, threshold);
			_vr.bezier8(x +   22.802 * s,y +   -5.713 * s,x +   26.839 * s,y +   -5.713 * s,x +   29.760 * s,y +   -6.779 * s,x +   31.567 * s,y +   -8.911 * s, threshold);
			_vr.bezier8(x +   31.567 * s,y +   -8.911 * s,x +   33.373 * s,y +  -11.043 * s,x +   34.277 * s,y +  -14.372 * s,x +   34.277 * s,y +  -18.896 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   34.277 * s);
			_setf(o + ( 1 << 2), y +  -68.895 * s);
			_setf(o + ( 2 << 2), x +   42.284 * s);
			_setf(o + ( 3 << 2), y +  -68.895 * s);
			_setf(o + ( 4 << 2), x +   42.284 * s);
			_setf(o + ( 5 << 2), y +  -18.310 * s);
			_setf(o + ( 6 << 2), x +   60.009 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			
			case 75:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   58.885 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   48.778 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   25.488 * s);
			_setf(o + ( 5 << 2), y +  -33.789 * s);
			_setf(o + ( 6 << 2), x +   18.212 * s);
			_setf(o + ( 7 << 2), y +  -25.879 * s);
			_setf(o + ( 8 << 2), x +   18.212 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   10.205 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   10.205 * s);
			_setf(o + (13 << 2), y +  -68.895 * s);
			_setf(o + (14 << 2), x +   18.212 * s);
			_setf(o + (15 << 2), y +  -68.895 * s);
			_setf(o + (16 << 2), x +   18.212 * s);
			_setf(o + (17 << 2), y +  -35.888 * s);
			_setf(o + (18 << 2), x +   48.778 * s);
			_setf(o + (19 << 2), y +  -68.895 * s);
			_setf(o + (20 << 2), x +   58.007 * s);
			_setf(o + (21 << 2), y +  -68.895 * s);
			_setf(o + (22 << 2), x +   31.103 * s);
			_setf(o + (23 << 2), y +  -39.794 * s);
			_setf(o + (24 << 2), x +   58.885 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   49.999 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   12.499 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   12.499 * s);
			_setf(o + ( 5 << 2), y +  -68.895 * s);
			_setf(o + ( 6 << 2), x +   20.507 * s);
			_setf(o + ( 7 << 2), y +  -68.895 * s);
			_setf(o + ( 8 << 2), x +   20.507 * s);
			_setf(o + ( 9 << 2), y +   -6.982 * s);
			_setf(o + (10 << 2), x +   49.999 * s);
			_setf(o + (11 << 2), y +   -6.982 * s);
			_setf(o + (12 << 2), x +   49.999 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   60.008 * s);
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
			_setf(o + ( 0 << 2), x +   52.197 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   44.482 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   44.482 * s);
			_setf(o + ( 5 << 2), y +  -59.081 * s);
			_setf(o + ( 6 << 2), x +   34.082 * s);
			_setf(o + ( 7 << 2), y +  -30.810 * s);
			_setf(o + ( 8 << 2), x +   26.514 * s);
			_setf(o + ( 9 << 2), y +  -30.810 * s);
			_setf(o + (10 << 2), x +   16.113 * s);
			_setf(o + (11 << 2), y +  -59.081 * s);
			_setf(o + (12 << 2), x +   16.113 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +    8.399 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +    8.399 * s);
			_setf(o + (17 << 2), y +  -68.895 * s);
			_setf(o + (18 << 2), x +   18.799 * s);
			_setf(o + (19 << 2), y +  -68.895 * s);
			_setf(o + (20 << 2), x +   30.322 * s);
			_setf(o + (21 << 2), y +  -37.499 * s);
			_setf(o + (22 << 2), x +   41.797 * s);
			_setf(o + (23 << 2), y +  -68.895 * s);
			_setf(o + (24 << 2), x +   52.197 * s);
			_setf(o + (25 << 2), y +  -68.895 * s);
			_setf(o + (26 << 2), x +   52.197 * s);
			_setf(o + (27 << 2), y +       0. * s);
			_setf(o + (28 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   50.781 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   41.894 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   17.187 * s);
			_setf(o + ( 5 << 2), y +  -54.394 * s);
			_setf(o + ( 6 << 2), x +   17.187 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    9.180 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +    9.180 * s);
			_setf(o + (11 << 2), y +  -68.895 * s);
			_setf(o + (12 << 2), x +   18.115 * s);
			_setf(o + (13 << 2), y +  -68.895 * s);
			_setf(o + (14 << 2), x +   42.919 * s);
			_setf(o + (15 << 2), y +  -14.990 * s);
			_setf(o + (16 << 2), x +   42.919 * s);
			_setf(o + (17 << 2), y +  -68.895 * s);
			_setf(o + (18 << 2), x +   50.781 * s);
			_setf(o + (19 << 2), y +  -68.895 * s);
			_setf(o + (20 << 2), x +   50.781 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   29.882 * s);
			_setf(o + ( 1 << 2), y +  -70.214 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   29.882 * s,y +  -70.214 * s,x +   37.597 * s,y +  -70.214 * s,x +   43.481 * s,y +  -67.162 * s,x +   47.533 * s,y +  -61.059 * s, threshold);
			_vr.bezier8(x +   47.533 * s,y +  -61.059 * s,x +   51.586 * s,y +  -54.955 * s,x +   53.612 * s,y +  -46.076 * s,x +   53.612 * s,y +  -34.423 * s, threshold);
			_vr.bezier8(x +   53.612 * s,y +  -34.423 * s,x +   53.612 * s,y +  -22.835 * s,x +   51.594 * s,y +  -13.981 * s,x +   47.558 * s,y +   -7.861 * s, threshold);
			_vr.bezier8(x +   47.558 * s,y +   -7.861 * s,x +   43.521 * s,y +   -1.742 * s,x +   37.630 * s,y +    1.318 * s,x +   29.882 * s,y +    1.318 * s, threshold);
			_vr.bezier8(x +   29.882 * s,y +    1.318 * s,x +   22.200 * s,y +    1.318 * s,x +   16.333 * s,y +   -1.733 * s,x +   12.280 * s,y +   -7.837 * s, threshold);
			_vr.bezier8(x +   12.280 * s,y +   -7.837 * s,x +    8.227 * s,y +  -13.940 * s,x +    6.201 * s,y +  -22.802 * s,x +    6.201 * s,y +  -34.423 * s, threshold);
			_vr.bezier8(x +    6.201 * s,y +  -34.423 * s,x +    6.201 * s,y +  -46.044 * s,x +    8.219 * s,y +  -54.915 * s,x +   12.256 * s,y +  -61.034 * s, threshold);
			_vr.bezier8(x +   12.256 * s,y +  -61.034 * s,x +   16.292 * s,y +  -67.154 * s,x +   22.168 * s,y +  -70.214 * s,x +   29.882 * s,y +  -70.214 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   29.882 * s);
			_setf(o + ( 1 << 2), y +   -5.713 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   29.882 * s,y +   -5.713 * s,x +   40.038 * s,y +   -5.713 * s,x +   45.116 * s,y +  -15.282 * s,x +   45.116 * s,y +  -34.423 * s, threshold);
			_vr.bezier8(x +   45.116 * s,y +  -34.423 * s,x +   45.116 * s,y +  -53.597 * s,x +   40.039 * s,y +  -63.183 * s,x +   29.882 * s,y +  -63.183 * s, threshold);
			_vr.bezier8(x +   29.882 * s,y +  -63.183 * s,x +   24.935 * s,y +  -63.183 * s,x +   21.167 * s,y +  -60.701 * s,x +   18.579 * s,y +  -55.736 * s, threshold);
			_vr.bezier8(x +   18.579 * s,y +  -55.736 * s,x +   15.991 * s,y +  -50.772 * s,x +   14.697 * s,y +  -43.668 * s,x +   14.697 * s,y +  -34.423 * s, threshold);
			_vr.bezier8(x +   14.697 * s,y +  -34.423 * s,x +   14.697 * s,y +  -25.081 * s,x +   15.983 * s,y +  -17.960 * s,x +   18.554 * s,y +  -13.061 * s, threshold);
			_vr.bezier8(x +   18.554 * s,y +  -13.061 * s,x +   21.126 * s,y +   -8.162 * s,x +   24.902 * s,y +   -5.713 * s,x +   29.882 * s,y +   -5.713 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.009 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 80:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   12.500 * s);
			_setf(o + ( 1 << 2), y +  -68.895 * s);
			_setf(o + ( 2 << 2), x +   29.980 * s);
			_setf(o + ( 3 << 2), y +  -68.895 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   29.980 * s,y +  -68.895 * s,x +   36.588 * s,y +  -68.895 * s,x +   41.877 * s,y +  -67.235 * s,x +   45.849 * s,y +  -63.915 * s, threshold);
			_vr.bezier8(x +   45.849 * s,y +  -63.915 * s,x +   49.820 * s,y +  -60.595 * s,x +   51.806 * s,y +  -56.021 * s,x +   51.806 * s,y +  -50.195 * s, threshold);
			_vr.bezier8(x +   51.806 * s,y +  -50.195 * s,x +   51.806 * s,y +  -44.335 * s,x +   49.828 * s,y +  -39.656 * s,x +   45.873 * s,y +  -36.157 * s, threshold);
			_vr.bezier8(x +   45.873 * s,y +  -36.157 * s,x +   41.918 * s,y +  -32.657 * s,x +   36.734 * s,y +  -30.908 * s,x +   30.322 * s,y +  -30.908 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   20.507 * s);
			_setf(o + ( 1 << 2), y +  -30.908 * s);
			_setf(o + ( 2 << 2), x +   20.507 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   12.500 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   12.500 * s);
			_setf(o + ( 7 << 2), y +  -68.895 * s);
			_setf(o + ( 8 << 2), x +   20.507 * s);
			_setf(o + ( 9 << 2), y +  -37.890 * s);
			_setf(o + (10 << 2), x +   29.199 * s);
			_setf(o + (11 << 2), y +  -37.890 * s);
			o = _posb(6);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 1);
			_setb(o +  5, 2);
			_vr.bezier8(x +   29.199 * s,y +  -37.890 * s,x +   38.606 * s,y +  -37.890 * s,x +   43.310 * s,y +  -41.829 * s,x +   43.310 * s,y +  -49.706 * s, threshold);
			_vr.bezier8(x +   43.310 * s,y +  -49.706 * s,x +   43.310 * s,y +  -53.352 * s,x +   42.032 * s,y +  -56.298 * s,x +   39.477 * s,y +  -58.544 * s, threshold);
			_vr.bezier8(x +   39.477 * s,y +  -58.544 * s,x +   36.921 * s,y +  -60.790 * s,x +   33.626 * s,y +  -61.913 * s,x +   29.589 * s,y +  -61.913 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   20.507 * s);
			_setf(o + ( 1 << 2), y +  -61.913 * s);
			_setf(o + ( 2 << 2), x +   20.507 * s);
			_setf(o + ( 3 << 2), y +  -37.890 * s);
			_setf(o + ( 4 << 2), x +   60.009 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 81:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   55.419 * s);
			_setf(o + ( 1 << 2), y +   11.377 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   55.419 * s,y +   11.377 * s,x +   52.587 * s,y +   12.256 * s,x +   49.788 * s,y +   12.695 * s,x +   47.021 * s,y +   12.695 * s, threshold);
			_vr.bezier8(x +   47.021 * s,y +   12.695 * s,x +   39.859 * s,y +   12.695 * s,x +   35.221 * s,y +    8.789 * s,x +   33.105 * s,y +    0.977 * s, threshold);
			_vr.bezier8(x +   33.105 * s,y +    0.977 * s,x +   31.835 * s,y +    1.204 * s,x +   30.761 * s,y +    1.318 * s,x +   29.882 * s,y +    1.318 * s, threshold);
			_vr.bezier8(x +   29.882 * s,y +    1.318 * s,x +   22.200 * s,y +    1.318 * s,x +   16.333 * s,y +   -1.733 * s,x +   12.280 * s,y +   -7.837 * s, threshold);
			_vr.bezier8(x +   12.280 * s,y +   -7.837 * s,x +    8.227 * s,y +  -13.940 * s,x +    6.201 * s,y +  -22.802 * s,x +    6.201 * s,y +  -34.423 * s, threshold);
			_vr.bezier8(x +    6.201 * s,y +  -34.423 * s,x +    6.201 * s,y +  -46.044 * s,x +    8.219 * s,y +  -54.915 * s,x +   12.256 * s,y +  -61.034 * s, threshold);
			_vr.bezier8(x +   12.256 * s,y +  -61.034 * s,x +   16.292 * s,y +  -67.154 * s,x +   22.168 * s,y +  -70.214 * s,x +   29.882 * s,y +  -70.214 * s, threshold);
			_vr.bezier8(x +   29.882 * s,y +  -70.214 * s,x +   37.597 * s,y +  -70.214 * s,x +   43.481 * s,y +  -67.162 * s,x +   47.533 * s,y +  -61.059 * s, threshold);
			_vr.bezier8(x +   47.533 * s,y +  -61.059 * s,x +   51.586 * s,y +  -54.955 * s,x +   53.612 * s,y +  -46.077 * s,x +   53.612 * s,y +  -34.423 * s, threshold);
			_vr.bezier8(x +   53.612 * s,y +  -34.423 * s,x +   53.612 * s,y +  -17.496 * s,x +   49.381 * s,y +   -6.494 * s,x +   40.917 * s,y +   -1.416 * s, threshold);
			_vr.bezier8(x +   40.917 * s,y +   -1.416 * s,x +   42.122 * s,y +    3.337 * s,x +   44.417 * s,y +    5.713 * s,x +   47.802 * s,y +    5.713 * s, threshold);
			_vr.bezier8(x +   47.802 * s,y +    5.713 * s,x +   49.690 * s,y +    5.713 * s,x +   51.757 * s,y +    5.469 * s,x +   54.003 * s,y +    4.980 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   55.419 * s);
			_setf(o + ( 1 << 2), y +   11.377 * s);
			_setf(o + ( 2 << 2), x +   29.882 * s);
			_setf(o + ( 3 << 2), y +   -5.713 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_vr.bezier8(x +   29.882 * s,y +   -5.713 * s,x +   40.038 * s,y +   -5.713 * s,x +   45.116 * s,y +  -15.282 * s,x +   45.116 * s,y +  -34.423 * s, threshold);
			_vr.bezier8(x +   45.116 * s,y +  -34.423 * s,x +   45.116 * s,y +  -53.597 * s,x +   40.039 * s,y +  -63.183 * s,x +   29.882 * s,y +  -63.183 * s, threshold);
			_vr.bezier8(x +   29.882 * s,y +  -63.183 * s,x +   24.935 * s,y +  -63.183 * s,x +   21.167 * s,y +  -60.701 * s,x +   18.579 * s,y +  -55.736 * s, threshold);
			_vr.bezier8(x +   18.579 * s,y +  -55.736 * s,x +   15.991 * s,y +  -50.772 * s,x +   14.697 * s,y +  -43.668 * s,x +   14.697 * s,y +  -34.423 * s, threshold);
			_vr.bezier8(x +   14.697 * s,y +  -34.423 * s,x +   14.697 * s,y +  -25.081 * s,x +   15.983 * s,y +  -17.960 * s,x +   18.554 * s,y +  -13.061 * s, threshold);
			_vr.bezier8(x +   18.554 * s,y +  -13.061 * s,x +   21.126 * s,y +   -8.162 * s,x +   24.902 * s,y +   -5.713 * s,x +   29.882 * s,y +   -5.713 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.009 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 82:
			
			o = _posf(16);
			_setf(o + ( 0 << 2), x +   57.323 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   47.314 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   27.099 * s);
			_setf(o + ( 5 << 2), y +  -31.298 * s);
			_setf(o + ( 6 << 2), x +   18.213 * s);
			_setf(o + ( 7 << 2), y +  -31.298 * s);
			_setf(o + ( 8 << 2), x +   18.213 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   10.205 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   10.205 * s);
			_setf(o + (13 << 2), y +  -68.895 * s);
			_setf(o + (14 << 2), x +   29.687 * s);
			_setf(o + (15 << 2), y +  -68.895 * s);
			o = _posb(8);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_vr.bezier8(x +   29.687 * s,y +  -68.895 * s,x +   36.230 * s,y +  -68.895 * s,x +   41.397 * s,y +  -67.308 * s,x +   45.190 * s,y +  -64.135 * s, threshold);
			_vr.bezier8(x +   45.190 * s,y +  -64.135 * s,x +   48.982 * s,y +  -60.961 * s,x +   50.878 * s,y +  -56.542 * s,x +   50.878 * s,y +  -50.878 * s, threshold);
			_vr.bezier8(x +   50.878 * s,y +  -50.878 * s,x +   50.878 * s,y +  -46.679 * s,x +   49.495 * s,y +  -42.944 * s,x +   46.728 * s,y +  -39.672 * s, threshold);
			_vr.bezier8(x +   46.728 * s,y +  -39.672 * s,x +   43.961 * s,y +  -36.401 * s,x +   40.152 * s,y +  -34.179 * s,x +   35.302 * s,y +  -33.007 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   57.323 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   18.213 * s);
			_setf(o + ( 3 << 2), y +  -38.281 * s);
			_setf(o + ( 4 << 2), x +   28.320 * s);
			_setf(o + ( 5 << 2), y +  -38.281 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_setb(o +  2, 2);
			_vr.bezier8(x +   28.320 * s,y +  -38.281 * s,x +   32.551 * s,y +  -38.281 * s,x +   35.986 * s,y +  -39.428 * s,x +   38.622 * s,y +  -41.723 * s, threshold);
			_vr.bezier8(x +   38.622 * s,y +  -41.723 * s,x +   41.259 * s,y +  -44.018 * s,x +   42.577 * s,y +  -46.907 * s,x +   42.577 * s,y +  -50.390 * s, threshold);
			_vr.bezier8(x +   42.577 * s,y +  -50.390 * s,x +   42.577 * s,y +  -58.072 * s,x +   37.890 * s,y +  -61.913 * s,x +   28.515 * s,y +  -61.913 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   18.213 * s);
			_setf(o + ( 1 << 2), y +  -61.913 * s);
			_setf(o + ( 2 << 2), x +   18.213 * s);
			_setf(o + ( 3 << 2), y +  -38.281 * s);
			_setf(o + ( 4 << 2), x +   60.009 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 83:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   44.677 * s);
			_setf(o + ( 1 << 2), y +  -61.278 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   44.677 * s,y +  -61.278 * s,x +   40.575 * s,y +  -62.678 * s,x +   36.685 * s,y +  -63.378 * s,x +   33.007 * s,y +  -63.378 * s, threshold);
			_vr.bezier8(x +   33.007 * s,y +  -63.378 * s,x +   28.840 * s,y +  -63.378 * s,x +   25.447 * s,y +  -62.426 * s,x +   22.826 * s,y +  -60.521 * s, threshold);
			_vr.bezier8(x +   22.826 * s,y +  -60.521 * s,x +   20.206 * s,y +  -58.617 * s,x +   18.896 * s,y +  -55.907 * s,x +   18.896 * s,y +  -52.392 * s, threshold);
			_vr.bezier8(x +   18.896 * s,y +  -52.392 * s,x +   18.896 * s,y +  -48.225 * s,x +   22.332 * s,y +  -44.568 * s,x +   29.198 * s,y +  -41.406 * s, threshold);
			_vr.bezier8(x +   29.198 * s,y +  -41.406 * s,x +   34.279 * s,y +  -39.066 * s,x +   37.637 * s,y +  -37.434 * s,x +   39.281 * s,y +  -36.523 * s, threshold);
			_vr.bezier8(x +   39.281 * s,y +  -36.523 * s,x +   40.925 * s,y +  -35.611 * s,x +   42.593 * s,y +  -34.358 * s,x +   44.286 * s,y +  -32.763 * s, threshold);
			_vr.bezier8(x +   44.286 * s,y +  -32.763 * s,x +   45.979 * s,y +  -31.168 * s,x +   47.338 * s,y +  -29.288 * s,x +   48.363 * s,y +  -27.124 * s, threshold);
			_vr.bezier8(x +   48.363 * s,y +  -27.124 * s,x +   49.389 * s,y +  -24.959 * s,x +   49.901 * s,y +  -22.526 * s,x +   49.901 * s,y +  -19.824 * s, threshold);
			_vr.bezier8(x +   49.901 * s,y +  -19.824 * s,x +   49.901 * s,y +  -13.118 * s,x +   47.647 * s,y +   -7.918 * s,x +   43.139 * s,y +   -4.224 * s, threshold);
			_vr.bezier8(x +   43.139 * s,y +   -4.224 * s,x +   38.630 * s,y +   -0.529 * s,x +   33.316 * s,y +    1.318 * s,x +   27.197 * s,y +    1.318 * s, threshold);
			_vr.bezier8(x +   27.197 * s,y +    1.318 * s,x +   21.272 * s,y +    1.318 * s,x +   16.080 * s,y +    0.146 * s,x +   11.621 * s,y +   -2.197 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   13.281 * s);
			_setf(o + ( 1 << 2), y +   -9.082 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   13.281 * s,y +   -9.082 * s,x +   18.522 * s,y +   -6.706 * s,x +   23.095 * s,y +   -5.518 * s,x +   27.001 * s,y +   -5.518 * s, threshold);
			_vr.bezier8(x +   27.001 * s,y +   -5.518 * s,x +   31.558 * s,y +   -5.518 * s,x +   35.212 * s,y +   -6.697 * s,x +   37.963 * s,y +   -9.057 * s, threshold);
			_vr.bezier8(x +   37.963 * s,y +   -9.057 * s,x +   40.714 * s,y +  -11.417 * s,x +   42.089 * s,y +  -14.664 * s,x +   42.089 * s,y +  -18.799 * s, threshold);
			_vr.bezier8(x +   42.089 * s,y +  -18.799 * s,x +   42.089 * s,y +  -21.858 * s,x +   41.194 * s,y +  -24.454 * s,x +   39.403 * s,y +  -26.586 * s, threshold);
			_vr.bezier8(x +   39.403 * s,y +  -26.586 * s,x +   37.613 * s,y +  -28.719 * s,x +   34.308 * s,y +  -30.889 * s,x +   29.491 * s,y +  -33.105 * s, threshold);
			_vr.bezier8(x +   29.491 * s,y +  -33.105 * s,x +   24.543 * s,y +  -35.381 * s,x +   21.345 * s,y +  -36.938 * s,x +   19.897 * s,y +  -37.768 * s, threshold);
			_vr.bezier8(x +   19.897 * s,y +  -37.768 * s,x +   18.448 * s,y +  -38.598 * s,x +   17.008 * s,y +  -39.745 * s,x +   15.576 * s,y +  -41.210 * s, threshold);
			_vr.bezier8(x +   15.576 * s,y +  -41.210 * s,x +   14.143 * s,y +  -42.675 * s,x +   13.037 * s,y +  -44.319 * s,x +   12.255 * s,y +  -46.142 * s, threshold);
			_vr.bezier8(x +   12.255 * s,y +  -46.142 * s,x +   11.474 * s,y +  -47.965 * s,x +   11.083 * s,y +  -49.950 * s,x +   11.083 * s,y +  -52.099 * s, threshold);
			_vr.bezier8(x +   11.083 * s,y +  -52.099 * s,x +   11.083 * s,y +  -57.795 * s,x +   13.134 * s,y +  -62.239 * s,x +   17.236 * s,y +  -65.429 * s, threshold);
			_vr.bezier8(x +   17.236 * s,y +  -65.429 * s,x +   21.337 * s,y +  -68.619 * s,x +   26.529 * s,y +  -70.214 * s,x +   32.812 * s,y +  -70.214 * s, threshold);
			_vr.bezier8(x +   32.812 * s,y +  -70.214 * s,x +   37.402 * s,y +  -70.214 * s,x +   41.959 * s,y +  -69.514 * s,x +   46.483 * s,y +  -68.114 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   44.677 * s);
			_setf(o + ( 1 << 2), y +  -61.278 * s);
			_setf(o + ( 2 << 2), x +   60.009 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 84:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +   55.321 * s);
			_setf(o + ( 1 << 2), y +  -62.401 * s);
			_setf(o + ( 2 << 2), x +   34.081 * s);
			_setf(o + ( 3 << 2), y +  -62.401 * s);
			_setf(o + ( 4 << 2), x +   34.081 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   26.122 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   26.122 * s);
			_setf(o + ( 9 << 2), y +  -62.401 * s);
			_setf(o + (10 << 2), x +    4.785 * s);
			_setf(o + (11 << 2), y +  -62.401 * s);
			_setf(o + (12 << 2), x +    4.785 * s);
			_setf(o + (13 << 2), y +  -68.895 * s);
			_setf(o + (14 << 2), x +   55.321 * s);
			_setf(o + (15 << 2), y +  -68.895 * s);
			_setf(o + (16 << 2), x +   55.321 * s);
			_setf(o + (17 << 2), y +  -62.401 * s);
			_setf(o + (18 << 2), x +   60.008 * s);
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
			_setf(o + ( 0 << 2), x +   49.804 * s);
			_setf(o + ( 1 << 2), y +  -21.679 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   49.804 * s,y +  -21.679 * s,x +   49.804 * s,y +  -13.704 * s,x +   48.185 * s,y +   -7.877 * s,x +   44.946 * s,y +   -4.199 * s, threshold);
			_vr.bezier8(x +   44.946 * s,y +   -4.199 * s,x +   41.707 * s,y +   -0.521 * s,x +   36.783 * s,y +    1.318 * s,x +   30.176 * s,y +    1.318 * s, threshold);
			_vr.bezier8(x +   30.176 * s,y +    1.318 * s,x +   16.863 * s,y +    1.318 * s,x +   10.205 * s,y +   -6.283 * s,x +   10.205 * s,y +  -21.484 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   10.205 * s);
			_setf(o + ( 1 << 2), y +  -68.895 * s);
			_setf(o + ( 2 << 2), x +   18.213 * s);
			_setf(o + ( 3 << 2), y +  -68.895 * s);
			_setf(o + ( 4 << 2), x +   18.213 * s);
			_setf(o + ( 5 << 2), y +  -22.216 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   18.213 * s,y +  -22.216 * s,x +   18.213 * s,y +  -11.214 * s,x +   22.201 * s,y +   -5.713 * s,x +   30.176 * s,y +   -5.713 * s, threshold);
			_vr.bezier8(x +   30.176 * s,y +   -5.713 * s,x +   34.180 * s,y +   -5.713 * s,x +   37.117 * s,y +   -7.015 * s,x +   38.989 * s,y +   -9.619 * s, threshold);
			_vr.bezier8(x +   38.989 * s,y +   -9.619 * s,x +   40.861 * s,y +  -12.223 * s,x +   41.797 * s,y +  -16.455 * s,x +   41.797 * s,y +  -22.314 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   41.797 * s);
			_setf(o + ( 1 << 2), y +  -68.895 * s);
			_setf(o + ( 2 << 2), x +   49.804 * s);
			_setf(o + ( 3 << 2), y +  -68.895 * s);
			_setf(o + ( 4 << 2), x +   49.804 * s);
			_setf(o + ( 5 << 2), y +  -21.679 * s);
			_setf(o + ( 6 << 2), x +   60.009 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			
			case 86:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +   57.177 * s);
			_setf(o + ( 1 << 2), y +  -68.895 * s);
			_setf(o + ( 2 << 2), x +   34.716 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   25.097 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    2.588 * s);
			_setf(o + ( 7 << 2), y +  -68.895 * s);
			_setf(o + ( 8 << 2), x +   10.986 * s);
			_setf(o + ( 9 << 2), y +  -68.895 * s);
			_setf(o + (10 << 2), x +   29.883 * s);
			_setf(o + (11 << 2), y +   -9.277 * s);
			_setf(o + (12 << 2), x +   48.876 * s);
			_setf(o + (13 << 2), y +  -68.895 * s);
			_setf(o + (14 << 2), x +   57.177 * s);
			_setf(o + (15 << 2), y +  -68.895 * s);
			_setf(o + (16 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   57.909 * s);
			_setf(o + ( 1 << 2), y +  -68.895 * s);
			_setf(o + ( 2 << 2), x +   49.120 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   41.699 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   29.980 * s);
			_setf(o + ( 7 << 2), y +  -38.818 * s);
			_setf(o + ( 8 << 2), x +   18.310 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   10.693 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    2.100 * s);
			_setf(o + (13 << 2), y +  -68.895 * s);
			_setf(o + (14 << 2), x +   10.010 * s);
			_setf(o + (15 << 2), y +  -68.895 * s);
			_setf(o + (16 << 2), x +   15.820 * s);
			_setf(o + (17 << 2), y +  -12.890 * s);
			_setf(o + (18 << 2), x +   25.976 * s);
			_setf(o + (19 << 2), y +  -46.777 * s);
			_setf(o + (20 << 2), x +   33.984 * s);
			_setf(o + (21 << 2), y +  -46.777 * s);
			_setf(o + (22 << 2), x +   44.189 * s);
			_setf(o + (23 << 2), y +  -12.793 * s);
			_setf(o + (24 << 2), x +   50.097 * s);
			_setf(o + (25 << 2), y +  -68.895 * s);
			_setf(o + (26 << 2), x +   57.909 * s);
			_setf(o + (27 << 2), y +  -68.895 * s);
			_setf(o + (28 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   56.786 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   47.900 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   30.419 * s);
			_setf(o + ( 5 << 2), y +  -28.222 * s);
			_setf(o + ( 6 << 2), x +   13.086 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    4.199 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   26.220 * s);
			_setf(o + (11 << 2), y +  -35.107 * s);
			_setf(o + (12 << 2), x +    4.297 * s);
			_setf(o + (13 << 2), y +  -68.895 * s);
			_setf(o + (14 << 2), x +   13.476 * s);
			_setf(o + (15 << 2), y +  -68.895 * s);
			_setf(o + (16 << 2), x +   30.419 * s);
			_setf(o + (17 << 2), y +  -41.601 * s);
			_setf(o + (18 << 2), x +   47.509 * s);
			_setf(o + (19 << 2), y +  -68.895 * s);
			_setf(o + (20 << 2), x +   56.298 * s);
			_setf(o + (21 << 2), y +  -68.895 * s);
			_setf(o + (22 << 2), x +   34.716 * s);
			_setf(o + (23 << 2), y +  -35.107 * s);
			_setf(o + (24 << 2), x +   56.786 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   55.614 * s);
			_setf(o + ( 1 << 2), y +  -68.895 * s);
			_setf(o + ( 2 << 2), x +   34.081 * s);
			_setf(o + ( 3 << 2), y +  -29.492 * s);
			_setf(o + ( 4 << 2), x +   34.081 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   26.123 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   26.123 * s);
			_setf(o + ( 9 << 2), y +  -29.492 * s);
			_setf(o + (10 << 2), x +    4.590 * s);
			_setf(o + (11 << 2), y +  -68.895 * s);
			_setf(o + (12 << 2), x +   13.623 * s);
			_setf(o + (13 << 2), y +  -68.895 * s);
			_setf(o + (14 << 2), x +   30.078 * s);
			_setf(o + (15 << 2), y +  -37.890 * s);
			_setf(o + (16 << 2), x +   46.581 * s);
			_setf(o + (17 << 2), y +  -68.895 * s);
			_setf(o + (18 << 2), x +   55.614 * s);
			_setf(o + (19 << 2), y +  -68.895 * s);
			_setf(o + (20 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   50.780 * s);
			_setf(o + ( 1 << 2), y +  -63.183 * s);
			_setf(o + ( 2 << 2), x +   18.017 * s);
			_setf(o + ( 3 << 2), y +   -6.982 * s);
			_setf(o + ( 4 << 2), x +   50.194 * s);
			_setf(o + ( 5 << 2), y +   -6.982 * s);
			_setf(o + ( 6 << 2), x +   50.194 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    8.887 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +    8.887 * s);
			_setf(o + (11 << 2), y +   -5.615 * s);
			_setf(o + (12 << 2), x +   41.503 * s);
			_setf(o + (13 << 2), y +  -61.913 * s);
			_setf(o + (14 << 2), x +   10.303 * s);
			_setf(o + (15 << 2), y +  -61.913 * s);
			_setf(o + (16 << 2), x +   10.303 * s);
			_setf(o + (17 << 2), y +  -68.895 * s);
			_setf(o + (18 << 2), x +   50.780 * s);
			_setf(o + (19 << 2), y +  -68.895 * s);
			_setf(o + (20 << 2), x +   50.780 * s);
			_setf(o + (21 << 2), y +  -63.183 * s);
			_setf(o + (22 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   44.481 * s);
			_setf(o + ( 1 << 2), y +   13.183 * s);
			_setf(o + ( 2 << 2), x +   25.488 * s);
			_setf(o + ( 3 << 2), y +   13.183 * s);
			_setf(o + ( 4 << 2), x +   25.488 * s);
			_setf(o + ( 5 << 2), y +  -68.895 * s);
			_setf(o + ( 6 << 2), x +   44.481 * s);
			_setf(o + ( 7 << 2), y +  -68.895 * s);
			_setf(o + ( 8 << 2), x +   44.481 * s);
			_setf(o + ( 9 << 2), y +  -62.206 * s);
			_setf(o + (10 << 2), x +   33.105 * s);
			_setf(o + (11 << 2), y +  -62.206 * s);
			_setf(o + (12 << 2), x +   33.105 * s);
			_setf(o + (13 << 2), y +    6.592 * s);
			_setf(o + (14 << 2), x +   44.481 * s);
			_setf(o + (15 << 2), y +    6.592 * s);
			_setf(o + (16 << 2), x +   44.481 * s);
			_setf(o + (17 << 2), y +   13.183 * s);
			_setf(o + (18 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   47.509 * s);
			_setf(o + ( 1 << 2), y +    1.318 * s);
			_setf(o + ( 2 << 2), x +   40.282 * s);
			_setf(o + ( 3 << 2), y +    1.318 * s);
			_setf(o + ( 4 << 2), x +   10.400 * s);
			_setf(o + ( 5 << 2), y +  -70.214 * s);
			_setf(o + ( 6 << 2), x +   17.675 * s);
			_setf(o + ( 7 << 2), y +  -70.214 * s);
			_setf(o + ( 8 << 2), x +   47.509 * s);
			_setf(o + ( 9 << 2), y +    1.318 * s);
			_setf(o + (10 << 2), x +   60.008 * s);
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
			_setf(o + ( 0 << 2), x +   33.105 * s);
			_setf(o + ( 1 << 2), y +   12.988 * s);
			_setf(o + ( 2 << 2), x +   13.623 * s);
			_setf(o + ( 3 << 2), y +   12.988 * s);
			_setf(o + ( 4 << 2), x +   13.623 * s);
			_setf(o + ( 5 << 2), y +    6.396 * s);
			_setf(o + ( 6 << 2), x +   25.488 * s);
			_setf(o + ( 7 << 2), y +    6.396 * s);
			_setf(o + ( 8 << 2), x +   25.488 * s);
			_setf(o + ( 9 << 2), y +  -62.304 * s);
			_setf(o + (10 << 2), x +   13.623 * s);
			_setf(o + (11 << 2), y +  -62.304 * s);
			_setf(o + (12 << 2), x +   13.623 * s);
			_setf(o + (13 << 2), y +  -68.895 * s);
			_setf(o + (14 << 2), x +   33.105 * s);
			_setf(o + (15 << 2), y +  -68.895 * s);
			_setf(o + (16 << 2), x +   33.105 * s);
			_setf(o + (17 << 2), y +   12.988 * s);
			_setf(o + (18 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   54.882 * s);
			_setf(o + ( 1 << 2), y +  -38.476 * s);
			_setf(o + ( 2 << 2), x +   47.900 * s);
			_setf(o + ( 3 << 2), y +  -38.476 * s);
			_setf(o + ( 4 << 2), x +   29.980 * s);
			_setf(o + ( 5 << 2), y +  -67.821 * s);
			_setf(o + ( 6 << 2), x +   12.598 * s);
			_setf(o + ( 7 << 2), y +  -38.476 * s);
			_setf(o + ( 8 << 2), x +    5.420 * s);
			_setf(o + ( 9 << 2), y +  -38.476 * s);
			_setf(o + (10 << 2), x +   27.295 * s);
			_setf(o + (11 << 2), y +  -74.999 * s);
			_setf(o + (12 << 2), x +   33.203 * s);
			_setf(o + (13 << 2), y +  -74.999 * s);
			_setf(o + (14 << 2), x +   54.882 * s);
			_setf(o + (15 << 2), y +  -38.476 * s);
			_setf(o + (16 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   60.009 * s);
			_setf(o + ( 1 << 2), y +   21.777 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +   21.777 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +   15.381 * s);
			_setf(o + ( 6 << 2), x +   60.009 * s);
			_setf(o + ( 7 << 2), y +   15.381 * s);
			_setf(o + ( 8 << 2), x +   60.009 * s);
			_setf(o + ( 9 << 2), y +   21.777 * s);
			_setf(o + (10 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   37.695 * s);
			_setf(o + ( 1 << 2), y +  -56.884 * s);
			_setf(o + ( 2 << 2), x +   32.177 * s);
			_setf(o + ( 3 << 2), y +  -56.884 * s);
			_setf(o + ( 4 << 2), x +   16.992 * s);
			_setf(o + ( 5 << 2), y +  -71.581 * s);
			_setf(o + ( 6 << 2), x +   27.978 * s);
			_setf(o + ( 7 << 2), y +  -71.581 * s);
			_setf(o + ( 8 << 2), x +   37.695 * s);
			_setf(o + ( 9 << 2), y +  -56.884 * s);
			_setf(o + (10 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   50.976 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   43.407 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   43.407 * s,y +       0. * s,x +   42.789 * s,y +   -2.051 * s,x +   42.480 * s,y +   -4.785 * s,x +   42.480 * s,y +   -8.203 * s, threshold);
			_vr.bezier8(x +   42.480 * s,y +   -8.203 * s,x +   38.150 * s,y +   -1.855 * s,x +   32.258 * s,y +    1.318 * s,x +   24.804 * s,y +    1.318 * s, threshold);
			_vr.bezier8(x +   24.804 * s,y +    1.318 * s,x +   21.028 * s,y +    1.318 * s,x +   17.700 * s,y +   -0.024 * s,x +   14.819 * s,y +   -2.710 * s, threshold);
			_vr.bezier8(x +   14.819 * s,y +   -2.710 * s,x +   11.938 * s,y +   -5.395 * s,x +   10.498 * s,y +   -8.854 * s,x +   10.498 * s,y +  -13.086 * s, threshold);
			_vr.bezier8(x +   10.498 * s,y +  -13.086 * s,x +   10.498 * s,y +  -15.592 * s,x +   11.002 * s,y +  -17.806 * s,x +   12.011 * s,y +  -19.726 * s, threshold);
			_vr.bezier8(x +   12.011 * s,y +  -19.726 * s,x +   13.021 * s,y +  -21.647 * s,x +   14.502 * s,y +  -23.266 * s,x +   16.455 * s,y +  -24.585 * s, threshold);
			_vr.bezier8(x +   16.455 * s,y +  -24.585 * s,x +   18.408 * s,y +  -25.903 * s,x +   20.784 * s,y +  -26.945 * s,x +   23.584 * s,y +  -27.710 * s, threshold);
			_vr.bezier8(x +   23.584 * s,y +  -27.710 * s,x +   26.383 * s,y +  -28.474 * s,x +   29.704 * s,y +  -28.989 * s,x +   33.544 * s,y +  -29.296 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   42.089 * s);
			_setf(o + ( 1 << 2), y +  -29.980 * s);
			_setf(o + ( 2 << 2), x +   42.089 * s);
			_setf(o + ( 3 << 2), y +  -32.421 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_vr.bezier8(x +   42.089 * s,y +  -32.421 * s,x +   42.089 * s,y +  -41.145 * s,x +   38.020 * s,y +  -45.507 * s,x +   29.882 * s,y +  -45.507 * s, threshold);
			_vr.bezier8(x +   29.882 * s,y +  -45.507 * s,x +   27.962 * s,y +  -45.507 * s,x +   25.529 * s,y +  -45.092 * s,x +   22.583 * s,y +  -44.262 * s, threshold);
			_vr.bezier8(x +   22.583 * s,y +  -44.262 * s,x +   19.637 * s,y +  -43.432 * s,x +   17.106 * s,y +  -42.447 * s,x +   14.990 * s,y +  -41.308 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   12.988 * s);
			_setf(o + ( 1 << 2), y +  -46.777 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   12.988 * s,y +  -46.777 * s,x +   19.922 * s,y +  -50.325 * s,x +   26.367 * s,y +  -52.099 * s,x +   32.324 * s,y +  -52.099 * s, threshold);
			_vr.bezier8(x +   32.324 * s,y +  -52.099 * s,x +   43.912 * s,y +  -52.099 * s,x +   49.706 * s,y +  -45.963 * s,x +   49.706 * s,y +  -33.691 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   49.706 * s);
			_setf(o + ( 1 << 2), y +  -11.816 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   49.706 * s,y +  -11.816 * s,x +   49.706 * s,y +   -7.389 * s,x +   50.129 * s,y +   -3.450 * s,x +   50.976 * s,y +       0. * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   42.089 * s);
			_setf(o + ( 1 << 2), y +  -15.088 * s);
			_setf(o + ( 2 << 2), x +   42.089 * s);
			_setf(o + ( 3 << 2), y +  -24.316 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   42.089 * s,y +  -24.316 * s,x +   35.221 * s,y +  -23.698 * s,x +   30.509 * s,y +  -23.120 * s,x +   27.954 * s,y +  -22.583 * s, threshold);
			_vr.bezier8(x +   27.954 * s,y +  -22.583 * s,x +   25.398 * s,y +  -22.046 * s,x +   23.185 * s,y +  -21.045 * s,x +   21.313 * s,y +  -19.580 * s, threshold);
			_vr.bezier8(x +   21.313 * s,y +  -19.580 * s,x +   19.441 * s,y +  -18.115 * s,x +   18.506 * s,y +  -16.129 * s,x +   18.506 * s,y +  -13.623 * s, threshold);
			_vr.bezier8(x +   18.506 * s,y +  -13.623 * s,x +   18.506 * s,y +  -11.344 * s,x +   19.303 * s,y +   -9.505 * s,x +   20.898 * s,y +   -8.105 * s, threshold);
			_vr.bezier8(x +   20.898 * s,y +   -8.105 * s,x +   22.493 * s,y +   -6.706 * s,x +   24.528 * s,y +   -6.006 * s,x +   27.001 * s,y +   -6.006 * s, threshold);
			_vr.bezier8(x +   27.001 * s,y +   -6.006 * s,x +   29.703 * s,y +   -6.006 * s,x +   32.389 * s,y +   -6.811 * s,x +   35.058 * s,y +   -8.423 * s, threshold);
			_vr.bezier8(x +   35.058 * s,y +   -8.423 * s,x +   37.727 * s,y +  -10.034 * s,x +   40.071 * s,y +  -12.256 * s,x +   42.089 * s,y +  -15.088 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.009 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 98:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   18.115 * s);
			_setf(o + ( 1 << 2), y +  -44.286 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   18.115 * s,y +  -44.286 * s,x +   19.808 * s,y +  -46.630 * s,x +   22.094 * s,y +  -48.518 * s,x +   24.975 * s,y +  -49.950 * s, threshold);
			_vr.bezier8(x +   24.975 * s,y +  -49.950 * s,x +   27.856 * s,y +  -51.383 * s,x +   30.891 * s,y +  -52.099 * s,x +   34.081 * s,y +  -52.099 * s, threshold);
			_vr.bezier8(x +   34.081 * s,y +  -52.099 * s,x +   40.006 * s,y +  -52.099 * s,x +   44.620 * s,y +  -49.723 * s,x +   47.924 * s,y +  -44.970 * s, threshold);
			_vr.bezier8(x +   47.924 * s,y +  -44.970 * s,x +   51.228 * s,y +  -40.217 * s,x +   52.880 * s,y +  -33.968 * s,x +   52.880 * s,y +  -26.220 * s, threshold);
			_vr.bezier8(x +   52.880 * s,y +  -26.220 * s,x +   52.880 * s,y +  -18.375 * s,x +   51.122 * s,y +  -11.824 * s,x +   47.607 * s,y +   -6.567 * s, threshold);
			_vr.bezier8(x +   47.607 * s,y +   -6.567 * s,x +   44.091 * s,y +   -1.310 * s,x +   39.387 * s,y +    1.318 * s,x +   33.495 * s,y +    1.318 * s, threshold);
			_vr.bezier8(x +   33.495 * s,y +    1.318 * s,x +   30.338 * s,y +    1.318 * s,x +   27.384 * s,y +    0.529 * s,x +   24.633 * s,y +   -1.050 * s, threshold);
			_vr.bezier8(x +   24.633 * s,y +   -1.050 * s,x +   21.883 * s,y +   -2.629 * s,x +   19.710 * s,y +   -4.720 * s,x +   18.115 * s,y +   -7.324 * s, threshold);
			o = _posf(14);
			_setf(o + ( 0 << 2), x +   18.115 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   10.498 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   10.498 * s);
			_setf(o + ( 5 << 2), y +  -68.895 * s);
			_setf(o + ( 6 << 2), x +   18.115 * s);
			_setf(o + ( 7 << 2), y +  -68.895 * s);
			_setf(o + ( 8 << 2), x +   18.115 * s);
			_setf(o + ( 9 << 2), y +  -44.286 * s);
			_setf(o + (10 << 2), x +   18.115 * s);
			_setf(o + (11 << 2), y +  -36.718 * s);
			_setf(o + (12 << 2), x +   18.115 * s);
			_setf(o + (13 << 2), y +  -15.576 * s);
			o = _posb(7);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_setb(o +  6, 2);
			_vr.bezier8(x +   18.115 * s,y +  -15.576 * s,x +   19.547 * s,y +  -12.711 * s,x +   21.484 * s,y +  -10.319 * s,x +   23.925 * s,y +   -8.398 * s, threshold);
			_vr.bezier8(x +   23.925 * s,y +   -8.398 * s,x +   26.367 * s,y +   -6.478 * s,x +   28.889 * s,y +   -5.517 * s,x +   31.493 * s,y +   -5.517 * s, threshold);
			_vr.bezier8(x +   31.493 * s,y +   -5.517 * s,x +   35.595 * s,y +   -5.517 * s,x +   38.858 * s,y +   -7.471 * s,x +   41.283 * s,y +  -11.377 * s, threshold);
			_vr.bezier8(x +   41.283 * s,y +  -11.377 * s,x +   43.708 * s,y +  -15.283 * s,x +   44.921 * s,y +  -20.084 * s,x +   44.921 * s,y +  -25.781 * s, threshold);
			_vr.bezier8(x +   44.921 * s,y +  -25.781 * s,x +   44.921 * s,y +  -31.640 * s,x +   43.765 * s,y +  -36.393 * s,x +   41.454 * s,y +  -40.038 * s, threshold);
			_vr.bezier8(x +   41.454 * s,y +  -40.038 * s,x +   39.143 * s,y +  -43.684 * s,x +   35.921 * s,y +  -45.507 * s,x +   31.786 * s,y +  -45.507 * s, threshold);
			_vr.bezier8(x +   31.786 * s,y +  -45.507 * s,x +   26.415 * s,y +  -45.507 * s,x +   21.858 * s,y +  -42.577 * s,x +   18.115 * s,y +  -36.718 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.009 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 99:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   49.511 * s);
			_setf(o + ( 1 << 2), y +   -1.709 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   49.511 * s,y +   -1.709 * s,x +   45.084 * s,y +    0.309 * s,x +   40.217 * s,y +    1.318 * s,x +   34.911 * s,y +    1.318 * s, threshold);
			_vr.bezier8(x +   34.911 * s,y +    1.318 * s,x +   26.903 * s,y +    1.318 * s,x +   20.515 * s,y +   -1.115 * s,x +   15.746 * s,y +   -5.981 * s, threshold);
			_vr.bezier8(x +   15.746 * s,y +   -5.981 * s,x +   10.978 * s,y +  -10.848 * s,x +    8.593 * s,y +  -17.317 * s,x +    8.593 * s,y +  -25.390 * s, threshold);
			_vr.bezier8(x +    8.593 * s,y +  -25.390 * s,x +    8.593 * s,y +  -33.463 * s,x +   10.994 * s,y +  -39.933 * s,x +   15.795 * s,y +  -44.799 * s, threshold);
			_vr.bezier8(x +   15.795 * s,y +  -44.799 * s,x +   20.597 * s,y +  -49.666 * s,x +   26.903 * s,y +  -52.099 * s,x +   34.716 * s,y +  -52.099 * s, threshold);
			_vr.bezier8(x +   34.716 * s,y +  -52.099 * s,x +   39.827 * s,y +  -52.099 * s,x +   44.693 * s,y +  -51.204 * s,x +   49.315 * s,y +  -49.413 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   47.313 * s);
			_setf(o + ( 1 << 2), y +  -43.115 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   47.313 * s,y +  -43.115 * s,x +   42.691 * s,y +  -44.710 * s,x +   38.525 * s,y +  -45.507 * s,x +   34.814 * s,y +  -45.507 * s, threshold);
			_vr.bezier8(x +   34.814 * s,y +  -45.507 * s,x +   29.215 * s,y +  -45.507 * s,x +   24.780 * s,y +  -43.701 * s,x +   21.508 * s,y +  -40.087 * s, threshold);
			_vr.bezier8(x +   21.508 * s,y +  -40.087 * s,x +   18.237 * s,y +  -36.474 * s,x +   16.601 * s,y +  -31.575 * s,x +   16.601 * s,y +  -25.390 * s, threshold);
			_vr.bezier8(x +   16.601 * s,y +  -25.390 * s,x +   16.601 * s,y +  -19.726 * s,x +   18.294 * s,y +  -14.966 * s,x +   21.679 * s,y +  -11.108 * s, threshold);
			_vr.bezier8(x +   21.679 * s,y +  -11.108 * s,x +   25.064 * s,y +   -7.251 * s,x +   29.475 * s,y +   -5.322 * s,x +   34.911 * s,y +   -5.322 * s, threshold);
			_vr.bezier8(x +   34.911 * s,y +   -5.322 * s,x +   39.208 * s,y +   -5.322 * s,x +   43.635 * s,y +   -6.152 * s,x +   48.192 * s,y +   -7.812 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   49.511 * s);
			_setf(o + ( 1 << 2), y +   -1.709 * s);
			_setf(o + ( 2 << 2), x +   60.009 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 100:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   49.510 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   41.893 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   41.893 * s);
			_setf(o + ( 5 << 2), y +   -7.324 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   41.893 * s,y +   -7.324 * s,x +   40.331 * s,y +   -4.818 * s,x +   38.093 * s,y +   -2.751 * s,x +   35.180 * s,y +   -1.123 * s, threshold);
			_vr.bezier8(x +   35.180 * s,y +   -1.123 * s,x +   32.266 * s,y +    0.505 * s,x +   29.198 * s,y +    1.318 * s,x +   25.976 * s,y +    1.318 * s, threshold);
			_vr.bezier8(x +   25.976 * s,y +    1.318 * s,x +   20.149 * s,y +    1.318 * s,x +   15.543 * s,y +   -1.278 * s,x +   12.158 * s,y +   -6.470 * s, threshold);
			_vr.bezier8(x +   12.158 * s,y +   -6.470 * s,x +    8.772 * s,y +  -11.662 * s,x +    7.079 * s,y +  -18.245 * s,x +    7.079 * s,y +  -26.220 * s, threshold);
			_vr.bezier8(x +    7.079 * s,y +  -26.220 * s,x +    7.079 * s,y +  -33.674 * s,x +    8.845 * s,y +  -39.851 * s,x +   12.377 * s,y +  -44.750 * s, threshold);
			_vr.bezier8(x +   12.377 * s,y +  -44.750 * s,x +   15.909 * s,y +  -49.649 * s,x +   20.588 * s,y +  -52.099 * s,x +   26.415 * s,y +  -52.099 * s, threshold);
			_vr.bezier8(x +   26.415 * s,y +  -52.099 * s,x +   32.828 * s,y +  -52.099 * s,x +   37.987 * s,y +  -49.495 * s,x +   41.893 * s,y +  -44.286 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   41.893 * s);
			_setf(o + ( 1 << 2), y +  -68.895 * s);
			_setf(o + ( 2 << 2), x +   49.510 * s);
			_setf(o + ( 3 << 2), y +  -68.895 * s);
			_setf(o + ( 4 << 2), x +   49.510 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   41.893 * s);
			_setf(o + ( 7 << 2), y +  -15.576 * s);
			_setf(o + ( 8 << 2), x +   41.893 * s);
			_setf(o + ( 9 << 2), y +  -36.718 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			_setb(o +  4, 2);
			_vr.bezier8(x +   41.893 * s,y +  -36.718 * s,x +   38.248 * s,y +  -42.577 * s,x +   33.853 * s,y +  -45.507 * s,x +   28.710 * s,y +  -45.507 * s, threshold);
			_vr.bezier8(x +   28.710 * s,y +  -45.507 * s,x +   24.511 * s,y +  -45.507 * s,x +   21.191 * s,y +  -43.644 * s,x +   18.749 * s,y +  -39.916 * s, threshold);
			_vr.bezier8(x +   18.749 * s,y +  -39.916 * s,x +   16.308 * s,y +  -36.189 * s,x +   15.087 * s,y +  -31.477 * s,x +   15.087 * s,y +  -25.781 * s, threshold);
			_vr.bezier8(x +   15.087 * s,y +  -25.781 * s,x +   15.087 * s,y +  -19.921 * s,x +   16.235 * s,y +  -15.080 * s,x +   18.529 * s,y +  -11.255 * s, threshold);
			_vr.bezier8(x +   18.529 * s,y +  -11.255 * s,x +   20.824 * s,y +   -7.430 * s,x +   23.974 * s,y +   -5.517 * s,x +   27.978 * s,y +   -5.517 * s, threshold);
			_vr.bezier8(x +   27.978 * s,y +   -5.517 * s,x +   29.898 * s,y +   -5.517 * s,x +   31.835 * s,y +   -6.038 * s,x +   33.788 * s,y +   -7.080 * s, threshold);
			_vr.bezier8(x +   33.788 * s,y +   -7.080 * s,x +   35.741 * s,y +   -8.122 * s,x +   37.580 * s,y +   -9.684 * s,x +   39.306 * s,y +  -11.767 * s, threshold);
			_vr.bezier8(x +   39.306 * s,y +  -11.767 * s,x +   41.031 * s,y +  -13.851 * s,x +   41.893 * s,y +  -15.120 * s,x +   41.893 * s,y +  -15.576 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.008 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 101:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   51.220 * s);
			_setf(o + ( 1 << 2), y +  -25.195 * s);
			_setf(o + ( 2 << 2), x +   16.309 * s);
			_setf(o + ( 3 << 2), y +  -25.195 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   16.309 * s,y +  -25.195 * s,x +   16.309 * s,y +  -19.433 * s,x +   17.977 * s,y +  -14.681 * s,x +   21.313 * s,y +  -10.937 * s, threshold);
			_vr.bezier8(x +   21.313 * s,y +  -10.937 * s,x +   24.650 * s,y +   -7.194 * s,x +   28.744 * s,y +   -5.322 * s,x +   33.594 * s,y +   -5.322 * s, threshold);
			_vr.bezier8(x +   33.594 * s,y +   -5.322 * s,x +   38.216 * s,y +   -5.322 * s,x +   42.985 * s,y +   -6.152 * s,x +   47.900 * s,y +   -7.812 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   49.218 * s);
			_setf(o + ( 1 << 2), y +   -1.709 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   49.218 * s,y +   -1.709 * s,x +   44.726 * s,y +    0.309 * s,x +   39.485 * s,y +    1.318 * s,x +   33.496 * s,y +    1.318 * s, threshold);
			_vr.bezier8(x +   33.496 * s,y +    1.318 * s,x +   25.944 * s,y +    1.318 * s,x +   19.857 * s,y +   -1.107 * s,x +   15.234 * s,y +   -5.957 * s, threshold);
			_vr.bezier8(x +   15.234 * s,y +   -5.957 * s,x +   10.612 * s,y +  -10.807 * s,x +    8.301 * s,y +  -17.350 * s,x +    8.301 * s,y +  -25.586 * s, threshold);
			_vr.bezier8(x +    8.301 * s,y +  -25.586 * s,x +    8.301 * s,y +  -33.658 * s,x +   10.376 * s,y +  -40.095 * s,x +   14.526 * s,y +  -44.897 * s, threshold);
			_vr.bezier8(x +   14.526 * s,y +  -44.897 * s,x +   18.677 * s,y +  -49.698 * s,x +   24.040 * s,y +  -52.099 * s,x +   30.615 * s,y +  -52.099 * s, threshold);
			_vr.bezier8(x +   30.615 * s,y +  -52.099 * s,x +   36.475 * s,y +  -52.099 * s,x +   41.373 * s,y +  -49.869 * s,x +   45.312 * s,y +  -45.409 * s, threshold);
			_vr.bezier8(x +   45.312 * s,y +  -45.409 * s,x +   49.251 * s,y +  -40.950 * s,x +   51.220 * s,y +  -35.009 * s,x +   51.220 * s,y +  -27.587 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   51.220 * s);
			_setf(o + ( 1 << 2), y +  -25.195 * s);
			_setf(o + ( 2 << 2), x +   42.920 * s);
			_setf(o + ( 3 << 2), y +  -31.396 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_vr.bezier8(x +   42.920 * s,y +  -31.396 * s,x +   42.920 * s,y +  -35.367 * s,x +   41.683 * s,y +  -38.712 * s,x +   39.209 * s,y +  -41.430 * s, threshold);
			_vr.bezier8(x +   39.209 * s,y +  -41.430 * s,x +   36.735 * s,y +  -44.148 * s,x +   33.968 * s,y +  -45.507 * s,x +   30.908 * s,y +  -45.507 * s, threshold);
			_vr.bezier8(x +   30.908 * s,y +  -45.507 * s,x +   26.969 * s,y +  -45.507 * s,x +   23.706 * s,y +  -44.205 * s,x +   21.118 * s,y +  -41.601 * s, threshold);
			_vr.bezier8(x +   21.118 * s,y +  -41.601 * s,x +   18.530 * s,y +  -38.997 * s,x +   17.090 * s,y +  -35.595 * s,x +   16.797 * s,y +  -31.396 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   42.920 * s);
			_setf(o + ( 1 << 2), y +  -31.396 * s);
			_setf(o + ( 2 << 2), x +   60.009 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 102:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   50.195 * s);
			_setf(o + ( 1 << 2), y +  -68.114 * s);
			_setf(o + ( 2 << 2), x +   48.193 * s);
			_setf(o + ( 3 << 2), y +  -61.913 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   48.193 * s,y +  -61.913 * s,x +   44.580 * s,y +  -62.955 * s,x +   41.341 * s,y +  -63.476 * s,x +   38.476 * s,y +  -63.476 * s, threshold);
			_vr.bezier8(x +   38.476 * s,y +  -63.476 * s,x +   35.742 * s,y +  -63.476 * s,x +   33.862 * s,y +  -62.702 * s,x +   32.837 * s,y +  -61.156 * s, threshold);
			_vr.bezier8(x +   32.837 * s,y +  -61.156 * s,x +   31.811 * s,y +  -59.610 * s,x +   31.299 * s,y +  -56.493 * s,x +   31.299 * s,y +  -51.806 * s, threshold);
			o = _posf(22);
			_setf(o + ( 0 << 2), x +   31.299 * s);
			_setf(o + ( 1 << 2), y +  -50.878 * s);
			_setf(o + ( 2 << 2), x +   48.388 * s);
			_setf(o + ( 3 << 2), y +  -50.878 * s);
			_setf(o + ( 4 << 2), x +   48.388 * s);
			_setf(o + ( 5 << 2), y +  -44.286 * s);
			_setf(o + ( 6 << 2), x +   31.299 * s);
			_setf(o + ( 7 << 2), y +  -44.286 * s);
			_setf(o + ( 8 << 2), x +   31.299 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   23.681 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   23.681 * s);
			_setf(o + (13 << 2), y +  -44.286 * s);
			_setf(o + (14 << 2), x +   10.889 * s);
			_setf(o + (15 << 2), y +  -44.286 * s);
			_setf(o + (16 << 2), x +   10.889 * s);
			_setf(o + (17 << 2), y +  -50.878 * s);
			_setf(o + (18 << 2), x +   23.681 * s);
			_setf(o + (19 << 2), y +  -50.878 * s);
			_setf(o + (20 << 2), x +   23.681 * s);
			_setf(o + (21 << 2), y +  -52.587 * s);
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
			_vr.bezier8(x +   23.681 * s,y +  -52.587 * s,x +   23.681 * s,y +  -59.065 * s,x +   24.788 * s,y +  -63.606 * s,x +   27.002 * s,y +  -66.210 * s, threshold);
			_vr.bezier8(x +   27.002 * s,y +  -66.210 * s,x +   29.215 * s,y +  -68.814 * s,x +   33.040 * s,y +  -70.116 * s,x +   38.476 * s,y +  -70.116 * s, threshold);
			_vr.bezier8(x +   38.476 * s,y +  -70.116 * s,x +   41.992 * s,y +  -70.116 * s,x +   45.898 * s,y +  -69.449 * s,x +   50.195 * s,y +  -68.114 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.009 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 103:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   24.609 * s);
			_setf(o + ( 1 << 2), y +  -19.189 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   24.609 * s,y +  -19.189 * s,x +   19.856 * s,y +  -16.878 * s,x +   17.480 * s,y +  -14.844 * s,x +   17.480 * s,y +  -13.086 * s, threshold);
			_vr.bezier8(x +   17.480 * s,y +  -13.086 * s,x +   17.480 * s,y +  -12.142 * s,x +   18.025 * s,y +  -11.344 * s,x +   19.116 * s,y +  -10.693 * s, threshold);
			_vr.bezier8(x +   19.116 * s,y +  -10.693 * s,x +   20.206 * s,y +  -10.042 * s,x +   21.696 * s,y +   -9.663 * s,x +   23.584 * s,y +   -9.717 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   40.722 * s);
			_setf(o + ( 1 << 2), y +  -10.205 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   40.722 * s,y +  -10.205 * s,x +   44.789 * s,y +  -10.321 * s,x +   47.957 * s,y +   -9.212 * s,x +   50.219 * s,y +   -7.226 * s, threshold);
			_vr.bezier8(x +   50.219 * s,y +   -7.226 * s,x +   52.481 * s,y +   -5.241 * s,x +   53.612 * s,y +   -2.425 * s,x +   53.612 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   53.612 * s,y +    1.221 * s,x +   53.612 * s,y +    6.983 * s,x +   51.041 * s,y +   11.572 * s,x +   45.898 * s,y +   14.990 * s, threshold);
			_vr.bezier8(x +   45.898 * s,y +   14.990 * s,x +   40.755 * s,y +   18.408 * s,x +   34.749 * s,y +   20.117 * s,x +   27.880 * s,y +   20.117 * s, threshold);
			_vr.bezier8(x +   27.880 * s,y +   20.117 * s,x +   22.249 * s,y +   20.117 * s,x +   17.643 * s,y +   18.937 * s,x +   14.062 * s,y +   16.577 * s, threshold);
			_vr.bezier8(x +   14.062 * s,y +   16.577 * s,x +   10.482 * s,y +   14.217 * s,x +    8.691 * s,y +   11.165 * s,x +    8.691 * s,y +    7.422 * s, threshold);
			_vr.bezier8(x +    8.691 * s,y +    7.422 * s,x +    8.691 * s,y +    3.353 * s,x +   11.458 * s,y +   -0.081 * s,x +   16.992 * s,y +   -2.881 * s, threshold);
			_vr.bezier8(x +   16.992 * s,y +   -2.881 * s,x +   12.402 * s,y +   -5.029 * s,x +   10.107 * s,y +   -7.666 * s,x +   10.107 * s,y +  -10.791 * s, threshold);
			_vr.bezier8(x +   10.107 * s,y +  -10.791 * s,x +   10.107 * s,y +  -14.372 * s,x +   13.069 * s,y +  -17.708 * s,x +   18.994 * s,y +  -20.800 * s, threshold);
			_vr.bezier8(x +   18.994 * s,y +  -20.800 * s,x +   16.260 * s,y +  -22.461 * s,x +   14.160 * s,y +  -24.609 * s,x +   12.695 * s,y +  -27.246 * s, threshold);
			_vr.bezier8(x +   12.695 * s,y +  -27.246 * s,x +   11.230 * s,y +  -29.882 * s,x +   10.498 * s,y +  -32.666 * s,x +   10.498 * s,y +  -35.595 * s, threshold);
			_vr.bezier8(x +   10.498 * s,y +  -35.595 * s,x +   10.498 * s,y +  -40.380 * s,x +   12.125 * s,y +  -44.311 * s,x +   15.381 * s,y +  -47.387 * s, threshold);
			_vr.bezier8(x +   15.381 * s,y +  -47.387 * s,x +   18.636 * s,y +  -50.463 * s,x +   22.705 * s,y +  -52.001 * s,x +   27.587 * s,y +  -52.001 * s, threshold);
			_vr.bezier8(x +   27.587 * s,y +  -52.001 * s,x +   31.103 * s,y +  -52.001 * s,x +   34.277 * s,y +  -51.269 * s,x +   37.109 * s,y +  -49.804 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   52.196 * s);
			_setf(o + ( 1 << 2), y +  -52.099 * s);
			_setf(o + ( 2 << 2), x +   52.196 * s);
			_setf(o + ( 3 << 2), y +  -44.677 * s);
			_setf(o + ( 4 << 2), x +   42.480 * s);
			_setf(o + ( 5 << 2), y +  -44.677 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   42.480 * s,y +  -44.677 * s,x +   43.945 * s,y +  -42.105 * s,x +   44.677 * s,y +  -39.078 * s,x +   44.677 * s,y +  -35.595 * s, threshold);
			_vr.bezier8(x +   44.677 * s,y +  -35.595 * s,x +   44.677 * s,y +  -30.973 * s,x +   43.066 * s,y +  -27.067 * s,x +   39.843 * s,y +  -23.877 * s, threshold);
			_vr.bezier8(x +   39.843 * s,y +  -23.877 * s,x +   36.621 * s,y +  -20.687 * s,x +   32.535 * s,y +  -19.091 * s,x +   27.587 * s,y +  -19.091 * s, threshold);
			_vr.bezier8(x +   27.587 * s,y +  -19.091 * s,x +   26.546 * s,y +  -19.091 * s,x +   25.553 * s,y +  -19.124 * s,x +   24.609 * s,y +  -19.189 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   27.587 * s);
			_setf(o + ( 1 << 2), y +  -25.000 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   27.587 * s,y +  -25.000 * s,x +   30.387 * s,y +  -25.000 * s,x +   32.674 * s,y +  -25.968 * s,x +   34.448 * s,y +  -27.905 * s, threshold);
			_vr.bezier8(x +   34.448 * s,y +  -27.905 * s,x +   36.222 * s,y +  -29.842 * s,x +   37.109 * s,y +  -32.372 * s,x +   37.109 * s,y +  -35.497 * s, threshold);
			_vr.bezier8(x +   37.109 * s,y +  -35.497 * s,x +   37.109 * s,y +  -38.785 * s,x +   36.246 * s,y +  -41.357 * s,x +   34.521 * s,y +  -43.212 * s, threshold);
			_vr.bezier8(x +   34.521 * s,y +  -43.212 * s,x +   32.796 * s,y +  -45.068 * s,x +   30.485 * s,y +  -45.995 * s,x +   27.587 * s,y +  -45.995 * s, threshold);
			_vr.bezier8(x +   27.587 * s,y +  -45.995 * s,x +   24.886 * s,y +  -45.995 * s,x +   22.615 * s,y +  -45.027 * s,x +   20.776 * s,y +  -43.090 * s, threshold);
			_vr.bezier8(x +   20.776 * s,y +  -43.090 * s,x +   18.937 * s,y +  -41.153 * s,x +   18.017 * s,y +  -38.623 * s,x +   18.017 * s,y +  -35.497 * s, threshold);
			_vr.bezier8(x +   18.017 * s,y +  -35.497 * s,x +   18.017 * s,y +  -32.438 * s,x +   18.937 * s,y +  -29.923 * s,x +   20.776 * s,y +  -27.954 * s, threshold);
			_vr.bezier8(x +   20.776 * s,y +  -27.954 * s,x +   22.615 * s,y +  -25.984 * s,x +   24.886 * s,y +  -25.000 * s,x +   27.587 * s,y +  -25.000 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   27.880 * s);
			_setf(o + ( 1 << 2), y +   14.209 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   27.880 * s,y +   14.209 * s,x +   32.893 * s,y +   14.209 * s,x +   37.166 * s,y +   13.094 * s,x +   40.698 * s,y +   10.864 * s, threshold);
			_vr.bezier8(x +   40.698 * s,y +   10.864 * s,x +   44.229 * s,y +    8.634 * s,x +   45.995 * s,y +    5.876 * s,x +   45.995 * s,y +    2.588 * s, threshold);
			_vr.bezier8(x +   45.995 * s,y +    2.588 * s,x +   45.995 * s,y +   -0.798 * s,x +   43.489 * s,y +   -2.490 * s,x +   38.476 * s,y +   -2.490 * s, threshold);
			_vr.bezier8(x +   38.476 * s,y +   -2.490 * s,x +   36.816 * s,y +   -2.490 * s,x +   33.951 * s,y +   -2.397 * s,x +   29.882 * s,y +   -2.197 * s, threshold);
			_vr.bezier8(x +   29.882 * s,y +   -2.197 * s,x +   27.311 * s,y +   -2.071 * s,x +   25.293 * s,y +   -2.002 * s,x +   23.828 * s,y +   -2.002 * s, threshold);
			_vr.bezier8(x +   23.828 * s,y +   -2.002 * s,x +   23.112 * s,y +   -2.002 * s,x +   21.997 * s,y +   -1.416 * s,x +   20.483 * s,y +   -0.244 * s, threshold);
			_vr.bezier8(x +   20.483 * s,y +   -0.244 * s,x +   18.969 * s,y +    0.928 * s,x +   17.814 * s,y +    2.108 * s,x +   17.016 * s,y +    3.296 * s, threshold);
			_vr.bezier8(x +   17.016 * s,y +    3.296 * s,x +   16.219 * s,y +    4.484 * s,x +   15.820 * s,y +    5.713 * s,x +   15.820 * s,y +    6.982 * s, threshold);
			_vr.bezier8(x +   15.820 * s,y +    6.982 * s,x +   15.820 * s,y +    8.968 * s,x +   16.927 * s,y +   10.669 * s,x +   19.140 * s,y +   12.085 * s, threshold);
			_vr.bezier8(x +   19.140 * s,y +   12.085 * s,x +   21.354 * s,y +   13.501 * s,x +   24.267 * s,y +   14.209 * s,x +   27.880 * s,y +   14.209 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.009 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 104:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   49.706 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   42.089 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   42.089 * s);
			_setf(o + ( 5 << 2), y +  -32.617 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   42.089 * s,y +  -32.617 * s,x +   42.089 * s,y +  -37.141 * s,x +   41.365 * s,y +  -40.421 * s,x +   39.916 * s,y +  -42.455 * s, threshold);
			_vr.bezier8(x +   39.916 * s,y +  -42.455 * s,x +   38.468 * s,y +  -44.490 * s,x +   36.197 * s,y +  -45.507 * s,x +   33.105 * s,y +  -45.507 * s, threshold);
			_vr.bezier8(x +   33.105 * s,y +  -45.507 * s,x +   28.450 * s,y +  -45.507 * s,x +   23.453 * s,y +  -42.610 * s,x +   18.115 * s,y +  -36.816 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   18.115 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   10.498 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   10.498 * s);
			_setf(o + ( 5 << 2), y +  -68.895 * s);
			_setf(o + ( 6 << 2), x +   18.115 * s);
			_setf(o + ( 7 << 2), y +  -68.895 * s);
			_setf(o + ( 8 << 2), x +   18.115 * s);
			_setf(o + ( 9 << 2), y +  -43.408 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   18.115 * s,y +  -43.408 * s,x +   23.583 * s,y +  -49.202 * s,x +   29.345 * s,y +  -52.099 * s,x +   35.400 * s,y +  -52.099 * s, threshold);
			_vr.bezier8(x +   35.400 * s,y +  -52.099 * s,x +   44.937 * s,y +  -52.099 * s,x +   49.706 * s,y +  -46.337 * s,x +   49.706 * s,y +  -34.814 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   49.706 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   60.009 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 105:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   33.300 * s);
			_setf(o + ( 1 << 2), y +  -70.116 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   33.300 * s,y +  -70.116 * s,x +   34.733 * s,y +  -70.116 * s,x +   35.953 * s,y +  -69.603 * s,x +   36.962 * s,y +  -68.578 * s, threshold);
			_vr.bezier8(x +   36.962 * s,y +  -68.578 * s,x +   37.971 * s,y +  -67.553 * s,x +   38.476 * s,y +  -66.324 * s,x +   38.476 * s,y +  -64.892 * s, threshold);
			_vr.bezier8(x +   38.476 * s,y +  -64.892 * s,x +   38.476 * s,y +  -63.394 * s,x +   37.980 * s,y +  -62.141 * s,x +   36.987 * s,y +  -61.132 * s, threshold);
			_vr.bezier8(x +   36.987 * s,y +  -61.132 * s,x +   35.994 * s,y +  -60.123 * s,x +   34.765 * s,y +  -59.618 * s,x +   33.300 * s,y +  -59.618 * s, threshold);
			_vr.bezier8(x +   33.300 * s,y +  -59.618 * s,x +   31.966 * s,y +  -59.618 * s,x +   30.786 * s,y +  -60.147 * s,x +   29.760 * s,y +  -61.205 * s, threshold);
			_vr.bezier8(x +   29.760 * s,y +  -61.205 * s,x +   28.735 * s,y +  -62.263 * s,x +   28.222 * s,y +  -63.492 * s,x +   28.222 * s,y +  -64.892 * s, threshold);
			_vr.bezier8(x +   28.222 * s,y +  -64.892 * s,x +   28.222 * s,y +  -66.291 * s,x +   28.735 * s,y +  -67.512 * s,x +   29.760 * s,y +  -68.554 * s, threshold);
			_vr.bezier8(x +   29.760 * s,y +  -68.554 * s,x +   30.786 * s,y +  -69.595 * s,x +   31.966 * s,y +  -70.116 * s,x +   33.300 * s,y +  -70.116 * s, threshold);
			o = _posf(16);
			_setf(o + ( 0 << 2), x +   37.011 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   29.394 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   29.394 * s);
			_setf(o + ( 5 << 2), y +  -44.286 * s);
			_setf(o + ( 6 << 2), x +   14.404 * s);
			_setf(o + ( 7 << 2), y +  -44.286 * s);
			_setf(o + ( 8 << 2), x +   14.404 * s);
			_setf(o + ( 9 << 2), y +  -50.878 * s);
			_setf(o + (10 << 2), x +   37.011 * s);
			_setf(o + (11 << 2), y +  -50.878 * s);
			_setf(o + (12 << 2), x +   37.011 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   33.300 * s);
			_setf(o + ( 1 << 2), y +  -70.116 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   33.300 * s,y +  -70.116 * s,x +   34.732 * s,y +  -70.116 * s,x +   35.953 * s,y +  -69.603 * s,x +   36.962 * s,y +  -68.578 * s, threshold);
			_vr.bezier8(x +   36.962 * s,y +  -68.578 * s,x +   37.971 * s,y +  -67.553 * s,x +   38.476 * s,y +  -66.324 * s,x +   38.476 * s,y +  -64.892 * s, threshold);
			_vr.bezier8(x +   38.476 * s,y +  -64.892 * s,x +   38.476 * s,y +  -63.394 * s,x +   37.979 * s,y +  -62.141 * s,x +   36.987 * s,y +  -61.132 * s, threshold);
			_vr.bezier8(x +   36.987 * s,y +  -61.132 * s,x +   35.994 * s,y +  -60.123 * s,x +   34.765 * s,y +  -59.618 * s,x +   33.300 * s,y +  -59.618 * s, threshold);
			_vr.bezier8(x +   33.300 * s,y +  -59.618 * s,x +   31.966 * s,y +  -59.618 * s,x +   30.786 * s,y +  -60.147 * s,x +   29.760 * s,y +  -61.205 * s, threshold);
			_vr.bezier8(x +   29.760 * s,y +  -61.205 * s,x +   28.735 * s,y +  -62.263 * s,x +   28.222 * s,y +  -63.492 * s,x +   28.222 * s,y +  -64.892 * s, threshold);
			_vr.bezier8(x +   28.222 * s,y +  -64.892 * s,x +   28.222 * s,y +  -66.291 * s,x +   28.735 * s,y +  -67.512 * s,x +   29.760 * s,y +  -68.554 * s, threshold);
			_vr.bezier8(x +   29.760 * s,y +  -68.554 * s,x +   30.786 * s,y +  -69.595 * s,x +   31.965 * s,y +  -70.116 * s,x +   33.300 * s,y +  -70.116 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   37.011 * s);
			_setf(o + ( 1 << 2), y +    2.588 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   37.011 * s,y +    2.588 * s,x +   37.011 * s,y +    8.968 * s,x +   35.912 * s,y +   13.485 * s,x +   33.715 * s,y +   16.137 * s, threshold);
			_vr.bezier8(x +   33.715 * s,y +   16.137 * s,x +   31.518 * s,y +   18.790 * s,x +   27.685 * s,y +   20.117 * s,x +   22.216 * s,y +   20.117 * s, threshold);
			_vr.bezier8(x +   22.216 * s,y +   20.117 * s,x +   18.701 * s,y +   20.117 * s,x +   14.795 * s,y +   19.450 * s,x +   10.498 * s,y +   18.115 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   12.500 * s);
			_setf(o + ( 1 << 2), y +   11.914 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   12.500 * s,y +   11.914 * s,x +   16.113 * s,y +   12.956 * s,x +   19.352 * s,y +   13.476 * s,x +   22.216 * s,y +   13.476 * s, threshold);
			_vr.bezier8(x +   22.216 * s,y +   13.476 * s,x +   24.951 * s,y +   13.476 * s,x +   26.831 * s,y +   12.703 * s,x +   27.856 * s,y +   11.157 * s, threshold);
			_vr.bezier8(x +   27.856 * s,y +   11.157 * s,x +   28.881 * s,y +    9.611 * s,x +   29.394 * s,y +    6.494 * s,x +   29.394 * s,y +    1.807 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   29.394 * s);
			_setf(o + ( 1 << 2), y +  -44.286 * s);
			_setf(o + ( 2 << 2), x +   14.404 * s);
			_setf(o + ( 3 << 2), y +  -44.286 * s);
			_setf(o + ( 4 << 2), x +   14.404 * s);
			_setf(o + ( 5 << 2), y +  -50.878 * s);
			_setf(o + ( 6 << 2), x +   37.011 * s);
			_setf(o + ( 7 << 2), y +  -50.878 * s);
			_setf(o + ( 8 << 2), x +   37.011 * s);
			_setf(o + ( 9 << 2), y +    2.588 * s);
			_setf(o + (10 << 2), x +   60.009 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 107:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   54.686 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   44.677 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   23.095 * s);
			_setf(o + ( 5 << 2), y +  -25.293 * s);
			_setf(o + ( 6 << 2), x +   18.115 * s);
			_setf(o + ( 7 << 2), y +  -20.996 * s);
			_setf(o + ( 8 << 2), x +   18.115 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   10.498 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   10.498 * s);
			_setf(o + (13 << 2), y +  -68.895 * s);
			_setf(o + (14 << 2), x +   18.115 * s);
			_setf(o + (15 << 2), y +  -68.895 * s);
			_setf(o + (16 << 2), x +   18.115 * s);
			_setf(o + (17 << 2), y +  -29.394 * s);
			_setf(o + (18 << 2), x +   41.991 * s);
			_setf(o + (19 << 2), y +  -50.878 * s);
			_setf(o + (20 << 2), x +   51.708 * s);
			_setf(o + (21 << 2), y +  -50.878 * s);
			_setf(o + (22 << 2), x +   28.515 * s);
			_setf(o + (23 << 2), y +  -30.078 * s);
			_setf(o + (24 << 2), x +   54.686 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   60.009 * s);
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
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +   45.995 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   25.194 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   25.194 * s);
			_setf(o + ( 5 << 2), y +  -62.304 * s);
			_setf(o + ( 6 << 2), x +   11.913 * s);
			_setf(o + ( 7 << 2), y +  -62.304 * s);
			_setf(o + ( 8 << 2), x +   11.913 * s);
			_setf(o + ( 9 << 2), y +  -68.895 * s);
			_setf(o + (10 << 2), x +   32.812 * s);
			_setf(o + (11 << 2), y +  -68.895 * s);
			_setf(o + (12 << 2), x +   32.812 * s);
			_setf(o + (13 << 2), y +   -6.592 * s);
			_setf(o + (14 << 2), x +   45.995 * s);
			_setf(o + (15 << 2), y +   -6.592 * s);
			_setf(o + (16 << 2), x +   45.995 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   60.008 * s);
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
			
			case 109:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   53.710 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   46.093 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   46.093 * s);
			_setf(o + ( 5 << 2), y +  -33.398 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   46.093 * s,y +  -33.398 * s,x +   46.093 * s,y +  -41.470 * s,x +   44.596 * s,y +  -45.507 * s,x +   41.601 * s,y +  -45.507 * s, threshold);
			_vr.bezier8(x +   41.601 * s,y +  -45.507 * s,x +   40.071 * s,y +  -45.507 * s,x +   38.387 * s,y +  -44.116 * s,x +   36.548 * s,y +  -41.332 * s, threshold);
			_vr.bezier8(x +   36.548 * s,y +  -41.332 * s,x +   34.708 * s,y +  -38.549 * s,x +   33.789 * s,y +  -37.011 * s,x +   33.789 * s,y +  -36.718 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   33.789 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   26.221 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   26.221 * s);
			_setf(o + ( 5 << 2), y +  -33.398 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   26.221 * s,y +  -33.398 * s,x +   26.221 * s,y +  -41.470 * s,x +   24.707 * s,y +  -45.507 * s,x +   21.680 * s,y +  -45.507 * s, threshold);
			_vr.bezier8(x +   21.680 * s,y +  -45.507 * s,x +   20.182 * s,y +  -45.507 * s,x +   18.514 * s,y +  -44.116 * s,x +   16.675 * s,y +  -41.332 * s, threshold);
			_vr.bezier8(x +   16.675 * s,y +  -41.332 * s,x +   14.836 * s,y +  -38.549 * s,x +   13.916 * s,y +  -37.011 * s,x +   13.916 * s,y +  -36.718 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   13.916 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    6.299 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    6.299 * s);
			_setf(o + ( 5 << 2), y +  -50.878 * s);
			_setf(o + ( 6 << 2), x +   13.623 * s);
			_setf(o + ( 7 << 2), y +  -50.878 * s);
			_setf(o + ( 8 << 2), x +   13.623 * s);
			_setf(o + ( 9 << 2), y +  -43.212 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   13.623 * s,y +  -43.212 * s,x +   15.055 * s,y +  -45.914 * s,x +   16.756 * s,y +  -48.071 * s,x +   18.726 * s,y +  -49.682 * s, threshold);
			_vr.bezier8(x +   18.726 * s,y +  -49.682 * s,x +   20.695 * s,y +  -51.293 * s,x +   22.656 * s,y +  -52.099 * s,x +   24.609 * s,y +  -52.099 * s, threshold);
			_vr.bezier8(x +   24.609 * s,y +  -52.099 * s,x +   26.660 * s,y +  -52.099 * s,x +   28.499 * s,y +  -51.293 * s,x +   30.127 * s,y +  -49.682 * s, threshold);
			_vr.bezier8(x +   30.127 * s,y +  -49.682 * s,x +   31.754 * s,y +  -48.071 * s,x +   32.877 * s,y +  -45.914 * s,x +   33.496 * s,y +  -43.212 * s, threshold);
			_vr.bezier8(x +   33.496 * s,y +  -43.212 * s,x +   34.928 * s,y +  -45.914 * s,x +   36.637 * s,y +  -48.071 * s,x +   38.623 * s,y +  -49.682 * s, threshold);
			_vr.bezier8(x +   38.623 * s,y +  -49.682 * s,x +   40.608 * s,y +  -51.293 * s,x +   42.562 * s,y +  -52.099 * s,x +   44.482 * s,y +  -52.099 * s, threshold);
			_vr.bezier8(x +   44.482 * s,y +  -52.099 * s,x +   50.635 * s,y +  -52.099 * s,x +   53.710 * s,y +  -46.597 * s,x +   53.710 * s,y +  -35.595 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   53.710 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   60.009 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 110:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   49.706 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   42.089 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   42.089 * s);
			_setf(o + ( 5 << 2), y +  -32.617 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   42.089 * s,y +  -32.617 * s,x +   42.089 * s,y +  -37.141 * s,x +   41.365 * s,y +  -40.421 * s,x +   39.917 * s,y +  -42.455 * s, threshold);
			_vr.bezier8(x +   39.917 * s,y +  -42.455 * s,x +   38.468 * s,y +  -44.490 * s,x +   36.198 * s,y +  -45.507 * s,x +   33.105 * s,y +  -45.507 * s, threshold);
			_vr.bezier8(x +   33.105 * s,y +  -45.507 * s,x +   28.450 * s,y +  -45.507 * s,x +   23.454 * s,y +  -42.610 * s,x +   18.115 * s,y +  -36.816 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   18.115 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   10.498 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   10.498 * s);
			_setf(o + ( 5 << 2), y +  -50.878 * s);
			_setf(o + ( 6 << 2), x +   18.115 * s);
			_setf(o + ( 7 << 2), y +  -50.878 * s);
			_setf(o + ( 8 << 2), x +   18.115 * s);
			_setf(o + ( 9 << 2), y +  -43.408 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   18.115 * s,y +  -43.408 * s,x +   23.584 * s,y +  -49.202 * s,x +   29.345 * s,y +  -52.099 * s,x +   35.400 * s,y +  -52.099 * s, threshold);
			_vr.bezier8(x +   35.400 * s,y +  -52.099 * s,x +   44.938 * s,y +  -52.099 * s,x +   49.706 * s,y +  -46.337 * s,x +   49.706 * s,y +  -34.814 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   49.706 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   60.009 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 111:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   29.980 * s);
			_setf(o + ( 1 << 2), y +  -52.099 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   29.980 * s,y +  -52.099 * s,x +   36.979 * s,y +  -52.099 * s,x +   42.545 * s,y +  -49.657 * s,x +   46.679 * s,y +  -44.775 * s, threshold);
			_vr.bezier8(x +   46.679 * s,y +  -44.775 * s,x +   50.813 * s,y +  -39.892 * s,x +   52.880 * s,y +  -33.463 * s,x +   52.880 * s,y +  -25.488 * s, threshold);
			_vr.bezier8(x +   52.880 * s,y +  -25.488 * s,x +   52.880 * s,y +  -17.448 * s,x +   50.813 * s,y +  -10.970 * s,x +   46.679 * s,y +   -6.055 * s, threshold);
			_vr.bezier8(x +   46.679 * s,y +   -6.055 * s,x +   42.545 * s,y +   -1.139 * s,x +   36.978 * s,y +    1.318 * s,x +   29.980 * s,y +    1.318 * s, threshold);
			_vr.bezier8(x +   29.980 * s,y +    1.318 * s,x +   22.949 * s,y +    1.318 * s,x +   17.374 * s,y +   -1.131 * s,x +   13.257 * s,y +   -6.030 * s, threshold);
			_vr.bezier8(x +   13.257 * s,y +   -6.030 * s,x +    9.139 * s,y +  -10.929 * s,x +    7.080 * s,y +  -17.415 * s,x +    7.080 * s,y +  -25.488 * s, threshold);
			_vr.bezier8(x +    7.080 * s,y +  -25.488 * s,x +    7.080 * s,y +  -33.496 * s,x +    9.147 * s,y +  -39.933 * s,x +   13.281 * s,y +  -44.799 * s, threshold);
			_vr.bezier8(x +   13.281 * s,y +  -44.799 * s,x +   17.415 * s,y +  -49.666 * s,x +   22.981 * s,y +  -52.099 * s,x +   29.980 * s,y +  -52.099 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   29.980 * s);
			_setf(o + ( 1 << 2), y +   -5.322 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   29.980 * s,y +   -5.322 * s,x +   34.602 * s,y +   -5.322 * s,x +   38.248 * s,y +   -7.275 * s,x +   40.917 * s,y +  -11.181 * s, threshold);
			_vr.bezier8(x +   40.917 * s,y +  -11.181 * s,x +   43.587 * s,y +  -15.088 * s,x +   44.921 * s,y +  -19.824 * s,x +   44.921 * s,y +  -25.390 * s, threshold);
			_vr.bezier8(x +   44.921 * s,y +  -25.390 * s,x +   44.921 * s,y +  -31.250 * s,x +   43.603 * s,y +  -36.067 * s,x +   40.966 * s,y +  -39.843 * s, threshold);
			_vr.bezier8(x +   40.966 * s,y +  -39.843 * s,x +   38.329 * s,y +  -43.619 * s,x +   34.668 * s,y +  -45.507 * s,x +   29.980 * s,y +  -45.507 * s, threshold);
			_vr.bezier8(x +   29.980 * s,y +  -45.507 * s,x +   25.260 * s,y +  -45.507 * s,x +   21.598 * s,y +  -43.644 * s,x +   18.994 * s,y +  -39.916 * s, threshold);
			_vr.bezier8(x +   18.994 * s,y +  -39.916 * s,x +   16.390 * s,y +  -36.189 * s,x +   15.088 * s,y +  -31.347 * s,x +   15.088 * s,y +  -25.390 * s, threshold);
			_vr.bezier8(x +   15.088 * s,y +  -25.390 * s,x +   15.088 * s,y +  -19.726 * s,x +   16.406 * s,y +  -14.966 * s,x +   19.043 * s,y +  -11.108 * s, threshold);
			_vr.bezier8(x +   19.043 * s,y +  -11.108 * s,x +   21.679 * s,y +   -7.251 * s,x +   25.325 * s,y +   -5.322 * s,x +   29.980 * s,y +   -5.322 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.009 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 112:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   18.115 * s);
			_setf(o + ( 1 << 2), y +  -44.286 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   18.115 * s,y +  -44.286 * s,x +   19.807 * s,y +  -46.630 * s,x +   22.094 * s,y +  -48.518 * s,x +   24.975 * s,y +  -49.950 * s, threshold);
			_vr.bezier8(x +   24.975 * s,y +  -49.950 * s,x +   27.856 * s,y +  -51.383 * s,x +   30.891 * s,y +  -52.099 * s,x +   34.081 * s,y +  -52.099 * s, threshold);
			_vr.bezier8(x +   34.081 * s,y +  -52.099 * s,x +   39.941 * s,y +  -52.099 * s,x +   44.539 * s,y +  -49.682 * s,x +   47.875 * s,y +  -44.848 * s, threshold);
			_vr.bezier8(x +   47.875 * s,y +  -44.848 * s,x +   51.212 * s,y +  -40.014 * s,x +   52.880 * s,y +  -33.724 * s,x +   52.880 * s,y +  -25.976 * s, threshold);
			_vr.bezier8(x +   52.880 * s,y +  -25.976 * s,x +   52.880 * s,y +  -18.164 * s,x +   51.130 * s,y +  -11.662 * s,x +   47.631 * s,y +   -6.470 * s, threshold);
			_vr.bezier8(x +   47.631 * s,y +   -6.470 * s,x +   44.132 * s,y +   -1.278 * s,x +   39.420 * s,y +    1.318 * s,x +   33.495 * s,y +    1.318 * s, threshold);
			_vr.bezier8(x +   33.495 * s,y +    1.318 * s,x +   30.338 * s,y +    1.318 * s,x +   27.384 * s,y +    0.529 * s,x +   24.633 * s,y +   -1.050 * s, threshold);
			_vr.bezier8(x +   24.633 * s,y +   -1.050 * s,x +   21.883 * s,y +   -2.629 * s,x +   19.710 * s,y +   -4.720 * s,x +   18.115 * s,y +   -7.324 * s, threshold);
			o = _posf(14);
			_setf(o + ( 0 << 2), x +   18.115 * s);
			_setf(o + ( 1 << 2), y +   20.117 * s);
			_setf(o + ( 2 << 2), x +   10.498 * s);
			_setf(o + ( 3 << 2), y +   20.117 * s);
			_setf(o + ( 4 << 2), x +   10.498 * s);
			_setf(o + ( 5 << 2), y +  -50.878 * s);
			_setf(o + ( 6 << 2), x +   18.115 * s);
			_setf(o + ( 7 << 2), y +  -50.878 * s);
			_setf(o + ( 8 << 2), x +   18.115 * s);
			_setf(o + ( 9 << 2), y +  -44.286 * s);
			_setf(o + (10 << 2), x +   18.115 * s);
			_setf(o + (11 << 2), y +  -36.718 * s);
			_setf(o + (12 << 2), x +   18.115 * s);
			_setf(o + (13 << 2), y +  -15.576 * s);
			o = _posb(7);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_setb(o +  6, 2);
			_vr.bezier8(x +   18.115 * s,y +  -15.576 * s,x +   19.547 * s,y +  -12.711 * s,x +   21.484 * s,y +  -10.319 * s,x +   23.925 * s,y +   -8.398 * s, threshold);
			_vr.bezier8(x +   23.925 * s,y +   -8.398 * s,x +   26.367 * s,y +   -6.478 * s,x +   28.889 * s,y +   -5.517 * s,x +   31.493 * s,y +   -5.517 * s, threshold);
			_vr.bezier8(x +   31.493 * s,y +   -5.517 * s,x +   35.595 * s,y +   -5.517 * s,x +   38.858 * s,y +   -7.438 * s,x +   41.283 * s,y +  -11.279 * s, threshold);
			_vr.bezier8(x +   41.283 * s,y +  -11.279 * s,x +   43.708 * s,y +  -15.120 * s,x +   44.921 * s,y +  -19.889 * s,x +   44.921 * s,y +  -25.586 * s, threshold);
			_vr.bezier8(x +   44.921 * s,y +  -25.586 * s,x +   44.921 * s,y +  -31.445 * s,x +   43.765 * s,y +  -36.230 * s,x +   41.454 * s,y +  -39.941 * s, threshold);
			_vr.bezier8(x +   41.454 * s,y +  -39.941 * s,x +   39.143 * s,y +  -43.652 * s,x +   35.921 * s,y +  -45.507 * s,x +   31.786 * s,y +  -45.507 * s, threshold);
			_vr.bezier8(x +   31.786 * s,y +  -45.507 * s,x +   26.415 * s,y +  -45.507 * s,x +   21.858 * s,y +  -42.577 * s,x +   18.115 * s,y +  -36.718 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.009 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 113:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   49.511 * s);
			_setf(o + ( 1 << 2), y +   20.117 * s);
			_setf(o + ( 2 << 2), x +   41.894 * s);
			_setf(o + ( 3 << 2), y +   20.117 * s);
			_setf(o + ( 4 << 2), x +   41.894 * s);
			_setf(o + ( 5 << 2), y +   -7.324 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   41.894 * s,y +   -7.324 * s,x +   40.331 * s,y +   -4.818 * s,x +   38.094 * s,y +   -2.751 * s,x +   35.180 * s,y +   -1.123 * s, threshold);
			_vr.bezier8(x +   35.180 * s,y +   -1.123 * s,x +   32.267 * s,y +    0.505 * s,x +   29.199 * s,y +    1.318 * s,x +   25.976 * s,y +    1.318 * s, threshold);
			_vr.bezier8(x +   25.976 * s,y +    1.318 * s,x +   20.149 * s,y +    1.318 * s,x +   15.543 * s,y +   -1.237 * s,x +   12.158 * s,y +   -6.348 * s, threshold);
			_vr.bezier8(x +   12.158 * s,y +   -6.348 * s,x +    8.773 * s,y +  -11.458 * s,x +    7.080 * s,y +  -17.968 * s,x +    7.080 * s,y +  -25.879 * s, threshold);
			_vr.bezier8(x +    7.080 * s,y +  -25.879 * s,x +    7.080 * s,y +  -33.463 * s,x +    8.838 * s,y +  -39.729 * s,x +   12.353 * s,y +  -44.677 * s, threshold);
			_vr.bezier8(x +   12.353 * s,y +  -44.677 * s,x +   15.869 * s,y +  -49.625 * s,x +   20.556 * s,y +  -52.099 * s,x +   26.416 * s,y +  -52.099 * s, threshold);
			_vr.bezier8(x +   26.416 * s,y +  -52.099 * s,x +   32.828 * s,y +  -52.099 * s,x +   37.988 * s,y +  -49.495 * s,x +   41.894 * s,y +  -44.286 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   41.894 * s);
			_setf(o + ( 1 << 2), y +  -50.878 * s);
			_setf(o + ( 2 << 2), x +   49.511 * s);
			_setf(o + ( 3 << 2), y +  -50.878 * s);
			_setf(o + ( 4 << 2), x +   49.511 * s);
			_setf(o + ( 5 << 2), y +   20.117 * s);
			_setf(o + ( 6 << 2), x +   41.894 * s);
			_setf(o + ( 7 << 2), y +  -15.576 * s);
			_setf(o + ( 8 << 2), x +   41.894 * s);
			_setf(o + ( 9 << 2), y +  -36.718 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			_setb(o +  4, 2);
			_vr.bezier8(x +   41.894 * s,y +  -36.718 * s,x +   38.248 * s,y +  -42.577 * s,x +   33.853 * s,y +  -45.507 * s,x +   28.710 * s,y +  -45.507 * s, threshold);
			_vr.bezier8(x +   28.710 * s,y +  -45.507 * s,x +   24.511 * s,y +  -45.507 * s,x +   21.191 * s,y +  -43.603 * s,x +   18.750 * s,y +  -39.794 * s, threshold);
			_vr.bezier8(x +   18.750 * s,y +  -39.794 * s,x +   16.308 * s,y +  -35.986 * s,x +   15.088 * s,y +  -31.217 * s,x +   15.088 * s,y +  -25.488 * s, threshold);
			_vr.bezier8(x +   15.088 * s,y +  -25.488 * s,x +   15.088 * s,y +  -19.661 * s,x +   16.235 * s,y +  -14.876 * s,x +   18.530 * s,y +  -11.133 * s, threshold);
			_vr.bezier8(x +   18.530 * s,y +  -11.133 * s,x +   20.825 * s,y +   -7.389 * s,x +   23.974 * s,y +   -5.517 * s,x +   27.978 * s,y +   -5.517 * s, threshold);
			_vr.bezier8(x +   27.978 * s,y +   -5.517 * s,x +   29.899 * s,y +   -5.517 * s,x +   31.835 * s,y +   -6.038 * s,x +   33.789 * s,y +   -7.080 * s, threshold);
			_vr.bezier8(x +   33.789 * s,y +   -7.080 * s,x +   35.742 * s,y +   -8.122 * s,x +   37.581 * s,y +   -9.684 * s,x +   39.306 * s,y +  -11.767 * s, threshold);
			_vr.bezier8(x +   39.306 * s,y +  -11.767 * s,x +   41.031 * s,y +  -13.851 * s,x +   41.894 * s,y +  -15.120 * s,x +   41.894 * s,y +  -15.576 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.009 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 114:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   50.487 * s);
			_setf(o + ( 1 << 2), y +  -49.511 * s);
			_setf(o + ( 2 << 2), x +   47.411 * s);
			_setf(o + ( 3 << 2), y +  -42.187 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   47.411 * s,y +  -42.187 * s,x +   44.058 * s,y +  -43.652 * s,x +   41.161 * s,y +  -44.384 * s,x +   38.720 * s,y +  -44.384 * s, threshold);
			_vr.bezier8(x +   38.720 * s,y +  -44.384 * s,x +   36.474 * s,y +  -44.384 * s,x +   34.277 * s,y +  -43.741 * s,x +   32.128 * s,y +  -42.455 * s, threshold);
			_vr.bezier8(x +   32.128 * s,y +  -42.455 * s,x +   29.980 * s,y +  -41.170 * s,x +   28.003 * s,y +  -39.330 * s,x +   26.196 * s,y +  -36.938 * s, threshold);
			_vr.bezier8(x +   26.196 * s,y +  -36.938 * s,x +   24.389 * s,y +  -34.545 * s,x +   23.486 * s,y +  -33.203 * s,x +   23.486 * s,y +  -32.910 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   23.486 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   15.918 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   15.918 * s);
			_setf(o + ( 5 << 2), y +  -50.878 * s);
			_setf(o + ( 6 << 2), x +   23.486 * s);
			_setf(o + ( 7 << 2), y +  -50.878 * s);
			_setf(o + ( 8 << 2), x +   23.486 * s);
			_setf(o + ( 9 << 2), y +  -40.576 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_vr.bezier8(x +   23.486 * s,y +  -40.576 * s,x +   27.555 * s,y +  -48.258 * s,x +   32.828 * s,y +  -52.099 * s,x +   39.306 * s,y +  -52.099 * s, threshold);
			_vr.bezier8(x +   39.306 * s,y +  -52.099 * s,x +   43.147 * s,y +  -52.099 * s,x +   46.874 * s,y +  -51.236 * s,x +   50.487 * s,y +  -49.511 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.009 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 115:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   44.384 * s);
			_setf(o + ( 1 << 2), y +  -43.603 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   44.384 * s,y +  -43.603 * s,x +   40.119 * s,y +  -45.003 * s,x +   36.099 * s,y +  -45.702 * s,x +   32.323 * s,y +  -45.702 * s, threshold);
			_vr.bezier8(x +   32.323 * s,y +  -45.702 * s,x +   28.189 * s,y +  -45.702 * s,x +   24.918 * s,y +  -45.011 * s,x +   22.509 * s,y +  -43.627 * s, threshold);
			_vr.bezier8(x +   22.509 * s,y +  -43.627 * s,x +   20.100 * s,y +  -42.244 * s,x +   18.896 * s,y +  -40.396 * s,x +   18.896 * s,y +  -38.085 * s, threshold);
			_vr.bezier8(x +   18.896 * s,y +  -38.085 * s,x +   18.896 * s,y +  -36.620 * s,x +   19.449 * s,y +  -35.343 * s,x +   20.556 * s,y +  -34.252 * s, threshold);
			_vr.bezier8(x +   20.556 * s,y +  -34.252 * s,x +   21.663 * s,y +  -33.162 * s,x +   23.880 * s,y +  -32.158 * s,x +   27.197 * s,y +  -31.201 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   34.472 * s);
			_setf(o + ( 1 << 2), y +  -29.101 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   34.472 * s,y +  -29.101 * s,x +   37.818 * s,y +  -28.135 * s,x +   40.559 * s,y +  -27.026 * s,x +   42.675 * s,y +  -25.708 * s, threshold);
			_vr.bezier8(x +   42.675 * s,y +  -25.708 * s,x +   44.791 * s,y +  -24.389 * s,x +   46.378 * s,y +  -22.794 * s,x +   47.435 * s,y +  -20.923 * s, threshold);
			_vr.bezier8(x +   47.435 * s,y +  -20.923 * s,x +   48.493 * s,y +  -19.051 * s,x +   49.022 * s,y +  -16.878 * s,x +   49.022 * s,y +  -14.404 * s, threshold);
			_vr.bezier8(x +   49.022 * s,y +  -14.404 * s,x +   49.022 * s,y +   -9.554 * s,x +   46.988 * s,y +   -5.721 * s,x +   42.919 * s,y +   -2.905 * s, threshold);
			_vr.bezier8(x +   42.919 * s,y +   -2.905 * s,x +   38.850 * s,y +   -0.090 * s,x +   33.674 * s,y +    1.318 * s,x +   27.392 * s,y +    1.318 * s, threshold);
			_vr.bezier8(x +   27.392 * s,y +    1.318 * s,x +   21.142 * s,y +    1.318 * s,x +   15.982 * s,y +    0.374 * s,x +   11.914 * s,y +   -1.514 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   13.378 * s);
			_setf(o + ( 1 << 2), y +   -8.105 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   13.378 * s,y +   -8.105 * s,x +   17.643 * s,y +   -6.087 * s,x +   22.216 * s,y +   -5.078 * s,x +   27.099 * s,y +   -5.078 * s, threshold);
			_vr.bezier8(x +   27.099 * s,y +   -5.078 * s,x +   31.331 * s,y +   -5.078 * s,x +   34.773 * s,y +   -5.867 * s,x +   37.426 * s,y +   -7.446 * s, threshold);
			_vr.bezier8(x +   37.426 * s,y +   -7.446 * s,x +   40.079 * s,y +   -9.025 * s,x +   41.405 * s,y +  -11.116 * s,x +   41.405 * s,y +  -13.720 * s, threshold);
			_vr.bezier8(x +   41.405 * s,y +  -13.720 * s,x +   41.405 * s,y +  -15.478 * s,x +   40.746 * s,y +  -17.049 * s,x +   39.428 * s,y +  -18.432 * s, threshold);
			_vr.bezier8(x +   39.428 * s,y +  -18.432 * s,x +   38.109 * s,y +  -19.816 * s,x +   35.009 * s,y +  -21.258 * s,x +   30.126 * s,y +  -22.754 * s, threshold);
			_vr.bezier8(x +   30.126 * s,y +  -22.754 * s,x +   26.188 * s,y +  -23.960 * s,x +   23.290 * s,y +  -24.861 * s,x +   21.435 * s,y +  -25.463 * s, threshold);
			_vr.bezier8(x +   21.435 * s,y +  -25.463 * s,x +   19.579 * s,y +  -26.066 * s,x +   17.854 * s,y +  -26.953 * s,x +   16.259 * s,y +  -28.125 * s, threshold);
			_vr.bezier8(x +   16.259 * s,y +  -28.125 * s,x +   14.664 * s,y +  -29.296 * s,x +   13.452 * s,y +  -30.696 * s,x +   12.622 * s,y +  -32.324 * s, threshold);
			_vr.bezier8(x +   12.622 * s,y +  -32.324 * s,x +   11.791 * s,y +  -33.951 * s,x +   11.376 * s,y +  -35.774 * s,x +   11.376 * s,y +  -37.792 * s, threshold);
			_vr.bezier8(x +   11.376 * s,y +  -37.792 * s,x +   11.376 * s,y +  -42.187 * s,x +   13.297 * s,y +  -45.670 * s,x +   17.138 * s,y +  -48.241 * s, threshold);
			_vr.bezier8(x +   17.138 * s,y +  -48.241 * s,x +   20.979 * s,y +  -50.813 * s,x +   26.073 * s,y +  -52.099 * s,x +   32.421 * s,y +  -52.099 * s, threshold);
			_vr.bezier8(x +   32.421 * s,y +  -52.099 * s,x +   36.523 * s,y +  -52.099 * s,x +   41.080 * s,y +  -51.399 * s,x +   46.093 * s,y +  -49.999 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   44.384 * s);
			_setf(o + ( 1 << 2), y +  -43.603 * s);
			_setf(o + ( 2 << 2), x +   60.009 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 116:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   50.194 * s);
			_setf(o + ( 1 << 2), y +   -2.295 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   50.194 * s,y +   -2.295 * s,x +   45.083 * s,y +    0.049 * s,x +   40.054 * s,y +    1.221 * s,x +   35.106 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   35.106 * s,y +    1.221 * s,x +   26.024 * s,y +    1.221 * s,x +   21.484 * s,y +   -3.581 * s,x +   21.484 * s,y +  -13.183 * s, threshold);
			o = _posf(22);
			_setf(o + ( 0 << 2), x +   21.484 * s);
			_setf(o + ( 1 << 2), y +  -44.286 * s);
			_setf(o + ( 2 << 2), x +   11.718 * s);
			_setf(o + ( 3 << 2), y +  -44.286 * s);
			_setf(o + ( 4 << 2), x +   11.718 * s);
			_setf(o + ( 5 << 2), y +  -50.878 * s);
			_setf(o + ( 6 << 2), x +   21.484 * s);
			_setf(o + ( 7 << 2), y +  -50.878 * s);
			_setf(o + ( 8 << 2), x +   21.484 * s);
			_setf(o + ( 9 << 2), y +  -64.794 * s);
			_setf(o + (10 << 2), x +   28.905 * s);
			_setf(o + (11 << 2), y +  -64.794 * s);
			_setf(o + (12 << 2), x +   28.905 * s);
			_setf(o + (13 << 2), y +  -50.878 * s);
			_setf(o + (14 << 2), x +   46.190 * s);
			_setf(o + (15 << 2), y +  -50.878 * s);
			_setf(o + (16 << 2), x +   46.190 * s);
			_setf(o + (17 << 2), y +  -44.286 * s);
			_setf(o + (18 << 2), x +   28.905 * s);
			_setf(o + (19 << 2), y +  -44.286 * s);
			_setf(o + (20 << 2), x +   28.905 * s);
			_setf(o + (21 << 2), y +  -15.185 * s);
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
			_vr.bezier8(x +   28.905 * s,y +  -15.185 * s,x +   28.905 * s,y +  -12.093 * s,x +   29.589 * s,y +   -9.692 * s,x +   30.956 * s,y +   -7.983 * s, threshold);
			_vr.bezier8(x +   30.956 * s,y +   -7.983 * s,x +   32.323 * s,y +   -6.274 * s,x +   34.179 * s,y +   -5.420 * s,x +   36.522 * s,y +   -5.420 * s, threshold);
			_vr.bezier8(x +   36.522 * s,y +   -5.420 * s,x +   40.689 * s,y +   -5.420 * s,x +   44.807 * s,y +   -6.348 * s,x +   48.876 * s,y +   -8.203 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   50.194 * s);
			_setf(o + ( 1 << 2), y +   -2.295 * s);
			_setf(o + ( 2 << 2), x +   60.008 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 117:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   49.609 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   41.992 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   41.992 * s);
			_setf(o + ( 5 << 2), y +   -7.519 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   41.992 * s,y +   -7.519 * s,x +   36.523 * s,y +   -1.693 * s,x +   30.762 * s,y +    1.221 * s,x +   24.707 * s,y +    1.221 * s, threshold);
			_vr.bezier8(x +   24.707 * s,y +    1.221 * s,x +   15.169 * s,y +    1.221 * s,x +   10.401 * s,y +   -4.558 * s,x +   10.401 * s,y +  -16.113 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   10.401 * s);
			_setf(o + ( 1 << 2), y +  -50.878 * s);
			_setf(o + ( 2 << 2), x +   18.018 * s);
			_setf(o + ( 3 << 2), y +  -50.878 * s);
			_setf(o + ( 4 << 2), x +   18.018 * s);
			_setf(o + ( 5 << 2), y +  -18.310 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   18.018 * s,y +  -18.310 * s,x +   18.018 * s,y +  -13.981 * s,x +   18.701 * s,y +  -10.750 * s,x +   20.068 * s,y +   -8.618 * s, threshold);
			_vr.bezier8(x +   20.068 * s,y +   -8.618 * s,x +   21.436 * s,y +   -6.486 * s,x +   23.747 * s,y +   -5.420 * s,x +   27.002 * s,y +   -5.420 * s, threshold);
			_vr.bezier8(x +   27.002 * s,y +   -5.420 * s,x +   31.656 * s,y +   -5.420 * s,x +   36.653 * s,y +   -8.317 * s,x +   41.992 * s,y +  -14.111 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   41.992 * s);
			_setf(o + ( 1 << 2), y +  -50.878 * s);
			_setf(o + ( 2 << 2), x +   49.609 * s);
			_setf(o + ( 3 << 2), y +  -50.878 * s);
			_setf(o + ( 4 << 2), x +   49.609 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   60.009 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			
			case 118:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +   52.001 * s);
			_setf(o + ( 1 << 2), y +  -50.878 * s);
			_setf(o + ( 2 << 2), x +   32.715 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   25.781 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    6.592 * s);
			_setf(o + ( 7 << 2), y +  -50.878 * s);
			_setf(o + ( 8 << 2), x +   14.893 * s);
			_setf(o + ( 9 << 2), y +  -50.878 * s);
			_setf(o + (10 << 2), x +   29.297 * s);
			_setf(o + (11 << 2), y +  -10.400 * s);
			_setf(o + (12 << 2), x +   43.701 * s);
			_setf(o + (13 << 2), y +  -50.878 * s);
			_setf(o + (14 << 2), x +   52.001 * s);
			_setf(o + (15 << 2), y +  -50.878 * s);
			_setf(o + (16 << 2), x +   60.009 * s);
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
			
			o = _posf(16);
			_setf(o + ( 0 << 2), x +   55.712 * s);
			_setf(o + ( 1 << 2), y +  -50.878 * s);
			_setf(o + ( 2 << 2), x +   48.388 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   42.577 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   30.615 * s);
			_setf(o + ( 7 << 2), y +  -28.808 * s);
			_setf(o + ( 8 << 2), x +   18.603 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   12.793 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    5.615 * s);
			_setf(o + (13 << 2), y +  -50.878 * s);
			_setf(o + (14 << 2), x +   13.183 * s);
			_setf(o + (15 << 2), y +  -50.878 * s);
			o = _posb(8);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_setb(o +  6, 2);
			_setb(o +  7, 2);
			_vr.bezier8(x +   13.183 * s,y +  -50.878 * s,x +   15.885 * s,y +  -27.115 * s,x +   17.285 * s,y +  -14.648 * s,x +   17.383 * s,y +  -13.476 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   26.709 * s);
			_setf(o + ( 1 << 2), y +  -35.595 * s);
			_setf(o + ( 2 << 2), x +   34.521 * s);
			_setf(o + ( 3 << 2), y +  -35.595 * s);
			_setf(o + ( 4 << 2), x +   43.798 * s);
			_setf(o + ( 5 << 2), y +  -13.623 * s);
			_setf(o + ( 6 << 2), x +   47.900 * s);
			_setf(o + ( 7 << 2), y +  -50.878 * s);
			_setf(o + ( 8 << 2), x +   55.712 * s);
			_setf(o + ( 9 << 2), y +  -50.878 * s);
			_setf(o + (10 << 2), x +   60.009 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 120:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   51.513 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   42.919 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   29.296 * s);
			_setf(o + ( 5 << 2), y +  -19.922 * s);
			_setf(o + ( 6 << 2), x +   15.185 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    7.080 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   25.195 * s);
			_setf(o + (11 << 2), y +  -25.488 * s);
			_setf(o + (12 << 2), x +    7.080 * s);
			_setf(o + (13 << 2), y +  -50.878 * s);
			_setf(o + (14 << 2), x +   15.820 * s);
			_setf(o + (15 << 2), y +  -50.878 * s);
			_setf(o + (16 << 2), x +   29.492 * s);
			_setf(o + (17 << 2), y +  -31.103 * s);
			_setf(o + (18 << 2), x +   43.407 * s);
			_setf(o + (19 << 2), y +  -50.878 * s);
			_setf(o + (20 << 2), x +   51.513 * s);
			_setf(o + (21 << 2), y +  -50.878 * s);
			_setf(o + (22 << 2), x +   33.495 * s);
			_setf(o + (23 << 2), y +  -25.781 * s);
			_setf(o + (24 << 2), x +   51.513 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   52.001 * s);
			_setf(o + ( 1 << 2), y +  -50.878 * s);
			_setf(o + ( 2 << 2), x +   32.714 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   32.714 * s,y +       0. * s,x +   29.881 * s,y +    7.474 * s,x +   27.140 * s,y +   12.711 * s,x +   24.389 * s,y +   15.674 * s, threshold);
			_vr.bezier8(x +   24.389 * s,y +   15.674 * s,x +   21.639 * s,y +   18.636 * s,x +   18.506 * s,y +   20.117 * s,x +   14.990 * s,y +   20.117 * s, threshold);
			_vr.bezier8(x +   14.990 * s,y +   20.117 * s,x +   11.865 * s,y +   20.117 * s,x +    8.773 * s,y +   19.547 * s,x +    5.713 * s,y +   18.408 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    6.982 * s);
			_setf(o + ( 1 << 2), y +   12.305 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    6.982 * s,y +   12.305 * s,x +    9.456 * s,y +   13.086 * s,x +   11.670 * s,y +   13.476 * s,x +   13.623 * s,y +   13.476 * s, threshold);
			_vr.bezier8(x +   13.623 * s,y +   13.476 * s,x +   16.357 * s,y +   13.476 * s,x +   18.603 * s,y +   12.418 * s,x +   20.361 * s,y +   10.303 * s, threshold);
			_vr.bezier8(x +   20.361 * s,y +   10.303 * s,x +   22.119 * s,y +    8.187 * s,x +   23.893 * s,y +    4.720 * s,x +   25.683 * s,y +   -0.098 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +    6.592 * s);
			_setf(o + ( 1 << 2), y +  -50.878 * s);
			_setf(o + ( 2 << 2), x +   14.892 * s);
			_setf(o + ( 3 << 2), y +  -50.878 * s);
			_setf(o + ( 4 << 2), x +   29.296 * s);
			_setf(o + ( 5 << 2), y +  -10.303 * s);
			_setf(o + ( 6 << 2), x +   43.700 * s);
			_setf(o + ( 7 << 2), y +  -50.878 * s);
			_setf(o + ( 8 << 2), x +   52.001 * s);
			_setf(o + ( 9 << 2), y +  -50.878 * s);
			_setf(o + (10 << 2), x +   60.009 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 122:
			
			o = _posf(24);
			_setf(o + ( 0 << 2), x +   49.023 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    9.912 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    9.912 * s);
			_setf(o + ( 5 << 2), y +   -4.101 * s);
			_setf(o + ( 6 << 2), x +   38.915 * s);
			_setf(o + ( 7 << 2), y +  -44.189 * s);
			_setf(o + ( 8 << 2), x +   10.596 * s);
			_setf(o + ( 9 << 2), y +  -44.189 * s);
			_setf(o + (10 << 2), x +   10.596 * s);
			_setf(o + (11 << 2), y +  -50.878 * s);
			_setf(o + (12 << 2), x +   49.023 * s);
			_setf(o + (13 << 2), y +  -50.878 * s);
			_setf(o + (14 << 2), x +   49.023 * s);
			_setf(o + (15 << 2), y +  -47.118 * s);
			_setf(o + (16 << 2), x +   20.019 * s);
			_setf(o + (17 << 2), y +   -6.689 * s);
			_setf(o + (18 << 2), x +   49.023 * s);
			_setf(o + (19 << 2), y +   -6.689 * s);
			_setf(o + (20 << 2), x +   49.023 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   60.009 * s);
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
			_setf(o + ( 0 << 2), x +   44.677 * s);
			_setf(o + ( 1 << 2), y +   16.699 * s);
			_setf(o + ( 2 << 2), x +   40.819 * s);
			_setf(o + ( 3 << 2), y +   16.699 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_vr.bezier8(x +   40.819 * s,y +   16.699 * s,x +   36.132 * s,y +   16.699 * s,x +   32.755 * s,y +   15.438 * s,x +   30.688 * s,y +   12.915 * s, threshold);
			_vr.bezier8(x +   30.688 * s,y +   12.915 * s,x +   28.621 * s,y +   10.392 * s,x +   27.587 * s,y +    5.713 * s,x +   27.587 * s,y +   -1.123 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   27.587 * s);
			_setf(o + ( 1 << 2), y +   -5.810 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   27.587 * s,y +   -5.810 * s,x +   27.587 * s,y +  -11.897 * s,x +   26.790 * s,y +  -16.137 * s,x +   25.195 * s,y +  -18.530 * s, threshold);
			_vr.bezier8(x +   25.195 * s,y +  -18.530 * s,x +   23.600 * s,y +  -20.923 * s,x +   21.028 * s,y +  -22.119 * s,x +   17.480 * s,y +  -22.119 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   17.480 * s);
			_setf(o + ( 1 << 2), y +  -30.078 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   17.480 * s,y +  -30.078 * s,x +   21.028 * s,y +  -30.078 * s,x +   23.600 * s,y +  -31.274 * s,x +   25.195 * s,y +  -33.666 * s, threshold);
			_vr.bezier8(x +   25.195 * s,y +  -33.666 * s,x +   26.790 * s,y +  -36.059 * s,x +   27.587 * s,y +  -40.299 * s,x +   27.587 * s,y +  -46.386 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   27.587 * s);
			_setf(o + ( 1 << 2), y +  -51.122 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   27.587 * s,y +  -51.122 * s,x +   27.587 * s,y +  -57.925 * s,x +   28.621 * s,y +  -62.589 * s,x +   30.688 * s,y +  -65.111 * s, threshold);
			_vr.bezier8(x +   30.688 * s,y +  -65.111 * s,x +   32.755 * s,y +  -67.634 * s,x +   36.132 * s,y +  -68.895 * s,x +   40.819 * s,y +  -68.895 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   44.677 * s);
			_setf(o + ( 1 << 2), y +  -68.895 * s);
			_setf(o + ( 2 << 2), x +   44.677 * s);
			_setf(o + ( 3 << 2), y +  -62.499 * s);
			_setf(o + ( 4 << 2), x +   43.212 * s);
			_setf(o + ( 5 << 2), y +  -62.499 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   43.212 * s,y +  -62.499 * s,x +   40.185 * s,y +  -62.499 * s,x +   38.077 * s,y +  -61.848 * s,x +   36.889 * s,y +  -60.546 * s, threshold);
			_vr.bezier8(x +   36.889 * s,y +  -60.546 * s,x +   35.701 * s,y +  -59.244 * s,x +   35.107 * s,y +  -56.135 * s,x +   35.107 * s,y +  -51.220 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   35.107 * s);
			_setf(o + ( 1 << 2), y +  -48.095 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   35.107 * s,y +  -48.095 * s,x +   35.107 * s,y +  -41.357 * s,x +   34.325 * s,y +  -36.393 * s,x +   32.763 * s,y +  -33.203 * s, threshold);
			_vr.bezier8(x +   32.763 * s,y +  -33.203 * s,x +   31.200 * s,y +  -30.013 * s,x +   28.547 * s,y +  -27.653 * s,x +   24.804 * s,y +  -26.123 * s, threshold);
			_vr.bezier8(x +   24.804 * s,y +  -26.123 * s,x +   28.547 * s,y +  -24.560 * s,x +   31.200 * s,y +  -22.184 * s,x +   32.763 * s,y +  -18.994 * s, threshold);
			_vr.bezier8(x +   32.763 * s,y +  -18.994 * s,x +   34.325 * s,y +  -15.804 * s,x +   35.107 * s,y +  -10.840 * s,x +   35.107 * s,y +   -4.101 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   35.107 * s);
			_setf(o + ( 1 << 2), y +   -0.977 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   35.107 * s,y +   -0.977 * s,x +   35.107 * s,y +    3.939 * s,x +   35.701 * s,y +    7.047 * s,x +   36.889 * s,y +    8.349 * s, threshold);
			_vr.bezier8(x +   36.889 * s,y +    8.349 * s,x +   38.077 * s,y +    9.652 * s,x +   40.185 * s,y +   10.303 * s,x +   43.212 * s,y +   10.303 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   44.677 * s);
			_setf(o + ( 1 << 2), y +   10.303 * s);
			_setf(o + ( 2 << 2), x +   44.677 * s);
			_setf(o + ( 3 << 2), y +   16.699 * s);
			_setf(o + ( 4 << 2), x +   60.009 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 124:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   33.495 * s);
			_setf(o + ( 1 << 2), y +   18.701 * s);
			_setf(o + ( 2 << 2), x +   25.976 * s);
			_setf(o + ( 3 << 2), y +   18.701 * s);
			_setf(o + ( 4 << 2), x +   25.976 * s);
			_setf(o + ( 5 << 2), y +  -68.895 * s);
			_setf(o + ( 6 << 2), x +   33.495 * s);
			_setf(o + ( 7 << 2), y +  -68.895 * s);
			_setf(o + ( 8 << 2), x +   33.495 * s);
			_setf(o + ( 9 << 2), y +   18.701 * s);
			_setf(o + (10 << 2), x +   60.008 * s);
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
			_setf(o + ( 0 << 2), x +   42.285 * s);
			_setf(o + ( 1 << 2), y +  -22.119 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   42.285 * s,y +  -22.119 * s,x +   38.769 * s,y +  -22.119 * s,x +   36.206 * s,y +  -20.923 * s,x +   34.595 * s,y +  -18.530 * s, threshold);
			_vr.bezier8(x +   34.595 * s,y +  -18.530 * s,x +   32.983 * s,y +  -16.137 * s,x +   32.178 * s,y +  -11.897 * s,x +   32.178 * s,y +   -5.810 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   32.178 * s);
			_setf(o + ( 1 << 2), y +   -1.123 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   32.178 * s,y +   -1.123 * s,x +   32.178 * s,y +    5.713 * s,x +   31.152 * s,y +   10.392 * s,x +   29.101 * s,y +   12.915 * s, threshold);
			_vr.bezier8(x +   29.101 * s,y +   12.915 * s,x +   27.051 * s,y +   15.438 * s,x +   23.682 * s,y +   16.699 * s,x +   18.994 * s,y +   16.699 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   15.088 * s);
			_setf(o + ( 1 << 2), y +   16.699 * s);
			_setf(o + ( 2 << 2), x +   15.088 * s);
			_setf(o + ( 3 << 2), y +   10.303 * s);
			_setf(o + ( 4 << 2), x +   16.602 * s);
			_setf(o + ( 5 << 2), y +   10.303 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   16.602 * s,y +   10.303 * s,x +   19.629 * s,y +   10.303 * s,x +   21.737 * s,y +    9.652 * s,x +   22.925 * s,y +    8.349 * s, threshold);
			_vr.bezier8(x +   22.925 * s,y +    8.349 * s,x +   24.113 * s,y +    7.047 * s,x +   24.707 * s,y +    3.939 * s,x +   24.707 * s,y +   -0.977 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   24.707 * s);
			_setf(o + ( 1 << 2), y +   -4.101 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   24.707 * s,y +   -4.101 * s,x +   24.707 * s,y +  -10.840 * s,x +   25.488 * s,y +  -15.804 * s,x +   27.051 * s,y +  -18.994 * s, threshold);
			_vr.bezier8(x +   27.051 * s,y +  -18.994 * s,x +   28.613 * s,y +  -22.184 * s,x +   31.266 * s,y +  -24.560 * s,x +   35.010 * s,y +  -26.123 * s, threshold);
			_vr.bezier8(x +   35.010 * s,y +  -26.123 * s,x +   31.266 * s,y +  -27.653 * s,x +   28.613 * s,y +  -30.013 * s,x +   27.051 * s,y +  -33.203 * s, threshold);
			_vr.bezier8(x +   27.051 * s,y +  -33.203 * s,x +   25.488 * s,y +  -36.393 * s,x +   24.707 * s,y +  -41.357 * s,x +   24.707 * s,y +  -48.095 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   24.707 * s);
			_setf(o + ( 1 << 2), y +  -51.220 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   24.707 * s,y +  -51.220 * s,x +   24.707 * s,y +  -56.135 * s,x +   24.113 * s,y +  -59.244 * s,x +   22.925 * s,y +  -60.546 * s, threshold);
			_vr.bezier8(x +   22.925 * s,y +  -60.546 * s,x +   21.737 * s,y +  -61.848 * s,x +   19.629 * s,y +  -62.499 * s,x +   16.602 * s,y +  -62.499 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   15.088 * s);
			_setf(o + ( 1 << 2), y +  -62.499 * s);
			_setf(o + ( 2 << 2), x +   15.088 * s);
			_setf(o + ( 3 << 2), y +  -68.895 * s);
			_setf(o + ( 4 << 2), x +   18.994 * s);
			_setf(o + ( 5 << 2), y +  -68.895 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_vr.bezier8(x +   18.994 * s,y +  -68.895 * s,x +   23.682 * s,y +  -68.895 * s,x +   27.051 * s,y +  -67.634 * s,x +   29.101 * s,y +  -65.111 * s, threshold);
			_vr.bezier8(x +   29.101 * s,y +  -65.111 * s,x +   31.152 * s,y +  -62.589 * s,x +   32.178 * s,y +  -57.925 * s,x +   32.178 * s,y +  -51.122 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   32.178 * s);
			_setf(o + ( 1 << 2), y +  -46.386 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +   32.178 * s,y +  -46.386 * s,x +   32.178 * s,y +  -40.885 * s,x +   32.894 * s,y +  -36.791 * s,x +   34.326 * s,y +  -34.106 * s, threshold);
			_vr.bezier8(x +   34.326 * s,y +  -34.106 * s,x +   35.758 * s,y +  -31.420 * s,x +   38.411 * s,y +  -30.078 * s,x +   42.285 * s,y +  -30.078 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   42.285 * s);
			_setf(o + ( 1 << 2), y +  -22.119 * s);
			_setf(o + ( 2 << 2), x +   60.009 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 126:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   56.396 * s);
			_setf(o + ( 1 << 2), y +  -25.000 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_vr.bezier8(x +   56.396 * s,y +  -25.000 * s,x +   51.350 * s,y +  -20.735 * s,x +   46.484 * s,y +  -18.603 * s,x +   41.796 * s,y +  -18.603 * s, threshold);
			_vr.bezier8(x +   41.796 * s,y +  -18.603 * s,x +   39.062 * s,y +  -18.603 * s,x +   34.906 * s,y +  -19.897 * s,x +   29.297 * s,y +  -22.412 * s, threshold);
			_vr.bezier8(x +   29.297 * s,y +  -22.412 * s,x +   23.579 * s,y +  -24.975 * s,x +   19.499 * s,y +  -26.220 * s,x +   17.090 * s,y +  -26.220 * s, threshold);
			_vr.bezier8(x +   17.090 * s,y +  -26.220 * s,x +   13.281 * s,y +  -26.220 * s,x +    8.545 * s,y +  -23.974 * s,x +    2.881 * s,y +  -19.482 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    2.881 * s);
			_setf(o + ( 1 << 2), y +  -26.513 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_vr.bezier8(x +    2.881 * s,y +  -26.513 * s,x +    8.024 * s,y +  -30.778 * s,x +   13.005 * s,y +  -32.910 * s,x +   17.822 * s,y +  -32.910 * s, threshold);
			_vr.bezier8(x +   17.822 * s,y +  -32.910 * s,x +   20.622 * s,y +  -32.910 * s,x +   24.821 * s,y +  -31.640 * s,x +   30.420 * s,y +  -29.101 * s, threshold);
			_vr.bezier8(x +   30.420 * s,y +  -29.101 * s,x +   36.018 * s,y +  -26.562 * s,x +   40.006 * s,y +  -25.293 * s,x +   42.382 * s,y +  -25.293 * s, threshold);
			_vr.bezier8(x +   42.382 * s,y +  -25.293 * s,x +   46.191 * s,y +  -25.293 * s,x +   50.862 * s,y +  -27.522 * s,x +   56.396 * s,y +  -31.982 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   56.396 * s);
			_setf(o + ( 1 << 2), y +  -25.000 * s);
			_setf(o + ( 2 << 2), x +   60.009 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
		}
	}
	#end
}