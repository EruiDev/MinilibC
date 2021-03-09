section .text
global strcmp

strcmp:
    xor rdx, rdx
    jmp _loop

_add
    inc rdx
    jmp _loop

_loop:
    movzx rax, BYTE [rdi + rdx]
    movzx r14, BYTE [rsi + rdx]
    cmp rax, 0
    je _exit
    cmp r14, 0
    je _exit
    cmp r14b, al
    je _add

_exit:
    sub rax, r14
    ret