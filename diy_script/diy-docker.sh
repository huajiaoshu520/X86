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
# wget https://codeload.github.com/moby/moby/tar.gz/docker-v29.7.2
# sha256sum docker-v29.7.2
sed -i -e 's/29.1.1/29.7.2/g' \
       -e 's/65221f1c70feb1bd1562bb1017b586e4528be877656dc16f5be5659fc9b7e522/3a93a88bff41ffa6f4dca9f4ed9fc05e7fdb08e0f9014cf1d8177f85ecbc0683/g' \
       -e 's/9a84135/6a43e3d/g' ./feeds/packages/utils/dockerd/Makefile

# docker
# wget https://codeload.github.com/docker/cli/tar.gz/v29.7.2
sed -i -e 's/29.1.1/29.7.2/g' \
       -e 's/a02081b7d6fb10bfbc8afb621e7edc5124048b31eea7a1ab73c7ccd924b03a66/225b7ab2a15f5230b482df8461069cd4bce38891266fb9898d4188d0a3cbf54a/g' \
       -e 's/0aedba5/a7dcaa6/g' ./feeds/packages/utils/docker/Makefile
# containerd      
# wget https://codeload.github.com/containerd/containerd/tar.gz/v2.3.4
#sed -i -e 's/2.2.0/2.3.4/g' \
#       -e 's/86e7a268fc73f5332522baef86082c1d6c17986e2957a9ad842ead35d1080fca/175bbf57d637c987fa742f846b43b1b8ba2c61af6a9eaec619c625e4a8a19b69/g' ./feeds/packages/utils/containerd/Makefile
#sed -i 's/containerd-shim,containerd-shim-runc-v1,//g' ./feeds/packages/utils/containerd/Makefile

# runc
# https://codeload.github.com/opencontainers/runc/tar.gz/v1.3.4
#sed -i -e 's/1.3.3/1.3.4/g' \
#       -e 's/3da010af5c2c1c3d12d460255e4a7dc049c223ebc629c80fbbe4c10720997ffe/a9f9646c4c8990239f6462b408b22d9aa40ba0473a9fc642b9d6576126495eee/g' ./feeds/packages/utils/runc/Makefile


sed -i '/containerd.installer/{s/^/# /}' ./feeds/packages/utils/dockerd/Makefile
sed -i '/runc.installer/{s/^/# /}' ./feeds/packages/utils/dockerd/Makefile
#补丁
mkdir -p ./feeds/packages/utils/dockerd/patches

wget -O ./feeds/packages/utils/dockerd/patches/001-skip-copy-nested-binaries.patch \
  https://raw.githubusercontent.com/huajiaoshu520/X86/refs/heads/main/dockerd/patches/001-skip-copy-nested-binaries.patch
