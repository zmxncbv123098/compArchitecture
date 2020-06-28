SECTION .data
    text:	DB 'Input str:',10
    textLen:	EQU $-text

SECTION .bss
    input:	RESB 80

SECTION .text
    GLOBAL _start

_start:
    mov eax,4
    mov ebx,1
    mov ecx,text
    mov edx,textLen
    int 80h

    mov eax,3
    mov ebx,0
    mov ecx,input
    mov edx,80
    int 80h

    mov esi,input
    mov ecx,0

lp:
    mov bl,[esi+ecx]
    cmp bl,10
    je quit
    push bx
    inc ecx
    jmp lp

quit:
    pop bx
    mov [esi],bl
    inc esi
    loop quit

    mov eax,4
    mov ebx,1
    mov ecx,input
    mov edx,80
    int 80h

    mov eax,1
    mov ebx,0
    int 80h