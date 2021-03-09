section .text
global strlen				; fully passed

strlen:
    xor rax, rax                ; set rax to 0

_loop:
    cmp BYTE [rdi + rax], 0     ; compare position to null
    je _exit                    ; if is null exit
    inc rax                     ; increase rax
    jmp _loop

_exit:
    ret