#! /usr/bin/env sh
if [ -f build/NodeClient.swf ]
then
    rm build/NodeClient.swf
fi

haxe -cmd "open build/NodeClient.swf" buildClient.hxml
