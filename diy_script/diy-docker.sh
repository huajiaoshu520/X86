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
sed -i -e 's/29.6.1/29.7.2/g' \
       -e 's/a97bd870c4b072b7d9cc053b2a806ca3d920f192f9dc6a662e17c1b69f56f2e1/3a93a88bff41ffa6f4dca9f4ed9fc05e7fdb08e0f9014cf1d8177f85ecbc0683/g' \
       -e 's/8ec5ab3/6a43e3d/g' ./feeds/packages/utils/dockerd/Makefile

# docker
# wget https://codeload.github.com/docker/cli/tar.gz/v29.7.2
sed -i -e 's/29.6.1/29.7.2/g' \
       -e 's/74d14dd212b07cd3328989dc6a029dde2ebbe6a878199eaaafad54916f456194/225b7ab2a15f5230b482df8461069cd4bce38891266fb9898d4188d0a3cbf54a/g' \
       -e 's/8900f1d/a7dcaa6/g' ./feeds/packages/utils/docker/Makefile

sed -i '/containerd.installer/{s/^/# /}' ./feeds/packages/utils/dockerd/Makefile
sed -i '/runc.installer/{s/^/# /}' ./feeds/packages/utils/dockerd/Makefile

#补丁
mkdir -p ./feeds/packages/utils/dockerd/patches

wget -O ./feeds/packages/utils/dockerd/patches/001-skip-copy-nested-binaries.patch \
  https://raw.githubusercontent.com/huajiaoshu520/X86/refs/heads/main/patches/dockerd/patches/001-skip-copy-nested-binaries.patch
