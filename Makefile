ifndef CROSS_COMPILE
CROSS_COMPILE = riscv64-unknown-elf-
endif
CC = $(CROSS_COMPILE)gcc
LD = $(CROSS_COMPILE)ld
OBJCOPY = $(CROSS_COMPILE)objcopy
OBJDUMP = $(CROSS_COMPILE)objdump

CFLAGS = -g -Wall -Wl,-Map
export	CROSS_COMPILE

SRC := $(wildcard *.c)
OBJS := $(patsubst %.c, %.o, $(SRC))
# ********************
# Rules of Compilation
# ********************

rv32-test.elf: boot.o main.o build_in_dram.o
	$(LD) -T ram_dram.ld $^ -o $@
main.o: main.c
	$(CC) $(CFLAGS) -c $< -o $@
build_in_dram.o: build_in_dram.c
	$(CC) $(CFLAGS) -c $< -o $@

boot.o: boot.S
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -f *.o *.om *.bin *.data *.mif *.asm
