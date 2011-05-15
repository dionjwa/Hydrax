package {
  import flash.display.Sprite;
  import flash.text.Font;
  
  public class DroidSans extends Sprite {
    [Embed(source="DroidSans.ttf",
           fontFamily="DroidSans",
           mimeType="application/x-font",
           embedAsCFF="true")]
    public const definition:Class;
    
    public function DroidSans():void {
      Font.registerFont(definition);
    }
  }
}
