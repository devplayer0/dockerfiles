#!/bin/sh

set -eu

umask "${UMASK}"
chown "${PUID}:${PGID}" /var/syncthing \
  && exec su-exec "${PUID}:${PGID}" \
     env HOME=/var/syncthing \
     /bin/syncthing "$@"
