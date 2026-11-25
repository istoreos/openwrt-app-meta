#!/bin/sh
set -eu
[ -n "${ISTORE_CONF_DIR:-}" ] || exit 1

enabled=1
[ -z "${ISTORE_DONT_START:-}" ] || enabled=0
data_dir="$ISTORE_CONF_DIR/Codex"

uci -q batch <<-EOF >/dev/null
	set codex.main=codex
	set codex.main.enabled="$enabled"
	set codex.main.data_dir="$data_dir"
	set codex.main.workspace_dir="$data_dir/workspace"
	commit codex
EOF

/usr/libexec/codex-runtime prepare "$data_dir" >/dev/null
if [ "$enabled" = 1 ]; then /etc/init.d/codex restart || true; else /etc/init.d/codex stop || true; fi
