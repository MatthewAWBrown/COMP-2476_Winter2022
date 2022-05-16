;	Matthew Brown
;	Student ID: 1126992
;	Assignment 2 - Problem 3

INCLUDE Irvine32.inc

.data
	str1 BYTE "Enter the first number: ", 0
	str2 BYTE "Enter the second number: ", 0
	result BYTE "The GCD is ", 0
	num1 DWORD ?
	num2 DWORD ?

.code
	main PROC
		mov EDX, OFFSET str1		; move str1 to EDX	
		call WriteString			; print str1
		call ReadDec				; read input from user
		mov num1, EAX				; store input in num1

		mov EDX, OFFSET str2		; move str2 to EDX
		call WriteString			; print str2
		call ReadDec				; read input from user
		mov num2, EAX				; store input in num2

		mov EAX, num1				; move num1 to EAX
		mov EBX, num2				; move num2 to EBX
		push num2					; push num2 onto stack
		push num1					; push num1 onto stack
		call calc_gcd				; call calc_gcd process
		
 		exit

	main ENDP

	calc_gcd PROC
		push EBP					; push EBP onto stack
		mov EBP, ESP
		xor EDX, EDX
		mov EAX, [EBP+8]
		mov EBX, [EBP+12]

		L1:
			cmp EAX, EBX			; compare EAX and EBX
			je fin					; jump to fin
			jb exchange				; jump to exchange

		L2:
			div EBX					; int n = x % y
			cmp EDX, 0				; check if y > 0
			je fin					; jump to fin if y <= 0
			mov EAX, EBX
			mov EBX, EDX
			jmp L1

		exchange:
			xchg EAX, EBX			; x = y / y = n
			jmp L1					; jump to L1

		fin:						; print result
			mov EAX, EBX
			mov EDX, OFFSET result
			call WriteString
			call WriteDec
			call Crlf
			ret
	
	calc_gcd ENDP

END main
	