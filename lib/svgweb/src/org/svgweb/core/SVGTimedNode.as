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
    import org.svgweb.nodes.SVGVideoNode;
    import org.svgweb.utils.SVGUnits;
    import org.svgweb.events.SVGEvent;
    import org.svgweb.smil.TimeSpec;
    import org.svgweb.smil.EventTimeSpec;
    import org.svgweb.smil.IndefiniteTimeSpec;
    import org.svgweb.smil.OffsetTimeSpec;
    import org.svgweb.smil.WallclockTimeSpec;
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
     *  An instance list of begin times and end times is maintained to handle
     *  keeping track of instances created from static configuration and
     *  dynamic events.
     *
     *  Begin TimeSpecs are static time offsets or patterns that match events.
     *  begin instances are created either when parsed [static offsets ('5s')]
     *  or when events occur [timebase or syncbase time specs (e.g. 'foo.begin',
     *  'bar.click')].
     *
     *  The SVGTimedNode progresses along when it receives events of type
     *  _SVGDocTimeUpdate which indicates the timeline has progressed forward to a
     *  new timestamp (the next frame). At this point, events are fired for transitions
     *  between states, until no further transitions are left to perform up
     *  to the current time. The begin and end times are removed from the
     *  instance lists as they are processed.
     *
     *
     *
     **/
    public class SVGTimedNode extends SVGNode {
        protected const INDEFINITE:uint = uint.MAX_VALUE;

        protected var lastDocTime:Number = -1;

        protected var currentRepeatIndex:Number = -1;
        protected var eachRepeatDuration:Number;    // dur
        protected var repeatCount:Number;           // repeatCount
        protected var repeatCountSpecified:Boolean = false;
        protected var allRepeatsDuration:Number;    // repeatDuration
        protected var repeatDurSpecified:Boolean = false;
        protected var minIntervalDuration:Number;   // min
        protected var maxIntervalDuration:Number;   // max

        protected var beginTimeSpecs:Array = new Array();        // begin
        protected var endTimeSpecs:Array = new Array();          // end

        protected var beginTimes:Array = new Array();    // begin time instances
        protected var endTimes:Array = new Array();      // end time instances
        protected var pastBeginTimes:Array = new Array();
        protected var pastEndTimes:Array = new Array();
        protected var active:Boolean = false;            // active time interval
        protected var neverStarted:Boolean = true;
        protected var restart:String = "always";
        protected var scheduledDuration:Number;

        protected var beginTargetNode:SVGNode;
        protected var endTargetNode:SVGNode;

        // currentBeginTime,currentEndTime define the current active interval
        // when inactive, they define the most recent active interval
        protected var currentBeginTime:Number = -1;
        protected var currentEndTime:Number = INDEFINITE;

        protected var inParseParameters:Boolean = false;

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
            initialize();
        }
		
        override protected function onAdded():void {
            // If we have been added to the SVG tree AFTER it has already been
            // loaded, then we need to immediately initialize ourselves
            if (this.svgRoot && this.svgRoot.isLoaded()) {
                initialize();
            }
        }
        
        protected function initialize():void {
            // Process the timing parameters
            parseParameters();
        }

        override protected function drawNode(event:Event = null):void {
            if (this is SVGVideoNode) {
                return super.drawNode(event);
            }
            topSprite.visible = false;
            if ( (topSprite.parent != null) && (this._invalidDisplay) ) {
                this._invalidDisplay = false;

                if (this._xml != null) {
                    if (!this._parsedChildren) {
                        this.parseChildren();
                        this._parsedChildren = true;
                    }
                }
                topSprite.removeEventListener(Event.ENTER_FRAME, drawNode);
            }

            if (!this._initialRenderDone && topSprite.parent) {
                this._initialRenderDone = true;
                this.svgRoot.renderFinished();
            }

        }

        protected function onSVGDocTimeUpdate(event:Event):void {
            checkBeginInstances(SVGEvent(event).docTime);
        }

        protected function checkBeginInstances(newDocTime:Number):void {
            lastDocTime = newDocTime;
            var beginInstance:Number;
            var endInstance:Number;
            // Keep looping as long as there is work being done. There may
            // be a backlog of work that needs to be processed. 
            while (true) {
                beginInstance = getBeginInstance();
                endInstance = getEndInstance();

                if (!this.active) {
                    // If not active, process begin instances.

                    // Is the next begin instance ready to run?
                    if (beginInstance <= lastDocTime) {
                        // If restart is 'never', do not start more than one
                        // interval.
                        if ( (restart!="never")  || neverStarted) {
                            timeIntervalStarted(beginInstance);
                            this.active = true;
                        }
                        // Whether we started or not, we have processed this
                        // instance and so we move on to the next.
                        pastBeginTimes.unshift(beginTimes.shift());
                    }
                    else break; // be sure to break anytime we need to wait
                }
                else {
                    // Time interval is active, process end instances.

                    // Discard moot events. These may exist if created
                    // with a negative time offset or if the document
                    // is seeked.

                    // Discard all endTimes up to currentBeginTime.
                    while (endInstance < currentBeginTime) {
                        endInstance = nextEndInstance();
                    }
                    // Discard all beginTimes up to currentBeginTime.
                    while (beginInstance < currentBeginTime) {
                        beginInstance = nextBeginInstance();
                    }

                    // Check for an end before (or at?) the next begin.
                    var tmpEnd:Number = Math.min(endInstance, currentEndTime);
                    if ( (tmpEnd <= lastDocTime) && (tmpEnd <= beginInstance)) {
                        // If the end instance came first, then it is the
                        // end time we are using.
                        if (endInstance <= currentEndTime) {
                            pastEndTimes.unshift(endTimes.shift());
                        }
                        processRepeatIntervals(tmpEnd);
                        timeIntervalEnded(tmpEnd);
                        this.active = false;
                    }
                    else {  //check for a restart
                        if (beginInstance <= lastDocTime) {
                            if (beginInstance >= currentBeginTime) {
                                processRepeatIntervals(beginInstance);
                                if (restart == "always") {
                                    timeIntervalEnded(beginInstance);
                                    timeIntervalStarted(beginInstance);
                                    //this.active = true;
                                }
                            }
                            pastBeginTimes.unshift(beginTimes.shift());
                        }
                        else break; // be sure to break anytime we need to wait
                    }
                }
            }
            if (this.active) processRepeatIntervals(lastDocTime);
        }

        protected function onSVGDocTimeSeek(event:Event):void {
            //this.dbg("docTimeSeek: documentTime: " + SVGEvent(event).docTime);
            // To simplify this, we just start over and reprocess instances
            // up to the current time. TODO: We should keep track of
            // what time we have seeked to in order to avoid dispatching
            // events for events which end up in the past.
            while (pastBeginTimes.length > 0) {
                beginTimes.unshift(pastBeginTimes.shift());
            }
            beginTimes.sort(Array.NUMERIC);

            while (pastEndTimes.length > 0) {
                endTimes.unshift(pastEndTimes.shift());
            }
            endTimes.sort(Array.NUMERIC);

        }

        // These are hooks that animations can use to trigger a redraw that would
        // not otherwise occur when there are no remaining active animations.
        protected function timeIntervalStarted(docTime:Number):void {
            currentBeginTime = docTime;
            if (scheduledDuration == INDEFINITE) currentEndTime = INDEFINITE;
            else currentEndTime = currentBeginTime + scheduledDuration;
            currentRepeatIndex = 0;
            neverStarted = false;
            var svgEvent:SVGEvent = new SVGEvent(SVGEvent._SVGAnimBegin);
            svgEvent.setDocTime(docTime);
            this.dispatchEvent(svgEvent);
            repeatIntervalStarted(currentBeginTime); // starts media
        }
        
        protected function timeIntervalEnded(docTime:Number):void {
            currentEndTime = docTime;
            var svgEvent:SVGEvent = new SVGEvent(SVGEvent._SVGAnimEnd);
            svgEvent.setDocTime(docTime);
            this.dispatchEvent(svgEvent);
        }

        /*
            if active docseek back to currentBeginTime
            else seek to earliest begin instance (forward or back)
            else do a begin at current doctime
        */
        public function getHyperlinkDocTime():Number {
            if (this.active) {
                return currentBeginTime;
            }

            var minTime:Number = INDEFINITE;
            for (var i:uint=0; i < pastBeginTimes.length; i++) {
                if (pastBeginTimes[i] < minTime) {
                    minTime = pastBeginTimes[i];
                }
            }
            for (i=0; i < beginTimes.length; i++) {
                if (beginTimes[i] < minTime) {
                    minTime = beginTimes[i];
                }
            }

            if (minTime != INDEFINITE) {
               return minTime;
            } else {
               return this.svgRoot.getDocTime();
            }
        }

        protected function repeatIntervalStarted(docTime:Number):void {
            if (currentRepeatIndex > 0) {
                var svgEvent:SVGEvent = new SVGEvent(SVGEvent._SVGAnimRepeat);
                svgEvent.setDocTime(docTime);
                this.dispatchEvent(svgEvent);
            }
        }

        protected function repeatIntervalEnded(docTime:Number):void {
        }

        /**
         *
         * Parsing Methods
         *
         **/

        protected function parseParameters():void {
            // prevents endless loop:
            // parseParameters -> checkBeginInstances -> timeIntervalStarted -> parseParameters
            if (inParseParameters)
                return;
            inParseParameters = true;
            parseEachRepeatDuration();  // duration
            parseRepeatCount();         // repeatCount
            parseAllRepeatsDuration();  // repeatDuration
            parseMinIntervalDuration(); // min
            parseMaxIntervalDuration(); // max
            parseRestart();             // restart
            parseEndTimeSpecs();        // end
            parseBeginTimeSpecs();      // begin
            setScheduledDuration();
            // jump start immediate animations so they run in order
            var now:Number =this.svgRoot.getDocTime();
            checkBeginInstances(now);
            inParseParameters = false;
        }

        /**
         *
         * Parse the 'begin' parameter.
         *
         **/
        protected function parseBeginTimeSpecs():void {
            // do not add event listeners more than once
            if (beginTargetNode)
               return;

            // If no begin is specified, the spec says the default is zero
            var begin:String = this.getAttribute('begin', '0');

            var timeSpecStrings:Array = begin.split(/;/);
            for each(var timeSpecString:String in timeSpecStrings) {
                var timeSpec:TimeSpec = TimeSpec.parseTimeSpec("begin", timeSpecString, this);
                beginTimeSpecs.push(timeSpec);

                // Simple offsets can resolve an interval right away
                if (timeSpec is OffsetTimeSpec) {
                    addBeginInstance(OffsetTimeSpec(timeSpec).getOffset());
                }
                if (timeSpec is EventTimeSpec) {
                    beginTargetNode = this.svgRoot.getNode(EventTimeSpec(timeSpec).nodeID);
                    if (beginTargetNode) {
                        switch (EventTimeSpec(timeSpec).eventType) {
                            case SVGEvent._SVGAnimBegin:
                            case SVGEvent._SVGAnimEnd:
                            case SVGEvent._SVGAnimRepeat:
                               SVGTimedNode(beginTargetNode).addEventListener(EventTimeSpec(timeSpec).eventType,
                                                                              EventTimeSpec(timeSpec).handleEvent);
                               break;
                            default: 
                               beginTargetNode.topSprite.addEventListener(EventTimeSpec(timeSpec).eventType,
                                                                          EventTimeSpec(timeSpec).handleEvent);
                               break;
                        }
                    }
                }
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
            // do not add event listeners more than once
            if (endTargetNode)
               return;

            // If no end is specified, the spec says the default is indefinite
            var endString:String = this.getAttribute('end', 'indefinite');

            var timeSpecStrings:Array = endString.split(/;/);
            for each(var timeSpecString:String in timeSpecStrings) {
                var timeSpec:TimeSpec = TimeSpec.parseTimeSpec("end", timeSpecString, this);
                if (timeSpec) {
                    endTimeSpecs.push(timeSpec);
                    if (timeSpec is OffsetTimeSpec) {
                        addEndInstance(OffsetTimeSpec(timeSpec).getOffset());
                    }
                    if (timeSpec is EventTimeSpec) {
                        endTargetNode = this.svgRoot.getNode(EventTimeSpec(timeSpec).nodeID);
                        if (endTargetNode) {
                            switch (EventTimeSpec(timeSpec).eventType) {
                                case SVGEvent._SVGAnimBegin:
                                case SVGEvent._SVGAnimEnd:
                                case SVGEvent._SVGAnimRepeat:
                                   if (endTargetNode is SVGTimedNode) {
                                       SVGTimedNode(endTargetNode).addEventListener(EventTimeSpec(timeSpec).eventType,
                                                                                    EventTimeSpec(timeSpec).handleEvent);
                                   }
                                   break;
                                default:
                                   endTargetNode.topSprite.addEventListener(EventTimeSpec(timeSpec).eventType,
                                                                            EventTimeSpec(timeSpec).handleEvent);
                                   break;
                            }
                        }
                    }
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
            var repeatCountString:String = this.getAttribute('repeatCount', null);
            repeatCountSpecified = repeatCountString != null;
            this.repeatCount = 1;
            if (repeatCountSpecified) {
                if (repeatCountString == 'indefinite') {
                    this.repeatCount = INDEFINITE;
                }
                else {
                    this.repeatCount = SVGUnits.parseNum(repeatCountString);
                }
            }
        }

        protected function parseAllRepeatsDuration():void {
            // repeatDuration parsed as allRepeatsDuration
            var allRepeatsDurationString:String = this.getAttribute('repeatDur', null);
            repeatDurSpecified = allRepeatsDurationString != null;
            if (repeatDurSpecified) {
                if (allRepeatsDurationString == 'indefinite') {
                    allRepeatsDuration = INDEFINITE;
                }
                else {
                    allRepeatsDuration = SVGUnits.parseTimeVal(allRepeatsDurationString);
                }
                if (repeatCountSpecified && (eachRepeatDuration != INDEFINITE)) {
                    allRepeatsDuration = Math.min(this.allRepeatsDuration, eachRepeatDuration*repeatCount);
                }
            }
            else allRepeatsDuration = eachRepeatDuration;
        }

        protected function parseMinIntervalDuration():void {
            var minString:String = this.getAttribute('min', '0');
            if (minString == 'media') {
                this.minIntervalDuration = 0;
            }
            else {
                this.minIntervalDuration = SVGUnits.parseTimeVal(minString);
                if (isNaN(this.minIntervalDuration)) {
                    this.minIntervalDuration = 0;
                }
                else {
                    this.minIntervalDuration = Math.max(0, this.minIntervalDuration);
                }
            }
        }

        protected function parseMaxIntervalDuration():void {
            var maxString:String = this.getAttribute('max', 'indefinite');
            if ( (maxString == 'indefinite') ||
                 (maxString == 'media')) {
                this.maxIntervalDuration = INDEFINITE;
            }
            else {
                this.maxIntervalDuration = SVGUnits.parseTimeVal(maxString);
                if (isNaN(this.maxIntervalDuration) ||
                    (this.maxIntervalDuration < this.minIntervalDuration)) {
                    this.maxIntervalDuration = INDEFINITE;
                }
            }
        }
        
        protected function parseRestart():void {
            this.restart = this.getAttribute('restart', 'always');
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

        public function addBeginInstanceEvent(event:Event, offset:Number):void {
            var docTime:Number;
            if (event is SVGEvent) docTime = SVGEvent(event).docTime;
            else docTime = this.svgRoot.getDocTime();
            addBeginInstance(docTime + offset);
            // jump start immediate animations so they run in order
            var now:Number =this.svgRoot.getDocTime();
            checkBeginInstances(now);
        }

        public function addEndInstanceEvent(event:Event, offset:Number):void {
            var docTime:Number;
            if (event is SVGEvent) docTime = SVGEvent(event).docTime;
            else docTime = this.svgRoot.getDocTime();
            addEndInstance(docTime + offset);
        }

        public function addBeginInstance(docTime:Number):void {
            beginTimes.push(docTime);
            beginTimes.sort(Array.NUMERIC);
        }

        public function addEndInstance(docTime:Number):void {
            endTimes.push(docTime);
            endTimes.sort(Array.NUMERIC);
        }

        protected function getBeginInstance():Number {
            if (beginTimes.length > 0)
                return(beginTimes[0]);
            return(INDEFINITE);
        }

        protected function nextBeginInstance():Number {
            pastBeginTimes.unshift(beginTimes.shift());
            return(getBeginInstance());
        }

        protected function getEndInstance():Number {
            if (endTimes.length > 0)
                return(endTimes[0]);
            return(INDEFINITE);
        }

        protected function nextEndInstance():Number {
            pastEndTimes.unshift(endTimes.shift());
            return(getEndInstance());
        }

        protected function setScheduledDuration():void {
            if (repeatDurSpecified) scheduledDuration = allRepeatsDuration;
            else if ((eachRepeatDuration == INDEFINITE) || (repeatCount == INDEFINITE))
                scheduledDuration = INDEFINITE;
            else scheduledDuration = eachRepeatDuration * repeatCount;
            scheduledDuration = Math.min(maxIntervalDuration, scheduledDuration);
            scheduledDuration = Math.max(minIntervalDuration, scheduledDuration);
        }

        private function processRepeatIntervals(docTime:Number):void {
            while (currentRepeatIndex < getRepeatIndex(docTime)) {
                var currentRepeatStartTime:Number = this.currentBeginTime + currentRepeatIndex * this.eachRepeatDuration;
                if (currentRepeatIndex >= 0) {
                    repeatIntervalEnded(currentRepeatStartTime);
                }
                repeatIntervalStarted(currentRepeatStartTime);
                currentRepeatIndex++;
            }
        }

        protected function getRepeatIndex(docTime:Number):Number {
            // current active interval or most recently completed interval
            if (this.eachRepeatDuration == INDEFINITE) return 0;
            docTime = Math.min(docTime, this.currentEndTime);
            var repeatIndex:Number;
            repeatIndex = Math.floor( (docTime - currentBeginTime) / this.eachRepeatDuration);
            var currentRepeatStartTime:Number = this.currentBeginTime + repeatIndex * this.eachRepeatDuration;
            var repeatRunTime:Number = docTime - currentRepeatStartTime;
            if (repeatRunTime == 0 && repeatIndex > 0) {
                return repeatIndex -1;
            }
            else {
                return repeatIndex;
            }
        }

        protected function getRepeatIntervalFraction(docTime:Number):Number {
            // current active interval or most recently completed interval
            if (this.eachRepeatDuration == INDEFINITE) return 0;
            docTime = Math.min(docTime, this.currentEndTime);
            var currentRepeatStartTime:Number = this.currentBeginTime + this.getRepeatIndex(docTime) * this.eachRepeatDuration;
            var repeatRunTime:Number = docTime - currentRepeatStartTime;

            return Math.min(1.0, repeatRunTime / eachRepeatDuration);
        }

        public function beginElement():Boolean {
            return beginElementAt(0);
        }

        public function beginElementAt(offset:Number):Boolean {
            // XXX return value doesn't account for processing of pending time instances
            var docTime:Number = this.svgRoot.getDocTime() + offset;
            if (docTime < currentBeginTime) return(false);  // negative offset could cause this
            addBeginInstance(docTime);
            // jump start immediate animations so they run in order
            var now:Number =this.svgRoot.getDocTime();
            checkBeginInstances(now);
            return ( (restart=="always") ||
                     (!this.active && ( (restart!="never")  || neverStarted)));
        }

        public function endElement():Boolean {
            return endElementAt(0);
        }

        public function endElementAt(offset:Number):Boolean {
            // XXX return value doesn't account for processing of pending time instances
            var docTime:Number = this.svgRoot.getDocTime();
            if ( (docTime + offset) < currentBeginTime) return(false);  // negative offset could cause this
            addEndInstance(docTime + offset);
            return this.active;
        }

    }
}
