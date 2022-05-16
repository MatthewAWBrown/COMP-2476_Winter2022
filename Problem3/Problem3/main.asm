;	Matthew Brown
;	Student ID: 1126992
;	COMP 2476 - Intro to Assembly Lang. & Op. Sys.
;	Assignment 1 - Problem 3

INCLUDE Irvine32.inc

.data
	Fibonacci DWORD 10 DUP (1,1,?,?,?,?,?,?,?,?)	; array of the first 10 digits of the Fibonacci sequence
	Count DWORD 8									; count = 8 (first two digits are given)

.code
main PROC
	mov ECX, count									; move the count to EAX
	mov ESI, OFFSET Fibonacci						; move the number of address in Fibonacci to ESI
	add ESI, TYPE Fibonacci							; add first number of Fibonacci to ESI
	mov EAX, Fibonacci
	call DumpRegs
	add ESI, TYPE Fibonacci							; add second number of Fibonacci to ESI
	call DumpRegs

	L1:												; loop label

		mov EAX, [ESI - 4]							; move ESI - 4 to EAX
		mov EBX, [ESI - 8]							; move ESI - 8 to EBX
		add EAX, EBX                                ; add EAX and EBX
		call DumpRegs								; display the new sum
		mov [ESI], EAX								; move the new sum to ESI
		add ESI, TYPE Fibonacci						; add the new sum to the Fibonacci array

		loop L1										; execute loop

exit
main ENDP
END main