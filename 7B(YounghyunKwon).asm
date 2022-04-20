TITLE Greatest Common Divisor (7B(YounghyunKwon).asm)
;implement GCD function in assembly language and write a test program that calls the function

; Younghyun Kwon
INCLUDE Irvine32.inc

.DATA
	x1 SDWORD -32
	y1 SDWORD 16
	x2 SDWORD 27
	y2 SDWORD -3

.CODE
main PROC
	mov eax, x1		;first x
	mov ebx, y1		;first y
	call GCD		;call GCD
	call WriteDec	;display eax -> x

	call Crlf		;endline

	mov eax, x2		;second x
	mov ebx, y2		;second y
	call GCD		;call GCD
	call WriteDec	;display eax -> x

	exit
main ENDP

GCD PROC			;GCD procedure

L1:	
	call absolute	;make eax(x) absolute value
	
	xchg eax, ebx	;exchange eax and ebx -> eax(y) ebx(x)
	call absolute	;make eax(y) absolute value

	xchg eax, ebx	;exchange eax and ebx -> eax(x) ebx(y)
	
	mov edx, 0		;clear dividend
	div ebx			;eax/ebx
	mov eax, ebx	;eax = ebx(y)
	mov ebx, edx	;ebx = eax%ebx
	cmp ebx, 0		;compare ebx(y) and 0
	jg L1			;jump to L1 if ebx(y) > 0

	ret				;return procedure
GCD ENDP

absolute PROC		;absolute procedure

	cmp eax, 0		;compare eax and 0
	jge L1			;jump to L1 if eax >= 0
	neg eax			;turn negative value into positive

L1:	ret				;return procedure

absolute ENDP

END main