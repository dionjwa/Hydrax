package gm2d.svg;

import gm2d.geom.Matrix;

class RenderContext
{
   public function new()
   {
      matrix = null;
      firstX = 0;
      firstY = 0;
      lastX = 0;
      lastY = 0;
   }
   inline public function  transX(inX:Float, inY:Float)
   {
      return matrix==null ? inX : (inX*matrix.a + inY*matrix.c + matrix.tx);
   }
   inline public function  transY(inX:Float, inY:Float)
   {
      return matrix==null ? inY : (inX*matrix.b + inY*matrix.d + matrix.ty);
   }


   public function setLast(inX:Float, inY:Float)
   {
      lastX = transX(inX,inY);
      lastY = transY(inX,inY);
   }
   public var matrix:Matrix;
   public var firstX:Float;
   public var firstY:Float;
   public var lastX:Float;
   public var lastY:Float;
}
