package org.svgweb.utils
{
    public class SVGCoordinate
    {
        public var x:Number;
        public var y:Number;

        public function SVGCoordinate(xcoord:Number = 0.0, ycoord:Number = 0.0):void {
            this.x = xcoord;
            this.y = ycoord;
        }

        public function zero():void {
            this.x = 0.0;
            this.y = 0.0;
        }

        public function copy(coord:SVGCoordinate):void {
            this.x = coord.x;
            this.y = coord.y;
        }

        public function setXY(newX:Number, newY:Number):void {
            this.x = newX;
            this.y = newY;
        }

        public function add(a:SVGCoordinate):void {
            this.x += a.x;
            this.y += a.y;
        }

        public function sub(a:SVGCoordinate):void {
            this.x -= a.x;
            this.y -= a.y;
        }

        public function isZero():Boolean {
            return (this.x == 0.0) && (this.y == 0.0);
        }

        public function scale(n:Number):void {
            this.x *= n;
            this.y *= n;
        }

        public function equals(b:SVGCoordinate):Boolean {
            return (this.x == b.x) && (this.y == b.y);
        }
    }
}
