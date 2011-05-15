// <source lang="javascript">
/*
   Utilities - various utility functions

   Author: [[User:Lupo]], October 2007 - February 2009
   License: Quadruple licensed GFDL, GPL, LGPL and Creative Commons Attribution 3.0 (CC-BY-3.0)

   Usage note: script loading through importScript is asynchronous. Therefore, use these
   functions only in code that runs once you can be certain that loading this script has
   finished. That means: code executed through an addOnloadHandler or even later through
   some user interaction (link or button clicked), but not in global inline JS. Doing

   importScript ('MediaWiki:Utilities.js');
   if (userIsInGroup ('sysop')) {
     // Something
   }

   won't work because at the "if"-statement, this script here has not finished loading yet
   and function "userIsInGroup" isn't defined yet. However,

   importScript ('MediaWiki:Utilities.js');

   function myStuff () {
     if (userIsInGroup ('sysop')) {
       // Something
     }
   }

   addOnloadHandler (myStuff);

   should work.
*/

// makeRawLink
//   Creates a link with given url, display name, and target frame name. Equivalent to
//   <a href="url" target="target">name</a> in XHTML.
//
// Parameters:
//   name             String    Display text for the link to be created
//   url              String    URL for the HREF of the link
//   target  optional String    If set, defines the target attribute of the link
//   tooltip optional String    If set, defines the title attribute of the link
function makeRawLink (name, url, target, tooltip)
{
  var link = document.createElement('a');
  link.href = url;
  if (target) link.target = target;
  if (tooltip) link.title = tooltip;
  link.appendChild(document.createTextNode(name));
  return link;
}

// makeWikiLink
//   Create a simple link to a wiki page
//
// Parameters:
//   name            String    Display text for the link to be created
//   url             String    Wiki-name of the page to link
function makeWikiLink (name, url, target, tooltip)
{
  return makeRawLink (name, wgArticlePath.replace ('$1', url), target, tooltip);
}

// makeActiveLink
//   Create a link that executes some Javascript when clicked
//
// Parameters:
//   name            String    Display text for the link to be created
//   script          String    The Javascript code to be executed
function makeActiveLink (name, script, tooltip)
{
  var link = makeRawLink (name, 'javascript:' + script, null, tooltip);
  return link;
}

// makeTab
//   Create and add a new tab to a page.
//
// Parameters:
//   lk          DOM element  Link for the tab (for instance, obtained using makeRawLink)
//   id optional String       Optional id for the new tab
function makeTab (lk, id)
{
  var li = document.createElement('li');
  if (id) li.id = id;
  li.appendChild(lk);

  var ul = document.getElementById ('p-cactions')
                   .getElementsByTagName ('div')[0]
                   .getElementsByTagName ('ul')[0];
  ul.appendChild (li);
}

// setEditSummary
//   If called on a page containing an editform, set the edit summary to "text"
//
// Parameters:
//   text            String    The edit summary text
function setEditSummary (text)
{
  if (document.editform == null || document.editform.wpSummary == null) return;
  var summary = document.editform.wpSummary.value;
  if (summary == null || summary.length == 0)
    document.editform.wpSummary.value = text;
  else {
    if (/\*\/\s*$/.test (summary)) {
      document.editform.wpSummary.value = document.editform.wpSummary.value + text;
    } else {
      document.editform.wpSummary.value = document.editform.wpSummary.value + " & "
                                        + new String (text.charAt (0)).toLowerCase ()
                                        + text.substring (1);
    }
  }
}

// userIsInGroup
//   Returns true if the current user is in the given user group. The function checks
//   wgUserGroup to determine this.
//
// Parameters:
//   group  optional String  The user group to test for. If null or an empty string, defaults
//                           to '*'.
function userIsInGroup (group)
{
  if (wgUserGroups) {
    if (!group || group.length == 0) group = '*';
    return wgUserGroups.join (' ').indexOf (group) >= 0;
  }
  return false;
}

// Same for global groups
function userIsInGlobalGroup (group)
{
  if (wgGlobalGroups) {
    if (!group || group.length == 0) group = '*';
    return wgGlobalGroups.join (' ').indexOf (group) >= 0;
  }
  return false;
}

