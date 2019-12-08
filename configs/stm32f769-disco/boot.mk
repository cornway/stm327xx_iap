include $(TOP)/.config

CCVER := __ARMGCC_VERSION=1

CC := arm-none-eabi-gcc
AS := arm-none-eabi-as
AR := arm-none-eabi-ar
BIN := arm-none-eabi-objcopy
OBJDUMP := arm-none-eabi-objdump

MCPUNAME_MK := armv7
ARCHNAME_MK := STM32F7xx
BRDNAME_MK := STM32F769I-Discovery
MACHNAME_MK := stm32

CCFLAGS_MK := -mthumb -mtune=cortex-m7 -march=armv7e-m -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mlittle-endian
LDFLAGS_MK := -mthumb -mtune=cortex-m7 -march=armv7e-m -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mlittle-endian -lm -nostartfiles
ASFLAGS_MK := -mcpu=cortex-m7 -march=armv7e-m -mthumb -mfloat-abi=hard

CCDEFS_MK = \
	-D__ARCH_ARM_M7__=1 \
	-D$(CCVER) \
    -DSTM32F769xx \
    -DUSE_HAL_DRIVER \
    -DUSE_STM32F769I_DISCO \
    -DDATA_IN_ExtSDRAM \
    -DUSE_LCD_HDMI \
    -DUSE_USB_HS \
    -DSTM32_SDK \
    -DBOOT \
    -DBSP_DRIVER \
	$(CCDEFS_ARCH_MK)

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