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
package de.polygonal.ui.trigger;

import de.polygonal.ds.IntHashTable;
import de.polygonal.motor.geom.primitive.AABB2;
import de.polygonal.ui.trigger.pointer.MousePointer;
import de.polygonal.ui.trigger.pointer.Pointer;
import de.polygonal.ui.trigger.surface.AbstractSurface;

class TriggerLayerManager
{
	static var _root:Trigger;
	static var _layerLookup:IntHashTable<Trigger>;
	
	public static function append(x:Trigger, z:Int):Void
	{
		if (_root == null)
		{
			_root = new Trigger(MousePointer.instance(), new NullSurface());
			
			if (_layerLookup != null) _layerLookup.free();
			
			_layerLookup = new IntHashTable(16);
		}
		
		//find layer
		if (_layerLookup.hasKey(z))
			_layerLookup.get(z).appendChild(x);
		else
		{
			//create layer
			var layer = new Trigger(MousePointer.instance(), new NullSurface());
			layer.userData = z;
			
			_layerLookup.set(z, layer);
			
			var rootNode = _root.getNode();
			
			//TODO sort children
			if (!rootNode.hasChildren())
				_root.appendChild(layer);
			else
			if (rootNode.numChildren() == 1)
			{
				if (z < rootNode.getFirstChild().val.userData)
					_root.prependChild(layer);
				else
					_root.appendChild(layer);
			}
			else
			{
				var node0 = rootNode.children;
				var node1 = node0.next;
				
				while (node1 != null)
				{
					var index0 = node0.val.userData;
					var index1 = node1.val.userData;
					
					if (index0 < z && z < index1)
					{
						//insert trigger at correct position
						_root.insertAfterChild(node0.val, layer);
						break;
					}
					
					node0 = node1;
					node1 = node1.next;
				}
			}
			
			//add given trigger to layer
			layer.appendChild(x);
			
			//align layers for rendering
			var ext = NullSurface.SIZE / 2;
			var gap = ext / 4;
			
			_root.surface.setX(ext);
			_root.surface.setY(ext);
			
			var x = NullSurface.SIZE + gap;
			var node = rootNode.children;
			while (node != null)
			{
				var surface = node.val.surface;
				surface.setX(x + ext);
				surface.setY(ext);
				
				surface.getBound().setMinX(x);
				
				node = node.next;
				x += NullSurface.SIZE + gap;
			}
		}
	}
}

private class NullSurface extends AbstractSurface
{
	inline public static var SIZE = 50.;
	
	public function new()
	{
		super();
		
		getBound().set4(0, 0, SIZE, SIZE);
	}
	
	override public function isTouching(pointer:Pointer, sweep:Bool):Bool
	{
		return false;
	}
	
	override function _hookSyncCenter() {}
	
	override function _hookSyncSurface() {}
	
	override function _hookSyncBound() {}
}