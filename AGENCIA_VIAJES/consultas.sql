-- MOSTRAR LOS TURISTAS(ID_TURISTA) POR HOTEL

SELECT h.nombre, ht.id_turista
FROM Hotel h 
JOIN Hotel_x_Turista ht ON h.id_hotel = ht.id_hotel

-- MOSTRAR LOS TURISTAS(NOMBRE, APELLIDOS) POR HOTEL

SELECT h.nombre, t.nombre, t.apellidos
FROM Hotel h 
JOIN Hotel_x_Turista ht ON h.id_hotel = ht.id_hotel
JOIN Turista t ON t.id_turista = ht.id_turista;

-- MOSTRAR LA CANTIDAD DE TURISTAS QUE HAN PASADO POR HOTEL

SELECT h.nombre, COUNT(ht.id_turista) AS CANTIDAD
FROM Hotel h 
JOIN Hotel_x_Turista ht ON h.id_hotel = ht.id_hotel
GROUP BY h.nombre;

--  MOSTRAR LA CANTIDAD DE TURISTAS QUE VIAJARON EN CADA CLASE.

SELECT vt.clase_vuelo, COUNT(vt.id_turista)
FROM Vuelo v
INNER JOIN Vuelo_x_Turista vt ON v.numero_vuelo = vt.numero_vuelo
GROUP BY vt.clase_vuelo;

-- MOSTRAR LA CANTIDAD DE TURISTAS QUE DEMANDO CADA REGIMEN DE HOSPEDAJE.

SELECT regimen_hospedaje, COUNT(id_turista)
FROM Hotel_x_Turista
GROUP BY regimen_hospedaje;




