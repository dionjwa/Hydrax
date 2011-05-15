/*
 Copyright (c) 2009 by contributors:

 * James Hight (http://labs.zavoo.com/)
 * Richard R. Masters
 * Google Inc. (Brad Neuberg -- http://codinginparadise.org)

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
    import org.svgweb.core.SVGViewer;
    import org.svgweb.events.SVGEvent;
    import flash.geom.Matrix;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.utils.getTimer;
    import org.svgweb.utils.ImageLoader;

    public class SVGSVGNode extends SVGNode
    {
        protected var parentSVGRoot:SVGSVGNode = null;
        private var _pendingRenderCount:int;
        protected var firedOnLoad:Boolean = false;
        protected var loadTime:int = -1; // milliseconds
        protected var scaleModeParam:String = 'svg_all';

        private var _idLookup:Object;
        private var _guidLookup:Object;
        protected var _referersById:Object;
        protected var _fonts:Object;
        protected var fontListeners:Array = new Array();

        public var title:String;
        
        public var viewer:SVGViewer;
        
        public var currentScale:Number = 1;
        public var currentTranslate:Object = {x: 0, y: 0};

        public var imageCache:Object = new Object();
        private var lastFrameTime:uint = getTimer();
        private var totalFrameTime:uint = 0;
        private var frameCount:uint = 0;
        
        /** If this file was loaded from a URL, such as samples/scimitar.svg,
            then objectURL points to the relative path from which it was
            fetched, such as 'samples/' */
        public var objectURL:String = '';
        
        /** Same as objectURL, but the relative path from the containing HTML
            page. */
        public var pageURL:String = '';
        
        public function SVGSVGNode(svgRoot:SVGSVGNode = null, xml:XML = null, 
                                   original:SVGNode = null,
                                   viewer:SVGViewer = null, objectURL:String = '',
                                   pageURL:String = ''):void {
            this.viewer = viewer;
            this.objectURL = objectURL;
            this.pageURL = pageURL;
            if (svgRoot) {
                this.parentSVGRoot = svgRoot;
            }
            super(this, xml, original);
        }

        public override function set xml(value:XML):void {
            default xml namespace = svg;        
            this._idLookup = new Object();
            this._guidLookup = new Object();
            this._referersById = new Object();
            this._fonts = new Object();    
            super.xml = value;

            // If this is the top SVG element, then start the render tracking process.
            if (this.parentSVGRoot == null) {
                if (this.xml) {
                    if (this.xml.@id) {
                        this._idLookup[this.xml.@id] = this;
                    }
                    this._guidLookup[this.xml.@__guid] = this;
                }
                this._pendingRenderCount = 1;
            }
        }
        
        protected override function onAddedToStage(event:Event):void {
            super.onAddedToStage(event);
            if (!this.parentSVGRoot) {
                topSprite.addEventListener(Event.ENTER_FRAME, updateAnimations);
            }
        }

        protected override function onRemovedFromStage(event:Event):void {
            if (!this.parentSVGRoot) {
                topSprite.removeEventListener(Event.ENTER_FRAME, updateAnimations);
            }
            super.onRemovedFromStage(event);
        }

        public function getDocTime():Number {
            if (this.parentSVGRoot) {
                return this.parentSVGRoot.getDocTime();
            }
            else {
                return (getTimer() - this.loadTime) / 1000.0;
            }
        }

        protected function updateAnimations(event:Event):void {
        /* Frame Counter
            if (this.lastFrameTime > 0) {
                this.totalFrameTime += (getTimer() - this.lastFrameTime);
                this.frameCount++;
                if (this.frameCount % 10 == 0) {
                    this.dbg("last frame time: " + (getTimer() - this.lastFrameTime) +
                         "ms, avg time: " + (this.totalFrameTime/this.frameCount) +
                         "ms avg rate: " + (1000.0/(this.totalFrameTime/this.frameCount)) + " frames/sec");
                    this.totalFrameTime = 0;
                    this.frameCount = 0;
                }
            }
            this.lastFrameTime=getTimer();
        */

            // Nothing to do while the document is loading
            if (this.loadTime == -1) {
                return;
            }
            var svgEvent:SVGEvent = new SVGEvent(SVGEvent._SVGDocTimeUpdate);
            svgEvent.setDocTime( (getTimer() - this.loadTime) / 1000.0 );
            this.dispatchEvent(svgEvent);
        }

        public function seekToDocTime(docTime:Number):void {
            if (this.parentSVGRoot) {
                this.parentSVGRoot.seekToDocTime(docTime);
            }
            else {
                this.loadTime = getTimer() - docTime*1000.0;
                var svgEvent:SVGEvent = new SVGEvent(SVGEvent._SVGDocTimeSeek);
                svgEvent.setDocTime(docTime);
                this.dispatchEvent(svgEvent);
            }
        }

        override public function getStyle(name:String, defaultValue:* = null, inherit:Boolean = false):* {
            var value:String = super.getStyle(name, null, false);
            if (value) {
                return value;
            }

            if ((name == 'opacity') 
                || (name == 'fill-opacity')
                || (name == 'stroke-opacity')
                || (name == 'stroke-width')) {
                return '1';
            }

            if (name == 'fill') {
                return 'black';
            }

            if (name == 'stroke') {
                return 'none';
            }
            
            // Provide defaults for the various rendering hints.
            if (name == 'shape-rendering' || name == 'color-rendering'
                || name == 'text-rendering' || name == 'image-rendering') {
              return 'auto';
            }

            return defaultValue;
        }
        
        override public function getAttribute(name:String, defaultValue:* = null,
                                              inherit:Boolean = true,
                                              applyAnimations:Boolean = true,
                                              useStyle:Boolean = false):* {
            var value:String = this._getAttribute(name, defaultValue, inherit, applyAnimations, useStyle);
            if (value !== null) {
                return value;
            }

            if (ATTRIBUTES_NOT_INHERITED.indexOf(name) != -1) {
                if (defaultValue == null) {
                    if (name == 'opacity') {
                        return '1';
                    }
                    // default fall through
                }
                return defaultValue;
            }

            if (inherit && (this.svgParent != null))  {
                return this.svgParent.getAttribute(name, defaultValue, inherit, applyAnimations, useStyle);
            }

            if ((name == 'opacity') 
                || (name == 'fill-opacity')
                || (name == 'stroke-opacity')
                || (name == 'stroke-width')) {
                return '1';
            }

            if (name == 'fill') {
                return 'black';
            }

            if (name == 'stroke') {
                return 'none';
            }

            if (name == 'visibility') {
                return 'visible';
            }

            if (name == 'display') {
                return 'inline';
            }

            return defaultValue;
        }

        override public function handleAttrChange(name:String, value:String, attrNamespace:String = null):void {
            super.handleAttrChange(name, value, attrNamespace);
            if (name == 'x' || name == 'y') {
                this.applyDefaultMask();
            }
        }

        override protected function loadAttribute(name:String, field:String = null,
                                         applyStyle:Boolean = false):void {
            // Issue 226: Topmost <svg> tag ignores x and y
            if (topSprite.parent is SVGViewer && 
                (name == 'x' || name == 'y') ) {
                return;
            } else {
                super.loadAttribute(name, field, applyStyle);
            }
        }

        // The following functions track the number of elements that have a redraw
        // pending. When the count reaches zero, the onLoad handler can be called.
        // 
        // The overall count starts at one to account for the top SVG element. This is done
        // in the set xml handler above.
        // Other elements increment the count when they are added. This is done
        // by an override of addChild in SVGNode.
        // Every element decrements the count when rendering is complete. This is done
        // by drawNode in SVGNode.
        public function renderPending():void {
            if (this.parentSVGRoot) {
                this.parentSVGRoot.renderPending();
            }
            else {
                this._pendingRenderCount++;
            }
        }

        public function renderFinished():void {
            if (this.parentSVGRoot) {
                this.parentSVGRoot.renderFinished();
            }
            else {
                this._pendingRenderCount--;
                if (this._pendingRenderCount == 0) {
                    if (!this.firedOnLoad) {
                        this.firedOnLoad = true;
                        this.handleOnLoad();
                    }
                }
                if (this._pendingRenderCount < 0 && !this.firedOnLoad) {
                    this.dbg("error: pendingRenderCount count negative: " + this._pendingRenderCount);
                }
            }
        }
        
        public function registerNode(node:SVGNode):void {
            if (this.parentSVGRoot) {
                this.parentSVGRoot.registerNode(node);
            } else {
                registerID(node);
                registerGUID(node);
            }
        }
        
        public function isLoaded():Boolean {
            if (parentSVGRoot) {
                return parentSVGRoot.isLoaded();
            } else {
                return firedOnLoad;
            }
        }
        
        override public function addEventListener (type:String, listener:Function, useCapture:Boolean = false,
                                                   priority:int = 0, useWeakReference:Boolean = false):void {
            if (parentSVGRoot && (type == SVGEvent.SVGLoad ||
                                  type == SVGEvent._SVGDocTimeUpdate ||
                                  type == SVGEvent._SVGDocTimeSeek)) {
                parentSVGRoot.addEventListener(type, listener, useCapture, priority, useWeakReference);
            } else {
                super.addEventListener(type, listener, useCapture, priority, useWeakReference);
            }
        }
        
        override public function removeEventListener (type:String, listener:Function, useCapture:Boolean = false):void {
            if (parentSVGRoot && (type == SVGEvent.SVGLoad ||
                                  type == SVGEvent._SVGDocTimeUpdate ||
                                  type == SVGEvent._SVGDocTimeSeek)) {
                parentSVGRoot.removeEventListener(type, listener, useCapture);
            } else {
                super.removeEventListener(type, listener, useCapture);
            }
        }
        
        public function unregisterNode(node:SVGNode):void {
            if (this.parentSVGRoot) {
                this.parentSVGRoot.unregisterNode(node);
            } else {
                unregisterID(node);
                unregisterGUID(node);
            }
        }
        
        public function registerID(node:SVGNode):void {
            if (parentSVGRoot) {
                parentSVGRoot.registerID(node);
            } else if (node.id) {
                _idLookup[node.id] = node;
            }
        }

        public function unregisterID(node:SVGNode):void {
            if (parentSVGRoot) {
                parentSVGRoot.unregisterID(node);
            } else if (node.id) {
                delete _idLookup[node.id];
            }
        }
        
        public function registerGUID(node:SVGNode):void {
            if (parentSVGRoot) {
                parentSVGRoot.registerGUID(node);
            } else {
                _guidLookup[node.guid] = node;
            }
        }

        public function unregisterGUID(node:SVGNode):void {
            if (parentSVGRoot) {
                parentSVGRoot.unregisterGUID(node);
            } else {
                delete _guidLookup[node.guid];
            }
        }

        override protected function registerSelf():void {
            super.registerSelf();

            if (parentSVGRoot) {
                parentSVGRoot.registerNode(this);
            }
        }

        override protected function unregisterSelf():void {
            super.unregisterSelf();

            if (parentSVGRoot) {
                parentSVGRoot.unregisterNode(this);
                parentSVGRoot = null;
            }
        }

        /**
         * 
         * If this object depends on another object, then we can
         * register our interest in being invalidated when the
         * dependency object is redrawn.
         * 
         * The node references referenceId. 
         * An array of nodes that reference the referenceId is created.
         * 
         **/
        public function addReference(node:SVGNode, referencedId:String):void {
            if (this.parentSVGRoot) {
                this.parentSVGRoot.addReference(node, referencedId);
            }
            else {

                if (!this._referersById[referencedId]) {
                     this._referersById[referencedId]= new Array();
                }
                if (this._referersById[referencedId].lastIndexOf(node) == -1) {
                    this._referersById[referencedId].push(node);
                }
            }
        }  

        public function deleteReference(node:SVGNode, referencedId:String):void {
            if (this.parentSVGRoot) {
                this.parentSVGRoot.deleteReference(node, referencedId);
            }
            else {
                if (this._referersById[referencedId]) {
                    if (this._referersById[referencedId].lastIndexOf(node) != -1) {
                        delete this._referersById[referencedId][this._referersById[referencedId].lastIndexOf(node)];
                    }
                }
            }
        }
        
        public function invalidateReferers(id:String):void {
            if (this.parentSVGRoot) {
                this.parentSVGRoot.invalidateReferers(id);
            }
            else {
                //this.svgRoot.debug("Invalidating referers to "  + id);
                if (this._referersById[id]) {
                    var referers:Array = this._referersById[id];
                    for (var refererIdx:String in referers) {
                        referers[refererIdx].invalidateDisplay();
                    }
                }
            }
        }

        public function getNode(name:String):SVGNode {
            if (this.parentSVGRoot) {
                return this.parentSVGRoot.getNode(name);
            } else if (_idLookup.hasOwnProperty(name)) {
                return _idLookup[name];
            }
            return null;
        }

        public function getNodeByGUID(guid:String):SVGNode {            
            if (parentSVGRoot) {
                return parentSVGRoot.getNodeByGUID(guid);
            } else if (_guidLookup.hasOwnProperty(guid)) {
                return _guidLookup[guid];
            }
            return null;
        }
        
        /**
         * 
         * Fonts
         *
         **/
        public function registerFont(font:SVGFontNode):void {
            if (this.parentSVGRoot) {
                this.parentSVGRoot.registerFont(font);
             }
            else {
                _fonts[font.getFontFaceName()] = font;

                for each(var node:SVGNode in fontListeners) {
                    node.onRegisterFont(font.getFontFaceName());
                }
            }
         }
         
        public function unregisterFont(font:SVGFontNode):void {
            if (this.parentSVGRoot) {
                this.parentSVGRoot.unregisterFont(font);
            }
            else {
                delete _fonts[font.getFontFaceName()];
            }
        }

        public function getFont(fontFace:String):SVGFontNode {
            if (this.parentSVGRoot) {
                return this.parentSVGRoot.getFont(fontFace);
             }
            else {
                return _fonts[fontFace];
            }
         }
 
        public function registerFontListener(node:SVGNode):void {
            if (this.parentSVGRoot) {
                this.parentSVGRoot.registerFontListener(node);
            }
            else {
                fontListeners.push(node);
            }
        }

        public function unregisterFontListener(node:SVGNode):void {
            if (this.parentSVGRoot) {
                this.parentSVGRoot.unregisterFontListener(node);
            }
            else {
                if (fontListeners.lastIndexOf(node) != -1) {
                    delete fontListeners[fontListeners.lastIndexOf(node)];
                }
            }
        }


        public function handleScript(script:String):void {
            if (this.parentSVGRoot) {
                this.parentSVGRoot.handleScript(script);
            }
            else if (topSprite.parent is SVGViewer) {
                SVGViewer(topSprite.parent).handleScript(script);
            }
        }

        public function loadImage(imageHref:String, imageNode:SVGImageNode):void {
            if (this.parentSVGRoot) {
                this.parentSVGRoot.loadImage(imageHref, imageNode);
            }
            else {
                if (!this.imageCache[imageHref]) {
                    this.imageCache[imageHref] = new ImageLoader(imageHref);
                }
                this.imageCache[imageHref].addListener(imageNode);
            }
        }


        public function handleOnLoad():void {
            if (this.parentSVGRoot) {
                this.parentSVGRoot.handleOnLoad();
            }
            else {
                this.loadTime = getTimer();
                var svgEvent:SVGEvent = new SVGEvent(SVGEvent.SVGLoad);
                this.dispatchEvent(svgEvent);
            }
        }

        public function addActionListener(eventType:String, target:Sprite):void {
            if (this.parentSVGRoot) {
                this.parentSVGRoot.addActionListener(eventType, target);
            }
            else if (topSprite.parent is SVGViewer) {
                SVGViewer(topSprite.parent).addActionListener(eventType, target);
            }
        }

        public function removeActionListener(eventType:String, target:Sprite):void {
            if (this.parentSVGRoot) {
                this.parentSVGRoot.removeActionListener(eventType, target);
            }
            else if (topSprite.parent is SVGViewer) {
                SVGViewer(topSprite.parent).removeActionListener(eventType, target);
            }
        }
        
        public function zoomAndPan():void {
          var m:Matrix;
          
          // do we have a cached viewBox matrix that we've already applied?
          if (this._lastVBMatrix) {
            m = this._lastVBMatrix.clone();
          } else {
            m = new Matrix();
          }
                              
          m.translate(this.currentTranslate.x, this.currentTranslate.y);
          m.scale(this.currentScale, this.currentScale);
                                    
          viewBoxSprite.transform.matrix = m;
        }

        public function debug(debugString:String):void {
            if (this.parentSVGRoot) {
                this.parentSVGRoot.debug(debugString);
            }
            else if (topSprite.parent is SVGViewer) {
                SVGViewer(topSprite.parent).debug(debugString);
            }
        }

        public function error(message:String):void {
            if (this.parentSVGRoot) {
                this.parentSVGRoot.error(message);
            }
            else if (topSprite.parent is SVGViewer) {
                SVGViewer(topSprite.parent).error(message);
            }
        }
        
        /** Functions for profiling. */
        override public function start(subject:String, subjectStarted:String = null):void {
            if (this.parentSVGRoot) {
                this.parentSVGRoot.start(subject, subjectStarted);
            }
            else if (topSprite.parent is SVGViewer) {
                SVGViewer(topSprite.parent).start(subject, subjectStarted);
            }
        }
        
        /** Functions for profiling. */
        override public function end(subject:String, subjectStarted:String = null):void {
            if (this.parentSVGRoot) {
                this.parentSVGRoot.end(subject, subjectStarted);
            }
            else if (topSprite.parent is SVGViewer) {
                SVGViewer(topSprite.parent).end(subject, subjectStarted);
            }
        }
        
        /** Functions for profiling. */
        override public function increment(subject:String, amount:int):void {
            if (this.parentSVGRoot) {
                this.parentSVGRoot.increment(subject, amount);
            }
            else if (topSprite.parent is SVGViewer) {
                SVGViewer(topSprite.parent).increment(subject, amount);
            }
        }
    }
}
