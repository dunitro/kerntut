[org 0x7e00]

mov bx, MSG
call print_string

%include "print_string.asm"
MSG db "Extended"
times 2048-($-$$) db 0
