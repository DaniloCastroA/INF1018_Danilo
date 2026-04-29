.text
.globl add
add:
    pushq %rbp
    movq %rsp, %rbp

    addl %edi, %esi 
    addl %esi, %edx
    movl %edx, %eax

    leave
    ret
