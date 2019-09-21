#!/bin/sh
set -e

sync.sh

/sbin/syslogd
/usr/sbin/crond -c /etc/crontabs
exec darkhttpd /data/repo --mimetypes /etc/mime.types --chroot --uid nobody --gid nobody
