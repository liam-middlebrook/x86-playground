section .text
	global start

start:
	mov esi, [digit]

	push esi
	call digitToChar
	mov [digit], eax

	mov edx, 1
	mov ecx, digit
	mov ebx, 1
	mov eax, 4
	int 0x80

	call printNewLine

	mov eax, 1
	int 0x80
	ret

printNewLine:
	mov edx, 1
	mov ecx, newLine
	mov ebx, 1
	mov eax, 4
	int 0x80

	ret

digitToChar:
	push ebp; save old base pointer
	mov ebp, esp; set new base pointer
	sub esp, 4; make room for one int

	mov eax, [ebp + 8] ; move param1 value to eax
	add eax, '0'

	mov esp, ebp ; dealloc int
	pop ebp ; restore caller base
	ret
section .data

digit db 3
newLine db 10
