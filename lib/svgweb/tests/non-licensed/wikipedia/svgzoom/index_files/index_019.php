// <source lang="javascript">

/*
  Adds a "Nominate for deletion" link for quick opening a deletion request to the sidebar (or to
  the quickbar, or to the footer in the old skins). If window.QuickDeleteEnhanced == true (set by
  [[MediaWiki:Gadget-QuickDelete.js]]), also add links to mark images as "no source",
  "no license", or "no permission", or as a copyright violation. Notifications are placed on the
  last uploader's talk page (unless that is protected). The script tries to avoid notifying bots
  such as FlickreviewR, Rotatebot, or one of the uploading bots. If it can figure out the real
  uploader in these cases, it'll notify that user.

  Author: [[User:Lupo]], January/February 2009
  License: Quadruple licensed GFDL, GPL, LGPL and Creative Commons Attribution 3.0 (CC-BY-3.0)
 
  Choose whichever license of these you like best :-)

  This a completely new version, decomposed into reusable modules. MediaWiki:Notifier.js is also
  used by MediaWiki:Gadget-GalleryDetails.js. This new version was designed to be backwards
  compatible with the previous code, which was written by

    Main code [[:en:User:Jietse Niesen]], some adaption by [[user:pfctdayelise]], cleanup by [[User:Alphax]],
    last maintainers [[User:ChrisiPK]] and [[User:Lupo]].
 */

if (typeof (QuickDelete) == 'undefined') { // Guard against double inclusions

importScript ('MediaWiki:Utilities.js');
importScript ('MediaWiki:Notifier.js');

// UI strings. Localizeable in subpages. The naming is legacy from the earlier implementation.
if (typeof (nfd_text) == 'undefined')
  var nfd_text    = 'Nominate for deletion';
if (typeof (nfd_tooltip) == 'undefined')
  var nfd_tooltip = 'Nominate this file for deletion';
if (typeof (nfd_prompt) == 'undefined')
  var nfd_prompt  = 'Why do you want to nominate this file for deletion?';

if (typeof (mns_text) == 'undefined')
  var mns_text    = 'No source';
if (typeof (mns_tooltip) == 'undefined')
  var mns_tooltip = 'Mark this file as missing required source information';
if (typeof (mnl_text) == 'undefined')
  var mnl_text    = 'No license';
if (typeof (mnl_tooltip) == 'undefined')
  var mnl_tooltip = 'Mark this file as missing required licensing information';
if (typeof (mnp_text) == 'undefined')
  var mnp_text    = 'No permission';
if (typeof (mnp_tooltip) == 'undefined')
  var mnp_tooltip = 'Mark this file as missing required permission information';

if (typeof (cv_text) == 'undefined')
  var cv_text     = 'Report copyright violation';
if (typeof (cv_tooltip) == 'undefined')
  var cv_tooltip  = 'Flag this file as a copyright violation';

if (wgUserLanguage != 'en') importScript( 'MediaWiki:Quick-delete2.js/' + wgUserLanguage );
// Hook for localizations. Legacy filename.

if (typeof (quick_delete_close_windows) == 'undefined')
  var quick_delete_close_windows = false;

var QuickDelete =
{

  install_delay        : 200, // Milliseconds
  install_attempts     : 0,
  install_max_attempts : 5,   // Five times: maximum delay 1s

  install : function ()
  {
    if (typeof (addToolLink) == 'undefined') {
      // Loading problem on Konqueror 4.2.1/Safari 3.2.2 (occurs only sometimes, e.g. for
      // non-logged-in users). Utilities hasn't been loaded yet, so try again later.
      QuickDelete.install_attempts++;
      if (QuickDelete.install_attempts <= QuickDelete.install_max_attempts) {
        window.setTimeout (QuickDelete.install, QuickDelete.install_delay);
      }
      return;
    }
    addToolLink (
        'p-tb'
      , 'javascript:Notifier.nominateForDeletion (null, null, null, "'
        + stringifyJS (nfd_prompt) + '", false, '
        + !quick_delete_close_windows + ');'
      , nfd_text
      , 'nfd_del_nom'
      , nfd_tooltip
    );
    if (!window.QuickDeleteEnhanced) return;
    addToolLink (
        'p-tb'
      , 'javascript:Notifier.mark ("nosource", null, null, null, false, '
        + !quick_delete_close_windows + ');'
      , mns_text
      , 'mns_lk'
      , mns_tooltip
    );
    addToolLink (
        'p-tb'
      , 'javascript:Notifier.mark ("nolicense", null, null, null, false, '
        + !quick_delete_close_windows + ');'
      , mnl_text
      , 'mnl_lk'
      , mnl_tooltip
    );
    addToolLink (
        'p-tb'
      , 'javascript:Notifier.mark ("nopermission", null, null, null, false, '
        + !quick_delete_close_windows + ');'
      , mnp_text
      , 'mnp_lk'
      , mnp_tooltip
    );
    addToolLink (
        'p-tb'
      , 'javascript:Notifier.mark ("copyvio", null, null, null, false, '
        + !quick_delete_close_windows + ');'
      , cv_text
      , 'cv_lk'
      , cv_tooltip
    );    
  }

}

if (wgNamespaceNumber == 6) addOnloadHook (QuickDelete.install);
// Only on image pages

} // end if (guard)

// </source>