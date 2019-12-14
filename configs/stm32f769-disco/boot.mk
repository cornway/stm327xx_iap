include $(TOP)/.config

CCVER := __ARMGCC_VERSION=1

CC := arm-none-eabi-gcc
AS := arm-none-eabi-as
AR := arm-none-eabi-ar
BIN := arm-none-eabi-objcopy
OBJDUMP := arm-none-eabi-objdump

OPTLVL := -O0
OPTDBG := -gdwarf-4 -g3 -ggdb 

MCPUNAME_MK := armv7
ARCHNAME_MK := STM32F7xx
BRDNAME_MK := STM32F769I-Discovery
MACHNAME_MK := stm32

__CCGLOB :=  -mlittle-endian -mthumb -march=armv7e-m -mfloat-abi=hard -mfpu=fpv4-sp-d16 \
            $(OPTDBG)

CCFLAGS_MK := $(__CCGLOB) $(OPTLVL) -mtune=cortex-m7 -fdata-sections -ffunction-sections
LDFLAGS_MK := $(__CCGLOB) -mtune=cortex-m7 -lm -nostartfiles
ASFLAGS_MK := $(__CCGLOB) -mcpu=cortex-m7

CCDEFS_MK = \
	-D__ARCH_ARM_M7__=1 \
	-D$(CCVER) \
    -DSTM32F769xx \
    -DUSE_HAL_DRIVER \
    -DUSE_STM32F769I_DISCO \
    -DDATA_IN_ExtSDRAM \
    -DSTM32_SDK \
    -DBOOT \
    -DBSP_DRIVER \
	$(CCDEFS_ARCH_MK)

ifeq ($(HAVE_USB), 1)
CCDEFS_MK += -DUSE_USB_HS=1
endif

ifeq ($(HAVE_HDMI), 1)
CCDEFS_MK += -DUSE_LCD_HDMI=1
endif

ifeq ($(HAVE_LIBC_MALLOC), 1)
CCDEFS_MK += -DHAVE_LIBC_MALLOC=1
else
CCDEFS_MK += -DHAVE_LIBC_MALLOC=0
endif

ifeq ($(HAVE_HEAP_TRACE), 1)
CCDEFS_MK += -DHEAP_TRACE=1
else
CCDEFS_MK += -DHEAP_TRACE=0
endif

ifeq ($(USE_SAFE_TTY), 1)
CCDEFS_MK += -DUSE_SAFE_TTY=1
else
CCDEFS_MK += -DUSE_SAFE_TTY=0
endif

HALSRC_MK = $(TOP)/common/$(ARCHNAME_MK)_Driver

HALINC_MK = \
		-I$(HALSRC_MK)/Inc \
		-I$(HALSRC_MK)/CMSIS/Device/ST/$(ARCHNAME_MK)/Include \
		-I$(HALSRC_MK)/CMSIS/Include \
		-I$(HALSRC_MK)/BSP/Components \
		-I$(HALSRC_MK)/BSP/STM32F769I-Discovery \

ifeq ($(HAVE_IO_FS), 1)
IOFS_MK := FatFs
endif