package org.svgweb.utils
{
    import org.svgweb.utils.SVGMotionPathSegment;
    import org.svgweb.utils.SVGPathSegment;
    import org.svgweb.utils.SVGLineSegment;
    import org.svgweb.utils.SVGBezierSegment;
    import org.svgweb.utils.SVGEllipticalArcSegment;
    import org.svgweb.utils.SVGCoordinate;

    public class SVGMotionPath
    {
        private var _segments:Array;
        private var _pathLength:Number = 0.0;
        private var _numSegments:uint = 0;
        private var _lastSegment:uint;      // most recent segment yielding a position
        private var _lastPathLength:Number; // pathlength to _lastSegment

        public function SVGMotionPath() {
            _segments = new Array();
            _lastSegment = 0;
            _lastPathLength = 0.0;
        }

        public function numSegments():uint {
            return _numSegments;
        }

        public function lengthToSegment(i:uint):Number {
            if (i >= _numSegments) return _pathLength;
            return _segments[i].lengthToSegment();
        }

        public function addLine(a:SVGCoordinate, b:SVGCoordinate, len:Number=-1.0):void {
            var seg:SVGLineSegment = new SVGLineSegment(a, b, len);
            _segments.push(new SVGMotionPathSegment(seg, _pathLength));
            _pathLength += seg.length();
            _numSegments++;
        }

        public function addBezier(a:SVGCoordinate, b:SVGCoordinate,
                                  c:SVGCoordinate, d:SVGCoordinate):void {
            var seg:SVGBezierSegment = new SVGBezierSegment(a, b, c, d);
            _segments.push(new SVGMotionPathSegment(seg, _pathLength));
            _pathLength += seg.length();
            _numSegments++;
        }

        public function addEllipticalArc(a:SVGCoordinate, b:SVGCoordinate,
                                         rx:Number, ry:Number,
                                         phi:Number,
                                         largeArc:Boolean, sweep:Boolean):void {
            var seg:SVGEllipticalArcSegment = new SVGEllipticalArcSegment(a, b, rx, ry, phi, largeArc, sweep);
            _segments.push(new SVGMotionPathSegment(seg, _pathLength));
            _pathLength += seg.length();
            _numSegments++;
        }

        public function pathLength():Number {
            return _pathLength;
        }

        public function getFractionPos(fraction:Number):SVGCoordinate {
            var pathLength:Number = fraction * _pathLength;
            return getPathLengthPos(pathLength);
        }

        public function getPathLengthPos(pathLength:Number):SVGCoordinate {
            var seg:SVGMotionPathSegment = getPathLengthSegment(pathLength);
            return seg.getXY(pathLength);
        }

        public function getFractionSegment(fraction:Number):SVGMotionPathSegment {
            var pathLength:Number = fraction * _pathLength;
            return getPathLengthSegment(pathLength);
        }

        public function getPathLengthSegment(pathLength:Number):SVGMotionPathSegment {
            if (pathLength < _lastPathLength) {  // start from the beginning
                _lastSegment = 0;
                _lastPathLength = 0.0;
            }
            var iseg:uint;
            for (iseg = _lastSegment; iseg < _numSegments; iseg++) {
                if (pathLength < _segments[iseg].lengthToSegment()) break;
            }
            iseg--;
            _lastSegment = iseg;
            _lastPathLength = _segments[iseg].lengthToSegment();
            return _segments[iseg];
        }
    }
}
