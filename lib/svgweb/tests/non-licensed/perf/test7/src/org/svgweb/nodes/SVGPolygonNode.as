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
    import mx.utils.StringUtil;
    import org.svgweb.core.SVGNode;
    
    public class SVGPolygonNode extends SVGNode
    {        
        public function SVGPolygonNode(svgRoot:SVGSVGNode, xml:XML, original:SVGNode = null):void {
            super(svgRoot, xml, original);
        }
        
        /**
         * Generate graphics commands to draw a polygon
         **/
        protected override function generateGraphicsCommands():void {
            
            this._graphicsCommands = new  Array();
            
            var pointsString:String = StringUtil.trim(this.getAttribute('points',''));
            
            pointsString = pointsString.replace(/\s+/sg,","); //Replace spaces with a comma
            pointsString = pointsString.replace(/,{2,}/sg,","); // Remove any extra commas
            pointsString = pointsString.replace(/^,/, ''); //Remove leading comma
            pointsString = pointsString.replace(/,$/, ''); //Remove trailing comma
            
            var points:Array = pointsString.split(',');
            
            var pX:Number;
            var pY:Number;
            
            for (var i:int = 0; i < points.length; i += 2) {
                pX = points[i];
                pY = points[i + 1];    
                            
                if (i == 0) {
                    this._graphicsCommands.push(['SF']);
                    this._graphicsCommands.push(['M', pX, pY]);
                }
                else if (i == (points.length - 2)) {
                    this._graphicsCommands.push(['L', pX, pY]);    
                    this._graphicsCommands.push(['Z']);
                    this._graphicsCommands.push(['EF']);
                }
                else {
                    this._graphicsCommands.push(['L', pX, pY]);
                }                

                //Width/height calculations for gradients
                this.setXMinMax(pX);
                this.setYMinMax(pY);
            }
            
        }    
        
    }
}
