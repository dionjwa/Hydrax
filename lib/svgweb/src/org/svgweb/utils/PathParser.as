/*
 Copyright (c) 2009 by contributors:

 * James Hight (http://labs.zavoo.com/)
 * Richard R. Masters
 * Brad Neuberg (http://codinginparadise.org)

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
    public class PathParser
    {
        /**
         * Normalize SVG Path Data into an array we can work with.
         */
        public static function parseSVGPath(data:String):Array {
            // NOTE: This code is very performance sensitive and was 
            // a bottleneck affecting page load; rewritten to not use
            // regular expressions as well as other tricks that were shown
            // to be faster (like caching data.length, parsing right into
            // an array instead of an intermediate string, etc.).
            // Be careful when changing this code without seeing what the
            // performance is before and after. See 
            // Issue 229 for details:
            // "Speedup page load time of MichaelN's static map page on IE"
            // http://code.google.com/p/svgweb/issues/detail?id=229
            
            //var totalTime:int = new Date().getTime();

            data = SVGUnits.trim(data);

            // In the algorithm below, we are doing a few things. It is
            // unfortunately complicated but it was found to be the primary
            // bottleneck when dealing with lots of PATH statements. 
            // We use the charCode since as a number it is much faster than
            // dealing with strings. We test the value against the Unicode
            // values for the numerical and alphabetical ranges for our 
            // commands, which is fast. We also order our IF statements from
            // most common (numbers) to least common (letter commands). Testing
            // also paradoxically found that simply building up another 
            // string is much faster than having an intermediate array; arrays
            // in ActionScript are very slow, and the final split() method 
            // is very fast at producing an array we can work with
            var results:String = '';
            var dataLength:int = data.length; // found to be faster
            var c:String;
            var code:Number;
            var i:int = 0;
            while (i < dataLength) {
                code = data.charCodeAt(i);

                // from most common to least common encountered
                
               if ((code >= 48 && code <= 57) || code == 45 || code == 46 || code == 43) {
                    // start of a number 0..9, -, ., +
                    var period:Number = 46;  // used to terminate on encountering a second '.'
                    // a sequence like 1.234.456 or 1..2 is valid
                    // equvalent to 1.234 .567 or 1. .2
                    do {
                        if (code == 46) period = 34;  // change to '"' so loop stops on next '.'
                        results += data.charAt(i);
                        i++;
                        code = data.charCodeAt(i);
                    } while (code && ((code >= 48 && code <= 57) || code == period));
                    // check for exponent e or E
                    // assume never have a number starting with -e or .e or +e
                    if (code && (code == 101 || code == 69)) {
                        results += 'e';
                        i++;
                        code = data.charCodeAt(i);
                        if (code && (code == 43 || code == 45)) {
                            // optional +/-
                            results += data.charAt(i);
                            i++;
                            code = data.charCodeAt(i);
                        }
                        while (code && (code >= 48 && code <= 57)) {
                            // collect a digit-sequence
                            results += data.charAt(i);
                            i++;
                            code = data.charCodeAt(i);
                        }
                    }
                    results += ',';
                } else if (code == 44 || code == 32 || code == 10 || code == 13) {
                    // just ignore delimiters since we are adding in our own
                    // in the correct places
                    i++;
                } else if (code >= 65 && code <= 122) {
                    // A-Z and a-z
                    results += data.charAt(i) + ',';
                    i++;
                } else {
                    // unknown/unexpected character
                    i++;
                }
            }
            
            // remove trailing comma, but outside of big loop above
            if (results.charAt(results.length - 1) == ',') {
                results = results.substring(0, results.length - 1);
            }
            
            return results.split(',');
        }
    }
}
