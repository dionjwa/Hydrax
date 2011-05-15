//<pre><nowiki>

addOnloadHook ( resize_galleries ) ;

function resize_galleries () {
  var bc = document.getElementById ( "bodyContent" ) ;
  var width = bc.offsetWidth ; // Visible width
  var padding = 20 ; // padding per TD
  var tables = getElementsByClassName ( document , "table" , "gallery" ) ;

  if ( tables.length == 0 ) return ;
  window.onresize = resize_galleries;

  for ( var tablecount = 0 ; tablecount < tables.length ; tablecount++ ) {
    var t = tables[tablecount] ;

    // Get DIVs and their parent nodes (TDs)
    var divs = getElementsByClassName ( t , "div" , "gallerybox" ) ;
    var tds = new Array () ;
    for ( var i = 0 ; i < divs.length ; i++ ) tds.push ( divs[i].parentNode ) ;

    // Remove Table Rows
    for ( var i = 0 ; i < t.rows.length ; i++ ) t.rows[i].parentNode.removeChild ( t.rows[i] ) ;

    // Remove Table guts ( old tbodies, anything with type 1 should go )
    for ( var i = 0 ; i < t.childNodes.length ; i++ ) 
     if( t.childNodes[i].nodeType == 1 && t.childNodes[i].tagName == "TR" ) t.removeChild ( t.childNodes[i] ) ;

    // Reorder
    var tb = document.createElement("tbody");
    var tr = null ;
    var curpos = 0 ;
    for ( var i = 0 ; i < tds.length ; i++ ) {
      var nextwidth = parseInt ( divs[i].style.width ) + padding ;
      if ( curpos + nextwidth > width || tr == null ) {
        tr = document.createElement ( "tr" ) ;
        tb.appendChild ( tr ) ;
        curpos = 0 ;
      }
      curpos += nextwidth ;
      tr.appendChild ( tds[i] ) ;
    }
    t.appendChild(tb);
  }
}

//</nowiki></pre>