TOPDIR	:= $(shell if [ "$$PWD" != "" ]; then echo $$PWD; else pwd; fi)

CC := arm-none-eabi-gcc
CCVER := __ARMGCC_VERSION=1

CCFLAGS := -std=gnu99 -g -O0 -Wall -mlittle-endian
CCDEFS = -D$(CCVER)
CCINC =

export CFLAGS_TOP := $(CCFLAGS)
export CINC_TOP := $(CCINC)
export CDEFS_TOP = $(CCDEFS)
export CCBIN_TOP := $(CC)

#STM32F769 related targets
include ./configs/.stm32f769_disco

f769_hal: CCDEFS += $(STM32F769_DISCO_BOOTLOADER_CDEFS)

_f769_hal:
	@$(MAKE) f769_hal TOP=$(TOPDIR) -C ./common/

f769_hal : _f769_hal

clean:
	rm -rf ./.output

	@$(MAKE) clean -C ./common/
