[pushbutton]: http://pushbuttonengine.com/
[haxe]: http://http://haxe.org
[nme]: http://haxe.org/doc/start/cpp


# PBE-Haxe (Hydrax): a [HaXe][haxe] port of the [PushButton Engine (PBE)][pushbutton]

# What is it?

Hydrax/PBE is a game engine.  It helps you write robust, maintainable, flexible games both big and small, having solved many problems that you will encounter if you don't use this or a similar library.

It is not a direct competitor to NME.  NME is a platform independent Flash API, whereas Hydrax is a high level game engine. You can use NME with Hydrax, but you don't have to.  Hydrax does not attempt to replicate the Flash API.  In other words, you can mix and match Hydrax and NME as you see fit.  

The focus of Hydrax is currently web platforms which means Flash and Canvas.  iPhone/C++ support is in progress.  Whatever Hydrax lacks, you can use NME. 

Hydrax does this well:

- Components: everything is based on components that you can easily replace with your own.
- Asset handling
- Injection via robotlegs (robothaxe).
- Platform independent 2D display.
- Platform independent input (currently Flash + Canvas only).
- Handling transitioning between game screens, or levels.
- Managing complicated game objects.

# Gettings started

1. Install [HaXe][haxe].
2. At the terminal/dos prompt, type *haxelib install hydrax*
3. Download this repository.
2. Go to the repository folder *demo/basicEngineDemo01* in a terminal or dos prompt.
3. Create a folder there called 'build' if one doesn't already exist.
4. type *haxe buildflash.hxml*
5. Open the swf in *demo/basicEngineDemo01/build/demo.swf*
6. You should see a circle or rectangle moving around the screen border.

Hydrax is under constant development, this sometimes breaks the demos.  Demos current working: 
 
- basicEngineDemo01
- bitmapRendering
- animatedbody

# Why

HaXe and the PBE are a natural fit.  

PBE is an excellent engine for building games, as the component plug-in architecture eases building of complex game objects with a minimum of code rewriting.  This component architecture also makes it easier to write games for different platforms, as different components can be used for different platforms in a natural way.

HaXe provides an outright performance boost for games running in Flash, compared to games written in AS3.

Many games require server side functionality.  HaXe compiles to several server-side languages/platforms, allowing a single language for the entire game development.  This capability alone is awesome.  I'll say it again: you can write game logic once that runs on the client and the server.

Currently, Hydrax will (mostly) keep the PBE package structure of the core classes (with permission from Ben Garney, PB Labs).  This may change if Hydrax diverges sufficiently.  Community contributions are encouraged.

# What's done

Complete or functional:

- Core engine.
- Injection.
- Rendering (Flash and HTML5).  Modified the original as3 pbe code to handle different platforms.
- Xml Template system and PBE serialization.
- Resources.  Rebuilt to handle multi-platform and haxe-only resources.
- Tasks/tweens.
- Profiling.
- Box2D

Extra features (not available in PBE):

- Multiplatform: flash and HTML5 (js) rendering, c++ for standalone, iOs, and android.  Tested so far: flash, HTML5, node.js (server side platform), c++ (preliminary).
- SVG support.
- Flash < - > javascript remoting (including special HTML5 localStorage service).
- Client/server remoting (from HaXe).

Incomplete or not working:

- Sound.  Cross platform sound is definitely needed.
- PBE animations.
- PBE sets.  Hydrax uses a context-specific SetManager (optional).
- State machine (very low priority).
- The PBE static class (not needed or useful with Haxe 'using' functionality).
- Debugging.  

# Differences

Due to the extra features and multi-platform capability of HaXe (or just personal motivation), some components and features underwent more modifications than others.  Also, the package structure outside of the core engine are slightly modified: almost everything outside of the core engine is grouped under com.pblabs.components instead of com.pblabs.

## Major differences:

- Hxhsl signals instead of as3 events.  The SignalBondManager provides listener registration on Entity and Component objects with automatic listener  removal upon object destruction.
- Rendering has been modified to simplify cross-platform 2D rendering.  The Flash API has *not* been duplicated (as in [NME][nme]), nor do I intend to. 
- Input.  Rewritten to handle cross-platform input (mouse, touch screens, etc).
- A very simple form of field injection is available, as Robotlegs/SwiftSuspenders is not yet ported to HaXe.
- Screens.  IPBContexts are used in the place of Screens.

## Minor differences

Standardized some method names:

- IEntity.lookupComponentsByType -> IEntity.getComponents
- IEntity.lookupComponentByType -> IEntity.getComponent
- IEntity.lookupComponentByName -> IEntity.getComponentByName
- Hydrax IPBObjects don't have internal lists of game object sets.  That functionality is managed entirely by the SetManager.
- Signals are used instead of flash specific event dispatchers.  
- Haxe cannot property deserialize dynamic objects.  Currently, Haxe cannot check if an object implements Dynamic (where you can add arbitrary fields) so cannot decide if assigning such a field is a valid operation.
- Property getters and setters must be in the form 'get_fieldName', 'set_fieldName' to work with PropertyReferences and ReflectUtil.  ReflectUtil adds duplicate methods from Reflect, checking getters/setters

# License

Classes directly ported from PBE and any new code maintain the original MIT license. Some classes in com.pblabs.util and com.pblabs.components.tasks are derived from LGLP code, and maintain the LGPL license.  The LGPL licensed classes are documented as such in the source headers.

Copyright (c) 2010 Dion Amago

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

