/* <source lang="javascript"> Top of Javascript */
/* tooltips and access keys */ 
// ==========================================================================
// BEGIN: MediaWiki interface button definition for Duesentrieb's image tools:
// "Check usage", "User image gallery", "Orphaned images of user" and 
// "Untagged images of user".
// If you are located at an "Image:" you get the "check usage" tab, if you
// are at a "User:" page you get the "gallery", "orphans" and "untagged" tab.
// If you are on other pages these tabs do not get shown. These functions are
// enabled in Wikimedia Commons by default via [[Mediawiki:Monobook.js]] and
// its local language subpages.
// This script has been tested with Konqueror 3.5 and Firefox 1.5 and other
// browsers including Opera and Internet Explorer have been reported to work
// as well. If you enhance or change this template please test it previous to
// editing here in your local monobook.js with as many as possible browsers
// (in order not to clash with the function names here change in your local
// monobook.js all "global_" to "local_").
// Be aware that the global JavaScripts do not get updated by the Wikimedia
// servers that fast after saving them.

// written by Dbenbenn, Avatar, Duesentrieb and Arnomane

// Switch for people that don't want the extra tabs.
if(typeof load_extratabs == 'undefined') load_extratabs = true;

// project URL without protocol handler
var tab_project = wgServer.replace("http://", "");
if (wgServer == "https://secure.wikimedia.org") {
    // on the secure server, the project name must be extracted from the path
    tab_project = wgScriptPath.replace(/^\/([a-z0-9\-]+)\/([a-z0-9\-]+)\/w$/, "$2.$1.org");
    tab_project = tab_project.replace(/^(commons|species|meta|incubator)\.wikipedia\.org$/, "$1.wikimedia.org");
    if (tab_project == "foundation.wikipedia.org") tab_project = "wikimediafoundation.org";
    // add other exceptions (e.g. wikipedia/mediawiki -> mediawiki.org) here, if support for them is added on toolserver
}

// Translations (variables for internationalisation and localisation):

// namespace names (there is only wgCanonicalNamespace variable; although not a
// problem for Commons but for non-English wikis, we make it easier for them
// reusing the script with these variables)
var tab_ns_image = 'File:';
var tab_ns_user = 'User:';
var tab_ns_special = 'Special:';

// Interface strings, translations get defined in the MediaWiki:Extra-tabs.js/<ISO-Code> sub pages, see below
var tab_check_usage = 'Check usage';
var tab_categorize = 'Find categories';
var tab_log = 'Log';
var tab_gallery = 'Gallery';
var tab_orphans = 'Orphans';
var tab_untagged = 'Untagged';
var tab_tree = 'Tree';
var tab_catscan = 'CatScan';
var tab_blocklog = 'Blocklog';
var tab_wikipedia = "en";
var tab_purge = 'Purge';
importScript( 'MediaWiki:Extra-tabs.js/' + wgUserLanguage );

// Appends a new tab.

function global_append_tab (url, name, id)
{
  var na = document.createElement('a');
  na.setAttribute('href', url);
 
  var txt = document.createTextNode(name);
  na.appendChild(txt);
 
  var li = document.createElement('li');
  if(id) li.id = id;
  li.appendChild(na);

  // Grab the element we want to append the tab and append the tab to it.
  var c1 = document.getElementById('p-cactions');
  if(!c1) return;
  var tabs = c1.getElementsByTagName('ul')[0];
  tabs.appendChild(li);
}

function global_add_image_tabs (imagetitle)
{
  global_append_tab('http://toolserver.org/~daniel/WikiSense/CheckUsage.php?i=' + imagetitle + '&w=_100000', tab_check_usage, 'ca-checkusage');
  
  global_append_tab('http://toolserver.org/~daniel/WikiSense/CommonSense.php?i=' + imagetitle + '&go-clean=yes' , tab_categorize, 'ca-commonsense');
  
  global_append_tab(wgScript + '?title=' + tab_ns_special + 'Log&page=' + tab_ns_image + imagetitle, tab_log, 'ca-log');

  global_append_tab(wgScript + '?title=' + tab_ns_image + imagetitle + '&action=purge', tab_purge, 'ca-purge');
  
  // Add an "unthumb" link. For Image:123px-Foo, links to Image:Foo.
  if (imagetitle.match(/^\d+px-/))
  {
    // imagetitle = imagetitle.substring(imagetitle.indexOf("px-") + 3);
    imagetitle = imagetitle.replace(/^\d+px-/, '');
    global_append_tab(wgArticlePath.replace(/\$1/, 'File:' + imagetitle), 'unthumb', 'ca-unthumb');
  }
  
  // Add a tab going to wikipedia image page
  global_append_tab('http://' + tab_wikipedia + '.wikipedia.org/wiki/File:' + imagetitle, tab_wikipedia, 'ca-' + tab_wikipedia + 'wiki');
}

