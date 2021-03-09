section .text
global strpbrk						; fully passed

strpbrk:
    xor r15, r15
    xor rax, rax

_check_first:
    mov al, BYTE [rdi + r15]        ; set to al the rdi + r15
    cmp al, 0                       ; if is null return 0
    je _exit
    xor r14, r14                    ; set second iterator to 0

_check_second:
    mov bl, BYTE [rsi + r14]        ; set to bl the rsi + r14
    cmp bl, 0                       ; if is null keep searching
    je _add
    cmp al, bl                      ; compare both al and bl
    je _completed
    inc r14
    jmp _check_second

_add:
    inc r15
    jmp _check_first

_completed:
    add rdi, r15                    ; add r15 to rdi 
    mov rax, rdi                    ; set result to return value

_exit:
    ret
