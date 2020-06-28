SECTION .data
    text:	DB 'Введите текст',10
    textLen	EQU $-text

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

    mov eax,4
    mov ebx,1
    mov ecx,input
    mov edx,80

    int 80h

    mov eax,1
    mov ebx,0
    int 80h