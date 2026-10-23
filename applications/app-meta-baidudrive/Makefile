# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_VERSION:=1.0.6
PKG_RELEASE:=4
META_TITLE:=百度网盘
META_TITLE.en:=BaiduDrive
META_DEPENDS:=+luci-i18n-baidudrive-zh-cn +luci-app-baidudrive +baidudrive
META_DESCRIPTION:=百度网盘 iStoreOS 版
META_DESCRIPTION.en:=BaiduDrive for iStoreOS. BaiduDrive is a netdisk provided by Baidu.com
META_AUTHOR:=linkease
META_ARCH:=x86_64 aarch64
META_TAGS:=nas service
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/baidudrive
META_WEBSITE:=https://pan.baidu.com
META_AUTOCONF:=path enable
META_UCI:=baidudrive

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
