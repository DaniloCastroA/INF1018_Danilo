#int f(int x);

#void map2 (int* um, int * outro, int n) {
#  int i;
#  for (i=0; i<n; i++)
#    *(outro+i) = f(*(um+i));
#}

.text
.globl map2

#%rdi = um
#%rsi = outro
#%edx = n
#%r9d = i
#%r8 = auxil


map2:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp
    movl $0, %r9d
    WHILE:
        cmp %edx, %r9d
        jge FORA
        #auxil = *(um+i)
        movl %r9d, %r8d

        #precisa multiplicar i pelo tamanho do byte que estamos percorrendo e nesse caso é int (4 bytes)
        imull $4, %r8d # i*4
        addq %rdi, %r8 # equivalente a um[i]

        #salvar os registradores na pilha antes da chamada da funcao
        movq %rsi, -8(%rbp)
        movq %rdi, -16(%rbp)  
        movl %r9d, -20(%rbp)
        movl %edx, -24(%rbp)

        movl (%r8), %edi 

        call f
        #resgatar os registradores
        movq -8(%rbp),  %rsi
        movq -16(%rbp), %rdi  
        movl -20(%rbp), %r9d
        movl -24(%rbp), %edx

        #*(outro+i)= %aux

        movl %r9d, %r8d  #aux=i
        imull $4, %r8d  #i*4
        addq %rsi, %r8 #i+=outro
        movl %eax, (%r8) #*(outro+i)= %eax

        addl $1, %r9d
        jmp WHILE

FORA:
    leave
    ret

