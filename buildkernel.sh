#!/bin/bash

export ARCH=arm64;
export CROSS_COMPILE="ccache /home/khaon/android/aarch64-linux-android-4.9/bin/aarch64-linux-android-";

export mkboot_root_folder=/home/khaon/android/mkbootimg_tools;
export mkboot_project_name=mm-boot;
export boot_image_name=boot-mm.img;

make mrproper;
make a3xelte_00_defconfig;

make -j9;

./dtbtool  -o arch/arm64/boot/dt.img -s 2048 -p scripts/dtc/ arch/arm64/boot/dts/ -v;

cp arch/arm64/boot/Image $mkboot_root_folder/$mkboot_project_name/kernel;
cp arch/arm64/boot/dt.img $mkboot_root_folder/$mkboot_project_name/dt.img;
cd $mkboot_root_folder;
rm $boot_image_name;
./mkboot $mkboot_project_name $boot_image_name;