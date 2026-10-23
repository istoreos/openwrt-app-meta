# This is free software, licensed under the Apache License, Version 2.0.

include $(TOPDIR)/rules.mk

PKG_VERSION:=0.6.6
PKG_RELEASE:=1
META_TITLE:=51DDNS 远程控制
META_TITLE.en:=51DDNS Remote Access
META_DEPENDS:=+51ddns-agent +luci-app-51ddns +luci-i18n-51ddns-zh-cn
META_DESCRIPTION:=51DDNS 内网穿透与远程控制，需要 51DDNS 账户。支持网页穿透、SSH、远程桌面、文件管理和动态 DNS；新版自动兼容官方 frpc 0.51.3，0.52.0 及以上使用 TOML。
META_DESCRIPTION.en:=51DDNS remote access requires a 51DDNS account. Supports web tunneling, SSH, remote desktop, file management and dynamic DNS. The new agent generates INI for official frpc 0.51.3 and uses TOML for 0.52.0 or later.
META_AUTHOR:=INTELLIGENT CLOUD LIMITED (智能雲有限公司)
META_ARCH:=x86_64 aarch64
META_TAGS:=networking service
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/51ddns
META_WEBSITE:=https://www.51ddns.com/
META_TUTORIAL:=https://github.com/21hkcloud/51ddns-openwrt/blob/a776d351d3fb26b8ce22108edf82e00567103f21/docs/openwrt.md

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
