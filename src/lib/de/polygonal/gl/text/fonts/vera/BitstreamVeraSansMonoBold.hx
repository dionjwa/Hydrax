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

class BitstreamVeraSansMonoBold extends de.polygonal.gl.text.MonospaceVectorFont
{
	public function new()
	{
		#if font_inline
		super(2048, 1901, -483, 1233, BOUNDS_TABLE);
		#else
		super(
		"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");
		#end
	}
	
	#if font_inline
	static var BOUNDS_TABLE:Array<Float> =
	[
		  33,     23.584,    -72.899,     36.621,          0,
		  34,     11.279,    -72.899,     48.779,    -45.800,
		  35,      0.098,    -71.776,     60.009,          0,
		  36,      8.008,    -75.975,     53.320,     14.697,
		  37,      1.611,    -69.921,     59.520,          0,
		  38,      1.806,    -74.218,     60.302,      1.416,
		  39,     23.779,    -72.899,     36.279,    -45.800,
		  40,     18.701,    -75.878,     45.117,     13.183,
		  41,     15.088,    -75.878,     41.503,     13.183,
		  42,      5.908,    -74.218,     54.101,    -27.783,
		  43,      3.223,    -58.202,     56.884,     -4.492,
		  44,     17.676,    -17.920,     37.793,     14.013,
		  45,     14.697,    -35.888,     45.507,    -21.679,
		  46,     21.923,    -17.920,     38.183,          0,
		  47,      5.517,    -72.899,     54.687,      9.277,
		  48,      6.006,    -74.218,     54.198,      1.416,
		  49,      9.179,    -72.899,     55.419,          0,
		  50,      5.615,    -74.218,     51.904,          0,
		  51,      6.104,    -74.218,     53.710,      1.416,
		  52,      4.981,    -72.899,     55.712,          0,
		  53,      6.982,    -72.899,     53.417,      1.416,
		  54,      6.396,    -74.120,     54.784,      1.514,
		  55,      6.592,    -72.899,     52.685,          0,
		  56,      6.299,    -74.218,     53.905,      1.416,
		  57,      5.420,    -73.583,     53.808,      1.904,
		  58,     21.923,    -51.904,     38.183,          0,
		  59,     18.115,    -51.904,     38.183,     14.013,
		  60,      4.297,    -57.421,     55.908,     -5.322,
		  61,      4.296,    -48.193,     55.907,    -14.404,
		  62,      4.297,    -57.421,     55.907,     -5.322,
		  63,     11.377,    -74.218,     52.001,          0,
		  64,      0.293,    -68.114,     56.591,     15.576,
		  65,      1.611,    -72.899,     58.593,          0,
		  66,      6.103,    -72.997,     56.591,          0,
		  67,      7.422,    -74.218,     52.783,      1.416,
		  68,      6.690,    -72.899,     55.712,          0,
		  69,      8.203,    -72.899,     53.612,          0,
		  70,      8.886,    -72.899,     54.296,          0,
		  71,      5.713,    -74.218,     55.175,      1.416,
		  72,      6.689,    -72.899,     53.515,          0,
		  73,      8.398,    -72.899,     51.806,          0,
		  74,      5.322,    -72.899,     49.218,      1.416,
		  75,      5.713,    -72.899,     59.814,          0,
		  76,     10.987,    -72.899,     56.201,          0,
		  77,      4.199,    -72.899,     56.005,          0,
		  78,      5.810,    -72.899,     54.296,          0,
		  79,      4.492,    -74.218,     55.712,      1.416,
		  80,      7.910,    -72.899,     56.005,          0,
		  81,      4.492,    -74.218,     55.712,     13.720,
		  82,      6.494,    -72.899,     60.204,          0,
		  83,      6.299,    -74.218,     54.199,      1.416,
		  84,      4.395,    -72.899,     55.810,          0,
		  85,      5.175,    -72.899,     54.979,      1.416,
		  86,      2.783,    -72.899,     57.421,          0,
		  87,          0,    -72.899,     60.204,          0,
		  88,      1.318,    -72.899,     58.886,          0,
		  89,      0.391,    -72.899,     59.813,          0,
		  90,      5.615,    -72.899,     56.689,          0,
		  91,     20.605,    -75.975,     45.410,     13.183,
		  92,      5.420,    -72.899,     54.687,      9.277,
		  93,     14.794,    -75.975,     39.599,     13.183,
		  94,      2.783,    -72.899,     57.421,    -45.702,
		  95,          0,     14.306,     60.204,     23.584,
		  96,      9.717,    -79.979,     37.304,    -61.620,
		  97,      4.590,    -56.005,     54.101,      1.416,
		  98,      7.324,    -75.975,     55.810,      1.416,
		  99,      8.203,    -56.103,     51.806,      1.416,
		 100,      4.395,    -75.975,     52.880,      1.416,
		 101,      4.492,    -56.005,     56.102,      1.416,
		 102,      8.496,    -75.975,     52.880,          0,
		 103,      4.785,    -56.103,     53.515,     20.703,
		 104,      8.398,    -75.975,     52.294,          0,
		 105,      6.982,    -81.298,     56.884,          0,
		 106,      6.982,    -81.298,     41.503,     20.703,
		 107,      8.496,    -75.975,     58.495,          0,
		 108,      4.395,    -75.975,     53.418,          0,
		 109,      4.003,    -56.005,     56.395,          0,
		 110,      8.398,    -56.005,     52.294,          0,
		 111,      4.785,    -56.005,     55.419,      1.416,
		 112,      7.324,    -56.005,     55.810,     20.800,
		 113,      4.395,    -56.005,     52.880,     20.800,
		 114,     14.209,    -56.005,     56.200,          0,
		 115,      8.399,    -56.005,     52.099,      1.416,
		 116,      5.420,    -70.214,     52.392,          0,
		 117,      7.812,    -54.687,     51.805,      1.416,
		 118,      3.906,    -54.687,     56.298,          0,
		 119,          0,    -54.687,     60.204,          0,
		 120,      2.686,    -54.687,     57.519,          0,
		 121,      2.881,    -54.687,     57.421,     20.703,
		 122,      7.910,    -54.687,     52.783,          0,
		 123,      8.594,    -75.975,     51.416,     16.308,
		 124,     24.512,    -76.415,     35.596,     23.584,
		 125,      8.789,    -75.975,     51.610,     16.308,
		 126,      4.297,    -39.599,     55.907,    -22.607
	];

