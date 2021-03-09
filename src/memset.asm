section .text
global memset

memset:
	xor rax, rax

_loop:
	cmp rax, rdx
	je _exit
	mov BYTE [rdi + rax], sil
	inc rax
	jmp _loop

_exit:
	mov rax, rdi
	ret