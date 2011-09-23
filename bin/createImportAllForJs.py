#!/usr/bin/env python

#Create a class that imports all project classes
import os, os.path, string, sys, shutil

if len(sys.argv) <= 1:
	print "Usage: createImportAllForJs.py <src folders> output.hx"
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
		if root.find("flash") > -1:
			print "excluding " + root
			continue
		for file in files:
			for filetype in filetypes:
				if file.endswith("." + filetype):
					f = os.path.join(root,file)
					f = f[:f.rfind(".")]
					f = f[f.find("/") + 1:]
					f = f.replace("/", ".")
					if f.find(".flash.") > -1:
						break;
					f = "import " + f + ";"
					if f.find(".") > -1:
						fileList.append(f)
					break
		
swffile = open(hxoutput, 'w')
classname = hxoutput[:-3]
classname = classname[classname.rfind("/") + 1:]

swffile.write("""
package;

""")

for f in fileList:
	swffile.write(f + "\n")

swffile.write("""

class """ + classname + """
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

