.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
array DWORD 1,1
lastVal DWORD 2971215073
count DWORD 47-2
.code
main PROC

  mov ESI, OFFSET array
  Add ESI, TYPE array
  Add ESI, TYPE array
  mov ecx, count

  L1:
    call generateFibonacci
    ADD ESI, TYPE array
  Loop L1

INVOKE ExitProcess,0
main ENDP

generateFibonacci PROC
    MOV EAX,[ESI-4]
    MOV EBX,[ESI-8]
    ADD EAX,EBX
    MOV [ESI],EAX
    ret
generateFibonacci ENDP

END main