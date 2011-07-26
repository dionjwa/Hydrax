// This code borrowed from "Xinf", http://xinf.org
// Copyright of original author.
//package xinf.ony;
//import xinf.ony.PathSegment;

package gm2d.svg;

import gm2d.svg.PathSegment;

class PathParser {
    var lastMoveX:Float;
    var lastMoveY:Float;
    var prev:PathSegment;

    
    static var sCommandArgs:Array<Int>;

    static var MOVE  = "M".charCodeAt(0);
    static var MOVER = "m".charCodeAt(0);
    static var LINE  = "L".charCodeAt(0);
    static var LINER = "l".charCodeAt(0);
    static var HLINE = "H".charCodeAt(0);
    static var HLINER = "h".charCodeAt(0);
    static var VLINE = "V".charCodeAt(0);
    static var VLINER = "v".charCodeAt(0);
    static var CUBIC = "C".charCodeAt(0);
    static var CUBICR = "c".charCodeAt(0);
    static var SCUBIC = "S".charCodeAt(0);
    static var SCUBICR = "s".charCodeAt(0);
    static var QUAD = "Q".charCodeAt(0);
    static var QUADR = "q".charCodeAt(0);
    static var SQUAD = "T".charCodeAt(0);
    static var SQUADR = "t".charCodeAt(0);
    static var ARC = "A".charCodeAt(0);
    static var ARCR = "a".charCodeAt(0);
    static var CLOSE = "Z".charCodeAt(0);
    static var CLOSER = "z".charCodeAt(0);

    static var UNKNOWN = -1;
    static var SEPARATOR = -2;
    static var FLOAT = -3;



    public function new() {
        if (sCommandArgs==null)
        {
           sCommandArgs = [];
           for(i in 0...128)
              sCommandArgs[i] = commandArgs(i);
        }
    }

    public function parse( pathToParse:String ) :Array<PathSegment> {
        lastMoveX = lastMoveY = 0;
        var pos=0;
        var args = new Array<Float>();
        var segments = new Array<PathSegment>();
        var current_command_pos = 0;
        var current_command = -1;
        var current_args = -1;
        
        prev = null;

        var len = pathToParse.length;
        var finished = false;
        while( pos<=len )
        {
            var code = pos==len ? 32 : pathToParse.charCodeAt(pos);
            var command = (code>0 && code<128) ? sCommandArgs[code] : UNKNOWN;

            if (command==UNKNOWN)
               throw("failed parsing path near '"+pathToParse.substr(pos)+"'");
 
            if (command==SEPARATOR)
            {
               pos++;
            }
            else if( command==FLOAT )
            {
               var end = pos+1;
               while(end<pathToParse.length)
               {
                  var ch = pathToParse.charCodeAt(end);
                  if (ch<0 || ch>127 || sCommandArgs[ch]!=FLOAT )
                     break;
                  end++;
               }
               if (current_command<0)
               {
                  //throw "Too many numbers near '" +
                     //pathToParse.substr(current_command_pos) + "'";
               }
               else
               {
                  var f = Std.parseFloat(pathToParse.substr(pos,end-pos));
                  args.push(f);
               }
               pos = end;
            }
            else
            {
               current_command = code;
               current_args = command;
               finished = false;
               current_command_pos = pos;
               args = [];
               pos++;
            }

            if (current_command>=0)
            {
               if (current_args==args.length)
               {
                  prev = createCommand( current_command, args );
                  if (prev==null)
                     throw "Unknown command " + String.fromCharCode(current_command) +
                        " near '" + pathToParse.substr(current_command_pos) + "'"; 
                  segments.push(prev);
                  finished = true;
                  if (current_args==0)
                  {
                     current_args = -1;
                     current_command = -1;
                  }
                  else if (current_command==MOVE)
                     current_command = LINE;
                  else if (current_command==MOVER)
                     current_command = LINER;

                  current_command_pos = pos;
                  args = [];
               }
            }
        }

        if (current_command>=0 && !finished)
        {
            throw "Unfinished command (" + args.length + "/" + current_args +
                ") near '" + pathToParse.substr(current_command_pos) + "'"; 
        }
        
        return segments;
    }
    
