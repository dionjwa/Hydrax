/* generated javascript */
var skin = 'monobook';
var stylepath = '/skins-1.5';

/* MediaWiki:Common.js */
//<source lang="javascript">

/* Import more specific scripts if necessary */

if (wgAction == "edit" || wgAction == "submit" || wgPageName == "Special:Upload") //scripts specific to editing pages
{
    importScript("MediaWiki:Common.js/edit.js")
}
else if (wgPageName == "Special:Watchlist") //watchlist scripts
{
    importScript("MediaWiki:Common.js/watchlist.js")
}


/** Sysop Javascript *******************************************************
  *
  *  Description: Allows for sysop-specific Javascript at [[MediaWiki:Sysop.js]].
  */
function sysopFunctions() {
    if ( wgUserGroups && !window.disableSysopJS ) {
        for ( var g = 0; g < wgUserGroups.length; ++g ) {
            if ( wgUserGroups[g] == "sysop" ) {
                importScript( "MediaWiki:Sysop.js" );
                break;
            }
        }
    }
}

addOnloadHook( sysopFunctions );


/** WikiMiniAtlas *******************************************************
  *
  *  Description: WikiMiniAtlas is a popup click and drag world map.
  *               This script causes all of our coordinate links to display the WikiMiniAtlas popup button.
  *               The script itself is located on meta because it is used by many projects.
  *               See [[Meta:WikiMiniAtlas]] for more information. 
  *  Maintainers: [[User:Dschwen]]
  */

if (wgServer == "https://secure.wikimedia.org") {
    var metaBase = "https://secure.wikimedia.org/wikipedia/meta";
} else {
    var metaBase = "http://meta.wikimedia.org";
}
importScriptURI(metaBase+"/w/index.php?title=MediaWiki:Wikiminiatlas.js&action=raw&ctype=text/javascript&smaxage=21600&maxage=86400")


/* JavaScript for mobile devices */
if (/(Android|iPhone|iPod|webOS)/.test(navigator.userAgent)) {
    importScript("MediaWiki:Common.js/mobile.js")
}


/* Scripts specific to Internet Explorer */

if (navigator.appName == "Microsoft Internet Explorer")
{
    /** Internet Explorer bug fix **************************************************
     *
     *  Description: Fixes IE horizontal scrollbar bug
     *  Maintainers: [[User:Tom-]]?
     */
    
    var oldWidth;
    var docEl = document.documentElement;
    
    function fixIEScroll()
    {
        if (!oldWidth || docEl.clientWidth > oldWidth)
            doFixIEScroll();
        else
            setTimeout(doFixIEScroll, 1);
        
        oldWidth = docEl.clientWidth;
    }
    
    function doFixIEScroll() {
        docEl.style.overflowX = (docEl.scrollWidth - docEl.clientWidth < 4) ? "hidden" : "";
    }
    
    document.attachEvent("onreadystatechange", fixIEScroll);
    document.attachEvent("onresize", fixIEScroll);
    
    
    /**
     * Remove need for CSS hacks regarding MSIE and IPA.
     */
    if (document.createStyleSheet) {
        document.createStyleSheet().addRule('.IPA', 'font-family: "Doulos SIL", "Charis SIL", Gentium, "DejaVu Sans", Code2000, "TITUS Cyberbit Basic", "Arial Unicode MS", "Lucida Sans Unicode", "Chrysanthi Unicode";');
    }

    // In print IE (7?) does not like line-height
    appendCSS( '@media print { sup, sub, p, .documentDescription { line-height: normal; }}');
    
    //Import scripts specific to Internet Explorer 6
    if (navigator.appVersion.substr(22, 1) == "6") {
        importScript("MediaWiki:Common.js/IE60Fixes.js")
    }
}


/* Test if an element has a certain class **************************************
 *
 * Description: Uses regular expressions and caching for better performance.
 * Maintainers: [[User:Mike Dillon]], [[User:R. Koot]], [[User:SG]]
 */

var hasClass = (function () {
    var reCache = {};
    return function (element, className) {
        return (reCache[className] ? reCache[className] : (reCache[className] = new RegExp("(?:\\s|^)" + className + "(?:\\s|$)"))).test(element.className);
    };
})();


