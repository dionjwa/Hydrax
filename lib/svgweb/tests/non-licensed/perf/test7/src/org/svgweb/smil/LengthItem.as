/**
 * Copyright (c) 2006, Sun Microsystems, Inc
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 
 *   * Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   * Redistributions in binary form must reproduce the above
 *     copyright notice, this list of conditions and the following 
 *     disclaimer in the documentation and/or other materials provided 
 *     with the distribution.
 *   * Neither the name of the TimingFramework project nor the names of its
 *     contributors may be used to endorse or promote products derived 
 *     from this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
    
    
package org.svgweb.smil {
    
    /**
     * Struct used to store information about length values.  Specifically,
     * each item stores the "length" (which can be thought of as the time
     * elapsed along the spline path), the "t" value at this length (used to
     * calculate the (x,y) point along the spline), and the "fraction" which
     * is equal to the length divided by the total absolute length of the spline.
     * After we calculate all LengthItems for a give spline, we have a list
     * of entries which can return the t values for fractional lengths from 
     * 0 to 1.
     */
    public class LengthItem {
        private var length:Number;
        private var t:Number;
        private var fraction:Number;
        
        /*
        public function LengthItem(length:Number, t:Number, fraction:Number) {
            this.length = length;
            this.t = t;
            this.fraction = fraction;
        }
        */
    
        public function LengthItem(length:Number, t:Number) {
            this.length = length;
            this.t = t;
        }
        
        public function getLength():Number {
            return length;
        }
        
        public function getT():Number {
            return t;
        }
        
        public function getFraction():Number {
            return fraction;
        }
    
        public function setFraction(totalLength:Number):void {
            fraction = length / totalLength;
        }
    }
}
