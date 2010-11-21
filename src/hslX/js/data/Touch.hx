package hsl.js.data;

/**
  * Classes specific to iOS/Safari for touch controls.  In the future, (when I have a device for testing) this can
  * made generic for android/flash touch devices.
  */
  
extern class Touch 
{
    public var clientX :Int;
    public var clientY :Int;
    public var identifier :Int;
    public var pageX :Int;
    public var pageY :Int;
    public var screenX :Int;
    public var screenY :Int;
    public var target :Dynamic;//Docs say EventTarget, but...
}

extern class TouchList {
    public var length :Int;
    public function item (index :Int) :Touch;
}

class TouchListIterator
{
    inline public static function iterator (list :TouchList) :TouchListIterator
    {
        return new TouchListIterator(list);
    }
    
    var _list :TouchList;
    var _index :Int;
    
    public function new (list :TouchList) 
    {
        _list = list;
        _index = 0;
        reset();
    }
    
    public function hasNext() :Bool
    {
        return _index < _list.length;
    }
    
    public function reset() :Void
    {
        _index = 0;
    }
    
    public function next () :Touch
    {
        return _list.item(_index++);
    }
}

typedef  TouchEvent = {> js.Dom.Event,
    //http://www.sitepen.com/blog/2008/07/10/touching-and-gesturing-on-the-iphone/
    var touches :TouchList;
    var changedTouches :TouchList;
    var targetTouches :TouchList;
    
    function preventDefault() :Void;
}

typedef  GestureEvent = {> js.Dom.Event,
    //http://m14i.wordpress.com/2009/10/25/javascript-touch-and-gesture-events-iphone-and-android/
    var scale :Float;
    var rotation :Float;
    
    function preventDefault() :Void;
}
