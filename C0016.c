#include <stdio.h>

int cuadradonumero1(int x) {
    int y = x * x;
    return y;
}

float cuadradonumero2(float x) {
    return x * x;
}


int main()
{
    int x1,y1;
    float x2,y2;
    printf("Ingrese el valor ENTERO para x1? ");
    scanf("%d", &x1);
    y1 = cuadradonumero1(x1);
    
    printf("Ingrese el valor FLOAT para x2? ");
    scanf("%f", &x2);
    y2 = cuadradonumero2(x2);
    
    printf("Cuadrado ENTERO: %d\n", (x1 * x1));
    printf("Cuadrado FLOAT : %.2f\n", (x2 * x2));
    
    return 0;
    
}