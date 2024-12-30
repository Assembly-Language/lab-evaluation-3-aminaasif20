INCLUDE Irvine32.inc

.data
msg2 db "Sum is :  ", 0   ; Define a string that will be displayed before showing the sum

.code
asmfunc PROC array:DWORD, p2:DWORD
    ; Input:
    ; - array: Address of the first element of the array
    ; - p2: Number of elements in the array (loop counter)

    ; Initialize registers
    mov eax, 0             ; Clear eax (used for temporary calculations)
    mov ebx, 0             ; Clear ebx (used to store the sum of odd numbers)
    mov esi, array         ; Load the starting address of the array into esi
    mov ecx, p2            ; Load the number of elements in the array into ecx

next:                      ; Loop label
    mov eax, [esi]         ; Load the current element of the array into eax
    TEST eax, 1h           ; Test if the least significant bit is set (check if the number is odd)
    jz skip                ; If the number is even, jump to the 'skip' label

    add ebx, eax           ; If the number is odd, add it to the sum stored in ebx

skip:
    add esi, 4             ; Move to the next element in the array (each element is 4 bytes)
    loop next              ; Decrement ecx and repeat the loop if ecx is not zero

    ; At this point, the sum of odd numbers is stored in ebx

    ; Display the message "Sum is : "
    mov edx, offset msg2   ; Load the address of msg2 into edx
    call writestring       ; Call the Irvine32 library procedure to print the string
    call crlf              ; Print a newline

    ; Display the sum of odd numbers
    mov eax, ebx           ; Move the sum (from ebx) into eax (writeint uses eax)
    call writeint          ; Call the Irvine32 library procedure to print the integer
    call crlf              ; Print a newline

    ret                    ; Return control to the caller
asmfunc ENDP
