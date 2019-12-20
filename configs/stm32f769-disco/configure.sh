#!/bin/bash


function config_set_nl () {
        echo "" >> $1
}

function config_set_var () {
        var=$1 val=$2 file=$3
        echo "$var:=$val" >> $file
}

function config_add_var () {
        var=$1 val=$2 file=$3
        echo "$var+=$val" >> $file
}

config_set_def_cond () {
        dst=$1 exp=$2 name=$3 file=$4 true=$5 false=$6

        [ -z $true ] && true=1
        [ -z $false ] && false=0
        echo 'ifeq ($('$exp'), 1)' >>  $file
        echo $dst' += -D'$name'='$true >>  $file
        echo "else" >>  $file
        echo $dst' += -D'$name'='$false >>  $file
        echo "endif" >>  $file
        config_set_nl $file
}

config_set_conf_cond () {
        dst=$1 exp=$2 val=$3 file=$4

        echo 'ifeq \($('$exp'), 1\)' >>  $file
        echo $dst'='$val >>  $file
        echo "endif" >>  $file
        config_set_nl $file
}

BUILD="x86_64"
TARGET="arm-linux"
HOST="arm-linux"
TARGET_ARCH=arm

MK_NAME="_boot.mk"
TC="arm-none-eabi"
CC=$TC-"gcc"
OPT="-O0"
DBG="-gdwarf-4 -g3 -ggdb"
CFLAGS_COM="-mlittle-endian -mthumb -march=armv7-a -mfloat-abi=hard -mfpu=fpv4-sp-d16"
CFLAGS="$CFLAGS_COM -mtune=cortex-m7 -fdata-sections -ffunction-sections"


[ -f $MK_NAME ] && rm $MK_NAME
touch $MK_NAME

echo 'include $(TOP)/.config' >> $MK_NAME
config_set_nl $MK_NAME

config_set_var "MCPUNAME_MK"  "armv7"  $MK_NAME 
config_set_var "ARCHNAME_MK"  "STM32F7xx"  $MK_NAME 
config_set_var "BRDNAME_MK"  "STM32F769I-Discovery"  $MK_NAME 
config_set_var "MACHNAME_MK"  "stm32"  $MK_NAME 
config_set_nl $MK_NAME 

config_set_var "CCVER"  "-D__ARMGCC_VERSION=1"  $MK_NAME
config_set_nl $MK_NAME 
config_set_var "CC"  $TC'-gcc'  $MK_NAME 
config_set_var "AS"  $TC'-as'  $MK_NAME 
config_set_var "AR"  $TC'-ar'  $MK_NAME 
config_set_var "BIN" $TC'-objcopy'  $MK_NAME 
config_set_var "OBJDUMP"  $TC'-objdump'  $MK_NAME 
config_set_nl $MK_NAME 

config_set_var "OPTLVL"  $OPT  $MK_NAME 
config_set_var "OPTDBG"  $DBG  $MK_NAME 
config_set_nl $MK_NAME 

config_set_var "CCFLAGS_MK"  "$CFLAGS $OPT $DBG"  $MK_NAME 
config_set_var "LDFLAGS_MK"  "$CFLAGS_COM -mtune=cortex-m7 -lm -nostartfiles"  $MK_NAME 
config_set_var "CCFLAGS_MK"  "$CFLAGS_COM -mcpu=cortex-m7"  $MK_NAME 
config_set_nl $MK_NAME 

config_set_var "HALSRC_MK"  "$\(TOP\)/common/$\(ARCHNAME_MK\)_Driver"  $MK_NAME 
config_set_nl $MK_NAME 

config_set_var "CCDEFS_MK"  "-D__ARCH_ARM_M7__=1"  $MK_NAME 
config_add_var "CCDEFS_MK"  "-D$\(CCVER\)"  $MK_NAME 
config_add_var "CCDEFS_MK"  "-DSTM32F769xx"  $MK_NAME 
config_add_var "CCDEFS_MK"  "-DUSE_HAL_DRIVER"  $MK_NAME 
config_add_var "CCDEFS_MK"  "-DUSE_STM32F769I_DISCO"  $MK_NAME 
config_add_var "CCDEFS_MK"  "-DDATA_IN_ExtSDRAM"  $MK_NAME 
config_add_var "CCDEFS_MK"  "-DSTM32_SDK"  $MK_NAME 
config_add_var "CCDEFS_MK"  "-DBOOT"  $MK_NAME 
config_add_var "CCDEFS_MK"  "-DBSP_DRIVER"  $MK_NAME 
config_set_nl $MK_NAME 

