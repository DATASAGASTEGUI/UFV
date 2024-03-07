package algoritmo;

import java.util.Scanner;

public class Ejercicio20 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int numero, aleatorio;
        aleatorio = (int) (Math.random() * 1001);    // [0,1000]  500
        System.out.println("Aleatorio: " + aleatorio);
        System.out.print("Adivina mi número? ");
        numero = sc.nextInt(); // 100
        while (true) {
            if (aleatorio > numero) {
                System.out.println("Mayor");
                System.out.print("Adivina mi número? ");
                numero = sc.nextInt();
            } else if (aleatorio < numero) {
                System.out.println("Menor");
                System.out.print("Adivina mi número? ");
                numero = sc.nextInt();
            } else if (aleatorio == numero) {
                System.out.println("Acertado");
                break;
            }
        }

    }

}
