package com.pblabs.engine.core;

import com.pblabs.engine.core.IPBManager;
import com.pblabs.engine.core.IPBObject;

import hsl.haxe.Signaler;
import hsl.haxe.DirectSignaler;

/**
  * Currently not used.  NOt sure if ever.
  * A list of signals used by PBContext and various Managers.
  */
class Signals implements IPBManager
{
    /** Signals dispatched when objects are created/registered.  Managers can hook into these for independent object management */
    public var signalObjectAdded (default, null) :Signaler<IPBObject>;
    public var signalObjectRemoved (default, null) :Signaler<IPBObject>;
    
    public function new ()
    {
        signalObjectAdded = new DirectSignaler(this);
        signalObjectRemoved = new DirectSignaler(this);
    }
    
    public function startup():Void
    {
    }
    
    public function shutdown():Void
    {
        signalObjectAdded.unbindAll();
        signalObjectRemoved.unbindAll();
    }

}


