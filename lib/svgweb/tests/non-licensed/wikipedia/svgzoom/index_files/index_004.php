//<nowiki>
var functionName = getParamValue("function");
function universal_replace () {
      var old_image = getParamValue("oldimage");
      var new_image = getParamValue("newimage");
      var reason = getParamValue("replace_reason");
      if (wgPageName == 'User:CommonsDelinker/commands') {
            document.editform.wpTextbox1.value += '\{\{universal replace|' + '{{subst:PAGENAME:' + old_image + '}}' + '|' + '{{subst:PAGENAME:' + new_image + '}}' + '|reason=' + '{{subst:PAGENAME:' + reason + '\}\}' + '\}\}' /* Note: '{{subst:PAGENAME:' + ... + '\}\}' is a fake parser function but used for converting URL-encoded form to normal form. */ 
            document.editform.wpDiff.click();
      }
}

function move_cat () {
      var oldcat = getParamValue("oldcat");
      var newcat = getParamValue("newcat");
      if (wgPageName == 'User:CommonsDelinker/commands') {
            document.editform.wpTextbox1.value += '\{\{move cat|' + '{{subst:PAGENAME:' +  oldcat + '}}' + '|' +'{{subst:PAGENAME:' +  newcat + '}}'+'\}\}'
            document.editform.wpDiff.click();
      }
}
      
for ( var key in wgUserGroups ) { 
   if (wgUserGroups[key] == "sysop" && functionName == "replace") {
      addOnloadHook(universal_replace);
   } else if (wgUserGroups[key] == "sysop" && functionName == "movecat") {
      addOnloadHook(move_cat);
   }
}
//</nowiki>