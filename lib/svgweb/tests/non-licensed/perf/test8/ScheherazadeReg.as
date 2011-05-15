package {
  import flash.display.Sprite;
  import flash.text.Font;
  
  public class ScheherazadeReg extends Sprite {
    [Embed(source="ScheherazadeRegAAT.ttf",
           fontFamily="ScheherazadeReg",
           mimeType="application/x-font",
           embedAsCFF="true")]
    public const definition:Class;
    
    public function ScheherazadeReg():void {
      Font.registerFont(definition);
    }
  }
}
