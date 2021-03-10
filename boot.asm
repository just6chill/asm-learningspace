[org 0x7c00] ; tell the assembler that our offset is bootsector code

; The main routine makes sure the parameters are ready and then calls the function
main:
	mov bx, guessmsg
	call print
	call print_nl

begin:

	call input ; here you input a char
	cmp al, 0x34 ; is the input equal to '4'?
	jne false ; if not (jump not equal) then jump to false label

	; if yes then print rightmessage
	mov bx, rightmsg 
	call print
	
	;jump to the endless bootloop
	jmp end


false:
	mov bx, falsemsg
	call print
	call print_nl
	jmp begin
	jmp end


; start the print loop
print:
	pusha

; the accual loop
start:
	mov al, [bx] ; 'bx' is the base address for the string
	cmp al, 0 ; compare if char is \0
	je done ; if yes jump to done

	; the part where we print with the BIOS help
	mov ah, 0x0e
	int 0x10 ; call interrupt

	add bx, 1 ; increment pointer and do next loop
	jmp start ; jump to start


; print a newline char ( \n )
newline:
	pusha
	mov ah, 0x0e
	mov al, 0x0a ; newline char
	int 0x10
	mov al, 0x0d ; carriage return
	int 0x10
	popa
	ret


; clear the stack ant return to from where we called
done:
	popa
	ret

; input a ascii character
input:
	mov ah, 00h ; prepare for input
	int 16h ; call input BIOS
	ret ; return to from where we called the function

; endless loop in the bootsector
end:
	jmp $


; data
guessmsg:
	db 'guess a number between 0 and 10', 0

falsemsg:
	db 'wrong, guess again', 0

rightmsg: 
	db 'great, you guessed the right number', 0


; bootsector mark
times 510-($-$$) db 0
dw 0xaa55