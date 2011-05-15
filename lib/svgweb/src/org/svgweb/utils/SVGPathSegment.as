package org.svgweb.utils
{
    import org.svgweb.utils.SVGCoordinate;

    public class SVGPathSegment
    {
        protected var _length:Number;

        public function SVGPathSegment():void {
            _length = 0.0;
        }

        public function getXY(pathlength:Number):SVGCoordinate {
            return new SVGCoordinate();
        }

        public function length():Number {
            return _length;
        }
    }
}

