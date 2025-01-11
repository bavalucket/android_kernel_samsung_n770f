#!/bin/bash

export ARCH=arm64
export PLATFORM_VERSION=13
export ANDROID_MAJOR_VERSION=t
export CONFIG_SECTION_MISMATCH_WARN_ONLY=y

echo 'getting build tools';
./setup_repos.sh
echo 'cleaning old build';
make mrproper
echo 'making defconfig'
make ARCH=arm64 exynos9810-r7_defconfig
echo 'building kerenl'
make  ARCH=arm64 -j7 CC=./buildtools/samsung-toolchain/clang/host/linux-x86/clang-r349610-jopp/bin/clang
\ CROSS_COMPILE=./buildtools/samsung-toolchain/gcc-cfp/gcc-cfp-jopp-only/aarch64-linux-android-4.9/bin/aarch64-linux-android-
\ CLANG_TRIPLE=./buildtools/linaro-gcc-4.9/bin/aarch64-linux-gnu-
