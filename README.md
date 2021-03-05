# lede 的 docker 编译环境

### clone docker and build image

```
git clone https://github.com/luomiwhy/lede-docker-builder.git
cd lede-docker-builder
docker build -t lede .
```

### run container and clone lede code

```
cd 
docker run --rm -it -v $(pwd)/:/home/build/ -v $(pwd)/lede-docker-builder/:/data/file/ lede

export ALL_PROXY=http://192.168.*.*:*/


git clone --depth 1 -b 21.02 --single-branch https://github.com/Lienol/openwrt openwrt

# https://github.com/vernesong/OpenClash
# 您也可以直接拷贝 `luci-app-openclash` 文件夹至其他 `OpenWrt` 项目的 `Package` 目录下随固件编译
git clone --depth 1 --single-branch -b master https://github.com/vernesong/OpenClash.git openclash
cp -r openclash/luci-app-openclash/ openwrt/package
# make menuconfig
# 选择要编译的包 LuCI -> Applications -> luci-app-openclash

git clone --depth 1 --single-branch -b main https://github.com/garypang13/luci-app-dnsfilter.git openwrt/package/luci-app-dnsfilter

cd openwrt
cp -f /data/file/diy-part1.sh . && chmod +x *.sh && ./diy-part1.sh
./scripts/feeds clean
./scripts/feeds update -a 
./scripts/feeds install -a
cp -f /data/file/diy-part2.sh . && chmod +x *.sh &&  ./diy-part2.sh
cp -f /data/file/.config .
# make menuconfig 

#Download package
# make defconfig
make download -j8
find dl -size -1024c -exec ls -l {} \;
find dl -size -1024c -exec rm -f {} \;

# First Compile the firmware
make -j1 V=s

# Second Compile the firmware
# make -j$(($(nproc) + 1))

```

### clean when done
```
docker container prune -f
docker image prune -f
```
