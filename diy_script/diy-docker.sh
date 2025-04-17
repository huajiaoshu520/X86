#!/bin/bash
#
# Copyright (c) 2019-2025 huajiaoshu520
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/huajiaoshu520/X86
# File name: diy-docker.sh
# Description: OpenWrt DIY script docker (After Update feeds)
#

# dockerman
#sed -i 's/+cgroupfs-mount //g' feeds/luci/applications/luci-app-dockerman/Makefile
#sed -i '42i sed -i "/^# the system init finished. By default this file does nothing./a \/etc\/init.d\/cgroupfs-mount disable" \/etc\/rc.local' package/lean/default-settings/files/zzz-default-settings
#rm -rf ./feeds/luci/applications/luci-app-dockerman
#git clone https://github.com/Jason6111/luci-app-dockerman ./feeds/luci/applications/luci-app-dockerman
#rm -rf ./feeds/packages/utils/dockerd
#git clone https://github.com/Jason6111/dockerd ./feeds/packages/utils/dockerd && chmod -R 777 ./feeds/packages/utils/dockerd

# dockerd
# wget https://codeload.github.com/moby/moby/tar.gz/v28.1.0
# sha256sum v28.1.0
sed -i -e 's/27.0.2/28.1.0/g' \
       -e 's/2705abdd7a8a47ec88c0d2f0f31eede01ba4aa5ae8b5ab0e2c4ee25e7c314521/4da7dc30bf04d006fd25e0b8f8dedd773a456760f5d57afeef6e1520290bc9592/g' \
       -e 's/e953d76/3f46cad/g' ./feeds/packages/utils/dockerd/Makefile

# docker
# wget https://codeload.github.com/docker/cli/tar.gz/v28.1.0
sed -i -e 's/27.0.2/28.1.0/g' \
       -e 's/a2b31d4c8143c8b126e98a359639f51727fc83fc1e61670efbdeaa7dea92fd5a/30a5a05f6276b99c9459c67f1e885870d04a02f456e77a8413994c5148ce5242/g' \
       -e 's/912c1dd/4d8c241/g' ./feeds/packages/utils/docker/Makefile

# containerd      
# https://codeload.github.com/containerd/containerd
sed -i -e 's/1.7.18/1.7.27/g' \
       -e 's/91685cebd50e3f353a402adadf61e2a6aeda3f63754fa0fcc978a043e00acac4/374f1c906b409cfad142b20d208f99e9539e5eb47fbb47ea541b4dfc9867345f/g' ./feeds/packages/utils/containerd/Makefile

# runc
# https://codeload.github.com/opencontainers/runc/tar.gz/v1.2.6
sed -i -e 's/1.1.13/1.2.6/g' \
       -e 's/789d5749a08ef1fbe5d1999b67883206a68a4e58e6ca0151c411d678f3480b25/19b280702341f33ff353fa254d1dbdb67f6aab2c74395f6d651a17524f68e752/g' ./feeds/packages/utils/runc/Makefile
