-- -----------------------------------------------------
-- Schema AgenciaDeViajes
-- -----------------------------------------------------
DROP DATABASE IF EXISTS AgenciaDeViajes;
CREATE DATABASE IF NOT EXISTS AgenciaDeviajes;
USE AgenciaDeViajes;

-- -----------------------------------------------------
-- Table AgenciaDeViajes.Sucursal
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS AgenciaDeViajes.Sucursal (
  id_sucursal CHAR(4)     NOT NULL,
  direccion   VARCHAR(45) NOT NULL,
  telefono    CHAR(9)     NOT NULL,
              PRIMARY KEY (id_sucursal)
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table AgenciaDeViajes.Turista
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS AgenciaDeViajes.Turista (
  id_turista CHAR(4)     NOT NULL,
  nombre     VARCHAR(20) NOT NULL,
  apellidos  VARCHAR(45) NOT NULL,
  direccion  VARCHAR(45) NOT NULL,
  telefono   CHAR(9)     NOT NULL,
             PRIMARY KEY (id_turista)
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table AgenciaDeViajes.Sucursal_x_Turista
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS AgenciaDeViajes.Sucursal_x_Turista (
  d_sucursal     CHAR(4)  NOT NULL,
  id_turista     CHAR(4)  NOT NULL,
  fecha_contrato CHAR(10) NOT NULL,
                 PRIMARY KEY (d_sucursal, id_turista),
				 FOREIGN KEY (d_sucursal) REFERENCES AgenciaDeViajes.Sucursal (id_sucursal),
				 FOREIGN KEY (id_turista) REFERENCES AgenciaDeViajes.Turista (id_turista)
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table AgenciaDeViajes.Vuelo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS AgenciaDeViajes.Vuelo (
  numero_vuelo    VARCHAR(20) NOT NULL,
  fecha_origen    CHAR(10)    NOT NULL,
  hora_origen     CHAR(8)     NOT NULL,
  fecha_destino   CHAR(10)    NOT NULL,
  hora_destino    CHAR(8)     NOT NULL,
  plazas_totales  INT         NOT NULL,
  plazas_turistas INT         NOT NULL,
                  PRIMARY KEY (numero_vuelo)
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table AgenciaDeViajes.Vuelo_x_Turista
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS AgenciaDeViajes.Vuelo_x_Turista (
  id_turista   CHAR(4)     NOT NULL,
  numero_vuelo VARCHAR(20) NOT NULL,
  clase_vuelo  VARCHAR(20) NOT NULL,
               PRIMARY KEY (id_turista, numero_vuelo),
               FOREIGN KEY (id_turista) REFERENCES AgenciaDeViajes.Turista (id_turista),
			   FOREIGN KEY (numero_vuelo) REFERENCES AgenciaDeViajes.Vuelo (numero_vuelo)
) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table AgenciaDeViajes.Hotel
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS AgenciaDeViajes.Hotel (
  id_hotel CHAR(4) NOT NULL,
  nombre    VARCHAR(45) NOT NULL,
  direccion VARCHAR(45) NOT NULL,
  ciudad    VARCHAR(30) NOT NULL,
  telefono  CHAR(9)     NOT NULL,
  plazas    INT         NOT NULL,
            PRIMARY KEY (id_hotel)
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table AgenciaDeViajes.Hotel_x_Turista
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS AgenciaDeViajes.Hotel_x_Turista (
  id_hotel          CHAR(4)     NOT NULL,
  id_turista        CHAR(4)     NOT NULL,
  regimen_hospedaje VARCHAR(50) NOT NULL,
  fecha_llegada     CHAR(10)    NOT NULL,
  fecha_partida     CHAR(10)    NOT NULL,
                    PRIMARY KEY (id_hotel, id_turista),
					FOREIGN KEY (id_hotel) REFERENCES AgenciaDeViajes.Hotel (id_hotel),
					FOREIGN KEY (id_turista) REFERENCES AgenciaDeViajes.Turista (id_turista)
) ENGINE = InnoDB;

INSERT INTO Sucursal (id_sucursal, direccion, telefono) VALUES
('S001', 'Calle 123, Ciudad A', '123456789'),
('S002', 'Avenida XYZ, Ciudad B', '987654321');

INSERT INTO Turista (id_turista, nombre, apellidos, direccion, telefono) VALUES
('T001', 'Juan', 'Pérez García', 'Calle 456, Ciudad C', '111222333'),
('T002', 'María', 'López Martínez', 'Avenida ABC, Ciudad D', '444555666'),
('T003', 'Luis', 'González Pérez', 'Avenida Norte, Ciudad L', '555666777'),
('T004', 'Ana', 'Martínez López', 'Calle Este, Ciudad M', '999000111'),
('T005', 'Carlos', 'Fernández García', 'Avenida Sur, Ciudad N', '333444555'),
('T006', 'Sofía', 'Rodríguez Martín', 'Calle Oeste, Ciudad O', '666777888'),
('T007', 'Pedro', 'Sánchez Gómez', 'Avenida Central, Ciudad P', '111222333'),
('T008', 'Elena', 'Pérez Hernández', 'Calle Este, Ciudad Q', '444555666'),
('T009', 'Pablo', 'García Rodríguez', 'Avenida Norte, Ciudad R', '777888999'),
('T010', 'Laura', 'Martínez Sánchez', 'Calle Sur, Ciudad S', '222333444'),
('T011', 'Alejandro', 'Hernández Pérez', 'Avenida Este, Ciudad T', '888999000'),
('T012', 'Lucía', 'Gómez Rodríguez', 'Calle Oeste, Ciudad U', '333444555'),
('T013', 'Martín', 'Sánchez Martínez', 'Avenida Central, Ciudad V', '666777888'),
('T014', 'Carmen', 'Hernández López', 'Calle Norte, Ciudad W', '111222333'),
('T015', 'Marcela', 'García Pérez', 'Avenida Oeste, Ciudad X', '444555666'),
('T016', 'Javier', 'López Rodríguez', 'Calle Sur, Ciudad Y', '777888999'),
('T017', 'Sara', 'Pérez Martínez', 'Avenida Este, Ciudad Z', '222333444'),
('T018', 'Daniel', 'Rodríguez Gómez', 'Calle Norte, Ciudad A1', '888999000'),
('T019', 'Marta', 'Sánchez Hernández', 'Avenida Oeste, Ciudad B1', '333444555'),
('T020', 'Lucas', 'Martínez García', 'Calle Este, Ciudad C1', '666777888');

INSERT INTO Vuelo (numero_vuelo, fecha_origen, hora_origen, fecha_destino, hora_destino, plazas_totales, plazas_turistas) VALUES
('V001', '2022-03-10', '08:00:00', '2022-03-10', '10:00:00', 200, 150),
('V002', '2022-04-15', '12:00:00', '2022-04-15', '14:00:00', 250, 200);

INSERT INTO Hotel (id_hotel, nombre, direccion, ciudad, telefono, plazas) VALUES
('H001', 'Hotel A', 'Calle Principal, Ciudad E', 'Ciudad E', '777888999', 100),
('H002', 'Hotel B', 'Avenida Central, Ciudad F', 'Ciudad F', '111222333', 150),
('H003', 'Hotel C', 'Calle Secundaria, Ciudad G', 'Ciudad G', '444555666', 120),
('H004', 'Hotel D', 'Avenida Secundaria, Ciudad H', 'Ciudad H', '777888999', 180),
('H005', 'Hotel E', 'Calle Principal, Ciudad I', 'Ciudad I', '111222333', 90),
('H006', 'Hotel F', 'Avenida Central, Ciudad J', 'Ciudad J', '888999000', 200),
('H007', 'Hotel G', 'Calle Central, Ciudad K', 'Ciudad K', '222333444', 150);

INSERT INTO Sucursal_x_Turista (d_sucursal, id_turista, fecha_contrato) VALUES
('S001', 'T001', '2022-01-15'),
('S002', 'T002', '2022-02-20'),
('S001', 'T003', '2022-03-20'),
('S002', 'T004', '2022-04-05'),
('S001', 'T005', '2022-05-10'),
('S002', 'T006', '2022-06-15'),
('S001', 'T007', '2022-07-20');

INSERT INTO Vuelo_x_Turista (id_turista, numero_vuelo, clase_vuelo) VALUES
('T001', 'V001', 'Primera Clase'),
('T002', 'V002', 'Clase Económica');

INSERT INTO Vuelo_x_Turista (id_turista, numero_vuelo, clase_vuelo) VALUES ('T001', 'V002', 'Primera Clase');

-- Turista T002
INSERT INTO Vuelo_x_Turista (id_turista, numero_vuelo, clase_vuelo) VALUES ('T002', 'V001', 'Clase Económica');

-- Turista T003
INSERT INTO Vuelo_x_Turista (id_turista, numero_vuelo, clase_vuelo) VALUES ('T003', 'V001', 'Clase Económica');

-- Turista T004
INSERT INTO Vuelo_x_Turista (id_turista, numero_vuelo, clase_vuelo) VALUES ('T004', 'V002', 'Primera Clase');

-- Turista T005
INSERT INTO Vuelo_x_Turista (id_turista, numero_vuelo, clase_vuelo) VALUES ('T005', 'V001', 'Clase Económica');

-- Turista T006
INSERT INTO Vuelo_x_Turista (id_turista, numero_vuelo, clase_vuelo) VALUES ('T006', 'V002', 'Primera Clase');

-- Turista T007
INSERT INTO Vuelo_x_Turista (id_turista, numero_vuelo, clase_vuelo) VALUES ('T007', 'V001', 'Clase Económica');

-- Turista T008
INSERT INTO Vuelo_x_Turista (id_turista, numero_vuelo, clase_vuelo) VALUES ('T008', 'V002', 'Primera Clase');

-- Turista T009
INSERT INTO Vuelo_x_Turista (id_turista, numero_vuelo, clase_vuelo) VALUES ('T009', 'V001', 'Clase Económica');

-- Turista T010
INSERT INTO Vuelo_x_Turista (id_turista, numero_vuelo, clase_vuelo) VALUES ('T010', 'V002', 'Primera Clase');

-- Turista T011
INSERT INTO Vuelo_x_Turista (id_turista, numero_vuelo, clase_vuelo) VALUES ('T011', 'V001', 'Clase Económica');

-- Turista T012
INSERT INTO Vuelo_x_Turista (id_turista, numero_vuelo, clase_vuelo) VALUES ('T012', 'V002', 'Primera Clase');

-- Turista T013
INSERT INTO Vuelo_x_Turista (id_turista, numero_vuelo, clase_vuelo) VALUES ('T013', 'V001', 'Clase Económica');

-- Turista T014
INSERT INTO Vuelo_x_Turista (id_turista, numero_vuelo, clase_vuelo) VALUES ('T014', 'V002', 'Primera Clase');

-- Turista T015
INSERT INTO Vuelo_x_Turista (id_turista, numero_vuelo, clase_vuelo) VALUES ('T015', 'V001', 'Clase Económica');

-- Turista T016
INSERT INTO Vuelo_x_Turista (id_turista, numero_vuelo, clase_vuelo) VALUES ('T016', 'V002', 'Primera Clase');

-- Turista T017
INSERT INTO Vuelo_x_Turista (id_turista, numero_vuelo, clase_vuelo) VALUES ('T017', 'V001', 'Clase Económica');

-- Turista T018
INSERT INTO Vuelo_x_Turista (id_turista, numero_vuelo, clase_vuelo) VALUES ('T018', 'V002', 'Primera Clase');

-- Turista T019
INSERT INTO Vuelo_x_Turista (id_turista, numero_vuelo, clase_vuelo) VALUES ('T019', 'V001', 'Clase Económica');

-- Turista T020
INSERT INTO Vuelo_x_Turista (id_turista, numero_vuelo, clase_vuelo) VALUES ('T020', 'V002', 'Primera Clase');

INSERT INTO Hotel_x_Turista (id_hotel, id_turista, regimen_hospedaje, fecha_llegada, fecha_partida) VALUES
('H001', 'T001', 'Todo Incluido', '2022-05-20', '2022-05-25'),
('H002', 'T002', 'Media Pensión', '2022-06-10', '2022-06-15'),
('H001', 'T008', 'Todo Incluido', '2022-03-20', '2022-03-25'),
('H002', 'T009', 'Media Pensión', '2022-04-05', '2022-04-10'),
('H003', 'T010', 'Alojamiento y Desayuno', '2022-05-10', '2022-05-15'),
('H004', 'T011', 'Todo Incluido', '2022-06-15', '2022-06-20'),
('H005', 'T012', 'Media Pensión', '2022-07-20', '2022-07-25'),
('H001', 'T013', 'Todo Incluido', '2022-08-10', '2022-08-15'),
('H002', 'T014', 'Media Pensión', '2022-09-05', '2022-09-10'),
('H003', 'T015', 'Alojamiento y Desayuno', '2022-10-10', '2022-10-15'),
('H004', 'T016', 'Todo Incluido', '2022-11-15', '2022-11-20'),
('H005', 'T017', 'Media Pensión', '2022-12-20', '2022-12-25'),
('H001', 'T018', 'Todo Incluido', '2023-01-20', '2023-01-25'),
('H002', 'T019', 'Media Pensión', '2023-02-05', '2023-02-10'),
('H003', 'T020', 'Alojamiento y Desayuno', '2023-03-10', '2023-03-15');









