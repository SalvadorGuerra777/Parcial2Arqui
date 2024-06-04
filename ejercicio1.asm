ORG 100h

section .text

main:
    MOV AX, 27      ; AX = 27 (dividendo inicial)
    MOV CX, 4       ; CX = 4 (divisor)
    MOV SI, 0200h   ; dirección de memoria donde se manda el resultado

div:
    XOR DX, DX      ; Limpiamos los registros 
    DIV CX          ; AX / CX, el cociente se almacena en AL, el residuo en DX
    MOV [SI], AL    ; Le pasamos el cociente en la dirección de memoria que tiene SI
    INC SI          ; Incrementamos el puntero para apuntar al siguiente espacio de memoria

    CMP AL, 4       ; Comparamos de nuevo 
    JAE div    ; Si el cociente es mayor o igual a 4, repite la división

    ; Cuando el resultado es menor que 4, almacena "FIN" en memoria
    MOV word [SI], 'FI' ; Almacena 'FI' en la dirección de memoria actual
    MOV word [SI+2], 'N' ; Almacena 'N' en la siguiente dirección de memoria

    ; Código de salida
    MOV AX, 4C00h   ; Función de salida del programa
    INT 20h         ; Cierra el programa