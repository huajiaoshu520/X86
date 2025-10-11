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
sed -i -e 's/28.0.4/28.5.1/g' \
       -e 's/4b347a2b83221952cab93197f6e9bc7ffe54dd4bd0a9644c176aecde551721ca/c17f48bbea209f00e62915dfdbb90e471d296202e466335e43fc9d5982ae3a6a/g' \
       -e 's/6430e49/f8215cc/g' ./feeds/packages/utils/dockerd/Makefile

# docker
# wget https://codeload.github.com/docker/cli/tar.gz/v28.3.0
sed -i -e 's/28.0.4/28.5.1/g' \
       -e 's/09b41aa5ff656bc135feb80cb9b73c70aeba099ef9756c3cef7bcb2eb3c98ba6/3872f03dd3d1e2769ecad57c8744743e72ad619f72f1897f4886fd44746337cd/g' \
       -e 's/b8034c0/e180ab8/g' ./feeds/packages/utils/docker/Makefile

# containerd      
# https://codeload.github.com/containerd/containerd
sed -i -e 's/1.7.27/1.7.28/g' \
       -e 's/374f1c906b409cfad142b20d208f99e9539e5eb47fbb47ea541b4dfc9867345f/546aa9fdb04a0cd40a5cbc5c931c269d42522d473abd7234b98d98e63316ed9b/g' ./feeds/packages/utils/containerd/Makefile

# runc
# https://codeload.github.com/opencontainers/runc/tar.gz/v1.2.6
sed -i -e 's/1.2.6/1.3.0/g' \
       -e 's/19b280702341f33ff353fa254d1dbdb67f6aab2c74395f6d651a17524f68e752/3262492ce42bea0919ee1a2d000b6f303fd14877295bc38d094876b55fdd448b/g' ./feeds/packages/utils/runc/Makefile
