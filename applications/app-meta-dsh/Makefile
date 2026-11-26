# This is free software, licensed under the Apache License, Version 2.0.

include $(TOPDIR)/rules.mk

PKG_VERSION:=1.0.0
PKG_RELEASE:=4
META_TITLE:=DSH
META_TITLE.en:=DSH
META_DEPENDS:=+dsh +luci-app-dsh +luci-i18n-dsh-zh-cn +docker-deps
META_DESCRIPTION:=DeepSeek Harness Web 工作台，提供模型、会话、工具、审批和插件能力，并在受控 Docker 容器中运行。
META_DESCRIPTION.en:=DeepSeek Harness Web workbench for models, sessions, tools, approvals and plugins, running in a controlled Docker container.
META_AUTHOR:=DeepSeek AI / LinkEase
META_ARCH:=x86_64 aarch64
META_TAGS:=ai docker
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/dsh
META_WEBSITE:=https://github.com/deepseek-ai/deepseek-harness
META_AUTOCONF:=path enable
META_UCI:=dsh

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
