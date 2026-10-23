# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_VERSION:=3.0.21
PKG_RELEASE:=4
META_TITLE:=iStoreNAS(原iStoreX)
META_TITLE.en:=iStoreNAS(iStoreX)
# iStoreNAS is the product bundle that aggregates LinkEaseFull core with the
# selected NAS business applications.
META_DEPENDS:=+app-meta-linkeasefull +app-meta-dockermanager +app-meta-kaiplus +app-meta-baidudrive +app-meta-istoreenhance +luci-theme-istorenas
META_DESCRIPTION:=把 iStoreOS 一键变成 NAS 系统，网盘，同步，组网，时光机，AI 等一网打尽。
META_DESCRIPTION.en:=Turn iStoreOS into a NAS system in one click, covering cloud drives, sync, networking, Time Machine, AI, and more.
META_AUTHOR:=Xiaobao
META_ARCH:=x86_64 aarch64
META_TAGS:=net system
META_LUCI_ENTRY:=/apps/
META_WEBSITE:=https://www.istoreos.com
META_TUTORIAL:=https://doc.linkease.com/zh/guide/istore/software/istorex.html

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
