DROP DATABASE IF EXISTS Cellworld;
CREATE DATABASE Cellworld;
USE Cellworld;

CREATE TABLE Fabricante(
    idFabricante TINYINT NOT NULL,
    fabricante VARCHAR(45) NOT NULL,
    PRIMARY KEY (idFabricante),
    CONSTRAINT UQ_Fabricante_fabricante UNIQUE (fabricante)
);

CREATE TABLE Camara(
    idCamara SMALLINT NOT NULL,
    idFabricante TINYINT NOT NULL,
    megapixeles TINYINT NOT NULL,
    apertura FLOAT NOT NULL,
    PRIMARY KEY (idCamara),
    CONSTRAINT FK_Camara_idFabricante FOREIGN KEY (idFabricante)
		REFERENCES Fabricante(idFabricante)
);
 
CREATE TABLE Microprocesador(
    idMicroprocesador TINYINT NOT NULL,
    idFabricante TINYINT NOT NULL,
    lanzamiento DATE NOT NULL,
    nucleos TINYINT UNSIGNED NOT NULL,
    velocidad FLOAT NOT NULL,
    PRIMARY KEY (idMicroprocesador),
    CONSTRAINT FK_Microprocesador_idFabricante FOREIGN KEY (idFabricante)
		REFERENCES Fabricante(idFabricante)
);

CREATE TABLE SistemaOperativo(
    idSO TINYINT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    version FLOAT NOT NULL,
    lanzamiento DATE NOT NULL,
    PRIMARY KEY (idSO),
    CONSTRAINT UQ_SistemaOperativo_nombre UNIQUE (nombre)
);
 
 CREATE TABLE Modelo(
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
    CONSTRAINT UQ_Modelo_modelo UNIQUE (modelo),
    CONSTRAINT FK_Modelo_idFabricante FOREIGN KEY (idFabricante)
		REFERENCES Fabricante(idFabricante),
    CONSTRAINT FK_Modelo_idMicroprocesador FOREIGN KEY (idMicroprocesador)
		REFERENCES Microprocesador(idMicroprocesador),
	CONSTRAINT FK_Modelo_idCamara FOREIGN KEY (idCamara)
		REFERENCES Camara(idCamara),
	CONSTRAINT FK_Modelo_idSO FOREIGN KEY (idSO)
		REFERENCES SistemaOperativo(idSO)
);

CREATE TABLE Celular(
    IMEI INTEGER AUTO_INCREMENT,
    idModelo SMALLINT NOT NULL,
    PRIMARY KEY (IMEI),
    CONSTRAINT FK_Celular_idModelo FOREIGN KEY (idModelo)
		REFERENCES Modelo(idModelo)
);