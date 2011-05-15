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
        
        /**
         * Remove the numeric value of string will all characters removed except '0-9', '.', and '-'
         * 
         * @param String to be cleaned
         * 
         * @return Numeric value of string will all characters removed except '0-9', '.', and '-'
         **/
        static public function cleanNumber(num:*):Number {
            return SVGColors.cleanNumber(num);
        }
        
        // Convert number to seconds
        static public function parseTimeVal(timeVal:String):Number {
            if (timeVal.indexOf("ms") != -1) {
                return SVGColors.cleanNumber(timeVal) / 1000;
            }
            else {
                return SVGColors.cleanNumber(timeVal);
            }
        }
    }
}
