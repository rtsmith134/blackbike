# SPDX-License-Identifier: GPL-3
#
# Copyright (C) 2025 muink <https://github.com/muink>

include $(TOPDIR)/rules.mk

PKG_NAME:=blackbike-packages
PKG_VERSION:=1.0
PKG_RELEASE:=20251118

PKG_MAINTAINER:=Richard Smith <rtsmith134@gmail.com>
PKG_LICENSE:=GPL-3
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)/Default
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=self-use openwrt extended packages
	URL:=https://github.com/rtsmith134/blackbike
	DEPENDS:=
	PKGARCH:=all
endef

define Package/$(PKG_NAME)-packages
	$(call Package/$(PKG_NAME)/Default)
	DEPENDS+:=\
		+blackbike-keyring \
		+blackbike-packages-feeds \
		+tunnelblick-openvpn
endef

define Package/$(PKG_NAME)-luci
	$(call Package/$(PKG_NAME)/Default)
	DEPENDS+:=\
		+luci-app-netspeedtest
endef

define Package/$(PKG_NAME)
	$(call Package/$(PKG_NAME)/Default)
	DEPENDS+:=\
		+blackbike-keyring \
		+blackbike-packages-feeds \
		+tunnelblick-openvpn \
		+luci-app-netspeedtest

endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/conffiles
endef

define Package/$(PKG_NAME)/postinst
endef

define Package/$(PKG_NAME)/prerm
endef

define Package/$(PKG_NAME)/install/Default
	:
endef

Package/$(PKG_NAME)-packages/install = $(Package/$(PKG_NAME)/install/Default)
Package/$(PKG_NAME)-luci/install = $(Package/$(PKG_NAME)/install/Default)
Package/$(PKG_NAME)/install = $(Package/$(PKG_NAME)/install/Default)

$(eval $(call BuildPackage,$(PKG_NAME)-packages))
$(eval $(call BuildPackage,$(PKG_NAME)-luci))
$(eval $(call BuildPackage,$(PKG_NAME)))
