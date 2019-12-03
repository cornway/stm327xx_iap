TOP	:= $(shell if [ "$$PWD" != "" ]; then echo $$PWD; else pwd; fi)

PLATFORM := stm32f769-disco
CCVER := __ARMGCC_VERSION=1



include $(TOP)/configs/$(PLATFORM)/boot.mk

export CCVER_TOP := $(CCVER)

all: hal ulib boot

#hal

.PHONY: hal
hal : _hal _bsp _com

_hal :
	@$(MAKE) hal TOP=$(TOP) PLATFORM=$(PLATFORM) -C ./common/

_bsp:
	@$(MAKE) bsp TOP=$(TOP) PLATFORM=$(PLATFORM) -C ./common/

_com:
	@$(MAKE) com TOP=$(TOP) PLATFORM=$(PLATFORM) -C ./common/

#ulib

.PHONY: ulib
ulib:
	@$(MAKE) ulib TOP=$(TOP) PLATFORM=$(PLATFORM) -C ./ulib/

#main

.PHONY: boot
boot :
	mkdir -p ./.output/obj
	mkdir -p ./.output/bin
	mkdir -p ./bin

	@$(MAKE) boot TOP=$(TOP) PLATFORM=$(PLATFORM) -C ./main/

	cp -r ./common/.output/obj/*.o ./.output/obj/
	cp -r ./ulib/.output/obj/*.o ./.output/obj/
	cp -r ./main/.output/obj/*.o ./.output/obj/

	$(CC) $(CFLAGS_MK) ./.output/obj/*.o -o ./.output/bin/$(PLATNAME_MK).o
	cp -r ./.output/bin/*.o bin/

#link

LDSCRIPT := $(TOP)/configs/$(PLATFORM)/boot.ld

.PHONY: bin
bin:
	$(CC) -o bin/$(PLATNAME_MK).elf ./.output/bin/ $(LDFLAGS_MK) -T$(LDSCRIPT) -Wl,-Map=bin/$(PLATNAME_MK).map
	$(BIN) -O ihex bin/$(PLATNAME_MK).elf bin/$(PLATNAME_MK).hex
	$(BIN) -O binary bin/$(PLATNAME_MK).elf bin/$(PLATNAME_MK).bin

	$(OBJDUMP) -h -S bin/$(PLATNAME_MK).elf > bin/$(PLATNAME_MK).lss

clean:
	rm -rf ./.output
	mkdir -p ./bin

	@$(MAKE) clean TOP=$(TOP) PLATFORM=$(PLATFORM) -C ./common/
	@$(MAKE) clean TOP=$(TOP) PLATFORM=$(PLATFORM) -C ./ulib/
	@$(MAKE) clean TOP=$(TOP) PLATFORM=$(PLATFORM) -C ./main/