INCLUDE Irvine32.inc

.data
array sword 10, 2, 3, -5, 6, 7, -8, 3
sum sdword ?      ; Variable to store the sum of odd numbers

.code
asmfunc proc
push esp
mov ebp,esp
;sub esp,4
    mov esi, offset array    ; Load the address of the array into ESI
    mov ecx, lengthof array  ; Load the length of the array into ECX
    mov eax, 0               ; Clear EAX register (used for summing odd numbers)

lo:
    movsx ebx, word ptr [esi] ; Load the current element into EBX, sign-extended
    test ebx, 1               ; Test if the least significant bit is set (odd number)
    jz skip                   ; If it's even (LSB = 0), skip the addition

    add eax, ebx              ; Add the odd number to the sum (in EAX)

skip:
    add esi, type array       ; Move to the next element in the array
    loop lo                   ; Continue looping if ECX > 0

    mov sum, eax              ; Store the sum in the 'sum' variable
    call WriteInt             ; Print the sum
    call Crlf                 ; Print a new line

    ret
    pop esp
asmfunc endp

end
