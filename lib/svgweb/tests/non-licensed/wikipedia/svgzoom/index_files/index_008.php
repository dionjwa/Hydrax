//
// Textblock folding code. 
// Used in the {{FoldHead}}, {{FoldBody}}, {{FoldFoot}} template family.
// 

var NavigationBarHide = '▲';
var NavigationBarShow = '▼';
var NavigationBarShowDefault = 5;

// shows and hides content and picture (if available) of navigation bars
// Parameters:
//     indexNavigationBar: the index of navigation bar to be toggled
//     forceHide         : if true, hide the nav bar if shown, else do nothing.
function toggleNavigationBar(indexNavigationBar, forceHide)
{
 var NavToggle = document.getElementById("NavToggle" + indexNavigationBar);
 var NavFrame = document.getElementById("NavFrame" + indexNavigationBar);

 if (!NavFrame || !NavToggle) {
  return false;
 }

 // parse title attribute, TODO: remove
 var ShowText;
 if (NavFrame.title == undefined || NavFrame.title.length == 0 ) {
  ShowText = NavigationBarShow;
 } else {
  ShowText = NavFrame.title;
 }

 // if shown now
 if (NavToggle.firstChild.data == NavigationBarHide) {
  for (
   var NavChild = NavFrame.firstChild;
   NavChild != null;
   NavChild = NavChild.nextSibling
  ) {
   if (NavChild.className == 'NavPic') {
    NavChild.style.display = 'none';
   }
   if (NavChild.className == 'NavContent') {
    NavChild.style.display = 'none';
   }
  }
  NavToggle.firstChild.data = ShowText;
 // if hidden now
 } else if (NavToggle.firstChild.data == ShowText && !forceHide) {
  for (
   var NavChild = NavFrame.firstChild;
   NavChild != null;
   NavChild = NavChild.nextSibling
  ) {
   if (NavChild.className == 'NavPic') {
    NavChild.style.display = 'block';
   }
   if (NavChild.className == 'NavContent') {
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

 // iterate over all < div > - elements
 var NavFrame = document.getElementsByTagName("div");
 var len = NavFrame.length;
 for (var i=0; i < len; i++) {

  // if found a navigation bar
  if (NavFrame[i].className == "NavFrame") {

   indexNavigationBar++;
   var NavToggle = document.createElement("a");
   NavToggle.className = 'NavToggle';
   NavToggle.setAttribute('id', 'NavToggle' + indexNavigationBar);
   NavToggle.setAttribute('href', 'javascript:toggleNavigationBar(' + indexNavigationBar + ');');

   var NavToggleText = document.createTextNode(NavigationBarHide);
   NavToggle.appendChild(NavToggleText);

   // find the NavHead and attach the toggle link (Must be this complicated because Moz's firstChild handling is borked)
   for (var j=0; j < NavFrame[i].childNodes.length; j++) {
    if (NavFrame[i].childNodes[j].className == "NavHead") {
     NavFrame[i].childNodes[j].appendChild(NavToggle);
    }
    if (NavFrame[i].childNodes[j].className == "NavContent") {
     if (NavFrame[i].childNodes[j].style.display == "none") 
      NavToggleText.data = NavigationBarShow;
    }
    }
   NavFrame[i].setAttribute('id', 'NavFrame' + indexNavigationBar);
  }
 }

 // if more Navigation Bars found than Default: hide all
 if (NavigationBarShowDefault < indexNavigationBar) {
  for (var i=1; i <= indexNavigationBar; i++) 
   toggleNavigationBar(i, true);
 }
}

addOnloadHook(createNavigationBarToggleButton);