;   Student Name: Matthew Brown
;   Student ID: 1126992

ExitProcess proto     
.data                
sum qword 0          ; define variable ‘sum’ in memory 
.code                ; code segment, where all executable statements in a
                     ; program are located.
main proc            ; beginning of a procedure
   mov  rax,17        
   sub  rax,10      
   mov  sum,rax      
   mov  ecx,0         
   call ExitProcess   
main endp              
end
