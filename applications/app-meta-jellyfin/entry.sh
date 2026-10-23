#!/bin/sh
# Read-only status; actions never install a missing container.
ISTOREC_SCRIPT=/usr/libexec/istorec/jellyfin.sh

read_state() {
    state=$("$ISTOREC_SCRIPT" status 2>/dev/null) || return 1
    case "$state" in
        ''|running|created|restarting|paused|exited|dead|removing) ;;
        *) return 1 ;;
    esac
}

status() {
    local state port host="${1:-127.0.0.1}" running=0 deployed=0
    read_state || return 1
    [ -z "$state" ] || deployed=1
    if [ "$state" = running ]; then
        running=1
        port=$("$ISTOREC_SCRIPT" port 2>/dev/null) || return 1
        if [ -n "$port" ]; then
            case "$port" in *[!0-9]*) return 1 ;; esac
            [ "${#port}" -le 5 ] && [ "$port" -ge 1 ] && [ "$port" -le 65535 ] || return 1
        fi
    fi
    . /usr/share/libubox/jshn.sh
    json_init
    json_add_string app jellyfin
    json_add_boolean docker 1
    json_add_boolean running "$running"
    json_add_boolean deployed "$deployed"
    if [ "$running" = 1 ] && [ -n "$port" ]; then
        json_add_string web ":$port"
        json_add_string href "http://$host:$port/"
        json_add_string protocol http
        json_add_string port "$port"
    fi
    json_dump
    json_cleanup >/dev/null
}

start() {
    local state
    read_state || return 1
    [ -n "$state" ] || return 1
    [ "$state" != running ] || return 0
    "$ISTOREC_SCRIPT" start
}

stop() {
    local state
    read_state || return 1
    [ "$state" = running ] || return 0
    "$ISTOREC_SCRIPT" stop
}

action="${1:-}"
[ "$#" -eq 0 ] || shift
case "$action" in
    status|start|stop) "$action" "$@" ;;
    *) echo 'Unknown action' >&2; exit 1 ;;
esac
