org 100h

section .data
    msg db "Opcion incorrecta", 0

section .bss
    num1 resd 1
    num2 resd 1
    option resd 1

section .text
    ; Entrada de numeros y opcion
    main:
        ; Solicitar primer número
        mov ah, 01h          ; Lee un carácter (espera a que se presione una tecla)
        int 21h
        sub al, '0'          ; Convierte el carácter a número
        mov [num1], eax

        ; Solicitar segundo número
        mov ah, 01h
        int 21h
        sub al, '0'
        mov [num2], eax

        ; Solicitar opción
        mov ah, 01h
        int 21h
        sub al, '0'
        mov [option], eax

        ; Comprobar la opción
        mov eax, [option]
        cmp eax, 1
        je opcion_1
        cmp eax, 2
        je opcion_2
        jmp opcion_incorrecta

    opcion_1:
        ; División: num1 / num2
        fild dword [num1]
        fild dword [num2]
        fdiv
        fistp dword [230h]
        jmp fin

    opcion_2:
        ; Suma: num1 + num2
        fild dword [num1]
        fild dword [num2]
        fadd
        fistp dword [240h]
        jmp fin

    opcion_incorrecta:
        ; Mensaje "opción incorrecta"
        mov esi, msg
        mov edi, 250h
    copiar:
        lodsb
        stosb
        cmp al, 0
        jne copiar

    fin:
        ; Terminar el programa
        mov ah, 4Ch
        int 21h
