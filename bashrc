#!/bin/bash
#eval `ssh-agent -s`
#ssh-add
# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

export EDITOR=vim
export PATH=:~/bin:/usr/local/bin:/usr/sbin:/usr/bin:/usr/local/lib:/sbin:/bin
#JAVA_HOME=/usr/lib/jvm/java-7-jdk/jre
export QT_API=pyqt4

# Android tools
export ANDROID_HOME=/opt/android-sdk
export PATH=${PATH}:/opt/android-sdk/tools
export PATH=${PATH}:/opt/android-sdk/platform-tools

# Android Toolchain Path
#export ARCH=arm
#export CROSS_COMPILE=/opt/toolchains/arm-linux-androideabi-6.1-linaro/bin
#export CC=${CROSS_COMPILE}-gcc
#export CXX=${CROSS_COMPILE}-g++
#export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx6144m"

#export USE_CCACHE=1
#export CCACHE_DIR=/mnt/Ricks_Stuff/.ccache
STAGING_RT_PRIORITY_BASE=15
STAGING_RT_PRIORITY_SERVER=95
source /usr/bin/virtualenvwrapper.sh
