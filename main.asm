;Program Description:
;Author:
;Creation Date:
;Revisions:
;Date:			Modified by:
;Date:
;Operating System:
;IDE/Compiler

%include "./functions.inc"

bits 32
section .data
  ;Initialized data definitions go here
  
  ;welcomePrompt		db		"This asm program will do the following A+(B+C)=D & (A+C)-B=D", 0dh, 0ah, 0h
  varA				db		10h				;this is the single byte variable
  varB				dw		2000h			;this is the word variable
  varC				dd		30000h			;this is the variable for the double word
    

section .bss
  ;Uninitialized memory reservations go here
  
  varD		resd		4	

section .text

global _start
_start:
  nop
  ;Code starts here
  
  ;push		welcomePrompt
  ;call		PrintString
  ;call		Printendl
  
  
 ; call 		PrintRegisters
  
  ;A+(B+C) =D
  
  mov	eax, 0h					;zero out the eax register
  mov	eax,[varB]				;we move the 2 byt value of varB in ax register
  
  mov	ebx, 0h					;we need to zero out the ebx register since varC & D ar 4 bytes
  mov	ebx, [varC]				;mov the value of varC into the ebx register
  
  add	eax,ebx					;we add ebx TO eax because we want all math operations to 
								;finish inside of the eax register
								
  ;Code ends here
  nop
  mov eax,1 ; Exit system call value
  mov ebx,0 ; Exit return code
  int 80h ; Call the kernel
