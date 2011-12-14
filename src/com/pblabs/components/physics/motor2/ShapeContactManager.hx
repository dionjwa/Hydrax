package com.pblabs.components.physics.motor2;

import com.pblabs.components.manager.NodeComponent;
import org.transition9.ds.Map;
import org.transition9.ds.Maps;
import org.transition9.ds.Tuple;

import de.polygonal.motor2.Settings;
import de.polygonal.motor2.World;
import de.polygonal.motor2.collision.nbody.SAP;
import de.polygonal.motor2.data.RigidBodyData;
import de.polygonal.motor2.dynamics.contact.Contact;
import de.polygonal.motor2.dynamics.contact.generator.BoxContact;
import de.polygonal.motor2.geom.math.Vec2;
import de.polygonal.motor2.geom.primitive.AABB2;

import Type;

using org.transition9.util.IterUtil;
using org.transition9.util.MathUtil;

/**
  * This is not designed to be pooled.
  */
class ShapeContactManager extends NodeComponent<Dynamic, ShapeContact>,
	implements com.pblabs.engine.time.ITickedObject
{
	public var world (default, null) :World;
	public var settings (default, null):Settings;
	var _hashCount :Int;
	var _map :Map<Tuple<ShapeContact, ShapeContact>, Contact>;
	var _cachedTuple :Tuple<ShapeContact, ShapeContact>;
	
	public function new ()
	{
	    super();
	    settings = new Settings();
	    _hashCount = 1;
	    _map = Maps.newHashMap(ValueType.TClass(Tuple));
	    _cachedTuple = new Tuple(null, null);
	}
	
	public function getManifoldData (s1 :ShapeContact, s2 :ShapeContact) :Void
	{
	    _cachedTuple.set(s1, s2);
	    var contact = _map.get(_cachedTuple);
	    org.transition9.util.Assert.isNotNull(contact);
	    contact.evaluate();
	    var manifold = contact.manifold;
	    trace("contact.manifoldCount=" + contact.manifoldCount);
	    
	    _cachedTuple.clear();
	}
	
	public function onTick (dt :Float) :Void
	{
	    
	}
	
	public function removeContacts (c :ShapeContact) :Void
	{
	    for (k in _map.keys().toArray()) {
	    	if (k.v1 == c || k.v2 == c) {
	    		var contact = _map.get(k);
	    		contact.free();
	    		_map.remove(k);
	    	}
	    }
	}
	
	public function addContacts (c :ShapeContact) :Void
	{
		org.transition9.util.Assert.isTrue(c.hashCode() != 0);
	    for (child in children) {
			if (child != c) {
				var t = new Tuple(c, child);
				org.transition9.util.Assert.isFalse(_map.exists(t));
				org.transition9.util.Assert.isNotNull(c.body.shape);
				org.transition9.util.Assert.isNotNull(child.body.shape);
				var contact = new BoxContact(settings);
				contact.init(c.body.shape, child.body.shape);
				_map.set(t, contact);
			}
		}
	}
	
	override function childAdded (c :ShapeContact) :Void
	{
		super.childAdded(c);
		c.setHash(_hashCount++);
	}
	
	override function childRemoved (c :ShapeContact) :Void
	{
		super.childRemoved(c);
		removeContacts(c);
	}
	
	override function onAdd () :Void
	{
		super.onAdd();
		//From TestManifold
		var _tmpAABB :AABB2 = new AABB2();
		_tmpAABB.set4(-1500, -1500, 1500, 1500);
	    
		settings.worldBounds = _tmpAABB;
		settings.gravity.x = 0;
		settings.gravity.y = 0;
		world = new World(settings);
	}
	
	override function onRemove () :Void
	{
		super.onRemove();
		world.free();
		world = null;
		settings = null;
	}
}