/** Interwiki links to featured articles ***************************************
 *
 *  Description: Highlights interwiki links to featured articles (or
 *               equivalents) by changing the bullet before the interwiki link
 *               into a star.
 *  Maintainers: [[User:R. Koot]]
 */

function LinkFA() 
{
    if ( document.getElementById( "p-lang" ) ) {
        var InterwikiLinks = document.getElementById( "p-lang" ).getElementsByTagName( "li" );

        for ( var i = 0; i < InterwikiLinks.length; i++ ) {
            if ( document.getElementById( InterwikiLinks[i].className + "-fa" ) ) {
                InterwikiLinks[i].className += " FA"
                InterwikiLinks[i].title = "This is a featured article in another language.";
            }
        }
    }
}

addOnloadHook( LinkFA );


/** Collapsible tables *********************************************************
 *
 *  Description: Allows tables to be collapsed, showing only the header. See
 *               [[Wikipedia:NavFrame]].
 *  Maintainers: [[User:R. Koot]]
 */

var autoCollapse = 2;
var collapseCaption = "hide";
var expandCaption = "show";

function collapseTable( tableIndex )
{
    var Button = document.getElementById( "collapseButton" + tableIndex );
    var Table = document.getElementById( "collapsibleTable" + tableIndex );

    if ( !Table || !Button ) {
        return false;
    }

    var Rows = Table.rows;

    if ( Button.firstChild.data == collapseCaption ) {
        for ( var i = 1; i < Rows.length; i++ ) {
            Rows[i].style.display = "none";
        }
        Button.firstChild.data = expandCaption;
    } else {
        for ( var i = 1; i < Rows.length; i++ ) {
            Rows[i].style.display = Rows[0].style.display;
        }
        Button.firstChild.data = collapseCaption;
    }
}

function createCollapseButtons()
{
    var tableIndex = 0;
    var NavigationBoxes = new Object();
    var Tables = document.getElementsByTagName( "table" );

    for ( var i = 0; i < Tables.length; i++ ) {
        if ( hasClass( Tables[i], "collapsible" ) ) {

            /* only add button and increment count if there is a header row to work with */
            var HeaderRow = Tables[i].getElementsByTagName( "tr" )[0];
            if (!HeaderRow) continue;
            var Header = HeaderRow.getElementsByTagName( "th" )[0];
            if (!Header) continue;

            NavigationBoxes[ tableIndex ] = Tables[i];
            Tables[i].setAttribute( "id", "collapsibleTable" + tableIndex );

            var Button     = document.createElement( "span" );
            var ButtonLink = document.createElement( "a" );
            var ButtonText = document.createTextNode( collapseCaption );

            Button.className = "collapseButton";  //Styles are declared in Common.css

            ButtonLink.style.color = Header.style.color;
            ButtonLink.setAttribute( "id", "collapseButton" + tableIndex );
            ButtonLink.setAttribute( "href", "javascript:collapseTable(" + tableIndex + ");" );
            ButtonLink.appendChild( ButtonText );

            Button.appendChild( document.createTextNode( "[" ) );
            Button.appendChild( ButtonLink );
            Button.appendChild( document.createTextNode( "]" ) );

            Header.insertBefore( Button, Header.childNodes[0] );
            tableIndex++;
        }
    }

    for ( var i = 0;  i < tableIndex; i++ ) {
        if ( hasClass( NavigationBoxes[i], "collapsed" ) || ( tableIndex >= autoCollapse && hasClass( NavigationBoxes[i], "autocollapse" ) ) ) {
            collapseTable( i );
        } 
        else if ( hasClass( NavigationBoxes[i], "innercollapse" ) ) {
            var element = NavigationBoxes[i];
            while (element = element.parentNode) {
                if ( hasClass( element, "outercollapse" ) ) {
                    collapseTable ( i );
                    break;
                }
            }
        }
    }
}

addOnloadHook( createCollapseButtons );


/** Dynamic Navigation Bars (experimental) *************************************
 *
 *  Description: See [[Wikipedia:NavFrame]].
 *  Maintainers: UNMAINTAINED
 */

// set up the words in your language
var NavigationBarHide = '[' + collapseCaption + ']';
var NavigationBarShow = '[' + expandCaption + ']';

