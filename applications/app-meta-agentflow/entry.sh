#!/bin/sh
# Standalone app-meta entry: no shared runtime installation is required.
APP=agentflow
ENTRY_INIT=/etc/init.d/agentflow

relevant_instance() { return 0; }
runtime_target() {
    [ "$binary" = /usr/sbin/agentflow ] || return 1
    local address value
    address=$(env_value AGENT_FLOW_HOST) || return 1
    value=$(env_value AGENT_FLOW_PORT) || return 1
    tcp_target "$address" "$value" /apps/agentflow/
}

# Values below are read from the running procd instance, not pending UCI edits.
valid_port() {
    case "$1" in ''|*[!0-9]*) return 1 ;; esac
    [ "${#1}" -le 5 ] && [ "$1" -ge 1 ] && [ "$1" -le 65535 ]
}

command_value() {
    local keys key value found=0 result=''
    json_select command || return 1
    json_get_keys keys
    for key in $keys; do
        json_get_var value "$key"
        if [ "$found" = 1 ]; then result=$value; found=2
        elif [ "$value" = "$1" ]; then
            [ "$found" = 0 ] || { json_select ..; return 1; }
            found=1
        fi
    done
    json_select ..
    [ "$found" = 2 ] || return 1
    printf '%s' "$result"
}

env_value() {
    local value kind
    json_select env || return 1
    json_get_type kind "$1"
    [ "$kind" = string ] || { json_select ..; return 1; }
    json_get_var value "$1"
    json_select ..
    printf '%s' "$value"
}

# Only expose a LAN-capable TCP listener. Unknown/loopback binds keep management.
tcp_target() {
    local address="$1" value="$2" path="${3:-}"
    valid_port "$value" || return 1
    case "$address" in
        ''|127.*|localhost|::1|'[::1]') return 0 ;;
    esac
    port=$value
    web=":$port$path"
}

safe_path() {
    case "$1" in *[!a-zA-Z0-9_./~-]*|//*|*/../*|*/./*|*/..|*/.) return 1 ;; esac
    return 0
}

status() {
    . /usr/share/libubox/jshn.sh
    local deployed=0 running=0 state keys instance active binary kind web='' port='' _json_no_warning=1
    if [ -x "$ENTRY_INIT" ]; then
        deployed=1
        state=$(ubus -S call service list "{\"name\":\"$APP\"}" 2>/dev/null) || return 1
        jsonfilter -s "$state" -e '@' >/dev/null 2>&1 || return 1
        json_load "$state" || return 1
        json_get_type kind "$APP"
        if [ -n "$kind" ]; then
            [ "$kind" = object ] && json_select "$APP" || return 1
            json_get_type kind instances
            if [ -n "$kind" ]; then
                [ "$kind" = object ] && json_select instances || return 1
                json_get_keys keys
                for instance in $keys; do
                    relevant_instance "$instance" || continue
                    json_select "$instance" || return 1
                    json_get_type kind running
                    [ "$kind" = boolean ] || return 1
                    json_get_var active running
                    if [ "$active" = 1 ]; then
                        # Multiple Web instances are ambiguous even if ports match.
                        [ "$running" = 0 ] || return 1
                        json_select command || return 1
                        json_get_var binary 1
                        json_select ..
                        runtime_target || return 1
                        running=1
                    fi
                    json_select ..
                done
            fi
        fi
    fi
    json_init
    json_add_string app "$APP"
    json_add_boolean docker 0
    json_add_boolean deployed "$deployed"
    json_add_boolean running "$running"
    json_add_string "href" "/cgi-bin/luci/admin/services/agentflow"
    if [ "$running" = 1 ] && [ -n "$web" ]; then
        json_add_string web "$web"
        json_add_string protocol http
        [ -z "$port" ] || json_add_string port "$port"
    fi
    json_dump
    json_cleanup >/dev/null
}

case "${1:-}" in
    status) status ;;
    start|stop) "$ENTRY_INIT" "$1" ;;
    *) echo 'Unknown action' >&2; exit 1 ;;
esac
