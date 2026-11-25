#!/bin/sh
set -eu
[ -n "${ISTORE_CONF_DIR:-}" ] || exit 1
root="$(uci -q get mise.main.storage_root 2>/dev/null || true)"
[ -n "$root" ] || root="$ISTORE_CONF_DIR/Runtime"
case "$root" in /mnt/*) ;; *) exit 2 ;; esac
case "$root" in *[!a-zA-Z0-9_./-]*|*/../*|*/..|*/./*|*/.) exit 2 ;; esac
. /usr/share/libubox/jshn.sh
json_init
json_add_string op settings
json_add_string path "$root"
json_add_boolean acceleration 1
json_dump | /usr/sbin/mise-runtime request
