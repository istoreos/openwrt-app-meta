# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_VERSION:=685.1
PKG_RELEASE:=20261027
META_TITLE:=梨享雾计算OpenFog
META_DEPENDS:=+luci-app-fogvdn +luci-i18n-fogvdn-zh-cn
META_DESCRIPTION:=梨享雾计算（OpenFog）通过利用闲置设备的网络、算力和存储资源，为用户提供零门槛的闲置资源创收平台。无需复杂操作，只需简单几步，3分钟即可将家中NAS、路由器或主机构建成智能节点，兼容主流硬件，不干扰日常使用。无论你是科技发烧友还是普通用户，都能轻松开启设备24小时智能创收。
META_AUTHOR:=梨享
META_TAGS:=net tool
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/openfog
META_WEBSITE:=https://openfogos.com/
META_TUTORIAL:=https://openfogos.com/help/plugin/istoreos.md
META_UCI:=fogvdn

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
