/*
 *                            _/                                                    _/   
 *       _/_/_/      _/_/    _/  _/    _/    _/_/_/    _/_/    _/_/_/      _/_/_/  _/    
 *      _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/     
 *     _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/      
 *    _/_/_/      _/_/    _/    _/_/_/    _/_/_/    _/_/    _/    _/    _/_/_/  _/       
 *   _/                            _/        _/                                          
 *  _/                        _/_/      _/_/                                             
 *                                                                                       
 * POLYGONAL - A HAXE LIBRARY FOR GAME DEVELOPERS
 * Copyright (c) 2009-2010 Michael Baczynski, http://www.polygonal.de
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
package de.polygonal.ui;

@:build(de.polygonal.core.event.ObserverMacro.create
([
	KEY_DOWN, 		//A key was pressed. userData UI.currKeyCode().
	KEY_UP,			//A key was released. userData=UI.currKeyCode().
	KEY_REPEAT,		//A key is being pressed; triggered at the rate defined by Timebase.getTickRate(). userData=UI.currKeyCode().
	MOUSE_DOWN,		//The left mouse button was pressed. userData=position of the mouse cursor in world space.
	MOUSE_UP,		//The left mouse button was released. userData=position of the mouse cursor in world space.
	MOUSE_WHEEL,	//The orientation of the mouse wheel changed. userData=mouse wheel delta.
	MOUSE_MOVE,		//The mouse position changed. userData=mouse cursor position in world space.
	SHORTCUT,		//A combination of keys was pressed simultaneously; e.g. ALT+SHIFT+C. userData=shortcut name.
	SEQUENCE		//A sequence of keys was pressed one after another in a predefined order. userData=sequence name.
]))
/**
 * Updates triggered by <i>de.polygonal.ui.UI</i>.
 */
class UIEvent {}