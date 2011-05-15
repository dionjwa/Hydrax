package

{
  import flash.text.Font;
  import flash.text.engine.*;

  import flash.display.Sprite;
  import flash.display.GraphicsPathCommand;
  import flash.external.ExternalInterface;
  
  [SWF(frameRate="40", width="300", height="200")]
  public class EmbeddedFont extends Sprite {
    [Embed(source="DroidSans.ttf",
           fontFamily="DroidSans",
           mimeType="application/x-font",
           embedAsCFF="true")]
    private const DroidSans:Class;
    
    [Embed(source="ScheherazadeRegAAT.ttf",
           fontFamily="ScheherazadeReg",
           mimeType="application/x-font",
           embedAsCFF="true")]
    public const ScheherazadeReg:Class;
    
    public function EmbeddedFont():void {
    	testThree();
    }
    
    protected function testThree():void {
      // English
      var fd:FontDescription = new FontDescription();
      fd.fontLookup = FontLookup.EMBEDDED_CFF;
      fd.fontName = "DroidSans";
      var ef:ElementFormat = new ElementFormat(fd);
      ef.fontSize = 14;
      
      var te:TextElement = new TextElement("Hello from Droid Sans World!", ef);
      var tb:TextBlock = new TextBlock();
      tb.content = te;
      
      var firstLine:TextLine = tb.createTextLine(null, 500);
      firstLine.y = 50;
      addChild(firstLine);
      
      // Arabic
      fd = new FontDescription();
      fd.fontLookup = FontLookup.EMBEDDED_CFF;
      fd.fontName = "ScheherazadeReg";
      ef = new ElementFormat(fd);
      ef.fontSize = 9;
      
      var data:String = "نص حكيم له سر قاطع وذو شأن عظيم مكتوب على ثوب أخضر ومغلف بجلد أزرق";
      te = new TextElement(data, ef);
      tb = new TextBlock();
      tb.content = te;
      
      firstLine = tb.createTextLine(null, 500);
      firstLine.y = 80;
      addChild(firstLine);
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
