#!/usr/bin/env python
# calls haxe <build file> on all build files in the root demo directories

import os, os.path, sys, re

os.chdir(os.path.dirname(__file__))

root = os.getcwd()

for f in os.listdir(root):
	if os.path.isdir(os.path.join(root, f)):
		print "Project " + f
		
		for projectFile in os.listdir(os.path.join(root, f)):
			os.chdir(os.path.join(root, f))
			
			if projectFile.endswith(".hxml") and projectFile.find("cpp") == -1:
				print "   " + projectFile
				os.system("haxe " + projectFile)
