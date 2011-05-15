/*
 Copyright (c) 2009 by contributors:

 * James Hight (http://labs.zavoo.com/)
 * Richard R. Masters
 * Google Inc. (Brad Neuberg - http://codinginparadise.org)

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

/*
 SVGViewer is a flash sprite which is the parent for a tree of SVGNodes
 which are sprites initialized from XML. The top most SVGNode is an SVGSVGNode.
 
 The xml is parsed and xml children are walked when the object is rendered.
 Child SVGNodes are added and when they are rendered, their xml is walked
 and so on.
*/


package org.svgweb
{    
    import org.svgweb.core.SVGNode;
    import org.svgweb.core.SVGSprite;
    import org.svgweb.core.SVGViewer;
    import org.svgweb.nodes.SVGSVGNode;
    import org.svgweb.nodes.SVGGroupNode;
    import org.svgweb.nodes.SVGDOMTextNode;
    import org.svgweb.events.SVGEvent;
    import org.svgweb.utils.SVGUnits;
    import org.svgweb.utils.SVGColors;
    
    import flash.display.Sprite;
    import flash.display.StageScaleMode;
    import flash.display.StageAlign;
    import flash.display.LoaderInfo;
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.MouseEvent;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.events.ContextMenuEvent;
    import flash.external.ExternalInterface;
    import flash.geom.Matrix;
    import flash.geom.Point;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import flash.text.TextField;
    import flash.ui.ContextMenu;
    import flash.ui.ContextMenuItem;
    import flash.utils.setTimeout;

    [SWF(frameRate="40", width="2048", height="1024")]
    /**
     * Web container for the SVG Renderer
     **/
    public class SVGViewerWeb extends SVGViewer
    {
        private var js_handler:String = '';
        private var js_uniqueId:String = '';
        private var js_guidLookup:Object = {};
        protected var svgIdParam:String = "";
        public var clipModeParam:String = "useNone";
        protected var scriptSentToJS:Boolean = false;
        protected var xmlString:String;

        protected var renderStartTime:Number;
        protected var debugEnabled:Boolean = true;
        
        protected var objectWidth:Number;
        protected var objectHeight:Number;

        // The delimiter we use when passing arguments between Flash and
        // JavaScript; performance testing showed this to be an important
        // bottleneck, so we do various tricks to make it fast
        protected var DELIMITER:String = '__SVG__DELIMIT';
        
        // The delimiter between each method that we have bunched up for later
        // execution during a suspendRedraw session; used for unsuspendRedrawAll
        protected var METHOD_DELIMITER:String = '__SVG__METHOD__DELIMIT';
        
        // If we send over a DocumentFragment, we represent these internally
        // using the tag <__document__fragment> followed by all of the nested
        // DocumentFragment children
        protected var DOCUMENT_FRAGMENT:String = '__document__fragment';

        public function SVGViewerWeb():void {
            this.setupJavaScriptInterface();
            //this.debug('SVGViewerWeb constructor');
            this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            stage.addEventListener(Event.RESIZE, handleResize);
            super();
        }

        protected function onAddedToStage(event:Event = null):void {
            this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

            this.stage.align = StageAlign.TOP_LEFT;
            this.stage.scaleMode = StageScaleMode.NO_SCALE;

            this.processHTMLParameters();
        }

        /**
         * process html <object> parameters
         **/
        protected function processHTMLParameters():void {
            var paramsObj:Object = LoaderInfo(this.root.loaderInfo).parameters;
            var svgURLParam:String = "";
            var sourceTypeParam:String = "";
            var item:String;

            for (item in paramsObj) {
                if (item == "clipMode") {
                    this.clipModeParam = paramsObj[item];
                }
                if (item == "sourceType") {
                    sourceTypeParam = paramsObj[item];
                }
                if (item == "svgURL") {
                    svgURLParam = paramsObj[item];
                }
                if (item == "svgId") {
                    this.svgIdParam = paramsObj[item];
                }
            }

            // notify browser javascript that we are loaded
            try {
                var result:Object = ExternalInterface.call(
                                            this.js_handler + "onMessage",
                                            this.msgToString( 
                                                        { type: 'event', 
                                                          eventType: 'onFlashLoaded', 
                                                          uniqueId: this.js_uniqueId 
                                                        } 
                                            ));
            }
            catch(error:SecurityError) {
                var debugstr:String = "Security Error on ExternalInterface.call(...). ";
                if (this.root.loaderInfo.loaderURL.substring(0,4) == "file") {
                    debugstr += "This is expected when loaded from a local file.";
                }
                this.debug(debugstr);
            }
        }

        /**
         * Load methods.
         **/

        protected function setSVGString(xmlStringParam:String, objectURL:String = '', pageURL:String = '',
                                        ignoreWhiteSpace:Boolean = false):void {
            //start('setSVGString');
            // FIXME: TODO: Respect the ignoreWhiteSpace setting
            this.xmlString = SVGViewerWeb.expandEntities(xmlStringParam);
            var dataXML:XML = new XML(this.xmlString);
            while(this.numChildren) {
                this.removeChildAt(0);
            }
            svgRoot = new SVGSVGNode(null, dataXML, null, this, objectURL, pageURL);
            // See comment in handleRootSVGLoad()
            if (   (this.xmlString.indexOf("<animate") != -1)
                || (this.xmlString.indexOf("<set") != -1) ) {
                this.visible = false;
            }
            this.addActionListener(SVGEvent.SVGLoad, svgRoot);
            this.addChild(svgRoot.topSprite);
            //end('setSVGString');
        }

        public static function expandEntities(xmlString:String):String {
            var entityMap:Object = {};
            for each(var myMatch:String in xmlString.match(/.*<!ENTITY\s+(\S+)\s+"([^"]*)"\s*>/mg) ) {
                 var parts:Array = myMatch.match(/.*<!ENTITY\s+(\S+)\s+"([^"]*)"\s*>/m);
                 entityMap[parts[1]]=parts[2];
            }
            for (var myEntity:String in entityMap) {
                xmlString = xmlString.split("&" + myEntity + ";").join(entityMap[myEntity]);
            }
            return xmlString;
        }

        /**
         * JavaScript interface setup
         **/
        protected function setupJavaScriptInterface():void {
            var paramsObj:Object = LoaderInfo(this.root.loaderInfo).parameters;
            // process the parameters to get the unique id
            var item:String;
            for (item in paramsObj) {
                if (item == "uniqueId") {
                    this.js_uniqueId = paramsObj[item];
                    this.js_handler = 'svgweb.handlers["' + this.js_uniqueId 
                                    + '"].';
                }
                if (item == "debug") {
                    if (paramsObj[item] == 'true') {
                        this.debugEnabled = true;
                    }
                    else {
                        this.debugEnabled = false;
                    }
                }
            }

            try {
                // Performance testing found that Flash/JS communication is a
                // primary bottleneck; two things were found to make this
                // faster when calling from JS to Flash: 
                // 1) pass giant strings instead of complex objects
                // over the boundry, and 2) minimize our own custom
                // marshaling code on both sides. Having separate methods for
                // each exposed method makes our marshaling code much simpler,
                // aiding performance.
                // When calling from Flash back to JS, we turn all things
                // into Strings instead of Objects as well; however, we 
                // route everything on that side through an onMessage() method
                // on the JS side since we found we don't need to optimize that
                // into separate methods yet.
                ExternalInterface.addCallback("jsHandleLoad", js_handleLoad);
                ExternalInterface.addCallback("jsHandleResize", js_handleResize);
                ExternalInterface.addCallback("jsSuspendRedraw", js_suspendRedraw);
                ExternalInterface.addCallback("jsUnsuspendRedrawAll", js_unsuspendRedrawAll);
                ExternalInterface.addCallback("jsInsertBefore", js_insertBefore);
                ExternalInterface.addCallback("jsAddChildAt", js_addChildAt);
                ExternalInterface.addCallback("jsRemoveChild", js_removeChild);
                ExternalInterface.addCallback("jsAddEventListener", js_addEventListener);
                ExternalInterface.addCallback("jsSetText", js_setText);
                ExternalInterface.addCallback("jsSetAttribute", js_setAttribute);
                ExternalInterface.addCallback("jsGetAttribute", js_getAttribute);
                ExternalInterface.addCallback("jsAppendChild", js_appendChild);
                ExternalInterface.addCallback("jsGetScreenCTM", js_getScreenCTM);
                ExternalInterface.addCallback("jsMatrixInvert", js_matrixInvert);
                ExternalInterface.addCallback("jsSetCurrentScale", js_setCurrentScale);
                ExternalInterface.addCallback("jsSetCurrentTranslate", js_setCurrentTranslate);
                ExternalInterface.addCallback("jsRemoveAttribute", js_removeAttribute);
            }
            catch(error:SecurityError) {
                var debugstr:String = "Security Error on ExternalInterface.addCallback(...). ";
                if (this.root.loaderInfo.loaderURL.substring(0,4) == "file") {
                    debugstr += "This is expected when loaded from a local file.";
                }
                this.debug(debugstr);
            }
        }

        override public function customizeContextMenu():void {
            var outerthis:SVGViewerWeb = this;
            super.customizeContextMenu();

            // View Source Custom Menu Item
            var itemViewSource:ContextMenuItem = new ContextMenuItem("View SVG Source");
            itemViewSource.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, viewSource);
            this.contextMenu.customItems.push(itemViewSource);
            function viewSource():void {
                try {
                    ExternalInterface.call(outerthis.js_handler + "onMessage",
                                           outerthis.msgToString({ type: 'viewsource' })
                                           );
                }
                catch(error:SecurityError) {
                }
            }

            // View Source Dynamic Custom Menu Item
            var itemViewSourceDynamic:ContextMenuItem = new ContextMenuItem("View SVG Source - Dynamic");
            itemViewSourceDynamic.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, viewSourceDynamic);
            this.contextMenu.customItems.push(itemViewSourceDynamic);
            function viewSourceDynamic():void {
                try {
                    var dynamicXMLString:String = outerthis.svgRoot.getXMLTree(0, true);
                    // backslashes seem to interfere with flash to javascript interface. escape them.
                    dynamicXMLString=dynamicXMLString.replace(/\\/g, '&amp;#92;');
                    ExternalInterface.call(outerthis.js_handler + "onMessage",
                                           outerthis.msgToString(
                                                         { type: 'viewsourceDynamic',
                                                           source: dynamicXMLString
                                                         } 
                                           ));
                }
                catch(error:SecurityError) {
                }

            }

        }
       
        /**
         * Stringifies the object we send back and forth between Flash and JavaScript.
         * Performance testing found that sending strings between Flash and JS is
         * about twice as fast as sending objects.
         **/
        protected function msgToString(msg:Object):String {
            var result:Array = [];
            for (var i:String in msg) {
                result.push(i + ':' + msg[i]);
            }

            // we use a custom delimiter (__SVG__DELIMIT) instead of commas, since 
            // the message might have an XML payload or commas already
            return result.join('__SVG__DELIMIT');
        }

        /**
         * Event handlers from SVG Nodes
         **/
        protected function handleRootSVGLoad():void {
            //this.debug("render time for " + this.js_uniqueId + ": " + ( (new Date()).valueOf()  - this.renderStartTime) + "ms");           

            // FIXME: Hack. If we are hidden due to the presence of animations,
            // then we do not unhide until 200ms into the document time. This
            // provides enough time for the first frame of rendering caused
            // by animations to occur. Currently, the entire tree is first
            // parsed and progressively rendered, without animation effects,
            // because animations may not be parsed yet. Once animations are
            // parsed, they cause new frames to be rendered. These frames
            // should be rendered before anything is visible because the
            // animation effects may have been scheduled to begin at time zero
            // and rendering without them could be bad, like when objects are
            // rendered which would be invisible if animation was working.
            // Since it is difficult to determine exactly when the first 
            // "correct" frames have rendered, we just wait a "long time".
            // A better solution than the 200ms delay is to figure out all the
            // elements that should be rendered with animation effects at frame
            // zero, and unhide exactly when all of these elements have
            // completed rendering initially with animation effects.
            // We would start that tracking here, because the SVGLoad event
            // signals the end of parsing.
            var outerthis:SVGViewer=this;
            setTimeout(function ():void { outerthis.visible = true }, 200); 
     
            var onLoadHandler:String = '';
            if (this.svgRoot.xml.@onload) {
                onLoadHandler = this.svgRoot.xml.@onload;
            }
            try {
                ExternalInterface.call(this.js_handler + "onMessage",  
                                       this.msgToString(
                                            { type: 'event',
                                              eventType: "onRenderingFinished",
                                              width: this.svgRoot.getWidth(),
                                              height: this.svgRoot.getHeight(),
                                              uniqueId: this.js_uniqueId,
                                              onLoad: onLoadHandler 
                                            }
                                        ));
            }
            catch(error:SecurityError) {
            }

            //var counts:Array = this.svgRoot.countTree();
            //this.debug(" Nodes: " + counts[0] +
            //           " DOMText Nodes: " + counts[2] +
            //           " Sprites: " + counts[1] + 
            //           " Avg Sprites: " + counts[1]/counts[0]);

        }

        override public function handleScript(script:String):void {
            // TODO: FIXME: Scripts should be batched up in the order they
            // are in the document and sent over all at once. This will become
            // more important as we support external scripts which load
            // asynchronously; we don't want these to arrive at different times
            // and get executed in the wrong order.
            if (!this.scriptSentToJS) {
                // strip off starting SCRIPT cruft; example: <script><![CDATA
                script = script.replace(/<[A-Za-z\-_0-9]*:?script[^>]*>(<\!\[CDATA\[)?/, '');
                // strip off ending SCRIPT scruft; example: ]]></svg:script>
                script = script.replace(/(]]>)?<\/[A-Za-z\-_0-9]*:?script>$/, '');
                
                try {
                    ExternalInterface.call(this.js_handler + "onMessage",
                                           this.msgToString(
                                                         { type: 'script',
                                                           uniqueId: this.js_uniqueId,
                                                           script: script 
                                                         } 
                                           ));
                }
                catch(error:SecurityError) {
                }
                this.scriptSentToJS=true;
            }
        }

        /**
         * JavaScript interface handlers
         **/
        public function js_handleLoad(msg:String):void {
            this.renderStartTime = (new Date()).valueOf();
            // msg is a string delimited by __SVG__DELIMIT with fields in
            // the following order: objectURL, pageURL, objectWidth, 
            // objectHeight, ignoreWhiteSpace (boolean), svgString
            var args:Array = msg.split(DELIMITER);
            var objectURL:String = args[0];
            var pageURL:String = args[1];
            // Flash/JS bridge transforms nulls/undefined into '' empty strings
            this.objectWidth = SVGUnits.cleanNumber(args[2]);
            this.objectHeight = SVGUnits.cleanNumber(args[3]);
            var ignoreWhiteSpace:Boolean = (args[4] === 'true') ? true : false;
            var svgString:String = this.decodeFlashData(args[5]);
            
            this.setSVGString(svgString, objectURL, pageURL, ignoreWhiteSpace);
            //this.debug("js_handleLoad: object size: " + objectWidth + "," + objectHeight);
            //this.debug("js_handleLoad: stage size: " +
            //           this.stage.stageWidth + "," + this.stage.stageHeight);
            this.scaleX = (this.stage.stageWidth/this.objectWidth)
                           * (this.objectWidth / this.getWidth());
            this.scaleY = (this.stage.stageHeight/this.objectHeight)
                           * (this.objectHeight / this.getHeight());
        }

        /**
         **/
        public function js_handleResize(msg:String):void {
            // msg is a string delimited by __SVG__DELIMIT with fields in
            // the following order: objectWidth, objectHeight
            var args:Array = msg.split(DELIMITER);
            this.objectWidth = SVGUnits.cleanNumber(args[0]);
            this.objectHeight = SVGUnits.cleanNumber(args[1]);
            //this.debug("js_handlResize: object size: " + objectWidth + "," + objectHeight);
            this.scaleX = (this.stage.stageWidth/this.objectWidth)
                           * (this.objectWidth / this.getWidth());
            this.scaleY = (this.stage.stageHeight/this.objectHeight)
                           * (this.objectHeight / this.getHeight());
            if (this.svgRoot) {
                this.svgRoot.applyViewBox();
                this.svgRoot.applyDefaultMask();
            }
        }
        
        
        public function js_removeChild(msg:String):void {
            //this.debug('js_removeChild, msg='+msg);
            // msg has one argument, the elementGUID
            var elementGUID:String = msg;
            
            // Removes the element
            var element:SVGNode = this.svgRoot.getNodeByGUID(elementGUID);                    
            if (!element) {
                this.error('removeChild: GUID not found: '
                           + elementGUID);
            }
            
            element.svgParent.removeSVGChild(element);
        }
        
        public function js_addChildAt(msg:String):void {
            //this.debug('js_addChildAt, msg='+msg);
            // msg is a string delimited by __SVG__DELIMIT with fields in
            // the following order: parentGUID, position, childXML
            var args:Array = msg.split(DELIMITER);
            var parentGUID:String = args[0];
            var position:Number = new Number(args[1]);
            var childXML:String = args[2];
            
            // Get the parent
            var parent:SVGNode = this.svgRoot.getNodeByGUID(parentGUID);
            
            if (!parent) {
                this.error('addChildAt: parent with GUID '
                           + parentGUID + ' not found');
            }
            
            // If this is a DocumentFragment parse into individual children
            var isFragment:Boolean = (childXML.indexOf(DOCUMENT_FRAGMENT) != -1);
            var addMe:Array = this.parseXMLChildren(childXML);
            
            // freeze redraws while adding DocumentFragment children
            var suspendedBefore:Boolean = this.isSuspended;
            if (isFragment) {
                this.isSuspended = true;
            }

            for (var i:int = 0; i < addMe.length; i++) {
                // parse the newly appended element into an SVGNode and 
                // all of its children as well
                var element:SVGNode = parent.parseNode(addMe[i]);
                element.forceParse();
            
                // append things now
                parent.addSVGChildAt(element, position + i);
            }
            
            // unsuspend the display; however, keep the display suspended if 
            // it was suspended before we touched it, such as by a developer
            // calling suspendRedraw.
            if (isFragment && !suspendedBefore) {
                this.isSuspended = false;
                parent.invalidateDisplay();
            }
        }
        
        public function js_insertBefore(msg:String):void {
            //this.debug('js_insertBefore, msg='+msg);
            // msg is a string delimited by __SVG__DELIMIT with fields in
            // the following order: refChildGUID, parentGUID, position,
            // childXML
            var args:Array = msg.split(DELIMITER);
            var refChildGUID:String = args[0];
            var parentGUID:String = args[1];
            var position:Number = new Number(args[2]);
            var childXML:String = args[3];
            
            // Inserts newChild before refChild
            
            // TODO: Test this to see if its working correctly with
            // XML Mixed Content (i.e. content of the form 
            // TEXT<element>foo</element>TEXT)
        
            // get the refChild and the parent
            var refChild:SVGNode = this.svgRoot.getNodeByGUID(refChildGUID);
            if (!refChild) {
                this.error("error:insertBefore: refChildGUID not found: " + refChildGUID);
            }
            
            var parent:SVGNode = this.svgRoot.getNodeByGUID(parentGUID);
            if (!parent) {
                this.error("error:insertBefore: parentGUID not found: " + parentGUID);
            }
            
            // If this is a DocumentFragment parse into individual children
            var isFragment:Boolean = (childXML.indexOf(DOCUMENT_FRAGMENT) != -1);
            var addMe:Array = this.parseXMLChildren(childXML);
            
            // freeze redraws while adding DocumentFragment children
            var suspendedBefore:Boolean = this.isSuspended;
            if (isFragment) {
                this.isSuspended = true;
            }

            for (var i:int = 0; i < addMe.length; i++) {
                // parse the newly appended elements into SVGNode and 
                // all of its children as well
                var element:SVGNode = parent.parseNode(addMe[i]);
                element.forceParse();

                // now insert the element
                parent.insertSVGBefore(position, element, refChild);
            }
            
            // unsuspend the display; however, keep the display suspended if 
            // it was suspended before we touched it, such as by a developer
            // calling suspendRedraw.
            if (isFragment && !suspendedBefore) {
                this.isSuspended = false;
            }
        }
        
        public function js_setAttribute(msg:String):void {
            //this.debug('js_setAttribute, msg='+msg);
            // msg is a string delimited by __SVG__DELIMIT with fields in
            // the following order: elementGUID, applyToStyle (boolean), 
            // attrNamespace, attrName, attrValue
            var args:Array = msg.split(DELIMITER);
            var elementGUID:String = args[0];
            var applyToStyle:Boolean = (args[1] === 'true') ? true : false;
            // Flash/JS bridge transforms nulls/undefined into '' empty strings
            var attrNamespace:String = (args[2] !== '') ? args[2] : null;
            var attrName:String = args[3];
            var attrValue:String = decodeFlashData(args[4]);
            
            var element:SVGNode = this.svgRoot.getNodeByGUID(elementGUID);
            if (!element) {
                this.error('setAttribute: GUID not found: ' + elementGUID);
            }

            if (attrName == 'id') {
                this.svgRoot.unregisterID(element);
            }

            if (applyToStyle) {
                element.setStyle(attrName, attrValue);
            }
            else if (attrNamespace != null) {
                // namespaced attribute, such as xlink:href
                var ns:Namespace = new Namespace(attrNamespace);
                element.xml.@ns::[attrName] = attrValue.toString();
            } else {
                element.setAttribute(attrName, attrValue.toString());
            }

            if (attrName == 'id') {
                this.svgRoot.registerID(element);
            }            
        }
        
         public function js_removeAttribute(msg:String):void {
            //this.debug('js_removeAttribute, msg='+msg);
            // msg is a string delimited by __SVG__DELIMIT with fields in
            // the following order: elementGUID, namespace, localName
            var args:Array = msg.split(DELIMITER);
            var elementGUID:String = args[0];
            // Flash/JS bridge transforms nulls/undefined into '' empty strings
            var ns:String = (args[1] !== '') ? args[1] : null;
            var localName:String = args[2];

            var element:SVGNode = this.svgRoot.getNodeByGUID(elementGUID);
            if (!element) {
                this.error('setAttribute: GUID not found: ' + elementGUID);
            }

            if (ns == null && localName == 'id') {
                this.svgRoot.unregisterID(element);
            }
            
            // ActionScript's XML implementation does not implement
            // removeAttribute or removeAttributeNS, so we have to use
            // this workaround
            if (ns) {
              var nsObj:Namespace = new Namespace(ns);
              delete element.xml.@nsObj::[localName]
            } else {
              delete element.xml.@[localName];
            }
        }
        
        public function js_addEventListener(msg:String):void {
            //this.debug('js_addEventListener, msg='+msg);
            // msg is a string delimited by __SVG__DELIMIT with fields in
            // the following order: elementGUID, eventType
            var args:Array = msg.split(DELIMITER);
            var elementGUID:String = args[0];
            var eventType:String = args[1];
            
            // Get the element to add the event listener to
            var element:SVGNode = this.svgRoot.getNodeByGUID(elementGUID);

            if (element) {
                if (eventType == 'click') {
                    element.topSprite.addEventListener(MouseEvent.CLICK, handleAction);
                }
                if (eventType == 'mouseup') {
                    element.topSprite.addEventListener(MouseEvent.MOUSE_UP, handleAction);
                }
                if (eventType == 'mousedown') {
                    element.topSprite.addEventListener(MouseEvent.MOUSE_DOWN, handleAction);
                }
                if (eventType == 'mousemove') {
                    element.topSprite.addEventListener(MouseEvent.MOUSE_MOVE, handleAction);
                }
                if (eventType == 'mouseover') {
                    element.topSprite.addEventListener(MouseEvent.MOUSE_OVER, handleAction);
                }
                if (eventType == 'mouseout') {
                    element.topSprite.addEventListener(MouseEvent.MOUSE_OUT, handleAction);
                }
            }
            else {
                this.error("addEventListener: GUID not found: " 
                           + elementGUID);
            }
        }
        
        public function js_setText(msg:String):void {
            //this.debug('js_setText, msg='+msg);
            // msg is a string delimited by __SVG__DELIMIT with fields in
            // the following order: parentGUID, elementGUID, text
            var args:Array = msg.split(DELIMITER);
            var parentGUID:String = args[0];
            var elementGUID:String = args[1];
            var textValue:String = decodeFlashData(args[2]);
            
            // Get the parent
            var parent:SVGNode = this.svgRoot.getNodeByGUID(parentGUID);
            if (!parent) {
                this.error("error:setText: parent with GUID not found: " + parentGUID);
            }
            
            // Get the fake text node element
            var element:SVGNode = this.svgRoot.getNodeByGUID(elementGUID);
            if (!element) {
                this.error("error:setText: element with GUID not found: " + elementGUID);
            }
            
            var textNode:SVGDOMTextNode = element as SVGDOMTextNode;
            textNode.nodeValue = textValue;
            
            // Tell its parent that its text value has changed
            if (parent.hasText()) {
                parent.setText(textValue);
                parent.invalidateDisplay();
            }
        }
        
        public function js_appendChild(msg:String):void {
            //this.debug('js_appendChild, msg='+msg);
            // msg is a string delimited by __SVG__DELIMIT with fields in
            // the following order: parentGUID, childXML
            var args:Array = msg.split(DELIMITER);
            var parentGUID:String = args[0];
            var childXML:String = decodeFlashData(args[1]);
            
            // Get the parent node
            var parent:SVGNode = this.svgRoot.getNodeByGUID(parentGUID);
            if (!parent) {
                this.error('appendChild: parent with GUID '
                           + parentGUID + ' not found');
            }
            
            // If this is a DocumentFragment parse into individual children
            var isFragment:Boolean = (childXML.indexOf(DOCUMENT_FRAGMENT) != -1);
            var addMe:Array = this.parseXMLChildren(childXML);
            
            // freeze redraws while adding DocumentFragment children
            var suspendedBefore:Boolean = this.isSuspended;
            if (isFragment) {
                this.isSuspended = true;
            }
                
            for (var i:int = 0; i < addMe.length; i++) {
                // parse the newly appended elements into SVGNode and 
                // all of its children as well
                var element:SVGNode = parent.parseNode(addMe[i]);
                element.forceParse();
            
                // now actually append the element to our display
                parent.appendSVGChild(element);
            }
            
            // unsuspend the display; however, keep the display suspended if 
            // it was suspended before we touched it, such as by a developer
            // calling suspendRedraw.
            if (isFragment && !suspendedBefore) {
                this.isSuspended = false;
            }
        }
        
        public function js_getAttribute(msg:String):String {
            //this.debug('js_getAttribute, msg='+msg);
            // msg is a string delimited by __SVG__DELIMIT with fields in
            // the following order: elementGUID, getFromStyle (boolean),
            // applyAnimations (boolean), attrNamespace, attrName,
            // onlyUseXML (boolean)
            var args:Array = msg.split(DELIMITER);
            var elementGUID:String = args[0];
            var getFromStyle:Boolean = (args[1] === 'true') ? true : false;
            var applyAnimations:Boolean = (args[2] === 'true') ? true : false;
            // Flash/JS bridge transforms nulls/undefined into '' empty strings
            var attrNamespace:String = (args[3] !== '') ? args[3] : null;
            var attrName:String = args[4];
            var onlyUseXML:Boolean = (args[5] === 'true') ? true : false;
            
            var element:SVGNode = this.svgRoot.getNodeByGUID(elementGUID);
            if (!element) {
                this.error('getAttribute: GUID not found: '
                           + elementGUID);
            }

            var attrValue:String;
            var ns:Namespace;
            if (attrNamespace) {
              ns = new Namespace(attrNamespace);
              attrValue = element.xml.@ns::[attrName];
            } else {
              attrValue = element.xml.@[attrName];
            }
            
            if (onlyUseXML) {
              return attrValue;
            }
            
            if (typeof(attrValue) != 'undefined' && attrValue != null) {
                if (getFromStyle) {
                    attrValue = element.getStyle(attrName, null, false);
                    
                    // Firefox and Safari both return '' for
                    // default inherited styles (i.e. if I check
                    // someNode.style.display, I get an empty string
                    // rather than 'inline'), so only get 
                    // explicitly set styles on this node
                    if (attrValue == null) {
                        attrValue = '';
                    }
                }
                else {
                    attrValue = element.getAttribute(attrName, null, 
                                                     false, applyAnimations, false);
                }
            }
            
            return attrValue;
        }
        
        public function js_suspendRedraw():void {
            this.isSuspended = true;
        }
        
        public function js_unsuspendRedrawAll(msg:String):void {
            //this.debug('js_unsuspendRedrawAll, msg='+msg);
            // msg is delimited a bit differently than the other js_* methods;
            // each portion is a Flash method name, followed by a colon, 
            // followed by the string message to send to that method name. Each
            // of these portions is separated by the delimiter 
            // __SVG__METHOD__DELIMITER
            if (msg != '') {
                var methods:Array = msg.split(this.METHOD_DELIMITER);
                for (var i:int = 0; i < methods.length; i++) {
                    var colonAt:int = methods[i].indexOf(':');
                    var invoke:String = methods[i].substring(0, colonAt);
                    var message:String = methods[i].substring(colonAt + 1);
                    switch (invoke) {
                        case 'jsInsertBefore':
                            this.js_insertBefore(message);
                            break;
                        case 'jsAddChildAt':
                            this.js_addChildAt(message);
                            break;
                        case 'jsRemoveChild':
                            this.js_removeChild(message);
                            break;
                        case 'jsAddEventListener':
                            this.js_addEventListener(message);
                            break;
                        case 'jsSetText':
                            this.js_setText(message);
                            break;
                        case 'jsSetAttribute':
                            this.js_setAttribute(message);
                            break;
                        case 'jsAppendChild':
                            this.js_appendChild(message);
                            break;
                        case 'jsHandleResize':
                            this.js_handleResize(message);
                            break;
                        case 'jsSetCurrentScale':
                            this.js_setCurrentScale(message);
                            break;
                        case 'jsSetCurrentTranslate':
                            this.js_setCurrentTranslate(message);
                            break;
                        case 'jsRemoveAttribute':
                            this.js_removeAttribute(message);
                            break;
                        default:
                            this.error('Unknown unsuspendRedrawAll method: ' + invoke);
                            break;
                    }
                }
            }
            
            this.isSuspended = false;
        }

        public function js_getScreenCTM(msg:String):String {
            // msg is a string delimited by __SVG__DELIMIT with fields in
            // the following order: elementGUID
            var args:Array = msg.split(DELIMITER);
            var elementGUID:String = args[0];
            
            // Get the element to add the event listener to
            var element:SVGNode = this.svgRoot.getNodeByGUID(elementGUID);

            if (element) {
                var m:Matrix = element.viewBoxSprite.transform.concatenatedMatrix.clone();

                // screenCTM counts the object position as part of its
                // transform, but flash does not, so we have to correct that.
                m.invert();
                var xStr:String = element.getStyleOrAttr('x');
                var yStr:String = element.getStyleOrAttr('y');
                m.translate(SVGColors.cleanNumber2(xStr, element.getWidth()),
                            SVGColors.cleanNumber2(yStr, element.getHeight()));
                m.invert();

                // native getScreenCTM ignores zoom and so shall we.
                var rootMatrix:Matrix = this.svgRoot.topSprite.transform.concatenatedMatrix.clone();
                rootMatrix.invert();
                m.concat(rootMatrix);

                return this.msgToString({ type: 'matrix',
                                          a: m.a, b: m.b,
                                          c: m.c, d: m.d,
                                          e: m.tx, f: m.ty
                                        });
                return retVal;
            }
            else {
                this.error("getScreenCTM: GUID not found: " 
                           + elementGUID);
            }
            return null;
        }

        public function js_matrixInvert(msg:String):String {
            // msg is a string delimited by __SVG__DELIMIT with fields in
            // the following order: a,b,c,d,e,f
            var args:Array = msg.split(DELIMITER);
            var a:Number = Number(args[0]);
            var b:Number = Number(args[1]);
            var c:Number = Number(args[2]);
            var d:Number = Number(args[3]);
            var e:Number = Number(args[4]);
            var f:Number = Number(args[5]);

            var m:Matrix = new Matrix(a,b,c,d,e,f);
            m.invert();
            return this.msgToString({ type: 'matrix',
                                      a: m.a, b: m.b,
                                      c: m.c, d: m.d,
                                      e: m.tx, f: m.ty
                                    });
        }
        
        public function js_setCurrentScale(msg:String):void {
            // msg is a string with only one value, the new scale
            var newValue:Number = Number(msg);
            
            this.svgRoot.currentScale = newValue;
            this.svgRoot.zoomAndPan();
        }
        
        public function js_setCurrentTranslate(msg:String):void {
          // msg is a string delimited by __SVG__DELIMIT with fields in
          // the following order: the string 'x', 'y', or 'xy' on which to set,
          // followed by the new value. If 'xy' then followed by another
          // value.
           var args:Array = msg.split(DELIMITER);
           var setMe:String = args[0];
           var newValue:Number = Number(args[1]);
           var newValue2:Number = Number(args[2]);
           if (setMe == 'xy') {
             this.svgRoot.currentTranslate.x = newValue;
             this.svgRoot.currentTranslate.y = newValue2;
           } else if (setMe == 'x') {
             this.svgRoot.currentTranslate.x = newValue;
           } else {
             this.svgRoot.currentTranslate.y = newValue;
           }
           
           this.svgRoot.zoomAndPan();
        }

        override public function addActionListener(eventType:String, target:EventDispatcher):void {
            if (!target.hasEventListener(eventType)) {
                target.addEventListener(eventType, handleAction);
            } 
        }

        override public function removeActionListener(eventType:String, target:EventDispatcher):void {
            if (target.hasEventListener(eventType)) {
                target.removeEventListener(eventType, handleAction);
            } 
        }

        protected function handleAction(event:Event):void {
            switch(event.type) {
                case SVGEvent.SVGLoad:
                    handleRootSVGLoad();
                    break;
                case MouseEvent.CLICK:
                case MouseEvent.MOUSE_DOWN:
                case MouseEvent.MOUSE_MOVE:
                case MouseEvent.MOUSE_OUT:
                case MouseEvent.MOUSE_OVER:
                case MouseEvent.MOUSE_UP:
                    js_sendMouseEvent(MouseEvent(event));
                    break;

                default:
                    trace("handleAction: Event not found");
            }
        }

        protected function handleResize(event:Event):void {
            this.scaleX = (this.stage.stageWidth/this.objectWidth) * (this.objectWidth / this.getWidth());
            this.scaleY = (this.stage.stageHeight/this.objectHeight) * (this.objectHeight / this.getHeight());
        }

        public function js_sendMouseEvent(event:MouseEvent):void {
            if (   ( event.target is SVGSprite || event.target is TextField ) 
                && ( event.currentTarget is SVGSprite ) ) {
                if (event.target is SVGSprite ) {
                    var targetNode:SVGNode = SVGSprite(event.target).svgNode;
                }
                else {
                    targetNode = SVGSprite(event.currentTarget).svgNode;
                }
                var currentTargetNode:SVGNode = SVGSprite(event.currentTarget).svgNode;
                var scriptCode:String;

                if ( (targetNode != null) &&
                     (currentTargetNode != null) ) { 

                    switch(event.type) {
                        case MouseEvent.CLICK:
                            scriptCode = targetNode.getAttribute('onclick');
                            break;
                        case MouseEvent.MOUSE_DOWN:
                            scriptCode = targetNode.getAttribute('onmousedown');
                            break;
                        case MouseEvent.MOUSE_MOVE:
                            scriptCode = targetNode.getAttribute('onmousemove');
                            break;
                        case MouseEvent.MOUSE_OUT:
                            scriptCode = targetNode.getAttribute('onmouseout');
                            break;
                        case MouseEvent.MOUSE_OVER:
                            scriptCode = targetNode.getAttribute('onmouseover');
                            break;
                        case MouseEvent.MOUSE_UP:
                            scriptCode = targetNode.getAttribute('onmouseup');
                            break;
                    }

                    var mousePoint:Point = new Point(event.stageX, event.stageY);
                    // native getScreenCTM ignores zoom and so shall we.
                    var rootMatrix:Matrix = this.svgRoot.topSprite.transform.concatenatedMatrix.clone();
                    rootMatrix.invert();
                    mousePoint = rootMatrix.transformPoint(mousePoint);


                    try {
                        ExternalInterface.call(this.js_handler + "onMessage",
                           this.msgToString(
                                   { type: 'event',
                                     uniqueId: this.js_uniqueId,
                                     targetGUID: targetNode.guid,
                                     currentTargetGUID: currentTargetNode.guid,
                                     eventType: event.type.toLowerCase(),
                                     localX: event.localX,
                                     localY: event.localY,
                                     stageX: mousePoint.x,
                                     stageY: mousePoint.y,
                                     altKey: event.altKey,
                                     ctrlKey: event.ctrlKey,
                                     shiftKey: event.shiftKey,
                                     scriptCode: scriptCode
                                   } 
                            )
                        );
                    }
                    catch(error:SecurityError) {
                    }
                }
            }
        }

        override public function getWidth():Number {
            return this.objectWidth;
        }

        override public function getHeight():Number {
            return this.objectHeight;
        }

        public function getClipMode():String {
            return clipModeParam;
        }


        override public function debug(debugMessage:String):void {
            if (this.debugEnabled) {
                if (debugMessage.indexOf(this.DELIMITER) != -1) {
                    debugMessage = debugMessage.replace(new RegExp(this.DELIMITER, 'g'), ',');
                }
                
                try {
                    ExternalInterface.call(this.js_handler + 'onMessage',
                                           this.msgToString(
                                               { type: 'log',
                                                 uniqueId: this.js_uniqueId,
                                                 logString: debugMessage
                                                } 
                                           ));
                }
                catch(error:SecurityError) {
                }
            }
        }
        
        override public function error(message:String):void {
            if (this.debugEnabled) {     
                if (message.indexOf(this.DELIMITER) != -1) {
                    message = message.replace(new RegExp(this.DELIMITER, 'g'), ',');
                }
                       
                try {
                    ExternalInterface.call(this.js_handler + 'onMessage',
                                           this.msgToString(
                                                   { type: 'error',
                                                     uniqueId: this.js_uniqueId,
                                                     logString: message
                                                    } 
                                           ));
                }
                catch(error:SecurityError) {
                }
            }
        }
        
        /** Functions for profiling. */
        override public function start(subject:String, subjectStarted:String = null):void {
            ExternalInterface.call('start', subject, subjectStarted);
        }
        
        /** Functions for profiling. */
        override public function end(subject:String, subjectStarted:String = null):void {
            ExternalInterface.call('end', subject, subjectStarted);
        }
        
        /** Functions for profiling. */
        override public function increment(subject:String, amount:int):void {
            ExternalInterface.call('increment', subject, amount);
        }
        
        /**
            Stringifies the msg object sent back from the Flash SVG renderer
            to help with debugging.
        */
        public function debugMsg(msg:Object):String {
            if (this.debugEnabled) {
                var result:Array = [];
                for (var i:* in msg) {
                    result.push(i + ': ' + msg[i]);
                }
                return '{' + result.join(', ') + '}';
            } else {
                return null;
            }
        }
        
        /** Flash has a bug over the Flash/JS boundry where ampersands
            get corrupted, such as in entities like &quot; 
            As a workaround we turned ampersands into the temporary
            token __SVG__AMPERSAND before sending it over to Flash. */
        protected function decodeFlashData(str:String):String {
            if (str === null) {
                return str;
            }
            
            return str.replace(/__SVG__AMPERSAND/g, '&');
        }
        
        /** Will parse an XML string of nodes into an array. Useful for
            the various append methods like appendChild. Sometimes we will
            be given just a single XML node with children, such as 
            <g><circle/><g>, other times we will be handed a DocumentFragment
            with multiple siblings:
            <__document__fragment>
              <circle/>
              <circle/>
              <circle/>
            </__document__fragment>
            
            If handed a DocumentFragment, we remove the <__document__fragment>
            wrapper and hand back all the children.
            
            @param xmlStr String of XML to parse.
            
            @returns An Array of parsed XML nodes.
        */
        protected function parseXMLChildren(xmlStr:String):Array {
            var results:Array = [];
            
            if (xmlStr.indexOf(DOCUMENT_FRAGMENT) != -1) {
                // DocumentFragment
                var parsedChildren:XML = new XML(decodeFlashData(xmlStr));
                var totalChildren:int = parsedChildren.*.length();
                // as we remove our children the size of the childNodes array
                // will change out from under us, so we just always grab the
                // first child then remove it a total number of times as there
                // are children
                for (var i:int = 0; i < totalChildren; i++) {
                    // get the child, then remove it from our DocumentFragment
                    // parent so that the parentNode will correctly be null;
                    // we don't want to re-clone the child and all its children
                    // as that would be slow
                    results.push(parsedChildren.*[0]);
                    delete parsedChildren.*[0]; // e4x way to remove a child
                }
            } else {
                // individual child
                results.push(new XML(xmlStr));
            }
            
            return results; 
        }
    }
}
