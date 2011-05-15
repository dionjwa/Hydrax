<?php
	$htmlDir = "../htmlObjectHarness";
	$svgViewer = "../SvgViewer.swf";
	
	$fhDir = openDir($htmlDir);
	
	while ($file = readdir($fhDir)) {
	    
	    $file = $htmlDir . "/" . $file;
	    
	    if (preg_match('/\.htm[l]*$/si', $file)) {
		$fh = fopen($file, "r");
		$content = fread($fh, filesize($file));
		fclose($fh);
		
		if (preg_match('/<object.*?\/>/si', $content, $match)) {
		    if (stripos($match[0], 'classid="') === false) {
			if (!preg_match('/data="([^"]+)" width="([^"]+)" height="([^"]+)"/si', $match[0], $matches)) {
			    print "Error updateing file: $file\n";
			    break;
			}
			$svg = $matches[1];
			$width = $matches[2];
			$height = $matches[3];
			
			$newTag = '
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
            codebase="" id="mySVGViewerObj" width=' . $width . ' height=' . $height . '>
    <param name=movie value="' . $svgViewer . '">
    <param name="FlashVars" value="sourceType=url_svg&svgURL=' . $svg . '">
    <param name="wmode" value="transparent">
    <embed play=false name="mySVGViewerObj" 
	    src="' . $svgViewer . '" quality=high wmode="transparent"
	    width=' . $width . ' height=' . $height . ' type="application/x-shockwave-flash"
	    FlashVars="sourceType=url_svg&svgURL=' . $svg . '">
    </embed >
</object>';
//			$newTag = '
//<div id = \'mySVGDiv\'><!--SVG will go here --></div>
//
//<script type=\'text/javascript\'>
//svgviewer.createSVG({ uniqueId: \'scimitar1\',
//                      parentId: \'mySVGDiv\',
//                      sourceType: "url_svg",
//                      svgURL: "' . $svg . '",
//                      debug: true,
//                      transparent: true,
//                      width: ' . $width . ',
//                      height: ' . $height . ',
//                      translateX: 0,
//                      translateY: 0,
//                      scaleX: 1.0,
//                      scaleY: 1.0
//                    });
//</script>			
//			';
			
			$content = str_replace($match[0], $newTag, $content);
			
			$head = '
    <script src="../../html/svgviewer.js" type="text/javascript"></script>
</head>
			';
			
			$content = str_replace('</head>', $head, $content);
			
			
$link = '<a href="' . $svg . '" target="_blank" style="color: white">SVG Image</a>';

			$content = str_replace('SVG Image', $link, $content);
			
			$fh = fopen($file, "w");
			fwrite($fh, $content);
			fclose($fh);
		    }		    
		}
		else {
		    echo "File: $file, No object?\n";
		}
		
	    
	    }
	    
	}
	closedir($fhDir);
?>
