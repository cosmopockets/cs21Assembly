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
  
  welcomePrompt		db		"welcome to my program", 0dh, 0ah, 0h
  inputPrompt		db		"Enter an unsigned int:", 0h

section .bss
  ;Uninitialized memory reservations go here

section .text

global _start
_start:
  nop
  ;Code starts here
  
  push		welcomePrompt
  call		PrintString
  call		Printendl
  
  push		inputPrompt
  call		PrintString 
  call		InputUInt
  call		Printendl
  
  call 		PrintRegisters
  

  ;Code ends here
  nop
  mov eax,1 ; Exit system call value
  mov ebx,0 ; Exit return code
  int 80h ; Call the kernel
