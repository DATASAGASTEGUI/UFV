package algoritmo;

import java.util.Scanner;

public class Ejercicio18 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n;

        System.out.print("Ingrese un número entero? ");
        n = sc.nextInt();

        for (int i = 1, j = n; i <= n; i++, j--) {
            for (int p = 1; p <= j; p++) {
                System.out.print(" ");
            }
            for (int q = 1; q <= i; q++) {
                System.out.print(q);
            }
            for (int r = i - 1; r >= 1; r--) {
                System.out.print(r);
            }
            System.out.println();
        }
    }

}

/*
i  j
1  4
2  3
3  2
4  1


 */
