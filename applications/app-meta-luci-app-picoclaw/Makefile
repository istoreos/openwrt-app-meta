# This is free software, licensed under the Apache License, Version 2.0.

include $(TOPDIR)/rules.mk

PKG_VERSION:=1.2.1
PKG_RELEASE:=1

META_TITLE:=PicoClaw AI 助手
META_TITLE.en:=PicoClaw AI Manager
META_DEPENDS:=+luci-app-picoclaw
META_DESCRIPTION:=PicoClaw 轻量级AI助手的LuCI管理界面。支持服务监控、配置编辑、通道管理、聊天交互、硬件控制、技能系统、定时任务、MCP服务、模型与认证、推理强度、搜索引擎配置、5语言国际化。
META_DESCRIPTION.en:=LuCI management interface for PicoClaw AI assistant. Features: service monitoring, config editing, channel management, chat, hardware control, skills system, cron jobs, MCP servers, models and auth, thinking level, search engine config, 5-language i18n.
META_AUTHOR:=GennKann
META_TAGS:=ai tool
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/picoclaw
META_WEBSITE:=https://github.com/sipeed/picoclaw
META_TUTORIAL:=https://github.com/GennKann/luci-app-picoclaw\#readme

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
