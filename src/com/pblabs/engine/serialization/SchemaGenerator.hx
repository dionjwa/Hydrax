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

   import com.pblabs.engine.debug.Log;
   import com.pblabs.engine.PBE;
   
   import flash.events.StatusEvent;
   import flash.net.LocalConnection;
   import flash.utils.Dictionary;
   import flash.utils.describeType;
   import flash.utils.getDefinitionByName;

   /**
    * This class generates a schema file for the application so it can be edited by
    * the PBEditor. Classes to generate schema data for are enumerated from the
    * TypeReference class. By default, this is only run when launched from the
    * PBEngineManager, which does so by adding '?generateSchema=1' to the url.
    */
   class SchemaGenerator
    {
      /**
       * The singleton instance.
       */
      
      public var instance(getInstance, null) : SchemaGenerator;
      /**
       * The singleton instance.
       */
      public static function getInstance():SchemaGenerator
      {
         if (!_instance)
            _instance = new SchemaGenerator();
         
         return _instance;
      }
      
      static var _instance:SchemaGenerator = null;
      
      public function new()
      {
         // need these built in flash classes - there's probably more we should have
         addClassName("flash.geom.Point");
         addClassName("flash.geom.Rectangle");
         addClassName("Array");
         addClassName("flash.utils.Dictionary");
         addClassName("int");
         addClassName("uint");
         addClassName("Number");
         addClassName("Boolean");
         addClassName("String");
      }
      
      /**
       * Adds a class to be included in the schema. The TypeReference class automatically
       * adds classes it is given.
       */
      public function addClass(className:String, classObject:Class<Dynamic>):Void
      {
         _classes[className.replace("::", ".")] = classObject;
      }
      
      /**
       * Adds a class to be included in the schema.
       */
      public function addClassName(className:String):Void
      {
         addClass(className, cast( getDefinitionByName(className), Class));
      }
      
      /**
       * Generates the actual schema data by passing the describeType output over a
       * LocalConnection. The connection is named _SchemaConnection and supplies data
       * to the OnSchemaReceived method. This method should receive two parameters.
       * The first contains the type of message being sent, and the second contains
       * the data. Valid message types are:
       * 
       * <ul>
       * <li>START - Called before any other data is sent. No data is sent with this message.</li>
       * <li>ERROR - Called to indicate an error in sending data. The data contains the error message.</li>
       * <li>TYPE - Called to specify that the data contains the schema for a type.</li>
       * <li>END - Called when all schema data has been sent. No data is sent with this message.</li>
       * </ul>
       */
      public function generateSchema():Void
      {
         if (context.IS_SHIPPING_BUILD)
            return;
         
         _connection = new LocalConnection();
         _connection.addEventListener(StatusEvent.STATUS, onConnectionStatus);
         _connection.send("_SchemaConnection", "OnSchemaReceived", "START", "");
         
         _failed = false;
         
         var dependentClasses:Dictionary = new Dictionary();
         for (classObject in _classes)
         {
            var description:XML = describeType(classObject);
            
            // if this throws an exception, it's because the description is larger than 40k
            try
            {
               Log.print(this, "Sending schema data for " + description.@name);
               _connection.send("_SchemaConnection", "OnSchemaReceived", "TYPE", description.toString());
            }
            catch (error:Error)
            {
               _connection.send("_SchemaConnection", "OnSchemaReceived", "ERROR", "Schema data for " + description.@name + " is too big!");
               Log.error(this, "GenerateSchema", "Schema data for " + description.@name + " is too big!");
            }
         }
         
         _connection.send("_SchemaConnection", "OnSchemaReceived", "END", "");
      }
      
      function onConnectionStatus(event:StatusEvent):Void
      {
         // if things already failed, it doesn't need to be reported again
         if (_failed)
            return;
         
         switch (event.level)
         {
            case "error":
               _failed = true;
               break;
         }
         
         if (_failed)
            Log.error(this, "GenerateSchema", "Schema generation failed!");
      }
      
      var _failed:Bool;
      var _classes:Dictionary;
      var _connection:LocalConnection;
   }
