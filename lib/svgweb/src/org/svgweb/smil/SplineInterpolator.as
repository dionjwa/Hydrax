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
    
    import flash.geom.Point;
    import org.svgweb.utils.SVGUnits;
    import org.svgweb.core.SVGNode;
    
    /**
     * This class interpolates fractional values using Bezier splines.  The anchor
     * points for the spline are assumed to be (0, 0) and (1, 1).  Control points
     * should all be in the range [0, 1].
     * <p>
     * For more information on how splines are used to interpolate, refer to the
     * SMIL specification at http://w3c.org.
     * <p>
     * This class provides one simple built-in facility for non-linear
     * interpolation.  Applications are free to define their own Interpolator
     * implementation and use that instead when particular non-linear
     * effects are desired.
     *
     * @author Chet
     *
     * Ported to ActionScript by Rick Masters
     *
     */
    public class SplineInterpolator {
    
        // Note: (x0,y0) and (x1,y1) are implicitly (0, 0) and (1,1) respectively
        private var x1:Number, y1:Number, x2:Number, y2:Number;
        private var lengths:Array = new Array();

        static protected var cachedSplines:Object = new Object();

        static public function getSplineInterpolator(keySpline:String, node:SVGNode):Object {
            keySpline = keySpline.replace(/,/sg," "); //Replace commas with spaces
            if (cachedSplines[keySpline] is SplineInterpolator) {
                 return cachedSplines[keySpline];
            }
            else {
                var points:Array = keySpline.split(/\s+/);//Split by white space
                var x1:Number = SVGUnits.parseNum(points[0]);
                var y1:Number = SVGUnits.parseNum(points[1]);
                var x2:Number = SVGUnits.parseNum(points[2]);
                var y2:Number = SVGUnits.parseNum(points[3]);

                cachedSplines[keySpline] = new SplineInterpolator(x1,y1,x2,y2,node);
                return cachedSplines[keySpline];
            }
        }
        
        /**
         * Creates a new instance of SplineInterpolator with the control points
         * defined by (x1, y1) and (x2, y2).  The anchor points are implicitly
         * defined as (0, 0) and (1, 1).
         * 
         * @throws IllegalArgumentException This exception is thrown when values
         * beyond the allowed [0,1] range are passed in
         */
        public function SplineInterpolator(x1:Number,y1:Number,
                                           x2:Number,y2:Number,node:SVGNode) {
            var lengthItem:LengthItem;

            this.x1 = x1;
            this.y1 = y1;
            this.x2 = x2;
            this.y2 = y2;

            // Now contruct the array of all lengths to t in [0, 1.0]
            var prevX:Number = 0.0;
            var prevY:Number = 0.0;
            var prevLength:Number = 0.0; // cumulative length
            for (var t:Number = 0.01; t <= 1.0; t += .01) {
                var xy:Point = getXY(t);
                var length:Number = prevLength + 
                        Math.sqrt( (xy.x - prevX) * (xy.x - prevX) + 
                                   (xy.y - prevY) * (xy.y - prevY));
                lengthItem = new LengthItem(length, t);
                lengths.push(lengthItem);
                prevLength = length;
                prevX = xy.x;
                prevY = xy.y;
            }
            // Now calculate the fractions so that we can access the lengths
            // array with values in [0,1].  prevLength now holds the total
            // length of the spline.
            for (var i:Number = 0; i < lengths.length; ++i) {
                lengthItem = lengths[i];
                lengthItem.setFraction(prevLength);
            }
        }
        
        /**
         * Calculates the XY point for a given t value.
         *
         * The general spline equation is:
         *   x = b0*x0 + b1*x1 + b2*x2 + b3*x3
         *   y = b0*y0 + b1*y1 + b2*y2 + b3*y3
         * where:
         *   b0 = (1-t)^3
         *   b1 = 3 * t * (1-t)^2
         *   b2 = 3 * t^2 * (1-t)
         *   b3 = t^3
         * We know that (x0,y0) == (0,0) and (x1,y1) == (1,1) for our splines,
         * so this simplifies to:
         *   x = b1*x1 + b2*x2 + b3
         *   y = b1*x1 + b2*x2 + b3
         * @param t parametric value for spline calculation
         */
        private function getXY(t:Number):Point {
            var xy:Point;
            var invT:Number = (1 - t);
            var b1:Number = 3 * t * (invT * invT);
            var b2:Number = 3 * (t * t) * invT;
            var b3:Number = t * t * t;
            xy = new Point(
                    (b1 * x1) + (b2 * x2) + b3,
                    (b1 * y1) + (b2 * y2) + b3);
            return xy;
        }
        
        /**
         * Utility function: When we are evaluating the spline, we only care
         * about the Y values.  See {@link getXY getXY} for the details.
         */
        private function getY(t:Number):Number {
            var xy:Point;
            var invT:Number = (1 - t);
            var b1:Number = 3 * t * (invT * invT);
            var b2:Number = 3 * (t * t) * invT;
            var b3:Number = t * t * t;
            return (b1 * y1) + (b2 * y2) + b3;
        }
        
        /**
         * Given a fraction of time along the spline (which we can interpret
         * as the length along a spline), return the interpolated value of the
         * spline.  We first calculate the t value for the length (by doing
         * a lookup in our array of previousloy calculated values and then
         * linearly interpolating between the nearest values) and then
         * calculate the Y value for this t.
         * @param lengthFraction Fraction of time in a given time interval.
         * @return interpolated fraction between 0 and 1
         */
        public function interpolate(lengthFraction:Number, node:SVGNode):Number {
            // TODO: speed this up with binary search
            var interpolatedT:Number = 1.0;
            var prevT:Number = 0.0;
            var prevLength:Number = 0.0;
            //return lengthFraction;
            for (var i:Number = 0; i < lengths.length; ++i) {
                var lengthItem:LengthItem = lengths[i];
                var fraction:Number = lengthItem.getFraction();
                var t:Number = lengthItem.getT();
                if (lengthFraction <= fraction) {
                    // answer lies between last item and this one
                    var proportion:Number = (lengthFraction - prevLength) /
                                            (fraction - prevLength);
                    interpolatedT = prevT + proportion * (t - prevT);
                    return getY(interpolatedT);
                }
                prevLength = fraction;
                prevT = t;
            }        
            return getY(interpolatedT);
        }
    }   
}
