/* generated javascript */
var skin = 'monobook';
var stylepath = '/skins-1.5';

/* MediaWiki:Common.js */
//<source lang="javascript">

/** onload handlers ************
 *  Simple fix such that crashes in one handler don't prevent later handlers from running.
 *
 *  Maintainer: [[User:Lupo]]
 */

if (typeof (onloadFuncts) != 'undefined') {

  // Enhanced version of jsMsg from wikibits.js. jsMsg can display only one message, subsequent
  // calls overwrite any previous message. This version appends new messages after already
  // existing ones.
  function jsMsgAppend (msg, className)
  {
    var msg_div = document.getElementById ('mw-js-message');
    var msg_log = document.getElementById ('mw-js-exception-log');
    if (!msg_log) {
      msg_log = document.createElement ('ul');
      msg_log.id = 'mw-js-exception-log';
      if (msg_div && msg_div.firstChild) {
        // Copy contents of msg_div into first li of msg_log
        var wrapper = msg_div.cloneNode (true);
        wrapper.id = "";
        wrapper.className = "";
        var old_stuff = document.createElement ('li');
        old_stuff.appendChild (wrapper);
        msg_log.appendChild (old_stuff);
      }
    }
    var new_item = document.createElement ('li');
    new_item.appendChild (msg);
    msg_log.appendChild (new_item);
    jsMsg (msg_log, className);
  }

  var Logger = {

    // Log an exception. If present, try to use a JS console (e.g., Firebug's). If no console is
    // present, or the user is a sysop, also put the error message onto the page itself.
    logException : function (ex) {
      try {
        var name = ex.name || "";
        var msg  = ex.message || "";
        var file = ex.fileName || ex.sourceURL || null; // Gecko, Webkit, others
        var line = ex.lineNumber || ex.line || null;    // Gecko, Webkit, others
        var logged = false;
        if (typeof (console) != 'undefined' && typeof (console.log) != 'undefined') {
          // Firebug, Firebug Lite, or browser-native or other JS console present. At the very
          // least, these will allow us to print a simple string.
          var txt = name + ': ' + msg;
          if (file) {
            txt = txt + '; ' + file;
            if (line) txt = txt + ' (' + line + ')';
          }
          if (typeof (console.error) != 'undefined') {
            if (   console.firebug
                || (   console.provider && console.provider.indexOf
                    && console.provider.indexOf ('Firebug') >= 0)
               )
            {
              console.error (txt + " %o", ex); // Use Firebug's object dump to write the exception
            } else {
              console.error (txt);
            }
          } else
            console.log (txt);
          logged = true;
        } 
        if (!logged || wgUserGroups.join (' ').indexOf ('sysop') >= 0) {
          if (name.length == 0 && msg.length == 0 && !file) return; // Don't log if there's no info
          if (name.length == 0) name = 'Unknown error';
          // Also put it onto the page for sysops.
          var log  = document.createElement ('span');
          if (msg.indexOf ('\n') >= 0) {
            var tmp = document.createElement ('span');
            msg = msg.split ('\n');
            for (var i = 0; i < msg.length; i++) {
              tmp.appendChild (document.createTextNode (msg[i]));
              if (i+1 < msg.length) tmp.appendChild (document.createElement ('br'));
            }
            log.appendChild (document.createTextNode (name + ': '));
            log.appendChild (tmp);
          } else {
            log.appendChild (document.createTextNode (name + ': ' + msg));
          }
          if (file) {
            log.appendChild (document.createElement ('br'));
            var a = document.createElement ('a');
            a.href = file;
            a.appendChild (document.createTextNode (file));
            log.appendChild (a);
            if (line) log.appendChild (document.createTextNode (' (' + line + ')'));
          }
          jsMsgAppend (log, 'error');        
        }
      } catch (anything) {
        // Swallow
      }
    }
  } // end Logger

  // Wrap a function with an exception handler and exception logging.
  function makeSafe (f) {
    return function () {
             try {
               return f.apply (this, arguments);
             } catch (ex) {
               Logger.logException (ex);
               return null;
             }
           };
  }

  // Wrap the already registered onload hooks
  for (var i = 0; i < onloadFuncts.length; i++)
    onloadFuncts[i] = makeSafe (onloadFuncts[i]);

  // Redefine addOnloadHook to catch future additions
  function addOnloadHook (hookFunct) {
    // Allows add-on scripts to add onload functions
    if (!doneOnloadHook) {
      onloadFuncts[onloadFuncts.length] = makeSafe (hookFunct);
    } else {
      makeSafe (hookFunct)();  // bug in MSIE script loading
    }
  }
} // end onload hook improvements

