#!/usr/bin/env python

#Create the rsrc/audio.swf containing all mp3s in the rsrc folder
import os, os.path, string, sys, shutil

if len(sys.argv) <= 1:
	print "Usage: createImportAllForSwc.py <src folders> output.hx"
	sys.exit()

args = sys.argv[1:]
hxoutput = args[-1]
srcfolders = args[0:-1]

print "srcfolders: ", srcfolders
print "hxoutput: ", hxoutput

fileList =[]
filetypes = ["hx"]


fileList = []

for srcfolder in srcfolders:
	print "srcfolder " + srcfolder
	for root, subFolders, files in os.walk(srcfolder):
		for file in files:
			for filetype in filetypes:
				if file.endswith("." + filetype):
					f = os.path.join(root,file)
					f = f[:f.rfind(".")]
					f = f[f.find("/") + 1:]
					f = f.replace("/", ".")
					if f.find(".js.") > -1:
						break;
					f = "import " + f + ";"
					if f.find(".") > -1:
						fileList.append(f)
					# fileList.append(file)
					break
		
swffile = open(hxoutput, 'w')
classname = hxoutput[:-3]
classname = classname[classname.rfind("/") + 1:]

swffile.write("""
package;

import flash.display.Sprite;

""")

for f in fileList:
	swffile.write(f + "\n")

swffile.write("""

class """ + classname + """ extends Sprite
{

""")


swffile.write("""
	public function new()
	{
		super();
	}
	public static function main() 
	{
		new """ + classname + """();
	}
}

""");

swffile.close();

