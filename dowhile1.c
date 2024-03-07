/*
INGRESAR NUMEROS ENTEROS HASTA QUE QUE SEA CERO.
MOSTRAR EL MAYOR DE LOS NUMEROS INGRESADOS
*/

#include <stdio.h>

int main() {
    float numero;
    float mayor;
    int i = 1;
    do {
        printf("Ingresar número entero? ");
        scanf("%f", &numero);
        if(i == 1) {
            mayor = numero;
            i++;
        }
        if(numero > mayor) {
            mayor = numero;
        }
    } while(numero != 0);
    printf("Mayor: %.2f", mayor);
    return 0;
}
