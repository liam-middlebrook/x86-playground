x86-playground
==============

A playground of different x86 assembly files.

For right now until I have the time to get nasm set up with a nice makefile
I'm going to be using http://www.compileonline.com/compile_assembly_online.php

Through CompileOnline the default assembly file I get looks like this:
```x86

section	.text
    global _start         ;must be declared for using gcc

_start:	                ;tell linker entry point

	mov	edx, len	    ;message length
	mov	ecx, msg	    ;message to write
	mov	ebx, 1	        ;file descriptor (stdout)
	mov	eax, 4	        ;system call number (sys_write)
	int	0x80	        ;call kernel

	mov	eax, 1	        ;system call number (sys_exit)
	int	0x80	        ;call kernel

section	.data

msg	db	'Hello, world!',0xa	;our dear string
len	equ	$ - msg			;length of our dear string

```