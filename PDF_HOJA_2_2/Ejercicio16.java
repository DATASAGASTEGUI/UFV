package algoritmo;

import java.util.Scanner;

public class Ejercicio16 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n;
        
        System.out.print("Ingrese el ancho de la base del triangulo? ");
        n = sc.nextInt();
        
        for(int i=1; i<=n; i++) {
            for(int j=1; j<=i; j++) {
                System.out.print("*");
            }
            System.out.println();
        }
    }

}
