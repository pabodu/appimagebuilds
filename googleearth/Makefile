# Set APPDIR when using this Makefile!

all: AppRun-template
	cp AppRun-template $(APPDIR)/AppRun
	#DEBIAN_FRONTEND=noninteractive apt-get -y install xdg-utils
	#for size in 16 22 24 32 48 64 128 256; do \
	#	xdg-icon-resource install --size $${size} $(APPDIR)/opt/google/earth/pro/product_logo_$${size}.png "google-earth-pro"; \
	#done
	cp $(APPDIR)/opt/google/earth/pro/product_logo_128.png $(APPDIR)/usr/share/icons/hicolor/128x128/apps/google-earth-pro.png
	cp $(APPDIR)/usr/share/icons/hicolor/128x128/apps/google-earth-pro.png $(APPDIR)
	cat $(APPDIR)/opt/google/earth/pro/google-earth-pro.desktop | sed '/^MultipleArgs/ d' > $(APPDIR)/google-earth-pro.desktop
	ARCH=x86_64 ../appimagetool/build/src/appimagetool -v -r --runtime-file ../type2-runtime/src/runtime/runtime $(APPDIR)
