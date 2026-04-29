.text
.globl boo

#%rdi px
#%esi n
#%edx val

boo:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
WHILE:

    cmp $0, %esi
    je FORA_WHILE

    
    subl $1, %esi
    movq %rdi, -8(%rbp) #salvando px na pilha
    movl (%rdi), %edi #transformando o primeiro argumento em px->val1
    movl %esi, -12(%rbp) #salvando n na pilha
    movl %edx, %esi #val como segundo argumento

    call f

    movq -8(%rbp), %rdi #recuperando px
    movl -12(%rbp), %esi #recuperando n

    movl %eax,4(%rdi)
    addq $8, %rdi
    jmp WHILE



FORA_WHILE:
    leave
    ret
