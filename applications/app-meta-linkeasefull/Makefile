# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_VERSION:=3.0.23
PKG_RELEASE:=3
META_TITLE:=易有云完整版
META_TITLE.en:=LinkEase Full
# Product boundary: desktop and storage core only. Business app aggregation
# belongs to app-meta-istorex (iStoreNAS), not this package.
META_DEPENDS:=+linkease-runtime-transition +linkease +linkeasefull +luci-app-linkeasefull +luci-app-linkeasefull-embed +luci-lib-linkeasefile +luci-i18n-linkeasefull-zh-cn
META_DESCRIPTION:=易有云完整版提供本地 Web 桌面、内置 OpenWrt 管理和 8897 兼容入口，复用独立的易有云文件管理入口，运行时会停用标准版易有云。
META_DESCRIPTION.en:=LinkEase Full provides the local web desktop, embedded OpenWrt administration, and the legacy 8897 entry; it reuses the shared LinkEase file entry and disables the standard LinkEase runtime while running.
META_AUTHOR:=xiaobao
META_ARCH:=x86_64 aarch64
META_TAGS:=nas service
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/linkeasefull
META_WEBSITE:=https://www.linkease.com/
META_TUTORIAL:=https://doc.linkease.com/zh/guide/istore/software/linkease.html

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
