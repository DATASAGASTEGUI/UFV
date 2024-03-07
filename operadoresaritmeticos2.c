#include <stdio.h>

int main() {
    // INVERTIR UN NUMERO ENTEROS DE DOS DIGITOS
    int numero, resto, cociente, invertido;

    while(1) {
        printf("\nIngrese un número entero de dos dígitos? ");
        scanf("%d", &numero);

        resto = numero % 10;
        cociente = numero / 10;

        invertido = 10 * resto + cociente;

        printf("Original : %d\n", numero);
        printf("Invertido: %d", invertido);
    }

    return 0;
}
