# x264-ffmpeg
ffmpeg编译添加x264

编译报错解决：
报错一: libavcodec/aaccoder.c:803:25: error: expected identifier or '(' before numeric constant
                     int B0 = 0, B1 = 0;
解决：把 B0 修改为 b0(可以任意改成别的变量名)

报错二: ibavcodec/hevc_mvs.c: In function 'derive_spatial_merge_candidates':
libavcodec/hevc_mvs.c:208:15: error: 'y0000000' undeclared (first use in this function)
             ((y ## v) >> s->ps.sps->log2_min_pu_size))

解决：prebuilts/ndk/current/platforms/android-21/arch-arm/usr/include/asm-generic/termbits.h 
或
prebuilts/ndk/current/platforms/android-21/arch-arm/usr/include/asm/termbits.h 
里找到：#define B0的位置，在下边添加一句:
#undef B0
