# This is free software, licensed under the Apache License, Version 2.0 .
#
# iStore catalog entry (meta package) for the Tailscale updater.
# Build it inside a checkout of https://github.com/linkease/openwrt-app-meta
# as applications/app-meta-tailscale-updater/, or ship it in your own
# openwrt-app-meta fork so iStore lists the app.
#
include $(TOPDIR)/rules.mk

PKG_VERSION:=1.0.0
PKG_RELEASE:=1

META_TITLE:=Tailscale 更新
META_TITLE.en:=Tailscale Updater
META_DEPENDS:=+luci-app-tailscale-updater
META_DESCRIPTION:=把 iStore 安装的 Tailscale 从 1.80.3-1 更新到官方最新稳定版，保留配置与登录状态
META_DESCRIPTION.en:=Update the iStore-installed Tailscale from 1.80.3-1 to the latest upstream stable release, keeping config and login state.
META_AUTHOR:=kaliliu
META_TAGS:=networking service
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/tailscale-updater
META_WEBSITE:=https://tailscale.com/

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
