<?php

header("Content-type: image/svg+xml");

function getqueryval($param, $defval) {
  $val = isset($_GET[$param]) ? $_GET[$param] : $defval;
  //echo '<p>' . $param . '= ' . $val . '</p>';
  return $val;
}

$preserveAspectRatioType = getqueryval('preserveAspectRatioType', 'meet'); # meet, slice, none, absent
$viewBoxMode = getqueryval('viewBoxMode', 'present'); # present, absent
$svgWidthType = getqueryval('svgWidthType', 'pixels'); # pixels
$svgHeightType = getqueryval('svgHeightType', 'pixels'); # pixels

echo '<?xml version="1.0"?>' . "\n";
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
    $svgWidth = 'width="450" ';
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
    $svgHeight = 'height="300" ';
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

?>

