section .text
global strncmp

strncmp:
	xor r15, r15

loop:
	movzx r14, BYTE [rdi + r15]
	movzx r13, BYTE [rsi + r15]
	cmp r14, 0
	je end
	cmp r13, 0
	je end
	cmp r14, r13
	jne end
	inc r15
	cmp rdx, r15
	jle end
	jmp loop

end:
	sub r14, r13
    mov rax, r14
	ret