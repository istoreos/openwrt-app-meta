# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_VERSION:=0.8.5
PKG_RELEASE:=20260723
META_TITLE:=KVM虚拟机(WebVirtCloud)
META_DEPENDS:=+luci-app-webvirtcloud +luci-i18n-webvirtcloud-zh-cn +docker-deps
META_DESCRIPTION:=iStoreOS上面的 KVM 虚拟机，基于 WebVirtCloud 实现。
META_DESCRIPTION.en:=KVM virtual machine implemented based on WebVirtCloud.
META_AUTHOR:=webvirtcloud
META_TAGS:=system tool
META_ARCH:=x86_64
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/webvirtcloud
META_WEBSITE:=https://webvirt.cloud/
META_AUTOCONF:=path enable
META_UCI:=webvirtcloud

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
