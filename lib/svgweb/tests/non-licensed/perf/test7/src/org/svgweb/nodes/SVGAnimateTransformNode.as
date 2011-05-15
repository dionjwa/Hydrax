/*
 Copyright (c) 2009 by contributors:

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

package org.svgweb.nodes
{
    import org.svgweb.core.SVGNode;
    import org.svgweb.utils.SVGColors;
    import org.svgweb.utils.SVGUnits;
    import org.svgweb.smil.TimeInterval;
    import flash.geom.Matrix;

    public class SVGAnimateTransformNode extends SVGAnimateNode
    {
        protected var typeParameter:String;

        public function SVGAnimateTransformNode(svgRoot:SVGSVGNode, xml:XML,
                                                original:SVGNode = null):void {
                super(svgRoot, xml, original);
        } 

        override public function getAnimValue():String {
            return null;
        }

        public function getAnimTransform():Matrix {
            var parts:Array;
            var fromX:String;
            var fromY:String;
            var fromXVal:Number;
            var fromYVal:Number;
            var transformMatrix:Matrix;
            var toX:String;
            var toY:String;
            var toXVal:Number;
            var toYVal:Number;
            var animX:Number;
            var animY:Number;

            if (attributeName != "transform") {
                return null;
            }
            if (typeParameter == null) {
                return null;
            }
            var interval:TimeInterval = getEffectiveInterval();
            if (interval == null) {
                return null;
            }

            var repeatFraction:Number = interval.getRepeatIntervalFraction(lastDocTime, this);

            var fromString:String; 
            var toString:String; 
            var keyTimeIndex:Number = 0;
            var keyTimeFraction:Number = repeatFraction;
            if (valuesParameter != null) {
                fromString = fromParameter;
                toString = toParameter;
                keyTimeIndex = getKeyTimeIndex(repeatFraction);
                keyTimeFraction = getKeyTimeFraction(repeatFraction);
                fromString = getKeyTimeValue(keyTimeIndex);
                toString = getKeyTimeValue(keyTimeIndex + 1);
            }
            else {
                fromString = fromParameter;
                toString = toParameter;
            }
            var keyTimeSpline:String = getKeyTimeSpline(keyTimeIndex);
            fromString = fromString.replace(/,/sg," "); //Replace commas with spaces
            toString = toString.replace(/,/sg," "); //Replace commas with spaces
            if (typeParameter == "translate") {
                // Parse From
                parts = SVGColors.trim(fromString).split(/\s+/);
                fromX = parts[0];
                fromY = "0";
                if (parts.length == 2) {
                    fromY = parts[1];
                }
                fromXVal = SVGUnits.cleanNumber(fromX);
                fromYVal = SVGUnits.cleanNumber(fromY);

                // Parse To
                parts = SVGColors.trim(toString).split(/\s+/);
                toX = parts[0];
                toY = "0";
                if (parts.length == 2) {
                    toY = parts[1];
                }
                toXVal = SVGUnits.cleanNumber(toX);
                toYVal = SVGUnits.cleanNumber(toY);

                animX = interpolate(fromXVal, toXVal,
                                               keyTimeFraction, keyTimeSpline);
                animY = interpolate(fromYVal, toYVal,
                                               keyTimeFraction, keyTimeSpline);
                transformMatrix = new Matrix();
                transformMatrix.translate(animX, animY);
                return transformMatrix;
                // XXX create a matrix directly
                //return parseTransform("translate("+animX+","+animY+")");
            }

            if (typeParameter == "scale") {
                // Parse From
                parts = SVGColors.trim(fromString).split(/\s+/);
                fromX = parts[0];
                fromY = parts[0];
                if (parts.length == 2) {
                    fromY = parts[1];
                }
                fromXVal = SVGUnits.cleanNumber(fromX);
                fromYVal = SVGUnits.cleanNumber(fromY);

                // Parse To
                parts = SVGColors.trim(toString).split(/\s+/);
                toX = parts[0];
                toY = parts[0];
                if (parts.length == 2) {
                    toY = parts[1];
                }
                toXVal = SVGUnits.cleanNumber(toX);
                toYVal = SVGUnits.cleanNumber(toY);

                animX = interpolate(fromXVal, toXVal,
                                               keyTimeFraction, keyTimeSpline);
                animY = interpolate(fromYVal, toYVal,
                                               keyTimeFraction, keyTimeSpline);
                transformMatrix = new Matrix();
                transformMatrix.scale(animX, animY);
                return transformMatrix;
            }

            if (typeParameter == "rotate") {
                var toCX:String = "0";
                var toCY:String = "0";

                // Parse From
                parts = SVGColors.trim(fromString).split(/\s+/);
                var fromAngleString:String = parts[0];
                var fromCXString:String = "0";
                var fromCYString:String = "0";
                if (parts.length >= 2) {
                    fromCXString = parts[1];
                }
                if (parts.length >= 3) {
                    fromCYString = parts[2];
                }
                var fromAngleVal:Number = SVGUnits.cleanNumber(fromAngleString);
                var fromCXVal:Number = SVGUnits.cleanNumber(fromCXString);
                var fromCYVal:Number = SVGUnits.cleanNumber(fromCYString);

                // Parse To
                parts = SVGColors.trim(toString).split(/\s+/);
                var toAngleString:String = parts[0];
                var toCXString:String = "0";
                var toCYString:String = "0";
                if (parts.length >= 2) {
                    toCXString = parts[1];
                }
                if (parts.length >= 3) {
                    toCYString = parts[2];
                }
                var toAngleVal:Number = SVGUnits.cleanNumber(toAngleString);
                var toCXVal:Number = SVGUnits.cleanNumber(toCXString);
                var toCYVal:Number = SVGUnits.cleanNumber(toCYString);

                var animAngle:Number = interpolate(fromAngleVal, toAngleVal,
                                                    keyTimeFraction, keyTimeSpline);
                var animCX:Number = interpolate(fromCXVal, toCXVal,
                                                    keyTimeFraction, keyTimeSpline);
                var animCY:Number = interpolate(fromCYVal, toCYVal,
                                                    keyTimeFraction, keyTimeSpline);
                transformMatrix = new Matrix();
                transformMatrix.translate(-animCX, -animCY);
                transformMatrix.rotate(animAngle * Math.PI / 180.0);
                transformMatrix.translate(animCX, animCY);
                return transformMatrix;
            }

            // XXX not implemented
            if (typeParameter == "skewX") {
                return new Matrix();
            }

            // XXX not implemented
            if (typeParameter == "skewY") {
                return new Matrix();
            }

            return null;
        }

        public function getTransformType():String {
             return typeParameter;
        }

        override protected function parseParameters():void {
            this.parseTypeParameter();
            super.parseParameters();
        }

        protected function parseTypeParameter():void {
             typeParameter = this.getAttribute('type', null);
        }

        override protected function parseFromParameter():void {
             fromParameter = this.getAttribute('from', null);
             if (fromParameter == null) {
                 if (attributeName != null) {
                     if (typeParameter == "translate") {
                         fromParameter = "0 0"
                     }
                     if (typeParameter == "scale") {
                         fromParameter = "1 1"
                     }
                     if (typeParameter == "rotate") {
                         fromParameter = "0"
                     }
                     if (typeParameter == "skewX") {
                         fromParameter = "0"
                     }
                     if (typeParameter == "skewY") {
                         fromParameter = "0"
                     }
                 }
             }
        }
       
    }
}
