package org.svgweb.core
{

    import org.svgweb.nodes.SVGSVGNode;

    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import flash.net.navigateToURL;

    public class SVGViewer extends Sprite
    {
        public var svgRoot:SVGSVGNode;
        
        // flag that indicates whether this viewer is in the middle of a 
        // suspendRedraw operation
        public var isSuspended:Boolean = false;

        protected var urlLoader:URLLoader;

        public function SVGViewer() {

            XML.ignoreProcessingInstructions = false;
            XML.ignoreComments = false;
            super();
        }

        public function loadURL(url:String):void {
            urlLoader = new URLLoader();
            urlLoader.load(new URLRequest(url));
            urlLoader.addEventListener(Event.COMPLETE, onComplete);
            urlLoader.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
            urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
        }

        protected function onComplete(event:Event):void {
            xml = new XML(urlLoader.data);
            urlLoader = null;
        }

        protected function onIOError(event:IOErrorEvent):void {
            trace("IOError: " + event.text);
            urlLoader = null;
        }

        protected function onSecurityError(event:SecurityErrorEvent):void {
            trace("SecurityError: " + event.text);
            urlLoader = null;
        }

        public function getWidth():Number {
            return 0;
        }

        public function getHeight():Number {
            return 0;
        }

        public function set xml(value:XML):void {
            if (svgRoot != null) {
                this.removeChild(svgRoot.topSprite);
            }
            svgRoot = new SVGSVGNode(null, value, null, this);
            this.addChild(svgRoot.topSprite);
        }

        public function get xml():XML {
            return this.svgRoot.xml;
        }

        public function handleScript(script:String):void {

        }

        public function addActionListener(eventType:String, target:EventDispatcher):void {

        }

        public function removeActionListener(eventType:String, target:EventDispatcher):void {

        } 
        
        public function debug(debugMessage:String):void {
        }
        
        public function error(message:String):void {
            this.debug(message);
        }
        
        /** Functions for profiling. */
        public function start(subject:String, subjectStarted:String = null):void {
        }
        
        /** Functions for profiling. */
        public function end(subject:String, subjectStarted:String = null):void {
        }
        
        /** Functions for profiling. */
        public function increment(subject:String, amount:int):void {
        }

    }
}
