-- MOSTRAR LOS LIBROS POR CADA TEMATICA

MATEMATICA    TITULO_LIBRO

SELECT t.descripcion, l.titulo
FROM Tematica t
JOIN Libro l ON t.id_tematica = l.id_tematica;

+------------------+------------------------------------+
| descripcion      | titulo                             |
+------------------+------------------------------------+
| Ciencia Ficción  | 1984                               |
| Ciencia Ficción  | Ready Player One                   |
| Misterio         | El código Da Vinci                 |
| Misterio         | Asesinato en el Orient Express     |
| Romance          | Orgullo y prejuicio                |
| Romance          | Bajo la misma estrella             |
| Romance          | Cincuenta sombras de Grey          |
| Fantasía         | Harry Potter y la piedra filosofal |
| Fantasía         | El nombre del viento               |
+------------------+------------------------------------+

-- MOSTRAR LA CANTIDAD DE LIBROS POR CADA TEMATICA

SELECT t.descripcion, COUNT(l.titulo) AS CANTIDAD
FROM Tematica t
JOIN Libro l ON t.id_tematica = l.id_tematica
GROUP BY t.descripcion;

+------------------+----------+
| descripcion      | CANTIDAD |
+------------------+----------+
| Ciencia Ficción  |        2 |
| Misterio         |        2 |
| Romance          |        3 |
| Fantasía         |        2 |
+------------------+----------+

-- MOSTRAR LA CATEGORIA CON LA MAYOR CANTIDAD DE LIBROS 

(1)

SELECT t.descripcion, COUNT(l.titulo) AS CANTIDAD
FROM Tematica t
JOIN Libro l ON t.id_tematica = l.id_tematica
GROUP BY t.descripcion
ORDER BY CANTIDAD DESC
LIMIT 1;

+-------------+----------+
| descripcion | CANTIDAD |
+-------------+----------+
| Romance     |        3 |
+-------------+----------+

(2) SUBCONSULTA   (OPTIMA)

SELECT t.descripcion, COUNT(l.titulo) AS CANTIDAD
FROM Tematica t
JOIN Libro l ON t.id_tematica = l.id_tematica
GROUP BY t.descripcion
HAVING CANTIDAD = (SELECT COUNT(l.titulo) AS CANTIDAD
FROM Tematica t
JOIN Libro l ON t.id_tematica = l.id_tematica
GROUP BY t.descripcion
ORDER BY CANTIDAD DESC
LIMIT 1)
ORDER BY CANTIDAD DESC
LIMIT 1;

-- MOSTRAR TODOS LOS PRESTAMOS POSTERIORES AL 9 DE MARZO DEL 2024

SELECT numero_transaccion, fecha_inicio_prestamo
FROM Libro_x_Lector
WHERE STR_TO_DATE(fecha_inicio_prestamo, '%Y-%m-%d') > '2024-03-09';

+--------------------+-----------------------+
| numero_transaccion | fecha_inicio_prestamo |
+--------------------+-----------------------+
| T006               | 2024-03-11            |
| T007               | 2024-03-13            |
| T008               | 2024-03-15            |
| T009               | 2024-03-17            |
| T010               | 2024-03-19            |
| T011               | 2024-03-21            |
| T012               | 2024-03-23            |
+--------------------+-----------------------+

-- MOSTRAR EL NUMERO DE TRANSACCIONES TOTALES DEL AÑO 2024

SELECT COUNT(numero_transaccion)
FROM Libro_x_Lector
WHERE YEAR(STR_TO_DATE(fecha_inicio_prestamo, '%Y-%m-%d')) = 2024;

-- MOSTRAR LA CANTIDAD DE LIBROS

SELECT COUNT(*)
FROM Libro;

-- MOSTRAR LOS NOMBRES DE LOS LECTORES QUE HAN PRESTADO EL LIBRO 1

SELECT ll.id_libro, ll.id_lector, l.nombres_apellidos
FROM Libro_x_Lector ll, Lector l
WHERE ll.id_libro = 'L001' AND l.id_lector = ll.id_lector;

+----------+-----------+-------------------+
| id_libro | id_lector | nombres_apellidos |
+----------+-----------+-------------------+
| L001     | R001      | Carlos Pérez      |
| L001     | R005      | Ana Rodríguez     |
| L001     | R009      | Sofía Pérez       |
+----------+-----------+-------------------+

-- MOSTRAR LOS TITULOS DE LOS LIBROS PRESTADOS POR EL LECTOR R001

-- me muestra el id de los libros prestados por el lector r001
SELECT l.id_libro, l.titulo
FROM Libro_x_Lector ll, Libro l
WHERE ll.id_lector = 'R001' AND l.id_libro = ll.id_libro;

+----------+--------+
| id_libro | titulo |
+----------+--------+
| L001     | 1984   |
+----------+--------+

-- MOSTRAR EL LIBRO MAS PRESTADO

-- (1) CONTAR POR CADA LA CANTIDAD DE VECES QUE SE PRESTO

SELECT id_libro, COUNT(id_lector)
FROM LIBRO_X_LECTOR
GROUP BY id_libro;

SUBCONSULTA
-----------
SELECT COUNT(id_lector)  AS CANTIDAD
FROM LIBRO_X_LECTOR
GROUP BY id_libro
ORDER BY CANTIDAD DESC
LIMIT 1;

SELECT id_libro, COUNT(id_lector) AS CANTIDAD
FROM LIBRO_X_LECTOR
GROUP BY id_libro
HAVING CANTIDAD = (SELECT COUNT(id_lector)  AS CANTIDAD
FROM LIBRO_X_LECTOR
GROUP BY id_libro
ORDER BY CANTIDAD DESC
LIMIT 1);

+----------+----------+
| id_libro | CANTIDAD |
+----------+----------+
| L001     |        3 |
| L002     |        3 |
| L003     |        3 |
| L004     |        3 |
+----------+----------+

-- MOSTRAR EL LIBRO CON EL MAYOR PRECIO

-- 14.99 MAYOR PRECIO (SUBCONSULTA)
SELECT MAX(precio)
FROM Libro;

--

SELECT id_libro, titulo, precio
FROM LIBRO
WHERE precio = (SELECT MAX(precio)
FROM Libro);














