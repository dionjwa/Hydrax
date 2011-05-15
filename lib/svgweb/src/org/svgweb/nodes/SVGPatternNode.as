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


package org.svgweb.nodes {
    import org.svgweb.core.SVGNode;
    import org.svgweb.utils.SVGUnits;

    import flash.display.BitmapData;
    import flash.events.Event;
    import flash.geom.Matrix;

    public class SVGPatternNode extends SVGNode {

        public function SVGPatternNode(svgRoot:SVGSVGNode, xml:XML = null, original:SVGNode = null) {
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

        public function beginPatternFill(node:SVGNode):void {
            var patternWidth:int = topSprite.width;
            var patternHeight:int = topSprite.height;

            var tmp:String = this.getAttribute('width');
            if (tmp) {
                patternWidth = SVGUnits.parseNum(tmp);
            }

            tmp = this.getAttribute('height');
            if (tmp) {
                patternHeight = SVGUnits.parseNum(tmp);
            }

            var patternX:Number = SVGUnits.parseNum(this.getAttribute('x'));
            var patternY:Number = SVGUnits.parseNum(this.getAttribute('y'));

            var matrix:Matrix
            tmp = this.getAttribute('patternTransform');
            if (tmp) {
                matrix = this.parseTransform(tmp, matrix);
            }
            else {
                matrix = new Matrix();
            }

            matrix.concat(drawSprite.transform.concatenatedMatrix);

            var nodeMatrix:Matrix = node.drawSprite.transform.concatenatedMatrix;
            nodeMatrix.invert();

            matrix.concat(nodeMatrix);

            matrix.translate(patternX, patternY);

            if ( (patternWidth > 0) && (patternHeight > 0) ) {
                var bitmapData:BitmapData = new BitmapData(patternWidth, patternHeight);
                bitmapData.draw(this.targetPattern().topSprite);
                node.drawSprite.graphics.beginBitmapFill(bitmapData, matrix); 
            }

            this.svgRoot.addReference(node, this.targetPattern().id);
        }

        public function targetPattern():SVGPatternNode {
            var href:String = this.getAttribute("href");

            if (href) {
                href = href.substr(1);
                var node:SVGNode = this.svgRoot.getNode(href);
                if (node is SVGPatternNode) {
                    return SVGPatternNode(node).targetPattern();
                }
            }

            return this;
        }

    }
}
