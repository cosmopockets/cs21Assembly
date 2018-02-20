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
  
;  welcomePrompt		db		"This asm program will do the following A+(B+C)=D & (A+C)-B=D", 0dh, 0ah, 0h

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
  
;  push		welcomePrompt
;  call		PrintString
;  call		Printendl
  
  
	;call 		PrintRegisters
  
	;A+(B+C) =D
  
	mov	eax,0h					;zero out the eax register
	mov	eax,[varB]				;move varb into eax register
  
	mov	ebx,0h					;zero out ebx register
	mov	ebx,[varC]				;mov varc into ebx register
  
	mov	edx,0h					;zero out edx register
	mov	edx,[varA]				;mov varA into edx register
  
	add	eax,ebx					;add ebx -> eax
  
	add	eax,10h					;add value of edx -> eax
  
	;next we need to complete (A+C)-B=D
	
	mov eax,0h					;zero eax register
	mov eax,[varC]				;mov varC into eax register
	add	eax,10h					;add 10hex to eax register
	
	mov	ebx,0h					;zero out ebx register
	mov	ebx,[varB]				;mov varB into ebx register
	
	sub eax,ebx					;we are going to subtract ebx register from eax register
	
	mov [varD],0h				;zero out varD with 0-hexadecimals
	mov eax,[varD]				;move [varD] into the eax register
	
	
	
  
  
								
  					
  ;Code ends here
  nop
  mov eax,1 ; Exit system call value
  mov ebx,0 ; Exit return code
  int 80h ; Call the kernel
