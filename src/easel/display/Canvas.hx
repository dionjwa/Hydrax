/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file was derived from source code from the easel library:
 * http://github.com/aduros/easel
 * Copyright (C) 2010 Bruno Garcia
 *
 * Currently no license is listed for the easel library, so for now, this 
 * code takes on the project default license.
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package easel.display;

typedef Canvas = {#if js > js.HtmlDom, #end
	var width :Int;
	var height :Int;

	function getContext (type :String) :Context2d;
}
