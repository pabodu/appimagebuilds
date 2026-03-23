# Set APPDIR when using this Makefile!

all: AppRun-template
	cp AppRun-template $(APPDIR)/AppRun
	cat $(APPDIR)/usr/share/applications/max.desktop | sed 's/DBusActivatable=true/DBusActivatable=false/g' | sed 's|/usr/share/pixmaps/max.png|max|g' > $(APPDIR)/max.desktop
	cp $(APPDIR)/usr/share/pixmaps/max.png $(APPDIR)
	ARCH=x86_64 ../appimagetool/build/src/appimagetool -v -r --runtime-file ../type2-runtime/src/runtime/runtime $(APPDIR)
