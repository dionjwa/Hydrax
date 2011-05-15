/*
Copyright (c) 2008 James Hight

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
*/

package org.svgweb.utils {
    
    import flash.utils.ByteArray;
    
    
    public class Base64 {
        private static var lookupTable:Array = new Array( 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 
            'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 
            'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 
            'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', 
            '8', '9', '+', '/');
            
        private static var reverseLookupTable:Object = null;
    
        //first 6 bits 0x3f;
        //second 6 bits 0xfc0;
        //third 6 bits 0x3f00;
        //fourth 6 bits 0xfc0000;
    
        //3 bytes => 4 ascii characters
        //
        //Place three bytes in a 24bit holder
        //Read 6 bits at at time
        //Use "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/" as a lookup table to build string
        //Repeat process
        //zero pad the end if bytes not a multiple of 3 
        //Add a "=" at the end for each padded byte
            
        static public function encode(value:ByteArray):String {
            var data:String = "";
            var count:uint = 0;
            var charCount:uint = 0;
            
            for (var i:uint = 0; i < value.length; i++) {
                var byte:uint;
                count++;
                charCount++;
                
                if (count == 1) {
                    byte = value[i] >> 2;
                    data += lookupTable[byte];
                    
                    byte = (value[i] & 0x03) << 4;
                }
                else if (count == 2) {
                    byte = byte | (value[i] >> 4);
                    data += lookupTable[byte];
                    
                    byte = (value[i] & 0x0f) << 2;
                }
                
                else if (count == 3) {
                    byte = byte | (value[i] >> 6);
                    data += lookupTable[byte];
                    
                    byte = value[i] & 0x3f;
                    data += lookupTable[byte];
                    
                    count = 0;
                }
                
                if (charCount == 64) {
                    data += "\n";
                    charCount = 0;
                }
                
            }
            
            if (count == 1) {
                data += lookupTable[byte];
                data += "==";
            }
            else if (count == 2) {
                data += lookupTable[byte];
                data += "=";
            }
            
            
            return data;
        }
        
        static public function decode(value:String):ByteArray {
            //4 ascii characters => 3 bytes
            
            if (reverseLookupTable == null) {
                createReverseLookupTable();
            }
            
            var data:ByteArray = new ByteArray();
            var tmp:uint;
            var count:uint = 0;
            var char:String;
            var byte:uint;            
                        
            for (var i:uint = 0; i < value.length; i++) {
                
                char = value.charAt(i);
                
                if (char == "=") {
                    data.length--;
                    break;
                }    
                
                if (!reverseLookupTable.hasOwnProperty(char)) {
                    continue;
                }
                
                byte = reverseLookupTable[char];
                                
                count++;
                    
                if (count == 1) {
                    data[data.position] = byte << 2;                                            
                }
                else if (count == 2) {
                    data[data.position] = data[data.position] | byte >> 4;
                    data.position++;
                    data[data.position] = byte << 4;                                              
                }
                
                else if (count == 3) {
                    data[data.position] = data[data.position] | byte >> 2;
                    data.position++
                    data[data.position] = byte << 6;                                              
                }
                else if (count == 4) {
                    data[data.position] = data[data.position] | byte;
                    data.position++   
                    count = 0;                                           
                }
            }
            
            data.position = 0;
            
            return data;
            
        }
        
        private static function createReverseLookupTable():void {
            reverseLookupTable = new Object();
            for (var i:uint; i < lookupTable.length; i++) {
                reverseLookupTable[lookupTable[i]] = i;
            }
        }

    }
}
