package org.svgweb.core
{

    import org.svgweb.nodes.SVGSVGNode;

    import flash.display.Sprite;
    import flash.events.ContextMenuEvent;
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import flash.ui.ContextMenu;
    import flash.ui.ContextMenuItem;
    import flash.net.navigateToURL;

    public class SVGViewer extends Sprite
    {
        public var svgRoot:SVGSVGNode;
        
        // flag that indicates whether this viewer is in the middle of a 
        // suspendRedraw operation
        public var isSuspended:Boolean = false;

        protected var urlLoader:URLLoader;
        protected var context:ContextMenu;

        public function SVGViewer() {
            //customizeContextMenu();

            XML.ignoreProcessingInstructions = true;
            XML.ignoreComments = true;
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
        
        public function customizeContextMenu():void {
            context = new ContextMenu();
            
            // Rev below is a Subversion keyword that will get replaced
            // by the latest release number in our Subversion repository
            // Issue 356: Show SVG Web Release Name and Revision in Right Click Menu
            // http://code.google.com/p/svgweb/issues/detail?id=356
            // We only show the release number for now
            var releaseNumber:String = "$Rev: 984 $".replace(/Rev./g, "").replace(/\$/g, "");
            var itemAbout:ContextMenuItem = new ContextMenuItem("About SVG Web (r" + releaseNumber + ")");
            var itemBug:ContextMenuItem = new ContextMenuItem("Report Issue with SVG Web ");
            itemAbout.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, aboutSVGWeb);
            itemBug.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, reportBug);
            this.contextMenu = context;
            this.contextMenu.customItems.push(itemAbout);
            this.contextMenu.customItems.push(itemBug);

            function aboutSVGWeb():void {
                navigateToURL(new URLRequest("http://code.google.com/p/svgweb/"));
            }
            function reportBug():void {
                navigateToURL(new URLRequest("http://code.google.com/p/svgweb/issues/list"));
            }
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
