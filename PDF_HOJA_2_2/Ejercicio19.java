package algoritmo;

import java.util.Scanner;

public class Ejercicio19 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int cantidad, articulo;
        double valor=0, venta, pago;
        int fijosemanal = 200;
        System.out.print("Cantidad de artículos vendidos? ");
        cantidad = sc.nextInt();
        
        System.out.print("Ingrese el número del artículo? ");
        articulo = sc.nextInt();
        
        switch(articulo) {
            case 1: valor = 239.99; break;
            case 2: valor = 129.75; break;
            case 3: valor = 99.95; break;
            case 4: valor = 350.89; break;
        }
        
        venta = cantidad * valor;
        pago = fijosemanal + 0.09*venta;
        System.out.println("Pago: " + pago);
    }
}
