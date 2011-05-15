package org.svgweb.utils
{
    import org.svgweb.utils.SVGCoordinate;
    import org.svgweb.utils.SVGPathSegment;
    import org.svgweb.utils.SVGMotionPath;
    import org.svgweb.utils.EllipticalArc;

    public class SVGEllipticalArcSegment extends SVGPathSegment
    {
        private var _segs:SVGMotionPath;

        public function SVGEllipticalArcSegment(a:SVGCoordinate, b:SVGCoordinate,
                                                rx:Number, ry:Number,
                                                phi:Number,
                                                largeArc:Boolean, sweep:Boolean):void  {
            _segs = new SVGMotionPath();
            createLineSegments(a, b, rx, ry, phi, largeArc, sweep);
            _length = _segs.pathLength();
        }

        override public function getXY(pathlength:Number):SVGCoordinate {
            return _segs.getPathLengthPos(pathlength);
        }

        private function createLineSegments(a:SVGCoordinate, b:SVGCoordinate,
                                            rx:Number, ry:Number,
                                            phi:Number,
                                            largeArc:Boolean, sweep:Boolean):void {
            if (a.equals(b)) {  // zero length segment
                _segs.addLine(a, b, 0.0);
                return;
            }
            if ((rx == 0.0) || (ry == 0.0)) {  // straight line
                _segs.addLine(a, b);
                return;
            }

            var arcparams:Object = EllipticalArc.computeSvgArc(rx, ry, phi , largeArc, sweep,
                                                               b.x, b.y, a.x, a.y);
            phi *= Math.PI / 180;
            var cosphi:Number = Math.cos(phi);
            var sinphi:Number = Math.sin(phi);
            rx = arcparams.radius;
            ry = arcparams.yRadius;
            var numsegs:uint = Math.ceil(Math.abs(arcparams.arc) / 2);  // 2 degrees per segment
            var dTheta:Number = arcparams.arc * Math.PI / (numsegs * 180);
            var theta:Number = arcparams.startAngle * Math.PI/180;
            var i:uint;
            var s0:SVGCoordinate = a;
            for (i = 0; i < numsegs-1; i++) {
                var s1:SVGCoordinate = new SVGCoordinate();
                var rxCosTheta:Number = rx * Math.cos(theta);
                var rySinTheta:Number = ry * Math.sin(theta);
                s1.x = cosphi * rxCosTheta - sinphi * rySinTheta + arcparams.cx;
                s1.y = sinphi * rxCosTheta + cosphi * rySinTheta + arcparams.cy;
                _segs.addLine(s0, s1);
                s0 = s1;
                theta += dTheta;
            }
            //final segment
            _segs.addLine(s0, b);
        }
    }
}
