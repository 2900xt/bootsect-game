[org 0x7C00]
[bits 16]

nop
jmp short _start

%include "src/util.asm"
%include "src/draw_player.asm"

_start:
    mov bp, 0x7C00
    mov sp, bp

.loop:

    call clear_screen
    

    jmp .loop

input_char:
    db 0

p1_x_pos:
    dw 0

p1_y_pos:
    dw 0

p2_x_pos:
    dw 0

p2_y_pos:
    dw 0

ball_x_pos:
    dw 0

ball_y_pos:
    dw 0

times 510-($-$$) db 0
dw 0xAA55
