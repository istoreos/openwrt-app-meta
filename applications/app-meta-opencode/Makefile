# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_VERSION:=2.4.1
PKG_RELEASE:=6
META_TITLE:=OpenCode
META_TITLE.en:=OpenCode
META_DEPENDS:=+opencode +luci-app-opencode +luci-app-mise
META_DESCRIPTION:=在 iStoreOS 上安装并通过浏览器终端运行 OpenCode 编码代理。
META_DESCRIPTION.en:=Install and run OpenCode on iStoreOS with a protected browser terminal.
META_AUTHOR:=LinkEase
META_ARCH:=x86_64 aarch64
META_TAGS:=dev ai
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/opencode
META_WEBSITE:=https://opencode.ai/docs/
META_AUTOCONF:=path enable
META_UCI:=opencode

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