/** JSconfig ************
 * Global configuration options to enable/disable and configure
 * specific script features from [[MediaWiki:Common.js]] and
 * [[MediaWiki:Monobook.js]]
 * This framework adds config options (saved as cookies) to [[Special:Preferences]]
 * For a more permanent change you can override the default settings in your 
 * [[Special:Mypage/monobook.js]]
 * for Example: JSconfig.keys[loadAutoInformationTemplate] = false;
 *
 *  Maintainer: [[User:Dschwen]]
 */

var JSconfig =
{
 prefix : 'jsconfig_',
 keys : {},
 meta : {},

 //
 // Register a new configuration item
 //  * name          : String, internal name
 //  * default_value : String or Boolean (type determines configuration widget)
 //  * description   : String, text appearing next to the widget in the preferences, or an hash-object
 //                    containing translations of the description indexed by the language code
 //  * prefpage      : Integer (optional), section in the preferences to insert the widget:
 //                     0 : User profile         User profile
 //                     1 : Skin                 Appearance
 //                     2 : Math                 Date and Time
 //                     3 : Files                Editing
 //                     4 : Date and time        Recent Changes
 //                     5 : Editing              Watchlist
 //                     6 : Recent changes       Search Options
 //                     7 : Watchlist            Misc
 //                     8 : Search               Gadgets
 //                     9 : Misc
 //
 // Access keys through JSconfig.keys[name]
 //
 registerKey : function( name, default_value, description, prefpage )
 {
  if( typeof JSconfig.keys[name] == 'undefined' ) 
   JSconfig.keys[name] = default_value;
  else {
   // all cookies are read as strings, 
   // convert to the type of the default value
   switch( typeof default_value )
   {
    case 'boolean' : JSconfig.keys[name] = ( JSconfig.keys[name] == 'true' ); break;
    case 'number'  : JSconfig.keys[name] = JSconfig.keys[name]/1; break;
   }
  }

  JSconfig.meta[name] = { 
   'description' : 
    description[wgUserLanguage] || description.en || 
    ( typeof(description) == "string" && description ) || 
    "<i>en</i> translation missing", 
   'page' : prefpage || 0, 'default_value' : default_value };

  // if called after setUpForm(), we'll have to add an extra input field
  if( JSconfig.prefsTabs ) JSconfig.addPrefsInput( name );
 },

 readCookies : function()
 {
  var cookies = document.cookie.split("; ");
  var p =JSconfig.prefix.length;
  var i;

  for( var key in cookies )
  {
   if( cookies[key].substring(0,p) == JSconfig.prefix )
   {
    i = cookies[key].indexOf('=');
    //alert( cookies[key] + ',' + key + ',' + cookies[key].substring(p,i) );
    JSconfig.keys[cookies[key].substring(p,i)] = cookies[key].substring(i+1);
   }
  }
 },

 writeCookies : function()
 {
  var expdate = new Date();
  expdate.setTime(expdate.getTime()+1000*60*60*24*3650);  // expires in 3560 days
  for( var key in JSconfig.keys )
   document.cookie = JSconfig.prefix + key + '=' + JSconfig.keys[key] + '; path=/; expires=' + expdate.toUTCString();
 },

 evaluateForm : function()
 {
  var w_ctrl,wt;
  //alert('about to save JSconfig');
  for( var key in JSconfig.meta ) {
   w_ctrl = document.getElementById( JSconfig.prefix + key )
   if( w_ctrl ) 
   {
    wt = typeof JSconfig.meta[key].default_value;
    switch( wt ) {
     case 'boolean' : JSconfig.keys[key] = w_ctrl.checked; break;
     case 'string' : JSconfig.keys[key] = w_ctrl.value; break;
    }
   }
  }

  JSconfig.writeCookies();
  return true;
 },

 prefsTabs : false,

 setUpForm : function()
 { 
  var prefChild = document.getElementById('preferences');
  if( !prefChild ) return;
  prefChild = prefChild.childNodes;

  //
  // make a list of all preferences sections
  //
  var tabs = new Array;
  var len = prefChild.length;
  for( var key = 0; key < len; key++ ) {
   if( prefChild[key].tagName &&
       prefChild[key].tagName.toLowerCase() == 'fieldset' ) 
    tabs.push(prefChild[key]);
  }
  JSconfig.prefsTabs = tabs;

  //
  // Create Widgets for all registered config keys
  //
  for( var key in JSconfig.meta ) JSconfig.addPrefsInput(key);

  addEvent(document.getElementById('preferences').parentNode, 'submit', JSconfig.evaluateForm );
 },

 addPrefsInput : function( key ) {
  var w_div = document.createElement( 'DIV' );

  var w_label = document.createElement( 'LABEL' );
  var wt = typeof JSconfig.meta[key].default_value;
  switch ( wt ) {
   case 'boolean':
    JSconfig.meta[key].description = " " + JSconfig.meta[key].description;
    break;
   case 'string': default:
    JSconfig.meta[key].description += ": ";
    break;
  }
  w_label.appendChild( document.createTextNode( JSconfig.meta[key].description ) );
  w_label.htmlFor = JSconfig.prefix + key;

  var w_ctrl = document.createElement( 'INPUT' );
  w_ctrl.id = JSconfig.prefix + key;

  // before insertion into the DOM tree
  switch( wt ) {
   case 'boolean':
    w_ctrl.type = 'checkbox';
    w_div.appendChild( w_ctrl );
    w_div.appendChild( w_label );
    break;
   case 'string': default:
    w_ctrl.type = 'text';
    w_div.appendChild( w_label );
    w_div.appendChild( w_ctrl );
    break;
  }

  JSconfig.prefsTabs[JSconfig.meta[key].page].appendChild( w_div );
  
  // after insertion into the DOM tree
  switch( wt ) {
   case 'boolean' : w_ctrl.defaultChecked = w_ctrl.checked = JSconfig.keys[key]; break;
   case 'string' : w_ctrl.defaultValue = w_ctrl.value = JSconfig.keys[key]; break;
  }
 }
};

