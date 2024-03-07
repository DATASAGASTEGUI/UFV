#include <stdio.h>

float importetotal(float a, float b, float c)
{
    float s;
    if (a >= b && b >= c)
    {
        s = a + b;
    }
    if (a >= c && c >= b)
    {
        s = a + c;
    }
    if (b >= a && a >= c)
    {
        s = b + a;
    }
    if (b >= c && c >= a)
    {
        s = b + c;
    }
    if (c > a && a > b)
    {
        s = c + a;
    }
    if (c >= b && b >= a)
    {
        s = c + b;
    }
    return s;
}

int main()
{
    float a, b, c, s;

    // ENTRADA
    printf("Ingresar el importe del 1er Artículo? ");
    scanf("%f", &a);

    printf("Ingresar el importe del 2do Artículo? ");
    scanf("%f", &b);

    printf("Ingresar el importe del 3ro Artículo? ");
    scanf("%f", &c);
    // PROCESO
    s = importetotal(a, b, c);
    // SALIDA
    printf("PAGO: %.2f", s);
    return 0;
}