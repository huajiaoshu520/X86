#!/bin/bash
#
# Copyright (c) 2019-2025 huajiaoshu520
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/huajiaoshu520/X86
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.31.66/g' ./package/base-files/luci2/bin/config_generate

# 日期
sed -i 's/os.date(/&"%Y-%m-%d %H:%M:%S"/' ./package/lean/autocore/files/x86/index.htm

# 关闭串口跑码
sed -i 's/console=tty0//g'  ./target/linux/x86/image/Makefile
sed -i 's/%V, %C/[Year] | by Jason /g' ./package/base-files/files/etc/banner
sed -i "s/Year/$(TZ=':Asia/Shanghai' date '+%Y')/g" ./package/base-files/files/etc/banner
sed -i '/logins./a\                                          by Jason' ./package/base-files/files/etc/profile

# Modify default passwd
sed -i '/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF./ d' ./package/lean/default-settings/files/zzz-default-settings

# ID
sed -i "s/DISTRIB_REVISION='R.*.*.[0-9]/& Compiled by Jason/" ./package/lean/default-settings/files/zzz-default-settings

# 主题背景
mkdir -p ./feeds/luci/themes/luci-theme-argon/htdocs/luci-static/argon/background/ && curl -o ./feeds/luci/themes/luci-theme-argon/htdocs/luci-static/argon/background/Network.mp4 https://raw.githubusercontent.com/Jason6111/OpenWrt_Personal/main/other/argon/video/default/Network.mp4

# 恢复主机型号
sed -i 's/(dmesg | grep .*/{a}${b}${c}${d}${e}${f}/g' ./package/lean/autocore/files/x86/autocore
#sed -i 's/(cat \/tmp.*/\{a}${b}${c}${d}${e}${f}/g' package/lean/autocore/files/x86/autocore
sed -i '/h=${g}.*/d' ./package/lean/autocore/files/x86/autocore
sed -i 's/echo $h/echo $g/g' ./package/lean/autocore/files/x86/autocore

# dockerman
#sed -i 's/+cgroupfs-mount //g' feeds/luci/applications/luci-app-dockerman/Makefile
#sed -i '42i sed -i "/^# the system init finished. By default this file does nothing./a \/etc\/init.d\/cgroupfs-mount disable" \/etc\/rc.local' package/lean/default-settings/files/zzz-default-settings
#rm -rf ./feeds/luci/applications/luci-app-dockerman
#git clone https://github.com/Jason6111/luci-app-dockerman ./feeds/luci/applications/luci-app-dockerman
#rm -rf ./feeds/packages/utils/dockerd
#git clone https://github.com/Jason6111/dockerd ./feeds/packages/utils/dockerd && chmod -R 777 ./feeds/packages/utils/dockerd
#dockerd
sed -i -e 's/27.0.2/28.0.4/g' \
       -e 's/2705abdd7a8a47ec88c0d2f0f31eede01ba4aa5ae8b5ab0e2c4ee25e7c314521/4b347a2b83221952cab93197f6e9bc7ffe54dd4bd0a9644c176aecde551721ca/g' \
       -e 's/e953d76/6430e49/g' ./feeds/packages/utils/dockerd/Makefile
#docker
sed -i -e 's/27.0.2/28.0.4/g' \
       -e 's/a2b31d4c8143c8b126e98a359639f51727fc83fc1e61670efbdeaa7dea92fd5a/09b41aa5ff656bc135feb80cb9b73c70aeba099ef9756c3cef7bcb2eb3c98ba6/g' \
       -e 's/912c1dd/b8034c0/g' ./feeds/packages/utils/docker/Makefile
sed -i -e 's/1.7.18/1.7.27/g' \
       -e 's/91685cebd50e3f353a402adadf61e2a6aeda3f63754fa0fcc978a043e00acac4/374f1c906b409cfad142b20d208f99e9539e5eb47fbb47ea541b4dfc9867345f/g' ./feeds/packages/utils/containerd/Makefile
sed -i -e 's/1.1.13/1.2.6/g' \
       -e 's/789d5749a08ef1fbe5d1999b67883206a68a4e58e6ca0151c411d678f3480b25/19b280702341f33ff353fa254d1dbdb67f6aab2c74395f6d651a17524f68e752/g' ./feeds/packages/utils/runc/Makefile
# 临时
sed -i 's/6.6/6.12/g'  ./target/linux/x86/Makefile

# zh netdata
rm -rf ./feeds/luci/applications/luci-app-netdata/
git clone https://github.com/Jason6111/luci-app-netdata ./feeds/luci/applications/luci-app-netdata/

# 开启netdata温控监测
sed -i 's/charts\.d = no/charts\.d = yes/g' ./feeds/luci/applications/luci-app-netdata/root/etc/netdata/netdata.conf

# ddns cloudflare
#curl -o new_update_cloudflare_com_v4.sh https://raw.githubusercontent.com/Jason6111/Openwrt_Beta/refs/heads/main/patch/update_cloudflare_com_v4.sh
#mv new_update_cloudflare_com_v4.sh ./feeds/packages/net/ddns-scripts/files/usr/lib/ddns/update_cloudflare_com_v4.sh
#sed -i '1,$d' ./feeds/packages/net/ddns-scripts/files/usr/lib/ddns/update_cloudflare_com_v4.sh && cat <(curl -s https://raw.githubusercontent.com/Jason6111/Openwrt_Beta/refs/heads/main/patch/update_cloudflare_com_v4.sh) >> ./feeds/packages/net/ddns-scripts/files/usr/lib/ddns/update_cloudflare_com_v4.sh

#lucky
sed -i 's|/etc/lucky|/etc/config/lucky2|g' ./feeds/luci/applications/luci-app-lucky/root/etc/config/lucky
sed -i 's/PKG_RELEASE:=8/PKG_RELEASE:=1/g' ./feeds/luci/applications/luci-app-lucky/Makefile
sed -i 's/PKG_VERSION:=1.2.0/PKG_VERSION:=2.2.2/g' ./feeds/luci/applications/luci-app-lucky/Makefile
sed -i 's/PKG_RELEASE:=1/PKG_RELEASE:=12/g' ./feeds/packages/net/lucky/Makefile
sed -i 's/PKG_VERSION:=2.10.8/PKG_VERSION:=2.15.8/g' ./feeds/packages/net/lucky/Makefile
sed -i 's/^LUCI_DEPENDS:=+lucky/LUCI_DEPENDS:=+lucky +luci-compat/' ./feeds/luci/applications/luci-app-lucky/Makefile
