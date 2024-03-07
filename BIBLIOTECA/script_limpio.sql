-- -----------------------------------------------------
-- Schema BIBLIOTECA
-- -----------------------------------------------------
DROP DATABASE IF EXISTS BIBLIOTECA;
CREATE DATABASE IF NOT EXISTS BIBLIOTECA;
USE BIBLIOTECA;
-- -----------------------------------------------------
-- Table Tematica
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tematica (
  id_tematica VARCHAR(4)  NOT NULL,
  descripcion VARCHAR(45) NOT NULL,
              PRIMARY KEY (id_tematica)
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table Libro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Libro (
  id_libro           VARCHAR(4)  NOT NULL,
  iban               VARCHAR(45) NOT NULL,
  titulo             VARCHAR(45) NOT NULL,
  editorial          VARCHAR(45) NOT NULL,
  numero_paginas     INT         NOT NULL,
  fecha_publicacion  CHAR(10)    NOT NULL,
  precio             DOUBLE      NOT NULL,
  id_tematica         VARCHAR(4)  NOT NULL,
                     PRIMARY KEY (id_libro),
                     FOREIGN KEY (d_tematica) REFERENCES Tematica (id_tematica)
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table Autor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Autor (
  id_autor          VARCHAR(4)  NOT NULL,
  nombres_apellidos VARCHAR(45) NOT NULL,
  fecha_nacimiento  CHAR(10)    NOT NULL,
                    PRIMARY KEY (id_autor)
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table autor_x_libro
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS autor_x_libro (
  id_libro VARCHAR(4) NOT NULL,
  id_autor VARCHAR(4) NOT NULL,
           PRIMARY KEY (id_libro, id_autor),
           FOREIGN KEY (id_libro) REFERENCES Libro (id_libro),
		   FOREIGN KEY (id_autor) REFERENCES Autor (id_autor)
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table Lector
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Lector (
  id_lector         VARCHAR(4)  NOT NULL,
  nombres_apellidos VARCHAR(45) NOT NULL,
  telefono          CHAR(9)     NOT NULL,
  direccion         VARCHAR(45) NOT NULL,
  dni               CHAR(9)     NOT NULL,
                    PRIMARY KEY (id_lector)
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table libro_x_lector
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS libro_x_lector (
  numero_transaccion    VARCHAR(45) NOT NULL,
  id_libro              VARCHAR(4)  NOT NULL,
  id_lector             VARCHAR(4)  NOT NULL,
  fecha_inicio_prestamo CHAR(10)    NOT NULL, -- DATE
  fecha_fin_prestamo    CHAR(10)    NOT NULL,
                        PRIMARY KEY (numero_transaccion),
						FOREIGN KEY (id_libro) REFERENCES BIBLIOTECA.Libro (id_libro),
						FOREIGN KEY (id_lector) REFERENCES BIBLIOTECA.Lector (id_lector)
) ENGINE = InnoDB;


INSERT INTO Tematica (id_tematica, descripcion) VALUES
('T001', 'Ciencia Ficción'),
('T002', 'Misterio'),
('T003', 'Romance'),
('T004', 'Fantasía');

INSERT INTO Libro (id_libro, iban, titulo, editorial, numero_paginas, fecha_publicacion, precio, d_tematica) VALUES
('L001', '978-0141439579', '1984', 'Penguin Books', 328, '1949-06-08', 10.99, 'T001'),
('L002', '978-0060850524', 'El código Da Vinci', 'Vintage Español', 592, '2003-03-18', 13.99, 'T002'),
('L003', '978-1538718467', 'Orgullo y prejuicio', 'Grand Central Publishing', 279, '1813-01-28', 8.99, 'T003'),
('L004', '978-0545790352', 'Harry Potter y la piedra filosofal', 'Scholastic', 336, '1997-06-26', 12.99, 'T004'),
('L005', '978-1982116455', 'Ready Player One', 'Broadway Books', 384, '2011-08-16', 11.99, 'T001'), -- Ciencia Ficción
('L006', '978-8415139205', 'El nombre del viento', 'Plaza & Janés', 904, '2007-03-27', 14.99, 'T004'), -- Fantasía
('L007', '978-0307743657', 'Asesinato en el Orient Express', 'HarperCollins', 288, '1934-01-01', 9.99, 'T002'), -- Misterio
('L008', '978-1538731336', 'Bajo la misma estrella', 'Dutton Books', 313, '2012-01-10', 10.99, 'T003'), -- Romance
('L009', '978-1401322786', 'Cincuenta sombras de Grey', 'Vintage Books', 528, '2011-05-25', 12.99, 'T003'); -- Romance

INSERT INTO Autor (id_autor, nombres_apellidos, fecha_nacimiento) VALUES
('A001', 'George Orwell', '1903-06-25'),
('A002', 'Dan Brown', '1964-06-22'),
('A003', 'Jane Austen', '1775-12-16'),
('A004', 'J.K. Rowling', '1965-07-31'),
('A005', 'Ernest Cline', '1972-03-29'), -- Ernest Cline para Ready Player One (Ciencia Ficción)
('A006', 'Patrick Rothfuss', '1973-06-06'), -- Patrick Rothfuss para El nombre del viento (Fantasía)
('A007', 'Agatha Christie', '1890-09-15'), -- Agatha Christie para Asesinato en el Orient Express (Misterio)
('A008', 'John Green', '1977-08-24'), -- John Green para Bajo la misma estrella (Romance)
('A009', 'E.L. James', '1963-03-07'); -- E.L. James para Cincuenta sombras de Grey (Romance)

INSERT INTO autor_x_libro (id_libro, id_autor) VALUES
('L001', 'A001'),
('L002', 'A002'),
('L003', 'A003'),
('L004', 'A004'),
('L005', 'A005'), -- Ready Player One (Ciencia Ficción)
('L006', 'A006'), -- El nombre del viento (Fantasía)
('L007', 'A007'), -- Asesinato en el Orient Express (Misterio)
('L008', 'A008'), -- Bajo la misma estrella (Romance)
('L009', 'A009'); -- Cincuenta sombras de Grey (Romance)

INSERT INTO Lector (id_lector, nombres_apellidos, telefono, direccion, dni) VALUES
('R001', 'Carlos Pérez', '123456789', 'Calle Principal 123', '123456789'),
('R002', 'María López', '987654321', 'Avenida Central 456', '987654321'),
('R003', 'Laura Martínez', '111222333', 'Calle del Sol 456', '111222333'),
('R004', 'Juan García', '444555666', 'Avenida Libertad 789', '444555666'),
('R005', 'Ana Rodríguez', '777888999', 'Calle de la Luna 123', '777888999'),
('R006', 'Pedro Sánchez', '123987654', 'Avenida Independencia 456', '123987654'),
('R007', 'Elena López', '321654987', 'Calle Mayor 789', '321654987'),
('R008', 'Miguel Fernández', '987123654', 'Avenida del Bosque 123', '987123654'),
('R009', 'Sofía Pérez', '654321987', 'Calle del Mar 456', '654321987'),
('R010', 'Diego Martín', '321789654', 'Avenida del Río 789', '321789654'),
('R011', 'Isabella Gómez', '999888777', 'Calle de la Montaña 123', '999888777'),
('R012', 'Manuel García', '777666555', 'Avenida de la Playa 456', '777666555');

INSERT INTO libro_x_lector (numero_transaccion, id_libro, id_lector, fecha_inicio_prestamo, fecha_fin_prestamo) VALUES
('T001', 'L001', 'R001', '2024-03-01', '2024-03-15'),
('T002', 'L002', 'R002', '2024-03-03', '2024-03-17'),
('T003', 'L003', 'R003', '2024-03-05', '2024-03-20'),
('T004', 'L004', 'R004', '2024-03-07', '2024-03-22'),
('T005', 'L001', 'R005', '2024-03-09', '2024-03-24'),
('T006', 'L002', 'R006', '2024-03-11', '2024-03-26'),
('T007', 'L003', 'R007', '2024-03-13', '2024-03-28'),
('T008', 'L004', 'R008', '2024-03-15', '2024-03-30'),
('T009', 'L001', 'R009', '2024-03-17', '2024-04-01'),
('T010', 'L002', 'R010', '2024-03-19', '2024-04-03'),
('T011', 'L003', 'R011', '2024-03-21', '2024-04-05'),
('T012', 'L004', 'R012', '2024-03-23', '2024-04-07');