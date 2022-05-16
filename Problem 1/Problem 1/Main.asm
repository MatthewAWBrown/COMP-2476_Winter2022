;	Matthew Brown
;	Student ID: 1126992
;	COMP 2476 - Into to Assembly Lang. & Op. Sys.
;	Assignment 1 - Problem 1


SecondsInDay = 24 * 60 * 60						; Problem 1 - 1: Symbolic constant
ArraySize=($ - myArray)							; Problem 1 - 2: Calculating and storing number of bytes in myArray
PROCEDURE TEXTEQU <PROC>						; Problem 1 - 3: Redefine "PROC" as "PROCEDURE"
Samp TEXTEQU <"This is a string">				; Problem 1 - 4a: Create a symbol named Samp for a string constant 
MyStr BYTE Samp									; Problem 1 - 4b: use the symbol when defining a string variabled named MyStr
SetupESI TEXTEQU <mov esi, OFFSET myArray>		; Problem 1 - 5: Assign the symbol SetupESI to the following line of code: mov esi, OFFSET myArray
