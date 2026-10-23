# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_VERSION:=0.1.2
PKG_RELEASE:=3
META_TITLE:=Docker管理
META_TITLE.en:=Docker Manager
META_DEPENDS:=+dockermanager +luci-app-dockermanager
META_DESCRIPTION:=更简单专业的 Docker 管理器，加速更快更方便.
META_DESCRIPTION.en:=Docker management module for LinkEase Desktop.
META_AUTHOR:=linkease
META_ARCH:=x86_64 aarch64
META_TAGS:=system docker
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/dockermanager
META_WEBSITE:=https://github.com/linkease/linkease-docker-manager
META_AUTOCONF:=path enable
META_UCI:=dockermanager

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
