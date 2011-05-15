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

package org.svgweb.nodes
{
    import org.svgweb.core.SVGNode;
    import org.svgweb.core.SVGGradient;
    import org.svgweb.utils.SVGUnits;
    import flash.geom.Matrix;
    import flash.display.GradientType;
    import flash.display.InterpolationMethod;
    
    public class SVGLinearGradient extends SVGGradient
    {                
        public function SVGLinearGradient(svgRoot:SVGSVGNode, xml:XML, original:SVGNode = null):void {
            super(svgRoot, xml, original);
        }

        override public function beginGradientFill(node:SVGNode):void {
            var w:Number = node.xMax - node.xMin;
            var h:Number = node.yMax - node.yMin;
            if ((w == 0) || (h == 0)) { //We don't fill an object with area == 0
                return;
            }

            var stopData:Object = this.getStopData(node);
            var spreadMethod:String = this.getSpreadMethod();
            var matrix:Matrix = this.getMatrix(node);

            if (stopData.colors.length == 1) { //Solid color fill
                node.drawSprite.graphics.beginFill(stopData.colors[stopData.colors.length-1],
                                                   stopData.alphas[stopData.colors.length-1]);
            }
            else if (stopData.colors.length > 0) { //Don't fill if there are no stops
                node.drawSprite.graphics.beginGradientFill(GradientType.LINEAR, stopData.colors,
                                                           stopData.alphas, stopData.ratios, matrix,
                                                           spreadMethod, InterpolationMethod.RGB);
            }

        }

        override public function lineGradientStyle(node:SVGNode, line_alpha:Number = 1):void {
            var stopData:Object = this.getStopData(node, line_alpha);
            var spreadMethod:String = this.getSpreadMethod();
            var matrix:Matrix = this.getMatrix(node);

            if (stopData.colors.length == 1) { //Solid color fill
                node.drawSprite.graphics.lineStyle(node.getStyleOrAttr('stroke-width'),
                                                   stopData.colors[stopData.colors.length-1],
                                                   stopData.alphas[stopData.colors.length-1]);
            }
            else if (stopData.colors.length > 0) { //Don't fill if there are no stops
                node.drawSprite.graphics.lineGradientStyle(GradientType.LINEAR, stopData.colors,
                                                           stopData.alphas, stopData.ratios, matrix,
                                                           spreadMethod, InterpolationMethod.RGB);
            }

        }

        protected function getMatrix(node:SVGNode):Matrix {
            var dx:Number;
            var dy:Number;
            var angle:Number;
            var matrGrTr:Matrix = this.parseTransform(this.getAttribute('gradientTransform'));
            var gradientUnits:String = this.getAttribute('gradientUnits', 'objectBoundingBox', false);


            if (node is SVGCircleNode) {
                var xy:Array = SVGCircleNode(node).getCircleXY();
                var xString:Number = xy[0].toString();
                var yString:Number = xy[1].toString();
            }
            else if (node is SVGEllipseNode) {
                xy = SVGEllipseNode(node).getEllipseXY();
                xString = xy[0].toString();
                yString = xy[1].toString();
            }
            else {
                xString = node.getAttribute('x', '0', false);
                yString = node.getAttribute('y', '0', false);
            }

            var x1String:String = this.getAttribute('x1', '0%', false);
            var x2String:String = this.getAttribute('x2', '100%', false);         
            var y1String:String = this.getAttribute('y1', '0%', false);
            var y2String:String = this.getAttribute('y2', '0%', false);
            var objectX:Number = Math.round(SVGUnits.parseNumPct(xString, node.svgParent.getWidth()));
            var objectY:Number = Math.round(SVGUnits.parseNumPct(yString, node.svgParent.getHeight()));

            /*
               Flash requires us to pass it a matrix that converts from virtual flash gradient
               area into the display gradient area. 

               Flash provides a utility function createGradientBox that takes an object
               width and height and produces an appropriate matrix for typical usage.
               It also takes an angle parameter. Since SVG does not specify an angle, you
               have to calculate it from the x1,y1,x2,y2 attributes. However, if you pass
               that angle to createGradientBox, it performs the rotation before scaling when
               calculating its matrix. If the scaling is non uniform, it skews the resulting
               gradient from the desired angle.  Therefore, we have to calculate the gradient
               matrix manually.  Now we have entered undocumented black magic.
             
               Credit for some understanding of this started here:
               http://www.half-serious.com/swf/format/gradients/index.html
               
               Actually, the virtual flash gradient is represented by an area in 2D coordinate
               space spanning -819.2 to 819.2 on both axis, where -819.2 represents a stop
               value of 0 and 819.2 represents a stop value of 1.0. These values were determined
               from experimentation. The starting gradient orientation goes from the left side of
               this box to the right side. If you think of the flash gradient as a vector that
               goes from stop value 0 to 1, then its origin is -819.2, 0 and its end point
               is 819.2, 0 in the standard flash gradient area.
  
               For gradientUnits userSpaceOnUse:
                   To produce a matrix that converts from flash space to SVG space, we will imagine
               a vector going from the center of the flash space to the maximum x value
               (from 0,0 to 819.2,0). This represents a vector perpendicular to the gradient stripes
               and going from stop value .5 to 1. We will imagine the equivalent SVG vector in SVG space,
               which starts at the halfway point between x1,y1 and x2,y2 and goes to x2,y2.

               So, if we create a matrix that converts from that flash vector
               to the SVG gradient vector, then we will have the appropriate gradient matrix
               that flash wants.

              For gradientUnits objectBoundingBox:
                   To produce a matrix that converts from flash space to SVG space, we will imagine
               a vector going from the center of the flash space to the maximum x value
               (from 0,0 to 819.2,0). We will imagine the equivalent SVG vector in objectBoundingBox
               units where the units span from 0,0 to 1,1. Then the vector is
               converted from objectBoundingBox units to user space units.
            */

            var matr:Matrix= new Matrix();

            if (gradientUnits == 'userSpaceOnUse') {
                var x1:Number = Math.round(SVGUnits.parseNumPct(x1String, node.svgParent.getWidth()));
                var y1:Number = Math.round(SVGUnits.parseNumPct(y1String, node.svgParent.getHeight()));
                var x2:Number = Math.round(SVGUnits.parseNumPct(x2String, node.svgParent.getWidth()));
                var y2:Number = Math.round(SVGUnits.parseNumPct(y2String, node.svgParent.getHeight()));

                var gradientWidth:Number = Math.abs(x2 - x1);
                var gradientHeight:Number = Math.abs(y2 - y1);

                // The length of the flash vector (819.2) is scaled to the length of the equivalent SVG vector
                var sx:Number = (Math.sqrt(gradientWidth*gradientWidth+gradientHeight*gradientHeight) / 2) / 819.2;
                var sy:Number = 1;
                matr.scale(sx, sy);

                // Now compute the angle of the SVG vector and rotate to that angle
                dx = x2 - x1;
                dy = y2 - y1;
                angle = Math.atan2(dy, dx);
                matr.rotate(angle);

                // Now we have the correct length and orientation, now move the
                // vector to the center of the svg gradient box
                var tx:Number = (x1 + x2) / 2;
                var ty:Number = (y1 + y2) / 2;
                matr.translate(tx, ty);

                // Now apply the gradientMatrix, if specified
                // xxx needs testing
                if (matrGrTr != null)
                    matr.concat(matrGrTr);

                // Finally, we need to move the matrix to the right screen location.
                // The flash gradient was positioned relative to the object.
                // SVG has specified its vector in user space. Now that we
                // are in SVG user space, we can make this adjustment.
                matr.translate(-objectX, -objectY);
                return matr;
            }
            else {
                // objectBoundingBox units

                // Get node height and width in user space
                var w:Number = node.xMax - node.xMin;
                var h:Number = node.yMax - node.yMin;
                
                // Get gradient coordinates in objectBoundingBox units
                if (x1String.search('%') > -1) {
                    x1 = SVGUnits.parseNum(x1String) / 100;
                }
                else {
                    x1 = SVGUnits.parseNum(x1String);
                }
                if (y1String.search('%') > -1) {
                    y1 = SVGUnits.parseNum(y1String) / 100;
                }
                else {
                    y1 = SVGUnits.parseNum(y1String);
                }
                if (x2String.search('%') > -1) {
                    x2 =  SVGUnits.parseNum(x2String) / 100;
                }
                else {
                    x2 = SVGUnits.parseNum(x2String);
                }
                if (y2String.search('%') > -1) {
                    y2 =  SVGUnits.parseNum(y2String) / 100;
                }
                else {
                    y2 = SVGUnits.parseNum(y2String);
                }
                
                // Scale from flash gradient area to bounding box
                matr.scale(1/1638.4, 1/1638.4);

                // Move to the center of the bounding box
                matr.translate(.5, .5);

                // Scale the vector to the size of the SVG vector in boundingBox units
                dx = x2 - x1;
                dy = y2 - y1;
                matr.scale(Math.sqrt(dx*dx + dy*dy), 1);

                // Rotate to the angle of the SVG vector in boundingBox units
                angle = Math.atan2(dy, dx);
                matr.rotate(angle);

                // Scale from objectBoundingBox units to user space
                matr.scale(w, h);

                // Move to the starting gradient position in user space
                matr.translate(x1 * w, y1 * h);

                // Now apply the gradientMatrix, if specified
                // xxx needs testing
                if (matrGrTr != null)
                    matr.concat(matrGrTr);

                // A special adjustment is needed for circles for unknown reasons.
                // This adjustment was determined empirically. See Issues 349 and 371.
                if (node is SVGCircleNode || node is SVGEllipseNode) {
                    matr.translate(objectX, objectY);
                }
                if (node is SVGPathNode || node is SVGPolygonNode) {
                    matr.translate(node.xMin, node.yMin);
                }
                return matr;
            }
        }
    }
}
