SECTION .data
    text:	DB 'Полдень прошел? Y/N',10
    textLen	EQU $-text
    utro:	DB 'Доброе утро!',10
    utroLen	EQU $-utro
    den:	DB 'Добрый день!',10
    denLen	EQU $-den

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

    cmp byte[input],'Y'
    je dden
    cmp byte[input],'N'
    je utr
    jmp _start

utr:
    mov eax,4
    mov ebx,1
    mov ecx,utro
    mov edx,utroLen
    int 80h
    jmp end

dden:
    mov eax,4
    mov ebx,1
    mov ecx,den
    mov edx,denLen
    int 80h
    jmp end

end:
    mov eax,1
    mov ebx,0
    int 80h
