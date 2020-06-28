SECTION .data
    text: DB 'Input', 10
    textLen: EQU $-text

SECTION .bss
    buf1: RESB 80
    buf2: RESB 80

SECTION .text
    GLOBAL _start

Bit:
    mov eax, 0
    lp1:
	mov al, [esi]
	cmp al, 10
	je end
	sub al, '0'
	cmp al, 0
	JB lp2
	cmp al, 9
	JA lp2
	mov cl, al
	mov edx, 1
	shl edx, cl
	or [buf2], edx
    lp2:
	inc esi
	jmp lp1
    end:
	ret

convert:
    xor ecx, ecx
    xor ebx, ebx
    mov bl, 2
    .divide:
    xor edx, edx
    div ebx
    add dl,'0'
    push dx
    inc ecx
    cmp eax,0
    jnz .divide
    .reverse:
    pop ax
    stosb
    loop .reverse
    ret

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, text
    mov edx, textLen
    int 80h
    mov eax, 3
    mov ebx, 0
    mov ecx, buf1
    mov edx, 80
    int 80h
    mov esi, buf1
    call Bit
    mov eax, [buf2]
    mov edi, buf2
    call convert
    mov eax, 4
    mov ebx, 1
    mov ecx, buf2
    mov edx, 80
    int 80h
    mov eax, 1
    mov ebx, 0
    int 80h

