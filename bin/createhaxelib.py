#!/usr/bin/env python

#Creates the haxelib package
import os, os.path, string, sys, shutil, tempfile, re, zipfile
from xml.dom import minidom

if len(sys.argv) <= 1:
	print "Usage: createhaxelib.py <haxelib.etc> [srcFolder1] [srcFolder2, ...]"
	sys.exit(0)

etcFile = sys.argv[1]
srcFolders = sys.argv[2:] if len (sys.argv) > 2 else None
if not srcFolders:
	srcFolders = [os.getcwd()]

if not os.path.exists(etcFile):
	print etcFile + " doesn't exist."
	sys.exit(0)


dom = minidom.parse(etcFile)
projectName = dom.documentElement.attributes["name"].value.strip()
print "Project name: " + projectName

for srcFolder in srcFolders:
	if not os.path.exists(srcFolder):
		print srcFolder + " doesn't exist."
		sys.exit(0)

tmpfolder = tempfile.mkdtemp()

# print "tmp folder: " + tmpfolder
def nodot (item):
	return item[0] != '.'

for src in srcFolders:
	for f in filter(nodot, os.listdir(src)):
		
		fullfilepath = os.path.join(src, f);
		if os.path.isdir(fullfilepath):
			# print "Copying " + fullfilepath + " to " + os.path.join(tmpfolder, f)  
			shutil.copytree(fullfilepath, os.path.join(tmpfolder, f), ignore=shutil.ignore_patterns(".DS_Store", ".git", ".svn", "*.xml", "*.zip", "*.sh"))
		elif re.match(".*(haxelib\.xml|\.hx|\.hxml)$", f):
			shutil.copyfile(fullfilepath, os.path.join(tmpfolder, f))
			
shutil.copyfile(etcFile, os.path.join(tmpfolder, os.path.basename(etcFile)))

zipFileName = os.path.join(tmpfolder, projectName + ".zip")
z = zipfile.ZipFile(zipFileName, "w")

for root, dirnames, files in os.walk(tmpfolder, followlinks=True):
	for file in files:
		if file != projectName + ".zip":
			print file
			z.write(os.path.join(root, file), os.path.join(root, file).replace(tmpfolder, ""), zipfile.ZIP_DEFLATED )

# print os.path.join(tmpfolder, projectName + ".zip")

shutil.move(zipFileName, os.path.join(os.getcwd(), projectName + ".zip"));
shutil.rmtree(tmpfolder)

