;	Matthew Brown
;	Student ID: 1126992
;	COMP-2476 Intro to Assembly Lang
;	Lab 10
INCLUDE Irvine32.inc

.data
	prompt1 BYTE "Enter the first integer: ",0
	prompt2 BYTE "Enter the second integer: ",0
	result BYTE "The GCD of the two integers is: ",0

.code
	main PROC
		; ask user for first integer
		mov	EDX, OFFSET prompt1
		call WriteString
		call Crlf
		call ReadInt
		push EAX

		; ask user for second integer
		mov EDX, OFFSET prompt2
		call WriteString
		call Crlf
		call ReadInt
		push EAX

		call gcd	; call the gcd function

		; print the results
		mov EDX, OFFSET result
		call WriteString
		call Crlf
		call WriteDec
		call Crlf

		exit
	main ENDP

	gcd PROC
		push EBP
		mov EBP, ESP
		mov EAX, [EBP+12]
		mov EBX, [EBP+8]
		cmp EBX, 0
		je L1		; if EBX = 0 jumpt to loop 1
		mov EDX, 0
		div EBX
		mov EAX, EDX
		push EBX
		push EAX
		call gcd	;calling the function within the function makes the function recursive
		L1:
			pop EBP
			ret 8	; returns the GCD
	gcd ENDP

END main