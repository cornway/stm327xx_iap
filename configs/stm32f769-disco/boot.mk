CCDEFS_ARCH_MK := -D__ARCH_ARM_M7__

CCDEFS_MK := \
    -DSTM32F769xx \
    -DUSE_HAL_DRIVER \
    -DUSE_STM32F769I_DISCO \
    -DDATA_IN_ExtSDRAM \
    -DUSE_LCD_HDMI \
    -DUSE_USB_HS \
    -DSTM32_SDK \
    -DBOOT \
    -DBSP_DRIVER \
    -DHAVE_CODESWAP \
	$(CCDEFS_ARCH_MK)

CCDEFS_MK += -D$$CCVER_TOP

CCINC_MK :=

CCFLAGS_MK :=  -mcpu=cortex-m7 -fsingle-precision-constant -Wdouble-promotion \
			   -mthumb -mthumb-interwork

ASFLAGS_MK := -mcpu=cortex-m7 -mthumb

LDFLAGS_MK  = -mthumb -mtune=cortex-m4 -march=armv7e-m \
            -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mlittle-endian \
            -lm -nostartfiles

CC := arm-none-eabi-gcc
AS := arm-none-eabi-as
AR := arm-none-eabi-ar
BIN := arm-none-eabi-objcopy
OBJDUMP := arm-none-eabi-objdump

MCPUNAME_MK := armv7
ARCHNAME_MK := STM32F7xx
PLATNAME_MK := STM32F769I-Discovery
MACHNAME_MK := stm32

HALSRC_MK := $(TOP)/common/$(ARCHNAME_MK)_Driver

HALINC_MK := \
		-I$(HALSRC_MK)/Inc \
		-I$(HALSRC_MK)/CMSIS/Device/ST/$(ARCHNAME_MK)/Include \
		-I$(HALSRC_MK)/CMSIS/Include \
		-I$(HALSRC_MK)/BSP/Components \
		-I$(HALSRC_MK)/BSP/STM32F769I-Discovery \

IOFS_MK := FatFs
