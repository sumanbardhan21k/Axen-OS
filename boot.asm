; boot.asm — The bootloader that gets run FIRST
[bits 16]
[org 0x7c00]

; Set up the stack, print a loading char (optional), and jump to kernel

mov si, msg

print:
    lodsb
    or al, al
    jz done
    mov ah, 0x0E
    int 0x10
    jmp print

done:
    jmp $

msg db "Booting Axen OS...", 0

; Fill to 512 bytes (boot sector size)
times 510-($-$$) db 0
dw 0xAA55
