package org.svgweb.utils
{
    import org.svgweb.utils.SVGCoordinate;
    import org.svgweb.utils.SVGPathSegment;

    public class SVGLineSegment extends SVGPathSegment
    {
        private var _a:SVGCoordinate;
        private var _b:SVGCoordinate;

        public function SVGLineSegment(a:SVGCoordinate, b:SVGCoordinate, len:Number=-1.0):void {
            _a = a;
            _b = b;
            _length = len;
            if (_length < 0.0) {
                _length = Math.sqrt(Math.pow(_b.x - _a.x, 2) + Math.pow(_b.y - _a.y, 2));
            }
        }

        override public function getXY(pathlength:Number):SVGCoordinate {
            var fraction:Number = pathlength/_length;
            var x:Number = _a.x + fraction * (_b.x - _a.x);
            var y:Number = _a.y + fraction * (_b.y - _a.y);
            return new SVGCoordinate(x, y);
        }
    }
}

