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
#sed -i 's/PKG_RELEASE:=8/PKG_RELEASE:=1/g' ./feeds/luci/applications/luci-app-lucky/Makefile
#sed -i 's/PKG_VERSION:=1.2.0/PKG_VERSION:=2.2.2/g' ./feeds/luci/applications/luci-app-lucky/Makefile
#sed -i 's/PKG_RELEASE:=1/PKG_RELEASE:=12/g' ./feeds/packages/net/lucky/Makefile
sed -i 's/PKG_VERSION:=2.17.8/PKG_VERSION:=2.18.1/g' ./feeds/packages/net/lucky/Makefile
#sed -i 's/^LUCI_DEPENDS:=+lucky/LUCI_DEPENDS:=+lucky +luci-compat/' ./feeds/luci/applications/luci-app-lucky/Makefile

#禁用固件更新后跑分
sed -i '/^echo "0 4 \* \* \* \/etc\/coremark.sh" >> \/etc\/crontabs\/root$/d' ./feeds/packages/utils/coremark/coremark
sed -i '/^\[ -n "\$\${IPKG_INSTROOT}" \] \|\| echo "0 4 \* \* \* \/etc\/coremark.sh" >> \/etc\/crontabs\/root$/d' ./feeds/packages/utils/coremark/Makefile

#openlist
#wget https://codeload.github.com/OpenListTeam/OpenList/tar.gz/v4.0.7
#sha256sum v
sed -i 's/4.0.8/4.1.0/g'  ./feeds/packages/net/openlist/Makefile
sed -i 's/216a7c7c66de9bcff59ab946874a8b4641b2b6e90c5236bd45bf8219149c5a3d/cdaf91413fe07b3d8155f644237a839dac09f084e812b25c76effca7dfc1d3f2/g'  ./feeds/packages/net/openlist/Makefile
#https://github.com/OpenListTeam/OpenList-Frontend/releases
sed -i 's/b0815850ba78fa3809a893e6fa61756a7998a19766c70bc15e3a83f26a8aa3e3/ddaeb76aad74a858358de9a1e0d1aff93651605859813b0891b9f4f431d1a87f/g'  ./feeds/packages/net/openlist/Makefile
