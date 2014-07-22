all:
	nasm -f elf *.asm
	ld -s -m elf_i386 -o program.bin *.o
	rm -rf *.o
