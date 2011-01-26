package hsl.js.translation.touch;

import hsl.haxe.translation.NativeEvent;
import hsl.haxe.translation.Translation;
import hsl.haxe.translation.Translator;

import hsl.js.data.Touch;
import hsl.js.translation.JSTranslatorBase;


/**
 * Currently a placeholder class.  The signal will return the native GestureEvent, not a generic version.
 */
class GestureTranslator extends JSTranslatorBase, implements Translator<GestureEvent> {
	/**
	 * Creates a new modifier keys state translator.
	 * You usually want to prevent the default event handling.
	 */
	public function new(?preventDefault :Bool = true):Void {
	    super(preventDefault);
	}
	public function translate(nativeEvent:NativeEvent):Translation<GestureEvent> {
		var event :GestureEvent = cast nativeEvent;
		return new Translation<GestureEvent>(event, targetFromDOMEvent(nativeEvent));
	}
	#if debug
	private function toString():String {
		return "[GestureTranslator]";
	}
	#end
	

}


