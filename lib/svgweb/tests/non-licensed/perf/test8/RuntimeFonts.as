package {
  import flash.display.*;
  import flash.errors.*;
  import flash.events.*;
  import flash.net.*;
  import flash.system.*;
  import flash.text.*;
  import flash.text.engine.*;
  import flash.external.*;
  
  public class RuntimeFonts extends Sprite {
    protected var fontCounter:int = 0;
    
    public function RuntimeFonts() {
      downloadFont("DroidSans");
      downloadFont("ScheherazadeReg");
    }
    
    protected function downloadFont(fontName:String):void {
      debug("Loading " + fontName + ".swf...");
      var loader:Loader = new Loader();
      loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onFontLoaded);
      loader.load(new URLRequest(fontName + ".swf"));
    }
    
    protected function onFontLoaded(e:Event):void {
      debug('onFontLoaded');
      fontCounter++;
      if (fontCounter == 2) {
        useFonts();
      }
    }
    
    protected function useFonts():void {
      // No font
      var fd:FontDescription = new FontDescription();
      var ef:ElementFormat = new ElementFormat(fd);
      ef.fontSize = 14;
      
      var te:TextElement = new TextElement("Hello from no font text!", ef);
      var tb:TextBlock = new TextBlock();
      tb.content = te;
      
      var firstLine:TextLine = tb.createTextLine(null, 300);
      firstLine.y = 10;
      addChild(firstLine);
      
      // Droid Sans font
      fd = new FontDescription();
      fd.fontLookup = FontLookup.EMBEDDED_CFF;
      fd.fontName = "DroidSans";
      ef = new ElementFormat(fd);
      ef.fontSize = 14;
      
      te = new TextElement("Hello from Dynamically Loaded "
          + "Droid Sans!", ef);
      tb = new TextBlock();
      tb.content = te;
      
      firstLine = tb.createTextLine(null, 300);
      firstLine.y = 50;
      addChild(firstLine);
      
      // Arabic
      fd = new FontDescription();
      fd.fontLookup = FontLookup.EMBEDDED_CFF;
      fd.fontName = "ScheherazadeReg";
      ef = new ElementFormat(fd);
      ef.fontSize = 12;
      
      var data:String = "\u0646\u0635 \u062d\u0643\u064a\u0645 \u0644\u0647"
          + "\u0633\u0631 \u0642\u0627\u0637\u0639 \u0648\u0630\u0648"
          +" \u0634\u0623\u0646 \u0639\u0638\u064a\u0645"
          + " \u0645\u0643\u062a\u0648\u0628 \u0639\u0644\u0649"
          +"  \u062b\u0648\u0628 \u0623\u062e\u0636\u0631"
          + " \u0648\u0645\u063a\u0644\u0641 \u0628\u062c\u0644\u062f"
          + " \u0623\u0632\u0631\u0642";
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