JSconfig.readCookies();
if( wgNamespaceNumber == -1 && wgCanonicalSpecialPageName == "Preferences" )
 addOnloadHook(JSconfig.setUpForm);



/** extract a URL parameter from the current URL **********
 * From [[en:User:Lupin/autoedit.js]]
 *
 * paramName  : the name of the parameter to extract
 *
 * Local Maintainer: [[User:Dschwen]]
 */

function getParamValue( paramName, url) 
{
 if (typeof (url) == 'undefined' ) url = document.location.href;
 var cmdRe=RegExp( '[&?]' + paramName + '=([^&]*)' );
 var m=cmdRe.exec(url);
 if (m) {
  try {
   return decodeURIComponent(m[1]);
  } catch (someError) {}
 }
 return null;
}


/** &withJS= URL parameter *******
 * Allow to try custom scripts on the MediaWiki namespace without
 * editing [[Special:Mypage/monobook.js]]
 *
 * Maintainer: [[User:Platonides]]
 */
{
 var extraJS = getParamValue("withJS");
 if (extraJS)
  if (extraJS.match("^MediaWiki:[^&<>=%]*\.js$"))
   importScript(extraJS);
  else
   alert(extraJS + " javascript not allowed to be loaded.");
}


/** Attach (or remove) an Event to a specific object **********
 * Cross-browser event attachment (John Resig)
 * http://www.quirksmode.org/blog/archives/2005/10/_and_the_winner_1.html
 *
 * obj  : DOM tree object to attach the event to
 * type : String, event type ("click", "mouseover", "submit", etc.)
 * fn   : Function to be called when the event is triggered (the ''this''
 *        keyword points to ''obj'' inside ''fn'' when the event is triggered)
 *
 * Local Maintainer: [[User:Dschwen]]
 */
function addEvent( obj, type, fn )
{
 if (obj.addEventListener)
  obj.addEventListener( type, fn, false );
 else if (obj.attachEvent)
 {
  obj["e"+type+fn] = fn;
  obj[type+fn] = function() { obj["e"+type+fn]( window.event ); }
  obj.attachEvent( "on"+type, obj[type+fn] );
 }
}
function removeEvent( obj, type, fn )
{
 if (obj.removeEventListener)
  obj.removeEventListener( type, fn, false );
 else if (obj.detachEvent)
 {
  obj.detachEvent( "on"+type, obj[type+fn] );
  obj[type+fn] = null;
  obj["e"+type+fn] = null;
 }
}


/** Extra toolbar options ***********
 * Append custom buttons to the edit mode toolbar. 
 * This is a modified copy of a script by User:MarkS for extra features added by User:Voice of All.
 * This is based on the original code on Wikipedia:Tools/Editing tools
 * To disable this script, add <code>mwCustomEditButtons = [];<code> to [[Special:Mypage/monobook.js]]
 *  
 *  Maintainers: [[User:MarkS]]?, [[User:Voice of All]], [[User:R. Koot]]
 */
