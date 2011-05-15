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
    import org.svgweb.nodes.SVGAnimateNode;
    import org.svgweb.utils.SVGMotionPath;
    import org.svgweb.utils.SVGMotionPathSegment;
    import org.svgweb.utils.SVGCoordinate;
    import org.svgweb.utils.PathParser;


    public class SVGAnimateMotionNode extends SVGAnimateNode
    {
        protected var motionPos:SVGCoordinate = new SVGCoordinate(0,0);

        private var currentX:Number;
        private var currentY:Number;

        private var startX:Number;
        private var startY:Number;

        private var lastCurveControlX:Number;
        private var lastCurveControlY:Number;

        private var motionPath:SVGMotionPath;
        private var keyPointsParameter:String;
        private var keyPoints:Array;
        private var rotateParameter:String;

        public function SVGAnimateMotionNode(svgRoot:SVGSVGNode, xml:XML, original:SVGNode = null):void {
            super(svgRoot, xml, original);
        }

        override protected function initialize():void {
            super.initialize();
            prepareMotionPath();
            checkParameters();
        }

        override protected function parseParameters():void {
            super.parseParameters();
            parseKeyPointsParameter();
            parseRotateParameter();
        }

        override public function getAnimValue():String {
            return null;
        }

        public function getAnimMotionPos():SVGCoordinate {
            if (this.isEffective()) {
                if (frozen) {
                    return motionPos;
                }
                frozen = !this.active;

                var repeatFraction:Number = getRepeatIntervalFraction(this.lastDocTime);
                var pos:SVGCoordinate;

                if (calcModeParameter == 'paced') {
                    // ignore keyTimes, keySplines, keyPoints
                    pos = motionPath.getFractionPos(repeatFraction);
                }
                else {
                    var pathFraction0:Number = 0.0;
                    var pathFraction1:Number = 1.0;
                    var keyTimeIndex:Number = 0;
                    var keyTimeFraction:Number = repeatFraction;
                    if (keyTimes != null) {
                        keyTimeIndex = getKeyTimeIndex(repeatFraction);
                        keyTimeFraction = getKeyTimeFraction(repeatFraction);
                        if (keyPoints != null) {
                            pathFraction0 = keyPoints[keyTimeIndex];
                            pathFraction1 = keyPoints[keyTimeIndex + 1];
                        }
                        else {
                            pathFraction0 = motionPath.lengthToSegment(keyTimeIndex)/motionPath.pathLength();
                            if ( (keyTimeIndex + 1) < motionPath.numSegments() - 1) {
                                pathFraction1 = motionPath.lengthToSegment(keyTimeIndex + 1)/motionPath.pathLength();
                            }
                        }
                    }
                    else {
                        var numValues:Number = motionPath.numSegments();
                        var keyTimeInterval:Number;
                        if (calcModeParameter == 'discrete') {
                            keyTimeInterval = 1.0/(numValues + 1);
                        }
                        else {
                            keyTimeInterval = 1.0/numValues;
                        }
                        keyTimeIndex = Math.floor(repeatFraction * numValues);

                        if (keyTimeIndex >= numValues) {
                            keyTimeIndex = numValues - 1;
                        }
                        pathFraction0 = motionPath.lengthToSegment(keyTimeIndex)/motionPath.pathLength();
                        if (keyTimeIndex < numValues - 1) {
                            pathFraction1 = motionPath.lengthToSegment(keyTimeIndex + 1)/motionPath.pathLength();
                        }
                        keyTimeFraction = (repeatFraction - keyTimeIndex * keyTimeInterval)/keyTimeInterval;
                    }
                    if (calcModeParameter == 'discrete') {
                        if (keyTimeFraction >= 1.0) {
                            pos = motionPath.getFractionPos(pathFraction1);
                        }
                        else {
                            pos = motionPath.getFractionPos(pathFraction0);
                        }
                    }
                    else if (calcModeParameter == 'linear') {
                        var linearFraction:Number = pathFraction0 + keyTimeFraction * (pathFraction1 - pathFraction0);
                        pos = motionPath.getFractionPos(linearFraction);
                    }
                    else if (calcModeParameter == 'spline') {
                        var keyTimeSpline:String = getKeyTimeSpline(keyTimeIndex);
                        var splinedFraction:Number = splineInterpolate(keyTimeFraction, keyTimeSpline);
                        splinedFraction = pathFraction0 + splinedFraction * (pathFraction1 - pathFraction0);
                        pos = motionPath.getFractionPos(splinedFraction);

                    }
                }
                // accumulate
                if (accumulateParameter == "sum") {
                    var previousCount:Number = getRepeatIndex(lastDocTime);
                    var accumulatePos:SVGCoordinate = new SVGCoordinate();
                    accumulatePos.copy(motionPath.getFractionPos(1.0));
                    accumulatePos.scale(previousCount);
                    pos.add(accumulatePos);
                }
                motionPos.copy(pos);
                return motionPos;
            }
            return null;
        }

        private function makeValuesPath():String {
            var path:String = "M" + valuesParameter.split(';').join(' ');
            return path;
        }

        private function makeSimplePath(from:String, to:String):String {
            var path:String = "M";
            if (from == null) from = "0,0";
            path += from + "L";
            if (to == null) to = "0,0";
            path += to;
            return path;
        }

        protected function prepareMotionPath():void {
            // path priority <mpath/>, path, values, from/by/to
            var data:String = null;
            // check for mpath
            var i:uint;
            for (i=0; i<this.svgChildren.length; i++) {
                if (this.svgChildren[i] is SVGMPathNode) {
                    var path:SVGPathNode = this.svgChildren[i].getSVGPathNode();
                    data = path.getAttribute('d');
                    break;
                }
            }

            if (data == null) {
                data = this.getAttribute('path', null, false, false);
            }
            if (data == null) {
                if (valuesParameter!= null) {
                    data = makeValuesPath();
                }
                else if (toParameter != null) {  // from-to, to
                    data = makeSimplePath(fromParameter, toParameter);
                }
                else if (byParameter != null) {  // from-by, by
                    data = makeSimplePath(fromParameter, byParameter);
                }
                else data = "M0,0 L0,0";
            }

            this.motionPath = new SVGMotionPath();

            // following code is very similar to code in SVGPathNode
            var command:String;
            var lineAbs:Boolean;
            var isAbs:Boolean;

            var szSegs:Array = PathParser.parseSVGPath(data);
            this.currentX = 0.0;
            this.currentY = 0.0;
            var firstMove:Boolean = true;
            var szSegsLength:int = szSegs.length;
            for(var pos:int = 0; pos < szSegsLength; ) {
                command = szSegs[pos++];

                isAbs = false;

                switch(command) {
                    case "M":
                        isAbs = true;
                    case "m":
                        lineAbs = isAbs;
                        if (firstMove) { //If first move is 'm' treat as absolute
                            isAbs = true;
                            firstMove = false;
                        }
                        this.moveTo(szSegs[pos++],szSegs[pos++], isAbs);
                        while (!isNaN(Number(szSegs[pos])) && pos < szSegsLength) {
                            this.line(szSegs[pos++], szSegs[pos++], lineAbs);
                        }
                        break;
                    case "L":
                        isAbs = true;
                    case "l":
                        do {
                            this.line(szSegs[pos++],szSegs[pos++],isAbs);
                        } while (!isNaN(Number(szSegs[pos])) && pos < szSegsLength);
                        break;
                    case "H":
                        isAbs = true;
                    case "h":
                        do {
                            this.lineHorizontal(szSegs[pos++],isAbs);
                        } while (!isNaN(Number(szSegs[pos])) && pos < szSegsLength);
                        break;
                    case "V":
                        isAbs = true;
                    case "v":
                        do {
                            this.lineVertical(szSegs[pos++],isAbs);
                        } while (!isNaN(Number(szSegs[pos])) && pos < szSegsLength);
                        break;
                    case "Z":
                        isAbs = true;
                    case "z":
                        this.closePath();
                        while (!isNaN(Number(szSegs[pos])) && pos < szSegsLength) {
                            this.line(szSegs[pos++], szSegs[pos++], isAbs);
                        }
                        break;
                    case "A":
                        isAbs = true;
                    case "a":
                        do {
                            this.ellipticalArc(szSegs[pos++],szSegs[pos++],szSegs[pos++],
                                               szSegs[pos++],szSegs[pos++],szSegs[pos++],szSegs[pos++],isAbs);
                        } while (!isNaN(Number(szSegs[pos])) && pos < szSegsLength);
                        break;
                    case "C":
                        isAbs = true;
                    case "c":
                        do {
                            this.cubicBezier(szSegs[pos++],szSegs[pos++],szSegs[pos++],
                                             szSegs[pos++],szSegs[pos++],szSegs[pos++],isAbs);
                        } while (!isNaN(Number(szSegs[pos])) && pos < szSegsLength);
                        break;
                    case "S":
                        isAbs = true;
                    case "s":
                        do {
                            this.cubicBezierSmooth(szSegs[pos++],szSegs[pos++],szSegs[pos++],szSegs[pos++],isAbs);
                        } while (!isNaN(Number(szSegs[pos])) && pos < szSegsLength);
                        break;
                    case "Q":
                        isAbs = true;
                    case "q":
                        do {
                            this.quadraticBezier(szSegs[pos++],szSegs[pos++],szSegs[pos++],szSegs[pos++],isAbs);
                        } while (!isNaN(Number(szSegs[pos])) && pos < szSegsLength);
                        break;
                    case "T":
                        isAbs = true;
                    case "t":
                        do {
                            this.quadraticBezierSmooth(szSegs[pos++],szSegs[pos++],isAbs);
                        } while (!isNaN(Number(szSegs[pos])) && pos < szSegsLength);
                        break;

                    default:
                        trace("Unknown Segment Type: " + command);
                        break;
                }
            }
        }

        private function closePath():void {
            this.line(this.startX, this.startY, true);
        }

        private function moveTo(x:Number, y:Number, isAbs:Boolean):void {
            if (!isAbs) {
                x += this.currentX;
                y += this.currentY;
            }

            this.currentX = x;
            this.currentY = y;

            this.startX = x;
            this.startY = y;

            this.lastCurveControlX = this.currentX;
            this.lastCurveControlY = this.currentY;
        }

        private function lineHorizontal(x:Number, isAbs:Boolean):void {
            var y:Number = this.currentY;
            if (!isAbs) {
                x += this.currentX;
                isAbs = true;
            }
            this.line(x,y,isAbs);
        }

        private function lineVertical(y:Number, isAbs:Boolean):void {
            var x:Number = this.currentX;
            if (!isAbs) {
                y += this.currentY;
                isAbs = true;
            }
            this.line(x,y,isAbs);
        }

        private function line(x:Number, y:Number, isAbs:Boolean):void {
            if (!isAbs) {
                x += this.currentX;
                y += this.currentY;
            }
            if ( (x != this.currentX) || (y != this.currentY)) {
                var a:SVGCoordinate = new SVGCoordinate(this.currentX, this.currentY);
                var b:SVGCoordinate = new SVGCoordinate(x, y);
                this.motionPath.addLine(a, b);
            }

            this.currentX = x;
            this.currentY = y;

            this.lastCurveControlX = this.currentX;
            this.lastCurveControlY = this.currentY;
        }

        private function ellipticalArc(rx:Number, ry:Number, xAxisRotation:Number, largeArcFlag:Number,
                                        sweepFlag:Number, x:Number, y:Number, isAbs:Boolean):void {
            if (!isAbs) {
                x += this.currentX;
                y += this.currentY;
                isAbs = true;
            }

            var a:SVGCoordinate = new SVGCoordinate(this.currentX, this.currentY);
            var b:SVGCoordinate = new SVGCoordinate(x, y);

            this.motionPath.addEllipticalArc(a, b, rx, ry, xAxisRotation, largeArcFlag != 0, sweepFlag != 0);

            this.currentX = x;
            this.currentY = y;

            this.lastCurveControlX = this.currentX;
            this.lastCurveControlY = this.currentY;
        }

        private function quadraticBezierSmooth(x:Number, y:Number, isAbs:Boolean):void {
            var x1:Number = this.currentX + (this.currentX - this.lastCurveControlX);
            var y1:Number = this.currentY + (this.currentY - this.lastCurveControlY);

            if (!isAbs) {
                x += this.currentX;
                y += this.currentY;
                isAbs = true;
            }
            this.quadraticBezier(x1, y1, x, y, isAbs);
        }

        private function quadraticBezier(x1:Number, y1:Number, x:Number, y:Number, isAbs:Boolean):void {
            if (!isAbs) {
                x1 += this.currentX;
                y1 += this.currentY;
                x += this.currentX;
                y += this.currentY;
                isAbs = true;
            }

            var bx:Number = (this.currentX + 2.0 * x1) / 3.0;
            var by:Number = (this.currentY + 2.0 * y1) / 3.0;
            var cx:Number = (x + 2.0 * x1) / 3.0;
            var cy:Number = (y + 2.0 * y1) / 3.0;
            this.cubicBezier(bx, by, cx, cy, x, y, isAbs);

            this.currentX = x;
            this.currentY = y;

            this.lastCurveControlX = x1;
            this.lastCurveControlY = y1;
        }

        private function cubicBezierSmooth(x2:Number, y2:Number,
                                           x:Number, y:Number, isAbs:Boolean):void {
            var x1:Number = this.currentX + (this.currentX - this.lastCurveControlX);
            var y1:Number = this.currentY + (this.currentY - this.lastCurveControlY);
            if (!isAbs) {
                x2 += this.currentX;
                y2 += this.currentY;
                x += this.currentX;
                y += this.currentY;
                isAbs = true;
            }
            this.cubicBezier(x1, y1, x2, y2, x, y, isAbs);
        }

        private function cubicBezier(x1:Number, y1:Number, x2:Number, y2:Number,
                                     x:Number, y:Number, isAbs:Boolean):void {
            if (!isAbs) {
                x1 += this.currentX;
                y1 += this.currentY;
                x2 += this.currentX;
                y2 += this.currentY;
                x += this.currentX;
                y += this.currentY;
            }

            var a:SVGCoordinate = new SVGCoordinate(this.currentX, this.currentY);
            var b:SVGCoordinate = new SVGCoordinate(x1, y1);
            var c:SVGCoordinate = new SVGCoordinate(x2, y2);
            var d:SVGCoordinate = new SVGCoordinate(x, y);

            this.motionPath.addBezier(a, b, c, d);
            this.currentX = x;
            this.currentY = y;

            this.lastCurveControlX = x2;
            this.lastCurveControlY = y2;
        }

        override protected function parseAttributeNameParameter():void {
            attributeName = 'motion';
        }

        override protected function parseByParameter():void {
            if (toParameter != null) return;  // ignore by if there is a to
            if (valuesParameter != null) return;  //ignore if valuesParameter
            // by - only to be used with attributes that support addition
            byParameter = this.getAttribute('by', null);
        }

        override protected function parseCalcModeParameter():void {
            calcModeParameter = this.getAttribute('calcMode', 'paced');
        }

        override protected function parseKeyTimesParameter():void {
            keyTimesParameter = this.getAttribute('keyTimes', null);
            if (keyTimesParameter == null) {
                keyTimes = null;
            }
            else {
                keyTimes = keyTimesParameter.split(/;/);
            }
        }

        protected function parseKeyPointsParameter():void {
            keyPointsParameter = this.getAttribute('keyPoints', null);
            if (keyPointsParameter == null) {
                keyPoints = null;
            }
            else {
                keyPoints = keyPointsParameter.split(/;/);
            }
        }

        protected function checkParameters():void {
            // make sure keyTimes match with keyValues, keySplines, values...
            var err:Boolean = false;
            if (keyTimes) {
                if (keyPoints) {
                    if (keyPoints.length != keyTimes.length) err = true;
                }
                else if ( (motionPath.numSegments() + 1) != keyTimes.length) err = true;
                // keySplines handled in getKeyTimeSpline
            }
            else {
                if (keyPoints != null) err = true;
            }
            // spec says document error if list lengths don't match
            // fall back to paced
            if (err) calcModeParameter = 'paced';
        }

        protected function parseRotateParameter():void {
            rotateParameter = this.getAttribute('rotate', '0', false, false);
        }
    }
}
