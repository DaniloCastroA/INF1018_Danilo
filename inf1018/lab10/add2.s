.text
.globl add2

#%rdi  X
#%r9d temp

add2:
    pushq %rbp
    movq %rsp, %rbp

    

    cmpq $0, %rdi 
    je retornaZero

    subq $16, %rsp

    movl (%rdi),%r9d  #temp=x->val 
    movl %r9d, -4(%rbp) #salvando r9d na pilha

    movq 8(%rdi), %rdi
    call add2
    addl -4(%rbp), %eax

    leave
    ret

retornaZero:
    movl $0, %eax
    leave
    ret

