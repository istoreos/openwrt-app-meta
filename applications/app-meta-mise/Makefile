include $(TOPDIR)/rules.mk

PKG_VERSION:=0.1.1
PKG_RELEASE:=3
META_TITLE:=运行时环境
META_TITLE.en:=Runtime Environments
META_DEPENDS:=+mise-runtime +luci-app-mise
META_DESCRIPTION:=在持久磁盘管理多个固定版本的开发运行时及私有运行库。
META_DESCRIPTION.en:=Persistent versioned language runtimes and private runtime libraries.
META_AUTHOR:=LinkEase
META_ARCH:=x86_64 aarch64
META_TAGS:=development
META_LUCI_ENTRY:=/cgi-bin/luci/admin/services/mise
META_WEBSITE:=https://mise.jdx.dev/
META_AUTOCONF:=path
META_UCI:=mise

include ../../meta.mk

# call BuildPackage - OpenWrt buildroot signature
