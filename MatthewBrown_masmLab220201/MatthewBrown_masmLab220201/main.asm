;	Matthew Brown
;	Student Id: 1126992
;	February 1, 2022

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.code
main PROC
MOV eax, 5
MOV ebx, 10
IMUL ebx, 4
SUB eax, ebx
SUB eax, 3
invoke ExitProcess,0
main endp
end main