;	Matthew Brown
;	Student ID: 1126992
;	Assignment 2 - Problem 2

INCLUDE Irvine32.inc

.data
	statement BYTE "The product is ", 0

.code
	main PROC
		mov EBX, 212				; move first integer into EBX
		mov EAX, 44					; move second integer into EAX

		call BitwiseMul				; call the BitwiseMul function

		mov EDX, OFFSET statement	; move statement into EDX
		call WriteString			; print statement
		call WriteDEC				; print integer returned by BitwiseMul
		call Crlf					; new line

		exit
	main ENDP

	BitwiseMul PROC
		mov EDX, 0					; assign 0 to EDX
		mov CL, 0					; assign 0 to CL to function as a count for the number of shifts that occure before the CF is set

		L1:
			shr EAX, 1				; logical shift (right) EAX by 1 bit
			jc shiftAdd				; if statement: if CF is 1, then jump to shiftAdd
			inc CL					; if CF is 0: increment the counter value
			jmp next				; then: jump to next

		shiftAdd:
			shl EBX, cl				; logical shift (left) EBX by the number of CL bits
			add EDX, EBX			; add EDX and EBX
			shl EBX, 1				; logical shift (left) EBX by 1 bit
			mov CL, 0				; assign 0 to CL 

		next:
			cmp EAX, 0				; if EAX is 0: go to final
			je final	
			jmp L1					; else: go to L1

		final:
			mov EAX, EDX			; move the result to EAX

		ret

	BitwiseMul ENDP

	END main