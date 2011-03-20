#! /usr/bin/env sh
rm -rf build/cpp
haxe testall.hxml
echo "--------------------Node.js---------------------"
testnode.sh
