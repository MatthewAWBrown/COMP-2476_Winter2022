;	Student name: Matthew Brown
;	Student ID: 1126992
;	Lab 5 - February 15, 2022

INCLUDE Irvine32.inc

.data
	intarray WORD 5h, 4h, 3h, 2h, 1h	; array of 5! (5 * 4 * 3 * 2 * 1)

.code
main PROC
	mov edi, OFFSET intarray			; address of intarray
	mov ecx, LENGTHOF intarray			; loop counter
	mov eax, 1							; set accumulator to 1 (1 * X = X)

	L1:
		imul eax, [edi]					; multiply an integer
		add edi, TYPE intarray			; point to the next integer
		loop L1							; repeat until ECX = 0

	call DumpRegs						; Display the registers

  exit
main ENDP
END main