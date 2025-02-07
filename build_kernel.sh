#!/bin/bash

export ARCH=arm64
export PLATFORM_VERSION=13
export ANDROID_MAJOR_VERSION=t
export CONFIG_SECTION_MISMATCH_WARN_ONLY=y

echo 'Setting up Cross-compilation'
./setup_repos.sh
echo 'cleaning source'
make -j8 mrproper
echo 'fetching .config'
cp -r saved.config .config
echo "Building kernel - Please be patient."
make -j8
