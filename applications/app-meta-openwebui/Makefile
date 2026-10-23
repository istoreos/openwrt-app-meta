# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_VERSION:=1.0.8
PKG_RELEASE:=20250326
META_TITLE:=OpenWebUI
META_TITLE.en:=OpenWebUI
META_DEPENDS:=+luci-app-openwebui +luci-i18n-openwebui-zh-cn +docker-deps
META_DESCRIPTION:=Open WebUI 是一款可扩展、自托管的 AI 界面，能够无缝适配您的工作流程，且所有操作均可完全离线运行。
META_DESCRIPTION.en:=Open WebUI is an extensible, self-hosted AI interface that adapts to your workflow, all while operating entirely offline.
META_AUTHOR:=open-webui
META_TAGS:=net ai
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/openwebui
META_WEBSITE:=https://openwebui.com/
META_TUTORIAL:=https://doc.linkease.com/zh/guide/istore/software/openwebui.html
META_AUTOCONF:=path enable
META_UCI:=openwebui

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
