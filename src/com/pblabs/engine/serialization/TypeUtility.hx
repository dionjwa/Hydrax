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


/**
 * TypeUtility is a static class containing methods that aid in type
 * introspection and reflection.
 */
class TypeUtility
 {
	// /**
	//  * Registers a function that will be called when the specified type needs to be
	//  * instantiated. The function should return an instance of the specified type.
	//  * 
	//  * @param typeName The name of the type the specified function should handle.
	//  * @param instantiator The function that instantiates the specified type.
	//  */
	// public function new() { }
	
	// /**
	//  * Registers a function that will be called when the specified type needs to be
	//  * instantiated. The function should return an instance of the specified type.
	//  * 
	//  * @param typeName The name of the type the specified function should handle.
	//  * @param instantiator The function that instantiates the specified type.
	//  */
	// public static function registerInstantiator(typeName:String, instantiator:Dynamic):Void
	// {
	//	 if (_instantiators[typeName])
	//		 Log.warn("TypeUtility", "RegisterInstantiator", "An instantiator for " + typeName + " has already been registered. It will be replaced.");
		
	//	 _instantiators[typeName] = instantiator;
	// }
	
	// /**
	//  * Returns the fully qualified name of the type
	//  * of the passed in object.
	//  * 
	//  * @param object The object whose type is being retrieved.
	//  * 
	//  * @return The name of the specified object's type.
	//  */
	// public static function getObjectClassName(object:Dynamic):String
	// {
	//	 return flash.utils.getQualifiedClassName(object);
	// }
	
	// /**
	//  * Returns the Class object for the given class.
	//  * 
	//  * @param className The fully qualified name of the class being looked up.
	//  * 
	//  * @return The Class object of the specified class, or null if wasn't found.
	//  */
	// public static function getClassFromName(className:String):Class<Dynamic>
	// {
	//	 return cast( getDefinitionByName(className), Class);
	// }
	
	// public static function getClass(item:Dynamic):Class<Dynamic>
	// {
	//	 if(Std.is( item, Class) || item == null)
	//		 return item;
		
	//	 return Object(item).constructor;
	// }
	
	// /**
	//  * Creates an instance of a type based on its name.
	//  * 
	//  * @param className The name of the class to instantiate.
	//  * 
	//  * @return An instance of the class, or null if instantiation failed.
	//  */
	// public static function instantiate(className:String, ?suppressError:Bool = false):Dynamic
	// {
	//	 throw "Not implemented";
	//	 // // Deal with strings explicitly as they are a primitive.
	//	 // if (className == "String")
	//	 //	 return "";

	//	 // // Class is also a primitive type.
	//	 // if(className == "Class")
	//	 //	 return Class;
		
	//	 // // Check for overrides.
	//	 // if (_instantiators[className])
	//	 //	 return _instantiators[className]();
		
	//	 // // Give it a shot!
	//	 // try
	//	 // {
	//	 //	 return new (getDefinitionByName(className));
	//	 // }
	//	 // catch (e:Error)
	//	 // {
	//	 //	 if(!suppressError)
	//	 //	 {
	//	 //		 Log.warn(null, "Instantiate", "Failed to instantiate " + className + " due to " + e.toString());
	//	 //		 Log.warn(null, "Instantiate", "Is " + className + " included in your SWF? Make sure you call context.registerType(" + className + "); somewhere in your project.");				 
	//	 //	 }
	//	 // }
		
	//	 // // If we get here, couldn't new it.
	//	 return null;
	// }
	
	// /**
	//  * Gets the type of a field as a string for a specific field on an object.
	//  * 
	//  * @param object The object on which the field exists.
	//  * @param field The name of the field whose type is being looked up.
	//  * 
	//  * @return The fully qualified name of the type of the specified field, or
	//  * null if the field wasn't found.
	//  */
	// public static function getFieldType(object:Dynamic, field:String):String
	// {
	//	 var typeXML:XML = getTypeDescription(object);
		
	//	 // Look for a matching accessor.
	//	 for (property in typeXML.child("accessor"))
	//	 {
	//		 if (property.attribute("name") == field)
	//			 return property.attribute("type");
	//	 }
		
	//	 // Look for a matching variable.
	//	 for (variable in typeXML.child("variable"))
	//	 {
	//		 if (variable.attribute("name") == field)
	//			 return variable.attribute("type");
	//	 }
		
	//	 return null;
	// }
	
	// /**
	//  * Determines if an object is an instance of a dynamic class.
	//  * 
	//  * @param object The object to check.
	//  * 
	//  * @return True if the object is dynamic, false otherwise.
	//  */
	// public static function isDynamic(object:Dynamic):Bool
	// {
	//	 if (Std.is( object, Class))
	//	 {
	//		 Log.error(object, "isDynamic", "The object is a Class type, which is always dynamic");
	//		 return true;
	//	 }
		
	//	 var typeXml:XML = getTypeDescription(object);
	//	 return typeXml.@isDynamic == "true";
	// }
	
	/**
	 * Determine the type, specified by metadata, for a container class like an Array.
	 */
	// public static function getTypeHint(object:Dynamic, field:String):String
	// {
	//	 var description:XML = getTypeDescription(object);
	//	 if (!description)
	//		 return null;
		
	//	 for each (var variable:XML in description.*)
	//	 {
	//		 // Skip if it's not the field we want.
	//		 if (variable.@name != field)
	//			 continue;
			
	//		 // Only check variables/accessors.
	//		 if (variable.name() != "variable" && variable.name() != "accessor")
	//			 continue;
			
	//		 // Scan for TypeHint metadata.
	//		 for each (var metadataXML:XML in variable.*)
	//		 {
	//			 if(metadataXML.@name == "TypeHint")
	//			 {
	//				 var value:String = metadataXML.arg.@value.toString();
					
	//				 return value;
	//				 /*
	//				 if (value == "dynamic")
	//				 {
	//					 if (!isNaN(object[field]))
	//					 {
	//						 // Is a number...
	//						 return getQualifiedClassName(1.0);
	//					 }
	//					 else
	//					 {
	//						 return getQualifiedClassName(object[field]);
	//					 }
	//				 }
	//				 else
	//				 {
	//					 return value;
	//				 }
	//				 */
	//			 }
	//		 }
	//	 }
		
	//	 return null;
	// }
	  
	// /**
	//  * Get the xml for the metadata of the field.
	//  */
	// public static function getEditorData(object:Dynamic, field:String):XML
	// {
	//	 var description:XML = getTypeDescription(object);
	//	 if (!description)
	//		 return null;
		
	//	 for each (var variable:XML in description.*)
	//	 {
	//		 // Skip if it's not the field we want.
	//		 if (variable.@name != field)
	//			 continue;
			
	//		 // Only check variables/accessors.
	//		 if (variable.name() != "variable" && variable.name() != "accessor")
	//			 continue;
			
	//		 // Scan for EditorData metadata.
	//		 for each (var metadataXML:XML in variable.*)
	//		 {
	//			 if (metadataXML.@name == "EditorData")
	//				 return metadataXML;
	//		 }
	//	 }
	//	 return null;
	// }
	
	// /**
	//  * Gets the xml description of an object's type through a call to the
	//  * flash.utils.describeType method. Results are cached, so only the first
	//  * call will impact performance.
	//  * 
	//  * @param object The object to describe.
	//  * 
	//  * @return The xml description of the object.
	//  */
	// public static function getTypeDescription(object:Dynamic):XML
	// {
	//	 var className:String = getObjectClassName(object);
	//	 if (!_typeDescriptions[className])
	//		 _typeDescriptions[className] = describeType(object);
		
	//	 return _typeDescriptions[className];
	// }
	
	// /**
	//  * Gets the xml description of a class through a call to the
	//  * flash.utils.describeType method. Results are cached, so only the first
	//  * call will impact performance.
	//  * 
	//  * @param className The name of the class to describe.
	//  * 
	//  * @return The xml description of the class.
	//  */
	// public static function getClassDescription(className:String):XML
	// {
	//	 if (!_typeDescriptions[className])
	//	 {
	//		 try
	//		 {
	//			 _typeDescriptions[className] = describeType(getDefinitionByName(className));
	//		 }
	//		 catch (error:Error)
	//		 {
	//			 return null;
	//		 }
	//	 }
		
	//	 return _typeDescriptions[className];
	// }
	
	// public static function getListOfPublicFields(object:Dynamic):Array<Dynamic>
	// {
	//	 var fields:Array<Dynamic> = [];
		
	//	 if(object == null || object == undefined)
	//		 return fields;
		
	//	 // Get the list of public fields.
	//	 var sourceFields:XML = getTypeDescription(object);
		
	//	 for each(var fieldInfo:XML in sourceFields.*)
	//	 {
	//		 // Skip anything that is not a field.
	//		 if(fieldInfo.name() != "variable" && fieldInfo.name() != "accessor")
	//			 continue;
			
	//		 // Skip write-only stuff.
	//		 if(fieldInfo.@access == "writeonly")
	//			 continue;
			
	//		 var fieldName:String = fieldInfo.@name;
	//		 fields.push(fieldName);
	//	 }
		
	//	 // Deal with dynamic fields, too.
	//	 for(var field:String in object)
	//		 fields.push(field);
		
	//	 return fields;
	// }
	
	// static var _typeDescriptions:Dictionary = new Dictionary();
	// static var _instantiators:Dictionary = new Dictionary();
}
