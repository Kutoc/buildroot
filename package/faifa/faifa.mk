################################################################################
#
# faifa
#
################################################################################

FAIFA_VERSION = aa0b5f90b89a9fd1533137b68ebf85f5437aba53
FAIFA_SITE = $(call github,ffainelli,faifa,$(FAIFA_VERSION))
FAIFA_INSTALL_STAGING = YES
FAIFA_DEPENDENCIES = libpcap
FAIFA_LICENSE = GPLv2
FAIFA_LICENSE_FILES = COPYING
FAIFA_AUTORECONF=YES

define FAIFA_INSTALL_TARGET_CMDS
    $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
        PREFIX=/usr \
        STRIP=/bin/true \
        DESTDIR=$(TARGET_DIR) \
        install
endef

define FAIFA_INSTALL_STAGING_CMDS
    $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
        PREFIX=/usr \
        STRIP=/bin/true \
        DESTDIR=$(STAGING_DIR) \
        install
endef

$(eval $(autotools-package))
