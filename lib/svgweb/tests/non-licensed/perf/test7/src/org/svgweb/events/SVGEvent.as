package org.svgweb.events
{
    import flash.events.Event;

    public class SVGEvent extends Event
    {
        // "standard" events
        public static const SVGLoad:String = "SVGLoad";
        // internal nonstandard events
        public static const _SVGAnimBegin:String = "begin";
        public static const _SVGAnimEnd:String = "end";
        public static const _SVGAnimRepeat:String = "repeatEvent";
        public static const _SVGAccessKey:String = "_SVGAccessKey";
        public static const _SVGDocTimeUpdate:String = "_SVGDocTimeUpdate";
        public static const _SVGDocTimeSeek:String = "_SVGDocTimeSeek";
        
        public var docTime:Number;

        public function SVGEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(type, bubbles, cancelable);
        }
        
        public function setDocTime(docTime:Number):void {
            this.docTime = docTime;
        }

    }
}
