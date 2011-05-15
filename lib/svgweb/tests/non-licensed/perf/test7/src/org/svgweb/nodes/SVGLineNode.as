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
    
    public class SVGLineNode extends SVGNode
    {        
        public function SVGLineNode(svgRoot:SVGSVGNode, xml:XML, original:SVGNode = null):void {
            super(svgRoot, xml, original);
        }
        
        /**
         * Generate graphics commands to draw a line
         **/
        protected override function generateGraphicsCommands():void {
            
            this._graphicsCommands = new  Array();
            
            var x1String:String = this.getAttribute('x1', '0');
            var x1:Number = SVGColors.cleanNumber2(x1String, this.svgParent.getWidth());

            var y1String:String = this.getAttribute('y1', '0');
            var y1:Number = SVGColors.cleanNumber2(y1String, this.svgParent.getHeight());

            var x2String:String = this.getAttribute('x2', '0');
            var x2:Number = SVGColors.cleanNumber2(x2String, this.svgParent.getWidth());

            var y2String:String = this.getAttribute('y2', '0');
            var y2:Number = SVGColors.cleanNumber2(y2String, this.svgParent.getHeight());
            
             //Width/height calculations for gradients
            this.setXMinMax(x1);
            this.setYMinMax(x2);

            this.setXMinMax(y1);
            this.setYMinMax(y2);
           
            this._graphicsCommands.push(['LINE', x1, y1, x2, y2]);
        }        
        
    }
}
