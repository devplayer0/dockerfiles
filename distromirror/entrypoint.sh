#!/bin/sh
set -e

sync.sh

/sbin/syslogd
/usr/sbin/crond -c /etc/crontabs
exec nginx
