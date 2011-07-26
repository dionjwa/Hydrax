#!/usr/bin/env python

#Copies the minimum classes needed for rendering SVGs
import os, os.path, string, sys, shutil, re

libd = "/Users/dion/storage/projects/libdamago"
hydrax = "/Users/dion/storage/projects/hydrax"

os.system("mkdir -p " + os.path.join(hydrax, "src", "gm2d"))

classes = [
	"gm2d.svg.PathParser",
	"gm2d.svg.PathSegment",
	"gm2d.svg.SVG2Gfx",
	"gm2d.svg.RenderContext",
	"gm2d.geom.Rectangle",
	"gm2d.geom.Matrix",
	"gm2d.geom.Point",
	"gm2d.display.Graphics",
	"gm2d.display.BitmapData",
	"gm2d.display.Shape",
	"gm2d.RGB",
	
]

for c in classes:
	source = os.path.join(libd, "lib", "gm2d", c.replace(".", "/")) + ".hx"
	dest = os.path.join(hydrax, "src", c.replace(".", "/")) + ".hx"
	if not os.path.exists(os.path.dirname(dest)):
		os.system("mkdir -p " + os.path.dirname(dest))
	print source, " -> ", dest
	shutil.copyfile(source, dest)
