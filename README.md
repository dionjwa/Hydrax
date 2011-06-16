[pushbutton]: http://pushbuttonengine.com/
[haxe]: http://http://haxe.org


# Hydrax: a [HaXe][haxe] port of the [PushButton Engine (PBE)][pushbutton]

# Why

HaXe and the PBE are a natural fit.  

PBE is a good engine for building games, as the component plug-in architecture eases building of complex game objects with a minimum of code rewriting.  This component architecture also makes it easier to write games for different platforms, as different components can be used for different platforms in a natural way.

HaXe provides an outright performance boost for games running in Flash, compared to games written in AS3.

Many games require server side functionality.  HaXe compiles to several server-side languages/platforms, allowing a single language for the entire game development.  This capability alone is awesome.  I'll say it again: you can write game logic once that runs on the client and the server.

Currently, Hydrax will (mostly) keep the PBE package structure of the core classes (with permission from Ben Garney, PB Labs).  This may change if Hydrax diverges sufficiently.  Community contributions are encouraged.

#Differences (detailed differences are listed below)

Due to the extra features and multi-platform capability of HaXe (or just personal motivation), some components and features underwent more modifications than others.  Also, the package structure outside of the core engine are slightly modified: almost everything outside of the core engine is grouped under com.pblabs.components instead of com.pblabs.

Major differences:

- Hxhsl signals instead of as3 events.  The SignalBondManager provides listener registration on Entity and Component objects with automatic listener  removal upon object destruction.
- Rendering has been modified to simplify cross-platform 2D rendering.  The Flash API has *not* been duplicated, nor do I intend to.
- Input.  Rewritten to handle cross-platform input (mouse, touch screens, etc).
- A very simple form of field injection is available, as Robotlegs/SwiftSuspenders is not ported to HaXe.
- Screens.  I use IPBContexts in the place of screens.

# What's done

Complete or functional:

- Core engine.
- Rendering (Flash and HTML5).  Modified the AS3 to handle different platforms.
- Xml Template system and PBE serialization.
- Resources.  Rebuilt to handle multi-platform and haxe-only resources.
- Tasks/tweens.
- Profiling.

Extra features (not available in PBE):

- Multiplatform: flash and HTML5 (js) rendering, c++ for standalone, iOs, and android.  Tested with PBE so far: flash, HTML5, node.js (server side platform), c++ (preliminary).
- SVG support.
- Flash < - > javascript remoting (including special HTML5 localStorage service).
- Client/server remoting (from HaXe).

Incomplete or not working:

- Sound.  Cross platform sound is definitely needed.
- PBE animations
- PBE sets.  Hydrax uses a context-specific SetManager (optional).
- Box2D.  (Coming soon).
- State machine.
- The PBE static class.
- Debugging.  

# Detailed differences:

- Hydrax IPBObjects don't have internal lists of game object sets.  That functionality is managed entirely by the SetManager.
- A lightweight custom injection system is used instead of robolegs.  I'll endevour to incorporate a more robust injection system in the near future.
- Signals are used instead of flash specific event dispatchers.  
- Haxe cannot property deserialize dynamic objects.  Currently, Haxe cannot check if an object implements Dynamic (where you can add arbitrary fields) so cannot decide if assigning such a field is a valid operation.
- Property getters and setters must be in the form 'get_value', 'set_value' to work with PropertyReferences and ReflectUtil.


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

