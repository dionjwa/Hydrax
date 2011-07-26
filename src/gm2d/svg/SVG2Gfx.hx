package gm2d.svg;

import Xml;
import gm2d.svg.PathParser;
import gm2d.svg.PathSegment;
#if flash
import flash.geom.Matrix;
import flash.geom.Rectangle;
import flash.display.Graphics;

import flash.display.Shape;
import flash.display.Sprite;
import flash.display.DisplayObject;
import flash.display.GradientType;
import flash.display.SpreadMethod;
import flash.display.InterpolationMethod;
import flash.display.CapsStyle;
import flash.display.JointStyle;
import flash.display.LineScaleMode;
#else
import nme.geom.Matrix;
import nme.geom.Rectangle;
import nme.display.Graphics;

import nme.display.Shape;
import nme.display.Sprite;
import nme.display.DisplayObject;
import nme.display.GradientType;
import nme.display.SpreadMethod;
import nme.display.InterpolationMethod;
import nme.display.CapsStyle;
import nme.display.JointStyle;
import nme.display.LineScaleMode;

#end


class Grad
{
   public function new(inType:GradientType)
   {
      type = inType;
      cols = [];
      alphas = [];
      ratios = [];
      matrix = new Matrix();
      spread = SpreadMethod.PAD;
      interp = InterpolationMethod.RGB;
      radius = 0.0;
      focus = 0.0;
      x1 = 0.0;
      y1 = 0.0;
      x2 = 0.0;
      y2 = 0.0;
   }
   public function renference_regex()
   {
      return ~//;
   }


   public function GetMatrix(inMatrix:Matrix)
   {
      var dx = x2 - x1;
      var dy = y2 - y1;
      var theta = Math.atan2(dy,dx);
      var len = Math.sqrt(dx*dx+dy*dy);

      var mtx = new Matrix();

      if (type==GradientType.LINEAR)
      {
         mtx.createGradientBox(1.0,1.0);
         mtx.scale(len,len);
      }
      else
      {
         if (radius!=0.0)
            focus = len/radius;

         mtx.createGradientBox(1.0,1.0);
         mtx.translate(-0.5,-0.5);
         mtx.scale(radius*2,radius*2);
      }

      mtx.rotate(theta);
      mtx.translate(x1,y1);
      mtx.concat(matrix);
      mtx.concat(inMatrix);

      return mtx;
   }

   public var type:GradientType;
   public var cols:Array<Int>;
   public var alphas:Array<Float>;
   public var ratios:Array<Int>;
   public var matrix: Matrix;
   public var spread: SpreadMethod;
   public var interp:InterpolationMethod;
   public var radius:Float;
   public var focus:Float;
   public var x1:Float;
   public var y1:Float;
   public var x2:Float;
   public var y2:Float;

}

typedef GradHash = Hash<Grad>;

enum FillType
{
   FillGrad(grad:Grad);
   FillSolid(colour:Int);
   FillNone;
   // Bitmap
}

typedef PathSegments = Array<PathSegment>;

class Path
{
   public function new() { }

   public var fill:FillType;
   public var fill_alpha:Float;
   public var stroke_alpha:Float;
   public var stroke_colour:Null<Int>;
   public var stroke_width:Float;
   public var stroke_caps:CapsStyle;
   public var joint_style:JointStyle;
   public var miter_limit:Float;
   public var matrix:Matrix;
   public var name:String;

   public var segments:PathSegments;
}

class Group
{
   public function new()
   {
      name = "";
      children = [];
   }

   public var name:String;
   public var children:Array<DisplayElement>;
}

enum DisplayElement
{
   DisplayPath(path:Path);
   DisplayGroup(group:Group);
}

typedef DisplayElements = Array<DisplayElement>;

typedef Styles = Hash<String>;
typedef GroupPath = Array<String>;
typedef ObjectFilter = String->GroupPath->Bool;

