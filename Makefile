TOP	:= $(shell if [ "$$PWD" != "" ]; then echo $$PWD; else pwd; fi)


PLATFORM := stm32f769-disco

include $(TOP)/configs/$(PLATFORM)/boot.mk

V ?= 0
ifeq ($(V), 0)
Q = @
endif
Q ?=

OBJ := .output/obj
OUT_OBJ := $(OBJ)

LDSCRIPT := $(TOP)/configs/$(PLATFORM)/boot.ld
TARGET := $(BRDNAME_MK)
BINDIR := bin
OUTPUT := .output


all: hal ulib boot bin

rebuild: clean all

hal :
	@mkdir -p ./$(OUT_OBJ)
	$(MAKE) $@ TOP=$(TOP) PLATFORM=$(PLATFORM) OUT=../$(OUT_OBJ) Q=$(Q) -C ./common/
	$(MAKE) $@ TOP=$(TOP) PLATFORM=$(PLATFORM) OUT=../$(OUT_OBJ) Q=$(Q) -C ./common/
	$(MAKE) $@ TOP=$(TOP) PLATFORM=$(PLATFORM) OUT=../$(OUT_OBJ) Q=$(Q) -C ./common/

#ulib
.PHONY: ulib boot
ulib:
	@mkdir -p ./$(OUT_OBJ)
	$(MAKE) ulib TOP=$(TOP) PLATFORM=$(PLATFORM) OUT=../$(OUT_OBJ) Q=$(Q) -C ./ulib/

ulib/modules/drv:
	@mkdir -p ./$(OUT_OBJ)
	$(MAKE) ulib/modules MODULE=drv TOP=$(TOP) PLATFORM=$(PLATFORM) OUT=../$(OUT_OBJ) Q=$(Q) -C ./ulib/

ulib/modules/drv/clean:
	@mkdir -p ./$(OUT_OBJ)
	$(MAKE) ulib/modules/clean MODULE=drv TOP=$(TOP) PLATFORM=$(PLATFORM) OUT=../$(OUT_OBJ) Q=$(Q) -C ./ulib/

#main
boot : 
	@mkdir -p ./$(OUT_OBJ)
	$(MAKE) boot TOP=$(TOP) PLATFORM=$(PLATFORM) OUT=../$(OUT_OBJ) Q=$(Q) -C ./main/

GLIBC_VER=2.30
GLIBC_TOP=$(TOP)/glibc-$(GLIBC_VER)
GLIBC_SANITY=--disable-sanity-checks
GLIBC_PREFIX=--prefix=$(TOP)/glibc/lib
GLIBC_HEADERS=--with-headers=/usr/include
GLIBC_FLAGS="$(CCFLAGS)"
GLIBC_CC="$(CC)"
GLIBC_OBJ=./

./glibc-build/*:
	cp -r ./glibc-$(GLIBC_VER)/* ./glibc-build/

glibc/config:
	@mkdir -p ./glibc-build
	@mkdir -p ./stash

	@cp Makefile ./stash
	$(Q) ./glibc-$(GLIBC_VER)/configure \
										CC=$(CC) \
										CCFLAGS=$(GLIBC_FLAGS) \
										$(GLIBC_SANITY) \
										$(GLIBC_PREFIX) \
										$(GLIBC_HEADERS) \
										--build=$(BUILD_ARCH_MK)-linux-gnu \
										--host=$(HOST_ARCH_MK)-linux-gnu
	@mv ./config.* ./glibc-build/
	@cp ./stash/Makefile ./

glibc/compile:
	@cp -r ./ulib/arch/$(HOST_ARCH_MK)/include/* ./glibc-build/sysdeps/arm/include/
	@cp ./glibc-build/sysdeps/wordsize-32/bits/wordsize.h ./glibc-build/bits/wordsize.h

	$(MAKE) objdir=$(GLIBC_OBJ) -C ./glibc-build

glibc/clean:
	@rm -rf glibc-build

bin : bin/elf bin/bin bin/hex

.PHONY: bin
bin/elf : $(BINDIR)/$(TARGET).elf
bin/hex : $(BINDIR)/$(TARGET).hex
bin/bin : $(BINDIR)/$(TARGET).bin
bin/lss : $(BINDIR)/$(TARGET).lss

./$(OUT_OBJ)/*.o : hal ulib boot

$(BINDIR)/$(TARGET).elf : ./$(OUT_OBJ)/*.o
	@echo "Linking $@..."
	@mkdir -p ./$(BINDIR)
	$(Q) $(CC) -v -o $@ $(OUT_OBJ)/*.o $(LDFLAGS_MK) -T$(LDSCRIPT) -Wl,-Map=bin/$(TARGET).map

$(BINDIR)/$(TARGET).hex : $(BINDIR)/$(TARGET).elf
	@echo "Generating $@..."
	$(Q) $(BIN) -O ihex $< $@

$(BINDIR)/$(TARGET).bin : $(BINDIR)/$(TARGET).elf
	@echo "Generating $@..."
	$(Q) $(BIN) -O binary $< $@

$(BINDIR)/$(TARGET).lss : $(BINDIR)/$(TARGET).elf
	@echo "Generating $@..."
	$(Q) $(OBJDUMP) -h -S $< > $@


hal/clean :
	$(MAKE) clean TOP=$(TOP) PLATFORM=$(PLATFORM) OUT=../$(OUT_OBJ) -C ./common

ulib/clean :
	$(MAKE) clean TOP=$(TOP) PLATFORM=$(PLATFORM) -C ./ulib/

boot/clean :
	$(MAKE) clean TOP=$(TOP) PLATFORM=$(PLATFORM) -C ./main/

bin/clean :
	@rm -rf ./$(BINDIR)

clean: clean/glibc
	@rm -rf ./.output
	@rm -rf ./bin

	$(MAKE) clean TOP=$(TOP) PLATFORM=$(PLATFORM) -C ./common/
	$(MAKE) clean TOP=$(TOP) PLATFORM=$(PLATFORM) -C ./ulib/
	$(MAKE) clean TOP=$(TOP) PLATFORM=$(PLATFORM) -C ./main/