config_set_var "HALINC_MK"  "-I"$\(HALSRC_MK\)"/Inc"  $MK_NAME 
config_add_var "HALINC_MK"  "-I$\(HALSRC_MK\)/CMSIS/Device/ST/$\(ARCHNAME_MK\)/Include"  $MK_NAME 
config_add_var "HALINC_MK"  "-I$\(HALSRC_MK\)/CMSIS/Include"  $MK_NAME 
config_add_var "HALINC_MK"  "-I$\(HALSRC_MK\)/BSP/Components"  $MK_NAME 
config_add_var "HALINC_MK"  "-I$\(HALSRC_MK\)/BSP/STM32F769I-Discovery"  $MK_NAME 
config_set_nl $MK_NAME

config_set_var "CCSHARED"  "-fpic"  $MK_NAME 
config_set_var "LDSHARED"  "-shared"  $MK_NAME 
config_set_nl $MK_NAME 

config_set_def_cond "CCDEFS_MK"  "HAVE_USB"  "USE_USB_HS"  $MK_NAME 
config_set_def_cond "CCDEFS_MK"  "HAVE_HDMI"  "USE_LCD_HDMI"  $MK_NAME 
config_set_def_cond "CCDEFS_MK"  "HAVE_LIBC_MALLOC"  "HAVE_LIBC_MALLOC"  $MK_NAME 
config_set_def_cond "CCDEFS_MK"  "HAVE_HEAP_TRACE"  "HEAP_TRACE"  $MK_NAME 
config_set_def_cond "CCDEFS_MK"  "USE_SAFE_TTY"  "USE_SAFE_TTY"  $MK_NAME 
config_set_conf_cond "IOFS_MK"  "HAVE_IO_FS"  "FatFs"  $MK_NAME 

mv ./$MK_NAME ../../

#Glibc confiduration
MK_NAME="glibc_config.sh"
GLIBC_VER="2.30"
GLIBC="glibc-$GLIBC_VER"
GLIBC_BUILD="glibc-build"
OPT="-O2"
CFLAGS="$CFLAGS $OPT -D__USE_POSIX -D_STACK_GROWS_DOWN -D__PTHREAD_MUTEX_HAVE_PREV=0"
LINUX_HDR_PATH="$(pwd)/../../ulib/linux/arch/$TARGET_ARCH/include"

[ -f $MK_NAME ] && rm $MK_NAME
touch $MK_NAME

echo "#!/bin/bash" >> $MK_NAME
config_set_nl $MK_NAME 

echo "mkdir -p $GLIBC_BUILD" >> $MK_NAME
echo "mkdir -p ./usr/lib" >> $MK_NAME
config_set_nl $MK_NAME 

echo "cp -r $GLIBC $GLIBC_BUILD/*" >> $MK_NAME
echo "cp -r $LINUX_HDR_PATH/* $GLIBC_BUILD/" >> $MK_NAME

echo "cd $GLIBC_BUILD" >> $MK_NAME
config_set_nl $MK_NAME 

echo "cp ./ports/sysdeps/$TARGET_ARCH/bits/link.h ./bits/" >> $MK_NAME
echo "cp ./include/errno.h ./bits/" >> $MK_NAME
echo "cp ./ports/sysdeps/arm/include/bits/setjmp.h ./bits/" >> $MK_NAME
config_set_nl $MK_NAME 

echo '../'$GLIBC'/configure \
        CC='$CC' \
        CFLAGS="'$CFLAGS'" \
        --disable-sanity-checks \
        --prefix='$(pwd)'../../usr/lib \
        --with-headers='$LINUX_HDR_PATH'\
        --enable-add-ons=ports \
        --disable-threads \
        --without-__thread \
        --without-nptl \
        --without-tls \
        --build='$BUILD'-linux-gnu \
        --host='$HOST' \
        --target='$HOST >> $MK_NAME

config_set_nl $MK_NAME 
echo "cd ../" >> $MK_NAME

mv $MK_NAME ../../
chmod +x ../../$MK_NAME