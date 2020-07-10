# Clang Build Script By Manish4586 <manish4586@github.com>

TOOL_DIR="/home/manish/toolchain/"

TOOL=$TOOL_DIR/proton-clang

echo -e "\e[1;32m ***Building Kernel..***\e[0m"
echo -e "$out"
export KBUILD_BUILD_USER=Manish4586
export KBUILD_BUILD_HOST=rohi


PATH=$TOOL/bin:${PATH}


# function
make O=out ARCH=arm64 jasmine-perf_defconfig
time (
make -j$(nproc --all) O=out \
                      ARCH=arm64 \
                      CC=clang \
                      AR=llvm-ar \
                      NM=llvm-nm \
                      OBJCOPY=llvm-objcopy \
                      OBJDUMP=llvm-objdump \
                      STRIP=llvm-strip \
                      CROSS_COMPILE_ARM32=arm-linux-gnueabi- \
                      CROSS_COMPILE=aarch64-linux-gnu- ;
);
#|tee ../compile.log