// getElementsByTagNameStatic
//   Same as node.getElementsByTagName, but returns a non-live collection (as an array) of
//   DOM elements.
//
// Parameters:
//   tag_name  optional String      The tag name of the elements to include in the collection.
//                                  If null or the empty string, defaults to '*'
//   node      optional DOM element The root of the subtree to process. If null, defaults to
//                                  document.
function getElementsByTagNameStatic (tag_name, node)
{
  var elem = node;
  if (!elem) elem = document;
  var name = tag_name;
  if (!name || name.length == 0) name = '*';
  var tmp = elem.getElementsByTagName (name);
  // tmp is a "live" NodeList, see http://www.w3.org/TR/DOM-Level-2-Core/core.html#td-live
  // Changes in the DOM tree are automatically reflected in this list. Make a static copy
  // of this list (as an array) to avoid this. Note that tmp is *not* an Array, hence we
  // cannot use return tmp.slice() to create the copy.
  var result = new Array (tmp.length);
  for (var i=0; i < tmp.length; i++)
    result[i] = tmp[i];
  // Pre-allocating the array to the correct length is faster than new Array() and using
  // result.push (tmp[i]) in the loop. (No surprise here...)
  return result;
}

// replaceVars
//   Replace all occurrences of a "variable reference" in a string by a given argument and return
//   a new string with the replacements made. A variable reference is a string of the form
//   "<indicator><selector>": if indicator = '$' and selectors = '123', valid variable references
//   are "$1", "$2", and "$3". References for which there is no replacement are not replaced.
//
//   If a replacement is a function, that function is called with three parameters, and its return
//   value is used as the replacement. The parameters are the original string, the selector that
//   matched, and the position of the matching reference's indicator within the original string.
//
// Parameters:
//   str                String      String containing variable references to be replaced
//   indicator          Character   The indicator character for variable references
//   selectors          String      The set of valid selectors
//   0..n               Object      The replacements
//
// Example: replaceVars ('Hello $1 $X $2 $3 $', '$', '123', 'yo$2u', 'there') results in the string
// "Hello yo$2u $X there $3 3". $3 is not replaced because there is no replacement for it, and the
// trailing $ is not a valid variable reference. Neither is $X (unrecognized selector). Note that
// the "$2" in the *replacement* "yo$2u" is *not* replaced! If you had done that naively with
// str.replace (/\$1/g, 'yo\$2u').replace(/\$2/g, 'there'), you would have gotten the result
// "Hello yothereu $X there $3 $".
function replaceVars (str, indicator, selectors /*, ... */)
{
  var result = "";
  if (!str || str.length == 0) return result;
  var from = 0;
  while (from < str.length) {
    var i = str.indexOf (indicator, from);
    if (i < 0 || i+1 >= str.length) {
      // No indicator found, or found at the last character of str: no selector following
      result = result + str.substring (from);
      break;
    }
    var j = selectors.indexOf (str.charAt (i+1));
    if (j < 0) {
      // Unknown selector: not replaced
      result = result + str.substring (from, i+1);
      from = i+1;
    } else {
      if (j >= arguments.length - 3) {
        // No replacement for known selector
        result = result + str.substring (from, i+2);
      } else {
        result = result
               + str.substring (from, i)
               + (typeof (arguments[j+3]) == 'function'
                  ? arguments[j+3] (str, str.charAt (i+1), i)
                  : arguments[j+3])
        ;
      }
      from = i+2;
    }
  }
  return result;
}

// addToolLink
//   An enhancement for addPortletLink (from wikibits.js) that also does sensible things
//   on the old skins that don't have portlets. On the standard (Classic) and cologneblue
//   skins, it adds the new link to the quickbar, on the nostalgia skin, it adds it to the
//   footer.
function addToolLink (portlet, url, name, id, tooltip)
{
  var target = null;
  switch (skin) {
    case 'standard':
    case 'cologneblue':
      target = document.getElementById ('quickbar');
      break;
    case 'nostalgia':
      target = document.getElementById ('footer');
      break;
    default:
      return addPortletLink (portlet, url, name, id, tooltip);
  }
  if (!target) return;
  var lk = makeRawLink (name, url, null, tooltip);
  var container = document.createElement ('span');
  if (id) container.id = id;
  container.appendChild (lk);
  if (skin == 'nostalgia') {
    var lastChild = target.lastChild;
    if (lastChild && lastChild.nodeType == 3) // Text node
      lastChild = lastChild.previousSibling;
    if (   lastChild
        && lastChild.nodeName.toLowerCase () != 'div'
        && lastChild.nodeName.toLowerCase () != 'form')
       container.insertBefore (document.createTextNode ('\xa0| '), lk);
  } else {
    target.appendChild (document.createElement ('br'));
  }
  target.appendChild (container);
  return container;
}

