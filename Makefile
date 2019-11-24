TOPDIR	:= $(shell if [ "$$PWD" != "" ]; then echo $$PWD; else pwd; fi)

CC := arm-none-eabi-gcc
CCASM := arm-none-eabi-as
CCVER := __ARMGCC_VERSION=1

ASFLAGS_M7 := -mcpu=cortex-m7 -mthumb

CCFLAGS := -std=gnu99 -g -O0 -Wall -mlittle-endian
CCDEFS = -D$(CCVER)
CCINC = \
	-I$(TOPDIR)/Inc \
	-I$(TOPDIR)/ulib/pub \
	-I$(TOPDIR)/ulib/arch

CCINCHAL_H7 := \
	-I$(TOPDIR)/common/STM32F7xx_Driver/CMSIS/Device/ST/STM32F7xx/Include \
	-I$(TOPDIR)/common/STM32F7xx_Driver/CMSIS/Include \
	-I$(TOPDIR)/common/STM32F7xx_Driver/Inc

CCINCBSP_DISCO_769 := \
	-I$(TOPDIR)/common/STM32F7xx_Driver/BSP/STM32F769I-Discovery

export CCFLAGS_TOP := $(CCFLAGS)
export CCINC_TOP := $(CCINC) \
					$(CCINCHAL_H7) \
					$(CCINCBSP_DISCO_769)
export CCDEFS_TOP = $(CCDEFS)
export CCBIN_TOP := $(CC)
export CCASM_TOP := $(CCASM)
export ASFLAGS_M7_TOP := $(ASFLAGS_M7)

#STM32F769 related targets
include ./configs/.stm32f769_disco

f769_hal : CCDEFS += $(STM32F769_DISCO_BOOTLOADER_CDEFS)

_f769_hal :
	@$(MAKE) f769_hal TOP=$(TOPDIR) -C ./common/

f769_hal : _f769_hal


#ulib related targets

ulib_stm32f769_disco : CCDEFS += $(STM32F769_DISCO_BOOTLOADER_CDEFS)

_ulib_stm32f769_disco :
	mkdir -p ./ulib/.output

	@$(MAKE) ulib_stm32f7xx TOP=$(TOPDIR) -C ./ulib/

ulib_stm32f769_disco : _ulib_stm32f769_disco

clean:
	rm -rf ./.output

	@$(MAKE) clean TOP=$(TOPDIR) -C ./common/
	@$(MAKE) clean TOP=$(TOPDIR) -C ./ulib/