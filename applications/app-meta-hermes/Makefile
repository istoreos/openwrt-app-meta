# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_VERSION:=1.0.0
PKG_RELEASE:=3
META_TITLE:=Hermes
META_TITLE.en:=Hermes
META_DEPENDS:=+luci-app-hermes +luci-i18n-hermes-zh-cn
META_DESCRIPTION:=运行在您的服务器上的自我改进型人工智能代理。它采用跨会话累积的分层内存、在您离线时运行的定时任务调度程序，以及自动保存可重用程序的技能系统。
META_DESCRIPTION.en:=The self-improving AI agent that runs on your server. Layered memory that accumulates across sessions, a cron scheduler that fires while you're offline, and a skills system that saves reusable procedures automatically.
META_AUTHOR:=linkease/hermes
META_TAGS:=ai docker
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/hermes
META_WEBSITE:=https://get-hermes.ai/

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
