# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_VERSION:=1.0.9
PKG_RELEASE:=2
META_TITLE:=酷友社KAI
META_TITLE.en:=KoolCenter KaiPlus
META_DEPENDS:=+luci-app-kaiplus +kaiplus
META_DESCRIPTION:=酷友社KAI 解决各种问题，加速软件安装
META_DESCRIPTION.en:=KaiPlus AI solves various network issues and speeds up software installation.
META_AUTHOR:=koolcenter
META_ARCH:=x86_64 aarch64
META_TAGS:=system ai
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/kaiplus
META_WEBSITE:=https://ai.koolcenter.com
META_AUTOCONF:=path enable
META_UCI:=kaiplus

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
