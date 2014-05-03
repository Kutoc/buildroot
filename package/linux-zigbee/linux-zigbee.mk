################################################################################
#
# linux-zigbee
#
################################################################################

LINUX_ZIGBEE_VERSION = v0.3.1
LINUX_ZIGBEE_SITE = git://linux-zigbee.git.sourceforge.net/gitroot/linux-zigbee/linux-zigbee
LINUX_ZIGBEE_LICENSE = GPLv2
LINUX_ZIGBEE_LICENSE_FILES = COPYING
LINUX_ZIGBEE_AUTORECONF = YES
LINUX_ZIGBEE_INSTALL_STAGING = YES
LINUX_ZIGBEE_DEPENDENCIES = libnl

LINUX_ZIGBEE_CONF_OPT += --disable-manpages\
        --with-leasefile="$(call qstrip,$(BR2_PACKAGE_LINUX_ZIGBEE_LEASEFILE))"

ifeq ($(BR2_PACKAGE_LINUX_ZIGBEE_TESTS),y)
LINUX_ZIGBEE_CONF_OPT += --with-zbtestdir='/usr/sbin/'
else
LINUX_ZIGBEE_CONF_OPT += --with-zbtestdir=''
endif

ifeq ($(BR2_PACKAGE_LINUX_ZIGBEE_OLD_KERNEL_COMPAT),y)
LINUX_ZIGBEE_CONF_OPT += --enable-kernel-compat
endif

$(eval $(autotools-package))
