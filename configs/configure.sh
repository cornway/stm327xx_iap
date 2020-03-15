#!/bin/bash

source func.sh

TOPDIR=".."
TARGET_DIR="stm32f769-disco"

CNAME="__ARMGCC_VERSION"
TARGET_ARCH="arm"
TARGET_CPU="armv7-m"
TARGET_PROF="cortex-m7"
TGT_ARCH_DEF="__ARCH_ARM_M7__"
TC="arm-none-eabi"
CC=$TC-"gcc"
OPT="-O0"
DBG="-gdwarf-4 -g3 -ggdb"
CFLAGS_ARCH="-mlittle-endian -mthumb -march=$TARGET_CPU -mfloat-abi=softfp -mfpu=fpv4-sp-d16"
CFLAGS="-fdata-sections -ffunction-sections"

function config_set_cversion () {
        local name=$1

        local cver=$($CC --version | grep ^$CC | grep -o '[0-9]\.[0-9]\.[0-9]' | head -1)
        local maj="$(echo $cver | cut -d'.' -f1)"
        local min="$(echo $cver | cut -d'.' -f2)"
        local sys="$(echo $cver | cut -d'.' -f3)"

        config_set "CDEFS += -D$name=$maj"
        config_set "CDEFS += -D"$name"_MAJ=$maj"
        config_set "CDEFS += -D"$name"_MIN=$min"
        config_set "CDEFS += -D"$name"_SYS=$sys\n"
}

function config_target () {
        source $TARGET_DIR/config.in
        config_begin "target" $TARGET_DIR/$1

        config_set 'include $(TOP)/.config\n'

        config_set "TARGET_CPU := $TARGET_CPU"
        config_set "TGT_HAL_DIR := STM32F7xx"
        config_set "TGT_PLATFORM := STM32F769I-Discovery" 
        config_set "TGT_MACH_DIR := stm32\n"

        config_set "CFLAGS := $CFLAGS_ARCH $CFLAGS $OPT $DBG -mtune=$TARGET_PROF"
        config_set "LDFLAGS := $CFLAGS_ARCH -mtune=$TARGET_PROF -lm -nostartfiles"
        config_set "ASFLAGS := $CFLAGS_ARCH -mcpu=$TARGET_PROF\n"

        local STR="CC:=xx-gcc\nAS:=xx-as\nAR:=xx-ar\nBIN:=xx-objcopy\nOBJDUMP:=xx-objdump"
        STR=$(sed "s/xx/$TC/g" <<< $STR)

        config_set "$STR\n"

        config_set_cversion $CNAME

        for name in "${CDEFS_IN[@]}"; do
                config_set "CDEFS += $name"
        done

        config_set "\nCDEFS += -D$TGT_ARCH_DEF=1"
        config_add_cdef_cond "CDEFS"  "HAVE_USB"
        config_add_cdef_cond "CDEFS"  "HAVE_HDMI"
        config_add_cdef_cond "CDEFS"  "HAVE_LIBC_MALLOC"
        config_add_cdef_cond "CDEFS"  "HAVE_HEAP_TRACE"
        config_add_cdef_cond "CDEFS"  "HAVE_SAFE_TTY_ONLY"
        config_add_cdef_cond "CDEFS"  "HAVE_AUDIO"

        [ -z $FS_SOURCE ] || config_set "FS_SOURCE:=$FS_SOURCE"

        mv ./$OUT_FILE $TOPDIR/
}

function config_set_conf_hdr () {
        source $TARGET_DIR/config.in
        config_begin "headers" $TARGET_DIR/$1

        hdr_protect=$(sed "s/\./_/g" <<< ${1^^})
        hdr_protect="__"$hdr_protect"__"
        

        config_set "#ifndef $hdr_protect"
        config_set "#define $hdr_protect\n"

        config_set "#define MAX_UART_TTY ($MAX_UART_TTY)"

        config_set_hdr_ifeq "SERIAL_TTY_HAS_DMA" "HAVE_SAFE_TTY_ONLY" "0" "1"
        config_set_hdr_ifeq "AUDIO_MODULE_PRESENT" "HAVE_AUDIO"
        config_set_hdr_ifeq "MUSIC_MODULE_PRESENT" "HAVE_AUDIO"
        config_set_hdr_ifeq "USE_LCD_HDMI" "HAVE_HDMI"
        config_set_hdr_ifeq "USE_USB_HS" "HAVE_USB"

        config_set "#define MAX_OPEN_FILES ($MAX_OPEN_FILES)"

        config_set "#endif // $hdr_protect"
}

source $TOPDIR/.config

GLIBC_VERSION=$HAVE_GLIBC_VERSION
GLIBC_PATH="glibc-$GLIBC_VERSION"
GLIBC_BUILD_PATH="glibc-build"

function config_glibc () {
        source $TARGET_DIR/config.glibc.in

        if [ ! -d $TOPDIR/$GLIBC_PATH ]; then
                echo "No glibc found: [$TOPDIR/$GLIBC_PATH]"
                exit -1;
        fi
        config_begin "glibc" $TARGET_DIR/$1

        local build="$(arch)-linux"
        local target="$TARGET_ARCH"
        local host="$target-unknown-linux"
        local path_lib="$(pwd)/$TOPDIR/usr/lib"
        local path_inc="$(pwd)/$TOPDIR/ulib/linux/arch/$TARGET_ARCH/include"

        config_set "#!/bin/bash"
        config_set "source configs/func.sh\n"

        config_set "BUILD_PATH=$GLIBC_BUILD_PATH"

        config_set 'while getopts "no:" opt; do'
        config_set '\tcase $opt in'
        config_set '    \t\to) BUILD_PATH=$OPTARG ;;'
        config_set "\tesac"
        config_set "done\n"

        for patch in "${GLIBC_PATCH[@]}"; do
                config_add_patch $patch
        done

        config_set "\n[ -d \$BUILD_PATH ] && rm -rf \$BUILD_PATH"
        config_set "mkdir -p \$BUILD_PATH && cd \$BUILD_PATH\n"

        config_set  "\n../$GLIBC_PATH/configure \\"
        config_set  "\tCC=\"$CC $CFLAGS_ARCH\" \\"
        config_set  "\tCFLAGS=\"$CFLAGS $GLIBC_FLAGS\" \\"
        config_set  "\t--prefix=$path_lib \\"
        config_set  "\t--with-headers=$path_inc \\"

        for param in "${GLIBC_PARAMS[@]}"; do
                config_set "\t$param \\"
        done
        config_set "\t--build=$build --host=$host --target=$target"
        config_set "cd ../\n"

        config_set "config_begin \"glibc.mk\" \"glibc.mk\""
        config_set "config_set GLIBC_BUILD_PATH=\$BUILD_PATH\n"

        chmod +x $OUT_FILE
        mv $OUT_FILE $TOPDIR/
}

[ -z $1 ] || TARGET_DIR=$1

if [ ! -d $TARGET_DIR ]; then
        echo "No path :"$TARGET_DIR
        exit -1
fi

case $2 in
"glibc" ) config_glibc "glibc_config.sh" ;;
"target") config_target "boot.mk";
          config_set_conf_hdr "config.h" ;;
*       )
config_glibc "glibc_config.sh"
config_target "boot.mk"
config_set_conf_hdr "config.h"
;;
esac