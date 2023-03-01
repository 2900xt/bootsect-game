all:
	nasm -fbin -o game.bin src/game.asm
	qemu-system-x86_64 game.bin