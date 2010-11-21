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