	override function _draw(charCode:Int, x:Float, y:Float, s:Float, threshold:Float):Void
	{
		var o = 0;
		switch (charCode)
		{			
			case 33:
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +   23.584 * s);
			_setf(o + ( 1 << 2), y +  -13.818 * s);
			_setf(o + ( 2 << 2), x +   36.621 * s);
			_setf(o + ( 3 << 2), y +  -13.818 * s);
			_setf(o + ( 4 << 2), x +   36.621 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   23.584 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   23.584 * s);
			_setf(o + ( 9 << 2), y +  -13.818 * s);
			_setf(o + (10 << 2), x +   23.584 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   36.621 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   36.621 * s);
			_setf(o + (15 << 2), y +  -40.917 * s);
			_setf(o + (16 << 2), x +   35.009 * s);
			_setf(o + (17 << 2), y +  -23.486 * s);
			_setf(o + (18 << 2), x +   25.293 * s);
			_setf(o + (19 << 2), y +  -23.486 * s);
			_setf(o + (20 << 2), x +   23.584 * s);
			_setf(o + (21 << 2), y +  -40.917 * s);
			_setf(o + (22 << 2), x +   23.584 * s);
			_setf(o + (23 << 2), y +  -72.899 * s);
			_setf(o + (24 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +   48.779 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   48.779 * s);
			_setf(o + ( 3 << 2), y +  -45.800 * s);
			_setf(o + ( 4 << 2), x +   36.279 * s);
			_setf(o + ( 5 << 2), y +  -45.800 * s);
			_setf(o + ( 6 << 2), x +   36.279 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   48.779 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   23.779 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   23.779 * s);
			_setf(o + (13 << 2), y +  -45.800 * s);
			_setf(o + (14 << 2), x +   11.279 * s);
			_setf(o + (15 << 2), y +  -45.800 * s);
			_setf(o + (16 << 2), x +   11.279 * s);
			_setf(o + (17 << 2), y +  -72.899 * s);
			_setf(o + (18 << 2), x +   23.779 * s);
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
			_setf(o + ( 0 << 2), x +   34.521 * s);
			_setf(o + ( 1 << 2), y +  -71.776 * s);
			_setf(o + ( 2 << 2), x +   29.883 * s);
			_setf(o + ( 3 << 2), y +  -53.515 * s);
			_setf(o + ( 4 << 2), x +   39.795 * s);
			_setf(o + ( 5 << 2), y +  -53.515 * s);
			_setf(o + ( 6 << 2), x +   44.384 * s);
			_setf(o + ( 7 << 2), y +  -71.776 * s);
			_setf(o + ( 8 << 2), x +   55.322 * s);
			_setf(o + ( 9 << 2), y +  -71.776 * s);
			_setf(o + (10 << 2), x +   50.585 * s);
			_setf(o + (11 << 2), y +  -53.515 * s);
			_setf(o + (12 << 2), x +   60.009 * s);
			_setf(o + (13 << 2), y +  -53.515 * s);
			_setf(o + (14 << 2), x +   60.009 * s);
			_setf(o + (15 << 2), y +  -43.017 * s);
			_setf(o + (16 << 2), x +   47.998 * s);
			_setf(o + (17 << 2), y +  -43.017 * s);
			_setf(o + (18 << 2), x +   44.384 * s);
			_setf(o + (19 << 2), y +  -28.710 * s);
			_setf(o + (20 << 2), x +   54.394 * s);
			_setf(o + (21 << 2), y +  -28.710 * s);
			_setf(o + (22 << 2), x +   54.394 * s);
			_setf(o + (23 << 2), y +  -18.213 * s);
			_setf(o + (24 << 2), x +   41.797 * s);
			_setf(o + (25 << 2), y +  -18.213 * s);
			_setf(o + (26 << 2), x +   37.207 * s);
			_setf(o + (27 << 2), y +       0. * s);
			_setf(o + (28 << 2), x +   26.416 * s);
			_setf(o + (29 << 2), y +       0. * s);
			_setf(o + (30 << 2), x +   31.006 * s);
			_setf(o + (31 << 2), y +  -18.213 * s);
			_setf(o + (32 << 2), x +   20.996 * s);
			_setf(o + (33 << 2), y +  -18.213 * s);
			_setf(o + (34 << 2), x +   16.406 * s);
			_setf(o + (35 << 2), y +       0. * s);
			_setf(o + (36 << 2), x +    5.615 * s);
			_setf(o + (37 << 2), y +       0. * s);
			_setf(o + (38 << 2), x +   10.205 * s);
			_setf(o + (39 << 2), y +  -18.213 * s);
			_setf(o + (40 << 2), x +    0.098 * s);
			_setf(o + (41 << 2), y +  -18.213 * s);
			_setf(o + (42 << 2), x +    0.098 * s);
			_setf(o + (43 << 2), y +  -28.710 * s);
			_setf(o + (44 << 2), x +   12.793 * s);
			_setf(o + (45 << 2), y +  -28.710 * s);
			_setf(o + (46 << 2), x +   16.406 * s);
			_setf(o + (47 << 2), y +  -43.017 * s);
			_setf(o + (48 << 2), x +    5.713 * s);
			_setf(o + (49 << 2), y +  -43.017 * s);
			_setf(o + (50 << 2), x +    5.713 * s);
			_setf(o + (51 << 2), y +  -53.515 * s);
			_setf(o + (52 << 2), x +   19.092 * s);
			_setf(o + (53 << 2), y +  -53.515 * s);
			_setf(o + (54 << 2), x +   23.682 * s);
			_setf(o + (55 << 2), y +  -71.776 * s);
			_setf(o + (56 << 2), x +   34.521 * s);
			_setf(o + (57 << 2), y +  -71.776 * s);
			_setf(o + (58 << 2), x +   37.207 * s);
			_setf(o + (59 << 2), y +  -43.017 * s);
			_setf(o + (60 << 2), x +   27.197 * s);
			_setf(o + (61 << 2), y +  -43.017 * s);
			_setf(o + (62 << 2), x +   23.584 * s);
			_setf(o + (63 << 2), y +  -28.710 * s);
			_setf(o + (64 << 2), x +   33.594 * s);
			_setf(o + (65 << 2), y +  -28.710 * s);
			_setf(o + (66 << 2), x +   37.207 * s);
			_setf(o + (67 << 2), y +  -43.017 * s);
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
			_setf(o + ( 0 << 2), x +   33.887 * s);
			_setf(o + ( 1 << 2), y +  -25.781 * s);
			_setf(o + ( 2 << 2), x +   33.887 * s);
			_setf(o + ( 3 << 2), y +  -11.035 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   33.887 * s,y +  -11.035 * s,x +   35.937 * s,y +  -11.328 * s,x +   37.532 * s,y +  -12.117 * s,x +   38.672 * s,y +  -13.403 * s, threshold);
			_bez(x +   38.672 * s,y +  -13.403 * s,x +   39.811 * s,y +  -14.689 * s,x +   40.381 * s,y +  -16.325 * s,x +   40.381 * s,y +  -18.310 * s, threshold);
			_bez(x +   40.381 * s,y +  -18.310 * s,x +   40.381 * s,y +  -20.328 * s,x +   39.819 * s,y +  -21.980 * s,x +   38.696 * s,y +  -23.266 * s, threshold);
			_bez(x +   38.696 * s,y +  -23.266 * s,x +   37.573 * s,y +  -24.552 * s,x +   35.970 * s,y +  -25.390 * s,x +   33.887 * s,y +  -25.781 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   27.002 * s);
			_setf(o + ( 1 << 2), y +  -39.892 * s);
			_setf(o + ( 2 << 2), x +   27.002 * s);
			_setf(o + ( 3 << 2), y +  -53.710 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   27.002 * s,y +  -53.710 * s,x +   24.984 * s,y +  -53.450 * s,x +   23.462 * s,y +  -52.774 * s,x +   22.437 * s,y +  -51.684 * s, threshold);
			_bez(x +   22.437 * s,y +  -51.684 * s,x +   21.411 * s,y +  -50.593 * s,x +   20.899 * s,y +  -49.104 * s,x +   20.899 * s,y +  -47.216 * s, threshold);
			_bez(x +   20.899 * s,y +  -47.216 * s,x +   20.899 * s,y +  -45.361 * s,x +   21.411 * s,y +  -43.814 * s,x +   22.437 * s,y +  -42.577 * s, threshold);
			_bez(x +   22.437 * s,y +  -42.577 * s,x +   23.462 * s,y +  -41.340 * s,x +   24.984 * s,y +  -40.445 * s,x +   27.002 * s,y +  -39.892 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   33.887 * s);
			_setf(o + ( 1 << 2), y +   14.697 * s);
			_setf(o + ( 2 << 2), x +   27.002 * s);
			_setf(o + ( 3 << 2), y +   14.697 * s);
			_setf(o + ( 4 << 2), x +   26.953 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   26.953 * s,y +       0. * s,x +   24.121 * s,y +   -0.098 * s,x +   21.159 * s,y +   -0.521 * s,x +   18.067 * s,y +   -1.270 * s, threshold);
			_bez(x +   18.067 * s,y +   -1.270 * s,x +   14.974 * s,y +   -2.018 * s,x +   11.752 * s,y +   -3.092 * s,x +    8.399 * s,y +   -4.492 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    8.399 * s);
			_setf(o + ( 1 << 2), y +  -17.285 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    8.399 * s,y +  -17.285 * s,x +   11.752 * s,y +  -15.299 * s,x +   14.999 * s,y +  -13.769 * s,x +   18.140 * s,y +  -12.695 * s, threshold);
			_bez(x +   18.140 * s,y +  -12.695 * s,x +   21.281 * s,y +  -11.621 * s,x +   24.235 * s,y +  -11.068 * s,x +   27.002 * s,y +  -11.035 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   27.002 * s);
			_setf(o + ( 1 << 2), y +  -27.099 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   27.002 * s,y +  -27.099 * s,x +   20.589 * s,y +  -28.369 * s,x +   15.821 * s,y +  -30.558 * s,x +   12.696 * s,y +  -33.666 * s, threshold);
			_bez(x +   12.696 * s,y +  -33.666 * s,x +    9.571 * s,y +  -36.775 * s,x +    8.008 * s,y +  -40.885 * s,x +    8.008 * s,y +  -45.995 * s, threshold);
			_bez(x +    8.008 * s,y +  -45.995 * s,x +    8.008 * s,y +  -51.431 * s,x +    9.668 * s,y +  -55.761 * s,x +   12.989 * s,y +  -58.983 * s, threshold);
			_bez(x +   12.989 * s,y +  -58.983 * s,x +   16.309 * s,y +  -62.206 * s,x +   20.980 * s,y +  -64.013 * s,x +   27.002 * s,y +  -64.403 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   27.002 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   33.887 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   33.935 * s);
			_setf(o + ( 5 << 2), y +  -64.403 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   33.935 * s,y +  -64.403 * s,x +   36.247 * s,y +  -64.273 * s,x +   38.647 * s,y +  -63.980 * s,x +   41.137 * s,y +  -63.524 * s, threshold);
			_bez(x +   41.137 * s,y +  -63.524 * s,x +   43.628 * s,y +  -63.069 * s,x +   46.175 * s,y +  -62.434 * s,x +   48.779 * s,y +  -61.620 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   48.779 * s);
			_setf(o + ( 1 << 2), y +  -49.120 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   48.779 * s,y +  -49.120 * s,x +   46.761 * s,y +  -50.422 * s,x +   44.515 * s,y +  -51.464 * s,x +   42.041 * s,y +  -52.245 * s, threshold);
			_bez(x +   42.041 * s,y +  -52.245 * s,x +   39.567 * s,y +  -53.027 * s,x +   36.849 * s,y +  -53.515 * s,x +   33.887 * s,y +  -53.710 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   33.887 * s);
			_setf(o + ( 1 << 2), y +  -38.720 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   33.887 * s,y +  -38.720 * s,x +   40.299 * s,y +  -37.711 * s,x +   45.141 * s,y +  -35.522 * s,x +   48.413 * s,y +  -32.153 * s, threshold);
			_bez(x +   48.413 * s,y +  -32.153 * s,x +   51.684 * s,y +  -28.784 * s,x +   53.320 * s,y +  -24.300 * s,x +   53.320 * s,y +  -18.701 * s, threshold);
			_bez(x +   53.320 * s,y +  -18.701 * s,x +   53.320 * s,y +  -13.363 * s,x +   51.554 * s,y +   -8.984 * s,x +   48.022 * s,y +   -5.566 * s, threshold);
			_bez(x +   48.022 * s,y +   -5.566 * s,x +   44.490 * s,y +   -2.148 * s,x +   39.795 * s,y +   -0.293 * s,x +   33.935 * s,y +       0. * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   33.887 * s);
			_setf(o + ( 1 << 2), y +   14.697 * s);
			_setf(o + ( 2 << 2), x +   60.205 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 37:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    1.611 * s);
			_setf(o + ( 1 << 2), y +  -54.296 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +    1.611 * s,y +  -54.296 * s,x +    1.611 * s,y +  -58.658 * s,x +    3.125 * s,y +  -62.353 * s,x +    6.152 * s,y +  -65.380 * s, threshold);
			_bez(x +    6.152 * s,y +  -65.380 * s,x +    9.179 * s,y +  -68.407 * s,x +   12.857 * s,y +  -69.921 * s,x +   17.187 * s,y +  -69.921 * s, threshold);
			_bez(x +   17.187 * s,y +  -69.921 * s,x +   21.516 * s,y +  -69.921 * s,x +   25.203 * s,y +  -68.399 * s,x +   28.246 * s,y +  -65.355 * s, threshold);
			_bez(x +   28.246 * s,y +  -65.355 * s,x +   31.290 * s,y +  -62.312 * s,x +   32.812 * s,y +  -58.625 * s,x +   32.812 * s,y +  -54.296 * s, threshold);
			_bez(x +   32.812 * s,y +  -54.296 * s,x +   32.812 * s,y +  -49.967 * s,x +   31.290 * s,y +  -46.288 * s,x +   28.246 * s,y +  -43.261 * s, threshold);
			_bez(x +   28.246 * s,y +  -43.261 * s,x +   25.203 * s,y +  -40.234 * s,x +   21.516 * s,y +  -38.720 * s,x +   17.187 * s,y +  -38.720 * s, threshold);
			_bez(x +   17.187 * s,y +  -38.720 * s,x +   12.857 * s,y +  -38.720 * s,x +    9.179 * s,y +  -40.226 * s,x +    6.152 * s,y +  -43.237 * s, threshold);
			_bez(x +    6.152 * s,y +  -43.237 * s,x +    3.125 * s,y +  -46.248 * s,x +    1.611 * s,y +  -49.934 * s,x +    1.611 * s,y +  -54.296 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   17.187 * s);
			_setf(o + ( 1 << 2), y +  -60.985 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   17.187 * s,y +  -60.985 * s,x +   15.331 * s,y +  -60.985 * s,x +   13.753 * s,y +  -60.342 * s,x +   12.451 * s,y +  -59.057 * s, threshold);
			_bez(x +   12.451 * s,y +  -59.057 * s,x +   11.148 * s,y +  -57.771 * s,x +   10.497 * s,y +  -56.184 * s,x +   10.497 * s,y +  -54.296 * s, threshold);
			_bez(x +   10.497 * s,y +  -54.296 * s,x +   10.497 * s,y +  -52.408 * s,x +   11.148 * s,y +  -50.821 * s,x +   12.451 * s,y +  -49.535 * s, threshold);
			_bez(x +   12.451 * s,y +  -49.535 * s,x +   13.753 * s,y +  -48.250 * s,x +   15.331 * s,y +  -47.607 * s,x +   17.187 * s,y +  -47.607 * s, threshold);
			_bez(x +   17.187 * s,y +  -47.607 * s,x +   19.075 * s,y +  -47.607 * s,x +   20.662 * s,y +  -48.250 * s,x +   21.947 * s,y +  -49.535 * s, threshold);
			_bez(x +   21.947 * s,y +  -49.535 * s,x +   23.233 * s,y +  -50.821 * s,x +   23.876 * s,y +  -52.408 * s,x +   23.876 * s,y +  -54.296 * s, threshold);
			_bez(x +   23.876 * s,y +  -54.296 * s,x +   23.876 * s,y +  -56.152 * s,x +   23.225 * s,y +  -57.730 * s,x +   21.923 * s,y +  -59.032 * s, threshold);
			_bez(x +   21.923 * s,y +  -59.032 * s,x +   20.621 * s,y +  -60.334 * s,x +   19.042 * s,y +  -60.985 * s,x +   17.187 * s,y +  -60.985 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +    4.199 * s);
			_setf(o + ( 1 << 2), y +  -27.392 * s);
			_setf(o + ( 2 << 2), x +   55.077 * s);
			_setf(o + ( 3 << 2), y +  -47.802 * s);
			_setf(o + ( 4 << 2), x +   57.079 * s);
			_setf(o + ( 5 << 2), y +  -43.115 * s);
			_setf(o + ( 6 << 2), x +    5.908 * s);
			_setf(o + ( 7 << 2), y +  -22.705 * s);
			_setf(o + ( 8 << 2), x +    4.199 * s);
			_setf(o + ( 9 << 2), y +  -27.392 * s);
			_setf(o + (10 << 2), x +   28.319 * s);
			_setf(o + (11 << 2), y +  -15.576 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			_bez(x +   28.319 * s,y +  -15.576 * s,x +   28.319 * s,y +  -19.938 * s,x +   29.825 * s,y +  -23.632 * s,x +   32.836 * s,y +  -26.660 * s, threshold);
			_bez(x +   32.836 * s,y +  -26.660 * s,x +   35.847 * s,y +  -29.687 * s,x +   39.533 * s,y +  -31.201 * s,x +   43.895 * s,y +  -31.201 * s, threshold);
			_bez(x +   43.895 * s,y +  -31.201 * s,x +   48.192 * s,y +  -31.201 * s,x +   51.871 * s,y +  -29.679 * s,x +   54.930 * s,y +  -26.635 * s, threshold);
			_bez(x +   54.930 * s,y +  -26.635 * s,x +   57.990 * s,y +  -23.592 * s,x +   59.520 * s,y +  -19.905 * s,x +   59.520 * s,y +  -15.576 * s, threshold);
			_bez(x +   59.520 * s,y +  -15.576 * s,x +   59.520 * s,y +  -11.279 * s,x +   57.990 * s,y +   -7.609 * s,x +   54.930 * s,y +   -4.565 * s, threshold);
			_bez(x +   54.930 * s,y +   -4.565 * s,x +   51.871 * s,y +   -1.522 * s,x +   48.192 * s,y +       0. * s,x +   43.895 * s,y +       0. * s, threshold);
			_bez(x +   43.895 * s,y +       0. * s,x +   39.533 * s,y +       0. * s,x +   35.847 * s,y +   -1.505 * s,x +   32.836 * s,y +   -4.517 * s, threshold);
			_bez(x +   32.836 * s,y +   -4.517 * s,x +   29.825 * s,y +   -7.528 * s,x +   28.319 * s,y +  -11.214 * s,x +   28.319 * s,y +  -15.576 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   43.798 * s);
			_setf(o + ( 1 << 2), y +  -22.314 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   43.798 * s,y +  -22.314 * s,x +   41.975 * s,y +  -22.314 * s,x +   40.421 * s,y +  -21.663 * s,x +   39.135 * s,y +  -20.361 * s, threshold);
			_bez(x +   39.135 * s,y +  -20.361 * s,x +   37.849 * s,y +  -19.059 * s,x +   37.206 * s,y +  -17.464 * s,x +   37.206 * s,y +  -15.576 * s, threshold);
			_bez(x +   37.206 * s,y +  -15.576 * s,x +   37.206 * s,y +  -13.688 * s,x +   37.841 * s,y +  -12.101 * s,x +   39.110 * s,y +  -10.815 * s, threshold);
			_bez(x +   39.110 * s,y +  -10.815 * s,x +   40.380 * s,y +   -9.529 * s,x +   41.942 * s,y +   -8.887 * s,x +   43.798 * s,y +   -8.887 * s, threshold);
			_bez(x +   43.798 * s,y +   -8.887 * s,x +   45.686 * s,y +   -8.887 * s,x +   47.289 * s,y +   -9.538 * s,x +   48.607 * s,y +  -10.840 * s, threshold);
			_bez(x +   48.607 * s,y +  -10.840 * s,x +   49.926 * s,y +  -12.142 * s,x +   50.585 * s,y +  -13.720 * s,x +   50.585 * s,y +  -15.576 * s, threshold);
			_bez(x +   50.585 * s,y +  -15.576 * s,x +   50.585 * s,y +  -17.431 * s,x +   49.917 * s,y +  -19.018 * s,x +   48.583 * s,y +  -20.337 * s, threshold);
			_bez(x +   48.583 * s,y +  -20.337 * s,x +   47.248 * s,y +  -21.655 * s,x +   45.653 * s,y +  -22.314 * s,x +   43.798 * s,y +  -22.314 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 38:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   42.480 * s);
			_setf(o + ( 1 << 2), y +   -3.516 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   42.480 * s,y +   -3.516 * s,x +   40.038 * s,y +   -1.888 * s,x +   37.442 * s,y +   -0.659 * s,x +   34.692 * s,y +    0.171 * s, threshold);
			_bez(x +   34.692 * s,y +    0.171 * s,x +   31.941 * s,y +    1.001 * s,x +   29.150 * s,y +    1.416 * s,x +   26.318 * s,y +    1.416 * s, threshold);
			_bez(x +   26.318 * s,y +    1.416 * s,x +   19.026 * s,y +    1.416 * s,x +   13.118 * s,y +   -0.716 * s,x +    8.593 * s,y +   -4.980 * s, threshold);
			_bez(x +    8.593 * s,y +   -4.980 * s,x +    4.069 * s,y +   -9.245 * s,x +    1.806 * s,y +  -14.779 * s,x +    1.806 * s,y +  -21.582 * s, threshold);
			_bez(x +    1.806 * s,y +  -21.582 * s,x +    1.806 * s,y +  -26.302 * s,x +    2.954 * s,y +  -30.598 * s,x +    5.249 * s,y +  -34.472 * s, threshold);
			_bez(x +    5.249 * s,y +  -34.472 * s,x +    7.544 * s,y +  -38.346 * s,x +   10.953 * s,y +  -41.715 * s,x +   15.478 * s,y +  -44.579 * s, threshold);
			_bez(x +   15.478 * s,y +  -44.579 * s,x +   13.850 * s,y +  -47.118 * s,x +   12.646 * s,y +  -49.470 * s,x +   11.865 * s,y +  -51.635 * s, threshold);
			_bez(x +   11.865 * s,y +  -51.635 * s,x +   11.084 * s,y +  -53.800 * s,x +   10.693 * s,y +  -55.859 * s,x +   10.693 * s,y +  -57.812 * s, threshold);
			_bez(x +   10.693 * s,y +  -57.812 * s,x +   10.693 * s,y +  -63.085 * s,x +   12.467 * s,y +  -67.138 * s,x +   16.015 * s,y +  -69.970 * s, threshold);
			_bez(x +   16.015 * s,y +  -69.970 * s,x +   19.563 * s,y +  -72.802 * s,x +   24.690 * s,y +  -74.218 * s,x +   31.396 * s,y +  -74.218 * s, threshold);
			_bez(x +   31.396 * s,y +  -74.218 * s,x +   33.772 * s,y +  -74.218 * s,x +   36.099 * s,y +  -74.039 * s,x +   38.378 * s,y +  -73.681 * s, threshold);
			_bez(x +   38.378 * s,y +  -73.681 * s,x +   40.657 * s,y +  -73.322 * s,x +   42.903 * s,y +  -72.802 * s,x +   45.116 * s,y +  -72.118 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   45.116 * s);
			_setf(o + ( 1 << 2), y +  -59.618 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   45.116 * s,y +  -59.618 * s,x +   43.033 * s,y +  -60.790 * s,x +   40.925 * s,y +  -61.677 * s,x +   38.793 * s,y +  -62.279 * s, threshold);
			_bez(x +   38.793 * s,y +  -62.279 * s,x +   36.661 * s,y +  -62.882 * s,x +   34.537 * s,y +  -63.183 * s,x +   32.421 * s,y +  -63.183 * s, threshold);
			_bez(x +   32.421 * s,y +  -63.183 * s,x +   29.817 * s,y +  -63.183 * s,x +   27.848 * s,y +  -62.727 * s,x +   26.513 * s,y +  -61.815 * s, threshold);
			_bez(x +   26.513 * s,y +  -61.815 * s,x +   25.178 * s,y +  -60.904 * s,x +   24.511 * s,y +  -59.569 * s,x +   24.511 * s,y +  -57.812 * s, threshold);
			_bez(x +   24.511 * s,y +  -57.812 * s,x +   24.511 * s,y +  -56.640 * s,x +   25.007 * s,y +  -55.028 * s,x +   26.000 * s,y +  -52.978 * s, threshold);
			_bez(x +   26.000 * s,y +  -52.978 * s,x +   26.993 * s,y +  -50.927 * s,x +   28.630 * s,y +  -48.264 * s,x +   30.810 * s,y +  -44.921 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   46.093 * s);
			_setf(o + ( 1 << 2), y +  -21.484 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   46.093 * s,y +  -21.484 * s,x +   46.776 * s,y +  -22.721 * s,x +   47.297 * s,y +  -24.137 * s,x +   47.655 * s,y +  -25.732 * s, threshold);
			_bez(x +   47.655 * s,y +  -25.732 * s,x +   48.013 * s,y +  -27.327 * s,x +   48.192 * s,y +  -29.052 * s,x +   48.192 * s,y +  -30.908 * s, threshold);
			_bez(x +   48.192 * s,y +  -30.908 * s,x +   48.192 * s,y +  -31.884 * s,x +   48.160 * s,y +  -32.836 * s,x +   48.095 * s,y +  -33.764 * s, threshold);
			_bez(x +   48.095 * s,y +  -33.764 * s,x +   48.030 * s,y +  -34.692 * s,x +   47.932 * s,y +  -35.563 * s,x +   47.802 * s,y +  -36.376 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   59.276 * s);
			_setf(o + ( 1 << 2), y +  -36.376 * s);
			_setf(o + ( 2 << 2), x +   59.276 * s);
			_setf(o + ( 3 << 2), y +  -33.886 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   59.276 * s,y +  -33.886 * s,x +   59.276 * s,y +  -29.166 * s,x +   58.723 * s,y +  -25.040 * s,x +   57.616 * s,y +  -21.508 * s, threshold);
			_bez(x +   57.616 * s,y +  -21.508 * s,x +   56.509 * s,y +  -17.977 * s,x +   54.768 * s,y +  -14.811 * s,x +   52.392 * s,y +  -12.012 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   60.302 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   44.823 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   42.480 * s);
			_setf(o + ( 5 << 2), y +   -3.516 * s);
			_setf(o + ( 6 << 2), x +   21.484 * s);
			_setf(o + ( 7 << 2), y +  -35.693 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			_bez(x +   21.484 * s,y +  -35.693 * s,x +   19.335 * s,y +  -34.293 * s,x +   17.716 * s,y +  -32.625 * s,x +   16.625 * s,y +  -30.688 * s, threshold);
			_bez(x +   16.625 * s,y +  -30.688 * s,x +   15.535 * s,y +  -28.751 * s,x +   14.990 * s,y +  -26.595 * s,x +   14.990 * s,y +  -24.218 * s, threshold);
			_bez(x +   14.990 * s,y +  -24.218 * s,x +   14.990 * s,y +  -20.247 * s,x +   16.267 * s,y +  -16.902 * s,x +   18.823 * s,y +  -14.184 * s, threshold);
			_bez(x +   18.823 * s,y +  -14.184 * s,x +   21.378 * s,y +  -11.466 * s,x +   24.511 * s,y +  -10.107 * s,x +   28.222 * s,y +  -10.107 * s, threshold);
			_bez(x +   28.222 * s,y +  -10.107 * s,x +   29.133 * s,y +  -10.107 * s,x +   30.069 * s,y +  -10.213 * s,x +   31.030 * s,y +  -10.425 * s, threshold);
			_bez(x +   31.030 * s,y +  -10.425 * s,x +   31.990 * s,y +  -10.636 * s,x +   32.927 * s,y +  -10.934 * s,x +   33.837 * s,y +  -11.328 * s, threshold);
			_bez(x +   33.837 * s,y +  -11.328 * s,x +   33.904 * s,y +  -11.357 * s,x +   34.031 * s,y +  -11.428 * s,x +   34.228 * s,y +  -11.523 * s, threshold);
			_bez(x +   34.228 * s,y +  -11.523 * s,x +   35.171 * s,y +  -11.981 * s,x +   35.937 * s,y +  -12.402 * s,x +   36.523 * s,y +  -12.793 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   21.484 * s);
			_setf(o + ( 1 << 2), y +  -35.693 * s);
			_setf(o + ( 2 << 2), x +   60.204 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 39:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   36.279 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   36.279 * s);
			_setf(o + ( 3 << 2), y +  -45.800 * s);
			_setf(o + ( 4 << 2), x +   23.779 * s);
			_setf(o + ( 5 << 2), y +  -45.800 * s);
			_setf(o + ( 6 << 2), x +   23.779 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   36.279 * s);
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
			_setf(o + ( 0 << 2), x +   45.117 * s);
			_setf(o + ( 1 << 2), y +  -75.878 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   45.117 * s,y +  -75.878 * s,x +   40.820 * s,y +  -68.098 * s,x +   37.630 * s,y +  -60.562 * s,x +   35.546 * s,y +  -53.271 * s, threshold);
			_bez(x +   35.546 * s,y +  -53.271 * s,x +   33.463 * s,y +  -45.979 * s,x +   32.421 * s,y +  -38.687 * s,x +   32.421 * s,y +  -31.396 * s, threshold);
			_bez(x +   32.421 * s,y +  -31.396 * s,x +   32.421 * s,y +  -24.169 * s,x +   33.463 * s,y +  -16.886 * s,x +   35.546 * s,y +   -9.546 * s, threshold);
			_bez(x +   35.546 * s,y +   -9.546 * s,x +   37.630 * s,y +   -2.205 * s,x +   40.820 * s,y +    5.371 * s,x +   45.117 * s,y +   13.183 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   33.984 * s);
			_setf(o + ( 1 << 2), y +   13.183 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   33.984 * s,y +   13.183 * s,x +   28.808 * s,y +    5.664 * s,x +   24.967 * s,y +   -1.750 * s,x +   22.461 * s,y +   -9.057 * s, threshold);
			_bez(x +   22.461 * s,y +   -9.057 * s,x +   19.954 * s,y +  -16.365 * s,x +   18.701 * s,y +  -23.812 * s,x +   18.701 * s,y +  -31.396 * s, threshold);
			_bez(x +   18.701 * s,y +  -31.396 * s,x +   18.701 * s,y +  -38.948 * s,x +   19.962 * s,y +  -46.394 * s,x +   22.485 * s,y +  -53.735 * s, threshold);
			_bez(x +   22.485 * s,y +  -53.735 * s,x +   25.008 * s,y +  -61.075 * s,x +   28.841 * s,y +  -68.456 * s,x +   33.984 * s,y +  -75.878 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   45.117 * s);
			_setf(o + ( 1 << 2), y +  -75.878 * s);
			_setf(o + ( 2 << 2), x +   60.204 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 41:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   15.088 * s);
			_setf(o + ( 1 << 2), y +  -75.878 * s);
			_setf(o + ( 2 << 2), x +   26.220 * s);
			_setf(o + ( 3 << 2), y +  -75.878 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   26.220 * s,y +  -75.878 * s,x +   31.363 * s,y +  -68.456 * s,x +   35.196 * s,y +  -61.075 * s,x +   37.719 * s,y +  -53.735 * s, threshold);
			_bez(x +   37.719 * s,y +  -53.735 * s,x +   40.242 * s,y +  -46.394 * s,x +   41.503 * s,y +  -38.948 * s,x +   41.503 * s,y +  -31.396 * s, threshold);
			_bez(x +   41.503 * s,y +  -31.396 * s,x +   41.503 * s,y +  -23.812 * s,x +   40.250 * s,y +  -16.365 * s,x +   37.744 * s,y +   -9.057 * s, threshold);
			_bez(x +   37.744 * s,y +   -9.057 * s,x +   35.237 * s,y +   -1.750 * s,x +   31.396 * s,y +    5.664 * s,x +   26.220 * s,y +   13.183 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   15.088 * s);
			_setf(o + ( 1 << 2), y +   13.183 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   15.088 * s,y +   13.183 * s,x +   19.384 * s,y +    5.371 * s,x +   22.574 * s,y +   -2.205 * s,x +   24.658 * s,y +   -9.546 * s, threshold);
			_bez(x +   24.658 * s,y +   -9.546 * s,x +   26.741 * s,y +  -16.886 * s,x +   27.783 * s,y +  -24.169 * s,x +   27.783 * s,y +  -31.396 * s, threshold);
			_bez(x +   27.783 * s,y +  -31.396 * s,x +   27.783 * s,y +  -38.687 * s,x +   26.741 * s,y +  -45.979 * s,x +   24.658 * s,y +  -53.271 * s, threshold);
			_bez(x +   24.658 * s,y +  -53.271 * s,x +   22.574 * s,y +  -60.562 * s,x +   19.384 * s,y +  -68.098 * s,x +   15.088 * s,y +  -75.878 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 42:
			
			o = _posf(40);
			_setf(o + ( 0 << 2), x +   54.101 * s);
			_setf(o + ( 1 << 2), y +  -59.423 * s);
			_setf(o + ( 2 << 2), x +   37.988 * s);
			_setf(o + ( 3 << 2), y +  -50.976 * s);
			_setf(o + ( 4 << 2), x +   54.101 * s);
			_setf(o + ( 5 << 2), y +  -42.480 * s);
			_setf(o + ( 6 << 2), x +   50.390 * s);
			_setf(o + ( 7 << 2), y +  -35.595 * s);
			_setf(o + ( 8 << 2), x +   34.179 * s);
			_setf(o + ( 9 << 2), y +  -44.579 * s);
			_setf(o + (10 << 2), x +   34.179 * s);
			_setf(o + (11 << 2), y +  -27.783 * s);
			_setf(o + (12 << 2), x +   25.781 * s);
			_setf(o + (13 << 2), y +  -27.783 * s);
			_setf(o + (14 << 2), x +   25.781 * s);
			_setf(o + (15 << 2), y +  -44.579 * s);
			_setf(o + (16 << 2), x +    9.619 * s);
			_setf(o + (17 << 2), y +  -35.595 * s);
			_setf(o + (18 << 2), x +    5.908 * s);
			_setf(o + (19 << 2), y +  -42.480 * s);
			_setf(o + (20 << 2), x +   22.119 * s);
			_setf(o + (21 << 2), y +  -50.976 * s);
			_setf(o + (22 << 2), x +    5.908 * s);
			_setf(o + (23 << 2), y +  -59.423 * s);
			_setf(o + (24 << 2), x +    9.619 * s);
			_setf(o + (25 << 2), y +  -66.308 * s);
			_setf(o + (26 << 2), x +   25.781 * s);
			_setf(o + (27 << 2), y +  -57.421 * s);
			_setf(o + (28 << 2), x +   25.781 * s);
			_setf(o + (29 << 2), y +  -74.218 * s);
			_setf(o + (30 << 2), x +   34.179 * s);
			_setf(o + (31 << 2), y +  -74.218 * s);
			_setf(o + (32 << 2), x +   34.179 * s);
			_setf(o + (33 << 2), y +  -57.421 * s);
			_setf(o + (34 << 2), x +   50.390 * s);
			_setf(o + (35 << 2), y +  -66.308 * s);
			_setf(o + (36 << 2), x +   54.101 * s);
			_setf(o + (37 << 2), y +  -59.423 * s);
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
			_setf(o + ( 0 << 2), x +   35.888 * s);
			_setf(o + ( 1 << 2), y +  -58.202 * s);
			_setf(o + ( 2 << 2), x +   35.888 * s);
			_setf(o + ( 3 << 2), y +  -37.206 * s);
			_setf(o + ( 4 << 2), x +   56.884 * s);
			_setf(o + ( 5 << 2), y +  -37.206 * s);
			_setf(o + ( 6 << 2), x +   56.884 * s);
			_setf(o + ( 7 << 2), y +  -25.586 * s);
			_setf(o + ( 8 << 2), x +   35.888 * s);
			_setf(o + ( 9 << 2), y +  -25.586 * s);
			_setf(o + (10 << 2), x +   35.888 * s);
			_setf(o + (11 << 2), y +   -4.492 * s);
			_setf(o + (12 << 2), x +   24.316 * s);
			_setf(o + (13 << 2), y +   -4.492 * s);
			_setf(o + (14 << 2), x +   24.316 * s);
			_setf(o + (15 << 2), y +  -25.586 * s);
			_setf(o + (16 << 2), x +    3.223 * s);
			_setf(o + (17 << 2), y +  -25.586 * s);
			_setf(o + (18 << 2), x +    3.223 * s);
			_setf(o + (19 << 2), y +  -37.206 * s);
			_setf(o + (20 << 2), x +   24.316 * s);
			_setf(o + (21 << 2), y +  -37.206 * s);
			_setf(o + (22 << 2), x +   24.316 * s);
			_setf(o + (23 << 2), y +  -58.202 * s);
			_setf(o + (24 << 2), x +   35.888 * s);
			_setf(o + (25 << 2), y +  -58.202 * s);
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
			_setf(o + ( 0 << 2), x +   22.510 * s);
			_setf(o + ( 1 << 2), y +  -17.920 * s);
			_setf(o + ( 2 << 2), x +   37.793 * s);
			_setf(o + ( 3 << 2), y +  -17.920 * s);
			_setf(o + ( 4 << 2), x +   37.793 * s);
			_setf(o + ( 5 << 2), y +   -4.687 * s);
			_setf(o + ( 6 << 2), x +   28.223 * s);
			_setf(o + ( 7 << 2), y +   14.013 * s);
			_setf(o + ( 8 << 2), x +   17.676 * s);
			_setf(o + ( 9 << 2), y +   14.013 * s);
			_setf(o + (10 << 2), x +   22.510 * s);
			_setf(o + (11 << 2), y +   -4.687 * s);
			_setf(o + (12 << 2), x +   22.510 * s);
			_setf(o + (13 << 2), y +  -17.920 * s);
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
			_setf(o + ( 0 << 2), x +   14.697 * s);
			_setf(o + ( 1 << 2), y +  -35.888 * s);
			_setf(o + ( 2 << 2), x +   45.507 * s);
			_setf(o + ( 3 << 2), y +  -35.888 * s);
			_setf(o + ( 4 << 2), x +   45.507 * s);
			_setf(o + ( 5 << 2), y +  -21.679 * s);
			_setf(o + ( 6 << 2), x +   14.697 * s);
			_setf(o + ( 7 << 2), y +  -21.679 * s);
			_setf(o + ( 8 << 2), x +   14.697 * s);
			_setf(o + ( 9 << 2), y +  -35.888 * s);
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
			_setf(o + ( 0 << 2), x +   21.923 * s);
			_setf(o + ( 1 << 2), y +  -17.920 * s);
			_setf(o + ( 2 << 2), x +   38.183 * s);
			_setf(o + ( 3 << 2), y +  -17.920 * s);
			_setf(o + ( 4 << 2), x +   38.183 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   21.923 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   21.923 * s);
			_setf(o + ( 9 << 2), y +  -17.920 * s);
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
			_setf(o + ( 0 << 2), x +   43.896 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   54.687 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   16.308 * s);
			_setf(o + ( 5 << 2), y +    9.277 * s);
			_setf(o + ( 6 << 2), x +    5.517 * s);
			_setf(o + ( 7 << 2), y +    9.277 * s);
			_setf(o + ( 8 << 2), x +   43.896 * s);
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
			_setf(o + ( 0 << 2), x +   24.023 * s);
			_setf(o + ( 1 << 2), y +  -36.376 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   24.023 * s,y +  -36.376 * s,x +   24.023 * s,y +  -38.102 * s,x +   24.609 * s,y +  -39.550 * s,x +   25.781 * s,y +  -40.722 * s, threshold);
			_bez(x +   25.781 * s,y +  -40.722 * s,x +   26.953 * s,y +  -41.894 * s,x +   28.385 * s,y +  -42.480 * s,x +   30.078 * s,y +  -42.480 * s, threshold);
			_bez(x +   30.078 * s,y +  -42.480 * s,x +   31.803 * s,y +  -42.480 * s,x +   33.251 * s,y +  -41.894 * s,x +   34.423 * s,y +  -40.722 * s, threshold);
			_bez(x +   34.423 * s,y +  -40.722 * s,x +   35.595 * s,y +  -39.550 * s,x +   36.181 * s,y +  -38.102 * s,x +   36.181 * s,y +  -36.376 * s, threshold);
			_bez(x +   36.181 * s,y +  -36.376 * s,x +   36.181 * s,y +  -34.684 * s,x +   35.595 * s,y +  -33.251 * s,x +   34.423 * s,y +  -32.080 * s, threshold);
			_bez(x +   34.423 * s,y +  -32.080 * s,x +   33.251 * s,y +  -30.908 * s,x +   31.803 * s,y +  -30.322 * s,x +   30.078 * s,y +  -30.322 * s, threshold);
			_bez(x +   30.078 * s,y +  -30.322 * s,x +   28.385 * s,y +  -30.322 * s,x +   26.953 * s,y +  -30.900 * s,x +   25.781 * s,y +  -32.055 * s, threshold);
			_bez(x +   25.781 * s,y +  -32.055 * s,x +   24.609 * s,y +  -33.211 * s,x +   24.023 * s,y +  -34.651 * s,x +   24.023 * s,y +  -36.376 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   30.078 * s);
			_setf(o + ( 1 << 2), y +  -62.011 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   30.078 * s,y +  -62.011 * s,x +   26.757 * s,y +  -62.011 * s,x +   24.332 * s,y +  -59.976 * s,x +   22.802 * s,y +  -55.907 * s, threshold);
			_bez(x +   22.802 * s,y +  -55.907 * s,x +   21.272 * s,y +  -51.838 * s,x +   20.508 * s,y +  -45.328 * s,x +   20.508 * s,y +  -36.376 * s, threshold);
			_bez(x +   20.508 * s,y +  -36.376 * s,x +   20.508 * s,y +  -27.458 * s,x +   21.272 * s,y +  -20.963 * s,x +   22.802 * s,y +  -16.894 * s, threshold);
			_bez(x +   22.802 * s,y +  -16.894 * s,x +   24.332 * s,y +  -12.825 * s,x +   26.757 * s,y +  -10.791 * s,x +   30.078 * s,y +  -10.791 * s, threshold);
			_bez(x +   30.078 * s,y +  -10.791 * s,x +   33.430 * s,y +  -10.791 * s,x +   35.872 * s,y +  -12.825 * s,x +   37.402 * s,y +  -16.894 * s, threshold);
			_bez(x +   37.402 * s,y +  -16.894 * s,x +   38.932 * s,y +  -20.963 * s,x +   39.697 * s,y +  -27.458 * s,x +   39.697 * s,y +  -36.376 * s, threshold);
			_bez(x +   39.697 * s,y +  -36.376 * s,x +   39.697 * s,y +  -45.328 * s,x +   38.932 * s,y +  -51.838 * s,x +   37.402 * s,y +  -55.907 * s, threshold);
			_bez(x +   37.402 * s,y +  -55.907 * s,x +   35.872 * s,y +  -59.976 * s,x +   33.430 * s,y +  -62.011 * s,x +   30.078 * s,y +  -62.011 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    6.006 * s);
			_setf(o + ( 1 << 2), y +  -36.376 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +    6.006 * s,y +  -36.376 * s,x +    6.006 * s,y +  -49.006 * s,x +    8.008 * s,y +  -58.471 * s,x +   12.012 * s,y +  -64.770 * s, threshold);
			_bez(x +   12.012 * s,y +  -64.770 * s,x +   16.015 * s,y +  -71.068 * s,x +   22.038 * s,y +  -74.218 * s,x +   30.078 * s,y +  -74.218 * s, threshold);
			_bez(x +   30.078 * s,y +  -74.218 * s,x +   38.150 * s,y +  -74.218 * s,x +   44.189 * s,y +  -71.076 * s,x +   48.193 * s,y +  -64.794 * s, threshold);
			_bez(x +   48.193 * s,y +  -64.794 * s,x +   52.196 * s,y +  -58.511 * s,x +   54.198 * s,y +  -49.039 * s,x +   54.198 * s,y +  -36.376 * s, threshold);
			_bez(x +   54.198 * s,y +  -36.376 * s,x +   54.198 * s,y +  -23.747 * s,x +   52.196 * s,y +  -14.290 * s,x +   48.193 * s,y +   -8.008 * s, threshold);
			_bez(x +   48.193 * s,y +   -8.008 * s,x +   44.189 * s,y +   -1.725 * s,x +   38.150 * s,y +    1.416 * s,x +   30.078 * s,y +    1.416 * s, threshold);
			_bez(x +   30.078 * s,y +    1.416 * s,x +   22.038 * s,y +    1.416 * s,x +   16.015 * s,y +   -1.733 * s,x +   12.012 * s,y +   -8.032 * s, threshold);
			_bez(x +   12.012 * s,y +   -8.032 * s,x +    8.008 * s,y +  -14.331 * s,x +    6.006 * s,y +  -23.779 * s,x +    6.006 * s,y +  -36.376 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 49:
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +    9.179 * s);
			_setf(o + ( 1 << 2), y +  -12.695 * s);
			_setf(o + ( 2 << 2), x +   25.293 * s);
			_setf(o + ( 3 << 2), y +  -12.695 * s);
			_setf(o + ( 4 << 2), x +   25.293 * s);
			_setf(o + ( 5 << 2), y +  -60.009 * s);
			_setf(o + ( 6 << 2), x +   10.303 * s);
			_setf(o + ( 7 << 2), y +  -56.298 * s);
			_setf(o + ( 8 << 2), x +   10.303 * s);
			_setf(o + ( 9 << 2), y +  -69.286 * s);
			_setf(o + (10 << 2), x +   25.390 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   39.306 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   39.306 * s);
			_setf(o + (15 << 2), y +  -12.695 * s);
			_setf(o + (16 << 2), x +   55.419 * s);
			_setf(o + (17 << 2), y +  -12.695 * s);
			_setf(o + (18 << 2), x +   55.419 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +    9.179 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +    9.179 * s);
			_setf(o + (23 << 2), y +  -12.695 * s);
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
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   21.191 * s);
			_setf(o + ( 1 << 2), y +  -12.695 * s);
			_setf(o + ( 2 << 2), x +   51.904 * s);
			_setf(o + ( 3 << 2), y +  -12.695 * s);
			_setf(o + ( 4 << 2), x +   51.904 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    5.615 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    5.615 * s);
			_setf(o + ( 9 << 2), y +  -12.304 * s);
			_setf(o + (10 << 2), x +   13.428 * s);
			_setf(o + (11 << 2), y +  -20.605 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_bez(x +   13.428 * s,y +  -20.605 * s,x +   22.708 * s,y +  -30.466 * s,x +   28.336 * s,y +  -36.540 * s,x +   30.322 * s,y +  -38.818 * s, threshold);
			_bez(x +   30.322 * s,y +  -38.818 * s,x +   32.763 * s,y +  -41.618 * s,x +   34.521 * s,y +  -44.099 * s,x +   35.595 * s,y +  -46.264 * s, threshold);
			_bez(x +   35.595 * s,y +  -46.264 * s,x +   36.669 * s,y +  -48.429 * s,x +   37.207 * s,y +  -50.569 * s,x +   37.207 * s,y +  -52.685 * s, threshold);
			_bez(x +   37.207 * s,y +  -52.685 * s,x +   37.207 * s,y +  -55.940 * s,x +   36.222 * s,y +  -58.454 * s,x +   34.253 * s,y +  -60.229 * s, threshold);
			_bez(x +   34.253 * s,y +  -60.229 * s,x +   32.283 * s,y +  -62.003 * s,x +   29.492 * s,y +  -62.890 * s,x +   25.879 * s,y +  -62.890 * s, threshold);
			_bez(x +   25.879 * s,y +  -62.890 * s,x +   23.307 * s,y +  -62.890 * s,x +   20.418 * s,y +  -62.377 * s,x +   17.212 * s,y +  -61.352 * s, threshold);
			_bez(x +   17.212 * s,y +  -61.352 * s,x +   14.005 * s,y +  -60.326 * s,x +   10.661 * s,y +  -58.837 * s,x +    7.178 * s,y +  -56.884 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    7.178 * s);
			_setf(o + ( 1 << 2), y +  -70.311 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    7.178 * s,y +  -70.311 * s,x +   10.661 * s,y +  -71.581 * s,x +   14.070 * s,y +  -72.549 * s,x +   17.407 * s,y +  -73.217 * s, threshold);
			_bez(x +   17.407 * s,y +  -73.217 * s,x +   20.744 * s,y +  -73.884 * s,x +   23.942 * s,y +  -74.218 * s,x +   27.002 * s,y +  -74.218 * s, threshold);
			_bez(x +   27.002 * s,y +  -74.218 * s,x +   34.717 * s,y +  -74.218 * s,x +   40.779 * s,y +  -72.419 * s,x +   45.190 * s,y +  -68.822 * s, threshold);
			_bez(x +   45.190 * s,y +  -68.822 * s,x +   49.601 * s,y +  -65.225 * s,x +   51.806 * s,y +  -60.318 * s,x +   51.806 * s,y +  -54.101 * s, threshold);
			_bez(x +   51.806 * s,y +  -54.101 * s,x +   51.806 * s,y +  -51.236 * s,x +   51.326 * s,y +  -48.551 * s,x +   50.366 * s,y +  -46.044 * s, threshold);
			_bez(x +   50.366 * s,y +  -46.044 * s,x +   49.405 * s,y +  -43.538 * s,x +   47.764 * s,y +  -40.746 * s,x +   45.410 * s,y +  -37.695 * s, threshold);
			_bez(x +   45.410 * s,y +  -37.695 * s,x +   43.695 * s,y +  -35.473 * s,x +   38.949 * s,y +  -30.501 * s,x +   31.201 * s,y +  -22.754 * s, threshold);
			_bez(x +   31.201 * s,y +  -22.754 * s,x +   27.001 * s,y +  -18.554 * s,x +   23.665 * s,y +  -15.202 * s,x +   21.191 * s,y +  -12.695 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 51:
			
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   26.807 * s);
			_setf(o + ( 1 << 2), y +  -32.617 * s);
			_setf(o + ( 2 << 2), x +   19.092 * s);
			_setf(o + ( 3 << 2), y +  -32.617 * s);
			_setf(o + ( 4 << 2), x +   19.092 * s);
			_setf(o + ( 5 << 2), y +  -45.312 * s);
			_setf(o + ( 6 << 2), x +   26.807 * s);
			_setf(o + ( 7 << 2), y +  -45.312 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_bez(x +   26.807 * s,y +  -45.312 * s,x +   30.387 * s,y +  -45.312 * s,x +   33.162 * s,y +  -46.020 * s,x +   35.132 * s,y +  -47.436 * s, threshold);
			_bez(x +   35.132 * s,y +  -47.436 * s,x +   37.101 * s,y +  -48.852 * s,x +   38.086 * s,y +  -50.846 * s,x +   38.086 * s,y +  -53.417 * s, threshold);
			_bez(x +   38.086 * s,y +  -53.417 * s,x +   38.086 * s,y +  -56.119 * s,x +   37.101 * s,y +  -58.227 * s,x +   35.132 * s,y +  -59.740 * s, threshold);
			_bez(x +   35.132 * s,y +  -59.740 * s,x +   33.162 * s,y +  -61.254 * s,x +   30.387 * s,y +  -62.011 * s,x +   26.807 * s,y +  -62.011 * s, threshold);
			_bez(x +   26.807 * s,y +  -62.011 * s,x +   24.072 * s,y +  -62.011 * s,x +   21.143 * s,y +  -61.669 * s,x +   18.018 * s,y +  -60.985 * s, threshold);
			_bez(x +   18.018 * s,y +  -60.985 * s,x +   14.893 * s,y +  -60.302 * s,x +   11.654 * s,y +  -59.309 * s,x +    8.301 * s,y +  -58.007 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    8.301 * s);
			_setf(o + ( 1 << 2), y +  -71.093 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    8.301 * s,y +  -71.093 * s,x +   11.654 * s,y +  -72.102 * s,x +   14.958 * s,y +  -72.875 * s,x +   18.213 * s,y +  -73.412 * s, threshold);
			_bez(x +   18.213 * s,y +  -73.412 * s,x +   21.468 * s,y +  -73.949 * s,x +   24.593 * s,y +  -74.218 * s,x +   27.588 * s,y +  -74.218 * s, threshold);
			_bez(x +   27.588 * s,y +  -74.218 * s,x +   35.270 * s,y +  -74.218 * s,x +   41.259 * s,y +  -72.541 * s,x +   45.556 * s,y +  -69.188 * s, threshold);
			_bez(x +   45.556 * s,y +  -69.188 * s,x +   49.853 * s,y +  -65.836 * s,x +   52.001 * s,y +  -61.213 * s,x +   52.001 * s,y +  -55.321 * s, threshold);
			_bez(x +   52.001 * s,y +  -55.321 * s,x +   52.001 * s,y +  -50.992 * s,x +   50.764 * s,y +  -47.452 * s,x +   48.291 * s,y +  -44.701 * s, threshold);
			_bez(x +   48.291 * s,y +  -44.701 * s,x +   45.817 * s,y +  -41.951 * s,x +   42.285 * s,y +  -40.152 * s,x +   37.695 * s,y +  -39.306 * s, threshold);
			_bez(x +   37.695 * s,y +  -39.306 * s,x +   42.903 * s,y +  -38.395 * s,x +   46.875 * s,y +  -36.319 * s,x +   49.609 * s,y +  -33.081 * s, threshold);
			_bez(x +   49.609 * s,y +  -33.081 * s,x +   52.343 * s,y +  -29.842 * s,x +   53.710 * s,y +  -25.586 * s,x +   53.710 * s,y +  -20.312 * s, threshold);
			_bez(x +   53.710 * s,y +  -20.312 * s,x +   53.710 * s,y +  -13.248 * s,x +   51.448 * s,y +   -7.861 * s,x +   46.923 * s,y +   -4.150 * s, threshold);
			_bez(x +   46.923 * s,y +   -4.150 * s,x +   42.399 * s,y +   -0.439 * s,x +   35.823 * s,y +    1.416 * s,x +   27.197 * s,y +    1.416 * s, threshold);
			_bez(x +   27.197 * s,y +    1.416 * s,x +   23.519 * s,y +    1.416 * s,x +   19.897 * s,y +    1.107 * s,x +   16.333 * s,y +    0.488 * s, threshold);
			_bez(x +   16.333 * s,y +    0.488 * s,x +   12.769 * s,y +   -0.130 * s,x +    9.359 * s,y +   -1.025 * s,x +    6.104 * s,y +   -2.197 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    6.104 * s);
			_setf(o + ( 1 << 2), y +  -15.576 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    6.104 * s,y +  -15.576 * s,x +    9.164 * s,y +  -14.046 * s,x +   12.468 * s,y +  -12.882 * s,x +   16.016 * s,y +  -12.085 * s, threshold);
			_bez(x +   16.016 * s,y +  -12.085 * s,x +   19.564 * s,y +  -11.287 * s,x +   23.291 * s,y +  -10.889 * s,x +   27.197 * s,y +  -10.889 * s, threshold);
			_bez(x +   27.197 * s,y +  -10.889 * s,x +   31.103 * s,y +  -10.889 * s,x +   34.196 * s,y +  -11.792 * s,x +   36.474 * s,y +  -13.598 * s, threshold);
			_bez(x +   36.474 * s,y +  -13.598 * s,x +   38.753 * s,y +  -15.405 * s,x +   39.892 * s,y +  -17.838 * s,x +   39.892 * s,y +  -20.898 * s, threshold);
			_bez(x +   39.892 * s,y +  -20.898 * s,x +   39.892 * s,y +  -24.642 * s,x +   38.753 * s,y +  -27.530 * s,x +   36.474 * s,y +  -29.565 * s, threshold);
			_bez(x +   36.474 * s,y +  -29.565 * s,x +   34.196 * s,y +  -31.599 * s,x +   30.973 * s,y +  -32.617 * s,x +   26.807 * s,y +  -32.617 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 52:
			
			o = _posf(34);
			_setf(o + ( 0 << 2), x +   33.887 * s);
			_setf(o + ( 1 << 2), y +  -56.884 * s);
			_setf(o + ( 2 << 2), x +   15.479 * s);
			_setf(o + ( 3 << 2), y +  -28.076 * s);
			_setf(o + ( 4 << 2), x +   33.887 * s);
			_setf(o + ( 5 << 2), y +  -28.076 * s);
			_setf(o + ( 6 << 2), x +   33.887 * s);
			_setf(o + ( 7 << 2), y +  -56.884 * s);
			_setf(o + ( 8 << 2), x +   32.617 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   47.705 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   47.705 * s);
			_setf(o + (13 << 2), y +  -28.076 * s);
			_setf(o + (14 << 2), x +   55.712 * s);
			_setf(o + (15 << 2), y +  -28.076 * s);
			_setf(o + (16 << 2), x +   55.712 * s);
			_setf(o + (17 << 2), y +  -15.722 * s);
			_setf(o + (18 << 2), x +   47.705 * s);
			_setf(o + (19 << 2), y +  -15.722 * s);
			_setf(o + (20 << 2), x +   47.705 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   33.887 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   33.887 * s);
			_setf(o + (25 << 2), y +  -15.722 * s);
			_setf(o + (26 << 2), x +    4.981 * s);
			_setf(o + (27 << 2), y +  -15.722 * s);
			_setf(o + (28 << 2), x +    4.981 * s);
			_setf(o + (29 << 2), y +  -29.687 * s);
			_setf(o + (30 << 2), x +   32.617 * s);
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
			_setf(o + ( 0 << 2), x +    9.423 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   49.022 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   49.022 * s);
			_setf(o + ( 5 << 2), y +  -60.204 * s);
			_setf(o + ( 6 << 2), x +   21.093 * s);
			_setf(o + ( 7 << 2), y +  -60.204 * s);
			_setf(o + ( 8 << 2), x +   21.093 * s);
			_setf(o + ( 9 << 2), y +  -46.679 * s);
			o = _posb(5);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   21.093 * s,y +  -46.679 * s,x +   22.265 * s,y +  -47.135 * s,x +   23.518 * s,y +  -47.468 * s,x +   24.853 * s,y +  -47.680 * s, threshold);
			_bez(x +   24.853 * s,y +  -47.680 * s,x +   26.187 * s,y +  -47.892 * s,x +   27.603 * s,y +  -47.997 * s,x +   29.101 * s,y +  -47.997 * s, threshold);
			_bez(x +   29.101 * s,y +  -47.997 * s,x +   36.327 * s,y +  -47.997 * s,x +   42.186 * s,y +  -45.719 * s,x +   46.679 * s,y +  -41.161 * s, threshold);
			_bez(x +   46.679 * s,y +  -41.161 * s,x +   51.171 * s,y +  -36.604 * s,x +   53.417 * s,y +  -30.680 * s,x +   53.417 * s,y +  -23.388 * s, threshold);
			_bez(x +   53.417 * s,y +  -23.388 * s,x +   53.417 * s,y +  -15.739 * s,x +   50.983 * s,y +   -9.692 * s,x +   46.117 * s,y +   -5.249 * s, threshold);
			_bez(x +   46.117 * s,y +   -5.249 * s,x +   41.251 * s,y +   -0.806 * s,x +   34.618 * s,y +    1.416 * s,x +   26.220 * s,y +    1.416 * s, threshold);
			_bez(x +   26.220 * s,y +    1.416 * s,x +   23.095 * s,y +    1.416 * s,x +   19.937 * s,y +    1.156 * s,x +   16.747 * s,y +    0.635 * s, threshold);
			_bez(x +   16.747 * s,y +    0.635 * s,x +   13.557 * s,y +    0.114 * s,x +   10.302 * s,y +   -0.667 * s,x +    6.982 * s,y +   -1.709 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    6.982 * s);
			_setf(o + ( 1 << 2), y +  -14.697 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    6.982 * s,y +  -14.697 * s,x +    9.684 * s,y +  -13.362 * s,x +   12.459 * s,y +  -12.361 * s,x +   15.307 * s,y +  -11.694 * s, threshold);
			_bez(x +   15.307 * s,y +  -11.694 * s,x +   18.155 * s,y +  -11.027 * s,x +   21.012 * s,y +  -10.693 * s,x +   23.876 * s,y +  -10.693 * s, threshold);
			_bez(x +   23.876 * s,y +  -10.693 * s,x +   28.954 * s,y +  -10.693 * s,x +   32.812 * s,y +  -11.776 * s,x +   35.448 * s,y +  -13.940 * s, threshold);
			_bez(x +   35.448 * s,y +  -13.940 * s,x +   38.085 * s,y +  -16.105 * s,x +   39.403 * s,y +  -19.254 * s,x +   39.403 * s,y +  -23.388 * s, threshold);
			_bez(x +   39.403 * s,y +  -23.388 * s,x +   39.403 * s,y +  -27.197 * s,x +   38.093 * s,y +  -30.249 * s,x +   35.473 * s,y +  -32.543 * s, threshold);
			_bez(x +   35.473 * s,y +  -32.543 * s,x +   32.852 * s,y +  -34.838 * s,x +   29.361 * s,y +  -35.986 * s,x +   24.999 * s,y +  -35.986 * s, threshold);
			_bez(x +   24.999 * s,y +  -35.986 * s,x +   22.428 * s,y +  -35.986 * s,x +   19.848 * s,y +  -35.668 * s,x +   17.260 * s,y +  -35.034 * s, threshold);
			_bez(x +   17.260 * s,y +  -35.034 * s,x +   14.672 * s,y +  -34.399 * s,x +   12.060 * s,y +  -33.447 * s,x +    9.423 * s,y +  -32.177 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    9.423 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   60.204 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 54:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   31.396 * s);
			_setf(o + ( 1 << 2), y +  -36.523 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   31.396 * s,y +  -36.523 * s,x +   28.271 * s,y +  -36.523 * s,x +   25.886 * s,y +  -35.392 * s,x +   24.243 * s,y +  -33.129 * s, threshold);
			_bez(x +   24.243 * s,y +  -33.129 * s,x +   22.599 * s,y +  -30.867 * s,x +   21.777 * s,y +  -27.588 * s,x +   21.777 * s,y +  -23.291 * s, threshold);
			_bez(x +   21.777 * s,y +  -23.291 * s,x +   21.777 * s,y +  -19.026 * s,x +   22.599 * s,y +  -15.763 * s,x +   24.243 * s,y +  -13.501 * s, threshold);
			_bez(x +   24.243 * s,y +  -13.501 * s,x +   25.886 * s,y +  -11.238 * s,x +   28.271 * s,y +  -10.107 * s,x +   31.396 * s,y +  -10.107 * s, threshold);
			_bez(x +   31.396 * s,y +  -10.107 * s,x +   34.521 * s,y +  -10.107 * s,x +   36.921 * s,y +  -11.238 * s,x +   38.598 * s,y +  -13.501 * s, threshold);
			_bez(x +   38.598 * s,y +  -13.501 * s,x +   40.274 * s,y +  -15.763 * s,x +   41.112 * s,y +  -19.026 * s,x +   41.112 * s,y +  -23.291 * s, threshold);
			_bez(x +   41.112 * s,y +  -23.291 * s,x +   41.112 * s,y +  -27.555 * s,x +   40.274 * s,y +  -30.826 * s,x +   38.598 * s,y +  -33.105 * s, threshold);
			_bez(x +   38.598 * s,y +  -33.105 * s,x +   36.921 * s,y +  -35.384 * s,x +   34.521 * s,y +  -36.523 * s,x +   31.396 * s,y +  -36.523 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   50.292 * s);
			_setf(o + ( 1 << 2), y +  -71.190 * s);
			_setf(o + ( 2 << 2), x +   50.292 * s);
			_setf(o + ( 3 << 2), y +  -58.105 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   50.292 * s,y +  -58.105 * s,x +   47.720 * s,y +  -59.569 * s,x +   45.255 * s,y +  -60.668 * s,x +   42.895 * s,y +  -61.400 * s, threshold);
			_bez(x +   42.895 * s,y +  -61.400 * s,x +   40.535 * s,y +  -62.133 * s,x +   38.264 * s,y +  -62.499 * s,x +   36.083 * s,y +  -62.499 * s, threshold);
			_bez(x +   36.083 * s,y +  -62.499 * s,x +   30.875 * s,y +  -62.499 * s,x +   26.912 * s,y +  -60.749 * s,x +   24.194 * s,y +  -57.250 * s, threshold);
			_bez(x +   24.194 * s,y +  -57.250 * s,x +   21.476 * s,y +  -53.751 * s,x +   20.051 * s,y +  -48.583 * s,x +   19.921 * s,y +  -41.747 * s, threshold);
			_bez(x +   19.921 * s,y +  -41.747 * s,x +   21.451 * s,y +  -43.863 * s,x +   23.404 * s,y +  -45.450 * s,x +   25.781 * s,y +  -46.508 * s, threshold);
			_bez(x +   25.781 * s,y +  -46.508 * s,x +   28.157 * s,y +  -47.566 * s,x +   30.956 * s,y +  -48.095 * s,x +   34.179 * s,y +  -48.095 * s, threshold);
			_bez(x +   34.179 * s,y +  -48.095 * s,x +   40.755 * s,y +  -48.095 * s,x +   45.832 * s,y +  -46.020 * s,x +   49.413 * s,y +  -41.869 * s, threshold);
			_bez(x +   49.413 * s,y +  -41.869 * s,x +   52.994 * s,y +  -37.719 * s,x +   54.784 * s,y +  -31.836 * s,x +   54.784 * s,y +  -24.218 * s, threshold);
			_bez(x +   54.784 * s,y +  -24.218 * s,x +   54.784 * s,y +  -16.048 * s,x +   52.774 * s,y +   -9.717 * s,x +   48.754 * s,y +   -5.225 * s, threshold);
			_bez(x +   48.754 * s,y +   -5.225 * s,x +   44.734 * s,y +   -0.732 * s,x +   39.078 * s,y +    1.514 * s,x +   31.786 * s,y +    1.514 * s, threshold);
			_bez(x +   31.786 * s,y +    1.514 * s,x +   22.900 * s,y +    1.514 * s,x +   16.446 * s,y +   -1.465 * s,x +   12.426 * s,y +   -7.422 * s, threshold);
			_bez(x +   12.426 * s,y +   -7.422 * s,x +    8.406 * s,y +  -13.379 * s,x +    6.396 * s,y +  -22.997 * s,x +    6.396 * s,y +  -36.279 * s, threshold);
			_bez(x +    6.396 * s,y +  -36.279 * s,x +    6.396 * s,y +  -48.908 * s,x +    8.854 * s,y +  -58.373 * s,x +   13.769 * s,y +  -64.672 * s, threshold);
			_bez(x +   13.769 * s,y +  -64.672 * s,x +   18.684 * s,y +  -70.971 * s,x +   26.058 * s,y +  -74.120 * s,x +   35.888 * s,y +  -74.120 * s, threshold);
			_bez(x +   35.888 * s,y +  -74.120 * s,x +   38.166 * s,y +  -74.120 * s,x +   40.518 * s,y +  -73.876 * s,x +   42.943 * s,y +  -73.388 * s, threshold);
			_bez(x +   42.943 * s,y +  -73.388 * s,x +   45.368 * s,y +  -72.899 * s,x +   47.818 * s,y +  -72.167 * s,x +   50.292 * s,y +  -71.190 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 55:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +    6.592 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   52.685 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   52.685 * s);
			_setf(o + ( 5 << 2), y +  -62.694 * s);
			_setf(o + ( 6 << 2), x +   27.978 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   13.281 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   37.011 * s);
			_setf(o + (11 << 2), y +  -60.204 * s);
			_setf(o + (12 << 2), x +    6.592 * s);
			_setf(o + (13 << 2), y +  -60.204 * s);
			_setf(o + (14 << 2), x +    6.592 * s);
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
			_setf(o + ( 1 << 2), y +  -32.519 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   30.078 * s,y +  -32.519 * s,x +   26.855 * s,y +  -32.519 * s,x +   24.251 * s,y +  -31.502 * s,x +   22.265 * s,y +  -29.467 * s, threshold);
			_bez(x +   22.265 * s,y +  -29.467 * s,x +   20.280 * s,y +  -27.433 * s,x +   19.287 * s,y +  -24.739 * s,x +   19.287 * s,y +  -21.386 * s, threshold);
			_bez(x +   19.287 * s,y +  -21.386 * s,x +   19.287 * s,y +  -18.034 * s,x +   20.280 * s,y +  -15.332 * s,x +   22.265 * s,y +  -13.281 * s, threshold);
			_bez(x +   22.265 * s,y +  -13.281 * s,x +   24.251 * s,y +  -11.230 * s,x +   26.855 * s,y +  -10.205 * s,x +   30.078 * s,y +  -10.205 * s, threshold);
			_bez(x +   30.078 * s,y +  -10.205 * s,x +   33.300 * s,y +  -10.205 * s,x +   35.913 * s,y +  -11.247 * s,x +   37.914 * s,y +  -13.330 * s, threshold);
			_bez(x +   37.914 * s,y +  -13.330 * s,x +   39.916 * s,y +  -15.413 * s,x +   40.917 * s,y +  -18.099 * s,x +   40.917 * s,y +  -21.386 * s, threshold);
			_bez(x +   40.917 * s,y +  -21.386 * s,x +   40.917 * s,y +  -24.739 * s,x +   39.925 * s,y +  -27.433 * s,x +   37.939 * s,y +  -29.467 * s, threshold);
			_bez(x +   37.939 * s,y +  -29.467 * s,x +   35.953 * s,y +  -31.502 * s,x +   33.333 * s,y +  -32.519 * s,x +   30.078 * s,y +  -32.519 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   19.384 * s);
			_setf(o + ( 1 << 2), y +  -38.622 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   19.384 * s,y +  -38.622 * s,x +   15.706 * s,y +  -39.892 * s,x +   12.907 * s,y +  -41.886 * s,x +   10.986 * s,y +  -44.604 * s, threshold);
			_bez(x +   10.986 * s,y +  -44.604 * s,x +    9.066 * s,y +  -47.322 * s,x +    8.105 * s,y +  -50.650 * s,x +    8.105 * s,y +  -54.589 * s, threshold);
			_bez(x +    8.105 * s,y +  -54.589 * s,x +    8.105 * s,y +  -60.644 * s,x +   10.075 * s,y +  -65.429 * s,x +   14.013 * s,y +  -68.944 * s, threshold);
			_bez(x +   14.013 * s,y +  -68.944 * s,x +   17.952 * s,y +  -72.460 * s,x +   23.307 * s,y +  -74.218 * s,x +   30.078 * s,y +  -74.218 * s, threshold);
			_bez(x +   30.078 * s,y +  -74.218 * s,x +   36.881 * s,y +  -74.218 * s,x +   42.252 * s,y +  -72.460 * s,x +   46.191 * s,y +  -68.944 * s, threshold);
			_bez(x +   46.191 * s,y +  -68.944 * s,x +   50.129 * s,y +  -65.429 * s,x +   52.099 * s,y +  -60.644 * s,x +   52.099 * s,y +  -54.589 * s, threshold);
			_bez(x +   52.099 * s,y +  -54.589 * s,x +   52.099 * s,y +  -50.683 * s,x +   51.155 * s,y +  -47.371 * s,x +   49.267 * s,y +  -44.653 * s, threshold);
			_bez(x +   49.267 * s,y +  -44.653 * s,x +   47.379 * s,y +  -41.935 * s,x +   44.628 * s,y +  -39.924 * s,x +   41.015 * s,y +  -38.622 * s, threshold);
			_bez(x +   41.015 * s,y +  -38.622 * s,x +   45.051 * s,y +  -37.385 * s,x +   48.209 * s,y +  -35.172 * s,x +   50.488 * s,y +  -31.982 * s, threshold);
			_bez(x +   50.488 * s,y +  -31.982 * s,x +   52.766 * s,y +  -28.792 * s,x +   53.905 * s,y +  -24.967 * s,x +   53.905 * s,y +  -20.507 * s, threshold);
			_bez(x +   53.905 * s,y +  -20.507 * s,x +   53.905 * s,y +  -13.509 * s,x +   51.838 * s,y +   -8.105 * s,x +   47.704 * s,y +   -4.297 * s, threshold);
			_bez(x +   47.704 * s,y +   -4.297 * s,x +   43.570 * s,y +   -0.488 * s,x +   37.695 * s,y +    1.416 * s,x +   30.078 * s,y +    1.416 * s, threshold);
			_bez(x +   30.078 * s,y +    1.416 * s,x +   22.493 * s,y +    1.416 * s,x +   16.634 * s,y +   -0.488 * s,x +   12.500 * s,y +   -4.297 * s, threshold);
			_bez(x +   12.500 * s,y +   -4.297 * s,x +    8.366 * s,y +   -8.105 * s,x +    6.299 * s,y +  -13.509 * s,x +    6.299 * s,y +  -20.507 * s, threshold);
			_bez(x +    6.299 * s,y +  -20.507 * s,x +    6.299 * s,y +  -25.000 * s,x +    7.454 * s,y +  -28.841 * s,x +    9.766 * s,y +  -32.031 * s, threshold);
			_bez(x +    9.766 * s,y +  -32.031 * s,x +   12.077 * s,y +  -35.221 * s,x +   15.283 * s,y +  -37.418 * s,x +   19.384 * s,y +  -38.622 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   20.898 * s);
			_setf(o + ( 1 << 2), y +  -53.417 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   20.898 * s,y +  -53.417 * s,x +   20.898 * s,y +  -50.553 * s,x +   21.720 * s,y +  -48.282 * s,x +   23.364 * s,y +  -46.606 * s, threshold);
			_bez(x +   23.364 * s,y +  -46.606 * s,x +   25.008 * s,y +  -44.929 * s,x +   27.246 * s,y +  -44.091 * s,x +   30.078 * s,y +  -44.091 * s, threshold);
			_bez(x +   30.078 * s,y +  -44.091 * s,x +   32.942 * s,y +  -44.091 * s,x +   35.196 * s,y +  -44.929 * s,x +   36.840 * s,y +  -46.606 * s, threshold);
			_bez(x +   36.840 * s,y +  -46.606 * s,x +   38.484 * s,y +  -48.282 * s,x +   39.306 * s,y +  -50.553 * s,x +   39.306 * s,y +  -53.417 * s, threshold);
			_bez(x +   39.306 * s,y +  -53.417 * s,x +   39.306 * s,y +  -56.249 * s,x +   38.484 * s,y +  -58.487 * s,x +   36.840 * s,y +  -60.131 * s, threshold);
			_bez(x +   36.840 * s,y +  -60.131 * s,x +   35.196 * s,y +  -61.775 * s,x +   32.942 * s,y +  -62.597 * s,x +   30.078 * s,y +  -62.597 * s, threshold);
			_bez(x +   30.078 * s,y +  -62.597 * s,x +   27.278 * s,y +  -62.597 * s,x +   25.048 * s,y +  -61.767 * s,x +   23.388 * s,y +  -60.106 * s, threshold);
			_bez(x +   23.388 * s,y +  -60.106 * s,x +   21.728 * s,y +  -58.446 * s,x +   20.898 * s,y +  -56.217 * s,x +   20.898 * s,y +  -53.417 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 57:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +    9.912 * s);
			_setf(o + ( 1 << 2), y +   -0.977 * s);
			_setf(o + ( 2 << 2), x +    9.912 * s);
			_setf(o + ( 3 << 2), y +  -14.111 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +    9.912 * s,y +  -14.111 * s,x +   12.483 * s,y +  -12.614 * s,x +   14.949 * s,y +  -11.507 * s,x +   17.309 * s,y +  -10.791 * s, threshold);
			_bez(x +   17.309 * s,y +  -10.791 * s,x +   19.669 * s,y +  -10.075 * s,x +   21.940 * s,y +   -9.717 * s,x +   24.121 * s,y +   -9.717 * s, threshold);
			_bez(x +   24.121 * s,y +   -9.717 * s,x +   29.297 * s,y +   -9.717 * s,x +   33.243 * s,y +  -11.450 * s,x +   35.961 * s,y +  -14.917 * s, threshold);
			_bez(x +   35.961 * s,y +  -14.917 * s,x +   38.679 * s,y +  -18.383 * s,x +   40.120 * s,y +  -23.567 * s,x +   40.283 * s,y +  -30.468 * s, threshold);
			_bez(x +   40.283 * s,y +  -30.468 * s,x +   38.753 * s,y +  -28.352 * s,x +   36.800 * s,y +  -26.766 * s,x +   34.423 * s,y +  -25.708 * s, threshold);
			_bez(x +   34.423 * s,y +  -25.708 * s,x +   32.047 * s,y +  -24.650 * s,x +   29.231 * s,y +  -24.121 * s,x +   25.976 * s,y +  -24.121 * s, threshold);
			_bez(x +   25.976 * s,y +  -24.121 * s,x +   19.433 * s,y +  -24.121 * s,x +   14.371 * s,y +  -26.196 * s,x +   10.791 * s,y +  -30.346 * s, threshold);
			_bez(x +   10.791 * s,y +  -30.346 * s,x +    7.210 * s,y +  -34.497 * s,x +    5.420 * s,y +  -40.380 * s,x +    5.420 * s,y +  -47.997 * s, threshold);
			_bez(x +    5.420 * s,y +  -47.997 * s,x +    5.420 * s,y +  -56.135 * s,x +    7.422 * s,y +  -62.434 * s,x +   11.426 * s,y +  -66.894 * s, threshold);
			_bez(x +   11.426 * s,y +  -66.894 * s,x +   15.429 * s,y +  -71.353 * s,x +   21.093 * s,y +  -73.583 * s,x +   28.417 * s,y +  -73.583 * s, threshold);
			_bez(x +   28.417 * s,y +  -73.583 * s,x +   37.304 * s,y +  -73.583 * s,x +   43.757 * s,y +  -70.613 * s,x +   47.778 * s,y +  -64.672 * s, threshold);
			_bez(x +   47.778 * s,y +  -64.672 * s,x +   51.798 * s,y +  -58.731 * s,x +   53.808 * s,y +  -49.137 * s,x +   53.808 * s,y +  -35.888 * s, threshold);
			_bez(x +   53.808 * s,y +  -35.888 * s,x +   53.808 * s,y +  -23.290 * s,x +   51.350 * s,y +  -13.843 * s,x +   46.435 * s,y +   -7.544 * s, threshold);
			_bez(x +   46.435 * s,y +   -7.544 * s,x +   41.519 * s,y +   -1.245 * s,x +   34.146 * s,y +    1.904 * s,x +   24.316 * s,y +    1.904 * s, threshold);
			_bez(x +   24.316 * s,y +    1.904 * s,x +   22.037 * s,y +    1.904 * s,x +   19.686 * s,y +    1.660 * s,x +   17.260 * s,y +    1.172 * s, threshold);
			_bez(x +   17.260 * s,y +    1.172 * s,x +   14.835 * s,y +    0.684 * s,x +   12.386 * s,y +   -0.033 * s,x +    9.912 * s,y +   -0.977 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   28.808 * s);
			_setf(o + ( 1 << 2), y +  -36.181 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   28.808 * s,y +  -36.181 * s,x +   31.901 * s,y +  -36.181 * s,x +   34.269 * s,y +  -37.312 * s,x +   35.912 * s,y +  -39.575 * s, threshold);
			_bez(x +   35.912 * s,y +  -39.575 * s,x +   37.556 * s,y +  -41.837 * s,x +   38.378 * s,y +  -45.116 * s,x +   38.378 * s,y +  -49.413 * s, threshold);
			_bez(x +   38.378 * s,y +  -49.413 * s,x +   38.378 * s,y +  -53.678 * s,x +   37.556 * s,y +  -56.941 * s,x +   35.912 * s,y +  -59.203 * s, threshold);
			_bez(x +   35.912 * s,y +  -59.203 * s,x +   34.269 * s,y +  -61.466 * s,x +   31.901 * s,y +  -62.597 * s,x +   28.808 * s,y +  -62.597 * s, threshold);
			_bez(x +   28.808 * s,y +  -62.597 * s,x +   25.683 * s,y +  -62.597 * s,x +   23.283 * s,y +  -61.466 * s,x +   21.606 * s,y +  -59.203 * s, threshold);
			_bez(x +   21.606 * s,y +  -59.203 * s,x +   19.930 * s,y +  -56.941 * s,x +   19.091 * s,y +  -53.678 * s,x +   19.091 * s,y +  -49.413 * s, threshold);
			_bez(x +   19.091 * s,y +  -49.413 * s,x +   19.091 * s,y +  -45.149 * s,x +   19.930 * s,y +  -41.878 * s,x +   21.606 * s,y +  -39.599 * s, threshold);
			_bez(x +   21.606 * s,y +  -39.599 * s,x +   23.283 * s,y +  -37.320 * s,x +   25.683 * s,y +  -36.181 * s,x +   28.808 * s,y +  -36.181 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 58:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +   21.923 * s);
			_setf(o + ( 1 << 2), y +  -51.904 * s);
			_setf(o + ( 2 << 2), x +   38.183 * s);
			_setf(o + ( 3 << 2), y +  -51.904 * s);
			_setf(o + ( 4 << 2), x +   38.183 * s);
			_setf(o + ( 5 << 2), y +  -34.081 * s);
			_setf(o + ( 6 << 2), x +   21.923 * s);
			_setf(o + ( 7 << 2), y +  -34.081 * s);
			_setf(o + ( 8 << 2), x +   21.923 * s);
			_setf(o + ( 9 << 2), y +  -51.904 * s);
			_setf(o + (10 << 2), x +   21.923 * s);
			_setf(o + (11 << 2), y +  -17.920 * s);
			_setf(o + (12 << 2), x +   38.183 * s);
			_setf(o + (13 << 2), y +  -17.920 * s);
			_setf(o + (14 << 2), x +   38.183 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   21.923 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   21.923 * s);
			_setf(o + (19 << 2), y +  -17.920 * s);
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
			_setf(o + ( 0 << 2), x +   21.924 * s);
			_setf(o + ( 1 << 2), y +  -17.920 * s);
			_setf(o + ( 2 << 2), x +   38.183 * s);
			_setf(o + ( 3 << 2), y +  -17.920 * s);
			_setf(o + ( 4 << 2), x +   38.183 * s);
			_setf(o + ( 5 << 2), y +   -4.687 * s);
			_setf(o + ( 6 << 2), x +   28.613 * s);
			_setf(o + ( 7 << 2), y +   14.013 * s);
			_setf(o + ( 8 << 2), x +   18.115 * s);
			_setf(o + ( 9 << 2), y +   14.013 * s);
			_setf(o + (10 << 2), x +   21.924 * s);
			_setf(o + (11 << 2), y +   -4.687 * s);
			_setf(o + (12 << 2), x +   21.924 * s);
			_setf(o + (13 << 2), y +  -17.920 * s);
			_setf(o + (14 << 2), x +   21.924 * s);
			_setf(o + (15 << 2), y +  -51.904 * s);
			_setf(o + (16 << 2), x +   38.183 * s);
			_setf(o + (17 << 2), y +  -51.904 * s);
			_setf(o + (18 << 2), x +   38.183 * s);
			_setf(o + (19 << 2), y +  -34.081 * s);
			_setf(o + (20 << 2), x +   21.924 * s);
			_setf(o + (21 << 2), y +  -34.081 * s);
			_setf(o + (22 << 2), x +   21.924 * s);
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
			_setf(o + ( 1 << 2), y +  -45.214 * s);
			_setf(o + ( 2 << 2), x +   17.090 * s);
			_setf(o + ( 3 << 2), y +  -31.298 * s);
			_setf(o + ( 4 << 2), x +   55.908 * s);
			_setf(o + ( 5 << 2), y +  -17.480 * s);
			_setf(o + ( 6 << 2), x +   55.908 * s);
			_setf(o + ( 7 << 2), y +   -5.322 * s);
			_setf(o + ( 8 << 2), x +    4.297 * s);
			_setf(o + ( 9 << 2), y +  -25.586 * s);
			_setf(o + (10 << 2), x +    4.297 * s);
			_setf(o + (11 << 2), y +  -37.109 * s);
			_setf(o + (12 << 2), x +   55.908 * s);
			_setf(o + (13 << 2), y +  -57.421 * s);
			_setf(o + (14 << 2), x +   55.908 * s);
			_setf(o + (15 << 2), y +  -45.214 * s);
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
			_setf(o + ( 1 << 2), y +  -25.976 * s);
			_setf(o + ( 2 << 2), x +   55.907 * s);
			_setf(o + ( 3 << 2), y +  -25.976 * s);
			_setf(o + ( 4 << 2), x +   55.907 * s);
			_setf(o + ( 5 << 2), y +  -14.404 * s);
			_setf(o + ( 6 << 2), x +    4.296 * s);
			_setf(o + ( 7 << 2), y +  -14.404 * s);
			_setf(o + ( 8 << 2), x +    4.296 * s);
			_setf(o + ( 9 << 2), y +  -25.976 * s);
			_setf(o + (10 << 2), x +    4.296 * s);
			_setf(o + (11 << 2), y +  -48.193 * s);
			_setf(o + (12 << 2), x +   55.907 * s);
			_setf(o + (13 << 2), y +  -48.193 * s);
			_setf(o + (14 << 2), x +   55.907 * s);
			_setf(o + (15 << 2), y +  -36.718 * s);
			_setf(o + (16 << 2), x +    4.296 * s);
			_setf(o + (17 << 2), y +  -36.718 * s);
			_setf(o + (18 << 2), x +    4.296 * s);
			_setf(o + (19 << 2), y +  -48.193 * s);
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
			_setf(o + ( 1 << 2), y +  -45.214 * s);
			_setf(o + ( 2 << 2), x +    4.297 * s);
			_setf(o + ( 3 << 2), y +  -57.421 * s);
			_setf(o + ( 4 << 2), x +   55.907 * s);
			_setf(o + ( 5 << 2), y +  -37.109 * s);
			_setf(o + ( 6 << 2), x +   55.907 * s);
			_setf(o + ( 7 << 2), y +  -25.586 * s);
			_setf(o + ( 8 << 2), x +    4.297 * s);
			_setf(o + ( 9 << 2), y +   -5.322 * s);
			_setf(o + (10 << 2), x +    4.297 * s);
			_setf(o + (11 << 2), y +  -17.480 * s);
			_setf(o + (12 << 2), x +   43.114 * s);
			_setf(o + (13 << 2), y +  -31.298 * s);
			_setf(o + (14 << 2), x +    4.297 * s);
			_setf(o + (15 << 2), y +  -45.214 * s);
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
			
			o = _posf(16);
			_setf(o + ( 0 << 2), x +   21.484 * s);
			_setf(o + ( 1 << 2), y +  -13.818 * s);
			_setf(o + ( 2 << 2), x +   34.521 * s);
			_setf(o + ( 3 << 2), y +  -13.818 * s);
			_setf(o + ( 4 << 2), x +   34.521 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   21.484 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   21.484 * s);
			_setf(o + ( 9 << 2), y +  -13.818 * s);
			_setf(o + (10 << 2), x +   34.521 * s);
			_setf(o + (11 << 2), y +  -19.580 * s);
			_setf(o + (12 << 2), x +   21.484 * s);
			_setf(o + (13 << 2), y +  -19.580 * s);
			_setf(o + (14 << 2), x +   21.484 * s);
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
			_bez(x +   21.484 * s,y +  -27.099 * s,x +   21.484 * s,y +  -30.322 * s,x +   21.988 * s,y +  -33.072 * s,x +   22.998 * s,y +  -35.351 * s, threshold);
			_bez(x +   22.998 * s,y +  -35.351 * s,x +   24.007 * s,y +  -37.630 * s,x +   25.831 * s,y +  -40.020 * s,x +   28.417 * s,y +  -42.577 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   32.812 * s);
			_setf(o + ( 1 << 2), y +  -46.923 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   32.812 * s,y +  -46.923 * s,x +   34.842 * s,y +  -48.930 * s,x +   36.254 * s,y +  -50.553 * s,x +   36.987 * s,y +  -51.855 * s, threshold);
			_bez(x +   36.987 * s,y +  -51.855 * s,x +   37.719 * s,y +  -53.157 * s,x +   38.085 * s,y +  -54.508 * s,x +   38.085 * s,y +  -55.907 * s, threshold);
			_bez(x +   38.085 * s,y +  -55.907 * s,x +   38.085 * s,y +  -58.088 * s,x +   37.337 * s,y +  -59.732 * s,x +   35.839 * s,y +  -60.839 * s, threshold);
			_bez(x +   35.839 * s,y +  -60.839 * s,x +   34.342 * s,y +  -61.946 * s,x +   32.096 * s,y +  -62.499 * s,x +   29.101 * s,y +  -62.499 * s, threshold);
			_bez(x +   29.101 * s,y +  -62.499 * s,x +   26.367 * s,y +  -62.499 * s,x +   23.510 * s,y +  -61.921 * s,x +   20.532 * s,y +  -60.766 * s, threshold);
			_bez(x +   20.532 * s,y +  -60.766 * s,x +   17.553 * s,y +  -59.610 * s,x +   14.502 * s,y +  -57.893 * s,x +   11.377 * s,y +  -55.614 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   11.377 * s);
			_setf(o + ( 1 << 2), y +  -68.700 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   11.377 * s,y +  -68.700 * s,x +   14.567 * s,y +  -70.523 * s,x +   17.797 * s,y +  -71.898 * s,x +   21.069 * s,y +  -72.826 * s, threshold);
			_bez(x +   21.069 * s,y +  -72.826 * s,x +   24.340 * s,y +  -73.754 * s,x +   27.620 * s,y +  -74.218 * s,x +   30.908 * s,y +  -74.218 * s, threshold);
			_bez(x +   30.908 * s,y +  -74.218 * s,x +   37.483 * s,y +  -74.218 * s,x +   42.642 * s,y +  -72.688 * s,x +   46.386 * s,y +  -69.628 * s, threshold);
			_bez(x +   46.386 * s,y +  -69.628 * s,x +   50.129 * s,y +  -66.568 * s,x +   52.001 * s,y +  -62.353 * s,x +   52.001 * s,y +  -56.982 * s, threshold);
			_bez(x +   52.001 * s,y +  -56.982 * s,x +   52.001 * s,y +  -54.508 * s,x +   51.448 * s,y +  -52.205 * s,x +   50.341 * s,y +  -50.072 * s, threshold);
			_bez(x +   50.341 * s,y +  -50.072 * s,x +   49.234 * s,y +  -47.940 * s,x +   47.153 * s,y +  -45.374 * s,x +   44.091 * s,y +  -42.382 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   39.794 * s);
			_setf(o + ( 1 << 2), y +  -38.183 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   39.794 * s,y +  -38.183 * s,x +   37.588 * s,y +  -36.027 * s,x +   36.165 * s,y +  -34.277 * s,x +   35.546 * s,y +  -32.910 * s, threshold);
			_bez(x +   35.546 * s,y +  -32.910 * s,x +   34.928 * s,y +  -31.542 * s,x +   34.618 * s,y +  -29.866 * s,x +   34.618 * s,y +  -27.880 * s, threshold);
			_bez(x +   34.618 * s,y +  -27.880 * s,x +   34.618 * s,y +  -27.587 * s,x +   34.610 * s,y +  -27.246 * s,x +   34.594 * s,y +  -26.855 * s, threshold);
			_bez(x +   34.594 * s,y +  -26.855 * s,x +   34.578 * s,y +  -26.464 * s,x +   34.521 * s,y +  -26.042 * s,x +   34.521 * s,y +  -25.586 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   34.521 * s);
			_setf(o + ( 1 << 2), y +  -19.580 * s);
			_setf(o + ( 2 << 2), x +   60.204 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 64:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   47.509 * s);
			_setf(o + ( 1 << 2), y +  -26.611 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   47.509 * s,y +  -26.611 * s,x +   47.509 * s,y +  -30.289 * s,x +   46.679 * s,y +  -33.170 * s,x +   45.019 * s,y +  -35.253 * s, threshold);
			_bez(x +   45.019 * s,y +  -35.253 * s,x +   43.359 * s,y +  -37.337 * s,x +   41.080 * s,y +  -38.378 * s,x +   38.183 * s,y +  -38.378 * s, threshold);
			_bez(x +   38.183 * s,y +  -38.378 * s,x +   35.286 * s,y +  -38.378 * s,x +   33.015 * s,y +  -37.337 * s,x +   31.372 * s,y +  -35.253 * s, threshold);
			_bez(x +   31.372 * s,y +  -35.253 * s,x +   29.728 * s,y +  -33.170 * s,x +   28.906 * s,y +  -30.289 * s,x +   28.906 * s,y +  -26.611 * s, threshold);
			_bez(x +   28.906 * s,y +  -26.611 * s,x +   28.906 * s,y +  -22.900 * s,x +   29.728 * s,y +  -20.003 * s,x +   31.372 * s,y +  -17.920 * s, threshold);
			_bez(x +   31.372 * s,y +  -17.920 * s,x +   33.015 * s,y +  -15.836 * s,x +   35.286 * s,y +  -14.795 * s,x +   38.183 * s,y +  -14.795 * s, threshold);
			_bez(x +   38.183 * s,y +  -14.795 * s,x +   41.080 * s,y +  -14.795 * s,x +   43.359 * s,y +  -15.836 * s,x +   45.019 * s,y +  -17.920 * s, threshold);
			_bez(x +   45.019 * s,y +  -17.920 * s,x +   46.679 * s,y +  -20.003 * s,x +   47.509 * s,y +  -22.900 * s,x +   47.509 * s,y +  -26.611 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   56.591 * s);
			_setf(o + ( 1 << 2), y +   -6.592 * s);
			_setf(o + ( 2 << 2), x +   47.021 * s);
			_setf(o + ( 3 << 2), y +   -6.592 * s);
			_setf(o + ( 4 << 2), x +   47.021 * s);
			_setf(o + ( 5 << 2), y +  -10.596 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   47.021 * s,y +  -10.596 * s,x +   45.784 * s,y +   -8.870 * s,x +   44.327 * s,y +   -7.609 * s,x +   42.651 * s,y +   -6.811 * s, threshold);
			_bez(x +   42.651 * s,y +   -6.811 * s,x +   40.974 * s,y +   -6.014 * s,x +   38.964 * s,y +   -5.615 * s,x +   36.621 * s,y +   -5.615 * s, threshold);
			_bez(x +   36.621 * s,y +   -5.615 * s,x +   31.282 * s,y +   -5.615 * s,x +   26.977 * s,y +   -7.536 * s,x +   23.706 * s,y +  -11.377 * s, threshold);
			_bez(x +   23.706 * s,y +  -11.377 * s,x +   20.434 * s,y +  -15.218 * s,x +   18.799 * s,y +  -20.296 * s,x +   18.799 * s,y +  -26.611 * s, threshold);
			_bez(x +   18.799 * s,y +  -26.611 * s,x +   18.799 * s,y +  -32.893 * s,x +   20.426 * s,y +  -37.947 * s,x +   23.681 * s,y +  -41.772 * s, threshold);
			_bez(x +   23.681 * s,y +  -41.772 * s,x +   26.936 * s,y +  -45.597 * s,x +   31.249 * s,y +  -47.509 * s,x +   36.621 * s,y +  -47.509 * s, threshold);
			_bez(x +   36.621 * s,y +  -47.509 * s,x +   38.932 * s,y +  -47.509 * s,x +   40.966 * s,y +  -47.110 * s,x +   42.724 * s,y +  -46.313 * s, threshold);
			_bez(x +   42.724 * s,y +  -46.313 * s,x +   44.482 * s,y +  -45.515 * s,x +   45.914 * s,y +  -44.352 * s,x +   47.021 * s,y +  -42.822 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   47.021 * s);
			_setf(o + ( 1 << 2), y +  -44.824 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   47.021 * s,y +  -44.824 * s,x +   47.021 * s,y +  -49.250 * s,x +   45.808 * s,y +  -52.668 * s,x +   43.383 * s,y +  -55.077 * s, threshold);
			_bez(x +   43.383 * s,y +  -55.077 * s,x +   40.958 * s,y +  -57.486 * s,x +   37.500 * s,y +  -58.691 * s,x +   33.007 * s,y +  -58.691 * s, threshold);
			_bez(x +   33.007 * s,y +  -58.691 * s,x +   26.236 * s,y +  -58.691 * s,x +   20.711 * s,y +  -55.712 * s,x +   16.430 * s,y +  -49.755 * s, threshold);
			_bez(x +   16.430 * s,y +  -49.755 * s,x +   12.150 * s,y +  -43.798 * s,x +   10.010 * s,y +  -36.051 * s,x +   10.010 * s,y +  -26.513 * s, threshold);
			_bez(x +   10.010 * s,y +  -26.513 * s,x +   10.010 * s,y +  -16.520 * s,x +   12.484 * s,y +   -8.569 * s,x +   17.431 * s,y +   -2.661 * s, threshold);
			_bez(x +   17.431 * s,y +   -2.661 * s,x +   22.379 * s,y +    3.247 * s,x +   28.971 * s,y +    6.201 * s,x +   37.206 * s,y +    6.201 * s, threshold);
			_bez(x +   37.206 * s,y +    6.201 * s,x +   39.811 * s,y +    6.201 * s,x +   42.333 * s,y +    5.819 * s,x +   44.775 * s,y +    5.054 * s, threshold);
			_bez(x +   44.775 * s,y +    5.054 * s,x +   47.216 * s,y +    4.289 * s,x +   49.560 * s,y +    3.141 * s,x +   51.806 * s,y +    1.611 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   56.298 * s);
			_setf(o + ( 1 << 2), y +   10.205 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   56.298 * s,y +   10.205 * s,x +   53.661 * s,y +   11.995 * s,x +   50.789 * s,y +   13.338 * s,x +   47.680 * s,y +   14.233 * s, threshold);
			_bez(x +   47.680 * s,y +   14.233 * s,x +   44.571 * s,y +   15.128 * s,x +   41.243 * s,y +   15.576 * s,x +   37.695 * s,y +   15.576 * s, threshold);
			_bez(x +   37.695 * s,y +   15.576 * s,x +   26.302 * s,y +   15.576 * s,x +   17.220 * s,y +   11.784 * s,x +   10.449 * s,y +    4.199 * s, threshold);
			_bez(x +   10.449 * s,y +    4.199 * s,x +    3.678 * s,y +   -3.385 * s,x +    0.293 * s,y +  -13.623 * s,x +    0.293 * s,y +  -26.513 * s, threshold);
			_bez(x +    0.293 * s,y +  -26.513 * s,x +    0.293 * s,y +  -39.111 * s,x +    3.337 * s,y +  -49.194 * s,x +    9.424 * s,y +  -56.762 * s, threshold);
			_bez(x +    9.424 * s,y +  -56.762 * s,x +   15.511 * s,y +  -64.330 * s,x +   23.567 * s,y +  -68.114 * s,x +   33.593 * s,y +  -68.114 * s, threshold);
			_bez(x +   33.593 * s,y +  -68.114 * s,x +   40.689 * s,y +  -68.114 * s,x +   46.297 * s,y +  -65.974 * s,x +   50.414 * s,y +  -61.693 * s, threshold);
			_bez(x +   50.414 * s,y +  -61.693 * s,x +   54.532 * s,y +  -57.413 * s,x +   56.591 * s,y +  -51.578 * s,x +   56.591 * s,y +  -44.189 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   56.591 * s);
			_setf(o + ( 1 << 2), y +   -6.592 * s);
			_setf(o + ( 2 << 2), x +   60.204 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 65:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   30.078 * s);
			_setf(o + ( 1 << 2), y +  -59.716 * s);
			_setf(o + ( 2 << 2), x +   23.291 * s);
			_setf(o + ( 3 << 2), y +  -29.882 * s);
			_setf(o + ( 4 << 2), x +   36.913 * s);
			_setf(o + ( 5 << 2), y +  -29.882 * s);
			_setf(o + ( 6 << 2), x +   30.078 * s);
			_setf(o + ( 7 << 2), y +  -59.716 * s);
			_setf(o + ( 8 << 2), x +   21.289 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   38.915 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   58.593 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   44.189 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   39.697 * s);
			_setf(o + (17 << 2), y +  -18.017 * s);
			_setf(o + (18 << 2), x +   20.410 * s);
			_setf(o + (19 << 2), y +  -18.017 * s);
			_setf(o + (20 << 2), x +   16.015 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +    1.611 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   21.289 * s);
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
			_setf(o + ( 0 << 2), x +   20.019 * s);
			_setf(o + ( 1 << 2), y +  -33.105 * s);
			_setf(o + ( 2 << 2), x +   20.019 * s);
			_setf(o + ( 3 << 2), y +  -11.523 * s);
			_setf(o + ( 4 << 2), x +   29.589 * s);
			_setf(o + ( 5 << 2), y +  -11.523 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   29.589 * s,y +  -11.523 * s,x +   34.179 * s,y +  -11.523 * s,x +   37.394 * s,y +  -12.304 * s,x +   39.233 * s,y +  -13.867 * s, threshold);
			_bez(x +   39.233 * s,y +  -13.867 * s,x +   41.072 * s,y +  -15.429 * s,x +   41.992 * s,y +  -18.148 * s,x +   41.992 * s,y +  -22.021 * s, threshold);
			_bez(x +   41.992 * s,y +  -22.021 * s,x +   41.992 * s,y +  -25.960 * s,x +   41.031 * s,y +  -28.792 * s,x +   39.111 * s,y +  -30.517 * s, threshold);
			_bez(x +   39.111 * s,y +  -30.517 * s,x +   37.190 * s,y +  -32.242 * s,x +   34.016 * s,y +  -33.105 * s,x +   29.589 * s,y +  -33.105 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   20.019 * s);
			_setf(o + ( 1 << 2), y +  -33.105 * s);
			_setf(o + ( 2 << 2), x +   20.019 * s);
			_setf(o + ( 3 << 2), y +  -61.522 * s);
			_setf(o + ( 4 << 2), x +   20.019 * s);
			_setf(o + ( 5 << 2), y +  -44.579 * s);
			_setf(o + ( 6 << 2), x +   29.589 * s);
			_setf(o + ( 7 << 2), y +  -44.579 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_bez(x +   29.589 * s,y +  -44.579 * s,x +   33.235 * s,y +  -44.579 * s,x +   35.831 * s,y +  -45.230 * s,x +   37.377 * s,y +  -46.532 * s, threshold);
			_bez(x +   37.377 * s,y +  -46.532 * s,x +   38.924 * s,y +  -47.835 * s,x +   39.697 * s,y +  -49.983 * s,x +   39.697 * s,y +  -52.978 * s, threshold);
			_bez(x +   39.697 * s,y +  -52.978 * s,x +   39.697 * s,y +  -55.972 * s,x +   38.907 * s,y +  -58.145 * s,x +   37.329 * s,y +  -59.496 * s, threshold);
			_bez(x +   37.329 * s,y +  -59.496 * s,x +   35.750 * s,y +  -60.847 * s,x +   33.170 * s,y +  -61.522 * s,x +   29.589 * s,y +  -61.522 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   20.019 * s);
			_setf(o + ( 1 << 2), y +  -61.522 * s);
			_setf(o + ( 2 << 2), x +    6.103 * s);
			_setf(o + ( 3 << 2), y +  -72.997 * s);
			_setf(o + ( 4 << 2), x +   29.589 * s);
			_setf(o + ( 5 << 2), y +  -72.997 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_setb(o +  2, 2);
			_bez(x +   29.589 * s,y +  -72.997 * s,x +   37.695 * s,y +  -72.997 * s,x +   43.790 * s,y +  -71.459 * s,x +   47.875 * s,y +  -68.383 * s, threshold);
			_bez(x +   47.875 * s,y +  -68.383 * s,x +   51.961 * s,y +  -65.307 * s,x +   54.003 * s,y +  -60.709 * s,x +   54.003 * s,y +  -54.589 * s, threshold);
			_bez(x +   54.003 * s,y +  -54.589 * s,x +   54.003 * s,y +  -49.901 * s,x +   52.799 * s,y +  -46.240 * s,x +   50.390 * s,y +  -43.603 * s, threshold);
			_bez(x +   50.390 * s,y +  -43.603 * s,x +   47.981 * s,y +  -40.966 * s,x +   44.449 * s,y +  -39.436 * s,x +   39.794 * s,y +  -39.013 * s, threshold);
			_bez(x +   39.794 * s,y +  -39.013 * s,x +   45.361 * s,y +  -38.460 * s,x +   49.552 * s,y +  -36.588 * s,x +   52.368 * s,y +  -33.398 * s, threshold);
			_bez(x +   52.368 * s,y +  -33.398 * s,x +   55.183 * s,y +  -30.208 * s,x +   56.591 * s,y +  -25.748 * s,x +   56.591 * s,y +  -20.019 * s, threshold);
			_bez(x +   56.591 * s,y +  -20.019 * s,x +   56.591 * s,y +  -12.988 * s,x +   54.475 * s,y +   -7.894 * s,x +   50.244 * s,y +   -4.736 * s, threshold);
			_bez(x +   50.244 * s,y +   -4.736 * s,x +   46.012 * s,y +   -1.579 * s,x +   39.127 * s,y +       0. * s,x +   29.589 * s,y +       0. * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    6.103 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    6.103 * s);
			_setf(o + ( 3 << 2), y +  -72.997 * s);
			_setf(o + ( 4 << 2), x +   60.204 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 67:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   52.783 * s);
			_setf(o + ( 1 << 2), y +   -2.100 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   52.783 * s,y +   -2.100 * s,x +   50.504 * s,y +   -0.928 * s,x +   48.112 * s,y +   -0.049 * s,x +   45.605 * s,y +    0.537 * s, threshold);
			_bez(x +   45.605 * s,y +    0.537 * s,x +   43.099 * s,y +    1.123 * s,x +   40.462 * s,y +    1.416 * s,x +   37.695 * s,y +    1.416 * s, threshold);
			_bez(x +   37.695 * s,y +    1.416 * s,x +   27.865 * s,y +    1.416 * s,x +   20.361 * s,y +   -1.823 * s,x +   15.186 * s,y +   -8.301 * s, threshold);
			_bez(x +   15.186 * s,y +   -8.301 * s,x +   10.010 * s,y +  -14.778 * s,x +    7.422 * s,y +  -24.137 * s,x +    7.422 * s,y +  -36.376 * s, threshold);
			_bez(x +    7.422 * s,y +  -36.376 * s,x +    7.422 * s,y +  -48.648 * s,x +   10.010 * s,y +  -58.023 * s,x +   15.186 * s,y +  -64.501 * s, threshold);
			_bez(x +   15.186 * s,y +  -64.501 * s,x +   20.361 * s,y +  -70.979 * s,x +   27.865 * s,y +  -74.218 * s,x +   37.695 * s,y +  -74.218 * s, threshold);
			_bez(x +   37.695 * s,y +  -74.218 * s,x +   40.462 * s,y +  -74.218 * s,x +   43.115 * s,y +  -73.925 * s,x +   45.654 * s,y +  -73.339 * s, threshold);
			_bez(x +   45.654 * s,y +  -73.339 * s,x +   48.193 * s,y +  -72.753 * s,x +   50.569 * s,y +  -71.874 * s,x +   52.783 * s,y +  -70.702 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   52.783 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   52.783 * s,y +  -54.687 * s,x +   50.309 * s,y +  -56.965 * s,x +   47.908 * s,y +  -58.634 * s,x +   45.581 * s,y +  -59.691 * s, threshold);
			_bez(x +   45.581 * s,y +  -59.691 * s,x +   43.253 * s,y +  -60.749 * s,x +   40.852 * s,y +  -61.278 * s,x +   38.379 * s,y +  -61.278 * s, threshold);
			_bez(x +   38.379 * s,y +  -61.278 * s,x +   33.105 * s,y +  -61.278 * s,x +   29.126 * s,y +  -59.187 * s,x +   26.440 * s,y +  -55.004 * s, threshold);
			_bez(x +   26.440 * s,y +  -55.004 * s,x +   23.755 * s,y +  -50.821 * s,x +   22.412 * s,y +  -44.612 * s,x +   22.412 * s,y +  -36.376 * s, threshold);
			_bez(x +   22.412 * s,y +  -36.376 * s,x +   22.412 * s,y +  -28.173 * s,x +   23.755 * s,y +  -21.980 * s,x +   26.440 * s,y +  -17.798 * s, threshold);
			_bez(x +   26.440 * s,y +  -17.798 * s,x +   29.126 * s,y +  -13.615 * s,x +   33.105 * s,y +  -11.523 * s,x +   38.379 * s,y +  -11.523 * s, threshold);
			_bez(x +   38.379 * s,y +  -11.523 * s,x +   40.852 * s,y +  -11.523 * s,x +   43.253 * s,y +  -12.052 * s,x +   45.581 * s,y +  -13.110 * s, threshold);
			_bez(x +   45.581 * s,y +  -13.110 * s,x +   47.908 * s,y +  -14.168 * s,x +   50.309 * s,y +  -15.836 * s,x +   52.783 * s,y +  -18.115 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   52.783 * s);
			_setf(o + ( 1 << 2), y +   -2.100 * s);
			_setf(o + ( 2 << 2), x +   60.204 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 68:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   21.094 * s);
			_setf(o + ( 1 << 2), y +  -59.911 * s);
			_setf(o + ( 2 << 2), x +   21.094 * s);
			_setf(o + ( 3 << 2), y +  -12.988 * s);
			_setf(o + ( 4 << 2), x +   25.000 * s);
			_setf(o + ( 5 << 2), y +  -12.988 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   25.000 * s,y +  -12.988 * s,x +   30.664 * s,y +  -12.988 * s,x +   34.700 * s,y +  -14.770 * s,x +   37.109 * s,y +  -18.335 * s, threshold);
			_bez(x +   37.109 * s,y +  -18.335 * s,x +   39.518 * s,y +  -21.899 * s,x +   40.722 * s,y +  -27.962 * s,x +   40.722 * s,y +  -36.523 * s, threshold);
			_bez(x +   40.722 * s,y +  -36.523 * s,x +   40.722 * s,y +  -45.019 * s,x +   39.518 * s,y +  -51.041 * s,x +   37.109 * s,y +  -54.589 * s, threshold);
			_bez(x +   37.109 * s,y +  -54.589 * s,x +   34.700 * s,y +  -58.137 * s,x +   30.664 * s,y +  -59.911 * s,x +   25.000 * s,y +  -59.911 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   21.094 * s);
			_setf(o + ( 1 << 2), y +  -59.911 * s);
			_setf(o + ( 2 << 2), x +    6.690 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   22.119 * s);
			_setf(o + ( 5 << 2), y +  -72.899 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_setb(o +  2, 2);
			_bez(x +   22.119 * s,y +  -72.899 * s,x +   34.033 * s,y +  -72.899 * s,x +   42.610 * s,y +  -70.059 * s,x +   47.851 * s,y +  -64.379 * s, threshold);
			_bez(x +   47.851 * s,y +  -64.379 * s,x +   53.092 * s,y +  -58.699 * s,x +   55.712 * s,y +  -49.414 * s,x +   55.712 * s,y +  -36.523 * s, threshold);
			_bez(x +   55.712 * s,y +  -36.523 * s,x +   55.712 * s,y +  -23.600 * s,x +   53.092 * s,y +  -14.282 * s,x +   47.851 * s,y +   -8.569 * s, threshold);
			_bez(x +   47.851 * s,y +   -8.569 * s,x +   42.610 * s,y +   -2.856 * s,x +   34.033 * s,y +       0. * s,x +   22.119 * s,y +       0. * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    6.690 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    6.690 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   60.205 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 69:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   53.612 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    8.203 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    8.203 * s);
			_setf(o + ( 5 << 2), y +  -72.899 * s);
			_setf(o + ( 6 << 2), x +   53.612 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   53.612 * s);
			_setf(o + ( 9 << 2), y +  -60.204 * s);
			_setf(o + (10 << 2), x +   22.607 * s);
			_setf(o + (11 << 2), y +  -60.204 * s);
			_setf(o + (12 << 2), x +   22.607 * s);
			_setf(o + (13 << 2), y +  -44.482 * s);
			_setf(o + (14 << 2), x +   50.682 * s);
			_setf(o + (15 << 2), y +  -44.482 * s);
			_setf(o + (16 << 2), x +   50.682 * s);
			_setf(o + (17 << 2), y +  -31.787 * s);
			_setf(o + (18 << 2), x +   22.607 * s);
			_setf(o + (19 << 2), y +  -31.787 * s);
			_setf(o + (20 << 2), x +   22.607 * s);
			_setf(o + (21 << 2), y +  -12.695 * s);
			_setf(o + (22 << 2), x +   53.612 * s);
			_setf(o + (23 << 2), y +  -12.695 * s);
			_setf(o + (24 << 2), x +   53.612 * s);
			_setf(o + (25 << 2), y +       0. * s);
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
			_setf(o + ( 0 << 2), x +   54.296 * s);
			_setf(o + ( 1 << 2), y +  -60.204 * s);
			_setf(o + ( 2 << 2), x +   23.290 * s);
			_setf(o + ( 3 << 2), y +  -60.204 * s);
			_setf(o + ( 4 << 2), x +   23.290 * s);
			_setf(o + ( 5 << 2), y +  -44.482 * s);
			_setf(o + ( 6 << 2), x +   51.513 * s);
			_setf(o + ( 7 << 2), y +  -44.482 * s);
			_setf(o + ( 8 << 2), x +   51.513 * s);
			_setf(o + ( 9 << 2), y +  -31.787 * s);
			_setf(o + (10 << 2), x +   23.290 * s);
			_setf(o + (11 << 2), y +  -31.787 * s);
			_setf(o + (12 << 2), x +   23.290 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +    8.886 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +    8.886 * s);
			_setf(o + (17 << 2), y +  -72.899 * s);
			_setf(o + (18 << 2), x +   54.296 * s);
			_setf(o + (19 << 2), y +  -72.899 * s);
			_setf(o + (20 << 2), x +   54.296 * s);
			_setf(o + (21 << 2), y +  -60.204 * s);
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
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   42.577 * s);
			_setf(o + ( 1 << 2), y +  -13.183 * s);
			_setf(o + ( 2 << 2), x +   42.577 * s);
			_setf(o + ( 3 << 2), y +  -27.099 * s);
			_setf(o + ( 4 << 2), x +   32.714 * s);
			_setf(o + ( 5 << 2), y +  -27.099 * s);
			_setf(o + ( 6 << 2), x +   32.714 * s);
			_setf(o + ( 7 << 2), y +  -39.208 * s);
			_setf(o + ( 8 << 2), x +   55.175 * s);
			_setf(o + ( 9 << 2), y +  -39.208 * s);
			_setf(o + (10 << 2), x +   55.175 * s);
			_setf(o + (11 << 2), y +   -5.810 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_bez(x +   55.175 * s,y +   -5.810 * s,x +   52.408 * s,y +   -3.434 * s,x +   49.356 * s,y +   -1.636 * s,x +   46.020 * s,y +   -0.415 * s, threshold);
			_bez(x +   46.020 * s,y +   -0.415 * s,x +   42.683 * s,y +    0.806 * s,x +   39.111 * s,y +    1.416 * s,x +   35.302 * s,y +    1.416 * s, threshold);
			_bez(x +   35.302 * s,y +    1.416 * s,x +   25.862 * s,y +    1.416 * s,x +   18.571 * s,y +   -1.864 * s,x +   13.427 * s,y +   -8.423 * s, threshold);
			_bez(x +   13.427 * s,y +   -8.423 * s,x +    8.284 * s,y +  -14.982 * s,x +    5.713 * s,y +  -24.300 * s,x +    5.713 * s,y +  -36.376 * s, threshold);
			_bez(x +    5.713 * s,y +  -36.376 * s,x +    5.713 * s,y +  -48.648 * s,x +    8.309 * s,y +  -58.023 * s,x +   13.501 * s,y +  -64.501 * s, threshold);
			_bez(x +   13.501 * s,y +  -64.501 * s,x +   18.693 * s,y +  -70.979 * s,x +   26.188 * s,y +  -74.218 * s,x +   35.986 * s,y +  -74.218 * s, threshold);
			_bez(x +   35.986 * s,y +  -74.218 * s,x +   38.915 * s,y +  -74.218 * s,x +   41.796 * s,y +  -73.803 * s,x +   44.628 * s,y +  -72.973 * s, threshold);
			_bez(x +   44.628 * s,y +  -72.973 * s,x +   47.460 * s,y +  -72.142 * s,x +   50.113 * s,y +  -70.946 * s,x +   52.587 * s,y +  -69.384 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   52.587 * s);
			_setf(o + ( 1 << 2), y +  -53.417 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   52.587 * s,y +  -53.417 * s,x +   50.569 * s,y +  -56.021 * s,x +   48.249 * s,y +  -57.983 * s,x +   45.629 * s,y +  -59.301 * s, threshold);
			_bez(x +   45.629 * s,y +  -59.301 * s,x +   43.009 * s,y +  -60.619 * s,x +   40.136 * s,y +  -61.278 * s,x +   37.011 * s,y +  -61.278 * s, threshold);
			_bez(x +   37.011 * s,y +  -61.278 * s,x +   31.542 * s,y +  -61.278 * s,x +   27.457 * s,y +  -59.219 * s,x +   24.755 * s,y +  -55.102 * s, threshold);
			_bez(x +   24.755 * s,y +  -55.102 * s,x +   22.054 * s,y +  -50.984 * s,x +   20.703 * s,y +  -44.742 * s,x +   20.703 * s,y +  -36.376 * s, threshold);
			_bez(x +   20.703 * s,y +  -36.376 * s,x +   20.703 * s,y +  -28.271 * s,x +   22.005 * s,y +  -22.103 * s,x +   24.609 * s,y +  -17.871 * s, threshold);
			_bez(x +   24.609 * s,y +  -17.871 * s,x +   27.213 * s,y +  -13.639 * s,x +   31.005 * s,y +  -11.523 * s,x +   35.986 * s,y +  -11.523 * s, threshold);
			_bez(x +   35.986 * s,y +  -11.523 * s,x +   37.483 * s,y +  -11.523 * s,x +   38.785 * s,y +  -11.662 * s,x +   39.892 * s,y +  -11.938 * s, threshold);
			_bez(x +   39.892 * s,y +  -11.938 * s,x +   40.999 * s,y +  -12.215 * s,x +   41.894 * s,y +  -12.630 * s,x +   42.577 * s,y +  -13.183 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 72:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +    6.689 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   21.093 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   21.093 * s);
			_setf(o + ( 5 << 2), y +  -45.116 * s);
			_setf(o + ( 6 << 2), x +   39.111 * s);
			_setf(o + ( 7 << 2), y +  -45.116 * s);
			_setf(o + ( 8 << 2), x +   39.111 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   53.515 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   53.515 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   39.111 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   39.111 * s);
			_setf(o + (17 << 2), y +  -32.421 * s);
			_setf(o + (18 << 2), x +   21.093 * s);
			_setf(o + (19 << 2), y +  -32.421 * s);
			_setf(o + (20 << 2), x +   21.093 * s);
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
			_setf(o + ( 0 << 2), x +    8.398 * s);
			_setf(o + ( 1 << 2), y +  -60.204 * s);
			_setf(o + ( 2 << 2), x +    8.398 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   51.806 * s);
			_setf(o + ( 5 << 2), y +  -72.899 * s);
			_setf(o + ( 6 << 2), x +   51.806 * s);
			_setf(o + ( 7 << 2), y +  -60.204 * s);
			_setf(o + ( 8 << 2), x +   37.304 * s);
			_setf(o + ( 9 << 2), y +  -60.204 * s);
			_setf(o + (10 << 2), x +   37.304 * s);
			_setf(o + (11 << 2), y +  -12.695 * s);
			_setf(o + (12 << 2), x +   51.806 * s);
			_setf(o + (13 << 2), y +  -12.695 * s);
			_setf(o + (14 << 2), x +   51.806 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +    8.398 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +    8.398 * s);
			_setf(o + (19 << 2), y +  -12.695 * s);
			_setf(o + (20 << 2), x +   22.900 * s);
			_setf(o + (21 << 2), y +  -12.695 * s);
			_setf(o + (22 << 2), x +   22.900 * s);
			_setf(o + (23 << 2), y +  -60.204 * s);
			_setf(o + (24 << 2), x +    8.398 * s);
			_setf(o + (25 << 2), y +  -60.204 * s);
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
			_setf(o + ( 1 << 2), y +   -3.613 * s);
			_setf(o + ( 2 << 2), x +    5.322 * s);
			_setf(o + ( 3 << 2), y +  -20.312 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +    5.322 * s,y +  -20.312 * s,x +    8.122 * s,y +  -17.448 * s,x +   11.108 * s,y +  -15.267 * s,x +   14.282 * s,y +  -13.769 * s, threshold);
			_bez(x +   14.282 * s,y +  -13.769 * s,x +   17.456 * s,y +  -12.272 * s,x +   20.654 * s,y +  -11.523 * s,x +   23.877 * s,y +  -11.523 * s, threshold);
			_bez(x +   23.877 * s,y +  -11.523 * s,x +   27.653 * s,y +  -11.523 * s,x +   30.419 * s,y +  -12.467 * s,x +   32.177 * s,y +  -14.355 * s, threshold);
			_bez(x +   32.177 * s,y +  -14.355 * s,x +   33.935 * s,y +  -16.243 * s,x +   34.814 * s,y +  -19.254 * s,x +   34.814 * s,y +  -23.388 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   34.814 * s);
			_setf(o + ( 1 << 2), y +  -60.204 * s);
			_setf(o + ( 2 << 2), x +   17.187 * s);
			_setf(o + ( 3 << 2), y +  -60.204 * s);
			_setf(o + ( 4 << 2), x +   17.187 * s);
			_setf(o + ( 5 << 2), y +  -72.899 * s);
			_setf(o + ( 6 << 2), x +   49.218 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   49.218 * s);
			_setf(o + ( 9 << 2), y +  -23.388 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   49.218 * s,y +  -23.388 * s,x +   49.218 * s,y +  -14.502 * s,x +   47.355 * s,y +   -8.146 * s,x +   43.627 * s,y +   -4.321 * s, threshold);
			_bez(x +   43.627 * s,y +   -4.321 * s,x +   39.900 * s,y +   -0.496 * s,x +   33.756 * s,y +    1.416 * s,x +   25.195 * s,y +    1.416 * s, threshold);
			_bez(x +   25.195 * s,y +    1.416 * s,x +   22.102 * s,y +    1.416 * s,x +   18.872 * s,y +    0.993 * s,x +   15.503 * s,y +    0.146 * s, threshold);
			_bez(x +   15.503 * s,y +    0.146 * s,x +   12.134 * s,y +   -0.700 * s,x +    8.740 * s,y +   -1.953 * s,x +    5.322 * s,y +   -3.613 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 75:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +    5.713 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   20.117 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   20.117 * s);
			_setf(o + ( 5 << 2), y +  -44.091 * s);
			_setf(o + ( 6 << 2), x +   42.675 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   58.984 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   35.986 * s);
			_setf(o + (11 << 2), y +  -44.189 * s);
			_setf(o + (12 << 2), x +   59.814 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   43.798 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   26.514 * s);
			_setf(o + (17 << 2), y +  -32.812 * s);
			_setf(o + (18 << 2), x +   20.117 * s);
			_setf(o + (19 << 2), y +  -24.707 * s);
			_setf(o + (20 << 2), x +   20.117 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +    5.713 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +    5.713 * s);
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
			_setf(o + ( 0 << 2), x +   10.987 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   10.987 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   25.391 * s);
			_setf(o + ( 5 << 2), y +  -72.899 * s);
			_setf(o + ( 6 << 2), x +   25.391 * s);
			_setf(o + ( 7 << 2), y +  -12.695 * s);
			_setf(o + ( 8 << 2), x +   56.201 * s);
			_setf(o + ( 9 << 2), y +  -12.695 * s);
			_setf(o + (10 << 2), x +   56.201 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   10.987 * s);
			_setf(o + (13 << 2), y +       0. * s);
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
			_setf(o + ( 2 << 2), x +   21.386 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   30.077 * s);
			_setf(o + ( 5 << 2), y +  -40.917 * s);
			_setf(o + ( 6 << 2), x +   38.720 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   56.005 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   56.005 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   43.602 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   43.602 * s);
			_setf(o + (15 << 2), y +  -58.398 * s);
			_setf(o + (16 << 2), x +   35.888 * s);
			_setf(o + (17 << 2), y +  -26.513 * s);
			_setf(o + (18 << 2), x +   24.413 * s);
			_setf(o + (19 << 2), y +  -26.513 * s);
			_setf(o + (20 << 2), x +   16.601 * s);
			_setf(o + (21 << 2), y +  -58.398 * s);
			_setf(o + (22 << 2), x +   16.601 * s);
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
			_setf(o + ( 0 << 2), x +    5.810 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   21.288 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   41.601 * s);
			_setf(o + ( 5 << 2), y +  -19.922 * s);
			_setf(o + ( 6 << 2), x +   41.601 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   54.296 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   54.296 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   38.915 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   18.505 * s);
			_setf(o + (15 << 2), y +  -52.978 * s);
			_setf(o + (16 << 2), x +   18.505 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +    5.810 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +    5.810 * s);
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
			_setf(o + ( 0 << 2), x +   30.078 * s);
			_setf(o + ( 1 << 2), y +  -61.278 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   30.078 * s,y +  -61.278 * s,x +   26.399 * s,y +  -61.278 * s,x +   23.714 * s,y +  -59.317 * s,x +   22.021 * s,y +  -55.395 * s, threshold);
			_bez(x +   22.021 * s,y +  -55.395 * s,x +   20.328 * s,y +  -51.472 * s,x +   19.482 * s,y +  -45.133 * s,x +   19.482 * s,y +  -36.376 * s, threshold);
			_bez(x +   19.482 * s,y +  -36.376 * s,x +   19.482 * s,y +  -27.653 * s,x +   20.328 * s,y +  -21.329 * s,x +   22.021 * s,y +  -17.407 * s, threshold);
			_bez(x +   22.021 * s,y +  -17.407 * s,x +   23.714 * s,y +  -13.484 * s,x +   26.399 * s,y +  -11.523 * s,x +   30.078 * s,y +  -11.523 * s, threshold);
			_bez(x +   30.078 * s,y +  -11.523 * s,x +   33.789 * s,y +  -11.523 * s,x +   36.490 * s,y +  -13.484 * s,x +   38.183 * s,y +  -17.407 * s, threshold);
			_bez(x +   38.183 * s,y +  -17.407 * s,x +   39.876 * s,y +  -21.329 * s,x +   40.722 * s,y +  -27.653 * s,x +   40.722 * s,y +  -36.376 * s, threshold);
			_bez(x +   40.722 * s,y +  -36.376 * s,x +   40.722 * s,y +  -45.133 * s,x +   39.876 * s,y +  -51.472 * s,x +   38.183 * s,y +  -55.395 * s, threshold);
			_bez(x +   38.183 * s,y +  -55.395 * s,x +   36.490 * s,y +  -59.317 * s,x +   33.789 * s,y +  -61.278 * s,x +   30.078 * s,y +  -61.278 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    4.492 * s);
			_setf(o + ( 1 << 2), y +  -36.376 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +    4.492 * s,y +  -36.376 * s,x +    4.492 * s,y +  -48.843 * s,x +    6.649 * s,y +  -58.267 * s,x +   10.962 * s,y +  -64.647 * s, threshold);
			_bez(x +   10.962 * s,y +  -64.647 * s,x +   15.275 * s,y +  -71.028 * s,x +   21.647 * s,y +  -74.218 * s,x +   30.078 * s,y +  -74.218 * s, threshold);
			_bez(x +   30.078 * s,y +  -74.218 * s,x +   38.541 * s,y +  -74.218 * s,x +   44.929 * s,y +  -71.028 * s,x +   49.242 * s,y +  -64.647 * s, threshold);
			_bez(x +   49.242 * s,y +  -64.647 * s,x +   53.555 * s,y +  -58.267 * s,x +   55.712 * s,y +  -48.843 * s,x +   55.712 * s,y +  -36.376 * s, threshold);
			_bez(x +   55.712 * s,y +  -36.376 * s,x +   55.712 * s,y +  -23.942 * s,x +   53.555 * s,y +  -14.534 * s,x +   49.242 * s,y +   -8.154 * s, threshold);
			_bez(x +   49.242 * s,y +   -8.154 * s,x +   44.929 * s,y +   -1.774 * s,x +   38.541 * s,y +    1.416 * s,x +   30.078 * s,y +    1.416 * s, threshold);
			_bez(x +   30.078 * s,y +    1.416 * s,x +   21.647 * s,y +    1.416 * s,x +   15.275 * s,y +   -1.774 * s,x +   10.962 * s,y +   -8.154 * s, threshold);
			_bez(x +   10.962 * s,y +   -8.154 * s,x +    6.649 * s,y +  -14.534 * s,x +    4.492 * s,y +  -23.942 * s,x +    4.492 * s,y +  -36.376 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 80:
			
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   22.314 * s);
			_setf(o + ( 1 << 2), y +  -60.790 * s);
			_setf(o + ( 2 << 2), x +   22.314 * s);
			_setf(o + ( 3 << 2), y +  -39.404 * s);
			_setf(o + ( 4 << 2), x +   28.222 * s);
			_setf(o + ( 5 << 2), y +  -39.404 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   28.222 * s,y +  -39.404 * s,x +   32.942 * s,y +  -39.404 * s,x +   36.254 * s,y +  -40.201 * s,x +   38.159 * s,y +  -41.796 * s, threshold);
			_bez(x +   38.159 * s,y +  -41.796 * s,x +   40.063 * s,y +  -43.391 * s,x +   41.015 * s,y +  -46.158 * s,x +   41.015 * s,y +  -50.097 * s, threshold);
			_bez(x +   41.015 * s,y +  -50.097 * s,x +   41.015 * s,y +  -54.036 * s,x +   40.063 * s,y +  -56.803 * s,x +   38.159 * s,y +  -58.398 * s, threshold);
			_bez(x +   38.159 * s,y +  -58.398 * s,x +   36.254 * s,y +  -59.993 * s,x +   32.942 * s,y +  -60.790 * s,x +   28.222 * s,y +  -60.790 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   22.314 * s);
			_setf(o + ( 1 << 2), y +  -60.790 * s);
			_setf(o + ( 2 << 2), x +    7.910 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   27.685 * s);
			_setf(o + ( 5 << 2), y +  -72.899 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_setb(o +  2, 2);
			_bez(x +   27.685 * s,y +  -72.899 * s,x +   37.744 * s,y +  -72.899 * s,x +   44.978 * s,y +  -71.109 * s,x +   49.389 * s,y +  -67.528 * s, threshold);
			_bez(x +   49.389 * s,y +  -67.528 * s,x +   53.800 * s,y +  -63.948 * s,x +   56.005 * s,y +  -58.137 * s,x +   56.005 * s,y +  -50.097 * s, threshold);
			_bez(x +   56.005 * s,y +  -50.097 * s,x +   56.005 * s,y +  -42.057 * s,x +   53.800 * s,y +  -36.246 * s,x +   49.389 * s,y +  -32.666 * s, threshold);
			_bez(x +   49.389 * s,y +  -32.666 * s,x +   44.978 * s,y +  -29.085 * s,x +   37.744 * s,y +  -27.294 * s,x +   27.685 * s,y +  -27.294 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   22.314 * s);
			_setf(o + ( 1 << 2), y +  -27.294 * s);
			_setf(o + ( 2 << 2), x +   22.314 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    7.910 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    7.910 * s);
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
			_setf(o + ( 0 << 2), x +   32.031 * s);
			_setf(o + ( 1 << 2), y +    1.123 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   32.031 * s,y +    1.123 * s,x +   31.575 * s,y +    1.221 * s,x +   31.193 * s,y +    1.294 * s,x +   30.883 * s,y +    1.343 * s, threshold);
			_bez(x +   30.883 * s,y +    1.343 * s,x +   30.574 * s,y +    1.392 * s,x +   30.273 * s,y +    1.416 * s,x +   29.980 * s,y +    1.416 * s, threshold);
			_bez(x +   29.980 * s,y +    1.416 * s,x +   21.614 * s,y +    1.416 * s,x +   15.275 * s,y +   -1.774 * s,x +   10.962 * s,y +   -8.154 * s, threshold);
			_bez(x +   10.962 * s,y +   -8.154 * s,x +    6.649 * s,y +  -14.534 * s,x +    4.492 * s,y +  -23.942 * s,x +    4.492 * s,y +  -36.376 * s, threshold);
			_bez(x +    4.492 * s,y +  -36.376 * s,x +    4.492 * s,y +  -48.843 * s,x +    6.649 * s,y +  -58.267 * s,x +   10.962 * s,y +  -64.647 * s, threshold);
			_bez(x +   10.962 * s,y +  -64.647 * s,x +   15.275 * s,y +  -71.027 * s,x +   21.647 * s,y +  -74.218 * s,x +   30.078 * s,y +  -74.218 * s, threshold);
			_bez(x +   30.078 * s,y +  -74.218 * s,x +   38.541 * s,y +  -74.218 * s,x +   44.929 * s,y +  -71.027 * s,x +   49.242 * s,y +  -64.647 * s, threshold);
			_bez(x +   49.242 * s,y +  -64.647 * s,x +   53.555 * s,y +  -58.267 * s,x +   55.712 * s,y +  -48.844 * s,x +   55.712 * s,y +  -36.376 * s, threshold);
			_bez(x +   55.712 * s,y +  -36.376 * s,x +   55.712 * s,y +  -27.815 * s,x +   54.687 * s,y +  -20.646 * s,x +   52.636 * s,y +  -14.868 * s, threshold);
			_bez(x +   52.636 * s,y +  -14.868 * s,x +   50.585 * s,y +   -9.090 * s,x +   47.607 * s,y +   -4.964 * s,x +   43.700 * s,y +   -2.490 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   52.782 * s);
			_setf(o + ( 1 << 2), y +    6.396 * s);
			_setf(o + ( 2 << 2), x +   42.919 * s);
			_setf(o + ( 3 << 2), y +   13.720 * s);
			_setf(o + ( 4 << 2), x +   32.031 * s);
			_setf(o + ( 5 << 2), y +    1.123 * s);
			_setf(o + ( 6 << 2), x +   30.078 * s);
			_setf(o + ( 7 << 2), y +  -61.278 * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			_bez(x +   30.078 * s,y +  -61.278 * s,x +   26.399 * s,y +  -61.278 * s,x +   23.714 * s,y +  -59.317 * s,x +   22.021 * s,y +  -55.395 * s, threshold);
			_bez(x +   22.021 * s,y +  -55.395 * s,x +   20.328 * s,y +  -51.472 * s,x +   19.482 * s,y +  -45.132 * s,x +   19.482 * s,y +  -36.376 * s, threshold);
			_bez(x +   19.482 * s,y +  -36.376 * s,x +   19.482 * s,y +  -27.653 * s,x +   20.328 * s,y +  -21.329 * s,x +   22.021 * s,y +  -17.407 * s, threshold);
			_bez(x +   22.021 * s,y +  -17.407 * s,x +   23.714 * s,y +  -13.484 * s,x +   26.399 * s,y +  -11.523 * s,x +   30.078 * s,y +  -11.523 * s, threshold);
			_bez(x +   30.078 * s,y +  -11.523 * s,x +   33.789 * s,y +  -11.523 * s,x +   36.490 * s,y +  -13.484 * s,x +   38.183 * s,y +  -17.407 * s, threshold);
			_bez(x +   38.183 * s,y +  -17.407 * s,x +   39.876 * s,y +  -21.329 * s,x +   40.722 * s,y +  -27.653 * s,x +   40.722 * s,y +  -36.376 * s, threshold);
			_bez(x +   40.722 * s,y +  -36.376 * s,x +   40.722 * s,y +  -45.132 * s,x +   39.876 * s,y +  -51.472 * s,x +   38.183 * s,y +  -55.395 * s, threshold);
			_bez(x +   38.183 * s,y +  -55.395 * s,x +   36.490 * s,y +  -59.317 * s,x +   33.789 * s,y +  -61.278 * s,x +   30.078 * s,y +  -61.278 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 82:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   39.404 * s);
			_setf(o + ( 1 << 2), y +  -34.423 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   39.404 * s,y +  -34.423 * s,x +   40.836 * s,y +  -34.130 * s,x +   42.081 * s,y +  -33.455 * s,x +   43.139 * s,y +  -32.397 * s, threshold);
			_bez(x +   43.139 * s,y +  -32.397 * s,x +   44.197 * s,y +  -31.339 * s,x +   45.484 * s,y +  -29.277 * s,x +   47.021 * s,y +  -26.220 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   44.384 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   35.595 * s);
			_setf(o + ( 5 << 2), y +  -18.408 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   35.595 * s,y +  -18.408 * s,x +   35.344 * s,y +  -18.933 * s,x +   34.995 * s,y +  -19.646 * s,x +   34.570 * s,y +  -20.556 * s, threshold);
			_bez(x +   34.570 * s,y +  -20.556 * s,x +   32.000 * s,y +  -26.058 * s,x +   28.971 * s,y +  -28.808 * s,x +   25.488 * s,y +  -28.808 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   20.898 * s);
			_setf(o + ( 1 << 2), y +  -28.808 * s);
			_setf(o + ( 2 << 2), x +   20.898 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    6.494 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    6.494 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   27.294 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   27.294 * s,y +  -72.899 * s,x +   36.670 * s,y +  -72.899 * s,x +   43.400 * s,y +  -71.239 * s,x +   47.485 * s,y +  -67.919 * s, threshold);
			_bez(x +   47.485 * s,y +  -67.919 * s,x +   51.570 * s,y +  -64.599 * s,x +   53.613 * s,y +  -59.195 * s,x +   53.613 * s,y +  -51.708 * s, threshold);
			_bez(x +   53.613 * s,y +  -51.708 * s,x +   53.613 * s,y +  -46.695 * s,x +   52.392 * s,y +  -42.708 * s,x +   49.951 * s,y +  -39.745 * s, threshold);
			_bez(x +   49.951 * s,y +  -39.745 * s,x +   47.509 * s,y +  -36.783 * s,x +   43.994 * s,y +  -35.009 * s,x +   39.404 * s,y +  -34.423 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   20.898 * s);
			_setf(o + ( 1 << 2), y +  -60.790 * s);
			_setf(o + ( 2 << 2), x +   20.898 * s);
			_setf(o + ( 3 << 2), y +  -40.917 * s);
			_setf(o + ( 4 << 2), x +   27.685 * s);
			_setf(o + ( 5 << 2), y +  -40.917 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   27.685 * s,y +  -40.917 * s,x +   31.624 * s,y +  -40.917 * s,x +   34.448 * s,y +  -41.690 * s,x +   36.157 * s,y +  -43.237 * s, threshold);
			_bez(x +   36.157 * s,y +  -43.237 * s,x +   37.866 * s,y +  -44.783 * s,x +   38.720 * s,y +  -47.330 * s,x +   38.720 * s,y +  -50.878 * s, threshold);
			_bez(x +   38.720 * s,y +  -50.878 * s,x +   38.720 * s,y +  -54.426 * s,x +   37.874 * s,y +  -56.965 * s,x +   36.181 * s,y +  -58.495 * s, threshold);
			_bez(x +   36.181 * s,y +  -58.495 * s,x +   34.489 * s,y +  -60.025 * s,x +   31.656 * s,y +  -60.790 * s,x +   27.685 * s,y +  -60.790 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   20.898 * s);
			_setf(o + ( 1 << 2), y +  -60.790 * s);
			_setf(o + ( 2 << 2), x +   60.204 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 83:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   24.902 * s);
			_setf(o + ( 1 << 2), y +  -31.982 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   24.902 * s,y +  -31.982 * s,x +   17.639 * s,y +  -34.737 * s,x +   12.728 * s,y +  -37.654 * s,x +   10.156 * s,y +  -40.698 * s, threshold);
			_bez(x +   10.156 * s,y +  -40.698 * s,x +    7.585 * s,y +  -43.741 * s,x +    6.299 * s,y +  -47.835 * s,x +    6.299 * s,y +  -52.978 * s, threshold);
			_bez(x +    6.299 * s,y +  -52.978 * s,x +    6.299 * s,y +  -59.586 * s,x +    8.415 * s,y +  -64.778 * s,x +   12.647 * s,y +  -68.554 * s, threshold);
			_bez(x +   12.647 * s,y +  -68.554 * s,x +   16.878 * s,y +  -72.330 * s,x +   22.689 * s,y +  -74.218 * s,x +   30.078 * s,y +  -74.218 * s, threshold);
			_bez(x +   30.078 * s,y +  -74.218 * s,x +   33.431 * s,y +  -74.218 * s,x +   36.784 * s,y +  -73.835 * s,x +   40.136 * s,y +  -73.070 * s, threshold);
			_bez(x +   40.136 * s,y +  -73.070 * s,x +   43.489 * s,y +  -72.305 * s,x +   46.809 * s,y +  -71.174 * s,x +   50.097 * s,y +  -69.677 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   50.097 * s);
			_setf(o + ( 1 << 2), y +  -55.614 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   50.097 * s,y +  -55.614 * s,x +   47.005 * s,y +  -57.795 * s,x +   43.864 * s,y +  -59.455 * s,x +   40.673 * s,y +  -60.595 * s, threshold);
			_bez(x +   40.673 * s,y +  -60.595 * s,x +   37.483 * s,y +  -61.734 * s,x +   34.326 * s,y +  -62.304 * s,x +   31.201 * s,y +  -62.304 * s, threshold);
			_bez(x +   31.201 * s,y +  -62.304 * s,x +   27.718 * s,y +  -62.304 * s,x +   25.049 * s,y +  -61.604 * s,x +   23.193 * s,y +  -60.204 * s, threshold);
			_bez(x +   23.193 * s,y +  -60.204 * s,x +   21.338 * s,y +  -58.804 * s,x +   20.410 * s,y +  -56.802 * s,x +   20.410 * s,y +  -54.198 * s, threshold);
			_bez(x +   20.410 * s,y +  -54.198 * s,x +   20.410 * s,y +  -52.180 * s,x +   21.086 * s,y +  -50.512 * s,x +   22.436 * s,y +  -49.194 * s, threshold);
			_bez(x +   22.436 * s,y +  -49.194 * s,x +   23.787 * s,y +  -47.875 * s,x +   26.621 * s,y +  -46.444 * s,x +   30.908 * s,y +  -44.823 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   37.109 * s);
			_setf(o + ( 1 << 2), y +  -42.480 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   37.109 * s,y +  -42.480 * s,x +   42.947 * s,y +  -40.273 * s,x +   47.281 * s,y +  -37.483 * s,x +   50.048 * s,y +  -33.935 * s, threshold);
			_bez(x +   50.048 * s,y +  -33.935 * s,x +   52.815 * s,y +  -30.387 * s,x +   54.199 * s,y +  -25.911 * s,x +   54.199 * s,y +  -20.507 * s, threshold);
			_bez(x +   54.199 * s,y +  -20.507 * s,x +   54.199 * s,y +  -13.151 * s,x +   52.026 * s,y +   -7.658 * s,x +   47.680 * s,y +   -4.028 * s, threshold);
			_bez(x +   47.680 * s,y +   -4.028 * s,x +   43.335 * s,y +   -0.399 * s,x +   36.767 * s,y +    1.416 * s,x +   27.978 * s,y +    1.416 * s, threshold);
			_bez(x +   27.978 * s,y +    1.416 * s,x +   24.365 * s,y +    1.416 * s,x +   20.744 * s,y +    0.985 * s,x +   17.114 * s,y +    0.122 * s, threshold);
			_bez(x +   17.114 * s,y +    0.122 * s,x +   13.485 * s,y +   -0.740 * s,x +    9.977 * s,y +   -2.018 * s,x +    6.592 * s,y +   -3.711 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    6.592 * s);
			_setf(o + ( 1 << 2), y +  -18.603 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    6.592 * s,y +  -18.603 * s,x +   10.433 * s,y +  -15.869 * s,x +   14.152 * s,y +  -13.834 * s,x +   17.749 * s,y +  -12.500 * s, threshold);
			_bez(x +   17.749 * s,y +  -12.500 * s,x +   21.346 * s,y +  -11.165 * s,x +   24.902 * s,y +  -10.498 * s,x +   28.418 * s,y +  -10.498 * s, threshold);
			_bez(x +   28.418 * s,y +  -10.498 * s,x +   31.966 * s,y +  -10.498 * s,x +   34.717 * s,y +  -11.303 * s,x +   36.670 * s,y +  -12.915 * s, threshold);
			_bez(x +   36.670 * s,y +  -12.915 * s,x +   38.623 * s,y +  -14.526 * s,x +   39.599 * s,y +  -16.780 * s,x +   39.599 * s,y +  -19.677 * s, threshold);
			_bez(x +   39.599 * s,y +  -19.677 * s,x +   39.599 * s,y +  -21.858 * s,x +   38.948 * s,y +  -23.771 * s,x +   37.646 * s,y +  -25.415 * s, threshold);
			_bez(x +   37.646 * s,y +  -25.415 * s,x +   36.344 * s,y +  -27.058 * s,x +   34.458 * s,y +  -28.357 * s,x +   31.982 * s,y +  -29.296 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   24.902 * s);
			_setf(o + ( 1 << 2), y +  -31.982 * s);
			_setf(o + ( 2 << 2), x +   60.204 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 84:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +   37.305 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   22.900 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   22.900 * s);
			_setf(o + ( 5 << 2), y +  -60.302 * s);
			_setf(o + ( 6 << 2), x +    4.395 * s);
			_setf(o + ( 7 << 2), y +  -60.302 * s);
			_setf(o + ( 8 << 2), x +    4.395 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   55.810 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   55.810 * s);
			_setf(o + (13 << 2), y +  -60.302 * s);
			_setf(o + (14 << 2), x +   37.305 * s);
			_setf(o + (15 << 2), y +  -60.302 * s);
			_setf(o + (16 << 2), x +   37.305 * s);
			_setf(o + (17 << 2), y +       0. * s);
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
			_setf(o + ( 0 << 2), x +    5.175 * s);
			_setf(o + ( 1 << 2), y +  -26.904 * s);
			_setf(o + ( 2 << 2), x +    5.175 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   19.579 * s);
			_setf(o + ( 5 << 2), y +  -72.899 * s);
			_setf(o + ( 6 << 2), x +   19.579 * s);
			_setf(o + ( 7 << 2), y +  -23.291 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_bez(x +   19.579 * s,y +  -23.291 * s,x +   19.579 * s,y +  -19.645 * s,x +   20.507 * s,y +  -16.789 * s,x +   22.363 * s,y +  -14.722 * s, threshold);
			_bez(x +   22.363 * s,y +  -14.722 * s,x +   24.218 * s,y +  -12.654 * s,x +   26.790 * s,y +  -11.621 * s,x +   30.077 * s,y +  -11.621 * s, threshold);
			_bez(x +   30.077 * s,y +  -11.621 * s,x +   33.365 * s,y +  -11.621 * s,x +   35.937 * s,y +  -12.654 * s,x +   37.792 * s,y +  -14.722 * s, threshold);
			_bez(x +   37.792 * s,y +  -14.722 * s,x +   39.647 * s,y +  -16.789 * s,x +   40.575 * s,y +  -19.645 * s,x +   40.575 * s,y +  -23.291 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   40.575 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   54.979 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   54.979 * s);
			_setf(o + ( 5 << 2), y +  -26.904 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   54.979 * s,y +  -26.904 * s,x +   54.979 * s,y +  -17.009 * s,x +   53.010 * s,y +   -9.814 * s,x +   49.071 * s,y +   -5.322 * s, threshold);
			_bez(x +   49.071 * s,y +   -5.322 * s,x +   45.132 * s,y +   -0.830 * s,x +   38.801 * s,y +    1.416 * s,x +   30.077 * s,y +    1.416 * s, threshold);
			_bez(x +   30.077 * s,y +    1.416 * s,x +   21.386 * s,y +    1.416 * s,x +   15.063 * s,y +   -0.830 * s,x +   11.108 * s,y +   -5.322 * s, threshold);
			_bez(x +   11.108 * s,y +   -5.322 * s,x +    7.153 * s,y +   -9.814 * s,x +    5.175 * s,y +  -17.009 * s,x +    5.175 * s,y +  -26.904 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 86:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +   30.077 * s);
			_setf(o + ( 1 << 2), y +  -12.011 * s);
			_setf(o + ( 2 << 2), x +   42.919 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   57.421 * s);
			_setf(o + ( 5 << 2), y +  -72.899 * s);
			_setf(o + ( 6 << 2), x +   40.087 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   20.117 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +    2.783 * s);
			_setf(o + (11 << 2), y +  -72.899 * s);
			_setf(o + (12 << 2), x +   17.285 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   30.077 * s);
			_setf(o + (15 << 2), y +  -12.011 * s);
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
			_setf(o + ( 2 << 2), x +   12.597 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   17.822 * s);
			_setf(o + ( 5 << 2), y +  -19.384 * s);
			_setf(o + ( 6 << 2), x +   24.121 * s);
			_setf(o + ( 7 << 2), y +  -54.003 * s);
			_setf(o + ( 8 << 2), x +   36.083 * s);
			_setf(o + ( 9 << 2), y +  -54.003 * s);
			_setf(o + (10 << 2), x +   43.407 * s);
			_setf(o + (11 << 2), y +  -19.384 * s);
			_setf(o + (12 << 2), x +   47.509 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   60.204 * s);
			_setf(o + (15 << 2), y +  -72.899 * s);
			_setf(o + (16 << 2), x +   51.806 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   38.378 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   30.078 * s);
			_setf(o + (21 << 2), y +  -38.281 * s);
			_setf(o + (22 << 2), x +   22.314 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +    8.984 * s);
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
			_setf(o + ( 0 << 2), x +   58.886 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   43.994 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   30.078 * s);
			_setf(o + ( 5 << 2), y +  -24.121 * s);
			_setf(o + ( 6 << 2), x +   16.211 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +    1.318 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   22.705 * s);
			_setf(o + (11 << 2), y +  -37.011 * s);
			_setf(o + (12 << 2), x +    1.904 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   16.797 * s);
			_setf(o + (15 << 2), y +  -72.899 * s);
			_setf(o + (16 << 2), x +   30.078 * s);
			_setf(o + (17 << 2), y +  -49.706 * s);
			_setf(o + (18 << 2), x +   43.408 * s);
			_setf(o + (19 << 2), y +  -72.899 * s);
			_setf(o + (20 << 2), x +   58.300 * s);
			_setf(o + (21 << 2), y +  -72.899 * s);
			_setf(o + (22 << 2), x +   37.597 * s);
			_setf(o + (23 << 2), y +  -37.011 * s);
			_setf(o + (24 << 2), x +   58.886 * s);
			_setf(o + (25 << 2), y +       0. * s);
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
			_setf(o + ( 0 << 2), x +    0.391 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   15.918 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   30.078 * s);
			_setf(o + ( 5 << 2), y +  -43.603 * s);
			_setf(o + ( 6 << 2), x +   44.286 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   59.813 * s);
			_setf(o + ( 9 << 2), y +  -72.899 * s);
			_setf(o + (10 << 2), x +   37.304 * s);
			_setf(o + (11 << 2), y +  -28.710 * s);
			_setf(o + (12 << 2), x +   37.304 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   22.900 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   22.900 * s);
			_setf(o + (17 << 2), y +  -28.710 * s);
			_setf(o + (18 << 2), x +    0.391 * s);
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
			_setf(o + ( 0 << 2), x +    6.689 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   56.005 * s);
			_setf(o + ( 3 << 2), y +  -72.899 * s);
			_setf(o + ( 4 << 2), x +   56.005 * s);
			_setf(o + ( 5 << 2), y +  -60.985 * s);
			_setf(o + ( 6 << 2), x +   22.216 * s);
			_setf(o + ( 7 << 2), y +  -12.695 * s);
			_setf(o + ( 8 << 2), x +   56.689 * s);
			_setf(o + ( 9 << 2), y +  -12.695 * s);
			_setf(o + (10 << 2), x +   56.689 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    5.615 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +    5.615 * s);
			_setf(o + (15 << 2), y +  -11.914 * s);
			_setf(o + (16 << 2), x +   38.378 * s);
			_setf(o + (17 << 2), y +  -60.204 * s);
			_setf(o + (18 << 2), x +    6.689 * s);
			_setf(o + (19 << 2), y +  -60.204 * s);
			_setf(o + (20 << 2), x +    6.689 * s);
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
			_setf(o + ( 0 << 2), x +   20.605 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   45.410 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   45.410 * s);
			_setf(o + ( 5 << 2), y +  -66.698 * s);
			_setf(o + ( 6 << 2), x +   33.594 * s);
			_setf(o + ( 7 << 2), y +  -66.698 * s);
			_setf(o + ( 8 << 2), x +   33.594 * s);
			_setf(o + ( 9 << 2), y +    3.906 * s);
			_setf(o + (10 << 2), x +   45.410 * s);
			_setf(o + (11 << 2), y +    3.906 * s);
			_setf(o + (12 << 2), x +   45.410 * s);
			_setf(o + (13 << 2), y +   13.183 * s);
			_setf(o + (14 << 2), x +   20.605 * s);
			_setf(o + (15 << 2), y +   13.183 * s);
			_setf(o + (16 << 2), x +   20.605 * s);
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
			_setf(o + ( 0 << 2), x +   16.309 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   54.687 * s);
			_setf(o + ( 3 << 2), y +    9.277 * s);
			_setf(o + ( 4 << 2), x +   43.799 * s);
			_setf(o + ( 5 << 2), y +    9.277 * s);
			_setf(o + ( 6 << 2), x +    5.420 * s);
			_setf(o + ( 7 << 2), y +  -72.899 * s);
			_setf(o + ( 8 << 2), x +   16.309 * s);
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
			_setf(o + ( 0 << 2), x +   39.599 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   39.599 * s);
			_setf(o + ( 3 << 2), y +   13.183 * s);
			_setf(o + ( 4 << 2), x +   14.794 * s);
			_setf(o + ( 5 << 2), y +   13.183 * s);
			_setf(o + ( 6 << 2), x +   14.794 * s);
			_setf(o + ( 7 << 2), y +    3.906 * s);
			_setf(o + ( 8 << 2), x +   26.611 * s);
			_setf(o + ( 9 << 2), y +    3.906 * s);
			_setf(o + (10 << 2), x +   26.611 * s);
			_setf(o + (11 << 2), y +  -66.698 * s);
			_setf(o + (12 << 2), x +   14.794 * s);
			_setf(o + (13 << 2), y +  -66.698 * s);
			_setf(o + (14 << 2), x +   14.794 * s);
			_setf(o + (15 << 2), y +  -75.975 * s);
			_setf(o + (16 << 2), x +   39.599 * s);
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
			_setf(o + ( 0 << 2), x +   36.083 * s);
			_setf(o + ( 1 << 2), y +  -72.899 * s);
			_setf(o + ( 2 << 2), x +   57.421 * s);
			_setf(o + ( 3 << 2), y +  -45.702 * s);
			_setf(o + ( 4 << 2), x +   45.605 * s);
			_setf(o + ( 5 << 2), y +  -45.702 * s);
			_setf(o + ( 6 << 2), x +   30.077 * s);
			_setf(o + ( 7 << 2), y +  -60.399 * s);
			_setf(o + ( 8 << 2), x +   14.599 * s);
			_setf(o + ( 9 << 2), y +  -45.702 * s);
			_setf(o + (10 << 2), x +    2.783 * s);
			_setf(o + (11 << 2), y +  -45.702 * s);
			_setf(o + (12 << 2), x +   24.120 * s);
			_setf(o + (13 << 2), y +  -72.899 * s);
			_setf(o + (14 << 2), x +   36.083 * s);
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
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +   14.306 * s);
			_setf(o + ( 2 << 2), x +   60.204 * s);
			_setf(o + ( 3 << 2), y +   23.584 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +   23.584 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +   14.306 * s);
			_setf(o + ( 8 << 2), x +   60.204 * s);
			_setf(o + ( 9 << 2), y +   14.306 * s);
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
			_setf(o + ( 0 << 2), x +   23.486 * s);
			_setf(o + ( 1 << 2), y +  -79.979 * s);
			_setf(o + ( 2 << 2), x +   37.304 * s);
			_setf(o + ( 3 << 2), y +  -61.620 * s);
			_setf(o + ( 4 << 2), x +   27.685 * s);
			_setf(o + ( 5 << 2), y +  -61.620 * s);
			_setf(o + ( 6 << 2), x +    9.717 * s);
			_setf(o + ( 7 << 2), y +  -79.979 * s);
			_setf(o + ( 8 << 2), x +   23.486 * s);
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
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   34.179 * s);
			_setf(o + ( 1 << 2), y +  -25.683 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   34.179 * s,y +  -25.683 * s,x +   28.841 * s,y +  -25.683 * s,x +   25.113 * s,y +  -25.000 * s,x +   22.998 * s,y +  -23.632 * s, threshold);
			_bez(x +   22.998 * s,y +  -23.632 * s,x +   20.882 * s,y +  -22.265 * s,x +   19.824 * s,y +  -19.922 * s,x +   19.824 * s,y +  -16.601 * s, threshold);
			_bez(x +   19.824 * s,y +  -16.601 * s,x +   19.824 * s,y +  -14.127 * s,x +   20.556 * s,y +  -12.158 * s,x +   22.021 * s,y +  -10.693 * s, threshold);
			_bez(x +   22.021 * s,y +  -10.693 * s,x +   23.486 * s,y +   -9.228 * s,x +   25.472 * s,y +   -8.496 * s,x +   27.978 * s,y +   -8.496 * s, threshold);
			_bez(x +   27.978 * s,y +   -8.496 * s,x +   31.754 * s,y +   -8.496 * s,x +   34.684 * s,y +   -9.920 * s,x +   36.767 * s,y +  -12.768 * s, threshold);
			_bez(x +   36.767 * s,y +  -12.768 * s,x +   38.850 * s,y +  -15.617 * s,x +   39.892 * s,y +  -19.596 * s,x +   39.892 * s,y +  -24.707 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   39.892 * s);
			_setf(o + ( 1 << 2), y +  -25.683 * s);
			_setf(o + ( 2 << 2), x +   34.179 * s);
			_setf(o + ( 3 << 2), y +  -25.683 * s);
			_setf(o + ( 4 << 2), x +   54.101 * s);
			_setf(o + ( 5 << 2), y +  -31.201 * s);
			_setf(o + ( 6 << 2), x +   54.101 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   39.892 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   39.892 * s);
			_setf(o + (11 << 2), y +   -6.103 * s);
			o = _posb(6);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_bez(x +   39.892 * s,y +   -6.103 * s,x +   38.167 * s,y +   -3.695 * s,x +   35.953 * s,y +   -1.839 * s,x +   33.251 * s,y +   -0.537 * s, threshold);
			_bez(x +   33.251 * s,y +   -0.537 * s,x +   30.550 * s,y +    0.765 * s,x +   27.571 * s,y +    1.416 * s,x +   24.316 * s,y +    1.416 * s, threshold);
			_bez(x +   24.316 * s,y +    1.416 * s,x +   18.099 * s,y +    1.416 * s,x +   13.257 * s,y +   -0.228 * s,x +    9.790 * s,y +   -3.516 * s, threshold);
			_bez(x +    9.790 * s,y +   -3.516 * s,x +    6.323 * s,y +   -6.803 * s,x +    4.590 * s,y +  -11.393 * s,x +    4.590 * s,y +  -17.285 * s, threshold);
			_bez(x +    4.590 * s,y +  -17.285 * s,x +    4.590 * s,y +  -23.665 * s,x +    6.657 * s,y +  -28.377 * s,x +   10.791 * s,y +  -31.420 * s, threshold);
			_bez(x +   10.791 * s,y +  -31.420 * s,x +   14.925 * s,y +  -34.464 * s,x +   21.321 * s,y +  -35.986 * s,x +   29.980 * s,y +  -35.986 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   39.892 * s);
			_setf(o + ( 1 << 2), y +  -35.986 * s);
			_setf(o + ( 2 << 2), x +   39.892 * s);
			_setf(o + ( 3 << 2), y +  -38.378 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   39.892 * s,y +  -38.378 * s,x +   39.892 * s,y +  -40.689 * s,x +   39.054 * s,y +  -42.439 * s,x +   37.377 * s,y +  -43.627 * s, threshold);
			_bez(x +   37.377 * s,y +  -43.627 * s,x +   35.701 * s,y +  -44.815 * s,x +   33.235 * s,y +  -45.409 * s,x +   29.980 * s,y +  -45.409 * s, threshold);
			_bez(x +   29.980 * s,y +  -45.409 * s,x +   26.562 * s,y +  -45.409 * s,x +   23.250 * s,y +  -44.978 * s,x +   20.044 * s,y +  -44.116 * s, threshold);
			_bez(x +   20.044 * s,y +  -44.116 * s,x +   16.837 * s,y +  -43.253 * s,x +   13.493 * s,y +  -41.878 * s,x +   10.010 * s,y +  -39.990 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   10.010 * s);
			_setf(o + ( 1 << 2), y +  -52.196 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   10.010 * s,y +  -52.196 * s,x +   13.167 * s,y +  -53.499 * s,x +   16.373 * s,y +  -54.459 * s,x +   19.629 * s,y +  -55.077 * s, threshold);
			_bez(x +   19.629 * s,y +  -55.077 * s,x +   22.884 * s,y +  -55.696 * s,x +   26.334 * s,y +  -56.005 * s,x +   29.980 * s,y +  -56.005 * s, threshold);
			_bez(x +   29.980 * s,y +  -56.005 * s,x +   38.867 * s,y +  -56.005 * s,x +   45.108 * s,y +  -54.198 * s,x +   48.705 * s,y +  -50.585 * s, threshold);
			_bez(x +   48.705 * s,y +  -50.585 * s,x +   52.302 * s,y +  -46.972 * s,x +   54.101 * s,y +  -40.510 * s,x +   54.101 * s,y +  -31.201 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 98:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   41.503 * s);
			_setf(o + ( 1 << 2), y +  -27.197 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   41.503 * s,y +  -27.197 * s,x +   41.503 * s,y +  -32.470 * s,x +   40.625 * s,y +  -36.604 * s,x +   38.867 * s,y +  -39.599 * s, threshold);
			_bez(x +   38.867 * s,y +  -39.599 * s,x +   37.109 * s,y +  -42.594 * s,x +   34.684 * s,y +  -44.091 * s,x +   31.591 * s,y +  -44.091 * s, threshold);
			_bez(x +   31.591 * s,y +  -44.091 * s,x +   28.499 * s,y +  -44.091 * s,x +   26.058 * s,y +  -42.594 * s,x +   24.267 * s,y +  -39.599 * s, threshold);
			_bez(x +   24.267 * s,y +  -39.599 * s,x +   22.477 * s,y +  -36.604 * s,x +   21.582 * s,y +  -32.470 * s,x +   21.582 * s,y +  -27.197 * s, threshold);
			_bez(x +   21.582 * s,y +  -27.197 * s,x +   21.582 * s,y +  -21.923 * s,x +   22.477 * s,y +  -17.789 * s,x +   24.267 * s,y +  -14.795 * s, threshold);
			_bez(x +   24.267 * s,y +  -14.795 * s,x +   26.058 * s,y +  -11.800 * s,x +   28.499 * s,y +  -10.303 * s,x +   31.591 * s,y +  -10.303 * s, threshold);
			_bez(x +   31.591 * s,y +  -10.303 * s,x +   34.684 * s,y +  -10.303 * s,x +   37.109 * s,y +  -11.800 * s,x +   38.867 * s,y +  -14.795 * s, threshold);
			_bez(x +   38.867 * s,y +  -14.795 * s,x +   40.625 * s,y +  -17.789 * s,x +   41.503 * s,y +  -21.923 * s,x +   41.503 * s,y +  -27.197 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   21.582 * s);
			_setf(o + ( 1 << 2), y +  -46.923 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   21.582 * s,y +  -46.923 * s,x +   23.339 * s,y +  -49.950 * s,x +   25.382 * s,y +  -52.221 * s,x +   27.710 * s,y +  -53.735 * s, threshold);
			_bez(x +   27.710 * s,y +  -53.735 * s,x +   30.037 * s,y +  -55.248 * s,x +   32.665 * s,y +  -56.005 * s,x +   35.595 * s,y +  -56.005 * s, threshold);
			_bez(x +   35.595 * s,y +  -56.005 * s,x +   42.073 * s,y +  -56.005 * s,x +   47.062 * s,y +  -53.531 * s,x +   50.561 * s,y +  -48.583 * s, threshold);
			_bez(x +   50.561 * s,y +  -48.583 * s,x +   54.060 * s,y +  -43.635 * s,x +   55.810 * s,y +  -36.539 * s,x +   55.810 * s,y +  -27.294 * s, threshold);
			_bez(x +   55.810 * s,y +  -27.294 * s,x +   55.810 * s,y +  -18.181 * s,x +   54.085 * s,y +  -11.116 * s,x +   50.634 * s,y +   -6.103 * s, threshold);
			_bez(x +   50.634 * s,y +   -6.103 * s,x +   47.184 * s,y +   -1.090 * s,x +   42.334 * s,y +    1.416 * s,x +   36.084 * s,y +    1.416 * s, threshold);
			_bez(x +   36.084 * s,y +    1.416 * s,x +   32.796 * s,y +    1.416 * s,x +   29.931 * s,y +    0.618 * s,x +   27.490 * s,y +   -0.977 * s, threshold);
			_bez(x +   27.490 * s,y +   -0.977 * s,x +   25.048 * s,y +   -2.572 * s,x +   23.079 * s,y +   -4.948 * s,x +   21.582 * s,y +   -8.105 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   21.582 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    7.324 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    7.324 * s);
			_setf(o + ( 5 << 2), y +  -75.975 * s);
			_setf(o + ( 6 << 2), x +   21.582 * s);
			_setf(o + ( 7 << 2), y +  -75.975 * s);
			_setf(o + ( 8 << 2), x +   21.582 * s);
			_setf(o + ( 9 << 2), y +  -46.923 * s);
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
			_bez(x +   51.806 * s,y +   -2.783 * s,x +   49.397 * s,y +   -1.383 * s,x +   46.809 * s,y +   -0.334 * s,x +   44.043 * s,y +    0.366 * s, threshold);
			_bez(x +   44.043 * s,y +    0.366 * s,x +   41.276 * s,y +    1.066 * s,x +   38.297 * s,y +    1.416 * s,x +   35.107 * s,y +    1.416 * s, threshold);
			_bez(x +   35.107 * s,y +    1.416 * s,x +   26.676 * s,y +    1.416 * s,x +   20.085 * s,y +   -1.123 * s,x +   15.332 * s,y +   -6.201 * s, threshold);
			_bez(x +   15.332 * s,y +   -6.201 * s,x +   10.580 * s,y +  -11.279 * s,x +    8.203 * s,y +  -18.310 * s,x +    8.203 * s,y +  -27.294 * s, threshold);
			_bez(x +    8.203 * s,y +  -27.294 * s,x +    8.203 * s,y +  -36.311 * s,x +   10.596 * s,y +  -43.367 * s,x +   15.381 * s,y +  -48.461 * s, threshold);
			_bez(x +   15.381 * s,y +  -48.461 * s,x +   20.166 * s,y +  -53.555 * s,x +   26.774 * s,y +  -56.103 * s,x +   35.205 * s,y +  -56.103 * s, threshold);
			_bez(x +   35.205 * s,y +  -56.103 * s,x +   38.135 * s,y +  -56.103 * s,x +   40.958 * s,y +  -55.761 * s,x +   43.676 * s,y +  -55.077 * s, threshold);
			_bez(x +   43.676 * s,y +  -55.077 * s,x +   46.394 * s,y +  -54.394 * s,x +   49.104 * s,y +  -53.336 * s,x +   51.806 * s,y +  -51.904 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   51.806 * s);
			_setf(o + ( 1 << 2), y +  -38.818 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   51.806 * s,y +  -38.818 * s,x +   49.723 * s,y +  -40.608 * s,x +   47.436 * s,y +  -41.983 * s,x +   44.946 * s,y +  -42.944 * s, threshold);
			_bez(x +   44.946 * s,y +  -42.944 * s,x +   42.456 * s,y +  -43.904 * s,x +   39.876 * s,y +  -44.384 * s,x +   37.207 * s,y +  -44.384 * s, threshold);
			_bez(x +   37.207 * s,y +  -44.384 * s,x +   32.552 * s,y +  -44.384 * s,x +   28.971 * s,y +  -42.903 * s,x +   26.465 * s,y +  -39.941 * s, threshold);
			_bez(x +   26.465 * s,y +  -39.941 * s,x +   23.958 * s,y +  -36.979 * s,x +   22.705 * s,y +  -32.763 * s,x +   22.705 * s,y +  -27.294 * s, threshold);
			_bez(x +   22.705 * s,y +  -27.294 * s,x +   22.705 * s,y +  -21.826 * s,x +   23.958 * s,y +  -17.627 * s,x +   26.465 * s,y +  -14.697 * s, threshold);
			_bez(x +   26.465 * s,y +  -14.697 * s,x +   28.971 * s,y +  -11.767 * s,x +   32.552 * s,y +  -10.303 * s,x +   37.207 * s,y +  -10.303 * s, threshold);
			_bez(x +   37.207 * s,y +  -10.303 * s,x +   39.974 * s,y +  -10.303 * s,x +   42.561 * s,y +  -10.766 * s,x +   44.970 * s,y +  -11.694 * s, threshold);
			_bez(x +   44.970 * s,y +  -11.694 * s,x +   47.379 * s,y +  -12.622 * s,x +   49.658 * s,y +  -14.030 * s,x +   51.806 * s,y +  -15.918 * s, threshold);
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
			_setf(o + ( 0 << 2), x +   38.623 * s);
			_setf(o + ( 1 << 2), y +  -46.923 * s);
			_setf(o + ( 2 << 2), x +   38.623 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   52.880 * s);
			_setf(o + ( 5 << 2), y +  -75.975 * s);
			_setf(o + ( 6 << 2), x +   52.880 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   38.623 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   38.623 * s);
			_setf(o + (11 << 2), y +   -8.105 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_bez(x +   38.623 * s,y +   -8.105 * s,x +   37.093 * s,y +   -4.948 * s,x +   35.115 * s,y +   -2.572 * s,x +   32.690 * s,y +   -0.977 * s, threshold);
			_bez(x +   32.690 * s,y +   -0.977 * s,x +   30.265 * s,y +    0.618 * s,x +   27.409 * s,y +    1.416 * s,x +   24.121 * s,y +    1.416 * s, threshold);
			_bez(x +   24.121 * s,y +    1.416 * s,x +   17.871 * s,y +    1.416 * s,x +   13.021 * s,y +   -1.090 * s,x +    9.571 * s,y +   -6.103 * s, threshold);
			_bez(x +    9.571 * s,y +   -6.103 * s,x +    6.120 * s,y +  -11.116 * s,x +    4.395 * s,y +  -18.181 * s,x +    4.395 * s,y +  -27.294 * s, threshold);
			_bez(x +    4.395 * s,y +  -27.294 * s,x +    4.395 * s,y +  -36.539 * s,x +    6.145 * s,y +  -43.635 * s,x +    9.644 * s,y +  -48.583 * s, threshold);
			_bez(x +    9.644 * s,y +  -48.583 * s,x +   13.143 * s,y +  -53.531 * s,x +   18.131 * s,y +  -56.005 * s,x +   24.609 * s,y +  -56.005 * s, threshold);
			_bez(x +   24.609 * s,y +  -56.005 * s,x +   27.539 * s,y +  -56.005 * s,x +   30.168 * s,y +  -55.248 * s,x +   32.495 * s,y +  -53.735 * s, threshold);
			_bez(x +   32.495 * s,y +  -53.735 * s,x +   34.822 * s,y +  -52.221 * s,x +   36.865 * s,y +  -49.950 * s,x +   38.623 * s,y +  -46.923 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   18.701 * s);
			_setf(o + ( 1 << 2), y +  -27.197 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   18.701 * s,y +  -27.197 * s,x +   18.701 * s,y +  -21.923 * s,x +   19.580 * s,y +  -17.789 * s,x +   21.338 * s,y +  -14.795 * s, threshold);
			_bez(x +   21.338 * s,y +  -14.795 * s,x +   23.096 * s,y +  -11.800 * s,x +   25.521 * s,y +  -10.303 * s,x +   28.613 * s,y +  -10.303 * s, threshold);
			_bez(x +   28.613 * s,y +  -10.303 * s,x +   31.706 * s,y +  -10.303 * s,x +   34.147 * s,y +  -11.800 * s,x +   35.937 * s,y +  -14.795 * s, threshold);
			_bez(x +   35.937 * s,y +  -14.795 * s,x +   37.728 * s,y +  -17.789 * s,x +   38.623 * s,y +  -21.923 * s,x +   38.623 * s,y +  -27.197 * s, threshold);
			_bez(x +   38.623 * s,y +  -27.197 * s,x +   38.623 * s,y +  -32.470 * s,x +   37.728 * s,y +  -36.604 * s,x +   35.937 * s,y +  -39.599 * s, threshold);
			_bez(x +   35.937 * s,y +  -39.599 * s,x +   34.147 * s,y +  -42.594 * s,x +   31.706 * s,y +  -44.091 * s,x +   28.613 * s,y +  -44.091 * s, threshold);
			_bez(x +   28.613 * s,y +  -44.091 * s,x +   25.521 * s,y +  -44.091 * s,x +   23.096 * s,y +  -42.594 * s,x +   21.338 * s,y +  -39.599 * s, threshold);
			_bez(x +   21.338 * s,y +  -39.599 * s,x +   19.580 * s,y +  -36.604 * s,x +   18.701 * s,y +  -32.470 * s,x +   18.701 * s,y +  -27.197 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.205 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 101:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   53.807 * s);
			_setf(o + ( 1 << 2), y +   -2.686 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   53.807 * s,y +   -2.686 * s,x +   50.487 * s,y +   -1.318 * s,x +   47.102 * s,y +   -0.293 * s,x +   43.651 * s,y +    0.391 * s, threshold);
			_bez(x +   43.651 * s,y +    0.391 * s,x +   40.201 * s,y +    1.074 * s,x +   36.555 * s,y +    1.416 * s,x +   32.714 * s,y +    1.416 * s, threshold);
			_bez(x +   32.714 * s,y +    1.416 * s,x +   23.567 * s,y +    1.416 * s,x +   16.576 * s,y +   -1.033 * s,x +   11.743 * s,y +   -5.933 * s, threshold);
			_bez(x +   11.743 * s,y +   -5.933 * s,x +    6.909 * s,y +  -10.832 * s,x +    4.492 * s,y +  -17.887 * s,x +    4.492 * s,y +  -27.099 * s, threshold);
			_bez(x +    4.492 * s,y +  -27.099 * s,x +    4.492 * s,y +  -36.018 * s,x +    6.819 * s,y +  -43.066 * s,x +   11.474 * s,y +  -48.241 * s, threshold);
			_bez(x +   11.474 * s,y +  -48.241 * s,x +   16.129 * s,y +  -53.417 * s,x +   22.476 * s,y +  -56.005 * s,x +   30.517 * s,y +  -56.005 * s, threshold);
			_bez(x +   30.517 * s,y +  -56.005 * s,x +   38.622 * s,y +  -56.005 * s,x +   44.913 * s,y +  -53.604 * s,x +   49.388 * s,y +  -48.803 * s, threshold);
			_bez(x +   49.388 * s,y +  -48.803 * s,x +   53.864 * s,y +  -44.002 * s,x +   56.102 * s,y +  -37.239 * s,x +   56.102 * s,y +  -28.515 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   56.102 * s);
			_setf(o + ( 1 << 2), y +  -22.705 * s);
			_setf(o + ( 2 << 2), x +   19.042 * s);
			_setf(o + ( 3 << 2), y +  -22.705 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   19.042 * s,y +  -22.705 * s,x +   19.075 * s,y +  -18.408 * s,x +   20.344 * s,y +  -15.202 * s,x +   22.851 * s,y +  -13.086 * s, threshold);
			_bez(x +   22.851 * s,y +  -13.086 * s,x +   25.357 * s,y +  -10.970 * s,x +   29.101 * s,y +   -9.912 * s,x +   34.081 * s,y +   -9.912 * s, threshold);
			_bez(x +   34.081 * s,y +   -9.912 * s,x +   37.369 * s,y +   -9.912 * s,x +   40.608 * s,y +  -10.384 * s,x +   43.798 * s,y +  -11.328 * s, threshold);
			_bez(x +   43.798 * s,y +  -11.328 * s,x +   46.988 * s,y +  -12.272 * s,x +   50.324 * s,y +  -13.769 * s,x +   53.807 * s,y +  -15.820 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   53.807 * s);
			_setf(o + ( 1 << 2), y +   -2.686 * s);
			_setf(o + ( 2 << 2), x +   41.698 * s);
			_setf(o + ( 3 << 2), y +  -33.447 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			_bez(x +   41.698 * s,y +  -33.447 * s,x +   41.633 * s,y +  -37.223 * s,x +   40.665 * s,y +  -40.079 * s,x +   38.793 * s,y +  -42.016 * s, threshold);
			_bez(x +   38.793 * s,y +  -42.016 * s,x +   36.921 * s,y +  -43.953 * s,x +   34.162 * s,y +  -44.921 * s,x +   30.517 * s,y +  -44.921 * s, threshold);
			_bez(x +   30.517 * s,y +  -44.921 * s,x +   27.229 * s,y +  -44.921 * s,x +   24.609 * s,y +  -43.920 * s,x +   22.655 * s,y +  -41.918 * s, threshold);
			_bez(x +   22.655 * s,y +  -41.918 * s,x +   20.702 * s,y +  -39.916 * s,x +   19.547 * s,y +  -37.076 * s,x +   19.189 * s,y +  -33.398 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   41.698 * s);
			_setf(o + ( 1 << 2), y +  -33.447 * s);
			_setf(o + ( 2 << 2), x +   60.204 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 102:
			
			o = _posf(24);
			_setf(o + ( 0 << 2), x +   36.083 * s);
			_setf(o + ( 1 << 2), y +  -59.472 * s);
			_setf(o + ( 2 << 2), x +   36.083 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   52.880 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   52.880 * s);
			_setf(o + ( 7 << 2), y +  -43.701 * s);
			_setf(o + ( 8 << 2), x +   36.083 * s);
			_setf(o + ( 9 << 2), y +  -43.701 * s);
			_setf(o + (10 << 2), x +   36.083 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   21.777 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   21.777 * s);
			_setf(o + (15 << 2), y +  -43.701 * s);
			_setf(o + (16 << 2), x +    8.496 * s);
			_setf(o + (17 << 2), y +  -43.701 * s);
			_setf(o + (18 << 2), x +    8.496 * s);
			_setf(o + (19 << 2), y +  -54.687 * s);
			_setf(o + (20 << 2), x +   21.777 * s);
			_setf(o + (21 << 2), y +  -54.687 * s);
			_setf(o + (22 << 2), x +   21.777 * s);
			_setf(o + (23 << 2), y +  -58.495 * s);
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
			_setb(o + 11, 2);
			_bez(x +   21.777 * s,y +  -58.495 * s,x +   21.777 * s,y +  -65.070 * s,x +   23.144 * s,y +  -69.628 * s,x +   25.878 * s,y +  -72.167 * s, threshold);
			_bez(x +   25.878 * s,y +  -72.167 * s,x +   28.613 * s,y +  -74.706 * s,x +   33.691 * s,y +  -75.975 * s,x +   41.112 * s,y +  -75.975 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   52.880 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   52.880 * s);
			_setf(o + ( 3 << 2), y +  -64.989 * s);
			_setf(o + ( 4 << 2), x +   41.698 * s);
			_setf(o + ( 5 << 2), y +  -64.989 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   41.698 * s,y +  -64.989 * s,x +   39.550 * s,y +  -64.989 * s,x +   38.093 * s,y +  -64.599 * s,x +   37.328 * s,y +  -63.817 * s, threshold);
			_bez(x +   37.328 * s,y +  -63.817 * s,x +   36.563 * s,y +  -63.036 * s,x +   36.083 * s,y +  -61.588 * s,x +   36.083 * s,y +  -59.472 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 103:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   39.208 * s);
			_setf(o + ( 1 << 2), y +  -28.222 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   39.208 * s,y +  -28.222 * s,x +   39.208 * s,y +  -33.105 * s,x +   38.281 * s,y +  -37.019 * s,x +   36.425 * s,y +  -39.965 * s, threshold);
			_bez(x +   36.425 * s,y +  -39.965 * s,x +   34.570 * s,y +  -42.911 * s,x +   32.128 * s,y +  -44.384 * s,x +   29.101 * s,y +  -44.384 * s, threshold);
			_bez(x +   29.101 * s,y +  -44.384 * s,x +   26.106 * s,y +  -44.384 * s,x +   23.689 * s,y +  -42.919 * s,x +   21.850 * s,y +  -39.990 * s, threshold);
			_bez(x +   21.850 * s,y +  -39.990 * s,x +   20.011 * s,y +  -37.060 * s,x +   19.091 * s,y +  -33.137 * s,x +   19.091 * s,y +  -28.222 * s, threshold);
			_bez(x +   19.091 * s,y +  -28.222 * s,x +   19.091 * s,y +  -23.275 * s,x +   20.011 * s,y +  -19.336 * s,x +   21.850 * s,y +  -16.406 * s, threshold);
			_bez(x +   21.850 * s,y +  -16.406 * s,x +   23.689 * s,y +  -13.476 * s,x +   26.106 * s,y +  -12.012 * s,x +   29.101 * s,y +  -12.012 * s, threshold);
			_bez(x +   29.101 * s,y +  -12.012 * s,x +   32.128 * s,y +  -12.012 * s,x +   34.570 * s,y +  -13.484 * s,x +   36.425 * s,y +  -16.430 * s, threshold);
			_bez(x +   36.425 * s,y +  -16.430 * s,x +   38.281 * s,y +  -19.376 * s,x +   39.208 * s,y +  -23.307 * s,x +   39.208 * s,y +  -28.222 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   53.515 * s);
			_setf(o + ( 1 << 2), y +   -4.101 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   53.515 * s,y +   -4.101 * s,x +   53.515 * s,y +    4.655 * s,x +   51.537 * s,y +   10.978 * s,x +   47.582 * s,y +   14.868 * s, threshold);
			_bez(x +   47.582 * s,y +   14.868 * s,x +   43.627 * s,y +   18.758 * s,x +   37.207 * s,y +   20.703 * s,x +   28.320 * s,y +   20.703 * s, threshold);
			_bez(x +   28.320 * s,y +   20.703 * s,x +   25.325 * s,y +   20.703 * s,x +   22.363 * s,y +   20.483 * s,x +   19.433 * s,y +   20.044 * s, threshold);
			_bez(x +   19.433 * s,y +   20.044 * s,x +   16.504 * s,y +   19.604 * s,x +   13.525 * s,y +   18.929 * s,x +   10.498 * s,y +   18.017 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   10.498 * s);
			_setf(o + ( 1 << 2), y +    4.883 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   10.498 * s,y +    4.883 * s,x +   13.200 * s,y +    6.380 * s,x +   15.950 * s,y +    7.487 * s,x +   18.750 * s,y +    8.203 * s, threshold);
			_bez(x +   18.750 * s,y +    8.203 * s,x +   21.549 * s,y +    8.919 * s,x +   24.430 * s,y +    9.277 * s,x +   27.392 * s,y +    9.277 * s, threshold);
			_bez(x +   27.392 * s,y +    9.277 * s,x +   31.428 * s,y +    9.277 * s,x +   34.407 * s,y +    8.325 * s,x +   36.327 * s,y +    6.421 * s, threshold);
			_bez(x +   36.327 * s,y +    6.421 * s,x +   38.248 * s,y +    4.517 * s,x +   39.208 * s,y +    1.546 * s,x +   39.208 * s,y +   -2.490 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   39.208 * s);
			_setf(o + ( 1 << 2), y +   -8.398 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   39.208 * s,y +   -8.398 * s,x +   37.809 * s,y +   -5.794 * s,x +   35.953 * s,y +   -3.857 * s,x +   33.642 * s,y +   -2.588 * s, threshold);
			_bez(x +   33.642 * s,y +   -2.588 * s,x +   31.331 * s,y +   -1.318 * s,x +   28.515 * s,y +   -0.684 * s,x +   25.195 * s,y +   -0.684 * s, threshold);
			_bez(x +   25.195 * s,y +   -0.684 * s,x +   18.945 * s,y +   -0.684 * s,x +   13.981 * s,y +   -3.125 * s,x +   10.302 * s,y +   -8.008 * s, threshold);
			_bez(x +   10.302 * s,y +   -8.008 * s,x +    6.624 * s,y +  -12.890 * s,x +    4.785 * s,y +  -19.515 * s,x +    4.785 * s,y +  -27.880 * s, threshold);
			_bez(x +    4.785 * s,y +  -27.880 * s,x +    4.785 * s,y +  -36.539 * s,x +    6.624 * s,y +  -43.408 * s,x +   10.302 * s,y +  -48.486 * s, threshold);
			_bez(x +   10.302 * s,y +  -48.486 * s,x +   13.981 * s,y +  -53.564 * s,x +   18.912 * s,y +  -56.103 * s,x +   25.097 * s,y +  -56.103 * s, threshold);
			_bez(x +   25.097 * s,y +  -56.103 * s,x +   28.222 * s,y +  -56.103 * s,x +   31.005 * s,y +  -55.370 * s,x +   33.447 * s,y +  -53.905 * s, threshold);
			_bez(x +   33.447 * s,y +  -53.905 * s,x +   35.888 * s,y +  -52.441 * s,x +   37.809 * s,y +  -50.374 * s,x +   39.208 * s,y +  -47.704 * s, threshold);
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   39.208 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   53.515 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   53.515 * s);
			_setf(o + ( 5 << 2), y +   -4.101 * s);
			_setf(o + ( 6 << 2), x +   60.204 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			o = _posb(4);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 1);
			
			case 104:
			
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   52.294 * s);
			_setf(o + ( 1 << 2), y +  -35.497 * s);
			_setf(o + ( 2 << 2), x +   52.294 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   38.085 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   38.085 * s);
			_setf(o + ( 7 << 2), y +  -33.300 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_bez(x +   38.085 * s,y +  -33.300 * s,x +   38.085 * s,y +  -37.239 * s,x +   37.524 * s,y +  -40.055 * s,x +   36.401 * s,y +  -41.747 * s, threshold);
			_bez(x +   36.401 * s,y +  -41.747 * s,x +   35.278 * s,y +  -43.440 * s,x +   33.447 * s,y +  -44.286 * s,x +   30.908 * s,y +  -44.286 * s, threshold);
			_bez(x +   30.908 * s,y +  -44.286 * s,x +   28.304 * s,y +  -44.286 * s,x +   26.269 * s,y +  -43.139 * s,x +   24.804 * s,y +  -40.844 * s, threshold);
			_bez(x +   24.804 * s,y +  -40.844 * s,x +   23.340 * s,y +  -38.549 * s,x +   22.607 * s,y +  -35.367 * s,x +   22.607 * s,y +  -31.298 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   22.607 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    8.398 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    8.398 * s);
			_setf(o + ( 5 << 2), y +  -75.975 * s);
			_setf(o + ( 6 << 2), x +   22.607 * s);
			_setf(o + ( 7 << 2), y +  -75.975 * s);
			_setf(o + ( 8 << 2), x +   22.607 * s);
			_setf(o + ( 9 << 2), y +  -46.484 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   22.607 * s,y +  -46.484 * s,x +   23.616 * s,y +  -49.511 * s,x +   25.341 * s,y +  -51.855 * s,x +   27.783 * s,y +  -53.515 * s, threshold);
			_bez(x +   27.783 * s,y +  -53.515 * s,x +   30.224 * s,y +  -55.175 * s,x +   33.170 * s,y +  -56.005 * s,x +   36.621 * s,y +  -56.005 * s, threshold);
			_bez(x +   36.621 * s,y +  -56.005 * s,x +   41.796 * s,y +  -56.005 * s,x +   45.702 * s,y +  -54.288 * s,x +   48.339 * s,y +  -50.854 * s, threshold);
			_bez(x +   48.339 * s,y +  -50.854 * s,x +   50.976 * s,y +  -47.420 * s,x +   52.294 * s,y +  -42.301 * s,x +   52.294 * s,y +  -35.497 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 105:
			
			o = _posf(34);
			_setf(o + ( 0 << 2), x +   10.791 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   39.111 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   39.111 * s);
			_setf(o + ( 5 << 2), y +  -10.986 * s);
			_setf(o + ( 6 << 2), x +   56.884 * s);
			_setf(o + ( 7 << 2), y +  -10.986 * s);
			_setf(o + ( 8 << 2), x +   56.884 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +    6.982 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    6.982 * s);
			_setf(o + (13 << 2), y +  -10.986 * s);
			_setf(o + (14 << 2), x +   24.804 * s);
			_setf(o + (15 << 2), y +  -10.986 * s);
			_setf(o + (16 << 2), x +   24.804 * s);
			_setf(o + (17 << 2), y +  -43.701 * s);
			_setf(o + (18 << 2), x +   10.791 * s);
			_setf(o + (19 << 2), y +  -43.701 * s);
			_setf(o + (20 << 2), x +   10.791 * s);
			_setf(o + (21 << 2), y +  -54.687 * s);
			_setf(o + (22 << 2), x +   24.804 * s);
			_setf(o + (23 << 2), y +  -81.298 * s);
			_setf(o + (24 << 2), x +   39.111 * s);
			_setf(o + (25 << 2), y +  -81.298 * s);
			_setf(o + (26 << 2), x +   39.111 * s);
			_setf(o + (27 << 2), y +  -64.599 * s);
			_setf(o + (28 << 2), x +   24.804 * s);
			_setf(o + (29 << 2), y +  -64.599 * s);
			_setf(o + (30 << 2), x +   24.804 * s);
			_setf(o + (31 << 2), y +  -81.298 * s);
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
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   41.503 * s);
			_setf(o + ( 1 << 2), y +   -2.100 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   41.503 * s,y +   -2.100 * s,x +   41.503 * s,y +    6.103 * s,x +   40.030 * s,y +   11.955 * s,x +   37.085 * s,y +   15.454 * s, threshold);
			_bez(x +   37.085 * s,y +   15.454 * s,x +   34.139 * s,y +   18.953 * s,x +   29.248 * s,y +   20.703 * s,x +   22.412 * s,y +   20.703 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    6.982 * s);
			_setf(o + ( 1 << 2), y +   20.703 * s);
			_setf(o + ( 2 << 2), x +    6.982 * s);
			_setf(o + ( 3 << 2), y +    9.717 * s);
			_setf(o + ( 4 << 2), x +   18.408 * s);
			_setf(o + ( 5 << 2), y +    9.717 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   18.408 * s,y +    9.717 * s,x +   21.598 * s,y +    9.717 * s,x +   23.860 * s,y +    8.821 * s,x +   25.195 * s,y +    7.031 * s, threshold);
			_bez(x +   25.195 * s,y +    7.031 * s,x +   26.530 * s,y +    5.241 * s,x +   27.197 * s,y +    2.197 * s,x +   27.197 * s,y +   -2.100 * s, threshold);
			o = _posf(22);
			_setf(o + ( 0 << 2), x +   27.197 * s);
			_setf(o + ( 1 << 2), y +  -43.701 * s);
			_setf(o + ( 2 << 2), x +   12.695 * s);
			_setf(o + ( 3 << 2), y +  -43.701 * s);
			_setf(o + ( 4 << 2), x +   12.695 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   41.503 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   41.503 * s);
			_setf(o + ( 9 << 2), y +   -2.100 * s);
			_setf(o + (10 << 2), x +   41.503 * s);
			_setf(o + (11 << 2), y +  -64.599 * s);
			_setf(o + (12 << 2), x +   27.197 * s);
			_setf(o + (13 << 2), y +  -64.599 * s);
			_setf(o + (14 << 2), x +   27.197 * s);
			_setf(o + (15 << 2), y +  -81.298 * s);
			_setf(o + (16 << 2), x +   41.503 * s);
			_setf(o + (17 << 2), y +  -81.298 * s);
			_setf(o + (18 << 2), x +   41.503 * s);
			_setf(o + (19 << 2), y +  -64.599 * s);
			_setf(o + (20 << 2), x +   60.204 * s);
			_setf(o + (21 << 2), y +       0. * s);
			o = _posb(11);
			_setb(o +  0, 2);
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
			
			case 107:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +    8.496 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   22.803 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   22.803 * s);
			_setf(o + ( 5 << 2), y +  -36.083 * s);
			_setf(o + ( 6 << 2), x +   39.990 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   57.324 * s);
			_setf(o + ( 9 << 2), y +  -54.687 * s);
			_setf(o + (10 << 2), x +   36.621 * s);
			_setf(o + (11 << 2), y +  -34.277 * s);
			_setf(o + (12 << 2), x +   58.495 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   42.675 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   27.685 * s);
			_setf(o + (17 << 2), y +  -25.586 * s);
			_setf(o + (18 << 2), x +   22.803 * s);
			_setf(o + (19 << 2), y +  -20.898 * s);
			_setf(o + (20 << 2), x +   22.803 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +    8.496 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +    8.496 * s);
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
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   18.897 * s);
			_setf(o + ( 1 << 2), y +  -22.802 * s);
			_setf(o + ( 2 << 2), x +   18.897 * s);
			_setf(o + ( 3 << 2), y +  -64.989 * s);
			_setf(o + ( 4 << 2), x +    4.395 * s);
			_setf(o + ( 5 << 2), y +  -64.989 * s);
			_setf(o + ( 6 << 2), x +    4.395 * s);
			_setf(o + ( 7 << 2), y +  -75.975 * s);
			_setf(o + ( 8 << 2), x +   33.203 * s);
			_setf(o + ( 9 << 2), y +  -75.975 * s);
			_setf(o + (10 << 2), x +   33.203 * s);
			_setf(o + (11 << 2), y +  -22.802 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_bez(x +   33.203 * s,y +  -22.802 * s,x +   33.203 * s,y +  -18.506 * s,x +   33.870 * s,y +  -15.462 * s,x +   35.205 * s,y +  -13.672 * s, threshold);
			_bez(x +   35.205 * s,y +  -13.672 * s,x +   36.540 * s,y +  -11.881 * s,x +   38.802 * s,y +  -10.986 * s,x +   41.992 * s,y +  -10.986 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   53.418 * s);
			_setf(o + ( 1 << 2), y +  -10.986 * s);
			_setf(o + ( 2 << 2), x +   53.418 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   37.988 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   37.988 * s,y +       0. * s,x +   31.185 * s,y +       0. * s,x +   26.302 * s,y +   -1.758 * s,x +   23.340 * s,y +   -5.273 * s, threshold);
			_bez(x +   23.340 * s,y +   -5.273 * s,x +   20.378 * s,y +   -8.789 * s,x +   18.897 * s,y +  -14.632 * s,x +   18.897 * s,y +  -22.802 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.205 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 109:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   33.690 * s);
			_setf(o + ( 1 << 2), y +  -49.218 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   33.690 * s,y +  -49.218 * s,x +   34.765 * s,y +  -51.529 * s,x +   36.132 * s,y +  -53.238 * s,x +   37.792 * s,y +  -54.345 * s, threshold);
			_bez(x +   37.792 * s,y +  -54.345 * s,x +   39.452 * s,y +  -55.452 * s,x +   41.487 * s,y +  -56.005 * s,x +   43.895 * s,y +  -56.005 * s, threshold);
			_bez(x +   43.895 * s,y +  -56.005 * s,x +   48.615 * s,y +  -56.005 * s,x +   51.879 * s,y +  -54.377 * s,x +   53.685 * s,y +  -51.122 * s, threshold);
			_bez(x +   53.685 * s,y +  -51.122 * s,x +   55.492 * s,y +  -47.867 * s,x +   56.395 * s,y +  -41.096 * s,x +   56.395 * s,y +  -30.810 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   56.395 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   44.677 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   44.677 * s);
			_setf(o + ( 5 << 2), y +  -35.107 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   44.677 * s,y +  -35.107 * s,x +   44.677 * s,y +  -39.176 * s,x +   44.367 * s,y +  -41.894 * s,x +   43.749 * s,y +  -43.261 * s, threshold);
			_bez(x +   43.749 * s,y +  -43.261 * s,x +   43.130 * s,y +  -44.628 * s,x +   42.007 * s,y +  -45.312 * s,x +   40.380 * s,y +  -45.312 * s, threshold);
			_bez(x +   40.380 * s,y +  -45.312 * s,x +   38.752 * s,y +  -45.312 * s,x +   37.613 * s,y +  -44.612 * s,x +   36.962 * s,y +  -43.212 * s, threshold);
			_bez(x +   36.962 * s,y +  -43.212 * s,x +   36.311 * s,y +  -41.812 * s,x +   35.985 * s,y +  -39.111 * s,x +   35.985 * s,y +  -35.107 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   35.985 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   24.413 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   24.413 * s);
			_setf(o + ( 5 << 2), y +  -35.107 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   24.413 * s,y +  -35.107 * s,x +   24.413 * s,y +  -39.111 * s,x +   24.088 * s,y +  -41.812 * s,x +   23.437 * s,y +  -43.212 * s, threshold);
			_bez(x +   23.437 * s,y +  -43.212 * s,x +   22.786 * s,y +  -44.612 * s,x +   21.646 * s,y +  -45.312 * s,x +   20.019 * s,y +  -45.312 * s, threshold);
			_bez(x +   20.019 * s,y +  -45.312 * s,x +   18.391 * s,y +  -45.312 * s,x +   17.268 * s,y +  -44.628 * s,x +   16.650 * s,y +  -43.261 * s, threshold);
			_bez(x +   16.650 * s,y +  -43.261 * s,x +   16.031 * s,y +  -41.894 * s,x +   15.722 * s,y +  -39.176 * s,x +   15.722 * s,y +  -35.107 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   15.722 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    4.003 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    4.003 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   14.404 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   14.404 * s);
			_setf(o + ( 9 << 2), y +  -49.023 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   14.404 * s,y +  -49.023 * s,x +   15.217 * s,y +  -51.171 * s,x +   16.520 * s,y +  -52.872 * s,x +   18.310 * s,y +  -54.125 * s, threshold);
			_bez(x +   18.310 * s,y +  -54.125 * s,x +   20.100 * s,y +  -55.378 * s,x +   22.102 * s,y +  -56.005 * s,x +   24.316 * s,y +  -56.005 * s, threshold);
			_bez(x +   24.316 * s,y +  -56.005 * s,x +   26.529 * s,y +  -56.005 * s,x +   28.547 * s,y +  -55.346 * s,x +   30.370 * s,y +  -54.027 * s, threshold);
			_bez(x +   30.370 * s,y +  -54.027 * s,x +   32.193 * s,y +  -52.709 * s,x +   33.300 * s,y +  -51.106 * s,x +   33.690 * s,y +  -49.218 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 110:
			
			o = _posf(8);
			_setf(o + ( 0 << 2), x +   52.294 * s);
			_setf(o + ( 1 << 2), y +  -35.497 * s);
			_setf(o + ( 2 << 2), x +   52.294 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   38.085 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   38.085 * s);
			_setf(o + ( 7 << 2), y +  -33.300 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_bez(x +   38.085 * s,y +  -33.300 * s,x +   38.085 * s,y +  -37.271 * s,x +   37.524 * s,y +  -40.112 * s,x +   36.401 * s,y +  -41.821 * s, threshold);
			_bez(x +   36.401 * s,y +  -41.821 * s,x +   35.278 * s,y +  -43.530 * s,x +   33.447 * s,y +  -44.384 * s,x +   30.907 * s,y +  -44.384 * s, threshold);
			_bez(x +   30.907 * s,y +  -44.384 * s,x +   28.336 * s,y +  -44.384 * s,x +   26.310 * s,y +  -43.229 * s,x +   24.828 * s,y +  -40.917 * s, threshold);
			_bez(x +   24.828 * s,y +  -40.917 * s,x +   23.347 * s,y +  -38.606 * s,x +   22.607 * s,y +  -35.400 * s,x +   22.607 * s,y +  -31.298 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   22.607 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +    8.398 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +    8.398 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   22.607 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   22.607 * s);
			_setf(o + ( 9 << 2), y +  -46.484 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   22.607 * s,y +  -46.484 * s,x +   23.616 * s,y +  -49.511 * s,x +   25.341 * s,y +  -51.855 * s,x +   27.783 * s,y +  -53.515 * s, threshold);
			_bez(x +   27.783 * s,y +  -53.515 * s,x +   30.224 * s,y +  -55.175 * s,x +   33.170 * s,y +  -56.005 * s,x +   36.620 * s,y +  -56.005 * s, threshold);
			_bez(x +   36.620 * s,y +  -56.005 * s,x +   41.796 * s,y +  -56.005 * s,x +   45.702 * s,y +  -54.288 * s,x +   48.339 * s,y +  -50.854 * s, threshold);
			_bez(x +   48.339 * s,y +  -50.854 * s,x +   50.976 * s,y +  -47.420 * s,x +   52.294 * s,y +  -42.301 * s,x +   52.294 * s,y +  -35.497 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 111:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   30.078 * s);
			_setf(o + ( 1 << 2), y +  -44.384 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   30.078 * s,y +  -44.384 * s,x +   26.660 * s,y +  -44.384 * s,x +   23.974 * s,y +  -42.879 * s,x +   22.021 * s,y +  -39.868 * s, threshold);
			_bez(x +   22.021 * s,y +  -39.868 * s,x +   20.068 * s,y +  -36.857 * s,x +   19.091 * s,y +  -32.666 * s,x +   19.091 * s,y +  -27.294 * s, threshold);
			_bez(x +   19.091 * s,y +  -27.294 * s,x +   19.091 * s,y +  -21.923 * s,x +   20.068 * s,y +  -17.732 * s,x +   22.021 * s,y +  -14.721 * s, threshold);
			_bez(x +   22.021 * s,y +  -14.721 * s,x +   23.974 * s,y +  -11.710 * s,x +   26.660 * s,y +  -10.205 * s,x +   30.078 * s,y +  -10.205 * s, threshold);
			_bez(x +   30.078 * s,y +  -10.205 * s,x +   33.528 * s,y +  -10.205 * s,x +   36.230 * s,y +  -11.710 * s,x +   38.183 * s,y +  -14.721 * s, threshold);
			_bez(x +   38.183 * s,y +  -14.721 * s,x +   40.136 * s,y +  -17.732 * s,x +   41.113 * s,y +  -21.923 * s,x +   41.113 * s,y +  -27.294 * s, threshold);
			_bez(x +   41.113 * s,y +  -27.294 * s,x +   41.113 * s,y +  -32.666 * s,x +   40.136 * s,y +  -36.857 * s,x +   38.183 * s,y +  -39.868 * s, threshold);
			_bez(x +   38.183 * s,y +  -39.868 * s,x +   36.230 * s,y +  -42.879 * s,x +   33.528 * s,y +  -44.384 * s,x +   30.078 * s,y +  -44.384 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    4.785 * s);
			_setf(o + ( 1 << 2), y +  -27.294 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +    4.785 * s,y +  -27.294 * s,x +    4.785 * s,y +  -36.116 * s,x +    7.072 * s,y +  -43.106 * s,x +   11.645 * s,y +  -48.266 * s, threshold);
			_bez(x +   11.645 * s,y +  -48.266 * s,x +   16.219 * s,y +  -53.425 * s,x +   22.363 * s,y +  -56.005 * s,x +   30.078 * s,y +  -56.005 * s, threshold);
			_bez(x +   30.078 * s,y +  -56.005 * s,x +   37.825 * s,y +  -56.005 * s,x +   43.985 * s,y +  -53.425 * s,x +   48.559 * s,y +  -48.266 * s, threshold);
			_bez(x +   48.559 * s,y +  -48.266 * s,x +   53.132 * s,y +  -43.106 * s,x +   55.419 * s,y +  -36.116 * s,x +   55.419 * s,y +  -27.294 * s, threshold);
			_bez(x +   55.419 * s,y +  -27.294 * s,x +   55.419 * s,y +  -18.473 * s,x +   53.132 * s,y +  -11.483 * s,x +   48.559 * s,y +   -6.323 * s, threshold);
			_bez(x +   48.559 * s,y +   -6.323 * s,x +   43.985 * s,y +   -1.164 * s,x +   37.825 * s,y +    1.416 * s,x +   30.078 * s,y +    1.416 * s, threshold);
			_bez(x +   30.078 * s,y +    1.416 * s,x +   22.363 * s,y +    1.416 * s,x +   16.219 * s,y +   -1.164 * s,x +   11.645 * s,y +   -6.323 * s, threshold);
			_bez(x +   11.645 * s,y +   -6.323 * s,x +    7.072 * s,y +  -11.483 * s,x +    4.785 * s,y +  -18.473 * s,x +    4.785 * s,y +  -27.294 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 112:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   21.582 * s);
			_setf(o + ( 1 << 2), y +   -7.715 * s);
			_setf(o + ( 2 << 2), x +   21.582 * s);
			_setf(o + ( 3 << 2), y +   20.800 * s);
			_setf(o + ( 4 << 2), x +    7.324 * s);
			_setf(o + ( 5 << 2), y +   20.800 * s);
			_setf(o + ( 6 << 2), x +    7.324 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   21.582 * s);
			_setf(o + ( 9 << 2), y +  -54.687 * s);
			_setf(o + (10 << 2), x +   21.582 * s);
			_setf(o + (11 << 2), y +  -46.484 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_bez(x +   21.582 * s,y +  -46.484 * s,x +   23.079 * s,y +  -49.641 * s,x +   25.048 * s,y +  -52.017 * s,x +   27.490 * s,y +  -53.612 * s, threshold);
			_bez(x +   27.490 * s,y +  -53.612 * s,x +   29.931 * s,y +  -55.207 * s,x +   32.796 * s,y +  -56.005 * s,x +   36.083 * s,y +  -56.005 * s, threshold);
			_bez(x +   36.083 * s,y +  -56.005 * s,x +   42.334 * s,y +  -56.005 * s,x +   47.184 * s,y +  -53.499 * s,x +   50.634 * s,y +  -48.486 * s, threshold);
			_bez(x +   50.634 * s,y +  -48.486 * s,x +   54.084 * s,y +  -43.473 * s,x +   55.810 * s,y +  -36.408 * s,x +   55.810 * s,y +  -27.294 * s, threshold);
			_bez(x +   55.810 * s,y +  -27.294 * s,x +   55.810 * s,y +  -18.050 * s,x +   54.060 * s,y +  -10.954 * s,x +   50.561 * s,y +   -6.006 * s, threshold);
			_bez(x +   50.561 * s,y +   -6.006 * s,x +   47.061 * s,y +   -1.058 * s,x +   42.073 * s,y +    1.416 * s,x +   35.595 * s,y +    1.416 * s, threshold);
			_bez(x +   35.595 * s,y +    1.416 * s,x +   32.665 * s,y +    1.416 * s,x +   30.037 * s,y +    0.659 * s,x +   27.710 * s,y +   -0.854 * s, threshold);
			_bez(x +   27.710 * s,y +   -0.854 * s,x +   25.382 * s,y +   -2.368 * s,x +   23.340 * s,y +   -4.655 * s,x +   21.582 * s,y +   -7.715 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   41.503 * s);
			_setf(o + ( 1 << 2), y +  -27.392 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   41.503 * s,y +  -27.392 * s,x +   41.503 * s,y +  -32.666 * s,x +   40.624 * s,y +  -36.800 * s,x +   38.867 * s,y +  -39.794 * s, threshold);
			_bez(x +   38.867 * s,y +  -39.794 * s,x +   37.109 * s,y +  -42.789 * s,x +   34.684 * s,y +  -44.286 * s,x +   31.591 * s,y +  -44.286 * s, threshold);
			_bez(x +   31.591 * s,y +  -44.286 * s,x +   28.499 * s,y +  -44.286 * s,x +   26.058 * s,y +  -42.789 * s,x +   24.267 * s,y +  -39.794 * s, threshold);
			_bez(x +   24.267 * s,y +  -39.794 * s,x +   22.477 * s,y +  -36.800 * s,x +   21.582 * s,y +  -32.666 * s,x +   21.582 * s,y +  -27.392 * s, threshold);
			_bez(x +   21.582 * s,y +  -27.392 * s,x +   21.582 * s,y +  -22.119 * s,x +   22.477 * s,y +  -17.985 * s,x +   24.267 * s,y +  -14.990 * s, threshold);
			_bez(x +   24.267 * s,y +  -14.990 * s,x +   26.058 * s,y +  -11.995 * s,x +   28.499 * s,y +  -10.498 * s,x +   31.591 * s,y +  -10.498 * s, threshold);
			_bez(x +   31.591 * s,y +  -10.498 * s,x +   34.684 * s,y +  -10.498 * s,x +   37.109 * s,y +  -11.995 * s,x +   38.867 * s,y +  -14.990 * s, threshold);
			_bez(x +   38.867 * s,y +  -14.990 * s,x +   40.624 * s,y +  -17.985 * s,x +   41.503 * s,y +  -22.119 * s,x +   41.503 * s,y +  -27.392 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 113:
			
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   18.701 * s);
			_setf(o + ( 1 << 2), y +  -27.392 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   18.701 * s,y +  -27.392 * s,x +   18.701 * s,y +  -22.119 * s,x +   19.580 * s,y +  -17.985 * s,x +   21.338 * s,y +  -14.990 * s, threshold);
			_bez(x +   21.338 * s,y +  -14.990 * s,x +   23.095 * s,y +  -11.995 * s,x +   25.520 * s,y +  -10.498 * s,x +   28.613 * s,y +  -10.498 * s, threshold);
			_bez(x +   28.613 * s,y +  -10.498 * s,x +   31.705 * s,y +  -10.498 * s,x +   34.147 * s,y +  -11.995 * s,x +   35.937 * s,y +  -14.990 * s, threshold);
			_bez(x +   35.937 * s,y +  -14.990 * s,x +   37.727 * s,y +  -17.985 * s,x +   38.623 * s,y +  -22.119 * s,x +   38.623 * s,y +  -27.392 * s, threshold);
			_bez(x +   38.623 * s,y +  -27.392 * s,x +   38.623 * s,y +  -32.666 * s,x +   37.727 * s,y +  -36.800 * s,x +   35.937 * s,y +  -39.794 * s, threshold);
			_bez(x +   35.937 * s,y +  -39.794 * s,x +   34.147 * s,y +  -42.789 * s,x +   31.705 * s,y +  -44.286 * s,x +   28.613 * s,y +  -44.286 * s, threshold);
			_bez(x +   28.613 * s,y +  -44.286 * s,x +   25.520 * s,y +  -44.286 * s,x +   23.095 * s,y +  -42.789 * s,x +   21.338 * s,y +  -39.794 * s, threshold);
			_bez(x +   21.338 * s,y +  -39.794 * s,x +   19.580 * s,y +  -36.800 * s,x +   18.701 * s,y +  -32.666 * s,x +   18.701 * s,y +  -27.392 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   38.623 * s);
			_setf(o + ( 1 << 2), y +   -7.715 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   38.623 * s,y +   -7.715 * s,x +   36.865 * s,y +   -4.655 * s,x +   34.822 * s,y +   -2.368 * s,x +   32.495 * s,y +   -0.854 * s, threshold);
			_bez(x +   32.495 * s,y +   -0.854 * s,x +   30.167 * s,y +    0.659 * s,x +   27.539 * s,y +    1.416 * s,x +   24.609 * s,y +    1.416 * s, threshold);
			_bez(x +   24.609 * s,y +    1.416 * s,x +   18.131 * s,y +    1.416 * s,x +   13.143 * s,y +   -1.058 * s,x +    9.643 * s,y +   -6.006 * s, threshold);
			_bez(x +    9.643 * s,y +   -6.006 * s,x +    6.144 * s,y +  -10.954 * s,x +    4.395 * s,y +  -18.050 * s,x +    4.395 * s,y +  -27.294 * s, threshold);
			_bez(x +    4.395 * s,y +  -27.294 * s,x +    4.395 * s,y +  -36.408 * s,x +    6.120 * s,y +  -43.473 * s,x +    9.570 * s,y +  -48.486 * s, threshold);
			_bez(x +    9.570 * s,y +  -48.486 * s,x +   13.021 * s,y +  -53.499 * s,x +   17.871 * s,y +  -56.005 * s,x +   24.121 * s,y +  -56.005 * s, threshold);
			_bez(x +   24.121 * s,y +  -56.005 * s,x +   27.408 * s,y +  -56.005 * s,x +   30.265 * s,y +  -55.207 * s,x +   32.690 * s,y +  -53.612 * s, threshold);
			_bez(x +   32.690 * s,y +  -53.612 * s,x +   35.115 * s,y +  -52.017 * s,x +   37.093 * s,y +  -49.641 * s,x +   38.623 * s,y +  -46.484 * s, threshold);
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   38.623 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   52.880 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   52.880 * s);
			_setf(o + ( 5 << 2), y +   20.800 * s);
			_setf(o + ( 6 << 2), x +   38.623 * s);
			_setf(o + ( 7 << 2), y +   20.800 * s);
			_setf(o + ( 8 << 2), x +   38.623 * s);
			_setf(o + ( 9 << 2), y +   -7.715 * s);
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
			_setf(o + ( 0 << 2), x +   56.200 * s);
			_setf(o + ( 1 << 2), y +  -39.599 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   56.200 * s,y +  -39.599 * s,x +   54.638 * s,y +  -41.031 * s,x +   52.807 * s,y +  -42.105 * s,x +   50.707 * s,y +  -42.822 * s, threshold);
			_bez(x +   50.707 * s,y +  -42.822 * s,x +   48.608 * s,y +  -43.538 * s,x +   46.305 * s,y +  -43.896 * s,x +   43.798 * s,y +  -43.896 * s, threshold);
			_bez(x +   43.798 * s,y +  -43.896 * s,x +   40.771 * s,y +  -43.896 * s,x +   38.126 * s,y +  -43.367 * s,x +   35.864 * s,y +  -42.309 * s, threshold);
			_bez(x +   35.864 * s,y +  -42.309 * s,x +   33.602 * s,y +  -41.251 * s,x +   31.862 * s,y +  -39.707 * s,x +   30.615 * s,y +  -37.695 * s, threshold);
			_bez(x +   30.615 * s,y +  -37.695 * s,x +   29.844 * s,y +  -36.451 * s,x +   29.288 * s,y +  -34.960 * s,x +   28.979 * s,y +  -33.203 * s, threshold);
			_bez(x +   28.979 * s,y +  -33.203 * s,x +   28.670 * s,y +  -31.445 * s,x +   28.515 * s,y +  -28.776 * s,x +   28.515 * s,y +  -25.195 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   28.515 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +   14.209 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   14.209 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   28.515 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   28.515 * s);
			_setf(o + ( 9 << 2), y +  -46.191 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   28.515 * s,y +  -46.191 * s,x +   29.915 * s,y +  -49.316 * s,x +   32.063 * s,y +  -51.733 * s,x +   34.961 * s,y +  -53.442 * s, threshold);
			_bez(x +   34.961 * s,y +  -53.442 * s,x +   37.858 * s,y +  -55.151 * s,x +   41.243 * s,y +  -56.005 * s,x +   45.117 * s,y +  -56.005 * s, threshold);
			_bez(x +   45.117 * s,y +  -56.005 * s,x +   47.070 * s,y +  -56.005 * s,x +   48.982 * s,y +  -55.769 * s,x +   50.854 * s,y +  -55.297 * s, threshold);
			_bez(x +   50.854 * s,y +  -55.297 * s,x +   52.726 * s,y +  -54.825 * s,x +   54.508 * s,y +  -54.133 * s,x +   56.200 * s,y +  -53.222 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   56.200 * s);
			_setf(o + ( 1 << 2), y +  -39.599 * s);
			_setf(o + ( 2 << 2), x +   60.204 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 115:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   48.388 * s);
			_setf(o + ( 1 << 2), y +  -52.978 * s);
			_setf(o + ( 2 << 2), x +   48.388 * s);
			_setf(o + ( 3 << 2), y +  -40.478 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   48.388 * s,y +  -40.478 * s,x +   45.752 * s,y +  -42.171 * s,x +   43.009 * s,y +  -43.448 * s,x +   40.161 * s,y +  -44.311 * s, threshold);
			_bez(x +   40.161 * s,y +  -44.311 * s,x +   37.313 * s,y +  -45.173 * s,x +   34.456 * s,y +  -45.605 * s,x +   31.592 * s,y +  -45.605 * s, threshold);
			_bez(x +   31.592 * s,y +  -45.605 * s,x +   28.402 * s,y +  -45.605 * s,x +   25.993 * s,y +  -45.141 * s,x +   24.365 * s,y +  -44.213 * s, threshold);
			_bez(x +   24.365 * s,y +  -44.213 * s,x +   22.738 * s,y +  -43.285 * s,x +   21.924 * s,y +  -41.910 * s,x +   21.924 * s,y +  -40.087 * s, threshold);
			_bez(x +   21.924 * s,y +  -40.087 * s,x +   21.924 * s,y +  -37.483 * s,x +   25.471 * s,y +  -35.622 * s,x +   32.373 * s,y +  -33.740 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   32.910 * s);
			_setf(o + ( 1 << 2), y +  -33.593 * s);
			_setf(o + ( 2 << 2), x +   37.011 * s);
			_setf(o + ( 3 << 2), y +  -32.617 * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_bez(x +   37.011 * s,y +  -32.617 * s,x +   42.219 * s,y +  -31.377 * s,x +   46.036 * s,y +  -29.386 * s,x +   48.461 * s,y +  -26.635 * s, threshold);
			_bez(x +   48.461 * s,y +  -26.635 * s,x +   50.887 * s,y +  -23.885 * s,x +   52.099 * s,y +  -20.166 * s,x +   52.099 * s,y +  -15.478 * s, threshold);
			_bez(x +   52.099 * s,y +  -15.478 * s,x +   52.099 * s,y +   -9.847 * s,x +   50.252 * s,y +   -5.623 * s,x +   46.557 * s,y +   -2.808 * s, threshold);
			_bez(x +   46.557 * s,y +   -2.808 * s,x +   42.863 * s,y +    0.008 * s,x +   37.305 * s,y +    1.416 * s,x +   29.883 * s,y +    1.416 * s, threshold);
			_bez(x +   29.883 * s,y +    1.416 * s,x +   26.595 * s,y +    1.416 * s,x +   23.226 * s,y +    1.131 * s,x +   19.775 * s,y +    0.562 * s, threshold);
			_bez(x +   19.775 * s,y +    0.562 * s,x +   16.325 * s,y +   -0.008 * s,x +   12.826 * s,y +   -0.863 * s,x +    9.277 * s,y +   -2.002 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    9.277 * s);
			_setf(o + ( 1 << 2), y +  -14.502 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    9.277 * s,y +  -14.502 * s,x +   12.435 * s,y +  -12.711 * s,x +   15.649 * s,y +  -11.344 * s,x +   18.921 * s,y +  -10.400 * s, threshold);
			_bez(x +   18.921 * s,y +  -10.400 * s,x +   22.192 * s,y +   -9.456 * s,x +   25.358 * s,y +   -8.984 * s,x +   28.418 * s,y +   -8.984 * s, threshold);
			_bez(x +   28.418 * s,y +   -8.984 * s,x +   31.771 * s,y +   -8.984 * s,x +   34.310 * s,y +   -9.473 * s,x +   36.035 * s,y +  -10.449 * s, threshold);
			_bez(x +   36.035 * s,y +  -10.449 * s,x +   37.760 * s,y +  -11.426 * s,x +   38.623 * s,y +  -12.842 * s,x +   38.623 * s,y +  -14.697 * s, threshold);
			_bez(x +   38.623 * s,y +  -14.697 * s,x +   38.623 * s,y +  -16.520 * s,x +   38.012 * s,y +  -17.920 * s,x +   36.792 * s,y +  -18.896 * s, threshold);
			_bez(x +   36.792 * s,y +  -18.896 * s,x +   35.571 * s,y +  -19.873 * s,x +   32.685 * s,y +  -20.997 * s,x +   28.076 * s,y +  -22.021 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   24.121 * s);
			_setf(o + ( 1 << 2), y +  -22.900 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   24.121 * s,y +  -22.900 * s,x +   18.648 * s,y +  -24.116 * s,x +   14.665 * s,y +  -26.074 * s,x +   12.158 * s,y +  -28.710 * s, threshold);
			_bez(x +   12.158 * s,y +  -28.710 * s,x +    9.652 * s,y +  -31.347 * s,x +    8.399 * s,y +  -34.879 * s,x +    8.399 * s,y +  -39.306 * s, threshold);
			_bez(x +    8.399 * s,y +  -39.306 * s,x +    8.399 * s,y +  -44.580 * s,x +   10.303 * s,y +  -48.681 * s,x +   14.111 * s,y +  -51.611 * s, threshold);
			_bez(x +   14.111 * s,y +  -51.611 * s,x +   17.920 * s,y +  -54.540 * s,x +   23.275 * s,y +  -56.005 * s,x +   30.176 * s,y +  -56.005 * s, threshold);
			_bez(x +   30.176 * s,y +  -56.005 * s,x +   33.268 * s,y +  -56.005 * s,x +   36.352 * s,y +  -55.753 * s,x +   39.428 * s,y +  -55.248 * s, threshold);
			_bez(x +   39.428 * s,y +  -55.248 * s,x +   42.505 * s,y +  -54.744 * s,x +   45.491 * s,y +  -53.987 * s,x +   48.388 * s,y +  -52.978 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 116:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   33.691 * s);
			_setf(o + ( 1 << 2), y +  -70.214 * s);
			_setf(o + ( 2 << 2), x +   33.691 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   52.392 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   52.392 * s);
			_setf(o + ( 7 << 2), y +  -43.701 * s);
			_setf(o + ( 8 << 2), x +   33.691 * s);
			_setf(o + ( 9 << 2), y +  -43.701 * s);
			_setf(o + (10 << 2), x +   33.691 * s);
			_setf(o + (11 << 2), y +  -17.822 * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 2);
			_bez(x +   33.691 * s,y +  -17.822 * s,x +   33.691 * s,y +  -15.381 * s,x +   34.285 * s,y +  -13.631 * s,x +   35.474 * s,y +  -12.573 * s, threshold);
			_bez(x +   35.474 * s,y +  -12.573 * s,x +   36.662 * s,y +  -11.515 * s,x +   38.639 * s,y +  -10.986 * s,x +   41.406 * s,y +  -10.986 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   52.392 * s);
			_setf(o + ( 1 << 2), y +  -10.986 * s);
			_setf(o + ( 2 << 2), x +   52.392 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   40.381 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   40.381 * s,y +       0. * s,x +   32.178 * s,y +       0. * s,x +   26.628 * s,y +   -1.310 * s,x +   23.731 * s,y +   -3.931 * s, threshold);
			_bez(x +   23.731 * s,y +   -3.931 * s,x +   20.833 * s,y +   -6.551 * s,x +   19.385 * s,y +  -11.410 * s,x +   19.385 * s,y +  -18.506 * s, threshold);
			o = _posf(14);
			_setf(o + ( 0 << 2), x +   19.385 * s);
			_setf(o + ( 1 << 2), y +  -43.701 * s);
			_setf(o + ( 2 << 2), x +    5.420 * s);
			_setf(o + ( 3 << 2), y +  -43.701 * s);
			_setf(o + ( 4 << 2), x +    5.420 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   19.385 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   19.385 * s);
			_setf(o + ( 9 << 2), y +  -70.214 * s);
			_setf(o + (10 << 2), x +   33.691 * s);
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
			_setf(o + ( 0 << 2), x +    7.812 * s);
			_setf(o + ( 1 << 2), y +  -19.091 * s);
			_setf(o + ( 2 << 2), x +    7.812 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   22.118 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   22.118 * s);
			_setf(o + ( 7 << 2), y +  -21.289 * s);
			o = _posb(4);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_bez(x +   22.118 * s,y +  -21.289 * s,x +   22.118 * s,y +  -17.350 * s,x +   22.672 * s,y +  -14.534 * s,x +   23.779 * s,y +  -12.842 * s, threshold);
			_bez(x +   23.779 * s,y +  -12.842 * s,x +   24.885 * s,y +  -11.149 * s,x +   26.724 * s,y +  -10.303 * s,x +   29.296 * s,y +  -10.303 * s, threshold);
			_bez(x +   29.296 * s,y +  -10.303 * s,x +   31.868 * s,y +  -10.303 * s,x +   33.878 * s,y +  -11.442 * s,x +   35.326 * s,y +  -13.720 * s, threshold);
			_bez(x +   35.326 * s,y +  -13.720 * s,x +   36.775 * s,y +  -15.999 * s,x +   37.499 * s,y +  -19.189 * s,x +   37.499 * s,y +  -23.291 * s, threshold);
			o = _posf(10);
			_setf(o + ( 0 << 2), x +   37.499 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   51.805 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   51.805 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   37.499 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   37.499 * s);
			_setf(o + ( 9 << 2), y +   -8.105 * s);
			o = _posb(5);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_bez(x +   37.499 * s,y +   -8.105 * s,x +   36.490 * s,y +   -5.078 * s,x +   34.773 * s,y +   -2.734 * s,x +   32.348 * s,y +   -1.074 * s, threshold);
			_bez(x +   32.348 * s,y +   -1.074 * s,x +   29.923 * s,y +    0.586 * s,x +   27.001 * s,y +    1.416 * s,x +   23.583 * s,y +    1.416 * s, threshold);
			_bez(x +   23.583 * s,y +    1.416 * s,x +   18.375 * s,y +    1.416 * s,x +   14.444 * s,y +   -0.309 * s,x +   11.791 * s,y +   -3.760 * s, threshold);
			_bez(x +   11.791 * s,y +   -3.760 * s,x +    9.138 * s,y +   -7.210 * s,x +    7.812 * s,y +  -12.321 * s,x +    7.812 * s,y +  -19.091 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
			
			case 118:
			
			o = _posf(18);
			_setf(o + ( 0 << 2), x +   56.298 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   38.915 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   21.288 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +    3.906 * s);
			_setf(o + ( 7 << 2), y +  -54.687 * s);
			_setf(o + ( 8 << 2), x +   18.408 * s);
			_setf(o + ( 9 << 2), y +  -54.687 * s);
			_setf(o + (10 << 2), x +   30.077 * s);
			_setf(o + (11 << 2), y +  -12.012 * s);
			_setf(o + (12 << 2), x +   41.796 * s);
			_setf(o + (13 << 2), y +  -54.687 * s);
			_setf(o + (14 << 2), x +   56.298 * s);
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
			_setf(o + ( 2 << 2), x +   11.914 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   18.408 * s);
			_setf(o + ( 5 << 2), y +  -12.793 * s);
			_setf(o + ( 6 << 2), x +   24.316 * s);
			_setf(o + ( 7 << 2), y +  -40.380 * s);
			_setf(o + ( 8 << 2), x +   35.888 * s);
			_setf(o + ( 9 << 2), y +  -40.380 * s);
			_setf(o + (10 << 2), x +   41.698 * s);
			_setf(o + (11 << 2), y +  -12.793 * s);
			_setf(o + (12 << 2), x +   48.290 * s);
			_setf(o + (13 << 2), y +  -54.687 * s);
			_setf(o + (14 << 2), x +   60.204 * s);
			_setf(o + (15 << 2), y +  -54.687 * s);
			_setf(o + (16 << 2), x +   50.292 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   36.718 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   30.078 * s);
			_setf(o + (21 << 2), y +  -28.418 * s);
			_setf(o + (22 << 2), x +   23.486 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +    9.912 * s);
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
			_setf(o + ( 0 << 2), x +   55.907 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   37.499 * s);
			_setf(o + ( 3 << 2), y +  -28.515 * s);
			_setf(o + ( 4 << 2), x +   57.519 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   40.820 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   30.078 * s);
			_setf(o + ( 9 << 2), y +  -18.408 * s);
			_setf(o + (10 << 2), x +   19.384 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    2.686 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   22.900 * s);
			_setf(o + (15 << 2), y +  -28.515 * s);
			_setf(o + (16 << 2), x +    4.297 * s);
			_setf(o + (17 << 2), y +  -54.687 * s);
			_setf(o + (18 << 2), x +   20.996 * s);
			_setf(o + (19 << 2), y +  -54.687 * s);
			_setf(o + (20 << 2), x +   30.078 * s);
			_setf(o + (21 << 2), y +  -38.378 * s);
			_setf(o + (22 << 2), x +   39.208 * s);
			_setf(o + (23 << 2), y +  -54.687 * s);
			_setf(o + (24 << 2), x +   55.907 * s);
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
			_setf(o + ( 0 << 2), x +   34.716 * s);
			_setf(o + ( 1 << 2), y +    5.908 * s);
			o = _posb(1);
			_setb(o +  0, 1);
			_bez(x +   34.716 * s,y +    5.908 * s,x +   32.790 * s,y +   11.049 * s,x +   30.493 * s,y +   14.803 * s,x +   27.807 * s,y +   17.163 * s, threshold);
			_bez(x +   27.807 * s,y +   17.163 * s,x +   25.122 * s,y +   19.523 * s,x +   21.858 * s,y +   20.703 * s,x +   18.017 * s,y +   20.703 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    6.201 * s);
			_setf(o + ( 1 << 2), y +   20.703 * s);
			_setf(o + ( 2 << 2), x +    6.201 * s);
			_setf(o + ( 3 << 2), y +    9.814 * s);
			_setf(o + ( 4 << 2), x +   12.011 * s);
			_setf(o + ( 5 << 2), y +    9.814 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   12.011 * s,y +    9.814 * s,x +   14.941 * s,y +    9.814 * s,x +   17.090 * s,y +    9.318 * s,x +   18.457 * s,y +    8.325 * s, threshold);
			_bez(x +   18.457 * s,y +    8.325 * s,x +   19.824 * s,y +    7.332 * s,x +   21.273 * s,y +    5.054 * s,x +   22.607 * s,y +    1.416 * s, threshold);
			o = _posf(16);
			_setf(o + ( 0 << 2), x +   23.681 * s);
			_setf(o + ( 1 << 2), y +   -1.514 * s);
			_setf(o + ( 2 << 2), x +    2.881 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   17.920 * s);
			_setf(o + ( 5 << 2), y +  -54.687 * s);
			_setf(o + ( 6 << 2), x +   30.419 * s);
			_setf(o + ( 7 << 2), y +  -19.189 * s);
			_setf(o + ( 8 << 2), x +   42.382 * s);
			_setf(o + ( 9 << 2), y +  -54.687 * s);
			_setf(o + (10 << 2), x +   57.421 * s);
			_setf(o + (11 << 2), y +  -54.687 * s);
			_setf(o + (12 << 2), x +   34.716 * s);
			_setf(o + (13 << 2), y +    5.908 * s);
			_setf(o + (14 << 2), x +   60.204 * s);
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
			_setf(o + ( 0 << 2), x +    9.082 * s);
			_setf(o + ( 1 << 2), y +  -54.687 * s);
			_setf(o + ( 2 << 2), x +   52.783 * s);
			_setf(o + ( 3 << 2), y +  -54.687 * s);
			_setf(o + ( 4 << 2), x +   52.783 * s);
			_setf(o + ( 5 << 2), y +  -43.505 * s);
			_setf(o + ( 6 << 2), x +   24.023 * s);
			_setf(o + ( 7 << 2), y +  -10.693 * s);
			_setf(o + ( 8 << 2), x +   52.783 * s);
			_setf(o + ( 9 << 2), y +  -10.693 * s);
			_setf(o + (10 << 2), x +   52.783 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +    7.910 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +    7.910 * s);
			_setf(o + (15 << 2), y +  -11.181 * s);
			_setf(o + (16 << 2), x +   36.718 * s);
			_setf(o + (17 << 2), y +  -43.993 * s);
			_setf(o + (18 << 2), x +    9.082 * s);
			_setf(o + (19 << 2), y +  -43.993 * s);
			_setf(o + (20 << 2), x +    9.082 * s);
			_setf(o + (21 << 2), y +  -54.687 * s);
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
			_setf(o + ( 0 << 2), x +   51.416 * s);
			_setf(o + ( 1 << 2), y +    6.982 * s);
			_setf(o + ( 2 << 2), x +   51.416 * s);
			_setf(o + ( 3 << 2), y +   16.308 * s);
			_setf(o + ( 4 << 2), x +   44.091 * s);
			_setf(o + ( 5 << 2), y +   16.308 * s);
			o = _posb(3);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   44.091 * s,y +   16.308 * s,x +   35.986 * s,y +   16.308 * s,x +   30.558 * s,y +   15.104 * s,x +   27.807 * s,y +   12.695 * s, threshold);
			_bez(x +   27.807 * s,y +   12.695 * s,x +   25.057 * s,y +   10.286 * s,x +   23.682 * s,y +    5.485 * s,x +   23.682 * s,y +   -1.709 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   23.682 * s);
			_setf(o + ( 1 << 2), y +  -12.207 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   23.682 * s,y +  -12.207 * s,x +   23.682 * s,y +  -17.122 * s,x +   22.811 * s,y +  -20.516 * s,x +   21.069 * s,y +  -22.387 * s, threshold);
			_bez(x +   21.069 * s,y +  -22.387 * s,x +   19.328 * s,y +  -24.259 * s,x +   16.178 * s,y +  -25.195 * s,x +   11.621 * s,y +  -25.195 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    8.594 * s);
			_setf(o + ( 1 << 2), y +  -25.195 * s);
			_setf(o + ( 2 << 2), x +    8.594 * s);
			_setf(o + ( 3 << 2), y +  -34.521 * s);
			_setf(o + ( 4 << 2), x +   11.621 * s);
			_setf(o + ( 5 << 2), y +  -34.521 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   11.621 * s,y +  -34.521 * s,x +   16.178 * s,y +  -34.521 * s,x +   19.328 * s,y +  -35.449 * s,x +   21.069 * s,y +  -37.304 * s, threshold);
			_bez(x +   21.069 * s,y +  -37.304 * s,x +   22.811 * s,y +  -39.160 * s,x +   23.682 * s,y +  -42.561 * s,x +   23.682 * s,y +  -47.509 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   23.682 * s);
			_setf(o + ( 1 << 2), y +  -58.007 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   23.682 * s,y +  -58.007 * s,x +   23.682 * s,y +  -65.201 * s,x +   25.057 * s,y +  -69.994 * s,x +   27.807 * s,y +  -72.387 * s, threshold);
			_bez(x +   27.807 * s,y +  -72.387 * s,x +   30.558 * s,y +  -74.779 * s,x +   35.986 * s,y +  -75.975 * s,x +   44.091 * s,y +  -75.975 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   51.416 * s);
			_setf(o + ( 1 << 2), y +  -75.975 * s);
			_setf(o + ( 2 << 2), x +   51.416 * s);
			_setf(o + ( 3 << 2), y +  -66.698 * s);
			_setf(o + ( 4 << 2), x +   45.410 * s);
			_setf(o + ( 5 << 2), y +  -66.698 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   45.410 * s,y +  -66.698 * s,x +   42.024 * s,y +  -66.698 * s,x +   39.762 * s,y +  -66.015 * s,x +   38.623 * s,y +  -64.647 * s, threshold);
			_bez(x +   38.623 * s,y +  -64.647 * s,x +   37.483 * s,y +  -63.280 * s,x +   36.914 * s,y +  -60.269 * s,x +   36.914 * s,y +  -55.614 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.914 * s);
			_setf(o + ( 1 << 2), y +  -45.409 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   36.914 * s,y +  -45.409 * s,x +   36.914 * s,y +  -40.038 * s,x +   36.116 * s,y +  -36.262 * s,x +   34.521 * s,y +  -34.081 * s, threshold);
			_bez(x +   34.521 * s,y +  -34.081 * s,x +   32.926 * s,y +  -31.901 * s,x +   30.078 * s,y +  -30.501 * s,x +   25.976 * s,y +  -29.882 * s, threshold);
			_bez(x +   25.976 * s,y +  -29.882 * s,x +   30.078 * s,y +  -29.199 * s,x +   32.926 * s,y +  -27.750 * s,x +   34.521 * s,y +  -25.537 * s, threshold);
			_bez(x +   34.521 * s,y +  -25.537 * s,x +   36.116 * s,y +  -23.323 * s,x +   36.914 * s,y +  -19.547 * s,x +   36.914 * s,y +  -14.209 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.914 * s);
			_setf(o + ( 1 << 2), y +   -4.199 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   36.914 * s,y +   -4.199 * s,x +   36.914 * s,y +    0.488 * s,x +   37.483 * s,y +    3.524 * s,x +   38.623 * s,y +    4.907 * s, threshold);
			_bez(x +   38.623 * s,y +    4.907 * s,x +   39.762 * s,y +    6.291 * s,x +   42.024 * s,y +    6.982 * s,x +   45.410 * s,y +    6.982 * s, threshold);
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   51.416 * s);
			_setf(o + ( 1 << 2), y +    6.982 * s);
			_setf(o + ( 2 << 2), x +   60.204 * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			o = _posb(2);
			_setb(o +  0, 2);
			_setb(o +  1, 1);
			
			case 124:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   35.596 * s);
			_setf(o + ( 1 << 2), y +  -76.415 * s);
			_setf(o + ( 2 << 2), x +   35.596 * s);
			_setf(o + ( 3 << 2), y +   23.584 * s);
			_setf(o + ( 4 << 2), x +   24.512 * s);
			_setf(o + ( 5 << 2), y +   23.584 * s);
			_setf(o + ( 6 << 2), x +   24.512 * s);
			_setf(o + ( 7 << 2), y +  -76.415 * s);
			_setf(o + ( 8 << 2), x +   35.596 * s);
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
			_setf(o + ( 0 << 2), x +    8.789 * s);
			_setf(o + ( 1 << 2), y +    6.982 * s);
			_setf(o + ( 2 << 2), x +   14.697 * s);
			_setf(o + ( 3 << 2), y +    6.982 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   14.697 * s,y +    6.982 * s,x +   18.082 * s,y +    6.982 * s,x +   20.361 * s,y +    6.282 * s,x +   21.532 * s,y +    4.883 * s, threshold);
			_bez(x +   21.532 * s,y +    4.883 * s,x +   22.704 * s,y +    3.483 * s,x +   23.290 * s,y +    0.455 * s,x +   23.290 * s,y +   -4.199 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   23.290 * s);
			_setf(o + ( 1 << 2), y +  -14.209 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   23.290 * s,y +  -14.209 * s,x +   23.290 * s,y +  -19.547 * s,x +   24.088 * s,y +  -23.323 * s,x +   25.683 * s,y +  -25.537 * s, threshold);
			_bez(x +   25.683 * s,y +  -25.537 * s,x +   27.278 * s,y +  -27.750 * s,x +   30.110 * s,y +  -29.199 * s,x +   34.179 * s,y +  -29.882 * s, threshold);
			_bez(x +   34.179 * s,y +  -29.882 * s,x +   30.077 * s,y +  -30.501 * s,x +   27.237 * s,y +  -31.901 * s,x +   25.658 * s,y +  -34.081 * s, threshold);
			_bez(x +   25.658 * s,y +  -34.081 * s,x +   24.080 * s,y +  -36.262 * s,x +   23.290 * s,y +  -40.038 * s,x +   23.290 * s,y +  -45.409 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   23.290 * s);
			_setf(o + ( 1 << 2), y +  -55.614 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   23.290 * s,y +  -55.614 * s,x +   23.290 * s,y +  -60.204 * s,x +   22.712 * s,y +  -63.199 * s,x +   21.557 * s,y +  -64.599 * s, threshold);
			_bez(x +   21.557 * s,y +  -64.599 * s,x +   20.401 * s,y +  -65.998 * s,x +   18.115 * s,y +  -66.698 * s,x +   14.697 * s,y +  -66.698 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    8.789 * s);
			_setf(o + ( 1 << 2), y +  -66.698 * s);
			_setf(o + ( 2 << 2), x +    8.789 * s);
			_setf(o + ( 3 << 2), y +  -75.975 * s);
			_setf(o + ( 4 << 2), x +   16.113 * s);
			_setf(o + ( 5 << 2), y +  -75.975 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   16.113 * s,y +  -75.975 * s,x +   24.185 * s,y +  -75.975 * s,x +   29.581 * s,y +  -74.779 * s,x +   32.299 * s,y +  -72.387 * s, threshold);
			_bez(x +   32.299 * s,y +  -72.387 * s,x +   35.017 * s,y +  -69.994 * s,x +   36.376 * s,y +  -65.201 * s,x +   36.376 * s,y +  -58.007 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.376 * s);
			_setf(o + ( 1 << 2), y +  -47.509 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   36.376 * s,y +  -47.509 * s,x +   36.376 * s,y +  -42.594 * s,x +   37.263 * s,y +  -39.200 * s,x +   39.037 * s,y +  -37.329 * s, threshold);
			_bez(x +   39.037 * s,y +  -37.329 * s,x +   40.811 * s,y +  -35.457 * s,x +   43.993 * s,y +  -34.521 * s,x +   48.583 * s,y +  -34.521 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +   51.610 * s);
			_setf(o + ( 1 << 2), y +  -34.521 * s);
			_setf(o + ( 2 << 2), x +   51.610 * s);
			_setf(o + ( 3 << 2), y +  -25.195 * s);
			_setf(o + ( 4 << 2), x +   48.583 * s);
			_setf(o + ( 5 << 2), y +  -25.195 * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_bez(x +   48.583 * s,y +  -25.195 * s,x +   43.993 * s,y +  -25.195 * s,x +   40.811 * s,y +  -24.251 * s,x +   39.037 * s,y +  -22.363 * s, threshold);
			_bez(x +   39.037 * s,y +  -22.363 * s,x +   37.263 * s,y +  -20.475 * s,x +   36.376 * s,y +  -17.090 * s,x +   36.376 * s,y +  -12.207 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   36.376 * s);
			_setf(o + ( 1 << 2), y +   -1.709 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +   36.376 * s,y +   -1.709 * s,x +   36.376 * s,y +    5.485 * s,x +   35.017 * s,y +   10.286 * s,x +   32.299 * s,y +   12.695 * s, threshold);
			_bez(x +   32.299 * s,y +   12.695 * s,x +   29.581 * s,y +   15.104 * s,x +   24.185 * s,y +   16.308 * s,x +   16.113 * s,y +   16.308 * s, threshold);
			o = _posf(6);
			_setf(o + ( 0 << 2), x +    8.789 * s);
			_setf(o + ( 1 << 2), y +   16.308 * s);
			_setf(o + ( 2 << 2), x +    8.789 * s);
			_setf(o + ( 3 << 2), y +    6.982 * s);
			_setf(o + ( 4 << 2), x +   60.204 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			o = _posb(3);
			_setb(o +  0, 2);
			_setb(o +  1, 2);
			_setb(o +  2, 1);
			
			case 126:
			
			o = _posf(4);
			_setf(o + ( 0 << 2), x +   55.907 * s);
			_setf(o + ( 1 << 2), y +  -39.599 * s);
			_setf(o + ( 2 << 2), x +   55.907 * s);
			_setf(o + ( 3 << 2), y +  -28.222 * s);
			o = _posb(2);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_bez(x +   55.907 * s,y +  -28.222 * s,x +   53.466 * s,y +  -26.269 * s,x +   51.081 * s,y +  -24.845 * s,x +   48.754 * s,y +  -23.950 * s, threshold);
			_bez(x +   48.754 * s,y +  -23.950 * s,x +   46.426 * s,y +  -23.055 * s,x +   43.977 * s,y +  -22.607 * s,x +   41.405 * s,y +  -22.607 * s, threshold);
			_bez(x +   41.405 * s,y +  -22.607 * s,x +   38.476 * s,y +  -22.607 * s,x +   35.171 * s,y +  -23.436 * s,x +   31.493 * s,y +  -25.097 * s, threshold);
			_bez(x +   31.493 * s,y +  -25.097 * s,x +   30.777 * s,y +  -25.421 * s,x +   30.232 * s,y +  -25.630 * s,x +   29.882 * s,y +  -25.781 * s, threshold);
			_bez(x +   29.882 * s,y +  -25.781 * s,x +   27.367 * s,y +  -26.867 * s,x +   25.284 * s,y +  -27.636 * s,x +   23.608 * s,y +  -28.027 * s, threshold);
			_bez(x +   23.608 * s,y +  -28.027 * s,x +   21.931 * s,y +  -28.418 * s,x +   20.263 * s,y +  -28.613 * s,x +   18.603 * s,y +  -28.613 * s, threshold);
			_bez(x +   18.603 * s,y +  -28.613 * s,x +   16.064 * s,y +  -28.613 * s,x +   13.647 * s,y +  -28.141 * s,x +   11.352 * s,y +  -27.197 * s, threshold);
			_bez(x +   11.352 * s,y +  -27.197 * s,x +    9.057 * s,y +  -26.253 * s,x +    6.705 * s,y +  -24.755 * s,x +    4.297 * s,y +  -22.705 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +    4.297 * s);
			_setf(o + ( 1 << 2), y +  -33.886 * s);
			o = _posb(1);
			_setb(o +  0, 2);
			_bez(x +    4.297 * s,y +  -33.886 * s,x +    6.836 * s,y +  -35.872 * s,x +    9.293 * s,y +  -37.304 * s,x +   11.669 * s,y +  -38.183 * s, threshold);
			_bez(x +   11.669 * s,y +  -38.183 * s,x +   14.046 * s,y +  -39.062 * s,x +   16.585 * s,y +  -39.501 * s,x +   19.287 * s,y +  -39.501 * s, threshold);
			_bez(x +   19.287 * s,y +  -39.501 * s,x +   21.012 * s,y +  -39.501 * s,x +   22.688 * s,y +  -39.322 * s,x +   24.316 * s,y +  -38.964 * s, threshold);
			_bez(x +   24.316 * s,y +  -38.964 * s,x +   25.943 * s,y +  -38.606 * s,x +   27.965 * s,y +  -37.932 * s,x +   30.370 * s,y +  -36.913 * s, threshold);
			_bez(x +   30.370 * s,y +  -36.913 * s,x +   30.733 * s,y +  -36.760 * s,x +   31.270 * s,y +  -36.516 * s,x +   31.982 * s,y +  -36.181 * s, threshold);
			_bez(x +   31.982 * s,y +  -36.181 * s,x +   35.762 * s,y +  -34.400 * s,x +   39.159 * s,y +  -33.496 * s,x +   42.187 * s,y +  -33.496 * s, threshold);
			_bez(x +   42.187 * s,y +  -33.496 * s,x +   44.465 * s,y +  -33.496 * s,x +   46.728 * s,y +  -33.992 * s,x +   48.974 * s,y +  -34.985 * s, threshold);
			_bez(x +   48.974 * s,y +  -34.985 * s,x +   51.220 * s,y +  -35.978 * s,x +   53.531 * s,y +  -37.516 * s,x +   55.907 * s,y +  -39.599 * s, threshold);
			o = _posf(2);
			_setf(o + ( 0 << 2), x +   60.204 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			o = _posb(1);
			_setb(o +  0, 1);
		}
	}
	#end
}