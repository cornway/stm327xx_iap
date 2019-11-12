TOPDIR	:= $(shell if [ "$$PWD" != "" ]; then echo $$PWD; else pwd; fi)

CCFLAGS := -std=gnu99 -g -O0 -Wall -mlittle-endian \

CCINC :=
CC := arm-none-eabi-gcc

export CFLAGS_TOP := $(CCFLAGS)
export CINC_TOP := $(CCINC)
export CDEFS_TOP := -D__ARMGCC_VERSION=-1
export CCBIN_TOP := $(CC)

f769_disco:

f769_hal:
	@$(MAKE) $(F769_HAL_TGT) TOP=$(TOPDIR) -C ./common/
clean:
	rm -rf ./.output

	@$(MAKE) clean -C ./common/