if (mwCustomEditButtons) {
  mwCustomEditButtons.push({
    "imageFile": "http://upload.wikimedia.org/wikipedia/en/c/c8/Button_redirect.png",
    "speedTip": "Redirect",
    "tagOpen": "#REDIRECT [[",
    "tagClose": "]]",
    "sampleText": "Insert text"
  });
}

/***** Edittools ********
 * Formatting buttons for special characters below the edit field
 * Also enables these buttons on any textarea or input field on
 * the page. Moved here from Monobook.js on 2009-09-09.
 *
 * Maintainers: [[User:Lupo]]
 */
var load_edittools = true; // Legacy...
importScript('MediaWiki:Edittools.js');

/***** SpecialSearchEnhanced ********
 * Improvement of the search page v4
 * Written by Marc Mongenet & Suisui (GFDL & GPL)
 *
 * Maintainers: none, ([[User:Dschwen]]?)
 ****/
var sse_i18n = {
'af' : 'Vind media met Mayflower',
'ar' : 'بحث عن الوسائط بواسطة مايفلاور',
'bg' : 'Търсете мултимедийно съдържание с Mayflower',
'ca' : 'Cerca continguts multimèdia amb Mayflower',
'cs' : 'Najdi média s Mayflower',
'de' : 'Suche Multimedia-Dateien mit Mayflower',
'da' : 'Find media med Mayflower',
'el' : 'Αναζήτηση πολυμέσων με το Mayflower',
'en' : 'Find media with Mayflower',
'es' : 'Busca contenidos multimedia con Mayflower',
'fi' : 'Etsi mediaa Mayflowerin avulla',
'fr' : 'Cherchez des fichiers média avec Mayflower',
'gl' : 'Procura contidos multimedia coa Mayflower',
'he' : 'חפשו קבצי מדיה עם מייפלאור',
'hu' : 'Keress médiafájlokat a Mayflowerrel',
'ht' : 'Chache fichye medya yo epi Mayflower',
'id' : 'Cari media dengan Mayflower',
'is' : 'Finndu miðla með Mayflower',
'it' : 'Cerca file multimediali con Mayflower',
'ja' : 'Mayflower を使ってマルチメディアを探す', 
'lt' : 'Ieškoti media su Mayflower',
'nl' : 'Media zoeken met Mayflower',
'nn' : 'Finn media med Mayflower',
'no' : 'Finn media med Mayflower',
'sv' : 'Sök media med Mayflower',
'sl' : 'Poišči večpredstavnostne datoteke z Mayflower',
'sk' : 'Nájdi médiá s Mayflower',
'sr' : 'Pronađi medij koristeći Mayflower',
'pl' : 'Wyszukaj media poprzez Mayflower',
'pt' : 'Procure conteúdos multimídia com Mayflower',
'ru' : 'Найти информацию с помощью системы Mayflower',
'vi' : 'Tìm tập tin phương tiện bằng Mayflower',
'zh' : '使用Mayflower搜索媒体文件',
'zh-hans' : '使用Mayflower搜索媒体文件',
'zh-hant' : '使用Mayflower搜尋媒體檔案',
'zh-cn' : '使用Mayflower搜索媒体文件',
'zh-sg' : '使用Mayflower搜索媒体文件',
'zh-tw' : '使用Mayflower搜尋媒體檔案',
'zh-hk' : '使用Mayflower搜尋媒體檔案'
};
function SpecialSearchEnhanced() 
{
 function SearchForm(engine_name, engine_url, logo_url, search_action_url, 
                     search_field_name, add_search_field, field_array)
 {
  var span= document.createElement("span");
  span.style.marginRight = "1em";

  var form = document.createElement("form");
  form.method = "get";
  form.action = search_action_url;
  form.style.display = "inline";
  span.appendChild(form);

  var input = document.createElement("input");
  input.type = "hidden";
  input.name = search_field_name;
  form.appendChild(input);

  for( var i in field_array){
   var fld = document.createElement("input");
   fld.type = "hidden";
   fld.name = i;
   fld.value = field_array[i];
   form.appendChild(fld);
  }

  var submit = document.createElement("input");
  submit.type = "submit";
  submit.value = sse_i18n[wgUserLanguage] || sse_i18n['en'];
  form.appendChild(submit);

  form.onsubmit = function() {
   if(add_search_field == ""){
    input.value = document.getElementById("lsearchbox").value;
   }else{
    input.value = document.getElementById("lsearchbox").value+add_search_field;
   }
  }

  if( !sse_i18n[wgUserLanguage] )
  {
   var h = document.createElement("a");
   h.href = 
    "http://meta.wikimedia.org/w/index.php?title=User:Tangotango/Mayflower/Translation&action=edit&section=3";
   span.appendChild(h);
   h.appendChild( document.createTextNode( " [help translate this button]" ) );
  }

  var a = document.createElement("a");
  a.href = engine_url;
  span.appendChild(a);

  var img = document.createElement("img");
  img.src = logo_url;
  img.alt = engine_name;
  img.style.borderWidth = "0";
  img.style.padding = "5px";
  img.style.width = "220px";
  img.style.height = "53px";
  a.appendChild(img);

  return span;
 }

 //honor user configuration
 if( !JSconfig.keys['specialSearchEnhanced'] ) return;
 
 if (wgCanonicalNamespace != "Special" || wgCanonicalSpecialPageName != "Search") return;

 if(skin == "monobook" || skin == "cologneblue" || skin == "simple")
  var mainNode = document.getElementsByTagName("form");
 if (!mainNode) return;
 mainNode = mainNode[0];
 mainNode.appendChild(document.createElement("center"));
 mainNode = mainNode.lastChild;

 var searchValue = document.getElementById("lsearchbox").value;

 var div = document.createElement("div");
 div.style.width = "100%";
//  ul.style.list-style-type = "none";
 mainNode.appendChild(div);

 var engine;
 var mayflowero = new Object();
 mayflowero["t"] = "n";
 engine = SearchForm("MayFlower", "http://toolserver.org/~tangotango/mayflower/index.php", "http://toolserver.org/~tangotango/mayflower/images/mayflower-logo.png",  
                     "http://toolserver.org/~tangotango/mayflower/search.php",
                     "q", "", mayflowero);
 div.appendChild(engine);
}
//JSconfig.registerKey('specialSearchEnhanced', true, ( sse_i18n[wgUserLanguage] || sse_i18n['en'] ) + ':', 6);
// addOnloadHook(SpecialSearchEnhanced);

