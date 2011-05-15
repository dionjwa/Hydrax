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
    import flash.display.BlendMode;


    /**
     * Acts as a container for other nodes
     **/
    public class SVGGroupNode extends SVGNode
    {
        public function SVGGroupNode(svgRoot:SVGSVGNode, xml:XML, original:SVGNode = null):void {
            super(svgRoot, xml, original);
        }  

        // The <g> node does not use the x and y attributes.  (However, it does honor the transform attribute.)
        // However, if the <g> node is being referenced by a <use> node, then x and y are transferred to <g> as
        // an equivalent transform.
        override protected function loadAttribute(name:String, field:String = null,
                                                  useStyle:Boolean = false):void {
            // Group nodes with opacity need to use the layer blend mode to make it work.
            // We only do this when necessary because this consumes resources.
            if (name == 'opacity') {
                if (SVGColors.cleanNumber(this.getStyleOrAttr(name)) < 1.0) {
                    topSprite.blendMode = BlendMode.LAYER;
                }
                else {
                    topSprite.blendMode = BlendMode.NORMAL;
                }
            }
            if ( (name == 'x' || name == 'y') && !(this.svgParent is SVGUseNode) ) {
                return;
            }
            else {
                super.loadAttribute(name, field, useStyle);
            }
        }
    }
}
