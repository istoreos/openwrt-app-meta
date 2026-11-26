# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_VERSION:=3.0.0
PKG_RELEASE:=4
META_TITLE:=易有云
META_TITLE.en:=LinkEase
META_DEPENDS:=+linkease-runtime-transition +linkease +luci-app-linkease +luci-lib-linkeasefile +luci-i18n-linkease-zh-cn
META_DESCRIPTION:=易有云提供远程访问、文件管理、相册备份、文件同步和备份仓库能力。
META_DESCRIPTION.en:=LinkEase provides remote access, file management, photo backup, sync, and backup repository.
META_AUTHOR:=xiaobao
META_ARCH:=x86_64 aarch64 arm
META_TAGS:=nas service
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/linkease
META_WEBSITE:=https://www.linkease.com/
META_TUTORIAL:=https://doc.linkease.com/zh/guide/istore/software/linkease.html

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
