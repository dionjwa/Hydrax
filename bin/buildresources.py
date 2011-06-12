#!/usr/bin/env python

#Creates an asset swf of all assets and useful asset metadata
#Requires a resources.properties file in the current working directory
import os, os.path, string, sys, shutil, re
import ConfigParser
from xml.dom.minidom import Document

#For allowing section-less config files (i.e. properties)
default = 'asection'
class FakeSecHead(object):
	def __init__(self, fp):
		self.fp = fp
		self.sechead = '[' +  default + ']\n'
	def readline(self):
		if self.sechead:
			try: return self.sechead
			finally: self.sechead = None
		else: return self.fp.readline()
		
def readProperties(filename):
	#Load config options
	cp = ConfigParser.SafeConfigParser()
	cp.readfp(FakeSecHead(open(filename)))
	#Process and add extra config options
	props = {}
	for name, value in cp.items(default):
		props[name] = value
	return props
	
props = readProperties("resources.properties")
flex_sdk = props["flex_sdk"]
resourceFolders = [s.strip() for s in props["resources"].split(",")]
builddir = props["builddir"]
swfname = props["swfname"]
create_swf = True
print props["create_swf"].strip().lower()
if props.has_key("create_swf") and props["create_swf"].strip().lower() == "false":
	create_swf = False
keepGeneratedAS3File = True if props.has_key("keep_as3") and props["keep_as3"].strip().lower() == "true" else False

print "resourceFolders=", resourceFolders

filetypes = props["filetypes"]
filetypes = filetypes.replace(' ', '')
filetypes = filetypes.split(',')

print "filetypes=", filetypes

excludes = []
if props.has_key("exclude"):
	excludes = props["exclude"]
	excludes = excludes.replace(' ', '')
	excludes = excludes.split(',')
	
exclude_pattern = None
include_pattern = None

if props.has_key("exclude_pattern"):
	exclude_pattern = props["exclude_pattern"]
	if len(exclude_pattern.strip()) == 0:
		exclude_pattern = None
if props.has_key("include_pattern"):
	include_pattern = props["include_pattern"]
	if len(include_pattern.strip()) == 0:
		include_pattern = None

print "include_pattern=", include_pattern
print "exclude_pattern=", exclude_pattern

def getPackage(asfilename):
	asfile = open(asfilename)
	
	for line in asfile.readlines():
		if re.search(".*package .*", line):
			package = line[line.find("package") + 7:]
			package = package.replace(";", "")
			package = package.replace("{", "")
			# package = package.replace(u'\ufeff', "")
			package = package.strip()
			package += "." + os.path.basename(asfilename)[:-3] + ";"
			asfile.close()
			return package
	asfile.close()
	print "No package found for " + asfilename

def safe_fname(fname):
    fname = fname.replace("\\","_")
    fname = fname.replace("/","_")
    fname = fname.replace(".","_")
    fname = fname.replace("-","_")
    fname = fname.upper()
    return fname

# print "Flex SDK=" + flex_sdk
# print "Resource folder=" + resourceFolder
# print "Output folder=" + builddir
# print "Resource swf name=" + swfname
# print "Accepted file types=" + str(filetypes)

#Create the build folder if missing
if not os.path.exists(builddir):
	print builddir + " doesn't exist, creating..."
	os.makedirs(builddir)
	
#Temporary file, will be destroyed after resource creation
swfas3FileName = "SWFResources.as" 

classTypes = {}
for filetype in filetypes:
	classTypes[filetype] = []

fileList = []
# print "Included files=", fileList

# for resourceFolder in resourceFolders:
for resourceFolder in resourceFolders:
	for root, dirnames, files in os.walk(resourceFolder, followlinks=True):
		dirnames[:] = [dir for dir in dirnames if not dir.startswith('.svn')]
		
		for file in files:
			print file
			if file.endswith(".svn-base") or file.endswith(swfname):
				continue
			if include_pattern != None and re.match(include_pattern, file):
				fileList.append(os.path.join(root,file))
			# print "file=", file
			elif file in excludes or (exclude_pattern != None and re.match(exclude_pattern, file)):
				print "        Excluding", file
				continue
			else:
				for filetype in filetypes:
					if file.endswith("." + filetype):
						fileList.append(os.path.join(root,file))
						break

print "create_swf=", create_swf

swffile = open(swfas3FileName, 'w')
# print "fileList=", fileList
swffile.write("""
package
{
import flash.display.Sprite;
""")
#Some as3 files are just lists of functions and don't define a package, grrr
nonClassAs3Files = {}
print fileList
for rfile in fileList:
	if rfile.endswith(".as"):
		package = getPackage(rfile)
		if package == None:
			tokens = str(rfile).split(os.sep)
			package = string.join(tokens[1:-1], ".") + "." + tokens[-1].split(".")[0]
			print "Could not get the package of " + rfile + ", using file name to guess:", package
			nonClassAs3Files[rfile] = 1
		swffile.write('import ' + package.strip() +'\n')

