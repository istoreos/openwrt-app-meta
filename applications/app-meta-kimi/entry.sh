#!/bin/sh
APP=kimi
ENTRY_INIT=/etc/init.d/kimi

status() {
	local deployed=0 running=0
	[ -x "$ENTRY_INIT" ] && deployed=1
	if [ "$deployed" = 1 ]; then
		state="$(ubus -S call service list '{"name":"kimi"}' 2>/dev/null || true)"
		[ "$(jsonfilter -s "$state" -e '@.kimi.instances.terminal.running' 2>/dev/null)" = true ] && running=1
	fi
	. /usr/share/libubox/jshn.sh
	json_init
	json_add_string app "$APP"
	json_add_boolean docker 0
	json_add_boolean deployed "$deployed"
	json_add_boolean running "$running"
	json_add_string href "/cgi-bin/luci/admin/services/kimi"
	json_dump
	json_cleanup >/dev/null
}

case "${1:-}" in
	status) status ;;
	start|stop) "$ENTRY_INIT" "$1" ;;
	*) echo 'Unknown action' >&2; exit 1 ;;
esac
