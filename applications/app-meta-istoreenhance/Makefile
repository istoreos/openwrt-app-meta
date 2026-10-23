# This is free software, licensed under the Apache License, Version 2.0 .

include $(TOPDIR)/rules.mk

PKG_VERSION:=0.8.4
PKG_RELEASE:=3
META_TITLE:=KSpeeder(原iStore增强)
META_TITLE.en:=KSpeeder(iStoreEnhance)
META_DEPENDS:=+istoreenhance +luci-app-istoreenhance +luci-i18n-istoreenhance-zh-cn
META_DESCRIPTION:=KSpeeder 为 Docker 镜像、软件包/文件下载和 GitHub/GitLab 公开仓库克隆提供网络加速。
META_DESCRIPTION.en:=KSpeeder accelerates Docker images, package/file downloads, and public GitHub/GitLab repository clones.
META_AUTHOR:=xiaobao
META_ARCH:=x86_64 aarch64 arm
META_TAGS:=nas service
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/istoreenhance
META_WEBSITE:=https://kspeeder.com/
META_TUTORIAL:=https://kspeeder.com/guide/getting-started.html
META_AUTOCONF:=path enable
META_UCI:=istoreenhance

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
