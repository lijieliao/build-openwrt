#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#

# 修复NTFS格式优盘不自动挂载和热拨插卡机问题（小闪存机子慎用,开启后会增加2.6MB体积）
mkdir -p files/etc/hotplug.d/block && svn co https://github.com/281677160/openwrt-package/branches/usb/block files/etc/hotplug.d/block
ntfs="DEFAULT_PACKAGES += usbutils fdisk badblocks kmod-usb-ohci-pci kmod-usb-uhci kmod-usb-hid e2fsprogs wpad \
kmod-usb2-pci kmod-usb3 kmod-usb-storage-extras kmod-usb-storage-uas kmod-fs-ext4 kmod-fs-vfat "
sed -i "s/DEFAULT_PACKAGES += /$ntfs/" target/linux/*/Makefile
