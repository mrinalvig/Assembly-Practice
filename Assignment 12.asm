WriteInt64 PROTO
ReadInt64 PROTO
WriteString PROTO
Crlf PROTO 

extrn ExitProcess: PROC

.data
array QWORD 10,20,30,40,50,60,70,80
arrayLength QWORD 8
arrayMaxElement QWORD 7
count QWORD 0
pressEnter BYTE "Press Enter to Continue",0
.code
main proc
	
mov rcx, arrayLength
mov rsi, 0
L1:
	mov rax, array[rsi * 8]
	call WriteInt64
	inc rsi
loop L1
call crlf
	
mov rcx, arrayMaxElement
BubbleSort:
mov count, rcx
mov rcx, arrayMaxElement
mov rsi, 0
L2:
	mov r12, rsi 
	imul r12,8
	mov r14, array[r12]
	mov r15, array[r12+8]
	mov array[r12], r15
	mov array[r12+8], r14
	inc rsi
loop L2

mov rcx, arrayLength
mov rsi, 0
L3:
	mov rax, array[rsi * 8]
	call WriteInt64
	inc rsi
loop L3
call Crlf

mov rcx, count
loop BubbleSort

	EndProgram:
		call pressEnterToContinue

    call ExitProcess

main endp

pressEnterToContinue proc
	call Crlf
	mov rdx, OFFSET pressEnter
	call WriteString
	call ReadInt64
	ret
pressEnterToContinue endp

end
