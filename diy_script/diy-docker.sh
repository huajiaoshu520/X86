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

# dockerd
# wget https://codeload.github.com/moby/moby/tar.gz/docker-v29.7.2
# sha256sum docker-v29.7.2
sed -i -e 's/29.6.1/29.8.0/g' \
       -e 's/a97bd870c4b072b7d9cc053b2a806ca3d920f192f9dc6a662e17c1b69f56f2e1/e75ffb5d2ddc1fd98138fdb5e29f707b59f415ec8697e73b8bbdf8bbbb4be8eb/g' \
       -e 's/8ec5ab3/3ce5872/g' ./feeds/packages/utils/dockerd/Makefile

#适配docker29.8.0
wget -O ./feeds/packages/utils/docker/Makefile \
  https://raw.githubusercontent.com/huajiaoshu520/X86/refs/heads/main/patches/docker/Makefile

# docker
# wget https://codeload.github.com/docker/cli/tar.gz/v29.7.2
sed -i -e 's/29.6.1/29.8.0/g' \
       -e 's/74d14dd212b07cd3328989dc6a029dde2ebbe6a878199eaaafad54916f456194/c5fadbc00c02dbecb1b7c9936e188baf9c80421a9107e7e9ad36a0923a0fc764/g' \
       -e 's/8900f1d/88096ef/g' ./feeds/packages/utils/docker/Makefile

sed -i '/containerd.installer/{s/^/# /}' ./feeds/packages/utils/dockerd/Makefile
sed -i '/runc.installer/{s/^/# /}' ./feeds/packages/utils/dockerd/Makefile

#补丁
mkdir -p ./feeds/packages/utils/dockerd/patches

wget -O ./feeds/packages/utils/dockerd/patches/001-skip-copy-nested-binaries.patch \
  https://raw.githubusercontent.com/huajiaoshu520/X86/refs/heads/main/patches/dockerd/patches/001-skip-copy-nested-binaries.patch
