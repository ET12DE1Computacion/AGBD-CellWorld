DROP DATABASE IF EXISTS Cellworld;
CREATE DATABASE Cellworld;
USE Cellworld;
 
SET FOREIGN_KEY_CHECKS=0;
 
CREATE TABLE Camara
(
    idCamara SMALLINT NOT NULL,
    idFabricante TINYINT NOT NULL,
    megapixeles TINYINT NOT NULL,
    apertura FLOAT(0) NOT NULL,
    PRIMARY KEY (idCamara),
    KEY (idFabricante)
) ;
 
CREATE TABLE Celular
(
    IMEI INTEGER NOT NULL,
    idModelo SMALLINT NOT NULL,
    PRIMARY KEY (IMEI),
    KEY (idModelo)
) ;
 
CREATE TABLE Fabricante
(
    idFabricante TINYINT NOT NULL,
    fabricante VARCHAR(45) NOT NULL,
    PRIMARY KEY (idFabricante)
) ;
 
CREATE TABLE Microprocesador
(
    idMicroprocesador TINYINT NOT NULL,
    idFabricante TINYINT NOT NULL,
    lanzamiento DATE NOT NULL,
    nucleos TINYINT NOT NULL,
    velocidad FLOAT(0) NOT NULL,
    PRIMARY KEY (idMicroprocesador),
    KEY (idFabricante)
) ;
 
 
 
CREATE TABLE Modelo
(
    idModelo SMALLINT NOT NULL,
    idFabricante TINYINT NOT NULL,
    idCamara SMALLINT,
    idMicroprocesador TINYINT NOT NULL,
    idSO TINYINT NOT NULL,
    modelo VARCHAR(45) NOT NULL,
    rom SMALLINT UNSIGNED NOT NULL,
    ram TINYINT UNSIGNED NOT NULL,
    peso TINYINT UNSIGNED NOT NULL,
    altura TINYINT UNSIGNED NOT NULL,
    capacidadSD SMALLINT,
    ancho FLOAT(0) NOT NULL,
    profundidad FLOAT(0) NOT NULL,
    PRIMARY KEY (idModelo),
    KEY (idCamara),
    KEY (idFabricante),
    KEY (idMicroprocesador),
    KEY (idSO)
) ;
 
CREATE TABLE SistemaOperativo
(
    idSO TINYINT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    version FLOAT(0) NOT NULL,
    lanzamiento DATE NOT NULL,
    PRIMARY KEY (idSO)
) ;
 
SET FOREIGN_KEY_CHECKS=1;
ALTER TABLE Camara ADD CONSTRAINT FK_SensorCamara_Fabricante 
    FOREIGN KEY (idFabricante) REFERENCES Fabricante (idFabricante);
 
ALTER TABLE Celular ADD CONSTRAINT FK_Celular_Modelo 
    FOREIGN KEY (idModelo) REFERENCES Modelo (idModelo);
 
ALTER TABLE Microprocesador ADD CONSTRAINT FK_Microprocesador_Fabricante 
    FOREIGN KEY (idFabricante) REFERENCES Fabricante (idFabricante);
 
ALTER TABLE Modelo ADD CONSTRAINT FK_Modelo_Camara 
    FOREIGN KEY (idCamara) REFERENCES Camara (idCamara);
 
ALTER TABLE Modelo ADD CONSTRAINT FK_Modelo_Fabricante 
    FOREIGN KEY (idFabricante) REFERENCES Fabricante (idFabricante);
 
ALTER TABLE Modelo ADD CONSTRAINT FK_Modelo_Microprocesador 
    FOREIGN KEY (idMicroprocesador) REFERENCES Microprocesador (idMicroprocesador);
 
ALTER TABLE Modelo ADD CONSTRAINT FK_Modelo_SistemaOperativo 
    FOREIGN KEY (idSO) REFERENCES SistemaOperativo (idSO);
