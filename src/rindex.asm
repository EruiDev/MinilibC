section .text
global rindex

rindex:
    xor r15, r15                    ; set r15 to 0
    xor rax, rax                    ; set return value at 0 for default returns

_get_length:
    mov r14b, BYTE [rdi + r15]      ; copy rdi + r15 to temporal holder
    cmp r14b, 0                     ; loop until getting to the end of the string
    je _loop

_add:
    inc r15
    jmp _get_length

_remove:
    cmp r15, 0                      ; if r15 gets to the end return 0
    je _exit
    dec r15

_loop:
    mov al, BYTE [rdi + r15]        ; copy rdi + r15 to al
    cmp al, sil                     ; compare al with sil, if they are different keep moving, else return position
    jne _remove
    mov rax, rdi
    add rax, r15

_exit:
    ret