; AddTwoSum_64.asm - Chapter 3 example.
ExitProcess proto     
.data     
firstval QWORD 10
secondval QWORD 25
thirdval QWORD 2
sum QWORD 0          ; define variable ‘sum’ in memory 

.code                ; code segment, where all executable statements in a
                     ; program are located.
main proc            ; beginning of a procedure
   mov  rax,firstval         
   add  rax,secondval        
   imul rax, thirdval      
   mov  sum, rax
   sub rax, secondval
   call ExitProcess   
main endp              
end
