  .data
  nums: .int 3, -5, 7, 8, -2
  s1:   .string "%d\n"

  .text
  .globl main
  main:
  /* prologo */
     pushq %rbp
     movq  %rsp, %rbp
     subq  $16, %rsp
     movq  %rbx, -8(%rbp)
     movq  %r12, -16(%rbp)

     movl $0, %ebx #int i=0 

     movq  $nums,  %r12 #int *p = nums

  /* coloque seu codigo aqui */
    WHILE:
    cmpl $5,%ebx
    jge FIM

    movl (%r12),%edi
    movl $1,%esi #LIM = 1
    call filtro

    movq $s1, %rdi
    movl %eax, %esi
    movl $0,%eax
    call printf

    incl %ebx
    addq $4, %r12

    jmp WHILE

    FIM:
    
    movl    $0, %eax


  /* finalizacao */
     movq -8(%rbp), %rbx
     movq -16(%rbp), %r12
     leave
     ret
