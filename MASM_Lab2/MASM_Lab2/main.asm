 ; Student Name: Matthew Brown
 ; Student ID: 1126992
 
 .386	; directive identifies the minimum CPU required for 
		; this program (Intel386, the first x86)
 .model flat,stdcall ; the flat keyword tells the assembler to generate
 			       ; code for a protected mode program, and the 
		       ; stdcall keyword enables the calling of MS-Windows functions.
.stack 4096 ; reserve 4096 bytes of uninitialized storage.
 ExitProcess proto,dwExitCode:dword ; ExitProcess is an MS-Windows function that halts the 
			                           ; current program (called a process)
				; Proto declare prototypes for procedures used by this program
					; dwExitCode, which is like returning 0 to mean it was successful.
.code 		    ; code segment, where all executable statements in a program are located.
main proc 
mov eax,17 
sub eax,10 
invoke ExitProcess,0 ; The program ends by calling the ExitProcess function
main endp 	      ; end of the main procedure
end main 	                   ; marks the last line of the program to be assembled. It identifies the name of
				  ;the program’s startup procedure (the procedure that starts the program execution).