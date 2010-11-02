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

import com.pblabs.engine.core.IEntity;
import com.pblabs.engine.core.IEntityComponent;
import com.pblabs.engine.core.IPBContext;
import com.pblabs.engine.debug.Log;
import com.pblabs.engine.serialization.ISerializable;
import com.pblabs.engine.serialization.TemplateManager;
import com.pblabs.engine.serialization.TypeUtility;
import com.pblabs.util.Preconditions;
import com.pblabs.util.ReflectUtil;
import com.pblabs.util.StringUtil;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;

using StringTools;

using com.pblabs.util.StringUtil;
using com.pblabs.util.XMLUtil;

/**
 * Singleton class for serializing and deserializing objects. This class 
 * implements a default serialization behavior based on the format described
 * in the XMLFormat reference. This default behavior can be replaced on a class
 * by class basis by implementing the ISerializable interface.
 * 
 * @see ISerializable
 */
class Serializer
 {
    
    public function new()
    {
        _deserializers = Maps.newHashMap(String);
        _serializers = Maps.newHashMap(String);
        _deferredReferences = [];
        _resources = Maps.newHashMap(String);
        
        // initialize our default Serializers. Note "special" cases get a double
        // colon so there can be no overlap w/ any real type.
        _deserializers.set("::DefaultSimple", deserializeSimple);
        _deserializers.set("::DefaultComplex", deserializeComplex);
        _deserializers.set("Bool", deserializeBool);
        _deserializers.set("Array", deserializeDictionary);
        // _deserializers.set("flash.utils ::Dictionary", deserializeDictionary);
        _deserializers.set("Class", deserializeClass);
        
        _serializers.set("::DefaultSimple", serializeSimple);
        _serializers.set("::DefaultComplex", serializeComplex);
        _serializers.set("Bool", serializeBool);
        _serializers.set("Array", serializeDictionary);
        _serializers.set("flash.utils ::Dictionary", serializeDictionary);
        
        
        // // Do a quick sanity check to make sure we are getting metadata.
        // var tmd = new TestForMetadata();
        // if(TypeUtility.getTypeHint(tmd, "someArray") != "Number")
        // {
        //     // Don't error, as it makes it very hard for CS4 people to develop.
        //     Log.print(this, "Metadata is not included in this build of the engine, so serialization will not work!\n" + 
        //         "Add --keep-as3-metadata+=TypeHint,EditorData,Embed,Inject to your compiler arguments to get around this.");
        // }
    }
    
    /**
     * Serializes an object to XML. This is currently not implemented.
     * 
     * @param object The object to serialize. If this object implements ISerializable,
     * its serialize method will be called to do the serialization, otherwise the default
     * behavior will be used.
     * 
     * @return The xml describing the specified object.
     * 
     * @see ISerializable
     */
    public function serialize(object :Dynamic, xml :XML) :Void
    {
        if (Std.is(object, ISerializable)) {
            cast(object, ISerializable).serialize(xml);
        }
        else if (Std.is(object, IEntity)) {
            _currentEntity = cast(object, IEntity);
            _currentEntity.serialize(xml);
        }
        else {
            // throw "Currently all serializable objects must implement ISerializable:   " + ReflectUtil.getClassName(object);
            Log.warn("Currently all serializable objects must implement ISerializable:   " + ReflectUtil.getClassName(object));
            // // Normal case - determine type and call the right Serializer.
            // var typeName = ReflectUtil.getClassName(object);
            // if (!_serializers.exists(typeName)) {
            //     typeName = isSimpleType(object) ? "::DefaultSimple" :"::DefaultComplex";
            // }
            
            // _serializers.get(typeName)(object, xml);
        }
    }
    
    /**
     * Deserializes an object from an xml description.
     * 
     * @param object The object on which the xml description will be applied.
     * @param xml The xml to deserialize from.
     * @param typeHint For an array, dictionary, or dynamic class, a type hint can
     *                be specified as to what its children should be. Optional.
     * 
     * @return A reference to the deserialized object. This is always the same as
     * the object parameter, with the exception of types that are passed by value.
     * Code that calls this method should always use the return value rather than
     * the passed in value for this reason.
     */
    public function deserialize(context :IPBContext, object :Dynamic, xml :XML, ?typeHint :String=null) :Dynamic
    {
        trace("deserialize " + object);
        Preconditions.checkNotNull(context, "context is null");
        Preconditions.checkNotNull(object, "object is null");
        Preconditions.checkNotNull(xml, "xml is null");
        
        // Dispatch our special cases - entities and ISerializables.
        if (Std.is(object, ISerializable)) {
            return cast(object, ISerializable).deserialize(xml, context);
        }
        else if (Std.is(object, IEntity)) {
            _currentEntity = cast(object, IEntity);
            _currentEntity.deserialize(xml, true);
            resolveReferences();
            return cast(object, IEntity);
        }
        Log.warn("Currently all deserializable objects must implement ISerializable:   " + ReflectUtil.getClassName(object));
        return object;
        // throw "Currently all deserializable objects must implement ISerializable:   " + ReflectUtil.getClassName(object);
        // // Normal case - determine type and call the right Serializer.
        // var typeName = ReflectUtil.getClassName(object);
        // if (!_deserializers.exists(typeName)) {
        //     typeName = xml.hasSimpleContent() ? "::DefaultSimple" :"::DefaultComplex";
        // }
        // trace("typeName=" + typeName);
        // #if debug
        // com.pblabs.util.Assert.isNotNull(_deserializers.get(typeName), "No deserializer for " + typeName);
        // #end
        
        // return _deserializers.get(typeName)(context, object, xml, typeHint);
    }
    
    /**
     * Set the entity relative to which current serialization work is happening. Mostly for internal use.
     */
    public function setCurrentEntity(e :IEntity) :Void
    {
        _currentEntity = e;
    }
    
    /**
     * Clear the entity relative to which current serialization work is happening. Mostly for internal use.
     */
    public function clearCurrentEntity() :Void
    {
        _currentEntity = null;
    }
    
    /**
     * Not all references are resolved immediately. In order to minimize spam,
     * we only report "dangling references" at certain times. This method 
     * triggers such a report.
     */
    public function reportMissingReferences() :Void
    {
        for (reference in _deferredReferences) {
            reference.reportMissing();
        }
    }
    
    function isSimple(xml :XML, typeName :String) :Bool
    {
        // Complex content is assumed if there are child nodes in the xml, or the xml text is
        // an empty string, unless the type is a string. This is because any simple type that
        // is not a string has to have a value. Otherwise, it must be a class that doesn't have
        // its children specified.
        if (typeName == "String")
            return true;
        
        //TODO :what is the haxe version of complex content?
        if (xml.hasComplexContent())
            return false;
        
        if (xml.toString() == "")
            return false;
        
        return true;
    }
    
    function isSimpleType(object :Dynamic) :Bool
    {
        var typeName = ReflectUtil.getClassName(object);
        if (typeName == "String" || typeName == "Int" || typeName == "Float" || typeName == "Bool")
            return true;
        
        return false;
    }
    
    function deserializeSimple(context :IPBContext, object :Dynamic, xml :XML, typeHint :String) :Dynamic
    {
        // If the tag is empty and we're not a string where """ is a valid value,
        // just return that value.
        if (xml.toString() == "" && !(Std.is(object, String)))
            return object;
        
        return xml.toString();
    }
    
    function serializeSimple(object :Dynamic, xml :XML) :Void
    {
        throw "Not implemented";
        //I don't know how this is meant to workd
        // xml.addChild(Std.string(object));
    }
    
    function deserializeComplex(context :IPBContext, object :Dynamic, xml :XML, typeHint :String) :Dynamic
    {
        trace("deserializeComplex");
        
        //Haxe cannot determine  at runtime if an object implements Dynamic 
        var isDynamic = false;//Std.is(object, Array);// || (TypeUtility.isDynamic(object));// || Std.is(object, Dictionary)
        var xmlPath = "";            
        
        for (fieldXML in xml.elements()) {
            // Figure out the field we're setting, and make sure it is present.
            var fieldName :String = fieldXML.nodeName;
            
            //Currently we're not going to allow falsely capitalized field names.
            // if (!Type.getInstanceFields(Type.getClass(object)).has(fieldName) && !isDynamic) {
            //     // Try decapitalizing first letter.
            //     var decappedFieldName :String = fieldName.charAt(0).toLowerCase() + fieldName.substr(1);
                
            //     if(Type.getInstanceFields(Type.getClass(object)).has(decappedFieldName)) {
            //         fieldName = decappedFieldName;
            //     }
            //     else {
            //         // Last chance - try to find a match with differing case!
            //         var foundOffcaseMatch :Bool = false;
                    
            //         for (potentialField in Reflect.fields(object)) {
            //             if (potentialField.toLowerCase() != fieldName.toLowerCase()){
            //                 continue;
            //             }
                        
            //             fieldName = potentialField;
            //             foundOffcaseMatch = true;
            //             break;
            //         }
                    
            //         if(foundOffcaseMatch == false) {
            //             xmlPath = reportXMLPath(fieldXML);
            //             Log.warn("The field '" + fieldName + "' does not exist on the class " + ReflectUtil.getClassName(object) + ". " + xmlPath);
            //             continue;
            //         }                    
                    
            //     }
            // }
            
            // Determine the type.
            var typeName :String = fieldXML.get("type");
            if (typeName.length < 1) {
                var cls = ReflectUtil.getVarFieldType(object, fieldName);
                if (cls != null) {
                    typeName = Type.getClassName(cls);
                }
                // typeName = ReflectUtil.getVarFieldType(object, fieldName);
            }
            // if (isDynamic && typeName == null)
            //     typeName = "String";
            
            // deserialize into the child.
            if (!getChildReference(context, object, fieldName, fieldXML) 
                && !getResourceObject(context, object, fieldName, fieldXML))
            {
                var child :Dynamic = getChildObject(context, object, fieldName, typeName, fieldXML);
                if (child != null) {
                    // Deal with typehints.
                    // var childTypeHint :String = null;//TypeUtility.getTypeHint(object, fieldName);
                    // child = deserialize(context, child, fieldXML, childTypeHint);
                    Log.error("The field " + fieldName + " of type " + typeName + " could not be instantiated");
                    continue;
                }
                
                // Assign the new value.
                try {
                    ReflectUtil.setField(object, fieldName, child);
                    // object[fieldName] = child;
                } catch(e :Dynamic) {
                    xmlPath = reportXMLPath(fieldXML);
                    Log.error("The field " + fieldName + " could not be set to '" + child + "' due to :" + e.toString() + " " + xmlPath);
                }
            }
        }
        
        return object;
    }
    
    /**
     * Given an XML element, walk up its parent references and show the path
     * in the document, including any name attributes.
     */
    public function reportXMLPath(item :Dynamic) :String
    {
        // Report each tag and its name attribute if any.
        var path :String = "(";
        
        var stack :Array<Dynamic> = [];
        var itemWalk :Dynamic = item;
        while(itemWalk)
        {
            stack.unshift(itemWalk);
            itemWalk = itemWalk.parent();
        }
        
        for(i in 0...stack.length)
        {
            var x :Dynamic = stack[i];
            
            path += "<" + x.name().toString();
            
            if(x.hasOwnProperty("@name"))
                path += " name=\"" + x.get("name") + "\"";
            
            path += ">";
            
            if(i < stack.length-1)
                path += " --> ";
        }
        
        path += ")";
        
        return path;
    }
    
    function serializeComplex(object :Dynamic, xml :XML) :Void
    {
        if (object == null) { 
            return;
        }
        
        for (fieldName in Type.getClassFields(ReflectUtil.getClass(object))) {
            //Ignore internal fields and property getter/setters
            if (fieldName.startsWith("_") || fieldName.startsWith("get_") || fieldName.startsWith("set_")) {
                continue;
            }
            if (Reflect.isFunction(Reflect.field(object, fieldName))) {
                continue;
            }
            // switch (
        }
        
        // var classDescription :XML = TypeUtility.getTypeDescription(object);
        // for (property in classDescription.child("accessor")) {
        //     if(property.get("access") == "readwrite") {
        //         // Get property info
        //         var propertyName :String = property.get("name");
                
        //         // Only serialize properties, that aren't null
        //         if(object[propertyName] != null) {
        //             var propertyXML :XML = serializeProperty(object, propertyName);
        //             if(propertyXML != null)
        //             {
        //                 xml.addChild(propertyXML);
        //             }
        //         }
        //     }
        // }
        
        // for (field in classDescription.child("variable"))
        // {
        //     var fieldName :String = field.get("name"); 
            
        //     // Only serialize variables, that aren't null
        //     if(object[fieldName] != null)
        //     {
        //         var fieldXML :XML = serializeProperty(object, fieldName);
        //         if(fieldXML != null)
        //         {
        //             xml.addChild(fieldXML);
        //         }                
        //     }
        // }
    }
    
    function serializeProperty (object :Dynamic, propertyName :String) :XML
    {
        // var propertyXML :XML = Xml.parse("<{propertyName}/>");
        var propertyXML = Xml.parse("<" + propertyName + "/>");
        // var data :XML = TypeUtility.getEditorData(object, propertyName);
        
        // //TODO :this is all flash specific
        // // Deal with "dynamic" typehints.
        // var typeHint :String = TypeUtility.getTypeHint(object, propertyName);
        // if(typeHint && typeHint == "dynamic")
        // {
        //     if (!isNaN(object[propertyName]))
        //     {
        //         // Is a number...
        //         propertyXML.get("type") = getQualifiedClassName(1.0); 
        //     }
        //     else
        //     {
        //         propertyXML.get("type") = getQualifiedClassName(object[propertyName]); 
        //     }
        // }
        
        
        // //Note (giggsy) :I don't know why, but this code suddenly didn't compile anymore with FlashDevelop,
        // //so I did the rewrite below :/
        // //var ignore :XMLList = data ? data.arg.(@key == "ignore") :null;
        // //if (ignore && ignore.get("value").toString() == "true") 
        // //   return null;
        
        // // If this field is set to ignore, then ignore it
        // if(data != null) {
        //     //TODO :translate this
        //     throw "Not implemented";
        //     // var ignore :XMLList = data.arg.(@key == "ignore");
        //     // if(ignore && ignore.get("value").toString() == "true") 
        //     //     return null;
        // }
        
        
        // // Either make a reference or try to serialize
        // if (!setChildReference(object, ReflectUtil.field(object, propertyName), propertyXML))
        // {
        //     // OK, we do need to serialize
        //     serialize(ReflectUtil.field(object, propertyName), propertyXML);
            
        //     // If the value is the same as the defaultValue, ignore it
        //     // TODO :Handle simple arrays or structures like Points
        //     var defaultValue :XMLList = data ? data.arg.(@key == "defaultValue") :null;
        //     if (defaultValue && object[propertyName].toString() == defaultValue.get("value").toString()) 
        //         return null;
        // }
        
        return propertyXML;
    }
    
    function deserializeBool(context :IPBContext, object :Dynamic, xml :XML, typeHint :String) :Dynamic
    {
        return (xml.toString() == "true");
    }
    
    function serializeBool(object :Dynamic, xml :XML) :Void
    {
        if (object)
            xml.addChild(Xml.createPCData("true"));
        else
            xml.addChild(Xml.createPCData("false"));
    }
    
    function deserializeDictionary(context :IPBContext, object :Dynamic, xml :XML, typeHint :String) :Dynamic
    {
        throw "Not implemented";
        // for each (var childXML :XML in xml.*)
        // {
        //     // Where are we assigning this item?
        //     var key :String = childXML.name().toString();
            
        //     // Deal with escaping numbers and the "add to end" behavior.
        //     if (key.charAt(0) == "_")
        //         key = key.slice(1);
            
        //     // Might be invalid...
        //     if ((key.length < 1) && !(Std.is(object, Array)))
        //     {
        //         var xmlPath :String = reportXMLPath(childXML);
        //         Log.error(object, "deserialize", "Cannot add a value to a dictionary without a key. " + xmlPath);
        //         continue;
        //     }
            
        //     // Infer the type.
        //     var typeName :String = childXML.get("type");
        //     if (typeName.length < 1)
        //         typeName = xml.get("childType");
            
        //     if (typeName == null || typeName == "")
        //         typeName = typeHint ? typeHint :"String";
            
        //     // deserialize the value.
        //     if (!getChildReference(context, object, key, childXML) 
        //         || !getResourceObject(context, object, key, childXML, typeHint))
        //     {
        //         var value :Dynamic = getChildObject(object, key, typeName, childXML);
        //         if (value != null)
        //             value = deserialize(context, value, childXML);
                
        //         // Assign, either to key or to end of array.
        //         if (key.length > 0)
        //             object[key] = value;
        //         else
        //             (cast(object, Array)).push(value);
        //     }
        // }
        
        return object;
    }
    
    function serializeDictionary(object :Dynamic, xml :XML) :Void
    {
        throw "Not implemented";
        // if (object == null)
        //     return;
        
        // // Decide if they all share the same type
        // var hasType :Bool = true;
        // var anyChild :Dynamic = null;
        // for (child in object)
        // {
        //     if (anyChild == null)
        //         anyChild = child;
        //     else if (child != null && TypeUtility.getClass(child) != TypeUtility.getClass(anyChild))
        //         hasType = false;
        // }
        // // If it's empty, we're done
        // if (anyChild == null)
        //     return;
        
        // // Assign child type, if any
        // if (hasType)
        //     xml.get("childType") = ReflectUtil.getClassName(anyChild).replace(~/::/,"."); 
        
        // // Now write all children
        // for (var element :Dynamic in object)
        // {
        //     // Get the information
        //     var propertyName :String = (Std.is(object, Dictionary)) ? element :"_";
        //     var propertyValue :Dynamic = object[element];
        //     var propertyXML :XML = Xml.parse("<{propertyName}/>");
            
        //     // Write type
        //     if (!hasType)
        //         propertyXML.get("type") = ReflectUtil.getClassName(propertyValue).replace(~/::/,"."); 
            
        //     // Write non-entities, or reference entities
        //     if (!setChildReference(object, propertyValue, propertyXML))
        //         serialize(propertyValue, propertyXML);
            
        //     // Save
        //     xml.addChild(propertyXML);
        // }
    }
    
    function deserializeClass(context :IPBContext, object :Dynamic, xml :XML, typeHint :String) :Dynamic
    {
        return Type.resolveClass(xml.nodeValue);
    }
    
    /**
     * A tag can have attributes which encode references of various types. This method
     * parses them and resolves the references.
     */ 
    function getChildReference(context :IPBContext, object :Dynamic, fieldName :String, xml :XML) :Bool
    {
        var nameReference :String = xml.get("nameReference");
        var componentReference :String = xml.get("componentReference");
        if(componentReference == null) {
            componentReference = xml.get("entityName");
        }
        
        var componentName :String = xml.get("componentName");
        var objectReference :String = xml.get("objectReference");
        
        if (nameReference != "" || componentReference != "" || componentName != "" || objectReference != "")
        {
            var reference :ReferenceNote = new ReferenceNote();
            reference.context = context;
            reference.owner = object;
            reference.fieldName = fieldName;
            reference.nameReference = nameReference;
            reference.componentReference = componentReference;
            reference.componentName = componentName;
            reference.objectReference = objectReference;
            reference.currentEntity = _currentEntity;
            
            if (!reference.resolve())
                _deferredReferences.push(reference);
            
            return true;
        }
        
        return false;
    }
    
    /**
     * A tag can have attributes which encode references of various types. This method
     * parses them and resolves the references.
     */ 
    function setChildReference(object :Dynamic, reference :Dynamic, xml :XML) :Bool
    {
        // Write entity reference
        if (Std.is(reference, IEntity)) {
            xml.set("nameReference", cast(reference, IEntity).name);
            // xml.get("nameReference") = (cast(reference, IEntity)).name; 
            return true;
        }
        // Write component reference
        if (Std.is(reference, IEntityComponent)) {
            xml.set("entityName", cast(reference, IEntityComponent).owner.name);
            xml.set("componentName", cast(reference, IEntityComponent).name);
            
            // xml.get("entityName") = (cast(reference, IEntityComponent)).owner.name; 
            // xml.get("componentName") = (cast(reference, IEntityComponent)).name; 
            return true;
        }
        return false;
    }
    
    /**
     * Find or instantiate the value that should go in a named field on an object.
     * 
     * @param object The object which will have the object assigned.
     * @param fieldName The field on the object we are working with.
     * @param typeName The desired type; if different than what is there we replace
     *                 the existing interface.
     */
    function getChildObject(context :IPBContext, object :Dynamic, fieldName :String, typeName :String, fieldXml :XML) :Dynamic
    {
        // Get the child object, if it is present.
        var childObject :Dynamic = null;
        try {
            childObject = ReflectUtil.field(object, fieldName); 
        } catch(e :Dynamic) {
        }
        
        // If requested type isn't the same as what we found, reset the object.
        var desiredType = Type.resolveClass(typeName);
        if (childObject == null || !(Std.is(childObject, desiredType))) {
            // childObject = Type.createInstance(Type.resolveClass(typeName), EMPTY_ARRAY);
            childObject = context.allocate(Type.resolveClass(typeName));
        }
        
        // Note we want to check for null here; null is distinct from coerce-to-false.
        if (childObject == null) {
            var xmlPath :String = reportXMLPath(fieldXml);
            Log.error("Unable to create type " + typeName + " for the field " + fieldName + ". " + xmlPath);
            return null;
        }
        
        return childObject;
    }
    
    function getResourceObject(context :IPBContext, object :Dynamic, fieldName :String, xml :XML, ?typeHint :String = null) :Bool
    {
        var filename :String = xml.get("filename");
        
        // If attribute is not found, there might be a child tag (depending on what serializer is used.
        if(filename.isBlank()) {
            filename = xml.child("filename").nodeValue;
        }
        
        if(filename.isBlank())
            return false;
        
        var type :Class<Dynamic> = null;
        if(typeHint != null) {
            type = Type.resolveClass(typeHint);
        }
        else {
            type = ReflectUtil.getVarFieldType(object, fieldName);//Type.resolveClass(TypeUtility.getFieldType(object, fieldName));
        }
        
        var resource = new ResourceNote();
        resource.context = context;
        resource.owner = object;
        resource.fieldName = fieldName;
        resource.load(filename, type);
        
        // we have to hang on to these so they don't get garbage collected
        _resources.set(filename, resource);
        return true;
    }
    
    // internal doesn't work here for some reason. It's just being referenced in the ResourceNote support class
    public function removeResource(filename :String) :Void
    {
        _resources.remove(filename);
    }
    
    public function resolveReferences() :Void
    {
        var i = 0;
        while (i < _deferredReferences.length) {
            var reference = _deferredReferences[i];
            if (!reference.resolve()) {
                i++;
            } else {
                _deferredReferences.splice(i, 1);
            }
        }
        // for (i in 0..._deferredReferences.length)
        // {
        //     var reference :ReferenceNote = _deferredReferences[i];
        //     if (!reference.resolve())
        //         continue;

        //     _deferredReferences.splice(i, 1);
        //     i--;
        // }
    }
    
    var _currentEntity :IEntity;
    var _serializers :Map<String, Dynamic->XML->Void>;
    var _deserializers :Map<String, IPBContext->Dynamic->XML->String->Dynamic>;
    var _deferredReferences :Array<ReferenceNote>;
    var _resources :Map<String, ResourceNote>;
    
    static var EMPTY_ARRAY :Array<Dynamic> = [];
}

