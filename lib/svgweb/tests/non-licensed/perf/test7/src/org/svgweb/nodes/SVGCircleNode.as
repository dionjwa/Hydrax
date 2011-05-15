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
    import org.svgweb.utils.SVGColors;

    public class SVGCircleNode extends SVGNode
    {
        
        public function SVGCircleNode(svgRoot:SVGSVGNode, xml:XML, original:SVGNode = null):void {
            super(svgRoot, xml, original);
        }
        
        /**
         * Generate graphics commands to draw a circle
         **/
        protected override function generateGraphicsCommands():void {
            this._graphicsCommands = new  Array();
            
            var cxString:String = this.getAttribute('cx', '0');
            var cx:Number = SVGColors.cleanNumber2(cxString, svgParent.getWidth());

            var cyString:String = this.getAttribute('cy', '0');
            var cy:Number = SVGColors.cleanNumber2(cyString, svgParent.getHeight());

            var rString:String = this.getAttribute('r','0');
            var r:Number = SVGColors.cleanNumber2(rString, svgParent.getWidth());

            //Width/height calculations for gradients
            this.setXMinMax(cx - r);
            this.setXMinMax(cx + r);
            this.setYMinMax(cy - r);
            this.setYMinMax(cy + r);

            if (r != 0) {
                this._graphicsCommands.push(['CIRCLE', cx, cy, r]);
            }
        }
        public function getCircleXY():Array {
            var cxString:String = this.getAttribute('cx', '0');
            var cx:Number = SVGColors.cleanNumber2(cxString, svgParent.getWidth());

            var cyString:String = this.getAttribute('cy', '0');
            var cy:Number = SVGColors.cleanNumber2(cyString, svgParent.getHeight());

            var rString:String = this.getAttribute('r','0');
            var r:Number = SVGColors.cleanNumber2(rString, svgParent.getWidth());
            return [ cx - r, cy - r ];
        }
        
    }
}
