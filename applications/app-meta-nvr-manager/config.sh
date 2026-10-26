#!/bin/sh
# Auto-configuration hook for nvr-manager in iStoreOS
set -e

[ -n "$ISTORE_CONF_DIR" ] || exit 1

data_dir="$ISTORE_CONF_DIR/nvr-manager/data"
record_dir="${ISTORE_PUBLIC_DIR:-$ISTORE_CONF_DIR}/nvr-manager/recordings"

mkdir -p "$data_dir" "$record_dir" >/dev/null 2>&1 || exit 1

enabled=1
if [ -n "$ISTORE_DONT_START" ]; then
	enabled=0
fi

uci -q batch <<-EOF >/dev/null || exit 1
	set nvr-manager.config.data_dir="$data_dir"
	set nvr-manager.config.record_dir="$record_dir"
	set nvr-manager.config.enabled="$enabled"
	commit nvr-manager
EOF

/etc/init.d/nvr-manager restart 2>/dev/null || true

exit 0
