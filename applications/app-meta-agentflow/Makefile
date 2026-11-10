# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_VERSION:=0.3.5
PKG_RELEASE:=3
META_TITLE:=AgentFlow
META_DEPENDS:=+agentflow +luci-app-agentflow
META_DESCRIPTION:=AgentFlow 提供 OpenCode、Codex、Claude 编码代理与工作流编排 Web UI。
META_DESCRIPTION.en:=AgentFlow provides a Web UI for coding agents and workflow orchestration.
META_AUTHOR:=geiliai
META_ARCH:=x86_64 aarch64
META_TAGS:=development ai service
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/agentflow
META_WEBSITE:=https://agentflow.geili.ai/
META_AUTOCONF:=path enable
META_UCI:=agentflow

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
