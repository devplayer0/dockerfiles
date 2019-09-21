#!/bin/bash

log() {
	logger -s -t sync -p local7.info "$@"
}
die() {
	logger -s -t sync -p local7.err "$@"
	exit 1
}

# Directory where the repo is stored locally. Example: /srv/repo
target="/data/repo"

# Directory where files are downloaded to before being moved in place.
# This should be on the same filesystem as $target, but not a subdirectory of $target.
# Example: /srv/tmp
tmp="/data/tmp"

# Lockfile path
lock="/var/lock/syncrepo.lck"

[ "$DISTRO" == "arch" ] || [ "$DISTRO" == "alpine" ] || die "\$DISTRO must be either 'arch' or 'alpine'"

# If you want to limit the bandwidth used by rsync set this.
# Use 0 to disable the limit.
# The default unit is KiB (see man rsync /--bwlimit for more)
: "${BW_LIMIT:=0}"

[ ! -z "$SOURCE_URL" ] || die "Please set \$SOURCE_URL"

[ "$DISTRO" == "arch" ] && [ -z "$LASTUPDATE_URL" ] && die "Please set \$LASTUPDATE_URL"
: "${ALPINE_BRANCHES:=v3.10}"
: "${ALPINE_ARCHES:=x86_64}"

[ ! -d "$target" ] && mkdir -p "$target"
[ ! -d "$tmp" ] && mkdir -p "$tmp"

exec 9>"${lock}"
flock -n 9 || die "Failed to acquire lock"

rsync_cmd() {
	local -a cmd=(rsync -rtlH --safe-links --delete-after $VERBOSE "--timeout=600" "--contimeout=60" -p \
		--delay-updates --no-motd "--temp-dir=$tmp")

	if [ "$DISTRO" == "alpine" ]; then
		cmd+=('--include=*/')
		for arch in $ALPINE_ARCHES; do
			cmd+=("--include=/*/*/$arch/**")
		done
		cmd+=('--exclude=*' --prune-empty-dirs)
	fi

	if stty &>/dev/null; then
		cmd+=(-h -v --info=progress2)
	else
		cmd+=(--quiet)
	fi

	if ((BW_LIMIT>0)); then
		cmd+=("--bwlimit=$BW_LIMIT")
	fi

	"${cmd[@]}" "$@" || die "rsync exited with code $?"
}


log "Starting sync..."
# if we are called without a tty (cronjob) only run when there are changes
if [ "$DISTRO" == "arch" ]; then
	if ! tty -s && [[ -f "$target/lastupdate" ]] && diff -b <(curl -Ls "$LASTUPDATE_URL") "$target/lastupdate" >/dev/null; then
		# keep lastsync file in sync for statistics generated by the Arch Linux website
		rsync_cmd "$SOURCE_URL/lastsync" "$target/lastsync"
		log "Up to date, not syncing"
		exit 0
	fi

	rsync_cmd \
		--exclude='*.links.tar.gz*' \
		--exclude='/other' \
		--exclude='/sources' \
		"$SOURCE_URL" \
		"$TARGET"
else
	for branch in $ALPINE_BRANCHES; do
		log "Syncing branch $branch"
		rsync_cmd \
			"${SOURCE_URL}${branch}" \
			"$TARGET"
	done
fi

log "Sync done"