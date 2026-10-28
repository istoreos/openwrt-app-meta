# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_VERSION:=0.0.6
PKG_RELEASE:=2
META_TITLE:=Tailscale（已废弃）
META_TITLE.en:=Tailscale (Deprecated)
META_DEPENDS:=+tailscaled +luci-app-tailscaler
META_DESCRIPTION:=基于 WireGuard 协议的简单易用虚拟局域网服务。已废弃，请卸载并迁移到Tailscale（社区版）
META_DESCRIPTION.en:=A easy use VPN service based on WireGuard. Deprecated, please uninstall and migrate to Tailscale (Community)
META_AUTHOR:=Tailscale Inc./Carseason
META_TAGS:=networking service
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/tailscaler
META_WEBSITE:=https://tailscale.com/

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
