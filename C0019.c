#include <stdio.h>

int main()
{
    float a, b, c, d, promedio;
    // ENTRADA
    while (1)
    {
        printf("Ingrese prueba 1? ");
        scanf("%f", &a);
        printf("Ingrese prueba 2? ");
        scanf("%f", &b);
        printf("Ingrese prueba 3? ");
        scanf("%f", &c);
        printf("Ingrese prueba 4? ");
        scanf("%f", &d);
        if (a >= 0 && b >= 0 && c >= 0 && d >= 0 && a <= 10 && b <= 10 && c <= 10 && d <= 10)
        {
            break;
        }
    }
    // PROCESO
    promedio = 0.20 * a + 0.20 * b + 0.20 * c + 0.40 * d;
    if (promedio >= 5)
    {
        printf("Aprobado con %.2f", promedio);
    }
    else
    {
        printf("Desaprobado con %.2f", promedio);
    }

    return 0;
}