ORG 100h

section .text
	
	MOV byte [0200h], 'a'   ; 'a'
	MOV byte [0202h], 'r'   ; 'r'
	MOV byte [0202h], 'r'   ; 'r'
	MOV byte [0201h], 'e'   ; 'e'
	MOV byte [0204h], 'u'   ; 'u'
	MOV byte [0205h], 'G'   ; 'G'
	MOV byte [0206h], ' '   ; espacio
	MOV byte [0207h], 'r'   ; 'r'
	MOV byte [0208h], 'o'   ; 'o'
	MOV byte [0209h], 'd'   ; 'd'
	MOV byte [020Ah], 'a'   ; 'a'
	MOV byte [020Bh], 'v'   ; 'v'
	MOV byte [020Ch], 'l'   ; 'l'
	MOV byte [020Dh], 'a'   ; 'a'
	MOV byte [020Eh], 'S'   ; 'S'
	MOV byte [020Fh], ' '   ; espacio
	MOV byte [0210h], 'a'   ; 'a'
	MOV byte [0211h], 'l'   ; 'l'
	MOV byte [0212h], 'o'   ; 'o'
	MOV byte [0213h], 'H'   ; 'H'
	
	MOV BP, 0200h		; Puntero al inicio de la cadena

	MOV AH, 09h			; Función de impresión de cadena
	MOV BH, 00h			; Número de página
	MOV BL, 30h			; Atributo de color (Cyan sobre Negro)
	MOV CX, 18h			; Longitud de la cadena (24 caracteres)

	print_top:
		MOV AL, [BP]		; Carga el byte apuntado por BP en AL
		INC BP				; Incrementa BP para apuntar al siguiente byte
		INT 10h				; Llama a la interrupción 10h para imprimir el carácter
		LOOP print_top		; Repite hasta imprimir toda la cadena

	INT 20h				; Termina el programa
