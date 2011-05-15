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
    import org.svgweb.nodes.SVGSVGNode;
    import org.svgweb.utils.SVGColors;
    
    import flash.filters.BlurFilter;
    import flash.geom.Matrix;
    
    public class SVGFilterNode extends SVGNode
    {
        
        private var _filters:Array;
        
        public function SVGFilterNode(svgRoot:SVGSVGNode, xml:XML, original:SVGNode = null):void {
            super(svgRoot, xml, original);
        }
 
        public function getFilters(objectToFilter:SVGNode):Array {
            var nodeFilters:Array = new Array();
            var list:XMLList = this._xml.svg::feGaussianBlur;

            if (list.length()) {
                var blurXML:XML;
                // TODO: We do not yet support more than one blur
                if (list.length > 1) {
                    var elem:XML;
                    for each(elem in list) {
                        blurXML=elem;
                    }
                }
                else {
                    blurXML=XML(list);
                }
                var svgNode:SVGNode = objectToFilter;
                var concatMatrix:Matrix = new Matrix();
                var oldMatrix:Matrix;

                while (svgNode) {
                    if (svgNode.getAttribute('transform') != null) {
                        oldMatrix = this.parseTransform(svgNode.getAttribute('transform'));
                        oldMatrix.concat(concatMatrix);
                        concatMatrix = oldMatrix;
                    }
                    if (svgNode is SVGSVGNode) {
                        break;
                    }
                    svgNode = svgNode.svgParent;
                }

                var stdDeviation:String = blurXML.@stdDeviation.toString();
                var stdDeviationX:String;
                var stdDeviationY:String;

                if (stdDeviation == null) {
                    stdDeviationX = stdDeviationY = '4';
                }
                else {
                    var values:Array = stdDeviation.split(/\s+/);
                    if (values.length > 1) {
                        stdDeviationX = values[0];
                        stdDeviationY = values[1];
                    }
                    else {
                        stdDeviationX = stdDeviationY = values[0];
                    }
                }
                var blurAmountX:Number = SVGColors.cleanNumber(stdDeviationX);
                var blurAmountY:Number = SVGColors.cleanNumber(stdDeviationY);
                blurAmountX = blurAmountX * concatMatrix.a;
                blurAmountY = blurAmountY * concatMatrix.a;

                nodeFilters.push(new BlurFilter(blurAmountX*1.5, blurAmountY*1.5, 8));                
            }    
            
            return nodeFilters;
        } 
        
    }
}
