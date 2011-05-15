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

package org.svgweb.core
{
    import org.svgweb.core.SVGNode;
    import org.svgweb.nodes.SVGSVGNode;
    import org.svgweb.utils.SVGUnits;
    import org.svgweb.events.SVGEvent;
    import org.svgweb.smil.TimeSpec;
    import org.svgweb.smil.EventTimeSpec;
    import org.svgweb.smil.IndefiniteTimeSpec;
    import org.svgweb.smil.OffsetTimeSpec;
    import org.svgweb.smil.WallclockTimeSpec;
    import org.svgweb.smil.TimeInterval;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.net.URLRequest;
    import flash.utils.getTimer;

    /**
     *
     *  SVGTimedNode is a node with timing parameters.
     *
     *  The timing model is implemented according to SMIL Animation:
     *  http://www.w3.org/TR/smil-animation/
     *
     *
     *  SVGTimedNode has parameters which specify TimeSpecs (time specifications)
     *  (begin times or event to begin on, end times or events, etc).
     * 
     *  Begin TimeSpecs are static time offsets or patterns that match events.
     *  TimeSpecs create TimeIntervals either when parsed [static offsets ('5s')]
     *  or when events occur [timebase or syncbase time specs (e.g. 'foo.begin',
     *  'bar.click')].
     *
     *  TimeInterval arrays are used to determine the current interval for a
     *  given time sample. State is kept within intervals in order to fire
     *  their events (begin, end, repeat, etc) properly.
     *
     *  The SVGTimedNode progresses along when it receives events of type
     *  _SVGDocTimeUpdate which indicates the timeline has progressed forward to a
     *  new timestamp (the next frame). At this point, events are fired for transitions
     *  between TimeInterval states, until no further transitions are left to perform up
     *  to the current time.
     *
     *  The same progress occurs when an event of type SVGDocTimeSeek is received,
     *  which occurs when a hyperlink is traversed to a different document time offset.
     *  In the case of a seek forward, events are used to resolve intervals, but they
     *  are not be dispatched to DOM listeners. In the case of a seek backward,
     *  the current interval is determined de novo (i.e. with no consideration to
     *  prior state) and no events are fired.
     * 
     *
     *  Note that negative offsets for time specs are not resolved prior to the occurence
     *  of the base event. So, if an interval is specified to begin at foo.begin-5s,
     *  and foo has a begin time spec of "10s", then the interval will be created at
     *  foo.begin time, which is 10s. However, the interval will already be 5 seconds
     *  into its active duration, as would be expected from the late start.
     *  Note the interval is not created at 5 seconds even though it is possible to
     *  resolve that begin time from the time specs.
     *
     *  The reason for this is that it is a shortcut that simplifies the implementation.
     *  If this feature is not supported, then we do not need to implement what I call
     *  "recursive, greedy" time spec resolution. This is where we resolve instance times
     *  for timespecs using timebase offsets when the timebase has a resolved instance time.
     *  In the above example, the timebase "foo.begin" has a resolved instance time of
     *  "10s" and therefore we can resolve "foo.begin-5s", which may result in the
     *  resolution of further timespec instances. Greedy resolution can result in cycles
     *  that must be detected using 'visited' lists.
     *
     *  By doing "on demand" resolution in constrast, we defer resolving "foo.begin-5s"
     *  until foo.begin actually occurs. This means backward progating time resolutions
     *  will not function perhaps as one would expect. 
     *
     *  However, we can still support forward propogating resolutions (see Example 3,
     *  end of section 3.6.8 in the SMIL Animation spec) using "on demand" time spec
     *  resolution, which creates the dependent interval only when events occur.
     *  Since negative timebase offsets are an unusual feature, and in my opinion,
     *  conceptually confusing, this tradeoff seems to be a reasonable starting point.
     *
     *  In the future, the implementation can be improved and the shortcut removed in a
     *  straightforward manner. Instead of resolving timebase time specs (foo.begin-5s)
     *  when the event occurs, that could be changed to resolve the time spec when the
     *  interval is created. This can be done by dispatching a new SVGIntervalCreate event
     *  and resolving new intervals based on that. The SVGIntervalCreate event could pass
     *  along a visited list which is used to break cycles as described in the spec.
     *
     **/
    public class SVGTimedNode extends SVGNode {
        protected const INDEFINITE:uint = uint.MAX_VALUE;

        protected var lastDocTime:Number = -1;

        // This keeps track of the active interval so that if we play or seek
        // past the interval, we know to process the end state transition
        // of the interval.
        protected var currentTimeSpec:TimeSpec = null;
        protected var currentTimeInterval:TimeInterval = null;
        protected var currentRepeatIndex:Number = -1;

        protected var eachRepeatDuration:Number;    // dur
        protected var repeatCount:Number;           // repeatCount
        protected var allRepeatsDuration:Number;    // repeatDuration
        protected var minIntervalDuration:Number;   // min
        protected var maxIntervalDuration:Number;   // max

        protected var beginTimeSpecs:Array = new Array();        // begin
        protected var endTimeSpecs:Array = new Array();          // end

        public function SVGTimedNode(svgRoot:SVGSVGNode, xml:XML, original:SVGNode = null):void {
            super(svgRoot, xml, original);
        }

        override protected function onAddedToStage(event:Event):void {
            super.onAddedToStage(event);
            svgRoot.addEventListener(SVGEvent.SVGLoad, onSVGLoad);
            svgRoot.addEventListener(SVGEvent._SVGDocTimeUpdate, onSVGDocTimeUpdate);
            svgRoot.addEventListener(SVGEvent._SVGDocTimeSeek, onSVGDocTimeSeek);
        }

        override protected function onRemovedFromStage(event:Event):void {
            svgRoot.removeEventListener(SVGEvent.SVGLoad, onSVGLoad);
            svgRoot.removeEventListener(SVGEvent._SVGDocTimeUpdate, onSVGDocTimeUpdate);
            svgRoot.removeEventListener(SVGEvent._SVGDocTimeSeek, onSVGDocTimeSeek);
            super.onRemovedFromStage(event);
        }

        protected function onSVGLoad(evt:Event):void {
            // Process the timing parameters
            parseParameters();
        }

        protected function onSVGDocTimeUpdate(event:Event):void {
            lastDocTime = SVGEvent(event).docTime;
            var nextCurrentTimeSpec:TimeSpec;
            var nextCurrentTimeInterval:TimeInterval;
            var timeSpec:TimeSpec;
            var intervals:Array;
            var interval:TimeInterval;

            // Process skipped intervals
            for each(timeSpec in beginTimeSpecs) {
                intervals = timeSpec.getIntervals();
                for each (interval in intervals) {
                    if ( interval.endsBeforeTime(lastDocTime, this) && !interval.hasFiredStartEvent() ) {
                        interval.startInterval();
                        timeIntervalStarted();
                        interval.endInterval();
                        timeIntervalEnded();
                    }
                }
            }

            // Determine current/next active interval
            for each(timeSpec in beginTimeSpecs) {
                intervals = timeSpec.getIntervals();
                for each (interval in intervals) {
                    if ( interval.hasTime(lastDocTime, this) ) {
                        nextCurrentTimeSpec=timeSpec;
                        nextCurrentTimeInterval=interval;
                    }
                }
            }

            // Has the interval changed?
            if (currentTimeInterval != nextCurrentTimeInterval) {
                // End previous interval
                if (currentTimeInterval != null) {
                    currentTimeInterval.endInterval();
                    timeIntervalEnded();
                }

                // Start new interval
                currentTimeSpec = nextCurrentTimeSpec;
                currentTimeInterval = nextCurrentTimeInterval;
                if (currentTimeInterval != null) {
                    currentTimeInterval.startInterval();
                    timeIntervalStarted();
                    currentRepeatIndex=0;
                    repeatIntervalStarted();
                }
            }
            else {
                if (currentTimeInterval != null) {
                    while (currentRepeatIndex < currentTimeInterval.getRepeatIndex(lastDocTime, this)) {
                        if (currentRepeatIndex >= 0) {
                            repeatIntervalEnded();
                        }
                        repeatIntervalStarted();
                        currentRepeatIndex++;
                    }
                }
            }
        }

        protected function onSVGDocTimeSeek(event:Event):void {
            //this.dbg("docTimeSeek: documentTime: " + SVGEvent(event).docTime);
        }

        // These are hooks that animations can use to trigger a redraw that would
        // not otherwise occur when there are no remaining active animations.
        protected function timeIntervalStarted():void {
            var svgEvent:SVGEvent = new SVGEvent(SVGEvent._SVGAnimBegin);
            this.dispatchEvent(svgEvent);
        }
        
        protected function timeIntervalEnded():void {
            var svgEvent:SVGEvent = new SVGEvent(SVGEvent._SVGAnimEnd);
            this.dispatchEvent(svgEvent);
        }

        public function getActiveInterval(docTime:Number):TimeInterval {
            for each(var timeSpec:TimeSpec in beginTimeSpecs) {
                var intervals:Array = timeSpec.getIntervals();
                for each (var interval:TimeInterval in intervals) {
                    if ( interval.hasTime(docTime, this) ) {
                        return interval;
                    }
                }
            }
            return null;
        }

        public function getHyperlinkDocTime():Number {
            return 0;
        }

        protected function repeatIntervalStarted():void {
            if (currentRepeatIndex > 0) {
                var svgEvent:SVGEvent = new SVGEvent(SVGEvent._SVGAnimRepeat);
                this.dispatchEvent(svgEvent);
            }
        }

        protected function repeatIntervalEnded():void {
        }

        /**
         *
         * Parsing Methods
         *
         **/

        protected function parseParameters():void {
            parseEachRepeatDuration();  // duration
            parseRepeatCount();         // repeatCount
            parseAllRepeatsDuration();  // repeatDuration
            parseMinIntervalDuration(); // min
            parseMaxIntervalDuration(); // max
            parseEndTimeSpecs();        // end
            parseBeginTimeSpecs();      // begin
        }

        /**
         *
         * Parse the 'begin' parameter.
         *
         **/
        protected function parseBeginTimeSpecs():void {
            // If no begin is specified, the spec says the default is zero
            var begin:String = this.getAttribute('begin', '0');

            var timeSpecStrings:Array = begin.split(/;/);
            var timeSpecIndex:uint =0;
            for each(var timeSpecString:String in timeSpecStrings) {

                var timeSpec:TimeSpec = TimeSpec.parseTimeSpec(timeSpecString, this);
                beginTimeSpecs.push(timeSpec);

                // Simple offsets can resolve an interval right away
                if (timeSpec is OffsetTimeSpec) {
                    timeSpec.addInterval(new TimeInterval(timeSpec,
                                                          this.endTimeSpecs,
                                                          this.eachRepeatDuration,
                                                          this.repeatCount,
                                                          this.allRepeatsDuration,
                                                          this.minIntervalDuration,
                                                          this.maxIntervalDuration, this));

                }
                if (timeSpec is EventTimeSpec) {
                    var targetNode:SVGNode = this.svgRoot.getNode(EventTimeSpec(timeSpec).nodeID);
                    if (targetNode) {
                        switch (EventTimeSpec(timeSpec).eventType) {
                            case "begin":
                            case "end":
                            case "repeatEvent":
                               targetNode.addEventListener(EventTimeSpec(timeSpec).eventType, handleEvent);
                               break;
                            default: 
                               targetNode.topSprite.addEventListener(EventTimeSpec(timeSpec).eventType, handleEvent);
                               break;
                        }
                    }
                }
                timeSpecIndex++;
            }
        }

        protected function handleEvent(event:Event):void {
            var timeSpec:TimeSpec;
            for each(timeSpec in beginTimeSpecs) {
                if (   timeSpec is EventTimeSpec
                    && EventTimeSpec(timeSpec).eventType == event.type) {
                    var newInterval:TimeInterval =
                                         new TimeInterval(timeSpec,
                                                          this.endTimeSpecs,
                                                          this.eachRepeatDuration,
                                                          this.repeatCount,
                                                          this.allRepeatsDuration,
                                                          this.minIntervalDuration,
                                                          this.maxIntervalDuration, this);

                    newInterval.setCurrentBeginStartTime(this.svgRoot.getDocTime() + 
                                                             EventTimeSpec(timeSpec).offset);
                    timeSpec.addInterval(newInterval);
                }
            }
            // XXX not implemented yet
            for each(timeSpec in endTimeSpecs) {
            }
        }

        /**
         *
         * Parse the 'end' parameter.
         * Note that the 'end' parameter refers to the end of
         * all the repeat cycles.
         *
         **/
        protected function parseEndTimeSpecs():void {
            // If no end is specified, the spec says the default is indefinite
            var endString:String = this.getAttribute('end', 'indefinite');

            var timeSpecStrings:Array = endString.split(/;/);
            for each(var timeSpecString:String in timeSpecStrings) {
                var timeSpec:TimeSpec = TimeSpec.parseTimeSpec(timeSpecString, this);
                if (timeSpec) {
                    endTimeSpecs.push(timeSpec);
                }
            }
        }


        protected function parseEachRepeatDuration():void {
            // If no duration is specified, the spec says the default is indefinite
            var durationString:String = this.getAttribute('dur', 'indefinite');
            if (durationString == 'media' || durationString == 'indefinite') {
                this.eachRepeatDuration =  INDEFINITE;
            }
            else {
                this.eachRepeatDuration =  SVGUnits.parseTimeVal(durationString);
            }
        }


        protected function parseRepeatCount():void {
            // If no repeat is specified, the spec says the default is one
            var repeatCountString:String = this.getAttribute('repeatCount', '1');
            if (repeatCountString == 'indefinite') {
                this.repeatCount = INDEFINITE;
            }
            else {
                this.repeatCount = SVGUnits.cleanNumber(repeatCountString);
            }
        }

        protected function parseAllRepeatsDuration():void {
            // repeatDuration parsed as allRepeatsDuration
            var allRepeatsDurationString:String = this.getAttribute('repeatCount', String(eachRepeatDuration*repeatCount));
            if (allRepeatsDurationString == 'indefinite') {
                if (eachRepeatDuration != INDEFINITE) {
                    allRepeatsDuration = eachRepeatDuration*repeatCount;
                }
                else {
                    allRepeatsDuration = INDEFINITE;
                }
            }
            else {
                allRepeatsDuration = SVGUnits.parseTimeVal(allRepeatsDurationString);
                allRepeatsDuration = Math.min(this.allRepeatsDuration, eachRepeatDuration*repeatCount);
            }
        }

        protected function parseMinIntervalDuration():void {
            var minString:String = this.getAttribute('min', '0');
            this.minIntervalDuration = SVGUnits.parseTimeVal(minString);
        }

        protected function parseMaxIntervalDuration():void {
            var maxString:String = this.getAttribute('max', 'indefinite');
            if (maxString == 'indefinite') {
                this.maxIntervalDuration = INDEFINITE;
            }
            else {
                this.maxIntervalDuration = SVGUnits.parseTimeVal(maxString);
            }
        }
        
        /**
         * Called when a node is created after page load with XML content
         * added as a child. Forces a parse.
         */
        override public function forceParse():void {
            if (this._xml != null) {
                this.parseParameters();
                super.forceParse();
            } 
        }


    }
}
