;	Matthew Brown	
;	Student ID: 1126992
;	Lab 6

INCLUDE Irvine32.inc
CR = 0Dh
LF = 0Ah

.data
	stringrandom BYTE "display 15 random strings",CR,LF,0

.code
	main PROC
	call Randomize	;reset

;random strings
	mov EDX,OFFSET stringrandom	;display
	call WriteString
	mov ECX,15	;loop
	L1: push ecx
		call GenRandStr	;display
		mov EAX,500
		call Delay	;pause
		pop ECX
		Loop L1

;Exit
	exit
	main ENDP

	GenRandStr PROC
		;capital letters A-Z
		;range 0 to 25
		;loop
		mov ecx,10	;loop
		L2: mov eax,26
			call RandomRange
			add eax,65
			call WriteChar
			Loop L2
		mov EAX,CR
		call WriteChar
		mov EAX,LF
		call WriteChar
		ret
		GenRandStr ENDP

	END main