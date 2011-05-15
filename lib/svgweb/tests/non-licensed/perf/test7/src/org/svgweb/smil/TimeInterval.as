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

package org.svgweb.smil
{

    import org.svgweb.smil.TimeSpec;
    import org.svgweb.utils.SVGUnits;
    import org.svgweb.core.SVGNode;

    public class TimeInterval
    {


        protected var currentRepeatIndex:uint =0;
        public var currentBeginStartTime:Number = Number.MAX_VALUE;

        protected var beginTimeSpec:TimeSpec;
        protected var endTimeSpecs:Array;

        protected var eachRepeatDuration:Number;    // dur
        protected var repeatCount:Number;           // repeatCount
        protected var allRepeatsDuration:Number;    // repeatDuration
        protected var minIntervalDuration:Number;   // min
        protected var maxIntervalDuration:Number;   // max

        public var scheduledDuration:Number;

        public var firedStartEvent:Boolean = false;

        public function TimeInterval(beginTimeSpec:TimeSpec,      // begin
                                     endTimeSpecs:Array,          // end
                                     eachRepeatDuration:Number,   // dur
                                     repeatCount:Number,          // repeatCount
                                     allRepeatsDuration:Number,   // repeatDuration
                                     minIntervalDuration:Number,  // min
                                     maxIntervalDuration:Number,  // max
                                     node:SVGNode):void {
            this.beginTimeSpec = beginTimeSpec;
            if (this.beginTimeSpec is OffsetTimeSpec) {
                this.currentBeginStartTime = OffsetTimeSpec(beginTimeSpec).getOffset();
            }


            this.endTimeSpecs = endTimeSpecs;
            this.eachRepeatDuration = eachRepeatDuration;
            this.repeatCount = repeatCount;
            this.allRepeatsDuration = allRepeatsDuration;
            this.minIntervalDuration = minIntervalDuration;
            this.maxIntervalDuration = maxIntervalDuration;

            scheduledDuration = Math.min(allRepeatsDuration, eachRepeatDuration * repeatCount)
            scheduledDuration = Math.min(maxIntervalDuration, eachRepeatDuration * repeatCount)
            scheduledDuration = Math.max(minIntervalDuration, scheduledDuration);
            // xxx go through end time specs
        }


        public function setCurrentBeginStartTime(startTime:Number):void {
            this.currentBeginStartTime = startTime;
        }

        public function startInterval():void {
            firedStartEvent = true;
        }

        public function endInterval():void {
        }

        public function hasFiredStartEvent():Boolean {
            return firedStartEvent;
        }

        public function endsBeforeTime(docTime:Number, node:SVGNode):Boolean {
            if (beginTimeSpec is OffsetTimeSpec) {
                if (docTime >= (OffsetTimeSpec(beginTimeSpec).getOffset()+scheduledDuration)) {
                     return true;
                }
                else {
                     return false;
                }
            }
            else {
                if (   (docTime >= currentBeginStartTime) 
                    && (docTime >= currentBeginStartTime + scheduledDuration) ) {
                    return true;
                }
            }

            return false;
        }


        public function hasTime(docTime:Number, node:SVGNode):Boolean {
            if (beginTimeSpec is OffsetTimeSpec) {
                if ( (docTime >= OffsetTimeSpec(beginTimeSpec).getOffset()) && 
                     (docTime < (OffsetTimeSpec(beginTimeSpec).getOffset()+scheduledDuration) ) ) {
                     return true;
                }
                else {
                     return false;
                }
            }
            else {
                if (   (docTime >= currentBeginStartTime) 
                    && (docTime < currentBeginStartTime + scheduledDuration) ) {
                    return true;
                }
                else {
                    return false;
                }
            }

            return false;
        }

        public function getRepeatIndex(docTime:Number,node:SVGNode):Number {
            // If we are past the end time then set time to the end
            docTime = Math.min(docTime, this.currentBeginStartTime + scheduledDuration);
            var repeatIndex:Number = Math.floor( (docTime - currentBeginStartTime) / this.eachRepeatDuration);
            var currentRepeatStartTime:Number = this.currentBeginStartTime + repeatIndex * this.eachRepeatDuration;
            var repeatRunTime:Number = docTime - currentRepeatStartTime;
            if (repeatRunTime == 0 && repeatIndex > 0) {
                return repeatIndex -1;
            }
            else {
                return repeatIndex;
            }
        }

        // used by animations to identify current value index
        public function getRepeatIntervalFraction(docTime:Number,node:SVGNode):Number {
            docTime = Math.min(docTime, this.currentBeginStartTime + scheduledDuration);
            var currentRepeatStartTime:Number = this.currentBeginStartTime + this.getRepeatIndex(docTime, node) * this.eachRepeatDuration;
            var repeatRunTime:Number = docTime - currentRepeatStartTime;

            return Math.min(1.0, repeatRunTime / eachRepeatDuration);
        }



    }
}
