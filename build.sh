#!/usr/bin/env bash

set -e

cd openjdk8

export LANG=C

# Set Compile thread number
export HOTSPOT_BUILD_JOBS=2
export ALT_PARALLEL_COMPILE_JOBS=2

# Allow download depent
export ALLOW_DOWNLOADS=true

# Disable Compare build image
export SKIP_COMPARE_IMAGE=true

# Use PCH
export USE_PRECOMPILED_HEADER=true

# Set Compile option
export BUILD_LANGTOOLS=true
#export BUILD_JAXP=false
#export BUILD_JAXWS=false
#export BUILD_CORBA=false
export BUILD_HOTSPOT=true
export BUILD_JDK=true

# Set Compile version(debug/fastdebug/release)
#export SKIP_DEBUG_BUILD=false
#export SKIP_FASTDEBUG_BUILD=true
#export DEBUG_NAME=debug

# Set build install image
BUILD_INSTALL=false
# Set Compile result
export ALT_OUTPUTDIR=./build/

# Force Settings
unset JAVA_HOME
unset CLASS_PATH

make clean && make dist-clean

bash ./configure --with-extra-cflags=-Wno-error --with-extra-cxxflags=-Wno-error --with-target-bits=64 --with-debug-level=slowdebug --with-boot-jdk=/usr/lib/jvm/java-7-openjdk/ --enable-debug-symbols ZIP_DEBUGINFO_FILES=0

make all ZIP_DEBUGINFO_FILES=0 2>&1 -d | tee build.log
