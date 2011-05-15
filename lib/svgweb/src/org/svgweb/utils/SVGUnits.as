 /*
 Copyright (c) 2009 by contributors:
 
 * Google Inc. (Brad Neuberg -- http://codinginparadise.org)
 * James Hight (http://labs.zavoo.com/)
 * Richard R. Masters
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
*/

package org.svgweb.utils
{    
    import flash.system.Capabilities;
    
    public class SVGUnits
    {
        static public var UNKNOWN:Number = 0;
        static public var USER:Number = 1; /* User coordinates */
        // CSS Unit Types
        static public var EM:Number = 2;
        static public var EX:Number = 3;
        static public var PX:Number = 4;
        static public var PT:Number = 5;
        static public var PC:Number = 6;
        static public var CM:Number = 7;
        static public var MM:Number = 8;
        static public var IN:Number = 9;
        static public var PERCENT:Number = 10; /* Relative percentage; ex: 50% */
        
        /**
         * Determines the type of unit given, such as pixels, points, ems, etc.
         *
         * @param String to check for unit type.
         * 
         * @returns Null if none if the available types, otherwise returns one
         * of the static constants on this class such as SVGUnits.PX, SVGUnits.PT,
         * etc.        
         **/
        static public function getType(unit:*):int {
            if (unit === null || unit === undefined || unit === '') {
                return UNKNOWN;
            }
            
            // FIXME: Handle negative values; the spec says implementations
            // don't have to handle them but should convert them into a usable
            // form
            if (/em\s*$/.test(unit)) {
                return SVGUnits.EM;
            } else if (/ex\s*$/.test(unit)) {
                return SVGUnits.EX;
            } else if (/px\s*$/.test(unit)) {
                return SVGUnits.PX;
            } else if (/pt\s*$/.test(unit)) {
                return SVGUnits.PT;
            } else if (/pc\s*$/.test(unit)) {
                return SVGUnits.PC;
            } else if (/cm\s*$/.test(unit)) {
                return SVGUnits.CM;
            } else if (/mm\s*$/.test(unit)) {
                return SVGUnits.MM;
            } else if (/in\s*$/.test(unit)) {
                return SVGUnits.IN;
            } else if (/^\s*[0-9]+\s*$/.test(unit)) {
                return SVGUnits.USER;
            } else if (/^\s*[0-9]+%\s*$/.test(unit)) {
                return SVGUnits.PERCENT;
            } else {
                return UNKNOWN;
            }
        }
        
        /**
         * Converts a given point value to it's pixel equivalent.
         * 
         * @param Numeric point value to be converted.
         * 
         * @return Numeric pixel value.
         **/
        static public function pointsToPixels(num:Number):Number {
            return num * (Capabilities.screenDPI / 72);
        }
        
        // Convert number to seconds
        static public function parseTimeVal(timeVal:String):Number {
            if (timeVal.indexOf("ms") != -1) {
                return SVGUnits.parseNum(timeVal) / 1000;
            }
            else {
                return SVGUnits.parseNum(timeVal);
            }
        }

        /**
         * Object of colors by name
         **/
        static public var colors:Object = {};
            colors.blue=0x0000ff;
            colors.green=0x008000;
            colors.red=0xff0000;
            colors.aliceblue=0xf0f8ff;
            colors.antiquewhite=0xfaebd7;
            colors.aqua=0x00ffff;
            colors.aquamarine=0x7fffd4;
            colors.azure=0xf0ffff;
            colors.beige=0xf5f5dc;
            colors.bisque=0xffe4c4;
            colors.black=0x000000;
            colors.blanchedalmond=0xffebcd;
            colors.blueviolet=0x8a2be2;
            colors.brown= 0xa52a2a;
            colors.burlywood = 0xdeb887;
            colors.cadetblue = 0x5f9ea0;
            colors.chartreuse = 0x7fff00;
            colors.chocolate = 0xd2691e;
            colors.coral= 0xff7f50;
            colors.cornflowerblue = 0x6495ed;
            colors.cornsilk = 0xfff8dc;
            colors.crimson = 0xdc143c;
            colors.cyan = 0x00ffff;
            colors.darkblue = 0x00008b;
            colors.darkcyan = 0x008b8b;
            colors.darkgoldenrod = 0xb8860b;
            colors.darkgray = 0xa9a9a9;
            colors.darkgreen = 0x006400;
            colors.darkgrey = 0xa9a9a9;
            colors.darkkhaki = 0xbdb76b;
            colors.darkmagenta = 0x8b008b;
            colors.darkolivegreen = 0x556b2f;
            colors.darkorange = 0xff8c00;
            colors.darkorchid = 0x9932cc;
            colors.darkred = 0x8b0000;
            colors.darksalmon = 0xe9967a;
            colors.darkseagreen = 0x8fbc8f;
            colors.darkslateblue = 0x483d8b;
            colors.darkslategray = 0x2f4f4f;
            colors.darkslategrey = 0x2f4f4f;
            colors.darkturquoise = 0x00ced1;
            colors.darkviolet = 0x9400d3;
            colors.deeppink = 0xff1493;
            colors.deepskyblue = 0x00bfff;
            colors.dimgray = 0x696969;
            colors.dimgrey = 0x696969;
            colors.dodgerblue = 0x1e90ff;
            colors.firebrick = 0xb22222;
            colors.floralwhite = 0xfffaf0;
            colors.forestgreen = 0x228b22;
            colors.fuchsia = 0xff00ff;
            colors.gainsboro = 0xdcdcdc;
            colors.ghostwhite = 0xf8f8ff;
            colors.gold = 0xffd700;
            colors.goldenrod = 0xdaa520;
            colors.gray = 0x808080;
            colors.grey = 0x808080;
            colors.greenyellow = 0xadff2f;
            colors.honeydew = 0xf0fff0;
            colors.hotpink = 0xff69b4;
            colors.indianred = 0xcd5c5c;
            colors.indigo = 0x4b0082;
            colors.ivory = 0xfffff0;
            colors.khaki = 0xf0e68c;
            colors.lavender = 0xe6e6fa;
            colors.lavenderblush = 0xfff0f5;
            colors.lawngreen = 0x7cfc00;
            colors.lemonchiffon = 0xfffacd;
            colors.lightblue = 0xadd8e6;
            colors.lightcoral = 0xf08080;
            colors.lightcyan = 0xe0ffff;
            colors.lightgoldenrodyellow = 0xfafad2;
            colors.lightgray = 0xd3d3d3;
            colors.lightgreen = 0x90ee90;
            colors.lightgrey = 0xd3d3d3;
            colors.lightpink = 0xffb6c1;
            colors.lightsalmon = 0xffa07a;
            colors.lightseagreen = 0x20b2aa;
            colors.lightskyblue = 0x87cefa;
            colors.lightslategray = 0x778899;
            colors.lightslategrey = 0x778899;
            colors.lightsteelblue = 0xb0c4de;
            colors.lightyellow = 0xffffe0;
            colors.lime = 0x00ff00;
            colors.limegreen = 0x32cd32;
            colors.linen = 0xfaf0e6;
            colors.magenta = 0xff00ff;
            colors.maroon = 0x800000;
            colors.mediumaquamarine = 0x66cdaa;
            colors.mediumblue = 0x0000cd;
            colors.mediumorchid = 0xba55d3;
            colors.mediumpurple = 0x9370db;
            colors.mediumseagreen = 0x3cb371;
            colors.mediumslateblue = 0x7b68ee;
            colors.mediumspringgreen = 0x00fa9a;
            colors.mediumturquoise = 0x48d1cc;
            colors.mediumvioletred = 0xc71585;
            colors.midnightblue = 0x191970;
            colors.mintcream = 0xf5fffa;
            colors.mistyrose = 0xffe4e1;
            colors.moccasin = 0xffe4b5;
            colors.navajowhite = 0xffdead;
            colors.navy = 0x000080;
            colors.oldlace = 0xfdf5e6;
            colors.olive = 0x808000;
            colors.olivedrab = 0x6b8e23;
            colors.orange = 0xffa500;
            colors.orangered = 0xff4500;
            colors.orchid = 0xda70d6;
            colors.palegoldenrod = 0xeee8aa;
            colors.palegreen = 0x98fb98;
            colors.paleturquoise = 0xafeeee;
            colors.palevioletred = 0xdb7093;
            colors.papayawhip = 0xffefd5;
            colors.peachpuff = 0xffdab9;
            colors.peru = 0xcd853f;
            colors.pink = 0xffc0cb;
            colors.plum = 0xdda0dd;
            colors.powderblue = 0xb0e0e6;
            colors.purple = 0x800080;
            colors.rosybrown = 0xbc8f8f;
            colors.royalblue = 0x4169e1;
            colors.saddlebrown = 0x8b4513;
            colors.salmon = 0xfa8072;
            colors.sandybrown = 0xf4a460;
            colors.seagreen = 0x2e8b57;
            colors.seashell = 0xfff5ee;
            colors.sienna = 0xa0522d;
            colors.silver = 0xc0c0c0;
            colors.skyblue = 0x87ceeb;
            colors.slateblue = 0x6a5acd;
            colors.slategray = 0x708090;
            colors.slategrey = 0x708090;
            colors.snow = 0xfffafa;
            colors.springgreen = 0x00ff7f;
            colors.steelblue = 0x4682b4;
            colors.tan = 0xd2b48c;
            colors.teal = 0x008080;
            colors.thistle = 0xd8bfd8;
            colors.tomato = 0xff6347;
            colors.turquoise = 0x40e0d0;
            colors.violet = 0xee82ee;
            colors.wheat = 0xf5deb3;
            colors.white = 0xffffff;
            colors.whitesmoke = 0xf5f5f5;    
            colors.yellow = 0xffff00;
            colors.yellowgreen = 0x9acd32;
            
        
        static public function rgbToNumber (r:uint, g:uint, b:uint):Number {
            return (r << 16) | (g << 8) | (b);
        }
        
        /**
         * Get the number value of a color string
         * 
         * @param color String value of a color ('black', '#ff0000', etc...)
         * 
         * @return  [ Numeric value of color , opacity ]
         **/
        static public function getColor(color:String):Number {
            var r:int = 0;
            var g:int = 0;
            var b:int = 0;

            if (color != null) {            
                color=color.replace(/ /g, "");
                if(color.match(/^#/)) {
                    // #456 is short for #445566
                    if (color.length == 4) {
                        var rval:String, gval:String, bval:String;
                        rval = color.substr(1,1) + color.substr(1,1);
                        gval = color.substr(2,1) + color.substr(2,1);
                        bval = color.substr(3,1) + color.substr(3,1);
                        color = "#" + rval + gval + bval;
                    }
                    color = color.replace('#', '0x');
                    return parseInt(color);
                }
                else if ( (color.indexOf("rgb") != -1) || color.indexOf("RGB") != -1) {
                    var str:Array = color.replace(/\s|rgb\(|\)/gi, "").split(",");
                    if (str[0].match(/%/)) {
                        str[0]=str[0].replace(/%/g, "");
                        r = str[0];
                        r = r * 255 / 100;
                    }
                    else {
                           r = str[0];
                    }
                    if (str[1].match(/%/)) {
                        str[1]=str[1].replace(/%/g, "");
                        g = str[1];
                        g = g * 255 / 100;
                    }
                    else {
                           g = str[1];
                    }
                    if (str[2].match(/%/)) {
                        str[2]=str[2].replace(/%/g, "");
                        b = str[2];
                        b = b * 255 / 100;
                    }
                    else {
                        b = str[2];
                    }
                    return rgbToNumber(r, g, b);
                   
                }
                else if (colors.hasOwnProperty(color)) {
                    return colors[color];
                }
                else {
                    return Number(color);
                }
            }            
            return 0x000000;
        }
        static public function getColorAndAlpha(color:String):Array {
            var r:int = 0;
            var g:int = 0;
            var b:int = 0;
            var a:Number = 0.0;
            var str:Array;

            if (color != null) {
                color=color.replace(/\s/g, "");
                if(color.match(/^#/)) {
                    // #456 is short for #445566
                    if (color.length == 4) {
                        var rval:String, gval:String, bval:String;
                        rval = color.substr(1,1) + color.substr(1,1);
                        gval = color.substr(2,1) + color.substr(2,1);
                        bval = color.substr(3,1) + color.substr(3,1);
                        color = "#" + rval + gval + bval;
                    }
                    color = color.replace('#', '0x');
                    return [ parseInt(color), 1.0 ];
                }
                else if(color.indexOf("rgba") != -1) {
                    str = color.replace(/\s|rgba\(|\)/g, "").split(",");
                    if (str[0].match(/%/)) {
                        str[0]=str[0].replace(/%/g, "");
                        r = str[0];
                        r = r * 255 / 100;
                    }
                    else {
                           r = str[0];
                    }
                    if (str[1].match(/%/)) {
                        str[1]=str[1].replace(/%/g, "");
                        g = str[1];
                        g = g * 255 / 100;
                    }
                    else {
                           g = str[1];
                    }
                    if (str[2].match(/%/)) {
                        str[2]=str[2].replace(/%/g, "");
                        b = str[2];
                        b = b * 255 / 100;
                    }
                    else {
                        b = str[2];
                    }
                    if (str[3].match(/%/)) {
                        str[3]=str[3].replace(/%/g, "");
                        a = str[3];
                        a = a / 100.0;
                    }
                    else {
                        a = str[3];
                    }
                    return [ rgbToNumber(r, g, b), a ];
                   
                }
                else if(color.indexOf("rgb") != -1) {
                    str = color.replace(/\s|rgb\(|\)/g, "").split(",");
                    if (str[0].match(/%/)) {
                        str[0]=str[0].replace(/%/g, "");
                        r = str[0];
                        r = r * 255 / 100;
                    }
                    else {
                           r = str[0];
                    }
                    if (str[1].match(/%/)) {
                        str[1]=str[1].replace(/%/g, "");
                        g = str[1];
                        g = g * 255 / 100;
                    }
                    else {
                           g = str[1];
                    }
                    if (str[2].match(/%/)) {
                        str[2]=str[2].replace(/%/g, "");
                        b = str[2];
                        b = b * 255 / 100;
                    }
                    else {
                        b = str[2];
                    }
                    return [ rgbToNumber(r, g, b), 1.0 ];
                   
                }
                else if (colors.hasOwnProperty(color)) {
                    return [ colors[color], 1.0 ];
                }
                else {
                    return [ Number(color), 1.0 ];
                }
            }            
            return [ 0x000000, 0.0 ];
        }
                
        /**
         * Remove the numeric value of string will all characters removed except '0-9', '.', and '-'
         * 
         * @param String to be cleaned
         * 
         * @return Numeric value of string will all characters removed except '0-9', '.', and '-'
         **/
        static public function parseNum(num:*):Number {
            if (num == null) {
                return 0;
            }
            var numString:String = String(num);
            if (isColor(numString)) {
                return SVGUnits.getColor(numString);
            }
            numString = numString.replace(/[^0-9\.\-eE]+/sig,'');
            return Number(numString);
        }

        static public function isColor(colorString:String):Boolean {
            if (  colorString.match(/^#/)
                || (colorString.indexOf("rgb") != -1)
                || (colors.hasOwnProperty(colorString)) ) {
                return true;
            }
            else {
                return false;
            }
        }

        // the second parameter is the maximum value to be used for percent values
        static public function parseNumPct(numParam:*, max:Number):Number {
            var numString:String = String(numParam);
            if (numString.match(/%/)) {
                numString=numString.replace(/%/g, "");
                var num:Number = SVGUnits.parseNum(numString);
                num = num * max / 100;
                return num;
            }
            else {
                return SVGUnits.parseNum(numString);
            }
        }
        
        static public function trim(string:String):String {
            if (string) {
                return string.replace(/^\s+/s, '').replace(/\s+$/s, '');            
            }
            return string;        
        }

        // convert a number into a color string value
        static public function colorString(colorVal:Number):String {
            var color:String = colorVal.toString(16);
            while (color.length < 6) {
                color = "0" + color;
            }
            if (color.length > 6) color.slice(color.length-6, color.length);
            color = "#" + color;
            return color;
        }

        static public function addColors(a:Number, b:Number):Number {
            var aR : uint = uint(a) >> 16;
            var aG : uint = ( uint(a) >> 8 ) & 0xff;
            var aB : uint = uint(a) & 0xff;

            var bR : uint = Math.min(aR + ( (uint(b) >> 16) & 0xff), 0xff);
            var bG : uint = Math.min(aG + ( (uint(b) >> 8 ) & 0xff), 0xff);
            var bB : uint = Math.min(aB + (uint(b) & 0xff), 0xff);
            return (bR << 16) | (bG << 8) | bB;
        }

    }
}
