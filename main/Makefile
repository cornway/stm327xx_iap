PLATFORM ?= $(PLATFORM)
TOP ?= $(TOP)
OUT ?= $(OUT)
Q ?= @

include $(TOP)/configs/$(PLATFORM)/boot.mk

CCFLAGS := $(CCFLAGS_MK)
CCDEFS := $(CCDEFS_MK)
CCINC := $(CCINC_MK)
CCINC += -I$(TOP)/main/Inc \
		-I$(TOP)/ulib/pub \
		-I$(TOP)/ulib/arch \
		-I$(TOP)/configs/$(PLATFORM) \
		$(HALINC_MK)


boot : ./.output/obj/*.o

./.output/obj/*.o :
	@echo "Compiling $@..."

	@mkdir -p ./.output/obj/

	@cp -r ./Src ./.output/
	@cp -r ./Inc ./.output/

	$(Q) $(CC) $(CCFLAGS) $(CCINC) $(CCDEFS) -c ./.output/Src/*.c

	@mv ./*.o ./.output/obj/
	@cp -r ./.output/obj/*.o $(OUT)

clean :
	@rm -rf ./.output
