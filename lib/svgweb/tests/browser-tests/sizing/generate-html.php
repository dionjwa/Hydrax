<?php

function getqueryval($param, $defval) {
  $val = isset($_GET[$param]) ? $_GET[$param] : $defval;
  #echo '<p>' . $param . '= ' . $val . '</p>';
  return $val;
}

$mediaType = getqueryval('mediaType', 'text/html'); # text/html
header("Content-type: " . $mediaType);

$docType = getqueryval('docType', 'html5'); # html5, html4quirks, html4strict
$svgWebMode = getqueryval('svgWebMode', 'pureNative'); # pureNative, svgWebNative, svgWebFlash

$parentType = getqueryval('parentType', 'div'); # div, body
$tagType = getqueryval('tagType', 'object'); # object, svg

$divWidthType = getqueryval('divWidthType', 'pixels'); # pixels, percent, absent
$divHeightType = getqueryval('divHeightType', 'pixels'); # pixels, percent, absent

$objectWidthType = getqueryval('objectWidthType', 'pixels'); # pixels, percent, absent
$objectHeightType = getqueryval('objectHeightType', 'pixels'); # pixels, percent, absent

$preserveAspectRatio = getqueryval('preserveAspectRatioType', 'meet'); # meet, slice, none, absent
$viewBoxMode = getqueryval('viewBoxMode', 'present'); # present, absent
$svgWidthType = getqueryval('svgWidthType', 'pixels'); # pixels
$svgHeightType = getqueryval('svgHeightType', 'pixels'); # pixels


switch ($docType) {
  case 'html4quirks':
    echo '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">' . "\n";
    break;
  case 'html4strict':
    echo '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">' . "\n";
    break;
  case 'html5':
  default:
    echo "<!DOCTYPE html>\n";
    break;
}

echo "<html>\n";
echo "<body>\n";
echo "<head>\n";

switch ($svgWebMode) {
  case 'pureNative':
  default:
    break;
  case 'svgWebNative':
    echo '    <meta name="svg.render.forceflash" content="false" />' . "\n";
    echo '    <script src="../../../src/svg.js" type="text/javascript"></script>' . "\n";
    break;
  case 'svgWebFlash':
    echo '    <meta name="svg.render.forceflash" content="true" />' . "\n";
    echo '    <script src="../../../src/svg.js" type="text/javascript"></script>' . "\n";
    break;
}
echo "</head>\n";

# Maybe enclose the SVG object or element in a DIV
switch ($parentType) {
  case 'body':
    break;

  case 'div':
  default:
    switch (params.divWidthType) {
      case "percent":
        $divWidth = ' width:100%;';
        break;
      case "absent":
        $divWidth = "";
        break;
      case "pixels":
      default:
        $divWidth = ' width:500px;';
        break;
    }
    switch (params.divHeightType) {
      case "percent":
        $divHeight = ' height:80%;';
        break;
      case "absent":
        $divHeight = "";
        break;
      case "pixels":
      default:
        $divHeight = ' height:400px;';
        break;
    }
    echo '<div id="mydiv" style="border:2px solid black;' . $divWidth . $divHeight . '">' . "\n";
    break;
}


