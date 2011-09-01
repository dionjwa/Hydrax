#!/usr/bin/env python

#Create the rsrc/audio.swf containing all mp3s in the rsrc folder
import os, os.path, string, sys, shutil

os.system("bin/createImportAllForSwc.py src src/Test.hx")
os.system("haxe -main Test -cp src -swf build/delete.swf -lib polygonal -lib feffects -lib IterTools -lib ArrayTools -lib ListTools -lib hsl-1 ")
# os.remove("build/delete.swf")
# os.remove("src/Test.hx")

