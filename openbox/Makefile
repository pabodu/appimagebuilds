# Set APPDIR when using this Makefile!

HOST_UID = 1000
HOST_GID = 1000
CNT_UNPRIV_USER = obuser
HOST_UNPRIV_UID_START = 101001
HOST_UNPRIV_GID_START = 101001
HOST_UNPRIV_UID_END = 64535
HOST_UNPRIV_GID_END = 64535

all: AppRun-template
	cp AppRun-template $(APPDIR)/AppRun
	chmod 700 $(APPDIR)/AppRun
	echo "root:$(HOST_UID):1" > $(APPDIR)/etc/subuid
	echo "$(CNT_UNPRIV_USER):$(HOST_UNPRIV_UID_START):$(HOST_UNPRIV_UID_END)" >> $(APPDIR)/etc/subuid
	echo "root:$(HOST_GID):1" > $(APPDIR)/etc/subgid
	echo "$(CNT_UNPRIV_USER):$(HOST_UNPRIV_GID_START):$(HOST_UNPRIV_GID_END)" >> $(APPDIR)/etc/subgid
	cp openbox.desktop  $(APPDIR)
	cp openbox.png $(APPDIR)
	chown -R $(HOST_UID):$(HOST_GID) $(APPDIR)
	ARCH=x86_64 ../appimagetool/build/src/appimagetool -v --runtime-file ../type2-runtime/src/runtime/runtime $(APPDIR)
