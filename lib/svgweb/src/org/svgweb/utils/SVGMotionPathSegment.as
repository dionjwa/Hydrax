package org.svgweb.utils
{
    import org.svgweb.utils.SVGPathSegment;

    public class SVGMotionPathSegment
    {
        private var _seg:SVGPathSegment;
        private var _pathLength0:Number;   //total path length to start of segment

        public function SVGMotionPathSegment(seg:SVGPathSegment, length0:Number):void {
            _seg = seg;
            _pathLength0 = length0;
        }

        public function getXY(pathLength:Number):SVGCoordinate {
            return _seg.getXY(pathLength - _pathLength0);
        }

        public function lengthToSegment() : Number {
            return _pathLength0;
        }

        public function length():Number {
            return _seg.length();
        }
    }
}
