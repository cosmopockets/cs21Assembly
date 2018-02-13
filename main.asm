;Program Desc:		
;Author:			Joel Vazquez
;Creation Date:		
;Revisions:			
;Date:				
;Operating Sys:		Linux Mint
;IDE/Compiler		
bits 32
section .data
	;init data definitions here
	
section .bss
	;uniti memory reservations here

section .text

global _start
_start:
	nop
	;code start
	
	;code end
	nop
	
	mov eax,1		;exit system call
	mov ebx,0		;exit return code
	int 80h			;call kernel
