#!/usr/bin/python

import glob
import os
import re
import sys

for filename in glob.glob("../htmlObjectHarness/*.html"):
    # used to test the first file
    #if filename != "../htmlObjectHarness/full-color-prof-01-f.html":
    #    continue
    if filename == "../htmlObjectHarness/tiny-index.html":
        continue
    if filename == "../htmlObjectHarness/basic-index.html":
        continue
    if filename == "../htmlObjectHarness/full-index.html":
        continue

    infile = open (filename, "r")
    outfile = open (filename + ".new", "w")
    content = infile.read()

    svgfilename = re.sub("\.html", ".svg", filename)
    svgfilename = re.sub("../htmlObjectHarness/full-", "", svgfilename)
    svgfilename = re.sub("../htmlObjectHarness/tiny-", "", svgfilename)
    svgfilename = re.sub("../htmlObjectHarness/basic-", "", svgfilename)
    svgfilename = '../svggen/' + svgfilename

    content = re.sub(r'<!--\[if IE\]>\n<object src="([^"]*)" classid="image/svg\+xml"\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n', 
                   r'\t\t\t\t\t\t<!--[if !IE]>-->\n' + 
                    '\t\t\t\t\t\t  <object data="\\1" type="image/svg+xml"\n' + 
                    '\t\t\t\t\t\t          width="480" height="360"> <!--<![endif]-->\n' + 
                    '\t\t\t\t\t\t<!--[if lt IE 9]>\n' +
                    '\t\t\t\t\t\t  <object src="\\1" classid="image/svg+xml"\n' +
                    '\t\t\t\t\t\t          width="480" height="360"> <![endif]-->\n' + 
                    '\t\t\t\t\t\t<!--[if gte IE 9]>\n' +
                    '\t\t\t\t\t\t  <object data="\\1" type="image/svg+xml"\n' + 
                    '\t\t\t\t\t\t          width="480" height="360"> <![endif]-->\n' + 
                    '\t\t\t\t\t\t  </object>\n\n',
                    content)

    outfile.write(content)
    outfile.close()
    infile.close()
    os.rename(filename +".new", filename)
