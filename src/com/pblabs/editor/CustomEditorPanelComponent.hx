package com.pblabs.editor;

import com.pblabs.engine.core.EntityComponent;

/**
 * Add one or more of these sub-classes to your entities to show a 
 * custom panel when the owner(IEntity) of the component is
 * selected.  This avoids having to extend the Editor class itself
 */
class CustomEditorPanelComponent extends EntityComponent
{
    public var panel (get_panel, null) :com.bit101.components.Panel;
    
    public function new ()
    {
        super();
    }
    
    public function get_panel () :com.bit101.components.Panel
    {
        if (_panel == null) {
            createPanel();
        }
        return _panel;
    }
    
    //Override and call to do something useful
    function createPanel () :Void
    {
        _panel = new com.bit101.components.Panel();
    }
    
    var _panel :com.bit101.components.Panel;
}

