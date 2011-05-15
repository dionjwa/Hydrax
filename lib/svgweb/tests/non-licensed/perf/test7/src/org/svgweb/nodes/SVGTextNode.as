/*
 Copyright (c) 2009 by contributors:

 * James Hight (http://labs.zavoo.com/)
 * Richard R. Masters
 * Google Inc. (Brad Neuberg -- http://codinginparadise.org)

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
*/

package org.svgweb.nodes
{
    import org.svgweb.SVGViewerWeb;
    import org.svgweb.core.SVGNode;
    import org.svgweb.utils.SVGColors;
    import org.svgweb.utils.SVGUnits;
    
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;
    import flash.text.TextLineMetrics;
    
    import flash.filters.GlowFilter;
    
    /** SVG Text element node **/
    public class SVGTextNode extends SVGNode
    {    
        /**
         * Hold text path node if text follows a path
         **/
        private var _textPath:SVGNode = null;
        
        /**
         * TextField to render nodes text
         **/
        private var _textField:TextField;
        private var _svgFont:SVGFontNode;
        
        private var _text:String = '';

        protected var newGlyphs:Array = null;
        protected var newViewBoxSprite:Sprite = new Sprite();
        protected var lastGlyph:SVGNode;
        
        public function SVGTextNode(svgRoot:SVGSVGNode, xml:XML, original:SVGNode = null):void {
            super(svgRoot, xml, original);
        }    

        protected override function onAddedToStage(event:Event):void {
            super.onAddedToStage(event);
            svgRoot.registerFontListener(this);
        }

        protected override function onRemovedFromStage(event:Event):void {
            svgRoot.unregisterFontListener(this);
            super.onRemovedFromStage(event);
        }

        override public function onRegisterFont(fontFamily:String):void {
            if (fontFamily == this.getStyleOrAttr('font-family')) {
                invalidateDisplay();
            }
        }
       
         /**
         * Need to recreate child glyphs when redrawing text
         **/
        override public function invalidateDisplay():void {
            super.invalidateDisplay();
            // Need to recreate child glyphs when redrawing text
            this._parsedChildren = false;
        }

        override public function hasText():Boolean {
            return true;
        }
        
        override public function setText(newValue:String):void {
            //this.dbg('setText, newValue='+newValue);
            this._xml.setChildren(newValue);
            this._text = newValue;
        }
        
        /**
         * Get any child text (not text inside child nodes)
         * If this node has any text create a TextField at this._textField
         * Call SVGNode.parse()
         **/
        override protected function parseChildren():void {
            var i:uint;
            var textWidth:Number;
            var glyphChar:String;

            super.parseChildren();
            
            //Check for SVGFont
            var fontFamily:String = this.getStyleOrAttr('font-family');
            this._svgFont = this.svgRoot.getFont(fontFamily);
            var glyph:SVGGlyphNode;
            if (this._svgFont != null) {
                if (this._textField) {
                    this._textField.parent.removeChild(this._textField);
                    this._textField = null;
                }
                var fontSize:String = this.getStyleOrAttr('font-size');
                var fontSizeNum:Number = SVGUnits.cleanNumber(fontSize);
                var glyphXOffsets:Array = new Array();
                var xString:String = super.getAttribute('x', '0');
                xString = xString.replace(/,/sg," "); //Replace commas with spaces
                glyphXOffsets = xString.split(/\s+/);

                var glyphYOffsets:Array = new Array();
                var yString:String = super.getAttribute('y', '0');
                yString = yString.replace(/,/sg," "); //Replace commas with spaces
                glyphYOffsets = yString.split(/\s+/);

                var startGlyphX:Number = 0;
                var startGlyphY:Number = 0;

                // Handle text-anchor attribute
                var textAnchor:String = this.getStyleOrAttr('text-anchor');
                var currentNode:SVGNode = this;
                while (textAnchor == 'inherit') {
                    if (currentNode.svgParent != null) {
                        currentNode = currentNode.svgParent;
                        textAnchor = currentNode.getStyleOrAttr('text-anchor');
                    }
                    else {
                        textAnchor = null;
                    }
                }

                switch (textAnchor) {                    
                    case 'middle':
                        textWidth=0;
                        for (i = 0; i < this._text.length; i++) {
                            glyphChar = this._text.charAt(i);
                            glyph = this._svgFont.getGlyph(glyphChar);
                            textWidth += SVGUnits.cleanNumber(glyph.getAttribute('horiz-adv-x'));
                        }
                        startGlyphX = -textWidth / 2;
                        break;
                    case 'end':
                        textWidth=0;
                        for (i = 0; i < this._text.length; i++) {
                            glyphChar = this._text.charAt(i);
                            glyph = this._svgFont.getGlyph(glyphChar);
                            textWidth += SVGUnits.cleanNumber(glyph.getAttribute('horiz-adv-x'));
                        }
                        startGlyphX = -textWidth;
                        break;
                    default: //'start'
                        startGlyphX=0;
                        break;
                }

                var glyphX:Number = startGlyphX;
                var glyphY:Number = startGlyphY;
                newGlyphs = new Array();

                //Add a glyph for each character in the text
                for (i = 0; i < this._text.length; i++) {
                    glyphChar = this._text.charAt(i);
                    glyph = this._svgFont.getGlyph(glyphChar);
                    var glyphClone:SVGNode = glyph.clone();
                    if (this.getStyleOrAttr('fill')) {
                        glyphClone.setAttribute('fill', this.getStyleOrAttr('fill'));
                    }
                    glyphClone.setAttribute('transform',
                              'scale(' + (fontSizeNum / 2048) + ') scale(1,-1)');

                    // If there is an offset for each character, then apply the offset,
                    // adjusting for the transform above.
                    if (glyphXOffsets.length >= 2 && glyphXOffsets.length > i) {
                        glyphX = (startGlyphX + glyphXOffsets[i]) * (2048/fontSizeNum);
                    }
                    if (glyphYOffsets.length >= 2 && glyphYOffsets.length > i) {
                        glyphY = (startGlyphY + glyphYOffsets[i]) * (-2048/fontSizeNum);
                    }

                    glyphClone.setAttribute('x', String(glyphX));
                    glyphClone.setAttribute('y', String(glyphY));

                    // If there is not an offset for each character, then use
                    // the standard horizontal adjustment.
                    if (glyphXOffsets.length < 2 || glyphXOffsets.length <= i) {
                        glyphX = glyphX + SVGUnits.cleanNumber(glyph.getAttribute('horiz-adv-x'));
                    }

                    glyphClone.topSprite.visible=false;
                    newGlyphs.push(glyphClone);
                    addSVGChild(glyphClone);
                    lastGlyph=glyphClone;
                }
            }
            else {
                if (this._textField == null) {
                    //If this is not an SVGFont, use a TextField
                    this._textField = new TextField();
                }
            }
        }
        
        public function onDrawGlyph(glyph:SVGNode):void {
            // when they are ready, unhide the new characters,
            // and remove the old
            if (glyph == lastGlyph && newGlyphs != null) {
                for (var i:uint=0; i < this.svgChildren.length; i++) {
                    if (this.svgChildren[i] is SVGGlyphNode
                        && newGlyphs.indexOf(this.svgChildren[i]) == -1) {
                        removeSVGChild(this.svgChildren[i]);
                        i--;
                    }
                    else {
                        this.svgChildren[i].topSprite.visible=true;
                    }
                }
                newGlyphs = null;
            }
        }

        override public function getAttribute(name:String, defaultValue:* = null,
                                              inherit:Boolean = true,
                                              applyAnimations:Boolean = true,
                                              useStyle:Boolean = false):* {
            if (name == 'stroke-width' && this._textField == null) {
                // Relevant to SVG Fonts only
                var fontSize:String = this.getStyleOrAttr('font-size');
                var fontSizeNum:Number = SVGUnits.cleanNumber(fontSize);
                var strokeWidthStr:String = super.getAttribute(name, defaultValue, inherit, true, true);
                var strokeWidth:Number = SVGUnits.cleanNumber(strokeWidthStr);
                strokeWidth = strokeWidth * (1024 / fontSizeNum);
                return String(strokeWidth);  
            } else if ( (name == "x" || name == "y") ) {
                var xString:String = super.getAttribute(name, defaultValue, inherit, applyAnimations, false);
                if (xString != null) {
                    xString = xString.replace(/,/sg," "); //Replace commas with spaces
                    if (xString.split(/\s+/).length >= 2) {
                        // For SVG Fonts, if there is more than one value, then apply them to
                        // individual glyphs, not the text node
                        if (this._textField == null) {
                            return "0";
                        }
                        else {
                            // Issue 405: We do not currently support glyph placement
                            // for native fonts. Just use the first value.
                            return xString.split(/\s+/)[0];
                        }
                    }
                    else {
                        return xString;
                    }
                }
                else {
                    return xString;
                }
            }
            else {
                return super.getAttribute(name, defaultValue, inherit, applyAnimations, useStyle);
            }
        }
        
        /**
         * Call SVGNode.setAttributes()
         * If this node contains text load text format (font, font-size, color, etc...)
         * Render text to a bitmap and add bitmap to node
         **/
        override protected function setAttributes():void {
            super.setAttributes();
            if (this._textField != null) {
                var fontFamily:String = this.getStyleOrAttr('font-family');                
                var fontSize:String = this.getStyleOrAttr('font-size');
                var fill:String = this.getStyleOrAttr('fill');
                if (fill == 'currentColor') {
                    fill = this.getStyleOrAttr('color');
                }
                var fontWeight:String = this.getStyleOrAttr('font-weight');
                var textAnchor:String = this.getStyleOrAttr('text-anchor');
                
                var textFormat:TextFormat = this._textField.getTextFormat();
                
                if (fontFamily != null) {
                    fontFamily = fontFamily.replace("'", '');
                    textFormat.font = fontFamily;
                }
                
                if (fontSize != null) {
                    //Handle floating point font size
                    var fontSizeNum:Number = SVGUnits.cleanNumber(fontSize);
                    
                    //Font size can be in user units, pixels (px), or points (pt); if no
                    //measurement type given defaults to user units
                    if (SVGUnits.getType(fontSize) == SVGUnits.PT) {
                        fontSizeNum = SVGUnits.pointsToPixels(fontSizeNum);
                    }
                    
                    var fontScale:Number = Math.floor(fontSizeNum);
                    textFormat.size = fontScale;
                    
                    fontScale = fontSizeNum / fontScale;
                    
                    _textField.scaleX = fontScale;
                    _textField.scaleY = fontScale;
                }
                      
                if (fill != null) {
                    textFormat.color = SVGColors.getColor(fill);
                }
                
                // only bold/no bold supported for now (SVG has many levels of bold)
                var currentNode:SVGNode = this;
                while (fontWeight == 'inherit') {                    
                    if (currentNode.svgParent != null) {
                        currentNode = currentNode.svgParent;
                        fontWeight = currentNode.getStyleOrAttr('font-weight');
                    }
                    else {
                        fontWeight = null;
                    }
                }                    
                if (fontWeight != null && fontWeight != 'normal') {
                    textFormat.bold = true;
                }
                
                this._textField.text = this._xml.text().toString();
                this._textField.setTextFormat(textFormat);
                var textLineMetrics:TextLineMetrics = this._textField.getLineMetrics(0);
                
                currentNode = this;
                while (textAnchor == 'inherit') {                    
                    if (currentNode.svgParent != null) {
                        currentNode = currentNode.svgParent;
                        textAnchor = currentNode.getStyleOrAttr('text-anchor');
                    }
                    else {
                        textAnchor = null;
                    }
                }    
                
                // Handle text-anchor attribute
                switch (textAnchor) {                    
                    case 'middle':
                        this._textField.autoSize = TextFieldAutoSize.CENTER;
                        this._textField.x = Math.floor( - (this._textField.width - textLineMetrics.width)/2
                                                        - textLineMetrics.width / 2 );
                        break;
                    case 'end':
                        this._textField.autoSize = TextFieldAutoSize.RIGHT;
                        // Technically, the entire difference between text field width and
                        // the actual text width should be shifted in the following equation,
                        // assuming the text was actually right justified properly,
                        // but half seems to replicate native behavior more closely.
                        this._textField.x =  - Math.floor( (this._textField.width - textLineMetrics.width)/2)
                                             - textLineMetrics.width;
                        break;
                    default: //'start'
                        this._textField.autoSize = TextFieldAutoSize.LEFT;
                        this._textField.x = - Math.floor(this._textField.width - textLineMetrics.width)/2;
                        //If autosize actually left justified properly, it seems the following would be correct:
                        //this._textField.x = 0;
                        break;
                }
                
                this.setVisibility(this.getStyleOrAttr('visibility'));
                
                // SVG Text elements position y attribute as baseline of text,
                // not the top
                this._textField.y = 0 - textLineMetrics.ascent - 1;
            }
        }
        
        override protected function setVisibility(visible:String, 
                                                  recursive:Boolean = false):void {
            // Surprisingly, this.alpha does not work as expected on
            // text system fonts; a work around is needed. See
            // http://oddhammer.com/tutorials/alpha_dynamic_text/
            // for details. Basically you have to embed the text into
            // a filter which turns it into a bitmap, and then apply the
            // alpha!
            if (visible == 'hidden') {
                var filter:GlowFilter = new GlowFilter(0x000000, .1, 16, 16, 
                                                       0, 3, false, false);
                this.drawSprite.filters = new Array(filter);
                this.drawSprite.alpha = 0;
            }
            else {
                this.drawSprite.filters = new Array();
                super.setVisibility(visible);
            }

        }
        
        override protected function draw():void {
            super.draw();

            if (this._textField != null) {
                drawSprite.addChild(this._textField);         
            }            
        }             
    }
}
