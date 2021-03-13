#!/bin/bash
cd 
export ALL_PROXY=http://192.168.137.1:7890/

cd openwrt
cp -f ../diy-part1.sh . && ./diy-part1.sh
# ./scripts/feeds clean
./scripts/feeds update -a 
./scripts/feeds install -a
cp -f ../diy-part2.sh . &&  ./diy-part2.sh
# cp -f /data/file/.config .
make menuconfig 