//
// Collapsible tables
//
importScript('MediaWiki:CollapsibleTables.js');

/**** ImageAnnotator ******
 * Globally enabled per
 * http://commons.wikimedia.org/w/index.php?title=Commons:Village_pump&oldid=26818359#New_interface_feature
 *
 * Maintainer: [[User:Lupo]]
 ****/

if (wgNamespaceNumber != -1 && wgAction && (wgAction == 'view' || wgAction == 'purge')) {
  // Not on Special pages, and only if viewing the page
  if (typeof (ImageAnnotator_disable) == 'undefined' || !ImageAnnotator_disable) {
    // Don't even import it if it's disabled.
    importScript ('MediaWiki:Gadget-ImageAnnotator.js');
  }
}

/**** Special:Upload enhancements ******
 * moved to [[MediaWiki:Upload.js]]
 * 
 *  Maintainer: [[User:Lupo]]
 ****/
JSconfig.registerKey('UploadForm_loadform', true, 
 {
  'bg': 'Използване на логиката на новия формуляр за качвания',
  'en': 'Use new upload form logic' // default
 }, 3);
JSconfig.registerKey('UploadForm_newlayout', true, 
 {
  'bg': 'Използване на облика на новия формуляр за качвания',
  'en': 'Use new form layout' // default
 }, 3);

function enableNewUploadForm ()
{
  var match = navigator.userAgent.match(/AppleWebKit\/(\d+)/);
  if (match) {
    var webKitVersion = parseInt(match[1]);
    if (webKitVersion < 420) return; // Safari 2 crashes hard with the new upload form...
  }

  // honor JSConfig user settings
  if( !JSconfig.keys['UploadForm_loadform'] ) return;

  importScript( 'MediaWiki:UploadForm.js' );
}

if (wgPageName == 'Special:Upload') 
{
 importScript( 'MediaWiki:Upload.js' );
 // Uncomment the following line (the call to enableNewUploadForm) to globally enable the
 // new upload form. Leave the line *above* (the include of MediaWiki:Upload.js) untouched;
 // that script provides useful default behavior if the new upload form is disabled or
 // redirects to the old form in case an error occurs.
 enableNewUploadForm ();
}

// We may be running MediaWiki:UploadForm.js on this site. The following script changes the
// "reupload" links on image pages to go to the basic form.
if (wgNamespaceNumber == 6) importScript ('MediaWiki:UploadFormLinkFixer.js');


/**** QICSigs ******
 * Fix for the broken signatures in gallery tags
 * needed for [[COM:QIC]]
 *
 *  Maintainers: [[User:Dschwen]]
 ****/
if( wgPageName == "Commons:Quality_images_candidates/candidate_list" && wgAction == "edit" )
{
 importScript( 'MediaWiki:QICSigs.js' );
}

