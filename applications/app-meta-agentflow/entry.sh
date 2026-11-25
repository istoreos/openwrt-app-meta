#!/bin/sh
# Public application access is owned by the shared entry.
APP=agentflow
ENTRY_INIT=/etc/init.d/agentflow

relevant_instance() { [ "$1" != runtime ]; }
runtime_target() {
    [ "$binary" = /usr/sbin/agentflow ] || return 1
    web='/cgi-bin/luci/admin/services/linkease_apps/open?id=agentflow'
}

status() {
    . /usr/share/libubox/jshn.sh
    local deployed=0 running=0 state keys instance active binary kind web='' _json_no_warning=1
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
    fi
    json_dump
    json_cleanup >/dev/null
}

case "${1:-}" in
    status) status ;;
    start|stop) "$ENTRY_INIT" "$1" ;;
    *) echo 'Unknown action' >&2; exit 1 ;;
esac
