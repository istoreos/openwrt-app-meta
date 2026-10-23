#!/bin/sh

status() {
	local port
	. /usr/share/libubox/jshn.sh
	json_init
	json_add_string "app" "kaiplus"
	json_add_boolean "docker" "0"
	json_add_string "href" "/cgi-bin/luci/admin/services/kaiplus/open"

	port="$(uci -q get kaiplus.@kaiplus[0].port 2>/dev/null)"
	[ -n "$port" ] || port=8189

	if pidof kaiplus >/dev/null 2>&1; then
		json_add_boolean "running" "1"
		json_add_string "web" ":${port}/apps/kaiplus/"
		json_add_string "protocol" "http"
		json_add_string "port" "$port"
		json_add_boolean "deployed" "1"
	else
		json_add_boolean "running" "0"
		if [ -x /etc/init.d/kaiplus ]; then
			json_add_boolean "deployed" "1"
		else
			json_add_boolean "deployed" "0"
		fi
	fi

	json_dump
	json_cleanup >/dev/null
}

start() {
	/etc/init.d/kaiplus start
}

stop() {
	/etc/init.d/kaiplus stop
}

ACTION="${1:-help}"
[ "$#" -eq 0 ] || shift

case "$ACTION" in
	status|start|stop)
		"$ACTION" "$@"
		;;
	*)
		echo "Usage: $0 {status|start|stop}" >&2
		exit 1
		;;
esac
