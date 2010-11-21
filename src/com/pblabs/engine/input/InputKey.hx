/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file was derived from the equivalent actionscript PushButton Engine 
 * source file:
 * http://code.google.com/p/pushbuttonengine/
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.input;

import com.pblabs.util.Enumerable;
import com.pblabs.util.PBMacros;

/**
 * Enumeration class that maps friendly key names to their key code equivalent. This class
 * should not be instantiated directly, rather, one of the constants should be used.
 */   
class InputKey extends Enumerable<InputKey> 
{
	
	// public var defaultType(getDefaultType, null) : Enumerable<InputKey>;
	public var keyCode(getKeyCode, null) : Int;
	// public var staticTypeMap(getStaticTypeMap, null) : Hash<InputKey>;
	// public var typeMap(getTypeMap, null) : Hash<InputKey>;
	public static var INVALID:InputKey = new InputKey(PBMacros.getFieldName(), 0);

	public static var BACKSPACE:InputKey = new InputKey(PBMacros.getFieldName(), 8);
	public static var TAB:InputKey = new InputKey(PBMacros.getFieldName(), 9);
	public static var ENTER:InputKey = new InputKey(PBMacros.getFieldName(), 13);
	public static var COMMAND:InputKey = new InputKey(PBMacros.getFieldName(), 15);
	public static var SHIFT:InputKey = new InputKey(PBMacros.getFieldName(), 16);
	public static var CONTROL:InputKey = new InputKey(PBMacros.getFieldName(), 17);
	public static var ALT:InputKey = new InputKey(PBMacros.getFieldName(), 18);
	public static var PAUSE:InputKey = new InputKey(PBMacros.getFieldName(), 19);
	public static var CAPS_LOCK:InputKey = new InputKey(PBMacros.getFieldName(), 20);
	public static var ESCAPE:InputKey = new InputKey(PBMacros.getFieldName(), 27);

	public static var SPACE:InputKey = new InputKey(PBMacros.getFieldName(), 32);
	public static var PAGE_UP:InputKey = new InputKey(PBMacros.getFieldName(), 33);
	public static var PAGE_DOWN:InputKey = new InputKey(PBMacros.getFieldName(), 34);
	public static var END:InputKey = new InputKey(PBMacros.getFieldName(), 35);
	public static var HOME:InputKey = new InputKey(PBMacros.getFieldName(), 36);
	public static var LEFT:InputKey = new InputKey(PBMacros.getFieldName(), 37);
	public static var UP:InputKey = new InputKey(PBMacros.getFieldName(), 38);
	public static var RIGHT:InputKey = new InputKey(PBMacros.getFieldName(), 39);
	public static var DOWN:InputKey = new InputKey(PBMacros.getFieldName(), 40);

	public static var INSERT:InputKey = new InputKey(PBMacros.getFieldName(), 45);
	public static var DELETE:InputKey = new InputKey(PBMacros.getFieldName(), 46);

	public static var ZERO:InputKey = new InputKey(PBMacros.getFieldName(), 48);
	public static var ONE:InputKey = new InputKey(PBMacros.getFieldName(), 49);
	public static var TWO:InputKey = new InputKey(PBMacros.getFieldName(), 50);
	public static var THREE:InputKey = new InputKey(PBMacros.getFieldName(), 51);
	public static var FOUR:InputKey = new InputKey(PBMacros.getFieldName(), 52);
	public static var FIVE:InputKey = new InputKey(PBMacros.getFieldName(), 53);
	public static var SIX:InputKey = new InputKey(PBMacros.getFieldName(), 54);
	public static var SEVEN:InputKey = new InputKey(PBMacros.getFieldName(), 55);
	public static var EIGHT:InputKey = new InputKey(PBMacros.getFieldName(), 56);
	public static var NINE:InputKey = new InputKey(PBMacros.getFieldName(), 57);

