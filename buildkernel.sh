#!/bin/bash

export ARCH=arm64;
export CROSS_COMPILE=/home/khaon/android/linaro-5.3/bin/aarch64-linux-android-;

make mrproper;
make exynos7580-a3xelte_defconfig;

make -j9;

./dtbtool  -o arch/arm64/boot/dt.img -s 2048 -p scripts/dtc/ arch/arm64/boot/dts/ -v;