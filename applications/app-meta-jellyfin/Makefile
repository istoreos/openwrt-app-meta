# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_VERSION:=1.2.3
PKG_RELEASE:=20260829
META_TITLE:=Jellyfin私有影院
META_TITLE.en:=Jellyfin
META_DEPENDS:=+luci-app-jellyfin +luci-i18n-jellyfin-zh-cn +docker-deps
META_DESCRIPTION:=Jellyfin是一个免费自由的媒体系统软件，可以让您方便地管理和串流您的媒体。部分机型无需配置即可支持硬件转码：Easepi ARS2；RK35xx 系列。
META_DESCRIPTION.en:=Jellyfin is the volunteer-built media solution that puts you in control of your media. Some models support hardware transcoding out-of-box: Easepi ARS2; RK35xx series.
META_AUTHOR:=Jellyfin/jjm2473
META_TAGS:=net multimedia
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/jellyfin
META_WEBSITE:=https://jellyfin.org
META_TUTORIAL:=https://doc.linkease.com/zh/guide/istore/software/jellyfin.html
META_AUTOCONF:=path enable
META_UCI:=jellyfin

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
