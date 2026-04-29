.text
.globl fat
fat:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp #usar 16 bytes

    cmpl $0, %edi #if n==0 caso base
    je base

    movl %edi, -8(%rbp) #salvando na pilha

    subl $1, %edi
    call fat
    imull -8(%rbp), %eax # eax = n*fat(n-1)


    leave
    ret

base:
    movl $1, %eax
    leave
    ret

