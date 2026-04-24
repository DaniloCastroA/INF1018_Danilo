/*
#include <stdio.h>

int nums[4] = {65, -105, 111, 34};

int main (void) {
  int i;
  int s = 0;

  for (i=0;i<4;i++)
    s = s+nums[i];

  printf ("soma = %d\n", s);

  return 0;
}
*/

.data
nums:  .int  65, -105, 111, 34
Sf:  .string "%d\n"    # string de formato para printf"

.text
.globl  main
main:
/********************************************************/
/* mantenha este trecho aqui e nao mexa - prologo !!!   */
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
  movq    %rbx, -8(%rbp)  /* guarda rbx */
  movq    %r12, -16(%rbp)  /* guarda r12 */
/********************************************************/

movl $0, %eax /* i = 0 */
movl $0, %ebx /* s = 0 */
movq $0, %rcx /* sup = 0 */
movq  $nums, %r12  /* r12 = &nums */
movq %r12 , %r8 

L1:
    cmpl $4,%eax /* if(i>=4)? */
    jge L2

    addl (%r12),%ebx /* s = s+ *nums */

    movq %r8 , %r12 

    movslq %eax, %rcx /* sup = i */

    imulq $4,%rcx /* sup = sup * tamanho inteiro */

    addq %rcx, %r12 /* andando 1 no ponteiro*/

    incl %eax /* i = i + 1 */
    jmp L1

L2:
/*************************************************************/
/* este trecho imprime o valor de %ebx (estraga %ebx)  */
  movq    $Sf, %rdi    /* primeiro parametro (ponteiro)*/
  movl    %ebx, %esi   /* segundo parametro  (inteiro) */
  movl  $0, %ebx
  call  printf       /* chama a funcao da biblioteca */
/*************************************************************/
/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
  movq  $0, %rax  /* rax = 0  (valor de retorno) */
  movq    -16(%rbp), %r12 /* recupera r12 */
  movq    -8(%rbp), %rbx  /* recupera rbx */
  leave
  ret      
/***************************************************************/