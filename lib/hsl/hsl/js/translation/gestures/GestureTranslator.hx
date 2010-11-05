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
class GestureTranslator extends JSTranslatorBase, implements Translator<GestureEvent> {
	/**
	 * Creates a new modifier keys state translator.
	 */
	public function new():Void {
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


