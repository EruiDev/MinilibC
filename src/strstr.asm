section .text
global strstr					; fully passed

strstr:
    xor r15, r15
    xor rax, rax
    jmp _next

_compare:
    cmp al, bl                  ; compare al to bl
    je _add
    inc r15

_next:
    mov r14, r15
    xor r13, r13

_loop:
    mov al, BYTE [rdi + r14]    ; set al to rdi + r14
    mov bl, BYTE [rsi + r13]    ; set bl to rsi + r13
    cmp bl, 0                   ; if it gets here it means it the needle string is inside the haystack 
    je _completed
    cmp al, 0                   ; if it gets here it means there is no needle in the haystack, so exit
    jne _compare
    jmp _exit

_add:
    inc r14
    inc r13
    jmp _loop

_completed:
    add rdi, r15                ; add rdi and r15 to get the position
    mov rax, rdi                ; set to rax rdi

_exit:
    ret
