.text
.globl add
#  %rdi     X
#  %r9d     a




add:
    pushq %rbp
    movq %rsp, %rbp

    movl $0, %r9d



WHILE:
    cmpq $0, %rdi #x != NULL sai
    je FORA


    addl (%rdi),%r9d
    movq 8(%rdi), %rdi
    
    jmp WHILE

FORA:
movl %r9d, %eax
leave
ret