# Create in inline SVG image, or an object tag that loads the file
switch ($tagType) {
  case 'script':
    if ($tagType == 'script') {
      echo '<script type="image/svg+xml" >' . "\n";
    }
  case 'svg':

    echo '<svg version="1.1" xmlns="http://www.w3.org/2000/svg" ' . "\n";

    switch ($svgWidthType) {
      case "percent":
        $svgWidth = 'width="100%" ';
        break;
      case "absent":
        $svgWidth = "";
        break;
      case "pixels":
      default:
        $svgWidth = 'width="450px" ';
        break;
    }
    switch ($svgHeightType) {
      case "percent":
        $svgHeight = 'height="100%" ';
        break;
      case "absent":
        $svgHeight = "";
        break;
      case "pixels":
      default:
        $svgHeight = 'height="300px" ';
        break;
    }
    switch ($viewBoxMode) {
      case "absent":
        $viewBox = "";
        $preserveAspectRatio = "";
        break;
      case "present":
      default:
        $viewBox = 'viewBox="0 0 1500 1000" ';
        switch ($preserveAspectRatioType) {
          case "absent":
            $preserveAspectRatio = '';
            break;
          case "none":
            $preserveAspectRatio = 'preserveAspectRatio="none" ';
            break;
          case "slice":
            $preserveAspectRatio = 'preserveAspectRatio="xMidYMid slice" ';
            break;
          case "meet":
          default:
            $preserveAspectRatio = 'preserveAspectRatio="xMidYMid meet" ';
            break;
        }
        break;
    }
    
    
    echo "     " . $svgWidth . $svgHeight . $viewBox . "\n";
    
    echo "     " . $preserveAspectRatio . ">\n";
    
    echo '    <rect x="0" y="0" width="1500" height="1000" ' . "\n";
    echo '          fill="yellow" stroke="blue" stroke-width="12" />' . "\n";
    echo '    <path fill="red" d="M 750,100 L 250,900 L 1250,900 z" />' . "\n";
    echo "</svg>\n" ;

    if ($tagType == 'script') {
      echo '</script>' . "\n";
    }
    
    break;
    


  case 'img':
    # Format the object width
    switch ($objectWidthType) {
      case 'percent':
        $objectWidth = 'width="100%" ';
        break;
      case 'absent':
        $objectWidth = "";
        break;
      case 'pixels':
        $objectWidth = 'width="450px" ';
      default:
        break;
    }
    # Format the object height
    switch ($objectHeightType) {
      case 'percent':
        $objectHeight = 'height="100%" ';
        break;
      case 'absent':
        $objectHeight = '';
        break;
      case 'pixels':
        $objectHeight = 'height="300px" ';
      default:
        break;
    }


    # Format the svg file name
    $svg_file = "generate-svg.php?" . "viewBoxMode=" . $viewBoxMode .
                "&preserveAspectRatio=" .$preserveAspectRatio .
                "&svgWidthType=" . $svgWidthType .
                "&svgHeightType=" . $svgHeightType;


    # Format the entire object tag now
    switch ($svgWebMode) {
      case 'svgWebNative':
      case 'svgWebFlash':
      case 'pureNative':
      default:
        $svg_file = 'svg.svg';
        echo '<img src="' . $svg_file . '" ' . "\n";
        echo '          ' . $objectWidth . $objectHeight . ' type="image/svg+xml" id="mySVGObject" />' . "\n";
        break;
    }

    break;

  case 'object':
  default:

    # Format the object width
    switch ($objectWidthType) {
      case 'percent':
        $objectWidth = 'width="100%" ';
        break;
      case 'absent':
        $objectWidth = "";
        break;
      case 'pixels':
        $objectWidth = 'width="450px" ';
      default:
        break;
    }
    # Format the object height
    switch ($objectHeightType) {
      case 'percent':
        $objectHeight = 'height="100%" ';
        break;
      case 'absent':
        $objectHeight = '';
        break;
      case 'pixels':
        $objectHeight = 'height="300px" ';
      default:
        break;
    }


    # Format the svg file name
    $svg_file = "generate-svg.php?" . "viewBoxMode=" . $viewBoxMode .
                "&preserveAspectRatio=" .$preserveAspectRatio .
                "&svgWidthType=" . $svgWidthType .
                "&svgHeightType=" . $svgHeightType;


    # Format the entire object tag now
    switch ($svgWebMode) {
      case 'pureNative':
        echo '<object data="' . $svg_file . '" type="image/svg+xml"' . "\n";
        echo '          ' . $objectWidth . $objectHeight . ' id="mySVGObject">' . "\n";
        break;

      case 'svgWebNative':
      case 'svgWebFlash':
      default:
        # This is the crazy SVG Web syntax that works with all browsers
        echo '<!--[if !IE]>-->' . "\n";
        echo '  <object data="' . $svg_file . '" type="image/svg+xml"' . "\n";
        echo '          ' . $objectWidth . $objectHeight . ' id="mySVGObject"> <!--<![endif]-->' . "\n";
        echo '<!--[if lt IE 9]>' . "\n";
        echo '  <object src="' . $svg_file . '" classid="image/svg+xml"' . "\n";
        echo '          ' . $objectWidth . $objectHeight . ' id="mySVGObject"> <![endif]-->' . "\n";
        echo '<!--[if gte IE 9]>' . "\n";
        echo '  <object data="' . $svg_file . '" type="image/svg+xml"' . "\n";
        echo '          ' . $objectWidth . $objectHeight . ' id="mySVGObject"> <![endif]-->' . "\n";
       
        break;
    }
    echo '  </object>' . "\n";
    break;

}


switch ($parentType) {
  case 'body':
    break;
  case 'div':
  default:
    echo "</div>\n";
    break;
}

echo "</body>\n";
echo "</html>\n";

?>
