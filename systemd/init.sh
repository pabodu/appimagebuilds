#!/bin/bash

EXEC="${1}"; shift
mkdir -p "/run/systemd/system/console-getty.service.d/"
cat <<-EOF > /run/systemd/system/console-getty.service.d/override.conf
[Service]
StandardInput=null
StandardOutput=null
ExecStart=
ExecStart=-/sbin/agetty --noreset --noclear --issue-file=/etc/issue:/etc/issue.d:/run/issue.d:/usr/lib/issue.d --keep-baud console 115200,57600,38400,9600 ${TERM}
EOF

mount -t devpts -o rw,newinstance,nosuid,noexec,relatime,gid=5,mode=600,ptmxmode=666 devpts /dev/pts
ln -sf /dev/pts/0 /dev/console
ln -sf /dev/pts/ptmx /dev/ptmx

#xterm -geometry 231x58+205+129 &
#xterm -geometry 231x58+205+129 &

mkdir -p "/root/.config/xfce4/xfconf/xfce-perchannel-xml/"
cat <<-EOF > /root/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-terminal.xml
<?xml version="1.1" encoding="UTF-8"?>

<channel name="xfce4-terminal" version="1.0">
  <property name="font-name" type="string" value="Monospace 10"/>
  <property name="scrolling-lines" type="uint" value="10000"/>
  <property name="misc-default-geometry" type="string" value="160x50"/>
</channel>
EOF

/usr/bin/xfce4-terminal.wrapper -e sleep infinity &
/usr/bin/xfce4-terminal.wrapper -e sleep infinity &

exec -a /sbin/init "${EXEC}" "$@"
