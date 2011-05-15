// <source lang="javascript">

/*
  Implementation for quick-deletion user notification links.

  Author: [[User:Lupo]], January 2009
  License: Quadruple licensed GFDL, GPL, LGPL and Creative Commons Attribution 3.0 (CC-BY-3.0)
 
  Choose whichever license of these you like best :-)
 */


if (typeof (Notifier) == 'undefined') { // Guard against double inclusions

importScript ('MediaWiki:Utilities.js');
importScript ('MediaWiki:QuickModify.js');
importScript ('MediaWiki:TextCleaner.js');

var notification_definitions =
  {
    copyvio :
      { img_template  : '\{\{copyvio|1=$1\}\}'
       ,talk_template : '\{\{subst:copyvionote|1=$F\}\}\~\~\~\~'
       ,img_summary   : 'Marking as copyvio'
       ,talk_summary  : 'Please do not upload copyright violations'
       ,prompt_text   : 'Why is this file a copyright violation?\n'
                        + 'Give a reason and/or external source (URL or such).'
      }
   ,nosource :
      { img_template  : '\{\{no source since|month=\{\{subst:CURRENTMONTHNAME\}\}|day=\{\{subst:CURRENTDAY\}\}|year=\{\{subst:CURRENTYEAR\}\}\}\}'
       ,talk_template : '\{\{subst:image source|1=$F\}\}\~\~\~\~'
       ,img_summary   : 'File has no source'
       ,talk_summary  : 'Where does file [[:$F]] come from?'
      }
   ,nolicense :
      { img_template  : '\{\{no_license|month=\{\{subst:CURRENTMONTHNAME\}\}|day=\{\{subst:CURRENTDAY\}\}|year=\{\{subst:CURRENTYEAR\}\}\}\}'
       ,talk_template : '\{\{subst:image license|1=$F\}\}\~\~\~\~'
       ,img_summary   : 'Missing license'
       ,talk_summary  : 'File [[:$F]] does not have a license'
      }
   ,nopermission :
      { img_template  : '\{\{no_permission|month=\{\{subst:CURRENTMONTHNAME\}\}|day=\{\{subst:CURRENTDAY\}\}|year=\{\{subst:CURRENTYEAR\}\}\}\}'
       ,talk_template : '\{\{subst:image permission|1=$F\}\}\~\~\~\~'
       ,img_summary   : 'Missing permission'
       ,talk_summary  : 'Please send a permission for [[:$F]] to [[COM:OTRS|OTRS]]'
      }
  };

var nfd_delReq         = "Commons:Deletion_requests";
var nfd_deleteTemplate = "delete";
var nfd_idwTemplate    = "subst:idw";

if (typeof (notifier_timeout) == 'undefined')
  var notifier_timeout = 1500; // 1.5 seconds

var notifier_user_query = "Which user do you want to notify?";

var Notifier =
{
  /* $1 = input from user (prompt)
     $F = title (which should include the namespace)
     $U = user name, if given or found
     
     img_template is mandatory.
     if not talk_template exists, user will not be notified, even if given.
     if talk_template exists, but no user is given, and we're on a page in the File namespace, try to
     get uploader's name from the topmost entry in the file history on the page.
     
     if $1 is used, optional prompt_text may be specified. Default if none given is "Reason:"
   */
  
  mark : function (what, title, user, revision, dont_save, dont_close)
  {
    if (!what) return;
    var same_window = false;
    var is_edit_page = false;
    if (!title) {
      title = wgPageName;
      is_edit_page = (wgAction == 'edit' && document.getElementById ('editform') != null);
      same_window = (wgAction == 'view' || is_edit_page);
    }
    if (!notification_definitions[what]) {
      alert ('Unknown notification for "' + what + '"; aborted.');
      return;
    }
    var img_template = notification_definitions[what].img_template;
    if (!img_template) return;
    var talk_template = notification_definitions[what].talk_template;
    var img_summary = notification_definitions[what].img_summary || "";
    var talk_summary = notification_definitions[what].talk_summary || "";
    var reason = "";
    if ((img_template + ' ' + talk_template + ' ' + img_summary + ' ' + talk_summary).indexOf ('$1') >= 0)
    {
      reason = Notifier.safe_prompt (notification_definitions[what].prompt_text || 'Reason:');
      if (!reason || reason.length == 0) return; // Cancelled
    }
    if (talk_template) {
      if (!user || user.length == 0) {
        user = Notifier.get_user_from_page ();
        if (!user) {
          Notifier.get_user_from_server
            (  title
             , function (user) {
                 Notifier.do_mark
                   (  title, user, reason
                    , img_template, img_summary, talk_template, talk_summary, revision
                    , dont_save, dont_close, same_window, is_edit_page);
               }
            );
          return;
        }
      }
    } else
      user = null;
    
    Notifier.do_mark
      (  title, user, reason
       , img_template, img_summary, talk_template, talk_summary, revision
       , dont_save, dont_close, same_window, is_edit_page);
  },
  
  do_mark : function (  title, user, reason
                      , img_template, img_summary, talk_template, talk_summary, revision
                      , dont_save, dont_close, same_window, is_edit_page)
  {
    function subst (str)
    {
      return replaceVars (str, '$', '1FU', reason, title, user);
    }

    var user_action = "";
    if (user) {
      user_action =
        QuickModify.actions (
            ['a', '\n' + subst (talk_template)]
          , [(dont_save ? 'e' : (dont_close ? 's' : 'c')), subst (talk_summary)]
        );
    }
    if (is_edit_page) {
      var text = document.getElementById ('wpTextbox1');
      text.value = subst (img_template) + '\n' + text.value;
      scrollTextArea (text, true);
      setEditSummary (subst (img_summary));
      if (user) {
        var edit_lk = wgServer + wgScript
                    + '?title=User_talk:' + encodeURIComponent (user) + '&action=edit';
        QuickModify.execute (
            edit_lk
          , user_action
        );
      }
    } else {
      var edit_lk = wgServer + wgScript
                  + '?title=' + encodeURIComponent (title) + '&action=edit';
      QuickModify.execute (
          edit_lk
        , QuickModify.actions (
              (revision ? ['h', revision] : null)
            , ['i', subst (img_template) + '\n']
            , [(dont_save ? 'e' : (user && !dont_close && !same_window ? 'c' : 's')), subst (img_summary)]
          )
        + (user ? QuickModify.join (
                      'User talk:' + user
                    , user_action
                  )
                : ""
          )
        , same_window
      );
    } // end if
  },

  nominateForDeletion : function (title, user, revision, prompt_text, dont_save, dont_close)
  {
    var reason = Notifier.safe_prompt (prompt_text || 'Why should this file be deleted?', "");
    if (!reason || reason.length == 0) return;
    var same_window = false;
    var is_edit_page = false;
    if (!title) {
      title = wgPageName;
      is_edit_page = (wgAction == 'edit' && document.getElementById ('editform') != null);
      same_window = (wgAction == 'view' || is_edit_page);
    }
    if (!user || user.length == 0) {
      user = Notifier.get_user_from_page ();
      if (!user) {
        Notifier.get_user_from_server
          (  title
           , function (user) {
               if (!user) return;
               Notifier.do_delreq (  title, user, reason, revision
                                   , dont_save, dont_close, same_window, is_edit_page);
             }
          );
        return;
      }
    }
    Notifier.do_delreq (  title, user, reason, revision
                        , dont_save, dont_close, same_window, is_edit_page);
  },

  do_delreq : function (  title, user, reason, revision
                        , dont_save, dont_close, same_window, is_edit_page)
  {
    var today = new Date ();
    var day   = today.getUTCDate ();
    day = (day < 10 ? '0' : "") + day;
    var month = today.getUTCMonth () + 1;
    month = (month < 10 ? '0' : "") + month;
    var del_req_log = nfd_delReq + '/' + today.getUTCFullYear () + '/' + month + '/' + day;
    var del_req     = nfd_delReq + '/' + title;
    // Create the DR, add it in the log, tag the page, and notify the user. Make sure that the page
    // is tagged only once the DR exists, otherwise the delete-template may claim the nomination was
    // incomplete and we would need to purge the page at the end.
    var edit_lk  = null;
    var commands = null;
    var create_del_req =
      QuickModify.actions (
          ['a', '=== [[:' + title + ']] ===\n\n' + reason + ' \~\~\~\~\n']
        , [(dont_save ? 'e' : (dont_close ? 's' : 'c')), 'Nominating [[:' + title + ']]']
      );
    if (same_window) {
      revision = null;
    }
    var tag_img_action =
      ['i', '\{\{' + nfd_deleteTemplate
                   + '|reason=' + reason
                   + '|subpage=\{\{subst:FULLPAGENAME\}\}' // or '|subpage=' + title 
                   + '|day=\{\{subst:CURRENTDAY\}\}'
                   + '|month=\{\{subst:CURRENTMONTHNAME\}\}'
                   + '|year=\{\{subst:CURRENTYEAR\}\}'
           +'\}\}\n'
      ];
    if (revision) {
      edit_lk = wgServer + wgScript + '?title=' + encodeURIComponent (title) + '&action=edit';
      commands =
          QuickModify.actions (
              ['h', revision]
            , (dont_save ? tag_img_action : ['c'])
            , (dont_save ? ['e', 'Nominating for deletion'] : null)
          )
        + QuickModify.join (del_req, create_del_req);
    } else {
      edit_lk = wgServer + wgScript + '?title=' + encodeURIComponent (del_req) + '&action=edit';
      commands = create_del_req;
    } // end if;
    commands = commands
      + ((revision && dont_save) || same_window
         ? "" // Modifications of page "title" already in revision ID check, since we don't save
         : QuickModify.join (
               title
             , QuickModify.actions (
                   tag_img_action
                 , [(dont_save ? 'e' : (dont_close ? 's' : 'c')), 'Nominating for deletion']
               )
           )
        )
      + (user ? QuickModify.join ( // Notify user, if we have a user
                    'User_talk:' + user
                  , QuickModify.actions (
                        ['a', '\n\{\{' + nfd_idwTemplate + '|' + title + '\}\}\~\~\~\~']
                      , [(dont_save ? 'e' : (dont_close ? 's' : 'c')), '[[:' + title + ']] nominated for deletion']
                    )
                )
              : ""
         )
      + QuickModify.join ( // Enter new deletion request in today's log page
            del_req_log
          , QuickModify.actions (
                ['a', '\n\{\{' + del_req + '\}\}']
              , [(dont_save ? 'e' : 's'), 'Nominating [[:' + title + ']]'] // Never close, might have edit conflicts
            )
        );

    QuickModify.execute (edit_lk, commands);
    if (same_window) {
      if (is_edit_page) {
        // Just insert the deletion template and set the edit summary
        var text = document.getElementById ('wpTextbox1');
        if (text) {
          text.value = tag_img_action[1] + text.value;
          scrollTextArea (text, true);
          setEditSummary ('Nominating for deletion');
        }
      } else {
        // Modify file page in place. Quick'n'dirty fix for the "purge" problem (if the file page
        // is saved before the DR page exists, the template will complain about an "incomplete
        // deletion request", and the file page must be purged to rectify that): delay a bit,
        // hoping that the creation of the DR is faster.
        window.setTimeout (
          function () {
            QuickModify.execute (
                wgServer + wgScript + '?title=' + encodeURIComponent (title) + '&action=edit'
              , QuickModify.actions (      
                    tag_img_action
                  , [(dont_save ? 'e' : 's'), 'Nominating for deletion'] // Never close, we didn't open it
                )
              , true
            );
          }
         ,notifier_timeout
        );
      } // end if is_edit_page
    }
  },
                  
  notify : function (text, user, edit_comment, dont_save, dont_close, same_window)
  {
    if (!text || text.length == 0) return;
    if (!user || user.length == 0) user = Notifier.get_user_from_page ();
    if (!user) return;
    var edit_lk = wgServer + wgScript + '?title=User_talk:' + encodeURIComponent (user) + '&action=edit';
    if (same_window) dont_close = true;
    QuickModify.execute (
        edit_lk
      , QuickModify.actions (
            ['a', '\n' + text]
          , (dont_save
              ? (edit_comment ? ['e', edit_comment] : null)
              : (edit_comment ? [(dont_close ? 's' : 'c'), edit_comment]
                              : [(dont_close ? 's' : 'c')]
                )
            )
        )
      , same_window
    );
  },

  notify_user : function (  text, user, edit_comment, dont_save, dont_close, same_window
                          , prompt, input_mandatory)
  {
    if (!text || text.length == 0) return;
    if (!user || user.length == 0) {
      if (wgNamespaceNumber == 2 || wgNamespaceNumber == 3) { // User or User talk
        user = wgTitle;
      } else
        user = Notifier.safe_prompt (notifier_user_query, "");
    }
    if (!user) return; // No user given: we're bust.
    var is_edit_page = false;
    if (wgNamespaceNumber == 3) {
      same_window = same_window || (Notifier.strip_namespace (wgPageName) == user);
      is_edit_page = (wgAction == 'edit' && document.getElementById ('editform') != null);
    }
    if ((text + ' ' + edit_comment).indexOf ('$1') > 0 && prompt && prompt.length > 0) {
      var input = Notifier.safe_prompt (prompt, "");
      if (input == null) return; // User cancelled
      if (input.length == 0 && input_mandatory) return; // Mandatory input not given
      text         = replaceVars (text, '$', '1', input);
      edit_comment = replaceVars (edit_comment, '$', '1', input);
    }
    if (is_edit_page) {
      var textbox = document.getElementById ('wpTextbox1');
      textbox.value = textbox.value + '\n' + text;
      scrollTextArea (textbox, false);
      setEditSummary (edit_comment);
      // Never save on an open edit page!
    } else {
      Notifier.notify (text, user, edit_comment, dont_save, dont_close, same_window);
    }
  },

  // Internal routines
  safe_prompt : function (label, default_text)
  {
    var input = prompt (label, default_text || "");
    if (input) input = input.replace(/^\s\s*/, "").replace(/\s\s*$/, ""); // Strip leading and trailing whitespace
    if (input && input.length > 0) {
      if (   typeof (TextCleaner) != 'undefined'
          && typeof (TextCleaner.sanitizeWikiText) == 'function')
      {
        input = TextCleaner.sanitizeWikiText (input, true);
      }
    }
    return input;
  },
  
  get_user_from_page : function ()
  {
    if (wgNamespaceNumber != 6) return null;
    var filehistory = getElementsByClassName (document, 'table', 'filehistory');
    if (!filehistory || filehistory.length == 0) return null;
    var uploaders = getElementsByClassName (filehistory[0], 'a', 'mw-userlink');
    if (!uploaders || uploaders.length == 0) return null;
    var user = Notifier.strip_namespace (Notifier.get_article_from_href (uploaders[0].href));
    var i = 1;
    while (user && (user == 'FlickreviewR' || user == 'Rotatebot' || user == 'Cropbot') && i < uploaders.length) {
      // FlickrevieweR uploaded original size from Flickr, or Rotatebot rotated. Try earlier entries.
      // 2009-02-27 added Cropbot to the list of uploaders to ignore -- ChrisiPK
      user = Notifier.strip_namespace (Notifier.get_article_from_href (uploaders[i].href));
      i = i + 1;
    }
    uploaders = null;
    if (user) {
      var new_user = null;
      if (user.replace (/ /g, '_') == 'Flickr_upload_bot') {
        // Let's try to find the *real* uploader
        uploaders = document.getElementById ('flickr_upload_bot_reviewer');
      } else if (user == 'FlickrLickr') {
        uploaders = document.getElementById ('fileinfotpl_rev');
        if (uploaders && uploaders.parentNode.cells.length > 1)
          uploaders = uploaders.parentNode.cells[1];
        else
          uploaders = null;
      } else if (user.replace (/ /g, '_') == 'File_Upload_Bot_(Magnus_Manske)') {
        uploaders = document.getElementById ('fileinfotpl_src');
        if (uploaders && uploaders.nodeName.toLowerCase () == 'th') {
          // Find the next TD
          uploaders = uploaders.nextSibling;
          while (uploaders && uploaders.nodeName.toLowerCase () != 'td')
            uploaders = uploaders.nextSibling;
        }
        if (uploaders) uploaders = uploaders.getElementsByTagName ('a');
        if (uploaders && uploaders.length > 1) {
          for (var l = 0; l < uploaders.length; l++) {
            if (   uploaders[l].href == 'http://tools.wikimedia.de/~magnus/commonshelper.php'
                || uploaders[l].href == 'http://toolserver.org/~magnus/geograph_org2commons.php') {
              if (l > 0) {
                new_user = Notifier.strip_namespace (Notifier.get_article_from_href (uploaders[l-1].href));
                break;
              }
            } else if (/www\.flickr\.com\/photos\//.test (uploaders[l].href)) {
              // Magnus' flickr2commons tool.
              if (l+1 < uploaders.length) {
                new_user = Notifier.strip_namespace (Notifier.get_article_from_href (uploaders[l+1].href));
                break;
              }
            }
          }
        }
        uploaders = null;
      }
      if (uploaders) {
        uploaders = uploaders.getElementsByTagName ('a');
        if (uploaders && uploaders.length > 0)
          new_user = Notifier.strip_namespace (Notifier.get_article_from_href (uploaders[0].href));
      }
      if (new_user) user = new_user;
    }
    return user;
  },

  get_user_from_server : function (title, callback)
  {
    var request = sajax_init_object ();
    if (!request) {
      callback (null); return;
    }
    var api = wgServer + wgScriptPath + '/api.php';
    var params =
        'format=json&action=query&prop=imageinfo|revisions&iiprop=user'
      + '&rvdir=older&rvprop=content&iilimit=10&rvlimit=1&titles=' + encodeURIComponent (title);
    request.open ('POST', api, true);
    request.setRequestHeader ('Content-type', 'application/x-www-form-urlencoded');
    request.setRequestHeader ('Content-length', params.length);
    request.onreadystatechange =
      function ()
      {
        if (request.readyState != 4) return;
        if (request.status == 200 && request.responseText && request.responseText.indexOf ('{') == 0)
          Notifier.get_user_from_json
            (eval ('(' + request.responseText + ')'), callback);
        else
          callback (null);
      };
    request.send (params);    
  },

  get_user_from_json : function (info, callback)
  {
    if (!info || !info.query || !info.query.pages) {
      callback (null); return;
    }
    var page = null;
    for (var p in info.query.pages) {
      page = info.query.pages[p]; break;
    }
    if (   !page
        || !page.imageinfo || page.imageinfo.length == 0
        || !page.revisions || page.revisions.length == 0) {
      callback (null); return;
    }
    var text = page.revisions[0];
    var img_log = page.imageinfo;
    var user = img_log[0].user;
    var i = 1;
    while (user && (user == 'FlickreviewR' || user == 'Rotatebot' || user == 'Cropbot') && i < img_log.length) {
      // FlickrevieweR uploaded original size from Flickr, or Rotatebot rotated.
      // Try earlier entries.
      user = img_log[i].user;
      i = i + 1;
    }
    if (text) text = text["*"];
    if (!text || !user) {
      callback (user); return;
    }
    var match = null; 
    if (user.replace (/ /g, '_') == 'Flickr_upload_bot') {
      // Check for the bot's upload template
      match =
        /\{\{User:Flickr upload bot\/upload(\|[^\|\}]*)?\|reviewer=([^\}]*)\}\}/.exec (text);
      if (match) match = match[2];
    } else if (user == 'File Upload Bot (Magnus Manske)') {
      // CommonsHelper
      match =
        /transferred to Commons by \[\[User:([^\]\|]*)(\|([^\]]*))?\]\] using/.exec (text);
      if (!match)
        // geograph_org2commons, regex accounts for typo ("transferd") and its possible
        // future correction
        match =
          /geograph.org.uk\]; transferr?e?d by \[\[User:([^\]\|]*)(\|([^\]]*))?\]\] using/.exec (text);
      if (!match && /(www\.)?flickr\.com\/photos\//.test (text))
        // flickr2commons
        match = /\* Uploaded by \[\[User:([^\]\|]*)(\|([^\]]*))?\]\]/.exec (text);
      if (match) match = match[1];
    } else if (user == 'FlickrLickr') {
      match = /\n\|reviewer=\s*(.*)\n/.exec (text);
      if (match) match = match[1];
    }
    if (match)
      user = match.replace (/^\s\s*/, "").replace (/\s\s*$/, "");
    callback (user);    
  },

  get_article_from_href : function (href)
  {
    var match = /[?&]title=([^&]*)/.exec (href);
    if (!match) {
      match = new RegExp(wgArticlePath.replace ('$1', '(.*)$'));
      match = match.exec (href);
    }
    if (match) return decodeURIComponent (match[1]);
    return null;
  },
  
  strip_namespace : function (page_name)
  {
    if (!page_name) return page_name;
    var title = page_name.substr (page_name.indexOf (':') + 1);
    return title;
  }

} // end Notifier

// Hook for localizations
if (wgUserLanguage != 'en') importScript ('MediaWiki:Notifier.js/' + wgUserLanguage);

} // end if (guard against double inclusion)

// </source>