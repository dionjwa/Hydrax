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
    
    public class SVGClipPathNode extends SVGNode
    {    
        
        public function SVGClipPathNode(svgRoot:SVGSVGNode, xml:XML, original:SVGNode = null):void {
            super(svgRoot, xml, original);
        }
        
        /**
         * Override parent function to do nothing
         **/
        override protected function draw():void {
            topSprite.visible = false;
            //Do Nothing
        }

        
        /**
         * Override parent function to do nothing except create a blank _graphicsCommands array
         **/
        override protected function generateGraphicsCommands():void {
            //Do Nothing
            this._graphicsCommands = new  Array();
        }
        
        
    }
}
