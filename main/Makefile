PLATFORM ?= $(PLATFORM)
TOP ?= $(TOP)
OUT ?= $(OUT)
Q ?= @

include $(TOP)/boot.mk

CCINC := $(CCINC_MK)
CCINC += -I$(TOP)/main/Inc
CCINC += -I$(TOP)/ulib/pub
CCINC += -I$(TOP)/ulib/arch
CCINC += -I$(TOP)/configs/$(PLATFORM) \

export CCINC_PUB := $(CCINC)

boot : ./.output/obj/*.o

./.output/obj/*.o :
	@echo "Compiling $@..."

	@mkdir -p ./.output/obj/

	@cp -r ./Src ./.output/
	@cp -r ./Inc ./.output/

	$(Q) $(CC) $(CFLAGS) $(CCINC) $(CDEFS) -c ./.output/Src/*.c

	@mv ./*.o ./.output/obj/
	@cp -r ./.output/obj/*.o $(OUT)

clean :
	@rm -rf ./.output
