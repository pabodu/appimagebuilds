# Set APPDIR when using this Makefile!

HOST_UID = 1000
HOST_GID = 1000
CNT_UNPRIV_USER = geuser
HOST_UNPRIV_UID_START = 101000
HOST_UNPRIV_GID_START = 101000
HOST_UNPRIV_UID_END = 64536
HOST_UNPRIV_GID_END = 64536

all: AppRun-template
	cp AppRun-template $(APPDIR)/AppRun
	chmod 700 $(APPDIR)/AppRun
	echo "root:$(HOST_UID):1" > $(APPDIR)/etc/subuid
	echo "$(CNT_UNPRIV_USER):$(HOST_UNPRIV_UID_START):$(HOST_UNPRIV_UID_END)" >> $(APPDIR)/etc/subuid
	echo "root:$(HOST_GID):1" > $(APPDIR)/etc/subgid
	echo "$(CNT_UNPRIV_USER):$(HOST_UNPRIV_GID_START):$(HOST_UNPRIV_GID_END)" >> $(APPDIR)/etc/subgid
	#DEBIAN_FRONTEND=noninteractive apt-get -y install xdg-utils
	#for size in 16 22 24 32 48 64 128 256; do \
	#	xdg-icon-resource install --size $${size} $(APPDIR)/opt/google/earth/pro/product_logo_$${size}.png "google-earth-pro"; \
	#done
	cp $(APPDIR)/opt/google/earth/pro/product_logo_128.png $(APPDIR)/usr/share/icons/hicolor/128x128/apps/google-earth-pro.png
	cp $(APPDIR)/usr/share/icons/hicolor/128x128/apps/google-earth-pro.png $(APPDIR)
	cat $(APPDIR)/opt/google/earth/pro/google-earth-pro.desktop | sed '/^MultipleArgs/ d' > $(APPDIR)/google-earth-pro.desktop
	chown -R $(HOST_UID):$(HOST_GID) $(APPDIR)
	ARCH=x86_64 ../appimagetool/build/src/appimagetool -v --runtime-file ../type2-runtime/src/runtime/runtime $(APPDIR)
