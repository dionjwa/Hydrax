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
    import org.svgweb.utils.SVGColors;
    import org.svgweb.core.SVGNode;
    import org.svgweb.core.SVGTimedNode;
    import org.svgweb.smil.TimeInterval;
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
              
        public function SVGAnimateNode(svgRoot:SVGSVGNode, xml:XML, original:SVGNode = null):void {
            super(svgRoot, xml, original);
        }
        
        override protected function onSVGDocTimeUpdate(event:Event):void {
            super.onSVGDocTimeUpdate(event);

            // Depending on the type of animation, trigger a redraw
            // or just a transform update
            if (targetNode && this.isActive()) {
                switch (attributeName) {
                    case 'transform':
                    case 'viewBox':
                    case 'x':
                    case 'y':
                    case 'rotation':
                        targetNode.transformNode();
                        targetNode.applyViewBox();
                        break;
                    default:
                        targetNode.invalidateDisplay();
                        targetNode.invalidateChildren();
                        break;
                }

            }
        }

        override protected function onSVGLoad(evt:Event):void {
            super.onSVGLoad(evt);
            if (targetNode) {
                targetNode.addAnimation(this);
            }
            else {
                this.dbg("No target for animation " + id);
            }
        }

        override protected function onRemovedFromStage(event:Event):void {
            if (targetNode) {
                targetNode.removeAnimation(this);
            }
            super.onRemovedFromStage(event);
        }

        public function getAnimValue():String {
            var interval:TimeInterval = getEffectiveInterval();
            var previousCount:int;

            if (interval) {
                var repeatFraction:Number = interval.getRepeatIntervalFraction(lastDocTime, this);

                var fromString:String;
                var toString:String;
                var fromVal:Number;
                var toVal:Number;

                var keyTimeIndex:Number = getKeyTimeIndex(repeatFraction);
                var keyTimeSpline:String = getKeyTimeSpline(keyTimeIndex);
                if (valuesParameter != null) {
                    var keyTimeFraction:Number = getKeyTimeFraction(repeatFraction);
                    if (calcModeParameter == "discrete") {
                        if (keyTimeFraction >= 1.0) {
                            return getKeyTimeValue(keyTimeIndex + 1);
                        }
                        else {
                            return getKeyTimeValue(keyTimeIndex);
                        }
                    }
                    fromString = getKeyTimeValue(keyTimeIndex);
                    toString = getKeyTimeValue(keyTimeIndex + 1);
                }
                else {
                    keyTimeFraction = repeatFraction;
                    if (calcModeParameter == "discrete") {
                        if (accumulateParameter == "sum") {
                            fromVal = SVGColors.cleanNumber(fromParameter);
                            toVal = SVGColors.cleanNumber(toParameter);
                            previousCount = interval.getRepeatIndex(lastDocTime, this);
                            if (previousCount > 0) {
                                fromVal += toVal * previousCount;
                                toVal   += toVal * previousCount;
                            }
                            if (keyTimeFraction >= 0.5) {
                                return String(toVal);
                            }
                            else {
                                return String(fromVal);
                            }
 
                        }
                        else {
                            if (keyTimeFraction >= 0.5) {
                                return toParameter;
                            }
                            else {
                                return fromParameter;
                            }
                        }
                    }
                    fromString = fromParameter;
                    toString = toParameter;
                }
                fromVal = SVGColors.cleanNumber(fromString);
                toVal = SVGColors.cleanNumber(toString);
                var isColor:Boolean = false;
                if (SVGColors.isColor(fromString)
                    && SVGColors.isColor(toString) ) {
                    isColor = true;
                }

                if (accumulateParameter == "sum") {
                    previousCount = interval.getRepeatIndex(lastDocTime, this);
                    if (previousCount > 0) {
                        // XXX For "values", should use the last value, not to
                        fromVal += toVal * previousCount;
                        toVal   += toVal * previousCount;
                    }

                    return String(interpolate(fromVal, toVal,
                                              keyTimeFraction, keyTimeSpline,
                                              isColor));     
                }
                else {
                    return String(interpolate(fromVal, toVal,
                                              keyTimeFraction, keyTimeSpline,
                                              isColor));
                }
            }
            return null;
        }
        
        // Which key time does the repeatFraction fall at?
        public function getKeyTimeIndex(repeatFraction:Number):uint {
            var i:uint;
            for (i=1; i < keyTimes.length; i++) {
                if (repeatFraction < SVGUnits.cleanNumber(keyTimes[i])) {
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
            return SVGColors.trim(parts[keyTimeIndex]);
        }

        // We should only trigger a redraw when something is actively
        // changing.
        public function isActive():Boolean {
            // Walk though timing intervals and find ones that are within their
            // active interval duration. Frozen animations do not count.
            var interval:TimeInterval = getActiveInterval(lastDocTime);
            if (interval) {
                return true;
            }
            else {
                return false;
            }
        }

        public function isEffective():Boolean {
            // Walk though animations and find ones that still have an effect
            // because they are active or frozen (fill="freeze")
            for each(var timeSpec:TimeSpec in beginTimeSpecs) {
                var intervals:Array = timeSpec.getIntervals();
                for each (var interval:TimeInterval in intervals) {
                    if ( interval.hasTime(lastDocTime, this) ) {
                        return true;
                    }
                    if ( fillParameter == "freeze" && interval.endsBeforeTime(lastDocTime, this) ) {
                        return true;
                    }
                }
            }
            return false;
        }

        public function getEffectiveInterval():TimeInterval {
            var effectiveIntervals:Array= new Array();

            // Walk though animations and find ones that still have an effect
            // because they are active or frozen (fill="freeze"),
            // gathers the effective intervals into an array,
            // sort by begin time and picks the last one
            for each(var timeSpec:TimeSpec in beginTimeSpecs) {
                var intervals:Array = timeSpec.getIntervals();
                for each (var interval:TimeInterval in intervals) {
                    if ( interval.hasTime(lastDocTime, this) ) {
                        effectiveIntervals.push(interval);
                    }
                    else if ( fillParameter == "freeze"
                        && interval.endsBeforeTime(lastDocTime, this) ) {
                        effectiveIntervals.push(interval);
                    }
                }
            }
            if (effectiveIntervals.length > 0) {
                //try {
                //effectiveIntervals.sortOn('currentBeginStartTime', Array.NUMERIC);
                //} catch(e:Error) {}
                return effectiveIntervals[effectiveIntervals.length - 1];
            }
            else {
                return null;
            }
        }
        
        override protected function timeIntervalStarted():void {
            super.timeIntervalStarted();
            targetNode.invalidateDisplay();
            // transform changes do not require a redraw
            if (attributeName != "transform") {
                targetNode.invalidateChildren();
            }
        }

        override protected function timeIntervalEnded():void {
            super.timeIntervalEnded();
            targetNode.invalidateDisplay();
            // transform changes do not require a redraw
            if (attributeName != "transform") {
                targetNode.invalidateChildren();
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

            parseAttributeNameParameter();
            parseHrefParameter();
            parseCalcModeParameter();
            parseValuesParameter();
            parseFromParameter();
            parseToParameter();
            parseByParameter();
            parseKeyTimesParameter();
            parseKeySplinesParameter();
            parseFillParameter();
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
        }

        protected function parseFromParameter():void {
            fromParameter = this._getAttribute('from', null, false, false, false);
            if (fromParameter == 'inherit') {
                fromParameter = targetNode.getAttribute(attributeName, null, true, false);
                if (fromParameter == null) {
                    fromParameter = 'inherit';
                }
                return;
            }
            fromParameter = this.getAttribute('from', null, true, false);
        }

        protected function parseToParameter():void {
            // bypass 'inherit' process right now
            toParameter = this._getAttribute('to', null, false, false, false);
            if (toParameter == 'inherit') {
                toParameter = targetNode.getAttribute(attributeName, null, true, false);
                return;
            }
            toParameter = this.getAttribute('to', null, true, false);
        }

        protected function parseByParameter():void {
            byParameter = this.getAttribute('by', null);
            
            // Do we still need a "to" parameter?
            if (toParameter == null
                && (byParameter != null)
                && (fromParameter != null) ) {
                toParameter = String(SVGUnits.cleanNumber(fromParameter) +
                                     SVGUnits.cleanNumber(byParameter));
            }
            // If these are not numeric values, they are discrete
            if ( valuesParameter != null) {
                var values:Array = valuesParameter.split(";");
                for each (var strValue:String in values) {
                    if (SVGColors.isColor(strValue)) {
                        continue;
                    }
                    var keyVal:Number = parseInt(strValue);
                    if (isNaN(keyVal) || keyVal > int.MAX_VALUE || keyVal < int.MIN_VALUE) {
                        calcModeParameter = "discrete";
                    }
                }
            }
            else {
                // If the values are not colors
                // and the values are not numeric, then they are disrete strings
                if (fromParameter != null) {
                    if (!SVGColors.isColor(fromParameter)) {
                        var fromVal:Number = parseInt(fromParameter);
                        if ( isNaN(fromVal) || fromVal > int.MAX_VALUE || fromVal < int.MIN_VALUE ) {
                            calcModeParameter = "discrete";
                        }
                    }
                }
                if (toParameter != null) {
                    if (!SVGColors.isColor(toParameter)) {
                        var toVal:Number = parseInt(toParameter);
                        if ( isNaN(toVal) || toVal > int.MAX_VALUE || toVal < int.MIN_VALUE ) {
                            calcModeParameter = "discrete";
                        }
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
                var lastValueAdded:Number = SVGUnits.cleanNumber(keyTimes[keyTimes.length-1]);
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
        }
    }
}