/**** VICValidate ******
 * Some basic form validation for creating new Valued image nominations
 * needed for [[COM:VIC]]
 *
 *  Maintainers: [[User:Dschwen]]
 ****/
if( wgPageName == "Commons:Valued_image_candidates" && wgAction == "view" )
{
 importScript( 'MediaWiki:VICValidate.js' );
}


/***** subPagesLink ********
 * Adds a link to subpages of current page
 *
 *  Maintainers: [[:he:משתמש:ערן]], [[User:Dschwen]]
 *
 *  JSconfig items: bool JSconfig.subPagesLink
 *                       (true=enabled (default), false=disabled)
 ****/
var subPagesLink =
{ 
 //
 // Translations of the menu item
 //
 i18n :
 {
  'bg': 'Подстраници',
  'ca': 'Subpàgines',
  'cs': 'Podstránky',
  'de': 'Unterseiten',
  'en': 'Subpages',    // default
  'et': 'Alamlehed',
  'eo': 'Subpaĝoj',
  'es': 'Subpáginas',
  'fi': 'Alasivut',
  'fr': 'Sous-pages',
  'gl': 'Subpáxinas',
  'he': 'דפי משנה',
  'hr': 'Podstranice',
  'it': 'Sottopagine',
  'is': 'Undirsíður',
  'ko': '하위 문서 목록',
  'nl': "Subpagina's",
  'no': 'Undersider',
  'pl': 'Podstrony',
  'ru': 'Подстраницы'
 },

 install: function()
 {
  // honor user configuration
  if( !JSconfig.keys['subPagesLink'] ) return;

  if ( document.getElementById("t-whatlinkshere") 
       &&  wgNamespaceNumber != -2   // Media: (upcoming)
       &&  wgNamespaceNumber != -1   // Special:
       && wgNamespaceNumber != 6     // Image:
       &&  wgNamespaceNumber != 14   // Category:
     )
  {
   var subpagesText = subPagesLink.i18n[wgUserLanguage] || subPagesLink.i18n['en'];
   var subpagesLink ='/wiki/Special:Prefixindex/' + wgPageName +'/';

   addPortletLink( 'p-tb', subpagesLink, subpagesText, 't-subpages' );
  }
 }
}
JSconfig.registerKey('subPagesLink', true, 
 {
  'bg': 'Показване на връзката Подстраници в менюто с инструменти',
  'cs': 'Zobrazovat v panelu nástrojů odkaz Podstránky',
  'en': 'Show a Subpages link in the toolbox', // default
  'pl': 'Pokaż w panelu bocznym link do podstron'
 }, 7);
addOnloadHook(subPagesLink.install);


/***** new os_createContainer ********
 * make the width of the search suggest window customizable
 *
 *  Maintainers: [[User:Dschwen]]
 ****/

// Translations of the message in the user preferences
if( typeof os_createContainer != 'undefined' ) {
  JSconfig.registerKey('os_suggest_width', "", 
   {
    'bg': 'Ширина на падащото меню с AJAX предположения',
    'cs': 'Šířka AJAXového napovídače',
    'en': 'Custom AJAX suggestion box width' // default
   }, 6);
  var old_os_createContainer = os_createContainer;
  os_createContainer = function( r) 
  {
   var c = old_os_createContainer( r );
   var w = JSconfig.keys['os_suggest_width'];
   if( w != "" ) c.style.width = w + "px";
   return c;
  }
}


/***** gallery_dshuf_prepare ********
 * prepare galleries which are surrounded by <div class="dshuf"></div>
 * for shuffling with dshuf (see below).
 *
 *  Maintainers: [[User:Dschwen]]
 ****/
function gallery_dshuf_prepare()
{
 var tables = document.getElementsByTagName("table");
 var divsorig, divs, newdiv, parent, j, i;

 for ( i = 0; i < tables.length; i++)
  if ( tables[i].className == 'gallery' && 
       tables[i].parentNode.className == 'dshuf' )
  {
   divsorig = tables[i].getElementsByTagName( 'div' );
   divs = [];
   for ( j = 0; j < divsorig.length; j++) divs.push(divsorig[j]);
   for ( j = 0; j < divs.length; j++)
    if ( divs[j].className == 'gallerybox' )
    {
     newdiv = document.createElement( 'DIV' );
     newdiv.className = 'dshuf dshufset' + i;
     while( divs[j].childNodes.length > 0 )
      newdiv.appendChild( divs[j].removeChild(divs[j].firstChild) );
     divs[j].appendChild( newdiv );
    }
  }
}
addOnloadHook(gallery_dshuf_prepare);


