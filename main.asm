;|----------------------------------------------------------|
;|              thecodefodder - 04/17/2023                  |
;|           This is a simple bios os (x86_64)              |
;|----------------------------------------------------------|
[org 0x7c00]
[bits 16]

section .text
  global main

main:

cli
jmp 0x0000:ZeroSeg 
ZeroSeg:
  xor ax, ax
  mov ss, ax
  mov ds, ax
  mov es, ax
  mov fs, ax
  mov gs, ax
  mov sp, main
  cld
sti

push ax
xor ax, ax
int 0x13
pop ax

mov al, 1
mov cl, 2
call readDisk

mov dx, 0x1234
call printh

jmp $

%include "./printf.asm"
%include "./readDisk.asm"
%include "./printh.asm"

;STR_0 db "Loaded in 16-bit Real Mode to memory location 0x7c00", 0x0a, 0x0d, 0

DISK_ERR_MSG db "Error loading disk.", 0x0a, 0x0d, 0
TEST_STR db 'You are in the second sector of the disk.', 0x0a, 0x0d, 0

; padding
times 510-($-$$) db 0
; magic number
dw 0xaa55

test:
mov si, TEST_STR
call printf

times 512 db 0
