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
    import org.svgweb.utils.SVGUnits;
    import org.svgweb.core.SVGTimedNode;

    public class TimeSpec
    {
        public static const EVENT_NAMES:Array = ['begin','end', 'repeat', 'click',
                                                 'mousedown',  'mouseup', 'mousemove',
                                                 'mouseover', 'mouseout', 'repeat'];

        static public function parseTimeSpec(instanceType:String, timeSpecString:String, node:SVGTimedNode):TimeSpec {
            if (timeSpecString.indexOf("wallclock") != -1) {
                return parseWallclockTimeSpec(timeSpecString);
            }
            else {
                var ets:EventTimeSpec = parseEventTimeSpec(instanceType, timeSpecString, node);
                if (ets != null) return ets;
            }
            if (timeSpecString.indexOf("indefinite") != -1) {
                return new IndefiniteTimeSpec();
            }
            else {
                return parseOffsetTimeSpec(timeSpecString);
            }
        }

        static public function parseWallclockTimeSpec(timeSpecString:String):WallclockTimeSpec {
            return new WallclockTimeSpec(timeSpecString);
        }

        static public function parseEventTimeSpec(instanceType:String, timeSpecString:String, node:SVGTimedNode):EventTimeSpec {
            // "click", "click+5s", "click+0.5s", "id.begin", "id.begin+5s", "id.begin+0.5s"
            var parts:Array = timeSpecString.split(".");
            if (parts.length == 1) {  // event-ref with implied id
                if (node.svgParent == null) return null;
                parts.unshift(node.svgParent.id);  // XXX targetNode may be referenced by xlink:href
            }
            else if (parts.length == 2) {
                // can either be id.eventName[+1s] or eventref+1.0s
                if (parts[0].match(/[\+\-]/)) {  // the latter  
                    //prepend the id
                    if (parts[0].indexOf("repeat") == 0) {
                        parts.unshift(node.id);  // could be null ?
                    }
                    else {
                        if (node.svgParent == null) return null;
                        parts.unshift(node.svgParent.id);  // could be null ?
                    }                            
                }
            }
            // If event spec had a decimal offset, don't split that off
            if (parts.length == 3) {
                parts[1] = parts[1]+"."+parts[2];
                parts.splice(2,1);
            }

            if (parts.length != 2) {
                return null;
            }
            else {
                var eventTarget:String = parts[0];

                var eventSpec:String = parts[1];
                var eventName:String;
                var eventParts:Array;
                var offset:Number;

                if (eventSpec.indexOf("+") != -1) {
                    eventParts = eventSpec.split(/\+/);
                    eventName =  SVGUnits.trim(eventParts[0]);
                    offset=SVGUnits.parseTimeVal(eventParts[1]);
                }
                else if (eventSpec.indexOf("-") != -1) {
                    eventParts = eventSpec.split(/-/);
                    eventName =  SVGUnits.trim(eventParts[0]);
                    offset= -1*SVGUnits.parseTimeVal(eventParts[1]);
                }
                else {
                    eventName =  SVGUnits.trim(eventSpec);
                    offset= 0;
                }

                var eventNameParts:Array;
                var eventParam:String;
                if (eventName.indexOf("(") != -1) {
                    eventNameParts=eventName.split("(");
                    eventName=eventNameParts[0];
                    eventParam=eventNameParts[1];
                    eventParam=eventParam.replace(')','');
                }
    
                if (EVENT_NAMES.indexOf(eventName) == -1) return null;

                return new EventTimeSpec(instanceType, // begin or end instance
                                         eventTarget, // Id
                                         eventName,   // Event name
                                         eventParam,  // Optional event parameter
                                         offset,      // Offset
                                         node);       // node
            }
        }
    
        static public function parseOffsetTimeSpec(timeSpecString:String):OffsetTimeSpec {
            return new OffsetTimeSpec(timeSpecString, SVGUnits.parseTimeVal(timeSpecString));
        }
    }

}
