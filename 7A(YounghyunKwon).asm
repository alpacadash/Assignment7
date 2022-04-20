TITLE Encryption Using Rotate Operations (7A(YounghyunKwon).asm)
;a program that performs simple encryption by rotating each plaintext byte a varing number of positions in different directions

; Younghyun Kwon
INCLUDE Irvine32.inc

.data
key BYTE -2,4,1,0,-3,5,2,-4,-4,6
keySize = $ - key
plainText BYTE "YounghyunKwonsfsafdsafdsfsdfs",0

.code
main PROC

	call Clrscr					;clear console
	mov edx,OFFSET plainText	;move the text into edx
	call WriteString			;display the text
	call CrLf					;endline
	call CrLf					;endline
	mov esi,OFFSET plainText	;move the text into esi

L1: mov ecx, keySize			;keysize counter
	mov edi, OFFSET key			;move the key into edi
	call encryption				;encrypt a character of the text
	jnz L1						;iterate if the text is longer than the key

	mov edx,OFFSET plainText	;move the text into edx
	call WriteString			;display the text
	call CrLf					;endline
	call CrLf					;endline

	exit						;terminate the program

main ENDP

encryption PROC					;Procedure encryption

L1: push ecx					;store the counter
	cmp BYTE PTR[esi],0			;check if it's the end of the text 
	je L4						;jump to L4 if it's the end of the text

	mov cl, [edi]				;put one key in the cl
	cmp cl, 0					;compare cl and 0
	jge L2						;jump to 2 if >= 0
	rol BYTE PTR[esi], cl		;rotate the character to the right 
	jmp L3						;jump to L3

L2: ror BYTE PTR[esi], cl		;rotate the character to the left

L3: inc esi						;increase the text pointer
	inc edi						;increase the key pointer
	pop ecx						;restore the counter
	loop L1						;loop to L1
	 
	jmp L5						;jump to L5

L4: pop ecx						;restore the counter

L5: ret							;return the procedure

encryption ENDP

END main