swffile.write("""

/**
 * Holder class for embedded assets to create a swf that's downloaded by the main swf, instead
 * of having to download all the individual sounds.
 *
 */
[SWF( backgroundColor='0xFFFFFF', frameRate='30', width='200', height='200')] 
public class SWFResources extends Sprite
{

""")

for rfile in fileList:
	
	suffix = rfile.split('.')[-1].lower()
	# wholePath = os.path.join(resourceFolder, rfile)
	if not suffix == "as":
		className = safe_fname(rfile.replace(resourceFolder + "/", "").split(".")[0]).upper()
		classTypes[suffix].append((className, rfile))
		
		if suffix == "svg":
			#Embed both types of svgs, the text, and the image
			# swffile.write('    [Embed(source="' + rfile + '", mimeType="image/svg")]\n')
			# swffile.write('    public static const ' + className + '_IMG :Class;\n\n')
			
			swffile.write('    [Embed(source="' + rfile + '", mimeType="application/octet-stream")]\n')
		elif suffix == "ttf":
			fontname = os.path.basename(rfile).split(".")[0]
			fontname = fontname.replace("_", " ")
			swffile.write('    [Embed(source="' + rfile + '", fontName="'+ fontname +'", mimeType="application/x-font")]\n')
		elif suffix == "png" or suffix == "jpg":
			#Embed images as bitmap data
			swffile.write('    [Embed(source="' + rfile + '")]\n')
		else:
			#Otherwise embed as binary
			swffile.write('    [Embed(source="' + rfile + '", mimeType="application/octet-stream")]\n')
		# className = os.path.basename(rfile).split(".")[0].upper()
		swffile.write('    public static const ' + className + ' :Class;\n\n')
		# print rfile
		# print className
		print "Adding " + rfile + " as  " + className
	# else:
	# 	print "?Adding " + rfile

swffile.write("""
	public function SWFResources()
	{
		super();
""")

for rfile in fileList:
	if rfile.endswith(".as") and not nonClassAs3Files.has_key(rfile):
		swffile.write('        ' + os.path.basename(rfile)[:-3] +'\n')

swffile.write("""
	}
}
}

""")

swffile.close();

command = 'java -Xmx1024m -jar "' + flex_sdk + '/lib/mxmlc.jar" -load-config=/Users/dion/storage/projects/libdamago/etc/flex-config.xml '
for resourceFolder in resourceFolders:
	command += ' -source-path+=' + resourceFolder
command += ' -output=' + os.path.join(builddir, swfname) + ' SWFResources.as'
# print command
if create_swf:
	os.system(command)

if not keepGeneratedAS3File:
	os.remove(swfas3FileName)
if os.path.isdir("hxclasses"):
	shutil.rmtree("hxclasses")
	 
#################################################
#Create the different resource type lists for autocompletion in haxe
#Creates a resources.xml file and Resources.hx class, containing
#gnerated asset metadata, allowing code completion of asset names.

#Resources code source bits
imageCodeList = ""
audioCodeList = ""
svgCodeList = ""

xmlfile = open(os.path.join(builddir, "resources.xml"), 'w')
# Create the minidom document
doc = Document()

# Create the <wml> base element
root = doc.createElement("resources")
doc.appendChild(root)
for filetype,classdatalist in classTypes.items():
	if not (filetype == "png" or filetype == "jpg" or filetype == "svg" or filetype == "swf"):
		continue
	for classdata in classdatalist:
		fileid = classdata[0]
		filepath = classdata[1]
		if filepath.endswith(swfname):
			continue
		if filetype == "png" or filetype == "jpg":
			child = doc.createElement("img")
			# imageCodeList  = imageCodeList + "\tinline public static var " + fileid + ' = "' + fileid + '";\n' 
		elif filetype == "svg":
			child = doc.createElement("svg")
		elif filetype == "swf":
			child = doc.createElement("swf")
			# svgCodeList  = svgCodeList + "\tinline public static var " + fileid + ' = "' + fileid + '";\n'
		root.appendChild(child)
		child.setAttribute("url", filepath)
		child.setAttribute("id", fileid)
		# child.appendChild(doc.createTextNode(filepath))
xmlfile.write(doc.toprettyxml(indent="\t"))
xmlfile.close()

############################################
#Write the Resource.hx to the build folder, listing all resouces
# resourceconstsfile = open(os.path.join(builddir, "Resource.hx"), 'w')
# resourceconstsfile.write("""
# class Resource
# {
# """)
# resourceconstsfile.write(imageCodeList)
# resourceconstsfile.write(svgCodeList)
# resourceconstsfile.write(audioCodeList)
# resourceconstsfile.write("}")
# resourceconstsfile.close()

