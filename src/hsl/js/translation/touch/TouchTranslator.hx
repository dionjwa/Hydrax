package hsl.js.translation.touch;

import hsl.haxe.translation.NativeEvent;
import hsl.haxe.translation.Translation;
import hsl.haxe.translation.Translator;

import hsl.js.data.Touch;
import hsl.js.translation.JSTranslatorBase;


/**
 * Currently a placeholder class.  The signal will return the native TouchEvent, not a generic version.
 */
class TouchTranslator extends JSTranslatorBase, implements Translator<TouchEvent> {
	/**
	 * Creates a new modifier keys state translator.
	 * You usually want to prevent the default touch event handling.
	 */
	public function new(?preventDefault :Bool = true):Void {
	    super(preventDefault);
	}
	public function translate(nativeEvent:NativeEvent):Translation<TouchEvent> {
		var event :TouchEvent = cast nativeEvent;
		return new Translation<TouchEvent>(event, targetFromDOMEvent(nativeEvent));
	}
	#if debug
	private function toString():String {
		return "[TouchTranslator]";
	}
	#end
}

