# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_VERSION:=8.3.2
PKG_RELEASE:=20260723
META_TITLE:=Proxmox虚拟机(PVE)
META_DEPENDS:=+luci-app-pve +luci-i18n-pve-zh-cn +docker-deps
META_DESCRIPTION:=运行在 iStoreOS 上面的 Proxmox(PVE) 虚拟机平台。
META_DESCRIPTION.en:=Proxmox in iStoreOS.
META_AUTHOR:=Proxmox
META_TAGS:=system tool
META_ARCH:=x86_64
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/pve
META_WEBSITE:=https://pve.proxmox.com/
META_AUTOCONF:=path enable
META_UCI:=pve
META_TUTORIAL:=https://doc.linkease.com/zh/guide/istore/software/pve.html

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
