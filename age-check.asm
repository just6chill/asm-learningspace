section .data
	format1:	db	"%d", 0
	format2:	db	"%d", 10, 0

	read:	times 4 db 0

	msg1 db "Enter Age: ", 0
	msg2 db "your Age: ", 0, 
	msg3 db 10, "you are 18 or above", 10, 0
	msg4 db 10, "you are not 18", 0

section .text 
	global _WinMain@16
	extern _printf
	extern _scanf


_WinMain@16:

	push 	msg1
	call 	_printf

	push 	read 
	push 	format1 
	call 	_scanf

	push 	msg2
	call 	_printf

	mov 	ebx, dword [read]
	push 	ebx
	push 	format1
	call 	_printf
	pop 	ebx

	push 	eax
	push 	ebx 
	mov 	eax, dword [read]
	mov 	ebx, 17
	cmp 	eax, ebx
	jle else

	push 	msg3
	call 	_printf

	jmp end

	else:
	
	push 	msg4
	call 	_printf

	end:

	mov 	eax, 0
	pop 	eax
	pop 	ebx

	ret 16
	
