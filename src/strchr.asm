section .text
global strchr

strchr:
    xor rax, rax
    cmp sil, 0
    je _exit

_loop:
    mov al, BYTE [rdi]
    cmp al, 0					; if string on that position is empty
    je _exit
    cmp al, sil	        		; is al equal to sil
    jne _add
    mov rax, rdi	        	; get position to return
    jmp _exit		        	; exit program

_add:
    inc rdi			        	; increment rdi and return to strchr
    jmp strchr     

_exit:
    ret