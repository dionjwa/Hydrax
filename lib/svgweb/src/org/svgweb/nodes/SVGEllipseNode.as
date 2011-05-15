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
    import org.svgweb.utils.SVGUnits;

    public class SVGEllipseNode extends SVGNode
    {
        
        public function SVGEllipseNode(svgRoot:SVGSVGNode, xml:XML, original:SVGNode = null):void {
            super(svgRoot, xml, original);
        }
        
        /**
         * Generate graphics commands to draw an ellipse
         **/
        override protected function generateGraphicsCommands():void {
            
            this._graphicsCommands = new  Array();
            
            var cx:Number = this.getAttribute('cx',0);
            var cy:Number = this.getAttribute('cy',0);
            var rx:Number = this.getAttribute('rx',0);
            var ry:Number = this.getAttribute('ry',0);
            
            //Width/height calculations for gradients
            this.setXMinMax(cx - rx);
            this.setXMinMax(cx + rx);
            this.setYMinMax(cy - ry);
            this.setYMinMax(cy + ry);

            if (rx != 0 && ry != 0) {
                this._graphicsCommands.push(['ELLIPSE', (cx - rx), (cy - ry), (rx * 2), (ry * 2)]);            
            }
        }                    

        public function getEllipseXY():Array {
            var cxString:String = this.getAttribute('cx', '0');
            var cx:Number = SVGUnits.parseNumPct(cxString, svgParent.getWidth());

            var cyString:String = this.getAttribute('cy', '0');
            var cy:Number = SVGUnits.parseNumPct(cyString, svgParent.getHeight());

            var rxString:String = this.getAttribute('rx','0');
            var rx:Number = SVGUnits.parseNumPct(rxString, svgParent.getWidth());

            var ryString:String = this.getAttribute('ry','0');
            var ry:Number = SVGUnits.parseNumPct(ryString, svgParent.getWidth());
            return [ cx - rx, cy - ry ];
        }
    }


}
