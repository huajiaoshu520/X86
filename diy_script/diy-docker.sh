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
sed -i -e 's/29.6.1/29.8.1/g' \
       -e 's/a97bd870c4b072b7d9cc053b2a806ca3d920f192f9dc6a662e17c1b69f56f2e1/94be9d6940b613676335fc494e617b4acf98676435b3744f32649ed72114bd58/g' \
       -e 's/8ec5ab3/464cd50/g' ./feeds/packages/utils/dockerd/Makefile
       
#containerd       
wget -O ./feeds/packages/utils/containerd/Makefile \
  https://raw.githubusercontent.com/huajiaoshu520/X86/refs/heads/main/patches/containerd/Makefile
  
#runc  
wget -O ./feeds/packages/utils/runc/Makefile \
  https://raw.githubusercontent.com/huajiaoshu520/X86/refs/heads/main/patches/runc/Makefile
  
#适配docker29.8.0
wget -O ./feeds/packages/utils/docker/Makefile \
  https://raw.githubusercontent.com/huajiaoshu520/X86/refs/heads/main/patches/docker/Makefile
sed -i '/^[[:space:]]*cli\/compose\/schema\/data[[:space:]]*\\$/a\
\tvendor/github.com/santhosh-tekuri/jsonschema/v6/metaschemas \\' ./feeds/packages/utils/docker/Makefile

# docker
# wget https://codeload.github.com/docker/cli/tar.gz/v29.7.2
sed -i -e 's/29.6.1/29.8.1/g' \
       -e 's/74d14dd212b07cd3328989dc6a029dde2ebbe6a878199eaaafad54916f456194/55bcae5053f0914118d229658e2ac3a877dbdead6cb2c322e525d0c1e8bf78d2/g' \
       -e 's/8900f1d/4a63305/g' ./feeds/packages/utils/docker/Makefile

sed -i -e '\|$(call EnsureVendoredVersion,containerd)|{s/^/# /}' \
       -e '\|$(call EnsureVendoredVersion,runc)|{s/^/# /}' \
       ./feeds/packages/utils/dockerd/Makefile
