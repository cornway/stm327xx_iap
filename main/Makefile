PLATFORM ?= $(PLATFORM)
TOP ?= $(TOP)

include $(TOP)/configs/$(PLATFORM)/boot.mk

CCFLAGS := $(CCFLAGS_MK)
CCDEFS := $(CCDEFS_MK)
CCINC := $(CCINC_MK)
CCINC += -I$(TOP)/main/Inc \
		-I$(TOP)/ulib/pub \
		-I$(TOP)/ulib/arch \
		$(HALINC_MK)

boot :
	mkdir -p ./.output/obj/
	mkdir -p ./.output/lib/

	cp -r ./Src ./.output/
	cp -r ./Inc ./.output/

	cp ./Makefile ./.output/

	@$(MAKE) _boot TOP=$(TOP) -C ./.output/

_boot:

	$(CC) $(CCFLAGS) $(CCINC) $(CCDEFS) -c ./Src/*.c

	mv ./*.o ./obj/

	$(AR) rcs ./lib/main.a ./obj/*.o

clean :
	rm -rf ./.output
