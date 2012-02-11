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
package de.polygonal.gl.text.fonts.bitmap04;

import de.polygonal.gl.text.VectorFont;
import de.polygonal.gl.VectorRenderer;
import flash.Memory;

class Bitmap04b31 extends de.polygonal.gl.text.ProportionalVectorFont
{
	public function new()
	{
		#if font_inline
		super(960, 720, -240, BOUNDS_TABLE, SPACING_TABLE, null);
		#else
		super(
		"eNrVWkmPVUUUrvvwbVwZ48KVUUEQhBZEcULp91D7OiHYT3BAFHF6zvPUomzuP9C/YKILf4ELcdOkV/6EXrjpxI2JC2KUturU+U4Np6pvN+3GJiRfajzn1JnvM1t+Hvy6elUza06ZG8wNjbF/v3STSwMHzl8wZjDqJksCZMoBWny+m79II+6P1giQKQea8dBPmRvtNaPF"+
		"1Rk6i8DQgvH27/8OQKbcNepiD9ximhLgFo+nk910zVYzbcaLq2d/mVoqCLid4+/4dAI0ZbcHQBd3x68IYMpMBGAJ9FMAJB4RGIGhXUxTACQVd4UAmnJkCPBTllQBfmplshDABUwBEBluKgBheeoE7664gEsB/GInBAA31RxmCs020xaUYTx36a8A4vcNOjBemb8owJ/e"+
		"gTgH7E4/JSBRqvEin+wWB+C5xe28pnFk8DPwXQToZDclwE453n4iEm8yB+karwiLfIS8baTNzIkD/mJ5ASdm2U50QyIOMP+TBQEy5ekWQXR8TqrbMmVBoHu72e+NwTNqAa1bBKNgKTmLdQk0iQgTTuRAJydSho70lo1YfEDQJV4TiNthrm5KBmrtZBgbVXhoqNrNZm+T"+
		"2hxx45RUQGyXTcWeOthcF9lcI/IUTU3WyBSJGm9ndsY06beRnQlNMuIfGzQJJ1hTdJzMkmwPjrPlRbvMLis0qPeQDYcUXkDMTfwKdgqAaYqA97vOTATIFSSVziuyucVRIC4g1gVv3rBGAmQdeDtxOYmVabfkX1MsiO9q4BTNbtYyEdHIO9j5iwJU2PFatsfu1CQXyIEr"+
		"hM2YmfzO3hfDnbeaQ/R8XgRtMOxLAcgUbCIo/RBTw2Q7r2kS2yqoXGx/G2SAg5HZm6cE2rHl3ttGprKRUUACgO/wctpnrm1KRsYKLX7YaaSA7GJY7m1WRwvONHGSZXev/XXBAaoAIBSIJ9xfoSBiv6Z7cVyvhteq8EWet5ttWYBTXkA7Nq84En0lYiThPAl5wvEdOcfl"+
		"cN3LTRyGogC3IllDVeYHzJ5eRVV5W9/pZWUuv1QQ/p1FZU4UsCJYzdZdNgxt0P4kIVo7T6BAj3cp6LlKtYSmu3NR/xeqK0ZReKDccIKo74F7ynLzOBeM8/emlKTbiCEgTuQbeBtzb+WamNL6NQVnm13D3BxEzjGF26RYKsk6ChWsaaTACOUEYqlcgzWN9jbJmsQjBW96"+
		"X5H18Xc/fB1Aj4TdmgBS1hHW7yfWraJOJ6f5LACtzHYqTYPP20rRsR5AmtDSfW7K0zRZ8rsEyJQFlvXVGaLpUNDzJbZjd/ri6pkA+F1+E+ApWJmcFhC2W9DQGjfigLeFLgIy5YDT8z+IlFlzICWl6EDia+AGKFAC0Ok+RWLAnDjHABAcgyNlLgaLvCYAptI7hlEusEIR"+
		"pY4oOoYSJ1mFV6RbSBlbgQUZxLUxXSPECbkc05ZKMgC5oiveXWLKUemdLE/p0jpMWRCoPGyua7Kkg97FBRsGnj8KUQCxeLRvDc7xAbOjCSJagdCgNH0ycJR68M23LHMGCesDrAlsPZhnA5eZXV1+NvCQzX80BdoHl+7bQH4gop6rcJw3QkaL//wpoJIjSQkTOhn1Zolw"+
		"3LrKTLU0UumVWwNpy07RVAncOgd8OK//tcwr9f8jzgymKIWmqIDycmFdCQXOCXQ9akNLaJOV+4D65WuyUhoUpz2VnFPnLY/ZFLHHHmqNnMjMPX+PF3UvlTuJUerHFmd1qLe7kszXXW0cse9XoiDy+5tIgZ/YeAlaymo1BWlWe9R6y74H79CDBSjksLrppXPYYSy9Y+XK"+
		"JW6BjNAFFdAnvbW8SV0GT5r9TZ+D6NC07tKmddxf7JWTFKRx917XKMNYD+YrNeZGy47L9/KTXM91nxnmtCBg3R78qTwZSPzsoKLV6/USxykZgPODrPQjYU2T9m9qXeX4U0VcKAehncgDk+7t+ylpGc4VVbfGaH9z4mlzpBAa0w8maSe/GPbKoTErRNSatBCpfMkqhupi"+
		"EZmHaqmkhNtnSN7RQ68nuG2igheFkRd/dhMNuOg1tQ5wphaBiik9VwxIpY8Fyjmqjw66wXjSHAoPKZ4rbbp3ySfJIbzbMPZ3qePjNVR+cht+dQa93CUBMkXOcSweGZqB6jXazmtCU/f5oh9Luq21549FWBHPKfUdSGUf2U5OQ8wLxT57iDGIOqFNjQ79i+U713hMfFM5"+
		"baOv/oKy4W5x8iWmEn37+movWRct+rAO5x5iFnbVUp9h3AXWF5+BPkB9q/VaHBLoLEeBgORLmriDl1GGio9V5tLnyivZTA9br0hideLK2pfQ7uROlhVAocnP2x3gpsKP17C/Bmjh7gXYqUDKq/I10Z7lfbHd6XWKge7IFZxWoWa1232HEKDFVBszgNvDu7wG8bTSrJv7"+
		"0UsFQOfxIycn90ACZLsDjai3KLx/qWO/80sxSGPW67ZcT+UZy3wzpWr8UuG+qZQUuKZFpSQgefXkpQr1Vfyaoa59Q3IuexaB8ttgDZep7iEpAlsJe1fHoMIfdgX+3kTJK6d7OTClir81C9z4k2kh6yvbi7Ak6vaWuOj0vrhITC0NO99GPtFWcyGvVxQVGSD/XhKglbAg"+
		"z0SZRZ7vwEG21ZY+H+qKOwbrON3z9y60MTk9dYfayLzDcu6QQcHI7FRg4j0UuDhrBJ8noI/kssvsu/j9/GKtRexNXIHLIL+Y7cGHIAZa5rjYC/YDfIjLni1WOdq5EoOyCnxolbDP5SuTKkX8XHrrdlofOaMWB08ZTeTXg/dKOCa2RFYhqqSx3cmccmIGLAwX2wHk0kR1"+
		"P3Y1ayyDgloqmirqjXMCx58gc0hODyQLXdiZqmXl4mr8Dxd/ihqqlWrI3ddBRB1eoeXTHSjoZ4313MBwVxDsZ1KzkjPlnMP3kQFkCnlJoYaq1ax8TjktlSlSQOWZQ96SnCOBMq9Z89/Q6Zr1c/QI2piU9IenSpbVdCWKCxW/olXtCzLv3JQSHdApW6kHkutAJT7qdGyB"+
		"KGBRi2BLKWKUWBV+LeVtmA2Qvv61PBWAXEGagx93fVmJ0EkDvxihz9IP0+IkVOtLC48LUMtvdMIb/+Y0SXhD6fhVTnuF60A7uHY/e+YSC6pjbsQIfpRstsoIG6/ZFkb4VwI3qTXb1ciOcJcvoczNsgbS3KlGdskI98bMLTKCon43qmL8Fs7sQc2KFM7MhDX+Uc2tcg4k"+
		"uVfRvC/Qw5zeptbsVyO3K/ncodYcUCN3ql13qTV3q5F78OsD/JjD3BtGmNODGMFvJcx9MsI/UDD345cH1HJxv1c/hI+j7ks+f4qXEaZwFK1Z4K/P+chhNfKAOudBxddDamROyadVax6OdYw/sOVrHlUjj6mRx9XIEXX7E2rNUTVyLN5FXutJtWZejUzUXU+pNcfVyAm1"+
		"62m15hk18qza9ZyywZORpSxxGy1fc0pGuNtlXoDFiZ2+GO+iNacVPS+pkTPol8jIy4rmV+DcZM2rauQ1+EbU8Lb2ztdMMSL684Za86YaeSvsYnreDnfxmnfUyLsxPVymRGuIwvfVyAdq14eKno/UyMdq1yeKnk/VyGfhHN71uaLnC3XXgoygLfqlkupZteareMTdYL42"+
		"m/zbcn0zO9g7NP5fM9ssN8uDc1t+bmbp//V2bBmz0Sq7zs6rGT9bGs3WLNt7/T3L5f1rnzI4Z6k+Nzi3ef7/33//Anh6uQI=");
		#end
		size = 12;
	}
	
	#if font_inline
	static var SPACING_TABLE:Array<Int> =
	[
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
		   0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,  800,  320,  560, 1280, 1280, 1280, 1280,  320,
		 480,  480,  640,  960,  320,  960,  320,  800, 1280,  480, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280,  320,  320,
		 480,  960,  480, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280,  320, 1280, 1280, 1280, 1280, 1280, 1280,
		1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280,  480,  800,  480,  640,  960,  480, 1280, 1280, 1280,
		1280, 1280, 1280, 1280, 1280,  320, 1280, 1280,  320, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280,
		1280, 1280, 1280,  640,  320,  640,  640
	];

	static var BOUNDS_TABLE:Array<Float> =
	[
		  33,          0,    -66.666,     16.666,          0,
		  34,          0,    -66.666,     41.666,    -33.333,
		  35,          0,    -66.666,    116.665,          0,
		  36,          0,    -66.666,    116.664,          0,
		  37,          0,    -66.666,    116.665,          0,
		  38,          0,    -66.666,    116.665,          0,
		  39,          0,    -66.666,     16.667,    -33.333,
		  40,          0,    -66.666,     33.333,          0,
		  41,          0,    -66.666,     33.333,          0,
		  42,          0,    -66.666,     49.999,    -16.666,
		  43,          0,    -66.666,     83.332,          0,
		  44,          0,    -16.666,     16.666,      8.333,
		  45,          0,    -41.666,     83.332,    -25.000,
		  46,          0,    -16.666,     16.667,          0,
		  47,          0,    -66.666,     66.666,          0,
		  48,          0,    -66.666,    116.665,          0,
		  49,          0,    -66.666,     33.332,          0,
		  50,          0,    -66.666,    116.665,          0,
		  51,          0,    -66.666,    116.665,          0,
		  52,          0,    -66.666,    116.664,          0,
		  53,          0,    -66.666,    116.665,          0,
		  54,          0,    -66.666,    116.665,          0,
		  55,          0,    -66.666,    116.664,          0,
		  56,          0,    -66.666,    116.665,          0,
		  57,          0,    -66.666,    116.665,          0,
		  58,          0,    -58.332,     16.666,     -8.333,
		  59,          0,    -58.332,     16.667,          0,
		  60,          0,    -58.332,     33.333,     -8.333,
		  61,          0,    -58.332,     83.333,     -8.333,
		  62,          0,    -58.332,     33.333,     -8.333,
		  63,          0,    -66.666,    116.665,          0,
		  64,          0,    -66.666,    116.664,          0,
		  65,          0,    -66.666,    116.665,          0,
		  66,          0,    -66.666,    116.665,          0,
		  67,          0,    -66.666,    116.665,          0,
		  68,          0,    -66.666,    116.664,          0,
		  69,          0,    -66.666,    116.665,          0,
		  70,          0,    -66.666,    116.665,          0,
		  71,          0,    -66.666,    116.664,          0,
		  72,          0,    -66.666,    116.665,          0,
		  73,          0,    -66.666,     16.667,          0,
		  74,          0,    -66.666,    116.665,          0,
		  75,          0,    -66.666,    116.665,          0,
		  76,          0,    -66.666,    116.665,          0,
		  77,          0,    -66.666,    116.665,          0,
		  78,          0,    -66.666,    116.664,          0,
		  79,          0,    -66.666,    116.665,          0,
		  80,          0,    -66.666,    116.665,          0,
		  81,          0,    -66.666,    116.664,     16.666,
		  82,          0,    -66.666,    116.665,          0,
		  83,          0,    -66.666,    116.665,          0,
		  84,          0,    -66.666,    116.664,          0,
		  85,          0,    -66.666,    116.665,          0,
		  86,          0,    -66.666,    116.665,          0,
		  87,          0,    -66.666,    116.664,          0,
		  88,          0,    -66.666,    116.665,          0,
		  89,          0,    -66.666,    116.665,          0,
		  90,          0,    -66.666,    116.664,          0,
		  91,          0,    -66.666,     33.333,          0,
		  92,          0,    -66.666,     66.666,          0,
		  93,          0,    -66.666,     33.333,          0,
		  94,          0,    -66.666,     50.000,    -49.999,
		  95,          0,    -16.666,     83.332,          0,
		  96,          0,    -66.666,     33.333,    -49.999,
		  97,          0,    -66.666,    116.665,          0,
		  98,          0,    -66.666,    116.665,          0,
		  99,          0,    -49.999,    116.665,          0,
		 100,          0,    -66.666,    116.664,          0,
		 101,          0,    -66.670,    116.665,          0,
		 102,          0,    -66.670,    116.665,          0,
		 103,          0,    -50.000,    116.664,     16.670,
		 104,          0,    -66.670,    116.665,          0,
		 105,          0,    -66.670,     16.667,          0,
		 106,          0,    -66.670,    116.665,          0,
		 107,          0,    -66.670,    116.665,          0,
		 108,          0,    -66.670,     16.666,          0,
		 109,          0,    -50.000,    116.665,          0,
		 110,          0,    -50.000,    116.665,          0,
		 111,          0,    -50.000,    116.664,          0,
		 112,          0,    -50.000,    116.665,     16.670,
		 113,          0,    -50.000,    116.665,     16.670,
		 114,          0,    -50.000,    116.664,          0,
		 115,          0,    -66.670,    116.665,          0,
		 116,          0,    -66.670,    116.665,          0,
		 117,          0,    -50.000,    116.664,          0,
		 118,          0,    -50.000,    116.665,          0,
		 119,          0,    -50.000,    116.665,          0,
		 120,          0,    -66.670,    116.664,          0,
		 121,          0,    -50.000,    116.665,     16.670,
		 122,          0,    -66.670,    116.665,          0,
		 123,          0,    -66.670,     49.999,          0,
		 124,          0,    -66.670,     16.667,          0,
		 125,          0,    -66.670,     49.999,          0,
		 126,          0,    -66.670,     49.999,    -50.000
	];

