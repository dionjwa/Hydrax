package com.pblabs.components.input;

import com.pblabs.components.input.MouseInputComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.util.Preconditions;

/**
  * "using" functions. 
  */
class InputUtil
{
    public static function setMouseClicked (e :IEntity, f :Void->Void) :Void
    {
        var mouseInput = e.lookupComponentByType(MouseInputComponent);
        Preconditions.checkNotNull(mouseInput, "Requires a MouseInputComponent for binding mouse listeners");
        mouseInput.onClick = f;
    }
    
    public static function setMouseDown (e :IEntity, f :Void->Void) :Void
    {
        var mouseInput = e.lookupComponentByType(MouseInputComponent);
        Preconditions.checkNotNull(mouseInput, "Requires a MouseInputComponent for binding mouse listeners");
        mouseInput.onDeviceDown = f;
    }
    
    public static function setDeviceHeldDown (e :IEntity, f :Void->Void) :Void
    {
        var mouseInput = e.lookupComponentByType(MouseInputComponent);
        Preconditions.checkNotNull(mouseInput, "Requires a MouseInputComponent for binding mouse listeners");
        mouseInput.onDeviceHeldDown = f;
    }
}
