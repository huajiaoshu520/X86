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
# wget https://codeload.github.com/moby/moby/tar.gz/v28.3.0
# sha256sum v28.1.1
sed -i -e 's/28.0.4/28.3.2/g' \
       -e 's/4b347a2b83221952cab93197f6e9bc7ffe54dd4bd0a9644c176aecde551721ca/e4828e32e474cef1b78f40278211648300071399c7498252dfe0b96e789b8a31/g' \
       -e 's/6430e49/e77ff99/g' ./feeds/packages/utils/dockerd/Makefile

# docker
# wget https://codeload.github.com/docker/cli/tar.gz/v28.3.0
sed -i -e 's/28.0.4/28.3.2/g' \
       -e 's/09b41aa5ff656bc135feb80cb9b73c70aeba099ef9756c3cef7bcb2eb3c98ba6/b65cd415e63be23fcaa63107bc47a762173a06c84fb78b1575edc5443bb39867/g' \
       -e 's/b8034c0/578ccf6/g' ./feeds/packages/utils/docker/Makefile

# containerd      
# https://codeload.github.com/containerd/containerd
sed -i -e 's/1.7.27/1.7.27/g' \
       -e 's/374f1c906b409cfad142b20d208f99e9539e5eb47fbb47ea541b4dfc9867345f/374f1c906b409cfad142b20d208f99e9539e5eb47fbb47ea541b4dfc9867345f/g' ./feeds/packages/utils/containerd/Makefile

# runc
# https://codeload.github.com/opencontainers/runc/tar.gz/v1.2.6
sed -i -e 's/1.2.6/1.2.6/g' \
       -e 's/19b280702341f33ff353fa254d1dbdb67f6aab2c74395f6d651a17524f68e752/19b280702341f33ff353fa254d1dbdb67f6aab2c74395f6d651a17524f68e752/g' ./feeds/packages/utils/runc/Makefile
