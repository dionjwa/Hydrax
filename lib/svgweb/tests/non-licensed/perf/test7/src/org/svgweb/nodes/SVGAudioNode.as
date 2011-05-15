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
    import org.svgweb.core.SVGNode;
    import org.svgweb.core.SVGTimedNode;
    import org.svgweb.utils.SVGColors;
    import flash.events.Event;
    import flash.events.ProgressEvent;
    import flash.events.IOErrorEvent;
    import flash.net.URLRequest;
    import flash.media.Sound;
    import flash.media.SoundChannel;

    public class SVGAudioNode extends SVGTimedNode {
        protected var sound:Sound;
        protected var channel:SoundChannel;

        public function SVGAudioNode(svgRoot:SVGSVGNode, xml:XML, original:SVGNode = null):void {
            super(svgRoot, xml, original);
        }

        override protected function onAddedToStage(event:Event):void {
            super.onAddedToStage(event);

            // Get the sound location
            var audioHref:String = this.getAttribute('href');
            if (!audioHref) {
                return;
            }

            // Prepend the xml:base
            var xmlBase:String = this.getAttribute('base');
            if (xmlBase && xmlBase != '') {
                audioHref = xmlBase + audioHref;
            } else if (this.svgRoot.objectURL 
                        && audioHref.length > 0
                        && audioHref.charAt(0) != '/') {
                // If no xml:base, expand the URL relative to the location of
                // the SVG file itself
                audioHref = this.svgRoot.objectURL + audioHref;
            }

            // Load the sound
            var mySoundReq:URLRequest = new URLRequest(audioHref);
            sound = new Sound();
            sound.addEventListener(ProgressEvent.PROGRESS, progressHandler);
            sound.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            sound.load(mySoundReq);
        }

        protected function progressHandler(event:ProgressEvent):void {
            if (this.eachRepeatDuration ==  INDEFINITE) {
                this.eachRepeatDuration = sound.length;
            }
        }

        protected function ioErrorHandler(event:IOErrorEvent):void {
        }

        override protected function repeatIntervalStarted():void {
            super.repeatIntervalStarted();
            channel = sound.play(0);
        }

        override protected function repeatIntervalEnded():void {
            super.repeatIntervalEnded();
            channel.stop();
        }
    }
}
