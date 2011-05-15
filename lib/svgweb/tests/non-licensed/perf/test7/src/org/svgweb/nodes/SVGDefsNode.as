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

    import flash.events.Event;

    /** 
     * Contains drawing instructions used by SVGUseNode
     * It is not rendered directly
     **/
    public class SVGDefsNode extends SVGNode
    {
        
        public function SVGDefsNode(svgRoot:SVGSVGNode, xml:XML, original:SVGNode = null):void {
            super(svgRoot, xml, original);
        }
                
        override protected function drawNode(event:Event = null):void {
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

    }
}