// shows and hides content and picture (if available) of navigation bars
// Parameters:
//     indexNavigationBar: the index of navigation bar to be toggled
function toggleNavigationBar(indexNavigationBar)
{
    var NavToggle = document.getElementById("NavToggle" + indexNavigationBar);
    var NavFrame = document.getElementById("NavFrame" + indexNavigationBar);

    if (!NavFrame || !NavToggle) {
        return false;
    }

    // if shown now
    if (NavToggle.firstChild.data == NavigationBarHide) {
        for (var NavChild = NavFrame.firstChild; NavChild != null; NavChild = NavChild.nextSibling) {
            if ( hasClass( NavChild, 'NavPic' ) ) {
                NavChild.style.display = 'none';
            }
            if ( hasClass( NavChild, 'NavContent') ) {
                NavChild.style.display = 'none';
            }
        }
    NavToggle.firstChild.data = NavigationBarShow;

    // if hidden now
    } else if (NavToggle.firstChild.data == NavigationBarShow) {
        for (var NavChild = NavFrame.firstChild; NavChild != null; NavChild = NavChild.nextSibling) {
            if (hasClass(NavChild, 'NavPic')) {
                NavChild.style.display = 'block';
            }
            if (hasClass(NavChild, 'NavContent')) {
                NavChild.style.display = 'block';
            }
        }
        NavToggle.firstChild.data = NavigationBarHide;
    }
}

// adds show/hide-button to navigation bars
function createNavigationBarToggleButton()
{
    var indexNavigationBar = 0;
    // iterate over all < div >-elements 
    var divs = document.getElementsByTagName("div");
    for (var i = 0; NavFrame = divs[i]; i++) {
        // if found a navigation bar
        if (hasClass(NavFrame, "NavFrame")) {

            indexNavigationBar++;
            var NavToggle = document.createElement("a");
            NavToggle.className = 'NavToggle';
            NavToggle.setAttribute('id', 'NavToggle' + indexNavigationBar);
            NavToggle.setAttribute('href', 'javascript:toggleNavigationBar(' + indexNavigationBar + ');');

            var isCollapsed = hasClass( NavFrame, "collapsed" );
            /*
             * Check if any children are already hidden.  This loop is here for backwards compatibility:
             * the old way of making NavFrames start out collapsed was to manually add style="display:none"
             * to all the NavPic/NavContent elements.  Since this was bad for accessibility (no way to make
             * the content visible without JavaScript support), the new recommended way is to add the class
             * "collapsed" to the NavFrame itself, just like with collapsible tables.
             */
            for (var NavChild = NavFrame.firstChild; NavChild != null && !isCollapsed; NavChild = NavChild.nextSibling) {
                if ( hasClass( NavChild, 'NavPic' ) || hasClass( NavChild, 'NavContent' ) ) {
                    if ( NavChild.style.display == 'none' ) {
                        isCollapsed = true;
                    }
                }
            }
            if (isCollapsed) {
                for (var NavChild = NavFrame.firstChild; NavChild != null; NavChild = NavChild.nextSibling) {
                    if ( hasClass( NavChild, 'NavPic' ) || hasClass( NavChild, 'NavContent' ) ) {
                        NavChild.style.display = 'none';
                    }
                }
            }
            var NavToggleText = document.createTextNode(isCollapsed ? NavigationBarShow : NavigationBarHide);
            NavToggle.appendChild(NavToggleText);

            // Find the NavHead and attach the toggle link (Must be this complicated because Moz's firstChild handling is borked)
            for(var j=0; j < NavFrame.childNodes.length; j++) {
                if (hasClass(NavFrame.childNodes[j], "NavHead")) {
                    NavFrame.childNodes[j].appendChild(NavToggle);
                }
            }
            NavFrame.setAttribute('id', 'NavFrame' + indexNavigationBar);
        }
    }
}

addOnloadHook( createNavigationBarToggleButton );


/** Main Page layout fixes *********************************************************
 *
 *  Description: Adds an additional link to the complete list of languages available.
 *  Maintainers: [[User:AzaToth]], [[User:R. Koot]], [[User:Alex Smotrov]]
 */

