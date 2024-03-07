#include <stdio.h>

int main() {
    int mes, year, dias;

    printf("Ingrese el número de mes? ");
    scanf("%d", &mes);
    printf("Ingrese el año? ");
    scanf("%d", &year);

    switch(mes) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            dias = 31; break;
        case 4: case 6: case 9: case 11:
            dias = 30; break;
        case 2:
            if((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
               dias = 29;
            }else {
               dias = 28;
            }
            break;
        default:
            printf("NUMERO DE MES INCORRECTO");
    }
    printf("Días: %d", dias);
    return 0;
}
