
-- -----------------------------------------------------
-- Schema AgenciaDeViajes
-- -----------------------------------------------------

USE AgenciaDeViajes ;

-- -----------------------------------------------------
-- Table AgenciaDeViajes.Sucursal
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS AgenciaDeViajes.Sucursal (
  id_sucursal CHAR(4) NOT NULL,
  direccion VARCHAR(45) NOT NULL,
  telefono CHAR(9) NOT NULL,
  PRIMARY KEY (id_sucursal))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table AgenciaDeViajes.Turista
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS AgenciaDeViajes.Turista (
  id_turista CHAR(4) NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellidos VARCHAR(45) NOT NULL,
  direccion VARCHAR(45) NOT NULL,
  telefono CHAR(9) NOT NULL,
  PRIMARY KEY (id_turista),
  UNIQUE INDEX telefono_UNIQUE (telefono ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table AgenciaDeViajes.Sucursal_x_Turista
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS AgenciaDeViajes.Sucursal_x_Turista (
  d_sucursal CHAR(4) NOT NULL,
  id_turista CHAR(4) NOT NULL,
  fecha_contrato CHAR(10) NOT NULL,
  PRIMARY KEY (d_sucursal, id_turista),
  INDEX fk_Sucursal_has_Turista_Turista1_idx (id_turista ASC) VISIBLE,
  INDEX fk_Sucursal_has_Turista_Sucursal_idx (d_sucursal ASC) VISIBLE,
  CONSTRAINT fk_Sucursal_has_Turista_Sucursal
    FOREIGN KEY (d_sucursal)
    REFERENCES AgenciaDeViajes.Sucursal (id_sucursal)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Sucursal_has_Turista_Turista1
    FOREIGN KEY (id_turista)
    REFERENCES AgenciaDeViajes.Turista (id_turista)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table AgenciaDeViajes.Vuelo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS AgenciaDeViajes.Vuelo (
  numero_vuelo VARCHAR(20) NOT NULL,
  fecha_origen CHAR(10) NOT NULL,
  hora_origen CHAR(8) NOT NULL,
  fecha_destino CHAR(10) NOT NULL,
  hora_destino CHAR(8) NOT NULL,
  plazas_totales INT NOT NULL,
  plazas_turistas INT NULL,
  PRIMARY KEY (numero_vuelo))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table AgenciaDeViajes.Vuelo_x_Turista
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS AgenciaDeViajes.Vuelo_x_Turista (
  id_turista CHAR(4) NOT NULL,
  numero_vuelo VARCHAR(20) NOT NULL,
  clase_vuelo VARCHAR(20) NULL,
  PRIMARY KEY (id_turista, numero_vuelo),
  INDEX fk_Turista_has_Vuelo_Vuelo1_idx (numero_vuelo ASC) VISIBLE,
  INDEX fk_Turista_has_Vuelo_Turista1_idx (id_turista ASC) VISIBLE,
  CONSTRAINT fk_Turista_has_Vuelo_Turista1
    FOREIGN KEY (id_turista)
    REFERENCES AgenciaDeViajes.Turista (id_turista)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Turista_has_Vuelo_Vuelo1
    FOREIGN KEY (numero_vuelo)
    REFERENCES AgenciaDeViajes.Vuelo (numero_vuelo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table AgenciaDeViajes.Hotel
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS AgenciaDeViajes.Hotel (
  id_hotel CHAR(4) NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  direccion VARCHAR(45) NOT NULL,
  ciudad VARCHAR(30) NOT NULL,
  telefono CHAR(9) NULL,
  plazas INT NULL,
  PRIMARY KEY (id_hotel))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table AgenciaDeViajes.Hotel_x_Turista
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS AgenciaDeViajes.Hotel_x_Turista (
  id_hotel CHAR(4) NOT NULL,
  id_turista CHAR(4) NOT NULL,
  regimen_hospedaje VARCHAR(20) NOT NULL,
  fecha_llegada CHAR(10) NOT NULL,
  fecha_partida CHAR(10) NOT NULL,
  PRIMARY KEY (id_hotel, id_turista),
  INDEX fk_Hotel_has_Turista_Turista1_idx (id_turista ASC) VISIBLE,
  INDEX fk_Hotel_has_Turista_Hotel1_idx (id_hotel ASC) VISIBLE,
  CONSTRAINT fk_Hotel_has_Turista_Hotel1
    FOREIGN KEY (id_hotel)
    REFERENCES AgenciaDeViajes.Hotel (id_hotel)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Hotel_has_Turista_Turista1
    FOREIGN KEY (id_turista)
    REFERENCES AgenciaDeViajes.Turista (id_turista)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


