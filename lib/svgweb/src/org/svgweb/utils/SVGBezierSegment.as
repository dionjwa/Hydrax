package org.svgweb.utils
{
    import org.svgweb.utils.SVGCoordinate;
    import org.svgweb.utils.SVGPathSegment;
    import org.svgweb.utils.SVGMotionPath;

    public class SVGBezierSegment extends SVGPathSegment
    {
        private var _segs:SVGMotionPath;
        private var _level:uint;

        public function SVGBezierSegment(a:SVGCoordinate, b:SVGCoordinate,
                                         c:SVGCoordinate, d:SVGCoordinate):void  {
            _segs = new SVGMotionPath();
            _level = 0;
            createLineSegments(a, b, c, d, -1.0);
            _length = _segs.pathLength();
        }

        override public function getXY(pathlength:Number):SVGCoordinate {
            return _segs.getPathLengthPos(pathlength);
        }

        private function createLineSegments(A:SVGCoordinate, B:SVGCoordinate,
                                            C:SVGCoordinate, D:SVGCoordinate,
                                            AD:Number):void {
            // AD is the length from A to D.
            if (AD < 0.0) {
                AD = Math.sqrt(Math.pow(D.x - A.x, 2) + Math.pow(D.y - A.y, 2));
            }
            // subdivide into 2 segments
            var lB:SVGCoordinate = new SVGCoordinate(); // left control point b
            var lC:SVGCoordinate = new SVGCoordinate(); // left control point c
            var M:SVGCoordinate = new SVGCoordinate();  // "mid" point
            var rB:SVGCoordinate = new SVGCoordinate(); // right control point b
            var rC:SVGCoordinate = new SVGCoordinate(); // right control point c
            lB.x = (A.x + B.x) / 2.0;
            lB.y = (A.y + B.y) / 2.0;
            M.x = (B.x + C.x) / 2.0;
            M.y = (B.y + C.y) / 2.0;
            rC.x = (C.x + D.x) / 2.0;
            rC.y = (C.y + D.y) / 2.0;
            lC.x = (M.x + lB.x) / 2.0;
            lC.y = (M.y + lB.y) / 2.0;
            rB.x = (M.x + rC.x) / 2.0;
            rB.y = (M.y + rC.y) / 2.0;
            M.x = (lC.x + rB.x) / 2.0;
            M.y = (lC.y + rB.y) / 2.0;

            // check for straightness
            var AM:Number = Math.sqrt(Math.pow(M.x - A.x, 2) + Math.pow(M.y - A.y, 2));
            var MD:Number = Math.sqrt(Math.pow(D.x - M.x, 2) + Math.pow(D.y - M.y, 2));

            if (_level > 0) {  // don't check on first subdivision
                if (((AM + MD)/AD - 1.0) < 0.001) {
                    _segs.addLine(A, M, AM);
                    _segs.addLine(M, D, MD);
                    return;
                }
            }
            _level++;
            createLineSegments(A, lB, lC, M, AM);   // left
            createLineSegments(M, rB, rC, D, MD);   // right
        }
    }
}
