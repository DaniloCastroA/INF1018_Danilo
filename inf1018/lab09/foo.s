.text
.globl foo
foo:
    pushq %rbp
    movq %rsp, %rbp


    movl $0, %r10d # i=0
    movl $0, %r11d # s=0

while:
    cmpl  %esi, %r10d 
    jae saiLoop

    movl (%rdi, %r10,4), %eax         # eax = a[i]
    addl %eax, %r11d                   # s += a[i]


    cmpl $0, %eax
    jne proximo                          # se a[i] != 0, pula o if


    movl %r11d, (%rdi, %r10,4)
    movl $0, %r11d

proximo:
    incl %r10d
    jmp while

saiLoop:
    leave
    ret

    