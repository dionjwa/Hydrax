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


package org.svgweb.core
{
    import org.svgweb.nodes.SVGSVGNode;
    import org.svgweb.nodes.SVGStopNode;
    import org.svgweb.utils.SVGColors;

    import flash.display.DisplayObject;
    import flash.display.SpreadMethod;
    import flash.geom.Matrix;

    public class SVGGradient extends SVGNode
    {

        public function SVGGradient(svgRoot:SVGSVGNode, xml:XML = null, original:SVGNode = null):void {
            super(svgRoot, xml, original);
        }

        public function beginGradientFill(node:SVGNode):void {
        }

        public function lineGradientStyle(node:SVGNode, line_alpha:Number = 1):void {
        }

        public function getSpreadMethod():String {
            var spreadMethod:String = SpreadMethod.PAD;

            var attr:String = this.getAttribute('spreadMethod');
            if (attr == 'reflect') {
                spreadMethod = SpreadMethod.REFLECT;
            }
            else if (attr == 'repeat') {
                spreadMethod = SpreadMethod.REPEAT;
            }

            return spreadMethod;
        }

        public function getStopData(line_alpha:Number = 1):Object {
            var href:String = this.getAttribute("href");

            if (href) {
               href = href.substr(1);
               var node:SVGNode = this.svgRoot.getNode(href);
               if (node is SVGGradient) {
                   return SVGGradient(node).getStopData();
               }
            }

            var stopData:Object = new Object();

            var colors:Array = new Array();
            var ratios:Array = new Array();
            var alphas:Array = new Array();

            var color:String;
            var ratio:String;
            var alpha:String;
            var ratioNum:Number;

            var match:Array;
            var child:SVGNode;
            var currentRatio:Number;

            for (var i:uint = 0; i < svgChildren.length; i++) {
                child = svgChildren[i];
                if (child is SVGStopNode) {
                    color = SVGStopNode(child).getStyleOrAttr('stop-color', 'black');
                    if (color == 'currentColor') {
                        color = this.getStyleOrAttr('color');
                    }
                    ratio = SVGStopNode(child).getStyleOrAttr('offset', '0');
                    alpha = SVGStopNode(child).getStyleOrAttr('stop-opacity', 1);

                    match = ratio.match(/([^%]+)%/s);
                    if (match) {
                        ratioNum = 255 * (SVGColors.cleanNumber(match[1]) / 100);
                    }
                    else {
                        ratioNum = 255 * SVGColors.cleanNumber(ratio);
                    }

                    colors.push(SVGColors.getColor(color));
                    ratios.push(ratioNum);
                    alphas.push(SVGColors.cleanNumber(alpha) * line_alpha);
                }
            }

            stopData['colors'] = colors;
            stopData['ratios'] = ratios;
            stopData['alphas'] = alphas;

            return stopData;
        }

        /**
         *
         * This method supports href inheritence of attributes from base nodes of the same type.
         *
         **/
        override protected function _getAttribute(name:String, defaultValue:* = null,
                                                  inherit:Boolean = true,
                                                  applyAnimations:Boolean = true,
                                                  useStyle:Boolean = false):* {
            var value:String = super._getAttribute(name, defaultValue,
                                                   inherit, applyAnimations,
                                                   useStyle);
            if (value !== null) {
                return value;
            }

            var href:String = this._xml.@xlink::href;
            if (!href || href == '') {
                href = this._xml.@href;
            }

            if (href && href !== '') {
                href = href.replace(/^#/,'');
                var baseNode:SVGNode = this.svgRoot.getNode(href);
                if (baseNode) {
                    // Return value from href base node, perhaps recursively.
                    // XXX possible circular reference problem.
                    return baseNode.getStyleOrAttr(name, null, false, applyAnimations);
                }
                else {
                    // Href is not (yet) parsed, just return value for this node
                    return value;
                }
            }
            else {
                // No href, just return value for this node
                return value;
            }
        }
        
        /**
         *
         * This method supports href inheritence of styles from base nodes of the same type.
         *
         **/
        override protected function _getStyle(name:String):String {
            var value:String = super._getStyle(name);
            if (value != null) {
                return value;
            }
            
            var href:String = this._xml.@xlink::href;
            if (!href || href=='') {
                href = this._xml.@href;
            }

            if (href && href != '') {
                href = href.replace(/^#/,'');

                var baseNode:SVGNode = this.svgRoot.getNode(href);
                if (baseNode) {
                    // Return value from href base node, perhaps recursively.
                    // XXX possible circular reference problem.
                    value = baseNode.getStyle(name);
                    return value;
                }
                else {
                    // Href is not (yet) parsed
                    return value;
                }
            }
            else {
                // No href
                return value;
            }
        }
        
    }
}