private class ResourceNote
{
    public var context :IPBContext;
    public var owner :Dynamic;
    public var fieldName :String;
    
    public function new () {}
    
    
    public function load(filename :String, type :Class<Dynamic>) :Void
    {
        throw "Not implemented";
        // var resource :Resource = context.getManager(IResourceManager).load(filename, type, onLoaded, onFailed);
        
        // if(resource)
        //     owner[fieldName] = resource;
    }
    
    // public function onLoaded(resource :Resource) :Void
    // {
    //     context.getManager(Serializer).removeResource(resource.filename);
    // }
    
    // public function onFailed(resource :Resource) :Void
    // {
    //     Log.error(owner, "set " + fieldName, "No resource was found with filename " + resource.filename + ".");
    //     context.getManager(Serializer).removeResource(resource.filename);
    // }
    
}

private class ReferenceNote
{
    public var context :IPBContext;
    public var owner :Dynamic;
    public var fieldName :String;
    public var nameReference :String;
    public var componentReference :String;
    public var componentName :String;
    public var objectReference :String;
    public var currentEntity :IEntity;
    public var reportedMissing :Bool;
    
    public function new ()
    {
        reportedMissing = false;
    }
    
    
    public function resolve() :Bool
    {
        // Look up by name.
        if (!StringUtil.isBlank(nameReference)) {
            var namedObject :IEntity = context.lookupEntity(nameReference);
            if (namedObject == null)
                return false;
            
            ReflectUtil.setField(owner, fieldName, namedObject);
            reportSuccess();
            return true;
        }
        
        // Look up a component on a named object by name (first) or type (second).
        if (!StringUtil.isBlank(componentReference)) {
            var componentObject :IEntity = context.lookupEntity(componentReference);
            if (null == componentObject)
                return false;
            
            var component :IEntityComponent = null;
            if (!StringUtil.isBlank(componentName)) {
                component = componentObject.lookupComponentByName(componentName);
                if (null == component)
                    return false;
            }
            else {
                var componentType = ReflectUtil.getVarFieldType(ReflectUtil.getClass(owner), fieldName);//TypeUtility.getFieldType(owner, fieldName);
                component = componentObject.lookupComponentByType(componentType);
                if (null == component)
                    return false;
            }
            
            ReflectUtil.setField(owner, fieldName, component);
            reportSuccess();
            return true;
        }
        
        // Component reference on the entity being deserialized when the reference was created.
        if (!StringUtil.isBlank(componentName))
        {
            var localComponent :IEntityComponent = currentEntity.lookupComponentByName(componentName);
            if (null == localComponent)
                return false;
            
            ReflectUtil.setField(owner, fieldName, localComponent);
            reportSuccess();
            return true;
        }
        
        // Or instantiate a new entity.
        if (!StringUtil.isBlank(objectReference)) {
            ReflectUtil.setField(owner, fieldName, context.getManager(TemplateManager).instantiateEntity(objectReference, context));
            
            // owner[fieldName] = context.getManager(TemplateManager).instantiateEntity(objectReference);
            reportSuccess();
            return true;
        }
        
        // Nope, none of the above!
        return false;
    }
    