	public static var A:InputKey = new InputKey(PBMacros.getFieldName(), 65);
	public static var B:InputKey = new InputKey(PBMacros.getFieldName(), 66);
	public static var C:InputKey = new InputKey(PBMacros.getFieldName(), 67);
	public static var D:InputKey = new InputKey(PBMacros.getFieldName(), 68);
	public static var E:InputKey = new InputKey(PBMacros.getFieldName(), 69);
	public static var F:InputKey = new InputKey(PBMacros.getFieldName(), 70);
	public static var G:InputKey = new InputKey(PBMacros.getFieldName(), 71);
	public static var H:InputKey = new InputKey(PBMacros.getFieldName(), 72);
	public static var I:InputKey = new InputKey(PBMacros.getFieldName(), 73);
	public static var J:InputKey = new InputKey(PBMacros.getFieldName(), 74);
	public static var K:InputKey = new InputKey(PBMacros.getFieldName(), 75);
	public static var L:InputKey = new InputKey(PBMacros.getFieldName(), 76);
	public static var M:InputKey = new InputKey(PBMacros.getFieldName(), 77);
	public static var N:InputKey = new InputKey(PBMacros.getFieldName(), 78);
	public static var O:InputKey = new InputKey(PBMacros.getFieldName(), 79);
	public static var P:InputKey = new InputKey(PBMacros.getFieldName(), 80);
	public static var Q:InputKey = new InputKey(PBMacros.getFieldName(), 81);
	public static var R:InputKey = new InputKey(PBMacros.getFieldName(), 82);
	public static var S:InputKey = new InputKey(PBMacros.getFieldName(), 83);
	public static var T:InputKey = new InputKey(PBMacros.getFieldName(), 84);
	public static var U:InputKey = new InputKey(PBMacros.getFieldName(), 85);
	public static var V:InputKey = new InputKey(PBMacros.getFieldName(), 86);
	public static var W:InputKey = new InputKey(PBMacros.getFieldName(), 87);
	public static var X:InputKey = new InputKey(PBMacros.getFieldName(), 88);
	public static var Y:InputKey = new InputKey(PBMacros.getFieldName(), 89);
	public static var Z:InputKey = new InputKey(PBMacros.getFieldName(), 90);

	public static var NUM0:InputKey = new InputKey(PBMacros.getFieldName(), 96);
	public static var NUM1:InputKey = new InputKey(PBMacros.getFieldName(), 97);
	public static var NUM2:InputKey = new InputKey(PBMacros.getFieldName(), 98);
	public static var NUM3:InputKey = new InputKey(PBMacros.getFieldName(), 99);
	public static var NUM4:InputKey = new InputKey(PBMacros.getFieldName(), 100);
	public static var NUM5:InputKey = new InputKey(PBMacros.getFieldName(), 101);
	public static var NUM6:InputKey = new InputKey(PBMacros.getFieldName(), 102);
	public static var NUM7:InputKey = new InputKey(PBMacros.getFieldName(), 103);
	public static var NUM8:InputKey = new InputKey(PBMacros.getFieldName(), 104);
	public static var NUM9:InputKey = new InputKey(PBMacros.getFieldName(), 105);

	public static var MULTIPLY:InputKey = new InputKey(PBMacros.getFieldName(), 106);
	public static var ADD:InputKey = new InputKey(PBMacros.getFieldName(), 107);
	public static var NUMENTER:InputKey = new InputKey(PBMacros.getFieldName(), 108);
	public static var SUBTRACT:InputKey = new InputKey(PBMacros.getFieldName(), 109);
	public static var DECIMAL:InputKey = new InputKey(PBMacros.getFieldName(), 110);
	public static var DIVIDE:InputKey = new InputKey(PBMacros.getFieldName(), 111);

	public static var F1:InputKey = new InputKey(PBMacros.getFieldName(), 112);
	public static var F2:InputKey = new InputKey(PBMacros.getFieldName(), 113);
	public static var F3:InputKey = new InputKey(PBMacros.getFieldName(), 114);
	public static var F4:InputKey = new InputKey(PBMacros.getFieldName(), 115);
	public static var F5:InputKey = new InputKey(PBMacros.getFieldName(), 116);
	public static var F6:InputKey = new InputKey(PBMacros.getFieldName(), 117);
	public static var F7:InputKey = new InputKey(PBMacros.getFieldName(), 118);
	public static var F8:InputKey = new InputKey(PBMacros.getFieldName(), 119);
	public static var F9:InputKey = new InputKey(PBMacros.getFieldName(), 120);
	// F10 is considered 'reserved' by Flash
	public static var F11:InputKey = new InputKey(PBMacros.getFieldName(), 122);
	public static var F12:InputKey = new InputKey(PBMacros.getFieldName(), 123);