/***** dshuf ********
 * shuffles div elements with the class dshuf and 
 * common class dshufsetX (X being an integer)
 * taken from http://commons.wikimedia.org/w/index.php?title=MediaWiki:Common.js&oldid=7380543
 *
 *  Maintainers: [[User:Gmaxwell]], [[User:Dschwen]]
 ****/
function dshuf(){
 var shufsets = {};
 var rx = new RegExp('dshuf'+'\\s+(dshufset\\d+)', 'i');
 var divs = document.getElementsByTagName("div");
 var i = divs.length;
 while( i-- )
 {
  if( rx.test(divs[i].className) )
  {
   if ( typeof shufsets[RegExp.$1] == "undefined" )
   { 
    shufsets[RegExp.$1] = {};
    shufsets[RegExp.$1].inner = [];
    shufsets[RegExp.$1].member = [];
   }
   shufsets[RegExp.$1].inner.push( { key:Math.random(), html:divs[i].innerHTML } );
   shufsets[RegExp.$1].member.push(divs[i]);
  }
 }

 for( shufset in shufsets )
 {
  shufsets[shufset].inner.sort( function(a,b) { return a.key - b.key; } );
  i = shufsets[shufset].member.length;
  while( i-- )
  {
   shufsets[shufset].member[i].innerHTML = shufsets[shufset].inner[i].html;
   shufsets[shufset].member[i].style.display = "block";
  }
 }
}
addOnloadHook(dshuf);


//Adds a dismissable notice to Special:Watchlist
//Useful to use instead of the sitenotice for messages only
//relevant to registered users.
if( wgCanonicalSpecialPageName == "Watchlist" ) importScript( 'MediaWiki:Common.js/WatchlistNotice.js' );

/***** localizeSignature ********
 * localizes the signature on Commons with the string in the user's preferred language
 *
 * Maintainer: [[User:Slomox]]
 ****/
function localizeSignature() {
 var talkTextLocalization = { ca: 'Discussió', cs: 'diskuse', de: 'Diskussion', nds: 'Diskuschoon' };
 var talkText = talkTextLocalization[wgUserLanguage];
 if (!talkText) return;
 var spans=document.getElementsByTagName("span");
 for (var i = 0; i < spans.length; i++) {
  if ( spans[i].className == 'signature-talk' ) {
   spans[i].innerHTML = talkText;
  }
 }
}
addOnloadHook(localizeSignature);

// Load POTY gallery enhancements
function POTYenhancements() {
    var g = document.getElementById('poty2008')
    if (g && wgUserName) {
        uri = wgScript + '?title=User:Kalan/poty.js&action=raw&ctype=text/javascript&go=' + g.className.match(/version-\d+/)[0]
        importScriptURI(uri)
    }
}

addOnloadHook(POTYenhancements)

//
// Add "Nominate for Deletion" to toolbar ([[MediaWiki talk:Quick-delete-code.js]])
//
importScript('MediaWiki:Quick-delete-code.js');

//
// Import usergroup-specific stylesheet, only for admins atm
//
for( var key in wgUserGroups )
{
   if (wgUserGroups[key] =="sysop")
   {
       importStylesheet("MediaWiki:Admin.css");
   }
}

// SVG images: adds links to rendered PNG images in different resolutions
addOnloadHook(function() {
      if (wgAction == "view" && wgNamespaceNumber == 6 && wgTitle.substring(wgTitle.lastIndexOf(".")).toLowerCase() == ".svg") { 
      var file = document.getElementById("file");
      if (!file) return;  // might happen if MediaWiki can't render the SVG
      var div = document.createElement("div");
      div.appendChild(document.createTextNode("SVG rendered as PNG images in different resolutions:"));
      div.appendChild(document.createElement("br"));
      var a200 = document.createElement("a");
      a200.setAttribute("href", "http://commons.wikimedia.org/w/thumb.php?f=" + encodeURIComponent(wgTitle) + "&width=200px");
      a200.appendChild(document.createTextNode("200px"));
      var a500 = document.createElement("a");
      a500.setAttribute("href", "http://commons.wikimedia.org/w/thumb.php?f=" + encodeURIComponent(wgTitle) + "&width=500px");
      a500.appendChild(document.createTextNode("500px"));
      var a1000 = document.createElement("a");
      a1000.setAttribute("href", "http://commons.wikimedia.org/w/thumb.php?f=" + encodeURIComponent(wgTitle) + "&width=1000px");
      a1000.appendChild(document.createTextNode("1000px"));
      var a2000 = document.createElement("a");
      a2000.setAttribute("href", "http://commons.wikimedia.org/w/thumb.php?f=" + encodeURIComponent(wgTitle) + "&width=2000px");
      a2000.appendChild(document.createTextNode("2000px"));
      div.appendChild(a200);
      div.appendChild(document.createTextNode(", "));
      div.appendChild(a500);
      div.appendChild(document.createTextNode(", "));
      div.appendChild(a1000);
      div.appendChild(document.createTextNode(", "));
      div.appendChild(a2000);
      div.appendChild(document.createTextNode("."));
      file.parentNode.insertBefore(div, document.getElementById("file").nextSibling.nextSibling);
   }
});

