#include <stdio.h>

int main() {
    // INVERTIR UN NUMERO ENTEROS DE DOS DIGITOS
    int numero, resto, cociente, invertido;
    char letra;
    do {
        printf("\nIngrese un n�mero entero de dos d�gitos? ");
        scanf("%d", &numero);

        resto = numero % 10;
        cociente = numero / 10;

        invertido = 10 * resto + cociente;

        printf("Original : %d\n", numero);
        printf("Invertido: %d", invertido);

        printf("\nDesea continuar presione S? ");
        scanf(" %c",&letra);

    }while(letra == 'S');

    return 0;
}
