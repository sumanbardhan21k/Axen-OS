# Makefile — Builds your Axen OS into a bootable .iso file

all: os.iso

boot.bin: boot.asm
	nasm -f bin boot.asm -o boot.bin

kernel.o: kernel.c
	i686-elf-gcc -ffreestanding -c kernel.c -o kernel.o

kernel.bin: kernel.o link.ld
	i686-elf-ld -T link.ld -o kernel.bin -nostdlib kernel.o

os.img: boot.bin kernel.bin
	cat boot.bin kernel.bin > os.img

os.iso: os.img
	cp os.img os.iso

clean:
	rm -f *.bin *.o *.img *.iso
