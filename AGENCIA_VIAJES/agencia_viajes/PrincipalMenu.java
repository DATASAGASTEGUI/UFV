package agencia_viajes;

import java.io.IOException;
import java.sql.*;
import java.util.Scanner;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class PrincipalMenu {

    static Scanner sc = new Scanner(System.in);

    public static void main(String[] args) {
        BaseDatos bd = new BaseDatos("jdbc:mysql",
                "localhost",
                3307,
                "agenciadeviajes",
                "root",
                "12345678");
        Connection conexion = bd.getConexion();
        do {
            cls();
            System.out.println("MENU PRINCIPAL");
            System.out.println("--------------");
            System.out.println("[1] MOSTRAR LOS TURISTAS(ID_TURISTA) POR HOTEL");
            System.out.println("[2] MOSTRAR LOS TURISTAS(NOMBRE, APELLIDOS) POR HOTEL");
            System.out.println("[3] MOSTRAR LA CANTIDAD DE TURISTAS QUE HAN PASADO POR HOTEL");
            System.out.println("[4] MOSTRAR LA CANTIDAD DE TURISTAS QUE VIAJARON EN CADA CLASE");
            System.out.println("[5] MOSTRAR LA CANTIDAD DE TURISTAS QUE DEMANDO CADA REGIMEN DE HOSPEDAJE");
            System.out.println("[6] SALIR");

            System.out.print("INGRESE OPCION? ");
            String opcion = sc.next();

            switch (opcion) {
                case "1":
                    cls();
                    proceso1(conexion);
                    pause();
                    break;
                case "2":
                    cls();
                    proceso2(conexion);
                    pause();
                    break;
                case "3":
                    cls();
                    proceso3(conexion);
                    pause();
                    break;
                case "4":
                    cls();
                    proceso4(conexion);
                    pause();
                    break;
                case "5":
                    cls();
                    proceso5(conexion);
                    pause();
                    break;
                case "6":
                    cls();
                    System.out.println("GRACIAS POR SU VISITA");
                    pause();
                    System.exit(0);
            }
        } while (true);

    }

    public static void proceso1(Connection conexion) {
        System.out.println("[1] MOSTRAR LOS TURISTAS(ID_TURISTA) POR HOTEL");
        System.out.println("----------------------------------------------");
        if (conexion != null) {
            System.out.println("OK: CONEXION");
            String query = "SELECT h.nombre, ht.id_turista\n"
                    + "FROM Hotel h \n"
                    + "JOIN Hotel_x_Turista ht ON h.id_hotel = ht.id_hotel";
            try {
                PreparedStatement ps = conexion.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    String nombre = rs.getString(1);
                    String idTurista = rs.getString(2);
                    System.out.println(nombre + ";" + idTurista);
                }
            } catch (Exception e) {
                System.out.println("ERROR: SELECT");
            }

        } else {
            System.out.println("ERROR: CONEXION");
        }
    }

    public static void proceso2(Connection conexion) {
        System.out.println("[2] MOSTRAR LOS TURISTAS(NOMBRE, APELLIDOS) POR HOTEL");
        System.out.println("-----------------------------------------------------");
        if (conexion != null) {
            System.out.println("OK: CONEXION");
            String query = "SELECT h.nombre, t.nombre, t.apellidos\n"
                    + "FROM Hotel h \n"
                    + "JOIN Hotel_x_Turista ht ON h.id_hotel = ht.id_hotel\n"
                    + "JOIN Turista t ON t.id_turista = ht.id_turista;";
            try {
                PreparedStatement ps = conexion.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    String nombreHotel = rs.getString(1);
                    String nombreTurista = rs.getString(2);
                    String apellidosTurista = rs.getString(3);
                    System.out.println(nombreHotel + ";" + nombreTurista + ";" + apellidosTurista);
                }
            } catch (SQLException ex) {
                System.out.println("ERROR: SELECT");
            }
        } else {
            System.out.println("ERROR: CONEXION");
        }
    }

    public static void proceso3(Connection conexion) {
        System.out.println("[3] MOSTRAR LA CANTIDAD DE TURISTAS QUE HAN PASADO POR HOTEL");
        System.out.println("------------------------------------------------------------");
        if (conexion != null) {
            System.out.println("OK: CONEXION");
            String query = "SELECT h.nombre, COUNT(ht.id_turista) AS CANTIDAD\n"
                    + "FROM Hotel h \n"
                    + "JOIN Hotel_x_Turista ht ON h.id_hotel = ht.id_hotel\n"
                    + "GROUP BY h.nombre;";
            try {
                PreparedStatement ps = conexion.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    String nombreHotel = rs.getString(1);
                    int cantidad = rs.getInt(2);
                    System.out.println(nombreHotel + ";" + cantidad);
                }
            } catch (Exception e) {
                System.out.println("ERROR: SELECT");
            }
        } else {
            System.out.println("ERROR: CONEXION");
        }
    }

    public static void proceso4(Connection conexion) {
        System.out.println("[4] MOSTRAR LA CANTIDAD DE TURISTAS QUE VIAJARON EN CADA CLASE");
        System.out.println("------------------------------------------------------------");
        if (conexion != null) {
            System.out.println("OK: CONEXION");
            String query = "SELECT vt.clase_vuelo, COUNT(vt.id_turista)\n" +
                           "FROM Vuelo v\n" +
                           "INNER JOIN Vuelo_x_Turista vt ON v.numero_vuelo = vt.numero_vuelo\n" +
                           "GROUP BY vt.clase_vuelo;";
            try {
                PreparedStatement ps = conexion.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    String claseVuelo = rs.getString(1);
                    int cantidad = rs.getInt(2);
                    System.out.println(claseVuelo + ";" + cantidad);
                }
            } catch (Exception e) {
                System.out.println("ERROR: SELECT");
            }
        } else {
            System.out.println("ERROR: CONEXION");
        }
    }

    public static void proceso5(Connection conexion) {
        System.out.println("[5] MOSTRAR LA CANTIDAD DE TURISTAS QUE DEMANDO CADA REGIMEN DE HOSPEDAJE");
        System.out.println("-------------------------------------------------------------------------");
        if (conexion != null) {
            System.out.println("OK: CONEXION");
            String query = "SELECT regimen_hospedaje, COUNT(id_turista)\n" +
                           "FROM Hotel_x_Turista\n" +
                           "GROUP BY regimen_hospedaje;";
            try {
                PreparedStatement ps = conexion.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    String regimen = rs.getString(1);
                    int cantidad = rs.getInt(2);
                    System.out.println(regimen + ";" + cantidad);
                }
            } catch (Exception e) {
                System.out.println("ERROR: SELECT");
            }
        } else {
            System.out.println("ERROR: CONEXION");
        }
    }

    public static void pause() {
        try {
            System.out.print("\nPresiona una tecla para continuar...");
            System.in.read();
        } catch (IOException e) {
        }
    }

    public static void cls() {
        System.out.print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
    }

}
