;|----------------------------------------------------------|
;|              thecodefodder - 04/17/2023                  |
;|           This is a simple bios os (x86_64)              |
;|----------------------------------------------------------|

[org 0x7c00]

;mov si, STR_0
;call printf

mov al, 1
mov cl, 2
call readDisk
call test

jmp $

printf:
 pusha
 str_loop:
   mov al, [si]
   cmp al, 0
   jne print_char
   popa
   ret
 print_char:
  mov ah, 0x0e
  int 0x10
  add si, 1
  jmp str_loop


readDisk:
  pusha
  mov ah, 0x02
  mov dl, 0x80
  mov ch, 0
  mov dh, 0
  ;mov al, 1
  ;mov cl, 2

  push bx
  mov bx, 0
  mov es, bx
  pop bx
  mov bx, 0x7c00 + 512

  int 0x13

  jc disk_err
  popa
  ret

  disk_err:
    mov si, DISK_ERR_MSG
    call printf
    jmp $ ; halt

;STR_0 db "Loaded in 16-bit Real Mode to memory location 0x7c00", 0x0a, 0x0d, 0

DISK_ERR_MSG db "Error loading disk.", 0x0a, 0x0d, 0
TEST_STR db 'You are the second sector of the disk.', 0x0a, 0x0d, 0

; padding
times 510-($-$$) db 0
; magic number
dw 0xaa55

test:
mov si, TEST_STR
call printf

times 512 db 0