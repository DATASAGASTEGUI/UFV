#include <stdio.h>

int main() {
    float a,b,c,r,m;
    float a1,b1,c1;
    float d; //discriminante
    float x1,x2;
    //ENTRADA
    printf("Ingresar a? ");
    scanf("%f", &a); //5
    printf("Ingresar b? ");
    scanf("%f", &b); //4
    printf("Ingresar c? ");
    scanf("%f", &c); //0   //3 imaginario no se cortan
    printf("Ingresar r? ");
    scanf("%f", &r); //2
    printf("Ingresar m? ");
    scanf("%f", &m); //1
    //PROCESO
    a1 = 1+pow(m,2);
    b1 = 2*m*c-2*a-2*m*b;
    c1 = pow(a,2) + pow(b,2) + pow(c,2) - 2*b*c - pow(r,2);

    d = pow(b,2) - 4*a*c;
    if(d < 0) {
       printf("Dos raíces imaginarias: La recta y la circunferencia no se cortan");
    }else {
       if(d == 0)     {
           printf("Una raíz doble. La recta es tangente a la circunferencia en un punto.");
           x1 = -b1/(2*a1);
           x2 = -b1/(2*a1);
           printf("%.2f", x1);
       }else {
           printf("Dos raíces reales distintas: La recta es secante −corta− a la circunferencia.");
           x1 = (-b1 + pow(d,0.5))/(2*a);
           x2 = (-b1 - pow(d,0.5))/(2*a);
           printf("%.2f    %.2f", x1, x2);
       }
    }

    return 0;
}
