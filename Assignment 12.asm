.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
array DWORD 10,20,30,40
arrayType DWORD TYPE array
newArray DWORD LENGTHOF array DUP(?)
lastElement DWORD ?

.code
main PROC
   
    ;Get first element address in ESI
    MOV ESI, OFFSET array

    ;Get address of next element in EDI
    MOV EDI, OFFSET newArray
    ADD EDI, TYPE newArray

    ;set loop count into ecx
    mov ECX, LENGTHOF array

L2:
    MOV EAX, [ESI]
    MOV [EDI], EAX

    ADD ESI, TYPE array
    ADD EDI, TYPE array

    LOOP L2

    ;set last element from array in newArray first position
    MOV EDI,OFFSET newArray
    MOV EAX, [ESI]
    MOV [EDI], EAX

INVOKE ExitProcess,0
main ENDP
END main