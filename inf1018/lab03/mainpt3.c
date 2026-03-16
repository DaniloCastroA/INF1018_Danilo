#include <stdio.h>
unsigned char switch_byte(unsigned char x){
    unsigned char sup=x>>4;
    unsigned char sup2=x<<4;
    return sup|sup2;
}


int main(){
    unsigned char x = 0xAB;
    printf("\n%x\n",switch_byte(x));
    return 0;
}