    function commandArgs( inCode:Int ) : Int
    {
       if (inCode==10) return SEPARATOR;

       var str = String.fromCharCode(inCode).toUpperCase();
       if (str>="0" && str<="9")
          return FLOAT;

       switch(str)
       {
           case "Z": return 0;
           case "H","V": return 1;
           case "M","L","T": return 2;
           case "S","Q": return 4;
           case "C": return 6;
           case "A": return 7;
           case "\t","\n"," ","\r","," : return SEPARATOR;
           case "-" : return FLOAT;
           case "+" : return FLOAT;
           case "E" : return FLOAT;
           case "." : return FLOAT;
       }

       return UNKNOWN;
    }

    function prevX():Float { return (prev!=null) ? prev.prevX() : 0; }
    function prevY():Float { return (prev!=null) ? prev.prevY() : 0; }
    function prevCX():Float { return (prev!=null) ? prev.prevCX() : 0; }
    function prevCY():Float { return (prev!=null) ? prev.prevCY() : 0; }
    
    function createCommand( code:Int , a:Array<Float> ) : PathSegment
    {
        switch(code)
        {
                case MOVE:
                    lastMoveX = a[0];
                    lastMoveY = a[1];
                    return new MoveSegment( lastMoveX, lastMoveY);
                case MOVER:
                    lastMoveX = a[0]+prevX();
                    lastMoveY = a[1]+prevY();
                    return new MoveSegment(lastMoveX, lastMoveY);
                case LINE:  return new DrawSegment( a[0], a[1] );
                case LINER: return new DrawSegment( a[0]+prevX(), a[1]+prevY() );
                case HLINE:  return new DrawSegment( a[0], 0 );
                case HLINER: return new DrawSegment( a[0]+prevX(), prevY());
                case VLINE:  return new DrawSegment( 0, a[0] );
                case VLINER: return new DrawSegment( prevX(), a[0]+prevY());
                case CUBIC:
                    return new CubicSegment( a[0], a[1], a[2], a[3], a[4], a[5] );
                case CUBICR:
                    var rx = prevX();
                    var ry = prevY();
                    return new CubicSegment( a[0]+rx, a[1]+ry, a[2]+rx, a[3]+ry, a[4]+rx, a[5]+ry );
                case SCUBIC:
                    var rx = prevX();
                    var ry = prevY();
                    return new CubicSegment( rx*2-prevCX(), ry*2-prevCY(),a[0], a[1], a[2], a[3] );
                case SCUBICR:
                    var rx = prevX();
                    var ry = prevY();
                    return new CubicSegment( rx*2-prevCX(), ry*2-prevCY(),a[0]+rx, a[1]+ry, a[2]+rx, a[3]+ry );
                case QUAD: return new QuadraticSegment( a[0], a[1], a[2], a[3] );
                case QUADR:
                    var rx = prevX();
                    var ry = prevY();
                    return new QuadraticSegment( a[0], a[1], a[2], a[3] );
                case SQUAD:
                    var rx = prevX();
                    var ry = prevY();
                    return new QuadraticSegment( rx*2-prevCX(), rx*2-prevCY(),a[2], a[3] );
                case SQUADR:
                    var rx = prevX();
                    var ry = prevY();
                    return new QuadraticSegment( rx*2-prevCX(), ry*2-prevCY(),a[0]+rx, a[1]+ry );
                case ARC:
                    return new ArcSegment(prevX(), prevY(), a[0], a[1], a[2], a[3]!=0., a[4]!=0., a[5], a[6] );
                case ARCR:
                    var rx = prevX();
                    var ry = prevY();
                    return new ArcSegment( rx,ry, a[0], a[1], a[2], a[3]!=0., a[4]!=0., a[5]+rx, a[6]+ry );
                case CLOSE:
                    return new DrawSegment(lastMoveX, lastMoveY);
                case CLOSER:
                    return new DrawSegment(lastMoveX, lastMoveY);
            }

        return null;
    }
}

