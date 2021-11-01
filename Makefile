
CFILES = $(shell find ./ -type f -name '*.c')
ASMFILES = $(shell find ./ -type f -name '*.asm')
OBJFILES = $(CFILES:.c=.o) $(ASMFILES:.asm=.o)


CFLAGS = -ffreestanding -fno-builtin -mno-red-zone -m32 -nostdlib 

ACFLAGS = -f elf

CC = gcc

AC = nasm

LINKER = ld

LINKER_TARGET = linker.ld

%.o: %.c
	$(CC) $(CFLAGS) -c $(CFILES) -o $@

%.o: %.asm
	$(AC) $(ACFLAGS) $(ASMFILES) -o $@

%.ld:
	$(LINKER) $(LINKER_TARGET)

run:
	qemu-system-i386 kernel.bin

clean:
	rm *.bin $(OBJFILES)