//Language-specific JavaScript.
//may be useful for renaming tab in main page in every language.
importScript('MediaWiki:Common.js/' + wgUserLanguage);

/* Quick-adding a command CommonsDelinker's command line */
/* Local maintainer: [[User:Kwj2772]] */
importScript('MediaWiki:CommonsDelinker.js');

/*Automatic language selection using javascript*/
importScript('MediaWiki:Common.js/LangSelect.js');

//</source>

/* MediaWiki:Monobook.js */
/* <pre><nowiki> Top of Javascript */

// switches for scripts
// TODO: migrate to JSConfig

// extra interface tabs for (external) tools such as check usage
//This should add the possibility to opt-out via gadgets
//the "remove image tools" gadget will set load_extratabs to false,
//so this won't load. If that's undefined, assume opt-in
if(typeof load_extratabs == 'undefined') load_extratabs = true;
if(load_extratabs != false) importScript('MediaWiki:Extra-tabs.js');

// Fix for i18n localization not loading.
// There are some scripts left that need to be migrated
importScript('Mediawiki:Monobook.js/' + wgUserLanguage);

// A workaround for bug 2831, http://bugzilla.wikimedia.org/show_bug.cgi?id=2831
// This comes from Wiktionary,
// http://en.wiktionary.org/w/index.php?title=MediaWiki:Monobook.js&diff=prev&oldid=1144333
if (/\.5B/.test(window.location.hash))
  window.location = window.location.hash.replace(/\.5B/g, "").replace(/\.5D/g, "");

//
// Collapsible divs
//
importScript('MediaWiki:NavFrame.js');

//
// Wikiminiatlas for commons
//
importScriptURI( 'http://meta.wikimedia.org/w/index.php?title=MediaWiki:Wikiminiatlas.js' 
               + '&action=raw&ctype=text/javascript&smaxage=21600&maxage=86400' );

//
// Wikimediaplayer for commons [[User:Gmaxwell]]
//
// importScript('Mediawiki:Wikimediaplayer.js');

//
// Add ResizeGalleries script ([[MediaWiki talk:ResizeGalleries.js]])
//
// 
// Translations of the message in the user preferences  
var i18n_resize = {
 'bg': 'Оразмеряване на галериите и категориите според ширината на екрана',
 'en': 'Resize gallery and category widths to fit screen' // default
};
JSconfig.registerKey('resizeGalleries', true, i18n_resize[wgUserLanguage] || i18n_resize['en'], 3);
if( JSconfig.keys['resizeGalleries'] )
 importScript('MediaWiki:ResizeGalleries.js');

//
// Change target of add-section links
// See Template:ChangeSectionLink
//
addOnloadHook(function () 
{
 var changeAddSection = document.getElementById('jsChangeAddSection')
 if (changeAddSection)
 {
  var addSection = document.getElementById('ca-addsection');
  if (addSection)
  {
   addSection.firstChild.setAttribute('href', wgScript + 
    '?action=edit&section=new&title=' + encodeURIComponent(
    changeAddSection.getAttribute('title')));
  }
 }
});

 // from http://de.wiktionary.org/wiki/MediaWiki:Common.js by [[wikt:de:User:Melancholie]] Interprojekt-Links ([[mediazilla:708|Bug 708]])
 
 document.write('<style type="text/css">#interProject, #sisterProjects {display: none; speak: none;} #p-tb .pBody {padding-right: 0;}<\/style>');
 function iProject() {
  var interPr = document.getElementById ('interProject');
  var sisterPr = document.getElementById ('sisterProjects');
  if (interPr) {
   var interProject = document.createElement("div");
   interProject.style.marginTop = "0.7em";
   document.getElementById ("p-tb").appendChild(interProject);
   interProject.innerHTML =
     '<h5><a href="/wiki/Commons:SisterProjects">'
    +(sisterPr && sisterPr.firstChild ? sisterPr.firstChild.innerHTML : "Sister Projects")
    +'<\/a><\/h5><div class="pBody">'+interPr.innerHTML+'<\/div>';
  }
 }
 addOnloadHook(iProject);

/* Bottom of Javascript </nowiki></pre> */