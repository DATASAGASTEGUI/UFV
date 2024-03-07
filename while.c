/*
INGRESAR NUMEROS ENTEROS HASTA QUE QUE SEA CERO.
MOSTRAR EL MAYOR DE LOS NUMEROS INGRESADOS
*/

#include <stdio.h>

int main() {
    float numero;
    float mayor = -9999999;
    printf("Ingresar número entero? ");
    scanf("%f", &numero);
    while(numero != 0) { //FALSO TERMINO
        if(numero > mayor) {
            mayor = numero;
        }
        printf("Ingresar número entero? ");
        scanf("%f", &numero);
    }
    printf("Mayor: %.2f", mayor);
    return 0;
}
