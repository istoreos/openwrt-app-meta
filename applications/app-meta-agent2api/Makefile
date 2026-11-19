# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_VERSION:=0.0.1
PKG_RELEASE:=20261118
META_TITLE:=Agent2API
META_DEPENDS:=+luci-app-agent2api +luci-i18n-agent2api-zh-cn +docker-deps
META_DESCRIPTION:=AI 路由网关与 Agent 客户端接管：统一模型接口、账号路由、网关密钥与请求报表。
META_DESCRIPTION.en:=AI routing gateway with Agent client takeover: unified model APIs, account routing, gateway keys and request reports.
META_AUTHOR:=aimod-cc
META_ARCH:=x86_64 aarch64
META_TAGS:=net ai service
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/agent2api
META_WEBSITE:=https://github.com/aimod-cc/Agent2API
META_TUTORIAL:=
META_AUTOCONF:=path enable
META_UCI:=agent2api

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