	public static var NUM_LOCK:InputKey = new InputKey(PBMacros.getFieldName(), 144);
	public static var SCROLL_LOCK:InputKey = new InputKey(PBMacros.getFieldName(), 145);

	public static var COLON:InputKey = new InputKey(PBMacros.getFieldName(), 186);
	public static var PLUS:InputKey = new InputKey(PBMacros.getFieldName(), 187);
	public static var COMMA:InputKey = new InputKey(PBMacros.getFieldName(), 188);
	public static var MINUS:InputKey = new InputKey(PBMacros.getFieldName(), 189);
	public static var PERIOD:InputKey = new InputKey(PBMacros.getFieldName(), 190);
	public static var BACKSLASH:InputKey = new InputKey(PBMacros.getFieldName(), 191);
	public static var TILDE:InputKey = new InputKey(PBMacros.getFieldName(), 192);

	public static var LEFT_BRACKET:InputKey = new InputKey(PBMacros.getFieldName(), 219);
	public static var SLASH:InputKey = new InputKey(PBMacros.getFieldName(), 220);
	public static var RIGHT_BRACKET:InputKey = new InputKey(PBMacros.getFieldName(), 221);
	public static var QUOTE:InputKey = new InputKey(PBMacros.getFieldName(), 222);

	public static var MOUSE_BUTTON:InputKey = new InputKey(PBMacros.getFieldName(), 253);
	public static var MOUSE_X:InputKey = new InputKey(PBMacros.getFieldName(), 254);
	public static var MOUSE_Y:InputKey = new InputKey(PBMacros.getFieldName(), 255);
	public static var MOUSE_WHEEL:InputKey = new InputKey(PBMacros.getFieldName(), 256);
	public static var MOUSE_HOVER:InputKey = new InputKey(PBMacros.getFieldName(), 257);

