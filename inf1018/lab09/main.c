#include <stdio.h>

int add(int a, int b, int c);
int fat(int a);
void foo(int a[], int n);

void imprime(int a[], int n) {
    for (int i = 0; i < n; i++) {
        printf("%d ", a[i]);
    }
    printf("\n");
}

int main(void) {
    printf("%d\n", add(1, 2, 3));
    printf("%d\n", fat(5));

    int a[] = {3, 2, 0, 5, 0, 1};
    int n = 6;

    printf("antes:  ");
    imprime(a, n);

    foo(a, n);

    printf("depois: ");
    imprime(a, n);

    return 0;
}