;	COMP-2476 Into to Assembly Lang & Op Sys
;	Lab 7
;	Matthew Brown
;	Student ID: 1126992

INCLUDE Irvine32.inc

.data
	myVar DWORD ?					; variable for holding value entered by user
	prompt BYTE "Please enter an integer between 0 and 100: ", 0		; prompt asking user to enter a value 
	s DWORD 50d						; value to start random number generation	
	e DWORD 100d					; maximum value for random number generation
	str1 BYTE "The integer score is:",0
	str2 BYTE "The letter grade is:",0

.code
main PROC
	mov EDX, offset prompt			; moving prompt to edx
	call WriteString				; displaying prompt
	call ReadInt					; reading integer from user
	mov myVar, EAX
	call CalcGrade					; call CalcGrade to display the letter grade
	call crlf						

	mov ECX, 10
	L1:
		mov EAX, s					; moving start to eax
		mov EBX, e					; moving end to ebx
		dec EBX
		sub EBX, EAX				; create the range from 50 to 100
		xchg EBX, EAX
		call RandomRange			; generate random intergers between 50 and 100
		neg EBX						; change sign of ebx (switches randomly generated numbers from negative to positive)
		sub EAX, EBX				; sub ebx from eax to define the range
		mov EDX, offset str1
		call WriteString
		call WriteInt
		call crlf
		call CalcGrade
		call crlf
	loop L1

	exit
main ENDP

CalcGrade PROC
	.IF EAX >= 90					; multiple if and else if statements to select the correct letter grade
	mov AL, 'A'
	.ELSEIF EAX >= 80
	mov AL, 'B'
	.ELSEIF EAX >= 70
	mov AL, 'C'
	.ELSEIF EAX >= 60
	mov AL, 'D'
	.ELSE
	mov AL, 'F'
	.ENDIF

	mov EDX, offset str2
	call WriteString
	call WriteChar					; display the letter grade in al
	call crlf

	ret
CalcGrade ENDP

END main