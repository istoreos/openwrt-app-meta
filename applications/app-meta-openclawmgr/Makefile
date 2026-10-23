# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_VERSION:=0.1.12
PKG_RELEASE:=2

META_TITLE:=OpenClaw Launcher
META_TITLE.en:=OpenClaw Launcher
META_DEPENDS:=+luci-app-openclawmgr +luci-i18n-openclawmgr-zh-cn
META_DESCRIPTION:=在 OpenWrt 上原生安装、启动并管理官方 OpenClaw。
META_DESCRIPTION.en:=OpenClaw Launcher for native deployment and management (procd + Node/npm).
META_AUTHOR:=xiaobao
META_ARCH:=x86_64 aarch64
META_TAGS:=ai
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/openclawmgr
META_WEBSITE:=https://github.com/openclaw/openclaw
META_TUTORIAL:=https://www.koolcenter.com/tags/c/soft-guides/16/openclaw
META_AUTOCONF:=path enable
META_UCI:=openclawmgr

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
