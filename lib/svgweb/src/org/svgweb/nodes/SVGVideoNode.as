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
    import org.svgweb.utils.SVGUnits;
    import flash.events.Event;
    import flash.events.NetStatusEvent;
    import flash.net.NetConnection;
    import flash.net.NetStream;
    import flash.media.Video;

    public class SVGVideoNode extends SVGTimedNode {
        protected var video:Video;
        protected var netStream:NetStream;
        protected var videoHref:String;

        public function SVGVideoNode(svgRoot:SVGSVGNode, xml:XML, original:SVGNode = null):void {
            super(svgRoot, xml, original);
        }

        override protected function onAddedToStage(event:Event):void {
            super.onAddedToStage(event);

            var connection:NetConnection = new NetConnection();
            connection.connect(null);
       
            netStream = new NetStream(connection);
            netStream.addEventListener(NetStatusEvent.NET_STATUS, handleNetEvent);

            // See http://www.adobe.com/devnet/flash/quickstart/metadata_cue_points/
            function onMetaDataHandler(meta:Object):void {
                //this.dbg("meta: " + meta);
            }
            netStream.client = {onMetaData:onMetaDataHandler};
       
            var _width:Number = SVGUnits.parseNum(this.getAttribute('width', '0'));
            var _height:Number = SVGUnits.parseNum(this.getAttribute('height', '0'));
            video = new Video(_width, _height);
            video.attachNetStream(netStream);

            this.viewBoxSprite.addChild(video);
        }

        protected function handleNetEvent(status:NetStatusEvent):void {
            //this.dbg("netevent: " + status.info.code);
            if (status.info.level == 'error') {
                this.err("Video error for " + videoHref + ": " + status.info.code);
            }
        }


        override protected function setAttributes():void {
            super.setAttributes();
            if (video) {
                video.width = SVGUnits.parseNum(this.getAttribute('width', '0'));
                video.height = SVGUnits.parseNum(this.getAttribute('height', '0'));
            }
        }

        override protected function repeatIntervalStarted(docTime:Number):void {
            super.repeatIntervalStarted(docTime);

            // Get the video location
            videoHref = this.getAttribute('href');
            if (!videoHref) {
                return;
            }

            // Prepend the xml:base
            var xmlBase:String = this.getAttribute('base');
            if (xmlBase && xmlBase != '') {
                videoHref = xmlBase + videoHref;
            } else if (this.svgRoot.pageURL 
                        && videoHref.length > 0
                        && videoHref.charAt(0) != '/'
                        && new RegExp("^[^:]+:/").test(videoHref) == false) {
                // If no xml:base, expand the URL relative to the location of
                // the containing HTML page; NetStream resolves everything
                // relative to the SWF file itself
                videoHref = this.svgRoot.pageURL + this.svgRoot.objectURL + videoHref;
            }

            if (netStream) {
                netStream.play(videoHref);
            }
        }

        override protected function repeatIntervalEnded(docTime:Number):void {
            super.repeatIntervalEnded(docTime);
            if (netStream) {
                netStream.pause();
            }
        }

    }
}
