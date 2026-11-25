#!/bin/sh

[ -n "$ISTORE_CONF_DIR" ] || exit 1

enabled=1
if [ -n "$ISTORE_DONT_START" ]; then
	enabled=0
fi

data_dir="$ISTORE_CONF_DIR/AgentFlow"
mkdir -p "$data_dir" || exit 1

home_dir="$(uci -q get agentflow.@agentflow[0].home_dir)"
if [ -z "$home_dir" ]; then
	if [ -d "$data_dir/.runtime" ]; then
		home_dir="$(uci -q get mise.main.runtime_dir)"
		if [ -z "$home_dir" ]; then
			storage_root="$(uci -q get mise.main.storage_root)"
			[ -n "$storage_root" ] && home_dir="$storage_root/home"
		fi
	fi
	[ -n "$home_dir" ] || home_dir="$data_dir/home"
fi

uci -q batch <<-EOF >/dev/null || exit 1
	set agentflow.@agentflow[0].enabled="$enabled"
	set agentflow.@agentflow[0].data_dir="$data_dir"
	set agentflow.@agentflow[0].home_dir="$home_dir"
	commit agentflow
EOF

if [ "$enabled" = "1" ]; then
	/etc/init.d/agentflow restart
else
	/etc/init.d/agentflow stop || true
fi
