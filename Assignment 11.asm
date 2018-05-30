ExitProcess Proto
ReadInt64 Proto
WriteInt64 Proto
Crlf Proto

.data
MyArray QWORD 10d, 20d, 30d, 40d
FinalArray QWORD 4 DUP (0) 

.code
main proc

mov rsi, 0
mov r15, 8 
mov rcx, 4
mov rsi, 0

  startLoop:

  mov rax, rsi ; i = 0
  mul r15 ; i = i * 8
  mov rdi, rax
  mov rax, MyArray[rdi] ; var = MyArray[i]

  call WriteInt64 

  inc rsi ;i++

Loop startLoop

	call Crlf
	mov rcx, lengthof myArray / 2 ; sets # of loops to half the array length
  mov rsi, 0
  
	MyLoop:
  
	mov rax, rsi
  mul r15 
	mov rdx, qword ptr myArray[rax]; rdx has current value 
	mov r14,  qword ptr myArray[rax + 8]; r14 has current value + 1
	mov FinalArray [rax + 8], rdx ; sets i+1 = i 
	mov FinalArray [rax], r14 ; i = i+1
	inc rsi ; increments twice so its always odd switching with even
	inc rsi

	Loop MyLoop
  
	mov rcx, 4
  mov rsi, 0
  
	finalLoop:

	mov rax, rsi 
	mul r15 
	mov rdi, rax
	mov rax, FinalArray[rdi] 
	call WriteInt64 
	inc rsi 

	Loop finalLoop

	call ReadInt64
	call ExitProcess

main endp
end
