ifndef APPDIR
$(error APPDIR is not set. Set APPDIR when using this Makefile!)
endif

HOST_UID = 1000
HOST_GID = 1000
CNT_UNPRIV_USER = maxuser
HOST_UNPRIV_UID_START = 101001
HOST_UNPRIV_GID_START = 101001
HOST_UNPRIV_UID_END = 64500
HOST_UNPRIV_GID_END = 64500

all: AppRun-template init.sh
	cp AppRun-template $(APPDIR)/AppRun
	cp init.sh $(APPDIR)/init.sh
	chmod 700 $(APPDIR)/AppRun
	chmod 700 $(APPDIR)/init.sh
	echo "0:$(HOST_UID):1" > $(APPDIR)/etc/subuid
	echo "1:100000:65536" >> $(APPDIR)/etc/subuid
#	echo "messagebus:100995:1" >> $(APPDIR)/etc/subuid
#	echo "systemd-timesync:100996:1" >> $(APPDIR)/etc/subuid
#	echo "systemd-network:100997:1" >> $(APPDIR)/etc/subuid
#	echo "$(CNT_UNPRIV_USER):$(HOST_UNPRIV_UID_START):$(HOST_UNPRIV_UID_END)" >> $(APPDIR)/etc/subuid
	echo "0:$(HOST_GID):1" > $(APPDIR)/etc/subgid
	echo "1:100000:65536" >> $(APPDIR)/etc/subgid
#	echo "messagebus:100995:1" >> $(APPDIR)/etc/subgid
#	echo "systemd-timesync:100996:1" >> $(APPDIR)/etc/subgid
#	echo "systemd-network:100997:1" >> $(APPDIR)/etc/subgid
#	echo "systemd-journal:100998:1" >> $(APPDIR)/etc/subgid
#	echo "tty:100005:1" >> $(APPDIR)/etc/subgid
#	echo "$(CNT_UNPRIV_USER):$(HOST_UNPRIV_GID_START):$(HOST_UNPRIV_GID_END)" >> $(APPDIR)/etc/subgid
	cp systemd.desktop $(APPDIR)
	cp systemd.png $(APPDIR)
#	chown -R $(HOST_UID):$(HOST_GID) $(APPDIR)
	ARCH=x86_64 ../appimagetool/build/src/appimagetool -v --runtime-file ../type2-runtime/src/runtime/runtime $(APPDIR)
