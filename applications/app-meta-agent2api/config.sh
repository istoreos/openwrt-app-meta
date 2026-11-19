[ -z "$ISTORE_CONF_DIR" ] && exit 1

# iStore passes the selected data-disk path in ISTORE_CONF_DIR.
APP_DIR="$ISTORE_CONF_DIR/Agent2API"
mkdir -p "$APP_DIR" >/dev/null 2>&1 || exit 1

# Keep in sync with the main package UCI schema: anonymous section @main[0].
uci -q batch <<-EOF >/dev/null || exit 1
    set agent2api.@main[0].config_path="$APP_DIR"
    commit agent2api
EOF

ISTORE_ACTION=install
[ -z "$ISTORE_DONT_START" ] || ISTORE_ACTION=stop

/usr/libexec/istorec/agent2api.sh $ISTORE_ACTION || [ stop = $ISTORE_ACTION ]
