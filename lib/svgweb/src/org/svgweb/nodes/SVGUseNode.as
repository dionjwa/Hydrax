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
    import flash.events.Event;
    
    public class SVGUseNode extends SVGNode
    {        

        protected var clonedName:String;

        public function SVGUseNode(svgRoot:SVGSVGNode, xml:XML = null, original:SVGNode = null):void {
            super(svgRoot, xml, original);
        }

        override protected function drawNode(event:Event = null):void {
            if ( (topSprite.parent != null) && (this._invalidDisplay) ) {
                this._invalidDisplay = false;
                if (this._xml != null) {
                    drawSprite.graphics.clear();
                    if (!this._parsedChildren) {
                        this.parseChildren();
                        this._parsedChildren = true;
                    }

                    var name:String = this.getAttribute('href');
                    if (name && name != clonedName) {
                        name = name.substr(1);
                        var node:SVGNode = this.svgRoot.getNode(name);
                        if (node) {
                            this.clearSVGChildren();
                            node = node.clone();
                            viewBoxSprite.addChild(node.topSprite);
                            node.svgParent = this;
                            this.svgRoot.renderPending();
                            this.svgRoot.deleteReference(this, name);
                            clonedName = name;
                        }
                        else {
                            this.svgRoot.addReference(this, name);
                        }
                    }

                    // sets x, y, rotate, and opacity
                    this.setAttributes();

                    if (this.getStyleOrAttr('display', null, false) == 'none') {
                        topSprite.visible = false;
                    }
                    else {
                        topSprite.visible = true;
                    }
                    this.generateGraphicsCommands();
                    this.transformNode();
                    this.draw();

                    this.applyClipPathMask();
                    this.applyViewBox();
                    this.setupFilters();
    
                }

                topSprite.removeEventListener(Event.ENTER_FRAME, drawNode);
            }
            if (!this._initialRenderDone && topSprite.parent) {
                this._initialRenderDone = true;
                this.svgRoot.renderFinished();
            }
        }

        override protected function setAttributes():void {
            this.loadAttribute('x');
            this.loadAttribute('y');
            // Other attribute should be inherited by children
        }

        override public function handleAttrChange(name:String, value:String, attrNamespace:String = null):void {
            super.handleAttrChange(name, value, attrNamespace);
            this.invalidateChildren();
        }
    }
}


