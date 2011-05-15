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

package org.svgweb.tests
{
    import org.svgweb.SVGViewerFlash;
    import flash.display.Sprite;

    [SWF(frameRate="40", width="800", height="600")]
    public class SVGViewerFlashTest extends Sprite
    {
        private var svgImage:SVGViewerFlash;

        public function SVGViewerFlashTest()
        {
            super();
            svgImage = new SVGViewerFlash();
            this.addChild(svgImage);
            svgImage.xml = new XML('<svg version="1.1" baseProfile="tiny"' +
                                   'xmlns="http://www.w3.org/2000/svg"' +
                                   'xmlns:xlink="http://www.w3.org/1999/xlink"' +
                                   'width="500" height="500" viewBox="0 0 500 500">' +
                                   '<rect x="100" y="100" width="300" height="300" style="fill:red"/></svg>');

        }
        
    }
}
