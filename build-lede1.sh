#!/bin/bash

export ALL_PROXY=http://192.168.137.1:7890/

git clone --depth 1 -b 21.02 --single-branch https://github.com/Lienol/openwrt openwrt
cd openwrt
cp -f /data/file/diy-part1.sh . && ./diy-part1.sh
./scripts/feeds clean
./scripts/feeds update -a 
./scripts/feeds install -a
cp -f /data/file/diy-part2.sh . &&  ./diy-part2.sh
# cp -f /data/file/.config .
make menuconfig 
