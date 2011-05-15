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
    import flash.events.Event;
    import flash.display.DisplayObject;
    
    public class SVGGlyphNode extends SVGPathNode {
        protected var parentFont:SVGFontNode;

        public function SVGGlyphNode(svgRoot:SVGSVGNode, xml:XML = null, original:SVGNode = null) {
            super(svgRoot, xml, original);
        }

        override protected function onAddedToStage(event:Event):void {
            if (original) {
                parentFont = SVGGlyphNode(original).getParentFont();
            }
            else {
                parentFont = this.getParentFont();
            }
            // If we are the master glyph (not a clone used by a text node)
            // then register with the parent font.
            if (original == null && parentFont) {
                parentFont.registerGlyph(this);
            }
            super.onAddedToStage(event);
        }

        override protected function onRemovedFromStage(event:Event):void {
            if (original == null && parentFont) {
                parentFont.unregisterGlyph(this);
            }
            super.onRemovedFromStage(event);
        }

        override protected function drawNode(event:Event = null):void {
            super.drawNode(event);
            // If this is a instantiated glyph, then notify the text node parent
            // that we have rendered (and are ready to be displayed).
            if (original && this.svgParent) {
                SVGTextNode(this.svgParent).onDrawGlyph(this);
            }
        }

        public function getUnicode():String {
            return this.getAttribute('unicode');
        }

        public function getParentFont():SVGFontNode {
            var node:SVGNode = this;
            while (node && !(node is SVGSVGNode)) {
                node=node.svgParent;
                if (node && node is SVGFontNode)
                    return SVGFontNode(node);
            }
            return null;
        }

    }
}
