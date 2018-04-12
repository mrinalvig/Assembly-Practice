INCLUDE Irvine32.inc


MAX_COUNT = 100

.data
str1  BYTE  "Enter a character: ",0
char BYTE ?
rows BYTE ?
cols BYTE ?
randrow BYTE ?
randcol BYTE ?

.code 
main PROC
mov edx, OFFSET str1
call writeString
call ReadChar
mov char, al

call crlf
call WriteChar
call crlf


mov eax,0
mov ebx,0
mov ecx,0
mov edx,0

call crlf

call GetMaxXY
mov rows,dh
mov cols,dl

call crlf
call crlf

mov eax,0
mov ebx,0
mov ecx,0
mov edx,0

;creating random numbers

mov ecx,MAX_COUNT   ;counter



L1:
movzx eax,rows
call RandomRange
mov randrow, al
;call WriteDec

call crlf
mov eax,0

movzx eax,cols
call RandomRange
mov randcol, al
;call WriteDec

call crlf
mov eax,0
mov ebx,0
mov edx,0


mov dh,randrow
mov dl,randcol
call Gotoxy

movzx eax,char
call WriteChar

call crlf
mov eax,0

loop L1



	exit                        ;exiting main.
main ENDP

END main