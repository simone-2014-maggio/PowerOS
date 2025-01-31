; boot.asm - A simple bootloader
BITS 16
ORG 0x7C00

start:
    ; Print "PowerOS" to the screen
    mov si, msg
    call print_string

    ; Hang in an infinite loop
hang:
    jmp hang

print_string:
    mov ah, 0x0E
.print_next_char:
    lodsb
    cmp al, 0
    je .done
    int 0x10
    jmp .print_next_char
.done:
    ret

msg db 'PowerOS', 0

TIMES 510-($-$$) db 0
DW 0xAA55
