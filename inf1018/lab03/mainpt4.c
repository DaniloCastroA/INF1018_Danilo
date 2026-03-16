#include <stdio.h>
unsigned char rotate_left(unsigned char x, int n){
    unsigned char a,b;
    a=x>>(8-n);
    b=x<<n;

    return a|b;
}


int main(){
    unsigned char x = 0x61;
    printf("\n%x\n",rotate_left(x,7));
    return 0;
}