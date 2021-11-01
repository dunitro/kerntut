[org 0x7c00]
mov bp, 0x7c00
mov sp, bp
xor ax, ax
cld

%include "print_string.asm"
%include "disk.asm"

call lba_readable
call lba_read
mov bx, MESSAGE
call print_string
xor bx, bx


jmp 0x7e00  
mov bx, MESSAGE
call print_string
MESSAGE db "Booting" , 0
times 510-($-$$) db 0
    dw 0xaa55

