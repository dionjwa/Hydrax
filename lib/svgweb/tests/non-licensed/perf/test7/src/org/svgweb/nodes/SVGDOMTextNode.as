/*
Copyright (c) 2009 Google Inc.

Portions Copyright (c) 2009 Rick Masters

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
    
    /** This class is necessary for representing DOM Text Nodes in a way
        that we can 'track' over time and lookup by GUID when SVG Web is used
        in conjunction with browser JavaScript integration. We represent
        our DOM text nodes as a DOM element named '__text' with a _guid
        attribute set to a unique GUID and a __fakeTextNode attribute set
        to 'true'. Our actual text content is stored as a DOM Text Node
        as a child of ourselves. */
    public class SVGDOMTextNode extends SVGNode
    {
        public var nodeValue:String = null;
        
        public function SVGDOMTextNode(svgRoot:SVGSVGNode, xml:XML):void {
            super(svgRoot, xml);
            
            this.nodeValue = xml.text();
            // Since we are not added to stage, register here.
            this.registerSelf();
        }

        override public function createSVGSprites():void {
            //Do Nothing
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
