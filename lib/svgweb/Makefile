# To use the examples, copy the html, swf, and svg files to your web server directory.

# Location to rsync entire package to
SVGSRV='codinginparadise.org:~/codinginparadise.org/html/projects/svgweb/'

# Location to rsync package to a staging, testing server
SVGSTAGE='codinginparadise.org:~/codinginparadise.org/html/projects/svgweb-staging/'

# Whether to compress JavaScript
COMPRESS=0

# Handle different path delimiters in cygwin
UNAME=$(shell uname)
ifeq ($(findstring CYGWIN,$(UNAME)), CYGWIN)
CLASSPATH_DELIMITER=\;
else
CLASSPATH_DELIMITER=:
endif

# Release name for context menu
RELEASE_NAME=

# Release number for context menu (defaults to current svn repos rev)
RELEASE_NUMBER=$(shell svnversion)

# Compiler constants for mxmlc command line
COMPILER_CONSTANTS=-define=BUILD::releaseName,\'$(RELEASE_NAME)\' -define=BUILD::releaseNumber,\'$(RELEASE_NUMBER)\'

# Whether to copy over tests to our build
COPY_TESTS=0

# Whether to copy over non-licensed content suitable for testing. This should
# not be on for released builds, only for staging builds for testing
# purposes only.
ALL_TESTS=0

ifeq ($(COPY_TESTS), 1)
all: build/ build/src/svg.swf build/src/svg.js build/src/svg.htc build/src/svg-htc.php build/src/svg-htc.jsp build/src/svg-htc.asp build/README.html build/COPYING.txt build/src/tools/webserver.jar build/src/tools/config.html build/samples/flash-samples/svgflashtest.swf build/samples/flex-samples/svgflextest.swf
	svn --force export samples/ build/samples/
	svn --force export tests/ build/tests/
	svn --force export docs/ build/docs
ifeq ($(ALL_TESTS), 0)
	rm -fr build/tests/non-licensed/
endif
else
all: build/ build/src/svg.swf build/src/svg.js build/src/svg.htc build/src/svg-htc.php build/src/svg-htc.jsp build/src/svg-htc.asp build/README.html build/COPYING.txt build/src/tools/webserver.jar build/src/tools/config.html
	svn --force export samples/ build/samples/
	svn --force export docs/ build/docs
endif

build/:
	mkdir -p build/ build/samples build/samples/flash-samples build/samples/flex-samples build/tests build/src build/docs build/docs build/src/tools

build/README.html:
	cp README.html build/README.html
  
build/COPYING.txt:
	cp COPYING.txt build/COPYING.txt

