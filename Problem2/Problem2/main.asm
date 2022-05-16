;	Matthew Brown
;	Student ID: 1126992
;	COMP 2476 - Intro to Assembly Lang. & Op. Sys.
;	Assignment 1 - Problem 2

INCLUDE Irvine32.inc

.data
	src BYTE "Read between the lines", 0	; Source string
	dest BYTE SIZEOF src DUP(?)				; Destination String

.code
main PROC
	mov ESI, 0								; Set the accumulator to 0
	mov EDI, LENGTHOF src - 2				; Find the length of the source string, subtract 2 and assign to EDI
	mov ECX, SIZEOF src						; Assign the number of bytes used in the source to ECX

	L1:
		mov AL, src[ESI]					; Get the value of the string at ESI and assign it to ECX
		mov dest [EDI], AL					; Move the value of AL to destination array at index EDI
			
		inc ESI								; Increment the value of ESI
		dec EDI								; Decrement the value of EDI
		loop L1								; Loop

	mov	EDX, OFFSET dest					; Move the address value of the target to EDX

	call WriteString						; Print the string

exit
main ENDP
END main