	override function _draw(charCode:Int, x:Float, y:Float, s:Float, threshold:Float):Void
	{
		var o = 0;
		switch (charCode)
		{			
			case 33:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -25.000 * s);
			_setf(o + ( 4 << 2), x +   16.666 * s);
			_setf(o + ( 5 << 2), y +  -25.000 * s);
			_setf(o + ( 6 << 2), x +   16.666 * s);
			_setf(o + ( 7 << 2), y +  -66.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -66.666 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +  -16.666 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   16.666 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   16.666 * s);
			_setf(o + (17 << 2), y +  -16.666 * s);
			_setf(o + (18 << 2), x +       0. * s);
			_setf(o + (19 << 2), y +  -16.666 * s);
			_setf(o + (20 << 2), x +   33.333 * s);
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
			
			case 34:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +   25.000 * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +   25.000 * s);
			_setf(o + ( 3 << 2), y +  -33.333 * s);
			_setf(o + ( 4 << 2), x +   41.666 * s);
			_setf(o + ( 5 << 2), y +  -33.333 * s);
			_setf(o + ( 6 << 2), x +   41.666 * s);
			_setf(o + ( 7 << 2), y +  -66.666 * s);
			_setf(o + ( 8 << 2), x +   25.000 * s);
			_setf(o + ( 9 << 2), y +  -66.666 * s);
			_setf(o + (10 << 2), x +   16.666 * s);
			_setf(o + (11 << 2), y +  -66.666 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +  -66.666 * s);
			_setf(o + (14 << 2), x +       0. * s);
			_setf(o + (15 << 2), y +  -33.333 * s);
			_setf(o + (16 << 2), x +   16.666 * s);
			_setf(o + (17 << 2), y +  -33.333 * s);
			_setf(o + (18 << 2), x +   16.666 * s);
			_setf(o + (19 << 2), y +  -66.666 * s);
			_setf(o + (20 << 2), x +   58.332 * s);
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
			_setf(o + ( 0 << 2), x +   99.999 * s);
			_setf(o + ( 1 << 2), y +  -58.332 * s);
			_setf(o + ( 2 << 2), x +   99.999 * s);
			_setf(o + ( 3 << 2), y +  -66.666 * s);
			_setf(o + ( 4 << 2), x +   83.332 * s);
			_setf(o + ( 5 << 2), y +  -66.666 * s);
			_setf(o + ( 6 << 2), x +   83.332 * s);
			_setf(o + ( 7 << 2), y +  -58.332 * s);
			_setf(o + ( 8 << 2), x +   33.333 * s);
			_setf(o + ( 9 << 2), y +  -58.332 * s);
			_setf(o + (10 << 2), x +   33.333 * s);
			_setf(o + (11 << 2), y +  -66.666 * s);
			_setf(o + (12 << 2), x +   16.667 * s);
			_setf(o + (13 << 2), y +  -66.666 * s);
			_setf(o + (14 << 2), x +   16.667 * s);
			_setf(o + (15 << 2), y +  -58.332 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -58.332 * s);
			_setf(o + (18 << 2), x +       0. * s);
			_setf(o + (19 << 2), y +  -41.666 * s);
			_setf(o + (20 << 2), x +   16.667 * s);
			_setf(o + (21 << 2), y +  -41.666 * s);
			_setf(o + (22 << 2), x +   16.667 * s);
			_setf(o + (23 << 2), y +  -25.000 * s);
			_setf(o + (24 << 2), x +       0. * s);
			_setf(o + (25 << 2), y +  -25.000 * s);
			_setf(o + (26 << 2), x +       0. * s);
			_setf(o + (27 << 2), y +   -8.333 * s);
			_setf(o + (28 << 2), x +   16.667 * s);
			_setf(o + (29 << 2), y +   -8.333 * s);
			_setf(o + (30 << 2), x +   16.667 * s);
			_setf(o + (31 << 2), y +       0. * s);
			_setf(o + (32 << 2), x +   33.333 * s);
			_setf(o + (33 << 2), y +       0. * s);
			_setf(o + (34 << 2), x +   33.333 * s);
			_setf(o + (35 << 2), y +   -8.333 * s);
			_setf(o + (36 << 2), x +   83.332 * s);
			_setf(o + (37 << 2), y +   -8.333 * s);
			_setf(o + (38 << 2), x +   83.332 * s);
			_setf(o + (39 << 2), y +       0. * s);
			_setf(o + (40 << 2), x +   99.999 * s);
			_setf(o + (41 << 2), y +       0. * s);
			_setf(o + (42 << 2), x +   99.999 * s);
			_setf(o + (43 << 2), y +   -8.333 * s);
			_setf(o + (44 << 2), x +  116.665 * s);
			_setf(o + (45 << 2), y +   -8.333 * s);
			_setf(o + (46 << 2), x +  116.665 * s);
			_setf(o + (47 << 2), y +  -25.000 * s);
			_setf(o + (48 << 2), x +   99.999 * s);
			_setf(o + (49 << 2), y +  -25.000 * s);
			_setf(o + (50 << 2), x +   99.999 * s);
			_setf(o + (51 << 2), y +  -41.666 * s);
			_setf(o + (52 << 2), x +  116.665 * s);
			_setf(o + (53 << 2), y +  -41.666 * s);
			_setf(o + (54 << 2), x +  116.665 * s);
			_setf(o + (55 << 2), y +  -58.332 * s);
			_setf(o + (56 << 2), x +   99.999 * s);
			_setf(o + (57 << 2), y +  -58.332 * s);
			_setf(o + (58 << 2), x +   83.332 * s);
			_setf(o + (59 << 2), y +  -25.000 * s);
			_setf(o + (60 << 2), x +   33.333 * s);
			_setf(o + (61 << 2), y +  -25.000 * s);
			_setf(o + (62 << 2), x +   33.333 * s);
			_setf(o + (63 << 2), y +  -41.666 * s);
			_setf(o + (64 << 2), x +   83.332 * s);
			_setf(o + (65 << 2), y +  -41.666 * s);
			_setf(o + (66 << 2), x +   83.332 * s);
			_setf(o + (67 << 2), y +  -25.000 * s);
			_setf(o + (68 << 2), x +  133.332 * s);
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
			
