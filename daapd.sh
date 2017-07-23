#!/bin/bash

rm -rf /var/run
mkdir -p /var/run/dbus
dbus-uuidgen --ensure
sleep 1
dbus-daemon --system

avahi-daemon --daemonize --no-chroot

[[ ! -f /config/forked-daapd.conf ]] && cp /usr/local/etc/forked-daapd.conf /config/forked-daapd.conf

exec /app/sbin/forked-daapd -f -c /config/forked-daapd.conf -P /var/run/forked-daapd.pid