#!/usr/bin/env python

#Creates the haxelib package
import os, os.path, string, sys, shutil

hydraxroot = "/Users/dion/Dropbox/storage/projects/hydrax"

#Apply license headers
execfile(os.path.join(hydraxroot, "bin", "applyLicenseHeaders.py"))

#Copy all the src folders
tmp = os.path.join(hydraxroot, "tmp")
haxelibroot = os.path.join(tmp, "hydrax")

if os.path.exists(haxelibroot):
	shutil.rmtree(haxelibroot);
os.makedirs(haxelibroot)

src = os.path.join(hydraxroot, "src")

for f in os.listdir(src):
	srcfolder = os.path.join(src, f)
	if os.path.isdir(srcfolder):
		print "Copying " + srcfolder + " to " + haxelibroot  
		shutil.copytree(srcfolder, os.path.join(haxelibroot, f), ignore=shutil.ignore_patterns("*.DS_Store"))
		
#Copy the haxelib.xml file
etc = os.path.join(hydraxroot, "etc")
shutil.copy(os.path.join(etc, "haxelib.xml"), haxelibroot)
	

