#!/bin/sh
set -eu
[ -n "${ISTORE_CONF_DIR:-}" ] || exit 1

enabled=1
[ -z "${ISTORE_DONT_START:-}" ] || enabled=0
data_dir="$ISTORE_CONF_DIR/KimiCode"

uci -q batch <<-EOF >/dev/null
	set kimi.main=kimi
	set kimi.main.enabled="$enabled"
	set kimi.main.data_dir="$data_dir"
	set kimi.main.workspace_dir="$data_dir/workspace"
	commit kimi
EOF

runtime_root="$(uci -q get mise.main.storage_root 2>/dev/null || true)"
if [ -z "$runtime_root" ]; then
	/etc/init.d/kimi stop || true
	exit 0
fi

/usr/libexec/kimi-runtime prepare "$data_dir" >/dev/null
if [ "$enabled" = 1 ]; then /etc/init.d/kimi restart || true; else /etc/init.d/kimi stop || true; fi
