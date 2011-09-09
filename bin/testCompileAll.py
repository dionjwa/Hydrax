#!/usr/bin/env python

#Create the rsrc/audio.swf containing all mp3s in the rsrc folder
import os, os.path, string, sys, shutil

print "Testing Flash"
os.system("bin/createImportAllForSwc.py src src/TestHydraxCompilation.hx")
os.system("haxe -main TestHydraxCompilation -cp src -swf build/delete.swf -lib polygonal -lib feffects -lib hsl-1 -lib gm2d")

print "Testing javascript"
os.system("bin/createImportAllForJs.py src src/TestHydraxCompilation.hx")
os.system("haxe -main TestHydraxCompilation -cp src -js build/test.js -cp ../libdamago/lib/bdog-redis -cp ../libdamago/lib/bdog-core --remap flash:jeash -lib polygonal -lib feffects  -lib hsl-1 -lib html5 -lib jQueryExtern -lib gm2d -lib nodejs -lib nodejs_externs")

filesToDelete = ["build/delete.swf", "src/TestHydraxCompilation.hx" "build/test.js"]
for f in filesToDelete:
	if os.path.exists(f):
		os.remove(f)
