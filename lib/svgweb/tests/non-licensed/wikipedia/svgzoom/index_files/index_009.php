/**
 * Implements language selection for multilingual elements
 * 
 * In certain environments, it's not feasible to neatly box away each
 * different language into its own section of the site. By marking elements
 * multilingual, you can emulate this behavior by only displaying the 
 * message in the user's language. This reduced the "Tower of Babel" effect.
 * 
 * @author Edward Z. Yang (Ambush Commander)
 * @version $Id: language_select.js 1358 2007-02-19 15:34:59Z Edward $
 */
 
/* Configuration: */
 
// in your monobook.js, set ls_enable = false to stop the javascript
// maybe it should be cookie configurable. However, you can achieve
// something almost to this effect through cookie settings
var ls_enable = true;
 
// the cookie name we use to stash the info.
// change this if you are porting it to another wiki!
var ls_cookie = 'commonswiki_language_js';
 
// link to the language select page
var ls_help_url = 'http://meta.wikimedia.org/wiki/Meta:Language_select';
 
// strings that are part of the widgets
var ls_string_help = {
    'en': 'Language select:',
    'ko': '언어 선택:',
    'nds':'Spraakutwahl:'

};
var ls_string_select = {
    'en': 'Select',
    'ko': '선택',
    'nds': 'Utwählen'
};
var ls_string_showall = {
    'en': 'Show all',
    'ko': '모두 보기',
    'nds': 'All wiesen'
};
 
// define some meta-variables
var ls__first = true; // the first iteration?
 
// node compatability fix
if (!window.Node) {
    var Node = {
        ELEMENT_NODE : 1,
        ATTRIBUTE_NODE: 2,
        TEXT_NODE: 3,
        COMMENT_NODE: 8,
        DOCUMENT_NODE: 9,
        DOCUMENT_FRAGMENT_NODE: 11
    };
}
 
// autodetects a browser language
function ls_getBrowserLanguage() {
    var language;
    // borrowed from Wikimedia's site error notice
    // find the language
    if (navigator.userLanguage) {
        // use the user's preferred language (non-Gecko)
        language = navigator.userLanguage;
    } else if (navigator.appName == 'Netscape') {
        // use the only language information available to Gecko
        language = navigator.language;
    } else {
        // get the browser language information in non-Gecko browsers
        // (IE, Opera, Konqueror)
        language = navigator.browserLanguage;
    }
    return language;
}
 
// grabs language from cookie
function ls_getCookieLanguage() {
    var allcookies = document.cookie;
    var marker = ls_cookie + '=';
    var pos = allcookies.indexOf(marker);
 
    // cookie isn't set, so no behavior defined
    if (pos === -1) return null;
 
    // cookie is set
    var start = pos + marker.length;
    var end   = allcookies.indexOf(';', start);
    if (end == -1) end = allcookies.length;
 
    var raw   = allcookies.substring(start,end);
    var value = unescape(raw);
 
    return value;
}
 
// sets a new language to the cookie
function ls_setCookieLanguage(language) {
    var today = new Date();
    var expiry = new Date(today.getUTCFullYear() + 30, 1);
    document.cookie = ls_cookie + '=' + escape(language) + '; expires=' + expiry.toGMTString();
}
 
// deletes the cookie
function ls_deleteCookieLanguage(language) {
    document.cookie = ls_cookie + '=; expires=Fri, 02-Jan-1970 00:00:00 GMT';
}
 
// grabs the ISO 639 language code based
// on either the browser or a supplied cookie
// return of "mul" will display all available strings
function ls_getLanguage() {
    var language = '';
 
    // Priority:
    //  1. Cookie
    //  2. wgUserLanguage global variable
    //  3. Browser autodetection
 
    // grab according to cookie
    language = ls_getCookieLanguage();
 
    // grab according to wgUserLanguage
    if (!language && window.wgUserLanguage) {
        language = wgUserLanguage;
    }
 
    // grab according to browser if none defined
    if (!language) {
        language = ls_getBrowserLanguage();
    }
 
    // inflexible: can't accept multiple languages
 
    // remove dialect/region code, leaving only the ISO 639 code
    var length;
    // possible bug: supposedly the language string could be en_US
    // switch to regexps when we get the chance
    if ((length = language.indexOf('-')) !== -1) {
        language = language.substr(0, length);
    }
 
    return language;
}
 
// walks all child elements and finds all elements with multilingual in them
function ls_getAllMultilingualElements(n) {
    var elements = new Array();
    // possible bug if we have a classname that includes the word multilingual
    //   but it's unlikely
    if (n.className && n.className.indexOf('multilingual') != -1) {
        elements = elements.concat(n);
    }
    var children = n.childNodes;
    for(var i=0; i < children.length; i++) {
        if (children[i].nodeType !== Node.ELEMENT_NODE) continue;
        elements = elements.concat(ls_getAllMultilingualElements(children[i]));
    }
    return elements;
}
 
// walks a hash and hides all non-matching languages
function ls_hideAllExcept(lang_element_hash, language) {
    for (var n in lang_element_hash) {
        if (n == language) {
            lang_element_hash[n].style.display = '';
        } else {
            lang_element_hash[n].style.display = 'none';
        }
    }
}
 
