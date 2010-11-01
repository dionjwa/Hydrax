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

package com.pblabs.engine.serialization;

   /**
    * Helper class to make sure metadata is being included.
    */
   class TestForMetadata
    {
      public function new() { }
      
      [TypeHint(type="Number")]
      public var someArray:Array<Dynamic>;
   }
