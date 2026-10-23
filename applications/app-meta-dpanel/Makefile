# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_VERSION:=1.0.0
PKG_RELEASE:=20251010
META_TITLE:=DPanel 可视化面板
META_TITLE.en:=DPanel - lightweight docker management panel
META_DEPENDS:=+luci-app-dpanel +luci-i18n-dpanel-zh-cn +docker-deps
META_DESCRIPTION:=轻量化 docker 可视化管理面板。
META_DESCRIPTION.en:=A lightweight docker visual management panel.
META_AUTHOR:=donknap
META_TAGS:=net
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/dpanel
META_WEBSITE:=https://github.com/donknap/dpanel
META_TUTORIAL:=https://www.koolcenter.com/t/topic/4110
META_AUTOCONF:=path enable
META_UCI:=dpanel

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature

