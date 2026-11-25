#!/bin/sh

[ -z "$ISTORE_CONF_DIR" ] && exit 1

ENABLED=1
if [ -n "$ISTORE_DONT_START" ]; then
	ENABLED=0
fi

mkdir -p "$ISTORE_CONF_DIR/KAIPlus" || exit 1
BACKUP_DIR="$(dirname "$ISTORE_CONF_DIR")/TimeMachine"

uci -q batch <<-EOF >/dev/null || exit 1
	set kaiplus.@kaiplus[0].enabled=$ENABLED
	set kaiplus.@kaiplus[0].data_dir="$ISTORE_CONF_DIR/KAIPlus"
	set kaiplus.@kaiplus[0].backup_dir="$BACKUP_DIR"
	commit kaiplus
EOF

# KaiPlus owns idempotent protection setup after registering this data directory.
# Surface a service-start failure instead of reporting successful configuration.
/etc/init.d/kaiplus restart
