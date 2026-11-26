#!/bin/sh
set -eu
[ -n "${ISTORE_CONF_DIR:-}" ] || exit 1

enabled=1
[ -z "${ISTORE_DONT_START:-}" ] || enabled=0
data_dir="$ISTORE_CONF_DIR/OpenCode"

uci -q batch <<-EOF >/dev/null
	set opencode.main=opencode
	set opencode.main.enabled="$enabled"
	set opencode.main.data_dir="$data_dir"
	set opencode.main.workspace_dir="$data_dir/workspace"
	commit opencode
EOF

runtime_root="$(uci -q get mise.main.storage_root 2>/dev/null || true)"
if [ -z "$runtime_root" ]; then
	/etc/init.d/opencode stop || true
	exit 0
fi

/usr/libexec/opencode-runtime prepare "$data_dir" >/dev/null
if [ "$enabled" = 1 ]; then /etc/init.d/opencode restart || true; else /etc/init.d/opencode stop || true; fi