// stringifyJS
//   Turn a string into a valid Javascript string: escape all \, ', and " within the string by
//   another \ and return the resulting string.
//
// Parameters
//   str  String  The string to JSify

function stringifyJS (str)
{
  return str.replace (/([\\'"]|%5C|%27|%22)/g, '\\$1');
}

// scrollTextArea
//   Scroll a textarea to the top or to the bottom. Note: doesn't work in Opera < 9.5, because
//   such Opera versions *have no way of programatically setting the scroll position of a
//   textarea*. As of V9.5, Opera implements the textarea.scrollTop properly. (Also note that
//   scrollTop is a non-standard DHTML thing invented by Microsoft, but implemented by other
//   major browsers, too.)
//     A possibly existing selection is cleared.
//
// Parameters
//   textarea  String           the textarea to scroll. Defaults to 'wpTextbox1' if not
//                              set or null.
//   to_top    boolean          true to scroll to the top, false to scroll to the bottom.
//   no_focus  optional boolean if true, doesn't set the focus on the textarea (which may
//                              or may not make it not work on some browsers). Default is
//                              false (i.e., *do* set the focus.)

function scrollTextArea (textarea, to_top, no_focus)
{
  if (!textarea) textarea = document.getElementById ('wpTextbox1');
  if (!textarea) return;
  // Give the textbox the focus unless explicitly suppressed
  if (!no_focus) textarea.focus();
  // For good measure try to set the caret
  var offset = 0;
  if (!to_top) offset = textarea.value.length;
  if (textarea.createTextRange) { // IE, Opera
    var rng = textarea.createTextRange ();
    rng.collapse (true);
    rng.moveEnd ('character', offset);
    rng.moveStart ('character', offset);
    rng.select ();
  } else {                        // Other browsers
    if (textarea.setSelectionRange) {
      textarea.setSelectionRange (offset, offset);
    } else if (typeof (textarea.selectionStart) != 'undefined') {
      textarea.selectionStart = offset;
      textarea.selectionEnd   = offset;
    }
  }
  if (typeof (textarea.scrollTop) != 'undefined') { // Also on Opera as of 9.5
    if (to_top)
      textarea.scrollTop = 0;
    else {
      var h = textarea.scrollHeight - textarea.clientHeight;
      textarea.scrollTop = (h < 0 ? 0 : h);
    }
  }
}

// titleFromHref
//   Extract a page title from a href. Works for both types of hrefs:
//   http://foo.wikipedia.org/w/index.php?title=PageName and also /wiki/PageName
//   The returned title is already decoded, and any blanks are replaced by '_'.
//   Returns the empty string if no title can be found.
//
// Parameters
//   href    String   The href from which to extract the page name

function titleFromHref (href)
{
  if (!href) return "";
  var match = /[&?]title=([^&]*)/.exec (href);
  if (match && match.length > 1)
    return decodeURIComponent (match[1]).replace (/ /g, '_');
  var prefix = wgArticlePath.replace ('$1', "");
  if (href.indexOf (prefix) != 0) prefix = wgServer + prefix; // Fully expanded URL?
  if (href.indexOf (prefix) == 0)
    return decodeURIComponent (href.substring (prefix.length)).replace (/ /g, '_');
  // Yes, use decodeURIComponent, not decodeURI. DecodeURIComponent also will replace "%26" by "&",
  // which decodeURI doesn't do.
  return "";
}

// titleFromLink
//   Extract a page title from a href of a link node. Works for both types of hrefs:
//   http://foo.wikipedia.org/w/index.php?title=PageName and also /wiki/PageName
//
// Parameters
//   node    DOM node   The link node from which the page name is to be extracted

function titleFromLink (node)
{
  if (!node || typeof (node.getAttribute) != 'function') return "";
  return titleFromHref (node.getAttribute ('href', 2));
  // The ", 2" is for IE. IE sometimes has problems with encoded UTF-8 characters: using any other
  // way to get the href, it insists to decode the value, but does do so wrongly. For more info,
  // see http://commons.wikimedia.org/wiki/MediaWiki_talk:Gadget-HotCat.js/Archive01#Questions
}

// </source>