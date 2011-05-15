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
    import org.svgweb.utils.SVGUnits;
    import flash.geom.Matrix;

    public class SVGAnimateTransformNode extends SVGAnimateNode
    {
        protected var typeParameter:String;
        protected var animMatrix:Matrix;

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
            if (!isEffective()) return(null);
            if (frozen) return animMatrix;
            frozen = !this.active;
            var repeatFraction:Number = getRepeatIntervalFraction(lastDocTime);
            var fromString:String; 
            var toString:String; 
            var keyTimeIndex:Number = 0;
            var keyTimeFraction:Number = repeatFraction;
            if (valuesParameter != null) {
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
                parts = SVGUnits.trim(fromString).split(/\s+/);
                fromX = parts[0];
                fromY = "0";
                if (parts.length == 2) {
                    fromY = parts[1];
                }
                fromXVal = SVGUnits.parseNum(fromX);
                fromYVal = SVGUnits.parseNum(fromY);

                // Parse To
                parts = SVGUnits.trim(toString).split(/\s+/);
                toX = parts[0];
                toY = "0";
                if (parts.length == 2) {
                    toY = parts[1];
                }
                toXVal = SVGUnits.parseNum(toX);
                toYVal = SVGUnits.parseNum(toY);

                animX = interpolate(fromXVal, toXVal,
                                               keyTimeFraction, keyTimeSpline);
                animY = interpolate(fromYVal, toYVal,
                                               keyTimeFraction, keyTimeSpline);
                transformMatrix = new Matrix();
                transformMatrix.translate(animX, animY);
                animMatrix = transformMatrix;
                return transformMatrix;
                // XXX create a matrix directly
                //return parseTransform("translate("+animX+","+animY+")");
            }

            if (typeParameter == "scale") {
                // Parse From
                parts = SVGUnits.trim(fromString).split(/\s+/);
                fromX = parts[0];
                fromY = parts[0];
                if (parts.length == 2) {
                    fromY = parts[1];
                }
                fromXVal = SVGUnits.parseNum(fromX);
                fromYVal = SVGUnits.parseNum(fromY);

                // Parse To
                parts = SVGUnits.trim(toString).split(/\s+/);
                toX = parts[0];
                toY = parts[0];
                if (parts.length == 2) {
                    toY = parts[1];
                }
                toXVal = SVGUnits.parseNum(toX);
                toYVal = SVGUnits.parseNum(toY);

                animX = interpolate(fromXVal, toXVal,
                                               keyTimeFraction, keyTimeSpline);
                animY = interpolate(fromYVal, toYVal,
                                               keyTimeFraction, keyTimeSpline);
                transformMatrix = new Matrix();
                transformMatrix.scale(animX, animY);
                animMatrix = transformMatrix;
                return transformMatrix;
            }

            if (typeParameter == "rotate") {
                var toCX:String = "0";
                var toCY:String = "0";

                // Parse From
                parts = SVGUnits.trim(fromString).split(/\s+/);
                var fromAngleString:String = parts[0];
                var fromCXString:String = "0";
                var fromCYString:String = "0";
                if (parts.length >= 2) {
                    fromCXString = parts[1];
                }
                if (parts.length >= 3) {
                    fromCYString = parts[2];
                }
                var fromAngleVal:Number = SVGUnits.parseNum(fromAngleString);
                var fromCXVal:Number = SVGUnits.parseNum(fromCXString);
                var fromCYVal:Number = SVGUnits.parseNum(fromCYString);

                // Parse To
                parts = SVGUnits.trim(toString).split(/\s+/);
                var toAngleString:String = parts[0];
                var toCXString:String = "0";
                var toCYString:String = "0";
                if (parts.length >= 2) {
                    toCXString = parts[1];
                }
                if (parts.length >= 3) {
                    toCYString = parts[2];
                }
                var toAngleVal:Number = SVGUnits.parseNum(toAngleString);
                var toCXVal:Number = SVGUnits.parseNum(toCXString);
                var toCYVal:Number = SVGUnits.parseNum(toCYString);

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
                animMatrix = transformMatrix;
                return transformMatrix;
            }

            // XXX not implemented
            if (typeParameter == "skewX") {
                animMatrix.identity();
                return new Matrix();
            }

            // XXX not implemented
            if (typeParameter == "skewY") {
                animMatrix.identity();
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
       
        static protected function getParameterValues(param:String):Array {
            var parts:Array;
            var values:Array = new Array();
            parts = SVGUnits.trim(param).split(/\s+/);
            for each (var part:String in parts) {
                values.push(SVGUnits.parseNum(part));
            }
            return(values);
        }

        override protected function parseByParameter():void {
            if (toParameter != null) return;  // ignore by if there is a to
            if (valuesParameter != null) return;  // ignore if valuesParameter

            byParameter = this.getAttribute('by', null);
            if (byParameter == null) return;

            // XXX error checks for invalid parameters
            var fromValues:Array = getParameterValues(fromParameter);
            var byValues:Array  = getParameterValues(byParameter);
            // convert by into a to value
            if ((typeParameter == "translate") ||
                (typeParameter == "scale")) {
                if (fromValues.length == 1) fromValues.push(fromValues[0]);
                if (byValues.length == 1) byValues.push(byValues[0]);
                toParameter = String(fromValues[0] + byValues[0]) + " " +
                              String(fromValues[1] + byValues[1]);
                return;
            }
            if (typeParameter == "rotate") {
                byValues[0] += fromValues[0];    //angle
                // copy from <cx cy> if by <cx cy> is missing
                for (var i:uint = byValues.length; i < fromValues.length; i++) {
                    byValues.push(fromValues[i]);
                }
                toParameter = String(byValues[0]);
                if (byValues.length == 3) toParameter += " " + String(byValues[1]) +
                                                         " " + String(byValues[2]);
                return;
            }
            if ((typeParameter == "skewX") || (typeParameter == "skewY")) {
                toParameter = String(fromValues[0] + byValues[0]);
                return;
            }
        }
    }
}
