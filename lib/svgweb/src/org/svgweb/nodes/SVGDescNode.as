/*
Copyright (c) 2008 James Hight
Copyright (c) 2008 Richard R. Masters
Copyright (c) 2009 Google Inc.

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
*/

package org.svgweb.nodes
{
    
    import org.svgweb.core.SVGNode;
    import org.svgweb.nodes.SVGSVGNode;
    
    public class SVGDescNode extends SVGNode
    {
        /**
         * Hold node's text if any is present.
         **/
        protected var _text:String = null;
        
        public function SVGDescNode(svgRoot:SVGSVGNode, xml:XML):void {
            super(svgRoot, xml);
        }
        
        override public function hasText():Boolean {
            return true;
        }
        
        override public function setText(newValue:String):void {
            this._text = newValue;
        }
        
        override public function getText():String {
            return this._text;
        }
        
        override protected function draw():void {
            //Do Nothing
        }
        
        override protected function generateGraphicsCommands():void {
            this._graphicsCommands = new Array();
            //Do Nothing
        }
    }
}
