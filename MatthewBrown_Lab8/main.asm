;	Matthew Brown
;	Student ID: 1126992
;	COMP-2476 Lab 8

INCLUDE Irvine32.inc

.data
	menuPrompt	BYTE "Boolean Calculator", 0dh, 0ah
				BYTE 0dh, 0ah
				BYTE "1. x AND y", 0dh, 0ah
				BYTE "2. x OR y", 0dh, 0ah
				BYTE "3. NOT x", 0dh, 0ah
				BYTE "4. x XOR y", 0dh, 0ah
				BYTE "5. Exit Program", 0

	prompt1 BYTE "Enter the first 32-bit integer: ", 0
	prompt2 BYTE "Enter the second 32-bit integer: ", 0
	result BYTE "The result is: ", 0

	; creating a table for the lookup values and the procedure offsets
	caseTable BYTE '1'				; lookup value
		DWORD AND_operation			; address of procedure
		 
	entrySize = ($ - caseTable)
		BYTE '2'
		DWORD OR_operation
		BYTE '3'
		DWORD NOT_operation
		BYTE '4'
		DWORD XOR_operation
		BYTE '5'
		DWORD exitProgram

	numberOfEntries = ($ - caseTable) / entrySize			; calculating the number of entries

.code
	main PROC
		call Clrscr							; clear the console window
	Menu:
		mov EDX, OFFSET menuPrompt			; move menuPrompt into EDX
		call WriteString					; display the menuPrompt string
		call Crlf							; next line

	getInput:
		call ReadChar						; read the input from the user
		cmp al, '5'							; check if the input is 5
		ja getInput							; if above 5, repeat
		cmp al, '1'							; check if input is 1
		jb getInput							; if below 1, repeat

		call Crlf
		call selectProcedure				; call the selectProcedure procedure
		jc quit								; if the carry flag is set to 1, exit

		call Crlf
		jmp Menu							; jump to the menu to display menu again

	quit: exit
	main ENDP

	selectProcedure PROC					; start the selectProcedure Procedure
		push EBX							; push the value of EBX onto the stack
		push ECX							; push the value of ECX onto the stack
		mov EBX, OFFSET caseTable			; move the offset of caseTable to EBX
		mov ECX, numberOfEntries			; move numberOfEntries to ECX

		L1:									; loop 1
			cmp al, [EBX]					; comparing the value in al and EBX
			jne L2							; if not equal, jump to loop 2
			call NEAR PTR [EBX + 1]			; if al and EBX are equal, call the appropriate procedure
			jmp L3

		L2:									; loop 2
			add EBX, entrySize				; increments to the next entry
			loop L1							; repeats until ECX = 0

		L3:									; loop 3
			pop ECX							; remove the value of ECX from the stack
			pop EBX							; remove the value of EBX from the stack

		ret									; return from procedure

	selectProcedure ENDP					; end of the selectProcedure procedure

	AND_operation PROC						; start AND_operation procedure
		pushad								; push all registers onto the stack
		mov EDX, OFFSET prompt1				; move prompt1 to EDX
		call WriteString					; print prompt1
		call ReadDec						; read the input from user
		mov EBX, EAX						; move first integer to EBX

		mov EDX, OFFSET prompt2				; move prompt2 to EDX
		call WriteString					; print prompt2
		call ReadDec						; read the input from user

		and EAX, EBX						; run the AND operation for the integers stored in EAX and EBX

		mov EDX, OFFSET result				; move result to EDX
		call WriteString					; print result
		call WriteDec						; print the calculated value
		call Crlf
		
		popad								; save and restore all of the registers
		ret									; return from procedure

	AND_operation ENDP						; end AND_operation procedure

	OR_operation PROC						; start OR_operation procedure
		pushad								; push all registers onto the stack
		mov EDX, OFFSET prompt1				; move prompt1 to EDX
		call WriteString					; print prompt1
		call ReadDec						; read input from user
		mov EBX, EAX						; move input to EBX

		mov EDX, OFFSET prompt2				; move prompt2 to EDX
		call WriteString					; print prompt2
		call ReadDec						; read input from user

		or EAX, EBX							; run the OR operation for the integers stored in EAX and EBX

		mov EDX, OFFSET result				; move result to EDX
		call WriteString					; print result
		call WriteDec						; print the caluculated value
		call Crlf

		popad								; save and restore all of the registers
		ret									; return from procedure

	OR_operation ENDP						; end OR_operation procedure

	NOT_operation PROC						; start NOT_operation procedure
		pushad								; push all registers onto the stack
		mov EDX, OFFSET prompt1				; move prompt1 to EDX
		call WriteString					; print prompt1
		call ReadDec						; read input from the user

		not EAX								; run the NOT operation for the integer stored in EAX

		mov EDX, OFFSET result				; move result to EDX
		call WriteString					; print result
		call WriteDec						; print the calculated value
		call Crlf

		popad								; save and restore the registers
		ret									; return from procedure

	NOT_operation ENDP						; end NOT_operation procedure

	XOR_operation PROC						; start XOR_operation procedure
		pushad								; push all registers onto the stack
		mov EDX, OFFSET prompt1				; move prompt1 to EDX
		call WriteString					; print prompt1
		call ReadDec						; read input from user
		mov EBX, EAX						; move input to EBX

		mov EDX, OFFSET prompt2				; move prompt 2 to EDX
		call WriteString					; print prompt2
		call ReadDec						; read input from user
				
		xor EAX, EBX						; run XOR operation on EAX and EBX

		mov EDX, OFFSET result				; move result to EDX
		call WriteString					; print result
		call WriteDec						; print calculated value
		call Crlf

		popad								; save and restore the registers
		ret									; return from procedure

	XOR_operation ENDP						; end XOR_operation procedure

	exitProgram PROC						; start the exitProgram procedure
		stc									; set the carry flag to 1
		ret									; return from procedure

	exitProgram ENDP						; end exitProgram procedure

END main									; end of main procedure