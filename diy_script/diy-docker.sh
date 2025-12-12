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
# wget https://codeload.github.com/moby/moby/tar.gz/docker-v29.1.3
# sha256sum docker-v29.1.3
sed -i -e 's/28.0.4/29.1.3/g' \
       -e 's/4b347a2b83221952cab93197f6e9bc7ffe54dd4bd0a9644c176aecde551721ca/a3999adc2099b493d924fe7e1d07dfb4c7cb2887ea5c84c4de95554ee9ac8a07/g' \
       -e 's/PKG_GIT_REF:=v\$(PKG_VERSION)/PKG_GIT_REF:=docker-v$(PKG_VERSION)/' \
       -e 's/6430e49/fbf3ed2/g' ./feeds/packages/utils/dockerd/Makefile

# docker
# wget https://codeload.github.com/docker/cli/tar.gz/v29.1.3
sed -i -e 's/28.0.4/29.1.3/g' \
       -e 's/09b41aa5ff656bc135feb80cb9b73c70aeba099ef9756c3cef7bcb2eb3c98ba6/fa3ba185df4f19d35d354962ded252cd5bbd19d795d7207c0eddcb1372a70779/g' \
       -e 's/b8034c0/f52814d/g' ./feeds/packages/utils/docker/Makefile

# containerd      
# wget https://codeload.github.com/containerd/containerd/tar.gz/v2.2.0
sed -i -e 's/1.7.27/2.2.0/g' \
       -e 's/374f1c906b409cfad142b20d208f99e9539e5eb47fbb47ea541b4dfc9867345f/86e7a268fc73f5332522baef86082c1d6c17986e2957a9ad842ead35d1080fca/g' ./feeds/packages/utils/containerd/Makefile
sed -i 's/containerd-shim,containerd-shim-runc-v1,//g' ./feeds/packages/utils/containerd/Makefile

# runc
# https://codeload.github.com/opencontainers/runc/tar.gz/v1.3.4
sed -i -e 's/1.2.6/1.3.4/g' \
       -e 's/19b280702341f33ff353fa254d1dbdb67f6aab2c74395f6d651a17524f68e752/a9f9646c4c8990239f6462b408b22d9aa40ba0473a9fc642b9d6576126495eee/g' ./feeds/packages/utils/runc/Makefile