class SVG2Gfx
{
    public var width(default,null):Float;
    public var height(default,null):Float;

    var mGrads : GradHash;
    var mPathParser: PathParser;

    var mRoot:Array<Group>;

    var mGfx : Graphics;
    var mMatrix : Matrix;
    var mFilter : ObjectFilter;
    var mGroupPath : GroupPath;
    var mExtent:Rectangle;

    static var mStyleSplit = ~/;/g;
    static var mStyleValue = ~/\s*(.*)\s*:\s*(.*)\s*/;

    static var mTranslateMatch = ~/translate\((.*),(.*)\)/;
    static var mScaleMatch = ~/scale\((.*)\)/;
    static var mMatrixMatch = ~/matrix\((.*),(.*),(.*),(.*),(.*),(.*)\)/;
    static var mURLMatch = ~/url\(#(.*)\)/;

    public function new(inXML:Xml)
    {
       var svg =  inXML.firstElement();
       if (svg==null || (svg.nodeName!="svg" && svg.nodeName!="svg:svg" ) )
          throw "Not an SVG file (" + (svg==null ? "null" : svg.nodeName) + ")";

       mGrads = new GradHash();

       mPathParser = new PathParser();

       mRoot = new Array();

       width = GetFloatStyle("width",svg,null,0.0);
       height = GetFloatStyle("height",svg,null,0.0);
       if (width==0 && height==0)
          width = height = 400;
       else if (width==0)
          width = height;
       else if (height==0)
          height = width;

          
	   var rootGroup = new Group();
	   mRoot.push(rootGroup);
          
          
       for(element in svg.elements())
       {
          var name = element.nodeName;
          if (name.substr(0,4)=="svg:")
             name = name.substr(4);

          if (name=="defs")
             LoadDefs(element);
          else if (name=="g")
          {
             mRoot.push( LoadGroup(element,new Matrix(), null)  );
          }
          else if (name=="path")
          {
             rootGroup.children.push( DisplayPath( LoadPath(element,new Matrix(), null, false) ) );
          }
          else if (name=="rect")
          {
             rootGroup.children.push( DisplayPath( LoadPath(element,new Matrix(), null, true) ) );
          }
          else
          {
          	  // trace("cannot draw " + name + " types");
             // throw("Unknown child : " + el.nodeName );
          }
       }

       //trace("SVG:");
       //for(g in mRoot)
          //DumpGroup(g,"");
    }

    function DumpGroup(g:Group,indent:String)
    {
       trace(indent + "Group:" + g.name);
       indent += "  ";
       for(e in g.children)
       {
          switch(e)
          {
             case DisplayPath(path): trace(indent + "Path" + "  " + path.matrix);
             case DisplayGroup(group): DumpGroup(group,indent+"   ");
          }
       }
    }

    function GetFloat(inXML:Xml,inName:String,inDef:Float=0.0) : Float
    {
       if (inXML.exists(inName))
          return Std.parseFloat(inXML.get(inName));
       return inDef;
    }

    function LoadGradient(inGrad:Xml,inType:GradientType,inCrossLink:Bool)
    {
       var name = inGrad.get("id");
       var grad = new Grad(inType);

       if (inCrossLink && inGrad.exists("xlink:href"))
       {
          var xlink = inGrad.get("xlink:href");
          if (xlink.charAt(0)!="#")
             throw("xlink - unkown syntax : " + xlink );
          var base = mGrads.get(xlink.substr(1));
          if (base!=null)
          {
             grad.cols = base.cols;
             grad.alphas = base.alphas;
             grad.ratios = base.ratios;
             grad.matrix = base.matrix.clone();
             grad.spread = base.spread;
             grad.interp = base.interp;
             grad.radius = base.radius;
          }
             else throw("Unknown xlink : " + xlink);
       }

       if (inGrad.exists("x1"))
       {
          grad.x1 = GetFloat(inGrad,"x1");
          grad.y1 = GetFloat(inGrad,"y1");
          grad.x2 = GetFloat(inGrad,"x2");
          grad.y2 = GetFloat(inGrad,"y2");
       }
       else
       {
          grad.x1 = GetFloat(inGrad,"cx");
          grad.y1 = GetFloat(inGrad,"cy");
          grad.x2 = GetFloat(inGrad,"fx",grad.x1);
          grad.y2 = GetFloat(inGrad,"fy",grad.y1);
       }

       grad.radius = GetFloat(inGrad,"r");


       if (inGrad.exists("gradientTransform"))
          ApplyTransform(grad.matrix,inGrad.get("gradientTransform"));


       // todo - grad.spread = base.spread;

       for(stop in inGrad.elements())
       {
          var styles = GetStyles(stop,null);

          grad.cols.push( GetColourStyle("stop-color",stop,styles,0x000000) );
          grad.alphas.push( GetFloatStyle("stop-opacity",stop,styles,1.0) );
          grad.ratios.push(
             Std.int( Std.parseFloat(stop.get("offset") ) * 255.0) );
       }


       mGrads.set(name,grad);
    }

    function LoadDefs(inXML:Xml)
    {
       // Two passes - to allow forward xlinks
       for(pass in 0...2)
          for(def in inXML.elements())
          {
             var name = def.nodeName;
             if (name.substr(0,4)=="svg:")
                name = name.substr(4);
             if (name=="linearGradient")
                LoadGradient(def,GradientType.LINEAR,pass==1);
             else if (name=="radialGradient")
                LoadGradient(def,GradientType.RADIAL,pass==1);
          }
    }

    function ApplyTransform(ioMatrix:Matrix, inTrans:String) : Float
    {
       var scale = 1.0;
       if (mTranslateMatch.match(inTrans))
       {
          // TODO: Pre-translate
          ioMatrix.translate(
                  Std.parseFloat( mTranslateMatch.matched(1) ),
                  Std.parseFloat( mTranslateMatch.matched(2) ));
       }
       else if (mScaleMatch.match(inTrans))
       {
          // TODO: Pre-scale
          var s = Std.parseFloat( mScaleMatch.matched(1) );
          ioMatrix.scale(s,s);
          scale = s;
       }
       else if (mMatrixMatch.match(inTrans))
       {
          var m = new Matrix(
                  Std.parseFloat( mMatrixMatch.matched(1) ),
                  Std.parseFloat( mMatrixMatch.matched(2) ),
                  Std.parseFloat( mMatrixMatch.matched(3) ),
                  Std.parseFloat( mMatrixMatch.matched(4) ),
                  Std.parseFloat( mMatrixMatch.matched(5) ),
                  Std.parseFloat( mMatrixMatch.matched(6) ) );
          m.concat(ioMatrix);
          ioMatrix.a = m.a;
          ioMatrix.b = m.b;
          ioMatrix.c = m.c;
          ioMatrix.d = m.d;
          ioMatrix.tx = m.tx;
          ioMatrix.ty = m.ty;
          scale = Math.sqrt( ioMatrix.a*ioMatrix.a + ioMatrix.c*ioMatrix.c );
       }
       else 
          trace("Warning, unknown transform:" + inTrans);
       return scale;
    }


   function GetStyles(inNode:Xml,inPrevStyles:Styles) : Styles
   {
      if (!inNode.exists("style"))
         return inPrevStyles;

      var styles = new Styles();
      if (inPrevStyles!=null)
         for(s in inPrevStyles.keys())
         {
            styles.set(s,inPrevStyles.get(s));
         }

      var style = inNode.get("style");
      var strings = mStyleSplit.split(style);
      for(s in strings)
      {
         if (mStyleValue.match(s))
            styles.set(mStyleValue.matched(1),mStyleValue.matched(2));
      }

      return styles;
   }

   function GetStyle(inKey:String,inNode:Xml,inStyles:Styles,inDefault:String)
   {
      if (inNode!=null && inNode.exists(inKey))
      {
         return inNode.get(inKey);
      }

      if (inStyles!=null && inStyles.exists(inKey))
         return inStyles.get(inKey);
 
      //trace("Key not found : " + inKey);
      //trace(inStyles);
      //throw("not found");

      return inDefault;
   }

   function GetFloatStyle(inKey:String,inNode:Xml,inStyles:Styles,
               inDefault:Float)
   {
      var s = GetStyle(inKey,inNode,inStyles,"");
      if (s=="")
         return inDefault;
      return Std.parseFloat(s);
   }

   function GetColourStyle(inKey:String,inNode:Xml,inStyles:Styles,
               inDefault:Int)
   {
      var s = GetStyle(inKey,inNode,inStyles,"");
      if (s=="")
         return inDefault;
      if (s.charAt(0)=='#')
         return Std.parseInt( "0x" + s.substr(1) );
         
      return Std.parseInt(s);
   }

   function GetStrokeStyle(inKey:String,inNode:Xml,inStyles:Styles,
               inDefault:Null<Int>)
   {
      var s = GetStyle(inKey,inNode,inStyles,"");
      if (s=="")
         return inDefault;

      if (s=="none")
         return null;

      if (s.charAt(0)=='#')
         return Std.parseInt( "0x" + s.substr(1) );

      return Std.parseInt(s);
   }

   function GetFillStyle(inKey:String,inNode:Xml,inStyles:Styles)
   {
      var s = GetStyle(inKey,inNode,inStyles,"");
      if (s=="")
         return FillNone;

      if (s.charAt(0)=='#')
         return FillSolid( Std.parseInt( "0x" + s.substr(1) ) );
 
      if (s=="none")
         return FillNone;

      if (mURLMatch.match(s))
      {
         var url = mURLMatch.matched(1);
         if (mGrads.exists(url))
            return FillGrad(mGrads.get(url));
         
         // throw("Unknown url:" + url);
         com.pblabs.util.Log.warn("Unknown url:" + url);
      }

      com.pblabs.util.Log.warn("Unknown fill string:" + s);
      	// trace("Unknown fill string:" + s);
      // throw("Unknown fill string:" + s);

      return FillNone;
   }



    public function LoadPath(inPath:Xml, matrix:Matrix,inStyles:Styles,inIsRect:Bool) : Path
    {
       if (inPath.exists("transform"))
       {
          matrix = matrix.clone();
          ApplyTransform(matrix,inPath.get("transform"));
       }

       var styles = GetStyles(inPath,inStyles);

       var name = inPath.exists("id") ? inPath.get("id") : "";

       var path = new Path();
       path.fill=GetFillStyle("fill",inPath,styles);
       path.fill_alpha= GetFloatStyle("fill-opacity",inPath,styles,1.0);
       path.stroke_alpha= GetFloatStyle("stroke-opacity",inPath,styles,1.0);
       path.stroke_colour=GetStrokeStyle("stroke",inPath,styles,null);
       path.stroke_width= GetFloatStyle("stroke-width",inPath,styles,1.0);
       path.stroke_caps=CapsStyle.ROUND;
       path.joint_style=JointStyle.ROUND;
       path.miter_limit= GetFloatStyle("stroke-miterlimit",inPath,styles,3.0);
       path.segments=[];
       path.matrix=matrix;
       path.name=name;

       if (inIsRect)
       {
          var x = Std.parseFloat(inPath.get("x"));
          var y = Std.parseFloat(inPath.get("y"));
          var w = Std.parseFloat(inPath.get("width"));
          var h = Std.parseFloat(inPath.get("height"));
          var rx = inPath.exists("rx") ? Std.parseFloat(inPath.get("rx")) : 0.0;
          var ry = inPath.exists("ry") ? Std.parseFloat(inPath.get("ry")) : 0.0;
          if (rx==0 || ry==0)
          {
             path.segments.push( new MoveSegment(x,y) );
             path.segments.push( new DrawSegment(x+w,y) );
             path.segments.push( new DrawSegment(x+w,y+h) );
             path.segments.push( new DrawSegment(x,y+h) );
             path.segments.push( new DrawSegment(x,y) );
          }
          else
          {
             path.segments.push( new MoveSegment(x,y+ry) );
             // top-left
             path.segments.push( new QuadraticSegment(x,y,x+rx,y) );
 
             path.segments.push( new DrawSegment(x+w-rx,y) );
             // top-right
             path.segments.push( new QuadraticSegment(x+w,y,x+w,y+rx) );
 
             path.segments.push( new DrawSegment(x+w,y+h-ry) );
 
             // bottom-right
             path.segments.push( new QuadraticSegment(x+w,y+h,x+w-rx,y+h) );
 
             path.segments.push( new DrawSegment(x+rx,y+h) );
 
             // bottom-left
             path.segments.push( new QuadraticSegment(x,y+h,x,y+h-ry) );
 
             path.segments.push( new DrawSegment(x,y+ry) );
           }
       }
       else
       {
          var d = inPath.get("d");
          for(segment in mPathParser.parse(d) )
             path.segments.push(segment);
       }

       return path;
    }

    public function LoadGroup(inG:Xml, matrix:Matrix,inStyles:Styles) : Group
    {
       var g = new Group();
       if (inG.exists("transform"))
       {
          matrix = matrix.clone();
          ApplyTransform(matrix,inG.get("transform"));
       }
       if (inG.exists("inkscape:label"))
          g.name = inG.get("inkscape:label");
       else if (inG.exists("id"))
          g.name = inG.get("id");

       var styles = GetStyles(inG,inStyles);


       for(el in inG.elements())
       {
          var name = el.nodeName;
          if (name.substr(0,4)=="svg:")
             name = name.substr(4);
          if (name=="g")
          {
             g.children.push( DisplayGroup(LoadGroup(el,matrix, styles)) );
          }
          else if (name=="path")
          {
             g.children.push( DisplayPath( LoadPath(el,matrix, styles, false) ) );
          }
          else if (name=="rect")
          {
             g.children.push( DisplayPath( LoadPath(el,matrix, styles, true) ) );
          }
          else
          {
          	  trace("cannot draw " + name + " types");
             // throw("Unknown child : " + el.nodeName );
          }
       }

       return g;
    }

    public function RenderPath(inPath:Path)
    {
       if (mFilter!=null && !mFilter(inPath.name,mGroupPath))
          return;

       var px = 0.0;
       var py = 0.0;

       var m:Matrix  = inPath.matrix.clone();
       m.concat(mMatrix);

       if (mGfx!=null)
       {
          switch(inPath.fill)
          {
             case FillGrad(grad):
                mGfx.beginGradientFill(grad.type, grad.cols, grad.alphas,
                         grad.ratios, grad.GetMatrix(m), grad.spread, grad.interp, grad.focus );

             case FillSolid(colour):
                mGfx.beginFill(colour,inPath.fill_alpha);
             case FillNone:
                mGfx.endFill();
          }


          if (inPath.stroke_colour==null)
          {
             mGfx.lineStyle();
          }
          else
          {
             var scale = Math.sqrt(m.a*m.a + m.c*m.c);
             var sw = inPath.stroke_width*scale;
             var a = inPath.stroke_alpha;
             mGfx.lineStyle( sw, inPath.stroke_colour,
                             a, false,LineScaleMode.NORMAL,
                             inPath.stroke_caps,inPath.joint_style,
                             inPath.miter_limit);
          }
       }


       if (mGfx==null)
       {
          for(segment in inPath.segments)
             segment.GetExtent(m,mExtent);

          // switch(inPath.fill) { case FillNone: default: Finalise(); }
       }
       else
       {
          var context = new RenderContext();
          context.matrix = m;
          for(segment in inPath.segments)
             segment.Draw(mGfx, context);
       }

    }



    public function RenderGroup(inGroup:Group,inIgnoreDot:Bool)
    {
       // Convention for hidden layers ...
       if (inGroup.name!=null && mGfx!=null && inGroup.name.substr(0,1)==".")
          return;

       mGroupPath.push(inGroup.name);

       // if (mFilter!=null && !mFilter(inGroup.name)) return;

       for(child in inGroup.children)
       {
          switch(child)
          {
             case DisplayGroup(group):
                RenderGroup(group,inIgnoreDot);
             case DisplayPath(path):
                RenderPath(path);
          }
       }

       mGroupPath.pop();
    }

    public function Render(inGfx:Dynamic,?inMatrix:Matrix, ?inFilter:ObjectFilter )
    {
       mGfx = inGfx;
       if (inMatrix==null)
          mMatrix = new Matrix();
       else
          mMatrix = inMatrix.clone();

       mFilter = inFilter;
       mGroupPath = [];

       for(g in mRoot)
          RenderGroup(g,true);
    }

    public function GetExtent(?inMatrix:Matrix, ?inFilter:ObjectFilter, inIgnoreDot=true ) :
        Rectangle
    {
       mGfx = null;
       mExtent = new Rectangle(0,0,-1,-1);
       if (inMatrix==null)
          mMatrix = new Matrix();
       else
          mMatrix = inMatrix.clone();

       mFilter = inFilter;
       mGroupPath = [];

       for(g in mRoot)
          RenderGroup(g,inIgnoreDot);

       return mExtent;
    }

    public function RenderObject(inObj:DisplayObject,inGfx:Graphics,
                    ?inMatrix:Matrix,?inFilter:ObjectFilter)
    {
       Render(inGfx,inMatrix,inFilter);
       var rect = GetExtent(inMatrix, function(_,groups) { return groups[0]==".scale9"; } );
		 // TODO:
		 /*
       if (rect!=null)
          inObj.scale9Grid = rect;
       #if !flash
       inObj.cacheAsBitmap = neash.Lib.IsOpenGL();
       #end
		 */
    }

    public function RenderSprite(inObj:Sprite, ?inMatrix:Matrix,?inFilter:ObjectFilter)
    {
       RenderObject(inObj,inObj.graphics,inMatrix,inFilter);
    }

    public function CreateShape(?inMatrix:Matrix,?inFilter:ObjectFilter) : Shape
    {
       var shape = new Shape();
       RenderObject(shape,shape.graphics,inMatrix,inFilter);
       return shape;
    }

    public function namedShape(inName:String) : Shape
    {
       return CreateShape(null, function(name,_) { return name==inName; } );
    }



    public function ToBitmap()
    {
       mMatrix = new Matrix();

       var w = Math.ceil( width );
       var h = Math.ceil( height );

       var bmp = new gm2d.display.BitmapData(w,h,true,gm2d.RGB.CLEAR );

       var shape = new gm2d.display.Shape();
       mGfx = shape.graphics;

       mGroupPath = [];
       for(g in mRoot)
          RenderGroup(g,true);

      bmp.draw(shape);
      mGfx = null;

      return bmp;
    }

    public function RectToBitmap(inRect:Rectangle,inScale:Float = 1.0)
    {
       mMatrix = new Matrix(inScale,0,0,inScale, -inRect.x*inScale, -inRect.y*inScale);

       var w = Math.ceil( inRect.width*inScale );
       var h = Math.ceil( inRect.height*inScale );

       var bmp = new gm2d.display.BitmapData(w,h,true,gm2d.RGB.CLEAR );

       var shape = new gm2d.display.Shape();
       mGfx = shape.graphics;

       mGroupPath = [];
       for(g in mRoot)
          RenderGroup(g,true);

      bmp.draw(shape);
      mGfx = null;

      return bmp;
    }


}