build/src/svg.swf: src/org/svgweb/SVGViewerWeb.as src/org/svgweb/core/*.as src/org/svgweb/nodes/*.as src/org/svgweb/utils/*.as src/org/svgweb/smil/*.as
	@echo Building svg.swf file...
	(cd src/org/svgweb;mxmlc $(COMPILER_CONSTANTS) -output ../../../build/src/svg.swf -use-network=false -warnings=true -compiler.strict=true -compiler.optimize=true -compiler.debug=false -compiler.source-path ../../ -- SVGViewerWeb.as)
	cp build/src/svg.swf src/

build/samples/flash-samples/svgflashtest.swf: src/org/svgweb/tests/SVGViewerFlashTest.as src/org/svgweb/core/*.as src/org/svgweb/nodes/*.as src/org/svgweb/utils/*.as src/org/svgweb/smil/*.as
	@echo Building svgflashtest.swf file...
	(cd src/org/svgweb/tests;mxmlc $(COMPILER_CONSTANTS) -output ../../../../build/samples/flash-samples/svgflashtest.swf -use-network=false -warnings=true -compiler.strict=true -compiler.optimize=true -compiler.debug=false -compiler.source-path ../../../ -- SVGViewerFlashTest.as)

build/samples/flex-samples/svgflextest.swf: src/org/svgweb/tests/svgflextest.mxml src/org/svgweb/SVGViewerFlex.as src/org/svgweb/core/*.as src/org/svgweb/nodes/*.as src/org/svgweb/utils/*.as src/org/svgweb/smil/*.as
	@echo Building svgflex.swf file...
	(cd src/org/svgweb/tests;mxmlc $(COMPILER_CONSTANTS) -output ../../../../build/samples/flex-samples/svgflextest.swf -use-network=false -warnings=false -compiler.strict=true -compiler.optimize=true -compiler.debug=false -compiler.source-path ../../../ -- svgflextest.mxml)

# SWF files for Issue 452 (http://code.google.com/p/svgweb/issues/detail?id=452)
tests/non-licensed/perf/test6/Main.swf: tests/non-licensed/perf/test6/*.as
	(cd tests/non-licensed/perf/test6;mxmlc $(COMPILER_CONSTANTS) -output Main.swf -use-network=false -warnings=true -compiler.strict=true -compiler.optimize=true -compiler.debug=true -compiler.source-path . -- Main.as)

tests/non-licensed/perf/test7/svg.swf: tests/non-licensed/perf/test7/src/org/svgweb/SVGViewerWeb.as tests/non-licensed/perf/test7/src/org/svgweb/core/*.as tests/non-licensed/perf/test7/src/org/svgweb/nodes/*.as tests/non-licensed/perf/test7/src/org/svgweb/utils/*.as tests/non-licensed/perf/test7/src/org/svgweb/smil/*.as
	@echo Building test7/svg.swf file...
	(cd tests/non-licensed/perf/test7/src/org/svgweb;mxmlc $(COMPILER_CONSTANTS) -output ../../svg.swf -use-network=false -warnings=true -compiler.strict=true -compiler.optimize=true -compiler.debug=false -compiler.source-path ../../ -- SVGViewerWeb.as)

ifeq ($(COMPRESS), 1)
build/src/svg.js: src/svg.js
	cp src/svg.js build/src/svg-uncompressed.js
	@echo Compressing svg.js file...
	java -jar src/tools/lib/compiler.jar --js src/svg.js --js_output_file build/src/svg.js 2>&1
	@echo Final size: svg.js \(`ls -lrt build/src/svg.js | awk '{print $$5}'` bytes\)
else
build/src/svg.js: src/svg.js
	cp src/svg.js build/src/svg-uncompressed.js
	cp src/svg.js build/src/svg.js
endif

ifeq ($(COMPRESS), 1)
build/src/svg.htc: src/svg.htc
	cp src/svg.htc build/src/svg-uncompressed.htc
	@echo Compressing svg.htc file...
	# compress the Microsoft Behavior HTC file and strip out XML style comments.
	# we can't directly compress the HTC file; we have to extract the SCRIPT
	# portion, compress that, then put it back into the original HTC file.
	# we use sed to do the bulk of the work. We store the intermediate results into
	# shell variables then paste them all together at the end to produce the final
	# result.
	(compressed_js=`sed -n -e '/script/, /\/script/ p' -e 's/script//' <src/svg.htc | sed -e '/\/script/, /\/script/d' | grep -v 'script>' | grep -v '<script' | java -jar src/tools/lib/yuicompressor-2.4.1.jar --type js --nomunge --preserve-semi 2>&1`; \
   top_of_htc=`sed -e '/script/,/<\/html>/ s/.*//' <src/svg.htc | sed 's/[ ]*<\!\-\-[^>]*>[ ]*//g;' | sed '/\<\!\-\-/,/\-\-\>/ s/.*//' | cat -s`; \
   echo $$top_of_htc '<script type="text/javascript">' $$compressed_js '</script><script type="text/vbscript"></script>' >build/src/svg.htc;)
	@echo Final size: svg.htc \(`ls -lrt build/src/svg.htc | awk '{print $$5}'` bytes\)
else
build/src/svg.htc: src/svg.htc
	cp src/svg.htc build/src/svg-uncompressed.htc
	cp src/svg.htc build/src/svg.htc
endif

build/src/svg-htc.php: src/tools/svg-htc.php
	cp src/tools/svg-htc.php build/src/svg-htc.php

build/src/svg-htc.jsp: src/tools/svg-htc.jsp
	cp src/tools/svg-htc.jsp build/src/svg-htc.jsp

build/src/svg-htc.asp: src/tools/svg-htc.asp
	cp src/tools/svg-htc.asp build/src/svg-htc.asp

