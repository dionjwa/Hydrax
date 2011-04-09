package com.pblabs.engine.debug;

import com.pblabs.components.scene2D.flash.TextComponent;
using com.pblabs.util.NumberUtil;

import flash.events.Event;

import flash.text.TextField;

class FPSDisplay extends TextComponent
{
    
    public function new (?framesToTrack :Int = 150)
    {
    	super();
        // background = true;
        text = "fps: 000.00";
        // width = textWidth + 5;
        // height = textHeight + 4;
        _frameStamps = [];
        _framesToTrack = framesToTrack;
    }
    
    override function onAdd () :Void
    {
    	super.onAdd();
    	flash.Lib.current.addEventListener(Event.ENTER_FRAME, handleEnterFrame);
    }
    
    override function onRemove () :Void
    {
    	super.onRemove();
    	flash.Lib.current.removeEventListener(Event.ENTER_FRAME, handleEnterFrame);
    }
    

    function handleEnterFrame (event :Event) :Void
    {
        var curStamp = Std.int(haxe.Timer.stamp() * 1000);
        _frameStamps.push(curStamp);
        if (_frameStamps.length > _framesToTrack) {
            _frameStamps.shift(); // forget the oldest timestamps
        }

        var firstStamp = Std.int(_frameStamps[0]);
        var seconds = Std.int((curStamp - firstStamp) / 1000);
        // subtract one from the frames, since we're measuring the time
        // elapsed over the frames (when there are two timestamps, that's
        // the difference between 1 frame)
        var frames = _frameStamps.length - 1;

        text = "fps: " + (frames / seconds).toFixed(5);
    }

    /** Timestamps of past ENTER_FRAME events. */
    var _frameStamps:Array<Int> ;

    /** The number of running frames we track. */
    var _framesToTrack:Int;
}
