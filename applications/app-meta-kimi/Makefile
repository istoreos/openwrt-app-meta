# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_VERSION:=2.7.3
PKG_RELEASE:=5
META_TITLE:=Kimi Code
META_TITLE.en:=Kimi Code
META_DEPENDS:=+kimi +luci-app-kimi +luci-app-mise
META_DESCRIPTION:=在 iStoreOS 上安装并通过浏览器终端运行 Moonshot AI Kimi Code 编码代理。
META_DESCRIPTION.en:=Install and run Moonshot AI Kimi Code on iStoreOS with a protected browser terminal.
META_AUTHOR:=LinkEase
META_ARCH:=x86_64 aarch64
META_TAGS:=dev ai
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/kimi
META_WEBSITE:=https://www.kimi.com/code/docs/en/
META_AUTOCONF:=path enable
META_UCI:=kimi

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
