section .text
global strcspn:

strcspn:
	xor r15, r15                    ; set r15 to 0
    jmp _loop

_add_to_first:
	inc r15

_loop:
	mov al, BYTE [rdi + r15]        ; set rdi + iterator to al
	cmp al, 0                       ; check if al gets to the end
	je _exit
	xor r14, r14                    ; set r14 back to 0
	jmp _loop_reject

_add_to_second:
	inc r14

_loop_reject:
	mov bl, BYTE [rsi + r14]        ; set rsi + r14 to bl
	cmp bl, 0                       ; check if bl gets to the end
	je _add_to_first
	cmp al, bl                      ; comapre al to bl and if is equal exit
	jne _add_to_second

_exit:
	mov rax, r15
	ret