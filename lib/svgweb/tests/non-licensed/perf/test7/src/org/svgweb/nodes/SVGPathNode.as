/*
 Copyright (c) 2009 by contributors:

 * James Hight (http://labs.zavoo.com/)
 * Richard R. Masters

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
    import org.svgweb.utils.EllipticalArc;
    import org.svgweb.core.SVGNode;
    
    import mx.utils.StringUtil;
    
    public class SVGPathNode extends SVGNode
    {        
        private var currentX:Number;
        private var currentY:Number;
        
        private var startX:Number;
        private var startY:Number;

        private var lastCurveControlX:Number;
        private var lastCurveControlY:Number;
        
        public function SVGPathNode(svgRoot:SVGSVGNode, xml:XML, original:SVGNode = null):void {
            super(svgRoot, xml, original);
        }
        
        /**
         * Normalize SVG Path Data into an array we can work with.
         */
        public function normalizeSVGData():Array {
            // NOTE: This code is very performance sensitive and was 
            // a bottleneck affecting page load; rewritten to not use
            // regular expressions as well as other tricks that were shown
            // to be faster (like caching data.length, parsing right into
            // an array instead of an intermediate string, etc.).
            // Be careful when changing this code without seeing what the
            // performance is before and after. See 
            // Issue 229 for details:
            // "Speedup page load time of MichaelN's static map page on IE"
            // http://code.google.com/p/svgweb/issues/detail?id=229
            
            //var totalTime:int = new Date().getTime();
            
            var data:String = this.getAttribute('d');
            //this.dbg("using fake data");
            //var data:String = "M4828 154150L3679 150394L4334 150394L4929 152561L5155 153370C5163 153331 5227 153073 5346 152596L5947 150394L6602 150394L7162 152573L7346 153293L7566 152567L8209 150394L8828 150394L7656 154150L6995 154150L6394 151900L6251 151263L5489 154150L4828 154150ZM9263 154150L9263 148971L9900 148971L9900 150828C10198 150483 10573 150310 11025 150310C11303 150310 11544 150365 11748 150474C11953 150583 12100 150735 12189 150930C12278 151124 12323 151404 12323 151769L12323 154150L11686 154150L11686 151769C11686 151451 11617 151220 11478 151075C11339 150931 11144 150858 10894 150858C10704 150858 10526 150907 10361 151004C10197 151101 10079 151234 10007 151403C9936 151572 9900 151803 9900 152096L9900 154150L9263 154150ZM15669 153686C15431 153888 15202 154030 14984 154112C14766 154193 14532 154234 14282 154234C13873 154234 13557 154133 13335 153933C13113 153733 13002 153476 13002 153162C13002 152975 13043 152807 13127 152656C13210 152505 13319 152384 13454 152293C13589 152202 13742 152132 13912 152084C14039 152049 14228 152017 14478 151989C14994 151926 15373 151852 15615 151769C15615 151682 15615 151626 15615 151602C15615 151344 15556 151162 15436 151055C15274 150912 15032 150840 14710 150840C14413 150840 14192 150892 14049 150995C13907 151098 13801 151285 13734 151555L13109 151465C13168 151199 13263 150985 13392 150822C13521 150660 13707 150534 13951 150444C14195 150355 14480 150310 14805 150310C15127 150310 15387 150348 15585 150424C15784 150499 15931 150594 16026 150709C16121 150824 16187 150969 16222 151144C16246 151251 16258 151446 16258 151727L16258 152579C16258 153170 16271 153544 16297 153701C16322 153858 16377 154007 16460 154150L15794 154150C15726 154019 15685 153864 15669 153686ZM15615 152269C15385 152360 15038 152440 14573 152507C14311 152543 14127 152585 14020 152632C13912 152680 13829 152749 13770 152841C13710 152932 13680 153033 13680 153144C13680 153315 13745 153457 13874 153570C14003 153683 14190 153739 14436 153739C14682 153739 14901 153685 15091 153576C15282 153467 15423 153321 15514 153138C15581 152991 15615 152779 15615 152501L15615 152269ZM18562 153579L18651 154144C18473 154180 18312 154198 18169 154198C17939 154198 17760 154161 17633 154088C17506 154014 17417 153919 17365 153802C17314 153685 17288 153434 17288 153049L17288 150894L16818 150894L16818 150394L17288 150394L17288 149465L17919 149084L17919 150394L18562 150394L18562 150894L17919 150894L17919 153085C17919 153267 17930 153384 17952 153436C17973 153487 18010 153529 18062 153561C18113 153593 18187 153608 18282 153608C18350 153608 18443 153599 18562 153579ZM22515 153579L22604 154144C22425 154180 22265 154198 22122 154198C21892 154198 21713 154161 21586 154088C21459 154014 21370 153919 21318 153802C21267 153685 21241 153434 21241 153049L21241 150894L20770 150894L20770 150394L21241 150394L21241 149465L21872 149084L21872 150394L22515 150394L22515 150894L21872 150894L21872 153085C21872 153267 21883 153384 21905 153436C21926 153487 21963 153529 22015 153561C22066 153593 22140 153608 22235 153608C22302 153608 22396 153599 22515 153579ZM23092 154150L23092 148971L23729 148971L23729 150828C24027 150483 24402 150310 24854 150310C25132 150310 25373 150365 25578 150474C25782 150583 25929 150735 26018 150930C26107 151124 26152 151404 26152 151769L26152 154150L25515 154150L25515 151769C25515 151451 25446 151220 25307 151075C25168 150931 24973 150858 24723 150858C24533 150858 24355 150907 24191 151004C24026 151101 23908 151234 23836 151403C23765 151572 23729 151803 23729 152096L23729 154150L23092 154150ZM29623 152942L30278 153025C30174 153406 29983 153703 29703 153915C29423 154127 29065 154234 28629 154234C28081 154234 27646 154065 27325 153728C27003 153390 26843 152916 26843 152305C26843 151674 27004 151184 27328 150834C27651 150485 28073 150310 28593 150310C29097 150310 29508 150481 29825 150822C30143 151164 30301 151646 30301 152269C30301 152305 30299 152360 30295 152436L27497 152436C27521 152848 27638 153164 27849 153382C28059 153601 28321 153710 28635 153710C28865 153710 29062 153649 29227 153528C29392 153407 29524 153212 29623 152942ZM27533 151912L29629 151912C29601 151598 29522 151362 29391 151203C29188 150957 28924 150834 28599 150834C28309 150834 28064 150933 27864 151129C27663 151325 27553 151586 27533 151912ZM30974 155597L30909 155002C31048 155037 31169 155055 31272 155055C31411 155055 31523 155031 31608 154984C31693 154936 31764 154871 31819 154787C31859 154724 31923 154565 32010 154311C32022 154275 32042 154224 32069 154156L30647 150394L31331 150394L32111 152573C32214 152846 32306 153136 32385 153442C32456 153148 32544 152862 32647 152585L33445 150394L34082 150394L32653 154216C32502 154628 32383 154912 32296 155067C32185 155277 32056 155431 31909 155528C31762 155626 31587 155674 31385 155674C31262 155674 31125 155648 30974 155597ZM38963 154150L38963 153674C38725 154047 38376 154234 37915 154234C37618 154234 37343 154151 37091 153987C36839 153822 36644 153592 36508 153296C36371 153000 36302 152660 36302 152275C36302 151902 36365 151563 36490 151257C36615 150951 36801 150717 37049 150555C37297 150392 37576 150310 37886 150310C38112 150310 38313 150358 38490 150453C38667 150549 38810 150674 38922 150828L38922 148971L39553 148971L39553 154150L38963 154150ZM36951 152275C36951 152755 37053 153114 37258 153353C37462 153591 37701 153710 37975 153710C38253 153710 38489 153597 38683 153370C38878 153144 38975 152797 38975 152329C38975 151817 38876 151441 38677 151200C38479 150960 38235 150840 37945 150840C37663 150840 37427 150955 37237 151186C37046 151416 36951 151779 36951 152275ZM40487 149697L40487 148971L41124 148971L41124 149697L40487 149697ZM40487 154150L40487 150394L41124 150394L41124 154150L40487 154150ZM44500 154150L44500 153674C44261 154047 43912 154234 43452 154234C43154 154234 42879 154151 42627 153987C42375 153822 42181 153592 42044 153296C41907 153000 41839 152660 41839 152275C41839 151902 41901 151563 42026 151257C42151 150951 42338 150717 42586 150555C42834 150392 43113 150310 43422 150310C43648 150310 43850 150358 44026 150453C44203 150549 44347 150674 44458 150828L44458 148971L45089 148971L45089 154150L44500 154150ZM42487 152275C42487 152755 42590 153114 42794 153353C42998 153591 43238 153710 43511 153710C43789 153710 44025 153597 44220 153370C44414 153144 44512 152797 44512 152329C44512 151817 44412 151441 44214 151200C44015 150960 43771 150840 43482 150840C43200 150840 42964 150955 42773 151186C42583 151416 42487 151779 42487 152275ZM47988 154150L47988 148971L48625 148971L48625 150828C48923 150483 49298 150310 49750 150310C50028 150310 50269 150365 50474 150474C50678 150583 50825 150735 50914 150930C51003 151124 51048 151404 51048 151769L51048 154150L50411 154150L50411 151769C50411 151451 50342 151220 50203 151075C50064 150931 49869 150858 49619 150858C49429 150858 49251 150907 49086 151004C48922 151101 48804 151234 48732 151403C48661 151572 48625 151803 48625 152096L48625 154150L47988 154150ZM54513 152942L55168 153025C55064 153406 54873 153703 54593 153915C54313 154127 53955 154234 53519 154234C52971 154234 52536 154065 52215 153728C51893 153390 51733 152916 51733 152305C51733 151674 51894 151184 52218 150834C52541 150485 52963 150310 53483 150310C53987 150310 54398 150481 54715 150822C55033 151164 55191 151646 55191 152269C55191 152305 55189 152360 55185 152436L52388 152436C52411 152848 52528 153164 52739 153382C52949 153601 53211 153710 53525 153710C53755 153710 53952 153649 54117 153528C54282 153407 54414 153212 54513 152942ZM52423 151912L54519 151912C54491 151598 54412 151362 54281 151203C54078 150957 53814 150834 53489 150834C53199 150834 52954 150933 52754 151129C52553 151325 52443 151586 52423 151912ZM55888 154150L55888 150394L56459 150394L56459 150965C56606 150699 56741 150524 56864 150438C56987 150353 57124 150310 57275 150310C57489 150310 57708 150380 57930 150519L57710 151108C57555 151017 57398 150971 57239 150971C57100 150971 56976 151013 56867 151096C56758 151180 56680 151295 56632 151442C56561 151668 56525 151916 56525 152186L56525 154150L55888 154150ZM60835 152942L61490 153025C61387 153406 61195 153703 60915 153915C60636 154127 60277 154234 59841 154234C59293 154234 58859 154065 58537 153728C58216 153390 58055 152916 58055 152305C58055 151674 58217 151184 58540 150834C58864 150485 59285 150310 59805 150310C60309 150310 60720 150481 61037 150822C61355 151164 61514 151646 61514 152269C61514 152305 61512 152360 61508 152436L58710 152436C58734 152848 58851 153164 59061 153382C59271 153601 59533 153710 59847 153710C60077 153710 60274 153649 60439 153528C60604 153407 60736 153212 60835 152942ZM58745 151912L60841 151912C60813 151598 60734 151362 60603 151203C60400 150957 60136 150834 59811 150834C59521 150834 59276 150933 59076 151129C58875 151325 58765 151586 58745 151912ZM62395 154150L62395 153424L63121 153424L63121 154150L62395 154150Z";
            data = StringUtil.trim(data);
            
            // In the algorithm below, we are doing a few things. It is
            // unfortunately complicated but it was found to be the primary
            // bottleneck when dealing with lots of PATH statements. 
            // We use the charCode since as a number it is much faster than
            // dealing with strings. We test the value against the Unicode
            // values for the numerical and alphabetical ranges for our 
            // commands, which is fast. We also order our IF statements from
            // most common (numbers) to least common (letter commands). Testing
            // also paradoxically found that simply building up another 
            // string is much faster than having an intermediate array; arrays
            // in ActionScript are very slow, and the final split() method 
            // is very fast at producing an array we can work with
            var results:String = '';
            var dataLength:int = data.length; // found to be faster
            var c:String;
            var code:Number;
            var i:int = 0;
            while (i < dataLength) {
                code = data.charCodeAt(i);

                // from most common to least common encountered
                
                if ((code >= 48 && code <= 57) || code == 45 || code == 101 || code == 46) {
                    // 0 through 9, -, e-, or .
                    do {
                        results += data.charAt(i);
                        i++;
                        code = data.charCodeAt(i);
                    } while (((code >= 48 && code <= 57) || code == 46) && code);
                    results += ',';
                } else if (code == 44 || code == 32 || code == 10 || code == 13) {
                    // just ignore delimiters since we are adding in our own
                    // in the correct places
                    i++;
                } else if (code >= 65 && code <= 122) {
                    // A-Z and a-z
                    results += data.charAt(i) + ',';
                    i++;
                } else {
                    // unknown character
                    i++;
                }
            }
            
            // remove trailing comma, but outside of big loop above
            if (results.charAt(results.length - 1) == ',') {
                results = results.substring(0, results.length - 1);
            }
            
            return results.split(',');
        }
        
        protected override function generateGraphicsCommands():void {
            this.dbg("generateGraphicsCommands");
            var startTime:int = new Date().getTime();
            var pieceTime:int;
            this._graphicsCommands = new Array();
            
            var command:String;

            var lineAbs:Boolean;
            var isAbs:Boolean;

            pieceTime = new Date().getTime();
            this.dbg("normalizing");
            var szSegs:Array = this.normalizeSVGData();
            this.dbg("after normalizing");
            //increment('generateGraphicsCommands_normalizeSVGData', (new Date().getTime() - pieceTime));   
            
            this._graphicsCommands.push(['SF']);

            var firstMove:Boolean = true;
            var loopTime:int = new Date().getTime();
            var szSegsLength:int = szSegs.length;
            for(var pos:int = 0; pos < szSegsLength; ) {             
                command = szSegs[pos++];                
                                        
                isAbs = false;
                        
                switch(command) {
                    case "M":
                        isAbs = true;
                    case "m":
                        lineAbs = isAbs;
                        if (firstMove) { //If first move is 'm' treat as absolute
                            isAbs = true;
                            firstMove = false;
                        }
                        this.moveTo(szSegs[pos++],szSegs[pos++], isAbs);
                        while (!isNaN(Number(szSegs[pos])) && pos < szSegsLength) {
                            this.line(szSegs[pos++], szSegs[pos++], lineAbs);
                        }
                        break;
                    case "A":
                        isAbs = true;
                    case "a":
                        do {
                            this.ellipticalArc(szSegs[pos++],szSegs[pos++],szSegs[pos++],
                                               szSegs[pos++],szSegs[pos++],szSegs[pos++],szSegs[pos++],isAbs);
                        } while (!isNaN(Number(szSegs[pos])) && pos < szSegsLength);
                        break;                        
                    case "C":
                        isAbs = true;
                    case "c":
                        do {
                            this.cubicBezier(szSegs[pos++],szSegs[pos++],szSegs[pos++],
                                             szSegs[pos++],szSegs[pos++],szSegs[pos++],isAbs);
                        } while (!isNaN(Number(szSegs[pos])) && pos < szSegsLength);
                        break;
                    case "S":
                        isAbs = true;
                    case "s":
                        do {
                            this.cubicBezierSmooth(szSegs[pos++],szSegs[pos++],szSegs[pos++],szSegs[pos++],isAbs);
                        } while (!isNaN(Number(szSegs[pos])) && pos < szSegsLength);
                        break;                        
                    case "Q":
                        isAbs = true;
                    case "q":
                        do {
                            this.quadraticBezier(szSegs[pos++],szSegs[pos++],szSegs[pos++],szSegs[pos++],isAbs);
                        } while (!isNaN(Number(szSegs[pos])) && pos < szSegsLength);
                        break;
                    case "T":
                        isAbs = true;
                    case "t":
                        do {
                            this.quadraticBezierSmooth(szSegs[pos++],szSegs[pos++],isAbs);
                        } while (!isNaN(Number(szSegs[pos])) && pos < szSegsLength);
                        break;
                    case "L":
                        isAbs = true;
                    case "l":
                        do {
                            this.line(szSegs[pos++],szSegs[pos++],isAbs);
                        } while (!isNaN(Number(szSegs[pos])) && pos < szSegsLength);
                        break;
                    case "H":
                        isAbs = true;
                    case "h":
                        do {
                            this.lineHorizontal(szSegs[pos++],isAbs);
                        } while (!isNaN(Number(szSegs[pos])) && pos < szSegsLength);
                        break;
                    case "V":
                        isAbs = true;
                    case "v":
                        do {
                            this.lineVertical(szSegs[pos++],isAbs);
                        } while (!isNaN(Number(szSegs[pos])) && pos < szSegsLength);
                        break;
                    case "Z":
                        isAbs = true;
                    case "z":
                        this.closePath();
                        while (!isNaN(Number(szSegs[pos])) && pos < szSegsLength) {
                            this.line(szSegs[pos++], szSegs[pos++], isAbs);
                        }
                        break;            
                                
                    default:
                        trace("Unknown Segment Type: " + command);
                        break;
                }            
            }        
            this._graphicsCommands.push(['EF']); 
            
            //increment('generateGraphicsCommands_totalLoop', (new Date().getTime() - loopTime)); 
            //increment('generateGraphicsCommands_path', (new Date().getTime() - startTime));
        }
        
        private function closePath():void {
            this._graphicsCommands.push(['Z']);

            this.currentX = this.startX;
            this.currentY = this.startY;
        }
        
        private function moveTo(x:Number, y:Number, isAbs:Boolean):void {
            if (!isAbs) {
                x += this.currentX;
                y += this.currentY;
            }

            this._graphicsCommands.push(['M', x, y]);
            this.currentX = x;
            this.currentY = y;
            
            this.startX = x;
            this.startY = y;

            this.lastCurveControlX = this.currentX;
            this.lastCurveControlY = this.currentY;

            this.setXMinMax(x);
            this.setYMinMax(y);
        }
        
        private function lineHorizontal(x:Number, isAbs:Boolean):void {
            var y:Number = this.currentY;
            if (!isAbs) {
                x += this.currentX;
                isAbs = true;
            }
            this.line(x,y,isAbs);            
        }
        
        private function lineVertical(y:Number, isAbs:Boolean):void {
            var x:Number = this.currentX;
            if (!isAbs) {
                y += this.currentY;
                isAbs = true;
            }
            this.line(x,y,isAbs);            
        }
        
        private function line(x:Number, y:Number, isAbs:Boolean):void {
            if (isAbs) {
                this.currentX = x;
                this.currentY = y;
            }
            else {
                this.currentX += x;
                this.currentY += y;                
            }            
            this._graphicsCommands.push(['L', this.currentX, this.currentY]);

            this.lastCurveControlX = this.currentX;
            this.lastCurveControlY = this.currentY;        

            this.setXMinMax(x);
            this.setYMinMax(y);
        }
        
        private function ellipticalArc(rx:Number, ry:Number, xAxisRotation:Number, largeArcFlag:Number, 
                                        sweepFlag:Number, x:Number, y:Number, isAbs:Boolean):void {
            if (!isAbs) {
                x += this.currentX;
                y += this.currentY;
            }
                        
            EllipticalArc.drawArc(rx, ry, xAxisRotation, Boolean(largeArcFlag), Boolean(sweepFlag),
                                  x, y, this.currentX, this.currentY, this._graphicsCommands);
            
            this.currentX = x;
            this.currentY = y;
            
            this.lastCurveControlX = this.currentX;
            this.lastCurveControlY = this.currentY;
            
            this.setXMinMax(rx);
            this.setYMinMax(ry);
            this.setXMinMax(x);
            this.setYMinMax(y);
        }
        
        private function quadraticBezierSmooth(x:Number, y:Number, isAbs:Boolean):void {
            var x1:Number = this.currentX + (this.currentX - this.lastCurveControlX);
            var y1:Number = this.currentY + (this.currentY - this.lastCurveControlY);
            
            if (!isAbs)
            {
                x+= this.currentX;
                y+= this.currentY;
                
                isAbs = true;
            }
            
            this.quadraticBezier(x1, y1, x, y, isAbs);
        }
        
        private function quadraticBezier(x1:Number, y1:Number, x:Number, y:Number, isAbs:Boolean):void {
            
            if (!isAbs) {
                x1 += this.currentX;
                y1 += this.currentY;
                x += this.currentX;
                y+= this.currentY;
            }
            
            this._graphicsCommands.push(['C',x1, y1, x, y]);    
            
            this.currentX = x;
            this.currentY = y;
            
            this.lastCurveControlX = x1;
            this.lastCurveControlY = y1;

            this.setXMinMax(x);
            this.setYMinMax(y);
            this.setXMinMax(x1);
            this.setYMinMax(y1);
        }
        
        private function cubicBezierSmooth(x2:Number, y2:Number,
                                           x:Number, y:Number, isAbs:Boolean):void {
            var x1:Number = this.currentX + (this.currentX - this.lastCurveControlX);
            var y1:Number = this.currentY + (this.currentY - this.lastCurveControlY);
            if (!isAbs)
            {
                x2 += this.currentX;
                y2 += this.currentY;                
                x+= this.currentX;
                y+= this.currentY;
                
                isAbs = true;
            }
            
            this.cubicBezier(x1, y1, x2, y2, x, y, isAbs);
        }
        private function cubicBezier(x1:Number, y1:Number, x2:Number, y2:Number,
                                     x:Number, y:Number, isAbs:Boolean):void {

            if (!isAbs) {
                x1 += this.currentX;
                y1 += this.currentY;
                x2 += this.currentX;
                y2 += this.currentY;
                x += this.currentX;
                y += this.currentY;
            }
            
            var P0:Object = {x:this.currentX, y:this.currentY};
            var P1:Object = {x:x1, y:y1};
            var P2:Object = {x:x2, y:y2};
            var P3:Object = {x:x, y:y};
        
            /* A portion of code from Bezier_lib.as by Timothee Groleau */
            // calculates the useful base points
            var PA:Object = getPointOnSegment(P0, P1, 3/4);
            var PB:Object = getPointOnSegment(P3, P2, 3/4);
            
            // get 1/16 of the [P3, P0] segment
            var dx:Number = (P3.x - P0.x)/16;
            var dy:Number = (P3.y - P0.y)/16;
            
            // calculates control point 1
            var Pc_1:Object = getPointOnSegment(P0, P1, 3/8);
            
            // calculates control point 2
            var Pc_2:Object = getPointOnSegment(PA, PB, 3/8);
            Pc_2.x -= dx;
            Pc_2.y -= dy;
            
            // calculates control point 3
            var Pc_3:Object = getPointOnSegment(PB, PA, 3/8);
            Pc_3.x += dx;
            Pc_3.y += dy;
            
            // calculates control point 4
            var Pc_4:Object = getPointOnSegment(P3, P2, 3/8);
            
            // calculates the 3 anchor points
            var Pa_1:Object = getMiddle(Pc_1, Pc_2);
            var Pa_2:Object = getMiddle(PA, PB);
            var Pa_3:Object = getMiddle(Pc_3, Pc_4);
            
            // draw the four quadratic subsegments
            this._graphicsCommands.push(['C', Pc_1.x, Pc_1.y, Pa_1.x, Pa_1.y]);
            this._graphicsCommands.push(['C', Pc_2.x, Pc_2.y, Pa_2.x, Pa_2.y]);
            this._graphicsCommands.push(['C', Pc_3.x, Pc_3.y, Pa_3.x, Pa_3.y]);
            this._graphicsCommands.push(['C', Pc_4.x, Pc_4.y, P3.x, P3.y]);        

            this.currentX = x;
            this.currentY = y;
            
            this.lastCurveControlX = x2;
            this.lastCurveControlY = y2;            

            //Width/height calculations for gradients
            this.setXMinMax(Pc_1.x);
            this.setYMinMax(Pc_1.y);
            this.setXMinMax(Pa_1.x);
            this.setYMinMax(Pa_1.y);

            this.setXMinMax(Pc_2.x);
            this.setYMinMax(Pc_2.y);
            this.setXMinMax(Pa_2.x);
            this.setYMinMax(Pa_2.y);

            this.setXMinMax(Pc_3.x);
            this.setYMinMax(Pc_3.y);
            this.setXMinMax(Pa_3.x);
            this.setYMinMax(Pa_3.y);

            this.setXMinMax(Pc_4.x);
            this.setYMinMax(Pc_4.y);
            this.setXMinMax(P3.x);
            this.setYMinMax(P3.y);
        }    
        
        private function getMiddle(P0:Object, P1:Object):Object
        {
            /* A portion of code from Bezier_lib.as by Timothee Groleau */
            return {x: ((P0.x + P1.x) / 2), y: ((P0.y + P1.y) / 2)};
        }    
        
        private function getPointOnSegment(P0:Object, P1:Object, ratio:Number):Object 
        {
            /* A portion of code from Bezier_lib.as by Timothee Groleau */
            return {x: (P0.x + ((P1.x - P0.x) * ratio)), y: (P0.y + ((P1.y - P0.y) * ratio))};
        }                            
    }
}
