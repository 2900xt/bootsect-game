get_char:
    push dx
    push ax

    mov dx, 0x64
    in al, dx

    and al, 1
    cmp al, byte 0
    je .end

    mov byte [input_char], al

.end:

    pop dx
    pop ax
    ret

clear_screen:
    push ax
    mov ah, 0x00
    mov al, 0x13
    int 0x10
    pop ax
    ret
