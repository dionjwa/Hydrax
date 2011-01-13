#! /usr/bin/env sh

createImportAllForSwc.py src src/AllClasses.hx
haxe build.hxml
