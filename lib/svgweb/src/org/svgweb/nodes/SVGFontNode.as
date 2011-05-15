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
    import org.svgweb.nodes.SVGGlyphNode;

    public class SVGFontNode extends SVGNode
    {
        protected var glyphs:Array = new Array();
        protected var missingGlyph:SVGMissingGlyphNode;
        protected var fontFaceName:String = "";
        protected var unitsPerEm:Number;

        public function SVGFontNode(svgRoot:SVGSVGNode, xml:XML, original:SVGNode = null):void {
            super(svgRoot, xml, original);
        }
        
        public function registerGlyph(glyph:SVGGlyphNode):void {
            if (glyph is SVGMissingGlyphNode) {
                this.missingGlyph = SVGMissingGlyphNode(glyph);
            }
            else {
                this.glyphs[glyph.getUnicode()] =  glyph;
            }
        }

        public function unregisterGlyph(glyph:SVGGlyphNode):void {
            delete this.glyphs[glyph.getUnicode()];
        }

        public function getGlyph(unicode:String):SVGGlyphNode {
            if (this.glyphs.hasOwnProperty(unicode)) {
                return this.glyphs[unicode];
            }
            else {
                return this.missingGlyph;
            }
        }

        public function setFontFaceName(fontFace:String):void {
            this.fontFaceName = fontFace;
            this.svgRoot.registerFont(this);
        }

        public function getFontFaceName():String {
            return this.fontFaceName;
        }

        override protected function parseChildren():void {
            super.parseChildren();
            unitsPerEm = 1000.0;
            var i:uint;
            for (i=0; i<this.svgChildren.length; i++) {
                if (this.svgChildren[i] is SVGFontFaceNode) {
                    unitsPerEm = Number(this.svgChildren[i].getAttribute("units-per-em", "1000.0", false, false));
                    break;
                }
            }
        }

        public function getUnitsPerEm():Number {
            return this.unitsPerEm;
        }
    }
}