// walks a hash and shows all languages
function ls_showAll(lang_element_hash) {
    for (var n in lang_element_hash) {
        if (lang_element_hash[n].style.display) {
            lang_element_hash[n].style.display = '';
        }
    }
}

var ls_string_help_text = ls_string_help[wgUserLanguage] || ls_string_help['en'];
// build widget for changing the language cookie
function ls_buildWidget(language) {
 
    // set up the floating form
    var form = document.createElement('form');
    form.className = 'lang_info';
    form.onsubmit = function() {
        if (this.elements[2].ls_mul_flag) {
            this.elements[2].ls_mul_flag = false;
            var language = 'mul';
            var temporary = true;
        } else {
            ls_setCookieLanguage(this.elements[0].value);
            var language = this.elements[0].value;
            var temporary = false;
        }
        ls_applyLanguageSelect(language, temporary);
 
        return false; // don't perform action
    };
    form.appendSpace = function() {
        this.appendChild(document.createTextNode(' '));
    };
 
    // link to language select description page
    var link = document.createElement('a');
    link.href = ls_help_url;
    link.className = 'ls_link';
    link.appendChild(document.createTextNode(ls_string_help_text));
    form.appendChild(link);
 
    form.appendSpace();
 
    // input box for the language
    var input = document.createElement('input');
    input.setAttribute('type', 'text');
    input.setAttribute('size', '2');
//    input.setAttribute('maxlength', '7');
    input.onclick = function() { this.select(); };
    input.className = 'ls_input';
    input.value = language;
    form.appendChild(input);
 
    form.appendSpace();
 
    // save button
    var submit = document.createElement('input');
    submit.setAttribute('type', 'submit');
    submit.value = ls_string_select[wgUserLanguage] || ls_string_select['en'];
    submit.className = 'ls_select';
    form.appendChild(submit);
 
    form.appendSpace();
 
    // show all button 
    // equivalent to setting input box to "mul" and pressing save
    var showall = document.createElement('input');
    showall.setAttribute('type', 'submit');
    showall.value = ls_string_showall[wgUserLanguage] || ls_string_showall['en'];
    showall.onclick = function() {
        this.ls_mul_flag = true;
    };
    form.appendChild(showall);
 
    return form;
 
}
 
// main body of the function
function ls_applyLanguageSelect(language, temporary) {
 
    // possible site for cookie checking to disable language select
    if (!ls_enable) return;
 
    // if language is blank, delete the cookie and then recalculate
    if (!language) {
        ls_deleteCookieLanguage();
        language = ls_getLanguage();
    }
 
    // grab the body element (only one)
    var body = document.getElementsByTagName('body')[0];
 
    // grab an array of multilingual elements
    var mls = ls_getAllMultilingualElements(body);
 
    // this will get overwritten many times, temporary variable
    var form, language_element_hash;
 
    // iterate through all those elements
    for (var i = 0; i < mls.length; i++) {
        var ml   = mls[i];        // the current multilingual container
        var ml_c = ml.childNodes; // children of the container
 
        // if it's the first iteration...
        if (ls__first) {
            form = ls_buildWidget(language);
            ml.appendChild(form, ml_c[0]);
        } else {
            // update widget
            form = ml_c[ml_c.length - 1]; // form is last element
            if (!temporary) {
                form.elements[0].value = language;
                form.elements[0].removeAttribute('disabled');
                form.elements[2].removeAttribute('disabled');
            } else {
                form.elements[0].setAttribute('disabled', 'disabled');
                form.elements[2].setAttribute('disabled', 'disabled');
            }
        }
 
        form.elements[0].style.background="#FFF";
 
        // tells us whether or not to blindly perform the keep
        var message_exists  = false;
 
        // iterate through all languages and set up a hash
        //   with references to each of the language nodes
        lang_element_hash = new Object();
        for (var j = 0; j < ml_c.length; j++) {
            var n = ml_c[j];
            if (n.nodeType != Node.ELEMENT_NODE) continue; // skip non-elements
            if (!n.lang) continue; // skip non-language specific elements
            if (n.lang.indexOf(language) === 0) {
                // it turns out our language is here
                message_exists  = true;
            }
            lang_element_hash[n.lang] = n;
        }
 
        // if a preferred language was kept, do quickest processing
        if (message_exists) {
            ls_hideAllExcept(lang_element_hash, language);
            continue;
        }
 
        // otherwise, nothing happened, this means that it wasn't found
 
        // if it's not the first time, repaint all of them
        if (!ls__first) {
            ls_showAll(lang_element_hash);
        }
 
        if (language != 'mul') {
            form.elements[0].style.background="#FCC";
        }
 
    }
 
    // we've already processed once
    ls__first = false;
 
}
 
function ls_applyDefaultLanguageSelect() {
    ls_applyLanguageSelect(ls_getLanguage(), false);
}
 
// register as onload function (there must be a better way)
if (window.addEventListener) {
    window.addEventListener("load", ls_applyDefaultLanguageSelect, false);
} else if (window.attachEvent) {
    window.attachEvent("onload", ls_applyDefaultLanguageSelect);
}