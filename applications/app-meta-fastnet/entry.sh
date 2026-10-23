#!/bin/sh

FASTNET_BIN=/usr/sbin/FastNet

status() {
    . /usr/share/libubox/jshn.sh
    local deployed=0 running=0 port='' state instances instance active binary verb flag address candidate _json_no_warning=1
    if [ -x "$FASTNET_BIN" ]; then
        deployed=1
        state=$(ubus -S call service list '{"name":"fastnet"}' 2>/dev/null) || return 1
        jsonfilter -s "$state" -e '@' >/dev/null 2>&1 || return 1
        json_load "$state" || return 1
        if json_select fastnet 2>/dev/null && json_select instances 2>/dev/null; then
            json_get_keys instances
            for instance in $instances; do
                json_select "$instance" || return 1
                json_get_var active running
                if [ "$active" = 1 ]; then
                    json_select command || return 1
                    json_get_var binary 1
                    json_get_var verb 2
                    json_get_var flag 3
                    json_get_var address 4
                    [ "$binary" = "$FASTNET_BIN" ] && [ "$verb" = web ] && [ "$flag" = --addr ] || return 1
                    candidate=${address##*:}
                    case "$candidate" in ''|*[!0-9]*) return 1 ;; esac
                    [ "${#candidate}" -le 5 ] && [ "$candidate" -ge 1 ] && [ "$candidate" -le 65535 ] || return 1
                    [ "$running" = 0 ] || [ "$port" = "$candidate" ] || return 1
                    running=1
                    port=$candidate
                    # A loopback-only listener cannot be opened by a LAN browser.
                    case "${address%:*}" in 127.*|localhost|'[::1]') port='' ;; esac
                    json_select ..
                fi
                json_select ..
            done
        fi
    fi
    json_init
    json_add_string app fastnet
    json_add_boolean docker 0
    json_add_boolean deployed "$deployed"
    json_add_boolean running "$running"
    json_add_string href /cgi-bin/luci/admin/services/fastnet
    if [ "$running" = 1 ] && [ -n "$port" ]; then
        json_add_string web ":$port"
        json_add_string protocol http
        json_add_string port "$port"
    fi
    json_dump
    json_cleanup >/dev/null
}

case "${1:-}" in
    status) status ;;
    start|stop) /etc/init.d/fastnet "$1" ;;
    *) echo 'Unknown action' >&2; exit 1 ;;
esac