    /**
     * Trigger a console report about any references that haven't been resolved.
     */
    public function reportMissing() :Void
    {
        // Don't spam.
        if(reportedMissing)
            return;
        reportedMissing = true;
        
        var firstPart = owner.toString() + "[" + fieldName + "] on entity '" + currentEntity.name + "' - ";
        
        // Name reference.
        if(nameReference != null) {
            Log.warn(firstPart + "Couldn't resolve reference to named entity '" + nameReference + "'");
            return; 
        }
        
        // Look up a component on a named object by name (first) or type (second).
        if (componentReference != "") {
            Log.warn(firstPart + " Couldn't find named entity '" + componentReference + "'");
            return;
        }
        
        // Component reference on the entity being deserialized when the reference was created.
        if (componentName != "") {
            Log.warn(firstPart + " Couldn't find component on same entity named '" + componentName + "'");
            return;
        }
    }
    
    function reportSuccess() :Void
    {
        // If we succeeded with no spam then be quiet on success too.
        if(!reportedMissing)
            return;
        
        var firstPart = owner.toString() + "[" + fieldName + "] on entity '" + currentEntity.name + "' - ";
        
        // Name reference.
        if(nameReference != null) {
            Log.warn(firstPart + " After failure, was able to resolve reference to named entity '" + nameReference + "'");
            return; 
        }
        
        // Look up a component on a named object by name (first) or type (second).
        if (!StringUtil.isBlank(componentReference)) {
            Log.warn(firstPart + " After failure, was able to find named entity '" + componentReference + "'");
            return;
        }
        
        // Component reference on the entity being deserialized when the reference was created.
        if (!StringUtil.isBlank(componentName)) {
            Log.warn(firstPart + " After failure, was able to find component on same entity named '" + componentName + "'");
            return;
        }
    }
}


