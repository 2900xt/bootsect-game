[org 0x7C00]
[bits 16]

_start:
    mov bp, 0x7C00
    mov sp, bp

    call clear_screen

    mov dx, 1
    mov si, 30

loop:

    call clear_screen
    call draw_plane
    call get_char

    cmp al, byte 's'

    je move_down

    cmp al, byte 'w'

    je move_up

    jmp loop


move_up:

    cmp dx, 1
    jl loop

    sub si, 5
    sub dx, 5
    jmp loop

move_down:
    cmp si, 199
    jg loop

    add si, 5
    add dx, 5
    jmp loop


;DX = starting y

draw_plane:

    push ax
    push bx
    push cx
    push dx
    mov al, 15
    mov ah, 0x0C
    mov bh, 0

.loop_y:

    mov cx, 0

.loop_x:
    
    int 0x10

    cmp cx, 2

    jge .loop_y_end

    inc cx

    jmp .loop_x

.loop_y_end:

    cmp dx, si

    jge .end

    inc dx

    jmp .loop_y    

.end:

    pop dx
    pop cx
    pop bx
    pop ax
    ret

;AL = CHAR

get_char:
    mov ah, 0x00
    int 0x16
    ret

clear_screen:
    push ax
    mov ah, 0x00
    mov al, 0x13
    int 0x10
    pop ax
    ret

times 510-($-$$) db 0
dw 0xAA55