build/src/tools/webserver.jar: src/tools/webserver-src/WebServer.java src/tools/webserver-src/MANIFEST.MF
	@echo Building webserver.jar file...
	mkdir -p build/src/tools/lib/
	cp src/tools/lib/jetty-*.jar build/src/tools/lib/
	cp src/tools/lib/servlet-*.jar build/src/tools/lib/
	javac -Xlint:unchecked -classpath src/tools/lib/jetty-6.1.19.jar$(CLASSPATH_DELIMITER)src/tools/lib/jetty-util-6.1.19.jar$(CLASSPATH_DELIMITER)src/tools/lib/servlet-api-2.5-20081211.jar$(CLASSPATH_DELIMITER)src/tools/webserver-src/ -d build/src/tools/ src/tools/webserver-src/WebServer.java
	jar -cvfm build/src/tools/webserver.jar src/tools/webserver-src/MANIFEST.MF -C build/src/tools/ WebServer.class
	rm -f build/src/tools/*.class

build/src/tools/config.html: src/tools/config.html
	cp src/tools/config.html build/src/tools/config.html

size: build/src/svg.swf build/src/svg.js build/src/svg.htc
	# Determines file sizes to help with size optimization
	@swf_after=`ls -lrt build/src/svg.swf | awk '{print $$5}'`; \
      js_after=`ls -lrt build/src/svg.js | awk '{print $$5}'`; \
      htc_after=`ls -lrt build/src/svg.htc | awk '{print $$5}'`; \
      \
      swf_before=`ls -lrt src/svg.swf | awk '{print $$5}'`; \
      js_before=`ls -lrt src/svg.js | awk '{print $$5}'`; \
      htc_before=`ls -lrt src/svg.htc | awk '{print $$5}'`; \
      \
      total_after=$$(expr $$swf_after + $$js_after + $$htc_after); \
      total_before=$$(expr $$swf_before + $$js_before + $$htc_before); \
      \
      echo Total non-optimized size: $$total_before bytes; \
      echo Total optimized size: $$total_after bytes; \
      \
      gzip --quiet --to-stdout build/src/svg.swf > build/src/svg.swf.gz; \
      swf_gzip=`ls -lrt build/src/svg.swf.gz | awk '{print $$5}'`; \
      rm build/src/svg.swf.gz; \
      gzip --quiet --to-stdout build/src/svg.js > build/src/svg.js.gz; \
      js_gzip=`ls -lrt build/src/svg.js.gz | awk '{print $$5}'`; \
      rm build/src/svg.js.gz; \
      gzip --quiet --to-stdout build/src/svg.htc > build/src/svg.htc.gz; \
      htc_gzip=`ls -lrt build/src/svg.htc.gz | awk '{print $$5}'`; \
      rm build/src/svg.htc.gz; \
      total_gzip=$$(expr $$swf_gzip + $$js_gzip + $$htc_gzip); \
      echo Total size if gzip compression is turned on: $$total_gzip; \
      \
      echo Individual optimized file sizes:; \
      echo '    ' svg.swf \($$swf_after bytes\) / svg.js \($$js_after bytes\) / svg.htc \($$htc_after bytes\);

release: clean all
	tar cvzpf svgweb-src-`date +'%F'`.tgz --exclude="*svn*" --exclude="*.tgz" *
	tar cvzpf svgweb-`date +'%F'`.tgz --exclude="*svn*" --exclude="*.tgz" --exclude="com*" --exclude="Makefile" --exclude="utils" --exclude="w3c-tests" *

install:
	# Set SVGSRV to the server and directory target for the rsync.
	# Example: make SVGSRV='codinginparadise.org:~/codinginparadise.org/html/projects/svgweb/' install
	rsync --recursive --delete --exclude=*svn* build/* $(SVGSRV)

staging:
	# Set SVGSTAGE to the server and directory target for the rsync for a
	# non-release, staging testing server.
	# Example: make SVGSTAGE='codinginparadise.org:~/codinginparadise.org/html/projects/svgweb-staging/' staging
	rsync --recursive --delete --exclude=*svn* build/* $(SVGSTAGE)

clean:
	rm -fr build/
	rm -f src/tools/webserver-src/*.class

