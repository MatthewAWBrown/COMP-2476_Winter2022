;	Matthew Brown
;	Student ID: 1126992
;	Lab 4, February 8, 2022

INCLUDE Irvine32.inc

.data
	val1 DWORD 10000h
	val2 DWORD 20000h

.code
main PROC
	mov eax,val1					;	start with 10000h 
	sub eax,val2					;	subtract 20000h 
	call DumpRegs					;	display the registers showing that the carry flag is set to 1

	add eax, val2					;	add 20000h
	add eax, val1					;	add 10000h
	call DumpRegs					;	display the registers again showing that the carry flag is now set to 0
 exit
main ENDP
END main