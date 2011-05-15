/*
 Copyright (c) 2009 by contributors:

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

package org.svgweb.nodes
{
    import org.svgweb.utils.SVGUnits;
    import org.svgweb.utils.PathParser;
    import org.svgweb.core.SVGNode;
    import org.svgweb.core.SVGTimedNode;
    import org.svgweb.smil.TimeSpec;
    import org.svgweb.smil.SplineInterpolator;
    import org.svgweb.events.SVGEvent;
    
    import flash.events.Event;
    
    public class SVGAnimateNode extends SVGTimedNode
    {

        protected var targetNode:SVGNode;
        protected var attributeName:String;

        protected var calcModeParameter:String;
        protected var fromParameter:String;
        protected var toParameter:String;
        protected var byParameter:String;
        protected var valuesParameter:String;
        protected var keyTimesParameter:String;
        protected var keySplinesParameter:String;
        protected var fillParameter:String;
        protected var accumulateParameter:String;
        protected var additiveParameter:String;

        protected var keyTimes:Array;
        protected var keySplines:Array;
        protected var numKeyTimes:uint;

        protected var _isAdditive:Boolean = false;
        protected var isAccumulative:Boolean = false;
              
        protected var animValue:String;
        protected var frozen:Boolean = false;
        protected var doInvalidate:Boolean = true;

        public function SVGAnimateNode(svgRoot:SVGSVGNode, xml:XML, original:SVGNode = null):void {
            super(svgRoot, xml, original);
        }
        
        override protected function onSVGDocTimeUpdate(event:Event):void {
            if (!targetNode) {
                parseParameters();
            }
            super.onSVGDocTimeUpdate(event);
            // allow descendents to skip this code below
            // primarily SVGSetNode
            if (!doInvalidate) return;

            // Depending on the type of animation, trigger a redraw
            // or a lesser update
            if (targetNode && this.active) {
                targetNode.invalidateAttribute(attributeName);
            }
        }

        override protected function initialize():void {
            super.initialize();
            if (!targetNode) {
                this.parseParameters();
            }
        }

        override protected function onRemovedFromStage(event:Event):void {
            if (targetNode) {
                targetNode.removeAnimation(this);
            }
            super.onRemovedFromStage(event);
        }

        public function getAnimValue():String {
            if (this.isEffective()) {
                if (frozen) {
                    return animValue;
                }
                frozen = !this.active;
                var repeatFraction:Number = getRepeatIntervalFraction(lastDocTime);
                var fromString:String;
                var toString:String;

                var keyTimeIndex:Number = getKeyTimeIndex(repeatFraction);
                var keyTimeSpline:String = getKeyTimeSpline(keyTimeIndex);
                var keyTimeThreshold:Number = 0.5;
                if (valuesParameter != null) {
                    var keyTimeFraction:Number = getKeyTimeFraction(repeatFraction);
                    fromString = getKeyTimeValue(keyTimeIndex);
                    toString = getKeyTimeValue(keyTimeIndex + 1);
                    keyTimeThreshold = 1.0;
                }
                else {
                    keyTimeFraction = repeatFraction;
                    fromString = getFromParameter();
                    toString = toParameter;
                    keyTimeThreshold = 0.5;
                }
                if ( (fromString == "inherit") || (toString == "inherit")) {
                    var inheritedValue:String = null;
                    if (targetNode && targetNode.svgParent != null) {
                        inheritedValue = targetNode.svgParent.getAttribute(attributeName, null, true, true);
                    }
                    if (fromString == "inherit") fromString = inheritedValue;
                    if (toString == "inherit") toString = inheritedValue;
                    frozen = false;  // force recalculation based on inherited value
                }
                // don't continue if null values
                if ( (fromString == null) || (toString == null)) {
                    animValue = null;
                    return null;
                }
                if(attributeName == 'd') {
                    animValue = getPathAnimValue(fromString, toString, keyTimeFraction, keyTimeThreshold, keyTimeSpline);
                }
                else {
                    animValue = getSingleAnimValue(fromString, toString, keyTimeFraction, keyTimeThreshold, keyTimeSpline);
                }
                return animValue;
            }
            return null;
        }

        protected function getPathAnimValue(fromString:String, toString:String, keyTimeFraction:Number, keyTimeThreshold:Number, keyTimeSpline:String):String {
            var from:Array = PathParser.parseSVGPath(fromString);
            var to:Array = PathParser.parseSVGPath(toString);
            var fromLength:int = from.length;
            var toLength:int = to.length;
            var result:String = '';

            for(var pos:int = 0; pos < fromLength && pos < toLength; ) {
                var command:String = from[pos++];
                var segs:int = 0;
                switch(command) {
                    case "M":
                    case "m":
                        segs = 2;
                        break;
                    case "A":
                    case "a":
                        segs = 7;
                        break;                        
                    case "C":
                    case "c":
                        segs = 6;
                        break;
                    case "S":
                    case "s":
                    case "Q":
                    case "q":
                        segs = 4;
                        break;
                    case "T":
                    case "t":
                    case "L":
                    case "l":
                        segs = 2;
                        break;
                    case "H":
                    case "h":
                    case "V":
                    case "v":
                        segs = 1;
                        break;
                    default:
                        trace("Unknown Segment Type in Anim Value: " + command);
                    case "Z":
                    case "z":
                        segs = 0;
                        break;
                }
                result += command;
                for (var seg:int = 0; seg < segs; seg++) {    
                    result += getSingleAnimValue(from[pos + seg], to[pos + seg], keyTimeFraction, keyTimeThreshold, keyTimeSpline) + ' ';
                }
                pos += segs;
            }
            return result;                                     
        }

        protected function getSingleAnimValue(fromString:String, toString:String, keyTimeFraction:Number, keyTimeThreshold:Number, keyTimeSpline:String):String {
            var previousCount:int;

            var fromVal:Number;
            var toVal:Number;
            var result:String;

            if (calcModeParameter == "discrete") {
                if (accumulateParameter == "sum") {  // assume additive attribute
                    fromVal = SVGUnits.parseNum(fromString);
                    toVal = SVGUnits.parseNum(toString);
                    previousCount = getRepeatIndex(lastDocTime);
                    if (previousCount > 0) {
                        // XXX For "values", should use the last value, not to
                        // XXX complications also from "inherit" - need to keep a running total?
                        fromVal += toVal * previousCount;
                        toVal   += toVal * previousCount;
                    }
                    if (keyTimeFraction >= keyTimeThreshold) {
                        result = String(toVal);
                    }
                    else {
                        result = String(fromVal);
                    }
                }
                else {
                    if (keyTimeFraction >= keyTimeThreshold) {
                        result = toString;
                    }
                    else {
                        result = fromString;
                    }
                }
                return result;
            }

            // from here, everything should be numbers
            fromVal = SVGUnits.parseNum(fromString);
            toVal = SVGUnits.parseNum(toString);
            var isColor:Boolean = false;
            if (SVGUnits.isColor(fromString)
                      && SVGUnits.isColor(toString) ) {
                isColor = true;
            }
            var animVal:Number;
            if (accumulateParameter == "sum") {
                previousCount = getRepeatIndex(lastDocTime);
                if (previousCount > 0) {
                    // XXX For "values", should use the last value, not to
                    fromVal += toVal * previousCount;
                    toVal   += toVal * previousCount;
                }

                animVal = interpolate(fromVal, toVal,
                                          keyTimeFraction, keyTimeSpline,
                                          isColor);
            }
            else {
                animVal = interpolate(fromVal, toVal,
                                          keyTimeFraction, keyTimeSpline,
                                          isColor);
            }
            if (isColor) {  // convert animVal to color string value
                result = SVGUnits.colorString(animVal);
            }
            else { 
                result = String(animVal);
            }
            return result;
        }
        
        // Which key time does the repeatFraction fall at?
        public function getKeyTimeIndex(repeatFraction:Number):uint {
            var i:uint;
            for (i=1; i < keyTimes.length; i++) {
                if (repeatFraction < SVGUnits.parseNum(keyTimes[i])) {
                    return i-1;
                }
            }
            return keyTimes.length - 2;
        }

        public function getKeyTimeSpline(keyTimeIndex:uint):String {
            try{
                if (keySplines[keyTimeIndex] is String) {
                    return keySplines[keyTimeIndex];
                }
                else {
                    return "0 0 1 1";
                }
            } catch (e:Error) { }
            return "0 0 1 1";
        }
        
        // At what fraction of the key time duration does the repeatFraction fall at?
        public function getKeyTimeFraction(repeatFraction:Number):Number {
            var keyIndex:uint = getKeyTimeIndex(repeatFraction);
            var startVal:Number = keyTimes[keyIndex];
            var endVal:Number = keyTimes[keyIndex+1];
            if (endVal == startVal) 
                return 0;
            return (repeatFraction - startVal) / (endVal - startVal);
        }

        public function getKeyTimeValue(keyTimeIndex:uint):String {
            var parts:Array = valuesParameter.split(/;/);
            return SVGUnits.trim(parts[keyTimeIndex]);
        }

        public function isEffective():Boolean {
            if (this.active || (!neverStarted && (fillParameter == "freeze"))) return true;
            return false;
        }

        override protected function timeIntervalStarted(docTime:Number):void {
            super.timeIntervalStarted(docTime);
            frozen = false;
            if (!targetNode) {
                parseParameters();
            }
            if (targetNode) {
                targetNode.activateAnimation(this);
                targetNode.invalidateAttribute(attributeName);
            }
        }

        override protected function timeIntervalEnded(docTime:Number):void {
            super.timeIntervalEnded(docTime);
            if (targetNode) {
                targetNode.invalidateAttribute(attributeName);
            }
        }

        protected function interpolate(fromVal:Number, toVal:Number,
                                       fraction:Number, keySpline:String,
                                       isColor:Boolean = false):Number {
            if (isColor) {
                var fromR : Number = uint(fromVal) >> 16;
                var fromG : Number = ( uint(fromVal) >> 8 ) & 0xff;
                var fromB : Number = uint(fromVal) & 0xff;

                var toR : Number = uint(toVal) >> 16;
                var toG : Number = ( uint(toVal) >> 8 ) & 0xff;
                var toB : Number = uint(toVal) & 0xff;

                var animR:Number = fromR + (toR - fromR) * fraction;
                var animG:Number = fromG + (toG - fromG) * fraction;
                var animB:Number = fromB + (toB - fromB) * fraction;

                return ( (uint(animR) << 16) + (uint(animG) << 8) + uint(animB));
            }
            else {
                if (calcModeParameter == "linear"
                    || (calcModeParameter == "spline" && keySpline == "0 0 1 1")) {
                    return fromVal + (toVal - fromVal) * fraction;
                }
                if (calcModeParameter == "spline") {
                    var splinedFraction:Number = splineInterpolate(fraction, keySpline);
                    return fromVal + (toVal - fromVal) * splinedFraction;
                }
                if (calcModeParameter == "paced") {
                    return fromVal + (toVal - fromVal) * fraction;
                }
            }
            return fromVal + (toVal - fromVal) * fraction;
        }

        protected function splineInterpolate(fraction:Number, keySpline:String):Number {
            var interpolator:Object = SplineInterpolator.getSplineInterpolator(keySpline, this);
            return interpolator.interpolate(fraction, this);
        }
        
        public function getAttributeName():String {
            return attributeName;
        }

        override protected function parseParameters():void {
            super.parseParameters();

            // If we have already parsed the target, do not continue
            if (targetNode) {
                return;
            }

            parseAttributeNameParameter();
            parseHrefParameter();
            parseValuesParameter();
            parseFromParameter();
            parseToParameter();
            parseByParameter();
            parseKeyTimesParameter();
            parseKeySplinesParameter();
            parseFillParameter();
            parseCalcModeParameter();
            parseAccumulateParameter();
            parseAdditiveParameter();
        }

        protected function parseHrefParameter():void {
            var targetID:String = this._xml.@xlink::href;
            if (targetID) {
                if (targetID.match(/^#/)) {
                    targetID = targetID.substr(1);
                    targetNode = this.svgRoot.getNode(targetID);
                }
            }
            else {
                targetID = this._xml.@targetElement;
                if (targetID) {
                    targetNode = this.svgRoot.getNode(targetID);
                }
                else {
                    targetNode = this.svgParent;
                }
            }
            if (targetNode) {
                targetNode.addAnimation(this);
            }
        }

        protected function parseFromParameter():void {
            fromParameter = this._getAttribute('from', null, false, false, false);
            // process null and 'inherit' at getAnimValue
        }

        protected function parseToParameter():void {
            toParameter = this._getAttribute('to', null, false, false, false);
            // process 'inherit' at getAnimValue
        }

        protected function parseByParameter():void {
            if (toParameter != null) return;  // ignore by if there is a to
            if (valuesParameter != null) return;  //ignore if valuesParameter
            // by - only to be used with attributes that support addition
            byParameter = this.getAttribute('by', null);
            // convert into a from-to
            if (byParameter != null) {
                if ( (fromParameter == null) || (fromParameter == "inherit")) {
                    if (SVGUnits.isColor(byParameter)) fromParameter = "#000000";
                    else fromParameter = "0";
                    toParameter = byParameter;
                    _isAdditive = true;  // added to underlying value at getAnimValue
                }
                else {
                    // XXX byParameter could be "inherit"
                    if (SVGUnits.isColor(fromParameter)) {
                        var fromVal:Number = SVGUnits.getColor(fromParameter);
                        var byVal:Number = SVGUnits.getColor(byParameter);
                        var toVal:Number = SVGUnits.addColors(SVGUnits.getColor(fromParameter),
                                                               SVGUnits.getColor(byParameter));
                        toParameter = SVGUnits.colorString(toVal);
                    }
                    else {
                        toParameter = String(SVGUnits.parseNum(fromParameter) +
                                              SVGUnits.parseNum(byParameter));  // assuming additive
                    }
                }
            }
        }

        protected function parseValuesParameter():void {
            valuesParameter = this.getAttribute('values', null);
        }

        protected function parseKeyTimesParameter():void {
            keyTimesParameter = this.getAttribute('keyTimes', null);

            var numValues:uint;
            if (valuesParameter != null) {
                var values:Array = valuesParameter.split(";");
                numValues = values.length;
            }
            else {
                numValues = 2;
            }

            // XXX for calcMode="paced", key times should be computed
            // such that the distance between key times is proportional
            // to the distance between their corresponding values.

            // If there is a values parameter, then we should
            // make sure there are key times for every value
            if (keyTimesParameter == null) {
                keyTimes = new Array();
                keyTimes.push("0");
            }
            else {
                keyTimes = keyTimesParameter.split(/;/);
            }
            if (keyTimes.length < numValues) {
                var numTimesToAdd:uint = numValues - keyTimes.length;
                var lastValueAdded:Number = SVGUnits.parseNum(keyTimes[keyTimes.length-1]);
                var span:Number = 1.0 - lastValueAdded;
                for (var i:uint=1; i <= numTimesToAdd; i++) {
                    keyTimes.push(String(lastValueAdded + span/numTimesToAdd));
                    lastValueAdded += span/numTimesToAdd;
                }
            }
        }

        protected function parseKeySplinesParameter():void {
            keySplinesParameter = this.getAttribute('keySplines', null);
            if (keySplinesParameter == null) {
                keySplines = new Array();
            }
            else {
                keySplines = keySplinesParameter.split(/;/);
            }
        }

        protected function parseAttributeNameParameter():void {
            attributeName = this.getAttribute('attributeName', null);
        }

        protected function parseFillParameter():void {
            fillParameter = this.getAttribute('fill', 'remove');
        }

        protected function parseAdditiveParameter():void {
            additiveParameter = this.getAttribute('additive', 'replace');
            if (additiveParameter == "sum") {
                _isAdditive = true;
            }
        }
        public function isAdditive():Boolean {
            return _isAdditive;
        }

        protected function parseAccumulateParameter():void {
            accumulateParameter = this.getAttribute('accumulate', 'none');
        }

        protected function parseCalcModeParameter():void {
            calcModeParameter = this.getAttribute('calcMode', 'linear');
            // check if calcModeParamter should be discrete
            // (also set accumulateParamter to none)

            if ( valuesParameter != null) {
                // If there is one numeric value then assume numeric
                // if there is one string value, assume discrete
                var values:Array = valuesParameter.split(";");
                for each (var strValue:String in values) {
                    if (strValue == "inherit") {
                        if (targetNode && targetNode.svgParent != null)
                            strValue = targetNode.svgParent.getAttribute(attributeName, null, true, false);
                        if (strValue == null) strValue = "inherit";
                    }
                    if (attributeName == 'd' || SVGUnits.isColor(strValue)) {
                        return;
                    }
                    var keyVal:Number = parseInt(strValue);
                    if (isNaN(keyVal) || keyVal > int.MAX_VALUE || keyVal < int.MIN_VALUE) {
                        calcModeParameter = "discrete";
                        accumulateParameter = "none";
                        return;
                    }
                }
            }
            else {
                // If the values are not colors
                // and the values are not numeric, then they are disrete strings
                var paramString:String;
                if (fromParameter != null) {
                    paramString = fromParameter;
                    if (paramString == "inherit") {
                        if (targetNode && targetNode.svgParent != null)
                            paramString = targetNode.svgParent.getAttribute(attributeName, null, true, false);
                        if (paramString == null) paramString = "inherit";
                    }
                    if (attributeName != 'd' && !SVGUnits.isColor(paramString)) {
                        var fromVal:Number = parseInt(paramString);
                        if ( isNaN(fromVal) || fromVal > int.MAX_VALUE || fromVal < int.MIN_VALUE ) {
                            calcModeParameter = "discrete";
                            accumulateParameter = "none";
                        }
                    }
                }
                if (toParameter != null) {
                    paramString = toParameter;
                    if (paramString == "inherit") {
                        if (targetNode && targetNode.svgParent != null)
                            paramString = targetNode.svgParent.getAttribute(attributeName, null, true, false);
                        if (paramString == null) paramString = "inherit";
                    }
                    if (attributeName != 'd' && !SVGUnits.isColor(paramString)) {
                        var toVal:Number = parseInt(paramString);
                        if ( isNaN(toVal) || toVal > int.MAX_VALUE || toVal < int.MIN_VALUE ) {
                            calcModeParameter = "discrete";
                            accumulateParameter = "none";
                        }
                    }
                }
            }
        }

        protected function getFromParameter():String {
            var result:String = fromParameter;

            if (result != null) return result;
            else if (targetNode) {  // not specified
                result = targetNode.getAttribute(attributeName, null, false, false, false);
            }
            if (result==null) {
                if (ATTRIBUTES_NOT_INHERITED.indexOf(attributeName) != -1) {
                    // return(getDefaultValue(attributeName));
                    return null;
                }
                result = "inherit";
            }
            return result;
        }

        override public function handleAttrChange(name:String, value:String, attrNamespace:String = null):void {
           // override to avoid drawing done in SVGNode.handleAttrChange() 
        }
    }
}
