package com.pblabs.components.ui;

import com.pblabs.components.input.MouseInputComponent;
import com.pblabs.components.scene2D.BaseSceneLayer;
import com.pblabs.components.scene2D.BaseSceneManager;
import com.pblabs.components.scene2D.CircleShape;
import com.pblabs.components.scene2D.ImageComponent;
import com.pblabs.components.scene2D.SVGComponent;
import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.resource.EmbeddedResource;
import com.pblabs.engine.resource.ResourceToken;
import com.pblabs.geom.Vector2;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ds.Tuple;

import de.polygonal.motor2.geom.math.XY;

using com.pblabs.components.input.InputUtil;
using com.pblabs.components.scene2D.SceneUtil;
using com.pblabs.components.ui.UIUtil;
using com.pblabs.engine.core.SignalBondManager;
using com.pblabs.engine.util.PBUtil;
using com.pblabs.geom.VectorTools;

class UIUtil
{
    // public static function createSimpleButton (layer :BaseSceneLayer<Dynamic, Dynamic>, name :String, text :String, loc :XY, onInputDown:Void->Void) :IEntity
    // {
    //     var so = layer.context.createBaseSceneEntity();
    //     var blob  = layer.context.allocate(CircleShape);
    //     blob.parentProperty = layer.entityProp();
    //     // blob.text = text;
    //     so.addComponent(blob);
    //     var mouse = layer.context.allocate(MouseInputComponent);
    //     so.addComponent(mouse);
    //     so.initialize(name);
    //     so.setDeviceHeldDown(onInputDown);
    //     so.setDeviceDown(onInputDown);
    //     so.setLocation(loc.x, loc.y);
    //     return so;
    // }
    
    public static function createSVGButton (layer :BaseSceneLayer<Dynamic, Dynamic>, name :String, svgId :String, loc :XY, onInputDown:Void->Void) :IEntity
    {
        var so = layer.context.createBaseSceneEntity();
        
        var c = layer.context.allocate(com.pblabs.components.scene2D.SVGComponent);
        c.resourceToken = new ResourceToken(EmbeddedResource.NAME, svgId);
        c.parentProperty = layer.entityProp();
        so.addComponent(c);
        
        var mouse = layer.context.allocate(MouseInputComponent);
        so.addComponent(mouse);
        so.initialize(name);
        mouse.bindDeviceClick(onInputDown);
        so.setLocation(loc.x, loc.y);
        return so;
    }
    
    public static function createButton (layer :BaseSceneLayer<Dynamic, Dynamic>, name :String, imageClass :Class<Dynamic>,
    	resource :ResourceToken<Dynamic>, ?loc :XY = null, ?onInputDown:Void->Void = null) :IEntity
    {
        var so = layer.context.createBaseSceneEntity();
        
        var c :ImageComponent = layer.context.allocate(imageClass);
        c.resource = cast resource;
        c.parentProperty = layer.entityProp();
        so.addComponent(c);
        
        var mouse = layer.context.allocate(MouseInputComponent);
        so.addComponent(mouse);
        if (onInputDown != null) {
        	mouse.bindDeviceClick(onInputDown);
        }
        so.initialize(name);
        if (loc != null) {
        	so.setLocation(loc.x, loc.y);
        }
        MouseInputComponent.makeReactiveButton(mouse);
        return so;
    }
    
    /** We can add more args here when the UI bits become more sophisticated */
    public static function createZoomWidget (layer :BaseSceneLayer<Dynamic, Dynamic>, target :BaseSceneManager<Dynamic>, loc :Vector2, ?size :Float = 200) :Void
    {
        Preconditions.checkNotNull(layer);
        Preconditions.checkNotNull(target);
        Preconditions.checkNotNull(loc);
        
        var zoomIn = function () :Void {
            target.zoom += 0.1;
        }
        
        var zoomOut = function () :Void {
            target.zoom -= 0.1;
        }
        
        var ein = layer.createSVGButton("zoomInWidget", "zoomin", loc, zoomIn);
        var svg = ein.getComponent(SVGComponent);
        svg.width = svg.height = size;
        
        var mouse = ein.getComponent(MouseInputComponent);
        mouse.isRotatable = mouse.isScalable = mouse.isTranslatable = false;  
        
        var eout = layer.createSVGButton("zoomOutWidget", "zoomout", loc.add(new Vector2(0, size)), zoomOut);
        svg = eout.getComponent(SVGComponent);
        svg.width = svg.height = size;
        mouse = eout.getComponent(MouseInputComponent);
        mouse.isRotatable = mouse.isScalable = mouse.isTranslatable = false;
    }
    
    /** We can add more args here when the UI bits become more sophisticated */
    public static function createRotateWidget (layer :BaseSceneLayer<Dynamic, Dynamic>, target :BaseSceneManager<Dynamic>, loc :Vector2, ?size :Float = 200) :Void
    {
        Preconditions.checkNotNull(layer);
        Preconditions.checkNotNull(target);
        Preconditions.checkNotNull(loc);
        
        var clockWise = function () :Void {
            target.rotation += 0.05;
        }
        
        var antiClockwise = function () :Void {
            target.rotation -= 0.05;
        }
        
        var anticlock = layer.createSVGButton("anticlockwiseWidget", "counterclockwise", loc, antiClockwise);
        var svg = anticlock.getComponent(SVGComponent);
        svg.width = svg.height = size;
        var mouse = anticlock.getComponent(MouseInputComponent);
        mouse.isRotatable = mouse.isScalable = mouse.isTranslatable = false;  
        
        var clock = layer.createSVGButton("clockwiseWidget", "clockwise", loc.add(new Vector2(0, size)), clockWise);
        svg = clock.getComponent(SVGComponent);
        svg.width = svg.height = size;
        mouse = clock.getComponent(MouseInputComponent);
        mouse.isRotatable = mouse.isScalable = mouse.isTranslatable = false;
    }
    
    public static function createScrollWidget (layer :BaseSceneLayer<Dynamic, Dynamic>, target :BaseSceneManager<Dynamic>, loc :Vector2, ?size :Float = 200) :Void
    {
        Preconditions.checkNotNull(layer);
        Preconditions.checkNotNull(target);
        Preconditions.checkNotNull(loc);
        
        var upf = function () :Void {
            target.y -= 20;
        }
        var downf = function () :Void {
            target.y += 20;
        }
        var leftf = function () :Void {
            target.x -= 20;
        }
        var rightf = function () :Void {
            target.x += 20;
        }
        
        var fs = [upf, downf, leftf, rightf];
        var labels = ["up", "down", "left", "right"];
        var locs = [loc, loc.add(new Vector2(0, size)), loc.add(new Vector2(-size, size / 2)), loc.add(new Vector2(size, size / 2))];
        for(i in 0...labels.length) {
            var e = layer.createSVGButton(labels[i] + "Widget", labels[i], locs[i], fs[i]);
            var svg = e.getComponent(SVGComponent);
            svg.width = svg.height = size;
            var mouse = e.getComponent(MouseInputComponent);
            mouse.isRotatable = mouse.isScalable = mouse.isTranslatable = false;      
        }
    }
    

}
