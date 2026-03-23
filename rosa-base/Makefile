# Set APPDIR when using this Makefile!

all: AppRun-template rosa-base.desktop rosa-base.png
	cp AppRun-template $(APPDIR)/AppRun
	cp rosa-base.desktop rosa-base.png $(APPDIR)
	# Set when first building AppImages
	#chown -R 1000:1000 $(APPDIR)
	#ARCH=x86_64 ../appimagetool/build/src/appimagetool -v --runtime-file ../type2-runtime/src/runtime/runtime $(APPDIR)
	# Set after building AppImages, for production use
	ARCH=x86_64 ../appimagetool/build/src/appimagetool -v -r --runtime-file ../type2-runtime/src/runtime/runtime $(APPDIR)
