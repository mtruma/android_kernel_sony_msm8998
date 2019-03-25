rm -rf out_dsds
export ARCH=arm64
export PATH=/root/aarch64-linux-android-4.9/bin/:$PATH
export CROSS_COMPILE=aarch64-linux-android-
export KBUILD_DIFFCONFIG=maple_dsds_diffconfig
make msmcortex-perf_defconfig O=./out_dsds
make -j6 O=./out_dsds
../Final/mkbootimg.py \
        --kernel ./out_dsds/arch/arm64/boot/Image.gz-dtb \
        --ramdisk ../Final/g8142.gz \
        --cmdline "androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 sched_enable_hmp=1 sched_enable_power_aware=1 service_locator.enable=1 swiotlb=2048 androidboot.configfs=true androidboot.usbcontroller=a800000.dwc3 zram.backend=z3fold buildvariant=userdebug" \
        --os_version 9 \
        --os_patch_level 2019-02-01 \
        --base 0x00000000 \
        --kernel_offset 0x00008000 \
        --ramdisk_offset 0x01000000 \
        --tags_offset 0x00000100 \
        --pagesize 4096 \
        -o ../Final/g8142.img
