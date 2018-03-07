;Program Description: Chap 4 proj
;Author: Joel V
;Creation Date:	3/3/18
;Revisions:	they can be found inside of my commit history
;Date:	3/5/2018		Modified by: Joel
;Date:	3/5/2018
;Operating System:	linux mint
;IDE/Compiler:	N/A

%include "./functions.inc" 
 
bits 32 
   
  sizeByte  equ 1 
  sizeWord  equ  2 
  sizeDWord  equ  4 
  sizeQWord  equ  8 
 
section .data 
  ;Initialized data definitions go here 
  
	welcomePrompt    db    "welcome to my program", 0dh, 0ah, 0h 
	
   
	openPrompt		db  "Program start", 0ah,  0dh,  0h 
		.len	equ	($-openPrompt)
		
		
	closePrompt		db  "Program ending",0ah,  0dh,  0h 
		.len  equ  ($-closePrompt) 
		
		
	part1Preview	db	"This program will add up two byte arrays and print them in reverse order", 0ah,	0dh,	0h 
						
	part2Preview	db	"This program will add up two double word array and store them in array6 printing them in first order", 0ah,	0dh,	0h
						
		
	array3String	db	"Contents of Array 3 are: ",0ah,	0dh,	0h
	
	array6String	db	"Contents of array6 are: ",0ah,		0dh,	0h
     
     
	array1			db    10h, 30h, 0f0h, 20h, 50h, 12h 
		.len equ ($-array1) 
		
	array2			db    0e0h, 40h, 22h, 0e5h, 40h, 55h 
		.len equ ($-array2) 
		
	array3			db    0h,0h,0h,0h,0h,0h 
		.len equ ($-array3) 
		
		
   
	array4 			dd    11BDh, 3453h, 2FF0h, 6370h, 3350h, 1025h
		.len equ ($-array4)
		
	array5 			dd    0FFFh, 0C3Fh, 22FFh, 0EF53h, 400h, 5555h   
		.len equ ($-array5)
		
	array6 			dd    0000h, 0000h, 0000h, 0000h, 0000h, 0000h 
		.len equ ($-array6)
   
 
section .bss 
  ;Uninitialized memory reservations go here 
    
section .text 
 
global _start 
_start:
   
   
	push	welcomePrompt
	call	PrintString
	call	Printendl
	
	push	openPrompt
	call	PrintString
	call	Printendl
  ;code here 
  
	push	part1Preview
	call	PrintString
	call	Printendl

  mov edx, 			array3			;mov array3 into the edx register
 ; mov edx, 6  				;mov the size of the array inot edx register
  mov esi, 			array1 			;mov the address of array1 into esi
  mov edi, 			array2 			;mov the address of array2 into edi 
  mov ecx, 			6 				;the counter register is 6 
							;because the array size is 6
       
   
    L1: 
        mov ah, 	[esi]		;dereference array1 and mov into ah
        mov	al, 	[edi] 		;dereference array2 and mov into al
         
        add ah,		al 			;add first element together
        mov	[edx],	ah 		;store in the address of array3
         
        inc esi 			;increment the "index" of the array1 by 1
        inc edi 			;increment the "index" of array2 by 1
        dec edx 			;this is how you print it in reverse order
    Loop L1 
    
    
    call	array3String
    call	PrintString
    call	Printendl
    
    
    call	part2Preview
    call	PrintString
    call	Printendl
     
 
	mov edx, 			array6 			;store the addition of array4 & array5
	mov esi, 			array4 			;mov array4 into esi register
	mov edi, 			array5 			;mov array5 into edi register
   
	mov ecx, 6 				;the counter is 6 
							;because the size of the array is 6
   
 
    L2: 
      mov ebx, 			[edi] 		;mov the derefernece address of array5 in ebx
      add eax, 			edx 			;add 
      mov [edx], 		eax 
       
      add esi, 			4			;we inc by four because that is the size of DD 
      add edi, 			4 			;we inc by four because that is the size
      add edx, 			4 			;we inc by four because that is the size
    Loop L2 
   
  ;Code ends here
  call	closePrompt
  call	PrintString
  call	Printendl
  nop
  mov eax,1 ; Exit system call value
  mov ebx,0 ; Exit return code
  int 80h ; Call the kernel
