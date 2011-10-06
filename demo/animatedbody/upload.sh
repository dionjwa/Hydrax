#!/usr/bin/env sh

rsync -rptgoDvpL --copy-dirlinks --delete --exclude=etc/ . dionjwa@dionamago.net:~/dionamago.net/content/demos/animatedbody/