if (wgPageName == 'Main_Page' || wgPageName == 'Talk:Main_Page') 
    addOnloadHook(function () {
        addPortletLink('p-lang', 'http://meta.wikimedia.org/wiki/List_of_Wikipedias',
                 'Complete list', 'interwiki-completelist', 'Complete list of Wikipedias')
        var nstab = document.getElementById('ca-nstab-main')
        if (nstab && wgUserLanguage=='en') 
            nstab.firstChild.firstChild.nodeValue = 'Main Page'
    }
)


/** Table sorting fixes ************************************************
  *
  *  Description: Disables code in table sorting routine to set classes on even/odd rows
  *  Maintainers: [[User:Random832]]
  */

ts_alternate_row_colors = false;


/***** uploadwizard_newusers ********
 * Switches in a message for non-autoconfirmed users at [[Wikipedia:Upload]]
 *
 *  Maintainers: [[User:Krimpet]]
 ****/
function uploadwizard_newusers() {
  if (wgNamespaceNumber == 4 && wgTitle == "Upload" && wgAction == "view") {
    var oldDiv = document.getElementById("autoconfirmedusers"),
        newDiv = document.getElementById("newusers");
    if (oldDiv && newDiv) {
      if (typeof wgUserGroups == "object" && wgUserGroups) {
        for (i = 0; i < wgUserGroups.length; i++) {
          if (wgUserGroups[i] == "autoconfirmed") {
            oldDiv.style.display = "block";
            newDiv.style.display = "none";
            return;
          }
        }
      }
      oldDiv.style.display = "none";
      newDiv.style.display = "block";
      return;
    }
  }
}
addOnloadHook(uploadwizard_newusers);


/** IPv6 AAAA connectivity testing **/

var __ipv6wwwtest_factor = 100;
var __ipv6wwwtest_done = 0;
if ((wgServer != "https://secure.wikimedia.org") && (Math.floor(Math.random()*__ipv6wwwtest_factor)==42)) {
    importScript("MediaWiki:Common.js/IPv6.js");
}

/** Magic editintros ****************************************************
 *
 *  Description: Adds editintros on disambiguation pages and BLP pages.
 *  Maintainers: [[User:RockMFR]]
 */

function addEditIntro(name)
{
  var el = document.getElementById('ca-edit');
  if (!el)
    return;
  el = el.getElementsByTagName('a')[0];
  if (el)
    el.href += '&editintro=' + name;
}


if (wgNamespaceNumber == 0) {
  addOnloadHook(function(){
    if (document.getElementById('disambig') || document.getElementById('disambigbox'))
      addEditIntro('Template:Disambig_editintro');
  });

  addOnloadHook(function(){
    var cats = document.getElementById('mw-normal-catlinks');
    if (!cats)
      return;
    cats = cats.getElementsByTagName('a');
    for (var i = 0; i < cats.length; i++) {
      if (cats[i].title == 'Category:Living people' || cats[i].title == 'Category:Possibly living people') {
        addEditIntro('Template:BLP_editintro');
        break;
      }
    }
  });
}

//</source>

/* MediaWiki:Monobook.js */
/* <source lang=javascript> */
/* Any JavaScript here will be loaded for users using the MonoBook skin */

/** Anon tips and donation banner **************************
  *
  *  Description: This implements an anon tips / donation banner. It includes a workaround for
  *               the Z-index bug found in Internet Explorer. It correctly places the anon notice
  *               on the page, even under IE6. See this Google search for more information about the bug:
  *               http://www.google.com/search?q=z-index+ie6+bug
  *  Maintainers: [[User:Gmaxwell]], [[User:MZMcBride]]
  */

