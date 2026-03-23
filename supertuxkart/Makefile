# Set APPDIR when using this Makefile!

all: AppRun-template supertuxkart.desktop supertuxkart.png
	cp AppRun-template $(APPDIR)/AppRun
	cp supertuxkart.desktop supertuxkart.png $(APPDIR)
	ARCH=x86_64 ../appimagetool/build/src/appimagetool -v -r --runtime-file ../type2-runtime/src/runtime/runtime $(APPDIR)
