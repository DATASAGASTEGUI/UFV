//INGRESAR NUMEROS ENTEROS HASTA QUE QUE SEA CERO

#include <stdio.h>

int main() {
    float numero;
    float mayor = -9999999;
    do {
        printf("Ingresar número entero? ");
        scanf("%f", &numero);
        if(numero > mayor) {
            mayor = numero;
        }
    } while(numero != 0);
    printf("Mayor: %.2f", mayor);
    return 0;
}
