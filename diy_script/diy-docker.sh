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
# wget https://codeload.github.com/moby/moby/tar.gz/docker-v29.0.2
# sha256sum v28.1.1
sed -i -e 's/28.0.4/29.0.2/g' \
       -e 's/4b347a2b83221952cab93197f6e9bc7ffe54dd4bd0a9644c176aecde551721ca/7d7891d0c578d8118402d5f2fa353aab336d14dac96816a3dfb4f8f694b8d4d8/g' \
       -e 's/PKG_GIT_REF:=v\$(PKG_VERSION)/PKG_GIT_REF:=docker-v$(PKG_VERSION)/' \
       -e 's/6430e49/e9ff10b/g' ./feeds/packages/utils/dockerd/Makefile

# docker
# wget https://codeload.github.com/docker/cli/tar.gz/v29.0.2
sed -i -e 's/28.0.4/29.0.2/g' \
       -e 's/09b41aa5ff656bc135feb80cb9b73c70aeba099ef9756c3cef7bcb2eb3c98ba6/95cf6a9dabd5eecdc77cab028d9b82ffc3ae54b36ffa72861599dae495e25c90/g' \
       -e 's/b8034c0/8108357/g' ./feeds/packages/utils/docker/Makefile

# containerd      
# https://codeload.github.com/containerd/containerd/tar.gz/v2.2.0
sed -i -e 's/1.7.27/2.1.5/g' \
       -e 's/374f1c906b409cfad142b20d208f99e9539e5eb47fbb47ea541b4dfc9867345f/f8def69e02ecff84c07e24350be0b834a3a8e1f6accf042cae4d504e52eb03d1/g' ./feeds/packages/utils/containerd/Makefile
sed -i 's/containerd-shim,containerd-shim-runc-v1,//g' ./feeds/packages/utils/containerd/Makefile

# runc
# https://codeload.github.com/opencontainers/runc/tar.gz/v1.3.3
sed -i -e 's/1.2.6/1.3.3/g' \
       -e 's/19b280702341f33ff353fa254d1dbdb67f6aab2c74395f6d651a17524f68e752/3da010af5c2c1c3d12d460255e4a7dc049c223ebc629c80fbbe4c10720997ffe/g' ./feeds/packages/utils/runc/Makefile