	/**
	 * A dictionary mapping the string names of all the keys to the InputKey they represent.
	 */
	public static function getStaticTypeMap():Hash<InputKey>
	{
		if (_typeMap == null)
		{
			_typeMap = new Hash();
			_typeMap.set("BACKSPACE", BACKSPACE);
			_typeMap.set("TAB", TAB);
			_typeMap.set("ENTER", ENTER);
			_typeMap.set("RETURN", ENTER);
			_typeMap.set("SHIFT", SHIFT);
			_typeMap.set("COMMAND", COMMAND);
			_typeMap.set("CONTROL", CONTROL);
			_typeMap.set("ALT", ALT);
			_typeMap.set("OPTION", ALT);
			_typeMap.set("ALTERNATE", ALT);
			_typeMap.set("PAUSE", PAUSE);
			_typeMap.set("CAPS_LOCK", CAPS_LOCK);
			_typeMap.set("ESCAPE", ESCAPE);
			_typeMap.set("SPACE", SPACE);
			_typeMap.set("SPACE_BAR", SPACE);
			_typeMap.set("PAGE_UP", PAGE_UP);
			_typeMap.set("PAGE_DOWN", PAGE_DOWN);
			_typeMap.set("END", END);
			_typeMap.set("HOME", HOME);
			_typeMap.set("LEFT", LEFT);
			_typeMap.set("UP", UP);
			_typeMap.set("RIGHT", RIGHT);
			_typeMap.set("DOWN", DOWN);
			_typeMap.set("LEFT_ARROW", LEFT);
			_typeMap.set("UP_ARROW", UP);
			_typeMap.set("RIGHT_ARROW", RIGHT);
			_typeMap.set("DOWN_ARROW", DOWN);
			_typeMap.set("INSERT", INSERT);
			_typeMap.set("DELETE", DELETE);
			_typeMap.set("ZERO", ZERO);
			_typeMap.set("ONE", ONE);
			_typeMap.set("TWO", TWO);
			_typeMap.set("THREE", THREE);
			_typeMap.set("FOUR", FOUR);
			_typeMap.set("FIVE", FIVE);
			_typeMap.set("SIX", SIX);
			_typeMap.set("SEVEN", SEVEN);
			_typeMap.set("EIGHT", EIGHT);
			_typeMap.set("NINE", NINE);
			_typeMap.set("0", ZERO);
			_typeMap.set("1", ONE);
			_typeMap.set("2", TWO);
			_typeMap.set("3", THREE);
			_typeMap.set("4", FOUR);
			_typeMap.set("5", FIVE);
			_typeMap.set("6", SIX);
			_typeMap.set("7", SEVEN);
			_typeMap.set("8", EIGHT);
			_typeMap.set("9", NINE);
			_typeMap.set("NUMBER_0", ZERO);
			_typeMap.set("NUMBER_1", ONE);
			_typeMap.set("NUMBER_2", TWO);
			_typeMap.set("NUMBER_3", THREE);
			_typeMap.set("NUMBER_4", FOUR);
			_typeMap.set("NUMBER_5", FIVE);
			_typeMap.set("NUMBER_6", SIX);
			_typeMap.set("NUMBER_7", SEVEN);
			_typeMap.set("NUMBER_8", EIGHT);
			_typeMap.set("NUMBER_9", NINE);
			_typeMap.set("A", A);
			_typeMap.set("B", B);
			_typeMap.set("C", C);
			_typeMap.set("D", D);
			_typeMap.set("E", E);
			_typeMap.set("F", F);
			_typeMap.set("G", G);
			_typeMap.set("H", H);
			_typeMap.set("I", I);
			_typeMap.set("J", J);
			_typeMap.set("K", K);
			_typeMap.set("L", L);
			_typeMap.set("M", M);
			_typeMap.set("N", N);
			_typeMap.set("O", O);
			_typeMap.set("P", P);
			_typeMap.set("Q", Q);
			_typeMap.set("R", R);
			_typeMap.set("S", S);
			_typeMap.set("T", T);
			_typeMap.set("U", U);
			_typeMap.set("V", V);
			_typeMap.set("W", W);
			_typeMap.set("X", X);
			_typeMap.set("Y", Y);
			_typeMap.set("Z", Z);
			_typeMap.set("NUM0", NUM0);
			_typeMap.set("NUM1", NUM1);
			_typeMap.set("NUM2", NUM2);
			_typeMap.set("NUM3", NUM3);
			_typeMap.set("NUM4", NUM4);
			_typeMap.set("NUM5", NUM5);
			_typeMap.set("NUM6", NUM6);
			_typeMap.set("NUM7", NUM7);
			_typeMap.set("NUM8", NUM8);
			_typeMap.set("NUM9", NUM9);
			_typeMap.set("NUMPAD_0", NUM0);
			_typeMap.set("NUMPAD_1", NUM1);
			_typeMap.set("NUMPAD_2", NUM2);
			_typeMap.set("NUMPAD_3", NUM3);
			_typeMap.set("NUMPAD_4", NUM4);
			_typeMap.set("NUMPAD_5", NUM5);
			_typeMap.set("NUMPAD_6", NUM6);
			_typeMap.set("NUMPAD_7", NUM7);
			_typeMap.set("NUMPAD_8", NUM8);
			_typeMap.set("NUMPAD_9", NUM9);
			_typeMap.set("MULTIPLY", MULTIPLY);
			_typeMap.set("ASTERISK", MULTIPLY);
			_typeMap.set("NUMMULTIPLY", MULTIPLY);
			_typeMap.set("NUMPAD_MULTIPLY", MULTIPLY);
			_typeMap.set("ADD", ADD);
			_typeMap.set("NUMADD", ADD);
			_typeMap.set("NUMPAD_ADD", ADD);
			_typeMap.set("SUBTRACT", SUBTRACT);
			_typeMap.set("NUMSUBTRACT", SUBTRACT);
			_typeMap.set("NUMPAD_SUBTRACT", SUBTRACT);
			_typeMap.set("DECIMAL", DECIMAL);
			_typeMap.set("NUMDECIMAL", DECIMAL);
			_typeMap.set("NUMPAD_DECIMAL", DECIMAL);
			_typeMap.set("DIVIDE", DIVIDE);
			_typeMap.set("NUMDIVIDE", DIVIDE);
			_typeMap.set("NUMPAD_DIVIDE", DIVIDE);
			_typeMap.set("NUMENTER", NUMENTER);
			_typeMap.set("NUMPAD_ENTER", NUMENTER);
			_typeMap.set("F1", F1);
			_typeMap.set("F2", F2);
			_typeMap.set("F3", F3);
			_typeMap.set("F4", F4);
			_typeMap.set("F5", F5);
			_typeMap.set("F6", F6);
			_typeMap.set("F7", F7);
			_typeMap.set("F8", F8);
			_typeMap.set("F9", F9);
			_typeMap.set("F11", F11);
			_typeMap.set("F12", F12);
			_typeMap.set("NUM_LOCK", NUM_LOCK);
			_typeMap.set("SCROLL_LOCK", SCROLL_LOCK);
			_typeMap.set("COLON", COLON);
			_typeMap.set("SEMICOLON", COLON);
			_typeMap.set("PLUS", PLUS);
			_typeMap.set("EQUAL", PLUS);
			_typeMap.set("COMMA", COMMA);
			_typeMap.set("LESS_THAN", COMMA);
			_typeMap.set("MINUS", MINUS);
			_typeMap.set("UNDERSCORE", MINUS);
			_typeMap.set("PERIOD", PERIOD);
			_typeMap.set("GREATER_THAN", PERIOD);
			_typeMap.set("BACKSLASH", BACKSLASH);
			_typeMap.set("QUESTION_MARK", BACKSLASH);
			_typeMap.set("TILDE", TILDE);
			_typeMap.set("BACK_QUOTE", TILDE);
			_typeMap.set("LEFT_BRACKET", LEFT_BRACKET);
			_typeMap.set("LEFT_BRACE", LEFT_BRACKET);
			_typeMap.set("SLASH", SLASH);
			_typeMap.set("FORWARD_SLASH", SLASH);
			_typeMap.set("PIPE", SLASH);
			_typeMap.set("RIGHT_BRACKET", RIGHT_BRACKET);
			_typeMap.set("RIGHT_BRACE", RIGHT_BRACKET);
			_typeMap.set("QUOTE", QUOTE);
			_typeMap.set("MOUSE_BUTTON", MOUSE_BUTTON);
			_typeMap.set("MOUSE_X", MOUSE_X);
			_typeMap.set("MOUSE_Y", MOUSE_Y);
			_typeMap.set("MOUSE_WHEEL", MOUSE_WHEEL);
			_typeMap.set("MOUSE_HOVER", MOUSE_HOVER);
		}

		return _typeMap;
	}

