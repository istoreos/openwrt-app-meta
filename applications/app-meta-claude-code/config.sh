#!/bin/sh
set -eu
[ -n "${ISTORE_CONF_DIR:-}" ] || exit 1

enabled=1
[ -z "${ISTORE_DONT_START:-}" ] || enabled=0
data_dir="$ISTORE_CONF_DIR/Claude Code"

uci -q batch <<-EOF >/dev/null
	set claude.main=claude
	set claude.main.enabled="$enabled"
	set claude.main.data_dir="$data_dir"
	set claude.main.workspace_dir="$data_dir/workspace"
	commit claude
EOF

/usr/libexec/claude-runtime prepare "$data_dir" >/dev/null
if [ "$enabled" = 1 ]; then /etc/init.d/claude restart || true; else /etc/init.d/claude stop || true; fi
