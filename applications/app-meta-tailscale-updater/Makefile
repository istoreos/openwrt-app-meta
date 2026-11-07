# This is free software, licensed under the Apache License, Version 2.0 .
#
# iStore catalog metadata for the Tailscale updater.
# Copy this directory to applications/app-meta-tailscale-updater/ of a fork of
# https://github.com/linkease/openwrt-app-meta and open a PR.
#
include $(TOPDIR)/rules.mk

PKG_VERSION:=1.1.2
PKG_RELEASE:=1

META_TITLE:=Tailscale 更新
META_TITLE.en:=Tailscale Updater
META_DEPENDS:=+luci-app-tailscale-updater
META_DESCRIPTION:=自动识别旧版 Tailscale（1.80.3-1）与「Tailscale（社区版）」：旧版替换官方静态二进制；社区版默认走 opkg/apk，也可切换为官方静态包；支持每天自动检查更新，保留配置与登录状态
META_DESCRIPTION.en:=Auto-detects the legacy Tailscale (1.80.3-1) and the Tailscale community package: static binaries for the legacy app, opkg/apk by default for the community edition, with an option to switch to official static binaries. Includes an optional daily auto-update.
META_AUTHOR:=xialiu000
META_TAGS:=networking service
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/tailscale-updater
META_WEBSITE:=https://tailscale.com/
META_TUTORIAL:=https://github.com/xialiu000/istoreos-tailscale-updater/blob/main/docs/tutorial.md

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
