package

{
  import flash.text.Font;
  import flash.text.engine.*;

  import flash.display.Sprite;
  import flash.display.GraphicsPathCommand;
  import flash.external.ExternalInterface;
  
  [SWF(frameRate="40", width="700", height="600")]
  public class MultiText extends Sprite {
    [Embed(source="DroidSans.ttf",
           fontFamily="DroidSans",
           mimeType="application/x-font",
           embedAsCFF="true")]
    private const DroidSans:Class;
    
    public function MultiText():void {
    	//testOne();
    	//testTwo();
    	//testThree();
    	//testFour();
    	testFive();
    }

    protected function testOne():void {
      var fd:FontDescription = new FontDescription();
      var ef:ElementFormat = new ElementFormat(fd);
      var te:TextElement = new TextElement("Hello From Brad's World!", ef);
      var tb:TextBlock = new TextBlock();
      tb.content = te;
      
      var tl:TextLine = tb.createTextLine(null, 200);
      addChild(tl);
    }
    
    protected function testTwo():void {
      var myFonts:Array = Font.enumerateFonts(false);
      for (var i:int = 0; i < myFonts.length; i++) {
          debug("I am a " + myFonts[i].fontType + " font and my name is " 
              + myFonts[i].fontName);
      }
    }
    
    protected function testThree():void {
      var fd:FontDescription = new FontDescription();
      fd.fontLookup = FontLookup.EMBEDDED_CFF;
      fd.fontName = "DroidSans";
      var ef:ElementFormat = new ElementFormat(fd);
      ef.fontSize = 14;
      
      var te:TextElement = new TextElement("Hello from Droid Sans World!", ef);
      var tb:TextBlock = new TextBlock();
      tb.content = te;
      
      var firstLine:TextLine = tb.createTextLine(null, 300);
      firstLine.y = 50;
      addChild(firstLine);
    }
    
    protected function testFour():void {
      var commands:Vector.<int> = new Vector.<int>(5, true);
      commands[0] = GraphicsPathCommand.MOVE_TO;
      commands[1] = GraphicsPathCommand.LINE_TO;
      commands[2] = GraphicsPathCommand.LINE_TO;
      commands[3] = GraphicsPathCommand.LINE_TO;
      commands[4] = GraphicsPathCommand.LINE_TO;
      
      var data:Vector.<Number> = new Vector.<Number>(10, true);
      data[0] = 10; // x
      data[1] = 10; // y
      data[2] = 100;
      data[3] = 10;
      data[4] = 100;
      data[5] = 100;
      data[6] = 10;
      data[7] = 100;
      data[8] = 10;
      data[9] = 10;
      
      graphics.beginFill(0x800000);
      graphics.drawPath(commands, data);
    }
    
    protected function testFive():void {
      createContent();
      createLines();
    }
    
    protected function paragraph1(format:ElementFormat):TextBlock {
      var textBlock:TextBlock = new TextBlock();
      var str:String = 
        "Four score and seen years ago our fathers brought forth on this continent, a new nation, "
        + "conceived in liberty and dedicate to the proposition that all mean are created equal.";
      textBlock.content = new TextElement(str, format);
      
      return textBlock;
    }
    
    protected function paragraph2(format:ElementFormat):TextBlock {
      var textBlock:TextBlock = new TextBlock();
      var str:String = 
        "Now we are engaged in a great civil war, testing whether that nation, or any nation so "
        + "conceived and so dedicated, can long endure.";
      textBlock.content = new TextElement(str, format);
      
      return textBlock;
    }
    
    protected function paragraph3(format:ElementFormat):TextBlock {
      var textBlock:TextBlock = new TextBlock();
      var str:String = 
        "We are met on a great battle-field of the war. We have come to dedicate a portion of that "
        + "field, as a final resting place for thos who here gave their lieves that that nation might live.";
      textBlock.content = new TextElement(str, format);
      
      return textBlock;
    }
    
    protected function paragraph4(format:ElementFormat):TextBlock {
      var textBlock:TextBlock = new TextBlock();
      var str:String = 
        "It is altogether fitting and proper that we should do this.";
      textBlock.content = new TextElement(str, format);
      
      return textBlock;
    }
    
    protected function paragraph5(format:ElementFormat):TextBlock {
      var textBlock:TextBlock = new TextBlock();
      var str:String = 
        "But, in a larger sense, we can not dedicate -- we can not consecrate -- we can not ahllow "
        + "-- this ground.";
      textBlock.content = new TextElement(str, format);
      
      return textBlock;
    }
    
    protected function paragraph6(format:ElementFormat):TextBlock {
      var textBlock:TextBlock = new TextBlock();
      var str:String = 
        "The brave men, living and dead, who struggled here, have conserated it, far above our "
        + "poor power to add or detract.";
      textBlock.content = new TextElement(str, format);
      
      return textBlock;
    }
    
    protected function paragraph7(format:ElementFormat):TextBlock {
      var textBlock:TextBlock = new TextBlock();
      var str:String = 
        "The world will little note, not long remember what we say here, but it can never forget "
        + "what they did here";
      textBlock.content = new TextElement(str, format);
      
      return textBlock;
    }
    
    protected function paragraph8(format:ElementFormat):TextBlock {
      var textBlock:TextBlock = new TextBlock();
      var str:String = 
        "It is for us the living, rather, to be dedicated here to the unfinished work which they who "
        + "fought here have thus far so nobly advanced.";
      textBlock.content = new TextElement(str, format);
      
      return textBlock;
    }
    
    protected function createContent():Vector.<TextBlock> {
      var fd:FontDescription = new FontDescription("DroidSans");
      fd.fontLookup = FontLookup.EMBEDDED_CFF;
      var format:ElementFormat = new ElementFormat();
      format.fontDescription = fd;
      format.fontSize = 14;
      
      var tb:Vector.<TextBlock> = new Vector.<TextBlock>(8, true);
      tb[0] = paragraph1(format);
      tb[1] = paragraph2(format);
      tb[2] = paragraph3(format);
      tb[3] = paragraph4(format);
      tb[4] = paragraph5(format);
      tb[5] = paragraph6(format);
      tb[6] = paragraph7(format);
      tb[7] = paragraph8(format);
      
      return tb;
    }
    
    protected function createLines():void {
      var tb:Vector.<TextBlock> = createContent();
      var linePos:Number = 12;
      for (var i:uint = 0; i < tb.length; i++) {
        var currentBlock:TextBlock = tb[i];
        var prevLine:TextLine = null;
        
        while (true) {
          var textLine:TextLine = currentBlock.createTextLine(prevLine, 620);
          if (textLine == null) {
            break;
          }
          textLine.y = linePos + 50;
          linePos += 24;
          addChild(textLine);
          prevLine = textLine;
        }
        
        linePos += 16;
      }
    }
    
    protected function debug(debugMessage:String):void {
        try {
            ExternalInterface.call('debug', debugMessage);
        }
        catch(error:SecurityError) {
        }
    }
}
}
