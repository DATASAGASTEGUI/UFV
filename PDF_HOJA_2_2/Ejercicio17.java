package algoritmo;

import java.util.Scanner;

public class Ejercicio17 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n;
        
        System.out.print("Ingrese el número de asteriscos? ");
        n = sc.nextInt();  
        
        for(int i=1; i<=n; i++) {
            if(i % 2 == 0) {
               System.out.print(" ");
               for(int j=1; j<=n; j++) {
                   System.out.print("*");
               }
            }else {
               for(int j=1; j<=n; j++) {
                   System.out.print("*");
               }  
            }
            System.out.println();
        }
    }
    
}
