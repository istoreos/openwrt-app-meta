# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_VERSION:=2.1.326
PKG_RELEASE:=3
META_TITLE:=Claude Code
META_TITLE.en:=Claude Code
META_DEPENDS:=+claude-code +luci-app-claude-code +luci-app-mise
META_DESCRIPTION:=在 iStoreOS 上安装并通过浏览器终端运行 Anthropic Claude Code 编码代理。
META_DESCRIPTION.en:=Install and run Anthropic Claude Code on iStoreOS with a protected browser terminal.
META_AUTHOR:=LinkEase
META_ARCH:=x86_64 aarch64
META_TAGS:=development ai
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/claude
META_WEBSITE:=https://code.claude.com/docs/
META_AUTOCONF:=path enable
META_UCI:=claude

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
