#!/bin/bash

EXEC="${1}"; shift

mount -t cgroup2 none /sys/fs/cgroup
mount -t devpts -o rw,newinstance,nosuid,noexec,relatime,gid=5,mode=600,ptmxmode=666 devpts /dev/pts
ln -sf /dev/pts/ptmx /dev/ptmx
( socat -d -d pty,rawer,echo=0,b115200 pty,rawer,echo=0,b115200 >/dev/null 2>&1 ) &
ln -sf /dev/pts/0 /dev/console

mkdir -p "/root/.config/xfce4/xfconf/xfce-perchannel-xml/"
cat <<-EOF > /root/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-terminal.xml
<?xml version="1.1" encoding="UTF-8"?>

<channel name="xfce4-terminal" version="1.0">
  <property name="font-name" type="string" value="Monospace 10"/>
  <property name="scrolling-lines" type="uint" value="10000"/>
  <property name="misc-default-geometry" type="string" value="160x50"/>
</channel>
EOF

/usr/bin/xfce4-terminal -e "/usr/bin/minicom -D /dev/pts/1 -w" &

exec -a /sbin/init "${EXEC}" "$@"
