# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_VERSION:=4.2.8
PKG_RELEASE:=2
META_TITLE:=DDNSTO路由远程
META_TITLE.en:=DDNSTO
META_DEPENDS:=+ddnsto +luci-app-ddnsto +luci-i18n-ddnsto-zh-cn
META_DESCRIPTION:=DDNSTO内网穿透，可以外网远程你的路由器
META_DESCRIPTION.en:=DDNSTO is a reverse proxy software that does not need to deploy a server. It is mainly used to manage intranet devices on the Internet through a browser.
META_AUTHOR:=xiaobao
META_ARCH:=x86_64 aarch64
META_TAGS:=networking service
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/ddnsto
META_WEBSITE:=https://www.ddnsto.com/

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
