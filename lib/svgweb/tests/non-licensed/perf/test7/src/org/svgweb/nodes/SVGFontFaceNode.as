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
    import flash.events.Event;
    import flash.display.DisplayObject;

    public class SVGFontFaceNode extends SVGNode
    {
        public function SVGFontFaceNode(svgRoot:SVGSVGNode, xml:XML, original:SVGNode = null):void {
            super(svgRoot, xml, original);
        }

        override protected function onAddedToStage(event:Event):void {
            if (this.getParentFont()) {
                this.getParentFont().setFontFaceName(this.getStyleOrAttr('font-family'));
            }
            super.onAddedToStage(event);
        }

        public function getParentFont():SVGFontNode {
            var node:SVGNode = this;
            while (node && !(node is SVGSVGNode)) {
                node=node.svgParent;
                if (node is SVGFontNode)
                    return SVGFontNode(node);
            }
            return null;
        }
       
    }
}
