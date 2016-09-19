#!/bin/bash

export ARCH=arm64;
export CROSS_COMPILE="ccache /home/khaon/android/linaro-64/bin/aarch64-none-elf-";

export mkboot_root_folder=/home/khaon/android/mkbootimg_tools;
export mkboot_project_name=orig-mm;
export boot_image_name=boot-mm.img;

make mrproper;
make a3xelte_00_defconfig;

make -j9;


cp arch/arm64/boot/Image $mkboot_root_folder/$mkboot_project_name/kernel;
cd $mkboot_root_folder;
rm $boot_image_name;
./mkboot $mkboot_project_name $boot_image_name;