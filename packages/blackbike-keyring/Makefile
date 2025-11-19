# SPDX-License-Identifier: MIT
#
# Copyright (C) 2025 blackbike-packages

include $(TOPDIR)/rules.mk

PKG_NAME:=blackbike-keyring
PKG_VERSION:=20251118
PKG_RELEASE:=1

PKG_MAINTAINER:=Richard Smith <rtsmith134@gmail.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=License

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=base
  CATEGORY:=Base system
  TITLE:=blackbike-packages Developer Keyring
  PKGARCH:=all
endef

define Package/$(PKG_NAME)/description
  The keyring of with the developer using.
endef

Build/Compile=

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/opkg/keys/
	$(INSTALL_DATA) $(CURDIR)/usign/53ff2b6672243d29 $(1)/etc/opkg/keys/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