	/**
	 * Converts a key code to the string that represents it.
	 */
	public static function codeToString(value:Int):String
	{
		// var tm:Dictionary = staticTypeMap;
		// for (var name:String in tm)
		// {
		//	 if (staticTypeMap[name.toUpperCase()].keyCode == value)
		//		 return name.toUpperCase();
		// }

		return null;
	}

	/**
	 * Converts the name of a key to the keycode it represents.
	 */
	// public static function stringToCode(value:String):Int
	// {
	//	 if (!staticTypeMap[value.toUpperCase()])
	//		 return 0;

	//	 return staticTypeMap[value.toUpperCase()].keyCode;
	// }

	/**
	 * Converts the name of a key to the InputKey it represents.
	 */
	// public static function stringToKey(value:String):InputKey
	// {
	//	 return staticTypeMap[value.toUpperCase()];
	// }

	static var _typeMap:Hash<InputKey> = null;

	/**
	 * The key code that this wraps.
	 */
	public function getKeyCode():Int
	{
		return _keyCode;
	}

	private function new(name, ?keyCode:Int=0)
	{
		super(name);
		_keyCode = keyCode;
	}

	// public function getTypeMap():Hash<InputKey>
	// {
	//	 return staticTypeMap;
	// }

	// public function getDefaultType():Enumerable<InputKey>
	// {
	//	 return INVALID;
	// }

	var _keyCode:Int;
}

