#!/bin/bash
#Download package
if [ ! -d "/data/lede" ];then
    sudo ls 
    sudo mkdir -p /data/lede/
    sudo chown -R ll:ll /data/
else
    echo "文件夹已经存在"
fi

mkdir dl && cp -uvr /data/lede/ dl/
make download -j8
cp -uvr dl/ /data/lede/

# First Compile the firmware
make -j1 V=s

# Second Compile the firmware
# make -j$(($(nproc) + 1))
