/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package hsl.js.data;
/**
  * Classes specific to iOS/Safari for touch controls.  In the future, (when I have a device for testing) this can
  * made generic for android/flash touch devices.
  *
  * Currently this file is also in the hsl repository, however it's not in the haxelib distribution yet.  When the 
  * haxelib library is updated, this copy will be removed.
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

typedef  TouchEvent = {#if js > js.Dom.Event, #end
    //http://www.sitepen.com/blog/2008/07/10/touching-and-gesturing-on-the-iphone/
    var touches :TouchList;
    var changedTouches :TouchList;
    var targetTouches :TouchList;
    
    function preventDefault() :Void;
}

typedef  GestureEvent = {#if js > js.Dom.Event, #end
    //http://m14i.wordpress.com/2009/10/25/javascript-touch-and-gesture-events-iphone-and-android/
    var scale :Float;
    var rotation :Float;
    
    function preventDefault() :Void;
}

#if js
class Css
{
    /**
      * The platform specific transition function keyword.
      * Currently this is not used, the CSS animation components are webkit specific.
      */
    public static var transition (get_transition, never) :String;
    
    static function get_transition () :String
    {
        if (_transition != null) {
            return _transition;
        }
        var types :Array<String> = ['transition', 'webkitTransition', 'OTransition', 'MozTransition'];
        if (untyped untyped js.Lib.window.getComputedStyle != null) {
            var style = untyped js.Lib.window.getComputedStyle(document.documentElement, null);
            for (type in types) {
                if (untyped Reflect.hasField(style, type)) {    
                   _transition = type;
                   break;
                }
            }
        }
        return _transition;
    }
    
    static var _transition :String;
}
#end
