section .text
global strcasecmp

strcasecmp:
	xor rax, rax				; set return value to 0
	xor rdx, rdx				; set an index to 0

_set_value:
	mov al, BYTE [rdi + rdx]	; put element rdi + rdx in al
	mov bl, BYTE [rsi + rdx]	; put element rsi + rdx in bl
	cmp bl, 0
	je _exit

_check_first:
	cmp al, 97					; check if al is < a
	jl _check_second
	cmp al, 122					; check if al is > z
	jg _check_second
	sub al, 32					; set al to upper case

_check_second:
	cmp bl, 97					; check if bl is < a
	jl _compare
	cmp bl, 122					; check if bl is > z
	jg _compare
	sub bl, 32					; set al to upper case

_compare:
	inc rdx
	cmp al, bl					; if al and bl are equal goto next
	je _set_value
	movzx rax, al				; set return value to al 
	movzx rbx, bl				; set rbx to bl
	sub rax, rbx				; substract to retrun value rbx

_exit:
	ret