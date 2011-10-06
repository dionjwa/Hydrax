package com.pblabs.components.physics.motor2.test;

import com.pblabs.components.scene2D.flash.SceneComponentSprite;
import com.pblabs.engine.core.PropertyReference;
import com.pblabs.engine.time.IAnimatedObject;
import com.pblabs.geom.Vector2;

import de.polygonal.motor2.World;
import de.polygonal.motor2.geom.math.XY;
import de.polygonal.motor2.geom.primitive.OBB2;

import com.pblabs.components.physics.motor2.PhysicsManager;

using com.pblabs.geom.VectorTools;

class MotorRenderer extends SceneComponentSprite,
	implements IAnimatedObject
{
	public var physicsManagerProperty :PropertyReference<PhysicsManager>;
	public var physics :PhysicsManager;
	var _OBB2 :OBB2;
	var _vertices :Array<XY>;
	
	public function new ()
	{
	    super();
	    _OBB2 = new OBB2();
	    _vertices = [];
	    for (i in 0...4) {
	    	_vertices.push(new Vector2());
	    }
	}
	
	override function onAdd () :Void
	{
		super.onAdd();
		if (physics == null) {
			physics = owner.getProperty(physicsManagerProperty);
		}
		com.pblabs.util.Assert.isNotNull(physics);
	}
	
	override public function onFrame (dt :Float) :Void
	{
		super.onFrame(dt);
	    var g = sprite.graphics;
	    g.clear();
	    g.lineStyle(0, 0xff0000);
	    for (c in physics) {
	    	switch (c.shapeType) {
	    		case CIRCLE(radius):
	    			g.drawCircle(c.x, c.y, radius);
	    			g.moveTo(c.x, c.y);
	    			var v = new Vector2(c.x, c.y).addLocal(c.angle.angleToVector2(radius));
	    			g.lineTo(v.x, v.y);	
	    		case BOX(w, h):
	    			_OBB2.c.x = c.x;
	    			_OBB2.c.y = c.y;
	    			_OBB2.e.x = w / 2;
	    			_OBB2.e.y = h / 2;
	    			_OBB2.R.setAngle(c.angle);
	    			_OBB2.getVertexList(_vertices);
	    			
	    			for (i in 0..._vertices.length - 1) {
	    				var v1 = _vertices[i];
	    				var v2 = _vertices[i + 1];
	    				g.moveTo(v1.x, v1.y);
	    				g.lineTo(v2.x, v2.y);
	    			}
	    			g.moveTo(_vertices[_vertices.length - 1].x, _vertices[_vertices.length - 1].y);
					g.lineTo(_vertices[0].x, _vertices[0].y);
	    			
	    		case FIXED_BOX(x, y, w, h): 
	    	}
	    	
	    }
	}
	
	
	// static var _vectorRenderer:VectorRenderer;
	// public static function getVectorRenderer():VectorRenderer
	// {
	// 	if (_vectorRenderer == null)
	// 		_vectorRenderer = new VectorRenderer(1024, 1024);
	// 	return _vectorRenderer;
	// }
	
	// static var _font:VectorFont;
	// public static function getFont():VectorFont
	// {
	// 	if (_font == null)
	// 	{
	// 		_font = new PFRondaSeven();
	// 		_font.setRenderer(getVectorRenderer());
	// 	}
	// 	return _font;
	// }
	
	// inline static var DO_ZOOM = Bits.BIT_28;
	// inline static var DO_PAN  = Bits.BIT_29;
	
	// var _bits:Int;
	
	// var _vr:VectorRenderer;
	// var _menu:Menu;
	// var _camera:Camera;
	// var _canvas:Shape;
	// var _worldMouse:Vec2;
	// var _snap:Float;
	// var _t0:XY;
	// var _t1:XY;
	// var _tmpAABB:AABB2;
	// var _tmpVec:XY;
	
	// public var key(default, null):Int;
	
	
	// var _displayList:ShapeRendererList<ShapeFeatureRenderer>;
	// var _constraintRenderer:ConstraintRenderer;
	
	// public function new ()
	// {
	// 	super();
		
	// 	key = HashKey.next();
	// 	_vr = getVectorRenderer();
	// 	addEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
	// }
	
	// public function update(type:Int, source:Observable, userData:Dynamic):Void
	// {
	// 	switch (type)
	// 	{
	// 		case TimebaseEvent.TICK:
	// 			// if (hasf(DO_PAN) && UI.isKeyDown(ASCII.SPACE) && UI.isMouseDown())
	// 			// {
	// 			// 	_camera.x = _t0.x + (Window.mouse().x - _t1.x);
	// 			// 	_camera.y = _t0.y + (Window.mouse().y - _t1.y);
	// 			// 	_camera.x = Mathematics.fclamp(_camera.x, Window.bounds().centerX - _camera.scale(10), Window.bounds().centerX + _camera.scale(10));
	// 			// 	_camera.y = Mathematics.fclamp(_camera.y, Window.bounds().centerY - _camera.scale(10), Window.bounds().centerY + _camera.scale(10));
	// 			// }
	// 			_tickInternal(userData);
			
	// 		case TimebaseEvent.RENDER:
	// 			_drawInternal(userData);
	// 			_vr.flush(_canvas.graphics);
			
	// 		// case UIEvent.KEY_DOWN:
	// 		// 	if (hasf(DO_PAN) && userData == ASCII.SPACE)
	// 		// 	{
	// 		// 		_t0.x = _camera.x;
	// 		// 		_t0.y = _camera.y;
	// 		// 		_t1.x = Window.mouse().x;
	// 		// 		_t1.y = Window.mouse().y;
	// 		// 	}
	// 		// 	_onKeyDown(userData);
			
	// 		// case UIEvent.KEY_UP:
	// 		// 	_onKeyUp(userData);
			
	// 		// case UIEvent.MOUSE_DOWN:
	// 		// 	if (hasf(DO_PAN) && UI.isKeyDown(ASCII.SPACE))
	// 		// 	{
	// 		// 		_t0.x = _camera.x;
	// 		// 		_t0.y = _camera.y;
	// 		// 		_t1.x = Window.mouse().x;
	// 		// 		_t1.y = Window.mouse().y;
	// 		// 	}
	// 		// 	_onMouseDown(userData);
			
	// 		// case UIEvent.MOUSE_UP:
	// 		// 	_onMouseUp(userData);
			
	// 		// case UIEvent.MOUSE_WHEEL:
	// 		// 	if (hasf(DO_ZOOM) && UI.isKeyDown(ASCII.SPACE))
	// 		// 	{
	// 		// 		_camera.zoom += 5. * Mathematics.sgn(userData);
	// 		// 		_camera.zoom = Mathematics.fclamp(_camera.zoom, 5, 200);
	// 		// 		_camera.x = Mathematics.fclamp(_camera.x, Window.bounds().centerX - _camera.scale(10), Window.bounds().centerX + _camera.scale(10));
	// 		// 		_camera.y = Mathematics.fclamp(_camera.y, Window.bounds().centerY - _camera.scale(10), Window.bounds().centerY + _camera.scale(10));
	// 		// 	}
	// 		// 	else
	// 		// 		_onMouseWheel(userData);
	// 	}
	// }
	
	
	// public function onFrame (dt :Float) :Void
	// {
	// 	// _tickInternal(0);
	//     for (r in _displayList) r.update();
	// 	_drawInternal(1);
	// 	_vr.flush(_canvas.graphics);
	// }
	
	// override function onAdd () :Void
	// {
	// 	super.onAdd();
		
	// 	_camera = new Camera(Window.bounds().centerX, Window.bounds().centerY, 50);
		
	// 	addChild(_canvas = new Shape());
		
	// 	_worldMouse = new Vec2();
	// 	_tmpAABB    = new AABB2();
	// 	_tmpVec     = new Vec2();
	// 	_t0         = new Vec2();
	// 	_t1         = new Vec2();
	// 	_snap       = 0.;
	// 	_bits       = 0;
		
	// 	// Timebase.attach(this, TimebaseEvent.TICK | TimebaseEvent.RENDER);
	// 	// UI.attach(this, UIEvent.KEY_DOWN | UIEvent.KEY_UP | UIEvent.MOUSE_WHEEL | UIEvent.MOUSE_DOWN | UIEvent.MOUSE_UP);
		
	// 	// _init();
		
		
		
		
	// 	_world = owner.getProperty(worldProperty);
	// 	com.pblabs.util.Assert.isNotNull(_world);
		
	// 	_displayList = new ShapeRendererList();
		
	// 	_constraintRenderer                       = new ConstraintRenderer(_world, _displayList, _camera, _vr);
	// 	_constraintRenderer.colorContactPointCold = 0xff00FFFF.toARGB();
	// 	_constraintRenderer.colorContactPointWarm = 0xffFF0000.toARGB();
	// 	_constraintRenderer.colorContactGraph     = 0x80FFFFFF.toARGB();
	// 	_constraintRenderer.colorImpulse          = 0xFFFFFFFF.toARGB();
	// 	_constraintRenderer.colorJoints           = 0xFFFF0011.toARGB();
	// 	_constraintRenderer.contactPointSize      = 2;
		
		
	// }
	
	// override function onRemove () :Void
	// {
	// 	super.onRemove();
	// 	_displayList.free();
	// 	_constraintRenderer.free();
	// }
	
	// function _drawInternal(alpha:Float):Void
	// {
	// 	if (hasf(DO_PROFILE))
	// 	{
	// 		var settings = World.settings;
	// 		var shapeCount = 0;
	// 		for (b in _world.bodyList) shapeCount += b.shapeList.size();
			
	// 		var formatStr = "";
	// 		formatStr += "shapes\t%d\n";
	// 		formatStr += "bodies\t%d\n";
	// 		formatStr += "joints\t%d\n";
	// 		formatStr += "contacts\t%d\n";
	// 		formatStr += "islands\t%d\n";
	// 		formatStr += "vel-iter\t%d\n";
	// 		formatStr += "pos-iter\t%d\n\n";
	// 		formatStr += "timings (ms)\n";
			
	// 		var formatArg = new Array<Dynamic>();
	// 		formatArg[0] = shapeCount;
	// 		formatArg[1] = _world.bodyList.size();
	// 		formatArg[2] = _world.jointList.size();
	// 		formatArg[3] = _world.contactList.size();
	// 		formatArg[4] = _world.numSolvedIsland;
	// 		formatArg[5] = settings.velocityIterations;
	// 		formatArg[6] = settings.positionIterations;
			
	// 		var tabSize = TestCase.getFont().tabSize;
	// 		TestCase.getFont().tabSize = 15;
			
	// 		_vr.setFillColor(0xFFFFFF, 1);
	// 		_vr.fillStart();
	// 		TestCase.getFont().write(Sprintf.format(formatStr, formatArg), 1, 400, false, _tmpAABB, true);
	// 		_vr.fillEnd();
			
	// 		var colors = [0xFFFF00, 0x00FFFF, 0xFF00FF];
			
	// 		formatStr = "broad\t%.2f\n";
	// 		formatArg[0] = StopWatch.query(settings.profileIdBroadPhase);
			
	// 		_vr.setFillColor(colors[0], 1);
	// 		_vr.fillStart();
	// 		TestCase.getFont().write(Sprintf.format(formatStr, formatArg), 1, _tmpAABB.ymax, false, _tmpAABB, true);
	// 		_vr.fillEnd();
			
	// 		formatStr = "narrow\t%.2f\n";
	// 		formatArg[0] = StopWatch.query(settings.profileIdNarrowPhase);
	// 		_vr.setFillColor(colors[1], 1);
	// 		_vr.fillStart();
	// 		TestCase.getFont().write(Sprintf.format(formatStr, formatArg), 1, _tmpAABB.ymax, false, _tmpAABB, true);
	// 		_vr.fillEnd();
			
	// 		formatStr = "solver\t%.2f\n";
	// 		formatArg[0] = StopWatch.query(settings.profileIdSolver);
	// 		_vr.setFillColor(colors[2], 1);
	// 		_vr.fillStart();
	// 		TestCase.getFont().write(Sprintf.format(formatStr, formatArg), 1, _tmpAABB.ymax, false, _tmpAABB, true);
	// 		_vr.fillEnd();
			
	// 		TestCase.getFont().tabSize = tabSize;
			
	// 		_drawTimings(1, 550, 100, 2, colors);
	// 	}
		
	// 	if (!hasf(DO_RENDER)) return;
		
	// 	var dynamicAndAwakeBodiesColor = 0xffffff;
	// 	var dynamicAndAwakeBodiesAlpha = 1;
	// 	var dynamicAndAwakeBodiesThick = 0;
		
	// 	var staticBodiesColor = 0x8ef0b5;
	// 	var staticBodiesAlpha = .9;
	// 	var staticBodiesThick = 1;
		
	// 	var dynamicAndSleepingBodiesColor = 0x5172bc;
	// 	var dynamicAndSleepingBodiesAlpha = .5;
		
	// 	if (hasf(DRAW_GRID))
	// 	{
	// 		_drawViewCenter();
	// 		_drawGrid();
	// 	}
		
	// 	//render dynamic & awake bodies
	// 	if (hasf(DRAW_STACK_ANALYSIS))
	// 	{
	// 		//draw body stack heights from stack analysis
	// 		var hmax = World.settings.maxStackLayerCount;
	// 		var colors = new Array<Int>();
	// 		var rgb = new RGB();
	// 		var hsv = new HSV(0, 1, 1);
	// 		for (hue in 0...hmax)
	// 		{
	// 			hsv.h = hue * (360 / hmax);
	// 			colors[hue] = ColorConversion.HSVtoRGB(hsv, rgb).get24();
	// 		}
			
	// 		var tmp = new Array<Array<ShapeRenderer>>();
	// 		for (r in _displayList)
	// 		{
	// 			if (r.body.isSleeping || r.body.isStatic) continue;
				
	// 			if (tmp[r.body.stackHeight] == null)
	// 				tmp[r.body.stackHeight] = new Array();
	// 			tmp[r.body.stackHeight].push(r);
	// 		}
	// 		for (i in 0...tmp.length)
	// 		{
	// 			if (tmp[i] == null) continue;
	// 			if (tmp[i].length == 0) continue;
				
	// 			_vr.style.setFillColor(colors[i], 1);
	// 			_vr.fillStart();
	// 			for (r in tmp[i]) r.render(alpha);
	// 			_vr.fillEnd();
	// 		}
	// 		for (r in _displayList)
	// 		{
	// 			if (r.body.isSleeping) continue;
	// 			r.drawLabel(Std.string(r.body.stackHeight), alpha);
	// 		}
	// 	}
	// 	else
	// 	{
	// 		_vr.setLineStyle(dynamicAndAwakeBodiesColor, dynamicAndAwakeBodiesAlpha, dynamicAndAwakeBodiesThick);
	// 		for (r in _displayList)
	// 			if (!r.body.isSleeping && !r.body.isStatic)
	// 				r.render(alpha);
	// 	}
		
	// 	//render static bodies
	// 	_vr.setLineStyle(staticBodiesColor, staticBodiesAlpha, staticBodiesThick);
	// 	for (r in _displayList)
	// 		if (r.body.isStatic)
	// 			r.render(alpha);
		
	// 	//render sleeping bodies (excluding static bodies)
	// 	_vr.setFillColor(dynamicAndSleepingBodiesColor, dynamicAndSleepingBodiesAlpha);
	// 	_vr.fillStart();
	// 	for (r in _displayList)
	// 		if (r.body.isSleeping && !r.body.isStatic)
	// 			r.render(alpha);
	// 	_vr.fillEnd();
		
	// 	if (hasf(DRAW_BOUNDING_BOX))
	// 		for (r in _displayList)
	// 			r.drawBoundingBox(alpha);
		
	// 	if (hasf(DRAW_BOUNDING_SPHERE))
	// 	{
	// 		for (r in _displayList)
	// 		{
	// 			if (!r.body.isSleeping)
	// 			{
	// 				r.drawBoundingSphere(alpha);
	// 				r.drawCenter(alpha);
	// 			}
	// 		}
	// 	}
		
	// 	if (hasf(DRAW_USER_DATA))
	// 	{
	// 		for (r in _displayList)
	// 		{
	// 			var data = r.shape.userData;
	// 			if (data == null) data = r.body.userData;
	// 			r.drawLabel(data, alpha);
	// 		}
	// 	}
		
	// 	if (hasf(DRAW_CONTACT_POINTS))
	// 		_constraintRenderer.drawContactPoints();
		
	// 	if (hasf(DRAW_CONTACT_GRAPH))
	// 		_constraintRenderer.drawContactGraph();
		
	// 	if (hasf(DRAW_JOINTS))
	// 		_constraintRenderer.drawJoints();
		
	// 	//run custom render hook
	// 	_draw(alpha);
	// }
	
	// function _drawTimings(x:Float, y:Float, w:Float, h:Float, colors:Array<Int>)
	// {
	// 	_vr.clearStroke();
		
	// 	var total = StopWatch.total();
	// 	var r = total > .001 ? (w / total) : 0;
	// 	var j = 0;
	// 	for (i in 0...3)
	// 	{
	// 		var v = StopWatch.query(i);
	// 		if (v > 0)
	// 		{
	// 			var p = r * v;
	// 			if (p != 0)
	// 			{
	// 				_vr.setFillColor(colors[j], 1);
	// 				_vr.fillStart();
	// 				_vr.aabbMinMax4(x, y, x + p, y + h);
	// 				_vr.fillEnd();
	// 				x += p;
	// 			}
	// 		}
	// 		j++;
	// 	}
	// }
	
	// function _addShapeRenderer(body:RigidBody):Void
	// {
	// 	_displayList.addRenderer(ShapeFeatureRenderer, body, _camera, _vr);
	// 	for (s in body.shapeList) _setupShapeRenderer(cast _displayList.getRenderer(s));
	// }
	
	// function _setupShapeRenderer(s:ShapeFeatureRenderer):Void
	// {
	// 	s.colorFirstVertex     = 0xffffff00.toARGB();
	// 	s.colorOtherVertex     = 0xffffff00.toARGB();
	// 	s.colorBoundingBox     = 0xffffff00.toARGB();
	// 	s.colorOBB             = 0xff80ff00.toARGB();
	// 	s.colorBoundingSphere  = 0x50ffffff.toARGB();
	// 	s.colorLabel           = 0xffff8000.toARGB();
	// 	s.solidProxy           = false;
	// 	s.vertexChainPointSize = 2;
	// 	s.labelFontSize        = 8;
	// 	s.colorCenterA         = 0xff000000.toARGB();
	// 	s.colorCenterB         = 0xffff0000.toARGB();
	// 	s.centerRadius         = 4;
	// 	s.font                 = TestCase.getFont();
	// }
}
