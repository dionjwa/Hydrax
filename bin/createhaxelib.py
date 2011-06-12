#!/usr/bin/env python

#Creates the haxelib package
import os, os.path, string, sys, shutil

hydraxroot = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))

#Apply license headers
execfile(os.path.join(hydraxroot, "bin", "applyLicenseHeaders.py"))

#Copy all the src folders
tmp = os.path.join(hydraxroot, "tmp")
if os.path.exists(tmp):
	shutil.rmtree(tmp);
haxelibroot = os.path.join(tmp, "hydrax")

if os.path.exists(haxelibroot):
	shutil.rmtree(haxelibroot);
os.makedirs(haxelibroot)

src = os.path.join(hydraxroot, "src")

for f in os.listdir(src):
	srcfolder = os.path.join(src, f)
	if os.path.isdir(srcfolder):
		print "Copying " + srcfolder + " to " + haxelibroot  
		shutil.copytree(srcfolder, os.path.join(haxelibroot, f), ignore=shutil.ignore_patterns(".DS_Store", ".git", ".svn", "*.xml"))
	
#Copy the modified signaling code
# lib = os.path.join(hydraxroot, "lib")
# hsl = os.path.join(lib, "hsl")
# hslpico = os.path.join(lib, "hsl-pico")
# command = "rsync -r --exclude=*.svn --exclude=*.xml '" + hsl + "/' " + haxelibroot
# os.system(command)
# command = "rsync -r --exclude=*.svn --exclude=*.xml  '" + hslpico + "/' " + haxelibroot
# os.system(command)

#Copy the haxelib.xml file
etc = os.path.join(hydraxroot, "etc")
shutil.copy(os.path.join(etc, "haxelib.xml"), haxelibroot)

#Go to the folder
os.chdir(tmp)
os.system("zip -r hydrax.zip hydrax")
os.system("haxelib test hydrax.zip")
	

