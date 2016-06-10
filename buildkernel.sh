#!/bin/bash

export ARCH=arm64;
export CROSS_COMPILE=/home/khaon/android/linaro-5.3/bin/aarch64-linux-android-;

export mkboot_root_folder=/media/khaon/54e4d854-fd7a-45a4-ac6b-3b46be763cc91/kernel/mkbootimg_tools;
export mkboot_project_name=orig;
export boot_image_name=boot.img;

make mrproper;
make exynos7580-a3xelte_defconfig;

make -j9;

./dtbtool  -o arch/arm64/boot/dt.img -s 2048 -p scripts/dtc/ arch/arm64/boot/dts/ -v;

cp arch/arm64/boot/Image $mkboot_root_folder/$mkboot_project_name/kernel;
cp arch/arm64/boot/dt.img $mkboot_root_folder/$mkboot_project_name/dt.img;
cd $mkboot_root_folder;
rm $boot_image_name;
./mkboot $mkboot_project_name $boot_image_name;
