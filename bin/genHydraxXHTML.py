#! /usr/bin/env python

# Inlines svg files into a xhtml template.  The svg elements will be inserted
# after the <div id="resources"> tag.

import sys
import os
import fnmatch
import re

if len(sys.argv) < 3:
	print "usage: genHydraxXHTML.py <xhtml template> <svg root folder> [output.xhtml]"

xhtmlTmpl = sys.argv[1];
svgRootFolder = sys.argv[2];
outputFileName = None
if len(sys.argv) >= 4:
	outputFileName = sys.argv[3]
	

svgs = []
for root, dirnames, filenames in os.walk(svgRootFolder):
  for filename in fnmatch.filter(filenames, "*.svg"):
	  svgs.append(os.path.join(root, filename))

#Begin the xhtml template
tmpl = open(xhtmlTmpl)
for line in tmpl.readlines():
	print line,
	if re.match("<div id=\"resources\" ", line):
		for svg in svgs:
			svgfile = open(svg)
			id = os.path.basename(svg)[:-4]
			insvgtag = False
			for line in svgfile.readlines():
				
				if not insvgtag and re.match("<svg ", line): 
					insvgtag = True
					if line.find("id=") == -1:
						print re.sub("<svg ", "<svg  id=\"" + id + "\" ", line)
					else:		
						print re.sub(" id=[\"'][A-Za-z0-9_]+[\"'] ", " id=\"" + id + "\" ", line)
				elif insvgtag:
					print line,
			
			svgfile.close()
tmpl.close()