			o = _posf(48);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -25.000 * s);
			_setf(o + ( 4 << 2), x +   49.999 * s);
			_setf(o + ( 5 << 2), y +  -25.000 * s);
			_setf(o + ( 6 << 2), x +   49.999 * s);
			_setf(o + ( 7 << 2), y +  -16.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -16.666 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +  116.664 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +  116.664 * s);
			_setf(o + (15 << 2), y +  -41.666 * s);
			_setf(o + (16 << 2), x +   66.665 * s);
			_setf(o + (17 << 2), y +  -41.666 * s);
			_setf(o + (18 << 2), x +   66.665 * s);
			_setf(o + (19 << 2), y +  -49.999 * s);
			_setf(o + (20 << 2), x +  116.664 * s);
			_setf(o + (21 << 2), y +  -49.999 * s);
			_setf(o + (22 << 2), x +  116.664 * s);
			_setf(o + (23 << 2), y +  -66.666 * s);
			_setf(o + (24 << 2), x +       0. * s);
			_setf(o + (25 << 2), y +  -66.666 * s);
			_setf(o + (26 << 2), x +   99.998 * s);
			_setf(o + (27 << 2), y +  -16.666 * s);
			_setf(o + (28 << 2), x +   66.665 * s);
			_setf(o + (29 << 2), y +  -16.666 * s);
			_setf(o + (30 << 2), x +   66.665 * s);
			_setf(o + (31 << 2), y +  -25.000 * s);
			_setf(o + (32 << 2), x +   99.998 * s);
			_setf(o + (33 << 2), y +  -25.000 * s);
			_setf(o + (34 << 2), x +   99.998 * s);
			_setf(o + (35 << 2), y +  -16.666 * s);
			_setf(o + (36 << 2), x +   49.999 * s);
			_setf(o + (37 << 2), y +  -41.666 * s);
			_setf(o + (38 << 2), x +   16.666 * s);
			_setf(o + (39 << 2), y +  -41.666 * s);
			_setf(o + (40 << 2), x +   16.666 * s);
			_setf(o + (41 << 2), y +  -49.999 * s);
			_setf(o + (42 << 2), x +   49.999 * s);
			_setf(o + (43 << 2), y +  -49.999 * s);
			_setf(o + (44 << 2), x +   49.999 * s);
			_setf(o + (45 << 2), y +  -41.666 * s);
			_setf(o + (46 << 2), x +  133.331 * s);
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
			_setb(o + 13, 1);
			_setb(o + 14, 2);
			_setb(o + 15, 2);
			_setb(o + 16, 2);
			_setb(o + 17, 2);
			_setb(o + 18, 1);
			_setb(o + 19, 2);
			_setb(o + 20, 2);
			_setb(o + 21, 2);
			_setb(o + 22, 2);
			_setb(o + 23, 1);
			
			case 37:
			
			o = _posf(40);
			_setf(o + ( 0 << 2), x +   99.998 * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +   99.998 * s);
			_setf(o + ( 3 << 2), y +  -41.666 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +  -41.666 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   16.666 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   16.666 * s);
			_setf(o + (11 << 2), y +  -25.000 * s);
			_setf(o + (12 << 2), x +  116.665 * s);
			_setf(o + (13 << 2), y +  -25.000 * s);
			_setf(o + (14 << 2), x +  116.665 * s);
			_setf(o + (15 << 2), y +  -66.666 * s);
			_setf(o + (16 << 2), x +   99.998 * s);
			_setf(o + (17 << 2), y +  -66.666 * s);
			_setf(o + (18 << 2), x +   49.999 * s);
			_setf(o + (19 << 2), y +  -16.666 * s);
			_setf(o + (20 << 2), x +   49.999 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +  116.665 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +  116.665 * s);
			_setf(o + (25 << 2), y +  -16.666 * s);
			_setf(o + (26 << 2), x +   49.999 * s);
			_setf(o + (27 << 2), y +  -16.666 * s);
			_setf(o + (28 << 2), x +   66.665 * s);
			_setf(o + (29 << 2), y +  -49.999 * s);
			_setf(o + (30 << 2), x +   66.665 * s);
			_setf(o + (31 << 2), y +  -66.666 * s);
			_setf(o + (32 << 2), x +       0. * s);
			_setf(o + (33 << 2), y +  -66.666 * s);
			_setf(o + (34 << 2), x +       0. * s);
			_setf(o + (35 << 2), y +  -49.999 * s);
			_setf(o + (36 << 2), x +   66.665 * s);
			_setf(o + (37 << 2), y +  -49.999 * s);
			_setf(o + (38 << 2), x +  133.331 * s);
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
			_setb(o +  9, 1);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 1);
			_setb(o + 15, 2);
			_setb(o + 16, 2);
			_setb(o + 17, 2);
			_setb(o + 18, 2);
			_setb(o + 19, 1);
			
			case 38:
			
			o = _posf(34);
			_setf(o + ( 0 << 2), x +   16.666 * s);
			_setf(o + ( 1 << 2), y +  -41.666 * s);
			_setf(o + ( 2 << 2), x +   16.666 * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			_setf(o + ( 4 << 2), x +   99.998 * s);
			_setf(o + ( 5 << 2), y +  -49.999 * s);
			_setf(o + ( 6 << 2), x +   99.998 * s);
			_setf(o + ( 7 << 2), y +  -66.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -66.666 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   99.998 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   99.998 * s);
			_setf(o + (15 << 2), y +  -25.000 * s);
			_setf(o + (16 << 2), x +  116.665 * s);
			_setf(o + (17 << 2), y +  -25.000 * s);
			_setf(o + (18 << 2), x +  116.665 * s);
			_setf(o + (19 << 2), y +  -41.666 * s);
			_setf(o + (20 << 2), x +   16.666 * s);
			_setf(o + (21 << 2), y +  -41.666 * s);
			_setf(o + (22 << 2), x +   83.332 * s);
			_setf(o + (23 << 2), y +  -16.666 * s);
			_setf(o + (24 << 2), x +   16.666 * s);
			_setf(o + (25 << 2), y +  -16.666 * s);
			_setf(o + (26 << 2), x +   16.666 * s);
			_setf(o + (27 << 2), y +  -25.000 * s);
			_setf(o + (28 << 2), x +   83.332 * s);
			_setf(o + (29 << 2), y +  -25.000 * s);
			_setf(o + (30 << 2), x +   83.332 * s);
			_setf(o + (31 << 2), y +  -16.666 * s);
			_setf(o + (32 << 2), x +  133.331 * s);
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
			
			case 39:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -33.333 * s);
			_setf(o + ( 4 << 2), x +   16.667 * s);
			_setf(o + ( 5 << 2), y +  -33.333 * s);
			_setf(o + ( 6 << 2), x +   16.667 * s);
			_setf(o + ( 7 << 2), y +  -66.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -66.666 * s);
			_setf(o + (10 << 2), x +   33.333 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 40:
			
			o = _posf(32);
			_setf(o + ( 0 << 2), x +   16.667 * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +   16.667 * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			_setf(o + ( 4 << 2), x +   33.333 * s);
			_setf(o + ( 5 << 2), y +  -49.999 * s);
			_setf(o + ( 6 << 2), x +   33.333 * s);
			_setf(o + ( 7 << 2), y +  -66.666 * s);
			_setf(o + ( 8 << 2), x +   16.667 * s);
			_setf(o + ( 9 << 2), y +  -66.666 * s);
			_setf(o + (10 << 2), x +   16.667 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   33.333 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   33.333 * s);
			_setf(o + (15 << 2), y +  -16.666 * s);
			_setf(o + (16 << 2), x +   16.667 * s);
			_setf(o + (17 << 2), y +  -16.666 * s);
			_setf(o + (18 << 2), x +   16.667 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +       0. * s);
			_setf(o + (21 << 2), y +  -49.999 * s);
			_setf(o + (22 << 2), x +       0. * s);
			_setf(o + (23 << 2), y +  -16.666 * s);
			_setf(o + (24 << 2), x +   16.667 * s);
			_setf(o + (25 << 2), y +  -16.666 * s);
			_setf(o + (26 << 2), x +   16.667 * s);
			_setf(o + (27 << 2), y +  -49.999 * s);
			_setf(o + (28 << 2), x +       0. * s);
			_setf(o + (29 << 2), y +  -49.999 * s);
			_setf(o + (30 << 2), x +   49.999 * s);
			_setf(o + (31 << 2), y +       0. * s);
			o = _posb(16);
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
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 1);
			
			case 41:
			
			o = _posf(32);
			_setf(o + ( 0 << 2), x +   16.667 * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -66.666 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +  -49.999 * s);
			_setf(o + ( 6 << 2), x +   16.667 * s);
			_setf(o + ( 7 << 2), y +  -49.999 * s);
			_setf(o + ( 8 << 2), x +   16.667 * s);
			_setf(o + ( 9 << 2), y +  -66.666 * s);
			_setf(o + (10 << 2), x +   16.667 * s);
			_setf(o + (11 << 2), y +  -49.999 * s);
			_setf(o + (12 << 2), x +   16.667 * s);
			_setf(o + (13 << 2), y +  -16.666 * s);
			_setf(o + (14 << 2), x +   33.333 * s);
			_setf(o + (15 << 2), y +  -16.666 * s);
			_setf(o + (16 << 2), x +   33.333 * s);
			_setf(o + (17 << 2), y +  -49.999 * s);
			_setf(o + (18 << 2), x +   16.667 * s);
			_setf(o + (19 << 2), y +  -49.999 * s);
			_setf(o + (20 << 2), x +       0. * s);
			_setf(o + (21 << 2), y +  -16.666 * s);
			_setf(o + (22 << 2), x +       0. * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   16.667 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +   16.667 * s);
			_setf(o + (27 << 2), y +  -16.666 * s);
			_setf(o + (28 << 2), x +       0. * s);
			_setf(o + (29 << 2), y +  -16.666 * s);
			_setf(o + (30 << 2), x +   50.000 * s);
			_setf(o + (31 << 2), y +       0. * s);
			o = _posb(16);
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
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 1);
			
			case 42:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   33.332 * s);
			_setf(o + ( 1 << 2), y +  -49.999 * s);
			_setf(o + ( 2 << 2), x +   33.332 * s);
			_setf(o + ( 3 << 2), y +  -66.666 * s);
			_setf(o + ( 4 << 2), x +   16.666 * s);
			_setf(o + ( 5 << 2), y +  -66.666 * s);
			_setf(o + ( 6 << 2), x +   16.666 * s);
			_setf(o + ( 7 << 2), y +  -49.999 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -49.999 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +  -33.333 * s);
			_setf(o + (12 << 2), x +   16.666 * s);
			_setf(o + (13 << 2), y +  -33.333 * s);
			_setf(o + (14 << 2), x +   16.666 * s);
			_setf(o + (15 << 2), y +  -16.666 * s);
			_setf(o + (16 << 2), x +   33.332 * s);
			_setf(o + (17 << 2), y +  -16.666 * s);
			_setf(o + (18 << 2), x +   33.332 * s);
			_setf(o + (19 << 2), y +  -33.333 * s);
			_setf(o + (20 << 2), x +   49.999 * s);
			_setf(o + (21 << 2), y +  -33.333 * s);
			_setf(o + (22 << 2), x +   49.999 * s);
			_setf(o + (23 << 2), y +  -49.999 * s);
			_setf(o + (24 << 2), x +   33.332 * s);
			_setf(o + (25 << 2), y +  -49.999 * s);
			_setf(o + (26 << 2), x +   66.665 * s);
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
			
			case 43:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   49.999 * s);
			_setf(o + ( 1 << 2), y +  -25.000 * s);
			_setf(o + ( 2 << 2), x +   83.332 * s);
			_setf(o + ( 3 << 2), y +  -25.000 * s);
			_setf(o + ( 4 << 2), x +   83.332 * s);
			_setf(o + ( 5 << 2), y +  -41.666 * s);
			_setf(o + ( 6 << 2), x +   49.999 * s);
			_setf(o + ( 7 << 2), y +  -41.666 * s);
			_setf(o + ( 8 << 2), x +   49.999 * s);
			_setf(o + ( 9 << 2), y +  -66.666 * s);
			_setf(o + (10 << 2), x +   33.333 * s);
			_setf(o + (11 << 2), y +  -66.666 * s);
			_setf(o + (12 << 2), x +   33.333 * s);
			_setf(o + (13 << 2), y +  -41.666 * s);
			_setf(o + (14 << 2), x +       0. * s);
			_setf(o + (15 << 2), y +  -41.666 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -25.000 * s);
			_setf(o + (18 << 2), x +   33.333 * s);
			_setf(o + (19 << 2), y +  -25.000 * s);
			_setf(o + (20 << 2), x +   33.333 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   49.999 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   49.999 * s);
			_setf(o + (25 << 2), y +  -25.000 * s);
			_setf(o + (26 << 2), x +   99.999 * s);
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
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -16.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +    8.333 * s);
			_setf(o + ( 4 << 2), x +   16.666 * s);
			_setf(o + ( 5 << 2), y +    8.333 * s);
			_setf(o + ( 6 << 2), x +   16.666 * s);
			_setf(o + ( 7 << 2), y +  -16.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -16.666 * s);
			_setf(o + (10 << 2), x +   33.333 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 45:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +   83.332 * s);
			_setf(o + ( 1 << 2), y +  -25.000 * s);
			_setf(o + ( 2 << 2), x +   83.332 * s);
			_setf(o + ( 3 << 2), y +  -41.666 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +  -41.666 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +  -25.000 * s);
			_setf(o + ( 8 << 2), x +   83.332 * s);
			_setf(o + ( 9 << 2), y +  -25.000 * s);
			_setf(o + (10 << 2), x +   99.998 * s);
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
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -16.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   16.667 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   16.667 * s);
			_setf(o + ( 7 << 2), y +  -16.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -16.666 * s);
			_setf(o + (10 << 2), x +   33.333 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 47:
			
			o = _posf(42);
			_setf(o + ( 0 << 2), x +   50.000 * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +   50.000 * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			_setf(o + ( 4 << 2), x +   66.666 * s);
			_setf(o + ( 5 << 2), y +  -49.999 * s);
			_setf(o + ( 6 << 2), x +   66.666 * s);
			_setf(o + ( 7 << 2), y +  -66.666 * s);
			_setf(o + ( 8 << 2), x +   50.000 * s);
			_setf(o + ( 9 << 2), y +  -66.666 * s);
			_setf(o + (10 << 2), x +   33.333 * s);
			_setf(o + (11 << 2), y +  -49.999 * s);
			_setf(o + (12 << 2), x +   33.333 * s);
			_setf(o + (13 << 2), y +  -33.333 * s);
			_setf(o + (14 << 2), x +   50.000 * s);
			_setf(o + (15 << 2), y +  -33.333 * s);
			_setf(o + (16 << 2), x +   50.000 * s);
			_setf(o + (17 << 2), y +  -49.999 * s);
			_setf(o + (18 << 2), x +   33.333 * s);
			_setf(o + (19 << 2), y +  -49.999 * s);
			_setf(o + (20 << 2), x +   16.667 * s);
			_setf(o + (21 << 2), y +  -33.333 * s);
			_setf(o + (22 << 2), x +   16.667 * s);
			_setf(o + (23 << 2), y +  -16.666 * s);
			_setf(o + (24 << 2), x +   33.333 * s);
			_setf(o + (25 << 2), y +  -16.666 * s);
			_setf(o + (26 << 2), x +   33.333 * s);
			_setf(o + (27 << 2), y +  -33.333 * s);
			_setf(o + (28 << 2), x +   16.667 * s);
			_setf(o + (29 << 2), y +  -33.333 * s);
			_setf(o + (30 << 2), x +       0. * s);
			_setf(o + (31 << 2), y +  -16.666 * s);
			_setf(o + (32 << 2), x +       0. * s);
			_setf(o + (33 << 2), y +       0. * s);
			_setf(o + (34 << 2), x +   16.667 * s);
			_setf(o + (35 << 2), y +       0. * s);
			_setf(o + (36 << 2), x +   16.667 * s);
			_setf(o + (37 << 2), y +  -16.666 * s);
			_setf(o + (38 << 2), x +       0. * s);
			_setf(o + (39 << 2), y +  -16.666 * s);
			_setf(o + (40 << 2), x +   83.332 * s);
			_setf(o + (41 << 2), y +       0. * s);
			o = _posb(21);
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
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 1);
			_setb(o + 16, 2);
			_setb(o + 17, 2);
			_setb(o + 18, 2);
			_setb(o + 19, 2);
			_setb(o + 20, 1);
			
			case 48:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +  116.665 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +  116.665 * s);
			_setf(o + ( 7 << 2), y +  -66.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -66.666 * s);
			_setf(o + (10 << 2), x +   99.999 * s);
			_setf(o + (11 << 2), y +  -16.666 * s);
			_setf(o + (12 << 2), x +   16.667 * s);
			_setf(o + (13 << 2), y +  -16.666 * s);
			_setf(o + (14 << 2), x +   16.667 * s);
			_setf(o + (15 << 2), y +  -49.999 * s);
			_setf(o + (16 << 2), x +   99.999 * s);
			_setf(o + (17 << 2), y +  -49.999 * s);
			_setf(o + (18 << 2), x +   99.999 * s);
			_setf(o + (19 << 2), y +  -16.666 * s);
			_setf(o + (20 << 2), x +  133.332 * s);
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
			
			case 49:
			
			o = _posf(16);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			_setf(o + ( 4 << 2), x +   16.666 * s);
			_setf(o + ( 5 << 2), y +  -49.999 * s);
			_setf(o + ( 6 << 2), x +   16.666 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   33.332 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   33.332 * s);
			_setf(o + (11 << 2), y +  -66.666 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +  -66.666 * s);
			_setf(o + (14 << 2), x +   49.999 * s);
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
			
			case 50:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			_setf(o + ( 4 << 2), x +   99.998 * s);
			_setf(o + ( 5 << 2), y +  -49.999 * s);
			_setf(o + ( 6 << 2), x +   99.998 * s);
			_setf(o + ( 7 << 2), y +  -41.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -41.666 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +  116.665 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +  116.665 * s);
			_setf(o + (15 << 2), y +  -16.666 * s);
			_setf(o + (16 << 2), x +   16.666 * s);
			_setf(o + (17 << 2), y +  -16.666 * s);
			_setf(o + (18 << 2), x +   16.666 * s);
			_setf(o + (19 << 2), y +  -25.000 * s);
			_setf(o + (20 << 2), x +  116.665 * s);
			_setf(o + (21 << 2), y +  -25.000 * s);
			_setf(o + (22 << 2), x +  116.665 * s);
			_setf(o + (23 << 2), y +  -66.666 * s);
			_setf(o + (24 << 2), x +       0. * s);
			_setf(o + (25 << 2), y +  -66.666 * s);
			_setf(o + (26 << 2), x +  133.331 * s);
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
			
			case 51:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			_setf(o + ( 4 << 2), x +   99.999 * s);
			_setf(o + ( 5 << 2), y +  -49.999 * s);
			_setf(o + ( 6 << 2), x +   99.999 * s);
			_setf(o + ( 7 << 2), y +  -41.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -41.666 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +  -25.000 * s);
			_setf(o + (12 << 2), x +   99.999 * s);
			_setf(o + (13 << 2), y +  -25.000 * s);
			_setf(o + (14 << 2), x +   99.999 * s);
			_setf(o + (15 << 2), y +  -16.666 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -16.666 * s);
			_setf(o + (18 << 2), x +       0. * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +  116.665 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +  116.665 * s);
			_setf(o + (23 << 2), y +  -66.666 * s);
			_setf(o + (24 << 2), x +       0. * s);
			_setf(o + (25 << 2), y +  -66.666 * s);
			_setf(o + (26 << 2), x +  133.332 * s);
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
			
			case 52:
			
			o = _posf(24);
			_setf(o + ( 0 << 2), x +   99.998 * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +   99.998 * s);
			_setf(o + ( 3 << 2), y +  -33.333 * s);
			_setf(o + ( 4 << 2), x +   16.666 * s);
			_setf(o + ( 5 << 2), y +  -33.333 * s);
			_setf(o + ( 6 << 2), x +   16.666 * s);
			_setf(o + ( 7 << 2), y +  -66.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -66.666 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +  -16.666 * s);
			_setf(o + (12 << 2), x +   99.998 * s);
			_setf(o + (13 << 2), y +  -16.666 * s);
			_setf(o + (14 << 2), x +   99.998 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +  116.664 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +  116.664 * s);
			_setf(o + (19 << 2), y +  -66.666 * s);
			_setf(o + (20 << 2), x +   99.998 * s);
			_setf(o + (21 << 2), y +  -66.666 * s);
			_setf(o + (22 << 2), x +  133.331 * s);
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
			
			case 53:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -25.000 * s);
			_setf(o + ( 4 << 2), x +   99.998 * s);
			_setf(o + ( 5 << 2), y +  -25.000 * s);
			_setf(o + ( 6 << 2), x +   99.998 * s);
			_setf(o + ( 7 << 2), y +  -16.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -16.666 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +  116.665 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +  116.665 * s);
			_setf(o + (15 << 2), y +  -41.666 * s);
			_setf(o + (16 << 2), x +   16.666 * s);
			_setf(o + (17 << 2), y +  -41.666 * s);
			_setf(o + (18 << 2), x +   16.666 * s);
			_setf(o + (19 << 2), y +  -49.999 * s);
			_setf(o + (20 << 2), x +  116.665 * s);
			_setf(o + (21 << 2), y +  -49.999 * s);
			_setf(o + (22 << 2), x +  116.665 * s);
			_setf(o + (23 << 2), y +  -66.666 * s);
			_setf(o + (24 << 2), x +       0. * s);
			_setf(o + (25 << 2), y +  -66.666 * s);
			_setf(o + (26 << 2), x +  133.331 * s);
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
			
			case 54:
			
			o = _posf(30);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +  116.665 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +  116.665 * s);
			_setf(o + ( 7 << 2), y +  -41.666 * s);
			_setf(o + ( 8 << 2), x +   16.667 * s);
			_setf(o + ( 9 << 2), y +  -41.666 * s);
			_setf(o + (10 << 2), x +   16.667 * s);
			_setf(o + (11 << 2), y +  -49.999 * s);
			_setf(o + (12 << 2), x +  116.665 * s);
			_setf(o + (13 << 2), y +  -49.999 * s);
			_setf(o + (14 << 2), x +  116.665 * s);
			_setf(o + (15 << 2), y +  -66.666 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -66.666 * s);
			_setf(o + (18 << 2), x +   99.999 * s);
			_setf(o + (19 << 2), y +  -16.666 * s);
			_setf(o + (20 << 2), x +   16.667 * s);
			_setf(o + (21 << 2), y +  -16.666 * s);
			_setf(o + (22 << 2), x +   16.667 * s);
			_setf(o + (23 << 2), y +  -25.000 * s);
			_setf(o + (24 << 2), x +   99.999 * s);
			_setf(o + (25 << 2), y +  -25.000 * s);
			_setf(o + (26 << 2), x +   99.999 * s);
			_setf(o + (27 << 2), y +  -16.666 * s);
			_setf(o + (28 << 2), x +  133.332 * s);
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
			_setb(o +  9, 1);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 1);
			
			case 55:
			
			o = _posf(16);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			_setf(o + ( 4 << 2), x +   99.998 * s);
			_setf(o + ( 5 << 2), y +  -49.999 * s);
			_setf(o + ( 6 << 2), x +   99.998 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +  116.664 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +  116.664 * s);
			_setf(o + (11 << 2), y +  -66.666 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +  -66.666 * s);
			_setf(o + (14 << 2), x +  133.331 * s);
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
			
			case 56:
			
			o = _posf(32);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +  116.665 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +  116.665 * s);
			_setf(o + ( 7 << 2), y +  -66.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -66.666 * s);
			_setf(o + (10 << 2), x +   99.998 * s);
			_setf(o + (11 << 2), y +  -41.666 * s);
			_setf(o + (12 << 2), x +   16.666 * s);
			_setf(o + (13 << 2), y +  -41.666 * s);
			_setf(o + (14 << 2), x +   16.666 * s);
			_setf(o + (15 << 2), y +  -49.999 * s);
			_setf(o + (16 << 2), x +   99.998 * s);
			_setf(o + (17 << 2), y +  -49.999 * s);
			_setf(o + (18 << 2), x +   99.998 * s);
			_setf(o + (19 << 2), y +  -41.666 * s);
			_setf(o + (20 << 2), x +   99.998 * s);
			_setf(o + (21 << 2), y +  -16.666 * s);
			_setf(o + (22 << 2), x +   16.666 * s);
			_setf(o + (23 << 2), y +  -16.666 * s);
			_setf(o + (24 << 2), x +   16.666 * s);
			_setf(o + (25 << 2), y +  -25.000 * s);
			_setf(o + (26 << 2), x +   99.998 * s);
			_setf(o + (27 << 2), y +  -25.000 * s);
			_setf(o + (28 << 2), x +   99.998 * s);
			_setf(o + (29 << 2), y +  -16.666 * s);
			_setf(o + (30 << 2), x +  133.331 * s);
			_setf(o + (31 << 2), y +       0. * s);
			o = _posb(16);
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
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 1);
			
			case 57:
			
			o = _posf(30);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -25.000 * s);
			_setf(o + ( 4 << 2), x +   99.999 * s);
			_setf(o + ( 5 << 2), y +  -25.000 * s);
			_setf(o + ( 6 << 2), x +   99.999 * s);
			_setf(o + ( 7 << 2), y +  -16.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -16.666 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +  116.665 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +  116.665 * s);
			_setf(o + (15 << 2), y +  -66.666 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -66.666 * s);
			_setf(o + (18 << 2), x +   99.999 * s);
			_setf(o + (19 << 2), y +  -41.666 * s);
			_setf(o + (20 << 2), x +   16.667 * s);
			_setf(o + (21 << 2), y +  -41.666 * s);
			_setf(o + (22 << 2), x +   16.667 * s);
			_setf(o + (23 << 2), y +  -49.999 * s);
			_setf(o + (24 << 2), x +   99.999 * s);
			_setf(o + (25 << 2), y +  -49.999 * s);
			_setf(o + (26 << 2), x +   99.999 * s);
			_setf(o + (27 << 2), y +  -41.666 * s);
			_setf(o + (28 << 2), x +  133.332 * s);
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
			_setb(o +  9, 1);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 1);
			
			case 58:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -58.332 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -41.666 * s);
			_setf(o + ( 4 << 2), x +   16.666 * s);
			_setf(o + ( 5 << 2), y +  -41.666 * s);
			_setf(o + ( 6 << 2), x +   16.666 * s);
			_setf(o + ( 7 << 2), y +  -58.332 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -58.332 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +  -25.000 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +   -8.333 * s);
			_setf(o + (14 << 2), x +   16.666 * s);
			_setf(o + (15 << 2), y +   -8.333 * s);
			_setf(o + (16 << 2), x +   16.666 * s);
			_setf(o + (17 << 2), y +  -25.000 * s);
			_setf(o + (18 << 2), x +       0. * s);
			_setf(o + (19 << 2), y +  -25.000 * s);
			_setf(o + (20 << 2), x +   33.332 * s);
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
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -58.332 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -41.666 * s);
			_setf(o + ( 4 << 2), x +   16.667 * s);
			_setf(o + ( 5 << 2), y +  -41.666 * s);
			_setf(o + ( 6 << 2), x +   16.667 * s);
			_setf(o + ( 7 << 2), y +  -58.332 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -58.332 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +  -25.000 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   16.667 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   16.667 * s);
			_setf(o + (17 << 2), y +  -25.000 * s);
			_setf(o + (18 << 2), x +       0. * s);
			_setf(o + (19 << 2), y +  -25.000 * s);
			_setf(o + (20 << 2), x +   33.333 * s);
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
			
			case 60:
			
			o = _posf(32);
			_setf(o + ( 0 << 2), x +   16.667 * s);
			_setf(o + ( 1 << 2), y +  -58.332 * s);
			_setf(o + ( 2 << 2), x +   16.667 * s);
			_setf(o + ( 3 << 2), y +  -41.666 * s);
			_setf(o + ( 4 << 2), x +   33.333 * s);
			_setf(o + ( 5 << 2), y +  -41.666 * s);
			_setf(o + ( 6 << 2), x +   33.333 * s);
			_setf(o + ( 7 << 2), y +  -58.332 * s);
			_setf(o + ( 8 << 2), x +   16.667 * s);
			_setf(o + ( 9 << 2), y +  -58.332 * s);
			_setf(o + (10 << 2), x +   16.667 * s);
			_setf(o + (11 << 2), y +   -8.333 * s);
			_setf(o + (12 << 2), x +   33.333 * s);
			_setf(o + (13 << 2), y +   -8.333 * s);
			_setf(o + (14 << 2), x +   33.333 * s);
			_setf(o + (15 << 2), y +  -25.000 * s);
			_setf(o + (16 << 2), x +   16.667 * s);
			_setf(o + (17 << 2), y +  -25.000 * s);
			_setf(o + (18 << 2), x +   16.667 * s);
			_setf(o + (19 << 2), y +   -8.333 * s);
			_setf(o + (20 << 2), x +       0. * s);
			_setf(o + (21 << 2), y +  -41.666 * s);
			_setf(o + (22 << 2), x +       0. * s);
			_setf(o + (23 << 2), y +  -25.000 * s);
			_setf(o + (24 << 2), x +   16.667 * s);
			_setf(o + (25 << 2), y +  -25.000 * s);
			_setf(o + (26 << 2), x +   16.667 * s);
			_setf(o + (27 << 2), y +  -41.666 * s);
			_setf(o + (28 << 2), x +       0. * s);
			_setf(o + (29 << 2), y +  -41.666 * s);
			_setf(o + (30 << 2), x +   49.999 * s);
			_setf(o + (31 << 2), y +       0. * s);
			o = _posb(16);
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
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 1);
			
			case 61:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -58.332 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -41.666 * s);
			_setf(o + ( 4 << 2), x +   83.333 * s);
			_setf(o + ( 5 << 2), y +  -41.666 * s);
			_setf(o + ( 6 << 2), x +   83.333 * s);
			_setf(o + ( 7 << 2), y +  -58.332 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -58.332 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +  -25.000 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +   -8.333 * s);
			_setf(o + (14 << 2), x +   83.333 * s);
			_setf(o + (15 << 2), y +   -8.333 * s);
			_setf(o + (16 << 2), x +   83.333 * s);
			_setf(o + (17 << 2), y +  -25.000 * s);
			_setf(o + (18 << 2), x +       0. * s);
			_setf(o + (19 << 2), y +  -25.000 * s);
			_setf(o + (20 << 2), x +   99.999 * s);
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
			
			o = _posf(32);
			_setf(o + ( 0 << 2), x +   16.666 * s);
			_setf(o + ( 1 << 2), y +  -58.332 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -58.332 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +  -41.666 * s);
			_setf(o + ( 6 << 2), x +   16.666 * s);
			_setf(o + ( 7 << 2), y +  -41.666 * s);
			_setf(o + ( 8 << 2), x +   16.666 * s);
			_setf(o + ( 9 << 2), y +  -58.332 * s);
			_setf(o + (10 << 2), x +   16.666 * s);
			_setf(o + (11 << 2), y +  -41.666 * s);
			_setf(o + (12 << 2), x +   16.666 * s);
			_setf(o + (13 << 2), y +  -25.000 * s);
			_setf(o + (14 << 2), x +   33.333 * s);
			_setf(o + (15 << 2), y +  -25.000 * s);
			_setf(o + (16 << 2), x +   33.333 * s);
			_setf(o + (17 << 2), y +  -41.666 * s);
			_setf(o + (18 << 2), x +   16.666 * s);
			_setf(o + (19 << 2), y +  -41.666 * s);
			_setf(o + (20 << 2), x +       0. * s);
			_setf(o + (21 << 2), y +  -25.000 * s);
			_setf(o + (22 << 2), x +       0. * s);
			_setf(o + (23 << 2), y +   -8.333 * s);
			_setf(o + (24 << 2), x +   16.666 * s);
			_setf(o + (25 << 2), y +   -8.333 * s);
			_setf(o + (26 << 2), x +   16.666 * s);
			_setf(o + (27 << 2), y +  -25.000 * s);
			_setf(o + (28 << 2), x +       0. * s);
			_setf(o + (29 << 2), y +  -25.000 * s);
			_setf(o + (30 << 2), x +   49.999 * s);
			_setf(o + (31 << 2), y +       0. * s);
			o = _posb(16);
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
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 1);
			
			case 63:
			
			o = _posf(30);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			_setf(o + ( 4 << 2), x +   99.999 * s);
			_setf(o + ( 5 << 2), y +  -49.999 * s);
			_setf(o + ( 6 << 2), x +   99.999 * s);
			_setf(o + ( 7 << 2), y +  -41.666 * s);
			_setf(o + ( 8 << 2), x +   33.333 * s);
			_setf(o + ( 9 << 2), y +  -41.666 * s);
			_setf(o + (10 << 2), x +   33.333 * s);
			_setf(o + (11 << 2), y +  -25.000 * s);
			_setf(o + (12 << 2), x +  116.665 * s);
			_setf(o + (13 << 2), y +  -25.000 * s);
			_setf(o + (14 << 2), x +  116.665 * s);
			_setf(o + (15 << 2), y +  -66.666 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -66.666 * s);
			_setf(o + (18 << 2), x +   33.333 * s);
			_setf(o + (19 << 2), y +  -16.666 * s);
			_setf(o + (20 << 2), x +   33.333 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   66.666 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +   66.666 * s);
			_setf(o + (25 << 2), y +  -16.666 * s);
			_setf(o + (26 << 2), x +   33.333 * s);
			_setf(o + (27 << 2), y +  -16.666 * s);
			_setf(o + (28 << 2), x +  133.332 * s);
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
			_setb(o +  9, 1);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 1);
			
			case 64:
			
			o = _posf(36);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +  116.664 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +  116.664 * s);
			_setf(o + ( 7 << 2), y +  -66.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -66.666 * s);
			_setf(o + (10 << 2), x +   99.998 * s);
			_setf(o + (11 << 2), y +  -41.666 * s);
			_setf(o + (12 << 2), x +   33.332 * s);
			_setf(o + (13 << 2), y +  -41.666 * s);
			_setf(o + (14 << 2), x +   33.332 * s);
			_setf(o + (15 << 2), y +  -16.666 * s);
			_setf(o + (16 << 2), x +   16.666 * s);
			_setf(o + (17 << 2), y +  -16.666 * s);
			_setf(o + (18 << 2), x +   16.666 * s);
			_setf(o + (19 << 2), y +  -49.999 * s);
			_setf(o + (20 << 2), x +   99.998 * s);
			_setf(o + (21 << 2), y +  -49.999 * s);
			_setf(o + (22 << 2), x +   99.998 * s);
			_setf(o + (23 << 2), y +  -41.666 * s);
			_setf(o + (24 << 2), x +   99.998 * s);
			_setf(o + (25 << 2), y +  -16.666 * s);
			_setf(o + (26 << 2), x +   49.999 * s);
			_setf(o + (27 << 2), y +  -16.666 * s);
			_setf(o + (28 << 2), x +   49.999 * s);
			_setf(o + (29 << 2), y +  -25.000 * s);
			_setf(o + (30 << 2), x +   99.998 * s);
			_setf(o + (31 << 2), y +  -25.000 * s);
			_setf(o + (32 << 2), x +   99.998 * s);
			_setf(o + (33 << 2), y +  -16.666 * s);
			_setf(o + (34 << 2), x +  133.331 * s);
			_setf(o + (35 << 2), y +       0. * s);
			o = _posb(18);
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
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 2);
			_setb(o + 16, 2);
			_setb(o + 17, 1);
			
			case 65:
			
			o = _posf(30);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   16.666 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   16.666 * s);
			_setf(o + ( 7 << 2), y +  -25.000 * s);
			_setf(o + ( 8 << 2), x +   99.998 * s);
			_setf(o + ( 9 << 2), y +  -25.000 * s);
			_setf(o + (10 << 2), x +   99.998 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +  116.665 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +  116.665 * s);
			_setf(o + (15 << 2), y +  -66.666 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -66.666 * s);
			_setf(o + (18 << 2), x +   99.998 * s);
			_setf(o + (19 << 2), y +  -41.666 * s);
			_setf(o + (20 << 2), x +   16.666 * s);
			_setf(o + (21 << 2), y +  -41.666 * s);
			_setf(o + (22 << 2), x +   16.666 * s);
			_setf(o + (23 << 2), y +  -49.999 * s);
			_setf(o + (24 << 2), x +   99.998 * s);
			_setf(o + (25 << 2), y +  -49.999 * s);
			_setf(o + (26 << 2), x +   99.998 * s);
			_setf(o + (27 << 2), y +  -41.666 * s);
			_setf(o + (28 << 2), x +  133.331 * s);
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
			_setb(o +  9, 1);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 1);
			
			case 66:
			
			o = _posf(36);
			_setf(o + ( 0 << 2), x +   99.998 * s);
			_setf(o + ( 1 << 2), y +  -41.666 * s);
			_setf(o + ( 2 << 2), x +  116.665 * s);
			_setf(o + ( 3 << 2), y +  -41.666 * s);
			_setf(o + ( 4 << 2), x +  116.665 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -66.666 * s);
			_setf(o + (10 << 2), x +   99.998 * s);
			_setf(o + (11 << 2), y +  -66.666 * s);
			_setf(o + (12 << 2), x +   99.998 * s);
			_setf(o + (13 << 2), y +  -41.666 * s);
			_setf(o + (14 << 2), x +   99.998 * s);
			_setf(o + (15 << 2), y +  -16.666 * s);
			_setf(o + (16 << 2), x +   99.998 * s);
			_setf(o + (17 << 2), y +  -25.000 * s);
			_setf(o + (18 << 2), x +   16.666 * s);
			_setf(o + (19 << 2), y +  -25.000 * s);
			_setf(o + (20 << 2), x +   16.666 * s);
			_setf(o + (21 << 2), y +  -16.666 * s);
			_setf(o + (22 << 2), x +   99.998 * s);
			_setf(o + (23 << 2), y +  -16.666 * s);
			_setf(o + (24 << 2), x +   16.666 * s);
			_setf(o + (25 << 2), y +  -49.999 * s);
			_setf(o + (26 << 2), x +   16.666 * s);
			_setf(o + (27 << 2), y +  -41.666 * s);
			_setf(o + (28 << 2), x +   83.332 * s);
			_setf(o + (29 << 2), y +  -41.666 * s);
			_setf(o + (30 << 2), x +   83.332 * s);
			_setf(o + (31 << 2), y +  -49.999 * s);
			_setf(o + (32 << 2), x +   16.666 * s);
			_setf(o + (33 << 2), y +  -49.999 * s);
			_setf(o + (34 << 2), x +  133.331 * s);
			_setf(o + (35 << 2), y +       0. * s);
			o = _posb(18);
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
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 2);
			_setb(o + 16, 2);
			_setb(o + 17, 1);
			
			case 67:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +  116.665 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +  116.665 * s);
			_setf(o + ( 3 << 2), y +  -16.666 * s);
			_setf(o + ( 4 << 2), x +   16.667 * s);
			_setf(o + ( 5 << 2), y +  -16.666 * s);
			_setf(o + ( 6 << 2), x +   16.667 * s);
			_setf(o + ( 7 << 2), y +  -49.999 * s);
			_setf(o + ( 8 << 2), x +  116.665 * s);
			_setf(o + ( 9 << 2), y +  -49.999 * s);
			_setf(o + (10 << 2), x +  116.665 * s);
			_setf(o + (11 << 2), y +  -66.666 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +  -66.666 * s);
			_setf(o + (14 << 2), x +       0. * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +  116.665 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +  133.332 * s);
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
			
			case 68:
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +   99.998 * s);
			_setf(o + ( 1 << 2), y +  -49.999 * s);
			_setf(o + ( 2 << 2), x +  116.664 * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			_setf(o + ( 4 << 2), x +  116.664 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -66.666 * s);
			_setf(o + (10 << 2), x +   99.998 * s);
			_setf(o + (11 << 2), y +  -66.666 * s);
			_setf(o + (12 << 2), x +   99.998 * s);
			_setf(o + (13 << 2), y +  -49.999 * s);
			_setf(o + (14 << 2), x +   99.998 * s);
			_setf(o + (15 << 2), y +  -49.895 * s);
			_setf(o + (16 << 2), x +   16.666 * s);
			_setf(o + (17 << 2), y +  -49.895 * s);
			_setf(o + (18 << 2), x +   16.666 * s);
			_setf(o + (19 << 2), y +  -16.666 * s);
			_setf(o + (20 << 2), x +   99.998 * s);
			_setf(o + (21 << 2), y +  -16.666 * s);
			_setf(o + (22 << 2), x +   99.998 * s);
			_setf(o + (23 << 2), y +  -49.895 * s);
			_setf(o + (24 << 2), x +  133.331 * s);
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
			
			case 69:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +  116.665 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +  116.665 * s);
			_setf(o + ( 7 << 2), y +  -16.666 * s);
			_setf(o + ( 8 << 2), x +   16.666 * s);
			_setf(o + ( 9 << 2), y +  -16.666 * s);
			_setf(o + (10 << 2), x +   16.666 * s);
			_setf(o + (11 << 2), y +  -25.000 * s);
			_setf(o + (12 << 2), x +  116.665 * s);
			_setf(o + (13 << 2), y +  -25.000 * s);
			_setf(o + (14 << 2), x +  116.665 * s);
			_setf(o + (15 << 2), y +  -41.666 * s);
			_setf(o + (16 << 2), x +   16.666 * s);
			_setf(o + (17 << 2), y +  -41.666 * s);
			_setf(o + (18 << 2), x +   16.666 * s);
			_setf(o + (19 << 2), y +  -49.999 * s);
			_setf(o + (20 << 2), x +  116.665 * s);
			_setf(o + (21 << 2), y +  -49.999 * s);
			_setf(o + (22 << 2), x +  116.665 * s);
			_setf(o + (23 << 2), y +  -66.666 * s);
			_setf(o + (24 << 2), x +       0. * s);
			_setf(o + (25 << 2), y +  -66.666 * s);
			_setf(o + (26 << 2), x +  133.331 * s);
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
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   16.667 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   16.667 * s);
			_setf(o + ( 7 << 2), y +  -25.000 * s);
			_setf(o + ( 8 << 2), x +  116.665 * s);
			_setf(o + ( 9 << 2), y +  -25.000 * s);
			_setf(o + (10 << 2), x +  116.665 * s);
			_setf(o + (11 << 2), y +  -41.666 * s);
			_setf(o + (12 << 2), x +   16.667 * s);
			_setf(o + (13 << 2), y +  -41.666 * s);
			_setf(o + (14 << 2), x +   16.667 * s);
			_setf(o + (15 << 2), y +  -49.999 * s);
			_setf(o + (16 << 2), x +  116.665 * s);
			_setf(o + (17 << 2), y +  -49.999 * s);
			_setf(o + (18 << 2), x +  116.665 * s);
			_setf(o + (19 << 2), y +  -66.666 * s);
			_setf(o + (20 << 2), x +       0. * s);
			_setf(o + (21 << 2), y +  -66.666 * s);
			_setf(o + (22 << 2), x +  133.332 * s);
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
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +  116.664 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +  116.664 * s);
			_setf(o + ( 7 << 2), y +  -41.666 * s);
			_setf(o + ( 8 << 2), x +   24.999 * s);
			_setf(o + ( 9 << 2), y +  -41.666 * s);
			_setf(o + (10 << 2), x +   24.999 * s);
			_setf(o + (11 << 2), y +  -25.000 * s);
			_setf(o + (12 << 2), x +   99.998 * s);
			_setf(o + (13 << 2), y +  -25.000 * s);
			_setf(o + (14 << 2), x +   99.998 * s);
			_setf(o + (15 << 2), y +  -16.666 * s);
			_setf(o + (16 << 2), x +   16.666 * s);
			_setf(o + (17 << 2), y +  -16.666 * s);
			_setf(o + (18 << 2), x +   16.666 * s);
			_setf(o + (19 << 2), y +  -49.999 * s);
			_setf(o + (20 << 2), x +  116.664 * s);
			_setf(o + (21 << 2), y +  -49.999 * s);
			_setf(o + (22 << 2), x +  116.664 * s);
			_setf(o + (23 << 2), y +  -66.666 * s);
			_setf(o + (24 << 2), x +       0. * s);
			_setf(o + (25 << 2), y +  -66.666 * s);
			_setf(o + (26 << 2), x +  133.331 * s);
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
			
			case 72:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   99.998 * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +   99.998 * s);
			_setf(o + ( 3 << 2), y +  -41.666 * s);
			_setf(o + ( 4 << 2), x +   16.666 * s);
			_setf(o + ( 5 << 2), y +  -41.666 * s);
			_setf(o + ( 6 << 2), x +   16.666 * s);
			_setf(o + ( 7 << 2), y +  -66.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -66.666 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   16.666 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   16.666 * s);
			_setf(o + (15 << 2), y +  -25.000 * s);
			_setf(o + (16 << 2), x +   99.998 * s);
			_setf(o + (17 << 2), y +  -25.000 * s);
			_setf(o + (18 << 2), x +   99.998 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +  116.665 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +  116.665 * s);
			_setf(o + (23 << 2), y +  -66.666 * s);
			_setf(o + (24 << 2), x +   99.998 * s);
			_setf(o + (25 << 2), y +  -66.666 * s);
			_setf(o + (26 << 2), x +  133.331 * s);
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
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   16.667 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   16.667 * s);
			_setf(o + ( 7 << 2), y +  -66.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -66.666 * s);
			_setf(o + (10 << 2), x +   33.333 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 74:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +   58.333 * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +   58.333 * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			_setf(o + ( 4 << 2), x +   99.999 * s);
			_setf(o + ( 5 << 2), y +  -49.999 * s);
			_setf(o + ( 6 << 2), x +   99.999 * s);
			_setf(o + ( 7 << 2), y +  -16.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -16.666 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +  116.665 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +  116.665 * s);
			_setf(o + (15 << 2), y +  -66.666 * s);
			_setf(o + (16 << 2), x +   58.333 * s);
			_setf(o + (17 << 2), y +  -66.666 * s);
			_setf(o + (18 << 2), x +  133.331 * s);
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
			
			case 75:
			
			o = _posf(32);
			_setf(o + ( 0 << 2), x +   99.999 * s);
			_setf(o + ( 1 << 2), y +  -41.666 * s);
			_setf(o + ( 2 << 2), x +   99.999 * s);
			_setf(o + ( 3 << 2), y +  -66.666 * s);
			_setf(o + ( 4 << 2), x +   83.332 * s);
			_setf(o + ( 5 << 2), y +  -66.666 * s);
			_setf(o + ( 6 << 2), x +   83.332 * s);
			_setf(o + ( 7 << 2), y +  -41.666 * s);
			_setf(o + ( 8 << 2), x +   16.667 * s);
			_setf(o + ( 9 << 2), y +  -41.666 * s);
			_setf(o + (10 << 2), x +   16.667 * s);
			_setf(o + (11 << 2), y +  -66.666 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +  -66.666 * s);
			_setf(o + (14 << 2), x +       0. * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   16.667 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   16.667 * s);
			_setf(o + (19 << 2), y +  -25.000 * s);
			_setf(o + (20 << 2), x +   99.999 * s);
			_setf(o + (21 << 2), y +  -25.000 * s);
			_setf(o + (22 << 2), x +   99.999 * s);
			_setf(o + (23 << 2), y +       0. * s);
			_setf(o + (24 << 2), x +  116.665 * s);
			_setf(o + (25 << 2), y +       0. * s);
			_setf(o + (26 << 2), x +  116.665 * s);
			_setf(o + (27 << 2), y +  -41.666 * s);
			_setf(o + (28 << 2), x +   99.999 * s);
			_setf(o + (29 << 2), y +  -41.666 * s);
			_setf(o + (30 << 2), x +  133.332 * s);
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
			
			case 76:
			
			o = _posf(16);
			_setf(o + ( 0 << 2), x +  116.665 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +  116.665 * s);
			_setf(o + ( 3 << 2), y +  -16.666 * s);
			_setf(o + ( 4 << 2), x +   16.666 * s);
			_setf(o + ( 5 << 2), y +  -16.666 * s);
			_setf(o + ( 6 << 2), x +   16.666 * s);
			_setf(o + ( 7 << 2), y +  -66.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -66.666 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +  116.665 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +  133.331 * s);
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
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   16.667 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   16.667 * s);
			_setf(o + ( 7 << 2), y +  -49.999 * s);
			_setf(o + ( 8 << 2), x +   50.000 * s);
			_setf(o + ( 9 << 2), y +  -49.999 * s);
			_setf(o + (10 << 2), x +   50.000 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   66.666 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   66.666 * s);
			_setf(o + (15 << 2), y +  -49.999 * s);
			_setf(o + (16 << 2), x +   99.999 * s);
			_setf(o + (17 << 2), y +  -49.999 * s);
			_setf(o + (18 << 2), x +   99.999 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +  116.665 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +  116.665 * s);
			_setf(o + (23 << 2), y +  -66.666 * s);
			_setf(o + (24 << 2), x +       0. * s);
			_setf(o + (25 << 2), y +  -66.666 * s);
			_setf(o + (26 << 2), x +  133.332 * s);
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
			
			case 78:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   16.666 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   16.666 * s);
			_setf(o + ( 7 << 2), y +  -49.999 * s);
			_setf(o + ( 8 << 2), x +   99.998 * s);
			_setf(o + ( 9 << 2), y +  -49.999 * s);
			_setf(o + (10 << 2), x +   99.998 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +  116.664 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +  116.664 * s);
			_setf(o + (15 << 2), y +  -66.666 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -66.666 * s);
			_setf(o + (18 << 2), x +  133.331 * s);
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
			
			case 79:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +  116.665 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +  116.665 * s);
			_setf(o + ( 7 << 2), y +  -66.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -66.666 * s);
			_setf(o + (10 << 2), x +   99.998 * s);
			_setf(o + (11 << 2), y +  -16.666 * s);
			_setf(o + (12 << 2), x +   16.666 * s);
			_setf(o + (13 << 2), y +  -16.666 * s);
			_setf(o + (14 << 2), x +   16.666 * s);
			_setf(o + (15 << 2), y +  -49.999 * s);
			_setf(o + (16 << 2), x +   99.998 * s);
			_setf(o + (17 << 2), y +  -49.999 * s);
			_setf(o + (18 << 2), x +   99.998 * s);
			_setf(o + (19 << 2), y +  -16.666 * s);
			_setf(o + (20 << 2), x +  133.331 * s);
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
			
			case 80:
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   16.667 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   16.667 * s);
			_setf(o + ( 7 << 2), y +  -16.666 * s);
			_setf(o + ( 8 << 2), x +  116.665 * s);
			_setf(o + ( 9 << 2), y +  -16.666 * s);
			_setf(o + (10 << 2), x +  116.665 * s);
			_setf(o + (11 << 2), y +  -66.666 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +  -66.666 * s);
			_setf(o + (14 << 2), x +   99.999 * s);
			_setf(o + (15 << 2), y +  -33.333 * s);
			_setf(o + (16 << 2), x +   16.667 * s);
			_setf(o + (17 << 2), y +  -33.333 * s);
			_setf(o + (18 << 2), x +   16.667 * s);
			_setf(o + (19 << 2), y +  -49.999 * s);
			_setf(o + (20 << 2), x +   99.999 * s);
			_setf(o + (21 << 2), y +  -49.999 * s);
			_setf(o + (22 << 2), x +   99.999 * s);
			_setf(o + (23 << 2), y +  -33.333 * s);
			_setf(o + (24 << 2), x +  133.332 * s);
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
			
			case 81:
			
			o = _posf(30);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   49.999 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   49.999 * s);
			_setf(o + ( 7 << 2), y +   16.666 * s);
			_setf(o + ( 8 << 2), x +   66.665 * s);
			_setf(o + ( 9 << 2), y +   16.666 * s);
			_setf(o + (10 << 2), x +   66.665 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +  116.664 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +  116.664 * s);
			_setf(o + (15 << 2), y +  -66.666 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -66.666 * s);
			_setf(o + (18 << 2), x +   99.998 * s);
			_setf(o + (19 << 2), y +  -16.666 * s);
			_setf(o + (20 << 2), x +   16.666 * s);
			_setf(o + (21 << 2), y +  -16.666 * s);
			_setf(o + (22 << 2), x +   16.666 * s);
			_setf(o + (23 << 2), y +  -49.999 * s);
			_setf(o + (24 << 2), x +   99.998 * s);
			_setf(o + (25 << 2), y +  -49.999 * s);
			_setf(o + (26 << 2), x +   99.998 * s);
			_setf(o + (27 << 2), y +  -16.666 * s);
			_setf(o + (28 << 2), x +  133.331 * s);
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
			_setb(o +  9, 1);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 1);
			
			case 82:
			
			o = _posf(34);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   16.666 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   16.666 * s);
			_setf(o + ( 7 << 2), y +  -16.666 * s);
			_setf(o + ( 8 << 2), x +   83.332 * s);
			_setf(o + ( 9 << 2), y +  -16.666 * s);
			_setf(o + (10 << 2), x +   83.332 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   99.998 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   99.998 * s);
			_setf(o + (15 << 2), y +  -16.666 * s);
			_setf(o + (16 << 2), x +  116.665 * s);
			_setf(o + (17 << 2), y +  -16.666 * s);
			_setf(o + (18 << 2), x +  116.665 * s);
			_setf(o + (19 << 2), y +  -66.666 * s);
			_setf(o + (20 << 2), x +       0. * s);
			_setf(o + (21 << 2), y +  -66.666 * s);
			_setf(o + (22 << 2), x +   99.998 * s);
			_setf(o + (23 << 2), y +  -33.333 * s);
			_setf(o + (24 << 2), x +   16.666 * s);
			_setf(o + (25 << 2), y +  -33.333 * s);
			_setf(o + (26 << 2), x +   16.666 * s);
			_setf(o + (27 << 2), y +  -49.999 * s);
			_setf(o + (28 << 2), x +   99.998 * s);
			_setf(o + (29 << 2), y +  -49.999 * s);
			_setf(o + (30 << 2), x +   99.998 * s);
			_setf(o + (31 << 2), y +  -33.333 * s);
			_setf(o + (32 << 2), x +  133.331 * s);
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
			
			case 83:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -25.000 * s);
			_setf(o + ( 4 << 2), x +   99.999 * s);
			_setf(o + ( 5 << 2), y +  -25.000 * s);
			_setf(o + ( 6 << 2), x +   99.999 * s);
			_setf(o + ( 7 << 2), y +  -16.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -16.666 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +  116.665 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +  116.665 * s);
			_setf(o + (15 << 2), y +  -41.666 * s);
			_setf(o + (16 << 2), x +   16.667 * s);
			_setf(o + (17 << 2), y +  -41.666 * s);
			_setf(o + (18 << 2), x +   16.667 * s);
			_setf(o + (19 << 2), y +  -49.999 * s);
			_setf(o + (20 << 2), x +  116.665 * s);
			_setf(o + (21 << 2), y +  -49.999 * s);
			_setf(o + (22 << 2), x +  116.665 * s);
			_setf(o + (23 << 2), y +  -66.666 * s);
			_setf(o + (24 << 2), x +       0. * s);
			_setf(o + (25 << 2), y +  -66.666 * s);
			_setf(o + (26 << 2), x +  133.332 * s);
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
			
			case 84:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			_setf(o + ( 4 << 2), x +   49.999 * s);
			_setf(o + ( 5 << 2), y +  -49.999 * s);
			_setf(o + ( 6 << 2), x +   49.999 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   66.665 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   66.665 * s);
			_setf(o + (11 << 2), y +  -49.999 * s);
			_setf(o + (12 << 2), x +  116.664 * s);
			_setf(o + (13 << 2), y +  -49.999 * s);
			_setf(o + (14 << 2), x +  116.664 * s);
			_setf(o + (15 << 2), y +  -66.666 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -66.666 * s);
			_setf(o + (18 << 2), x +  133.331 * s);
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
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +  116.665 * s);
			_setf(o + ( 1 << 2), y +       0. * s);
			_setf(o + ( 2 << 2), x +  116.665 * s);
			_setf(o + ( 3 << 2), y +  -66.666 * s);
			_setf(o + ( 4 << 2), x +   99.998 * s);
			_setf(o + ( 5 << 2), y +  -66.666 * s);
			_setf(o + ( 6 << 2), x +   99.998 * s);
			_setf(o + ( 7 << 2), y +  -16.666 * s);
			_setf(o + ( 8 << 2), x +   16.666 * s);
			_setf(o + ( 9 << 2), y +  -16.666 * s);
			_setf(o + (10 << 2), x +   16.666 * s);
			_setf(o + (11 << 2), y +  -66.666 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +  -66.666 * s);
			_setf(o + (14 << 2), x +       0. * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +  116.665 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +  133.331 * s);
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
			
			case 86:
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +   99.999 * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +   99.999 * s);
			_setf(o + ( 3 << 2), y +  -16.666 * s);
			_setf(o + ( 4 << 2), x +  116.665 * s);
			_setf(o + ( 5 << 2), y +  -16.666 * s);
			_setf(o + ( 6 << 2), x +  116.665 * s);
			_setf(o + ( 7 << 2), y +  -66.666 * s);
			_setf(o + ( 8 << 2), x +   99.999 * s);
			_setf(o + ( 9 << 2), y +  -66.666 * s);
			_setf(o + (10 << 2), x +   16.667 * s);
			_setf(o + (11 << 2), y +  -16.666 * s);
			_setf(o + (12 << 2), x +   16.667 * s);
			_setf(o + (13 << 2), y +  -66.666 * s);
			_setf(o + (14 << 2), x +       0. * s);
			_setf(o + (15 << 2), y +  -66.666 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   99.999 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   99.999 * s);
			_setf(o + (21 << 2), y +  -16.666 * s);
			_setf(o + (22 << 2), x +   16.667 * s);
			_setf(o + (23 << 2), y +  -16.666 * s);
			_setf(o + (24 << 2), x +  133.332 * s);
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
			
			case 87:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   99.998 * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +   99.998 * s);
			_setf(o + ( 3 << 2), y +  -16.666 * s);
			_setf(o + ( 4 << 2), x +   66.665 * s);
			_setf(o + ( 5 << 2), y +  -16.666 * s);
			_setf(o + ( 6 << 2), x +   66.665 * s);
			_setf(o + ( 7 << 2), y +  -66.666 * s);
			_setf(o + ( 8 << 2), x +   49.999 * s);
			_setf(o + ( 9 << 2), y +  -66.666 * s);
			_setf(o + (10 << 2), x +   49.999 * s);
			_setf(o + (11 << 2), y +  -16.666 * s);
			_setf(o + (12 << 2), x +   16.666 * s);
			_setf(o + (13 << 2), y +  -16.666 * s);
			_setf(o + (14 << 2), x +   16.666 * s);
			_setf(o + (15 << 2), y +  -66.666 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -66.666 * s);
			_setf(o + (18 << 2), x +       0. * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +  116.664 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +  116.664 * s);
			_setf(o + (23 << 2), y +  -66.666 * s);
			_setf(o + (24 << 2), x +   99.998 * s);
			_setf(o + (25 << 2), y +  -66.666 * s);
			_setf(o + (26 << 2), x +  133.331 * s);
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
			
			case 88:
			
			o = _posf(52);
			_setf(o + ( 0 << 2), x +   99.998 * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +   99.998 * s);
			_setf(o + ( 3 << 2), y +  -41.666 * s);
			_setf(o + ( 4 << 2), x +  116.665 * s);
			_setf(o + ( 5 << 2), y +  -41.666 * s);
			_setf(o + ( 6 << 2), x +  116.665 * s);
			_setf(o + ( 7 << 2), y +  -66.666 * s);
			_setf(o + ( 8 << 2), x +   99.998 * s);
			_setf(o + ( 9 << 2), y +  -66.666 * s);
			_setf(o + (10 << 2), x +   99.998 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +  116.665 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +  116.665 * s);
			_setf(o + (15 << 2), y +  -25.000 * s);
			_setf(o + (16 << 2), x +   99.998 * s);
			_setf(o + (17 << 2), y +  -25.000 * s);
			_setf(o + (18 << 2), x +   99.998 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   16.666 * s);
			_setf(o + (21 << 2), y +  -41.666 * s);
			_setf(o + (22 << 2), x +   16.666 * s);
			_setf(o + (23 << 2), y +  -25.000 * s);
			_setf(o + (24 << 2), x +   99.998 * s);
			_setf(o + (25 << 2), y +  -25.000 * s);
			_setf(o + (26 << 2), x +   99.998 * s);
			_setf(o + (27 << 2), y +  -41.666 * s);
			_setf(o + (28 << 2), x +   16.666 * s);
			_setf(o + (29 << 2), y +  -41.666 * s);
			_setf(o + (30 << 2), x +   16.666 * s);
			_setf(o + (31 << 2), y +  -66.666 * s);
			_setf(o + (32 << 2), x +       0. * s);
			_setf(o + (33 << 2), y +  -66.666 * s);
			_setf(o + (34 << 2), x +       0. * s);
			_setf(o + (35 << 2), y +  -41.666 * s);
			_setf(o + (36 << 2), x +   16.666 * s);
			_setf(o + (37 << 2), y +  -41.666 * s);
			_setf(o + (38 << 2), x +   16.666 * s);
			_setf(o + (39 << 2), y +  -66.666 * s);
			_setf(o + (40 << 2), x +       0. * s);
			_setf(o + (41 << 2), y +  -25.000 * s);
			_setf(o + (42 << 2), x +       0. * s);
			_setf(o + (43 << 2), y +       0. * s);
			_setf(o + (44 << 2), x +   16.666 * s);
			_setf(o + (45 << 2), y +       0. * s);
			_setf(o + (46 << 2), x +   16.666 * s);
			_setf(o + (47 << 2), y +  -25.000 * s);
			_setf(o + (48 << 2), x +       0. * s);
			_setf(o + (49 << 2), y +  -25.000 * s);
			_setf(o + (50 << 2), x +  133.331 * s);
			_setf(o + (51 << 2), y +       0. * s);
			o = _posb(26);
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
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 1);
			_setb(o + 16, 2);
			_setb(o + 17, 2);
			_setb(o + 18, 2);
			_setb(o + 19, 2);
			_setb(o + 20, 1);
			_setb(o + 21, 2);
			_setb(o + 22, 2);
			_setb(o + 23, 2);
			_setb(o + 24, 2);
			_setb(o + 25, 1);
			
			case 89:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   99.999 * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +   99.999 * s);
			_setf(o + ( 3 << 2), y +  -41.666 * s);
			_setf(o + ( 4 << 2), x +   16.667 * s);
			_setf(o + ( 5 << 2), y +  -41.666 * s);
			_setf(o + ( 6 << 2), x +   16.667 * s);
			_setf(o + ( 7 << 2), y +  -66.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -66.666 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +  -25.000 * s);
			_setf(o + (12 << 2), x +   99.999 * s);
			_setf(o + (13 << 2), y +  -25.000 * s);
			_setf(o + (14 << 2), x +   99.999 * s);
			_setf(o + (15 << 2), y +  -16.666 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -16.666 * s);
			_setf(o + (18 << 2), x +       0. * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +  116.665 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +  116.665 * s);
			_setf(o + (23 << 2), y +  -66.666 * s);
			_setf(o + (24 << 2), x +   99.999 * s);
			_setf(o + (25 << 2), y +  -66.666 * s);
			_setf(o + (26 << 2), x +  133.332 * s);
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
			
			case 90:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			_setf(o + ( 4 << 2), x +   99.998 * s);
			_setf(o + ( 5 << 2), y +  -49.999 * s);
			_setf(o + ( 6 << 2), x +   99.998 * s);
			_setf(o + ( 7 << 2), y +  -41.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -41.666 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +  116.664 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +  116.664 * s);
			_setf(o + (15 << 2), y +  -16.666 * s);
			_setf(o + (16 << 2), x +   16.666 * s);
			_setf(o + (17 << 2), y +  -16.666 * s);
			_setf(o + (18 << 2), x +   16.666 * s);
			_setf(o + (19 << 2), y +  -25.000 * s);
			_setf(o + (20 << 2), x +  116.664 * s);
			_setf(o + (21 << 2), y +  -25.000 * s);
			_setf(o + (22 << 2), x +  116.664 * s);
			_setf(o + (23 << 2), y +  -66.666 * s);
			_setf(o + (24 << 2), x +       0. * s);
			_setf(o + (25 << 2), y +  -66.666 * s);
			_setf(o + (26 << 2), x +  133.331 * s);
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
			
			case 91:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   33.333 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   33.333 * s);
			_setf(o + ( 7 << 2), y +  -16.666 * s);
			_setf(o + ( 8 << 2), x +   16.666 * s);
			_setf(o + ( 9 << 2), y +  -16.666 * s);
			_setf(o + (10 << 2), x +   16.666 * s);
			_setf(o + (11 << 2), y +  -49.999 * s);
			_setf(o + (12 << 2), x +   33.333 * s);
			_setf(o + (13 << 2), y +  -49.999 * s);
			_setf(o + (14 << 2), x +   33.333 * s);
			_setf(o + (15 << 2), y +  -66.666 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -66.666 * s);
			_setf(o + (18 << 2), x +   49.999 * s);
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
			
			o = _posf(42);
			_setf(o + ( 0 << 2), x +   16.666 * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +   16.666 * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +  -49.999 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +  -66.666 * s);
			_setf(o + ( 8 << 2), x +   16.666 * s);
			_setf(o + ( 9 << 2), y +  -66.666 * s);
			_setf(o + (10 << 2), x +   33.333 * s);
			_setf(o + (11 << 2), y +  -49.999 * s);
			_setf(o + (12 << 2), x +   33.333 * s);
			_setf(o + (13 << 2), y +  -33.333 * s);
			_setf(o + (14 << 2), x +   16.666 * s);
			_setf(o + (15 << 2), y +  -33.333 * s);
			_setf(o + (16 << 2), x +   16.666 * s);
			_setf(o + (17 << 2), y +  -49.999 * s);
			_setf(o + (18 << 2), x +   33.333 * s);
			_setf(o + (19 << 2), y +  -49.999 * s);
			_setf(o + (20 << 2), x +   49.999 * s);
			_setf(o + (21 << 2), y +  -33.333 * s);
			_setf(o + (22 << 2), x +   49.999 * s);
			_setf(o + (23 << 2), y +  -16.666 * s);
			_setf(o + (24 << 2), x +   33.333 * s);
			_setf(o + (25 << 2), y +  -16.666 * s);
			_setf(o + (26 << 2), x +   33.333 * s);
			_setf(o + (27 << 2), y +  -33.333 * s);
			_setf(o + (28 << 2), x +   49.999 * s);
			_setf(o + (29 << 2), y +  -33.333 * s);
			_setf(o + (30 << 2), x +   66.666 * s);
			_setf(o + (31 << 2), y +  -16.666 * s);
			_setf(o + (32 << 2), x +   66.666 * s);
			_setf(o + (33 << 2), y +       0. * s);
			_setf(o + (34 << 2), x +   49.999 * s);
			_setf(o + (35 << 2), y +       0. * s);
			_setf(o + (36 << 2), x +   49.999 * s);
			_setf(o + (37 << 2), y +  -16.666 * s);
			_setf(o + (38 << 2), x +   66.666 * s);
			_setf(o + (39 << 2), y +  -16.666 * s);
			_setf(o + (40 << 2), x +   83.332 * s);
			_setf(o + (41 << 2), y +       0. * s);
			o = _posb(21);
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
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 1);
			_setb(o + 16, 2);
			_setb(o + 17, 2);
			_setb(o + 18, 2);
			_setb(o + 19, 2);
			_setb(o + 20, 1);
			
			case 93:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			_setf(o + ( 4 << 2), x +   16.666 * s);
			_setf(o + ( 5 << 2), y +  -49.999 * s);
			_setf(o + ( 6 << 2), x +   16.666 * s);
			_setf(o + ( 7 << 2), y +  -16.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -16.666 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   33.333 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   33.333 * s);
			_setf(o + (15 << 2), y +  -66.666 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -66.666 * s);
			_setf(o + (18 << 2), x +   49.999 * s);
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
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			_setf(o + ( 4 << 2), x +   50.000 * s);
			_setf(o + ( 5 << 2), y +  -49.999 * s);
			_setf(o + ( 6 << 2), x +   50.000 * s);
			_setf(o + ( 7 << 2), y +  -66.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -66.666 * s);
			_setf(o + (10 << 2), x +   66.666 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 95:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -16.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   83.332 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   83.332 * s);
			_setf(o + ( 7 << 2), y +  -16.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -16.666 * s);
			_setf(o + (10 << 2), x +   99.998 * s);
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
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			_setf(o + ( 4 << 2), x +   33.333 * s);
			_setf(o + ( 5 << 2), y +  -49.999 * s);
			_setf(o + ( 6 << 2), x +   33.333 * s);
			_setf(o + ( 7 << 2), y +  -66.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -66.666 * s);
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
			
			o = _posf(30);
			_setf(o + ( 0 << 2), x +   16.666 * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +   16.666 * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			_setf(o + ( 4 << 2), x +   99.998 * s);
			_setf(o + ( 5 << 2), y +  -49.999 * s);
			_setf(o + ( 6 << 2), x +   99.998 * s);
			_setf(o + ( 7 << 2), y +  -41.666 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -41.666 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +  116.665 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +  116.665 * s);
			_setf(o + (15 << 2), y +  -66.666 * s);
			_setf(o + (16 << 2), x +   16.666 * s);
			_setf(o + (17 << 2), y +  -66.666 * s);
			_setf(o + (18 << 2), x +   99.998 * s);
			_setf(o + (19 << 2), y +  -16.666 * s);
			_setf(o + (20 << 2), x +   16.666 * s);
			_setf(o + (21 << 2), y +  -16.666 * s);
			_setf(o + (22 << 2), x +   16.666 * s);
			_setf(o + (23 << 2), y +  -25.000 * s);
			_setf(o + (24 << 2), x +   99.998 * s);
			_setf(o + (25 << 2), y +  -25.000 * s);
			_setf(o + (26 << 2), x +   99.998 * s);
			_setf(o + (27 << 2), y +  -16.666 * s);
			_setf(o + (28 << 2), x +  133.331 * s);
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
			_setb(o +  9, 1);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 1);
			
			case 98:
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +   16.666 * s);
			_setf(o + ( 1 << 2), y +  -49.999 * s);
			_setf(o + ( 2 << 2), x +   16.666 * s);
			_setf(o + ( 3 << 2), y +  -66.666 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +  -66.666 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +  116.665 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +  116.665 * s);
			_setf(o + (11 << 2), y +  -49.999 * s);
			_setf(o + (12 << 2), x +   16.666 * s);
			_setf(o + (13 << 2), y +  -49.999 * s);
			_setf(o + (14 << 2), x +   99.998 * s);
			_setf(o + (15 << 2), y +  -16.666 * s);
			_setf(o + (16 << 2), x +   16.666 * s);
			_setf(o + (17 << 2), y +  -16.666 * s);
			_setf(o + (18 << 2), x +   16.666 * s);
			_setf(o + (19 << 2), y +  -33.333 * s);
			_setf(o + (20 << 2), x +   99.998 * s);
			_setf(o + (21 << 2), y +  -33.333 * s);
			_setf(o + (22 << 2), x +   99.998 * s);
			_setf(o + (23 << 2), y +  -16.666 * s);
			_setf(o + (24 << 2), x +  133.331 * s);
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
			
			case 99:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -49.999 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +  116.665 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +  116.665 * s);
			_setf(o + ( 7 << 2), y +  -16.666 * s);
			_setf(o + ( 8 << 2), x +   16.667 * s);
			_setf(o + ( 9 << 2), y +  -16.666 * s);
			_setf(o + (10 << 2), x +   16.667 * s);
			_setf(o + (11 << 2), y +  -33.333 * s);
			_setf(o + (12 << 2), x +  116.665 * s);
			_setf(o + (13 << 2), y +  -33.333 * s);
			_setf(o + (14 << 2), x +  116.665 * s);
			_setf(o + (15 << 2), y +  -49.999 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -49.999 * s);
			_setf(o + (18 << 2), x +  133.332 * s);
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
			
			case 100:
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +   99.998 * s);
			_setf(o + ( 1 << 2), y +  -66.666 * s);
			_setf(o + ( 2 << 2), x +   99.998 * s);
			_setf(o + ( 3 << 2), y +  -49.999 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +  -49.999 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +  116.664 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +  116.664 * s);
			_setf(o + (11 << 2), y +  -66.666 * s);
			_setf(o + (12 << 2), x +   99.998 * s);
			_setf(o + (13 << 2), y +  -66.666 * s);
			_setf(o + (14 << 2), x +   99.998 * s);
			_setf(o + (15 << 2), y +  -16.666 * s);
			_setf(o + (16 << 2), x +   16.666 * s);
			_setf(o + (17 << 2), y +  -16.666 * s);
			_setf(o + (18 << 2), x +   16.666 * s);
			_setf(o + (19 << 2), y +  -33.333 * s);
			_setf(o + (20 << 2), x +   99.998 * s);
			_setf(o + (21 << 2), y +  -33.333 * s);
			_setf(o + (22 << 2), x +   99.998 * s);
			_setf(o + (23 << 2), y +  -16.666 * s);
			_setf(o + (24 << 2), x +  133.331 * s);
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
			
			case 101:
			
			o = _posf(30);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.670 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   99.998 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   99.998 * s);
			_setf(o + ( 7 << 2), y +  -16.670 * s);
			_setf(o + ( 8 << 2), x +   16.666 * s);
			_setf(o + ( 9 << 2), y +  -16.670 * s);
			_setf(o + (10 << 2), x +   16.666 * s);
			_setf(o + (11 << 2), y +  -25.000 * s);
			_setf(o + (12 << 2), x +  116.665 * s);
			_setf(o + (13 << 2), y +  -25.000 * s);
			_setf(o + (14 << 2), x +  116.665 * s);
			_setf(o + (15 << 2), y +  -66.670 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -66.670 * s);
			_setf(o + (18 << 2), x +   99.998 * s);
			_setf(o + (19 << 2), y +  -41.670 * s);
			_setf(o + (20 << 2), x +   16.666 * s);
			_setf(o + (21 << 2), y +  -41.670 * s);
			_setf(o + (22 << 2), x +   16.666 * s);
			_setf(o + (23 << 2), y +  -50.000 * s);
			_setf(o + (24 << 2), x +   99.998 * s);
			_setf(o + (25 << 2), y +  -50.000 * s);
			_setf(o + (26 << 2), x +   99.998 * s);
			_setf(o + (27 << 2), y +  -41.670 * s);
			_setf(o + (28 << 2), x +  133.331 * s);
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
			_setb(o +  9, 1);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 1);
			
			case 102:
			
			o = _posf(32);
			_setf(o + ( 0 << 2), x +   16.667 * s);
			_setf(o + ( 1 << 2), y +  -66.670 * s);
			_setf(o + ( 2 << 2), x +   16.667 * s);
			_setf(o + ( 3 << 2), y +  -41.670 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +  -41.670 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +  -25.000 * s);
			_setf(o + ( 8 << 2), x +   16.667 * s);
			_setf(o + ( 9 << 2), y +  -25.000 * s);
			_setf(o + (10 << 2), x +   16.667 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   33.333 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   33.333 * s);
			_setf(o + (15 << 2), y +  -25.000 * s);
			_setf(o + (16 << 2), x +  116.665 * s);
			_setf(o + (17 << 2), y +  -25.000 * s);
			_setf(o + (18 << 2), x +  116.665 * s);
			_setf(o + (19 << 2), y +  -41.670 * s);
			_setf(o + (20 << 2), x +   33.333 * s);
			_setf(o + (21 << 2), y +  -41.670 * s);
			_setf(o + (22 << 2), x +   33.333 * s);
			_setf(o + (23 << 2), y +  -50.000 * s);
			_setf(o + (24 << 2), x +  116.665 * s);
			_setf(o + (25 << 2), y +  -50.000 * s);
			_setf(o + (26 << 2), x +  116.665 * s);
			_setf(o + (27 << 2), y +  -66.670 * s);
			_setf(o + (28 << 2), x +   16.667 * s);
			_setf(o + (29 << 2), y +  -66.670 * s);
			_setf(o + (30 << 2), x +  133.332 * s);
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
			
			case 103:
			
			o = _posf(30);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -50.000 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +   -8.330 * s);
			_setf(o + ( 4 << 2), x +   99.998 * s);
			_setf(o + ( 5 << 2), y +   -8.330 * s);
			_setf(o + ( 6 << 2), x +   99.998 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   16.666 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   16.666 * s);
			_setf(o + (11 << 2), y +   16.670 * s);
			_setf(o + (12 << 2), x +  116.664 * s);
			_setf(o + (13 << 2), y +   16.670 * s);
			_setf(o + (14 << 2), x +  116.664 * s);
			_setf(o + (15 << 2), y +  -50.000 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -50.000 * s);
			_setf(o + (18 << 2), x +   99.998 * s);
			_setf(o + (19 << 2), y +  -25.000 * s);
			_setf(o + (20 << 2), x +   16.666 * s);
			_setf(o + (21 << 2), y +  -25.000 * s);
			_setf(o + (22 << 2), x +   16.666 * s);
			_setf(o + (23 << 2), y +  -33.330 * s);
			_setf(o + (24 << 2), x +   99.998 * s);
			_setf(o + (25 << 2), y +  -33.330 * s);
			_setf(o + (26 << 2), x +   99.998 * s);
			_setf(o + (27 << 2), y +  -25.000 * s);
			_setf(o + (28 << 2), x +  133.331 * s);
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
			_setb(o +  9, 1);
			_setb(o + 10, 2);
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 1);
			
			case 104:
			
			o = _posf(24);
			_setf(o + ( 0 << 2), x +   16.666 * s);
			_setf(o + ( 1 << 2), y +  -41.670 * s);
			_setf(o + ( 2 << 2), x +   16.666 * s);
			_setf(o + ( 3 << 2), y +  -66.670 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +  -66.670 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +   16.666 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +   16.666 * s);
			_setf(o + (11 << 2), y +  -25.000 * s);
			_setf(o + (12 << 2), x +   99.998 * s);
			_setf(o + (13 << 2), y +  -25.000 * s);
			_setf(o + (14 << 2), x +   99.998 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +  116.665 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +  116.665 * s);
			_setf(o + (19 << 2), y +  -41.670 * s);
			_setf(o + (20 << 2), x +   16.666 * s);
			_setf(o + (21 << 2), y +  -41.670 * s);
			_setf(o + (22 << 2), x +  133.331 * s);
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
			
			case 105:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.670 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -50.000 * s);
			_setf(o + ( 4 << 2), x +   16.667 * s);
			_setf(o + ( 5 << 2), y +  -50.000 * s);
			_setf(o + ( 6 << 2), x +   16.667 * s);
			_setf(o + ( 7 << 2), y +  -66.670 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -66.670 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +  -41.670 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   16.667 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   16.667 * s);
			_setf(o + (17 << 2), y +  -41.670 * s);
			_setf(o + (18 << 2), x +       0. * s);
			_setf(o + (19 << 2), y +  -41.670 * s);
			_setf(o + (20 << 2), x +   33.333 * s);
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
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +   99.999 * s);
			_setf(o + ( 1 << 2), y +  -66.670 * s);
			_setf(o + ( 2 << 2), x +   99.999 * s);
			_setf(o + ( 3 << 2), y +  -50.000 * s);
			_setf(o + ( 4 << 2), x +  116.665 * s);
			_setf(o + ( 5 << 2), y +  -50.000 * s);
			_setf(o + ( 6 << 2), x +  116.665 * s);
			_setf(o + ( 7 << 2), y +  -66.670 * s);
			_setf(o + ( 8 << 2), x +   99.999 * s);
			_setf(o + ( 9 << 2), y +  -66.670 * s);
			_setf(o + (10 << 2), x +   99.999 * s);
			_setf(o + (11 << 2), y +  -41.670 * s);
			_setf(o + (12 << 2), x +   99.999 * s);
			_setf(o + (13 << 2), y +  -16.670 * s);
			_setf(o + (14 << 2), x +       0. * s);
			_setf(o + (15 << 2), y +  -16.670 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +  116.665 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +  116.665 * s);
			_setf(o + (21 << 2), y +  -41.670 * s);
			_setf(o + (22 << 2), x +   99.999 * s);
			_setf(o + (23 << 2), y +  -41.670 * s);
			_setf(o + (24 << 2), x +  133.331 * s);
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
			
			case 107:
			
			o = _posf(32);
			_setf(o + ( 0 << 2), x +   99.999 * s);
			_setf(o + ( 1 << 2), y +  -66.670 * s);
			_setf(o + ( 2 << 2), x +   99.999 * s);
			_setf(o + ( 3 << 2), y +  -41.670 * s);
			_setf(o + ( 4 << 2), x +   16.667 * s);
			_setf(o + ( 5 << 2), y +  -41.670 * s);
			_setf(o + ( 6 << 2), x +   16.667 * s);
			_setf(o + ( 7 << 2), y +  -66.670 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -66.670 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   16.667 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   16.667 * s);
			_setf(o + (15 << 2), y +  -25.000 * s);
			_setf(o + (16 << 2), x +   83.332 * s);
			_setf(o + (17 << 2), y +  -25.000 * s);
			_setf(o + (18 << 2), x +   83.332 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   99.999 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +   99.999 * s);
			_setf(o + (23 << 2), y +  -25.000 * s);
			_setf(o + (24 << 2), x +  116.665 * s);
			_setf(o + (25 << 2), y +  -25.000 * s);
			_setf(o + (26 << 2), x +  116.665 * s);
			_setf(o + (27 << 2), y +  -66.670 * s);
			_setf(o + (28 << 2), x +   99.999 * s);
			_setf(o + (29 << 2), y +  -66.670 * s);
			_setf(o + (30 << 2), x +  133.332 * s);
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
			
			case 108:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.670 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   16.666 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   16.666 * s);
			_setf(o + ( 7 << 2), y +  -66.670 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -66.670 * s);
			_setf(o + (10 << 2), x +   33.333 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 109:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -50.000 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   16.666 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   16.666 * s);
			_setf(o + ( 7 << 2), y +  -33.330 * s);
			_setf(o + ( 8 << 2), x +   49.999 * s);
			_setf(o + ( 9 << 2), y +  -33.330 * s);
			_setf(o + (10 << 2), x +   49.999 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   66.666 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   66.666 * s);
			_setf(o + (15 << 2), y +  -33.330 * s);
			_setf(o + (16 << 2), x +   99.998 * s);
			_setf(o + (17 << 2), y +  -33.330 * s);
			_setf(o + (18 << 2), x +   99.998 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +  116.665 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +  116.665 * s);
			_setf(o + (23 << 2), y +  -50.000 * s);
			_setf(o + (24 << 2), x +       0. * s);
			_setf(o + (25 << 2), y +  -50.000 * s);
			_setf(o + (26 << 2), x +  133.331 * s);
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
			
			case 110:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -50.000 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   16.667 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   16.667 * s);
			_setf(o + ( 7 << 2), y +  -33.330 * s);
			_setf(o + ( 8 << 2), x +   99.999 * s);
			_setf(o + ( 9 << 2), y +  -33.330 * s);
			_setf(o + (10 << 2), x +   99.999 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +  116.665 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +  116.665 * s);
			_setf(o + (15 << 2), y +  -50.000 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -50.000 * s);
			_setf(o + (18 << 2), x +  133.332 * s);
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
			
			case 111:
			
			o = _posf(22);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -50.000 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +  116.664 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +  116.664 * s);
			_setf(o + ( 7 << 2), y +  -50.000 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -50.000 * s);
			_setf(o + (10 << 2), x +   99.998 * s);
			_setf(o + (11 << 2), y +  -16.670 * s);
			_setf(o + (12 << 2), x +   16.666 * s);
			_setf(o + (13 << 2), y +  -16.670 * s);
			_setf(o + (14 << 2), x +   16.666 * s);
			_setf(o + (15 << 2), y +  -33.330 * s);
			_setf(o + (16 << 2), x +   99.998 * s);
			_setf(o + (17 << 2), y +  -33.330 * s);
			_setf(o + (18 << 2), x +   99.998 * s);
			_setf(o + (19 << 2), y +  -16.670 * s);
			_setf(o + (20 << 2), x +  133.331 * s);
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
			
			case 112:
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -50.000 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +   16.670 * s);
			_setf(o + ( 4 << 2), x +   16.666 * s);
			_setf(o + ( 5 << 2), y +   16.670 * s);
			_setf(o + ( 6 << 2), x +   16.666 * s);
			_setf(o + ( 7 << 2), y +       0. * s);
			_setf(o + ( 8 << 2), x +  116.665 * s);
			_setf(o + ( 9 << 2), y +       0. * s);
			_setf(o + (10 << 2), x +  116.665 * s);
			_setf(o + (11 << 2), y +  -50.000 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +  -50.000 * s);
			_setf(o + (14 << 2), x +   99.998 * s);
			_setf(o + (15 << 2), y +  -16.670 * s);
			_setf(o + (16 << 2), x +   16.666 * s);
			_setf(o + (17 << 2), y +  -16.670 * s);
			_setf(o + (18 << 2), x +   16.666 * s);
			_setf(o + (19 << 2), y +  -33.330 * s);
			_setf(o + (20 << 2), x +   99.998 * s);
			_setf(o + (21 << 2), y +  -33.330 * s);
			_setf(o + (22 << 2), x +   99.998 * s);
			_setf(o + (23 << 2), y +  -16.670 * s);
			_setf(o + (24 << 2), x +  133.331 * s);
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
			
			case 113:
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -50.000 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   99.999 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   99.999 * s);
			_setf(o + ( 7 << 2), y +   16.670 * s);
			_setf(o + ( 8 << 2), x +  116.665 * s);
			_setf(o + ( 9 << 2), y +   16.670 * s);
			_setf(o + (10 << 2), x +  116.665 * s);
			_setf(o + (11 << 2), y +  -50.000 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +  -50.000 * s);
			_setf(o + (14 << 2), x +   99.999 * s);
			_setf(o + (15 << 2), y +  -16.670 * s);
			_setf(o + (16 << 2), x +   16.667 * s);
			_setf(o + (17 << 2), y +  -16.670 * s);
			_setf(o + (18 << 2), x +   16.667 * s);
			_setf(o + (19 << 2), y +  -33.330 * s);
			_setf(o + (20 << 2), x +   99.999 * s);
			_setf(o + (21 << 2), y +  -33.330 * s);
			_setf(o + (22 << 2), x +   99.999 * s);
			_setf(o + (23 << 2), y +  -16.670 * s);
			_setf(o + (24 << 2), x +  133.332 * s);
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
			
			case 114:
			
			o = _posf(16);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -50.000 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   16.666 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   16.666 * s);
			_setf(o + ( 7 << 2), y +  -33.330 * s);
			_setf(o + ( 8 << 2), x +  116.664 * s);
			_setf(o + ( 9 << 2), y +  -33.330 * s);
			_setf(o + (10 << 2), x +  116.664 * s);
			_setf(o + (11 << 2), y +  -50.000 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +  -50.000 * s);
			_setf(o + (14 << 2), x +  133.331 * s);
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
			
			case 115:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   16.666 * s);
			_setf(o + ( 1 << 2), y +  -41.670 * s);
			_setf(o + ( 2 << 2), x +   16.666 * s);
			_setf(o + ( 3 << 2), y +  -50.000 * s);
			_setf(o + ( 4 << 2), x +   99.998 * s);
			_setf(o + ( 5 << 2), y +  -50.000 * s);
			_setf(o + ( 6 << 2), x +   99.998 * s);
			_setf(o + ( 7 << 2), y +  -66.670 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -66.670 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +  -25.000 * s);
			_setf(o + (12 << 2), x +   99.998 * s);
			_setf(o + (13 << 2), y +  -25.000 * s);
			_setf(o + (14 << 2), x +   99.998 * s);
			_setf(o + (15 << 2), y +  -16.670 * s);
			_setf(o + (16 << 2), x +   16.666 * s);
			_setf(o + (17 << 2), y +  -16.670 * s);
			_setf(o + (18 << 2), x +   16.666 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +  116.665 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +  116.665 * s);
			_setf(o + (23 << 2), y +  -41.670 * s);
			_setf(o + (24 << 2), x +   16.666 * s);
			_setf(o + (25 << 2), y +  -41.670 * s);
			_setf(o + (26 << 2), x +  133.331 * s);
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
			
			case 116:
			
			o = _posf(32);
			_setf(o + ( 0 << 2), x +   33.333 * s);
			_setf(o + ( 1 << 2), y +  -50.000 * s);
			_setf(o + ( 2 << 2), x +   33.333 * s);
			_setf(o + ( 3 << 2), y +  -66.670 * s);
			_setf(o + ( 4 << 2), x +   16.667 * s);
			_setf(o + ( 5 << 2), y +  -66.670 * s);
			_setf(o + ( 6 << 2), x +   16.667 * s);
			_setf(o + ( 7 << 2), y +  -50.000 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -50.000 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +  -33.330 * s);
			_setf(o + (12 << 2), x +   16.667 * s);
			_setf(o + (13 << 2), y +  -33.330 * s);
			_setf(o + (14 << 2), x +   16.667 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +  116.665 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +  116.665 * s);
			_setf(o + (19 << 2), y +  -16.670 * s);
			_setf(o + (20 << 2), x +   33.333 * s);
			_setf(o + (21 << 2), y +  -16.670 * s);
			_setf(o + (22 << 2), x +   33.333 * s);
			_setf(o + (23 << 2), y +  -33.330 * s);
			_setf(o + (24 << 2), x +  116.665 * s);
			_setf(o + (25 << 2), y +  -33.330 * s);
			_setf(o + (26 << 2), x +  116.665 * s);
			_setf(o + (27 << 2), y +  -50.000 * s);
			_setf(o + (28 << 2), x +   33.333 * s);
			_setf(o + (29 << 2), y +  -50.000 * s);
			_setf(o + (30 << 2), x +  133.332 * s);
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
			
			case 117:
			
			o = _posf(20);
			_setf(o + ( 0 << 2), x +   99.998 * s);
			_setf(o + ( 1 << 2), y +  -50.000 * s);
			_setf(o + ( 2 << 2), x +   99.998 * s);
			_setf(o + ( 3 << 2), y +  -16.670 * s);
			_setf(o + ( 4 << 2), x +   16.666 * s);
			_setf(o + ( 5 << 2), y +  -16.670 * s);
			_setf(o + ( 6 << 2), x +   16.666 * s);
			_setf(o + ( 7 << 2), y +  -50.000 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -50.000 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +  116.664 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +  116.664 * s);
			_setf(o + (15 << 2), y +  -50.000 * s);
			_setf(o + (16 << 2), x +   99.998 * s);
			_setf(o + (17 << 2), y +  -50.000 * s);
			_setf(o + (18 << 2), x +  133.331 * s);
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
			
			case 118:
			
			o = _posf(26);
			_setf(o + ( 0 << 2), x +   99.998 * s);
			_setf(o + ( 1 << 2), y +  -50.000 * s);
			_setf(o + ( 2 << 2), x +   99.998 * s);
			_setf(o + ( 3 << 2), y +  -16.670 * s);
			_setf(o + ( 4 << 2), x +  116.665 * s);
			_setf(o + ( 5 << 2), y +  -16.670 * s);
			_setf(o + ( 6 << 2), x +  116.665 * s);
			_setf(o + ( 7 << 2), y +  -50.000 * s);
			_setf(o + ( 8 << 2), x +   99.998 * s);
			_setf(o + ( 9 << 2), y +  -50.000 * s);
			_setf(o + (10 << 2), x +   16.666 * s);
			_setf(o + (11 << 2), y +  -16.670 * s);
			_setf(o + (12 << 2), x +   16.666 * s);
			_setf(o + (13 << 2), y +  -50.000 * s);
			_setf(o + (14 << 2), x +       0. * s);
			_setf(o + (15 << 2), y +  -50.000 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   99.998 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   99.998 * s);
			_setf(o + (21 << 2), y +  -16.670 * s);
			_setf(o + (22 << 2), x +   16.666 * s);
			_setf(o + (23 << 2), y +  -16.670 * s);
			_setf(o + (24 << 2), x +  133.331 * s);
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
			
			case 119:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   99.999 * s);
			_setf(o + ( 1 << 2), y +  -50.000 * s);
			_setf(o + ( 2 << 2), x +   99.999 * s);
			_setf(o + ( 3 << 2), y +  -16.670 * s);
			_setf(o + ( 4 << 2), x +   66.666 * s);
			_setf(o + ( 5 << 2), y +  -16.670 * s);
			_setf(o + ( 6 << 2), x +   66.666 * s);
			_setf(o + ( 7 << 2), y +  -50.000 * s);
			_setf(o + ( 8 << 2), x +   50.000 * s);
			_setf(o + ( 9 << 2), y +  -50.000 * s);
			_setf(o + (10 << 2), x +   50.000 * s);
			_setf(o + (11 << 2), y +  -16.670 * s);
			_setf(o + (12 << 2), x +   16.667 * s);
			_setf(o + (13 << 2), y +  -16.670 * s);
			_setf(o + (14 << 2), x +   16.667 * s);
			_setf(o + (15 << 2), y +  -50.000 * s);
			_setf(o + (16 << 2), x +       0. * s);
			_setf(o + (17 << 2), y +  -50.000 * s);
			_setf(o + (18 << 2), x +       0. * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +  116.665 * s);
			_setf(o + (21 << 2), y +       0. * s);
			_setf(o + (22 << 2), x +  116.665 * s);
			_setf(o + (23 << 2), y +  -50.000 * s);
			_setf(o + (24 << 2), x +   99.999 * s);
			_setf(o + (25 << 2), y +  -50.000 * s);
			_setf(o + (26 << 2), x +  133.332 * s);
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
			
			case 120:
			
			o = _posf(52);
			_setf(o + ( 0 << 2), x +   99.998 * s);
			_setf(o + ( 1 << 2), y +  -66.670 * s);
			_setf(o + ( 2 << 2), x +   99.998 * s);
			_setf(o + ( 3 << 2), y +  -41.670 * s);
			_setf(o + ( 4 << 2), x +  116.664 * s);
			_setf(o + ( 5 << 2), y +  -41.670 * s);
			_setf(o + ( 6 << 2), x +  116.664 * s);
			_setf(o + ( 7 << 2), y +  -66.670 * s);
			_setf(o + ( 8 << 2), x +   99.998 * s);
			_setf(o + ( 9 << 2), y +  -66.670 * s);
			_setf(o + (10 << 2), x +   99.998 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +  116.664 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +  116.664 * s);
			_setf(o + (15 << 2), y +  -25.000 * s);
			_setf(o + (16 << 2), x +   99.998 * s);
			_setf(o + (17 << 2), y +  -25.000 * s);
			_setf(o + (18 << 2), x +   99.998 * s);
			_setf(o + (19 << 2), y +       0. * s);
			_setf(o + (20 << 2), x +   16.666 * s);
			_setf(o + (21 << 2), y +  -41.670 * s);
			_setf(o + (22 << 2), x +   16.666 * s);
			_setf(o + (23 << 2), y +  -25.000 * s);
			_setf(o + (24 << 2), x +   99.998 * s);
			_setf(o + (25 << 2), y +  -25.000 * s);
			_setf(o + (26 << 2), x +   99.998 * s);
			_setf(o + (27 << 2), y +  -41.670 * s);
			_setf(o + (28 << 2), x +   16.666 * s);
			_setf(o + (29 << 2), y +  -41.670 * s);
			_setf(o + (30 << 2), x +   16.666 * s);
			_setf(o + (31 << 2), y +  -66.670 * s);
			_setf(o + (32 << 2), x +       0. * s);
			_setf(o + (33 << 2), y +  -66.670 * s);
			_setf(o + (34 << 2), x +       0. * s);
			_setf(o + (35 << 2), y +  -41.670 * s);
			_setf(o + (36 << 2), x +   16.666 * s);
			_setf(o + (37 << 2), y +  -41.670 * s);
			_setf(o + (38 << 2), x +   16.666 * s);
			_setf(o + (39 << 2), y +  -66.670 * s);
			_setf(o + (40 << 2), x +       0. * s);
			_setf(o + (41 << 2), y +  -25.000 * s);
			_setf(o + (42 << 2), x +       0. * s);
			_setf(o + (43 << 2), y +       0. * s);
			_setf(o + (44 << 2), x +   16.666 * s);
			_setf(o + (45 << 2), y +       0. * s);
			_setf(o + (46 << 2), x +   16.666 * s);
			_setf(o + (47 << 2), y +  -25.000 * s);
			_setf(o + (48 << 2), x +       0. * s);
			_setf(o + (49 << 2), y +  -25.000 * s);
			_setf(o + (50 << 2), x +  133.331 * s);
			_setf(o + (51 << 2), y +       0. * s);
			o = _posb(26);
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
			_setb(o + 11, 2);
			_setb(o + 12, 2);
			_setb(o + 13, 2);
			_setb(o + 14, 2);
			_setb(o + 15, 1);
			_setb(o + 16, 2);
			_setb(o + 17, 2);
			_setb(o + 18, 2);
			_setb(o + 19, 2);
			_setb(o + 20, 1);
			_setb(o + 21, 2);
			_setb(o + 22, 2);
			_setb(o + 23, 2);
			_setb(o + 24, 2);
			_setb(o + 25, 1);
			
			case 121:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   99.998 * s);
			_setf(o + ( 1 << 2), y +  -50.000 * s);
			_setf(o + ( 2 << 2), x +   99.998 * s);
			_setf(o + ( 3 << 2), y +  -25.000 * s);
			_setf(o + ( 4 << 2), x +   16.666 * s);
			_setf(o + ( 5 << 2), y +  -25.000 * s);
			_setf(o + ( 6 << 2), x +   16.666 * s);
			_setf(o + ( 7 << 2), y +  -50.000 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -50.000 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +   -8.330 * s);
			_setf(o + (12 << 2), x +   99.998 * s);
			_setf(o + (13 << 2), y +   -8.330 * s);
			_setf(o + (14 << 2), x +   99.998 * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   16.666 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   16.666 * s);
			_setf(o + (19 << 2), y +   16.670 * s);
			_setf(o + (20 << 2), x +  116.665 * s);
			_setf(o + (21 << 2), y +   16.670 * s);
			_setf(o + (22 << 2), x +  116.665 * s);
			_setf(o + (23 << 2), y +  -50.000 * s);
			_setf(o + (24 << 2), x +   99.998 * s);
			_setf(o + (25 << 2), y +  -50.000 * s);
			_setf(o + (26 << 2), x +  133.331 * s);
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
			
			case 122:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   16.667 * s);
			_setf(o + ( 1 << 2), y +  -66.670 * s);
			_setf(o + ( 2 << 2), x +   16.667 * s);
			_setf(o + ( 3 << 2), y +  -50.000 * s);
			_setf(o + ( 4 << 2), x +   99.999 * s);
			_setf(o + ( 5 << 2), y +  -50.000 * s);
			_setf(o + ( 6 << 2), x +   99.999 * s);
			_setf(o + ( 7 << 2), y +  -41.670 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -41.670 * s);
			_setf(o + (10 << 2), x +       0. * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   99.999 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   99.999 * s);
			_setf(o + (15 << 2), y +  -16.670 * s);
			_setf(o + (16 << 2), x +   16.667 * s);
			_setf(o + (17 << 2), y +  -16.670 * s);
			_setf(o + (18 << 2), x +   16.667 * s);
			_setf(o + (19 << 2), y +  -25.000 * s);
			_setf(o + (20 << 2), x +  116.665 * s);
			_setf(o + (21 << 2), y +  -25.000 * s);
			_setf(o + (22 << 2), x +  116.665 * s);
			_setf(o + (23 << 2), y +  -66.670 * s);
			_setf(o + (24 << 2), x +   16.667 * s);
			_setf(o + (25 << 2), y +  -66.670 * s);
			_setf(o + (26 << 2), x +  133.332 * s);
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
			
			case 123:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   16.666 * s);
			_setf(o + ( 1 << 2), y +  -66.670 * s);
			_setf(o + ( 2 << 2), x +   16.666 * s);
			_setf(o + ( 3 << 2), y +  -41.670 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +  -41.670 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +  -25.000 * s);
			_setf(o + ( 8 << 2), x +   16.666 * s);
			_setf(o + ( 9 << 2), y +  -25.000 * s);
			_setf(o + (10 << 2), x +   16.666 * s);
			_setf(o + (11 << 2), y +       0. * s);
			_setf(o + (12 << 2), x +   49.999 * s);
			_setf(o + (13 << 2), y +       0. * s);
			_setf(o + (14 << 2), x +   49.999 * s);
			_setf(o + (15 << 2), y +  -16.670 * s);
			_setf(o + (16 << 2), x +   33.332 * s);
			_setf(o + (17 << 2), y +  -16.670 * s);
			_setf(o + (18 << 2), x +   33.332 * s);
			_setf(o + (19 << 2), y +  -50.000 * s);
			_setf(o + (20 << 2), x +   49.999 * s);
			_setf(o + (21 << 2), y +  -50.000 * s);
			_setf(o + (22 << 2), x +   49.999 * s);
			_setf(o + (23 << 2), y +  -66.670 * s);
			_setf(o + (24 << 2), x +   16.666 * s);
			_setf(o + (25 << 2), y +  -66.670 * s);
			_setf(o + (26 << 2), x +   66.665 * s);
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
			
			case 124:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.670 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +       0. * s);
			_setf(o + ( 4 << 2), x +   16.667 * s);
			_setf(o + ( 5 << 2), y +       0. * s);
			_setf(o + ( 6 << 2), x +   16.667 * s);
			_setf(o + ( 7 << 2), y +  -66.670 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -66.670 * s);
			_setf(o + (10 << 2), x +   33.333 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
			
			case 125:
			
			o = _posf(28);
			_setf(o + ( 0 << 2), x +   33.333 * s);
			_setf(o + ( 1 << 2), y +  -41.670 * s);
			_setf(o + ( 2 << 2), x +   33.333 * s);
			_setf(o + ( 3 << 2), y +  -66.670 * s);
			_setf(o + ( 4 << 2), x +       0. * s);
			_setf(o + ( 5 << 2), y +  -66.670 * s);
			_setf(o + ( 6 << 2), x +       0. * s);
			_setf(o + ( 7 << 2), y +  -50.000 * s);
			_setf(o + ( 8 << 2), x +   16.666 * s);
			_setf(o + ( 9 << 2), y +  -50.000 * s);
			_setf(o + (10 << 2), x +   16.666 * s);
			_setf(o + (11 << 2), y +  -16.670 * s);
			_setf(o + (12 << 2), x +       0. * s);
			_setf(o + (13 << 2), y +  -16.670 * s);
			_setf(o + (14 << 2), x +       0. * s);
			_setf(o + (15 << 2), y +       0. * s);
			_setf(o + (16 << 2), x +   33.333 * s);
			_setf(o + (17 << 2), y +       0. * s);
			_setf(o + (18 << 2), x +   33.333 * s);
			_setf(o + (19 << 2), y +  -25.000 * s);
			_setf(o + (20 << 2), x +   49.999 * s);
			_setf(o + (21 << 2), y +  -25.000 * s);
			_setf(o + (22 << 2), x +   49.999 * s);
			_setf(o + (23 << 2), y +  -41.670 * s);
			_setf(o + (24 << 2), x +   33.333 * s);
			_setf(o + (25 << 2), y +  -41.670 * s);
			_setf(o + (26 << 2), x +   66.666 * s);
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
			
			case 126:
			
			o = _posf(12);
			_setf(o + ( 0 << 2), x +       0. * s);
			_setf(o + ( 1 << 2), y +  -66.670 * s);
			_setf(o + ( 2 << 2), x +       0. * s);
			_setf(o + ( 3 << 2), y +  -50.000 * s);
			_setf(o + ( 4 << 2), x +   49.999 * s);
			_setf(o + ( 5 << 2), y +  -50.000 * s);
			_setf(o + ( 6 << 2), x +   49.999 * s);
			_setf(o + ( 7 << 2), y +  -66.670 * s);
			_setf(o + ( 8 << 2), x +       0. * s);
			_setf(o + ( 9 << 2), y +  -66.670 * s);
			_setf(o + (10 << 2), x +   66.665 * s);
			_setf(o + (11 << 2), y +       0. * s);
			o = _posb(6);
			_setb(o +  0, 1);
			_setb(o +  1, 2);
			_setb(o +  2, 2);
			_setb(o +  3, 2);
			_setb(o +  4, 2);
			_setb(o +  5, 1);
		}
	}
	#end
}