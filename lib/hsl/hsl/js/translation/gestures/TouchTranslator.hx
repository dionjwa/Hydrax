package hsl.js.translation.gestures;

import hsl.haxe.translation.NativeEvent;
import hsl.haxe.translation.Translation;
import hsl.haxe.translation.Translator;

import hsl.js.translation.JSTranslatorBase;

import js.IOs;

/**
 * A translator that doesn't actually translate touch events, ha ha.
 * Placeholder class, when one day they will be translated.
 */
class TouchTranslator extends JSTranslatorBase, implements Translator<TouchEvent> {
	/**
	 * Creates a new modifier keys state translator.
	 */
	public function new():Void {
	}
	public function translate(nativeEvent:NativeEvent):Translation<TouchEvent> {
		var event :TouchEvent = cast nativeEvent;
		untyped event.preventDefault();
		return new Translation<TouchEvent>(event, targetFromDOMEvent(nativeEvent));
	}
	#if debug
	private function toString():String {
		return "[TouchTranslator]";
	}
	#end
}


