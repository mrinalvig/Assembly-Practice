.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
array dword 1,2,3,4,5,6,7,8
.code
main proc
  mov esi, OFFSET array
  mov ecx, LENGTHOF array -1
    
myLoop:
  mov ebx, [esi]
  mov edx, [esi + 4]
 
  mov [esi], edx
  mov [esi + 4], ebx
  add esi, TYPE array
 
loop myLoop
 
  invoke ExitProcess,0
main endp
end main
