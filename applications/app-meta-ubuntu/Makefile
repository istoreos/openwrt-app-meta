# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_VERSION:=1.1.0
PKG_RELEASE:=20251013
META_TITLE:=Ubuntu
META_DEPENDS:=+luci-app-ubuntu2 +luci-i18n-ubuntu2-zh-cn +docker-deps
META_DESCRIPTION:=带Web远程桌面的高性能Docker版Ubuntu。
META_DESCRIPTION.en=Ubuntu2 is a high-Performance ubuntu with web remote desktop.
META_AUTHOR:=xiaobao
META_TAGS:=system tool
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/ubuntu2
META_WEBSITE:=https://www.kasmweb.com
META_TUTORIAL:=https://www.koolcenter.com/t/topic/4342
META_AUTOCONF:=path enable
META_UCI:=ubuntu2

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
