#!/bin/sh

NDK=/Users/heshiqi/Library/Android/sdk/ndk-bundle
SYSROOT=$NDK/platforms/android-21/arch-arm
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64

ROOT_DIR=`pwd`/

ADD_H264_FEATURE="--enable-encoder=aac \
--enable-decoder=aac \
--enable-encoder=libx264 \
--enable-libx264 \
--extra-cflags=-I/Users/heshiqi/Desktop/jni/x264/android/armeabi/include \
--extra-ldflags=-L/Users/heshiqi/Desktop/jni/x264/android/armeabi/lib "

function build_one
{
./configure \
--prefix=$PREFIX \
--enable-shared \
--disable-static \
--disable-doc \
--disable-ffmpeg \
--disable-ffplay \
--disable-ffprobe \
--disable-ffserver \
--disable-avdevice \
--disable-doc \
--enable-gpl \
--enable-protocols \
--enable-muxer=mp4 \
--disable-symver \
--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
--target-os=linux \
--arch=arm \
--enable-openssl
--enable-cross-compile \
--sysroot=$SYSROOT \
$ADD_H264_FEATURE \
$ADDITIONAL_CONFIGURE_FLAG
make clean
make -j4
make install

}
CPU=armeabi
PREFIX=$(pwd)/android/$CPU
ADDI_CFLAGS="-marm"
build_one
