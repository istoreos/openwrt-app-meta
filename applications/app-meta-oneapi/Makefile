# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_VERSION:=1.0.1
PKG_RELEASE:=20250404
META_TITLE:=OneAPI
META_TITLE.en:=OneAPI
META_DEPENDS:=+luci-app-oneapi +luci-i18n-oneapi-zh-cn +docker-deps
META_DESCRIPTION:=OneAPI 是LLM API 管理 & 分发系统，支持 OpenAI、Azure、Anthropic Claude、Google Gemini、DeepSeek。
META_DESCRIPTION.en:=OneAPI is LLM API Management & Distribution System, supporting OpenAI, Azure, Anthropic Claude, Google Gemini, and DeepSeek.
META_AUTHOR:=songquanpeng
META_TAGS:=net ai
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/oneapi
META_WEBSITE:=https://openai.justsong.cn
META_TUTORIAL:=https://doc.linkease.com/zh/guide/istore/software/oneapi.html
META_AUTOCONF:=path enable
META_UCI:=oneapi

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
