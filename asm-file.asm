INCLUDE Irvine32.inc
.data
msg1 db "Total odd number value: ",0

.code
asmfunc PROC array:PTR DWORD, length:DWORD, result:PTR DWORD
    mov eax, 0
    mov ebx, 0
    mov esi, array
    mov ecx, length

next:
    mov eax, [esi]
    TEST eax, 1
    jz skip
    add ebx, eax

skip:
    add esi, TYPE DWORD
    LOOP next

    ; Store the result in the memory location pointed to by result
    mov eax, result
    mov [eax], ebx

    ret
asmfunc ENDP
end
