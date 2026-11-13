# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_VERSION:=0.8.9
PKG_RELEASE:=21
META_TITLE:=FastNet 网络测速
META_TITLE.en:=FastNet
META_DEPENDS:=+fastnet +luci-app-fastnet +luci-i18n-fastnet-zh-cn
META_DESCRIPTION:=FastNet 提供网络测速与网络诊断 Web UI，默认端口 3200。
META_DESCRIPTION.en:=FastNet provides network testing tools and a Web UI (default port 3200).
META_AUTHOR:=xiaobao
META_ARCH:=x86_64 aarch64
META_TAGS:=networking service
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/fastnet
META_UCI:=fastnet
META_WEBSITE:=https://www.koolcenter.com/t/topic/9148

# The old metadata package owned the legacy JSON. Its upgrade may remove
# the compatibility link created by the plugin; let the installed owner repair it.
define Package/app-meta-fastnet/postinst
#!/bin/sh
root="$${IPKG_INSTROOT:-}"
helper="$${root}/usr/share/fastnet/register-desktop.sh"
if [ -f "$${helper}" ]; then
	sh "$${helper}" || exit $$?
fi
exit 0
endef

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
