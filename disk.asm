DAP:
        db	0x10
	    db	0
blkcnt:	dw	16		; int 13 resets this to # of blocks actually read/written
db_add:	dw	0x7e00		; memory buffer destination address (0:7c00)
	    dw	0		; in memory page zero
d_lba:	dd	1		; put the lba to read in this spot
	    dd	0		; more storage bytes only for big lba's ( > 4 bytes )   



lba_readable:
    mov ah, 0x41
    mov bx, 0x55aa
    mov dl, 0x80
    int 0x13
    jc Fail
    clc
    ;cmp bx, 0xaa55
    ;jne Fail
    hlt
    ret

lba_read:
    mov ah, 0x42
    mov dl, 0x80 
    mov si, DAP
    int 0x13
    jc Fail
    clc
    ret



Fail:
    xor bx, bx 
    mov bx, FailMessage
    call print_string
    hlt

FailMessage db "Reading 0" , 0
SuccesMessage db "Reading 1" , 0

