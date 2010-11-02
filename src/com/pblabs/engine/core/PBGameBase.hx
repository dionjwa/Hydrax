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
package com.pblabs.engine.core;

import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.core.IPBGroup;
import com.pblabs.engine.core.NameManager;
import com.pblabs.engine.core.PBContext;
import com.pblabs.engine.core.PBGroup;
import com.pblabs.engine.debug.Log;
import com.pblabs.engine.injection.Injector;
import com.pblabs.engine.time.IProcessManager;
import com.pblabs.engine.time.ProcessManager;
import com.pblabs.util.Preconditions;

import com.pblabs.util.Assert;

import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

import com.pblabs.util.ReflectUtil;

using Lambda;

/**
  * The base game manager.
  * This class inits all the managers, and managers the IPBContexts.
  */
class PBGameBase extends PBContext
{
    public var currentContext(get_currentContext, null) :IPBContext;
    
    public var newActiveContextSignaler (default, null) :Signaler<IPBContext>;

    public function new() 
    { 
        super();
        this.name = "PBGame context";
        _contexts = new Array();
        _contextsDirty = false;
        newActiveContextSignaler = new DirectSignaler(this);
        _isRunning = false;
        startup();
    }
    
    /**
      * Override the allocate method to check if the allocated 
      * class is an PBContext.  If so, set the injector parent.
      * This check is here so as to save the parent class a 
      * type check: only PBGameBase and child classes are 
      * expected to allocate PBContext instances.
      */
    override public function allocate <T>(type :Class<T>) :T
    {
        if (type == IPBContext) {
            untyped type = PBContext;
        }
        
        var i = super.allocate(type);
        if (Std.is(i, IPBContext) || Std.is(i, PBContext)) {
            var ctx = cast(i, PBContext);
            //On flash Reflect.hasField is sufficient, however on JS
            //Type.getInstanceFields is needed 
            if (Reflect.hasField(ctx, "setInjectorParent") || Type.getInstanceFields(type).has("setInjectorParent")) {
                Reflect.callMethod(ctx, Reflect.field(ctx, "setInjectorParent"), [injector]);
            }
            #if (flash || cpp)
            ctx.startup(displayContainer);
            #else
            ctx.startup();
            #end
            
            Assert.isTrue(ctx.injector.getMapping(IPBContext) == ctx);
            if (ctx.getManager(IProcessManager) != null && Std.is(ctx.getManager(IProcessManager), ProcessManager)) {
                //The IPBContext starts paused, we control the unpausing.
                cast(ctx.getManager(IProcessManager), ProcessManager).paused = true;
            }
        }
        return i;
    }
    
    public function pushContext (ctx :IPBContext) :Void
    {
        Preconditions.checkNotNull(ctx, "Cannot add a null context");
        Preconditions.checkArgument(!_contexts.has(ctx), "Context already added");
        Preconditions.checkArgument(!Std.is(ctx, PBContext) || cast(ctx, PBContext).injector.parent == injector, "PBContext injector has no parent.  Use allocate() to create the PBContext, not new PBContext");
        stopContexts();
        _contexts.push(ctx);
        ctx.getManager(IProcessManager).paused = true;
        startTopContext();
    }
    
    override public function startup(#if (flash || cpp) ?parentContainer :flash.display.DisplayObjectContainer #end) :Void
    {
        Log.debug(["Initializing " + this + " '" + name + "'."]);
        #if flash
        if (parentContainer != null) {
            Preconditions.checkNotNull(displayContainer, "displayContainer is null");
            parentContainer.addChild(displayContainer);
        } else {
            _displayContainer = flash.Lib.current;
        }
        #end
        
        Preconditions.checkNotNull(injector, "WTF is the injector null?");
        injector.mapValue(IPBContext, this);
        Preconditions.checkArgument(injector.getMapping(IPBContext) == this, "Injector borked");
        
        // Set up root and current group.
        var rg = new PBGroup();
        rg.context = this;
        rg.name = "RootGroup";
        rootGroup = rg;
        // currentGroup = rg;
        _currentGroup = rg;
        injector.mapValue(IPBGroup, rootGroup);
        
        // Do manager startup.
        initializeManagers();
        _nameManager = getManager(NameManager);
        Preconditions.checkNotNull(_nameManager, "WTF is the nameManager null?");
        
        //Add the root group to the name manager.
        _nameManager.add(rg);
        _contexts = new Array();
    }
    
    public function run () :Void
    {
        if (!_isRunning) {
            _isRunning = true;
            // startup();
            if (currentContext != null) {
                cast(currentContext.getManager(IProcessManager), ProcessManager).paused = false;
            }
        }
    }
    
    function stopContexts () :Void
    {
        for (c in _contexts) {
            c.getManager(IProcessManager).stop;
        }
    }
    
    function startTopContext () :Void
    {
        if (currentContext != null) {
            Assert.isNotNull(currentContext, "How is the top context null?");
            Assert.isNotNull(currentContext.getManager(IProcessManager), "Where is the IProcessManager?");
            cast(currentContext.getManager(IProcessManager), ProcessManager).paused = _isRunning;
            newActiveContextSignaler.dispatch(currentContext);
        }
    }
    
    function get_currentContext() :IPBContext
    {
        return _contexts[_contexts.length - 1];
    }
    
    override function set_currentGroup (group :IPBGroup) :IPBGroup
    {
        Preconditions.checkArgument(_currentGroup == null, "Cannot change the current group after it's set.  PBGames have no reason to change the root group, _currentGroup=" + _currentGroup + ", new group=" + group + " " + Log.getStackTrace());
        return super.set_currentGroup(group);
    }

    var _contexts :Array<IPBContext>;
    var _contextsDirty :Bool;
    var _isRunning :Bool;
}


