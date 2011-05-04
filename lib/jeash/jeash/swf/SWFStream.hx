/**
 * Copyright (c) 2010, Jeash contributors.
 * 
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 *   - Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   - Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

package jeash.swf;

import flash.utils.IDataInput;
import flash.geom.Rectangle;
import flash.geom.Matrix;
import flash.display.SpreadMethod;
import flash.display.InterpolationMethod;
import flash.display.CapsStyle;
import flash.display.JointStyle;
import flash.display.LineScaleMode;
import flash.text.TextFormatAlign;

class SWFStream
{
   var mStream:IDataInput;
   var mVersion:Int;
   var mByteBuf:Int;
   var mBitPos:Int;
   var mTagSize:Int;
   var mTagRead:Int;

   var mPushTagSize:Int;
   var mPushTagRead:Int;

   public function new(inStream:IDataInput)
   {
      mStream = inStream;
      var sig0 = String.fromCharCode(mStream.readUnsignedByte());
      var sig1 = String.fromCharCode(mStream.readUnsignedByte());
      var sig2 = String.fromCharCode(mStream.readUnsignedByte());
      var sig = sig0 + sig1 + sig2;

      var ver = mStream.readUnsignedByte();

      if (sig!="FWS" && sig!="CWS")
         throw "Invalid signature";

      if (ver>9)
         throw("unknown swf version");

      mVersion = ver;

      var length = inStream.readInt();

      if (sig=="CWS")
      {
         mStream = flash.utils.Uncompress.ConvertStream(mStream);
      }

      #if flash9
      mStream.endian = flash.utils.Endian.LITTLE_ENDIAN;
      #end

      mBitPos = 0;
      mByteBuf = 0;
      mTagRead = 0;
   }

   public function close() {
   #if neko
      mStream.close();
   #end
      mStream = null;
   }


   public function GetVersion() { return mVersion; }
   public function AlignBits() { mBitPos = 0; }
   public function Bits(inBits:Int,?inSigned:Bool) : Int
   {
      var sign_bit = inBits - 1;
      var result=0;
      var left = inBits;
   
      while(left!=0)
      {
         if (mBitPos==0)
         {
            mByteBuf = mStream.readUnsignedByte();
            mTagRead++;
            mBitPos = 8;
         }
   
         while( mBitPos>0 && left>0)
         {
            result = (result<<1) | ((mByteBuf>>7) & 1);
            mBitPos--;
            left--;
            mByteBuf <<= 1;
         }
      }
   
   
      if ( inSigned!=null && inSigned )
      {
         var mask = (1<<sign_bit);
         if ( (result & mask)!=0)
            result -= (1<<inBits);
      }
      return result;
   }
   

   public function Twips(inBits:Int) : Float
   {
      var val = Bits(inBits,true);
      return val * 0.05;
   }

   public function ReadBool() : Bool
   {
      return Bits(1) == 1;
   }

   public function ReadSpreadMethod() : SpreadMethod
   {
       switch( Bits(2) )
         {
            case 0: return SpreadMethod.PAD;
            case 1: return SpreadMethod.REFLECT;
            case 2: return SpreadMethod.REPEAT;
            case 3: return SpreadMethod.PAD;
         }
        return SpreadMethod.REPEAT;
   }

   public function ReadInterpolationMethod() : InterpolationMethod
   {
       switch( Bits(2) )
         {
            case 0: return InterpolationMethod.RGB;
            case 1: return InterpolationMethod.LINEAR_RGB;
         }
       return InterpolationMethod.RGB;
   }


   public function ReadCapsStyle() : CapsStyle
   {
       switch( Bits(2) )
         {
            case 0: return CapsStyle.ROUND;
            case 1: return CapsStyle.NONE;
            case 2: return CapsStyle.SQUARE;
         }
       return CapsStyle.ROUND;
   }

   public function ReadJoinStyle() : JointStyle
   {
       switch( Bits(2) )
         {
            case 0: return JointStyle.ROUND;
            case 1: return JointStyle.BEVEL;
            case 2: return JointStyle.MITER;
         }
       return JointStyle.ROUND;
   }


   public function ReadScaleMode() : LineScaleMode
   {
       switch( Bits(2) )
         {
            case 0: return LineScaleMode.NORMAL;
            case 1: return LineScaleMode.HORIZONTAL;
            case 2: return LineScaleMode.VERTICAL;
            case 3: return LineScaleMode.NONE;
         }
       return LineScaleMode.NORMAL;
   }



   public function ReadRect() : Rectangle
   {
      AlignBits();
      var bits = Bits(5);
      var x0 = Twips(bits); 
      var x1 = Twips(bits); 
      var y0 = Twips(bits); 
      var y1 = Twips(bits); 

      return new Rectangle(x0,y0,(x1-x0),(y1-y0));
   }

   public function ReadAlign()
   {
      var a = ReadByte();
      switch(a)
      {
         case 0: return TextFormatAlign.LEFT;
         case 1: return TextFormatAlign.RIGHT;
         case 2: return TextFormatAlign.CENTER;
         case 3: return TextFormatAlign.JUSTIFY;
      }
      return TextFormatAlign.LEFT;
   }


   public function FrameRate() : Float
      { return mStream.readUnsignedShort() / 256.0; }

   public function Frames() : Int
      { return mStream.readUnsignedShort(); }

   public function ReadID() : Int
   {
      mTagRead+=2;
      return mStream.readUnsignedShort();
   }

   public function ReadDepth() : Int
   {
      mTagRead+=2;
      return mStream.readUnsignedShort();
   }

   public function ReadUI16() : Int
   {
      mTagRead+=2;
      return mStream.readUnsignedShort();
   }

   public function ReadSI16() : Int
   {
      mTagRead+=2;
      return mStream.readShort();
   }

   public function ReadSTwips() : Float { return ReadSI16() * 0.05; }
   public function ReadUTwips() : Float { return ReadUI16() * 0.05; }
   
   public function ReadInt() : Int
   {
      mTagRead+=4;
      return mStream.readInt();
   }

   public function ReadByte() : Int
   {
      mTagRead++;
      return mStream.readUnsignedByte();
   }

   public function ReadRGB() : Int
   {
      mTagRead+=3;
      var r:Int = mStream.readUnsignedByte();
      var g:Int = mStream.readUnsignedByte();
      var b:Int = mStream.readUnsignedByte();
      return (r<<16) | (g<<8) | b;
   }

   public function ReadPascalString() : String
   {
      var len = ReadByte();
      var result = "";
      for(i in 0...len)
      {
         var c = ReadByte();
         if (c>0)
            result += String.fromCharCode(c);
      }

      return result;
   }


   public function ReadString() : String
   {
      var result = "";
      while(true)
      {
         var r = ReadByte();
         if (r==0)
            return result;
         result += String.fromCharCode(r);
      }

      return result;
   }



   public function ReadArraySize(inExtended:Bool)
   {
      mTagRead++;
      var result = mStream.readUnsignedByte();
      if (inExtended && result==0xff)
      {
         mTagRead+=2;
         result = mStream.readUnsignedShort();
      }
      return result;
   }

   public function Fixed(inBits:Int) : Float
   {
      return Bits(inBits,true) / 65536.0;
   }

   public function ReadMatrix()
   {
      var result = new Matrix();

      AlignBits();
      var has_scale = ReadBool();
      var scale_bits = has_scale ? Bits(5) : 0;
      result.a = has_scale ? Fixed(scale_bits) : 1.0;
      result.d = has_scale ? Fixed(scale_bits) : 1.0;
      var has_rotate = ReadBool();
      var rotate_bits = has_rotate ? Bits(5) : 0;
      result.b = has_rotate ? Fixed(rotate_bits) : 0.0;
      result.c = has_rotate ? Fixed(rotate_bits) : 0.0;
      var trans_bits = Bits(5);
      result.tx = Twips(trans_bits);
      result.ty = Twips(trans_bits);

      return result;
   }

   public function ReadColorTransform()
   {
      var result = new flash.geom.ColorTransform();

      var has_add = ReadBool();
      var has_mult = ReadBool();
      var bits = Bits(4);
      if (has_mult)
      {
         result.redMultiplier = Bits(bits,true);
         result.greenMultiplier = Bits(bits,true);
         result.blueMultiplier = Bits(bits,true);
      }
      if (has_add)
      {
         result.redOffset = Bits(bits,true);
         result.greenOffset = Bits(bits,true);
         result.blueOffset = Bits(bits,true);
      }

      return result;
   }



   public function BeginTag() : Int
   {
      var data = mStream.readUnsignedShort();
      var tag = data >> 6;
      var length = data & 0x3f;
   
      if (tag>=Tags.LAST)
         return 0;
   
      if (length == 0x3F)
         length = mStream.readUnsignedInt();

      mTagSize = length;
      mTagRead = 0;
   
      return tag;
   }
   public function EndTag()
   {
      var read = mTagRead;
      var size = mTagSize;

      if (read>size)
         throw "tag read overflow";

      while(read<size)
      {
         mStream.readUnsignedByte();
         read++;
      }
   }

   public function ReadBytes(inSize:Int) : haxe.io.Bytes
   {
   #if flash
       var bytes = new flash.utils.ByteArray();
       mStream.readBytes(bytes,0,inSize);
       var buffer = haxe.io.Bytes.ofData(bytes);
   #else
       var buffer = mStream.readBytes(inSize);
   #end
       mTagRead += inSize;
       return buffer;
   }

   public function BytesLeft() { return mTagSize - mTagRead; }

   public function PushTag()
   {
      mPushTagRead = mTagRead;
      mPushTagSize = mTagSize;
   }
 
   public function PopTag()
   {
      // should probably count properly ...
      mTagRead = mPushTagSize;
      mTagSize = mPushTagSize;
   }




}
