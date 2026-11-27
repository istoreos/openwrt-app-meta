#!/bin/sh
set -eu

[ -n "${ISTORE_CONF_DIR:-}" ] || exit 1
[ -n "${ISTORE_PUBLIC_DIR:-}" ] || exit 1

uci -q batch <<-EOF >/dev/null || exit 1
	set dsh.@main[0].data_path="$ISTORE_CONF_DIR/DSH"
	set dsh.@main[0].workspace_path="$ISTORE_PUBLIC_DIR/DSH"
	commit dsh
EOF

ISTORE_ACTION=install
[ -z "${ISTORE_DONT_START:-}" ] || ISTORE_ACTION=stop

/usr/libexec/istorec/dsh.sh "$ISTORE_ACTION" || [ stop = "$ISTORE_ACTION" ]
