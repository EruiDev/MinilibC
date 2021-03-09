section .text
global memcpy					; fully passed

memcpy:
    xor r15, r15		        ; set an r15 to 0

_loop:
    cmp r15, rdx		        ; check if lenght is equal to rdx (third arg)
    je _exit
    mov al, BYTE [rsi + r15]	; set to al (since its 8 bits) the value of rsi of position r15
    mov BYTE [rdi + r15], al	; the same but reverse order

_add:
    inc r15                     ; increase r15 and go to loop
    jmp _loop

_exit:
    mov rax, rdi				; return value setted to rdi 
    ret	