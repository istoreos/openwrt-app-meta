# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_VERSION:=0.172.0
PKG_RELEASE:=5
META_TITLE:=Codex
META_TITLE.en:=Codex
META_DEPENDS:=+codex +luci-app-codex +luci-app-mise
META_DESCRIPTION:=在 iStoreOS 上安装并通过浏览器终端运行 OpenAI Codex 编码代理。
META_DESCRIPTION.en:=Install and run OpenAI Codex on iStoreOS with a protected browser terminal.
META_AUTHOR:=LinkEase
META_ARCH:=x86_64 aarch64
META_TAGS:=dev ai
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/codex
META_WEBSITE:=https://developers.openai.com/codex/cli
META_AUTOCONF:=path enable
META_UCI:=codex

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
