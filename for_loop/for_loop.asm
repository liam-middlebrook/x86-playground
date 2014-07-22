; for_loop.asm
; A example of a for loop in x86 assembly

section	.text
    global start         ;must be declared for using gcc

start:	                ;tell linker entry point
mov	edx, len	    ;message length
mov	ecx, msg	    ;message to write
mov	ebx, 1	        ;file descriptor (stdout)
loop:
    ;Write 'msg' to stdout
    mov	eax, 4	        ;system call number (sys_write)
    int	0x80	        ;call kernel
    
    ;Check if loop is finished
    mov esi, [count]    ;move the data from count to the esi register
    cmp esi, 0          ;compare that data against 0
    dec byte [count]    ;decrease the value of the count variable
    jne loop            ;if the last comparison that was called was not equal then jump to loop
    
    ;Exit the program
	mov	eax, 1	        ;system call number (sys_exit)
	int	0x80	        ;call kernel

section	.data

count db 10
msg	db	'Hello, world!', 10, 0	;our dear string
len	equ	$ - msg			;length of our dear string
