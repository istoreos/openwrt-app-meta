#!/bin/sh
# Standalone app-meta entry: no shared runtime installation is required.
APP=openclawmgr
ENTRY_INIT=/etc/init.d/openclawmgr
ISTOREC_SCRIPT=/usr/libexec/istorec/openclawmgr.sh

relevant_instance() { [ "$1" = gateway ]; }
config_base_path() {
    local raw kind part path='/'
    [ -f "$1" ] || { printf '/'; return 0; }
    raw=$(cat "$1") || return 1
    jsonfilter -s "$raw" -e '@' >/dev/null 2>&1 || return 1
    json_load "$raw" || return 1
    for part in gateway controlUi; do
        json_get_type kind "$part"
        [ -n "$kind" ] || { printf '/'; return 0; }
        [ "$kind" = object ] && json_select "$part" || return 1
    done
    json_get_type kind basePath
    case "$kind" in
        '') ;;
        string) json_get_var path basePath ;;
        *) return 1 ;;
    esac
    printf '%s' "$path"
}

runtime_target() {
    case "$binary" in */node/bin/node) ;; *) return 1 ;; esac
    local verb action value bind token config path encoded
    json_select command || return 1
    json_get_var verb 3
    json_get_var action 4
    json_select ..
    [ "$verb" = gateway ] && [ "$action" = run ] || return 1
    value=$(command_value --port) || return 1
    bind=$(command_value --bind) || return 1
    token=$(command_value --token) || return 1
    valid_port "$value" || return 1
    case "$bind" in
        loopback) return 0 ;;
        lan) ;;
        # auto/custom/tailnet do not prove a LAN-visible listener.
        auto|custom|tailnet) return 0 ;;
        *) return 1 ;;
    esac
    config=$(env_value OPENCLAW_CONFIG_PATH) || return 1
    # Parse in a subshell so procd's JSON traversal is not replaced by config.
    path=$(config_base_path "$config") || return 1
    case "$path" in /*) ;; *) path="/$path" ;; esac
    case "$path" in */) ;; *) path="$path/" ;; esac
    safe_path "$path" || return 1
    encoded=$(printf '%s' "$token" | hexdump -v -e '1/1 "%02X"') || return 1
    encoded=$(printf '%s' "$encoded" | sed 's/../%&/g') || return 1
    tcp_target 0.0.0.0 "$value" "$path"
    if [ -n "$token" ]; then web="$web#token=$encoded"; fi
    return 0
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
    local deployed=0 running=0 state keys instance active binary kind runtime web='' port='' _json_no_warning=1
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
    if [ "$deployed" = 1 ] && [ "$running" = 0 ]; then
        # The LuCI installer can exist before the OpenClaw runtime is downloaded.
        # Reuse its existing runtime-presence check for stopped deployments.
        runtime=$("$ISTOREC_SCRIPT" status 2>/dev/null) || return 1
        case "$runtime" in
            '') deployed=0 ;;
            running|stopped) ;;
            *) return 1 ;;
        esac
    fi
    json_init
    json_add_string app "$APP"
    json_add_boolean docker 0
    json_add_boolean deployed "$deployed"
    json_add_boolean running "$running"
    json_add_string "href" "/cgi-bin/luci/admin/services/openclawmgr"
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
    # Preserve token/port preparation and the enabled setting in the provider.
    start|stop) "$ISTOREC_SCRIPT" "$1" ;;
    *) echo 'Unknown action' >&2; exit 1 ;;
esac