function global_add_user_tabs (username)
{
  // removing subpages from the link
  // username.split("/")[0] works equally well
  // username = username.replace(/\/.*$/, '');
  username = username.split("%2F")[0];

  global_append_tab('http://toolserver.org/~daniel/WikiSense/Gallery.php?wikifam=' + tab_project + '&img_user_text=' + username , tab_gallery, 'ca-gallery');
  global_append_tab('http://toolserver.org/~daniel/WikiSense/OrphanImages.php?wiki=' + tab_project + '&img_user_text=' + username , tab_orphans, 'ca-orphans');
  global_append_tab('http://toolserver.org/~daniel/WikiSense/UntaggedImages.php?wiki=' + tab_project + '&img_user_text=' + username , tab_untagged, 'ca-untagged');
}

function global_add_category_tabs (category)
{
  // global_append_tab('/wiki/Special:CategoryTree?target=' + category + '&mode=categories&dotree=Laden', tab_tree);
  global_append_tab('http://toolserver.org/~daniel/WikiSense/CategoryIntersect.php?wiki=' + tab_project + '&basecat=' + category , tab_catscan, 'ca-catscan');
}

// On Special:Contributions, we add the user tabs just like for a user page.
// On Special:Blockip, we add a blocklog tab.
function global_add_special_tabs ()
{
  if (wgCanonicalSpecialPageName == "Blockip")
  {
    // so we don't break after blocking
    var username = document.getElementsByName('wpBlockAddress')[0] ? document.getElementsByName('wpBlockAddress')[0].defaultValue : '';
    
    if (username != '')
    {
      global_append_tab(wgScript + '?title=' + tab_ns_special + 'Log&type=block&page=' + tab_ns_user + encodeURIComponent (username), tab_blocklog, 'ca-blocklog');
    }
  }
  else if (wgCanonicalSpecialPageName == "Contributions")
  {
    	var username = document.getElementsByName('target')[0].value;
    // Plain username, without "User:"! And encode it.
    global_add_user_tabs(encodeURIComponent (username));
  }
}

function global_do_onload ()
{
    if (!load_extratabs)
    {
        return;
    }
    // title without namespace name. Replacing blanks by underscores
    // is just for beautifying the resulting URL a little bit. The
    // critical part is the call to encodeURIComponent. Without this
    // call, file or user names with "&" in the name won't work, because
    // the ampersand is a parameter delimiter!
    var title = encodeURIComponent (wgTitle.split (" ").join ("_"));

    // Namespace numbers are (see [[m:Help:Variables]]):
    // -1: Special
    // 2:  User
    // 3:  User_talk
    // 6:  Image
    // 7:  Image_talk
    // 14: Category
    switch(wgNamespaceNumber)
    {
        case -1:
            global_add_special_tabs();
            break;
        case 2:
        case 3:
            global_add_user_tabs(title);
            break;
        case 6:
            global_add_image_tabs(title);
            break;
        case 7:
            global_add_image_tabs(title);
            break;
        case 14:
            global_add_category_tabs(title);
            break;
        default:
            // nothing
    }
}

addOnloadHook( function() {
    global_do_onload ();
});
// END: MediaWiki interface button definition for Duesentrieb's image tools.
// ========================================================================

// Add the check usage link to the classic skin.
function addCheckUsageLink()
{
 var toc = document.getElementById('filetoc');
 var cu = document.createElement('a');
 var li = document.createElement('li');
 
 cu.setAttribute('href', 'http://toolserver.org/~daniel/WikiSense/CheckUsage.php?w=_100000&i=' + encodeURIComponent(wgTitle));
 cu.textContent = 'check usage';
 li.appendChild(cu);
 toc.appendChild(li);
}
if (wgNamespaceNumber == 6 && skin == 'standard')
 addOnloadHook(addCheckUsageLink);

/* Bottom of Javascript </source> */