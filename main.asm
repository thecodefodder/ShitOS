;|----------------------------------------------------------|
;|              thecodefodder - 04/17/2023                  |
;|           This is a simple bios os (x86_64)              |
;|----------------------------------------------------------|
[org 0x7c00]

mov al, 1
mov cl, 2
call readDisk
call test

jmp $

%include "./printf.asm"
%include "./readDisk.asm"

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
