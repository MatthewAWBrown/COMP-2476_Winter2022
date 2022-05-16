;	Matthew Brown
;	Student ID: 1126992
;	Assignment 2: Problem 1, Question 2

INCLUDE Irvine32.inc

.code
	main PROC

	mov EAX, 2d			; initial value
	mov EDX, EAX
	shl EDX, 4d			; EAX * 16
	push EDX			; save value
	mov EDX, EAX		
	shl EDX, 3d			; EAX * 8
	shl EAX, 1d			; EAX * 2
	add EAX, EDX		; EAX * 10
	pop EDX				; load previous value of EAX * 16
	add EAX, EDX		; EAX * 26

 	call DumpRegs

	exit
	main ENDP
	END main