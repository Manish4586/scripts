#Clang Build Script By Manish4586 <manish4586@github.com>

# Colors
RED="\033[1;31m" # For errors / warnings
GREEN="\033[1;32m" # For info
YELLOW="\033[1;33m" # For info
BLUE="\033[1;36m" # For info
NC="\033[0m" # reset color

TOOL_DIR="/home/manish/toolchain"

echo -e "\e[1;32m ***Building Kernel..***\e[0m"
echo -e "$out"
export KBUILD_BUILD_USER=Manish4586
export KBUILD_BUILD_HOST=rohi
export ARCH=arm64
export SUBARCH=arm64
export CROSS_COMPILE_ARM32=$TOOL_DIR/proton-clang/bin/arm-linux-gnueabi-
export CROSS_COMPILE=$TOOL_DIR/proton-clang/bin//aarch64-linux-gnu-
export CROSS_COMPILE_ARM32=y
export CLANG_TRIPLE=aarch64-linux-gnu-
export USE_CCACHE=1

#make clean && make mrproper O=out;

# function
#make O=out jasmine-perf_defconfig
make O=out ARCH=arm64 jasmine-perf_defconfig
time (
#make -j$(nproc --all) CC=clang AR=llvm-ar NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip O=out 
PATH=$TOOL_DIR/proton-clang/bin:${PATH} \
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