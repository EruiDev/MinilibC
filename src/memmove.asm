section .text
global memmove

memmove:
	xor r15, r15
	cmp rdx, 0                  ; check rdx (third arg) if is equal to 0
	je _exit

_loop:
	cmp r15, rdx                ; if r15 is rdx jump to secondary loop
	je _seconday_loop
	mov cl, BYTE [rsi + r15]    ; set to register cl the second arg plus the index
	push rcx                    ; push rcx

_add:
	inc r15
    jmp _loop

_seconday_loop:
	dec r15
	pop rcx         			; get rcx
	mov BYTE [rdi+r15], cl  	; set rdi plus the position to the stack value
	cmp r15, 0		            ; if r15 gets to the end of the string exit
	jne _seconday_loop

_exit:
	mov rax, rdi
	ret