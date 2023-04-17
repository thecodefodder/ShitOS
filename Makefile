main.bin:*.asm
	nasm -fbin main.asm -o main.bin

clean:
	rm -f *.bin

run:
	qemu-system-x86_64 main.bin