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
    import flash.events.MouseEvent;
    import org.svgweb.events.SVGEvent;

    public class EventTimeSpec extends TimeSpec
    {
        public var nodeID:String;
        public var eventName:String;
        public var eventParam:String;
        public var eventType:String;
        public var offset:Number;

        public function EventTimeSpec(nodeID:String, eventName:String,
                                      eventParam:String, offset:Number):void {
            this.nodeID = nodeID;
            this.eventName = eventName;
            this.eventParam = eventParam;
            this.offset = offset;
            switch (eventName) {
                case "click":
                    this.eventType = MouseEvent.CLICK;
                    break;
                case "mousedown":
                    this.eventType = MouseEvent.MOUSE_DOWN;
                    break;
                case "mousemove":
                    this.eventType = MouseEvent.MOUSE_MOVE;
                    break;
                case "mouseout":
                    this.eventType = MouseEvent.MOUSE_OUT;
                    break;
                case "mouseover":
                    this.eventType = MouseEvent.MOUSE_OVER;
                    break;
                case "mouseup":
                    this.eventType = MouseEvent.MOUSE_UP;
                    break;
                case "begin":
                    this.eventType = SVGEvent._SVGAnimBegin;
                    break;
                case "end":
                    this.eventType = SVGEvent._SVGAnimEnd;
                    break;
                case "repeatEvent":
                    this.eventType = SVGEvent._SVGAnimRepeat;
                    break;
                case "accessKey":
                    this.eventType = SVGEvent._SVGAccessKey;
                    break;
            }
        }
    }
}
