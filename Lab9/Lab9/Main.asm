;	Matthew Brown
;	Student ID: 1126992
;	Lab 9

INCLUDE Irvine32.inc

.data
	key BYTE 6, 4, 1, 2, 7, 5, 2, 4, 3, 6
	text BYTE "This text will be encrypted.", 0

.code
	main PROC
		
		mov EDX, OFFSET text	; move text to EDX
		mov ECX, SIZEOF text

		mov ESI, OFFSET key		; move key to ESI

		mov EBX, 0				; rotate left instruction

		call WriteString		; print 
		call Crlf				; new line

		call EncodeDecode		; call EncodeDecode function
				
		call WriteString		; print
		call Crlf				; new line

		mov EBX, 1				; rotate right instruction
		call EncodeDecode		; call EncodeDecode function

		call WriteString		; print
		call Crlf				; new line

	INVOKE ExitProcess, 0
	main ENDP

	EncodeDecode PROC
		
		pushad
		cmp EBX, 0
		je equals
		mov EBX, ESI
		add EBX, 10				; length of key
		L1:
			mov AL, [EDX]		; text value	
			push ECX
			mov CL, [ESI]		; key value
			ror AL, CL			; rotate right the text by key value
			mov [EDX], AL
			pop ECX

		cmp ESI, EBX			; reset offset if all keys are used
		je reset1
		
		inc ESI
		jmp endReset1
		
		reset1:
			sub ESI, 10
		endReset1:
			inc EDX
			loop L1
			
		jmp endcmp
		equals:
			mov EBX, ESI	
			add EBX, 10
		L2:
			mov AL, [EDX]
			push ECX
			mov CL, [ESI]
			rol AL, CL
			mov [EDX], AL
			pop ECX
			
		cmp ESI, EBX
		je reset2
		inc ESI

		jmp endReset2
		reset2:
			sub ESI, 10
		endReset2:
			inc EDX
			loop L2
		endcmp:
			popad
			ret

	EncodeDecode ENDP
END main