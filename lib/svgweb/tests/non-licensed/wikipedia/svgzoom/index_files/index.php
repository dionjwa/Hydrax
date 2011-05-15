// <source lang="javascript">
 
/*
  Little helper script loaded when MediaWiki:UploadForm.js is used. It changes the
  "Upload a new version of this file" links on image pages to go to the basic form.
 
  Author: [[User:Lupo]], May 2008
  License: Quadruple licensed GFDL, GPL, LGPL and Creative Commons Attribution 3.0 (CC-BY-3.0)
 
  Choose whichever license of these you like best :-)

  Update 2009-02-03: server-side changes have made this script unnecessary.
*/

var UploadFormLinkFixer =
{
  fix_reupload_link : function ()
  {
    function html_escape (str)
    {
      // str must already be encoded, either by encodeURI or encodeURIComponent!
      var chars = "0123456789ABCDEF"; 
      return str.replace (/[^-_.%a-z0-9]/ig,
                          function (match)
                          {
                            var code = match.charCodeAt (0) & 0xFF;
                            return '%' + chars.charAt (code/16) + chars.charAt (code%16);
                          }
                         );
    }

    var lks     = getElementsByClassName (document, 'a', 'external');
    if (!lks) return;
    var pattern = 'title=Special:Upload&wpDestFile='
                + html_escape (encodeURIComponent (wgTitle.replace (/\s/g, '_')));

    for (var i = 0; i < lks.length; i++) {
      var j = lks[i].href.indexOf (pattern);
      if (j >= 0) {
        lks[i].href = lks[i].href.substring (0, j + pattern.length)
                    + '&uploadformstyle=basic'
                    + lks[i].href.substring (j + pattern.length);
        // lks[i].href = lks[i].href.replace ('&wpReUpload=1', '&wpForReUpload=1');
        // Temporary server-side bug fix; remove the above line once we're above r46483.
      }
    }
  }
}

/* Not needed anymore. Lupo, 2009-02-03
if (wgNamespaceNumber == 6) {
  hookEvent ('load', UploadFormLinkFixer.fix_reupload_link);
}
*/
// </source>