if(wgUserName == null) addOnloadHook((function (){
    var message=new Array();
        message[0]='Your <a href="http://wikimediafoundation.org/wiki/Donate/Now/en?utm_source=enwiki_00&utm_medium=anon_donation_banner&utm_campaign=spontaneous_donation" class="extiw" title="wikimedia:Fundraising"><b>continued donations</b></a> keep Wikipedia running!';
        message[1]='<a href="http://wikimediafoundation.org/wiki/Donate/Now/en?utm_source=enwiki_01&utm_medium=anon_donation_banner&utm_campaign=spontaneous_donation" class="extiw" title="foundation:Fundraising"><b>Make a donation</b></a> to Wikipedia and give the gift of knowledge!';
        message[2]='Wikipedia is sustained by people like you. Please <a href="http://wikimediafoundation.org/wiki/Donate/Now/en?utm_source=enwiki_02&utm_medium=anon_donation_banner&utm_campaign=spontaneous_donation" class="extiw" title="foundation:fundraising"><b>donate</b></a> today.';
        message[3]='Help us improve Wikipedia by <a href="http://wikimediafoundation.org/wiki/Donate/Now/en?utm_source=enwiki_03&utm_medium=anon_donation_banner&utm_campaign=spontaneous_donation" class="extiw" title="foundation:Fundraising"><b>supporting it financially</b></a>.';
        message[4]='You can <a href="http://wikimediafoundation.org/wiki/Donate/Now/en?utm_source=enwiki_04&utm_medium=anon_donation_banner&utm_campaign=spontaneous_donation" class="extiw" title="wikimedia:Fundraising"><b>support Wikipedia</b></a> by making a tax-deductible donation.'
        message[5]='Help us provide free content to the world by <a href="http://wikimediafoundation.org/wiki/Donate/Now/en?utm_source=enwiki_05&utm_medium=anon_donation_banner&utm_campaign=spontaneous_donation" class="extiw" title="foundation:Fundraising"><b>donating today</b></a>!';
        message[6]='<a href="http://en.wikipedia.org/wiki/Wikipedia:Researching_with_Wikipedia" title="Wikipedia:Researching with Wikipedia">Learn more about using Wikipedia for research.</a>';
        message[7]='<a href="http://en.wikipedia.org/wiki/Wikipedia:Ten_things_you_may_not_know_about_Wikipedia" title="Wikipedia:Ten things you may not know about Wikipedia">Ten things you may not know about Wikipedia.</a>';
        message[8]='<a href="http://en.wikipedia.org/wiki/Wikipedia:Ten_things_you_may_not_know_about_images_on_Wikipedia" title="Wikipedia:Ten things you may not know about images on Wikipedia">Ten things you may not know about images on Wikipedia.</a>';
        message[9]='<a href="http://en.wikipedia.org/wiki/Wikipedia:Citing_Wikipedia" title="Wikipedia:Citing Wikipedia">Learn more about citing Wikipedia.</a>';
        message[10]='Have questions? <a href="http://en.wikipedia.org/wiki/Wikipedia:Questions" title="Wikipedia:Questions">Find out how to ask questions and get answers.</a>';
        message[11]='<a href="http://en.wikipedia.org/wiki/Wikipedia:Basic_navigation" title="Wikipedia:Basic navigation">Find out more about navigating Wikipedia and finding information.</a>';
        message[12]='<a href="http://en.wikipedia.org/wiki/Wikipedia:Contributing_to_Wikipedia" title="Wikipedia:Contributing to Wikipedia">Interested in contributing to Wikipedia?</a>';
    var weightLimit = 6;
    var biasPercent = 0.815;
    var whichMessage = (Math.random() < biasPercent) ? weightLimit : message.length;
 
    whichMessage = Math.floor(Math.random() * whichMessage);
 
    var wrapper = document.getElementById("globalWrapper");
    if (wrapper) {
        var div = document.createElement('div');
        div.id = "anon-banner";
        div.className = "noprint";
        div.style.cssText = "position:absolute; z-index:40; left:155px; top:1px; clear:both; float:left; font-size:90%; font-style:italic; white-space:nowrap";
        div.innerHTML = message[whichMessage];
        wrapper.insertBefore(div, wrapper.firstChild);
    }
}));


/** Topbar content fix with sitenotice / CentralNotice **************************
  *
  *  Description: This fixes the location of topbar content (e.g., featured
  *               content star) when the sitenotice or CentralNotice is active.
  *  Maintainers: [[User:TheDJ]], [[User:MZMcBride]]
  */

if((navigator.userAgent.indexOf("MSIE 6")==-1) && (wgAction == 'submit' || wgAction == 'view')) addOnloadHook(function() {
    var cnote = document.getElementById('centralNotice');
    if( !document.getElementById('mw-dismissible-notice') && !(cnote && hasClass(cnote, 'expanded'))) return;
    appendCSS('#bodyContent { position:relative; } \n.topicon { position:absolute; top:-2em !important;}\n#coordinates{ position:absolute; top:1px !important; }');
})
/* </source> */