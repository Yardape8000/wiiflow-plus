# Quick'n'dirty makefile [BC] v2

ifeq ($(strip $(DEVKITPPC)),)
$(error "Please set DEVKITPPC in your environment. export DEVKITPPC=<path to>devkitPPC")
endif

include $(DEVKITPPC)/wii_rules

LIBOGC_INC      :=      $(DEVKITPRO)/libogc/include
LIBOGC_LIB      :=      $(DEVKITPRO)/libogc/lib/wii

CFLAGS  := -O3 $(MACHDEP) -I$(LIBOGC_INC)

LIB     := fat
CFILES  := $(wildcard *.c)
OFILES  := $(CFILES:.c=.o)
ARC     := lib$(LIB).a
HDR     := fat.h

all : $(OFILES)
		$(AR) -r $(ARC) $(OFILES)

clean :
		rm -f $(OFILES) $(ARC)

install :
		cp -f $(ARC) ../../lib 
		cp -f $(HDR) ../../include
		cp -f fatfile_frag.h ../../include

%.o : %.c
		$(CC) $(CFLAGS) -c $< -o $@
