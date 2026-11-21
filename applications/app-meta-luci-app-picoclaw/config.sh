#!/bin/sh
# iStore 自动配置脚本（自包含，不依赖其它包提供的钩子）。
# PicoClaw 的配置与工作区固定在 /root/.picoclaw，不使用 iStore 的配置目录。
[ -z "$ISTORE_CONF_DIR" ] && exit 1

# 准备运行目录
mkdir -p /root/.picoclaw/workspace 2>/dev/null
mkdir -p /root/.picoclaw/logs 2>/dev/null
chmod 700 /root/.picoclaw 2>/dev/null

# 安装时选择“不立即启动”就不启动服务
[ -n "$ISTORE_DONT_START" ] && exit 0

/etc/init.d/picoclaw enable >/dev/null 2>&1
/etc/init.d/picoclaw restart >/dev/null 2>&1
exit 0
