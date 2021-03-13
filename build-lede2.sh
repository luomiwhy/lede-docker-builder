#!/bin/bash

cd 
cd openwrt
#Download package

make download -j8

# First Compile the firmware
make -j1 V=s

# Second Compile the firmware
# make -j$(($(nproc) + 1))
