package { 
    import fl.controls.Button;
     import flash.text.engine.TextBlock;
    import flash.text.engine.TextLine;
    import flash.text.engine.TextElement;
    import flash.text.engine.ElementFormat;
    import flash.text.engine.TextRotation;
    import flash.text.engine.TextBaseline;
    import flash.text.engine.LineJustification;
    import flash.text.engine.FontDescription;
    import flash.text.engine.EastAsianJustifier; 
    import flash.display.Loader;
    import flash.display.Sprite;
    import flash.display.Stage;
    import flash.events.MouseEvent;
    import flash.system.Capabilities;
    
    public class Bidi extends Sprite {
        
        var vertical:Boolean;    
        var container:Sprite;
        var textBlocks:Vector.<TextBlock>;
        var loader:Loader = new Loader();
        var directionButton:Button = new Button();
        
        public function Bidi():void {
            addChild(directionButton);
            directionButton.width = 30;
            directionButton.move(50, 350);
            directionButton.addEventListener(MouseEvent.CLICK, clickHandler);
            createContent();
            createLines();
        }
        private function createEmptyBlock():TextBlock {
        
            var textBlock:TextBlock = new TextBlock();
            textBlock.baselineZero = TextBaseline.IDEOGRAPHIC_CENTER;
            textBlock.textJustifier = new EastAsianJustifier("ja", LineJustification.ALL_BUT_LAST);
            textBlock.lineRotation = vertical? TextRotation.ROTATE_90: TextRotation.ROTATE_0;
            return textBlock;    
        }
        
        private function paragraph1(format:ElementFormat):TextBlock {
        
            var textBlock:TextBlock = createEmptyBlock();
            textBlock.content = new TextElement(
            String.fromCharCode(
                0x5185, 0x95A3, 0x5E9C, 0x304C, 0x300C, 0x653F, 0x5E9C, 0x30A4,
                0x30F3, 0x30BF, 0x30FC, 0x30CD, 0x30C3, 0x30C8, 0x30C6, 0x30EC, 
                0x30D3, 0x300D, 0x306E, 0x52D5, 0x753B, 0x914D, 0x4FE1, 0x5411, 
                0x3051, 0x306B, 0x30A2, 0x30C9, 0x30D3, 0x30B7, 0x30B9, 0x30C6, 
                0x30E0, 0x30BA, 0x793E, 0x306E
            ) +
            "FMS 2" +
            String.fromCharCode(0x3092, 0x63A1, 0x7528, 0x3059, 0x308B, 0x3068, 
                0x767a, 0x8868, 0x3057, 0x307e, 0x3057, 0x305F, 0x3002), format);
            return textBlock;
        }
        private function paragraph2(format:ElementFormat):TextBlock {
            
            var textBlock:TextBlock = createEmptyBlock();
            textBlock.content = new TextElement(
            String.fromCharCode(
                0x30AF, 0x30ED, 0x30B9, 0x30D7, 0x30E9, 0x30C3, 0x30C8, 0x30D5, 
                0x30A9, 0x30FC, 0x30E0, 0x4E0A, 0x3067, 0x518D, 0x751F, 0x53EF, 
                0x80FD, 0x306A
            ) + 
            "Flash Video" +
            String.fromCharCode(
                0x3092, 0x914D, 0x4FE1, 0x3001, 0x653F, 0x5E9C, 0x6700, 0x65B0, 
                0x60C5, 0x5831, 0x3092, 0x3088, 0x308A, 0x591A, 0x304F, 0x306E, 
                0x56FD, 0x6C11, 0x306B, 0x9AD8, 0x54C1, 0x8CEA, 0x306A, 0x753B, 
                0x50CF, 0x3067, 0x7C21, 0x5358, 0x304B, 0x3064, 0x30EA, 0x30A2, 
                0x30EB, 0x30BF, 0x30A4, 0x30E0, 0x306B, 0x63D0, 0x4F9B, 0x3059, 
                0x308B, 0x3053, 0x3068, 0x304C, 0x53EF, 0x80FD, 0x306B, 0x306A, 
                0x308A, 0x307e, 0x3057, 0x305F, 0x3002), format);
            return textBlock;    
        }
        private function paragraph3(format:ElementFormat):TextBlock {
            
            var textBlock:TextBlock = createEmptyBlock();
            textBlock.content = new TextElement(
            String.fromCharCode(0x3010) +
            "2007" +
            String.fromCharCode(0x5E74) + "2" + String.fromCharCode(0x6708) +
            "21" +
            String.fromCharCode(0x65E5, 0x3011),
            format);
            return textBlock;    
        }
        private function createContent():void {
            
            var font:FontDescription = new FontDescription();
            if (Capabilities.os.search("Mac OS") > -1) 
                font.fontName = String.fromCharCode(0x5C0F, 0x585A, 0x660E, 0x671D) + " Pro R"; // "Kozuka Mincho Pro R"                    koFont.fontName = "Adobe " + String.fromCharCode(0xBA85, 0xC870) + " Std M"; // "Adobe Myungjo Std M"
            else 
                font.fontName = "Kozuka Mincho Pro R";        
            var format:ElementFormat = new ElementFormat();
            format.fontDescription = font;
            format.fontSize = 12;
            format.locale = "ja";
            format.color = 0x000000;
            if (!vertical) 
                format.textRotation = TextRotation.ROTATE_0; 
            textBlocks = new Vector.<TextBlock>();
            textBlocks.push(
                paragraph1(format),
                paragraph2(format),
                paragraph3(format)//,
            );
        }
        private function createLines():void {    
        
            if (container != null) {
                removeChild(container);
            }            
            container = new Sprite();
            container.y = 45;
            container.x = 40;
            addChild(container);
            var linePosition:Number = vertical? this.stage.stageWidth - 120: 12;
        
            for (var i:uint = 0; i < textBlocks.length; i++) {
                var textBlock:TextBlock = textBlocks[i];
                var previousLine:TextLine = null;
        
                while (true) {
                    var textLine:TextLine = textBlock.createTextLine(
                        previousLine, 
                        300);
                    if (textLine == null) 
                        break;
                    if (vertical) 
                    {
                        textLine.x = linePosition;
                        linePosition -= 24;
                        directionButton.label = " -- ";
                    }
                    else 
                    {
                        textLine.y = linePosition+50;
                        linePosition += 24;
                        directionButton.label = " | ";
                    }
                    container.addChild(textLine);                
                    previousLine = textLine;
                }
                if (vertical) 
                    linePosition -= 16;
                else 
                    linePosition += 16; 
            }
        }
        private function clickHandler(event:MouseEvent):void {
            
            vertical = !vertical;
            createContent();
            createLines();
        }
    }
}
